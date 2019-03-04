#tag Module
Protected Module CertTools
	#tag Method, Flags = &h1
		Protected Function DeviceGUID() As String
		  // The Mac's GUID is the MAC address from network interface "en0", see https://developer.apple.com/devcenter/mac/documents/validating.html
		  
		  #if true
		    // This version uses the CoreFoundation and IOKit classes from https://github.com/macoslib/macoslib
		    dim mac as String
		    mac = PrimaryMACAddress
		    dim bytes() as String = mac.Split(":")
		    if bytes.Ubound = 5 then
		      return HexBytesToData (bytes)
		    end if
		  #elseif true
		    // Use this code if you do use the MBS plugins
		    dim mac as String = SystemInformationMBS.MACAddressString
		    dim bytes() as String = mac.Split(":")
		    if bytes.Ubound = 5 then
		      return HexBytesToData (bytes)
		    end if
		  #elseif TargetMacOS
		    // Use this code if you do NOT use the MBS plugins nor the CoreFoundation and IOKit classes
		    dim sh as new Shell
		    sh.Execute "/sbin/ifconfig en0"
		    dim s as String
		    s = sh.Result
		    dim lines() as String
		    lines = ReplaceLineEndings(s,chr(13)).Split(chr(13))
		    for each line as String in lines
		      dim p as Integer
		      line = line.Trim
		      p = line.InStr("ether ")
		      if p = 1 then
		        dim mac as String = line.NthField(" ",2)
		        dim bytes() as String = mac.Split(":")
		        if bytes.Ubound = 5 then
		          return HexBytesToData (bytes)
		        end if
		      end if
		    next
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HexBytesToData(bytes() as String) As MemoryBlock
		  dim mb as new MemoryBlock(6)
		  for i as Integer = 0 to 5
		    mb.Byte(i) = Val("&h"+bytes(i))
		  next
		  return mb
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsValid(guid as String, receipt as Dictionary, bundleID as String) As Boolean
		  // Returns true if the given receipt (which comes from 'ReadReceipt') is valid
		  // for the given GUID (which is a unique code for a particular machine)
		  
		  #if TargetMacOS
		    declare sub SHA1 lib "/usr/lib/libcrypto.dylib" (d as Ptr, n as Int32, md as Ptr)
		    
		    if receipt <> nil then
		      dim input as MemoryBlock
		      input = guid + receipt.Value(Keys.kReceiptOpaqueValue) + receipt.Value(Keys.kReceiptBundleIdentiferData)
		      dim hash as new MemoryBlock(20) ' SHA_DIGEST_LENGTH
		      SHA1 (input, input.Size, hash)
		      dim hashFromReceipt as String = receipt.Value(Keys.kReceiptHash)
		      if StrComp (hash, hashFromReceipt, 0) = 0 then
		        return receipt.Value(Keys.kReceiptBundleIdentifer) = bundleID
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ReadReceipt(certFile as FolderItem) As Dictionary
		  // This function reads certain entries from the App's certification receipt file
		  
		  #if TargetMacOS
		    declare function d2i_PKCS7_fp lib "/usr/lib/libcrypto.dylib" (fp as integer, p7 as Ptr) as Ptr
		    declare sub PKCS7_free lib "/usr/lib/libcrypto.dylib" (p7 as Ptr)
		    declare function OBJ_obj2nid lib "/usr/lib/libcrypto.dylib" (ASN1_OBJECT as Ptr) as Int32
		    declare function ASN1_get_object lib "/usr/lib/libcrypto.dylib" (ByRef pp as Ptr, ByRef plength as Integer, ByRef ptag as Int32, ByRef pclass as Int32, omax as Integer) as Int32
		    
		    dim result as Dictionary
		    
		    if certFile = nil then return nil
		    dim bs as BinaryStream
		    try
		      bs = BinaryStream.Open(certFile)
		    catch exc as RuntimeException
		      return nil
		    end
		    dim fp as Integer = bs.Handle(BinaryStream.HandleTypeFilePointer)
		    if fp = 0 then return nil
		    dim p7 as Ptr = d2i_PKCS7_fp (fp, nil)
		    bs.Close
		    bs = nil
		    if p7 = nil then return nil
		    
		    // is it signed?
		    dim nid as Int32 = OBJ_obj2nid (p7.PKCS7.type)
		    if nid <> 22 then goto bail1
		    
		    // is data?
		    nid = OBJ_obj2nid (p7.PKCS7.d.PKCS7_SIGNED.contents.PKCS7.type)
		    if nid <> 21 then goto bail1
		    
		    dim octets as Ptr = p7.PKCS7.d.PKCS7_SIGNED.contents.PKCS7.d
		    dim p, e as Ptr
		    p = octets.ASN1_STRING.data
		    dim l as Integer = octets.ASN1_STRING.length
		    e = p + Ptr(l)
		    
		    dim res, type, xclass as Int32
		    dim length as Integer
		    
		    res = ASN1_get_object(p, length, type, xclass, integer(e) - integer(p))
		    if type <> 17 then goto bail1 ' V_ASN1_SET
		    
		    result = new Dictionary
		    while p < e
		      call ASN1_get_object (p, length, type, xclass, integer(e) - integer(p))
		      if type <> 16 then
		        exit ' V_ASN1_SEQUENCE
		      end
		      
		      dim seq_end as Ptr = p + Ptr(length)
		      
		      dim attr_type, attr_version as Integer
		      
		      // Attribute type
		      call ASN1_get_object (p, length, type, xclass, integer(seq_end) - integer(p))
		      if type = 2 and length = 1 then ' V_ASN1_INTEGER
		        attr_type = p.Byte(0)
		      end
		      p = p + Ptr(length)
		      
		      // Attribute version
		      call ASN1_get_object (p, length, type, xclass, integer(seq_end) - integer(p))
		      if type = 2 and length = 1 then ' V_ASN1_INTEGER
		        attr_version = p.Byte(0)
		      end
		      p = p + Ptr(length)
		      
		      // Only parse attributes we're interested in
		      if ATTRS(attr_type) > ATTRS.ATTR_START and ATTRS(attr_type) < ATTRS.ATTR_END then
		        dim key as Keys
		        
		        call ASN1_get_object (p, length, type, xclass, integer(seq_end) - integer(p))
		        if type = 4 then ' V_ASN1_OCTET_STRING
		          // Bytes
		          if ATTRS(attr_type) = ATTRS.BUNDLE_ID or ATTRS(attr_type) = ATTRS.OPAQUE_VALUE or ATTRS(attr_type) = ATTRS.HASH then
		            select case ATTRS(attr_type)
		            case ATTRS.BUNDLE_ID
		              // This is included for hash generation
		              key = Keys.kReceiptBundleIdentiferData
		            case ATTRS.OPAQUE_VALUE
		              key = Keys.kReceiptOpaqueValue
		            case ATTRS.HASH
		              key = Keys.kReceiptHash
		            end select
		            dim mb as MemoryBlock = p
		            result.Value(key) = mb.StringValue(0, length)
		          end
		          
		          // Strings
		          if ATTRS(attr_type) = ATTRS.BUNDLE_ID or ATTRS(attr_type) = ATTRS.VERSION then
		            dim str_type as Int32
		            dim str_length as Integer
		            dim str_p as Ptr = p
		            call ASN1_get_object (str_p, str_length, str_type, xclass, integer(seq_end) - integer(str_p))
		            if str_type = 12 then ' V_ASN1_UTF8STRING
		              dim mb as MemoryBlock = str_p
		              dim s as String = mb.StringValue(0,str_length).DefineEncoding(Encodings.UTF8)
		              select case ATTRS(attr_type)
		              case ATTRS.BUNDLE_ID
		                key = Keys.kReceiptBundleIdentifer
		              case ATTRS.VERSION
		                key = Keys.kReceiptVersion
		              end select
		              result.Value(key) = s
		            end
		          end
		        end
		        p = p + Ptr(length)
		        
		      end if
		      
		      // Skip any remaining fields in this SEQUENCE
		      while p < seq_end
		        call ASN1_get_object (p, length, type, xclass, integer(seq_end) - integer(p))
		        p = p + Ptr(length)
		      wend
		      
		    wend
		    
		    bail1:
		    PKCS7_free (p7)
		    
		    return result
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This module contains methods that help checking a receipt file
		as it's used with applications delivered by Apple's App Store.
		
		Original (i.e. up-to-date) sources are located here:
		  https://github.com/macoslib/macoslib
		
		Written by Thomas Tempelmann, 31 Oct 2010
		Last update: 25 Nov 2012 (Usage note updated to use AppStoreReceiptDirectory function on 10.7 and later)
	#tag EndNote

	#tag Note, Name = Usage
		IsValid:
		
		  Call CertTools.IsValid, passing the results from CertTools.DeviceGUID
		  and CertTools.ReadReceipt to it. If it returns false, this means that the
		  app was not certified to run on this particular computer (App Store apps
		  are certified per machine). In order to tell Mac OS X about this fact,
		  exit the app with the exit code 173, which should then lead to the user
		  being asked to re-certify this app for this computer (which will probably
		  ask the user for his iTunes login, then checking if he has purchased the
		  app from the store and thus is a valid user)
		
		ReadReceipt:
		
		  Pass the location of the receipt file, which gets stored (by the App Store
		  delivery code) inside your app in "Contents/_MASReceipt/".
		
		Example:
		
		  dim f as FolderItem
		  if IsLion then
		    f = NSBundle.MainBundle.AppStoreReceiptDirectory()
		  else
		    f = App.ExecutableFile.Parent.Parent // "Contents" folder
		    f = f.Child("_MASReceipt").Child("receipt") // this is where the App Store puts the receipt when "buying" an app
		  end
		  if not CertTools.IsValid (CertTools.DeviceGUID, CertTools.ReadReceipt(f), "put the App's Application Identifier here") then
		    declare sub exit_ lib "System" alias "exit" (code as Integer)
		    exit_ (173)
		  end
		
		Tips:
		
		  Be aware that a cracker might attempt to disable your checking code so that
		  he can make your app run on any computer, then distribute either the cracking
		  code or your app thru other channels.
		
		  In general, a good cracker will find ways to accomplish this, and you can't do
		  anything about it. So better accept this possibility right now.
		
		  However, here are some hints as to how to make it not too easy for a casual or
		  lazy cracker:
		
		  • Rename the module and its functions, possibly to names that do not hint at
		  their purpose. That makes it harder for a cracker to even find the functions
		  he needs to patch. (Note: the method and module names may appear in the
		  generated code, while local variables don't, so do not bother renaming the
		  variables - but to be sure better look at the generated code, e.g. with the "nm"
		  command line too.)
		
		  • In a similar way, avoid having the code that decides to exit the app be very close
		  to the call that calls IsValid. Instead, call the various functions in different places
		  so that a cracker has a hard time to find the place where the actual test of the receipt
		  takes place. For instance, he might start looking at the code that calls the exit
		  function, so make sure that's not the only place where an invalid receipt is acted
		  upon. Better to modify some other globals in your app after calling IsValid, and
		  use some effect of these globals later to decide whether to exit the app. That way,
		  the cracker can find the exit call, but that's long after your app has already gotten
		  into a state where it won't function any more. So the cracker would have to do a lot
		  of backtracing to find the code that actually makes the receipt check and decision
		  thereupon.
	#tag EndNote


	#tag Structure, Name = ASN1_STRING, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		length as Int32
		  type as Int32
		  data as Ptr
		flags as Integer
	#tag EndStructure

	#tag Structure, Name = PKCS7, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		asn1 as CString
		  length as Integer
		  state as Int32
		  detached as Int32
		  type as Ptr
		d as Ptr
	#tag EndStructure

	#tag Structure, Name = PKCS7_SIGNED, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		version as Ptr
		  md_algs as Ptr
		  cert as Ptr
		  crl as Ptr
		  signer_info as Ptr
		contents as Ptr
	#tag EndStructure


	#tag Enum, Name = ATTRS, Type = Integer, Flags = &h21
		zero
		  ATTR_START
		  BUNDLE_ID
		  VERSION
		  OPAQUE_VALUE
		  HASH
		ATTR_END
	#tag EndEnum

	#tag Enum, Name = Keys, Type = Integer, Flags = &h1
		kReceiptBundleIdentifer
		  kReceiptBundleIdentiferData
		  kReceiptVersion
		  kReceiptOpaqueValue
		kReceiptHash
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule

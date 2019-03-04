#tag Class
Protected Class UTI
	#tag Method, Flags = &h0
		Function ConformsTo(type as UTI) As Boolean
		  #if targetMacOS
		    declare function UTTypeConformsTo lib CarbonLib (inUTI as CFStringRef, inConformsToUTI as CFStringRef) as Boolean
		    
		    return (type <> nil) and UTTypeConformsTo(self, type)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromExtension(tag as String, conformsTo as String = "") As String
		  #if targetMacOS
		    return CreateUTI(tag, UTTagClassFilenameExtension, conformsTo)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromFile(f as FolderItem) As String
		  
		  #if TargetMacOS
		    soft declare function LSCopyItemAttribute lib "Carbon.framework" ( inItem as ptr, inRoles as UInt32, inAttributeName as CFStringRef, byref outValue as integer) as integer
		    soft declare function CFStringGetCString lib CarbonLib (ref as integer, char as ptr, size as integer, encoding as UInt32) as boolean
		    soft declare sub CFRelease lib CarbonLib (obj as integer)
		    
		    const kLSItemContentType = "LSItemContentType"
		    const kLSRoleAll = &hFFFFFFFF
		    const kCFStringEncodingUTF8 = &h08000100
		    
		    assertOSVersion   100400 //Tiger+
		    
		    dim outRef as integer
		    dim s as string
		    dim mb as MemoryBlock
		    dim err as integer = LSCopyItemAttribute( f.FSRef, kLSRoleAll, kLSItemContentType, outRef )
		    
		    if err=0 then
		      mb = New MemoryBlock( 512 )
		      if CFStringGetCString( outRef, mb, mb.size, kCFStringEncodingUTF8 ) then
		        s = mb.CString( 0 )
		      end if
		      
		      CFRelease   outRef
		      
		    end if
		    
		    return  s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromMIMEType(tag as String, conformsTo as String = "") As String
		  #if targetMacOS
		    return CreateUTI(tag, UTTagClassMIMEType, conformsTo)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromOSType(tag as OSType, conformsTo as String = "") As String
		  #if targetMacOS
		    declare function UTCreateStringForOSType lib CarbonLib (inOSType as OSType) as CFStringRef
		    
		    return CreateUTI(UTCreateStringForOSType(tag), UTTagClassOSType, conformsTo)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPasteboardType(tag as String, conformsTo as String = "") As String
		  #if targetMacOS
		    static tagClass as Ptr = Resolve("kUTTagClassNSPboardType")
		    
		    return CreateUTI(tag, tagClass, conformsTo)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CreateUTI(tag as CFStringRef, tagClass as Ptr, conformsTo as String = "") As String
		  #if targetMacOS
		    soft declare function UTTypeCreatePreferredIdentifierForTag lib CarbonLib (inTagClass as Ptr, inTag as CFStringRef, inConformingToUTI as CFStringRef) as Ptr
		    // Caution: If this would return a CFStringRef, we'd have to Retain its value!
		    // Instead, using "CFString" takes care of that automagically
		    
		    dim p as Ptr
		    if conformsTo = "" then
		      p = UTTypeCreatePreferredIdentifierForTag(tagClass, tag, nil)
		    else
		      p = UTTypeCreatePreferredIdentifierForTag(tagClass, tag, conformsTo)
		    end if
		    return new CFString(p, true)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeclaringBundleURL() As CFURL
		  #if targetMacOS
		    soft declare function UTTypeCopyDeclaringBundleURL lib CarbonLib (uti as CFStringRef) as Ptr
		    
		    dim theURL as new CFURL(UTTypeCopyDeclaringBundleURL(self.Value), CFType.hasOwnership)
		    if theURL <> nil then
		      return theURL
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extensions() As String()
		  return self.Tags(UTTagClassFilenameExtension)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MacTypes() As String()
		  return self.Tags(UTTagClassOSType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MIMETypes() As String()
		  return self.Tags(UTTagClassMIMEType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(operand as UTI) As Integer
		  #if targetMacOS
		    soft declare function UTTypeEqual lib CarbonLib (uti1 as CFStringRef, uti2 as CFStringRef) as Boolean
		    
		    if UTTypeEqual(self.Value, operand.Value) then
		      return 0
		    else
		      return 1
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Operator_Convert() As String
		  return self.Value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(s as String)
		  self.Value = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PasteboardTypes() As String()
		  return self.Tags(UTTagClassNSPboardType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Resolve(symbol as String) As Ptr
		  #if targetMacOS
		    dim p as Ptr = Carbon.Bundle.DataPointerNotRetained(symbol)
		    if p <>nil then
		      return p.Ptr(0)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Tags(tagType as Ptr) As String()
		  #if targetMacOS
		    declare function UTTypeCopyDeclaration lib CarbonLib (uti as CFStringRef) as Ptr
		    declare function CFDictionaryGetValueIfPresent lib CarbonLib (theDict as Ptr, key as Ptr, ByRef value as Ptr) as Boolean
		    
		    dim declaration as Ptr = UTTypeCopyDeclaration(self.Value)
		    if declaration = nil then
		      dim s(-1) as String
		      return s
		    end if
		    
		    dim specification as Ptr
		    if not CFDictionaryGetValueIfPresent(declaration, UTTypeTagSpecificationKey, specification) then
		      dim s(-1) as String
		      return s
		    end if
		    
		    
		    dim tags() as String
		    dim value as Ptr
		    
		    if CFDictionaryGetValueIfPresent(specification, tagType, value) then
		      dim foo as CFType = CFType.NewObject(value, not CFType.hasOwnership)
		      if foo isA CFString then
		        tags = Array(CFString(foo).StringValue)
		      elseIf foo isA CFArray then
		        tags = CFArray(foo).StringValues
		      else
		        //
		      end if
		    end if
		    
		    return tags
		  #endif
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function UTTagClassFilenameExtension() As Ptr
		  static tagClass as Ptr = Resolve("kUTTagClassFilenameExtension")
		  return tagClass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function UTTagClassMIMEType() As Ptr
		  static tagClass as Ptr = Resolve("kUTTagClassMIMEType")
		  return tagClass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function UTTagClassNSPboardType() As Ptr
		  static tagClass as Ptr = Resolve("kUTTagClassNSPboardType")
		  return tagClass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function UTTagClassOSType() As Ptr
		  static tagClass as Ptr = Resolve("kUTTagClassOSType")
		  return tagClass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function UTTypeTagSpecificationKey() As Ptr
		  static p as Ptr = Resolve("kUTTypeTagSpecificationKey")
		  return p
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
		
		
		UTI is a class representing a uniform type identifier. It wraps a UTI string; conversion to and from String is 
		implemented.
		
		dim item as UTI = "public.data"
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function UTTypeCopyDescription lib CarbonLib (uti as CFStringRef) as CFStringRef
			    
			    return UTTypeCopyDescription(self.Value)
			  #endif
			  
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Value As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
End Class
#tag EndClass

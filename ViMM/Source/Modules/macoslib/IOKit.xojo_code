#tag Module
Protected Module IOKit
	#tag Method, Flags = &h21
		Private Function FindInternetInterfaces() As UInt32
		  #if targetMacOS
		    soft declare function IOServiceMatching lib IOKit (name as CString) as Ptr
		    soft declare function IOServiceGetMatchingServices lib IOKit (masterPort as UInt32, matching as Ptr, ByRef existing as UInt32) as Integer
		    
		    dim matchingServices as UInt32
		    const hasOwnership = true
		    dim matchDict as new CFMutableDictionary(IOServiceMatching(kIOEthernetInterfaceClass), not hasOwnership)
		    if matchDict = nil then
		      return 0
		    end if
		    
		    dim propertyMatchDict as new CFMutableDictionary
		    propertyMatchDict.Value(new CFString(kIOPrimaryInterface))  = CFBoolean.GetTrue
		    matchDict.Value(new CFString(kIOPropertyMatchKey)) = propertyMatchDict
		    
		    dim kernResult as Integer = IOServiceGetMatchingServices(kIOMasterPortDefault, matchDict, matchingServices)
		    
		    return matchingServices
		    
		    // Keep the compiler from complaining
		    #pragma unused kernResult
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatMACAddress(data as String) As String
		  dim d as MemoryBlock = data // Due to bug <feedback://showreport?report_id=16190> we must not use SplitB
		  dim s() as String
		  redim s(d.Size-1)
		  for i as Integer = 0 to s.Ubound
		    s(i) = Hex(d.UInt8Value(i))
		    if LenB(s(i)) = 1 then
		      s(i) = "0" + s(i)
		    end if
		  next
		  return Join(s, ":")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMACAddress(matchingservices as UInt32) As String
		  #if targetMacOS
		    soft declare function IOIteratorNext lib IOKit (iterator as UInt32) as UInt32
		    soft declare function IORegistryEntryGetParentEntry lib IOKit (entry as UInt32, plane as CString, ByRef parent as UInt32) as Integer
		    soft declare function IORegistryEntryCreateCFProperty lib IOKit (entry as UInt32, key as CFStringRef, allocator as Ptr, options as Uint32) as Ptr
		    soft declare function IOObjectRelease lib IOKit (obj as UInt32) as Integer
		    
		    dim intfService as UInt32
		    dim addressData as String
		    
		    do
		      intfService = IOIteratorNext(matchingservices)
		      if intfService = 0 then
		        exit
		      end if
		      
		      dim controllerService as UInt32
		      dim kernResult as Integer = IORegistryEntryGetParentEntry(intfService, kIOServicePlane, controllerService)
		      
		      dim p as Ptr = IORegistryEntryCreateCFProperty(controllerService, new CFString(kIOMACAddress), nil, 0)
		      if p <> nil then
		        dim MACAddressAsCFData as new CFData(p, true)
		        addressData = MACAddressAsCFData.Data
		      end if
		      kernresult = IOObjectRelease(controllerService)
		      kernresult = IOObjectRelease(intfService)
		    loop
		    
		    return FormatMACAddress(addressData)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IdleTime() As Int64
		  //
		  // Get the number of nano seconds the user has been idle
		  //
		  // Hint: To convert to seconds, divide by 1000000000
		  //
		  
		  const errorReturnValue = -1
		  
		  #if TargetMacOS
		    declare function IOServiceMatching lib IOKit (name as CString) as Ptr
		    declare function IOServiceGetMatchingServices lib IOKit (masterPort as UInt32, matching as Ptr, ByRef existing as UInt32) as Integer
		    declare function IOIteratorNext lib IOKit (iterator as UInt32) as UInt32
		    declare function IORegistryEntryCreateCFProperties lib IOKit (entry as UInt32, ByRef properties as Ptr, allocator as Ptr, options as UInt32) as Integer
		    
		    const kHIDIdleTime = "HIDIdleTime"
		    const kKernSuccess = 0
		    
		    dim iter as UInt32
		    
		    if IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching(kIOHIDSystem), iter) <> kKernSuccess then
		      //
		      // Could not locate the HID System Service
		      //
		      
		      return errorReturnValue
		    end if
		    
		    dim entry as UInt32 = IOIteratorNext(iter)
		    if entry = 0 then
		      //
		      // All we cared about was the first instance, but no instances of the HID System Service existed
		      //
		      
		      return errorReturnValue
		    end if
		    
		    dim dictPtr as Ptr
		    
		    if IORegistryEntryCreateCFProperties(entry, dictPtr, nil, 0) <> kKernSuccess then
		      //
		      // Something failed (probably memory) creating a dictionary representation
		      // of the properties on the HID System Service
		      //
		      
		      return errorReturnValue
		    end if
		    
		    //
		    // Create our dictionary representing the properties in the HID System Service
		    //
		    
		    dim dictRef as CFTypeRef
		    dictRef.value = dictPtr
		    
		    dim dict as new CFDictionary(dictRef, True)
		    
		    //
		    // Get the idle time entry
		    //
		    
		    dim obj as CFType = dict.Lookup(new CFString(kHIDIdleTime), new CFNumber(errorReturnValue))
		    return CFNumber(obj).Int64Value
		    
		  #else
		    return errorReturnValue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrimaryMACAddress() As String
		  //The code is ported from the Apple example code at http://developer.apple.com/library/mac/#samplecode/GetPrimaryMACAddress/Listings/GetPrimaryMACAddress_c.html%23//apple_ref/doc/uid/DTS10000698-GetPrimaryMACAddress_c-DontLinkElementID_3
		  
		  #if targetMacOS
		    
		    dim matchingservices as UInt32 = FindInternetInterfaces
		    dim MACAddress as String = GetMACAddress(matchingservices)
		    
		    finally
		      dim err as Integer
		      if matchingservices <> 0 then
		        soft declare function IOObjectRelease lib IOKit (obj as UInt32) as Integer
		        
		        err = IOObjectRelease(matchingservices)
		      end if
		      return MACAddress
		      
		      // Keep the compiler from complaining
		      #pragma unused err
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = IOKit, Type = String, Dynamic = False, Default = \"IOKit.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kIOEthernetInterfaceClass, Type = String, Dynamic = False, Default = \"IOEthernetInterface", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIOHIDSystem, Type = String, Dynamic = False, Default = \"IOHIDSystem", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIOMACAddress, Type = String, Dynamic = False, Default = \"IOMACAddress", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIOMasterPortDefault, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIOPrimaryInterface, Type = String, Dynamic = False, Default = \"IOPrimaryInterface", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIOPropertyMatchKey, Type = String, Dynamic = False, Default = \"IOPropertyMatch", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIOServicePlane, Type = String, Dynamic = False, Default = \"IOService", Scope = Protected
	#tag EndConstant


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

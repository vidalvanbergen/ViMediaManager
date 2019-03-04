#tag Class
Class CFBundle
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return self.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function Application() As CFBundle
		  // returns this app's main bundle
		  
		  static app as new CFBundle
		  return app
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CoreFoundation.framework alias "CFBundleGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // This default constructor creates the application's CFBundle
		  
		  #if TargetMacOS
		    declare function CFBundleGetMainBundle lib CoreFoundation.framework () as CFTypeRef
		    
		    self.Constructor(CFBundleGetMainBundle(), not hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataPointerNotRetained(symbolName as String) As Ptr
		  #if TargetMacOS
		    declare function CFBundleGetDataPointerForName lib CoreFoundation.framework (bundle as Ptr, symbolName as CFStringRef) as Ptr
		    
		    if self <> nil then
		      return CFBundleGetDataPointerForName(self, symbolName)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused symbolName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExecutableFile() As CFURL
		  #if TargetMacOS
		    declare function CFBundleCopyExecutableURL lib CoreFoundation.framework (theBundle as CFTypeRef) as CFTypeRef
		    
		    return MakeCFURL(CFBundleCopyExecutableURL(self))
		  #endif
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameworksDirectory() As CFURL
		  #if TargetMacOS
		    declare function CFBundleCopyPrivateFrameworksURL lib CoreFoundation.framework (theBundle as CFTypeRef) as CFTypeRef
		    
		    return MakeCFURL(CFBundleCopyPrivateFrameworksURL(self))
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionPointerForName(symbolName as String) As Ptr
		  #if TargetMacOS
		    declare function CFBundleGetFunctionPointerForName lib CoreFoundation.framework (bundle as CFTypeRef, functionName as CFStringRef) as Ptr
		    
		    if self <> nil then
		      return CFBundleGetFunctionPointerForName(self, symbolName)
		    else
		      return nil
		    end if
		    
		    #pragma unused symbolName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InfoDictionary() As CFDictionary
		  #if targetMacOS
		    declare function CFBundleGetInfoDictionary lib CoreFoundation.framework (bundle as CFTypeRef) as CFTypeRef
		    
		    if self <> nil then
		      return new CFDictionary(CFBundleGetInfoDictionary(self), not CFType.hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InfoDictionaryValue(key as String) As CFType
		  #if targetMacOS
		    declare function CFBundleGetValueForInfoDictionaryKey lib CoreFoundation.framework (bundle as CFTypeRef, key as CFStringRef) as Ptr
		    
		    if self <> nil then
		      dim valueRef as Ptr = CFBundleGetValueForInfoDictionaryKey(self, key)
		      if valueRef <> nil then
		        return CFType.NewObject(valueRef, not CFType.hasOwnership, kCFPropertyListImmutable)
		      else
		        return nil
		      end if
		      
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused key
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load() As Boolean
		  // MacOSLib min version is now 10.5 so calling the older method is no longer necessary.
		  // Will now raise an error to keep consistent with other function calls that return a CFError.
		  
		  #if TargetMacOS
		    if self <> nil then
		      // only available in Mac OS X 10.5 and later:
		      declare function CFBundleLoadExecutableAndReturnError lib CoreFoundation.framework (theBundle as CFTypeRef, ByRef errorOut as CFTypeRef) as Boolean
		      
		      dim errorRef as CFTypeRef
		      dim ok as Boolean = CFBundleLoadExecutableAndReturnError (self, errorRef)
		      if errorRef.value <> nil then
		        raise new CFError( errorRef, CFType.HasOwnership )
		      end if
		      return ok
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeCFURL(urlRef as CFTypeRef, hasOwnership as Boolean = true) As CFURL
		  #if TargetMacOS
		    if urlRef.value <> nil then
		      return new CFURL(urlRef, hasOwnership)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused urlRef
		    #pragma unused hasOwnership
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewCFBundle(ref as CFTypeRef, hasOwnership as Boolean = true) As CFBundle
		  #if targetMacOS
		    if ref.value <> nil then
		      return new CFBundle(ref, hasOwnership)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused ref
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewCFBundleFromID(bundleIdentifier as String) As CFBundle
		  #if targetMacOS
		    declare function CFBundleGetBundleWithIdentifier lib CoreFoundation.framework (bundleID as CFStringRef) as CFTypeRef
		    
		    return NewCFBundle(CFBundleGetBundleWithIdentifier(bundleIdentifier), not hasOwnership)
		    
		  #else
		    #pragma unused bundleIdentifier
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewCFBundleFromURL(theURL as CFURL) As CFBundle
		  #if targetMacOS
		    soft declare function CFBundleCreate lib CoreFoundation.framework (allocator as Ptr, bundleURL as CFTypeRef) as CFTypeRef
		    
		    if theURL <> nil then
		      return NewCFBundle(CFBundleCreate(nil, theURL), not hasOwnership)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused theURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewCFBundlesFromFolder(folderURL as CFURL) As CFArray
		  #if targetMacOS
		    if folderURL <> nil then
		      soft declare function CFBundleCreateBundlesFromDirectory lib CoreFoundation.framework (allocator as Ptr, folderURL as CFTypeRef, bundleType as Ptr) as CFTypeRef
		      
		      return new CFArray(CFBundleCreateBundlesFromDirectory(nil, folderURL, nil), hasOwnership)
		    else
		      return new CFArray(nil, hasOwnership)
		    end if
		    
		  #else
		    #pragma unused folderURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resource(name as String, type as String, subDirectoryName as String) As CFURL
		  raise new RuntimeException // not available
		  'if not ( self = nil ) then
		  '#if targetMacOS
		  'soft declare function CFBundleCopyResourceURL lib CoreFoundation.framework (bundle as Integer, resourceName as Integer, resourceType as Integer, subDirName as Integer) as Integer
		  'soft declare function CFBundleCopyResourceURLInDirectory lib CoreFoundation.framework (bundleURL as Integer, resourceName as Integer, resourceType as Integer, subDirName as Integer) as Integer
		  'soft declare function CFBundleCopyBundleURL lib CoreFoundation.framework (bundle as Integer) as Integer
		  '
		  'dim theRef as Integer
		  'dim theURL as CFURL
		  'dim typeRef as Integer
		  'dim subDirRef as Integer
		  'dim urlRef as Integer
		  '
		  'If name Is Nil then
		  'Return Nil
		  'End if
		  'If type Is Nil then
		  'typeRef = 0
		  'Else
		  'typeRef = type
		  'End if
		  'If subDirectoryName Is Nil then
		  'subDirRef = 0
		  'Else
		  'subDirRef = subDirectoryName
		  'End if
		  '
		  'theRef = CFBundleCopyResourceURL(me, name, typeRef, subDirRef)
		  'CoreFoundation.CheckCFTypeRef theRef, "CFBundle", "Resource", "CFBundleCopyResourceURL"
		  'theURL = new CFURL(theRef)
		  '#endif
		  '
		  'Exception oops as CFTypeRefException
		  'theURL = Nil
		  '
		  'Finally
		  'CoreFoundation.Release theRef
		  'Return theURL
		  'End
		  
		  #pragma unused name
		  #pragma unused type
		  #pragma unused subDirectoryName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourcesDirectory() As CFURL
		  #if TargetMacOS
		    declare function CFBundleCopyResourcesDirectoryURL lib CoreFoundation.framework (theBundle as CFTypeRef) as CFTypeRef
		    
		    return MakeCFURL(CFBundleCopyResourcesDirectoryURL(self))
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringPointerRetained(symbolName as String) As CFStringRef
		  #if TargetMacOS
		    declare function CFBundleGetDataPointerForName lib CoreFoundation.framework (bundle as Ptr, symbolName as CFStringRef) as Ptr
		    declare function CFRetain lib CoreFoundation.framework (cf as Ptr) as CFStringRef
		    
		    if self <> nil then
		      dim p as Ptr = CFBundleGetDataPointerForName(self, symbolName)
		      if p <> nil then
		        return CFRetain(p.Ptr(0))
		      else
		        return ""
		      end if
		    else
		      return ""
		    end if
		    
		  #else
		    #pragma unused symbolName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportFilesDirectory() As CFURL
		  #if targetMacOS
		    declare function CFBundleCopySupportFilesDirectoryURL lib CoreFoundation.framework (bundle as CFTypeRef) as CFTypeRef
		    
		    return MakeCFURL(CFBundleCopySupportFilesDirectoryURL(self))
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    return URL.Item
			  #endif
			End Get
		#tag EndGetter
		FolderItemValue As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the Bundle Identifier.
			  //
			  // If you use CFBundle.Application.Identifier, then you'll get your app's Bundle ID (such as: "com.domain.appname")
			  
			  #if targetMacOS
			    declare function CFBundleGetIdentifier lib CoreFoundation.framework (bundle as Ptr) as CFStringRef
			    
			    if self <> nil then
			      return CFBundleGetIdentifier(self)
			    end if
			  #endif
			End Get
		#tag EndGetter
		Identifier As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function CFBundleCopyBundleURL lib CoreFoundation.framework (bundle as Ptr) as Ptr
			    
			    if self <> nil then
			      dim theURL as new CFURL(CFBundleCopyBundleURL(me.Reference), true)
			      if not theURL.Equals(nil) then
			        return theURL
			      else
			        return nil
			      end if
			    end if
			  #endif
			End Get
		#tag EndGetter
		URL As CFURL
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
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

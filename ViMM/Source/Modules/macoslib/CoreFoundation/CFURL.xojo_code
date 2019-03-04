#tag Class
Class CFURL
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return me.StringValue
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AbsoluteURL() As CFURL
		  #if TargetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFURLCopyAbsoluteURL lib CarbonLib (relativeURL as Ptr) as Ptr
		    
		    if me <> nil then
		      return new CFURL(CFURLCopyAbsoluteURL(me), true)
		    else
		      return new CFURL(nil, not CFType.hasOwnership)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AppendComponent(pathComponent as String, isDirectory as Boolean) As CFURL
		  //creates a new CFURL object with pathComponent appended to the path of this object.
		  //isDirectory tells the function whether to add a trailing slash.
		  #if targetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFURLCreateCopyAppendingPathComponent lib CarbonLib (allocator as Ptr, url as Ptr, pathComponent as CFStringRef, isDirectory as Boolean) as Ptr
		    
		    return new CFURL(CFURLCreateCopyAppendingPathComponent(nil, self, pathComponent, isDirectory), CFType.hasOwnership)
		    
		  #else
		    
		    #pragma unused pathComponent
		    #pragma unused isDirectory
		    
		  #endif
		  
		  return nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFURLGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(baseURL as CFURL, relativeURL as String)
		  #if targetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFURLCreateWithString lib CarbonLib (allocator as Ptr, URLString as CFStringRef, baseURL as Ptr) as Ptr
		    
		    if baseURL is nil then
		      super.Constructor CFURLCreateWithString(nil, relativeURL, nil), true
		    else
		      super.Constructor CFURLCreateWithString(nil, relativeURL, baseURL.Reference), true
		    end if
		    
		  #else
		    
		    #pragma unused baseURL
		    #pragma unused relativeURL
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem, resolveIfAlias as Boolean = CFURL.AliasDoNotResolve)
		  if f is nil then
		    
		    me.Constructor nil, not CFType.hasOwnership
		    
		  else // f is not nil
		    
		    // Modified by Kem Tekinay.
		    // Determines if this object will point to the given FolderItem or its target.
		    
		    if resolveIfAlias then resolveIfAlias = f.Alias // No need to resolve it if it isn't one
		    
		    dim finished as boolean
		    if resolveIfAlias then
		      
		      #if TargetMacOS
		        static functionNeedsCheck as boolean = true
		        static functionIsAvailable as boolean
		        if functionNeedsCheck then
		          functionIsAvailable = System.IsFunctionAvailable( "CFURLCreateBookmarkDataFromFile", CarbonLib ) // This function was introduced in OS X 10.6.
		          functionNeedsCheck = false
		        end if
		        
		        if functionIsAvailable then
		          try
		            dim data as CFData = CFURL.CreateBookmarkDataFromFile( f )
		            dim url as CFURL = CFURL.CreateByResolvingBookmarkData( data )
		            me.Constructor( url.Reference, not CFType.HasOwnership )
		            url = nil
		            finished = true // Nothing more to do
		            resolveIfAlias = false // Nothing left to resolve
		          catch
		          end try
		        end if // functionIsAvailable
		      #endif
		      
		      // See if the alias still needs to be resolved
		      if resolveIfAlias then
		        f = f.Parent.Child( f.Name ) // Traditional way to resolve the alias
		      end if
		      
		    end if // resolveIfAlias
		    
		    if not finished then
		      me.Constructor f.URLPath
		    end if
		    
		  end if // f is nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theURL as String)
		  me.Constructor nil, theURL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CopyHostName(url as CFURL) As Ptr
		  #if targetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFURLCopyHostName lib CarbonLib (anURL as Ptr) as Ptr
		    
		    return CFURLCopyHostName(url)
		    
		  #else
		    #pragma unused url
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CopyNetLocation(url as CFURL) As Ptr
		  #if targetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    soft declare function CFURLCopyNetLocation lib CarbonLib (anURL as Ptr) as Ptr
		    
		    return CFURLCopyNetLocation(url)
		    
		  #else
		    #pragma unused url
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CopyPassword(url as CFURL) As Ptr
		  #if targetMacOS
		    soft declare function CFURLCopyPassword lib CarbonLib (anURL as Ptr) as Ptr
		    
		    return CFURLCopyPassword(url)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CopyQueryString(url as CFURL) As Ptr
		  #if targetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFURLCopyQueryString lib CarbonLib (anURL as Ptr) as Ptr
		    
		    return CFURLCopyQueryString(url)
		    
		  #else
		    #pragma unused url
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CopyScheme(url as CFURL) As Ptr
		  #if targetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFURLCopyScheme lib CarbonLib (anURL as Ptr) as Ptr
		    
		    return CFURLCopyScheme(url)
		    
		  #else
		    #pragma unused url
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function CopyStringValueDelegate(url as CFURL) As Ptr
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function CopyUserName(url as CFURL) As Ptr
		  #if targetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFURLCopyUserName lib CarbonLib (anURL as Ptr) as Ptr
		    
		    return CFURLCopyUserName(url)
		    
		  #else
		    #pragma unused url
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateBookmarkData(f As FolderItem, options As UInt32 = 0, resourcePropertiesToInclude() As String = nil, relativeTo As FolderItem = nil) As CFData
		  // Added by Kem Tekinay.
		  
		  dim r as CFData
		  
		  if f is nil then return nil
		  
		  #if TargetMacOS
		    
		    const kCFAllocatorDefault = nil
		    
		    // Introduced in MacOS X 10.6
		    Soft Declare Function CFURLCreateBookmarkData Lib CarbonLib ( _
		    allocator As Ptr, _
		    url As Ptr, _
		    options As UInt32, _
		    propsToInclude As Ptr, _
		    relativeToURL As Ptr, _
		    ByRef error As Ptr _
		    ) As Ptr
		    
		    dim url as new CFURL( f )
		    dim propsToInclude as CFArray
		    dim propsToIncludeRef As Ptr
		    if resourcePropertiesToInclude <> nil and resourcePropertiesToInclude.Ubound <> -1 then
		      propsToInclude = new CFArray( resourcePropertiesToInclude )
		      propsToIncludeRef = propsToInclude.Reference
		    end if
		    dim relativeToURL as CFURL
		    dim relativeToURLRef as Ptr
		    if relativeTo <> nil then
		      relativeToURL = new CFURL( relativeTo )
		      relativeToURLRef = relativeToURL.Reference
		    end if
		    
		    dim errorRef as Ptr
		    dim ref as Ptr = CFURLCreateBookmarkData( kCFAllocatorDefault, url.Reference, options, propsToIncludeRef, relativeToURLRef, errorRef )
		    if errorRef <> nil then
		      raise new CFError( errorRef, CFType.HasOwnership )
		    elseif ref <> nil then
		      r = new CFData( ref, CFType.HasOwnership )
		    end if
		    
		  #else
		    
		    #pragma unused f
		    #pragma unused options
		    #pragma unused resourcePropertiesToInclude
		    #pragma unused relativeTo
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateBookmarkDataFromFile(alias As FolderItem) As CFData
		  dim r as CFData
		  
		  if alias is nil then return r
		  
		  #if TargetMacOS
		    
		    const kCFAllocatorDefault = nil
		    
		    // Introduced in MacOS X 10.6
		    Soft Declare Function CFURLCreateBookmarkDataFromFile Lib CarbonLib ( _
		    allocator As Ptr, _
		    fileURL As Ptr, _
		    ByRef errorRef As Ptr _
		    ) As Ptr
		    
		    dim url as new CFURL( alias )
		    dim errorRef as Ptr
		    dim ref as Ptr = CFURLCreateBookmarkDataFromFile( kCFAllocatorDefault, url, errorRef )
		    if errorRef <> nil then
		      raise new CFError( errorRef, CFType.HasOwnership )
		    elseif ref <> nil then
		      r = new CFData( ref, CFType.HasOwnership )
		    end if
		    
		  #else
		    
		    #pragma unused alias
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateByResolvingBookmarkData(bookmark As CFData, ByRef isStale As Boolean, options As UInt32 = 0, resourcePropertiesToInclude() As String = nil, relativeTo As FolderItem = nil) As CFURL
		  dim r as CFURL
		  
		  #if TargetMacOS
		    
		    const kCFAllocatorDefault = nil
		    
		    // Introduced in MacOS X 10.6
		    Soft Declare Function CFURLCreateByResolvingBookmarkData Lib CarbonLib ( _
		    allocator As Ptr, _
		    bookmark As Ptr, _
		    options As UInt32, _
		    relativeToURL As Ptr, _
		    propsToInclude As Ptr, _
		    ByRef isStale As Boolean, _
		    ByRef error As Ptr _
		    ) As Ptr
		    
		    dim propsToInclude as CFArray
		    dim propsToIncludeRef As Ptr
		    if resourcePropertiesToInclude <> nil and resourcePropertiesToInclude.Ubound <> -1 then
		      propsToInclude = new CFArray( resourcePropertiesToInclude )
		      propsToIncludeRef = propsToInclude.Reference
		    end if
		    dim relativeToURL as CFURL
		    dim relativeToURLRef as Ptr
		    if relativeTo <> nil then
		      relativeToURL = new CFURL( relativeTo )
		      relativeToURLRef = relativeToURL.Reference
		    end if
		    
		    dim errorRef as Ptr
		    dim ref as Ptr = CFURLCreateByResolvingBookmarkData( _
		    kCFAllocatorDefault, bookmark.Reference, options, relativeToURLRef, propsToIncludeRef, isStale, errorRef )
		    if errorRef <> nil then
		      raise new CFError( errorRef, CFType.HasOwnership )
		    elseif ref <> nil then
		      r = new CFURL( ref, CFType.HasOwnership )
		    end if
		    
		  #else
		    
		    #pragma unused isStale
		    #pragma unused options
		    #pragma unused resourcePropertiesToInclude
		    #pragma unused relativeTo
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateByResolvingBookmarkData(bookmark As CFData, options As UInt32 = 0, resourcePropertiesToInclude() As String = nil, relativeTo As FolderItem = nil) As CFURL
		  dim r as CFURL
		  
		  #if TargetMacOS
		    
		    dim b as Boolean
		    r = CFURL.CreateByResolvingBookmarkData( bookmark, b, options, resourcePropertiesToInclude, relativeTo )
		    
		  #else
		    
		    #pragma unused bookmark
		    #pragma unused options
		    #pragma unused resourcePropertiesToInclude
		    #pragma unused relativeTo
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CreateFromFilesystemPath(path as String, pathType as Integer, isDirectory as Boolean) As CFURL
		  #if targetMacOS
		    const kCFAllocatorDefault = nil
		    
		    dim p as Ptr = CoreFoundation.CFURLCreateWithFileSystemPath(kCFAllocatorDefault, path, pathType, isDirectory)
		    return new CFURL(p, CFType.hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromFSRef(fsRef as MemoryBlock) As CFURL
		  #if targetMacOS
		    
		    // Introduced in MacOS X 10.0
		    declare function CFURLCreateFromFSRef lib CarbonLib (allocator as Ptr, fsRef as Ptr) as Ptr
		    
		    const kCFAllocatorDefault = nil
		    
		    dim p as Ptr = CFURLCreateFromFSRef (kCFAllocatorDefault, fsRef)
		    return new CFURL(p, CFType.hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromHFSPath(path as String, isDirectory as Boolean) As CFURL
		  return CreateFromFilesystemPath(path, CFURL.HFSPathStyle, isDirectory)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPOSIXPath(path as String, isDirectory as Boolean) As CFURL
		  return CreateFromFilesystemPath(path, CFURL.POSIXPathStyle, isDirectory)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HostName() As String
		  return me.StringValue(AddressOf CopyHostName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDecomposable() As Boolean
		  #if TargetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    Declare Function CFURLCanBeDecomposed lib CarbonLib (anURL as Ptr) as Boolean
		    
		    if me <> nil then
		      return CFURLCanBeDecomposed(me)
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NetLocation() As String
		  return me.StringValue(AddressOf CopyNetLocation)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Password() As String
		  return me.StringValue(AddressOf CopyPassword)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path(resolveAgainstBase as Boolean = true) As String
		  #if TargetMacOS
		    if me <> nil then
		      dim buffer as new MemoryBlock(1024)
		      do
		        
		        // Introduced in MacOS X 10.0
		        declare function CFURLGetFileSystemRepresentation lib CarbonLib (url as Ptr, resolveAgainstBase as Boolean, buffer as Ptr, maxBufLen as Integer) as Boolean
		        
		        if CFURLGetFileSystemRepresentation(me.Reference, resolveAgainstBase, buffer, buffer.Size) then
		          exit
		        else
		          buffer.Size = 2*buffer.Size
		        end if
		      loop until buffer.Size > 65536
		      return DefineEncoding(buffer.CString(0), Encodings.UTF8) // 29Feb12 - used to be SystemDefault, but that's not working with non-ASCII file CFURLs constructed from FolderItems (on Lion)
		      
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Port() As Integer
		  #if TargetMacOS
		    
		    // Introduced in MacOS X 10.0
		    declare function CFURLGetPortNumber lib CarbonLib (anURL as Ptr) as Integer
		    if me <> nil then
		      return CFURLGetPortNumber(me)
		    else
		      //CFURLGetPortNumber returns -1 if not port exists; a url for which this holds is http://www.apple.com/ .  We return -1 in the case of a nil object for consistency.
		      return -1
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QueryString(charactersToLeaveEscaped as String = "") As String
		  return me.StringValue(AddressOf CopyQueryString)
		  
		  #pragma unused charactersToLeaveEscaped
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResolveAlias(options As UInt32 = 0) As CFURL
		  dim r as CFURL
		  
		  #if TargetMacOS
		    
		    if self.IsAlias then
		      
		      // Introduced in MacOS X 10.6.
		      Soft Declare Function CFURLCreateBookmarkDataFromFile lib CarbonLib ( _
		      allocator as Ptr, fileURL as Ptr, ByRef errorRef as Ptr) as Ptr
		      Soft Declare Function CFURLCreateByResolvingBookmarkData lib CarbonLib ( _
		      allocator as Ptr, bookmark as Ptr, options as UInt32, relativeToURL as Ptr, _
		      resourcePropertiesToInclude as Ptr, ByRef isStale as Boolean, ByRef errorRef as Ptr) as Ptr
		      
		      dim errorRef as Ptr
		      dim dataRef as Ptr = CFURLCreateBookmarkDataFromFile( nil, self, errorRef )
		      if errorRef <> nil then
		        raise new CFError( errorRef, CFType.HasOwnership )
		      end if
		      
		      if dataRef <> nil then
		        dim isStale as Boolean
		        dim urlRef as Ptr = CFURLCreateByResolvingBookmarkData( nil, dataRef, options, nil, nil, isStale, errorRef )
		        if errorRef <> nil then
		          raise new CFError( errorRef, CFType.HasOwnership )
		        elseif urlRef <> nil then
		          r = new CFURL( urlRef, CFType.HasOwnership )
		        end if
		      end if // dataRef <> nil
		      
		    else // Not an alias
		      r = self
		    end if
		    
		  #else
		    
		    #pragma unused options
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ResourcePropertyForKey(key As String) As Ptr
		  // Added by Kem Tekinay.
		  
		  if self.Reference = nil then
		    return nil
		  end if
		  
		  #if TargetMacOS
		    
		    dim keyRef as CFStringRef = Carbon.Bundle.StringPointerRetained( key )
		    dim propertyValueTypeRefPtr as Ptr
		    dim errorRef as Ptr
		    if CFURLCopyResourcePropertyForKey( self, keyRef, propertyValueTypeRefPtr, errorRef ) then
		      return propertyValueTypeRefPtr
		      // Note that the calling method does not need to Release this Ptr separately. If assigning it to a CFType, use "not HasOwnership".
		      // The Apple documention seems to indicate that the object returned will be cached and (presumably) released when the CFURL is released.
		    elseif errorRef <> nil then
		      dim err as new CFError( errorRef, CFType.HasOwnership )
		      dim code as integer = err.Code
		      if code <> kErrorFileNotFound then
		        raise err
		      end if
		    end if
		    
		  #else
		    #pragma unused key
		  #endif
		  
		  // Abandon all hope ye who get to this point
		  return nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Scheme() As String
		  return me.StringValue(AddressOf CopyScheme)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StringValue(f as CopyStringValueDelegate) As String
		  //if f  = nil, then that's a programmer error.
		  #if TargetMacOS
		    if self <> nil then
		      return NotRetainedStringValue(f.Invoke(self))
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserName() As String
		  return me.StringValue(AddressOf CopyUserName)
		End Function
	#tag EndMethod


	#tag Note, Name = About Properties
		Properties are recorded at the moment the CFURL is created. They are not live so things like
		FileSize, IsReadable, etc., can get stale if the file changes after the CFURL is created. 
		To obtain the latest data, recreate the CFURL first like this:
		
		myURL = new CFURL( myURL, "" )
		
		When the underlying file does not exist, most of the properties will return nil.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLAttributeModificationDateKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFDate( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		AttributeModificationDate As CFDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    // Introduced in MacOS X 10.0.
			    declare function CFURLGetBaseURL lib CarbonLib (anURL as Ptr) as Ptr
			    
			    if not ( self = nil ) then
			      dim theBaseURL as new CFURL(CFURLGetBaseURL(me.Reference), false)
			      if not ( theBaseURL = nil ) then
			        return theBaseURL
			      end if
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		BaseURL As CFURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLContentAccessDateKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFDate( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		ContentAccessDate As CFDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLContentModificationDateKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFDate( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		ContentModificationDate As CFDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLCreationDateKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFDate( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		CreationDate As CFDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if IsRegularFile is nil then
			    return false
			  else
			    return true
			  end if
			  
			End Get
		#tag EndGetter
		Exists As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLFileSizeKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFNumber( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		FileSize As CFNumber
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLLinkCountKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFNumber( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		HardLinkCount As CFNumber
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLHasHiddenExtensionKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		HasHiddenExtension As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsAliasFileKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsAlias As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsDirectoryKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsDirectory As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.7.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsExecutableKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsExecutable As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsHiddenKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsHidden As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsMountTriggerKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsMountTrigger As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsPackageKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsPackage As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.7.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsReadableKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsReadable As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsRegularFileKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsRegularFile As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsSymbolicLinkKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsSymbolicLink As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsSystemImmutableKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsSystemImmutable As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsUserImmutableKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsUserImmutable As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsVolumeKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsVolume As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.7.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLIsWritableKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFBoolean( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		IsWritable As CFBoolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not ( self = nil ) then
			    return GetFolderItem(me.StringValue, FolderItem.PathTypeURL)
			  end if
			End Get
		#tag EndGetter
		Item As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLLabelNumberKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFNumber( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		LabelNumber As CFNumber
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLLocalizedLabelKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFString( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		LocalizedLabel As CFString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLLocalizedNameKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFString( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		LocalizedName As CFString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLLocalizedTypeDescriptionKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFString( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		LocalizedTypeDescription As CFString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLNameKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFString( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		Name As CFString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLParentDirectoryURLKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFURL( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		ParentDirectoryURL As CFURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // returns only the relative part of a URL!
			  
			  #if TargetMacOS
			    
			    // Introduced in MacOS X 10.0.
			    declare function CFURLGetString lib CarbonLib (anURL as Ptr) as Ptr
			    // Caution: If this would return a CFStringRef, we'd have to Retain its value!
			    // Instead, "new CFString()" takes care of that below
			    
			    if self <> nil then
			      return new CFString(CFURLGetString(me.Reference), not CFType.HasOwnership)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		RelativeURL As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // returns the full URL (including the base)
			  
			  #if true
			    return me.AbsoluteURL().RelativeURL
			  #else
			    // this works, too, but the above one seems more proper
			    dim base as CFURL = me.BaseURL
			    if not (base is nil) and not base.IsNULL then
			      return me.BaseURL.StringValue+me.RelativeURL
			    else
			      return me.RelativeURL
			    end if
			  #endif
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.7.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLTotalFileAllocatedSizeKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFNumber( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		TotalFileAllocatedSize As CFNumber
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLTypeIdentifierKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFString( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		TypeIdentifier As CFString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Added by Kem Tekinay.
			  
			  // Introduced in MacOS X 10.6.
			  dim p as Ptr = ResourcePropertyForKey( "kCFURLVolumeURLKey" )
			  if p = nil then
			    return nil
			  else
			    return new CFURL( p, not CFType.HasOwnership )
			  end if
			  
			End Get
		#tag EndGetter
		VolumeURL As CFURL
	#tag EndComputedProperty


	#tag Constant, Name = AliasDoNotResolve, Type = Boolean, Dynamic = False, Default = \"False", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AliasResolve, Type = Boolean, Dynamic = False, Default = \"True", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HFSPathStyle, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFURLBookmarkCreationMinimalBookmarkMask, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFURLBookmarkCreationPreferFileIDResolutionMask, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFURLBookmarkCreationSecurityScopeAllowOnlyReadAccess, Type = Double, Dynamic = False, Default = \"4096", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFURLBookmarkCreationSuitableForBookmarkFile, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFURLBookmarkCreationWithSecurityScope, Type = Double, Dynamic = False, Default = \"2048", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorFileNotFound, Type = Double, Dynamic = False, Default = \"260", Scope = Private
	#tag EndConstant

	#tag Constant, Name = POSIXPathStyle, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WindowsPathStyle, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Exists"
			Group="Behavior"
			Type="Boolean"
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
			Name="RelativeURL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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

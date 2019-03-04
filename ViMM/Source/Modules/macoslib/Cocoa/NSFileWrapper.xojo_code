#tag Class
Class NSFileWrapper
Inherits NSObject
	#tag Method, Flags = &h1000
		Function AddFileWrapper(childWrapper as NSFileWrapper) As String
		  //# Adds a child file wrapper to the NSFileWrapper, which must be a directory file wrapper.
		  
		  #if targetMacOS
		    declare function addFileWrapper lib CocoaLib selector "addFileWrapper:" (obj_id as Ptr, childWrapper as Ptr) as CFStringRef
		    
		    dim wrapperRef as Ptr
		    if childWrapper <> nil then
		      wrapperRef = childWrapper
		    end if
		    
		    return addFileWrapper(self, wrapperRef)
		  #else
		    #pragma unused childWrapper
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function AddRegularFile(contents as NSData, preferredFileName as String) As String
		  //# Creates a regular-file file wrapper with the given contents and adds it to the NSFileWrapper, which must be a directory file wrapper.
		  
		  #if targetMacOS
		    declare function addRegularFileWithContents lib CocoaLib selector "addRegularFileWithContents:preferredFilename:" _
		    (obj_id as Ptr, data as Ptr, fileName as CFStringRef) as CFStringRef
		    
		    dim dataRef as Ptr
		    if contents <> nil then
		      dataRef = contents
		    end if
		    
		    return addRegularFileWithContents(self, dataRef, preferredFileName)
		  #else
		    #pragma unused contents
		    #pragma unused preferredFileName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(contents as NSData)
		  //# Initializes the NSFileWrapper as a regular-file file wrapper.
		  
		  #if targetMacOS
		    declare function initRegularFileWithContents lib CocoaLib selector "initRegularFileWithContents:" (obj_id as Ptr, contents as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if contents <> nil then
		      dataRef = contents
		    end if
		    
		    super.Constructor(initRegularFileWithContents(Allocate("NSFileWrapper"), dataRef), NSFileWrapper.hasOwnership)
		  #else
		    #pragma unused contents
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(childrenByPreferredName as NSDictionary)
		  //# Initializes the NSFileWrapper as a directory file wrapper, with a given file-wrapper list.
		  
		  #if targetMacOS
		    declare function initDirectoryWithFileWrappers lib CocoaLib selector "initDirectoryWithFileWrappers:" (obj_id as Ptr, childrenByPreferredName as Ptr) as Ptr
		    
		    dim dictRef as Ptr
		    if childrenByPreferredName <> nil then
		      dictRef = childrenByPreferredName
		    end if
		    
		    super.Constructor(initDirectoryWithFileWrappers(Allocate("NSFileWrapper"), dictRef), NSFileWrapper.hasOwnership)
		  #else
		    #pragma unused childrenByPreferredName
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  //# Initializes the NSFileWrapper as a symbolic-link file wrapper that links to a specified file.
		  
		  #if targetMacOS
		    declare function initSymbolicLinkWithDestinationURL lib CocoaLib selector "initSymbolicLinkWithDestinationURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    super.Constructor(initSymbolicLinkWithDestinationURL(Allocate("NSFileWrapper"), urlRef), NSFileWrapper.hasOwnership)
		  #else
		    #pragma unused aURL
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL, options as UInt32, byRef error as NSError)
		  //# Initializes a file wrapper instance whose kind is determined by the type of file-system node located by the URL.
		  
		  #if targetMacOS
		    declare function initWithURL lib CocoaLib selector "initWithURL:options:error:" (obj_id as Ptr, aURL as Ptr, options as UInt32, byRef error as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim errorRef as Ptr
		    
		    super.Constructor(initWithURL(Allocate("NSFileWrapper"), urlRef, options, errorRef), NSFileWrapper.hasOwnership)
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		  #else
		    #pragma unused aURL
		    #pragma unused options
		    #pragma unused error
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileWrappers() As NSDictionary
		  //# Returns the file wrappers contained by a directory file wrapper.
		  
		  #if targetMacOS
		    declare function fileWrappers lib CocoaLib selector "fileWrappers" (obj_id as Ptr) as Ptr
		    
		    dim dictRef as Ptr = fileWrappers(self)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Key(childWrapper as NSFileWrapper) As String
		  //# Returns the dictionary key used by a directory to identify a given file wrapper.
		  
		  #if targetMacOS
		    declare function keyForFileWrapper lib CocoaLib selector "keyForFileWrapper:" (obj_id as Ptr, childWrapper as Ptr) as CFStringRef
		    
		    dim wrapperRef as Ptr
		    if childWrapper <> nil then
		      wrapperRef = childWrapper
		    end if
		    
		    return keyForFileWrapper(self, wrapperRef)
		  #else
		    #pragma unused childWrapper
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function MatchesContents(aURL as NSURL) As Boolean
		  //# Indicates whether the contents of a file wrapper matches a directory, regular file, or symbolic link on disk.
		  
		  #if targetMacOS
		    declare function matchesContentsOfURL lib CocoaLib selector "matchesContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Boolean
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    return matchesContentsOfURL(self, urlRef)
		  #else
		    #pragma unused aURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Read(aURL as NSURL, options as UInt32, byRef error as NSError) As Boolean
		  //# Recursively rereads the entire contents of a file wrapper from the specified location on disk.
		  
		  #if targetMacOS
		    declare function readFromURL lib CocoaLib selector "readFromURL:options:error:" (obj_id as Ptr, aURL as Ptr, options as UInt32, byRef error as Ptr) as Boolean
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim errorRef as Ptr
		    
		    dim success as Boolean = readFromURL(self, urlRef, options, errorRef)
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		    return success
		  #else
		    #pragma unused aURL
		    #pragma unused options
		    #pragma unused error
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RegularFileContents() As NSData
		  //# Returns the contents of the file-system node associated with a regular-file file wrapper.
		  
		  #if targetMacOS
		    declare function regularFileContents lib CocoaLib selector "regularFileContents" (obj_id as Ptr) as Ptr
		    
		    dim dataRef as Ptr = regularFileContents(self)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveFileWrapper(childWrapper as NSFileWrapper)
		  //# Removes a child file wrapper from the NSFileWrapper, which must be a directory file wrapper.
		  
		  #if targetMacOS
		    declare sub removeFileWrapper lib CocoaLib selector "removeFileWrapper:" (obj_id as Ptr, childWrapper as Ptr)
		    
		    dim wrapperRef as Ptr
		    if childWrapper <> nil then
		      wrapperRef = childWrapper
		    end if
		    
		    removeFileWrapper(self, wrapperRef)
		  #else
		    #pragma unused childWrapper
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function SerializedRepresentation() As NSData
		  //# Returns the contents of the file wrapper as an opaque collection of data.
		  
		  #if targetMacOS
		    declare function serializedRepresentation lib CocoaLib selector "serializedRepresentation" (obj_id as Ptr) as Ptr
		    
		    dim dataRef as Ptr = serializedRepresentation(self)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function SymbolicLinkURL() As NSURL
		  //# Provides the URL referenced by the NSFileWrapper, which must be a symbolic-link file wrapper.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function symbolicLinkDestinationURL lib CocoaLib selector "symbolicLinkDestinationURL" (obj_id as Ptr) as Ptr
		      
		      dim urlRef as Ptr = symbolicLinkDestinationURL(self)
		      if urlRef <> nil then
		        return new NSURL(urlRef)
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Write(aURL as NSURL, options as UInt32, originalContentsURL as NSURL, byRef error as NSError) As Boolean
		  //# Recursively writes the entire contents of a file wrapper to a given file-system URL.
		  
		  #if targetMacOS
		    declare function writeToURL lib CocoaLib selector "writeToURL:options:originalContentsURL:error:" _
		    (obj_id as Ptr, aURL as Ptr, options as UInt32, originalContentsURL as Ptr, byRef error as Ptr) as Boolean
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim originalContentsURLRef as Ptr
		    if originalContentsURL <> nil then
		      originalContentsURLRef = originalContentsURL
		    end if
		    
		    dim errorRef as Ptr
		    
		    dim success as Boolean = writeToURL(self, urlRef, options, originalContentsURLRef, errorRef)
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		    return success
		  #else
		    #pragma unused aURL
		    #pragma unused options
		    #pragma unused originalContentsURL
		    #pragma unused error
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a file wrapper’s file attributes.
			  
			  #if TargetMacOS
			    declare function fileAttributes lib CocoaLib selector "fileAttributes" (obj_id as Ptr) as Ptr
			    
			    dim dictRef as Ptr = fileAttributes(self)
			    if dictRef <> nil then
			      return new NSDictionary(dictRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Specifies a file wrapper’s file attributes.
			  
			  #if TargetMacOS
			    declare sub setFileAttributes lib CocoaLib selector "setFileAttributes:" (obj_id as Ptr, fileAttributes as Ptr)
			    
			    dim dictRef as Ptr
			    if value <> nil then
			      dictRef = value
			    end if
			    
			    setFileAttributes self, dictRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		FileAttributes As NSDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Provides the filename of a file wrapper.
			  
			  #if TargetMacOS
			    declare function filename lib CocoaLib selector "filename" (obj_id as Ptr) as CFStringRef
			    
			    return filename(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //#
			  #if TargetMacOS
			    declare sub setFilename lib CocoaLib selector "setFilename:" (obj_id as Ptr, fileName as CFStringRef)
			    
			    setFilename self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Filename As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Indicates whether the NSFileWrapper is a directory file wrapper.
			  
			  #if targetMacOS
			    declare function isDirectory lib CocoaLib selector "isDirectory" (obj_id as Ptr) as Boolean
			    
			    return isDirectory(self)
			  #endif
			End Get
		#tag EndGetter
		isDirectory As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Indicates whether the NSFileWrapper is a regular-file file wrapper.
			  
			  #if targetMacOS
			    declare function isRegularFile lib CocoaLib selector "isRegularFile" (obj_id as Ptr) as Boolean
			    
			    return isRegularFile(self)
			  #endif
			End Get
		#tag EndGetter
		isRegularFile As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isSymbolicLink lib CocoaLib selector "isSymbolicLink" (obj_id as Ptr) as Boolean
			    
			    return isSymbolicLink(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		isSymbolicLink As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function preferredFilename lib CocoaLib selector "preferredFilename" (obj_id as Ptr) as CFStringRef
			    
			    return preferredFilename(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setPreferredFilename lib CocoaLib selector "setPreferredFilename:" (obj_id as Ptr, fileName as CFStringRef)
			    
			    setPreferredFilename self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PreferredFilename As String
	#tag EndComputedProperty


	#tag Constant, Name = NSFileWrapperReadingCoordinated, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFileWrapperReadingImmediate, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFileWrapperReadingWithoutMapping, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFileWrapperWritingAtomic, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFileWrapperWritingCoordinated, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFileWrapperWritingWithNameUpdating, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Filename"
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
			Name="isDirectory"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isRegularFile"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isSymbolicLink"
			Group="Behavior"
			Type="Boolean"
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
			Name="PreferredFilename"
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

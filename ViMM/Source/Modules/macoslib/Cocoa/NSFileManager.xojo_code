#tag Class
Class NSFileManager
Inherits NSObject
	#tag Method, Flags = &h0
		Function ContentsAtPath(path as String) As NSData
		  //# Reads the contents of the file located at ''path''.
		  
		  #if TargetMacOS
		    declare function contentsAtPath lib FoundationLib selector "contentsAtPath:" (id as Ptr, path as CFStringRef) as Ptr
		    declare function stringByExpandingTildeInPath lib CocoaLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		    
		    dim p as Ptr = contentsAtPath( self, path )
		    
		    if p<>nil then
		      return  new NSData( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentsEqualAtPathAndPath(path1 as String, path2 as string) As Boolean
		  //# Reads the contents of the file located at ''path''.
		  
		  #if TargetMacOS
		    declare function contentsEqualAtPath lib FoundationLib selector "contentsEqualAtPath:andPath:" (id as Ptr, path1 as CFStringRef, path2 as CFStringRef) as Boolean
		    declare function stringByExpandingTildeInPath lib CocoaLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		    
		    return   contentsEqualAtPath( self, path1, path2 )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateSymbolicLinkAtPath(AtPath as string, DestinationPath as string) As NSError
		  //# Creates a symbolic link. Returns the corresponding NSError, or nil.
		  
		  #if TargetMacOS
		    declare function createSymbolicLinkAtPath lib FoundationLib selector "createSymbolicLinkAtPath:withDestinationPath:error:" (id as Ptr, AtPath as CFStringRef, destPath as CFStringRef, byref error as Ptr) as boolean
		    declare function stringByExpandingTildeInPath lib CocoaLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		    
		    dim errPtr as Ptr
		    if createSymbolicLinkAtPath( self, AtPath, DestinationPath, errPtr ) then
		      return  nil
		    else
		      return  new NSError( errPtr, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateSymbolicLinkAtURL(AtURL as NSURL, DestinationURL as NSURL) As NSError
		  //# Creates a symbolic link. Returns the corresponding NSError, or nil.
		  
		  #if TargetMacOS
		    declare function createSymbolicLinkAtURL lib FoundationLib selector "createSymbolicLinkAtURL:withDestinationURL:error:" (id as Ptr, AtURL as Ptr, destURL as Ptr, byref error as Ptr) as boolean
		    
		    dim errPtr as Ptr
		    if createSymbolicLinkAtURL( self, AtURL, DestinationURL, errPtr ) then
		      return  nil
		    else
		      return  new NSError( errPtr, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultManager() As NSFileManager
		  //# Returns the DefaultManager.
		  
		  #if TargetMacOS
		    dim p as Ptr = Cocoa.NSClassFromString( "NSFileManager" )
		    
		    if p<>nil then
		      declare function defaultManager lib FoundationLib selector "defaultManager" (class_id as Ptr) as Ptr
		      
		      return   new NSFileManager( defaultManager( p ))
		      
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnumeratorAtPath(path as String) As NSDirectoryEnumerator
		  
		  #if TargetMacOS
		    declare function enumeratorAtPath lib FoundationLib selector "enumeratorAtPath:" (id as Ptr, path as CFStringRef) as Ptr
		    declare function stringByExpandingTildeInPath lib CocoaLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		    
		    dim p as Ptr = enumeratorAtPath( self, stringByExpandingTildeInPath( path ))
		    
		    if p<>nil then
		      return  new NSDirectoryEnumerator( p, false )
		    else
		      return  nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnumeratorAtURL(url as NSURL, attrKeys as NSArray, options as integer) As NSDirectoryEnumerator
		  #pragma unused attrKeys
		  
		  #if TargetMacOS
		    declare function enumeratorAtURL lib FoundationLib selector "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:" (id as Ptr, url as Ptr, ppties as Ptr, opt as Integer, errBlock as Ptr) as Ptr
		    
		    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		    
		    dim p as Ptr = enumeratorAtURL( self, url, nil, options, nil )
		    
		    if p<>nil then
		      return  new NSDirectoryEnumerator( p, false )
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused url
		    #pragma unused options
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LinkItemAtPath(AtPath as string, DestinationPath as string) As NSError
		  //# Creates a hard link. Returns the corresponding NSError, or nil.
		  
		  #if TargetMacOS
		    declare function linkItemAtPath lib FoundationLib selector "linkItemAtPath:toPath:error:" (id as Ptr, AtPath as CFStringRef, destPath as CFStringRef, byref error as Ptr) as boolean
		    declare function stringByExpandingTildeInPath lib CocoaLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		    
		    dim errPtr as Ptr
		    if linkItemAtPath( self, AtPath, DestinationPath, errPtr ) then
		      return  nil
		    else
		      return  new NSError( errPtr, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LinkItemAtURL(AtURL as NSURL, DestinationURL as NSURL) As NSError
		  //# Creates a hard link. Returns the corresponding NSError, or nil.
		  
		  #if TargetMacOS
		    declare function linkItemAtURL lib FoundationLib selector "linkItemAtURL:toURL:error:" (id as Ptr, AtURL as Ptr, destURL as Ptr, byref error as Ptr) as boolean
		    
		    dim errPtr as Ptr
		    if linkItemAtURL( self, AtURL, DestinationURL, errPtr ) then
		      return  nil
		    else
		      return  new NSError( errPtr, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubpathsAtPath(path as String) As NSArray
		  //# Collects the full disk items hierarchy.
		  
		  //@ This method should not be called from the main thread because it is very time consuming.
		  
		  #if TargetMacOS
		    declare function subpathsAtPath lib FoundationLib selector "subpathsAtPath:" (id as Ptr, path as CFStringRef) as Ptr
		    declare function stringByExpandingTildeInPath lib CocoaLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		    
		    dim p as Ptr = subpathsAtPath( self, stringByExpandingTildeInPath( path ))
		    
		    if p<>nil then
		      return  new NSArray( p, false )
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubpathsOfDirectoryAtPath(path as String, byref error as NSError) As NSArray
		  //# Collects the full subdirectories hierarchy.
		  
		  //@ This method should not be called from the main thread because it is very time consuming.
		  
		  #if TargetMacOS
		    declare function subpathsOfDirectoryAtPath lib FoundationLib selector "subpathsOfDirectoryAtPath:error:" (id as Ptr, path as CFStringRef, byref errPtr as Ptr) as Ptr
		    declare function stringByExpandingTildeInPath lib CocoaLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		    
		    dim errPtr as Ptr
		    dim p as Ptr = subpathsOfDirectoryAtPath( self, path, errPtr )
		    
		    if errPtr<>nil then
		      error = new NSError( errPtr, false )
		    else
		      error = nil
		    end if
		    
		    if p<>nil then
		      return  new NSArray( p, false )
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = NSDirectoryEnumerationSkipsHiddenFiles, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSDirectoryEnumerationSkipsPackageDescendants, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSDirectoryEnumerationSkipsSubdirectoryDescendants, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


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

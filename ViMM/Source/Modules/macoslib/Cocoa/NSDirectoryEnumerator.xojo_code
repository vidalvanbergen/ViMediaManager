#tag Class
Class NSDirectoryEnumerator
Inherits NSEnumerator
	#tag Method, Flags = &h0
		Function DirectoryAttributes() As NSDictionary
		  
		  #if TargetMacOS
		    declare function directoryAttributes lib FoundationLib selector "directoryAttributes" (id as Ptr) as Ptr
		    
		    dim p as Ptr = directoryAttributes( self )
		    
		    if p<>nil then
		      return  new NSDictionary( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileAttributes() As NSDictionary
		  
		  #if TargetMacOS
		    declare function fileAttributes lib FoundationLib selector "fileAttributes" (id as Ptr) as Ptr
		    
		    dim p as Ptr = fileAttributes( self )
		    
		    if p<>nil then
		      return  new NSDictionary( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Level() As UInt32
		  
		  #if TargetMacOS
		    declare function level lib FoundationLib selector "level" (id as Ptr) as UInt32
		    
		    return  level( self )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextURL() As NSURL
		  //# Returns the next object from the collection being enumerated.
		  
		  #if targetMacOS
		    dim p as Ptr = super.NextObject
		    
		    if p<>nil then
		      return  new NSURL( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SkipDescendants()
		  
		  #if TargetMacOS
		    //There are 2 identical selectors available here: "skipDescendents" and "skipDescendants" but "skipDescendants" in available only from OS X 10.6 so "skipDescendents" is a more sensible choice.
		    declare sub skipDescendents lib FoundationLib selector "skipDescendents" (id as Ptr)
		    
		    skipDescendents( self )
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = @doc
		
		@overview
		The __NSDirectoryEnumerator__ is a way to scan a directory hierarchy (possibly in-depth).
		
		Compared to a simple recursive method, the __NSDirectoryEnumerator__ performs 15-25 times faster !
		@overview/
	#tag EndNote


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

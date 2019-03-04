#tag Class
Class NSEnumerator
Inherits NSObject
	#tag Method, Flags = &h1000
		Function AllObjects() As NSArray
		  //# Returns an array of objects the NSEnumerator has yet to enumerate.
		  
		  #if targetMacOS
		    declare function allObjects lib CocoaLib selector "allObjects" (obj_id as Ptr) as Ptr
		    
		    dim arrayRef as Ptr = allObjects(self)
		    
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function NextObject() As Ptr
		  //# Returns the next object from the collection being enumerated.
		  
		  #if targetMacOS
		    declare function nextObject lib CocoaLib selector "nextObject" (obj_id as Ptr) as Ptr
		    
		    return nextObject(self)
		  #endif
		End Function
	#tag EndMethod


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

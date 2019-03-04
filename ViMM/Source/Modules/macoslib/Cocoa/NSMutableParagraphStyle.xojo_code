#tag Class
Class NSMutableParagraphStyle
Inherits NSParagraphStyle
	#tag Method, Flags = &h0
		Sub LineBreakMode(assigns mode as integer)
		  
		  #if TargetMacOS
		    declare sub setLineBreakMode lib CocoaLib selector "setLineBreakMode:" (id as Ptr, value as integer)
		    
		    setLineBreakMode( me.id, mode )
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			Per Apple's documention:
			
			Important A paragraph style object should not be mutated after adding it to an attributed string; doing so can cause your program to crash.
		#tag EndNote
		NoLongerMutable As boolean
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
			Name="NoLongerMutable"
			Group="Behavior"
			Type="boolean"
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

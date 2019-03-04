#tag Class
Class NSException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(p as Ptr)
		  #if targetMacOS
		    declare function code lib CocoaLib selector "code" (obj_id as Ptr) as Integer
		    declare function localizedDescription lib CocoaLib selector "localizedDescription" (obj_id as Ptr) as Ptr
		    declare function domain lib CocoaLib selector "domain" (obj_id as Ptr) as Ptr
		    
		    self.ErrorNumber = code(p)
		    self.Message = RetainedStringValue(localizedDescription(p))
		    self.Domain = RetainedStringValue(domain(p))
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = ReadMe
		NSException is essentially a wrapper for the Cocoa NSError class.  It's not named NSError
		because it does not inherit from NSObject, so I decided to tweak the name; also, NSException 
		fits standard Rb naming of RuntimeException subclasses.
	#tag EndNote


	#tag Property, Flags = &h0
		Domain As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Domain"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Reason"
			Group="Behavior"
			Type="Text"
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

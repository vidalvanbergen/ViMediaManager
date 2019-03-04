#tag Class
Protected Class MacOSError
Inherits OSError
	#tag Method, Flags = &h1000
		Sub Constructor(errorCode as Integer)
		  self.Constructor(errorCode, "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(errorCode as Integer, msg as String)
		  self.ErrorNumber = errorCode
		  self.Message = msg
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(msg as String)
		  self.Constructor(0, msg)
		End Sub
	#tag EndMethod


	#tag Constant, Name = errFSNoMoreItems, Type = Double, Dynamic = False, Default = \"-1417", Scope = Public
	#tag EndConstant

	#tag Constant, Name = errFSNotAFolder, Type = Double, Dynamic = False, Default = \"-1407", Scope = Public
	#tag EndConstant

	#tag Constant, Name = noErr, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
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

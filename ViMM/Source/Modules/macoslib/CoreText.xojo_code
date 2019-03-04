#tag Module
Protected Module CoreText
	#tag Note, Name = Notes
		Core Text was added in Mac OS 10.5.
	#tag EndNote


	#tag Constant, Name = kCTFontAttributeName, Type = String, Dynamic = False, Default = \"NSFont", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCTForegroundColorAttributeName, Type = String, Dynamic = False, Default = \"CTForegroundColor", Scope = Public
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

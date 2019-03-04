#tag Module
Protected Module SystemConfiguration
	#tag ExternalMethod, Flags = &h1
		Protected Declare Function ErrorCode Lib Framework Alias "SCError" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function ErrorMessage Lib Framework Alias "SCErrorString" (status as Integer) As CString
	#tag EndExternalMethod


	#tag Constant, Name = BundleID, Type = String, Dynamic = False, Default = \"com.apple.SystemConfiguration", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Framework, Type = String, Dynamic = False, Default = \"SystemConfiguration.framework", Scope = Protected
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

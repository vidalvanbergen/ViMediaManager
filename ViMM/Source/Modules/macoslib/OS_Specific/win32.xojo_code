#tag Module
Protected Module win32
	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetCurrentProcessId Lib Kernel32 () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetLastError Lib Kernel32 () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function IsNormalizedString Lib Normaliz (NormForm as Integer, lpSrcString as WString, cwLength as Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NormalizeString Lib Normaliz (NormForm as Integer, lpSrcString as WString, cwSrcLength as Integer, lpDstString as Ptr, cwDstLength as Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Sub SetLastError Lib Kernel32 (err as integer)
	#tag EndExternalMethod


	#tag Constant, Name = Kernel32, Type = String, Dynamic = False, Default = \"Kernel32.dll", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Normaliz, Type = String, Dynamic = False, Default = \"Normaliz.dll", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NormalizationC, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NormalizationD, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NormalizationKC, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NormalizationKD, Type = Double, Dynamic = False, Default = \"6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Rpcrt4, Type = String, Dynamic = False, Default = \"Rpcrt4.dll", Scope = Protected
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

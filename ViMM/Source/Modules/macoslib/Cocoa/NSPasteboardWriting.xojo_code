#tag Interface
Protected Interface NSPasteboardWriting
	#tag Method, Flags = &h0
		Function PropertyListForType(type as String) As variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WritableTypes() As String()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WritingOptionsForType(type as string) As integer
		  
		End Function
	#tag EndMethod


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
End Interface
#tag EndInterface

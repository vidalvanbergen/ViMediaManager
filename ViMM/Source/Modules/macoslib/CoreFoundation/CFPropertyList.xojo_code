#tag Interface
Interface CFPropertyList
	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Reference() As Ptr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As Variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteToFile(file as FolderItem, asXML as Boolean = True) As Boolean
		  
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

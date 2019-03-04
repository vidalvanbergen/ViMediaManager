#tag Class
Protected Class HTMLEntity
	#tag Method, Flags = &h0
		Sub Constructor(EntityCharacter As String, EntitySymbol As String)
		  me.character = entitycharacter
		  me.symbol = entitysymbol
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Character As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Symbol As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Character"
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
			Name="Symbol"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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

#tag Class
Protected Class MenuItemEditMenu
Inherits MenuItem
	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Edit", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Edit"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Bearbeiten"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE7\xB7\xA8\xE9\x9B\x86"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\xC3\x89dition"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Composizione"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xB8\xE0\xA6\xAE\xE0\xA7\x8D\xE0\xA6\xAA\xE0\xA6\xBE\xE0\xA6\xA6\xE0\xA6\xA8\xE0\xA6\xBE"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wijzig"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Text"
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
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

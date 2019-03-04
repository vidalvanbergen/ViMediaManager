#tag Class
Protected Class CocoaMenuItemCopyStyle
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "copyFont:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Copy Style", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Copy Style"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Stil kopieren"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xB9\xE3\x82\xBF\xE3\x82\xA4\xE3\x83\xAB\xE3\x82\x92\xE3\x82\xB3\xE3\x83\x94\xE3\x83\xBC"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Copier le style"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Copia stile"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xB6\xE0\xA7\x88\xE0\xA6\xB2\xE0\xA7\x80 \xE0\xA6\x85\xE0\xA6\xA8\xE0\xA7\x81\xE0\xA6\xB2\xE0\xA6\xBF\xE0\xA6\xAA\xE0\xA6\xBF"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kopieer stijl"
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

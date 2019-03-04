#tag Class
Protected Class CocoaMenuItemKernDefault
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "useStandardKerning:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Use Default", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Use Default"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Normal"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x87\xE3\x83\x95\xE3\x82\xA9\xE3\x83\xAB\xE3\x83\x88"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Valeur par d\xC3\xA9faut"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Utilizza default"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xA1\xE0\xA6\xBF\xE0\xA6\xAB\xE0\xA6\xB2\xE0\xA7\x8D\xE0\xA6\x9F \xE0\xA6\xAC\xE0\xA7\x8D\xE0\xA6\xAF\xE0\xA6\xAC\xE0\xA6\xB9\xE0\xA6\xBE\xE0\xA6\xB0 \xE0\xA6\x95\xE0\xA6\xB0\xE0\xA6\xBE"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Standaard"
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

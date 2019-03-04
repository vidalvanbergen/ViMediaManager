#tag Class
Protected Class CocoaMenuItemUseSelectionForFind
Inherits CocoaMenuItemFindAbstract
	#tag Event
		Function CocoaTag() As Integer
		  const NSFindPanelActionSetFindString = 7
		  return NSFindPanelActionSetFindString
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Use Selection for Find", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Use Selection for Find"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Auswahl suchen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE9\x81\xB8\xE6\x8A\x9E\xE9\x83\xA8\xE5\x88\x86\xE3\x82\x92\xE6\xA4\x9C\xE7\xB4\xA2\xE3\x81\xAB\xE4\xBD\xBF\xE7\x94\xA8"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher la s\xC3\xA9lection"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Usa selezione per cercare"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Gebruik selectie voor zoekactie"
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

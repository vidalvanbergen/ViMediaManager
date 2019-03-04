#tag Class
Protected Class CocoaMenuItemCheckSpellingWhileTyping
Inherits CocoaMenuItemToggle
	#tag Event
		Function ActionSelectorName() As String
		  return "toggleContinuousSpellChecking:"
		End Function
	#tag EndEvent

	#tag Event
		Function TestMethodName() As String
		  return "isContinuousSpellCheckingEnabled"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Check Spelling While Typing", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Check Spelling While Typing"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"W\xC3\xA4hrend der Texteingabe pr\xC3\xBCfen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE5\x85\xA5\xE5\x8A\x9B\xE4\xB8\xAD\xE3\x81\xAB\xE3\x82\xB9\xE3\x83\x9A\xE3\x83\xAB\xE3\x83\x81\xE3\x82\xA7\xE3\x83\x83\xE3\x82\xAF"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"V\xC3\xA9rifier l\'orthographe lors de la frappe"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Controlla ortografia mentre scrivo"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Controleer spelling tijdens typen"
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

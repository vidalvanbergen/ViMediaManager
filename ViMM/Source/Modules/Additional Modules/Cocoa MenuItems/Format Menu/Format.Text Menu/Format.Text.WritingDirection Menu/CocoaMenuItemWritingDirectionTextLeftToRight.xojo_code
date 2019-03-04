#tag Class
Protected Class CocoaMenuItemWritingDirectionTextLeftToRight
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "makeTextWritingDirectionLeftToRight:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"\tLeft to Right", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"\tLeft to Right"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"\tVon links nach rechts"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\t\xE5\xB7\xA6\xE3\x81\x8B\xE3\x82\x89\xE5\x8F\xB3"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\tDe gauche \xC3\xA0 droite"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"\tDa sinistra a destra"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xAC\xE0\xA6\xBE\xE0\xA6\x81 \xE0\xA6\xA5\xE0\xA7\x87\xE0\xA6\x95\xE0\xA7\x87 \xE0\xA6\xA1\xE0\xA6\xBE\xE0\xA6\x87\xE0\xA6\xA8\xE0\xA7\x87"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"\tLinks naar rechts"
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

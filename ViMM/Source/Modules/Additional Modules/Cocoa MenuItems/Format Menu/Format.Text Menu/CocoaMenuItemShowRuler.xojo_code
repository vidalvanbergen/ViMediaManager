#tag Class
Protected Class CocoaMenuItemShowRuler
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "toggleRuler:"
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu(target as Ptr)
		  #if targetCocoa
		    declare function respondsToSelector lib CocoaLib selector "respondsToSelector:" (obj_id as Ptr, aSelector as Ptr) as Boolean
		    declare function isRulerVisible lib CocoaLib selector "isRulerVisible" (obj_id as Ptr) as Boolean
		    
		    if target = nil then
		      return
		    end if
		    
		    if respondsToSelector(target, Cocoa.NSSelectorFromString("isRulerVisible")) then
		      if isRulerVisible(target) then
		        self.Text = LocalizedTextHide
		      else
		        self.Text = LocalizedTextShow
		      end if
		    else
		      //I wouldn't expect this to happen, but just in case...
		      self.Text = LocalizedTextShow
		    end if
		    
		  #else
		    #pragma unused target
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = LocalizedTextHide, Type = String, Dynamic = True, Default = \"Hide Ruler", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Hide Ruler"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lineal ausblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\xAB\xE3\x83\xBC\xE3\x83\xA9\xE3\x82\x92\xE9\x9A\xA0\xE3\x81\x99"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Masquer les r\xC3\xA8gles"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nascondi righello"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verberg liniaal"
	#tag EndConstant

	#tag Constant, Name = LocalizedTextShow, Type = String, Dynamic = True, Default = \"Show Ruler", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Ruler"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lineal einblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\xAB\xE3\x83\xBC\xE3\x83\xA9\xE3\x82\x92\xE8\xA1\xA8\xE7\xA4\xBA"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher les r\xC3\xA8gles"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Mostra righello"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon liniaal"
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

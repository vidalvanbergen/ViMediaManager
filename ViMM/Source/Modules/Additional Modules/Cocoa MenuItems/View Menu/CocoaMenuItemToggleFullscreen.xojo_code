#tag Class
Protected Class CocoaMenuItemToggleFullscreen
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "toggleFullScreen:"
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu(target as Ptr)
		  #if TargetCocoa then
		    if IsLion then
		      // Hide if the frontmost window can't be set fullscreen
		      Dim w as Window = Window(0)
		      self.Visible = ( w <> Nil And w.FullScreenAllowed )
		      
		      if w = Nil then return // Return if there's no frontmost window
		      
		      declare function GetStyleMask lib CocoaLib selector "styleMask" (windowref as WindowPtr) as Integer
		      
		      // Set the text correctly depending on the fullscreen mode of the frontmost window
		      dim value as Integer = GetStyleMask(w)
		      if Bitwise.BitAnd(Value,NSFullScreenWindowMask) = NSFullScreenWindowMask then
		        self.Text = LocalizedTextExitFullscreen
		      else
		        self.Text = LocalizedTextEnterFullscreen
		      end if
		      
		    end if
		  #else
		    self.Visible = false
		  #endif
		  
		  #pragma Unused target
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = LocalizedTextEnterFullscreen, Type = String, Dynamic = True, Default = \"Enter Full Screen", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Enter Full Screen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vollbild ein"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Activer le mode plein \xC3\xA9cran"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Helsk\xC3\xA4rmsl\xC3\xA4ge"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Schakel schermvullende weergave in"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Attiva modalit\xC3\xA0 a tutto schermo"
	#tag EndConstant

	#tag Constant, Name = LocalizedTextExitFullscreen, Type = String, Dynamic = True, Default = \"Exit Full Screen", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Exit Full Screen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vollbild aus"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quitter le mode plein \xC3\xA9cran"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"L\xC3\xA4mna helsk\xC3\xA4rmsl\xC3\xA4ge"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Schakel schermvullende weergave uit"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Disattiva modalit\xC3\xA0 a tutto schermo"
	#tag EndConstant

	#tag Constant, Name = NSFullScreenWindowMask, Type = Double, Dynamic = False, Default = \"16384", Scope = Private
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

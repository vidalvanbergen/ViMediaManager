#tag Class
Protected Class CocoaMenuItemFormatFontTrait
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "addFontTrait:"
		End Function
	#tag EndEvent

	#tag Event
		Function CocoaTag() As Integer
		  if self.Checked then
		    return raiseEvent FormatOff
		  else
		    return raiseEvent FormatOn
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu(target as Ptr)
		  #if targetCocoa
		    if target = nil then
		      return
		    end if
		    
		    declare function respondsToSelector lib CocoaLib selector "respondsToSelector:" (obj_id as Ptr, aSelector as Ptr) as Boolean
		    declare function selectedFont lib CocoaLib selector "selectedFont" (obj_id as Ptr) as Ptr
		    declare function traitsOfFont lib CocoaLib selector "traitsOfFont:" (obj_id as Ptr, aFont as Ptr) as Integer
		    declare function targetForAction lib CocoaLib selector "targetForAction:to:from:" (id as Ptr, anAction as Ptr, aTarget as Ptr, sender as Ptr) as Ptr
		    
		    if targetForAction(NSApp, Cocoa.NSSelectorFromString("changeFont:"), nil, nil) = nil then
		      self.Enabled = false
		      return
		    end if
		    
		    dim fontMgr as Ptr = target
		    dim font as Ptr = selectedFont(fontMgr)
		    if font <> nil then
		      declare function displayName lib CocoaLib selector "displayName" (obj_id as Ptr) as CFStringRef
		      dim fontName as String = displayName(font)
		      #pragma unused fontName
		      self.Checked = ((traitsOfFont(fontMgr, font) and raiseEvent FormatOn) = raiseEvent FormatOn)
		    else
		      self.Enabled = false
		    end if
		    
		  #else
		    #pragma unused target
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Function Target(menuItemRef as Ptr) As Ptr
		  #if targetCocoa
		    declare function sharedFontManager lib CocoaLib selector "sharedFontManager" (class_id as Ptr) as Ptr
		    
		    return sharedFontManager(Cocoa.NSClassFromString("NSFontManager"))
		  #endif
		  
		  #pragma unused menuItemRef
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function NSApp() As Ptr
		  #if targetCocoa
		    soft declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    soft declare function sharedApplication lib CocoaLib selector "sharedApplication" (class_id as Ptr) as Ptr
		    
		    return sharedApplication(NSClassFromString("NSApplication"))
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FormatOff() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FormatOn() As Integer
	#tag EndHook


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

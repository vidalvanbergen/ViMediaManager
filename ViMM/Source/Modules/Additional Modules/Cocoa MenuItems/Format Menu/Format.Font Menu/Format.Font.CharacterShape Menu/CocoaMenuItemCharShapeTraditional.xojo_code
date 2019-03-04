#tag Class
Protected Class CocoaMenuItemCharShapeTraditional
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "toggleTraditionalCharacterShape:"
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu(target as Ptr)
		  #if targetCocoa
		    'declare function selectedRange lib CocoaLib selector "selectedRange" (obj_id as Ptr) as Cocoa.NSRange
		    'declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    'declare function length lib CocoaLib selector "length" (obj_id as Ptr) as UInt32
		    'declare function attributedSubstringFromRange lib CocoaLib selector "attributedSubstringFromRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Ptr
		    'declare function getAttributeValue lib CocoaLib selector "attribute:atIndex:effectiveRange:" (obj_id as Ptr, name as Ptr, index as Integer, ByRef aRange as NSRange) as Ptr
		    'declare function getString lib CocoaLib selector "string" (obj_id as Ptr) as Ptr
		    'declare function CFRetain lib CocoaLib (cf as Ptr) as CFStringRef
		    'declare function integerValue lib CocoaLib selector "integerValue" (obj_id as Ptr) as Integer
		    'const NSCharacterShapeAttributeName = "NSCharacterShapeAttributeName"
		    'const kTraditionalCharactersSelector = 1
		    'dim range as Cocoa.NSRange = selectedRange(target)
		    'dim text as Ptr = textStorage(target)
		    'if text = nil then
		    'return
		    'end if
		    'dim textLength as UInt32 = length(text)
		    'dim b as CFBundle = CFBundle.NewCFBundleFromID("com.apple.Cocoa")
		    'dim valuePtr as Ptr = b.DataPointerNotRetained(NSCharacterShapeAttributeName)
		    'dim aRange as NSRange
		    'dim p as Ptr = getAttributeValue(text, valuePtr.Ptr(0), 0, aRange)
		    'self.Checked =  integerValue(p) = kTraditionalCharactersSelector
		    
		  #endif
		  
		  #pragma unused target
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Traditional Form", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Traditional Form"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Traditionelle Form"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE6\x97\xA7\xE5\xAD\x97\xE4\xBD\x93"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Forme traditionnelle"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Forma tradizionale"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Traditionele vorm"
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

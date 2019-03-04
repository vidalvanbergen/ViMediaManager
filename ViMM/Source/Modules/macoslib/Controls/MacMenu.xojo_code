#tag Class
Protected Class MacMenu
	#tag Method, Flags = &h0
		Sub Append(itemText as String)
		  #if TargetCarbon
		    if self.Ref = nil then
		      return
		    end if
		    
		    declare function AppendMenuItemTextWithCFString Lib CarbonLib (inMenu as Ptr, inString as CFStringRef, inAttributes as Integer, inCommandID as OSType, outNewItem as Ptr) as Integer
		    
		    dim OSError as Integer = AppendMenuItemTextWithCFString(self.Ref, itemText, 0, "", nil)
		    if OSError <> 0 then
		      MacOSError "Append", "AppendMenuItemTextWithCFString", OSError
		    end if
		  #else
		    #pragma unused itemText
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bold(index as Integer) As Boolean
		  return (TextBold and TextStyle(index)) = TextBold
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bold(index as Integer, assigns value as Boolean)
		  self.SetTextStyle index, TextBold, value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Checked(index as Integer) As Boolean
		  #if TargetCarbon
		    if self.Ref = nil then
		      return false
		    end if
		    
		    declare sub GetItemMark Lib CarbonLib (theMenu as Ptr, item as Int16, ByRef markChar as Int16)
		    
		    dim theMark as Int16
		    GetItemMark(self.Ref, index, theMark)
		    return theMark = kMenuCheckmarkGlyph
		  #else
		    #pragma unused index
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Checked(index as Integer, Assigns theValue as Boolean)
		  #if TargetCarbon
		    if self.Ref = nil then
		      return
		    end if
		    
		    declare sub CheckMenuItem Lib CarbonLib (theMenu as Ptr, item as Short, checked as Boolean)
		    
		    CheckMenuItem self.Ref, index, theValue
		  #else
		    #pragma unused index
		    #pragma unused theValue
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  #if TargetCarbon
		    soft declare function CreateNewMenu Lib CarbonLib (inMenuID as Int16, inMenuAttributes as Integer, ByRef outMenuRef as Ptr) as Integer
		    soft declare function ReleaseMenu Lib CarbonLib (theMenu as Ptr) as Integer
		    
		    dim theMenuRef as Ptr
		    dim OSError as Integer = CreateNewMenu(37, 0, theMenuRef)
		    if OSError <> 0 then
		      MacOSError "Constructor", "CreateNewMenu", OSError
		      return
		    end if
		    try
		      self.Constructor(theMenuRef)
		      
		    finally
		      if theMenuRef <> nil then
		        dim err as Integer = ReleaseMenu(theMenuRef)
		        if err = 0 then
		          theMenuRef = nil
		        else
		          MacOSError "Constructor", "ReleaseMenu", OSError
		        end if
		      end if
		    end try
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(menu as MacMenu)
		  #if TargetCarbon
		    if menu is nil or menu.Ref = nil then
		      return
		    end if
		    
		    soft declare function DuplicateMenu Lib CarbonLib (inSourceMenu as Ptr, ByRef outMenu as Ptr) as Integer
		    
		    dim newMenuRef as Ptr
		    dim OSError as Integer = DuplicateMenu(menu.Ref, newMenuRef)
		    if OSError<> 0 then
		      MacOSError "Constructor", "DuplicateMenu", OSError
		      return
		    end if
		    self.Constructor(newMenuRef)
		    
		  #else
		    #pragma unused menu
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(menuRef as Ptr)
		  #if targetCarbon
		    if menuRef = nil then
		      return
		    end if
		    
		    
		    soft declare function RetainMenu Lib CarbonLib (inMenu as Ptr) as Integer
		    
		    dim OSError as Integer = RetainMenu(menuRef)
		    if OSError = 0 then
		      self.Ref = menuRef
		      Open
		    else
		      MacOSError "Constructor", "RetainMenu", OSError
		    end if
		    
		  #else
		    #pragma unused menuRef
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  #if TargetCarbon
		    soft declare function CountMenuItems Lib CarbonLib (theMenu as Ptr) as Short //actually a UShort
		    
		    return CountMenuItems(self.Ref)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if TargetCarbon
		    if self.Ref = nil then
		      return
		    end if
		    
		    soft declare function ReleaseMenu Lib CarbonLib (theMenu as Ptr) as Integer
		    
		    dim OSError as Integer = ReleaseMenu(self.Ref)
		    if OSError <> 0 then
		      MacOSError "Destructor", "ReleaseMenu", OSError
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Enabled(index as Integer) As Boolean
		  #if TargetCarbon
		    soft declare function GetMenuItemAttributes Lib CarbonLib (menu as Ptr, item as Int16, ByRef outAttributes as Integer) as Integer
		    
		    dim hiAttributes as Integer
		    dim OSError as Integer = GetMenuItemAttributes(self.Ref, index, hiAttributes)
		    if OSError <> 0 then
		      MacOSError "GetEnabled", "GetMenuItemAttributes", OSError
		      return false
		    end if
		    return (hiAttributes and kMenuItemAttrDisabled) <> kMenuItemAttrDisabled
		    
		  #else
		    #pragma unused index
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Enabled(index as Integer, Assigns theValue as Boolean)
		  #if TargetCarbon
		    Declare Function ChangeMenuItemAttributes Lib CarbonLib (menu as Ptr, item as Int16, setTheseAttributes as Integer, clearTheseAttributes as Integer) as Integer
		    
		    
		    dim OSError as Integer
		    if theValue then
		      OSError = ChangeMenuItemAttributes(self.Ref, index, 0, kMenuItemAttrDisabled)
		    else
		      OSError = ChangeMenuItemAttributes(self.Ref, index, kMenuItemAttrDisabled, 0)
		    end if
		    if OSError <> 0 then
		      MacOSError "SetEnabled", "ChangeMenuItemAttributes", OSError
		    end if
		    
		  #else
		    #pragma unused index
		    #pragma unused theValue
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindMenu(parentMenu as MacMenu, menuID as Integer) As MacMenu
		  #if TargetCarbon
		    soft declare function GetMenuID Lib CarbonLib (menu as Ptr) as Short
		    
		    if GetMenuID(parentMenu.Ref) = menuID then
		      return parentMenu
		    else
		      for i as Integer = 1 to parentMenu.Count
		        if parentMenu.Submenu(i) <> nil then
		          dim theMenu as MacMenu = FindMenu(parentMenu.Submenu(i), menuID)
		          if theMenu <> nil then
		            return theMenu
		          end if
		        end if
		      next
		      return nil
		    end if
		    
		  #else
		    #pragma unused parentMenu
		    #pragma unused menuID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Icon(index as Integer, Assigns type as String)
		  #if TargetCarbon
		    soft declare function SetMenuItemIconHandle Lib CarbonLib (inMenu as Ptr, inItem as Short, inIconType as Integer, inIconHandle as OSType) as Short
		    
		    const kMenuSystemIconSelectorType = 8
		    
		    dim OSError as Integer = SetMenuItemIconHandle(self.Ref, index, kMenuSystemIconSelectorType, type)
		    if OSError <> 0 then
		      MacOSError "SetIcon", "SetMenuItemIconHandle", OSError
		    end if
		    
		  #else
		    #pragma unused index
		    #pragma unused type
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Indent(index as Integer) As Integer
		  #if TargetCarbon
		    soft declare function GetMenuItemIndent Lib CarbonLib (inMenu as Ptr, inItem as Short, ByRef outIndent as Integer) as Integer
		    
		    dim indentLevel as Integer
		    dim OSError as Integer = GetMenuItemIndent(self.Ref, index, indentLevel)
		    if OSError <> 0 then
		      MacOSError "GetIndent", "GetMenuItemIndent", OSError
		      return 0
		    end if
		    return indentLevel
		    
		  #else
		    #pragma unused index
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Indent(index as Integer, Assigns theValue as Integer)
		  #if TargetCarbon
		    if self.Ref = nil then
		      return
		    end if
		    
		    soft declare function SetMenuItemIndent Lib CarbonLib (inMenu as Ptr, inItem as Short, inIndent as Integer) as Integer
		    
		    dim OSError as Integer = SetMenuItemIndent(self.ref, index, theValue)
		    if OSError <> 0 then
		      MacOSError "SetIndent", "SetMenuItemIndent", OSError
		    end if
		    
		  #else
		    #pragma unused index
		    #pragma unused theValue
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(index as Integer, itemText as String)
		  #if TargetCarbon
		    if self.Ref = nil then
		      return
		    end if
		    
		    soft declare function InsertMenuItemTextWithCFString Lib CarbonLib (inMenu as Ptr, inString as CFStringRef, inAfterItem as Short, inAttributes as Integer, inCommandID as Integer) as Integer
		    
		    dim OSError as Integer = InsertMenuItemTextWithCFString(self.Ref,itemText, index - 1, 0, 0)
		    if OSError <> 0 then
		      MacOSError "Insert", "InsertMenuItemTextWithCFString", OSError
		    end if
		    
		  #else
		    #pragma unused index
		    #pragma unused itemText
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Italic(index as Integer) As Boolean
		  return (TextItalic and TextStyle(index)) = TextItalic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Italic(index as Integer, Assigns theValue as Boolean)
		  self.SetTextStyle index, TextItalic, theValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return self.Ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(index as Integer)
		  #if TargetCarbon
		    if self.Ref = nil then
		      return
		    end if
		    
		    soft declare sub DeleteMenuItem Lib CarbonLib (theMenu as Ptr, item as Short)
		    DeleteMenuItem self.Ref, index
		    
		  #else
		    #pragma unused index
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetTextStyle(index as Integer, styleFlag as Integer, value as Boolean)
		  #if TargetCarbon
		    
		    if self.Ref = nil then
		      return
		    end if
		    
		    dim style as UInt8 = self.TextStyle(index)
		    
		    soft declare sub SetItemStyle Lib CarbonLib (theMenu as Ptr, item as Short, chStyle as Short)
		    
		    if value then
		      SetItemStyle self.Ref, index, style or styleFlag
		    else
		      SetItemStyle self.Ref, index, style and (styleFlag xor &hffffffff)
		    end if
		    
		    
		    exception fnf as FunctionNotFoundException
		      //swallow
		      
		  #else
		    
		    #pragma unused index
		    #pragma unused styleFlag
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show(windowX as Integer, windowY as Integer)
		  #if TargetCarbon
		    soft declare function PopUpMenuSelect Lib CarbonLib (menu as Ptr, top as Short, left as Short, popupItem as Short) as Integer
		    soft declare sub LocalToGlobal Lib CarbonLib (pt as Ptr)
		    
		    dim point as new MemoryBlock(4)
		    point.Short(0) = windowY
		    point.Short(2) = windowX
		    LocalToGlobal point
		    
		    dim theSelection as Integer = PopUpMenuSelect(self.Ref, point.Short(0), point.Short(2), 1)
		    dim selectedMenu as MacMenu = self.FindMenu(self, theSelection\65536)
		    if selectedMenu <> nil then
		      Action selectedMenu, (theSelection mod 65536)
		    else
		      //
		    end if
		    
		  #else
		    #pragma unused windowX
		    #pragma unused windowY
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Submenu(index as Integer) As MacMenu
		  #if TargetCarbon
		    soft declare function GetMenuItemHierarchicalMenu Lib CarbonLib (inMenu as Ptr, inItem as Short, ByRef outHierMenu as Ptr) as Integer
		    
		    dim theSubmenuRef as Ptr
		    dim OSError as Integer = GetMenuItemHierarchicalMenu(self.Ref, index, theSubmenuRef)
		    if OSError <> 0 then
		      MacOSError "GetSubmenu", "GetMenuItemHierarchicalMenu", OSError
		      return nil
		    end if
		    if theSubmenuRef <> nil then
		      return new MacMenu(theSubmenuRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused index
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Submenu(index as Integer, Assigns theMenu as MacMenu)
		  #if TargetCarbon
		    if theMenu Is Nil or theMenu.Ref = nil then
		      return
		    end if
		    
		    soft declare function SetMenuItemHierarchicalMenu Lib CarbonLib (inMenu as Ptr, inItem as Short, inHierMenu as Ptr) as Integer
		    soft declare sub SetMenuID Lib CarbonLib (menu as Ptr, menuID as Short)
		    
		    dim OSError as Integer = SetMenuItemHierarchicalMenu(self.Ref, index, theMenu.Ref)
		    if OSError <> 0 then
		      MacOSError "SetSubmenu", "SetMenuItemHierarchicalMenu", OSError
		      return
		    end if
		    self.LastMenuIDAssigned = self.LastMenuIDAssigned + 1
		    SetMenuID theMenu.Ref, self.LastMenuIDAssigned
		    
		  #else
		    #pragma unused index
		    #pragma unused theMenu
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text(index as Integer) As String
		  #if TargetCarbon
		    soft declare function CopyMenuItemTextAsCFString Lib CarbonLib (inMenu as Ptr, inItem as Short, ByRef outString as Ptr) as Integer
		    
		    dim theText as Ptr
		    dim OSError as Integer = CopyMenuItemTextAsCFString(self.Ref, index, theText)
		    if OSError <> 0 then
		      MacOSError "GetText", "CopyMenuItemTextAsCFString", OSError
		      return ""
		    end if
		    return new CFString(theText, not CFString.hasOwnership)
		    
		  #else
		    #pragma unused index
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Text(index as Integer, assigns value as String)
		  #if TargetCarbon
		    soft declare function SetMenuItemTextWithCFString Lib CarbonLib (inMenu as Ptr, inItem as Short, inString as CFStringRef) as Integer
		    
		    dim OSError as Integer = SetMenuItemTextWithCFString(self.Ref, index, value)
		    if OSError <> 0 then
		      MacOSError "SetText", "SetMenuItemTextWithCFString", OSError
		    end if
		    
		  #else
		    #pragma unused index
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextFont() As String
		  #if TargetCarbon
		    Declare Function GetMenuFont Lib CarbonLib (menu as Ptr, outFontID as Ptr, outFontSize as Ptr) as Integer
		    Declare Function FMGetFontFamilyName Lib CarbonLib (iFontFamily as Short, oFontName as Ptr) as Integer
		    
		    dim fontID as new MemoryBlock(2)
		    dim fontSize as new MemoryBlock(2)
		    dim OSError as Integer = GetMenuFont(self.Ref, fontID, fontSize)
		    if OSError <> 0 then
		      MacOSError "GetTextFont", "GetMenuFont", OSError
		      return ""
		    end if
		    dim fontName as new MemoryBlock(256)
		    OSError = FMGetFontFamilyName(fontID.Short(0), fontName)
		    if OSError = 0 then
		      return DefineEncoding(fontName.PString(0), Encodings.SystemDefault)
		    else
		      MacOSError "GetTextFont", "FMGetFontFamilyName", OSError
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextFont(Assigns theValue as String)
		  #if TargetCarbon
		    soft declare function FMGetFontFamilyFromName Lib CarbonLib (iName as PString) as Short
		    soft declare function SetMenuFont Lib CarbonLib (menu as Ptr, inFontID as Short, inFontSize as Short) as Integer
		    
		    dim fontID as Integer
		    if theValue <> "" then
		      fontID = FMGetFontFamilyFromName(theValue)
		    else
		      fontID = 0
		    end if
		    dim OSError as Integer = SetMenuFont(self.Ref, fontID, self.TextSize)
		    if OSError <> 0 then
		      MacOSError "SetTextFont", "SetMenuFont", OSError
		    end if
		    
		  #else
		    #pragma unused theValue
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextSize() As Integer
		  #if TargetCarbon
		    Declare Function GetMenuFont Lib CarbonLib (menu as Ptr, outFontID as Ptr, outFontSize as Ptr) as Integer
		    Declare Function FMGetFontFamilyName Lib CarbonLib (iFontFamily as Short, oFontName as Ptr) as Integer
		    
		    dim fontID as new MemoryBlock(2)
		    dim fontSize as new MemoryBlock(2)
		    dim OSError as Integer = GetMenuFont(self.Ref, fontID, fontSize)
		    if OSError <> 0 then
		      MacOSError "GetTextSize", "GetMenuFont", OSError
		      return 0
		    end if
		    return fontSize.UShort(0)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextSize(Assigns theValue as Integer)
		  #if TargetCarbon
		    if (theValue <> 0) and ((theValue < 9) or (theValue > 24)) then
		      return
		    end if
		    
		    if self.Ref = nil then
		      return
		    end if
		    
		    declare function GetMenuFont Lib CarbonLib (menu as Ptr, ourFontID as Ptr, outFontSize as Ptr) as Integer
		    declare function SetMenuFont Lib CarbonLib (menu as Ptr, inFontID as Short, inFontSize as Short) as Integer
		    
		    dim fontID as new MemoryBlock(2)
		    dim fontSize as new MemoryBlock(2)
		    dim OSError as Integer = GetMenuFont(self.Ref, fontID, fontSize)
		    if OSError <> 0 then
		      MacOSError "SetTextSize", "GetMenuFont", OSError
		      return
		    end if
		    OSError = SetMenuFont(self.Ref, fontID.Short(0), theValue)
		    if OSError <> 0 then
		      MacOSError "SetTextSize", "SetMenuFont", OSError
		    end if
		    
		  #else
		    #pragma unused theValue
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextStyle(index as Integer) As Uint8
		  #if TargetCarbon
		    
		    if self.Ref = nil then
		      return 0
		    end if
		    
		    soft declare sub GetItemStyle Lib CarbonLib (theMenu as Ptr, item as Short, ByRef chStyle as UInt8)
		    
		    dim style as UInt8
		    GetItemStyle self.Ref, index, style
		    
		    return style
		    
		    exception fnf as FunctionNotFoundException
		      //swallow
		      
		  #else
		    
		    #pragma unused index
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Underline(index as Integer) As Boolean
		  return (TextUnderline and TextStyle(index)) = TextUnderline
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Underline(index as Integer, Assigns theValue as Boolean)
		  self.SetTextStyle index, TextUnderline, theValue
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action(theMenu as MacMenu, index as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MacOSError(MethodName as string, MacOSFunction as String, MacOSErrorCode as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Note, Name = Notes
		The index of the first menu item is 1.
		
		
		This version of MacMenu is part of HISearchField.
	#tag EndNote


	#tag Property, Flags = &h21
		Private LastMenuIDAssigned As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Ref As Ptr
	#tag EndProperty


	#tag Constant, Name = kMenuCheckmarkGlyph, Type = Double, Dynamic = False, Default = \"&h12", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMenuItemAttrDisabled, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = sizeOfStyle, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TextBold, Type = Double, Dynamic = False, Default = \"&h0001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TextItalic, Type = Double, Dynamic = False, Default = \"&h0002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TextUnderline, Type = Double, Dynamic = False, Default = \"&h0004", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

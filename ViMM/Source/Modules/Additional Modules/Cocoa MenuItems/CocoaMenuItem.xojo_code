#tag Class
Class CocoaMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  #if targetCocoa
		    declare sub setTag lib CocoaLib selector "setTag:" (obj_id as Ptr, value as Integer)
		    declare function sendAction lib CocoaLib selector "sendAction:to:from:" (id as Ptr, anAction as Ptr, aTarget as Ptr, sender as Ptr) as Boolean
		    
		    dim nsmenuitem as Ptr = GetNSMenuItem(self)
		    setTag nsmenuitem, raiseEvent CocoaTag
		    return not raiseEvent Action and sendAction(NSApp, self.ActionSelector, self.Target(nsmenuitem), nsmenuitem)
		  #endif
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  #if targetCocoa
		    declare sub setTarget lib CocoaLib selector "setTarget:" (obj_id as Ptr, anObject as Ptr)
		    declare sub setAction lib CocoaLib selector "setAction:" (obj_id as Ptr, anAction as Ptr)
		    declare sub setTag lib CocoaLib selector "setTag:" (obj_id as Ptr, value as Integer)
		    
		    declare function targetForAction lib CocoaLib selector "targetForAction:to:from:" (id as Ptr, anAction as Ptr, aTarget as Ptr, sender as Ptr) as Ptr
		    declare function respondsToSelector lib CocoaLib selector "respondsToSelector:" (obj_id as Ptr, aSelector as Ptr) as Boolean
		    declare function validateMenuItem lib CocoaLib selector "validateMenuItem:" (obj_id as Ptr, anItem as Ptr) as Boolean
		    declare function validateUserInterfaceItem lib CocoaLib selector "validateUserInterfaceItem:" (obj_id as Ptr, anItem as Ptr) as Boolean
		    
		    dim nsref as Ptr = GetNSMenuItem(self)
		    if nsref <> nil then
		      //I need to replace the NSMenuItem target and action to override Rb behavior.
		      setTarget nsref, self.Target(nsref)
		      setAction nsref, self.ActionSelector
		      setTag nsref, raiseEvent CocoaTag
		    end if
		    
		    dim T as Ptr
		    if self.Target(nsref) <> nil then
		      T = self.Target(nsref)
		    else
		      T = targetForAction(NSApp, self.ActionSelector, nil, nsref)
		    end if
		    
		    if T <> nil then
		      dim respondsTovalidateMenuItem as Boolean = respondsToSelector(T, Cocoa.NSSelectorFromString("validateMenuItem:"))
		      dim respondsTovalidateUserInterfaceItem as Boolean = respondsToSelector(T, Cocoa.NSSelectorFromString("validateUserInterfaceItem:"))
		      
		      if respondsTovalidateMenuItem or respondsTovalidateUserInterfaceItem then
		        dim menuItemValidated as Boolean = respondsTovalidateMenuItem and validateMenuItem(T, nsref)
		        dim userInterfaceItemValidated as Boolean = respondsTovalidateUserInterfaceItem and validateUserInterfaceItem(T, nsref)
		        self.Enabled = menuItemValidated or userInterfaceItemValidated
		      else
		        self.Enabled = true
		      end if
		    else
		      self.Enabled = false
		    end if
		    
		    raiseEvent EnableMenu(T)
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ActionSelector() As Ptr
		  #if TargetCocoa then
		    return Cocoa.NSSelectorFromString(raiseEvent ActionSelectorName)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetNSMenu(m as MenuItem) As Ptr
		  #if targetCocoa
		    declare function itemWithTitle lib CocoaLib selector "itemWithTitle:" (id as Ptr, aString as CFStringRef) as Ptr
		    declare function submenu lib CocoaLib selector "submenu" (id as Ptr) as Ptr
		    
		    if m is nil then
		      return nil
		    elseif m = App.MenuBar then
		      return MainMenu
		    else
		      dim parent_nsmenu as Ptr = GetNSMenu(GetParentOf(m))
		      return submenu(itemWithTitle(parent_nsmenu, m.Text.Replace("&","")))
		    end if
		    
		  #else
		    #pragma unused m
		  #endif
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetNSMenuItem(m as MenuItem) As Ptr
		  #if targetCocoa
		    declare function itemWithTitle lib CocoaLib selector "itemWithTitle:" (id as Ptr, aString as CFStringRef) as Ptr
		    
		    dim parent as MenuItem = GetParentOf(m)
		    dim parent_menu as Ptr = GetNSMenu(parent)
		    if parent_menu <> nil then
		      'dim foo as new NSObject(parent_menu)
		      'System.debugLog foo.Description
		      return itemWithTitle(parent_menu, m.Text.Replace("&",""))
		    end if
		    
		  #else
		    #pragma unused m
		  #endif
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetParentOf(theItem as MenuItem) As MenuItem
		  if theItem Is nil then
		    return nil
		  end if
		  if App.MenuBar Is nil then //I can't get started
		    return nil
		  end if
		  
		  dim parentStack(-1) as MenuItem
		  parentStack.Append App.MenuBar
		  
		  while UBound(parentStack) > -1
		    dim parent as MenuItem = parentStack.Pop
		    for i as Integer = 0 to parent.Count - 1
		      dim childItem as MenuItem = parent.Item(i)
		      if childItem = nil then
		        //the unthinkable has happened.
		        continue
		      end if
		      
		      if childItem = theItem then
		        return parent
		      else
		        if childItem.Count > 0 then
		          parentStack.Append childItem
		        end if
		      end if
		    next
		  wend
		  return nil //because no match was found.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MainMenu() As Ptr
		  #if targetCocoa
		    declare function mainMenu lib CocoaLib selector "mainMenu" (id as Ptr) as Ptr
		    
		    return mainMenu(NSApp)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NSApp() As Ptr
		  #if targetCocoa
		    declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    declare function sharedApplication lib CocoaLib selector "sharedApplication" (class_id as Ptr) as Ptr
		    
		    return sharedApplication(NSClassFromString("NSApplication"))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Target(menuItemRef as Ptr) As Ptr
		  return raiseEvent Target(menuitemRef)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ActionSelectorName() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CocoaTag() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EnableMenu(target as Ptr)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Target(menuItemRef as Ptr) As Ptr
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

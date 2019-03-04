#tag Class
Protected Class MenuItemWindowMenu
Inherits MenuItem
	#tag Method, Flags = &h21
		Private Sub AddNewWindowItems(mainMenu as Ptr, windowList() as Ptr)
		  #if targetCocoa
		    declare function isExcludedFromWindowsMenu lib CocoaLib selector "isExcludedFromWindowsMenu" (obj_id as Ptr) as Boolean
		    declare function addItem lib CocoaLib selector "addItemWithTitle:action:keyEquivalent:" (obj_id as Ptr, title as Ptr, action as Ptr, keyEquiv as CFStringRef) as Ptr
		    declare function itemWithTitle lib CocoaLib selector "itemWithTitle:" (id as Ptr, aString as CFStringRef) as Ptr
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    declare function target lib CocoaLib selector "target" (obj_id as Ptr) as Ptr
		    declare sub setTarget lib CocoaLib selector "setTarget:" (obj_id as Ptr, value as Ptr)
		    declare function title lib CocoaLib selector "title" (obj_id as Ptr) as Ptr
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    declare function submenu lib CocoaLib selector "submenu" (id as Ptr) as Ptr
		    declare sub setState lib CocoaLib selector "setState:" (obj_id as Ptr, value as Integer)
		    declare function isMainWindow lib CocoaLib selector "isMainWindow" (obj_id as Ptr) as Boolean
		    declare function viewsNeedDisplay lib CocoaLib selector "viewsNeedDisplay" (obj_id as Ptr) as Boolean
		    
		    dim windowsMenu as Ptr = submenu(itemWithTitle(mainMenu, self.Text.Replace("&","")))
		    if windowsMenu = nil then
		      return
		    end if
		    
		    dim d as new Dictionary
		    dim windowNSMenuItems as new CFArray(itemArray(windowsMenu), not CFArray.hasOwnership)
		    for i as Integer = 0 to windowNSMenuItems.Count - 1
		      dim itemTarget as Ptr = target(windowNSMenuItems.Value(i))
		      if itemTarget <> nil then
		        d.Value(itemTarget) = nil
		      end if
		    next
		    
		    
		    for each w as Ptr in windowList
		      //Apple recommends not to display Panels in the Window menu.
		      //We must also block Cocoa autocompletion windows (in fact, any non-RBNSWindow should be blocked)
		      if not (d.HasKey(w) OR isExcludedFromWindowsMenu(w) OR Cocoa.InheritsFromClass( w, "NSPanel" ) OR Cocoa.InheritsFromClass( w, "NSTextViewCompletionWindow" ) OR viewsNeedDisplay(w)) then
		        //make new item
		        dim newItem as Ptr = addItem(windowsMenu, title(w), Cocoa.NSSelectorFromString("makeKeyAndOrderFront:"), "")
		        setTarget(newItem, w)
		        if isMainWindow(w) then
		          setState(newItem, NSOnState)
		        else
		          setState(newItem, NSOffState)
		        end if
		        d.Value(w) = nil
		      end if
		    next
		    
		  #else
		    #pragma unused mainMenu
		    #pragma unused windowList
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  super.Constructor
		  dim obv as new NotificationObserver
		  obv.Register("NSMenuDidBeginTrackingNotification")
		  AddHandler obv.HandleNotification, WeakAddressOf HandleDidBeginTracking
		  self.Observer = obv
		  
		  
		  self.windowClosingObserver = new NotificationObserver
		  self.windowClosingObserver.Register("NSWindowWillCloseNotification")
		  AddHandler windowClosingObserver.HandleNotification, WeakAddressOf HandleWindowWillClose
		  
		  self.windowMiniaturizeObserver = new NotificationObserver
		  self.windowMiniaturizeObserver.Register("NSWindowDidDeminiaturizeNotification")
		  self.windowMiniaturizeObserver.Register("NSWindowDidMiniaturizeNotification")
		  AddHandler windowMiniaturizeObserver.HandleNotification, WeakAddressOf HandleWindowMiniaturize
		  
		  self.windowDidBecomeMainObserver = new NotificationObserver
		  self.windowDidBecomeMainObserver.Register("NSWindowDidBecomeMainNotification")
		  AddHandler windowDidBecomeMainObserver.HandleNotification, WeakAddressOf HandleWindowDidBecomeMain
		  
		  self.windowDidResignMainObserver = new NotificationObserver
		  self.windowDidResignMainObserver.Register("NSWindowDidResignMainNotification")
		  AddHandler windowDidResignMainObserver.HandleNotification, WeakAddressOf HandleWindowDidResignMain
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindMenuItemByTarget(t as Ptr) As Ptr
		  //finds first item in windows menu whose target = t, if target argument is non-nil.
		  
		  #if targetCocoa
		    if t = nil then
		      return nil
		    end if
		    
		    declare function itemWithTitle lib CocoaLib selector "itemWithTitle:" (id as Ptr, aString as CFStringRef) as Ptr
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    declare function target lib CocoaLib selector "target" (obj_id as Ptr) as Ptr
		    
		    dim wMenu as Ptr = windowsMenu
		    if wMenu = nil then
		      return nil
		    end if
		    
		    dim theItem as Ptr = nil
		    dim windowNSMenuItems as new CFArray(itemArray(windowsMenu), not CFArray.hasOwnership)
		    for i as Integer = 0 to windowNSMenuItems.Count - 1
		      dim item as Ptr = windowNSMenuItems.Value(i)
		      if target(item) = t then
		        theItem = item
		        exit
		      end if
		    next
		    return theItem
		    
		  #else
		    #pragma unused t
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidBeginTracking(observer as NotificationObserver, notification as NSNotification)
		  if notification = nil then
		    return
		  end if
		  
		  #if TargetCocoa then
		    AddNewWindowItems(notification.AssociatedObject, self.Windows)
		  #endif
		  
		  #pragma unused observer
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWindowDidBecomeMain(observer as NotificationObserver, notification as NSNotification)
		  #if targetCocoa
		    if notification = nil then
		      return
		    end if
		    
		    //it's possible that the window has been excluded from the windows menu.  In this case, no
		    //menu item will be matched in SetStateOfMenuItemForTarget and so nothing will happen.
		    //testing for this case requires more code and thus more chance for bugs.  The current implementation
		    //simply burns a few cycles for windows excluded from the windows menu.
		    SetStateOfMenuItemForTarget(notification.AssociatedObject, NSOnState)
		    
		  #else
		    #pragma unused notification
		  #endif
		  
		  #pragma unused observer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWindowDidResignMain(observer as NotificationObserver, notification as NSNotification)
		  #if targetCocoa
		    if notification = nil then
		      return
		    end if
		    
		    //it's possible that the window has been excluded from the windows menu.  In this case, no
		    //menu item will be matched in SetStateOfMenuItemForTarget and so nothing will happen.
		    //testing for this case requires more code and thus more chance for bugs.  The current implementation
		    //simply burns a few cycles for windows excluded from the windows menu.
		    
		    SetStateOfMenuItemForTarget(notification.AssociatedObject, NSOffState)
		    
		  #else
		    #pragma unused notification
		  #endif
		  
		  #pragma unused observer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWindowMiniaturize(observer as NotificationObserver, notification as NSNotification)
		  #if targetCocoa
		    if notification = nil then
		      return
		    end if
		    
		    declare function isMiniaturized lib CocoaLib selector "isMiniaturized" (obj_id as Ptr) as Boolean
		    declare sub setState lib CocoaLib selector "setState:" (obj_id as Ptr, value as Integer)
		    declare function state lib CocoaLib selector "state" (obj_id as Ptr) as Integer
		    declare sub setMixedStateImage lib CocoaLib selector "setMixedStateImage:" (obj_id as Ptr, itemImage as Ptr)
		    'declare function _NSGetThemeImage lib CocoaLib (num as Integer) as Ptr
		    
		    dim wItem as Ptr = FindMenuItemByTarget(notification.AssociatedObject)
		    if wItem <> nil then
		      if isMiniaturized(notification.AssociatedObject) then
		        //beware that m_NSGetThemeImage is private API.  This code may get your app rejected from the App Store.
		        setState(wItem, NSMixedState)
		        'setMixedStateImage(wItem, _NSGetThemeImage(155))
		      else
		        if state(wItem) = NSMixedState then
		          setState(wItem, NSOffState)
		        end if
		        setMixedStateImage(wItem, NSImage.MenuMixedStateTemplate)
		      end if
		      
		    else
		      //it's possible that the window has been excluded from windows menu. I could check first, I suppose.
		    end if
		    
		  #else
		    #pragma unused notification
		  #endif
		  
		  #pragma unused observer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWindowWillClose(observer as NotificationObserver, notification as NSNotification)
		  #if targetCocoa
		    if notification = nil then
		      return
		    end if
		    
		    declare function itemWithTitle lib CocoaLib selector "itemWithTitle:" (id as Ptr, aString as CFStringRef) as Ptr
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    declare function target lib CocoaLib selector "target" (obj_id as Ptr) as Ptr
		    declare function submenu lib CocoaLib selector "submenu" (id as Ptr) as Ptr
		    declare sub removeItem lib CocoaLib selector "removeItem:" (obj_id as Ptr, item as Ptr)
		    declare function mainMenu lib CocoaLib selector "mainMenu" (id as Ptr) as Ptr
		    
		    dim windowsMenu as Ptr = submenu(itemWithTitle(mainMenu(NSApplication.App), self.Text.Replace("&","")))
		    if windowsMenu = nil then
		      return
		    end if
		    
		    dim w as Ptr = notification.AssociatedObject
		    dim windowNSMenuItems as new CFArray(itemArray(windowsMenu), not CFArray.hasOwnership)
		    for i as Integer = 0 to windowNSMenuItems.Count - 1
		      dim item as Ptr = windowNSMenuItems.Value(i)
		      if target(item) = w then
		        removeItem(windowsMenu, item)
		        exit
		      end if
		    next
		    
		  #else
		    #pragma unused notification
		  #endif
		  
		  #pragma unused observer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStateOfMenuItemForTarget(t as Ptr, state as Integer)
		  #if targetCocoa
		    
		    declare sub setState lib CocoaLib selector "setState:" (obj_id as Ptr, value as Integer)
		    
		    setState(FindMenuItemByTarget(t), state)
		    
		  #else
		    #pragma unused t
		    #pragma unused state
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Windows() As Ptr()
		  #if targetCocoa
		    dim windowList as CFArray = NSApplication.App.Windows
		    
		    dim L() as Ptr
		    for i as Integer = 0 to windowList.Count - 1
		      L.Append windowList.Value(i)
		    next
		    return L
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function windowsMenu() As Ptr
		  #if targetCocoa
		    declare function mainMenu lib CocoaLib selector "mainMenu" (id as Ptr) as Ptr
		    declare function itemWithTitle lib CocoaLib selector "itemWithTitle:" (id as Ptr, aString as CFStringRef) as Ptr
		    declare function submenu lib CocoaLib selector "submenu" (id as Ptr) as Ptr
		    
		    return submenu(itemWithTitle(mainMenu(NSApplication.App), self.Text.Replace("&","")))
		  #endif
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private observer As NotificationObserver
	#tag EndProperty

	#tag Property, Flags = &h21
		Private windowClosingObserver As NotificationObserver
	#tag EndProperty

	#tag Property, Flags = &h21
		Private windowDidBecomeMainObserver As NotificationObserver
	#tag EndProperty

	#tag Property, Flags = &h21
		Private windowDidResignMainObserver As NotificationObserver
	#tag EndProperty

	#tag Property, Flags = &h21
		Private windowMiniaturizeObserver As NotificationObserver
	#tag EndProperty


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Window", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Window"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Finestra"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Fenster"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fen\xC3\xAAtre"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Venster"
	#tag EndConstant

	#tag Constant, Name = NSMixedState, Type = Double, Dynamic = False, Default = \"-1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSOffState, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSOnState, Type = Double, Dynamic = False, Default = \"1", Scope = Private
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

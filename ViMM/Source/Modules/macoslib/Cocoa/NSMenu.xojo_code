#tag Class
Class NSMenu
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Append(newMenuItem as NSMenuItem)
		  #if TargetMacOS
		    declare sub addItem lib CocoaLib selector "addItem:" (id as Ptr, item as Ptr)
		    
		    addItem   me.id, newMenuItem.id
		    newMenuItem.Enabled = true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Append(title as String, action as String = "", keyEquiv as String = "") As NSMenuItem
		  
		  #if TargetMacOS
		    declare function addItemWithTitle lib CocoaLib selector "addItemWithTitle:action:keyEquivalent:" _
		    (obj_id as Ptr, aString as CFStringRef, aSelector as Ptr, keyEquiv as CFStringRef) as Ptr
		    
		    dim itemRef as Ptr = addItemWithTitle(self, title, Cocoa.NSSelectorFromString(action), keyEquiv)
		    if itemRef <> nil then
		      return new NSMenuItem(itemRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused title
		    #pragma unused action
		    #pragma unused keyEquiv
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelTracking()
		  
		  #if TargetMacOS
		    declare sub cancelTracking lib CocoaLib selector "cancelTracking" (obj_id as Ptr)
		    
		    cancelTracking(self)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelTrackingWithoutAnimation()
		  
		  #if TargetMacOS
		    if IsSnowLeopard then
		      declare sub cancelTrackingWithoutAnimation lib CocoaLib selector "cancelTrackingWithoutAnimation" (obj_id as Ptr)
		      
		      cancelTrackingWithoutAnimation(self)
		    else
		      self.CancelTracking
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetCocoa
		    me.Constructor( "" )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(RSMenu as MenuItem)
		  //This method is really basic and adapted only to local menus without submenus
		  
		  #if TargetMacOS
		    dim mi as NSMenuItem
		    
		    me.Constructor( RSMenu.Text )
		    
		    for i as integer=0 to RSMenu.Count - 1
		      mi = NSMenuItem.CreateFromMenuItem( RSMenu.Item( i ) )
		      mi.Enabled = true
		      me.Append   mi
		    next
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(title as String)
		  #if targetCocoa
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:" (obj_id as Ptr, title as CFStringRef) as Ptr
		    
		    dim menuRef as Ptr = initWithTitle(Allocate("NSMenu"), title)
		    self.Constructor(menuRef, NSObject.hasOwnership)
		    
		    me.AutoEnablesItems = false
		    
		    SetDelegate
		  #else
		    #pragma unused title
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_menuDidClose(id as Ptr, sel as Ptr, menu as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSMenu = NSMenu(w.Value)
		    if obj <> nil then
		      obj.HandleDidClose(new NSMenu(menu))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_menuHasKeyEquivalentForEventTargetAction(id as Ptr, sel as Ptr, menu as Ptr, theEvent as Ptr, target as Ptr, action as Ptr) As Boolean
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSMenu = NSMenu(w.Value)
		    if obj <> nil then
		      return obj.HandleHasKeyEquivalentForEventTargetAction(new NSMenu(menu), new NSEvent(theEvent), target, action)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_menuNeedsUpdate(id as Ptr, sel as Ptr, menu as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSMenu = NSMenu(w.Value)
		    if obj <> nil then
		      obj.HandleNeedsUpdate(new NSMenu(menu))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_menuWillHighlightItem(id as Ptr, sel as Ptr, menu as Ptr, menuItem as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSMenu = NSMenu(w.Value)
		    if obj <> nil then
		      obj.HandleWillHighlightItem(new NSMenu(menu), new NSMenuItem(menuItem))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_menuWillOpen(id as Ptr, sel as Ptr, menu as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSMenu = NSMenu(w.Value)
		    if obj <> nil then
		      obj.HandleWillOpen(new NSMenu(menu))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_numberOfItemsInMenu(id as Ptr, sel as Ptr, menu as Ptr) As Integer
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSMenu = NSMenu(w.Value)
		    if obj <> nil then
		      return obj.HandleNumberOfItemsInMenu(new NSMenu(menu))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidClose(menu as NSMenu)
		  
		  if SelectedMenuItem <> nil then
		    RaiseEvent MenuAction( menu, SelectedMenuItem )
		    SelectedMenuItem = Nil
		  end if
		  
		  RaiseEvent DidClose( menu )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleHasKeyEquivalentForEventTargetAction(menu as NSMenu, theEvent as NSEvent, target as Ptr, action as Ptr) As Boolean
		  return RaiseEvent HasKeyEquivalentForEventTargetAction( menu, theEvent, target, action )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleNeedsUpdate(menu as NSMenu)
		  
		  RaiseEvent NeedsUpdate( menu )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleNumberOfItemsInMenu(menu as NSMenu) As Integer
		  
		  return RaiseEvent NumberOfItemsInMenu( menu )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillHighlightItem(Menu as NSMenu, Item as NSMenuItem)
		  
		  SelectedMenuItem = item
		  RaiseEvent WillHighlightItem( menu, item )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillOpen(menu as NSMenu)
		  RaiseEvent WillOpen( menu )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HighlightedItem() As NSMenuItem
		  
		  #if TargetMacOS
		    declare function highlightedItem lib CocoaLib selector "highlightedItem" (obj_id as Ptr) as Ptr
		    
		    dim itemRef as Ptr = highlightedItem(self)
		    if itemRef <> nil then
		      return new NSMenuItem(itemRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(item as NSMenuItem) As Integer
		  
		  #if TargetMacOS
		    declare function indexOfItem lib CocoaLib selector "indexOfItem:" (obj_id as Ptr, item as Ptr) as Integer
		    
		    dim itemRef as Ptr
		    if item <> nil then
		      itemRef = item
		    end if
		    return indexOfItem(self, itemRef)
		    
		  #else
		    #pragma unused item
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithRepresentedObject(anObject as Ptr) As Integer
		  
		  #if TargetMacOS
		    declare function indexOfItemWithRepresentedObject lib CocoaLib selector "indexOfItemWithRepresentedObject:" (obj_id as Ptr, anObj as Ptr) as Integer
		    
		    return indexOfItemWithRepresentedObject(self, anObject)
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithSubmenu(aMenu as NSMenu) As Integer
		  
		  #if TargetMacOS
		    declare function indexOfItemWithSubmenu lib CocoaLib selector "indexOfItemWithSubmenu:" (obj_id as Ptr, anObj as Ptr) as Integer
		    
		    dim menuRef as Ptr
		    if aMenu <> nil then
		      menuRef = aMenu
		    end if
		    return indexOfItemWithSubmenu(self, menuRef)
		    
		  #else
		    #pragma unused aMenu
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTag(tag as Integer) As Integer
		  
		  #if TargetMacOS
		    declare function indexOfItemWithTag lib CocoaLib selector "indexOfItemWithTag:" (obj_id as Ptr, aTag as Integer) as Integer
		    
		    return indexOfItemWithTag(self, tag)
		    
		  #else
		    #pragma unused tag
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTarget(anObject as Ptr, actionSelector as String = "") As Integer
		  
		  #if TargetMacOS
		    declare function indexOfItemWithTarget lib CocoaLib selector "indexOfItemWithTarget:andAction:" (obj_id as Ptr, anObj as Ptr, actionSel as Ptr) as Integer
		    
		    return indexOfItemWithTarget(self, anObject, Cocoa.NSSelectorFromString(actionSelector))
		    
		  #else
		    #pragma unused anObject
		    #pragma unused actionSelector
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTitle(title as String) As Integer
		  
		  #if TargetMacOS
		    declare function indexOfItemWithTitle lib CocoaLib selector "indexOfItemWithTitle:" (obj_id as Ptr, aTitle as CFStringRef) as Integer
		    
		    return indexOfItemWithTitle(self, title)
		    
		  #else
		    #pragma unused title
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(item as NSMenuItem, index as Integer)
		  
		  #if TargetMacOS
		    declare sub insertItem lib CocoaLib selector "insertItem:atIndex:" (obj_id as Ptr, newItem as Ptr, index as Integer)
		    
		    dim itemRef as Ptr
		    if item <> nil then
		      itemRef = item
		    end if
		    insertItem(self, itemRef, index)
		    
		  #else
		    #pragma unused item
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Insert(title as String, index as Integer, action as String = "", keyEquiv as String = "") As NSMenuItem
		  
		  #if TargetMacOS
		    declare function insertItemWithTitle lib CocoaLib selector "insertItemWithTitle:action:keyEquivalent:atIndex:" _
		    (obj_id as Ptr, aString as CFStringRef, aSelector as Ptr, keyEquiv as CFStringRef, index as Integer) as Ptr
		    
		    dim itemRef as Ptr = insertItemWithTitle(self, title, Cocoa.NSSelectorFromString(action), keyEquiv, index)
		    if itemRef <> nil then
		      return new NSMenuItem(itemRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused title
		    #pragma unused action
		    #pragma unused keyEquiv
		    #pragma unused index
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(itemIndex as integer) As NSMenuItem
		  #if TargetMacOS
		    declare function itemAtIndex lib CocoaLib selector "itemAtIndex:" (id as Ptr, idx as integer) as Ptr
		    
		    dim p as Ptr = itemAtIndex( me.id, itemIndex )
		    
		    if p<>nil then
		      return   new NSMenuItem( p, false )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Items() As NSMenuItem()
		  
		  #if TargetMacOS
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    
		    dim retArray() as NSMenuItem
		    
		    dim arrayRef as Ptr = itemArray(self)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSMenuItem(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemWithTag(tag as Integer) As NSMenuItem
		  
		  #if TargetMacOS
		    declare function itemWithTag lib CocoaLib selector "itemWithTag:" (obj_id as Ptr, aTag as Integer) as Ptr
		    
		    dim itemPtr as Ptr = itemWithTag(self, tag)
		    if itemPtr <> nil then
		      return new NSMenuItem(itemPtr)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused tag
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemWithTitle(title as String) As NSMenuItem
		  
		  #if TargetMacOS
		    declare function itemWithTitle lib CocoaLib selector "itemWithTitle:" (obj_id as Ptr, aString as CFStringRef) as Ptr
		    
		    dim itemPtr as Ptr = itemWithTitle(self, title)
		    if itemPtr <> nil then
		      return new NSMenuItem(itemPtr)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused title
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append "menuHasKeyEquivalent:forEvent:target:action:" : CType( AddressOf delegate_menuHasKeyEquivalentForEventTargetAction, Ptr ) : "B@:@@@@"
		    'methodList.Append "confinementRectForMenu:onScreen:" : CType( AddressOf delegate_confinementRectForMenuOnScreen, Ptr ) : "#@:@@"
		    methodList.Append "menu:willHighlightItem:" : CType( AddressOf delegate_menuWillHighlightItem, Ptr ) : "v@:@@"
		    methodList.Append "menuWillOpen:" : CType( AddressOf delegate_menuWillOpen, Ptr ) : "v@:@"
		    methodList.Append "menuDidClose:" : CType( AddressOf delegate_menuDidClose, Ptr ) : "v@:@"
		    methodList.Append "numberOfItemsInMenu:" : CType( AddressOf delegate_numberOfItemsInMenu, Ptr ) : "i@:@"
		    methodList.Append "menuNeedsUpdate:" : CType( AddressOf delegate_menuNeedsUpdate, Ptr ) : "v@:@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList)
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformActionForItemAtIndex(index as Integer)
		  
		  #if TargetMacOS
		    declare sub performActionForItemAtIndex lib CocoaLib selector "performActionForItemAtIndex:" (obj_id as Ptr, index as Integer)
		    
		    performActionForItemAtIndex(self, index)
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PerformKeyEquivalent(theEvent as NSEvent) As Boolean
		  
		  #if TargetMacOS
		    declare function performKeyEquivalent lib CocoaLib selector "performKeyEquivalent:" (obj_id as Ptr, theEvent as Ptr) as Boolean
		    
		    dim eventRef as Ptr
		    if theEvent <> nil then
		      eventRef = theEvent
		    end if
		    return performKeyEquivalent(self, eventRef)
		    
		  #else
		    #pragma unused theEvent
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PopUpMenuPositioningItem(item as NSMenuItem, location as Cocoa.NSPoint, view as Ptr) As Boolean
		  
		  #if TargetMacOS
		    if IsSnowLeopard then
		      declare function popUpMenuPositioningItem lib CocoaLib selector "popUpMenuPositioningItem:atLocation:inView:" _
		      (obj_id as Ptr, item as Ptr, location as Cocoa.NSPoint, view as Ptr) as Boolean
		      
		      dim itemRef as Ptr
		      if item <> nil then
		        itemRef = item
		      end if
		      
		      return popUpMenuPositioningItem(self, itemRef, location, view)
		      
		    end if
		  #else
		    #pragma unused item
		    #pragma unused location
		    #pragma unused view
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(index as Integer)
		  
		  #if TargetMacOS
		    declare sub removeItemAtIndex lib CocoaLib selector "removeItemAtIndex:" (obj_id as Ptr, index as Integer)
		    
		    removeItemAtIndex(self, index)
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(item as NSMenuItem)
		  
		  #if TargetMacOS
		    declare sub removeItem lib CocoaLib selector "removeItem:" (obj_id as Ptr, anItem as Ptr)
		    
		    dim itemRef as Ptr
		    if item <> nil then
		      itemRef = item
		    end if
		    
		    removeItem(self, itemRef)
		    
		  #else
		    #pragma unused item
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAll()
		  
		  #if TargetMacOS
		    if IsSnowLeopard then
		      declare sub removeAllItems lib CocoaLib selector "removeAllItems" (obj_id as Ptr)
		      
		      removeAllItems(self)
		      
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAutoEnable(YesNo as Boolean)
		  #if TargetMacOS
		    declare sub setAutoenablesItems lib CocoaLib selector "setAutoenablesItems:" (id as Ptr, value as Boolean)
		    
		    setAutoenablesItems   me.id, YesNo
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSubmenu(aMenu as NSMenu, anItem as NSMenuItem)
		  
		  #if TargetMacOS
		    declare sub setSubmenu lib CocoaLib selector "setSubmenu:forItem:" (obj_id as Ptr, aMenu as Ptr, anItem as Ptr)
		    
		    dim itemRef as Ptr
		    if anItem <> nil then
		      itemRef = anItem
		    end if
		    
		    dim menuRef as Ptr
		    if aMenu <> nil then
		      menuRef = aMenu
		    end if
		    
		    setSubmenu(self, menuRef, itemRef)
		    
		  #else
		    #pragma unused aMenu
		    #pragma unused anItem
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As Cocoa.NSSize
		  
		  #if TargetMacOS
		    if IsSnowLeopard then
		      declare function size lib CocoaLib selector "size" (obj_id as Ptr) as Cocoa.NSSize
		      
		      return size(self)
		      
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Supermenu() As NSMenu
		  
		  #if TargetMacOS
		    declare function supermenu lib CocoaLib selector "supermenu" (obj_id as Ptr) as Ptr
		    
		    dim menuRef as Ptr = supermenu(self)
		    if menuRef <> nil then
		      return new NSMenu(menuRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  
		  #if TargetMacOS
		    declare sub update lib CocoaLib selector "update" (obj_id as Ptr)
		    
		    update(self)
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidClose(menu as NSMenu)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HasKeyEquivalentForEventTargetAction(menu as NSMenu, theEvent as NSEvent, target as Ptr, action as Ptr) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MenuAction(menu as NSMenu, hitItem as NSMenuItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NeedsUpdate(menu as NSMenu)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NumberOfItemsInMenu(menu as NSMenu) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillHighlightItem(Menu as NSMenu, Item as NSMenuItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillOpen(menu as NSMenu)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    if IsSnowLeopard then
			      declare function allowsContextMenuPlugIns lib CocoaLib selector "allowsContextMenuPlugIns" (obj_id as Ptr) as Boolean
			      
			      return allowsContextMenuPlugIns(self)
			      
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    if IsSnowLeopard then
			      declare sub setAllowsContextMenuPlugIns lib CocoaLib selector "setAllowsContextMenuPlugIns:" (obj_id as Ptr, flag as Boolean)
			      
			      setAllowsContextMenuPlugIns(self, value)
			      
			    end if
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AllowsContextMenuPlugIns As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function autoenablesItems lib CocoaLib selector "autoenablesItems" (obj_id as Ptr) as Boolean
			    
			    return autoenablesItems(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAutoenablesItems lib CocoaLib selector "setAutoenablesItems:" (obj_id as Ptr, flag as Boolean)
			    
			    setAutoenablesItems(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AutoenablesItems As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function numberOfItems lib CocoaLib selector "numberOfItems" ( id as Ptr ) as integer
			    
			    return  numberOfItems(self)
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    if IsSnowLeopard then
			      declare function font lib CocoaLib selector "font" (obj_id as Ptr) as Ptr
			      
			      dim fontPtr as Ptr = font(self)
			      if fontPtr <> nil then
			        return new NSFont(fontPtr)
			      else
			        return nil
			      end if
			      
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    if IsSnowLeopard then
			      declare sub setFont lib CocoaLib selector "setFont:" (obj_id as Ptr, aFont as Ptr)
			      
			      setFont(self, value)
			      
			    end if
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Font As NSFont
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isTornOff lib CocoaLib selector "isTornOff" (obj_id as Ptr) as Boolean
			    
			    return isTornOff(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsTornOff As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function menuBarHeight lib CocoaLib selector "menuBarHeight" (obj_id as Ptr) as Double
			    
			    return menuBarHeight(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		MenuBarHeight As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function menuBarVisible lib CocoaLib selector "menuBarVisible" (obj_id as Ptr) as Boolean
			    
			    return menuBarVisible(Cocoa.NSClassFromString("NSMenu"))
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setMenuBarVisible lib CocoaLib selector "setMenuBarVisible:" (obj_id as Ptr, visible as Boolean)
			    
			    setMenuBarVisible(Cocoa.NSClassFromString("NSMenu"), value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Shared MenuBarVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function menudelegate Lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
			    
			    return menudelegate(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setDelegate Lib CocoaLib selector "setDelegate:" (obj_id as Ptr, delegateID as Ptr)
			    
			    setDelegate(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MenuDelegate As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    if IsSnowLeopard then
			      declare function minimumWidth lib CocoaLib selector "minimumWidth" (obj_id as Ptr) as Double
			      
			      return minimumWidth(self)
			      
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    if IsSnowLeopard then
			      declare sub setMinimumWidth lib CocoaLib selector "setMinimumWidth:" (obj_id as Ptr, width as Double)
			      
			      setMinimumWidth(self, value)
			      
			    end if
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MinimumWidth As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SelectedMenuItem As NSMenuItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function showsStateColumn lib CocoaLib selector "showsStateColumn" (obj_id as Ptr) as Boolean
			    
			    return showsStateColumn(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setShowsStateColumn lib CocoaLib selector "setShowsStateColumn:" (obj_id as Ptr, flag as Boolean)
			    
			    setShowsStateColumn(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ShowsStateColumn As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function supermenu lib CocoaLib selector "supermenu" (obj_id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = supermenu(self)
			    if menuRef <> nil then
			      return new NSMenu(menuRef)
			    else
			      return nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setSupermenu lib CocoaLib selector "setSupermenu:" (obj_id as Ptr, aSupermenu as Ptr)
			    
			    dim menuRef as Ptr
			    if value <> nil then
			      menuRef = value
			    end if
			    
			    setSupermenu(self, menuRef)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Supermenu As NSMenu
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function title lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			    
			    return title(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, aString as CFStringRef)
			    
			    setTitle(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSMenuItem", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowsContextMenuPlugIns"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoenablesItems"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsTornOff"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuBarHeight"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumWidth"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsStateColumn"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
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
	#tag EndViewBehavior
End Class
#tag EndClass

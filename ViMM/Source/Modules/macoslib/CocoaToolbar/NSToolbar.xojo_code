#tag Class
Class NSToolbar
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddItem(t as NSToolbarItemInterface)
		  
		  // Add a new toolbar item to the list of possible items in this toolbar
		  
		  if t <> nil and t.ActionHandler = nil then
		    // set the item action to the HandleItemActions method
		    t.ActionHandler = WeakAddressOf HandleItemActions
		  end if
		  
		  // keep a reference to the item
		  ToolbarItems.value(NSToolbarItem(t).itemIdentifier) = t
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllowedItems() As String()
		  
		  // returns an array of identifiers allowed in this toolbar
		  
		  dim items() as String
		  dim n as Integer = mAllowedItems.Count-1
		  
		  for i as Integer = 0 to n
		    items.append new CFString(mAllowedItems.Value(i), CFType.hasOwnership)
		  next
		  
		  return items
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AllowedItems(assigns items() as String)
		  
		  // sets an array of identifiers allowed in this toolbar
		  
		  mAllowedItems = new NSArray(items)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  
		  // a static dictionary for delegates
		  
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConfigurationDictionary() As NSDictionary
		  
		  // return a dictionary with the toolbar configuration (size, mode, etc.)
		  
		  #if targetCocoa
		    declare function configurationDictionary Lib CocoaLib selector "configurationDictionary" (obj_id as Ptr) as Ptr
		    
		    return new NSDictionary(configurationDictionary(self), false)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(identifierString as String, itemActionHandler as ActionDelegate)
		  
		  // constructor
		  
		  #if targetCocoa
		    declare function initWithIdentifier Lib CocoaLib selector "initWithIdentifier:" (obj_id as Ptr, identifier as CFStringRef) as Ptr
		    
		    'ToolbarItems = new Dictionary // instantiate a dictionary for toolbar items
		    
		    ActionHandler = itemActionHandler // store the action handler delegate
		    
		    if identifierString <> "" then
		      dim itemRef as Ptr = initWithIdentifier(Allocate("NSToolbar"), identifierString) // instantiate a new NSToolbar
		      super.Constructor(itemRef, NSObject.hasOwnership) // construct the super object (NSObject)
		      SetDelegate // setup a delegate
		    else
		      // You didn't provided a valid unique identifier for this toolbar
		      // Please provide a string to uniquely identify this toolbar in your app
		      // if you use more than one toolbar be sure to provide different identifiers
		      break
		    end if
		    
		  #else
		    #pragma unused identifierString
		    #pragma unused itemActionHandler
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CustomizationPaletteIsRunning() As Boolean
		  
		  // tells if the toolbar configuration sheet is currently open
		  
		  #if targetCocoa
		    declare function customizationPaletteIsRunning Lib CocoaLib selector "customizationPaletteIsRunning" (obj_id as Ptr) as Boolean
		    
		    return customizationPaletteIsRunning(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DefaultItems() As String()
		  
		  // returns an array of identifiers with the default set and order in this toolbar
		  
		  dim items() as String
		  dim n as Integer = mDefaultItems.Count-1
		  
		  for i as Integer = 0 to n
		    items.append new CFString(mDefaultItems.Value(i), CFType.hasOwnership)
		  next
		  
		  return items
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DefaultItems(assigns items() as String)
		  
		  // sets an array of identifiers with the default set and order in this toolbar
		  
		  mDefaultItems = new NSArray(items)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  
		  // a static pointer to a delegate class instance
		  
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  // destructor
		  
		  // remove the pair from dictionary
		  if CocoaDelegateMap.HasKey(self.delegate_id) then
		    CocoaDelegateMap.Remove self.delegate_id
		  end if
		  
		  #if targetCocoa
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    if self.delegate_id <> nil then
		      release(self.delegate_id) // release the delegate
		      self.delegate_id = nil
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchPrintDocument(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // delegate method called from Print toolbar item
		  
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      obj.HandlePrintDocument // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchShowColor(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // delegate method called from Color toolbar item
		  
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      obj.HandleShowColorPanel // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchShowFont(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // delegate method called from Font toolbar item
		  
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      obj.HandleShowFontPanel // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchToolbarAllowedItemIdentifiers(id as Ptr, sel as Ptr, tbar as Ptr) As Ptr
		  
		  // delegate method called from toolbar
		  
		  #pragma unused sel
		  #pragma unused tbar
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      return obj.HandleAllowedItemIdentifiers // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchToolbarDefaultItemIdentifiers(id as Ptr, sel as Ptr, tbar as Ptr) As Ptr
		  
		  // delegate method called from toolbar
		  
		  #pragma unused sel
		  #pragma unused tbar
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      return obj.HandleDefaultItemIdentifiers // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchToolbarDidRemoveItem(id as Ptr, sel as Ptr, notification as Ptr)
		  
		  // delegate method called from toolbar
		  
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      obj.HandleItemRemoved new NSNotification(notification) // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchToolbarItemWillBeInserted(id as Ptr, sel as Ptr, tbar as Ptr, itemIdentifier as CFstringRef, flag as Boolean) As Ptr
		  
		  // delegate method called from toolbar
		  
		  #pragma unused sel
		  #pragma unused tbar
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      return obj.HandleToolbarItemRequested(itemIdentifier, flag) // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchToolbarSelectableItemIdentifiers(id as Ptr, sel as Ptr, tbar as Ptr) As Ptr
		  
		  // delegate method called from toolbar
		  
		  #pragma unused sel
		  #pragma unused tbar
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      return obj.HandleSelectableItemIdentifiers // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchToolbarWillAddItem(id as Ptr, sel as Ptr, notification as Ptr)
		  
		  // delegate method called from toolbar
		  
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      obj.HandleAddingItem new NSNotification(notification), id  // dispatch the message to the right instance
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchValidateItem(id as Ptr, sel as Ptr, item as Ptr) As Boolean
		  
		  // delegate method called from toolbar
		  
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then // get the delegate
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbar = NSToolbar(w.Value) // get the sender toolbar instance
		    if obj <> nil then
		      dim tbItem as NSToolbarItem = new NSToolbarItem(item)
		      dim localItem as NSToolbarItem = obj.ToolbarItems.Lookup(tbItem.ItemIdentifier, nil) // lookup the item in object dictionary
		      if localItem <> nil then
		        return obj.HandleValidateItem(localItem) // dispatch the message to the right instance
		      else
		        // this shouldn't happen
		      end if
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleAddingItem(notification as NSNotification, delegate_id as Ptr)
		  
		  // Cocoa sent a toolbarWillAddItem: message with a notification
		  
		  // get the notification info dictionary which contains "item" key
		  dim d as NSDictionary = notification.UserInfo
		  dim itemPtr as Ptr
		  dim item as NSToolbarItem
		  
		  if d <> nil then
		    itemPtr = d.Value(new NSString("item")) // get the Ptr to the NSToolbarItem
		    
		    if itemPtr <> nil then
		      dim tmpItem as NSToolbarItem = new NSToolbarItem(itemPtr) // construct a NSToolbarItem from Ptr
		      dim tmpIdentifier as String = tmpItem.itemIdentifier // get the item identifier
		      item = ToolbarItems.Lookup(tmpIdentifier, nil) // lookup the item in local dictionary
		      if item = nil then // items are normally present but that's not true for standard items (space, separator, color, print, etc.)
		        item = tmpItem
		        ToolbarItems.value(tmpIdentifier) = item // so we eventually add them to the local dictionary
		        if tmpIdentifier = NSToolbarPrintItemIdentifier or _                  // for the Print item
		          tmpIdentifier = NSToolbarShowColorsItemIdentifier or _  // the Colors item,
		          tmpIdentifier = NSToolbarShowFontsItemIdentifier then  // and the Fonts item...
		          item.Target = delegate_id // we set the Target to the toolbar, so we can handle the validateToolbarItem: message
		        end if
		      end if
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleAllowedItemIdentifiers() As Ptr
		  
		  // return the allowed items (the toolbar generally ask for this when the customize sheet is opened)
		  
		  if mAllowedItems <> nil then
		    return mAllowedItems
		  else
		    return nil
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleDefaultItemIdentifiers() As Ptr
		  
		  // return the default items (the toolbar generally ask for this on first run)
		  
		  if mDefaultItems <> nil then
		    return mDefaultItems
		  else
		    return nil
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleItemActions(identifier as String, hitMenuItem as NSMenuItem)
		  
		  // Actions from items are redirected here and we pass them to the delegate method
		  
		  ActionHandler.Invoke(identifier, hitMenuItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleItemRemoved(notification as NSNotification)
		  
		  // Cocoa sent a toolbarDidRemoveItem: message with a notification
		  
		  // get the notification info dictionary which contains "item" key
		  dim d as NSDictionary = notification.UserInfo
		  
		  if d <> nil then
		    dim itemPtr as Ptr = d.Value(new NSString("item")) // get the Ptr to the NSToolbarItem
		    
		    if itemPtr <> nil then
		      dim tmpItem as NSToolbarItem = new NSToolbarItem(itemPtr) // construct a NSToolbarItem from Ptr
		      dim tmpIdentifier as String = tmpItem.itemIdentifier // get the item identifier
		      dim item as NSToolbarItem = ToolbarItems.Lookup(tmpIdentifier, nil) // lookup the item in local dictionary
		      if item = nil then // items are normally present but that's not true for standard items (space, separator, color, print, etc.)
		        item = tmpItem
		        ToolbarItems.value(tmpIdentifier) = item // so we eventually add them to the local dictionary
		      end if
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePrintDocument()
		  
		  // Pressed the Print standard item
		  
		  ActionHandler.Invoke(NSToolbarPrintItemIdentifier, nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleSelectableItemIdentifiers() As Ptr
		  
		  // return the selectable items (as in Preferences panes often used)
		  
		  if mSelectableItems <> nil then
		    return mSelectableItems
		  else
		    return nil
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleShowColorPanel()
		  
		  // Pressed the Color standard item
		  
		  #if TargetCocoa
		    declare sub objc_msgSend lib CocoaLib (theReceiver as Ptr, theSelector as Ptr, theSender as Ptr)
		    
		    // the default action. ask the application to open the Color panel
		    objc_msgSend(NSApplication.App, Cocoa.NSSelectorFromString("orderFrontColorPanel:"), self.id)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleShowFontPanel()
		  
		  // Pressed the Font standard item
		  
		  #if TargetCocoa
		    declare sub objc_msgSend lib CocoaLib (theReceiver as Ptr, theSelector as Ptr, theSender as Ptr)
		    
		    // the default action. ask the application to open the Font panel
		    objc_msgSend(NSApplication.App, Cocoa.NSSelectorFromString("orderFrontFontPanel:"), self.id)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleToolbarItemRequested(itemIdentifier as String, inToolbar as Boolean) As Ptr
		  
		  // the toolbar requested an item to be added to toolbar (or configuration sheet)
		  
		  #pragma unused inToolbar
		  
		  if ToolbarItems.HasKey(itemIdentifier) then // lookup the item in local dictionary
		    dim obj as NSToolbarItem = ToolbarItems.Lookup(itemIdentifier, nil)
		    if obj <> nil then
		      return obj // return the object
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleValidateItem(item as NSToolbarItem) As Boolean
		  
		  // a validateToolbarItem: message was sent to the delegate to know if a toolbar item (the built-ins items as Color, Font, Print, etc.)
		  // should be made active and accepting mouse clicks
		  
		  return item.enabled // validate an item only if it's enabled
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Identifier() As String
		  
		  // return the toolbar unique identifier
		  
		  #if targetCocoa
		    declare function identifier Lib CocoaLib selector "identifier" (obj_id as Ptr) as CFStringRef
		    
		    return identifier(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertItemWithItemIdentifierAtIndex(itemIdentifier as String, index as Integer)
		  
		  // insert an item at a given position
		  // Apple discourage this in favor of letting the user to configure the toolbar himself
		  
		  #if targetCocoa
		    declare sub insertItemWithItemIdentifier Lib CocoaLib selector "insertItemWithItemIdentifier:atIndex:" (obj_id as Ptr, identifier as CFStringRef, index as Integer)
		    
		    insertItemWithItemIdentifier(self, itemIdentifier, index)
		    
		  #else
		    #pragma unused itemIdentifier
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsOverflowed() As Boolean
		  
		  // tells if the toolbar is showing the overflow icon and some items are not visible
		  
		  return (Items.ubound <> VisibleItems.ubound)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Items() As NSToolbarItem()
		  
		  // return an array with the items currently in toolbar
		  
		  #if TargetCocoa
		    declare function items lib CocoaLib selector "items" (obj_id as Ptr) as Ptr
		    
		    dim ns_array as new NSArray(items(self))
		    dim rb_array() as NSToolbarItem
		    dim c as integer = ns_array.count-1
		    for i as integer = 0 to c
		      dim item as NSToolbarItem = new NSToolbarItem(ns_array.value(i))
		      dim localItem as NSToolbarItem = ToolbarItems.Lookup(item.ItemIdentifier, nil) // lookup the item in local dictionary
		      if localItem <> nil then
		        rb_array.append localItem
		      else
		        // this shouldn't happen.... but still we try to provide an item
		        rb_array.append item
		      end if
		    next
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:" : CType(AddressOf DispatchToolbarItemWillBeInserted, Ptr) : "@@:@@c"
		    methodList.Append "toolbarAllowedItemIdentifiers:" : CType(AddressOf DispatchToolbarAllowedItemIdentifiers, Ptr) : "@@:@"
		    methodList.Append "toolbarDefaultItemIdentifiers:" : CType(AddressOf DispatchToolbarDefaultItemIdentifiers, Ptr) : "@@:@"
		    methodList.Append "toolbarDidRemoveItem:" : CType(AddressOf DispatchToolbarDidRemoveItem, Ptr) : "v@:@"
		    methodList.Append "toolbarSelectableItemIdentifiers:" : CType(AddressOf DispatchToolbarSelectableItemIdentifiers, Ptr) : "@@:@"
		    methodList.Append "toolbarWillAddItem:" : CType(AddressOf DispatchToolbarWillAddItem, Ptr) : "v@:@"
		    methodList.Append "printDocument:" : CType(AddressOf DispatchPrintDocument, Ptr) : "v@:@"
		    methodList.Append "orderFrontFontPanel:" : CType(AddressOf DispatchShowFont, Ptr) : "v@:@"
		    methodList.Append "orderFrontColorPanel:" : CType(AddressOf DispatchShowColor, Ptr) : "v@:@"
		    methodList.Append "validateToolbarItem:" : CType(AddressOf DispatchValidateItem, Ptr) : "c@:@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList)
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveItemAtIndex(index as Integer)
		  
		  // remove an item at a given position
		  // Apple discourage this in favor of letting the user to configure the toolbar himself
		  
		  #if targetCocoa
		    declare sub removeItemAtIndex Lib CocoaLib selector "removeItemAtIndex:" (obj_id as Ptr, index as Integer)
		    
		    removeItemAtIndex(self, index)
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub runCustomizationPalette()
		  
		  // open the configuration sheet (as if the user chose "Configure Toolbar...")
		  
		  #if targetCocoa
		    declare sub runCustomizationPalette Lib CocoaLib selector "runCustomizationPalette:" (obj_id as Ptr, sender as Ptr)
		    
		    runCustomizationPalette(self, self)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectableItems() As String()
		  
		  // returns an array of identifiers allowed to be selectable (as in Preferences panes often happens)
		  
		  dim items() as String
		  dim n as Integer = mSelectableItems.Count-1
		  
		  for i as Integer = 0 to n
		    items.append new CFString(mSelectableItems.Value(i), CFType.hasOwnership)
		  next
		  
		  return items
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectableItems(assigns items() as String)
		  
		  // sets an array of identifiers allowed to be selectable (as in Preferences panes often happen)
		  
		  mSelectableItems = new NSArray(items)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetConfigurationFromDictionary(dict as NSDictionary)
		  
		  // configure the toolbar (size, mode, etc.) from a given dictionary (see also ConfigurationDictionary)
		  
		  #if TargetCocoa
		    declare sub setConfigurationFromDictionary lib CocoaLib selector "setConfigurationFromDictionary:" (obj_id as Ptr, dict as Ptr)
		    
		    setConfigurationFromDictionary(self, dict)
		    
		  #else
		    #pragma unused dict
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  
		  // Instantiate a delegate to receive messages from the toolbar
		  
		  #if targetCocoa
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    delegate_id = Initialize(Allocate(DelegateClassID)) // instantiate the delegate
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self, delegate_id // set the delegate
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self) // keep a reference to the delegate/toolbar pair
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ToolbarItems() As Dictionary
		  
		  if mToolbarItems = nil then
		    mToolbarItems = new Dictionary
		  end if
		  
		  return mToolbarItems
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValidateVisibleItems()
		  
		  // force validation of visible items
		  
		  #if targetCocoa
		    declare sub validateVisibleItems Lib CocoaLib selector "validateVisibleItems" (obj_id as Ptr)
		    
		    validateVisibleItems(self)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleItems() As NSToolbarItem()
		  
		  // return an array with the items currently visible (not overflowed)
		  
		  #if TargetCocoa
		    declare function visibleItems lib CocoaLib selector "visibleItems" (obj_id as Ptr) as Ptr
		    
		    dim ns_array as new NSArray(visibleItems(self))
		    dim rb_array() as NSToolbarItem
		    dim c as integer = ns_array.count-1
		    for i as integer = 0 to c
		      dim item as NSToolbarItem = new NSToolbarItem(ns_array.value(i))
		      dim localItem as NSToolbarItem = ToolbarItems.Lookup(item.ItemIdentifier, nil) // lookup the item in local dictionary
		      if localItem <> nil then
		        rb_array.append localItem
		      else
		        // this shouldn't happen.... but still we try to provide an item
		        rb_array.append item
		      end if
		    next
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		#tag Note
			the handler for actions from toolbar items
		#tag EndNote
		Private ActionHandler As ActionDelegate
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			get/set if the user can customize the toolbar
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function allowsUserCustomization Lib CocoaLib selector "allowsUserCustomization" (obj_id as Ptr) as Boolean
			    
			    return allowsUserCustomization(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setAllowsUserCustomization Lib CocoaLib selector "setAllowsUserCustomization:" (obj_id as Ptr, value as Boolean)
			    
			    setAllowsUserCustomization(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AllowsUserCustomization As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			get/set if the toolbar configuration is automatically saved in app preferences
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function autosavesConfiguration Lib CocoaLib selector "autosavesConfiguration" (obj_id as Ptr) as Boolean
			    
			    return autosavesConfiguration(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setAutosavesConfiguration Lib CocoaLib selector "setAutosavesConfiguration:" (obj_id as Ptr, value as Boolean)
			    
			    setAutosavesConfiguration(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AutosavesConfiguration As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			pointer to the delegate
		#tag EndNote
		Private delegate_id As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the display mode (icon only, icon and label, etc.)
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function displayMode Lib CocoaLib selector "displayMode" (obj_id as Ptr) as NSToolbarDisplayMode
			    
			    return displayMode(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setDisplayMode Lib CocoaLib selector "setDisplayMode:" (obj_id as Ptr, mode as NSToolbarDisplayMode)
			    
			    setDisplayMode(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		DisplayMode As NSToolbarDisplayMode
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			private store for allowedItems
		#tag EndNote
		Private mAllowedItems As NSArray
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			private store for defaultitems
		#tag EndNote
		Private mDefaultItems As NSArray
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			private store for selectableItems
		#tag EndNote
		Private mSelectableItems As NSArray
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			private storage for toolbar items
		#tag EndNote
		Private mToolbarItems As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			get/set the selected item (for selectableItems)
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function selectedItemIdentifier Lib CocoaLib selector "selectedItemIdentifier" (obj_id as Ptr) as CFStringRef
			    
			    return selectedItemIdentifier(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setSelectedItemIdentifier Lib CocoaLib selector "setSelectedItemIdentifier:" (obj_id as Ptr, value as CFStringRef)
			    
			    setSelectedItemIdentifier(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		SelectedItemIdentifier As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			hide/show the base line separator for the toolbar (mainly useful in textured windows)
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function showsBaselineSeparator Lib CocoaLib selector "showsBaselineSeparator" (obj_id as Ptr) as Boolean
			    
			    return showsBaselineSeparator(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setShowsBaselineSeparator Lib CocoaLib selector "setShowsBaselineSeparator:" (obj_id as Ptr, value as Boolean)
			    
			    setShowsBaselineSeparator(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ShowsBaselineSeparator As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the toolbar size
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function sizeMode Lib CocoaLib selector "sizeMode" (obj_id as Ptr) as NSToolbarSizeMode
			    
			    return sizeMode(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setSizeMode Lib CocoaLib selector "setSizeMode:" (obj_id as Ptr, mode as NSToolbarSizeMode)
			    
			    setSizeMode(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		SizeMode As NSToolbarSizeMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			hide/show the toolbar
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function isVisible Lib CocoaLib selector "isVisible" (obj_id as Ptr) as Boolean
			    
			    return isVisible(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setVisible Lib CocoaLib selector "setVisible:" (obj_id as Ptr, value as Boolean)
			    
			    setVisible(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Visible As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"MLNSToolbarDelegate", Scope = Private
	#tag EndConstant


	#tag Enum, Name = NSToolbarDisplayMode, Flags = &h0
		NSToolbarDisplayModeDefault
		  NSToolbarDisplayModeIconAndLabel
		  NSToolbarDisplayModeIconOnly
		NSToolbarDisplayModeLabelOnly
	#tag EndEnum

	#tag Enum, Name = NSToolbarSizeMode, Flags = &h0
		NSToolbarSizeModeDefault
		  NSToolbarSizeModeRegular
		NSToolbarSizeModeSmall
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowsUserCustomization"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutosavesConfiguration"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayMode"
			Group="Behavior"
			Type="NSToolbarDisplayMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSToolbarDisplayModeDefault"
				"1 - NSToolbarDisplayModeIconAndLabel"
				"2 - NSToolbarDisplayModeIconOnly"
				"3 - NSToolbarDisplayModeLabelOnly"
			#tag EndEnumValues
		#tag EndViewProperty
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
			Name="SelectedItemIdentifier"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsBaselineSeparator"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SizeMode"
			Group="Behavior"
			Type="NSToolbarSizeMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSToolbarSizeModeDefault"
				"1 - NSToolbarSizeModeRegular"
				"2 - NSToolbarSizeModeSmall"
			#tag EndEnumValues
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
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

#tag Class
Class NSToolbarDropMenuItem
Inherits NSToolbarItem
Implements NSToolbarItemInterface
	#tag Method, Flags = &h0
		Function ActionHandler() As CocoaToolbar.ActionDelegate
		  
		  // Part of the NSToolbarItemInterface
		  
		  // This get the delegate method called when the menu item is hilited. Usually the toolbar.
		  
		  return _menuActionHandler
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionHandler(assigns action as CocoaToolbar.ActionDelegate)
		  
		  // Part of the NSToolbarItemInterface
		  
		  // This set the delegate method called when the menu item is hilited. Usually the toolbar.
		  
		  if action <> nil then
		    if _menuActionHandler = nil then // changing the target/action is not supported for now, only setting when it's nil
		      _menuActionHandler = action
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItem(title as String)
		  
		  // adds a new item to the menu without returning it
		  
		  dim dummyItem as NSMenuItem = self.AddItem(title)
		  
		  #pragma unused dummyItem
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddItem(title as String) As NSMenuItem
		  
		  // adds a new item to the menu and return it
		  
		  dim m as NSMenuItem = _myMenu.Append(title)
		  m.Target = self.id // set target to me for the newly created item
		  m.Action = "menuAction:" // set action
		  
		  return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSeparator()
		  
		  // adds a separator menu item
		  
		  _myMenu.Append(NSMenuItem.CreateSeparatorItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaClassMap() As Dictionary
		  
		  // a static dictionary for instances
		  
		  static d as new Dictionary
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(itemIdentifier as String, action as ActionDelegate = nil)
		  
		  // constructor
		  
		  #if targetCocoa
		    
		    declare function initWithItemIdentifier Lib CocoaLib selector "initWithItemIdentifier:" (obj_id as Ptr, itemIdentifier as CFStringRef) as Ptr
		    
		    // allocate and init a subclass of NSToolbarItem
		    dim itemRef as Ptr = initWithItemIdentifier(Allocate(SubClassID), itemIdentifier)
		    if itemRef <> nil then
		      super.Constructor(itemRef, NSObject.hasOwnership) // call the super constructor (NSObject)
		      CocoaClassMap.Value(itemRef) = new WeakRef(self) // store a reference to this instance
		      self.View = SetupView // setup a new NSButton and assign its view to this toolbar item
		      ActionHandler = action // set actionHandler if provided
		      
		      // set default min and max size
		      dim dimMax as Cocoa.NSSize
		      dimMax.width = 64
		      dimMax.height = 64
		      
		      dim dimMin as Cocoa.NSSize
		      dimMin.width = 24
		      dimMin.height = 24
		      
		      self.MaxSize = dimMax
		      self.MinSize = dimMin
		      
		    end if
		    
		  #else
		    #pragma unused itemIdentifier
		    #pragma unused action
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  // release the NSButton instance
		  
		  #if targetCocoa
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    if self._control_id <> nil then
		      release self._control_id
		      self._control_id = nil
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchAction(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // delegate method called when the NSButton is clicked
		  
		  #pragma unused sel
		  #pragma unused sender
		  
		  #if TargetCocoa
		    
		    #pragma stackOverflowChecking false
		    
		    if CocoaClassMap.HasKey(id) then// get the target
		      dim w as WeakRef = CocoaClassMap.Lookup(id, new WeakRef(nil))
		      dim obj as NSToolbarDropMenuItem = NSToolbarDropMenuItem(w.Value) // get the sender instance
		      if obj <> nil then
		        if obj._menuActionHandler <> nil then
		          declare function frame lib CocoaLib selector "frame" (obj_id as Ptr) as Cocoa.NSRect
		          dim f as Cocoa.NSRect = frame(obj.view) // get the button size
		          dim p as Cocoa.NSPoint // setup an NSPoint for positioning the menu
		          p.x = 0
		          p.y = f.h
		          call obj._myMenu.PopUpMenuPositioningItem(nil, p, obj.view) // pop down the menu
		        end if
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		    
		  #else
		    
		    #pragma unused id
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchMenuAction(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // delegate method called when a menu item is clicked
		  
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaClassMap.HasKey(id) then// get the target
		    dim w as WeakRef = CocoaClassMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbarDropMenuItem = NSToolbarDropMenuItem(w.Value) // get the sender toolbar item instance
		    if obj <> nil then
		      if obj._menuActionHandler <> nil then
		        dim senderItem as NSMenuItem // get the sender menu item
		        if sender <> nil then
		          senderItem = new NSMenuItem(sender)
		        end if
		        obj.ActionHandler.Invoke(obj.ItemIdentifier, senderItem) // invoke the action handler delegate
		      end if
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchOverflowAction(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // dummy method. this is just for being able to set an action on toolbaritem when in overflow or text only mode
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchValidate(id as Ptr, sel as Ptr) As Boolean
		  
		  // delegate method called from toolbar item when need validation for a custom toolbar item
		  
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaClassMap.HasKey(id) then// get the target
		    dim w as WeakRef = CocoaClassMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbarDropMenuItem = NSToolbarDropMenuItem(w.Value) // get the sender toolbar item instance
		    if obj <> nil then
		      return obj.enabled // we want the item is valid when it's enabled
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchValidateMenu(id as Ptr, sel as Ptr, aMenuItem as Ptr) As Boolean
		  
		  // delegate method called when need validation for a menu item
		  
		  #pragma unused sel
		  #pragma unused aMenuItem
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaClassMap.HasKey(id) then// get the target
		    dim w as WeakRef = CocoaClassMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbarDropMenuItem = NSToolbarDropMenuItem(w.Value) // get the sender item instance
		    if obj <> nil then
		      return obj.enabled // we want the menu item is valid when the control is enabled
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Enabled() As Boolean
		  
		  // we override the Enabled method to return the Enabled state of the NSButton
		  
		  #if targetCocoa
		    declare function isEnabled Lib CocoaLib selector "isEnabled" (obj_id as Ptr) as Boolean
		    
		    return isEnabled(self._control_id)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Enabled(assigns value as Boolean)
		  
		  // we override the Enabled method to set the Enabled state of the NSButton
		  
		  #if targetCocoa
		    declare sub setEnabled Lib CocoaLib selector "setEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setEnabled(self._control_id, value)
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageReferencing() As NSImage
		  
		  // get the item image as NSImage
		  
		  #if TargetCocoa
		    declare function image lib CocoaLib selector "image:" (obj_id as Ptr) as Ptr
		    
		    dim imageRef as Ptr = image(_control_id)
		    if imageRef <> nil then
		      return new NSImage(imageRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImageReferencing(assigns n as NSImage)
		  
		  // set the image item as NSImage
		  
		  #if TargetCocoa
		    declare sub setImage lib CocoaLib selector "setImage:" (obj_id as Ptr, menuImage as Ptr)
		    
		    if n <> nil then
		      setImage _control_id, n
		      
		      // set the same image on the overflow menu item (just smaller)
		      dim tinyImage as NSImage = n.Copy
		      dim s as Cocoa.NSSize
		      s.width = 16
		      s.height = 16
		      tinyImage.Size = s
		      _overflowMenuItem.Image = tinyImage
		    end if
		    
		  #else
		    #pragma unused n
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTag(tag as Integer) As Integer
		  
		  // get the index of first menu item with a provided tag
		  
		  return _myMenu.IndexOfItemWithTag(tag)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTitle(title as String) As Integer
		  
		  // get the index of first menu item with a provided title
		  
		  return _myMenu.IndexOfItemWithTitle(title)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertItem(title as String, index as Integer)
		  
		  // insert a new item to the menu without returning it
		  
		  dim dummyItem as NSMenuItem = self.InsertItem(title, index)
		  
		  #pragma unused dummyItem
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertItem(title as String, index as Integer) As NSMenuItem
		  
		  // adds a new item to the menu and return it
		  
		  dim m as NSMenuItem = _myMenu.Insert(title, index)
		  m.Target = self.id // set target to me for the newly created item
		  m.Action = "menuAction:" // set action
		  
		  return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertSeparator(index as Integer)
		  
		  // insert a separator menu item
		  
		  _myMenu.Insert(NSMenuItem.CreateSeparatorItem, index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemArray() As NSMenuItem()
		  
		  // returns an array filled with the menu items
		  
		  dim rb_array() as NSMenuItem
		  
		  dim ns_array as NSArray = _myMenu.Items
		  dim n as integer = ns_array.Count-1
		  for i as Integer = 0 to n
		    rb_array.append new NSMenuItem(ns_array.Value(i))
		  next
		  
		  return rb_array
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemAtIndex(index as Integer) As NSMenuItem
		  
		  // get the menu item at specified index
		  
		  return _myMenu.Item(index)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ItemLabel(assigns aString as String)
		  
		  // overridden method to set the item label. This is necessary to change the _overflowMenuItem title too
		  
		  #if targetCocoa
		    declare sub setLabel Lib CocoaLib selector "setLabel:" (obj_id as Ptr, aLabel as CFStringRef)
		    
		    setLabel(self, aString)
		    
		    _overflowMenuItem.Title = aString
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemWithTag(tag as Integer) As NSMenuItem
		  
		  // get the the first menu item with specified tag
		  
		  return _myMenu.ItemWithTag(tag)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemWithTitle(title as String) As NSMenuItem
		  
		  // get the the first menu item with specified title
		  
		  return _myMenu.ItemWithTitle(title)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeSubClass(className as String = SubClassName, superclassName as String = "NSToolbarItem") As Ptr
		  
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if targetCocoa
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    dim methodsAdded as Boolean = true
		    
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("action:"), AddressOf DispatchAction, "v@:@")
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("menuAction:"), AddressOf DispatchMenuAction, "v@:@")
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("overflowAction:"), AddressOf DispatchOverflowAction, "v@:@")
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("validate"), AddressOf DispatchValidate, "v@:")
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("validateMenuItem:"), AddressOf DispatchValidateMenu, "v@:@")
		    
		    if methodsAdded then
		      return newClassId
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfItems() As Integer
		  
		  // returns the number of menu items
		  
		  return _myMenu.Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllItems()
		  
		  // remove all items from menu
		  
		  _myMenu.RemoveAll
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveItem(index as Integer)
		  
		  // remove and item ad specified index
		  
		  _myMenu.Remove(index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SetupView() As Ptr
		  
		  // setup a NSButton and some of its properties
		  
		  #if targetCocoa
		    
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as Cocoa.NSRect) as Ptr
		    declare sub setAutoresizingMask lib CocoaLib selector "setAutoresizingMask:" (id as Ptr, mask as Integer)
		    declare sub setBordered lib CocoaLib selector "setBordered:" (obj_id as Ptr, value as Boolean)
		    declare sub setButtonType lib CocoaLib selector "setButtonType:" (id as Ptr, buttonType as Integer)
		    declare sub setImagePosition lib CocoaLib selector "setImagePosition:" (obj_id as Ptr, value as Integer)
		    declare sub setImageScaling lib CocoaLib selector "setImageScaling:" (obj_id as Ptr, value as Integer)
		    declare sub setAction lib CocoaLib selector "setAction:" (id as Ptr, aSelector as Ptr)
		    declare sub setTarget lib CocoaLib selector "setTarget:" (id as Ptr, anObject as Ptr)
		    
		    // autoresizing mask constants
		    const NSViewWidthSizable = 2
		    const NSViewHeightSizable = 16
		    
		    // image position constants
		    const NSImageOnly = 1
		    
		    // image scaling constants
		    const NSImageScaleProportionallyUpOrDown = 3
		    
		    // button type constants
		    const NSMomentaryChangeButton = 5
		    
		    // size the control at default toolbar button size (32x32)
		    dim frame as Cocoa.NSRect
		    frame.x = 0.0
		    frame.y = 0.0
		    frame.w = 32.0
		    frame.h = 32.0
		    
		    _control_id = initWithFrame(Allocate("NSButton"), frame) // allocate and init the class
		    
		    if _control_id <> nil then
		      setAutoresizingMask _control_id, NSViewWidthSizable or NSViewHeightSizable // set resizing mask
		      setBordered _control_id, false // do not draw border
		      setImagePosition _control_id, NSImageOnly // tells the button it's an image only (no title)
		      setImageScaling _control_id, NSImageScaleProportionallyUpOrDown // set image scaling
		      setButtonType _control_id, NSMomentaryChangeButton
		      setAction _control_id, Cocoa.NSSelectorFromString("action:") // set action
		      setTarget _control_id, self.id // set target to me
		      
		      _myMenu = new NSMenu // create a new menu
		      _myMenu.font = NSFont.MenuFont(NSFont.SystemFontSize) // set the correct font
		      
		      // create a menu item to be used when the item is overflowed and append to it the menu as a submenu
		      _overflowMenuItem = new NSMenuItem(self.ItemLabel)
		      _overflowMenuItem.Target = self.id // set target of _overflowMenuItem to me just to enable it
		      _overflowMenuItem.Action = "overflowAction:" // set action to a dummy handler to avoid firing the main action handler when selected
		      _overflowMenuItem.Submenu = _myMenu // set the submenu
		      self.menuFormRepresentation = _overflowMenuItem // use the just created item as a menu form representation
		      
		    end if
		    
		    return _control_id
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SubClassID() As Ptr
		  
		  // a static pointer to a target class instance
		  
		  static p as Ptr = MakeSubClass
		  return p
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return _myMenu
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  if value <> nil then
			    
			    // iteratively traverse the menu tree
			    dim menus() as NSMenu
			    menus.append value
			    
			    for i as integer = 0 to ubound(menus)
			      dim items() as NSObject = menus(i).items
			      for each item as NSObject in items
			        dim mItem as new NSMenuItem(item)
			        mItem.Target = self.id // set target to me for every item
			        mItem.Action = "menuAction:" // set action
			        if mItem.submenu <> nil then
			          menus.append mItem.submenu
			        end if
			      next
			    next
			    
			    _myMenu = value
			    _myMenu.font = NSFont.MenuFont(NSFont.SystemFontSize) // set the correct font
			    _overflowMenuItem.Submenu = _myMenu
			    
			  end if
			  
			End Set
		#tag EndSetter
		Menu As NSMenu
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private _control_id As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _menuActionHandler As ActionDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _myMenu As NSMenu
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _overflowMenuItem As NSMenuItem
	#tag EndProperty


	#tag Constant, Name = SubClassName, Type = String, Dynamic = False, Default = \"MLNSToolbarDropMenuItem", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Autovalidates"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ItemIdentifier"
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
			Name="PaletteLabel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tag"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ToolTip"
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
			Name="VisibilityPriority"
			Group="Behavior"
			Type="NSToolbarItemVisibilityPriority"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSToolbarItemVisibilityPriorityStandard"
				"-1000 - NSToolbarItemVisibilityPriorityLow"
				"1000 - NSToolbarItemVisibilityPriorityHigh"
				"2000 - NSToolbarItemVisibilityPriorityUser"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

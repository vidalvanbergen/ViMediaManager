#tag Class
Class NSToolbarCustomItem
Inherits NSToolbarItem
Implements NSToolbarItemInterface
	#tag Method, Flags = &h0
		Function ActionHandler() As CocoaToolbar.ActionDelegate
		  
		  // Part of the NSToolbarItemInterface
		  
		  // This get the delegate method called when the menu item is overflowed or in text only mode. Usually the toolbar.
		  
		  return mMenuActionHandler
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionHandler(assigns action as CocoaToolbar.ActionDelegate)
		  
		  // Part of the NSToolbarItemInterface
		  
		  // This set the delegate method called when the menu item is overflowed or in text only mode. Usually the toolbar.
		  
		  if action <> nil then
		    if mMenuActionHandler = nil then // changing the target/action is not supported for now, only setting when it's nil
		      mMenuActionHandler = action
		      SetMenuTargetAction
		    end if
		  end if
		  
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
		Sub Constructor(controlInstance as Control)
		  
		  // constructor
		  
		  #if targetCocoa
		    
		    declare function initWithItemIdentifier Lib CocoaLib selector "initWithItemIdentifier:" (obj_id as Ptr, itemIdentifier as CFStringRef) as Ptr
		    
		    // allocate and init a subclass of NSToolbarItem using the control name as identifier
		    dim itemRef as Ptr = initWithItemIdentifier(Allocate(SubClassID), controlInstance.name)
		    if itemRef <> nil then
		      super.Constructor(itemRef, NSObject.hasOwnership) // call the super constructor (NSObject)
		      CocoaClassMap.Value(itemRef) = new WeakRef(self) // store a reference to this instance
		      
		      if controlInstance IsA NSControl then
		        self.View = NSControl( controlInstance ) // set the toolbar item view to the NSControl's one
		        mNSControl = NSControl( controlInstance ) // keep a reference to the NSControl for gettins some RB properties
		      elseif controlInstance IsA Control then
		        self.view = Ptr( controlInstance.Handle )
		        mControl = controlInstance
		      end if
		    end if
		    
		  #else
		    #pragma unused controlInstance
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchMenuAction(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // delegate method called when the overflow (ot text only label) is clicked
		  
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaClassMap.HasKey(id) then// get the target
		    dim w as WeakRef = CocoaClassMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbarCustomItem = NSToolbarCustomItem(w.Value) // get the sender toolbar item instance
		    if obj <> nil then
		      if obj.mMenuActionHandler <> nil then
		        obj.ActionHandler.Invoke(obj.ItemIdentifier, nil) // invoke the action handler delegate
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
		Private Shared Function DispatchValidate(id as Ptr, sel as Ptr) As Boolean
		  
		  // delegate method called from toolbar item when need validation for a custom toolbar item
		  
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaClassMap.HasKey(id) then// get the target
		    dim w as WeakRef = CocoaClassMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbarCustomItem = NSToolbarCustomItem(w.Value) // get the sender toolbar item instance
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
		    dim obj as NSToolbarCustomItem = NSToolbarCustomItem(w.Value) // get the sender item instance
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
		  
		  // we override the Enabled method to return the Enabled state of the NSControl
		  
		  '#if targetCocoa
		  'declare function isEnabled Lib CocoaLib selector "isEnabled" (obj_id as Ptr) as Boolean
		  '
		  ''return isEnabled(self.view)
		  '
		  '#endif
		  
		  if mNSControl <> Nil then
		    return mNSControl.Enabled
		  elseif mControl <> nil then
		    return RectControl( mControl ).Enabled
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Enabled(assigns value as Boolean)
		  
		  // we override the Enabled method to set the Enabled state of the NSControl
		  #if targetCocoa
		    declare sub setEnabled Lib CocoaLib selector "setEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setEnabled(self.view, value)
		    if mNSControl <> nil then
		      mNSControl.Enabled = value
		    elseif mControl <> nil then
		      RectControl( mControl ).Enabled = value
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
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
		    
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("validate"), AddressOf DispatchValidate, "v@:")
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("menuAction:"), AddressOf DispatchMenuAction, "v@:@")
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

	#tag Method, Flags = &h21
		Private Sub SetMenuTargetAction()
		  
		  // create a menu item for when the item is overflowed and set its target and action
		  
		  overflowMenuItem = new NSMenuItem(self.ItemLabel, "menuAction:", "")
		  overflowMenuItem.Target = self // set target to self
		  
		  self.menuFormRepresentation = overflowMenuItem // set the menu form representation
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SubClassID() As Ptr
		  
		  // a static pointer to a target class instance
		  
		  static p as Ptr = MakeSubClass
		  return p
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mControl As Control
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenuActionHandler As ActionDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNSControl As NSControl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private overflowMenuItem As NSMenuItem
	#tag EndProperty


	#tag Constant, Name = SubClassName, Type = String, Dynamic = False, Default = \"MLNSToolbarCustomItem", Scope = Private
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

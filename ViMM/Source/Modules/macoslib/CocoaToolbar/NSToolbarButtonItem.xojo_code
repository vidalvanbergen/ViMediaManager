#tag Class
Class NSToolbarButtonItem
Inherits NSToolbarItem
Implements NSToolbarItemInterface
	#tag Method, Flags = &h0
		Function ActionHandler() As ActionDelegate
		  
		  // Part of the NSToolbarItemInterface
		  
		  // This get the delegate method called when the button is clicked. Usually the toolbar.
		  
		  return mActionHandler
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionHandler(assigns action as ActionDelegate)
		  
		  // Part of the NSToolbarItemInterface
		  
		  // This set the delegate method called when the button is clicked. Usually the toolbar.
		  
		  if action <> nil then
		    if mActionHandler = nil then // changing the target/action is not supported for now, only setting when it's nil
		      mActionHandler = action
		      SetTargetAction
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaTargetMap() As Dictionary
		  
		  // a static dictionary for targets
		  
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(itemIdentifier as String, action as ActionDelegate = nil)
		  
		  // call the super designated constructor and sets the ActionHandler
		  
		  Super.Constructor(itemIdentifier)
		  
		  ActionHandler = action
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  // destructor
		  
		  // remove the pair from dictionary
		  if CocoaTargetMap.HasKey(self.target_id) then
		    CocoaTargetMap.Remove self.target_id
		  end if
		  
		  #if targetCocoa
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    if self.target_id <> nil then
		      release(self.target_id) // release the target
		      self.target_id = nil
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchHandleAction(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // delegate method called when the item is clicked
		  
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaTargetMap.HasKey(id) then // get the target
		    dim w as WeakRef = CocoaTargetMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbarButtonItem = NSToolbarButtonItem(w.Value) // get the sender toolbar item instance
		    if obj <> nil then
		      obj.ActionHandler.Invoke(obj.ItemIdentifier, nil) // invoke the action handler delegate
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
		  
		  // delegate method called from toolbar item when need validation
		  
		  #pragma unused sel
		  #pragma unused item
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaTargetMap.HasKey(id) then // get the target
		    dim w as WeakRef = CocoaTargetMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSToolbarButtonItem = NSToolbarButtonItem(w.Value) // get the sender toolbar item instance
		    if obj <> nil then
		      return obj.enabled // validate an item only if enabled
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeTargetClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  
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
		    
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("action:"), AddressOf DispatchHandleAction, "v@:@")
		    methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString("validateToolbarItem:"), AddressOf DispatchValidateItem, "c@:@")
		    
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
		Private Sub SetTargetAction()
		  
		  // setup a target and action instantiating a custom delegate
		  
		  #if targetCocoa
		    // create a MLNSToolbarButtonItemDelegate instance
		    target_id = Initialize(Allocate(TargetClassID))
		    if target_id = nil then
		      return // oops, this shouldn't happen
		    end if
		    
		    self.Target = target_id // set target to the newly created instance
		    self.Action = Cocoa.NSSelectorFromString("action:") // set action to which the target respond
		    
		    CocoaTargetMap.Value(target_id) = new WeakRef(self) // keep a reference to the target instance
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClassID() As Ptr
		  
		  // a static pointer to a target class instance
		  
		  static p as Ptr = MakeTargetClass
		  return p
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mActionHandler As ActionDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private target_id As Ptr
	#tag EndProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"MLNSToolbarButtonItemDelegate", Scope = Private
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

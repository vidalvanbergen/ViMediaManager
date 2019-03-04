#tag Class
Class NSStatusItem
Inherits NSObject
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionDelegate(hitItem as NSMenuItem)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function CocoaTargetMap() As Dictionary
		  
		  // a static dictionary for target instances
		  
		  static d as new Dictionary
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(obj_id as Ptr, action as ActionDelegate = nil, hasOwnership as Boolean = false)
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(obj_id as Ptr, hasOwnership as Boolean = false) -- From NSObject
		  Super.Constructor obj_id, hasOwnership
		  
		  // store the ActionDelegate
		  _menuActionHandler = action
		  
		  // Create a target for menu actions
		  SetTarget
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  // destructor
		  
		  // remove the pair from dictionary
		  if CocoaTargetMap.HasKey(self.target_id) then
		    CocoaTargetMap.Remove self.target_id
		  end if
		  
		  #if TargetMacOS
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    if self.target_id <> nil then
		      release(self.target_id) // release the target
		      self.target_id = nil
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchMenuAction(id as Ptr, sel as Ptr, sender as Ptr)
		  
		  // target method called when a menu item is clicked
		  
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaTargetMap.HasKey(id) then// get the target
		    dim w as WeakRef = CocoaTargetMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSStatusItem = NSStatusItem(w.Value) // get the sender toolbar item instance
		    if obj <> nil then
		      if obj._menuActionHandler <> nil then
		        dim senderItem as NSMenuItem // get the sender menu item
		        if sender <> nil then
		          senderItem = new NSMenuItem(sender)
		        end if
		        obj.ActionHandler.Invoke(senderItem) // invoke the action handler delegate
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
		Private Shared Function DispatchValidateMenu(id as Ptr, sel as Ptr, aMenuItem as Ptr) As Boolean
		  
		  // delegate method called when need validation for a menu item
		  
		  #pragma unused id
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if aMenuItem <> nil then
		    dim item as new NSMenuItem(aMenuItem)
		    return item.enabled
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawStatusBarBackground(rect as Cocoa.NSRect, highlight as Boolean)
		  
		  #if TargetMacOS
		    declare sub drawStatusBarBackgroundInRect lib CocoaLib selector "drawStatusBarBackgroundInRect:withHighlight:" _
		    (obj_id as Ptr, rect as Cocoa.NSRect, highlight as Boolean)
		    
		    drawStatusBarBackgroundInRect self, rect, highlight
		    
		  #else
		    #pragma unused rect
		    #pragma unused highlight
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeTargetClass(className as String = TargetClassName, superclassName as String = "NSObject") As Ptr
		  
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if TargetMacOS
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    dim methodsAdded as boolean = true
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

	#tag Method, Flags = &h0
		Sub PopUpStatusItemMenu(menu as NSMenu)
		  
		  #if TargetMacOS
		    declare sub popUpStatusItemMenu lib CocoaLib selector "popUpStatusItemMenu:" (obj_id as Ptr, menu as Ptr)
		    
		    dim menuRef as Ptr
		    if menu <> nil then
		      menuRef = menu
		    end if
		    
		    popUpStatusItemMenu(self, menuRef)
		    
		  #else
		    #pragma unused menu
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendActionOn(mask as Integer) As Integer
		  
		  #if TargetMacOS
		    declare function sendActionOn lib CocoaLib selector "sendActionOn:" (obj_id as Ptr, mask as Integer) as Integer
		    
		    return sendActionOn(self, mask)
		    
		  #else
		    #pragma unused mask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetTarget()
		  
		  // Instantiate a target to receive messages from the menu items
		  
		  #if TargetMacOS
		    target_id = Initialize(Allocate(TargetClassID)) // instantiate the target
		    if target_id = nil then
		      return
		    end if
		    CocoaTargetMap.Value(target_id) = new WeakRef(self) // keep a reference to the target/item pair
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StatusBar() As NSStatusBar
		  
		  #if TargetMacOS
		    declare function statusBar lib CocoaLib selector "statusBar" (obj_id as Ptr) as Ptr
		    
		    dim barRef as Ptr = statusBar(self)
		    if barRef <> nil then
		      return new NSStatusBar(barRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClassID() As Ptr
		  
		  // a static pointer to a target class instance
		  
		  static p as Ptr = MakeTargetClass
		  return p
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function action Lib CocoaLib selector "action" (obj_id as Ptr) as Ptr
			    
			    return action(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAction Lib CocoaLib selector "setAction:" (obj_id as Ptr, actionSEL as Ptr)
			    
			    setAction(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Action As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return _menuActionHandler
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  _menuActionHandler = value
			  
			End Set
		#tag EndSetter
		ActionHandler As ActionDelegate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function alternateImage lib CocoaLib selector "alternateImage" (obj_id as Ptr) as Ptr
			    
			    dim imageRef as Ptr = alternateImage(self)
			    if imageRef <> nil then
			      return new NSImage(imageRef)
			    else
			      return nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAlternateImage lib CocoaLib selector "setAlternateImage:" (obj_id as Ptr, image as Ptr)
			    
			    dim imageRef as Ptr
			    if value <> nil then
			      imageRef = value
			    end if
			    
			    setAlternateImage self, imageRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AlternateImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If TargetMacOS Then
			    Declare Function getAttributedTitle Lib CocoaLib Selector "attributedTitle" (obj_id As Ptr) As Ptr
			    Return New NSAttributedString(getAttributedTitle(Self))
			  #EndIf
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If TargetMacOS Then
			    Declare Sub setAttributedTitle Lib CocoaLib Selector "setAttributedTitle:" (obj_id As Ptr, value As Ptr)
			    setAttributedTitle Self, value
			  #Else
			    #pragma Unused value
			  #EndIf
			End Set
		#tag EndSetter
		AttributedTitle As NSAttributedString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function doubleAction Lib CocoaLib selector "doubleAction" (obj_id as Ptr) as Ptr
			    
			    return doubleAction(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setDoubleAction Lib CocoaLib selector "setDoubleAction:" (obj_id as Ptr, actionSEL as Ptr)
			    
			    setDoubleAction(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		DoubleAction As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isEnabled lib CocoaLib selector "isEnabled" (obj_id as Ptr) as Boolean
			    
			    return isEnabled(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setEnabled lib CocoaLib selector "setEnabled:" (obj_id as Ptr, value as Boolean)
			    
			    setEnabled(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function highlightMode lib CocoaLib selector "highlightMode" (obj_id as Ptr) as Boolean
			    
			    return highlightMode(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setHighlightMode lib CocoaLib selector "setHighlightMode:" (obj_id as Ptr, flag as Boolean)
			    
			    setHighlightMode self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		HighlightMode As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function image lib CocoaLib selector "title" (obj_id as Ptr) as Ptr
			    
			    dim imageRef as Ptr = image(self)
			    if imageRef <> nil then
			      return new NSImage(imageRef)
			    else
			      return nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setImage lib CocoaLib selector "setImage:" (obj_id as Ptr, image as Ptr)
			    
			    dim imageRef as Ptr
			    if value <> nil then
			      imageRef = value
			    end if
			    
			    setImage self, imageRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Image As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Double
			    
			    return length(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setLength lib CocoaLib selector "setLength:" (obj_id as Ptr, itemLen as Double)
			    
			    setLength self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Length As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function menu lib CocoaLib selector "menu" (obj_id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = menu(self)
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
			    declare sub setMenu lib CocoaLib selector "setMenu:" (obj_id as Ptr, menu as Ptr)
			    
			    dim menuRef as Ptr
			    if value <> nil then
			      menuRef = value
			      
			      // iteratively traverse the menu tree
			      dim menus() as NSMenu
			      menus.append value
			      
			      for i as integer = 0 to ubound(menus)
			        dim items() as NSObject = menus(i).items
			        for each item as NSObject in items
			          dim mItem as new NSMenuItem(item)
			          mItem.Target = self.target_id // set target to my target for every item
			          mItem.Action = "menuAction:" // set action
			          if mItem.submenu <> nil then
			            menus.append mItem.submenu
			          end if
			        next
			      next
			      
			    end if
			    
			    setMenu self, menuRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Menu As NSMenu
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function target Lib CocoaLib selector "target" (obj_id as Ptr) as Ptr
			    
			    return target(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setTarget Lib CocoaLib selector "setTarget:" (obj_id as Ptr, targetID as Ptr)
			    
			    setTarget(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Target As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private target_id As Ptr
	#tag EndProperty

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
			    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, title as CFStringRef)
			    
			    setTitle self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function toolTip lib CocoaLib selector "toolTip" (obj_id as Ptr) as CFStringRef
			    
			    return toolTip(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setToolTip lib CocoaLib selector "setToolTip:" (obj_id as Ptr, toolTip as CFStringRef)
			    
			    setToolTip self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ToolTip As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function view Lib CocoaLib selector "view" (obj_id as Ptr) as Ptr
			    
			    dim viewRef as Ptr = view(self)
			    if viewRef <> nil then
			      return new NSView(viewRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setView Lib CocoaLib selector "setView:" (obj_id as Ptr, view as Ptr)
			    
			    dim viewRef as Ptr
			    if value <> nil then
			      viewRef = value
			    end if
			    
			    setView(self, viewRef)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		View As NSView
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private _menuActionHandler As ActionDelegate
	#tag EndProperty


	#tag Constant, Name = NSLeftMouseDownMask, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLeftMouseDraggedMask, Type = Double, Dynamic = False, Default = \"64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLeftMouseUpMask, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSPeriodicMask, Type = Double, Dynamic = False, Default = \"65536", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TargetClassName, Type = String, Dynamic = False, Default = \"MLNSStatusItemTarget", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HighlightMode"
			Group="Behavior"
			Type="Boolean"
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
			Name="Length"
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
	#tag EndViewBehavior
End Class
#tag EndClass

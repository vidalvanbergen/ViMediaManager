#tag Class
Class NSImageView
Inherits NSControl
	#tag Event
		Sub Action()
		  RaiseEvent   ImageChanged
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma unused base
		  #pragma unused x
		  #pragma unused y
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  #pragma unused hitItem
		End Function
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  #pragma unused obj
		  #pragma unused action
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  #pragma unused obj
		  #pragma unused action
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  #pragma unused obj
		  #pragma unused action
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma unused obj
		  #pragma unused action
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  #pragma unused X
		  #pragma unused Y
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma unused X
		  #pragma unused Y
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function NSClassName() As String
		  return "NSImageViewmacoslib"
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.AllowCopyCutPaste = initAllowCopyCutPaste
		  me.Editable = initEditable
		  me.FocusRingType = initFocusRingType
		  me.FrameStyle = initFrameStyle
		  me.AcceptFocus = initAcceptFocus
		  if me.AcceptFocus then
		    me.TabStop = true
		  end if
		  me.UseFocusRing = initUseFocusRing
		  me.ImageAlignment = initAlignment
		  me.ImageScaling = initScaling
		  me.Image = initImage
		  
		  raiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function AddInstanceMethod(class_id as Ptr, name as String, impl as Ptr, types as String) As Boolean
		  #if targetMacOS
		    soft declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    soft declare function NSSelectorFromString lib CocoaLib (aSelectorName as CFStringRef) as Ptr
		    
		    return class_addMethod(class_id, NSSelectorFromString(name), impl, types)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  dim p as Ptr = NewNSImageView //Invokes all the subclass creation process
		  if p <> nil then
		    self.impl_obj = new NSObject(p)
		  end if
		  ObjectList.Append self
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(impl_obj_id as Ptr) As NSImageView
		  #pragma disableBackgroundTasks
		  
		  dim theSource as NSImageView
		  for each item as NSImageView in ObjectList
		    dim p as Ptr = item.id
		    if p = impl_obj_id then
		      theSource = item
		      exit
		    end if
		  next
		  return theSource
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_ConstructContextualMenu(base as MenuItem, x as integer, y as integer) As Boolean
		  return  RaiseEvent  ConstructContextualMenu( base, x, y )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_ContextualMenuAction(hititem as MenuItem) As Boolean
		  return   RaiseEvent ContextualMenuAction( hititem )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_MouseDown(X as integer, Y as integer) As Boolean
		  
		  return   RaiseEvent MouseDown( X, Y )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_MouseDragged(X as integer, Y as integer)
		  
		  RaiseEvent MouseDrag( X, Y )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_MouseUp(X as integer, Y as integer)
		  
		  RaiseEvent MouseUp( X, Y )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_CanBecomeKeyView(id as Ptr, sel as Ptr) As Boolean
		  #if targetCocoa
		    
		    dim theSource as NSImageView = FindObjectByID( id )
		    if theSource is nil then
		      return false
		    end if
		    
		    return  true
		    
		  #else
		    #pragma unused id
		  #endif
		  
		  // Keep the compiler from complaining
		  #pragma unused sel
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_MouseDown(id as Ptr, sel as Ptr, evt as Ptr)
		  #if targetCocoa
		    dim nse as NSEvent = new NSEvent( evt )
		    dim pt as NSPoint
		    
		    dim theSource as NSImageView = FindObjectByID( id )
		    if theSource is nil then
		      return
		    end if
		    
		    pt = nse.LocationLocalToNSView( theSource, true )
		    call   theSource.Handle_MouseDown( pt.x, pt.y )
		    
		  #else
		    #pragma unused id
		    #pragma unused evt
		  #endif
		  
		  // Keep the compiler from complaining
		  #pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_MouseDragged(id as Ptr, sel as Ptr, evt as Ptr)
		  #if targetCocoa
		    dim nse as NSEvent = new NSEvent( evt )
		    dim pt as NSPoint
		    
		    dim theSource as NSImageView = FindObjectByID( id )
		    if theSource is nil then
		      return
		    end if
		    
		    pt = nse.LocationLocalToNSView( theSource, true )
		    call   theSource.Handle_MouseDragged( pt.x, pt.y )
		    
		    
		  #else
		    #pragma unused id
		    #pragma unused evt
		  #endif
		  
		  // Keep the compiler from complaining
		  #pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_MouseUp(id as Ptr, sel as Ptr, evt as Ptr)
		  #if targetCocoa
		    dim nse as NSEvent = new NSEvent( evt )
		    dim pt as NSPoint
		    
		    dim theSource as NSImageView = FindObjectByID( id )
		    if theSource is nil then
		      return
		    end if
		    
		    pt = nse.LocationLocalToNSView( theSource, true )
		    call   theSource.Handle_MouseUp( pt.x, pt.y )
		    
		  #else
		    #pragma unused id
		    #pragma unused evt
		  #endif
		  
		  // Keep the compiler from complaining
		  #pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_RightMouseDown(id as Ptr, sel as Ptr, evt as Ptr)
		  //Implement rightMouseDown: (NSResponder) because RS does not forward it
		  
		  #if targetMacOS
		    dim x, y as integer
		    
		    x = System.MouseX
		    y = System.MouseY
		    
		    dim theSource as NSImageView = FindObjectByID( id )
		    if theSource is nil then
		      return
		    end if
		    
		    dim base as new MenuItem( "" )
		    dim OK as Boolean
		    dim mi as MenuItem
		    
		    OK = theSource.Handle_ConstructContextualMenu( base, 0, 0 )
		    if OK then
		      mi = base.PopUp( x, y )
		      call   theSource.Handle_ContextualMenuAction( mi )
		    end if
		  #endif
		  
		  // Keep the compiler from complaining
		  #pragma unused sel
		  #pragma unused evt
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeObjCClass(className as String = "NSImageViewmacoslib", superclassName as String = "NSImageView") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  
		  #if targetCocoa
		    soft declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    soft declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    
		    dim newClassId as Ptr = objc_allocateClassPair(NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    soft declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    
		    objc_registerClassPair newClassId
		    const MethodTypeEncoding = "v@:@"
		    
		    
		    const impl_CanBecomeKey_Name = "canBecomeKeyView:"
		    const impl_CanBecomeKey_Encoding = "B@:"
		    const impl_MouseDown_Name = "mouseDown:"
		    const impl_MouseDown_Encoding = "v@:@"
		    const impl_RightMouseDown_Name = "rightMouseDown:"
		    const impl_RightMouseDown_Encoding = "v@:@"
		    const impl_MouseUp_Name = "mouseUp:"
		    const impl_MouseUp_Encoding = "v@:@"
		    const impl_MouseDragged_Name = "mouseDragged:"
		    const impl_MouseDragged_Encoding = "v@:@"
		    
		    
		    if AddInstanceMethod(newClassId, impl_CanBecomeKey_Name, AddressOf impl_CanBecomeKeyView, impl_CanBecomeKey_Encoding) AND _
		      AddInstanceMethod(newClassId, impl_MouseDown_Name, AddressOf impl_MouseDown, impl_MouseDown_Encoding) AND _
		      AddInstanceMethod(newClassId, impl_RightMouseDown_Name, AddressOf impl_RightMouseDown, impl_RightMouseDown_Encoding) AND _
		      AddInstanceMethod(newClassId, impl_MouseUp_Name, AddressOf impl_MouseUp, impl_MouseUp_Encoding) AND _
		      AddInstanceMethod(newClassId, impl_MouseDragged_Name, AddressOf impl_MouseDragged, impl_MouseDragged_Encoding) then
		      return newClassId
		    else
		      dim e as new ObjCException
		      e.Message = "Class " + className + " could not be defined"
		      raise e
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superclassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewNSImageView() As Ptr
		  #if targetCocoa
		    soft declare function alloc lib CocoaLib selector "alloc" (classRef as Ptr) as Ptr
		    soft declare function init lib CocoaLib selector "init" (id as Ptr) as Ptr
		    
		    return init(alloc(ObjCClass))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ObjCClass() As Ptr
		  static p as Ptr = MakeObjCClass
		  
		  return p
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base as MenuItem, x as integer, y as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualMenuAction(hitItem as MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ImageChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X as integer, Y as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X as integer, Y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X as integer, Y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Note, Name = Developer documentation
		The shared methods come from Charles's work, with small modifications
		
		From the Constructor, NewNSImageView() is called. It allocates and init ObjCClass() which actually just calls MakeObjCClass().
		
		MakeObjCClass() is the main method. As Cocoa controls do not have delegates but must be subclassed, MakeObjCClass() actually
		creates a subclass of NSImageView (namely "NSImageViewmacoslib"). Most notably, it implements some NSResponder methods so
		mouse events can be forwarded to the RS control (MouseDown, MouseDrag, MouseUp, ContextualMenu stuff...) which are otherwise
		ignored. For example, Drag&Drop onto the control is managed by Cocoa but not the reverse so MouseDown and MouseDrag must
		be implemented.
		
		In order to work, we also have to use Canvas.AcceptFocus and Canvas.TabStop to use Tab to move the focus.
		
		The Paint event is called but it (really) works only with borderless NSImageView, in which case only the background can be drawn.
	#tag EndNote

	#tag Note, Name = Documentation
		The NSImageView allows you to display images with different presentations: borderless (only the image is displayed), thin black border,
		the Real Studio ImageWell and 2 other presentations (but which are really ugly !).
		
		By contrast with ImageWell, the NSImageView allows (on demand):
		  • To be selected (with a focus ring)
		  • To be modified: by default, it supports an image file to be dropped but you can set AllowCopyCutPaste so the OS will also automatically
		       manage copying, cutting, pasting or clearing the contents (you don't even need to activate the corresponding MenuItems).
		  • Automatic scaling and alignment of images
		  • To invoke a ContextualMenu
		  • To drag the image FROM the NSImageView. Cocoa itself only manages images being dropped on NSImageView.
		
		NOTE:
		Because drag&drop of picture files is managed by the System, you will not see DragEnter, DragExit, DragOver or DropObject. The only
		event which will fire is ImageChanged, after dropping took place.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function allowsCutCopyPaste lib CocoaLib selector "allowsCutCopyPaste" (id as Ptr) as Boolean
			    
			    return  allowsCutCopyPaste( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setAllowsCutCopyPaste lib CocoaLib selector "setAllowsCutCopyPaste:" (id as Ptr, value as boolean)
			    
			    setAllowsCutCopyPaste( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		AllowCopyCutPaste As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function m_isEditable lib CocoaLib selector "isEditable" (id as Ptr) as Boolean
			    
			    return  m_isEditable( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub m_isEditable lib CocoaLib selector "setEditable:" (id as Ptr, value as boolean)
			    
			    m_isEditable( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Editable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function focusRingType lib CocoaLib selector "focusRingType" (id as Ptr) as integer
			    
			    return  focusRingType( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setFocusRingType lib CocoaLib selector "setFocusRingType:" (id as Ptr, frm as integer)
			    
			    setFocusRingType( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		FocusRingType As integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function imageFrameStyle lib CocoaLib selector "imageFrameStyle" (id as Ptr) as integer
			    
			    return  imageFrameStyle( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setImageFrameStyle lib CocoaLib selector "setImageFrameStyle:" (id as Ptr, frm as integer)
			    
			    setImageFrameStyle( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		FrameStyle As integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    dim nsi as NSImage = me.NativeImage
			    
			    if nsi=nil then
			      return nil
			    end if
			    
			    return   nsi.MakePicture
			  #endif
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    dim nsi as NSImage
			    
			    if value=nil then
			      me.NativeImage = nil
			    else
			      nsi = NSImage.CreateFromPicture( value )
			      me.NativeImage = nsi
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Image As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function imageAlignment lib CocoaLib selector "imageAlignment" (id as Ptr) as integer
			    
			    return  imageAlignment( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setImageAlignment lib CocoaLib selector "setImageAlignment:" (id as Ptr, frm as integer)
			    
			    setImageAlignment( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ImageAlignment As integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function imageScaling lib CocoaLib selector "imageScaling" (id as Ptr) as integer
			    
			    return  imageScaling( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setImageScaling lib CocoaLib selector "setImageScaling:" (id as Ptr, frm as integer)
			    
			    setImageScaling( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ImageScaling As integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private impl_obj As NSObject
	#tag EndProperty

	#tag Property, Flags = &h0
		initAcceptFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		initAlignment As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		initAllowCopyCutPaste As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		initEditable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		initFocusRingType As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		initFrameStyle As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		initImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		initScaling As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		initUseFocusRing As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function m_image lib CocoaLib selector "image" (id as Ptr) as Ptr
			    
			    dim p as Ptr = m_image( me.id )
			    if p<>nil then
			      return  new NSImage( p )
			    else
			      return nil
			    end if
			  #endif
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub m_setimage lib CocoaLib selector "setImage:" (id as Ptr, img as Ptr)
			    
			    if value=nil then
			      m_setimage( me.id, nil )
			    else
			      m_setimage( me.id, value.id )
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		NativeImage As NSImage
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared ObjectList() As NSImageView
	#tag EndProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSImageViewDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignBottom, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignBottomLeft, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignBottomRight, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignCenter, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignLeft, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignRight, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignTop, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignTopLeft, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageAlignTopRight, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageFrameButton, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageFrameGrayBezel, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageFrameGroove, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageFrameImageWell, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageFrameNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageFramePhoto, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageScaleAxesIndependently, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageScaleNone, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageScaleProportionallyDown, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSImageScaleProportionallyUpOrDown, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Group="Behavior"
			Type="NSTextAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Right"
				"2 - Center"
				"3 - Justified"
				"4 - Natural"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowCopyCutPaste"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsExpansionToolTips"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Editable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FloatValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FocusRingType"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrameStyle"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Image"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageAlignment"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageScaling"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initAcceptFocus"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initAlignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Center"
				"1 - Top"
				"2 - Top Left"
				"3 - Top Right"
				"4 - Left"
				"5 - Bottom"
				"6 - Bottom Left"
				"7 - Bottom Right"
				"8 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="initAllowCopyCutPaste"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initEditable"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initFocusRingType"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initFrameStyle"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - No Frame"
				"1 - Simple Border"
				"2 - ImageWell"
				"3 - Groove"
				"4 - Button"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initImage"
			Visible=true
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initScaling"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Proportionally Down"
				"1 - Scale to Fit"
				"2 - No Scaling"
				"3 - Proportionally Up or Down"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="initUseFocusRing"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="0.0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underlined"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

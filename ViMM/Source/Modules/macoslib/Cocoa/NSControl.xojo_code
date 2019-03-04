#tag Class
Class NSControl
Inherits Canvas
	#tag Event
		Sub Close()
		  raiseEvent Close
		  
		  if ControlMap.HasKey(self.id) then
		    ControlMap.Remove(self.id)
		  end if
		  
		  
		  if TargetMap.HasKey(me.TargetID) then
		    TargetMap.Remove me.TargetID
		  end if
		  
		  #if targetCocoa
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    if me.targetID <> nil then
		      release me.targetID
		      me.targetID = nil
		    end if
		  #endif
		  
		  //I think that self.id is released by the superview.
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //
		  
		  // Keep the compiler from complaining
		  #pragma unused Key
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  //
		  
		  // Keep the compiler from complaining
		  #pragma unused Key
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #if targetMacOS
		    dim frame as NSRect
		    frame.x = 0.0
		    frame.y = 0.0
		    frame.w = self.Width
		    frame.h = self.Height
		    
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as NSRect) as Ptr
		    
		    self.m_id = initWithFrame(Allocate(self.NSClassName), frame)
		    if self.id = nil then
		      return
		    end if
		    
		    
		    declare sub addSubview lib CocoaLib selector "addSubview:" (id as Ptr, aView as Ptr)
		    declare sub setAutoresizingMask lib CocoaLib selector "setAutoresizingMask:" (id as Ptr, mask as Integer)
		    declare sub setFrame lib CocoaLib selector "setFrame:" (id as Ptr, frameRect as NSRect)
		    
		    const NSViewWidthSizable = 2
		    const NSViewHeightSizable = 16
		    const NSViewMinYMargin = 8
		    
		    dim subview as Ptr = CreateSubview(frame)
		    if subview = nil then
		      subview = self.id
		    else
		      
		    end if
		    
		    
		    addSubview Ptr(self.Handle), subview
		    
		    //here we lock the control to the canvas superview so that resizing is handled by the canvas.
		    setAutoresizingMask subview, NSViewWidthSizable or NSViewHeightSizable
		    setAutoresizingMask self.id, NSViewWidthSizable or NSViewHeightSizable
		    
		    
		    //here we set up an Objective-C delegate to be the target of the NSControl action.
		    declare function init lib CocoaLib selector "init" (id as Ptr) as Ptr
		    
		    self.TargetID = init(Allocate(TargetClass))
		    
		    declare function NSSelectorFromString lib CocoaLib (aSelectorName as CFStringRef) as Ptr
		    declare sub setAction lib CocoaLib selector "setAction:" (id as Ptr, aSelector as Ptr)
		    declare sub setTarget lib CocoaLib selector "setTarget:" (id as Ptr, anObject as Ptr)
		    
		    setAction self.id, NSSelectorFromString("action:")
		    setTarget self.id, self.TargetID
		    TargetMap.Value(self.TargetID) = AddressOf self.HandleAction
		    
		    ControlMap.Value(self.id) = self
		    
		    //Set the use selected font
		    InvalidateFont
		  #endif
		  
		  raiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  // handle enabling and disabling control
		  
		  #if targetCocoa
		    declare function isEnabled Lib CocoaLib selector "isEnabled" (id as Ptr) as Boolean
		    declare sub setEnabled Lib CocoaLib selector "setEnabled:" (id as Ptr, flag as Boolean)
		    
		    if self.enabled <> isEnabled(self.id) then
		      setEnabled(self.id, self.enabled)
		    end if
		  #endif
		  
		  #if RBVersion >= 2012.02
		    raiseEvent Paint(g, areas)
		  #else
		    RaiseEvent Paint(g)
		  #endif
		End Sub
	#tag EndEvent


	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub ActionDelegate()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function AddInstanceMethod(class_id as Ptr, name as String, impl as Ptr, types as String) As Boolean
		  #if targetMacOS
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    declare function NSSelectorFromString lib CocoaLib (aSelectorName as CFStringRef) as Ptr
		    
		    return class_addMethod(class_id, NSSelectorFromString(name), impl, types)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Allocate(class_id as Ptr) As Ptr
		  #if targetCocoa
		    if class_id = nil then
		      return nil
		    end if
		    
		    declare function alloc lib CocoaLib selector "alloc" (classRef as Ptr) as Ptr
		    
		    return alloc(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Allocate(NSClassName as String) As Ptr
		  #if targetCocoa
		    declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    declare function alloc lib CocoaLib selector "alloc" (classRef as Ptr) as Ptr
		    
		    dim class_id as Ptr = NSClassFromString(NSClassName)
		    if class_id <> nil then
		      return alloc(class_id)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused NSClassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CalcSize()
		  
		  #if TargetMacOS then
		    declare sub calcSize lib CocoaLib selector "calcSize" (obj_id as Ptr)
		    
		    calcSize self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cell() As Ptr
		  
		  #if targetCocoa
		    if me.id = nil then
		      return nil
		    end if
		    
		    declare function cell lib CocoaLib selector "cell" (id as Ptr) as Ptr
		    
		    return cell(me.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(left as integer, top as integer, width as integer, height as integer)
		  
		  #if TargetMacOS then
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as Cocoa.NSRect) as Ptr
		    
		    dim frameRect as Cocoa.NSRect
		    frameRect.x = left
		    frameRect.y = top
		    frameRect.w = width
		    frameRect.h = height
		    
		    self.m_id = initWithFrame( Allocate(Cocoa.NSClassFromString(self.NSClassName)), frameRect )
		  #else
		    #pragma Unused left
		    #pragma Unused top
		    #pragma Unused width
		    #pragma Unused height
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(obj_id as Ptr, hasOwnership as Boolean = false)
		  
		  'if checkForClass<>"" then
		  'if NOT Cocoa.InheritsFromClass( obj_id, checkForClass ) then
		  'raise new macoslibException( "The passed pointer does not match the wanted class """ + checkForClass + """" )
		  'end if
		  'end if
		  
		  self.m_id = obj_id
		  
		  if not hasOwnership then
		    call self.Retain
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ControlMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchHandleAction(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if TargetMap.HasKey(id) then
		    dim action as ActionDelegate = TargetMap.Value(id)
		    action.Invoke()
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawCell(aCell as NSCell)
		  
		  #if TargetMacOS then
		    declare sub drawCell lib CocoaLib selector "drawCell:" (obj_id as Ptr, aCell as Ptr)
		    
		    drawCell self, aCell
		  #else
		    #pragma Unused aCell
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawCellInside(aCell as NSCell)
		  
		  #if TargetMacOS then
		    declare sub drawCellInside lib CocoaLib selector "drawCellInside:" (obj_id as Ptr, aCell as Ptr)
		    
		    drawCellInside self, aCell
		  #else
		    #pragma Unused aCell
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FindByID(obj_id as Ptr) As NSControl
		  return ControlMap.Lookup(obj_id, nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleAction()
		  raiseEvent Action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Initialize(newobj_id as Ptr, frame as NSRect) As Ptr
		  #if targetCocoa
		    if newobj_id = nil then
		      return nil
		    end if
		    
		    //if the Initialize event handler is unimplemented, as may often be the case, it will return nil (actually, it's not invoked).
		    dim obj_id as Ptr = raiseEvent Initialize(newobj_id)
		    if obj_id = nil then
		      declare function init lib CocoaLib selector "init" (id as Ptr) as Ptr
		      
		      obj_id = init(newobj_id)
		    end if
		    
		    return obj_id
		    
		  #else
		    #pragma unused newobj_id
		  #endif
		  
		  // Keep the compiler from complaining
		  #pragma unused frame
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateFont()
		  //# Invalidate the font after changing TextFont, TextSize, Bold or Italic
		  
		  #if TargetMacOS
		    declare sub setFont lib CocoaLib selector "setFont:" (id as Ptr, theFont as Ptr)
		    
		    //Recompute the correct NSFont and apply it to the control
		    dim nsf as NSFont
		    dim nsfm as new NSFontManager
		    
		    nsf = nsfm.GetFont( TextFont, TextSize, bold, italic )
		    if nsf<>nil then
		      setFont( me.id, nsf.id )
		    else
		      //Couldn't get the specified font description
		      //We should try to find the closest match
		      //For now, we do nothing
		      break
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeTargetClass(className as String = NSControlTarget, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  
		  #if targetCocoa
		    declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    
		    dim newClassId as Ptr = objc_allocateClassPair(NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    
		    objc_registerClassPair newClassId
		    const MethodTypeEncoding = "v@:@"
		    
		    if AddInstanceMethod(newClassId, "action:", AddressOf DispatchHandleAction, MethodTypeEncoding) then
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
		Sub NeedsDisplay()
		  
		  #if TargetMacOS then
		    if me.id = nil then
		      return
		    end if
		    
		    declare sub setNeedsDisplay lib CocoaLib selector "setNeedsDisplay" (obj_id as Ptr)
		    
		    setNeedsDisplay self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NSClassName() As String
		  dim name as String = raiseEvent NSClassName
		  if name = "" then
		    //we'll try the class name itself.
		    name = Introspection.GetType(self).Name
		  end if
		  return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(obj as NSControl) As Integer
		  if obj <> nil then
		    return Integer(self.id) - Integer(obj.id)
		  else
		    return 1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return me.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  #if TargetMacOS
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    release self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Retain() As NSControl
		  #if TargetMacOS
		    declare function retain lib CocoaLib selector "retain" (id as Ptr) as Ptr
		    
		    if self.id <> nil then
		      dim p as Ptr = retain(self.id)
		      #pragma unused p
		      return self
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectCell(aCell as NSCell)
		  
		  #if TargetMacOS then
		    declare sub selectCell lib CocoaLib selector "selectCell:" (obj_id as Ptr, aCell as Ptr)
		    
		    selectCell self, aCell
		  #else
		    #pragma Unused aCell
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SizeToFit()
		  
		  #if TargetMacOS then
		    declare sub sizeToFit lib CocoaLib selector "sizeToFit" (obj_id as Ptr)
		    
		    sizeToFit self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static class_id as Ptr = MakeTargetClass
		  return class_id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCell(aCell as NSCell)
		  
		  #if TargetMacOS then
		    declare sub updateCell lib CocoaLib selector "updateCell:" (obj_id as Ptr, aCell as Ptr)
		    
		    updateCell self, aCell
		  #else
		    #pragma Unused aCell
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCellInside(aCell as NSCell)
		  
		  #if TargetMacOS then
		    declare sub updateCellInside lib CocoaLib selector "updateCellInside:" (obj_id as Ptr, aCell as Ptr)
		    
		    updateCellInside self, aCell
		  #else
		    #pragma Unused aCell
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CreateSubview(frame as Cocoa.NSRect) As Ptr
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Initialize(class_id as Ptr) As Ptr
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSClassName() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g as Graphics, areas() as REALbasic.Rect = Nil)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    if me.id <> nil then
			      declare function getAlignment lib CocoaLib selector "alignment" (id as Ptr) as NSTextAlignment
			      
			      return getAlignment(me.id)
			    else
			      return NSTextAlignment.Natural
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setAlignment lib CocoaLib selector "setAlignment:" (obj_id as Ptr, value as NSTextAlignment)
			    
			    setAlignment self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Alignment As NSTextAlignment
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    if me.id <> nil then
			      declare function getAllowsExpansionToolTips lib CocoaLib selector "allowsExpansionToolTips" (id as Ptr) as Boolean
			      
			      return getAllowsExpansionToolTips(me.id)
			    else
			      return False
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setAllowsExpansionToolTips lib CocoaLib selector "setAllowsExpansionToolTips:" (obj_id as Ptr, value as Boolean)
			    
			    setAllowsExpansionToolTips self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		AllowsExpansionToolTips As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    if me.id <> nil then
			      declare function getAttributedStringValue lib CocoaLib selector "attributedStringValue" (id as Ptr) as Ptr
			      
			      return new NSAttributedString( getAttributedStringValue(me.id) )
			    else
			      return New NSAttributedString( "" )
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setAttributedStringValue lib CocoaLib selector "setAttributedStringValue:" (obj_id as Ptr, value as Ptr)
			    
			    setAttributedStringValue(self, value)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		AttributedStringValue As NSAttributedString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function autoresizesSubviews lib CocoaLib selector "autoresizesSubviews" (obj_id as Ptr) as Boolean
			    
			    if self.id <> nil then
			      return autoresizesSubviews(self)
			    end if
			  #endif
			End Get
		#tag EndGetter
		autoresizesSubviews As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Bold As Boolean = false
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    if me.id = nil then
			      dim r as NSRect
			      return r
			    end if
			    
			    declare function getBounds lib CocoaLib selector "bounds" (obj_id as Ptr) as Cocoa.NSRect
			    
			    return getBounds( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setBounds lib CocoaLib selector "setBounds:" (id as Ptr, frameRect as Cocoa.NSRect)
			    
			    setBounds me.id, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Bounds As Cocoa.NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return self.Frame
			End Get
		#tag EndGetter
		Private debugFrame As NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare function getDescription lib CocoaLib selector "description" (obj_id as Ptr) as CFStringRef
			      
			      return getDescription( self )
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if me.id = nil then
			      return 0.0
			    end if
			    
			    declare function doubleValue lib CocoaLib selector "doubleValue" (id as Ptr) as Double
			    
			    return doubleValue(me.id)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setDoubleValue lib CocoaLib selector "setDoubleValue:"  (id as Ptr, aDouble as Double)
			    
			    setDoubleValue me.id, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		DoubleValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    if me.id <> nil then
			      declare function getFloatValue lib CocoaLib selector "floatValue" (id as Ptr) as Double
			      
			      
			      return getFloatValue(me.id)
			    else
			      return 0.0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setFloatValue lib CocoaLib selector "setFloatValue:"  (id as Ptr, aFloat as Double)
			    
			    setFloatValue me.id, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		FloatValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function getFont lib CocoaLib selector "font" (id as Ptr) as Ptr
			    
			    return new NSFont( getFont( me.id ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setFont lib CocoaLib selector "setFont:" (id as Ptr, fontObject as Ptr)
			    
			    setFont me.id, value
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
			  
			  #if TargetCocoa
			    declare function getFormatter lib CocoaLib selector "formatter" (id as Ptr) as Ptr
			    
			    return new NSFormatter( getFormatter( me.id ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setFormatter lib CocoaLib selector "setFormatter:" (id as Ptr, newFormatter as Ptr)
			    
			    setFormatter me.id, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Formatter As NSFormatter
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if me.id <> nil then
			      declare function frame lib CocoaLib selector "frame" (id as Ptr) as NSRect
			      
			      return frame(me.id)
			    else
			      dim r as NSRect
			      return r
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setFrame lib CocoaLib selector "setFrame:" (id as Ptr, frameRect as NSRect)
			    
			    setFrame me.id, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Frame As Cocoa.NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.m_id
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    if me.id <> nil then
			      declare function getIntegerValue lib CocoaLib selector "integerValue" (id as Ptr) as Integer
			      
			      
			      return getIntegerValue(me.id)
			    else
			      return -1
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setIntegerValue lib CocoaLib selector "setIntegerValue:"  (id as Ptr, anInteger as integer)
			    
			    setIntegerValue me.id, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		IntegerValue As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function isFlipped lib CocoaLib selector "isFlipped" (id as Ptr) as Boolean
			    
			    return isFlipped(self)
			  #endif
			End Get
		#tag EndGetter
		IsFlipped As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Italic As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden = true ) Private m_id As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    if me.id <> Nil then
			      return New NSObject( me.id )
			    end if
			  #endif
			  
			  '#if TargetMacOS
			  'if me.id <> nil then
			  'declare function getObjectValue lib CocoaLib selector "objectValue" (id as Ptr) as Ptr
			  '
			  '
			  'return New NSObject( getObjectValue(me.id) )
			  'else
			  'return Nil
			  'end if
			  '#endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  if value <> nil and value.id <> nil then
			    self.m_id = value.id
			  end if
			End Set
		#tag EndSetter
		ObjectValue As NSObject
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if me.id <> nil then
			      declare function stringValue lib CocoaLib selector "stringValue" (id as Ptr) as Ptr
			      
			      return new CFString(stringValue(me.id), not CFString.hasOwnership)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if me.id = nil then
			      return
			    end if
			    
			    declare sub setStringValue lib CocoaLib selector "setStringValue:" (obj_id as Ptr, value as CFStringRef)
			    
			    setStringValue self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		StringValue As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TargetID As Ptr
	#tag EndProperty

	#tag Property, Flags = &h0
		TextFont As String = "System"
	#tag EndProperty

	#tag Property, Flags = &h0
		TextSize As double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h0
		Underlined As Boolean = false
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      return New NSView( self )
			    end if
			  #endif
			End Get
		#tag EndGetter
		View As NSView
	#tag EndComputedProperty


	#tag Constant, Name = NSControlTarget, Type = String, Dynamic = False, Default = \"NSControlTarget", Scope = Private
	#tag EndConstant


	#tag Enum, Name = NSTextAlignment, Type = Integer, Flags = &h0
		Left
		  Right
		  Center
		  Justified
		Natural
	#tag EndEnum

	#tag Enum, Name = NSWritingDirection, Type = Integer, Flags = &h0
		Natural = -1
		  LeftToRight = 0
		RightToLeft = 1
	#tag EndEnum


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
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
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

#tag Module
Protected Module WindowExtensions
	#tag Method, Flags = &h0
		Sub AddChildWindowOrderedAbove(extends wParent as Window, wChild as Window)
		  //# Adds a given window as a child window of the window.
		  
		  //@After the childWindow is added as a child of the window, it is maintained in relative position _
		  // indicated by orderingMode for subsequent ordering operations involving either window. _
		  // While this attachment is active, moving childWindow will not cause the window to move _
		  // (as in sliding a drawer in or out), but moving the window will cause childWindow to move.
		  
		  //@Note that you should not create cycles between parent and child windows. _
		  // For example, you should not add window B as child of window A, then add window A as a child of window B.
		  
		  //@This code will summon the ChildWindow but leaves it inactive. _
		  // You'll still have to manually call the ChildWindow.Show method to 'activate' the ChildWindow.
		  
		  #if TargetCocoa then
		    declare sub addChildWindow lib CocoaLib selector "addChildWindow:ordered:" (WindowRef As WindowPtr, ChildWindowRef as WindowPtr, OrderingMode as Integer)
		    
		    addChildWindow wParent, wChild, 1
		  #else
		    #pragma Unused wParent
		    #pragma Unused wChild
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddChildWindowOrderedBelow(extends wParent as Window, wChild as Window)
		  //# Adds a given window as a child window of the window.
		  
		  //@After the childWindow is added as a child of the window, it is maintained in relative position _
		  // indicated by orderingMode for subsequent ordering operations involving either window. _
		  // While this attachment is active, moving childWindow will not cause the window to move _
		  // (as in sliding a drawer in or out), but moving the window will cause childWindow to move.
		  
		  //@Note that you should not create cycles between parent and child windows. _
		  // For example, you should not add window B as child of window A, then add window A as a child of window B.
		  
		  #if TargetCocoa then
		    declare sub addChildWindow lib CocoaLib selector "addChildWindow:ordered:" (WindowRef as WindowPtr, ChildWindowRef as WindowPtr, OrderingMode as Integer)
		    
		    addChildWindow wParent, wChild, -1
		  #else
		    #pragma Unused wParent
		    #pragma Unused wChild
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllowToolTipsWhenApplicationIsInactive(extends w as Window) As Boolean
		  //# Returns __True__ if the window can display tooltips even when the application is in the background; otherwise returns __False__
		  
		  #if TargetCocoa then
		    declare function allowsToolTipsWhenApplicationIsInactive lib CocoaLib Selector "allowsToolTipsWhenApplicationIsInactive" (WindowRef as WindowPtr) as Boolean
		    
		    return allowsToolTipsWhenApplicationIsInactive(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AllowToolTipsWhenApplicationIsInactive(extends w as Window, assigns Value as Boolean)
		  //# Indicates whether the window can display tooltips even when the application is in the background.
		  
		  #if TargetCocoa then
		    declare sub setAllowsToolTipsWhenApplicationIsInactive lib CocoaLib Selector "setAllowsToolTipsWhenApplicationIsInactive:" (WindowRef as WindowPtr, Flag as Boolean)
		    
		    setAllowsToolTipsWhenApplicationIsInactive w, Value
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AlwaysOnTop(extends w as Window, assigns Value as Boolean)
		  //# Sets the window’s window level to floating window level.
		  
		  #if TargetCocoa then
		    Const NSNormalWindowLevel       = 0
		    Const NSFloatingWindowLevel     = 3
		    Const NSModalPanelWindowLevel   = 8
		    Const NSDockWindowLevel         = 20
		    Const NSMainMenuWindowLevel     = 24
		    Const NSPopUpMenuWindowLevel    = 101
		    Const NSScreenSaverWindowLevel  = 1001
		    
		    declare sub NSWindowSetLevel lib CocoaLib selector "setLevel:" (WindowRef as WindowPtr, Level as Integer)
		    if Value then
		      NSWindowSetLevel w, NSFloatingWindowLevel
		    else
		      NSWindowSetLevel w, NSNormalWindowLevel
		    end if
		    
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AspectRatio(extends w as Window, width as Integer, height as Integer)
		  
		  #if TargetCocoa then
		    declare sub setAspectRatio lib CocoaLib selector "setAspectRatio:" (WindowRef as WindowPtr, InSize as Cocoa.NSSize )
		    
		    dim ratio as Cocoa.NSSize
		    ratio.width = width
		    ratio.height = height
		    
		    setAspectRatio( w, ratio )
		  #else
		    #pragma Unused w
		    #pragma Unused width
		    #pragma Unused height
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BackgroundColor(extends w as Window, assigns Value as Color)
		  //# Gives the window a transparent background color, resulting in the window becoming see-through while anything on the window remains visible.
		  
		  //@ The titlebar and close/minimize/maximize buttons will remain visible as well, for the best effect use a borderless window.
		  
		  //@ This method is perfect for a custom or image shaped splash-window effect.
		  
		  #if TargetCocoa
		    // Get the reference to the NSColor class so we can call one of the class methods
		    declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    dim NSColorClassRef as Ptr = NSClassFromString("NSColor")
		    
		    // Now ask the NSColor class to create a new NSColor from the values we have
		    declare function colorWithDeviceRed lib CocoaLib selector "colorWithDeviceRed:green:blue:alpha:" (classRef as Ptr, red as Double, green as Double, blue as Double, alpha as Double) as Ptr
		    dim NSColorInstance as Ptr
		    #if RBVersion >= 2011.04
		      NSColorInstance = colorWithDeviceRed(NSColorClassRef, value.Red / 255, value.Green / 255, value.Blue / 255, Value.Alpha / 255)
		    #else
		      NSColorInstance = colorWithDeviceRed(NSColorClassRef, value.Red / 255, value.Green / 255, value.Blue / 255, 255 )
		    #endif
		    
		    // Set the features on the window
		    declare sub setAlphaValue lib CocoaLib selector "setAlphaValue:" (WindowRef as WindowPtr, AlphaValue as Double)
		    declare sub setOpaque lib CocoaLib selector "setOpaque:" (WindowRef as WindowPtr, IsOpague as Boolean)
		    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" (WindowRef as WindowPtr, inNSColorInstance as Ptr)
		    
		    setAlphaValue w, 1.0
		    setOpaque w, false
		    setBackgroundColor w, NSColorInstance
		    
		    // Force the window to update so we get the proper shadowing
		    w.InvalidateShadow
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BorderBottomThickness(extends w as Window) As Integer
		  //# Indicates the thickness of the bottom border of the window.
		  
		  #if TargetCocoa then
		    if IsLeopard then
		      declare function ContentBorderThicknessForEdge lib CocoaLib selector "contentBorderThicknessForEdge:" (WindowRef as WindowPtr, Edge as Integer) as Double
		      
		      return ContentBorderThicknessForEdge( w, 1 )
		    end if
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BorderBottomThickness(extends w as Window, assigns Value as Integer)
		  //# Specifies the thickness of the bottom border of the window.
		  
		  #if TargetCocoa then
		    if IsLeopard then
		      declare sub setBackingType lib CocoaLib selector "setBackingType:" (WindowRef as WindowPtr, BackingType as Integer)
		      declare sub setAutorecalculatesContentBorderThicknessForEdge lib CocoaLib selector "setAutorecalculatesContentBorderThickness:forEdge:" (WindowRef as WindowPtr, Flag as Boolean, Edge as Integer)
		      declare sub setContentBorderThicknessForEdge lib CocoaLib selector "setContentBorderThickness:forEdge:" (WindowRef as WindowPtr, Thickness as Double, Edge as Integer)
		      
		      setBackingType w, 2 // NSBackingStoreBuffered
		      setAutorecalculatesContentBorderThicknessForEdge w, false, 1 // Do not recalculate the border thickness automatically
		      setContentBorderThicknessForEdge w, Value, 1
		    end if
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BorderTopThickness(extends w as Window) As Integer
		  //# Specifies the thickness of the top border of the window.
		  
		  //@ Only works on textured windows, value can be between -21 to w.Height
		  
		  #if TargetCocoa then
		    if IsLeopard and w.Frame = Window.FrameTypeMetal then
		      declare function ContentBorderThicknessForEdge lib CocoaLib selector "contentBorderThicknessForEdge:" (WindowRef as WindowPtr, Edge as Integer) as Double
		      
		      return ContentBorderThicknessForEdge( w, 3 )
		    end if
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BorderTopThickness(extends w as Window, assigns Value as Integer)
		  //# Specifies the thickness of the top border of the window.
		  
		  //@ Only works on textured windows, value can be between -21 to w.Height
		  
		  #if TargetCocoa then
		    if IsLeopard and w.Frame = Window.FrameTypeMetal then
		      declare sub setBackingType lib CocoaLib selector "setBackingType:" (WindowRef as WindowPtr, BackingType as Integer)
		      declare sub setAutorecalculatesContentBorderThicknessForEdge lib CocoaLib selector "setAutorecalculatesContentBorderThickness:forEdge:" (WindowRef as WindowPtr, Flag as Boolean, Edge as Integer)
		      declare sub setContentBorderThicknessForEdge lib CocoaLib selector "setContentBorderThickness:forEdge:" (WindowRef as WindowPtr, Thickness as Double, Edge as Integer)
		      
		      setBackingType w, 2 // NSBackingStoreBuffered
		      setAutorecalculatesContentBorderThicknessForEdge w, false, 3 // Do not recalculate the border thickness automatically
		      setContentBorderThicknessForEdge w, Value, 3
		    end if
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanHide(extends w as Window) As Boolean
		  //# Specifies whether the window can be hidden when its application becomes hidden.
		  
		  #If TargetCocoa then
		    declare function canHide lib CocoaLib selector "canHide" (WindowRef as WindowPtr) as Boolean
		    
		    return canHide( w )
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CanHide(extends w as Window, assigns Value as Boolean)
		  //# Specifies whether the window can be hidden when its application becomes hidden.
		  
		  #If TargetCocoa then
		    declare sub setCanHide lib CocoaLib selector "setCanHide:" (WindowRef as WindowPtr, Flag as Boolean)
		    
		    setCanHide w, Value
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Center(extends w as Window)
		  //# Sets the window’s location to the center of the screen.
		  
		  #if TargetCocoa then
		    declare sub center lib CocoaLib selector "center" (WindowRef as WindowPtr)
		    center w
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExcludedFromWindowsMenu(extends w as Window) As Boolean
		  //# Indicates whether the window is excluded from the application’s Windows menu.
		  
		  #if TargetCocoa then
		    declare function isExcludedFromWindowsMenu lib CocoaLib selector "isExcludedFromWindowsMenu" (WindowRef as WindowPtr) as Boolean
		    
		    return isExcludedFromWindowsMenu(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExcludedFromWindowsMenu(extends w as Window, assigns Value as Boolean)
		  //# Specifies whether the window’s title is omitted from the application’s Windows menu.
		  
		  #if TargetCocoa then
		    declare sub setExcludedFromWindowsMenu lib CocoaLib selector "setExcludedFromWindowsMenu:" (WindowRef as WindowPtr, Flag as Boolean)
		    
		    setExcludedFromWindowsMenu w, Value
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameAutosaveName(extends w as Window) As String
		  //# Get the autosave name for the Window's frame
		  
		  //@ See RestoreFrameFromWindowName
		  
		  #if TargetMacOS
		    declare function frameAutosaveName lib CocoaLib selector "frameAutosaveName" (id as Ptr) as Ptr
		    
		    return RetainedStringValue(frameAutosaveName(Ptr(w.Handle)))
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameAutosaveName(extends w as Window, saveName as String) As Boolean
		  //# Sets the name used to automatically save the window's frame in the application's preferences
		  
		  //@ See RestoreFrameFromWindowName
		  
		  #if TargetMacOS
		    declare function setFrameAutosaveName lib CocoaLib selector "setFrameAutosaveName:" (id as Ptr, name as CFStringRef) as Boolean
		    
		    //returns false if the name is already in use for another NSWindow object in the application.
		    return setFrameAutosaveName(WindowRef(w), saveName)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameString(extends w as Window) As String
		  //# Returns a string representation of the window’s frame rectangle.
		  
		  #if TargetMacOS
		    declare function stringWithSavedFrame lib CocoaLib selector "stringWithSavedFrame" (WindowRef as WindowPtr) as CFStringRef
		    
		    return stringWithSavedFrame(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameString(extends w as Window, assigns Value as String)
		  //# Returns a string representation of the window’s frame rectangle.
		  
		  #if TargetMacOS
		    declare sub setFrameFromString lib CocoaLib selector "setFrameFromString:" (WindowRef as WindowPtr, FrameString as CFStringRef)
		    
		    setFrameFromString w, Value
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullSizeContentView(extends w as Window) As Boolean
		  #if TargetCocoa then
		    if IsYosemite then
		      declare function styleMask lib CocoaLib selector "styleMask" (WindowRef as WindowPtr) as UInt32
		      
		      return ( styleMask(w) and Integer( NSWindow.NSWindowMask.FullSizeContentView ) ) <> 0
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FullSizeContentView(extends w as Window, assigns value as Boolean)
		  
		  #if TargetCocoa then
		    if IsYosemite then
		      declare function styleMask lib CocoaLib selector "styleMask" (WindowRef as WindowPtr) as UInt32
		      declare sub setStyleMask lib CocoaLib selector "setStyleMask:" (WindowRef as WindowPtr, styleMask as UInt32)
		      
		      dim WindowStyleMask as UInt32
		      
		      if value then
		        WindowStyleMask = StyleMask(w) or Integer( NSWindow.NSWindowMask.FullSizeContentView )
		      else
		        WindowStyleMask = StyleMask(w) and NOT Integer( NSWindow.NSWindowMask.FullSizeContentView )
		      end if
		      
		      setStyleMask w, WindowStyleMask
		    else
		      #pragma Unused value
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasShadow(extends w as Window) As Boolean
		  //# Specifies whether the window has a shadow.
		  
		  #if TargetCocoa then
		    declare function hasShadow lib CocoaLib selector "hasShadow" (WindowRef as WindowPtr) as Boolean
		    
		    Return hasShadow(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HasShadow(extends w as Window, assigns Value as Boolean)
		  //# Specifies whether the window has a shadow.
		  
		  #if TargetCocoa then
		    declare sub setHasShadow lib CocoaLib selector "setHasShadow:" (WindowRef as WindowPtr, Flag as Boolean)
		    
		    setHasShadow w, Value
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HidesOnDeactivate(extends w as Window) As Boolean
		  //# Specifies whether the window is removed from the screen when the application is inactive.
		  
		  #if TargetCocoa then
		    declare function hidesOnDeactivate lib CocoaLib selector "hidesOnDeactivate" (WindowRef as WindowPtr) as Boolean
		    Return  hidesOnDeactivate(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HidesOnDeactivate(extends w as Window, assigns Value as Boolean)
		  //# Specifies whether the window is removed from the screen when the application is inactive.
		  
		  #if TargetCocoa then
		    declare sub setHidesOnDeactivate lib CocoaLib selector "setHidesOnDeactivate:" (WindowRef as WindowPtr, Flag as Boolean)
		    setHidesOnDeactivate w, Value
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HideWindowButton(Extends w as Window, button as NSWindowButton, assigns Value as Boolean)
		  
		  #if TargetMacOS then
		    Declare Function standardWindowButton Lib CocoaLib Selector "standardWindowButton:" (NSWindow As Ptr, windowButtonKind As NSWindowButton) As Ptr
		    Declare Sub setHidden Lib CocoaLib selector "setHidden:" (obj_id as Ptr, value as Boolean)
		    
		    setHidden(standardWindowButton(Ptr(w.Handle), button), Value)
		  #else
		    #pragma Unused w
		    #pragma Unused button
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IgnoresMouseEvents(extends w as Window) As Boolean
		  //# Specifies whether the window is transparent to mouse clicks and other mouse events, allowing overlay windows.
		  
		  #if TargetCocoa then
		    declare function ignoresMouseEvents lib CocoaLib selector "ignoresMouseEvents" (WindowRef as WindowPtr) as Boolean
		    
		    return ignoresMouseEvents(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IgnoresMouseEvents(extends w as Window, assigns Value as Boolean)
		  //# Specifies whether the window is transparent to mouse clicks and other mouse events, allowing overlay windows.
		  
		  #if TargetCocoa then
		    declare sub setIgnoresMouseEvents lib CocoaLib selector "setIgnoresMouseEvents:" (WindowRef as WindowPtr, Flag as Boolean)
		    
		    setIgnoresMouseEvents w, Value
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateShadow(extends w as Window)
		  //# Invalidates the window shadow so that it is recomputed based on the current window shape.
		  
		  #if TargetCocoa then
		    declare sub invalidateShadow lib CocoaLib selector "invalidateShadow" (WindowRef as WindowPtr)
		    
		    invalidateShadow w
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isMiniaturized(extends w as Window) As Boolean
		  //# Indicates whether the window is minimized.
		  
		  #if TargetCocoa then
		    declare function isMiniaturized lib CocoaLib selector "isMiniaturized" (WindowRef as WindowPtr) as Boolean
		    
		    return isMiniaturized(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isMovable(extends w as Window) As Boolean
		  //# Indicates whether the window can be moved by clicking in its title bar or background.
		  
		  #if TargetCocoa then
		    if IsSnowLeopard then
		      declare function isMovable lib CocoaLib selector "isMovable" (WindowRef as WindowPtr) as Boolean
		      
		      return isMovable(w)
		    end if
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub isMovable(extends w as Window, assigns Value as Boolean)
		  //# Indicates whether the window can be moved by clicking in its title bar or background.
		  
		  #if TargetCocoa then
		    if IsSnowLeopard then
		      declare sub setMovable lib CocoaLib selector "setMovable:" (WindowRef as WindowPtr, Flag as Boolean)
		      
		      setMovable w, Value
		    end if
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isMovableByWindowBackground(extends w as Window) As Boolean
		  //# Indicates whether the window is movable by clicking and dragging anywhere in its background.
		  
		  //@ A window with a style mask of NSTexturedBackgroundWindowMask is movable by background by default. _
		  //  Sheets and drawers cannot be movable by window background.
		  
		  #if TargetCocoa then
		    declare function isMovableByWindowBackground lib CocoaLib selector "isMovableByWindowBackground" (WindowRef as WindowPtr) as Boolean
		    
		    return isMovableByWindowBackground(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub isMovableByWindowBackground(extends w as Window, assigns Value as Boolean)
		  //# Sets whether the window is movable by clicking and dragging anywhere in its background.
		  
		  #if TargetCocoa then
		    declare sub setMovableByWindowBackground lib CocoaLib selector "setMovableByWindowBackground:" (WindowRef as WindowPtr, Flag as Boolean)
		    
		    setMovableByWindowBackground w, Value
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isOnActiveSpace(extends w as Window) As Boolean
		  //# Indicates whether the window is on the currently active space.
		  
		  #if TargetCocoa then
		    If IsSnowLeopard Then
		      declare function isOnActiveSpace lib CocoaLib selector "isOnActiveSpace" (WindowRef as WindowPtr) as Boolean
		      
		      Return isOnActiveSpace(w)
		    End If
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MiniWindowTitle(extends w as Window) As String
		  //# Returns the title displayed in the window’s minimized window.
		  
		  #if TargetCocoa then
		    declare function miniwindowTitle lib CocoaLib selector "miniwindowTitle" (WindowRef as WindowPtr) as CFStringRef
		    
		    return miniwindowTitle(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MiniWindowTitle(extends w as Window, Assigns Value as String)
		  //# Sets the title of the window’s miniaturized counterpart to a given string and redisplays it.
		  
		  //@A minimized window’s title normally reflects that of its full-size counterpart, _
		  // abbreviated to fit if necessary. _
		  // Although this method allows you to set the minimized window’s title explicitly, _
		  // changing the full-size NSWindow object’s title automatically changes the minimized window’s title as well.
		  
		  #if TargetCocoa then
		    declare sub setMiniwindowTitle lib CocoaLib selector "setMiniwindowTitle:" (WindowRef as WindowPtr, Title as CFStringRef)
		    
		    setMiniwindowTitle w, Value
		  #else
		    #pragma Unused w
		    #pragma unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSWindowObject(extends w as Window) As NSWindow
		  
		  return New NSWindow( w )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderBack(extends w as Window)
		  //# Moves the window to the back
		  
		  #if TargetCocoa then
		    declare sub orderBack lib CocoaLib selector "orderBack:" (WindowRef as WindowPtr)
		    
		    orderBack(w)
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFront(extends w as Window)
		  //# Moves the window to the front
		  
		  #if TargetCocoa then
		    declare sub orderFront lib CocoaLib selector "orderFront:" (WindowRef as WindowPtr)
		    
		    orderFront(w)
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontRegardless(extends w as Window)
		  //# Moves the window to the front of its level, even if its application isn’t active, without changing either the key window or the main window.
		  
		  //@ Normally an NSWindow object can’t be moved in front of the key window unless it and the key window are in the same application.
		  //  You should rarely need to invoke this method; it’s designed to be used when applications are cooperating in such a way that an _
		  //  active application (with the key window) is using another application to display data.
		  
		  #if TargetCocoa then
		    declare sub orderFrontRegardless lib CocoaLib selector "orderFrontRegardless" (WindowRef as WindowPtr)
		    
		    orderFrontRegardless(w)
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentWindow(extends wChild as Window) As Window
		  //# Returns the parent window to which the window is attached as a child.
		  
		  #if TargetCocoa then
		    declare Function parentWindow lib CocoaLib selector "parentWindow" (WindowRef as WindowPtr) as Integer
		    dim pWindowPTR as Integer = parentWindow(wChild)
		    
		    for i as Integer = 0 to WindowCount()-1
		      dim pWindow as Window = Window(i)
		      If pWindow.Handle = pWindowPTR Then Return pWindow
		    Next
		  #else
		    #pragma Unused wChild
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParentWindow(extends wChild as Window, assigns wParent as Window)
		  //# Adds the window as a child of a given window. For use by subclasses when setting the parent window in the window.
		  
		  //@ This method should be called from a subclass when it is overridden by a subclass’s implementation. It should not be called otherwise.
		  
		  #if TargetCocoa then
		    declare sub setParentWindow lib CocoaLib selector "setParentWindow:" (ChildWindowRef as WindowPtr, WindowRef As WindowPtr)
		    
		    setParentWindow wChild, wParent
		  #else
		    #pragma Unused wChild
		    #pragma Unused wParent
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveChildWindow(extends wParent as window, wChild as Window)
		  //# Detaches a given child window from the window.
		  
		  #if TargetCocoa then
		    declare sub removeChildWindow lib CocoaLib selector "removeChildWindow:" (WindowRef as WindowPtr, ChildWindowRef as WindowPtr)
		    removeChildWindow wParent, wChild
		  #else
		    #pragma Unused wParent
		    #pragma Unused wChild
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RestoreFrameFromWindowName(extends w as Window, name as String) As Boolean
		  //# Restores the window's frame from its saveName in the application's preferences
		  
		  //@ You should use this method in a Constructor method or in the Open event.
		  
		  
		  #if TargetMacOS
		    declare function setFrameUsingName lib CocoaLib selector "setFrameUsingName:" (id as Ptr, name as CFStringRef) as Boolean
		    
		    return setFrameUsingName(WindowRef(w), name)
		  #else
		    #pragma Unused w
		    #pragma Unused name
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScalingFactor(Extends w as Window) As Double
		  //# Determines if the window is displayed on a Retina screen or other HiDPI mode.
		  
		  //@result The ScalingFactor is 2 for a Retina MacBook Pro (or other HiDPI modes) and 1 for anything else
		  
		  //@ The following property needs to be added to the app's __Info.plist__ in order to make your Cocoa app Retina capable:
		  // __<key>NSHighResolutionCapable</key>__
		  // __<true/>__
		  
		  dim r as Double = 1. // Default response
		  
		  #if TargetCocoa
		    if IsLion then
		      declare function BackingScaleFactor lib CocoaLib selector "backingScaleFactor" (target as WindowPtr) as Double
		      r = BackingScaleFactor(w)
		    end if
		  #else
		    #pragma Unused w
		  #endif
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetFrameAutosaveName(extends w as Window, saveName as String) As Boolean
		  //# Set the autosave name for the Window's frame.
		  
		  //@ See RestoreFrameFromWindowName
		  
		  #if TargetMacOS
		    declare function setFrameAutosaveName lib CocoaLib selector "setFrameAutosaveName:" (id as Ptr, name as CFStringRef) as Boolean
		    
		    //returns false if the name is already in use for another NSWindow object in the application.
		    return setFrameAutosaveName(WindowRef(w), saveName)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFrameWithAnimation(extends w as Window, rect as Cocoa.NSRect)
		  //# Sets the origin and size of the window’s frame rectangle, with optional animation, _
		  //  according to a given frame rectangle, thereby setting its position and size onscreen.
		  
		  #if TargetCocoa then
		    // we need to convert the co-ordinates
		    rect.y = Screen(0).Height - (rect.y + w.Height)
		    if (w.Height <> rect.h) then
		      rect.y = rect.y - (rect.h - w.Height)
		    end if
		    rect.h = rect.h + 22
		    
		    declare sub setFrameDisplayAnimate lib CocoaLib selector "setFrame:display:animate:" (WindowRef as WindowPtr, inNSRect as Cocoa.NSRect, Display as Boolean, Animate as Boolean)
		    setFrameDisplayAnimate w, rect, True, True
		  #else
		    #pragma Unused w
		    #pragma Unused rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStyleMaskHUD(extends w as Window)
		  //# Sets the window’s style mask to HUD.
		  
		  //@discussion Only works on floating (palette) windows. (frame = 3 & 7)
		  
		  #if TargetCocoa then
		    const kWindowMaskTitled     = 1
		    const kWindowMaskClosable   = 2
		    const kWindowMaskResizable  = 8
		    const kWindowMaskUtility    = 16
		    const kWindowModalDocument  = 32
		    const kWindowModal          = 64
		    const kWindowNonActive      = 128
		    const kWindowMaskHUD        = 8192
		    const kWindowBorderlessModal = 16384
		    const kWindowMaskFullSizeContentView = 32768
		    
		    if w.Frame = 3 or w.Frame = 7 then
		      Dim tmpStyleMask as UInt32 = kWindowMaskHUD or kWindowMaskTitled or kWindowMaskUtility
		      if w.Resizeable then tmpStyleMask = tmpStyleMask or kWindowMaskResizable
		      #if RBVersion > 2013.02
		        if w.CloseButton   then tmpStyleMask = tmpStyleMask or kWindowMaskClosable
		      #else
		        if w.CloseBox   then tmpStyleMask = tmpStyleMask or kWindowMaskClosable
		      #endif
		      
		      declare sub setStyleMask lib CocoaLib selector "setStyleMask:" (WindowRef as WindowPtr, Mask as UInt32)
		      setStyleMask w, tmpStyleMask
		    end if
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisualEffectView(Extends w as Window, x as integer, y as Integer, width as Integer, Height as Integer, Material as NSVisualEffectView.NSMaterial = NSVisualEffectView.NSMaterial.Light, SizableWidth as Boolean = True, SizableHeight as Boolean = True)
		  
		  // Sets up a NSVisualEffectView for the Window
		  #if TargetCocoa then
		    dim EffectViewClass as Ptr = Cocoa.NSClassFromString("NSVisualEffectView")
		    if EffectViewClass <> Nil then // we have at least OS X 10.10
		      declare function contentView lib CocoaLib selector "contentView" ( WindowRef as WindowPtr ) as ptr
		      
		      declare sub addSubViewRelativeTo lib CocoaLib selector "addSubview:positioned:relativeTo:" (id as ptr, view as ptr, position as integer, relativeTo as Ptr)
		      declare sub setAutoresizingMask lib CocoaLib selector "setAutoresizingMask:" (view as ptr, mask as integer)
		      'declare sub setWantsLayer lib CocoaLib selector "setWantsLayer:" (view as ptr, yesNo as Boolean)
		      
		      // Store int to set which sides are auto-resizable with the window's size.
		      dim ResizeAble as Integer = NSVisualEffectView.NSViewNotSizable
		      if SizableWidth then
		        ResizeAble = ResizeAble or NSVisualEffectView.NSViewWidthSizable
		      end if
		      if SizableHeight then
		        ResizeAble = ResizeAble or NSVisualEffectView.NSViewHeightSizable
		      end if
		      
		      // Start position and height are calculated from bottom to top.
		      dim WindowEffectView as new NSVisualEffectView( x, y, width, height )
		      'setWantsLayer(WindowEffectView,True)
		      WindowEffectView.material = Material
		      setAutoresizingMask( WindowEffectView, ResizeAble )
		      
		      dim contentViewPtr as ptr = contentView( w )
		      addSubViewRelativeTo( contentViewPtr, WindowEffectView, -1, Nil )
		    end if
		  #else
		    #pragma Unused w
		    #pragma Unused x
		    #pragma Unused y
		    #pragma Unused width
		    #pragma Unused Height
		    #pragma Unused Material
		    #pragma Unused SizableWidth
		    #pragma Unused SizableHeight
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisualEffectView(Extends w as Window, Material as NSVisualEffectView.NSMaterial = NSVisualEffectView.NSMaterial.Light)
		  
		  #if TargetCocoa then
		    w.SetVisualEffectView( 0, 0, w.Width, w.Height, Material, True, True )
		  #else
		    #pragma Unused w
		    #pragma Unused Material
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SmoothResize(extends w as Window, Width as Integer, Height as Integer, Align as Integer = 4)
		  //# Easy to use animated window resizing with the ability to customize the animation origin.
		  
		  #if TargetCocoa then
		    
		    Dim OrigRect, NewRect as Cocoa.NSRect
		    OrigRect.x = w.Left
		    OrigRect.y = w.Top
		    OrigRect.w = w.Width
		    OrigRect.h = w.Height
		    
		    // Re-calculate the co-ordinates
		    NewRect = OrigRect
		    
		    NewRect.w = Width
		    NewRect.h = Height
		    
		    select case Align // Use deltas in measurements, not absolutes
		      
		    case 0 // Lock top left (v>)
		      // Just change the Width & Height
		      
		    case 1 // Lock top right (<v)
		      NewRect.x = OrigRect.x - ( Width - w.Width )
		      
		    case 2 // Lock bottom left (^>)
		      NewRect.y = OrigRect.y - ( Height - w.Height )
		      
		    case 3 // Lock bottom right (<^)
		      NewRect.y = OrigRect.y - ( Height - w.Height )
		      NewRect.x = OrigRect.x - ( Width  - w.Width )
		      
		    case 4 // Lock center top (<v>)
		      NewRect.x = OrigRect.x - ( ( Width - w.Width ) / 2 )
		      
		    case 5 // Lock center left (^v>)
		      NewRect.y = OrigRect.y - ( ( Height - w.Height ) / 2 )
		      
		    case 6 // Lock center bottom (<^>)
		      NewRect.x = OrigRect.x - ( ( Width - w.Width ) / 2 )
		      NewRect.y = OrigRect.y - ( Height - w.Height )
		      
		    case 7 // Lock center right (<^v)
		      NewRect.x = OrigRect.x - ( Width - w.Width )
		      NewRect.y = OrigRect.y - ( ( Height - w.Height ) / 2 )
		      
		    case 8 // Resize all sides (<^v>)
		      NewRect.x = OrigRect.x - ( ( Width - w.Width ) / 2 )
		      NewRect.y = OrigRect.y - ( ( Height - w.Height ) / 2 )
		      
		    else
		      return
		      
		    end select
		    
		    NewRect.y = Screen(0).Height - ( NewRect.y + w.Height ) - ( NewRect.h - w.Height )
		    NewRect.h = NewRect.h - ( w.NSWindowObject.ContentRect( NewRect ).h - NewRect.h ) // Adjust for titlebar/toolbar
		    
		    declare sub setFrameDisplayAnimate lib CocoaLib selector "setFrame:display:animate:" (WindowRef as WindowPtr, inNSRect as Cocoa.NSRect, Display as Boolean, Animate as Boolean)
		    setFrameDisplayAnimate w, NewRect, true, true
		    
		  #elseif TargetCarbon
		    
		    dim err, t, l as integer
		    dim rect as MemoryBlock
		    
		    Declare Function TransitionWindow Lib CarbonLib (window as WindowPtr, effect as Integer, action as Integer, rect as Ptr) as Integer
		    Declare Function GetWindowBounds  Lib CarbonLib (window As WindowPtr, regionCode As Integer, globalBounds As Ptr) as Integer
		    
		    // we get the old window region
		    rect = New MemoryBlock(8)
		    err = GetWindowBounds(w, 32, rect)
		    
		    t = w.Top // Need to know where the top and left of the window go
		    l = w.Left
		    Select Case align // Use deltas in measurements, not absolutes
		    Case 0 // Lock upper left
		      rect.Short(4) = rect.Short(4) + (height - w.height)
		      rect.Short(6) = rect.Short(6) + (width - w.width)
		    Case 1 // Lock upper right
		      rect.Short(2) = rect.Short(2) - (width - w.width)
		      rect.Short(4) = rect.Short(4) + (height - w.height)
		      l = l - (width - w.width) // Left side moves
		    Case 2 // Lock lower left
		      rect.Short(0) = rect.Short(0) - (height - w.height)
		      rect.Short(6) = rect.Short(6) + (width - w.width)
		      t = t - (height - w.height) // Top side moves
		    Case 3 // Lock lower right
		      rect.Short(0) = rect.Short(0) - (height - w.height)
		      rect.Short(2) = rect.Short(2) - (width - w.width)
		      t = t - (height - w.height) // Top side moves
		      l = l - (width - w.width) // Left side moves
		    Case 4 // Lock top center
		      rect.Short(2) = rect.Short(2) - (width - w.width) / 2
		      rect.Short(4) = rect.Short(4) + (height - w.height)
		      rect.Short(6) = rect.Short(6) + (width - w.width) / 2
		      l = l - (width - w.width)/2 // Both sides move
		    Case 5 // Lock left center
		      rect.Short(0) = rect.Short(0) - (height - w.height) / 2
		      rect.Short(4) = rect.Short(4) + (height - w.height) / 2
		      rect.Short(6) = rect.Short(6) + (width - w.width)
		      t = t - (height - w.height) / 2 // Top moves
		    Case 6 // Lock bottom center
		      rect.Short(0) = rect.Short(0) - (height - w.height)
		      rect.Short(2) = rect.Short(2) - (width - w.width) / 2
		      rect.Short(6) = rect.Short(6) + (width - w.width) / 2
		      t = t - (height - w.height) // Top moves
		      l = l - (width - w.width) / 2 // Left moves
		    Case 7 // Lock right center
		      rect.Short(0) = rect.Short(0) - (height - w.height) / 2
		      rect.Short(2) = rect.Short(2) - (width - w.width)
		      rect.Short(4) = rect.Short(4) + (height - w.height) / 2
		      t = t - (height - w.height) / 2// Top moves
		      l = l - (width - w.width) // Left moves
		    case 8 // Lock center center
		      rect.Short(0) = rect.Short(0) - (height - w.height) / 2
		      rect.Short(2) = rect.Short(2) - (width - w.width) / 2
		      rect.Short(4) = rect.Short(4) + (height - w.height) / 2
		      rect.Short(6) = rect.Short(6) + (width - w.width) / 2
		      t = t - (height - w.height) / 2// Top moves
		      l = l - (width - w.width) / 2// Left moves
		      
		    End Select // If none of these, don't change
		    
		    // transition
		    err = TransitionWindow(w, 3, 4, rect)
		    
		    // have to manually set the window's new height after resizing the window
		    w.Top = t
		    w.Left = l
		    w.Width = width
		    w.Height = height
		    
		    w.refresh
		    
		  #else
		    #pragma Unused Align
		    w.Width = Width
		    w.Height = Height
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TitlebarAppearsTransparent(extends w as Window) As Boolean
		  
		  #if TargetCocoa then
		    if IsYosemite then
		      declare function titlebarAppearsTransparent lib CocoaLib selector "titlebarAppearsTransparent" (WindowRef as WindowPtr) as Boolean
		      
		      return titlebarAppearsTransparent(w)
		    else
		      return false
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TitlebarAppearsTransparent(extends w as Window, assigns value as Boolean)
		  
		  #if TargetCocoa then
		    if IsYosemite then
		      declare sub setTitlebarAppearsTransparent lib CocoaLib selector "setTitlebarAppearsTransparent:" (WindowRef as WindowPtr, value as Boolean)
		      
		      setTitlebarAppearsTransparent w, value
		    end if
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TitleVisible(extends w as Window) As Boolean
		  
		  #if TargetCocoa then
		    if IsYosemite then
		      declare function titleVisibility lib CocoaLib selector "titleVisibility" (WindowRef as WindowPtr) as NSWindowTitleVisibility
		      
		      return titleVisibility(w) = NSWindowTitleVisibility.Visible
		    else
		      return True
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TitleVisible(extends w as Window, assigns TitleVisible as Boolean)
		  
		  #if TargetCocoa then
		    if IsYosemite then
		      declare sub setTitleVisibility lib CocoaLib selector "setTitleVisibility:" (WindowRef as WindowPtr, titleVisibility as NSWindowTitleVisibility )
		      
		      if TitleVisible then
		        setTitleVisibility w, NSWindowTitleVisibility.Visible
		      else
		        setTitleVisibility w, NSWindowTitleVisibility.Hidden
		      end if
		    end if
		  #else
		    #pragma unused TitleVisible
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transparency(extends w as Window, assigns Value as Double)
		  //# Gives the window a transparent background color, resulting in the window becoming see-through while anything on the window remains visible.
		  
		  //@ The titlebar and close/minimize/maximize buttons will remain visible as well, for the best effect use a borderless window.
		  
		  //@ This method is perfect for a custom or image shaped splash-window effect.
		  
		  #if TargetCocoa
		    // Get the reference to the NSColor class so we can call one of the class methods
		    declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    dim NSColorClassRef as Ptr = NSClassFromString("NSColor")
		    
		    // Now ask the NSColor class to create a new NSColor from the values we have
		    declare function colorWithDeviceRed lib CocoaLib selector "colorWithDeviceRed:green:blue:alpha:" (classRef as Ptr, red as Double, green as Double, blue as Double, alpha as Double) as Ptr
		    dim NSColorInstance as Ptr = colorWithDeviceRed(NSColorClassRef, 0.92, 0.92, 0.92, Value)
		    
		    // Set the features on the window
		    declare sub setAlphaValue lib CocoaLib selector "setAlphaValue:" (WindowRef as WindowPtr, AlphaValue as Double)
		    declare sub setOpaque lib CocoaLib selector "setOpaque:" (WindowRef as WindowPtr, IsOpague as Boolean)
		    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" (WindowRef as WindowPtr, inNSColorInstance as Ptr)
		    
		    setAlphaValue w, 1.0
		    setOpaque w, false
		    setBackgroundColor w, NSColorInstance
		    
		    // Force the window to update so we get the proper shadowing
		    w.InvalidateShadow
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleOnAllSpaces(extends w as Window) As Boolean
		  //# Specifies the window’s behavior in window collections.
		  
		  #if TargetCocoa then
		    if IsLeopard Then
		      declare function collectionBehavior lib CocoaLib selector "collectionBehavior" (WindowRef as WindowPtr) as Integer
		      return ( collectionBehavior(w) > 0 )
		    end if
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VisibleOnAllSpaces(extends w as Window, assigns Value as Boolean)
		  //# Specifies the window’s behavior in window collections.
		  
		  #if TargetCocoa then
		    If IsLeopard Then
		      declare sub setCollectionBehavior lib CocoaLib Selector "setCollectionBehavior:" (WindowRef as WindowPtr, Flag as Integer)
		      
		      If Value Then
		        setCollectionBehavior w, 1 // Can Join All Spaces
		      Else
		        setCollectionBehavior w, 0 // Default
		      End If
		    End If
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WindowRef(w as Window) As Ptr
		  if w = nil then
		    return nil
		  end if
		  
		  #if targetCocoa
		    return Ptr(w.Handle)
		    
		  #elseif targetCarbon
		    //the existing code was wrong.  I'm leaving this unimplemented for now.
		    return nil
		    
		  #else
		    #pragma unused w
		    return nil
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WorksWhenModal(extends w as Window) As Boolean
		  //# Specifies whether the receiver receives keyboard and mouse events even when some other window is being run modally.
		  
		  #if TargetMacOS then
		    declare function worksWhenModal lib CocoaLib selector "worksWhenModal" (WindowRef as WindowPtr) as Boolean
		    
		    return worksWhenModal(w)
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WorksWhenModal(extends w as Window, assigns Value as Boolean)
		  //# Specifies whether the receiver receives keyboard and mouse events even when some other window is being run modally.
		  
		  #if TargetMacOS then
		    declare sub setWorksWhenModal lib CocoaLib selector "setWorksWhenModal:" (WindowRef as WindowPtr, Flag as Boolean)
		    
		    setWorksWhenModal w, Value
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod


	#tag Enum, Name = NSWindowButton, Type = Integer, Flags = &h0
		NSWindowCloseButton = 0
		  NSWindowMiniaturizeButton
		  NSWindowZoomButton
		  NSWindowToolbarButton
		  NSWindowDocumentIconButton
		  NSWindowDocumentVersionsButton = 6
		NSWindowFullScreenButton
	#tag EndEnum

	#tag Enum, Name = NSWindowTitleVisibility, Flags = &h0
		Visible
		  Hidden
		HiddenWhenActive
	#tag EndEnum


	#tag ViewBehavior
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
	#tag EndViewBehavior
End Module
#tag EndModule

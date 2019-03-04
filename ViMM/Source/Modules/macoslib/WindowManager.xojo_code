#tag Module
Module WindowManager
	#tag Method, Flags = &h0
		Function Alpha(extends w as Window) As Double
		  if w.Handle = 0 then
		    return 0.0
		  end if
		  
		  #if TargetCarbon
		    soft declare function GetWindowAlpha lib CarbonLib (inWindow as WindowPtr, ByRef inAlpha as Double) as Integer
		    
		    dim alphaValue as Double
		    dim OSError as Integer = GetWindowAlpha(w, alphaValue)
		    if OSError = 0 then
		      return alphaValue
		    else
		      return 0
		    end if
		  #endif
		  
		  #if targetCocoa
		    soft declare function alphaValue lib CocoaLib selector "alphaValue" (id as Ptr) as Double
		    
		    return alphaValue(Ptr(w.Handle))
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Alpha(extends w as Window, assigns value as Double)
		  if w.Handle = 0 then
		    return
		  end if
		  
		  if value < 0 or value > 1 then
		    return
		  end if
		  
		  #if TargetCarbon
		    soft declare function SetWindowAlpha lib CarbonLib (inWindow as WindowPtr, inAlpha as Double) as Integer
		    
		    dim OSError as Integer = SetWindowAlpha(w, value)
		    #pragma unused OSError
		  #endif
		  
		  #if targetCocoa
		    soft declare sub setAlphaValue lib CocoaLib selector "setAlphaValue:" (id as Ptr, windowAlpha as Double)
		    
		    setAlphaValue Ptr(w.Handle), value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CollapseAll()
		  CollapseAllWindows true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CollapseAllWindows(collapse as Boolean)
		  #if targetMacOS
		    soft declare function carbonCollapseAllWindows lib CarbonLib alias "CollapseAllWindows" (collapse as Boolean) as Integer
		    
		    dim OSError as Integer = carbonCollapseAllWindows(collapse)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConstrainToScreen(extends w as Window) As Boolean
		  // Do not call this from within Window.Open because then the window is not fully set up
		  // for the CarbonLib calls yet! Call it from Window.Paint or similar instead!
		  //
		  if not w.Visible then
		    break // doesn't work then -- make sure you do not call this from Window.Open
		    return false
		  end
		  
		  #if TargetCarbon
		    declare function ConstrainWindowToScreen lib CarbonLib (w as WindowPtr, inRegionCode as Integer, inOptions as Integer, rect as Ptr, ByRef out as MacRect) as Integer
		    declare function GetWindowBounds lib CarbonLib (w as WindowPtr, inRegionCode as Integer, ByRef out as MacRect) as Integer
		    
		    const kWindowStructureRgn = 32
		    
		    const kWindowConstrainMayResize = 1
		    const kWindowConstrainMoveRegardlessOfFit = 2
		    const kWindowConstrainCalcOnly = 8
		    
		    dim origRect as MacRect
		    
		    if GetWindowBounds(w, kWindowStructureRgn, origRect) = 0 then
		      
		      dim topDiff as Integer = w.Top - origRect.top
		      dim leftDiff as Integer = w.Left - origRect.left
		      
		      dim res as Integer, newRect as MacRect
		      res = ConstrainWindowToScreen (w, kWindowStructureRgn, kWindowConstrainCalcOnly+kWindowConstrainMoveRegardlessOfFit, nil, newRect)
		      
		      if res = 0 then
		        newRect.top = newRect.top+topDiff
		        newRect.left = newRect.left+leftDiff
		        if w.Top <> newRect.top or w.Left <> newRect.left then
		          w.Top = newRect.top
		          w.Left = newRect.left
		          return true
		        end if
		      end
		    end
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DocumentFile(extends w as Window) As FolderItem
		  // *** Attention ***
		  // When using this in Carbon builds, windows may get restored by OpenDocument events!
		  // To prevent that, see: https://forum.xojo.com/5784
		  
		  if w.Handle = 0 then
		    return nil
		  end if
		  
		  #if targetCarbon
		    declare function GetWindowProxyAlias lib CarbonLib (inWindow as WindowPtr, ByRef alias as Ptr) as Integer
		    
		    dim theAlias as Ptr
		    dim OSError as Integer = GetWindowProxyAlias(w, theAlias)
		    if OSError <> 0 then
		      return nil
		    end if
		    
		    declare function FSResolveAlias lib CarbonLib (fromFile as Ptr, alias as Ptr, fsRef as Ptr, Byref wasChanged as Boolean) as Int16
		    
		    dim fileRef as new FSRef
		    dim wasChanged as Boolean
		    OSError = FSResolveAlias(nil, theAlias, fileRef, wasChanged)
		    if theAlias <> nil then
		      soft declare sub DisposeHandle lib CarbonLib (h as Ptr)
		      
		      DisposeHandle theAlias
		    end if
		    if OSError = 0 then
		      return FileManager.GetFolderItemFromFSRef(fileRef)
		    else
		      return nil
		    end if
		  #endif
		  
		  #if targetCocoa
		    dim nsw as NSWindow = w
		    return nsw.RepresentedFile
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DocumentFile(extends w as Window, assigns f as FolderItem)
		  if w.Handle = 0 then
		    return
		  end if
		  
		  #if targetCarbon
		    if f is nil then
		      declare function RemoveWindowProxy lib CarbonLib (inWindow as WindowPtr) as Integer
		      
		      dim OSError as Integer = RemoveWindowProxy(w)
		      #pragma unused OSError
		    else
		      declare function FSNewAlias lib CarbonLib (fromFile as Ptr, fsRef as Ptr, ByRef inAlias as Ptr) as Short
		      
		      dim aliasHandle as Ptr
		      dim fileRef as FSRef = FileManager.GetFSRefFromFolderItem(f)
		      dim OSError as Integer = FSNewAlias(nil, fileRef, aliasHandle)
		      if OSError <> 0 then
		        return
		      end if
		      
		      declare function SetWindowProxyAlias lib CarbonLib (inWindow as WindowPtr, inAlias as Ptr) as Integer
		      
		      OSError = SetWindowProxyAlias(w, aliasHandle)
		      if aliasHandle <> nil then
		        soft declare sub DisposeHandle lib CarbonLib (h as Ptr)
		        DisposeHandle aliasHandle
		        aliasHandle = nil
		      end if
		    end if
		  #endif
		  
		  #if targetCocoa
		    dim nsw as NSWindow = w
		    nsw.RepresentedFile = f
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullScreenAllowed(extends w as Window) As Boolean
		  //# Indicates whether the window can enter full screen mode
		  
		  #if TargetCocoa then
		    if IsLion then // the CollectionBehavior selector is available since 10.5, but the behavior FullScreenPrimary is first introduced in 10.7
		      declare function getCollectionBehavior lib CocoaLib Selector "collectionBehavior" (WindowRef as WindowPtr) as Integer
		      
		      return Bitwise.BitAnd( getCollectionBehavior(w), Integer(WindowCollectionBehavior.FullScreenPrimary) ) = Integer(WindowCollectionBehavior.FullScreenPrimary)
		    end if
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FullScreenAllowed(extends w as Window, assigns Value as Boolean)
		  //# Allows the window to enter full screen mode
		  
		  #if TargetCocoa then
		    if IsLion then // the CollectionBehavior selector is available since 10.5, but the behavior FullScreenPrimary is first introduced in 10.7
		      declare function getCollectionBehavior lib CocoaLib Selector "collectionBehavior" (WindowRef as WindowPtr) as Integer
		      declare sub setCollectionBehavior lib CocoaLib Selector "setCollectionBehavior:" (WindowRef as WindowPtr, inFlag as Integer)
		      
		      if Value then
		        setCollectionBehavior( w, getCollectionBehavior(w) or Integer(WindowCollectionBehavior.FullScreenPrimary) )
		      else
		        setCollectionBehavior( w, getCollectionBehavior(w) Xor Integer(WindowCollectionBehavior.FullScreenPrimary) )
		      end if
		    end if
		  #else
		    #pragma Unused w
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsCollapsed(extends w as Window) As Boolean
		  #if TargetMacOS
		    declare function IsWindowCollapsed lib CarbonLib (window as WindowPtr) as Boolean
		    
		    return IsWindowCollapsed(w)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsCollapsed(extends w as Window, assigns theValue as Boolean)
		  #if TargetMacOS
		    declare function CollapseWindow lib CarbonLib (window as WindowPtr, collapse as Boolean) as Integer
		    
		    dim OSError as Integer = CollapseWindow(w, theValue)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsCollapsible(extends w as Window) As Boolean
		  #if targetMacOS
		    declare function IsWindowCollapsable lib CarbonLib (window as WindowPtr) as Boolean
		    
		    return IsWindowCollapsable(w)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFullScreen(extends w as Window) As Boolean
		  //# Returns a boolean indicating the window's fullscreen status.
		  
		  #if TargetCocoa then
		    if IsLion then // the styleMask selector is available since 10.0, but the NSFullScreenWindowMask bit is introduced in 10.7
		      declare function GetStyleMask lib CocoaLib selector "styleMask" (window as WindowPtr) as Integer
		      
		      if w <> nil then
		        return ( GetStyleMask(w) and NSFullScreenWindowMask ) = NSFullScreenWindowMask
		      end if
		    end if
		  #else
		    #pragma Unused w
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsModified(extends w as Window) As Boolean
		  if w.Handle = 0 then
		    return false
		  end if
		  
		  #if targetCarbon
		    declare function IsWindowModified lib CarbonLib (w as WindowPtr) as Boolean
		    
		    return IsWindowModified(w)
		  #endif
		  
		  #if targetCocoa
		    dim nsw as NSWindow = w
		    return nsw.DocumentEdited
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsModified(extends w as Window, assigns value as Boolean)
		  if w.Handle = 0 then
		    return
		  end if
		  
		  #if targetCarbon
		    declare function SetWindowModified lib CarbonLib (w as WindowPtr, modified as Boolean) as Integer
		    
		    dim OSError as Integer = SetWindowModified(w, value)
		    #pragma unused OSError
		  #endif
		  
		  #if targetCocoa
		    dim nsw as NSWindow = w
		    nsw.DocumentEdited = value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsResizable(extends w as Window) As Boolean
		  #if targetCocoa
		    declare function styleMask lib CocoaLib selector "styleMask" (handle as Integer) as Integer
		    
		    const NSResizableWindowMask = 8
		    return (styleMask(w.Handle) and NSResizableWindowMask) = NSResizableWindowMask
		  #endif
		  
		  #if targetCarbon
		    soft declare function GetWindowAttributes lib CarbonLib (w as Integer, ByRef outAttributes as Integer) as Integer
		    const kWindowResizableAttribute = 16
		    
		    if w.Handle = 0 then
		      return false
		    end if
		    
		    dim outAttributes as Integer
		    dim err as Integer = GetWindowAttributes(w.Handle, outAttributes)
		    return (err = noErr) and ((outAttributes and kWindowResizableAttribute) = kWindowResizableAttribute)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsResizable(extends w as Window, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setStyleMask lib CocoaLib selector "setStyleMask:" (handle as Integer, mask as Integer)
		    declare function styleMask lib CocoaLib selector "styleMask" (handle as Integer) as Integer
		    
		    const NSResizableWindowMask = 8
		    if value then
		      setStyleMask(w.Handle, styleMask(w.Handle) or NSResizableWindowMask)
		    else
		      setStyleMask(w.Handle, styleMask(w.Handle) and not NSResizableWindowMask)
		    end if
		  #endif
		  
		  #if targetCarbon
		    soft declare function ChangeWindowAttributes lib CarbonLib (w as WindowPtr, setTheseAttributes as UInt32, clearTheseAttributes as UInt32) as Integer
		    const kWindowNoAttributes = 0
		    const kWindowResizableAttribute = 16
		    
		    dim setTheseAttributes as UInt32
		    dim clearTheseAttributes as UInt32
		    if value then
		      setTheseAttributes = kWindowResizableAttribute
		      clearTheseAttributes = kWindowNoAttributes
		    else
		      setTheseAttributes = kWindowNoAttributes
		      clearTheseAttributes = kWindowResizableAttribute
		    end if
		    dim err as Integer = ChangeWindowAttributes(w, setTheseAttributes, clearTheseAttributes)
		    #pragma unused err
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendBehind(extends w as Window, behindWindow as Window)
		  if behindWindow is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    declare sub SendBehind lib CarbonLib (window as WindowPtr, behindWindow as WindowPtr)
		    
		    SendBehind w, behindWindow
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowAll()
		  CollapseAllWindows false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Slide(extends w as Window, newLeft as Integer, newTop as Integer)
		  #if TargetMacOS
		    declare function GetWindowBounds lib CarbonLib (window as WindowPtr, regionCode as UInt16, ByRef globalBounds as MacRect) as Integer
		    
		    dim bounds as MacRect
		    dim OSError as Integer = GetWindowBounds(w, kWindowStructureRgn, bounds)
		    if OSError <> 0 then
		      return
		    end if
		    
		    soft declare function TransitionWindow lib CarbonLib (inWindow as WindowPtr, inEffect as UInt32, inAction as UInt32, ByRef inRect as MacRect) as Integer
		    
		    bounds.top = bounds.top + (newTop- w.Top)
		    bounds.left = bounds.left + (newLeft - w.Left)
		    bounds.bottom = bounds.bottom + (newTop - w.Top)
		    bounds.right = bounds.right + (newLeft - w.Left)
		    OSError = TransitionWindow(w, kWindowSlideTransitionEffect, kWindowMoveTransitionAction, bounds)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SlideResize(extends w as Window, newWidth as Integer, newHeight as Integer)
		  #if TargetMacOS
		    declare function GetWindowBounds lib CarbonLib (window as WindowPtr, regionCode as UInt16, ByRef globalBounds as MacRect) as Integer
		    
		    dim bounds as MacRect
		    dim OSError as Integer = GetWindowBounds(w, kWindowStructureRgn, bounds)
		    if OSError <> 0 then
		      return
		    end if
		    
		    declare function TransitionWindow lib CarbonLib (inWindow as WindowPtr, inEffect as UInt32, inAction as UInt32, ByRef inRect as MacRect) as Integer
		    
		    bounds.bottom = bounds.bottom + (newHeight - w.Height)
		    bounds.right = bounds.right + (newWidth - w.Width)
		    OSError = TransitionWindow(w, kWindowSlideTransitionEffect, kWindowResizeTransitionAction, bounds)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleFullScreen(extends w as Window)
		  //# Takes the window into or out of fullscreen mode
		  
		  #if TargetCocoa then
		    if IsLion then
		      declare sub toggleFullScreen lib CocoaLib selector "toggleFullScreen:" (WindowRef as WindowPtr, sender As Ptr)
		      
		      toggleFullScreen(w,nil)
		    end if
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateDockTile(extends w as Window)
		  #if targetMacOS
		    declare function UpdateCollapsedWindowDockTile lib CarbonLib (inWindow as WindowPtr) as Integer
		    
		    dim OSError as Integer
		    If w.IsCollapsed then
		      OSError = UpdateCollapsedWindowDockTile(w)
		    end if
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Constant, Name = kAlertWindowClass, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAllWindowClasses, Type = Double, Dynamic = False, Default = \"&hffffffff", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAltPlainWindowClass, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDocumentWindowClass, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDrawerWindowClass, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFloatingWindowClass, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHelpWindowClass, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kModalWindowClass, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMovableAlertWindowClass, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMovableModalWindowClass, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOverlayWindowClass, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPlainWindowClass, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSheetAlertWindowClass, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSheetWindowClass, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kToolbarWindowClass, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUtilityWindowClass, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowCloseBoxRgn, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowCollapseBoxRgn, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowContentRgn, Type = Double, Dynamic = False, Default = \"33", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowDragRgn, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowFadeTransitionEffect, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowGenieTransitionEffect, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowGlobalPortRgn, Type = Double, Dynamic = False, Default = \"40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowGrowRgn, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowHideTransitionAction, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWindowIgnoreClicksAttribute, Type = Double, Dynamic = False, Default = \"536870912", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowMoveTransitionAction, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWindowOpaqueRgn, Type = Double, Dynamic = False, Default = \"35", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowResizeTransitionAction, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWindowSheetTransitionEffect, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowShowTransitionAction, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWindowSlideTransitionEffect, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowStructureRgn, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowTitleBarRgn, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowTitleProxyIconRgn, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowTitleTextRgn, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowToolbarButtonRgn, Type = Double, Dynamic = False, Default = \"41", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowUpdateRgn, Type = Double, Dynamic = False, Default = \"34", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowZoomBoxRgn, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowZoomTransitionEffect, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSApplicationPresentationFullScreen, Type = Double, Dynamic = False, Default = \"1024", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NSFullScreenWindowMask, Type = Double, Dynamic = False, Default = \"16384", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = RGBColor, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		red as UInt16
		  green as UInt16
		blue as UInt16
	#tag EndStructure


	#tag Enum, Name = WindowCollectionBehavior, Type = Integer, Flags = &h0
		Default=0
		  CanJoinAllSpaces=1
		  MoveToActiveSpace=2
		  Managed=4
		  Transient=8
		  Stationary=16
		  ParticipatesInCycle=32
		  IgnoresCycle=64
		  FullScreenPrimary=128
		FullScreenAuxiliary=256
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

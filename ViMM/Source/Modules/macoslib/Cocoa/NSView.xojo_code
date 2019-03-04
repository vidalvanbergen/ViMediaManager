#tag Class
Class NSView
Inherits NSResponder
	#tag Method, Flags = &h0
		Sub AddSubview(aView as NSView)
		  
		  #if TargetMacOS then
		    declare sub addSubview lib CocoaLib selector "addSubview:" (obj_id as Ptr, aView as Ptr)
		    
		    addSubview self, aView
		  #else
		    #pragma Unused aView
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSubviewPositionedRelativeTo(aView as NSView, place as NSWindowOrderingMode, otherView as NSView)
		  
		  #if TargetMacOS then
		    declare sub addSubViewPositionedRelativeTo lib CocoaLib selector "addSubview:positioned:relativeTo:" (obj_id as Ptr, aView as Ptr, place as NSWindowOrderingMode, otherView as Ptr)
		    
		    addSubViewPositionedRelativeTo self, aView, place, otherView
		  #else
		    #pragma Unused aView
		    #pragma Unused place
		    #pragma Unused otherView
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddToolTipRectOwnerUserData(aRect as Cocoa.NSRect, anObject as Ptr, userData as Ptr) As Integer
		  
		  #if TargetMacOS then
		    declare function addToolTipRectOwnerUserData lib CocoaLib selector "addToolTipRect:owner:userData:" (obj_id as Ptr, aRect as Cocoa.NSRect, anObject as Ptr, userData as Ptr) as Integer
		    
		    return addToolTipRectOwnerUserData( self, aRect, anObject, userData )
		  #else
		    #pragma Unused aRect
		    #pragma Unused anObject
		    #pragma Unused userData
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddTrackingRect(aRect as Cocoa.NSRect, userObject as Ptr, userData as Ptr, assumeInside as Boolean) As Integer
		  
		  #if TargetMacOS then
		    declare function addTrackingRectOwnerUserDataAssumeInside lib CocoaLib selector "addTrackingRect:owner:userData:assumeInside:" _
		    (obj_id as Ptr, aRect as Cocoa.NSRect, userObject as Ptr, userData as Ptr, assumeInside as Boolean) as Integer
		    
		    dim userObjectRef as Ptr
		    if userObject <> nil then
		      userObjectRef = userObject
		    end if
		    
		    dim userDataRef as Ptr
		    if userData <> Nil then
		      userDataRef = userData
		    end if
		    
		    return addTrackingRectOwnerUserDataAssumeInside( self, aRect, userObjectRef, userDataRef, assumeInside)
		  #else
		    #pragma Unused aRect
		    #pragma Unused userObject
		    #pragma Unused assumeInside
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AdjustPageHeightNewTopBottomLimit(newBottom as Double, top as Double, proposedBottom as Double, bottomLimit as Double)
		  
		  #if TargetMacOS then
		    declare sub adjustPageWidthNewLeftRightLimit lib CocoaLib selector "adjustPageWidthNew:left:right:limit:" (obj_id as Ptr, NewBluePaletteMBS as Double, top as Double, proposedBottom as Double, bottomLimit as Double)
		    
		    adjustPageWidthNewLeftRightLimit self, newBottom, top, proposedBottom, bottomLimit
		  #else
		    #pragma Unused newBottom
		    #pragma Unused top
		    #pragma Unused proposedBottom
		    #pragma Unused bottomLimit
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AdjustPageWidthNewLeftRightLimit(newRight as Double, left as Double, proposedRight as Double, rightLimit as Double)
		  
		  #if TargetMacOS then
		    declare sub adjustPageWidthNewLeftRightLimit lib CocoaLib selector "adjustPageWidthNew:left:right:limit:" (obj_id as Ptr, newRight as Double, left as Double, proposedRight as Double, rightLimit as Double)
		    
		    adjustPageWidthNewLeftRightLimit self, newRight, left, proposedRight, rightLimit
		  #else
		    #pragma Unused newRight
		    #pragma Unused left
		    #pragma Unused proposedRight
		    #pragma Unused rightLimit
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AdjustScroll(proposedVisibleRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetMacOS then
		    declare function adjustScroll lib CocoaLib selector "adjustScroll:" (obj_id as Ptr, proposedVisibleRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return adjustScroll( self, proposedVisibleRect )
		  #else
		    #pragma Unused proposedVisibleRect
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AncestorSharedWithView(aView as NSView) As NSView
		  
		  #if TargetMacOS then
		    declare function getAncestorSharedWithView lib CocoaLib selector "ancestorSharedWithView:" (obj_id as Ptr, aView as Ptr) as Ptr
		    
		    return New NSView( getAncestorSharedWithView( self, aView ) )
		  #else
		    #pragma Unused aView
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Autoscroll(theEvent as NSEvent) As Boolean
		  
		  #if TargetMacOS then
		    declare function getAutoscroll lib CocoaLib selector "autoscroll:" (obj_id as Ptr, theEvent as Ptr) as Boolean
		    
		    return getAutoscroll( self, theEvent )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BackingAlignedRect(aRect as Cocoa.NSRect, options as Integer) As Cocoa.NSRect
		  
		  #if TargetMacOS then
		    declare function backingAlignedRect lib CocoaLib selector "backingAlignedRect:options:" (obj_id as Ptr, aRect as Cocoa.NSRect, options as Integer) as Cocoa.NSRect
		    
		    return backingAlignedRect( self, aRect, options )
		  #else
		    #pragma Unused aRect
		    #pragma Unused options
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginDocument()
		  #if TargetMacOS then
		    declare sub beginDocument lib CocoaLib selector "beginDocument" (obj_id as Ptr)
		    
		    beginDocument self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginPageInRectAtPlacement(aRect as Cocoa.NSRect, location as Cocoa.NSPoint)
		  #if TargetMacOS then
		    declare sub setBeginPageInRectAtPlacement lib CocoaLib selector "beginPageInRect:atPlacement:" (obj_id as Ptr, aRect as Cocoa.NSRect, location as Cocoa.NSPoint)
		    
		    setBeginPageInRectAtPlacement self, aRect, location
		  #else
		    #pragma Unused aRect
		    #pragma Unused location
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BitmapImageRepForCachingDisplayInRect(aRect as Cocoa.NSRect) As NSBitmapImageRep
		  
		  #if TargetMacOS then
		    declare function bitmapImageRepForCachingDisplayInRect lib CocoaLib selector "bitmapImageRepForCachingDisplayInRect:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Ptr
		    
		    return new NSBitmapImageRep( bitmapImageRepForCachingDisplayInRect( self, aRect ) )
		  #else
		    #pragma Unused aRect
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BoundsOrigin(newOrigin as Cocoa.NSPoint)
		  
		  #if TargetMacOS then
		    declare sub setBoundsOrigin lib CocoaLib selector "setBoundsOrigin:" (obj_id as Ptr, newOrigin as Cocoa.NSPoint)
		    
		    setBoundsOrigin self, newOrigin
		  #else
		    #pragma Unused newOrigin
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BoundsRotation(angle as Double)
		  
		  #if TargetMacOS then
		    declare sub setBoundsRotation lib CocoaLib selector "setBoundsRotation:" (obj_id as Ptr, angle as Double)
		    
		    setBoundsRotation self, angle
		  #else
		    #pragma Unused angle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BoundsSize(newSize as Cocoa.NSSize)
		  
		  #if TargetMacOS then
		    declare sub setBoundsSize lib CocoaLib selector "setBoundsSize:" (obj_id as Ptr, newSize as Cocoa.NSSize)
		    
		    setBoundsSize self, newSize
		  #else
		    #pragma Unused newSize
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CacheDisplayInRectToBitmapImageRep(rect as Cocoa.NSRect, bitmapImageRep as NSBitmapImageRep)
		  
		  #if TargetMacOS then
		    declare sub CacheDisplayInRectToBitmapImageRep lib CocoaLib selector "cacheDisplayInRect:toBitmapImageRep:" (obj_id as Ptr, rect as Cocoa.NSRect, bitmapImageRep as Ptr)
		    
		    CacheDisplayInRectToBitmapImageRep self, rect, bitmapImageRep
		  #else
		    #pragma Unused rect
		    #pragma Unused bitmapImageRep
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSView")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(frameRect as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as Cocoa.NSRect) as Ptr
		    
		    super.Constructor( initWithFrame( Initialize(Allocate(Cocoa.NSClassFromString("NSView"))), frameRect ), not hasOwnership )
		  #else
		    #pragma Unused frameRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(x as integer, y as integer, width as integer, height as integer)
		  
		  #if TargetMacOS then
		    dim frameRect as Cocoa.NSRect
		    frameRect.x = x
		    frameRect.y = y
		    frameRect.w = width
		    frameRect.h = height
		    
		    self.Constructor( frameRect )
		  #else
		    #pragma unused x
		    #pragma unused y
		    #pragma unused width
		    #pragma unused height
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertPointFromBacking(aPoint as Cocoa.NSPoint) As NSPoint
		  
		  #if TargetMacOS then
		    declare function convertPointFromBacking lib CocoaLib selector "convertPointFromBacking:" (obj_id as Ptr, aPoint as Cocoa.NSPoint) as Cocoa.NSPoint
		    
		    return convertPointFromBacking( self, aPoint )
		  #else
		    #pragma Unused aPoint
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataWithEPSInsideRect(aRect as Cocoa.NSRect) As NSData
		  
		  #if TargetCocoa
		    declare function dataWithEPSInsideRect lib CocoaLib selector "dataWithEPSInsideRect:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Ptr
		    
		    dim dataRef as Ptr = dataWithEPSInsideRect(self, aRect)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused aRect
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataWithPDFInsideRect(aRect as Cocoa.NSRect) As NSData
		  
		  #if TargetMacOS then
		    declare function dataWithPDFInsideRect lib CocoaLib selector "dataWithPDFInsideRect:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Ptr
		    
		    dim dataRef as Ptr = dataWithPDFInsideRect(self, aRect)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma Unused aRect
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DefaultFocusRingType() As NSFocusRingType
		  
		  #if TargetMacOS then
		    declare function defaultFocusRingType lib CocoaLib selector "defaultFocusRingType" (obj_id as Ptr) as NSFocusRingType
		    
		    return defaultFocusRingType( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DefaultMenu() As NSMenu
		  
		  #if TargetMacOS then
		    declare function getDefaultMenu lib CocoaLib selector "defaultMenu" (obj_id as Ptr) as Ptr
		    
		    return New NSMenu( getDefaultMenu( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DidAddSubview(subview as NSView)
		  
		  #if TargetMacOS then
		    declare sub didAddSubview lib CocoaLib selector "didAddSubview:" (obj_id as Ptr, subview as Ptr)
		    
		    didAddSubview self, subview
		  #else
		    #pragma Unused subview
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DidChangeBackingProperties()
		  
		  #if TargetMacOS then
		    declare sub viewDidChangeBackingProperties lib CocoaLib selector "viewDidChangeBackingProperties" (obj_id as Ptr)
		    
		    viewDidChangeBackingProperties self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DidHide()
		  
		  #if TargetMacOS then
		    declare sub viewDidHide lib CocoaLib selector "viewDidHide" (obj_id as Ptr)
		    
		    viewDidHide self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DidMoveToSuperview()
		  
		  #if TargetMacOS then
		    declare sub viewDidMoveToSuperview lib CocoaLib selector "viewDidMoveToSuperview" (obj_id as Ptr)
		    
		    viewDidMoveToSuperview self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DidMoveToWindow()
		  
		  #if TargetMacOS then
		    declare sub viewDidMoveToWindow lib CocoaLib selector "viewDidMoveToWindow" (obj_id as Ptr)
		    
		    viewDidMoveToWindow self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DidUnhide()
		  
		  #if TargetMacOS then
		    declare sub viewDidUnhide lib CocoaLib selector "viewDidUnhide" (obj_id as Ptr)
		    
		    viewDidUnhide self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Display()
		  
		  #if TargetMacOS then
		    declare sub display lib CocoaLib selector "display" (obj_id as Ptr)
		    
		    display self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub displayIfNeeded()
		  
		  #if TargetMacOS then
		    declare sub displayIfNeeded lib CocoaLib selector "displayIfNeeded" (obj_id as Ptr)
		    
		    displayIfNeeded self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayIfNeededIgnoringOpacity()
		  
		  #if TargetMacOS then
		    declare sub displayIfNeededIgnoringOpacity lib CocoaLib selector "displayIfNeededIgnoringOpacity" (obj_id as Ptr)
		    
		    displayIfNeededIgnoringOpacity self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayIfNeededInRect(aRect as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub displayIfNeededInRect lib CocoaLib selector "displayIfNeededInRect:" (obj_id as Ptr, aRect as Cocoa.NSRect)
		    
		    displayIfNeededInRect self, aRect
		  #else
		    #pragma Unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayIfNeededInRectIgnoringOpacity(aRect as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub displayIfNeededInRectIgnoringOpacity lib CocoaLib selector "displayIfNeededInRectIgnoringOpacity" (obj_id as Ptr, aRect as Cocoa.NSRect)
		    
		    displayIfNeededInRectIgnoringOpacity self, aRect
		  #else
		    #pragma Unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayRect(aRect as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub displayRect lib CocoaLib selector "displayRect:" (obj_id as Ptr, aRect as Cocoa.NSRect)
		    
		    displayRect self, aRect
		  #else
		    #pragma Unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayRectIgnoringOpacity(aRect as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub displayRectIgnoringOpacity lib CocoaLib selector "displayRectIgnoringOpacity:" (obj_id as Ptr, aRect as Cocoa.NSRect)
		    
		    displayRectIgnoringOpacity self, aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayRectIgnoringOpacityInContext(aRect as Cocoa.NSRect, context as Ptr)
		  
		  #if TargetMacOS then
		    declare sub displayRectIgnoringOpacity lib CocoaLib selector "displayRectIgnoringOpacity:" (obj_id as Ptr, aRect as Cocoa.NSRect, context as Ptr)
		    
		    displayRectIgnoringOpacity self, aRect, context
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DragFile(fullPath as NSString, aRect as Cocoa.NSRect, slideBack as Boolean, theEvent as NSevent) As Boolean
		  
		  #if TargetMacOS then
		    declare function dragFileFromRectSlideBackEvent lib CocoaLib selector "dragFile:fromRect:slideBack:event:" (obj_id as Ptr, fullPath as Ptr, aRect as Cocoa.NSRect, slideBack as Boolean, theEvent as Ptr) as Boolean
		    
		    return dragFileFromRectSlideBackEvent( self, fullPath, aRect, slideBack, theEvent )
		  #else
		    #pragma Unused fullPath
		    #pragma Unused aRect
		    #pragma Unused slideBack
		    #pragma Unused theEvent
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DragImage(anImage as NSImage, imageLoc as Cocoa.NSPoint, mouseOffSet as Cocoa.NSSize, theEvent as NSEvent, pboard as NSPasteboard, sourceObject as Ptr, slideBack as Boolean)
		  
		  #if TargetMacOS then
		    declare sub dragImageatoffseteventpasteboardsourceslideBack lib CocoaLib selector "dragImage:at:offset:event:pasteboard:source:slideBack:" _
		    (obj_id as Ptr, anImage as Ptr, imageLoc as Cocoa.NSPoint, mouseOffSet as Cocoa.NSSize, theEvent as Ptr, pboard as Ptr, sourceObject as Ptr, slideBack as Boolean)
		    
		    dragImageatoffseteventpasteboardsourceslideBack self, anImage, imageLoc, mouseOffSet, theEvent, pboard, sourceObject, slideBack
		  #else
		    #pragma Unused anImage
		    #pragma Unused imageLoc
		    #pragma Unused mouseOffSet
		    #pragma Unused theEvent
		    #pragma Unused pboard
		    #pragma Unused sourceObject
		    #pragma Unused slideBack
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DragPromisedFilesOfTypes(typeArray as NSArray, aRect as Cocoa.NSRect, sourceObject as Ptr, slideBack as Boolean, theEvent as NSEvent) As Boolean
		  
		  #if TargetMacOS then
		    declare function dragPromisedFilesOfTypesFromRectSourceSlideBackEvent lib CocoaLib selector "dragPromisedFilesOfTypes:fromRect:source:slideBack:event:" _
		    (obj_id as Ptr, typeArray as Ptr, aRect as Cocoa.NSRect, sourceObject as Ptr, slideBack as Boolean, theEvent as Ptr) as Boolean
		    
		    return dragPromisedFilesOfTypesFromRectSourceSlideBackEvent( self, typeArray, aRect, sourceObject, slideBack, theEvent )
		  #else
		    #pragma Unused typeArray
		    #pragma Unused aRect
		    #pragma Unused sourceObject
		    #pragma Unused slideBack
		    #pragma Unused theEvent
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFocusRingMask()
		  
		  #if TargetMacOS then
		    declare sub setDrawFocusRingMask lib CocoaLib selector "drawFocusRingMask" (obj_id as Ptr)
		    
		    setDrawFocusRingMask self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPageBorderWithSize(borderSize as Cocoa.NSSize)
		  #if TargetMacOS then
		    declare sub drawPageBorderWithSize lib CocoaLib selector "drawPageBorderWithSize:" (obj_id as Ptr, borderSize as Cocoa.NSSize)
		    
		    drawPageBorderWithSize self, borderSize
		  #else
		    #pragma Unused borderSize
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawRect(dirtyRect as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub drawRect lib CocoaLib selector "drawRect:" (obj_id as Ptr, dirtyRect as Cocoa.NSRect)
		    
		    drawRect self, dirtyRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawSheetBorderWithSize(borderSize as Cocoa.NSSize)
		  #if TargetMacOS then
		    declare sub drawSheetBorderWithSize lib CocoaLib selector "drawSheetBorderWithSize:" (obj_id as Ptr, borderSize as Cocoa.NSSize)
		    
		    drawSheetBorderWithSize self, borderSize
		  #else
		    #pragma Unused borderSize
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndDocument()
		  #if TargetMacOS then
		    declare sub endDocument lib CocoaLib selector "endDocument" (obj_id as Ptr)
		    
		    endDocument self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndPage()
		  #if TargetMacOS then
		    declare sub endPage lib CocoaLib selector "endPage" (obj_id as Ptr)
		    
		    endPage self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnterFullScreenModeWithOptions(screen as NSScreen, options as NSDictionary = Nil) As Boolean
		  
		  #if TargetMacOS then
		    declare function getEnterFullScreenModeWithOptions lib CocoaLib selector "enterFullScreenMode:withOptions:" (obj_id as Ptr, screen as Ptr, options as Ptr) as Boolean
		    
		    dim optionsRef as Ptr
		    if options <> nil then
		      optionsRef = options
		    end if
		    
		    return getEnterFullScreenModeWithOptions(self, screen, optionsRef)
		  #else
		    #pragma Unused screen
		    #pragma Unused options
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FocusRingMaskBounds() As Cocoa.NSRect
		  
		  #if TargetMacOS then
		    declare function focusRingMaskBounds lib CocoaLib selector "focusRingMaskBounds" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return focusRingMaskBounds( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FocusView() As NSView
		  
		  #if TargetMacOS then
		    declare function focusView lib CocoaLib selector "focusView" (obj_id as Ptr) as Ptr
		    
		    return New NSView( focusView( ClassRef ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameOrigin(newOrigin as Cocoa.NSPoint)
		  
		  #if TargetMacOS then
		    declare sub setFrameOrigin lib CocoaLib selector "setFrameOrigin:" (obj_id as Ptr, newOrigin as Cocoa.NSPoint)
		    
		    setFrameOrigin self, newOrigin
		  #else
		    #pragma Unused newOrigin
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameSize(newSize as Cocoa.NSSize)
		  
		  #if TargetMacOS then
		    declare sub setFrameSize lib CocoaLib selector "setFrameSize:" (obj_id as Ptr, newSize as Cocoa.NSSize)
		    
		    setFrameSize self, newSize
		  #else
		    #pragma Unused newSize
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetRectsExposedDuringLiveResizeCount(ByRef exposedRects as Cocoa.NSRect, ByRef count as Integer)
		  
		  #if TargetMacOS then
		    declare sub getRectsExposedDuringLiveResizeCount lib CocoaLib selector "getRectsExposedDuringLiveResize:count:" (obj_id as Ptr, ByRef exposedRects as Cocoa.NSRect, ByRef count as Integer)
		    
		    getRectsExposedDuringLiveResizeCount self, exposedRects, count
		  #else
		    #pragma Unused exposedRects
		    #pragma Unused count
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HeightAdjustLimit() As Double
		  
		  #if TargetMacOS then
		    declare function getHeightAdjustLimit lib CocoaLib selector "heightAdjustLimit" (obj_id as Ptr) as Double
		    
		    return getHeightAdjustLimit( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDescendantOf(aView as NSView) As Boolean
		  
		  #if TargetMacOS then
		    declare function isDescendantOf lib CocoaLib selector "isDescendantOf:" (obj_id as Ptr, aView as Ptr) as Boolean
		    
		    return isDescendantOf( self, aView )
		  #else
		    #pragma Unused aView
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KnowsPageRange(aRange as Cocoa.NSRange) As Boolean
		  
		  #if TargetMacOS then
		    declare function knowsPageRange lib CocoaLib selector "knowsPageRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Boolean
		    
		    return knowsPageRange( self, aRange )
		  #else
		    #pragma Unused aRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocationOfPrintRect(aRect as Cocoa.NSRect) As Cocoa.NSPoint
		  
		  #if TargetMacOS then
		    declare function getLocationOfPrintRect lib CocoaLib selector "locationOfPrintRect:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Cocoa.NSPoint
		    
		    return getLocationOfPrintRect( self, aRect )
		  #else
		    #pragma Unused aRect
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LockFocus()
		  
		  #if TargetMacOS then
		    declare sub lockFocus lib CocoaLib selector "lockFocus" (obj_id as Ptr)
		    
		    lockFocus self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LockFocusIfCanDraw() As Boolean
		  
		  #if TargetMacOS then
		    declare function lockFocusIfCanDraw lib CocoaLib selector "lockFocusIfCanDraw" (obj_id as Ptr) as Boolean
		    
		    return lockFocusIfCanDraw( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LockFocusIfCanDrawInContext(context as Ptr) As Boolean
		  
		  #if TargetMacOS then
		    declare function lockFocusIfCanDrawInContext lib CocoaLib selector "lockFocusIfCanDrawInContext:" (obj_id as Ptr, context as Ptr) as Boolean
		    
		    return lockFocusIfCanDrawInContext( self, context )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MenuForEvent(theEvent as NSEvent) As NSMenu
		  
		  #if TargetMacOS then
		    declare function menuForEvent lib CocoaLib selector "menuForEvent:" (obj_id as Ptr, theEvent as Ptr) as Ptr
		    
		    return New NSMenu( menuForEvent( self, theEvent ) )
		  #else
		    #pragma Unused theEvent
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NeedsDisplayInRect(invalidRect as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub setNeedsDisplayInRect lib CocoaLib selector "setNeedsDisplayInRect:" (obj_id as Ptr, invalidRect as Cocoa.NSRect)
		    
		    setNeedsDisplayInRect self, invalidRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NeedsPanelToBecomeKey() As Boolean
		  
		  #if TargetMacOS then
		    declare function getNeedsPanelToBecomeKey lib CocoaLib selector "needsPanelToBecomeKey" (obj_id as Ptr) as Boolean
		    
		    return getNeedsPanelToBecomeKey( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NeedsToDrawRect(aRect as Cocoa.NSRect) As Boolean
		  
		  #If TargetMacOS then
		    declare function getNeedsToDrawRect lib CocoaLib selector "needsToDrawRect:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Boolean
		    
		    return getNeedsToDrawRect( self, aRect )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextValidKeyView() As NSView
		  
		  #if TargetMacOS then
		    declare function getNextValidKeyView lib CocoaLib selector "nextValidKeyView" (obj_id as Ptr) as Ptr
		    
		    return New NSView( getNextValidKeyView( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NoteFocusRingMaskChanged()
		  
		  #if TargetMacOS then
		    declare sub noteFocusRingMaskChanged lib CocoaLib selector "noteFocusRingMaskChanged" (obj_id as Ptr)
		    
		    noteFocusRingMaskChanged self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PageFooter() As NSAttributedString
		  #if TargetMacOS then
		    declare function getPageFooter lib CocoaLib selector "pageFooter" (obj_id as Ptr) as Ptr
		    
		    return New NSAttributedString( getPageFooter( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PageHeader() As NSAttributedString
		  #if TargetMacOS then
		    declare function getPageFooter lib CocoaLib selector "pageFooter" (obj_id as Ptr) as Ptr
		    
		    return New NSAttributedString( getPageFooter( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreviousValidKeyView() As NSView
		  
		  #if TargetMacOS then
		    declare function getPreviousValidKeyView lib CocoaLib selector "previousValidKeyView" (obj_id as Ptr) as Ptr
		    
		    return New NSView( getPreviousValidKeyView( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Print(sender as Ptr = Nil)
		  
		  #if TargetMacOs then
		    declare sub print lib CocoaLib selector "print:" (obj_id as Ptr, sender as Ptr)
		    
		    dim senderRef as Ptr
		    if sender <> nil then
		      senderRef = sender
		    end if
		    
		    print self, senderRef
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrintJobTitle() As NSString
		  
		  #if TargetMacOS then
		    declare function getPrintJobTitle lib CocoaLib selector "printJobTitle" (obj_id as Ptr) as Ptr
		    
		    return New NSString( getPrintJobTitle( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RectForPage(pageNumber as Integer) As Cocoa.NSRect
		  
		  #if TargetMacOS then
		    declare function getRectForPage lib CocoaLib selector "rectForPage:" (obj_id as Ptr, pageNumber as Integer) as Cocoa.NSRect
		    
		    return getRectForPage( self, pageNumber )
		  #else
		    #pragma Unused pageNumber
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RectPreservedDuringLiveResize() As Cocoa.NSRect
		  
		  #if TargetMacOS then
		    declare function getRectPreservedDuringLiveResize lib CocoaLib selector "rectPreservedDuringLiveResize" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return getRectPreservedDuringLiveResize( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RegisteredDraggedTypes() As NSArray
		  
		  #if TargetMacOS then
		    declare function getRegisteredDraggedTypes lib CocoaLib selector "registeredDraggedTypes" (obj_id as Ptr) as Ptr
		    
		    return New NSArray( getRegisteredDraggedTypes( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterForDraggedTypes(newTypes as NSArray)
		  
		  #if TargetMacOS then
		    declare sub registerForDraggedTypes lib CocoaLib selector "registerForDraggedTypes:" (obj_id as Ptr, newTypes as Ptr)
		    
		    registerForDraggedTypes self, newTypes
		  #else
		    #pragma Unused newTypes
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllToolTips()
		  
		  #if TargetMacOS then
		    declare sub removeAllToolTips lib CocoaLib selector "removeAllToolTips" (obj_id as Ptr)
		    
		    removeAllToolTips self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFromSuperview()
		  
		  #if TargetMacOS then
		    declare sub removeFromSuperview lib CocoaLib selector "removeFromSuperview" (obj_id as Ptr)
		    
		    removeFromSuperview self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFromSuperviewWithoutNeedingDisplay()
		  
		  #if TargetMacOS then
		    declare sub removeFromSuperviewWithoutNeedingDisplay lib CocoaLib selector "removeFromSuperviewWithoutNeedingDisplay" (obj_id as Ptr)
		    
		    removeFromSuperviewWithoutNeedingDisplay self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveToolTip(tag as Integer)
		  
		  #if TargetMacOS then
		    declare sub removeToolTip lib CocoaLib selector "removeToolTip:" (obj_id as Ptr, tag as Integer)
		    
		    removeToolTip self, tag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveTrackingRect(tag as Integer)
		  
		  #if TargetMacOS then
		    declare sub removeTrackingRect lib CocoaLib selector "removeTrackingRect:" (obj_id as Ptr, tag as Integer)
		    
		    removeTrackingRect self, tag
		  #else
		    #pragma Unused tag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceSubviewWith(oldView as NSView, newView as NSView)
		  
		  #if TargetMacOS then
		    declare sub replaceSubviewWith lib CocoaLib selector "replaceSubview:with:" (obj_id as Ptr, oldView as Ptr, newView as Ptr)
		    
		    replaceSubviewWith self, oldView, newView
		  #else
		    #pragma Unused oldView
		    #pragma Unused newView
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeSubviewsWithOldSize(oldBoundsSize as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub resizeSubviewsWithOldSize lib CocoaLib selector "resizeSubviewsWithOldSize:" (obj_id as Ptr, oldBoundsSize as Cocoa.NSRect)
		    
		    resizeSubviewsWithOldSize self, oldBoundsSize
		  #else
		    #pragma Unused oldBoundsSize
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeWithOldSuperviewSize(oldBoundsSize as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub resizeWithOldSuperviewSize lib CocoaLib selector "resizeWithOldSuperviewSize:" (obj_id as Ptr, oldBoundsSize as Cocoa.NSRect)
		    
		    resizeWithOldSuperviewSize self, oldBoundsSize
		  #else
		    #pragma Unused OldBoundsSize
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateByAngle(angle as Double)
		  
		  #if TargetMacOS then
		    declare sub rotateByAngle lib CocoaLib selector "rotateByAngle:" (obj_id as Ptr, angle as Double)
		    
		    rotateByAngle self, angle
		  #else
		    #pragma Unused angle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScaleUnitSquareToSize(newUnitSize as Cocoa.NSSize)
		  
		  #if TargetMacOS then
		    declare sub scaleUnitSquareToSize lib CocoaLib selector "scaleUnitSquareToSize:" (obj_id as Ptr, newUnitSize as Cocoa.NSSize)
		    
		    scaleUnitSquareToSize self, newUnitSize
		  #else
		    #pragma Unused newUnitSize
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollPoint(aPoint as Cocoa.NSPoint)
		  
		  #if TargetMacOS then
		    declare sub scrollPoint lib CocoaLib selector "scrollPoint:" (obj_id as Ptr, aPoint as Cocoa.NSPoint)
		    
		    scrollPoint self, aPoint
		  #else
		    #pragma Unused aPoint
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollRectBy(aRect as Cocoa.NSRect, offset as Cocoa.NSPoint)
		  
		  #if TargetMacOS then
		    declare sub scrollRectBy lib CocoaLib selector "scrollRect:by:" (obj_id as Ptr, aRect as Cocoa.NSRect, offset as Cocoa.NSPoint)
		    
		    scrollRectBy self, aRect, offset
		  #else
		    #pragma Unused aRect
		    #pragma Unused offset
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScrollRectToVisible(aRect as Cocoa.NSRect) As Boolean
		  
		  #if TargetMacOs then
		    declare function scrollRectToVisible lib CocoaLib selector "scrollRectToVisible:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Boolean
		    
		    return scrollRectToVisible( self, aRect )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setKeyboardFocusRingNeedsDisplayInRect(rect as Cocoa.NSRect)
		  
		  #if TargetMacOS then
		    declare sub setKeyboardFocusRingNeedsDisplayInRect lib CocoaLib selector "setKeyboardFocusRingNeedsDisplayInRect:" (obj_id as Ptr, rect as Cocoa.NSRect)
		    
		    setKeyboardFocusRingNeedsDisplayInRect self, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShouldDelayWindowOrderingForEvent(theEvent as NSEvent) As Boolean
		  
		  #if TargetMacOS then
		    declare function shouldDelayWindowOrderingForEvent lib CocoaLib selector "shouldDelayWindowOrderingForEvent:" (obj_id as Ptr, theEvent as Ptr) as Boolean
		    
		    return shouldDelayWindowOrderingForEvent( self, theEvent )
		  #else
		    #pragma Unused theEvent
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortSubviewsUsingFunction(compare as NSComparisonResult, context as Ptr = Nil)
		  
		  #if TargetMacOS then
		    declare sub sortSubviewsUsingFunction lib CocoaLib selector "sortSubviewsUsingFunction:context:" (obj_id as Ptr, compare as NSComparisonResult, context as Ptr)
		    
		    sortSubviewsUsingFunction self, compare, context
		  #else
		    #pragma Unused compare
		    #pragma Unused context
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateOriginToPoint(newOrigin as Cocoa.NSPoint)
		  
		  #if TargetMacOS then
		    declare sub translateOriginToPoint lib CocoaLib selector "translateOriginToPoint:" (obj_id as Ptr, newOrigin as Cocoa.NSPoint)
		    
		    translateOriginToPoint self, newOrigin
		  #else
		    #pragma Unused newOrigin
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateRectsNeedingDisplayInRectBy(clipRect as Cocoa.NSRect, delta as Cocoa.NSSize)
		  
		  #if TargetMacOS then
		    declare sub translateRectsNeedingDisplayInRectby lib CocoaLib selector "translateRectsNeedingDisplayInRect:by:" (obj_id as Ptr, clipRect as Cocoa.NSRect, delta as Cocoa.NSSize)
		    
		    translateRectsNeedingDisplayInRectby self, clipRect, delta
		  #else
		    #pragma Unused clipRect
		    #pragma Unused delta
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnlockFocus()
		  
		  #if TargetMacOS then
		    declare sub unlockFocus lib CocoaLib selector "unlockFocus" (obj_id as Ptr)
		    
		    unlockFocus self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterDraggedTypes()
		  
		  #if TargetMacOS then
		    declare sub unregisterDraggedTypes lib CocoaLib selector "unregisterDraggedTypes" (obj_id as Ptr)
		    
		    unregisterDraggedTypes self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WidthAdjustLimit() As Double
		  
		  #if TargetMacOS then
		    declare function getWidthAdjustLimit lib CocoaLib selector "widthAdjustLimit" (obj_id as Ptr) as Double
		    
		    return getWidthAdjustLimit( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WillDraw()
		  
		  #if TargetMacOS then
		    declare sub viewWillDraw lib CocoaLib selector "viewWillDraw" (obj_id as Ptr)
		    
		    viewWillDraw self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WillMoveToSuperView(newSuperview as NSView)
		  
		  #if TargetMacOS then
		    declare sub viewWillMoveToSuperview lib CocoaLib selector "viewWillMoveToSuperview:" (obj_id as Ptr, newSuperview as Ptr)
		    
		    viewWillMoveToSuperview self, newSuperview
		  #else
		    #pragma Unused newSuperview
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WillMoveToWindow(newWindow as NSWindow)
		  
		  #if TargetMacOS then
		    declare sub viewWillMoveToWindow lib CocoaLib selector "viewWillMoveToWindow:" (obj_id as Ptr, newWindow as Ptr)
		    
		    dim p as Ptr
		    if newWindow <> nil then
		      p = newWindow
		    end if
		    
		    viewWillMoveToWindow self, p
		  #else
		    #pragma Unused newWindow
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WillRemoveSubview(subview as NSView)
		  
		  #if TargetMacOS then
		    declare sub willRemoveSubview lib CocoaLib selector "willRemoveSubview:" (obj_id as Ptr, subview as Ptr)
		    
		    willRemoveSubview self, subview
		  #else
		    #pragma Unused subview
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WithTag(aTag as Integer) As Ptr
		  
		  #if TargetMacOS then
		    declare function viewWithTag lib CocoaLib selector "viewWithTag:" (obj_id as Ptr, aTag as Integer) as Ptr
		    
		    return viewWithTag( self, aTag )
		  #else
		    #pragma Unused aTag
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteEPSInsideRectToPasteboard(aRect as Cocoa.NSRect, pboard as NSPasteboard)
		  
		  #if TargetMacOS then
		    declare sub writeEPSInsideRectToPasteboard lib CocoaLib selector "writeEPSInsideRect:toPasteboard:" (obj_id as Ptr, aRect as Cocoa.NSRect, pboard as Ptr)
		    
		    writeEPSInsideRectToPasteboard self, aRect, pboard
		  #else
		    #pragma Unused aRect
		    #pragma Unused pboard
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WritePDFInsideRectToPasteboard(aRect as Cocoa.NSRect, pboard as NSPasteboard)
		  
		  #if TargetMacOS then
		    declare sub writePDFInsideRectToPasteboard lib CocoaLib selector "writePDFInsideRect:toPasteboard:" (obj_id as Ptr, aRect as Cocoa.NSRect, pboard as Ptr)
		    
		    writePDFInsideRectToPasteboard self, aRect, pboard
		  #else
		    #pragma Unused aRect
		    #pragma Unused pboard
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = TODO
		
		"enclosingScrollView" needs a NSScrollView to exist.
		NSClipView is needed for "scrollClipView:toPoint:" & "reflectScrolledClipView:"
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getAutoresizesSubviews lib CocoaLib selector "autoresizesSubviews" (obj_id as Ptr) as Boolean
			    
			    return getAutoresizesSubviews( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setAutoresizesSubviews lib CocoaLib selector "setAutoresizesSubviews:" (obj_id as Ptr, value as Boolean)
			    
			    setAutoresizesSubviews self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		AutoresizesSubviews As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getAutoresizingMask lib CocoaLib selector "autoresizingMask" (obj_id as Ptr) as Integer
			    
			    return getAutoresizingMask( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setAutoresizingMask lib CocoaLib selector "setAutoresizingMask:" (obj_id as Ptr, value as Integer)
			    
			    setAutoresizingMask self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		AutoresizingMask As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getBounds lib CocoaLib selector "bounds" (obj_id as Ptr) as Cocoa.NSRect
			    
			    return getBounds( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setBounds lib CocoaLib selector "setBounds:" (obj_id as Ptr, value as Cocoa.NSRect)
			    
			    setBounds self, value
			  #endif
			End Set
		#tag EndSetter
		Bounds As Cocoa.NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getBoundsRotation lib CocoaLib selector "boundsRotation" (obj_id as Ptr) as Double
			    
			    return getBoundsRotation( self )
			  #endif
			End Get
		#tag EndGetter
		BoundsRotation As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getCanBecomeKeyView lib CocoaLib selector "canBecomeKeyView" (obj_id as Ptr) as Boolean
			    
			    return getCanBecomeKeyView( self )
			  #endif
			End Get
		#tag EndGetter
		CanBecomeKeyView As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getCanDraw lib CocoaLib selector "canDraw" (obj_id as Ptr) as Boolean
			    
			    return getCanDraw( self )
			  #endif
			End Get
		#tag EndGetter
		CanDraw As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getCanDrawConcurrently lib CocoaLib selector "canDrawConcurrently" (obj_id as Ptr) as Boolean
			    
			    return getCanDrawConcurrently( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOs then
			    declare sub setCanDrawConcurrently lib CocoaLib selector "setCanDrawConcurrently:" (obj_id as Ptr, value as Boolean)
			    
			    setCanDrawConcurrently self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		CanDrawConcurrently As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getEnclosingMenuItem lib CocoaLib selector "enclosingMenuItem" (obj_id as Ptr) as Ptr
			    
			    return New NSMenuItem( getEnclosingMenuItem( self ) )
			  #endif
			End Get
		#tag EndGetter
		EnclosingMenuItem As NSMenuItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the nearest ancestor NSScrollView object containing the receiver (not including the receiver itself); otherwise returns nil.
			  //#TODO create NSScrollView
			  
			  #if TargetMacOS then
			    declare function enclosingScrollView lib CocoaLib selector "enclosingScrollView" (obj_id as Ptr) as Ptr
			    
			    return enclosingScrollView( self )
			  #endif
			End Get
		#tag EndGetter
		EnclosingScrollView As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getFocusRingType lib CocoaLib selector "focusRingType" (obj_id as Ptr) as NSFocusRingType
			    
			    return getFocusRingType( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setFocusRingType lib CocoaLib selector "setFocusRingType:" (obj_id as Ptr, value as NSFocusRingType)
			    
			    setFocusRingType self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		FocusRingType As NSFocusRingType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getFrame lib CocoaLib selector "frame" (obj_id as Ptr) as Cocoa.NSRect
			    
			    return getFrame( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setFrame lib CocoaLib selector "setFrame:" (obj_id as Ptr, value as Cocoa.NSRect)
			    
			    setFrame self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Frame As Cocoa.NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getFrameRotation lib CocoaLib selector "frameRotation" (obj_id as Ptr) as Double
			    
			    return getFrameRotation( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setFrameRotation lib CocoaLib selector "setFrameRotation:" (obj_id as Ptr, value as Double)
			    
			    setFrameRotation self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		FrameRotation As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getHidden lib CocoaLib selector "isHidden" (obj_id as Ptr) as Boolean
			    
			    return getHidden( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setHidden lib CocoaLib selector "setHidden:" (obj_id as Ptr, value as Boolean)
			    
			    setHidden self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Hidden As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIsHiddenOrHasHiddenAncestor lib CocoaLib selector "isHiddenOrHasHiddenAncestor" (obj_id as Ptr) as Boolean
			    
			    return getIsHiddenOrHasHiddenAncestor( self )
			  #endif
			End Get
		#tag EndGetter
		HiddenOrHasHiddenAncestor As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getInLiveResize lib CocoaLib selector "inLiveResize" (obj_id as Ptr) as Boolean
			    
			    return getInLiveResize( self )
			  #endif
			End Get
		#tag EndGetter
		InLiveResize As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIsFlipped lib CocoaLib selector "isFlipped" (obj_id as Ptr) as Boolean
			    
			    return getIsFlipped( self )
			  #endif
			End Get
		#tag EndGetter
		IsFlipped As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIsInFullScreenMode lib CocoaLib selector "isInFullScreenMode" (obj_id as Ptr) as Boolean
			    
			    return getIsInFullScreenMode( self )
			  #endif
			End Get
		#tag EndGetter
		IsInFullScreenMode As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIsOpaque lib CocoaLib selector "isOpaque" (obj_id as Ptr) as Boolean
			    
			    return getIsOpaque( self )
			  #endif
			End Get
		#tag EndGetter
		IsOpague As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIsRotatedFromBase lib CocoaLib selector "isRotatedFromBase" (obj_id as Ptr) as Boolean
			    
			    return getIsRotatedFromBase( self)
			  #endif
			End Get
		#tag EndGetter
		IsRotatedFromBase As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIsRotatedOrScaledFromBase lib CocoaLib selector "isRotatedOrScaledFromBase" (obj_id as Ptr) as Boolean
			    
			    return getIsRotatedOrScaledFromBase( self )
			  #endif
			End Get
		#tag EndGetter
		IsRotatedOrScaledFromBase As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getNeedsDisplay lib CocoaLib selector "needsDisplay" (obj_id as Ptr) as Boolean
			    
			    return getNeedsDisplay( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setNeedsDisplay lib CocoaLib selector "setNeedsDisplay:" (obj_id as Ptr, value as Boolean)
			    
			    setNeedsDisplay self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		NeedsDisplay As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getNextKeyView lib CocoaLib selector "nextKeyView" (obj_id as Ptr) as Ptr
			    
			    return New NSView( getNextKeyView( self ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setNextKeyView lib CocoaLib selector "setNextKeyView:" (obj_id as Ptr, value as Ptr)
			    
			    setNextKeyView self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		NextKeyView As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getOpaqueAncestor lib CocoaLib selector "opaqueAncestor" (obj_id as Ptr) as Ptr
			    
			    return New NSView( getOpaqueAncestor( self ) )
			  #endif
			End Get
		#tag EndGetter
		OpaqueAncestor As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getPostsBoundsChangedNotifications lib CocoaLib selector "postsBoundsChangedNotifications" (obj_id as Ptr) as Boolean
			    
			    return getPostsBoundsChangedNotifications( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setPostsBoundsChangedNotifications lib CocoaLib selector "setPostsBoundsChangedNotifications:" (obj_id as Ptr, value as Boolean)
			    
			    setPostsBoundsChangedNotifications self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		PostsBoundsChangedNotifications As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getPostsFrameChangedNotifications lib CocoaLib selector "postsFrameChangedNotifications" (obj_id as Ptr) as Boolean
			    
			    return getPostsFrameChangedNotifications( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setPostsFrameChangedNotifications lib CocoaLib selector "setPostsFrameChangedNotifications:" (obj_id as Ptr, value as Boolean)
			    
			    setPostsFrameChangedNotifications self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		PostsFrameChangedNotifications As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getPreservesContentDuringLiveResize lib CocoaLib selector "preservesContentDuringLiveResize" (obj_id as Ptr) as Boolean
			    
			    return getPreservesContentDuringLiveResize( self )
			  #endif
			End Get
		#tag EndGetter
		PreservesContentDuringLiveResize As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getPreviousKeyView lib CocoaLib selector "previousKeyView" (obj_id as Ptr) as Ptr
			    
			    return New NSView( getPreviousKeyView( self ) )
			  #endif
			End Get
		#tag EndGetter
		PreviousKeyView As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getShouldDrawColor lib CocoaLib selector "shouldDrawColor" (obj_id as Ptr) as Boolean
			    
			    return getShouldDrawColor( self )
			  #endif
			End Get
		#tag EndGetter
		ShouldDrawColor As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getSubviews lib CocoaLib selector "subviews" (obj_id as Ptr) as Ptr
			    
			    return New NSArray( getSubviews( self ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setSubviews lib CocoaLib selector "setSubviews:" (obj_id as Ptr, value as Ptr)
			    
			    setSubviews self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Subviews As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getSuperview lib CocoaLib selector "superview" (obj_id as Ptr) as Ptr
			    
			    return New NSView( getSuperview( self ) )
			  #endif
			End Get
		#tag EndGetter
		Superview As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getTag lib CocoaLib selector "tag" (obj_id as Ptr) as Integer
			    
			    return getTag( self )
			  #endif
			End Get
		#tag EndGetter
		Tag As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getTooltip lib CocoaLib selector "toolTip" (obj_id as Ptr) as CFStringRef
			    
			    return getTooltip( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setToolTip lib CocoaLib selector "setToolTip:" (obj_id as Ptr, value as Ptr)
			    
			    setToolTip self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Tooltip As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getVisibleRect lib CocoaLib selector "visibleRect" (obj_id as Ptr) as Cocoa.NSRect
			    
			    return getVisibleRect( self )
			  #endif
			End Get
		#tag EndGetter
		VisibleRect As Cocoa.NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function wantsDefaultClipping lib CocoaLib selector "wantsDefaultClipping" (obj_id as Ptr) as Boolean
			    
			    return wantsDefaultClipping( self )
			  #endif
			End Get
		#tag EndGetter
		WantsDefaultClipping As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Specifies whether the receiver and its subviews use a Core Animation layer as a backing store.
		#tag EndNote
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function wantsLayer lib CocoaLib selector "wantsLayer" (obj_id as Ptr) as Boolean
			    
			    return wantsLayer( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setWantsLayer lib CocoaLib selector "setWantsLayer:" (obj_id as Ptr, value As Boolean )
			    
			    setWantsLayer self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		WantsLayer As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function getWindow lib CocoaLib selector "window" (obj_id as Ptr) as Ptr
			    
			    return New NSWindow( getWindow( self ) )
			  #endif
			End Get
		#tag EndGetter
		Window As NSWindow
	#tag EndComputedProperty


	#tag Constant, Name = NSFullScreenModeAllScreens, Type = String, Dynamic = False, Default = \"NSFullScreenModeAllScreens", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFullScreenModeApplicationPresentationOptions, Type = String, Dynamic = False, Default = \"NSFullScreenModeApplicationPresentationOptions", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFullScreenModeSetting, Type = String, Dynamic = False, Default = \"NSFullScreenModeSetting", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFullScreenModeWindowLevel, Type = String, Dynamic = False, Default = \"NSFullScreenModeWindowLevel", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSViewHeightSizable, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSViewMaxXMargin, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSViewMaxYMargin, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSViewMinXMargin, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSViewMinYMargin, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSViewNotSizable, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSViewWidthSizable, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSFocusRingType, Type = Integer, Flags = &h0
		Default
		  None
		Exterior
	#tag EndEnum

	#tag Enum, Name = NSWindowOrderingMode, Type = Integer, Flags = &h0
		NSWindowBelow = -1
		  NSWindowOut = 0
		NSWindowAbove = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoresizingMask"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BoundsRotation"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeKeyView"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDraw"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDrawConcurrently"
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
			Name="FocusRingType"
			Group="Behavior"
			Type="NSFocusRingType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - Exterior"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrameRotation"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hidden"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HiddenOrHasHiddenAncestor"
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
			Name="InLiveResize"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsInFullScreenMode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsOpague"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRotatedFromBase"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRotatedOrScaledFromBase"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NeedsDisplay"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PostsBoundsChangedNotifications"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PostsFrameChangedNotifications"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreservesContentDuringLiveResize"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShouldDrawColor"
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
			Name="Tag"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WantsDefaultClipping"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WantsLayer"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

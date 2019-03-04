#tag Class
Class NSWindow
Inherits NSResponder
	#tag Method, Flags = &h0
		Sub AddChildWindow(childWindow as NSWindow, orderingMode as NSWindowOrderingMode)
		  
		  #if TargetCocoa
		    declare sub addChildWindow lib CocoaLib selector "addChildWindow:ordered:" _
		    (obj_id as Ptr, childWindow as Ptr, orderingMode as NSWindowOrderingMode)
		    
		    dim childWindowRef as Ptr
		    if childWindow <> nil then
		      childWindowRef = childWindow
		    end if
		    
		    addChildWindow self, childWindowRef, orderingMode
		    
		  #else
		    #pragma unused childWindow
		    #pragma unused orderingMode
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AnchorAttribute(orientation as NSLayoutConstraint.NSLayoutConstraintOrientation) As NSLayoutConstraint.NSLayoutAttribute
		  
		  #if TargetCocoa
		    declare function anchorAttributeForOrientation lib CocoaLib selector "anchorAttributeForOrientation:" _
		    (obj_id as Ptr, orientation as NSLayoutConstraint.NSLayoutConstraintOrientation) as NSLayoutConstraint.NSLayoutAttribute
		    
		    return anchorAttributeForOrientation(self, orientation)
		    
		  #else
		    #pragma unused orientation
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AnchorAttribute(orientation as NSLayoutConstraint.NSLayoutConstraintOrientation, assigns attrib as NSLayoutConstraint.NSLayoutAttribute)
		  
		  #if TargetCocoa
		    declare sub setAnchorAttribute lib CocoaLib selector "setAnchorAttribute:forOrientation:" _
		    (obj_id as Ptr, attrib as NSLayoutConstraint.NSLayoutAttribute, orientation as NSLayoutConstraint.NSLayoutConstraintOrientation)
		    
		    setAnchorAttribute self, attrib, orientation
		    
		  #else
		    #pragma unused attrib
		    #pragma unused orientation
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AnimationResizeTime(newWindowFrame as Cocoa.NSRect) As Double
		  
		  #if TargetCocoa
		    declare function animationResizeTime lib CocoaLib selector "animationResizeTime:" _
		    (obj_id as Ptr, newWindowFrame as Cocoa.NSRect) as Double
		    
		    return animationResizeTime(self, newWindowFrame)
		    
		  #else
		    #pragma unused newWindowFrame
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutorecalculatesContentBorderThickness(edge as Cocoa.NSRectEdge) As Boolean
		  
		  #if TargetCocoa
		    declare function autorecalculatesContentBorderThicknessForEdge lib CocoaLib selector "autorecalculatesContentBorderThicknessForEdge:" _
		    (obj_id as Ptr, edge as Cocoa.NSRectEdge) as Boolean
		    
		    return autorecalculatesContentBorderThicknessForEdge(self, edge)
		    
		  #else
		    #pragma unused edge
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutorecalculatesContentBorderThickness(edge as Cocoa.NSRectEdge, assigns flag as Boolean)
		  
		  #if TargetCocoa
		    declare sub setAutorecalculatesContentBorderThickness lib CocoaLib selector "setAutorecalculatesContentBorderThickness:forEdge:" _
		    (obj_id as Ptr, flag as Boolean, edge as Cocoa.NSRectEdge)
		    
		    setAutorecalculatesContentBorderThickness self, flag, edge
		    
		  #else
		    #pragma unused edge
		    #pragma unused flag
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BackingAlignedRect(aRect as Cocoa.NSRect, alignmentOptions as UInt64) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function backingAlignedRect lib CocoaLib selector "backingAlignedRect:options:" _
		    (obj_id as Ptr, aRect as Cocoa.NSRect, alignmentOptions as UInt64) as Cocoa.NSRect
		    
		    return backingAlignedRect(self, aRect, alignmentOptions)
		    
		  #else
		    #pragma unused aRect
		    #pragma unused alignmentOptions
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CacheImageInRect(aRect as Cocoa.NSRect)
		  
		  #if TargetCocoa
		    declare sub cacheImageInRect lib CocoaLib selector "cacheImageInRect" (obj_id as Ptr, aRect as Cocoa.NSRect)
		    
		    cacheImageInRect self, aRect
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CascadeTopLeftFromPoint(topLeft as Cocoa.NSPoint) As Cocoa.NSPoint
		  
		  #if TargetCocoa
		    declare function cascadeTopLeftFromPoint lib CocoaLib selector "cascadeTopLeftFromPoint:" _
		    (obj_id as Ptr, topLeft as Cocoa.NSPoint) as Cocoa.NSPoint
		    
		    return cascadeTopLeftFromPoint(self, topLeft)
		    
		  #else
		    #pragma unused topLeft
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Center()
		  //@header Sets the window’s location to the center of the screen.
		  
		  #if TargetCocoa
		    declare sub center lib CocoaLib selector "center" (obj_id as Ptr)
		    
		    center self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildWindows() As NSWindow()
		  
		  #if TargetCocoa
		    declare function childWindows lib CocoaLib selector "childWindows" (obj_id as Ptr) as Ptr
		    
		    dim retArray() as NSWindow
		    
		    dim arrayRef as Ptr = childWindows(self)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSWindow(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSWindow")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  
		  #if TargetCocoa
		    declare sub close lib CocoaLib selector "close" (obj_id as Ptr)
		    
		    close self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConstrainFrameRect(frameRect as Cocoa.NSRect, aScreen as NSScreen) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function constrainFrameRect lib CocoaLib selector "constrainFrameRect:toScreen:" _
		    (obj_id as Ptr, frameRect as Cocoa.NSRect, aScreen as Ptr) as Cocoa.NSRect
		    
		    dim screenRef as Ptr
		    if aScreen <> nil then
		      screenRef = aScreen
		    end if
		    
		    return constrainFrameRect(self, frameRect, screenRef)
		    
		  #else
		    #pragma unused frameRect
		    #pragma unused aScreen
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(contentRect as Cocoa.NSRect, windowStyle as UInt32, bufferingType as NSBackingStoreType, deferCreation as Boolean)
		  
		  #if TargetCocoa
		    declare function initWithContentRect lib CocoaLib selector "initWithContentRect:styleMask:backing:defer:" _
		    (obj_id as Ptr, contentRect as Cocoa.NSRect, windowStyle as UInt32, bufferingType as NSBackingStoreType, deferCreation as Boolean) as Ptr
		    
		    super.Constructor(initWithContentRect(Allocate("NSWindow"), contentRect, windowStyle, bufferingType, deferCreation), NSWindow.hasOwnership)
		    
		  #else
		    #pragma unused contentRect
		    #pragma unused windowStyle
		    #pragma unused bufferingType
		    #pragma unused deferCreation
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(contentRect as Cocoa.NSRect, windowStyle as UInt32, bufferingType as NSBackingStoreType, deferCreation as Boolean, aScreen as NSScreen)
		  
		  #if TargetCocoa
		    declare function initWithContentRect lib CocoaLib selector "initWithContentRect:styleMask:backing:defer:screen:" _
		    (obj_id as Ptr, contentRect as Cocoa.NSRect, windowStyle as UInt32, bufferingType as NSBackingStoreType, deferCreation as Boolean, aScreen as Ptr) as Ptr
		    
		    dim screenRef as Ptr
		    if aScreen <> nil then
		      screenRef = aScreen
		    end if
		    
		    super.Constructor(initWithContentRect(Allocate("NSWindow"), contentRect, windowStyle, bufferingType, deferCreation, screenRef), NSWindow.hasOwnership)
		    
		  #else
		    #pragma unused contentRect
		    #pragma unused windowStyle
		    #pragma unused bufferingType
		    #pragma unused deferCreation
		    #pragma unused aScreen
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(w as Window)
		  
		  super.Constructor(Ptr(w.handle), not hasOwnership)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentBorderBottomThickness() As Double
		  //@header Returns the thickness of the bottom border of the window.
		  
		  // Convenience method.
		  return ContentBorderThickness( cocoa.NSRectEdge.NSMinYEdge )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContentBorderBottomThickness(assigns thickness as Double)
		  //@header Indicates the thickness of the bottom border of the window.
		  
		  // Convenience method.
		  ContentBorderThickness( cocoa.NSRectEdge.NSMinYEdge ) = thickness
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentBorderThickness(edge as Cocoa.NSRectEdge) As Double
		  //@header Indicates the thickness of a given border of the window.
		  
		  #if TargetCocoa
		    declare function contentBorderThicknessForEdge lib CocoaLib selector "contentBorderThicknessForEdge:" _
		    (obj_id as Ptr, edge as Cocoa.NSRectEdge) as Double
		    
		    return contentBorderThicknessForEdge(self, edge)
		  #else
		    #pragma unused edge
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContentBorderThickness(edge as Cocoa.NSRectEdge, assigns thickness as Double)
		  //@header Specifies the thickness of a given border of the window.
		  
		  //@param '''thickness''' The thickness for edge
		  //@param '''edge''' The border whose thickness to set _
		  //  __NSMaxYEdge__: Top border. _
		  //  __NSMinYEdge__: Bottom border. _
		  //@param/
		  
		  //@discussion
		  // In a non-textured window calling setContentBorderThickness:forEdge: passing NSMaxYEdge will raise an exception. _
		  // It is only valid to set the content border thickness of the top edge in a textured window.
		  // The contentBorder does not include the titlebar or toolbar, so a textured window that just wants the gradient _
		  // in the titlebar and toolbar should have a contentBorderThickness of 0 for NSMaxYEdge.
		  //@discussion/
		  
		  #if TargetCocoa
		    declare sub setBackingType lib CocoaLib selector "setBackingType:" (obj_id as Ptr, BackingType as NSBackingStoreType)
		    declare sub setAutorecalculatesContentBorderThicknessForEdge lib CocoaLib selector "setAutorecalculatesContentBorderThickness:forEdge:" (obj_id as Ptr, Flag as Boolean, edge as Cocoa.NSRectEdge)
		    declare sub setContentBorderThicknessForEdge lib CocoaLib selector "setContentBorderThickness:forEdge:" (obj_id as Ptr, thickness as Double, edge as Cocoa.NSRectEdge)
		    
		    setBackingType self, NSBackingStoreType.NSBackingStoreBuffered
		    setAutorecalculatesContentBorderThicknessForEdge self, false, edge // Do not recalculate the border thickness automatically
		    setContentBorderThicknessForEdge self, thickness, edge
		  #else
		    #pragma unused thickness
		    #pragma unused edge
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentBorderTopThickness() As Double
		  //@header Returns the thickness of the top border of the window.
		  
		  // Convenience method.
		  return ContentBorderThickness( cocoa.NSRectEdge.NSMaxYEdge )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContentBorderTopThickness(assigns thickness as Double)
		  //@header Indicates the thickness of the top border of the window.
		  
		  // Convenience method.
		  ContentBorderThickness( cocoa.NSRectEdge.NSMaxYEdge ) = thickness
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentRect(windowFrame as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function contentRectForFrameRect lib CocoaLib selector "contentRectForFrameRect:" _
		    (obj_id as Ptr, windowFrame as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return contentRectForFrameRect(self, windowFrame)
		    
		  #else
		    #pragma unused windowFrame
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ContentRect(windowFrame as Cocoa.NSRect, styleMask as UInt32) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function contentRectForFrameRect lib CocoaLib selector "contentRectForFrameRect:styleMask:" _
		    (class_id as Ptr, windowFrame as Cocoa.NSRect, styleMask as UInt32) as Cocoa.NSRect
		    
		    return contentRectForFrameRect(ClassRef, windowFrame, styleMask)
		    
		  #else
		    #pragma unused windowFrame
		    #pragma unused styleMask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertRectFromBacking(aRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function convertRectFromBacking lib CocoaLib selector "convertRectFromBacking:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return convertRectFromBacking(self, aRect)
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertRectFromScreen(aRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function convertRectFromScreen lib CocoaLib selector "convertRectFromScreen:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return convertRectFromScreen(self, aRect)
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertRectToBacking(aRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function convertRectToBacking lib CocoaLib selector "convertRectToBacking:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return convertRectToBacking(self, aRect)
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertRectToScreen(aRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function convertRectToScreen lib CocoaLib selector "convertRectToScreen:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return convertRectToScreen(self, aRect)
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataWithEPS(aRect as Cocoa.NSRect) As NSData
		  
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
		Function DataWithPDF(aRect as Cocoa.NSRect) As NSData
		  
		  #if TargetCocoa
		    declare function dataWithPDFInsideRect lib CocoaLib selector "dataWithPDFInsideRect:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Ptr
		    
		    dim dataRef as Ptr = dataWithPDFInsideRect(self, aRect)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused aRect
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultDepthLimit() As Integer
		  
		  #if TargetCocoa
		    declare function defaultDepthLimit lib CocoaLib selector "defaultDepthLimit" (class_id as Ptr) as Integer
		    
		    return defaultDepthLimit(ClassRef)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Deminiaturize()
		  
		  #if TargetCocoa
		    declare sub deminiaturize lib CocoaLib selector "deminiaturize:" (obj_id as Ptr, sender as Ptr)
		    
		    deminiaturize self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableCursorRects()
		  
		  #if TargetCocoa
		    declare sub disableCursorRects lib CocoaLib selector "disableCursorRects" (obj_id as Ptr)
		    
		    disableCursorRects self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableFlushWindow()
		  
		  #if TargetCocoa
		    declare sub disableFlushWindow lib CocoaLib selector "disableFlushWindow" (obj_id as Ptr)
		    
		    disableFlushWindow self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableKeyEquivalentForDefaultButtonCell()
		  
		  #if TargetCocoa
		    declare sub disableKeyEquivalentForDefaultButtonCell lib CocoaLib selector "disableKeyEquivalentForDefaultButtonCell" (obj_id as Ptr)
		    
		    disableKeyEquivalentForDefaultButtonCell self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableScreenUpdatesUntilFlush()
		  
		  #if TargetCocoa
		    declare sub disableScreenUpdatesUntilFlush lib CocoaLib selector "disableScreenUpdatesUntilFlush" (obj_id as Ptr)
		    
		    disableScreenUpdatesUntilFlush self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableSnapshotRestoration()
		  
		  #if TargetCocoa
		    declare sub disableSnapshotRestoration lib CocoaLib selector "disableSnapshotRestoration" (obj_id as Ptr)
		    
		    disableSnapshotRestoration self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DiscardCachedImage()
		  
		  #if TargetCocoa
		    declare sub discardCachedImage lib CocoaLib selector "discardCachedImage" (obj_id as Ptr)
		    
		    discardCachedImage self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Display()
		  
		  #if TargetCocoa
		    declare sub display lib CocoaLib selector "display" (obj_id as Ptr)
		    
		    display self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayIfNeeded()
		  
		  #if TargetCocoa
		    declare sub displayIfNeeded lib CocoaLib selector "displayIfNeeded" (obj_id as Ptr)
		    
		    displayIfNeeded self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DragImage(image as NSImage, location as Cocoa.NSPoint, offset as Cocoa.NSSize, theEvent as NSEvent, pasteboard as NSPasteboard, sourceObj as NSObject, slideBack as Boolean)
		  
		  #if TargetCocoa
		    declare sub dragImage lib CocoaLib selector "dragImage:at:offset:event:pasteboard:source:slideBack:" _
		    (obj_id as Ptr, image as Ptr, location as Cocoa.NSPoint, offset as Cocoa.NSSize, theEvent as Ptr, pasteboard as Ptr, sourceObj as Ptr, slideBack as Boolean)
		    
		    dim imageRef as Ptr
		    if image <> nil then
		      imageRef = image
		    end if
		    
		    dim eventRef as Ptr
		    if theEvent <> nil then
		      eventRef = theEvent
		    end if
		    
		    dim pasteboardRef as Ptr
		    if pasteboard <> nil then
		      pasteboardRef = pasteboard
		    end if
		    
		    dim objRef as Ptr
		    if sourceObj <> nil then
		      objRef = sourceObj
		    end if
		    
		    dragImage self, imageRef, location, offset, eventRef, pasteboardRef, objRef, slideBack
		    
		  #else
		    #pragma unused image
		    #pragma unused location
		    #pragma unused offset
		    #pragma unused theEvent
		    #pragma unused pasteboard
		    #pragma unused sourceObj
		    #pragma unused slideBack
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Drawers() As NSDrawer()
		  
		  #if TargetCocoa
		    declare function drawers lib CocoaLib selector "drawers" (obj_id as Ptr) as Ptr
		    
		    dim retArray() as NSDrawer
		    
		    dim arrayRef as Ptr = drawers(self)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSDrawer(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableCursorRects()
		  
		  #if TargetCocoa
		    declare sub enableCursorRects lib CocoaLib selector "enableCursorRects" (obj_id as Ptr)
		    
		    enableCursorRects self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableFlushWindow()
		  
		  #if TargetCocoa
		    declare sub enableFlushWindow lib CocoaLib selector "enableFlushWindow" (obj_id as Ptr)
		    
		    enableFlushWindow self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableKeyEquivalentForDefaultButtonCell()
		  
		  #if TargetCocoa
		    declare sub enableKeyEquivalentForDefaultButtonCell lib CocoaLib selector "enableKeyEquivalentForDefaultButtonCell" (obj_id as Ptr)
		    
		    enableKeyEquivalentForDefaultButtonCell self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableSnapshotRestoration()
		  
		  #if TargetCocoa
		    declare sub enableSnapshotRestoration lib CocoaLib selector "enableSnapshotRestoration" (obj_id as Ptr)
		    
		    enableSnapshotRestoration self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FieldEditor(createWhenNeeded as Boolean, forObj as NSObject) As NSText
		  
		  #if TargetCocoa
		    declare function fieldEditor lib CocoaLib selector "fieldEditor:forObject:" (obj_id as Ptr, createWhenNeeded as Boolean, obj as Ptr) as Ptr
		    
		    dim textRef as Ptr = fieldEditor(self, createWhenNeeded, forObj)
		    
		    if textRef <> nil then
		      return new NSText(textRef)
		    end if
		    
		  #else
		    #pragma unused createWhenNeeded
		    #pragma unused forObj
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlushWindow()
		  
		  #if TargetCocoa
		    declare sub flushWindow lib CocoaLib selector "flushWindow" (obj_id as Ptr)
		    
		    flushWindow self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlushWindowIfNeeded()
		  
		  #if TargetCocoa
		    declare sub flushWindowIfNeeded lib CocoaLib selector "flushWindowIfNeeded" (obj_id as Ptr)
		    
		    flushWindowIfNeeded self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Frame() As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function frame lib CocoaLib selector "frame" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return frame(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Frame(displayViews as Boolean, animate as Boolean, assigns windowFrame as Cocoa.NSRect)
		  
		  #if TargetCocoa
		    declare sub setFrame lib CocoaLib selector "setFrame:display:animate:" _
		    (obj_id as Ptr, windowFrame as Cocoa.NSRect, displayViews as Boolean, animate as Boolean)
		    
		    setFrame self, windowFrame, displayViews, animate
		    
		  #else
		    #pragma unused displayViews
		    #pragma unused windowFrame
		    #pragma unused animate
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Frame(displayViews as Boolean, assigns windowFrame as Cocoa.NSRect)
		  
		  #if TargetCocoa
		    declare sub setFrame lib CocoaLib selector "setFrame:display:" (obj_id as Ptr, windowFrame as Cocoa.NSRect, displayViews as Boolean)
		    
		    setFrame self, windowFrame, displayViews
		    
		  #else
		    #pragma unused displayViews
		    #pragma unused windowFrame
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameOrigin(point as Cocoa.NSPoint)
		  
		  #if TargetCocoa
		    declare sub setFrameOrigin lib CocoaLib selector "setFrameOrigin:" (obj_id as Ptr, point as Cocoa.NSPoint)
		    
		    setFrameOrigin self, point
		    
		  #else
		    #pragma unused point
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameRect(windowContentRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function frameRectForContentRect lib CocoaLib selector "frameRectForContentRect" _
		    (obj_id as Ptr, windowContentRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return frameRectForContentRect(self, windowContentRect)
		    
		  #else
		    #pragma unused windowContentRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FrameRect(windowContentRect as Cocoa.NSRect, styleMask as UInt32) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function frameRectForContentRect lib CocoaLib selector "frameRectForContentRect:styleMask:" _
		    (class_id as Ptr, windowContentRect as Cocoa.NSRect, styleMask as UInt32) as Cocoa.NSRect
		    
		    return frameRectForContentRect(ClassRef, windowContentRect, styleMask)
		    
		  #else
		    #pragma unused windowContentRect
		    #pragma unused styleMask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameString() As String
		  
		  #if TargetCocoa
		    declare function stringWithSavedFrame lib CocoaLib selector "stringWithSavedFrame" (obj_id as Ptr) as CFStringRef
		    
		    return stringWithSavedFrame(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameTopLeftPoint(point as Cocoa.NSPoint)
		  
		  #if TargetCocoa
		    declare sub setFrameTopLeftPoint lib CocoaLib selector "setFrameTopLeftPoint:" (obj_id as Ptr, point as Cocoa.NSPoint)
		    
		    setFrameTopLeftPoint self, point
		    
		  #else
		    #pragma unused point
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateCursorRects(forView as NSView)
		  
		  #if TargetCocoa
		    declare sub invalidateCursorRectsForView lib CocoaLib selector "invalidateCursorRectsForView:" (obj_id as Ptr, aView as Ptr)
		    
		    dim viewRef as Ptr
		    if forView <> nil then
		      viewRef = forView
		    end if
		    
		    invalidateCursorRectsForView self, viewRef
		    
		  #else
		    #pragma unused forView
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateShadow()
		  
		  #if TargetCocoa
		    declare sub invalidateShadow lib CocoaLib selector "invalidateShadow" (obj_id as Ptr)
		    
		    invalidateShadow self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LayoutIfNeeded()
		  
		  #if TargetCocoa
		    declare sub layoutIfNeeded lib CocoaLib selector "layoutIfNeeded" (obj_id as Ptr)
		    
		    layoutIfNeeded self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeFirstResponder(responder as NSResponder) As Boolean
		  
		  #if TargetCocoa
		    declare function makeFirstResponder lib CocoaLib selector "makeFirstResponder:" (obj_id as Ptr, responder as Ptr) as Boolean
		    
		    dim responderRef as Ptr
		    if responder <> nil then
		      responderRef = responder
		    end if
		    
		    return makeFirstResponder(self, responderRef)
		    
		  #else
		    #pragma unused responder
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeHUDWindow()
		  //# Sets the window’s style mask to HUD.
		  
		  //@discussion Only works on floating (palette) windows. (frame = 3 & 7)
		  
		  Dim tmpStyleMask as UInt32 = Integer( NSWindow.NSWindowMask.HUD ) or Integer( NSWindow.NSWindowMask.Titled ) or Integer( NSWindow.NSWindowMask.Utility )
		  dim w as window = self
		  if w.Resizeable then tmpStyleMask = tmpStyleMask or Integer( NSWindow.NSWindowMask.Resizable )
		  #if RBVersion > 2013.02
		    if w.CloseButton   then tmpStyleMask = tmpStyleMask or Integer( NSWindow.NSWindowMask.Closable )
		  #else
		    if w.CloseBox   then tmpStyleMask = tmpStyleMask or Integer( NSWindow.NSWindowMask.Closable )
		  #endif
		  
		  StyleMask = tmpStyleMask
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeKeyAndOrderFront()
		  
		  #if TargetCocoa
		    declare sub makeKeyAndOrderFront lib CocoaLib selector "makeKeyAndOrderFront:" (obj_id as Ptr, sender as Ptr)
		    
		    makeKeyAndOrderFront self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeKeyWindow()
		  
		  #if TargetCocoa
		    declare sub makeKeyWindow lib CocoaLib selector "makeKeyWindow" (obj_id as Ptr)
		    
		    makeKeyWindow self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeMainWindow()
		  
		  #if TargetCocoa
		    declare sub makeMainWindow lib CocoaLib selector "makeMainWindow" (obj_id as Ptr)
		    
		    makeMainWindow self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MinFrameWidth(windowTitle as String, styleMask as UInt32) As Double
		  
		  #if TargetCocoa
		    declare function minFrameWidthWithTitle lib CocoaLib selector "minFrameWidthWithTitle:styleMask:" _
		    (class_id as Ptr, windowTitle as CFStringRef, styleMask as UInt32) as Double
		    
		    return minFrameWidthWithTitle(ClassRef, windowTitle, styleMask)
		    
		  #else
		    #pragma unused windowTitle
		    #pragma unused styleMask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Miniaturize()
		  
		  #if TargetCocoa
		    declare sub miniaturize lib CocoaLib selector "miniaturize:" (obj_id as Ptr, sender as Ptr)
		    
		    miniaturize self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDeviceBitsPerSample() As String
		  
		  static name as String = Cocoa.StringConstant ("NSDeviceBitsPerSample")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDeviceColorSpaceName() As String
		  
		  static name as String = Cocoa.StringConstant ("NSDeviceColorSpaceName")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDeviceIsPrinter() As String
		  
		  static name as String = Cocoa.StringConstant ("NSDeviceIsPrinter")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDeviceIsScreen() As String
		  
		  static name as String = Cocoa.StringConstant ("NSDeviceIsScreen")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDeviceResolution() As String
		  
		  static name as String = Cocoa.StringConstant ("NSDeviceResolution")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDeviceSize() As String
		  
		  static name as String = Cocoa.StringConstant ("NSDeviceSize")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Window
		  
		  for i as Integer = 0 to (WindowCount() - 1)
		    Dim w as NSWindow = Window(i)
		    if w = self then
		      return window(i)
		    end if
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(w As Window)
		  me.Constructor( w )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderBack()
		  
		  #if TargetCocoa
		    declare sub orderBack lib CocoaLib selector "orderBack:" (obj_id as Ptr, sender as Ptr)
		    
		    orderBack self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFront()
		  
		  #if TargetCocoa
		    declare sub orderFront lib CocoaLib selector "orderFront:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFront self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontRegardless()
		  
		  #if TargetCocoa
		    declare sub orderFrontRegardless lib CocoaLib selector "orderFrontRegardless" (obj_id as Ptr)
		    
		    orderFrontRegardless self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderOut()
		  
		  #if TargetCocoa
		    declare sub orderOut lib CocoaLib selector "orderOut:" (obj_id as Ptr, sender as Ptr)
		    
		    orderOut self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderWindow(orderingMode as NSWindowOrderingMode, relativeToWinNumber as Integer)
		  
		  #if TargetCocoa
		    declare sub orderWindow lib CocoaLib selector "orderWindow:relativeTo:" _
		    (obj_id as Ptr, orderingMode as NSWindowOrderingMode, relativeToWinNumber as Integer)
		    
		    orderWindow self, orderingMode, relativeToWinNumber
		    
		  #else
		    #pragma unused orderingMode
		    #pragma unused relativeToWinNumber
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformClose()
		  
		  #if TargetCocoa
		    declare sub performClose lib CocoaLib selector "performClose:" (obj_id as Ptr, sender as Ptr)
		    
		    performClose self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformMiniaturize()
		  
		  #if TargetCocoa
		    declare sub performMiniaturize lib CocoaLib selector "performMiniaturize:" (obj_id as Ptr, sender as Ptr)
		    
		    performMiniaturize self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformZoom()
		  
		  #if TargetCocoa
		    declare sub performZoom lib CocoaLib selector "performZoom:" (obj_id as Ptr, sender as Ptr)
		    
		    performZoom self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Print()
		  
		  #if TargetCocoa
		    declare sub print lib CocoaLib selector "print:" (obj_id as Ptr, sender as Ptr)
		    
		    print self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecalculateKeyViewLoop()
		  
		  #if TargetCocoa
		    declare sub recalculateKeyViewLoop lib CocoaLib selector "recalculateKeyViewLoop" (obj_id as Ptr)
		    
		    recalculateKeyViewLoop self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterForDraggedTypes(pasteboardTypes() as String)
		  
		  #if TargetCocoa
		    declare sub registerForDraggedTypes lib CocoaLib selector "registerForDraggedTypes:" (obj_id as Ptr, pasteboardTypes as Ptr)
		    
		    dim ns_array as new NSArray(pasteboardTypes)
		    
		    registerForDraggedTypes self, ns_array
		    
		  #else
		    #pragma unused pasteboardTypes
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveChildWindow(childWindow as NSWindow)
		  
		  #if TargetCocoa
		    declare sub removeChildWindow lib CocoaLib selector "removeChildWindow:" (obj_id as Ptr, childWindow as Ptr)
		    
		    dim childWindowRef as Ptr
		    if childWindow <> nil then
		      childWindowRef = childWindow
		    end if
		    
		    removeChildWindow self, childWindowRef
		    
		  #else
		    #pragma unused childWindow
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RemoveFrame(frameName as String)
		  
		  #if TargetCocoa
		    declare sub removeFrameUsingName lib CocoaLib selector "removeFrameUsingName:" (class_id as Ptr, frameName as CFStringRef)
		    
		    removeFrameUsingName ClassRef, frameName
		    
		  #else
		    #pragma unused frameName
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetCursorRects()
		  
		  #if TargetCocoa
		    declare sub resetCursorRects lib CocoaLib selector "resetCursorRects" (obj_id as Ptr)
		    
		    resetCursorRects self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResizeFlags() As Integer
		  
		  #if TargetCocoa
		    declare function resizeFlags lib CocoaLib selector "resizeFlags" (obj_id as Ptr) as Integer
		    
		    return resizeFlags(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreCachedImage()
		  
		  #if TargetCocoa
		    declare sub restoreCachedImage lib CocoaLib selector "restoreCachedImage" (obj_id as Ptr)
		    
		    restoreCachedImage self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunToolbarCustomizationPalette()
		  
		  #if TargetCocoa
		    declare sub runToolbarCustomizationPalette lib CocoaLib selector "runToolbarCustomizationPalette:" (obj_id as Ptr, sender as Ptr)
		    
		    runToolbarCustomizationPalette self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveFrame(frameName as String)
		  
		  #if TargetCocoa
		    declare sub saveFrameUsingName lib CocoaLib selector "saveFrameUsingName:" (obj_id as Ptr, frameName as CFStringRef)
		    
		    saveFrameUsingName self, frameName
		    
		  #else
		    #pragma unused frameName
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectFollowingKeyView(referenceView as NSView)
		  
		  #if TargetCocoa
		    declare sub selectKeyViewFollowingView lib CocoaLib selector "selectKeyViewFollowingView:" (obj_id as Ptr, aView as Ptr)
		    
		    dim viewRef as Ptr
		    if referenceView <> nil then
		      viewRef = referenceView
		    end if
		    
		    selectKeyViewFollowingView self, viewRef
		    
		  #else
		    #pragma unused referenceView
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectNextKeyView()
		  
		  #if TargetCocoa
		    declare sub selectNextKeyView lib CocoaLib selector "selectNextKeyView:" (obj_id as Ptr, sender as Ptr)
		    
		    selectNextKeyView self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectPrecedingKeyView(referenceView as NSView)
		  
		  #if TargetCocoa
		    declare sub selectKeyViewPrecedingView lib CocoaLib selector "selectKeyViewPrecedingView:" (obj_id as Ptr, aView as Ptr)
		    
		    dim viewRef as Ptr
		    if referenceView <> nil then
		      viewRef = referenceView
		    end if
		    
		    selectKeyViewPrecedingView self, viewRef
		    
		  #else
		    #pragma unused referenceView
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectPreviousKeyView()
		  
		  #if TargetCocoa
		    declare sub selectPreviousKeyView lib CocoaLib selector "selectPreviousKeyView:" (obj_id as Ptr, sender as Ptr)
		    
		    selectPreviousKeyView self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetFrame(frameName as String) As Boolean
		  
		  #if TargetCocoa
		    declare function setFrameUsingName lib CocoaLib selector "setFrameUsingName:" (obj_id as Ptr, frameName as CFStringRef) as Boolean
		    
		    return setFrameUsingName(self, frameName)
		    
		  #else
		    #pragma unused frameName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetFrame(frameName as String, force as Boolean) As Boolean
		  
		  #if TargetCocoa
		    declare function setFrameUsingName lib CocoaLib selector "setFrameUsingName:force:" _
		    (obj_id as Ptr, frameName as CFStringRef, force as Boolean) as Boolean
		    
		    return setFrameUsingName(self, frameName, force)
		    
		  #else
		    #pragma unused frameName
		    #pragma unused force
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTitleWithRepresentedFile(file as FolderItem)
		  
		  #if TargetCocoa
		    declare sub setTitleWithRepresentedFilename lib CocoaLib selector "setTitleWithRepresentedFilename" (obj_id as Ptr, filePath as CFStringRef)
		    
		    if file <> nil then
		      setTitleWithRepresentedFilename self, file.POSIXPath
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StandardWindowButton(windowButtonKind as NSWindowButton) As Ptr
		  
		  #if TargetCocoa
		    declare function standardWindowButton lib CocoaLib selector "standardWindowButton:" (obj_id as Ptr, windowButtonKind as NSWindowButton) as Ptr
		    
		    return standardWindowButton(self, windowButtonKind)
		    
		    // To be changed when the NSButton class will be implemented
		    'dim buttonRef as Ptr = standardWindowButton(self, windowButtonKind)
		    'if buttonRef <> nil then
		    'return new NSButton(buttonRef)
		    'end if
		    
		  #else
		    #pragma unused windowButtonKind
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StandardWindowButton(windowButtonKind as NSWindowButton, styleMask as UInt32) As Ptr
		  
		  #if TargetCocoa
		    declare function standardWindowButton lib CocoaLib selector "standardWindowButton:forStyleMask:" _
		    (obj_id as Ptr, windowButtonKind as NSWindowButton, styleMask as UInt32) as Ptr
		    
		    return standardWindowButton(ClassRef, windowButtonKind, styleMask)
		    
		    // To be changed when the NSButton class will be implemented
		    'dim buttonRef as Ptr = standardWindowButton(ClassRef, windowButtonKind, styleMask)
		    'if buttonRef <> nil then
		    'return new NSButton(buttonRef)
		    'end if
		    
		  #else
		    #pragma unused windowButtonKind
		    #pragma unused styleMask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleFullScreen()
		  
		  #if TargetCocoa
		    declare sub toggleFullScreen lib CocoaLib selector "toggleFullScreen:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleFullScreen self, self
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleToolbar()
		  //@header Toggle the toolbar's visibility.
		  
		  #if TargetCocoa
		    declare sub toggleToolbarShown lib CocoaLib selector "toggleToolbarShown:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleToolbarShown self, self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transparency(Assigns Value as Double)
		  //# Gives the window a transparent background color, resulting in the window becoming see-through while anything on the window remains visible.
		  
		  //@discussion _
		  // The titlebar and close/minimize/maximize buttons will remain visible as well, for the best effect use a borderless window. _
		  // This method is perfect for a custom or image shaped splash-window effect. _
		  //@discussion//
		  
		  #if TargetCocoa
		    // Create the NSColor to use for the window's background with an alpha value.
		    dim bgc as NSColor = self.BackgroundColor // Use the same color as the window background color
		    dim nsc as NSColor = bgc.ColorWithAlpha( Value )
		    
		    // Set the features on the window
		    self.AlphaValue = 1.0
		    self.IsOpaque = false
		    self.BackgroundColor = nsc
		    
		    // Force the window's shadow to update so we get the proper shadowing
		    self.InvalidateShadow
		  #else
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterDraggedTypes()
		  
		  #if TargetCocoa
		    declare sub unregisterDraggedTypes lib CocoaLib selector "unregisterDraggedTypes" (obj_id as Ptr)
		    
		    unregisterDraggedTypes self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  //@header Updates the window.
		  
		  #if TargetCocoa
		    declare sub update lib CocoaLib selector "update" (obj_id as Ptr)
		    
		    update self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateConstraintsIfNeeded()
		  
		  #if TargetCocoa
		    declare sub updateConstraintsIfNeeded lib CocoaLib selector "updateConstraintsIfNeeded" (obj_id as Ptr)
		    
		    updateConstraintsIfNeeded self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseOptimizedDrawing(value as Boolean)
		  
		  #if TargetCocoa
		    declare sub useOptimizedDrawing lib CocoaLib selector "useOptimizedDrawing:" (obj_id as Ptr, flag as Boolean)
		    
		    useOptimizedDrawing self, value
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VisualizeConstraints(constraints as NSArray)
		  
		  #if TargetCocoa
		    declare sub visualizeConstraints lib CocoaLib selector "visualizeConstraints:" (obj_id as Ptr, constraints as Ptr)
		    
		    dim constraintsRef as Ptr
		    if constraints <> nil then
		      constraintsRef = constraints
		    end if
		    
		    visualizeConstraints self, constraintsRef
		    
		  #else
		    #pragma unused constraints
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WindowNumberAtPoint(point as NSPoint, startingBelowWinNumber as Integer) As Integer
		  
		  #if TargetCocoa
		    declare function windowNumberAtPoint lib CocoaLib selector "windowNumberAtPoint:belowWindowWithWindowNumber:" _
		    (class_id as Ptr, point as NSPoint, windowNumber as Integer) as Integer
		    
		    return windowNumberAtPoint(ClassRef, point, startingBelowWinNumber)
		    
		  #else
		    #pragma unused point
		    #pragma unused startingBelowWinNumber
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WindowNumbers(options as UInt32) As Integer()
		  
		  #if TargetCocoa
		    declare function windowNumbersWithOptions lib CocoaLib selector "windowNumbersWithOptions:" (class_id as Ptr, options as UInteger) as Ptr
		    
		    dim retArray() as Integer
		    
		    dim arrayRef as Ptr = windowNumbersWithOptions(ClassRef, options)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        dim temp as new NSNumber(Ptr(m.UInt64Value(i*SizeOfPointer)))
		        retArray.append temp.IntegerValue
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused options
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Zoom()
		  
		  #if TargetCocoa
		    declare sub zoom lib CocoaLib selector "zoom:" (obj_id as Ptr, sender as Ptr)
		    
		    zoom self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function acceptsMouseMovedEvents lib CocoaLib selector "acceptsMouseMovedEvents" (obj_id as Ptr) as Boolean
			    
			    return acceptsMouseMovedEvents(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setAcceptsMouseMovedEvents lib CocoaLib selector "setAcceptsMouseMovedEvents:" (obj_id as Ptr, flag as Boolean)
			    
			    setAcceptsMouseMovedEvents self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AcceptsMouseMovedEvents As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function allowsConcurrentViewDrawing lib CocoaLib selector "allowsConcurrentViewDrawing" (obj_id as Ptr) as Boolean
			    
			    return allowsConcurrentViewDrawing(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setAllowsConcurrentViewDrawing lib CocoaLib selector "setAllowsConcurrentViewDrawing:" (obj_id as Ptr, flag as Boolean)
			    
			    setAllowsConcurrentViewDrawing self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AllowsConcurrentViewDrawing As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function allowsToolTipsWhenApplicationIsInactive lib CocoaLib selector "allowsToolTipsWhenApplicationIsInactive" _
			    (obj_id as Ptr) as Boolean
			    
			    return allowsToolTipsWhenApplicationIsInactive(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setAllowsToolTipsWhenApplicationIsInactive lib CocoaLib selector "setAllowsToolTipsWhenApplicationIsInactive:" _
			    (obj_id as Ptr, flag as Boolean)
			    
			    setAllowsToolTipsWhenApplicationIsInactive self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AllowsToolTipsWhenApplicationIsInactive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function alphaValue lib CocoaLib selector "alphaValue" (obj_id as Ptr) as Double
			    
			    return alphaValue(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setAlphaValue lib CocoaLib selector "setAlphaValue:" (obj_id as Ptr, windowAlpha as Double)
			    
			    setAlphaValue self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AlphaValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    //animationBehavior was added in MacOS 10.7.
			    
			    static msgAccepted as Boolean = self.respondsToSelector("animationBehavior")
			    if msgAccepted then
			      declare function animationBehavior lib CocoaLib selector "animationBehavior" (obj_id as Ptr) as NSWindowAnimationBehavior
			      return animationBehavior(self)
			    else
			      return NSWindowAnimationBehavior.NSWindowAnimationBehaviorDefault
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    //setAnimationBehavior: was added in Mac OS 10.7.
			    
			    static msgAccepted as Boolean = self.respondsToSelector("setAnimationBehavior:")
			    if msgAccepted then
			      declare sub setAnimationBehavior lib CocoaLib selector "setAnimationBehavior:" (obj_id as Ptr, behavior as NSWindowAnimationBehavior)
			      setAnimationBehavior(self, value)
			    else
			      //no-op
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AnimationBehavior As NSWindowAnimationBehavior
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function areCursorRectsEnabled lib CocoaLib selector "areCursorRectsEnabled" (obj_id as Ptr) as Boolean
			    
			    return areCursorRectsEnabled(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		AreCursorRectsEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function aspectRatio lib CocoaLib selector "aspectRatio" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return aspectRatio(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setAspectRatio lib CocoaLib selector "setAspectRatio:" (obj_id as Ptr, ratio as Cocoa.NSSize)
			    
			    setAspectRatio self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AspectRatio As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function attachedSheet lib CocoaLib selector "attachedSheet" (obj_id as Ptr) as Ptr
			    
			    dim sheetRef as Ptr = attachedSheet(self)
			    
			    if sheetRef <> nil then
			      return new NSWindow(sheetRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		AttachedSheet As NSWindow
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isAutodisplay lib CocoaLib selector "isAutodisplay" (obj_id as Ptr) as Boolean
			    
			    return isAutodisplay(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setAutodisplay lib CocoaLib selector "setAutodisplay:" (obj_id as Ptr, flag as Boolean)
			    
			    setAutodisplay self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Autodisplay As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function autorecalculatesKeyViewLoop lib CocoaLib selector "autorecalculatesKeyViewLoop" (obj_id as Ptr) as Boolean
			    
			    return autorecalculatesKeyViewLoop(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setAutorecalculatesKeyViewLoop lib CocoaLib selector "setAutorecalculatesKeyViewLoop:" (obj_id as Ptr, flag as Boolean)
			    
			    setAutorecalculatesKeyViewLoop self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AutorecalculatesKeyViewLoop As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function backgroundColor lib CocoaLib selector "backgroundColor" (obj_id as Ptr) as Ptr
			    
			    dim colorRef as Ptr = backgroundColor(self)
			    
			    if colorRef <> nil then
			      return new NSColor(colorRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" (obj_id as Ptr, aColor as Ptr)
			    
			    dim colorRef as Ptr
			    if value <> nil then
			      colorRef = value
			    end if
			    
			    setBackgroundColor self, colorRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		BackgroundColor As NSColor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function backingLocation lib CocoaLib selector "backingLocation" (obj_id as Ptr) as NSWindowBackingLocation
			    
			    return backingLocation(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		BackingLocation As NSWindowBackingLocation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as double = 1.
			  
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "backingScaleFactor" ) then
			      declare function instanceBackingScaleFactor lib CarbonLib selector "backingScaleFactor" ( obj_id As Ptr ) as Double
			      r = instanceBackingScaleFactor( self )
			    end if
			    
			  #endif
			  
			  return r
			End Get
		#tag EndGetter
		BackingScaleFactor As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function backingType lib CocoaLib selector "backingType" (obj_id as Ptr) as NSBackingStoreType
			    
			    return backingType(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setBackingType lib CocoaLib selector "setBackingType:" (obj_id as Ptr, type as NSBackingStoreType)
			    
			    setBackingType self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		BackingType As NSBackingStoreType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function canBecomeKeyWindow lib CocoaLib selector "canBecomeKeyWindow" (obj_id as Ptr) as Boolean
			    
			    return canBecomeKeyWindow(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		CanBecomeKeyWindow As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function canBecomeMainWindow lib CocoaLib selector "canBecomeMainWindow" (obj_id as Ptr) as Boolean
			    
			    return canBecomeMainWindow(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		CanBecomeMainWindow As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function canBecomeVisibleWithoutLogin lib CocoaLib selector "canBecomeVisibleWithoutLogin" (obj_id as Ptr) as Boolean
			    
			    return canBecomeVisibleWithoutLogin(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setCanBecomeVisibleWithoutLogin lib CocoaLib selector "setCanBecomeVisibleWithoutLogin:" (obj_id as Ptr, flag as Boolean)
			    
			    setCanBecomeVisibleWithoutLogin self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		CanBecomeVisibleWithoutLogin As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function canHide lib CocoaLib selector "canHide" (obj_id as Ptr) as Boolean
			    
			    return canHide(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setCanHide lib CocoaLib selector "setCanHide:" (obj_id as Ptr, flag as Boolean)
			    
			    setCanHide self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		CanHide As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The window appears in all spaces.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.CanJoinAllSpaces) ) <> 0
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    
			    if Value then
			      CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.CanJoinAllSpaces)
			    else
			      CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.CanJoinAllSpaces)
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		CanJoinAllSpaces As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function canStoreColor lib CocoaLib selector "canStoreColor" (obj_id as Ptr) as Boolean
			    
			    return canStoreColor(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		CanStoreColor As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function collectionBehavior lib CocoaLib selector "collectionBehavior" (obj_id as Ptr) as Integer
			    
			    return collectionBehavior(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setCollectionBehavior lib CocoaLib selector "setCollectionBehavior:" (obj_id as Ptr, behavior as Integer)
			    
			    setCollectionBehavior self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		CollectionBehavior As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function colorSpace lib CocoaLib selector "colorSpace" (obj_id as Ptr) as Ptr
			    
			    dim colorSpaceRef as Ptr = colorSpace(self)
			    
			    if colorSpaceRef <> nil then
			      return new NSColorspace(colorSpaceRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setColorSpace lib CocoaLib selector "setColorSpace:" (obj_id as Ptr, colorSpace as Ptr)
			    
			    dim colorSpaceRef as Ptr
			    if value <> nil then
			      colorSpaceRef = value
			    end if
			    
			    setColorSpace self, colorSpaceRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ColorSpace As NSColorspace
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function contentAspectRatio lib CocoaLib selector "contentAspectRatio" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return contentAspectRatio(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setContentAspectRatio lib CocoaLib selector "setContentAspectRatio:" (obj_id as Ptr, ratio as Cocoa.NSSize)
			    
			    setContentAspectRatio self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ContentAspectRatio As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function contentMaxSize lib CocoaLib selector "contentMaxSize" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return contentMaxSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setContentMaxSize lib CocoaLib selector "setContentMaxSize:" (obj_id as Ptr, maxContentSize as Cocoa.NSSize)
			    
			    setContentMaxSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ContentMaxSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function contentMinSize lib CocoaLib selector "contentMinSize" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return contentMinSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setContentMinSize lib CocoaLib selector "setContentMinSize:" (obj_id as Ptr, minContentSize as Cocoa.NSSize)
			    
			    setContentMinSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ContentMinSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function contentResizeIncrements lib CocoaLib selector "contentResizeIncrements" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return contentResizeIncrements(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setContentResizeIncrements lib CocoaLib selector "setContentResizeIncrements:" (obj_id as Ptr, increments as Cocoa.NSSize)
			    
			    setContentResizeIncrements self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ContentResizeIncrements As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setContentSize lib CocoaLib selector "setContentSize:" (obj_id as Ptr, contentSize as Cocoa.NSSize)
			    
			    setContentSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ContentSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function contentView lib CocoaLib selector "contentView" (obj_id as Ptr) as Ptr
			    
			    dim viewRef as Ptr = contentView(self)
			    
			    if viewRef <> nil then
			      return new NSView(viewRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setContentView lib CocoaLib selector "setContentView:" (obj_id as Ptr, aView as Ptr)
			    
			    dim viewRef as Ptr
			    if value <> nil then
			      viewRef = value
			    end if
			    
			    setContentView self, viewRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ContentView As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function currentEvent lib CocoaLib selector "currentEvent" (obj_id as Ptr) as Ptr
			    
			    dim eventRef as Ptr = currentEvent(self)
			    
			    if eventRef <> nil then
			      return new NSEvent(eventRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		CurrentEvent As NSEvent
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function defaultButtonCell lib CocoaLib selector "defaultButtonCell" (obj_id as Ptr) as Ptr
			    
			    dim cellRef as Ptr = defaultButtonCell(self)
			    
			    if cellRef <> nil then
			      return new NSButtonCell(cellRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setDefaultButtonCell lib CocoaLib selector "setDefaultButtonCell:" (obj_id as Ptr, aCell as Ptr)
			    
			    dim cellRef as Ptr
			    if value <> nil then
			      cellRef = value
			    end if
			    
			    setDefaultButtonCell self, cellRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		DefaultButtonCell As NSButtonCell
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function depthLimit lib CocoaLib selector "depthLimit" (obj_id as Ptr) as Integer
			    
			    return depthLimit(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setDepthLimit lib CocoaLib selector "setDepthLimit:" (obj_id as Ptr, depth as Integer)
			    
			    setDepthLimit self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		DepthLimit As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function deviceDescription lib CocoaLib selector "deviceDescription" (obj_id as Ptr) as Ptr
			    
			    dim dictRef as Ptr = deviceDescription(self)
			    
			    if dictRef <> nil then
			      return new NSDictionary(dictRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		DeviceDescription As NSDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function displaysWhenScreenProfileChanges lib CocoaLib selector "displaysWhenScreenProfileChanges" (obj_id as Ptr) as Boolean
			    
			    return displaysWhenScreenProfileChanges(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setDisplaysWhenScreenProfileChanges lib CocoaLib selector "setDisplaysWhenScreenProfileChanges:" (obj_id as Ptr, flag as Boolean)
			    
			    setDisplaysWhenScreenProfileChanges self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		DisplaysWhenScreenProfileChanges As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function dockTile lib CocoaLib selector "dockTile" (obj_id as Ptr) as Ptr
			    
			    dim dockTileRef as Ptr = dockTile(self)
			    
			    if dockTileRef <> nil then
			      return new NSDockTile(dockTileRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		DockTile As NSDockTile
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function IsDocumentEdited lib CarbonLib selector "isDocumentEdited" ( id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.0.
			    
			    return IsDocumentEdited( self )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare sub SetDocumentEdited lib CarbonLib selector "setDocumentEdited:" ( id As Ptr, value As Boolean )
			    // Introduced in MacOS X 10.0.
			    
			    SetDocumentEdited( self, value )
			    
			  #endif
			  
			End Set
		#tag EndSetter
		DocumentEdited As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function hasDynamicDepthLimit lib CocoaLib selector "hasDynamicDepthLimit" (obj_id as Ptr) as Boolean
			    
			    return hasDynamicDepthLimit(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setDynamicDepthLimit lib CocoaLib selector "setDynamicDepthLimit:" (obj_id as Ptr, flag as Boolean)
			    
			    setDynamicDepthLimit self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		DynamicDepthLimit As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function firstResponder lib CocoaLib selector "firstResponder" (obj_id as Ptr) as Ptr
			    
			    dim responderRef as Ptr = firstResponder(self)
			    
			    if responderRef <> nil then
			      return new NSResponder(responderRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		FirstResponder As NSResponder
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function frameAutosaveName lib CocoaLib selector "frameAutosaveName" (obj_id as Ptr) as CFStringRef
			    
			    return frameAutosaveName(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setFrameAutosaveName lib CocoaLib selector "setFrameAutosaveName:" (obj_id as Ptr, name as CFStringRef)
			    
			    setFrameAutosaveName self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		FrameAutosaveName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function stringWithSavedFrame lib CocoaLib selector "stringWithSavedFrame" (obj_id as Ptr) as CFStringRef
			    
			    return stringWithSavedFrame(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setFrameFromString lib CocoaLib selector "setFrameFromString:" (obj_id as Ptr, stringFrame as CFStringRef)
			    
			    setFrameFromString self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		FrameString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			
			A window with this collection behavior has a fullscreen button in the upper right of its titlebar.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsLion then // the CollectionBehavior selector is available since 10.5, but the behavior FullScreenPrimary is first introduced in 10.7
			      return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.FullScreenPrimary) ) <> 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if IsLion then // the CollectionBehavior selector is available since 10.5, but the behavior FullScreenPrimary is first introduced in 10.7
			      
			      if Value then
			        CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.FullScreenPrimary)
			      else
			        CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.FullScreenPrimary)
			      end if
			      
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		FullscreenAllowed As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Windows with this collection behavior can be shown on the same space as the fullscreen window.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsLion then // the CollectionBehavior selector is available since 10.5, but the behavior FullScreenPrimary is first introduced in 10.7
			      return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.FullScreenAuxiliary) ) <> 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if IsLion then // the CollectionBehavior selector is available since 10.5, but the behavior FullScreenPrimary is first introduced in 10.7
			      
			      if Value then
			        CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.FullScreenAuxiliary)
			      else
			        CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.FullScreenAuxiliary)
			      end if
			      
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		FullscreenAllowedAuxiliary As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Blurry Translucent toolbars
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsYosemite then
			      return ( StyleMask and Integer( NSWindow.NSWindowMask.FullSizeContentView ) ) <> 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if IsYosemite then
			      dim WindowStyleMask as UInt32
			      
			      if value then
			        WindowStyleMask = StyleMask or Integer( NSWindow.NSWindowMask.FullSizeContentView )
			      else
			        WindowStyleMask = StyleMask and NOT Integer( NSWindow.NSWindowMask.FullSizeContentView )
			      end if
			      
			      StyleMask = WindowStyleMask
			    else
			      #pragma Unused value
			    end if
			  #endif
			End Set
		#tag EndSetter
		FullSizeContentView As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function graphicsContext lib CocoaLib selector "graphicsContext" (obj_id as Ptr) as Ptr
			    
			    dim contextRef as Ptr = graphicsContext(self)
			    
			    if contextRef <> nil then
			      return new NSGraphicsContext(contextRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		GraphicsContext As NSGraphicsContext
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function gState lib CocoaLib selector "gState" (obj_id as Ptr) as Integer
			    
			    return gState(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		GState As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function hasShadow lib CocoaLib selector "hasShadow" (obj_id as Ptr) as Boolean
			    
			    return hasShadow(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setHasShadow lib CocoaLib selector "setHasShadow:" (obj_id as Ptr, flag as Boolean)
			    
			    setHasShadow self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		HasShadow As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function hidesOnDeactivate lib CocoaLib selector "hidesOnDeactivate" (obj_id as Ptr) as Boolean
			    
			    return hidesOnDeactivate(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setHidesOnDeactivate lib CocoaLib selector "setHidesOnDeactivate:" (obj_id as Ptr, flag as Boolean)
			    
			    setHidesOnDeactivate self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		HidesOnDeactivate As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			
			The window is not part of the window cycle for use with the Cycle Through Windows Window menu item.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Managed is first introduced in 10.6
			      return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.IgnoresCycle) ) <> 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Stationary is first introduced in 10.6
			      
			      if Value then
			        CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.IgnoresCycle)
			      else
			        CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.IgnoresCycle)
			      end if
			      
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		IgnoresCycle As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function ignoresMouseEvents lib CocoaLib selector "ignoresMouseEvents" (obj_id as Ptr) as Boolean
			    
			    return ignoresMouseEvents(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setIgnoresMouseEvents lib CocoaLib selector "setIgnoresMouseEvents:" (obj_id as Ptr, flag as Boolean)
			    
			    setIgnoresMouseEvents self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		IgnoresMouseEvents As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function initialFirstResponder lib CocoaLib selector "initialFirstResponder" (obj_id as Ptr) as Ptr
			    
			    dim viewRef as Ptr = initialFirstResponder(self)
			    
			    if viewRef <> nil then
			      return new NSView(viewRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setInitialFirstResponder lib CocoaLib selector "setInitialFirstResponder:" (obj_id as Ptr, aView as Ptr)
			    
			    dim viewRef as Ptr
			    if value <> nil then
			      viewRef = value
			    end if
			    
			    setInitialFirstResponder self, viewRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		InitialFirstResponder As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function inLiveResize lib CocoaLib selector "inLiveResize" (obj_id as Ptr) as Boolean
			    
			    return inLiveResize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		InLiveResize As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isDocumentEdited lib CocoaLib selector "isDocumentEdited" (obj_id as Ptr) as Boolean
			    
			    return isDocumentEdited(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setDocumentEdited lib CocoaLib selector "setDocumentEdited:" (obj_id as Ptr, flag as Boolean)
			    
			    setDocumentEdited self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		IsDocumentEdited As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isExcludedFromWindowsMenu lib CocoaLib selector "isExcludedFromWindowsMenu" (obj_id as Ptr) as Boolean
			    
			    return isExcludedFromWindowsMenu(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setExcludedFromWindowsMenu lib CocoaLib selector "setExcludedFromWindowsMenu:" (obj_id as Ptr, flag as Boolean)
			    
			    setExcludedFromWindowsMenu self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		IsExcludedFromWindowsMenu As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isFlushWindowDisabled lib CocoaLib selector "isFlushWindowDisabled" (obj_id as Ptr) as Boolean
			    
			    return isFlushWindowDisabled(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsFlushWindowDisabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Indicates whether a window is currently in fullscreen mode
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsLion then // the styleMask selector is available since 10.0, but the NSFullScreenWindowMask bit is first introduced in 10.7
			      return ( self.StyleMask and Integer( NSWindow.NSWindowMask.FullScreen ) ) = Integer( NSWindow.NSWindowMask.FullScreen )
			    End If
			  #endif
			End Get
		#tag EndGetter
		IsFullscreen As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isKeyWindow lib CocoaLib selector "isKeyWindow" (obj_id as Ptr) as Boolean
			    
			    return isKeyWindow(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsKeyWindow As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isMainWindow lib CocoaLib selector "isMainWindow" (obj_id as Ptr) as Boolean
			    
			    return isMainWindow(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsMainWindow As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isMiniaturized lib CocoaLib selector "isMiniaturized" (obj_id as Ptr) as Boolean
			    
			    return isMiniaturized(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsMiniaturized As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isMovable lib CocoaLib selector "isMovable" (obj_id as Ptr) as Boolean
			    
			    return isMovable(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setMovable lib CocoaLib selector "setMovable:" (obj_id as Ptr, flag as Boolean)
			    
			    setMovable self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		IsMovable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isOnActiveSpace lib CocoaLib selector "isOnActiveSpace" (obj_id as Ptr) as Boolean
			    
			    return isOnActiveSpace(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsOnActiveSpace As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isOpaque lib CocoaLib selector "isOpaque" (obj_id as Ptr) as Boolean
			    
			    return isOpaque(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setOpaque lib CocoaLib selector "setOpaque:" (obj_id as Ptr, flag as Boolean)
			    
			    setOpaque self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		IsOpaque As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isReleasedWhenClosed lib CocoaLib selector "isReleasedWhenClosed" (obj_id as Ptr) as Boolean
			    
			    return isReleasedWhenClosed(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setReleasedWhenClosed lib CocoaLib selector "setReleasedWhenClosed:" (obj_id as Ptr, flag as Boolean)
			    
			    setReleasedWhenClosed self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		IsReleasedWhenClosed As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isRestorable lib CocoaLib selector "isRestorable" (obj_id as Ptr) as Boolean
			    
			    return isRestorable(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setRestorable lib CocoaLib selector "setRestorable:" (obj_id as Ptr, flag as Boolean)
			    
			    setRestorable self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		IsRestorable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isSheet lib CocoaLib selector "isSheet" (obj_id as Ptr) as Boolean
			    
			    return isSheet(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsSheet As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isVisible lib CocoaLib selector "isVisible" (obj_id as Ptr) as Boolean
			    
			    return isVisible(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isZoomed lib CocoaLib selector "isZoomed" (obj_id as Ptr) as Boolean
			    
			    return isZoomed(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsZoomed As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function keyViewSelectionDirection lib CocoaLib selector "keyViewSelectionDirection" (obj_id as Ptr) as NSSelectionDirection
			    
			    return keyViewSelectionDirection(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		KeyViewSelectionDirection As NSSelectionDirection
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The window participates in Spaces and Exposé. This is the default behavior if windowLevel is equal to NSNormalWindowLevel.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Managed is first introduced in 10.6
			      return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.Managed) ) <> 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Managed is first introduced in 10.6
			      
			      if Value then
			        CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.Managed)
			      else
			        CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.Managed)
			      end if
			      
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		Managed As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function maxSize lib CocoaLib selector "maxSize" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return maxSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setMaxSize lib CocoaLib selector "setMaxSize:" (obj_id as Ptr, maxFrameSize as Cocoa.NSSize)
			    
			    setMaxSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MaxSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function miniwindowImage lib CocoaLib selector "miniwindowImage" (obj_id as Ptr) as Ptr
			    
			    dim imageRef as Ptr = miniwindowImage(self)
			    
			    if imageRef <> nil then
			      return new NSImage(imageRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setMiniwindowImage lib CocoaLib selector "setMiniwindowImage:" (obj_id as Ptr, image as Ptr)
			    
			    dim imageRef as Ptr
			    if value <> nil then
			      imageRef = value
			    end if
			    
			    setMiniwindowImage self, imageRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MiniwindowImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function miniwindowTitle lib CocoaLib selector "miniwindowTitle" (obj_id as Ptr) as CFStringRef
			    
			    return miniwindowTitle(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setMiniwindowTitle lib CocoaLib selector "setMiniwindowTitle:" (obj_id as Ptr, name as CFStringRef)
			    
			    setMiniwindowTitle self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MiniwindowTitle As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function minSize lib CocoaLib selector "minSize" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return minSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setMinSize lib CocoaLib selector "setMinSize:" (obj_id as Ptr, minFrameSize as Cocoa.NSSize)
			    
			    setMinSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MinSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function mouseLocationOutsideOfEventStream lib CocoaLib selector "mouseLocationOutsideOfEventStream" (obj_id as Ptr) as Cocoa.NSPoint
			    
			    return mouseLocationOutsideOfEventStream(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		MouseLocation As Cocoa.NSPoint
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function IsMovableByWindowBackground lib CocoaLib selector "isMovableByWindowBackground" ( id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.2.
			    
			    return IsMovableByWindowBackground( self )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub SetMovableByWindowBackground lib CocoaLib selector "setMovableByWindowBackground:" ( id As Ptr, value As Boolean )
			    // Introduced in MacOS X 10.2.
			    
			    SetMovableByWindowBackground( self, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		MovableByBackground As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Making the window active does not cause a space switch; the window switches to the active space.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.MoveToActiveSpace) ) <> 0
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if Value then
			      CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.MoveToActiveSpace)
			    else
			      CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.MoveToActiveSpace)
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		MoveToActiveSpace As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isOneShot lib CocoaLib selector "isOneShot" (obj_id as Ptr) as Boolean
			    
			    return isOneShot(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setOneShot lib CocoaLib selector "setOneShot:" (obj_id as Ptr, flag as Boolean)
			    
			    setOneShot self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		OneShot As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function parentWindow lib CocoaLib selector "parentWindow" (obj_id as Ptr) as Ptr
			    
			    dim windowRef as Ptr = parentWindow(self)
			    
			    if windowRef <> nil then
			      return new NSWindow(windowRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setParentWindow lib CocoaLib selector "setParentWindow:" (obj_id as Ptr, aWindow as Ptr)
			    
			    dim windowRef as Ptr
			    if value <> nil then
			      windowRef = value
			    end if
			    
			    setParentWindow self, windowRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ParentWindow As NSWindow
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			
			The window participates in the window cycle for use with the Cycle Through Windows Window menu item.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Managed is first introduced in 10.6
			      return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.ParticipatesInCycle) ) <> 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Stationary is first introduced in 10.6
			      
			      if Value then
			        CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.ParticipatesInCycle)
			      else
			        CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.ParticipatesInCycle)
			      end if
			      
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		ParticipatesInCycle As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function preferredBackingLocation lib CocoaLib selector "preferredBackingLocation" (obj_id as Ptr) as NSWindowBackingLocation
			    
			    return preferredBackingLocation(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setPreferredBackingLocation lib CocoaLib selector "setPreferredBackingLocation:" (obj_id as Ptr, type as NSWindowBackingLocation)
			    
			    setPreferredBackingLocation self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PreferredBackingLocation As NSWindowBackingLocation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function preservesContentDuringLiveResize lib CocoaLib selector "preservesContentDuringLiveResize" (obj_id as Ptr) as Boolean
			    
			    return preservesContentDuringLiveResize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setPreservesContentDuringLiveResize lib CocoaLib selector "setPreservesContentDuringLiveResize:" (obj_id as Ptr, flag as Boolean)
			    
			    setPreservesContentDuringLiveResize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PreservesContentDuringLiveResize As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function preventsApplicationTerminationWhenModal lib CocoaLib selector "preventsApplicationTerminationWhenModal" (obj_id as Ptr) as Boolean
			    
			    return preventsApplicationTerminationWhenModal(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setPreventsApplicationTerminationWhenModal lib CocoaLib selector "setPreventsApplicationTerminationWhenModal:" (obj_id as Ptr, flag as Boolean)
			    
			    setPreventsApplicationTerminationWhenModal self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PreventsAppTerminationWhenModal As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function representedFilename lib CocoaLib selector "representedFilename" (obj_id as Ptr) as CFStringRef
			    
			    dim Path as string = representedFilename(self)
			    if Path <> "" then
			      return new FolderItem(Path, FolderItem.PathTypeShell)
			    else
			      return Nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setRepresentedFilename lib CocoaLib selector "setRepresentedFilename:" (obj_id as Ptr, filePath as CFStringRef)
			    
			    if value <> nil then
			      setRepresentedFilename self, value.POSIXPath
			    else
			      setRepresentedFilename self, ""
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		RepresentedFile As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim name as String
			  
			  #if TargetCocoa
			    
			    declare function instanceRepresentedFilename lib CarbonLib selector "representedFilename" ( id As Ptr ) As CFStringRef
			    // Introduced in MacOS X 10.0.
			    
			    name = instanceRepresentedFilename( self )
			    
			  #endif
			  
			  return name
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub instanceSetTitleWithRepresentedFilename lib CocoaLib selector "setTitleWithRepresentedFilename:" ( id as Ptr, name as CFStringRef )
			    // Introduced in MacOS X 10.0.
			    
			    instanceSetTitleWithRepresentedFilename( self, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		RepresentedFilename As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function representedURL lib CocoaLib selector "representedURL" (obj_id as Ptr) as Ptr
			    
			    dim urlRef as Ptr = representedURL(self)
			    if urlRef <> nil then
			      return new NSURL(urlRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setRepresentedURL lib CocoaLib selector "setRepresentedURL:" (obj_id as Ptr, aURL as Ptr)
			    
			    if value <> nil then
			      setRepresentedURL self, value
			    else
			      setRepresentedURL self, nil
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		RepresentedURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function resizeIncrements lib CocoaLib selector "resizeIncrements" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return resizeIncrements(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setResizeIncrements lib CocoaLib selector "setResizeIncrements:" (obj_id as Ptr, increments as Cocoa.NSSize)
			    
			    setResizeIncrements self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ResizeIncrements As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function restorationClass lib CocoaLib selector "restorationClass" (obj_id as Ptr) as Ptr
			    
			    return restorationClass(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setRestorationClass lib CocoaLib selector "setRestorationClass:" (obj_id as Ptr, aClass as Ptr)
			    
			    setRestorationClass self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		RestorationClass As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function sharingType lib CocoaLib selector "sharingType" (obj_id as Ptr) as NSWindowSharingType
			    
			    return sharingType(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setSharingType lib CocoaLib selector "setSharingType:" (obj_id as Ptr, type as NSWindowSharingType)
			    
			    setSharingType self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		SharingType As NSWindowSharingType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function showsResizeIndicator lib CocoaLib selector "showsResizeIndicator" (obj_id as Ptr) as Boolean
			    
			    return showsResizeIndicator(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setShowsResizeIndicator lib CocoaLib selector "setShowsResizeIndicator:" (obj_id as Ptr, flag as Boolean)
			    
			    setShowsResizeIndicator self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ShowsResizeIndicator As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function showsToolbarButton lib CocoaLib selector "showsToolbarButton" (obj_id as Ptr) as Boolean
			    
			    return showsToolbarButton(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setShowsToolbarButton lib CocoaLib selector "setShowsToolbarButton:" (obj_id as Ptr, flag as Boolean)
			    
			    setShowsToolbarButton self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ShowsToolbarButton As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			
			The window is unaffected by Exposé; it stays visible and stationary, like the desktop window.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Managed is first introduced in 10.6
			      return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.Stationary) ) <> 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Stationary is first introduced in 10.6
			      
			      if Value then
			        CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.Stationary)
			      else
			        CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.Stationary)
			      end if
			      
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		Stationary As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function styleMask lib CocoaLib selector "styleMask" (obj_id as Ptr) as UInt32
			    
			    return styleMask(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setStyleMask lib CocoaLib selector "setStyleMask:" (obj_id as Ptr, styleMask as UInt32)
			    
			    setStyleMask self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		StyleMask As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function title lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			    
			    return title(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, aString as CFStringRef)
			    
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
			  
			  #if TargetCocoa
			    if IsYosemite then
			      declare function titlebarAppearsTransparent lib CocoaLib selector "titlebarAppearsTransparent" (obj_id as Ptr) as Boolean
			      
			      return titlebarAppearsTransparent(self)
			    else
			      return false
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if IsYosemite then
			      declare sub setTitlebarAppearsTransparent lib CocoaLib selector "setTitlebarAppearsTransparent:" (obj_id as Ptr, value as Boolean)
			      
			      setTitlebarAppearsTransparent self, value
			    end if
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		TitlebarAppearsTransparent As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			
			The window floats in Spaces and is hidden by Exposé. This is the default behavior if windowLevel is not equal to NSNormalWindowLevel.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Managed is first introduced in 10.6
			      return ( CollectionBehavior and Integer(NSWindowCollectionBehavior.Transient) ) <> 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa then
			    if IsSnowLeopard then // the CollectionBehavior selector is available since 10.5, but the behavior Managed is first introduced in 10.6
			      
			      if Value then
			        CollectionBehavior = self.CollectionBehavior or Integer(NSWindowCollectionBehavior.Transient)
			      else
			        CollectionBehavior = self.CollectionBehavior and NOT Integer(NSWindowCollectionBehavior.Transient)
			      end if
			      
			    end if
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		Transient As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function viewsNeedDisplay lib CocoaLib selector "viewsNeedDisplay" (obj_id as Ptr) as Boolean
			    
			    return viewsNeedDisplay(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setViewsNeedDisplay lib CocoaLib selector "setViewsNeedDisplay:" (obj_id as Ptr, flag as Boolean)
			    
			    setViewsNeedDisplay self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ViewsNeedDisplay As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function windowController lib CocoaLib selector "windowController" (obj_id as Ptr) as Ptr
			    
			    return New NSWindowController( windowController(self) )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setWindowController lib CocoaLib selector "setWindowController:" (obj_id as Ptr, controller as Ptr)
			    
			    setWindowController self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		WindowController As NSWindowController
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Returns the deepest screen the window is on (it may be split over several screens).
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa
			    declare function deepestScreen lib CocoaLib selector "deepestScreen" (obj_id as Ptr) as Ptr
			    
			    dim screenRef as Ptr = deepestScreen(self)
			    if screenRef <> nil then
			      return new NSScreen(screenRef)
			    end if
			  #endif
			End Get
		#tag EndGetter
		WindowDeepestScreen As NSScreen
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function level lib CocoaLib selector "level" (obj_id as Ptr) as NSWindowLevel
			    
			    return level(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setLevel lib CocoaLib selector "setLevel:" (obj_id as Ptr, level as NSWindowLevel)
			    
			    setLevel self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		WindowLevel As NSWindowLevel
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			
			
			Each window device in an application is given a unique window number—note that this isn’t the same as the global
			window number assigned by the window server. This number can be used to identify the window device with the
			orderWindow:relativeTo: method and in the Application Kit function NSWindowList.
			Provides the window number of the window’s window device.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa
			    declare function windowNumber lib CocoaLib selector "windowNumber" (obj_id as Ptr) as Integer
			    
			    return windowNumber(self)
			  #endif
			End Get
		#tag EndGetter
		WindowNumber As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Returns the screen the window is on.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa
			    declare function screen_ lib CocoaLib selector "screen" (obj_id as Ptr) as Ptr
			    
			    dim screenRef as Ptr = screen_(self)
			    if screenRef <> nil then
			      return new NSScreen(screenRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		WindowScreen As NSScreen
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    if IsYosemite then
			      declare function titleVisibility lib CocoaLib selector "titleVisibility" (obj_id as Ptr) as NSWindowTitleVisibility
			      
			      return titleVisibility(self)
			    else
			      return NSWindowTitleVisibility.Visible
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    if IsYosemite then
			      declare sub setTitleVisibility lib CocoaLib selector "setTitleVisibility:" (obj_id as Ptr, titleVisibility as NSWindowTitleVisibility)
			      
			      setTitleVisibility self, value
			    end if
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		WindowTitleVisibility As NSWindowTitleVisibility
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Get & Set the window’s toolbar.
		#tag EndNote
		#tag Getter
			Get
			  #if TargetCocoa
			    declare function toolbar_ lib CocoaLib selector "toolbar" (obj_id as Ptr) as Ptr
			    
			    dim toolbarRef as Ptr = toolbar_(self)
			    
			    if toolbarRef <> nil then
			      return new NSToolbar(toolbarRef)
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    declare sub setToolbar lib CocoaLib selector "setToolbar:" (obj_id as Ptr, aToolbar as Ptr)
			    
			    dim toolbarRef as Ptr
			    if value <> nil then
			      toolbarRef = value
			    end if
			    
			    setToolbar self, toolbarRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		WindowToolbar As NSToolbar
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //@header Indicates whether the NSWindow receives keyboard and mouse events even when some other window is being run modally.
			  
			  #if TargetCocoa
			    declare function worksWhenModal lib CocoaLib selector "worksWhenModal" (obj_id as Ptr) as Boolean
			    
			    return worksWhenModal(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //@header Specifies whether the NSWindow receives keyboard and mouse events even when some other window is being run modally.
			  
			  #if TargetCocoa
			    declare sub setWorksWhenModal lib CocoaLib selector "setWorksWhenModal:" (obj_id as Ptr, flag as Boolean)
			    
			    setWorksWhenModal self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		WorksWhenModal As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = NSWindowNumberListAllApplications, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWindowNumberListAllSpaces, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSBackingStoreType, Type = UInt32, Flags = &h0
		NSBackingStoreRetained
		  NSBackingStoreNonretained
		NSBackingStoreBuffered
	#tag EndEnum

	#tag Enum, Name = NSSelectionDirection, Type = UInt32, Flags = &h0
		NSDirectSelection = 0
		  NSSelectingNext
		NSSelectingPrevious
	#tag EndEnum

	#tag Enum, Name = NSWindowAnimationBehavior, Type = Integer, Flags = &h0
		NSWindowAnimationBehaviorDefault = 0
		  NSWindowAnimationBehaviorNone = 2
		  NSWindowAnimationBehaviorDocumentWindow = 3
		  NSWindowAnimationBehaviorUtilityWindow = 4
		NSWindowAnimationBehaviorAlertPanel = 5
	#tag EndEnum

	#tag Enum, Name = NSWindowBackingLocation, Type = UInt32, Flags = &h0
		NSWindowBackingLocationDefault
		  NSWindowBackingLocationVideoMemory
		NSWindowBackingLocationMainMemory
	#tag EndEnum

	#tag Enum, Name = NSWindowButton, Type = UInt32, Flags = &h0
		NSWindowCloseButton
		  NSWindowMiniaturizeButton
		  NSWindowZoomButton
		  NSWindowToolbarButton
		  NSWindowDocumentIconButton
		  NSWindowDocumentVersionsButton = 6
		NSWindowFullScreenButton
	#tag EndEnum

	#tag Enum, Name = NSWindowCollectionBehavior, Flags = &h0
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

	#tag Enum, Name = NSWindowLevel, Type = Integer, Flags = &h0
		NSNormalWindowLevel = 4
		  NSFloatingWindowLevel = 5
		  NSSubmenuWindowLevel = 6
		  NSTornOffMenuWindowLevel = 6
		  NSMainMenuWindowLevel = 8
		  NSStatusWindowLevel = 9
		  NSModalPanelWindowLevel = 10
		  NSPopUpMenuWindowLevel = 11
		NSScreenSaverWindowLevel = 13
	#tag EndEnum

	#tag Enum, Name = NSWindowMask, Type = Integer, Flags = &h0
		Borderless = 0
		  Titled = 1
		  Closable = 2
		  Miniaturizable = 4
		  Resizable = 8
		  Utility = 16
		  TexturedBackground = 256
		  HUD = 8192
		  FullScreen = 16384
		FullSizeContentView = 32768
	#tag EndEnum

	#tag Enum, Name = NSWindowOrderingMode, Type = Integer, Flags = &h0
		NSWindowAbove = 1
		  NSWindowBelow = -1
		NSWindowOut = 0
	#tag EndEnum

	#tag Enum, Name = NSWindowSharingType, Type = UInt32, Flags = &h0
		NSWindowSharingNone
		  NSWindowSharingReadOnly
		NSWindowSharingReadWrite
	#tag EndEnum

	#tag Enum, Name = NSWindowTitleVisibility, Type = Integer, Flags = &h0
		Visible
		  Hidden
		HiddenWhenActive
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptsMouseMovedEvents"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsConcurrentViewDrawing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsToolTipsWhenApplicationIsInactive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlphaValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AnimationBehavior"
			Group="Behavior"
			Type="NSWindowAnimationBehavior"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSWindowAnimationBehaviorDefault"
				"2 - NSWindowAnimationBehaviorNone"
				"3 - NSWindowAnimationBehaviorDocumentWindow"
				"4 - NSWindowAnimationBehaviorUtilityWindow"
				"5 - NSWindowAnimationBehaviorAlertPanel"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AreCursorRectsEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Autodisplay"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutorecalculatesKeyViewLoop"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackingLocation"
			Group="Behavior"
			Type="NSWindowBackingLocation"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSWindowBackingLocationDefault"
				"1 - NSWindowBackingLocationVideoMemory"
				"2 - NSWindowBackingLocationMainMemory"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackingScaleFactor"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackingType"
			Group="Behavior"
			Type="NSBackingStoreType"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSBackingStoreRetained"
				"1 - NSBackingStoreNonretained"
				"2 - NSBackingStoreBuffered"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeKeyWindow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeMainWindow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeVisibleWithoutLogin"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanHide"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanJoinAllSpaces"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanStoreColor"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CollectionBehavior"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DepthLimit"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplaysWhenScreenProfileChanges"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DocumentEdited"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DynamicDepthLimit"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrameAutosaveName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrameString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullscreenAllowed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullscreenAllowedAuxiliary"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullSizeContentView"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GState"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasShadow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HidesOnDeactivate"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoresCycle"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoresMouseEvents"
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
			Name="IsDocumentEdited"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsExcludedFromWindowsMenu"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlushWindowDisabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFullscreen"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsKeyWindow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsMainWindow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsMiniaturized"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsMovable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsOnActiveSpace"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsOpaque"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsReleasedWhenClosed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRestorable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsSheet"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsVisible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsZoomed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyViewSelectionDirection"
			Group="Behavior"
			Type="NSSelectionDirection"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSDirectSelection"
				"1 - NSSelectingNext"
				"2 - NSSelectingPrevious"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Managed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MiniwindowTitle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MovableByBackground"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MoveToActiveSpace"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OneShot"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ParticipatesInCycle"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferredBackingLocation"
			Group="Behavior"
			Type="NSWindowBackingLocation"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSWindowBackingLocationDefault"
				"1 - NSWindowBackingLocationVideoMemory"
				"2 - NSWindowBackingLocationMainMemory"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreservesContentDuringLiveResize"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreventsAppTerminationWhenModal"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RepresentedFilename"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SharingType"
			Group="Behavior"
			Type="NSWindowSharingType"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSWindowSharingNone"
				"1 - NSWindowSharingReadOnly"
				"2 - NSWindowSharingReadWrite"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsResizeIndicator"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsToolbarButton"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Stationary"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StyleMask"
			Group="Behavior"
			Type="UInt32"
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
			Name="TitlebarAppearsTransparent"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transient"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ViewsNeedDisplay"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowLevel"
			Group="Behavior"
			Type="NSWindowLevel"
			EditorType="Enum"
			#tag EnumValues
				"4 - NSNormalWindowLevel"
				"5 - NSFloatingWindowLevel"
				"6 - NSSubmenuWindowLevel"
				"6 - NSTornOffMenuWindowLevel"
				"8 - NSMainMenuWindowLevel"
				"9 - NSStatusWindowLevel"
				"10 - NSModalPanelWindowLevel"
				"11 - NSPopUpMenuWindowLevel"
				"13 - NSScreenSaverWindowLevel"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowTitleVisibility"
			Group="Behavior"
			Type="NSWindowTitleVisibility"
			EditorType="Enum"
			#tag EnumValues
				"0 - Visible"
				"1 - Hidden"
				"2 - HiddenWhenActive"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="WorksWhenModal"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

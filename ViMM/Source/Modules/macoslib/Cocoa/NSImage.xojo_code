#tag Class
Class NSImage
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function ActionTemplate() As NSImage
		  
		  return LoadByName(NSImageNameActionTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRepresentation(imageRep as NSImageRep)
		  
		  #if targetMacOS
		    declare sub addRepresentation lib CocoaLib selector "addRepresentation:" (obj_id as Ptr, imageRep as Ptr)
		    
		    dim imageRepRef as Ptr
		    if imageRep <> nil then
		      imageRepRef = imageRep
		    end if
		    
		    addRepresentation self, imageRepRef
		    
		  #else
		    #pragma unused imageRep
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRepresentations(imageReps() as NSImageRep)
		  
		  #if targetMacOS
		    declare sub addRepresentations lib CocoaLib selector "addRepresentations:" (obj_id as Ptr, imageReps as Ptr)
		    
		    dim imageRepsArray as NSArray = NSArray.CreateWithObjects(imageReps)
		    
		    addRepresentations self, imageRepsArray
		    
		  #else
		    #pragma unused imageReps
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AddTemplate() As NSImage
		  
		  return LoadByName(NSImageNameAddTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Advanced() As NSImage
		  
		  return LoadByName(NSImageNameAdvanced)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ApplicationIcon() As NSImage
		  
		  return LoadByName(NSImageNameApplicationIcon)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BestRepresentation(rect as Cocoa.NSRect, context as NSGraphicsContext, hints as NSDictionary) As NSImageRep
		  
		  #if targetMacOS
		    declare function bestRepresentationForRect lib CocoaLib selector "bestRepresentationForRect:context:hints:" _
		    (obj_id as Ptr, rect as Cocoa.NSRect, context as Ptr, hints as Ptr) as Ptr
		    
		    dim contextRef as Ptr
		    if context <> nil then
		      contextRef = context
		    end if
		    
		    dim hintsRef as Ptr
		    if hints <> nil then
		      hintsRef = hints
		    end if
		    
		    dim imageRepRef as Ptr = bestRepresentationForRect(self, rect, contextRef, hintsRef)
		    if imageRepRef <> nil then
		      return new NSImageRep(imageRepRef)
		    end if
		    
		  #else
		    #pragma unused rect
		    #pragma unused context
		    #pragma unused hints
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function BluetoothTemplate() As NSImage
		  
		  return LoadByName(NSImageNameBluetoothTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Bonjour() As NSImage
		  
		  return LoadByName(NSImageNameBonjour)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function BookmarksTemplate() As NSImage
		  
		  return LoadByName(NSImageNameBookmarksTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelIncrementalLoad()
		  
		  #if targetMacOS
		    declare sub cancelIncrementalLoad lib CocoaLib selector "cancelIncrementalLoad" (obj_id as Ptr)
		    
		    cancelIncrementalLoad self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CanInitWithPasteboard(pasteboard as NSPasteboard) As Boolean
		  
		  #if targetMacOS
		    declare function canInitWithPasteboard lib CocoaLib selector "canInitWithPasteboard:" (class_id as Ptr, pasteboard as Ptr) as Boolean
		    
		    dim pasteboardRef as Ptr
		    if pasteboard <> nil then
		      pasteboardRef = pasteboard
		    end if
		    
		    return canInitWithPasteboard(ClassRef, pasteboardRef)
		    
		  #else
		    #pragma unused pasteboard
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Caution() As NSImage
		  
		  return LoadByName(NSImageNameCaution)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CGImageForProposedRect(byRef destRect as Cocoa.NSRect, context as NSGraphicsContext, hints as NSDictionary) As CGImage
		  
		  #if targetMacOS
		    declare function CGImageForProposedRect lib CocoaLib selector "CGImageForProposedRect:context:hints:" _
		    (obj_id as Ptr, byRef destRect as Cocoa.NSRect, context as Ptr, hints as Ptr) as Ptr
		    
		    dim contextRef as Ptr
		    if context <> nil then
		      contextRef = context
		    end if
		    
		    dim hintsRef as Ptr
		    if hints <> nil then
		      hintsRef = hints
		    end if
		    
		    dim cgimageRef as Ptr = CGImageForProposedRect(self, destRect, contextRef, hintsRef)
		    if cgimageRef <> nil then
		      return new CGImage(cgimageRef, not CGImage.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused destRect
		    #pragma unused context
		    #pragma unused hints
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  #if targetMacOS
		    return Cocoa.NSClassFromString("NSImage")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorPanel() As NSImage
		  
		  return LoadByName(NSImageNameColorPanel)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColumnViewTemplate() As NSImage
		  
		  return LoadByName(NSImageNameColumnViewTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Computer() As NSImage
		  
		  return LoadByName(NSImageNameComputer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(image as CGImage, size as Cocoa.NSSize)
		  
		  #if TargetCocoa then
		    declare function initWithCGImage lib CocoaLib selector "initWithCGImage:size:" (obj_id as Ptr, CGImageRef as Ptr, size as Cocoa.NSSize) as Ptr
		    
		    if image <> nil then
		      super.Constructor( initWithCGImage(Allocate("NSImage"), image.Reference, size), NSImage.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSImage.Constructor: CGImage argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma Unused image
		    #pragma Unused size
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Size as Cocoa.NSSize)
		  
		  #if targetMacOS
		    declare function initWithSize lib CocoaLib selector "initWithSize:" (obj_id as Ptr, aSize as Cocoa.NSSize) as Ptr
		    
		    super.Constructor(initWithSize(Allocate("NSImage"), Size), NSImage.hasOwnership)
		  #else
		    #pragma unused Size
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(TheFile as FolderItem)
		  
		  #if targetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" (obj_id as Ptr, fileName as CFStringRef) as Ptr
		    
		    if TheFile <> nil then
		      super.Constructor(initWithContentsOfFile(Allocate("NSImage"), TheFile.POSIXPath), NSImage.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSImage.Constructor: Folderitem argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma unused TheFile
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(data as NSData)
		  
		  #if targetMacOS
		    declare function initWithData lib CocoaLib selector "initWithData:" (obj_id as Ptr, data as Ptr) as Ptr
		    
		    if data <> nil then
		      super.Constructor(initWithData(Allocate("NSImage"), data), NSImage.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSImage.Constructor: NSData argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma unused data
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(pasteboard as NSPasteboard)
		  
		  #if targetMacOS
		    declare function initWithPasteboard lib CocoaLib selector "initWithPasteboard:" (obj_id as Ptr, pasteboard as Ptr) as Ptr
		    
		    if pasteboard <> nil then
		      super.Constructor(initWithPasteboard(Allocate("NSImage"), pasteboard), NSImage.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSImage.Constructor: NSPasteboard argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma unused pasteboard
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(URL as NSURL)
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, inURL as Ptr) as Ptr
		    
		    if URL <> nil then
		      super.Constructor(initWithContentsOfURL(Allocate("NSImage"), URL), NSImage.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSImage.Constructor: NSURL argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma unused URL
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(pict as Picture)
		  
		  #if TargetMacOS
		    dim cg_image as CGImage = CGImage.NewCGImage( pict )
		    
		    if cg_image <> nil then
		      Dim zeroSize as Cocoa.NSSize
		      self.Constructor(cg_image, zeroSize)
		    else
		      dim n as NilObjectException
		      n.Message = "NSImage.Constructor: Picture argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma Unused pict
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(iconRef as UInt32)
		  
		  #if targetMacOS
		    declare function initWithIconRef lib CocoaLib selector "initWithIconRef:" (obj_id as Ptr, iconRef as UInt32) as Ptr
		    
		    super.Constructor(initWithIconRef(Allocate("NSImage"), iconRef), NSImage.hasOwnership)
		  #else
		    #pragma unused iconRef
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSImage
		  #if targetMacOS
		    declare function copyWithZone lib CocoaLib selector "copyWithZone:" (obj_id as Ptr, zone as Ptr) as Ptr
		    
		    return new NSImage(copyWithZone(self, nil))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPicture(pict as Picture) As NSImage
		  //To create an NSimage from a REALbasic Picture, create a CGImage from the Picture, then make an NSImage.
		  
		  #if TargetMacOS
		    dim cg_image as CGImage = CGImage.NewCGImage( pict )
		    
		    if cg_image<>nil then
		      dim nsimg as NSImage = cg_image.MakeNSImage
		      
		      return   nsimg
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithPicture(pict as Picture) As NSImage
		  
		  return new NSImage(pict)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DotMac() As NSImage
		  
		  return LoadByName(NSImageNameDotMac)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(point as Cocoa.NSPoint, operation as NSComposite, opacity as Double = 1.0)
		  //Draws the image to the current NSGraphicsContext.
		  
		  dim zeroRect as Cocoa.NSRect
		  self.Draw point, zeroRect, operation, opacity
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(point as Cocoa.NSPoint, fromRect as NSRect, operation as NSComposite, opacity as Double = 1.0)
		  //Draws the part of the image defined by fromRect to the current NSGraphicsContext.
		  //pass fromRect = zeroRect to draw the entire image.
		  
		  #if targetCocoa
		    declare sub drawAtPoint lib CocoaLib selector "drawAtPoint:fromRect:operation:fraction:" (obj_id as Ptr, point as Cocoa.NSPoint, fromRect as Cocoa.NSRect, op as NSComposite, delta as Double)
		    
		    drawAtPoint(self, point, fromRect, operation, CType(opacity, Double))
		  #else
		    #pragma unused point
		    #pragma unused fromRect
		    #pragma unused operation
		    #pragma unused opacity
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(srcRect as Cocoa.NSRect, dstRect as Cocoa.NSRect, operation as NSComposite, opacity as Double = 1.0, respectFlipped as Boolean = true, hints as NSDictionary = nil)
		  #if targetMacOS
		    declare sub drawInRect lib CocoaLib selector "drawInRect:fromRect:operation:fraction:respectFlipped:hints:" (obj_id as Ptr, dstSpacePortionRect as Cocoa.NSRect, srcSpacePortionRect as Cocoa.NSRect, op as NSComposite, requestedAlpha as Double, respectContextIsFlipped as Boolean, hints as Ptr)
		    
		    dim hintsPtr as Ptr
		    if hints <> nil then
		      hintsPtr = self
		    else
		      hintsPtr = nil
		    end if
		    
		    drawInRect(self, dstRect, srcRect, operation, opacity, respectFlipped, hintsPtr)
		  #else
		    #pragma Unused srcRect
		    #pragma Unused dstRect
		    #pragma Unused operation
		    #pragma Unused opacity
		    #pragma Unused respectFlipped
		    #pragma Unused hints
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(srcRect as Cocoa.NSRect, dstRect as Cocoa.NSRect, operation as NSComposite, opacity as Double)
		  //draws part of image defined by srcRect into dstRect in the current context.  The image is scaled as needed.
		  //Pass srcRect = zeroRect to draw the entire image.
		  
		  #if targetMacOS
		    declare sub drawInRect lib CocoaLib selector "drawInRect:fromRect:operation:fraction:" (obj_id as Ptr, dstRect as Cocoa.NSRect, srcRect as Cocoa.NSRect, op as NSComposite, delta as Double)
		    
		    drawInRect(self, dstRect, srcRect, operation, CType(opacity, Double))
		  #else
		    #pragma Unused srcRect
		    #pragma Unused dstRect
		    #pragma Unused operation
		    #pragma Unused opacity
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function EnterFullScreenTemplate() As NSImage
		  
		  return LoadByName(NSImageNameEnterFullScreenTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Everyone() As NSImage
		  
		  return LoadByName(NSImageNameEveryone)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ExitFullScreenTemplate() As NSImage
		  
		  return LoadByName(NSImageNameExitFullScreenTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FlowViewTemplate() As NSImage
		  
		  return LoadByName(NSImageNameFlowViewTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Folder() As NSImage
		  
		  return LoadByName(NSImageNameFolder)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FolderBurnable() As NSImage
		  
		  return LoadByName(NSImageNameFolderBurnable)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FolderSmart() As NSImage
		  
		  return LoadByName(NSImageNameFolderSmart)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FollowLinkFreestandingTemplate() As NSImage
		  
		  return LoadByName(NSImageNameFollowLinkFreestandingTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontPanel() As NSImage
		  
		  return LoadByName(NSImageNameFontPanel)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GoLeftTemplate() As NSImage
		  
		  return LoadByName(NSImageNameGoLeftTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GoRightTemplate() As NSImage
		  
		  return LoadByName(NSImageNameGoRightTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HintCTM() As NSImage
		  
		  return LoadByName(NSImageHintCTM)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HintInterpolation() As NSImage
		  
		  return LoadByName(NSImageHintInterpolation)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HitTest(testRectDestSpace as Cocoa.NSRect, imageRectDestSpace as Cocoa.NSRect, referenceContext as NSGraphicsContext, hints as NSDictionary, flipped as Boolean) As Boolean
		  
		  #if targetMacOS
		    declare function hitTestRect lib CocoaLib selector "hitTestRect:withImageDestinationRect:context:hints:flipped:" _
		    (obj_id as Ptr, testRectDestSpace as Cocoa.NSRect, imageRectDestSpace as Cocoa.NSRect, referenceContext as Ptr, hints as Ptr, flipped as Boolean) as Boolean
		    
		    dim contextRef as Ptr
		    if referenceContext <> nil then
		      contextRef = referenceContext
		    end if
		    
		    dim hintsRef as Ptr
		    if hints <> nil then
		      hintsRef = hints
		    end if
		    
		    return hitTestRect(self, testRectDestSpace, imageRectDestSpace, contextRef, hintsRef, flipped)
		    
		  #else
		    #pragma unused testRectDestSpace
		    #pragma unused imageRectDestSpace
		    #pragma unused referenceContext
		    #pragma unused hints
		    #pragma unused flipped
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HomeTemplate() As NSImage
		  
		  return LoadByName(NSImageNameHomeTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IChatTheaterTemplate() As NSImage
		  
		  return LoadByName(NSImageNameIChatTheaterTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IconViewTemplate() As NSImage
		  
		  return LoadByName(NSImageNameIconViewTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ImageFileTypes() As String()
		  
		  #if targetMacOS
		    declare function imageFileTypes lib CocoaLib selector "imageFileTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageFileTypes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ImageTypes() As String()
		  
		  #if targetMacOS
		    declare function imageTypes lib CocoaLib selector "imageTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageTypes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ImageUnfilteredFileTypes() As String()
		  
		  #if targetMacOS
		    declare function imageUnfilteredFileTypes lib CocoaLib selector "imageUnfilteredFileTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageUnfilteredFileTypes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ImageUnfilteredPasteboardTypes() As String()
		  
		  #if targetMacOS
		    declare function imageUnfilteredPasteboardTypes lib CocoaLib selector "imageUnfilteredPasteboardTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageUnfilteredPasteboardTypes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ImageUnfilteredTypes() As String()
		  
		  #if targetMacOS
		    declare function imageUnfilteredTypes lib CocoaLib selector "imageUnfilteredTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageUnfilteredTypes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Info() As NSImage
		  
		  return LoadByName(NSImageNameInfo)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function InvalidDataFreestandingTemplate() As NSImage
		  
		  return LoadByName(NSImageNameInvalidDataFreestandingTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LeftFacingTriangleTemplate() As NSImage
		  
		  return LoadByName(NSImageNameLeftFacingTriangleTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ListViewTemplate() As NSImage
		  
		  return LoadByName(NSImageNameListViewTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadByName(name as String) As NSImage
		  #if targetMacOS
		    declare function imageNamed lib CocoaLib selector "imageNamed:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim p as Ptr = imageNamed(ClassRef, name)
		    if p <> nil then
		      return new NSImage(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadByNameWithSymbolResolution(name as String) As NSImage
		  
		  return LoadByName(Cocoa.StringConstant(name))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function LoadByName__(name as String) As NSImage
		  dim cfName as CFStringRef = name
		  return LoadByName(cfName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LockFocus()
		  
		  #if targetMacOS
		    declare sub lockFocus lib CocoaLib selector "lockFocus" (obj_id as Ptr)
		    
		    lockFocus self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LockFocusFlipped(value as Boolean)
		  //# Prepares the image to receive drawing commands using the specified flipped state.
		  
		  #if TargetMacOS then
		    if IsSnowLeopard then
		      declare sub lockFocusFlipped lib CocoaLib selector "lockFocusFlipped:" (obj_id as Ptr, value as Boolean)
		      lockFocusFlipped(self, value)
		    end if
		  #else
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LockLockedTemplate() As NSImage
		  
		  return LoadByName(NSImageNameLockLockedTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LockUnlockedTemplate() As NSImage
		  
		  return LoadByName(NSImageNameLockUnlockedTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeCGImage(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As CGImage
		  #if targetMacOS
		    declare function CGImageForProposedRect lib CocoaLib selector "CGImageForProposedRect:context:hints:" (obj_id as Ptr, byref proposedDestRect as NSRect, referenceContext as Ptr, hints as Ptr) as Ptr
		    
		    dim r as NSRect
		    dim s as NSSize = me.Size
		    
		    //Set default size
		    r.w = s.width
		    r.h = s.height
		    
		    //Overwrite size if given
		    if proposedWidth>0.0 then
		      r.w = proposedWidth
		    end if
		    
		    if proposedHeight>0.0 then
		      r.h = proposedHeight
		    end if
		    
		    dim imagePtr as Ptr = CGImageForProposedRect(self, r, nil, nil)
		    if imagePtr <> nil then
		      return new CGImage(imagePtr, not CFType.hasOwnership)
		    else
		      return nil
		    end if
		  #else
		    #pragma Unused proposedWidth
		    #pragma Unused proposedHeight
		  #endif
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakePicture() As Picture
		  //Given an NSImage, you can convert it to a REALbasic Picture object by first converting to a CGimage, then to a Picture.
		  
		  #if TargetMacOS
		    
		    dim cg_image as CGImage = me.MakeCGImage
		    
		    if cg_image<>nil then
		      dim p as Picture = cg_image.MakePicture
		      return   p
		      
		    else
		      return  nil
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MenuMixedStateTemplate() As NSIMage
		  
		  return LoadByName(NSImageNameMenuMixedStateTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MenuOnStateTemplate() As NSImage
		  
		  return LoadByName(NSImageNameMenuOnStateTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MobileMe() As NSImage
		  
		  return LoadByName(NSImageNameMobileMe)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MultipleDocuments() As NSImage
		  
		  return LoadByName(NSImageNameMultipleDocuments)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Network() As NSImage
		  
		  return LoadByName(NSImageNameNetwork)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageHintCTM() As String
		  
		  return Cocoa.StringConstant("NSImageHintCTM")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageHintInterpolation() As String
		  
		  return Cocoa.StringConstant("NSImageHintInterpolation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameActionTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameActionTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameAddTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameAddTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameAdvanced() As String
		  
		  return Cocoa.StringConstant("NSImageNameAdvanced")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameApplicationIcon() As String
		  
		  return Cocoa.StringConstant("NSImageNameApplicationIcon")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameBluetoothTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameBluetoothTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameBonjour() As String
		  
		  return Cocoa.StringConstant("NSImageNameBonjour")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameBookmarksTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameBookmarksTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameCaution() As String
		  
		  return Cocoa.StringConstant("NSImageNameCaution")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameColorPanel() As String
		  
		  return Cocoa.StringConstant("NSImageNameColorPanel")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameColumnViewTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameColumnViewTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameComputer() As String
		  
		  return Cocoa.StringConstant("NSImageNameComputer")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameDotMac() As String
		  
		  return Cocoa.StringConstant("NSImageNameDotMac")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameEnterFullScreenTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameEnterFullScreenTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameEveryone() As String
		  
		  return Cocoa.StringConstant("NSImageNameEveryone")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameExitFullScreenTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameExitFullScreenTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameFlowViewTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameFlowViewTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameFolder() As String
		  
		  return Cocoa.StringConstant("NSImageNameFolder")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameFolderBurnable() As String
		  
		  return Cocoa.StringConstant("NSImageNameFolderBurnable")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameFolderSmart() As String
		  
		  return Cocoa.StringConstant("NSImageNameFolderSmart")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameFollowLinkFreestandingTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameFollowLinkFreestandingTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameFontPanel() As String
		  
		  return Cocoa.StringConstant("NSImageNameFontPanel")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameGoLeftTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameGoLeftTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameGoRightTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameGoRightTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameHomeTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameHomeTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameIChatTheaterTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameIChatTheaterTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameIconViewTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameIconViewTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameInfo() As String
		  
		  return Cocoa.StringConstant("NSImageNameInfo")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameInvalidDataFreestandingTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameInvalidDataFreestandingTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameLeftFacingTriangleTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameLeftFacingTriangleTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameListViewTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameListViewTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameLockLockedTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameLockLockedTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameLockUnlockedTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameLockUnlockedTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameMenuMixedStateTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameMenuMixedStateTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameMenuOnStateTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameMenuOnStateTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameMobileMe() As String
		  
		  return Cocoa.StringConstant("NSImageNameMobileMe")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameMultipleDocuments() As String
		  
		  return Cocoa.StringConstant("NSImageNameMultipleDocuments")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameNetwork() As String
		  
		  return Cocoa.StringConstant("NSImageNameNetwork")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNamePathTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNamePathTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNamePreferencesGeneral() As String
		  
		  return Cocoa.StringConstant("NSImageNamePreferencesGeneral")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameQuickLookTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameQuickLookTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameRefreshFreestandingTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameRefreshFreestandingTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameRefreshTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameRefreshTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameRemoveTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameRemoveTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameRevealFreestandingTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameRevealFreestandingTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameRightFacingTriangleTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameRightFacingTriangleTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameShareTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameShareTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameSlideshowTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameSlideshowTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameSmartBadgeTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameSmartBadgeTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameStatusAvailable() As String
		  
		  return Cocoa.StringConstant("NSImageNameStatusAvailable")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameStatusNone() As String
		  
		  return Cocoa.StringConstant("NSImageNameStatusNone")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameStatusPartiallyAvailable() As String
		  
		  return Cocoa.StringConstant("NSImageNameStatusPartiallyAvailable")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameStatusUnavailable() As String
		  
		  return Cocoa.StringConstant("NSImageNameStatusUnavailable")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameStopProgressFreestandingTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameStopProgressFreestandingTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameStopProgressTemplate() As String
		  
		  return Cocoa.StringConstant("NSImageNameStopProgressTemplate")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameTrashEmpty() As String
		  
		  return Cocoa.StringConstant("NSImageNameTrashEmpty")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameTrashFull() As String
		  
		  return Cocoa.StringConstant("NSImageNameTrashFull")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameUser() As String
		  
		  return Cocoa.StringConstant("NSImageNameUser")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameUserAccounts() As String
		  
		  return Cocoa.StringConstant("NSImageNameUserAccounts")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameUserGroup() As String
		  
		  return Cocoa.StringConstant("NSImageNameUserGroup")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageNameUserGuest() As String
		  
		  return Cocoa.StringConstant("NSImageNameUserGuest")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Picture
		  //Given an NSImage, you can convert it to a REALbasic Picture object by first converting to a CGimage, then to a Picture.
		  
		  #if TargetMacOS
		    
		    dim cg_image as CGImage = me.MakeCGImage
		    
		    if cg_image<>nil then
		      dim p as Picture = cg_image.MakePicture
		      return   p
		      
		    else
		      return  nil
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(pict as Picture)
		  
		  self.Constructor(pict)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PasteboardTypes() As String()
		  
		  #if targetMacOS
		    declare function imagePasteboardTypes lib CocoaLib selector "imagePasteboardTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imagePasteboardTypes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PathTemplate() As NSImage
		  
		  return LoadByName(NSImageNamePathTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PreferencesGeneral() As NSImage
		  
		  return LoadByName(NSImageNamePreferencesGeneral)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function QuickLookTemplate() As NSImage
		  
		  return LoadByName(NSImageNameQuickLookTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Recache()
		  
		  #if targetMacOS
		    declare sub recache lib CocoaLib selector "recache" (obj_id as Ptr)
		    
		    recache self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RefreshFreestandingTemplate() As NSImage
		  
		  return LoadByName(NSImageNameRefreshFreestandingTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RefreshTemplate() As NSImage
		  
		  return LoadByName(NSImageNameRefreshTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRepresentation(imageRep as NSImageRep)
		  
		  #if targetMacOS
		    declare sub removeRepresentation lib CocoaLib selector "removeRepresentation:" (obj_id as Ptr, imageRep as Ptr)
		    
		    dim imageRepRef as Ptr
		    if imageRep <> nil then
		      imageRepRef = imageRep
		    end if
		    
		    removeRepresentation self, imageRepRef
		    
		  #else
		    #pragma unused imageRep
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RemoveTemplate() As NSImage
		  
		  return LoadByName(NSImageNameRemoveTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Representations() As NSImageRep()
		  
		  #if targetMacOS
		    declare function representations lib CocoaLib selector "representations" (obj_id as Ptr) as Ptr
		    
		    dim retArray() as NSImageRep
		    
		    dim arrayRef as Ptr = representations(self)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSImageRep(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ResolveSymbol(symbolName as String) As CFStringRef
		  static b as CFBundle = CFBundle.NewCFBundleFromID(Cocoa.BundleID)
		  if b <> nil then
		    return b.StringPointerRetained(symbolName)
		    
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RevealFreestandingTemplate() As NSImage
		  
		  return LoadByName(NSImageNameRevealFreestandingTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RightFacingTriangleTemplate() As NSImage
		  
		  return LoadByName(NSImageNameRightFacingTriangleTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMaxSize(maxSideLength as double)
		  //Set the NSImage size to maxSideLength on one side while the other is computed for keeping aspect ratio. If the NSImage is smaller than maxSideLength, it does nothing.
		  
		  dim theSize as Cocoa.NSSize
		  dim currentSize as Cocoa.NSSize = me.Size
		  dim scale as double
		  dim w, h as double
		  
		  if maxSideLength=0.0 then  //Full size
		    return
		  else
		    scale = currentSize.width / currentSize.height
		    if currentSize.width >= maxSideLength  then
		      w = maxSideLength
		      h = w / scale
		      
		    elseif currentSize.height >= maxSideLength then
		      h = maxSideLength
		      w = h * scale
		      
		    else
		      w = currentSize.width
		      h = currentSize.height
		    end if
		    
		    theSize.width = w
		    theSize.height = h
		  end if
		  
		  me.Size = theSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSize(wantedWidth as double = 0.0, wantedHeight as double = 0.0)
		  //Set the NSImage size with the possibility of setting only one dimension while the other is computed for keeping aspect ratio
		  
		  dim theSize as Cocoa.NSSize
		  dim scale as double
		  dim w, h as double
		  
		  if wantedWidth=0.0 AND wantedHeight=0.0 then  //Full size
		    theSize = me.Size
		  else
		    scale = size.width / size.height
		    w = wantedWidth
		    h = wantedHeight
		    if wantedWidth=0.0 then
		      w = scale * h
		    elseif wantedHeight=0.0 then
		      h = w / scale
		    end if
		    
		    theSize.width = w
		    theSize.height = h
		  end if
		  
		  me.Size = theSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ShareTemplate() As NSImage
		  
		  return LoadByName(NSImageNameShareTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SlideshowTemplate() As NSImage
		  
		  return LoadByName(NSImageNameSlideshowTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SmartBadgeTemplate() As NSImage
		  
		  return LoadByName(NSImageNameSmartBadgeTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StatusAvailable() As NSImage
		  
		  return LoadByName(NSImageNameStatusAvailable)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StatusNone() As NSImage
		  
		  return LoadByName(NSImageNameStatusNone)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StatusPartiallyAvailable() As NSImage
		  
		  return LoadByName(NSImageNameStatusPartiallyAvailable)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StatusUnavailable() As NSImage
		  
		  return LoadByName(NSImageNameStatusUnavailable)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StopProgressFreestandingTemplate() As NSImage
		  
		  return LoadByName(NSImageNameStopProgressFreestandingTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StopProgressTemplate() As NSImage
		  
		  return LoadByName(NSImageNameStopProgressTemplate)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TIFFRepresentation() As NSData
		  
		  #if targetMacOS
		    declare function TIFFRepresentation lib CocoaLib selector "TIFFRepresentation" (obj_id as Ptr) as Ptr
		    
		    dim dataRef as Ptr = TIFFRepresentation(self)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TIFFRepresentation(comp as NSBitmapImageRep.NSTIFFCompression, factor as Double) As NSData
		  
		  #if targetMacOS
		    declare function TIFFRepresentationUsingCompression lib CocoaLib selector "TIFFRepresentationUsingCompression:factor:" _
		    (obj_id as Ptr, comp as NSBitmapImageRep.NSTIFFCompression, factor as Double) as Ptr
		    
		    dim dataRef as Ptr = TIFFRepresentationUsingCompression(self, comp, factor)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused comp
		    #pragma unused factor
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TrashEmpty() As NSImage
		  
		  return LoadByName(NSImageNameTrashEmpty)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TrashFull() As NSImage
		  
		  return LoadByName(NSImageNameTrashFull)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnlockFocus()
		  
		  #if targetMacOS
		    declare sub unlockFocus lib CocoaLib selector "unlockFocus" (obj_id as Ptr)
		    
		    unlockFocus self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function User() As NSImage
		  
		  return LoadByName(NSImageNameUser)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UserAccounts() As NSImage
		  
		  return LoadByName(NSImageNameUserAccounts)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UserGroup() As NSImage
		  
		  return LoadByName(NSImageNameUserGroup)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UserGuest() As NSImage
		  
		  return LoadByName(NSImageNameUserGuest)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As Variant
		  
		  return self.Operator_Convert
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Conversion from Picture
		To create an NSimage from a REALbasic Picture, create a CGImage from the Picture, then make an NSImage.
		
		  dim p as new Picture(32, 32, 32)
		  p.Graphics.ForeColor = &cff0000
		  p.Graphics.FillRect 0, 0, p.Width, p.Height
		  
		  dim cg_image as CGImage = CGImage.NewCGImage(p)
		  dim nsimage as NSImage = cg_image.MakeNSImage
	#tag EndNote

	#tag Note, Name = Conversion to Picture
		Given an NSImage, you can convert it to a REALbasic Picture object by first converting to a CGimage, then to a Picture.
		
		dim cg_image as CGImage = image.MakeCGImage
		dim p as Picture = cg_image.MakePicture
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function accessibilityDescription lib CocoaLib selector "accessibilityDescription" (obj_id as Ptr) as CFStringRef
			    
			    return accessibilityDescription(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setAccessibilityDescription lib CocoaLib selector "setAccessibilityDescription:" (obj_id as Ptr, description as CFStringRef)
			    
			    setAccessibilityDescription(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AccessibilityDescription As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function alignmentRect lib CocoaLib selector "alignmentRect" (obj_id as Ptr) as Cocoa.NSRect
			    
			    return alignmentRect(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setAlignmentRect lib CocoaLib selector "setAlignmentRect:" (obj_id as Ptr, rect as Cocoa.NSRect)
			    
			    setAlignmentRect(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AlignmentRect As Cocoa.NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
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
			  
			  #if targetMacOS
			    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" (obj_id as Ptr, aColor as Ptr)
			    
			    dim colorRef as Ptr
			    if value <> nil then
			      colorRef = value
			    end if
			    
			    setBackgroundColor(self, colorRef)
			    
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
			  
			  #if targetMacOS
			    declare function cacheMode lib CocoaLib selector "cacheMode" (obj_id as Ptr) as NSCacheMode
			    
			    return cacheMode(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setCacheMode lib CocoaLib selector "setCacheMode:" (obj_id as Ptr, mode as NSCacheMode)
			    
			    setCacheMode(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		CacheMode As NSCacheMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function matchesOnMultipleResolution lib CocoaLib selector "matchesOnMultipleResolution" (obj_id as Ptr) as Boolean
			    
			    return matchesOnMultipleResolution(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setMatchesOnMultipleResolution lib CocoaLib selector "setMatchesOnMultipleResolution:" (obj_id as Ptr, flag as Boolean)
			    
			    setMatchesOnMultipleResolution(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MatchesOnMultipleResolution As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as CFStringRef
			    
			    return name(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare function setName lib CocoaLib selector "setName:" (obj_id as Ptr, aName as CFStringRef) as Boolean
			    
			    call setName(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function prefersColorMatch lib CocoaLib selector "prefersColorMatch" (obj_id as Ptr) as Boolean
			    
			    return prefersColorMatch(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setPrefersColorMatch lib CocoaLib selector "setPrefersColorMatch:" (obj_id as Ptr, flag as Boolean)
			    
			    setPrefersColorMatch(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PrefersColorMatch As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function size lib CocoaLib selector "size" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return size(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //starting in MacOS 10.6, this rescales the image.
			  
			  #if targetMacOS
			    declare sub setSize lib CocoaLib selector "setSize:" (obj_id as Ptr, value as Cocoa.NSSize)
			    
			    setSize(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Size As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Boolean value indicating whether the image is a template image.
			  
			  #if TargetCocoa then
			    declare function isTemplate lib CocoaLib selector "isTemplate" (image as Ptr) as Boolean
			    
			    return isTemplate( me )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets whether the image represents a template image.
			  
			  #if TargetCocoa then
			    declare sub setTemplate lib CocoaLib selector "setTemplate:" (image as Ptr, inFlag as Boolean)
			    
			    setTemplate( me, value )
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Template As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function usesEPSOnResolutionMismatch lib CocoaLib selector "usesEPSOnResolutionMismatch" (obj_id as Ptr) as Boolean
			    
			    return usesEPSOnResolutionMismatch(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setUsesEPSOnResolutionMismatch lib CocoaLib selector "setUsesEPSOnResolutionMismatch:" (obj_id as Ptr, flag as Boolean)
			    
			    setUsesEPSOnResolutionMismatch(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		UsesEPSOnResolutionMismatch As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isValid lib CocoaLib selector "isValid" (obj_id as Ptr) as Boolean
			    
			    return isValid(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Valid As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = NSCacheMode, Type = Integer, Flags = &h0
		NSImageCacheDefault
		  NSImageCacheAlways
		  NSImageCacheBySize
		NSImageCacheNever
	#tag EndEnum

	#tag Enum, Name = NSComposite, Type = Integer, Flags = &h0
		Clear = 0
		  Copy = 1
		  SourceOver = 2
		  SourceIn = 3
		  SourceOut = 4
		  SourceAtop = 5
		  DestinationOver = 6
		  DestinationIn = 7
		  DestinationOut = 8
		  DestinationAtop = 9
		  X_OR = 10
		  PlusDarker = 11
		  Highlight = 12
		PlusLighter = 13
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityDescription"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CacheMode"
			Group="Behavior"
			Type="NSCacheMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSImageCacheDefault"
				"1 - NSImageCacheAlways"
				"2 - NSImageCacheBySize"
				"3 - NSImageCacheNever"
			#tag EndEnumValues
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MatchesOnMultipleResolution"
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
			Name="PrefersColorMatch"
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
			Name="Template"
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
			Name="UsesEPSOnResolutionMismatch"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Valid"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

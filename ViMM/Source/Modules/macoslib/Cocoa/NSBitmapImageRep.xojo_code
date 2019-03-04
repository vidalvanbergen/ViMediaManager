#tag Class
Class NSBitmapImageRep
Inherits NSImageRep
	#tag Method, Flags = &h1000
		Function BitmapData() As MemoryBlock
		  //# Returns a pointer to the bitmap data.
		  
		  #if TargetMacOS
		    declare function bitmapData lib CocoaLib selector "bitmapData" (obj_id as Ptr) as Ptr
		    
		    return bitmapData(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BitmapDataPlanes() As MemoryBlock
		  //# Returns by indirection bitmap data of the NSBitmapImageRep separated into planes.
		  
		  #if TargetMacOS
		    declare sub getBitmapDataPlanes lib CocoaLib selector "getBitmapDataPlanes:" (obj_id as Ptr, byRef data as Ptr)
		    
		    dim mRef as Ptr
		    getBitmapDataPlanes(self, mRef)
		    
		    return mRef
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function CanBeCompressed(compression as NSTIFFCompression) As Boolean
		  //# Tests whether the NSBitmapImageRep can be compressed by the specified compression scheme.
		  
		  #if TargetMacOS
		    declare function canBeCompressedUsing lib CocoaLib selector "canBeCompressedUsing:" (obj_id as Ptr, compression as NSTIFFCompression) as Boolean
		    
		    return canBeCompressedUsing(self, compression)
		  #else
		    #pragma unused compression
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CanInitWithData(data as NSData) As Boolean
		  
		  #if TargetMacOS
		    declare function canInitWithData lib CocoaLib selector "canInitWithData:" (class_id as Ptr, data as Ptr) as Boolean
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    return canInitWithData(ClassRef, dataRef)
		    
		  #else
		    #pragma unused data
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CanInitWithPasteboard(pasteboard as NSPasteboard) As Boolean
		  
		  #if TargetMacOS
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

	#tag Method, Flags = &h1000
		Function CGImageValue() As CGImage
		  //# Returns a Core Graphics image object from the NSBitmapImageRep’s current bitmap data.
		  
		  #if TargetMacOS
		    if IsLeopard then
		      declare function CGImage_ lib CocoaLib selector "CGImage" (obj_id as Ptr) as Ptr
		      
		      dim imageRef as Ptr = CGImage_(self)
		      if imageRef <> nil then
		        return new CGImage(imageRef, not CFType.hasOwnership)
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ClassForData(data as NSData) As Ptr
		  
		  #if TargetMacOS
		    declare function imageRepClassForData lib CocoaLib selector "imageRepClassForData:" (class_id as Ptr, data as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    return imageRepClassForData(ClassRef, dataRef)
		    
		  #else
		    #pragma unused data
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ClassForFileType(fileType as String) As Ptr
		  
		  #if TargetMacOS
		    declare function imageRepClassForFileType lib CocoaLib selector "imageRepClassForFileType:" (class_id as Ptr, fileType as CFStringRef) as Ptr
		    
		    return imageRepClassForFileType(ClassRef, fileType)
		    
		  #else
		    #pragma unused fileType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ClassForPasteboardType(pboardType as String) As Ptr
		  
		  #if TargetMacOS
		    declare function imageRepClassForPasteboardType lib CocoaLib selector "imageRepClassForPasteboardType:" (class_id as Ptr, pboardType as CFStringRef) as Ptr
		    
		    return imageRepClassForPasteboardType(ClassRef, pboardType)
		    
		  #else
		    #pragma unused pboardType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ClassForType(type as String) As Ptr
		  
		  #if TargetMacOS
		    declare function imageRepClassForType lib CocoaLib selector "imageRepClassForType:" (class_id as Ptr, type as CFStringRef) as Ptr
		    
		    return imageRepClassForType(ClassRef, type)
		    
		  #else
		    #pragma unused type
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSBitmapImageRep")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ColorizeByMappingGray(midPoint as Double, midPointColor as NSColor, shadowColor as NSColor, lightColor as NSColor)
		  //# Colorizes a grayscale image.
		  
		  #if TargetMacOS
		    declare sub colorizeByMappingGray lib CocoaLib selector "colorizeByMappingGray:toColor:blackMapping:whiteMapping:" (obj_id as Ptr, midPoint as Double, midPointColor as Ptr, shadowColor as Ptr, lightColor as Ptr)
		    
		    dim midPointColorRef as Ptr
		    if midPointColor <> nil then
		      midPointColorRef = midPointColor
		    end if
		    
		    dim shadowColorRef as Ptr
		    if shadowColor <> nil then
		      shadowColorRef = shadowColor
		    end if
		    
		    dim lightColorRef as Ptr
		    if lightColor <> nil then
		      lightColorRef = lightColor
		    end if
		    
		    colorizeByMappingGray self, midPoint, midPointColorRef, shadowColorRef, lightColorRef
		  #else
		    #pragma unused midPoint
		    #pragma unused midPointColor
		    #pragma unused shadowColor
		    #pragma unused lightColor
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  //# Initializes and returns the NSBitmapImageRep, a newly allocated NSBitmapImageRep object, for incremental loading.
		  
		  //@ The NSBitmapImageRep returns itself after setting its size and data buffer to zero. You can then call incrementalLoadFromData:complete: to incrementally add image data.
		  
		  #if targetMacOS
		    declare function initForIncrementalLoad lib CocoaLib selector "initForIncrementalLoad" (obj_id as Ptr) as Ptr
		    
		    super.Constructor(initForIncrementalLoad(Allocate("NSBitmapImageRep")), NSBitmapImageRep.hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(byRef planes as MemoryBlock, width as Integer, height as Integer, bitsPerSample as Integer, samplesPerPixel as Integer, hasAlpha as Boolean, isPlanar as Boolean, colorSpaceName as String, bytesPerRow as Integer, bitsPerPixel as Integer)
		  //# Initializes the NSBitmapImageRep, a newly allocated NSBitmapImageRep object, so it can render the specified image.
		  
		  #if targetMacOS
		    declare function initWithBitmapDataPlanes lib CocoaLib selector _
		    "initWithBitmapDataPlanes:pixelsWide:pixelsHigh:bitsPerSample:samplesPerPixel:hasAlpha:isPlanar:colorSpaceName:bytesPerRow:bitsPerPixel:" _
		    (obj_id as Ptr, _
		    planes as Ptr, _
		    width as Integer, _
		    height as Integer, _
		    bitsPerSample as Integer, _
		    samplesPerPixel as Integer, _
		    hasAlpha as Boolean, _
		    isPlanar as Boolean, _
		    colorSpaceName as CFStringRef, _
		    bytesPerRow as Integer, _
		    bitsPerPixel as Integer) as Ptr
		    
		    super.Constructor(initWithBitmapDataPlanes(Allocate("NSBitmapImageRep"), _
		    planes, _
		    width, _
		    height, _
		    bitsPerSample, _
		    samplesPerPixel, _
		    hasAlpha, _
		    isPlanar, _
		    colorSpaceName, _
		    bytesPerRow, _
		    bitsPerPixel), NSBitmapImageRep.hasOwnership)
		  #else
		    #pragma unused planes
		    #pragma unused width
		    #pragma unused height
		    #pragma unused bitsPerSample
		    #pragma unused samplesPerPixel
		    #pragma unused hasAlpha
		    #pragma unused isPlanar
		    #pragma unused colorSpaceName
		    #pragma unused bytesPerRow
		    #pragma unused bitsPerPixel
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(byRef planes as MemoryBlock, width as Integer, height as Integer, bitsPerSample as Integer, samplesPerPixel as Integer, hasAlpha as Boolean, isPlanar as Boolean, colorSpaceName as String, bitmapFormat as UInt32, bytesPerRow as Integer, bitsPerPixel as Integer)
		  //# Initializes the NSBitmapImageRep, a newly allocated NSBitmapImageRep object, so it can render the specified image.
		  
		  #if targetMacOS
		    declare function initWithBitmapDataPlanes lib CocoaLib selector _
		    "initWithBitmapDataPlanes:pixelsWide:pixelsHigh:bitsPerSample:samplesPerPixel:hasAlpha:isPlanar:colorSpaceName:bitmapFormat:bytesPerRow:bitsPerPixel:" _
		    (obj_id as Ptr, _
		    planes as Ptr, _
		    width as Integer, _
		    height as Integer, _
		    bitsPerSample as Integer, _
		    samplesPerPixel as Integer, _
		    hasAlpha as Boolean, _
		    isPlanar as Boolean, _
		    colorSpaceName as CFStringRef, _
		    bitmapFormat as UInt32, _
		    bytesPerRow as Integer, _
		    bitsPerPixel as Integer) as Ptr
		    
		    super.Constructor(initWithBitmapDataPlanes(Allocate("NSBitmapImageRep"), _
		    planes, _
		    width, _
		    height, _
		    bitsPerSample, _
		    samplesPerPixel, _
		    hasAlpha, _
		    isPlanar, _
		    colorSpaceName, _
		    bitmapFormat, _
		    bytesPerRow, _
		    bitsPerPixel), NSBitmapImageRep.hasOwnership)
		  #else
		    #pragma unused planes
		    #pragma unused width
		    #pragma unused height
		    #pragma unused bitsPerSample
		    #pragma unused samplesPerPixel
		    #pragma unused hasAlpha
		    #pragma unused isPlanar
		    #pragma unused colorSpaceName
		    #pragma unused bitmapFormat
		    #pragma unused bytesPerRow
		    #pragma unused bitsPerPixel
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(image as CGImage)
		  //# Returns an NSBitmapImageRep object created from a Core Graphics image object.
		  
		  #if targetMacOS
		    if IsLeopard then
		      declare function initWithCGImage lib CocoaLib selector "initWithCGImage:" (obj_id as Ptr, image as Ptr) as Ptr
		      
		      dim imageRef as Ptr
		      if image <> nil then
		        imageRef = image
		      end if
		      
		      super.Constructor(initWithCGImage(Allocate("NSBitmapImageRep"), imageRef), NSBitmapImageRep.hasOwnership)
		    end if
		  #else
		    #pragma unused image
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(image as CIImage)
		  //# Returns an NSBitmapImageRep object created from a Core Image object.
		  
		  #if targetMacOS
		    if IsLeopard then
		      declare function initWithCIImage lib CocoaLib selector "initWithCIImage:" (obj_id as Ptr, image as Ptr) as Ptr
		      
		      dim imageRef as Ptr
		      if image <> nil then
		        imageRef = image
		      end if
		      
		      super.Constructor(initWithCIImage(Allocate("NSBitmapImageRep"), imageRef), NSBitmapImageRep.hasOwnership)
		    end if
		  #else
		    #pragma unused image
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aRect as Cocoa.NSRect)
		  //# Initializes the NSBitmapImageRep, a newly allocated NSBitmapImageRep object, with bitmap data read from a rendered image.
		  
		  #if targetMacOS
		    declare function initWithFocusedViewRect lib CocoaLib selector "initWithFocusedViewRect:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Ptr
		    
		    super.Constructor(initWithFocusedViewRect(Allocate("NSBitmapImageRep"), aRect), NSBitmapImageRep.hasOwnership)
		  #else
		    #pragma unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(data as NSData)
		  //# Initializes a newly allocated NSBitmapImageRep from the provided data.
		  
		  #if targetMacOS
		    declare function initWithData lib CocoaLib selector "initWithData:" (obj_id as Ptr, data as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    super.Constructor(initWithData(Allocate("NSBitmapImageRep"), dataRef), NSBitmapImageRep.hasOwnership)
		  #else
		    #pragma unused data
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ConvertToColorSpace(targetSpace as NSColorspace, renderingIntent as NSGraphicsContext.NSColorRenderingIntent) As NSBitmapImageRep
		  //# Converts the image rep to the specified colorspace
		  
		  #if TargetMacOS
		    declare function bitmapImageRepByConvertingToColorSpace lib CocoaLib selector "bitmapImageRepByConvertingToColorSpace:renderingIntent:" (obj_id as Ptr, targetSpace as Ptr, renderingIntent as NSGraphicsContext.NSColorRenderingIntent) as Ptr
		    
		    dim colorspaceRef as Ptr
		    if targetSpace <> nil then
		      colorspaceRef = targetSpace
		    end if
		    
		    dim imageRepRef as Ptr = bitmapImageRepByConvertingToColorSpace(self, colorspaceRef, renderingIntent)
		    if imageRepRef <> nil then
		      return new NSBitmapImageRep(imageRepRef)
		    end if
		    
		  #else
		    #pragma unused targetSpace
		    #pragma unused renderingIntent
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreatesWithData(data as NSData) As NSBitmapImageRep()
		  
		  #if TargetMacOS
		    declare function imageRepsWithData lib CocoaLib selector "imageRepsWithData:" (class_id as Ptr, data as Ptr) as Ptr
		    
		    dim retArray() as NSBitmapImageRep
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim arrayRef as Ptr = imageRepsWithData(ClassRef, dataRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSBitmapImageRep(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused data
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreatesWithFile(file as FolderItem) As NSBitmapImageRep()
		  
		  #if TargetMacOS
		    declare function imageRepsWithContentsOfFile lib CocoaLib selector "imageRepsWithContentsOfFile:" (class_id as Ptr, aPath as CFStringRef) as Ptr
		    
		    dim retArray() as NSBitmapImageRep
		    
		    if file <> nil then
		      dim arrayRef as Ptr = imageRepsWithContentsOfFile(ClassRef, file.POSIXPath)
		      if arrayRef <> nil then
		        dim ns_array as new NSArray(arrayRef)
		        
		        dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		        dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		        dim n as Integer = arrayRange.length-1
		        for i as integer = 0 to n
		          retArray.append new NSBitmapImageRep(Ptr(m.UInt64Value(i*SizeOfPointer)))
		        next
		      end if
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreatesWithPasteboard(pasteboard as NSPasteboard) As NSBitmapImageRep()
		  
		  #if TargetMacOS
		    declare function imageRepsWithPasteboard lib CocoaLib selector "imageRepsWithPasteboard:" (class_id as Ptr, pasteboard as Ptr) as Ptr
		    
		    dim retArray() as NSBitmapImageRep
		    
		    dim pasteboardRef as Ptr
		    if pasteboard <> nil then
		      pasteboardRef = pasteboard
		    end if
		    
		    dim arrayRef as Ptr = imageRepsWithPasteboard(ClassRef, pasteboardRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSBitmapImageRep(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused pasteboard
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreatesWithURL(aURL as NSURL) As NSBitmapImageRep()
		  
		  #if TargetMacOS
		    declare function imageRepsWithContentsOfURL lib CocoaLib selector "imageRepsWithContentsOfURL:" (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    dim retArray() as NSBitmapImageRep
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim arrayRef as Ptr = imageRepsWithContentsOfURL(ClassRef, urlRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSBitmapImageRep(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithData(data as NSData) As NSBitmapImageRep
		  
		  #if TargetMacOS
		    declare function imageRepWithData lib CocoaLib selector "imageRepWithData:" (class_id as Ptr, data as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim imageRepRef as Ptr = imageRepWithData(ClassRef, dataRef)
		    if imageRepRef <> nil then
		      return new NSBitmapImageRep(imageRepRef)
		    end if
		    
		  #else
		    #pragma unused data
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithFile(file as FolderItem) As NSBitmapImageRep
		  
		  #if TargetMacOS
		    declare function imageRepWithContentsOfFile lib CocoaLib selector "imageRepWithContentsOfFile:" (class_id as Ptr, aPath as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim imageRepRef as Ptr = imageRepWithContentsOfFile(ClassRef, file.POSIXPath)
		      if imageRepRef <> nil then
		        return new NSBitmapImageRep(imageRepRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithPasteboard(pasteboard as NSPasteboard) As NSBitmapImageRep
		  
		  #if TargetMacOS
		    declare function imageRepWithPasteboard lib CocoaLib selector "imageRepWithPasteboard:" (class_id as Ptr, pasteboard as Ptr) as Ptr
		    
		    dim pasteboardRef as Ptr
		    if pasteboard <> nil then
		      pasteboardRef = pasteboard
		    end if
		    
		    dim imageRepRef as Ptr = imageRepWithPasteboard(ClassRef, pasteboardRef)
		    if imageRepRef <> nil then
		      return new NSBitmapImageRep(imageRepRef)
		    end if
		    
		  #else
		    #pragma unused pasteboard
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithURL(aURL as NSURL) As NSBitmapImageRep
		  
		  #if TargetMacOS
		    declare function imageRepWithContentsOfURL lib CocoaLib selector "imageRepWithContentsOfURL:" (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim imageRepRef as Ptr = imageRepWithContentsOfURL(ClassRef, urlRef)
		    if imageRepRef <> nil then
		      return new NSBitmapImageRep(imageRepRef)
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function GetColor(x as Integer, y as Integer) As NSColor
		  //# Returns the color of the pixel at the specified coordinates.
		  
		  #if TargetMacOS
		    declare function colorAtX lib CocoaLib selector "colorAtX:y:" (obj_id as Ptr, x as Integer, y as Integer) as Ptr
		    
		    dim colorRef as Ptr = colorAtX(self, x, y)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    end if
		    
		  #else
		    #pragma unused x
		    #pragma unused y
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub GetCompression(byRef compression as NSTIFFCompression, byRef factor as Double)
		  //# Returns by indirection the NSBitmapImageRep’s compression type and compression factor.
		  
		  #if TargetMacOS
		    declare sub getCompression lib CocoaLib selector "getCompression:factor:" (obj_id as Ptr, byRef compression as NSTIFFCompression, byRef factor as Double)
		    
		    getCompression self, compression, factor
		  #else
		    #pragma unused compression
		    #pragma unused factor
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function GetPixel(x as Integer, y as Integer) As MemoryBlock
		  //# Returns by indirection the pixel data for the specified location in the NSBitmapImageRep.
		  
		  #if TargetMacOS
		    declare sub getPixel lib CocoaLib selector "getPixel:atX:y:" (obj_id as Ptr, pixelData as Ptr, x as Integer, y as Integer)
		    
		    dim m as MemoryBlock
		    getPixel self, m, x, y
		    
		    return m
		  #else
		    #pragma unused x
		    #pragma unused y
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function GetProperty(aProperty as String) As NSObject
		  //# Returns the value for the specified property.
		  
		  #if TargetMacOS
		    declare function valueForProperty lib CocoaLib selector "valueForProperty:" (obj_id as Ptr, aProperty as CFStringRef) as Ptr
		    
		    dim valueRef as Ptr = valueForProperty(self, aProperty)
		    if valueRef <> nil then
		      return new NSObject(valueRef)
		    end if
		    
		  #else
		    #pragma unused aProperty
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ImageFileTypes() As String()
		  
		  #if TargetMacOS
		    declare function imageFileTypes lib CocoaLib selector "imageFileTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageFileTypes(ClassRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ImagePasteboardTypes() As String()
		  
		  #if TargetMacOS
		    declare function imagePasteboardTypes lib CocoaLib selector "imagePasteboardTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imagePasteboardTypes(ClassRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ImageTypes() As String()
		  
		  #if TargetMacOS
		    declare function imageTypes lib CocoaLib selector "imageTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageTypes(ClassRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ImageUnfilteredFileTypes() As String()
		  
		  #if TargetMacOS
		    declare function imageUnfilteredFileTypes lib CocoaLib selector "imageUnfilteredFileTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageUnfilteredFileTypes(ClassRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ImageUnfilteredPasteboardTypes() As String()
		  
		  #if TargetMacOS
		    declare function imageUnfilteredPasteboardTypes lib CocoaLib selector "imageUnfilteredPasteboardTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageUnfilteredPasteboardTypes(ClassRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ImageUnfilteredTypes() As String()
		  
		  #if TargetMacOS
		    declare function imageUnfilteredTypes lib CocoaLib selector "imageUnfilteredTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = imageUnfilteredTypes(ClassRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IncrementalLoad(data as NSData, complete as Boolean) As NSImageRepLoadStatus
		  //# Loads the current image data into an incrementally-loaded image representation and returns the current status of the image.
		  
		  //@Param data = A NSData object that contains the image to be loaded.
		  //@Param complete = YES if the image is entirely downloaded, NO otherwise.
		  
		  #if TargetMacOS
		    declare function incrementalLoadFromData lib CocoaLib selector "incrementalLoadFromData:complete:" (obj_id as Ptr, data as Ptr, complete as Boolean) as NSImageRepLoadStatus
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    return incrementalLoadFromData(self, dataRef, complete)
		  #else
		    #pragma unused data
		    #pragma unused complete
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageColorSyncProfileData() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageColorSyncProfileData")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageCompressionFactor() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageCompressionFactor")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageCompressionMethod() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageCompressionMethod")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageCurrentFrame() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageCurrentFrame")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageCurrentFrameDuration() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageCurrentFrameDuration")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageDitherTransparency() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageDitherTransparency")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageEXIFData() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageEXIFData")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageFallbackBackgroundColor() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageFallbackBackgroundColor")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageFrameCount() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageFrameCount")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageGamma() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageGamma")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageInterlaced() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageInterlaced")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageLoopCount() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageLoopCount")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageProgressive() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageProgressive")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSImageRGBColorTable() As String
		  
		  static name as String = Cocoa.StringConstant ("NSImageRGBColorTable")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function RegisteredImageRepClasses() As Ptr()
		  
		  #if TargetMacOS
		    declare function registeredImageRepClasses lib CocoaLib selector "registeredImageRepClasses" (class_id as Ptr) as Ptr
		    
		    dim retArray() as Ptr
		    
		    dim arrayRef as Ptr = registeredImageRepClasses(ClassRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append Ptr(m.UInt64Value(i*SizeOfPointer))
		      next
		    end if
		    
		    return retArray
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Sub RegisterImageRepClass(imageRepClass as Ptr)
		  
		  #if TargetMacOS
		    declare sub registerImageRepClass lib CocoaLib selector "registerImageRepClass:" (class_id as Ptr, imageRepClass as Ptr)
		    
		    registerImageRepClass ClassRef, imageRepClass
		    
		  #else
		    #pragma unused imageRepClass
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Representation(imageReps as NSArray, storageType as NSBitmapImageFileType, properties as NSDictionary) As NSData
		  
		  #if TargetMacOS
		    declare function representationOfImageRepsInArray lib CocoaLib selector "representationOfImageRepsInArray:usingType:properties:" _
		    (class_id as Ptr, anArray as Ptr, storageType as NSBitmapImageFileType, properties as Ptr) as Ptr
		    
		    dim arrayRef as Ptr
		    if imageReps <> nil then
		      arrayRef = imageReps
		    end if
		    
		    dim dictRef as Ptr
		    if properties <> nil then
		      dictRef = properties
		    end if
		    
		    dim dataRef as Ptr = representationOfImageRepsInArray(ClassRef, arrayRef, storageType, dictRef)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused imageReps
		    #pragma unused storageType
		    #pragma unused properties
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Representation(storageType as NSBitmapImageFileType, properties as NSDictionary) As NSData
		  //# Formats the NSBitmapImageRep’s image data using the specified storage type and properties and returns it in a data object.
		  
		  #if TargetMacOS
		    declare function representationUsingType lib CocoaLib selector "representationUsingType:properties:" (obj_id as Ptr, storageType as NSBitmapImageFileType, properties as Ptr) as Ptr
		    
		    dim dictRef as Ptr
		    if properties <> nil then
		      dictRef = properties
		    end if
		    
		    dim dataRef as Ptr = representationUsingType(self, storageType, dictRef)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused storageType
		    #pragma unused properties
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RetagToColorSpace(targetSpace as NSColorspace) As NSBitmapImageRep
		  //# Changes the colorSpace tag of the NSBitmapImageRep.
		  
		  #if TargetMacOS
		    if IsSnowLeopard then
		      declare function bitmapImageRepByRetaggingWithColorSpace lib CocoaLib selector "bitmapImageRepByRetaggingWithColorSpace:" (obj_id as Ptr, targetSpace as Ptr) as Ptr
		      
		      dim colorspaceRef as Ptr
		      if targetSpace <> nil then
		        colorspaceRef = targetSpace
		      end if
		      
		      dim imageRepRef as Ptr = bitmapImageRepByRetaggingWithColorSpace(self, colorspaceRef)
		      if imageRepRef <> nil then
		        return new NSBitmapImageRep(imageRepRef)
		      end if
		      
		    end if
		  #else
		    #pragma unused targetSpace
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub SetColor(aColor as NSColor, x as Integer, y as Integer)
		  //# Changes the color of the pixel at the specified coordinates.
		  
		  #if TargetMacOS
		    declare sub setColor lib CocoaLib selector "setColor:atX:y:" (obj_id as Ptr, aColor as Ptr, x as Integer, y as Integer)
		    
		    dim colorRef as Ptr
		    if aColor <> nil then
		      colorRef = aColor
		    end if
		    
		    setColor self, colorRef, x, y
		  #else
		    #pragma unused aColor
		    #pragma unused x
		    #pragma unused y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub SetCompression(compression as NSTIFFCompression, factor as Double)
		  //# Sets the NSBitmapImageRep's compression type and compression factor.
		  
		  //@param compression = An enum constant that identifies one of the supported compression types as described in “Constants.”
		  
		  //@param factor = A floating point value that is specific to the compression type. _
		  // Many types of compression don’t support varying degrees of compression and thus _
		  // ignore factor. JPEG compression allows a compression factor ranging from 0.0 to 1.0, _
		  // with 0.0 being the lowest and 1.0 being the highest.
		  
		  #if TargetMacOS
		    declare sub setCompression lib CocoaLib selector "setCompression:factor:" (obj_id as Ptr, compression as NSTIFFCompression, factor as Double)
		    
		    setCompression self, compression, factor
		  #else
		    #pragma unused compression
		    #pragma unused factor
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub SetPixel(pixelData as MemoryBlock, x as Integer, y as Integer)
		  //# Sets the NSBitmapImageRep's pixel at the specified coordinates to the specified raw pixel values.
		  
		  #if TargetMacOS
		    declare sub setPixel lib CocoaLib selector "setPixel:atX:y:" (obj_id as Ptr, pixelData as Ptr, x as Integer, y as Integer)
		    
		    if pixelData <> nil then
		      setPixel self, pixelData, x, y
		    end if
		    
		  #else
		    #pragma unused pixelData
		    #pragma unused x
		    #pragma unused y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub SetProperty(aProperty as String, value as NSObject)
		  //# Sets the image’s property to value.
		  
		  #if TargetMacOS
		    declare sub setProperty lib CocoaLib selector "setProperty:withValue:" (obj_id as Ptr, aProperty as CFStringRef, value as Ptr)
		    
		    dim valueRef as Ptr
		    if value <> nil then
		      valueRef = value
		    end if
		    
		    setProperty self, aProperty, valueRef
		    
		  #else
		    #pragma unused aProperty
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function TIFFCompressionTypeLocalizedName(compression as NSTIFFCompression) As String
		  
		  #if TargetMacOS
		    declare function localizedNameForTIFFCompressionType lib CocoaLib selector "localizedNameForTIFFCompressionType:" _
		    (class_id as Ptr, compression as NSTIFFCompression) as CFStringRef
		    
		    return localizedNameForTIFFCompressionType(ClassRef, compression)
		    
		  #else
		    #pragma unused compression
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function TIFFCompressionTypes() As NSTIFFCompression()
		  
		  #if TargetMacOS
		    declare sub getTIFFCompressionTypes lib CocoaLib selector "getTIFFCompressionTypes:count:" (class_id as Ptr, byRef list as Ptr, byRef count as Integer)
		    
		    dim listRef as Ptr
		    dim listCount as Integer
		    
		    getTIFFCompressionTypes ClassRef, listRef, listCount
		    
		    dim m as MemoryBlock = listRef
		    
		    dim rb_array() as NSTIFFCompression
		    
		    if m <> nil then
		      for i as integer = 0 to listCount-1
		        rb_array.append NSTIFFCompression(m.Int64Value(i*SizeOfInteger))
		      next
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function TIFFRepresentation() As NSData
		  //# Returns a TIFF representation of the NSBitmapImageRep.
		  
		  #if TargetMacOS
		    declare function TIFFRepresentation lib CocoaLib selector "TIFFRepresentation" (obj_id as Ptr) as Ptr
		    
		    dim dataRef as Ptr = TIFFRepresentation(self)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function TIFFRepresentation(imageReps as NSArray) As NSData
		  
		  #if TargetMacOS
		    declare function TIFFRepresentationOfImageRepsInArray lib CocoaLib selector "TIFFRepresentationOfImageRepsInArray:" _
		    (class_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim arrayRef as Ptr
		    if imageReps <> nil then
		      arrayRef = imageReps
		    end if
		    
		    dim dataRef as Ptr = TIFFRepresentationOfImageRepsInArray(ClassRef, arrayRef)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused imageReps
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function TIFFRepresentation(imageReps as NSArray, compression as NSTIFFCompression, factor as Double) As NSData
		  
		  #if TargetMacOS
		    declare function TIFFRepresentationOfImageRepsInArray lib CocoaLib selector "TIFFRepresentationOfImageRepsInArray:usingCompression:factor:" _
		    (class_id as Ptr, anArray as Ptr, compression as NSTIFFCompression, factor as Double) as Ptr
		    
		    dim arrayRef as Ptr
		    if imageReps <> nil then
		      arrayRef = imageReps
		    end if
		    
		    dim dataRef as Ptr = TIFFRepresentationOfImageRepsInArray(ClassRef, arrayRef, compression, factor)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused imageReps
		    #pragma unused compression
		    #pragma unused factor
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function TIFFRepresentation(compression as NSTIFFCompression, factor as Double) As NSData
		  //# Returns a data object containing TIFF data with the specified compression settings for all of the image representations in the NSBitmapImageRep.
		  
		  #if TargetMacOS
		    declare function TIFFRepresentationUsingCompression lib CocoaLib selector "TIFFRepresentationUsingCompression:factor:" (class_id as Ptr, compression as NSTIFFCompression, factor as Double) as Ptr
		    
		    dim dataRef as Ptr = TIFFRepresentationUsingCompression(self, compression, factor)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused compression
		    #pragma unused factor
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Sub UnregisterImageRepClass(imageRepClass as Ptr)
		  
		  #if TargetMacOS
		    declare sub unregisterImageRepClass lib CocoaLib selector "unregisterImageRepClass:" (class_id as Ptr, imageRepClass as Ptr)
		    
		    unregisterImageRepClass ClassRef, imageRepClass
		    
		  #else
		    #pragma unused imageRepClass
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the bitmap format of the NSBitmapImageRep.
			  
			  #if targetMacOS
			    declare function bitmapFormat lib CocoaLib selector "bitmapFormat" (obj_id as Ptr) as UInt32
			    
			    return bitmapFormat(self)
			  #endif
			End Get
		#tag EndGetter
		BitmapFormat As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of bits allocated for each pixel in each plane of data.
			  
			  #if targetMacOS
			    declare function bitsPerPixel lib CocoaLib selector "bitsPerPixel" (obj_id as Ptr) as Integer
			    
			    return bitsPerPixel(self)
			  #endif
			End Get
		#tag EndGetter
		BitsPerPixel As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of bytes in each plane or channel of data.
			  
			  #if targetMacOS
			    declare function bytesPerPlane lib CocoaLib selector "bytesPerPlane" (obj_id as Ptr) as Integer
			    
			    return bytesPerPlane(self)
			  #endif
			End Get
		#tag EndGetter
		BytesPerPlane As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the minimum number of bytes required to specify a scan line (a single row of pixels spanning the width of the image) in each data plane.
			  
			  #if targetMacOS
			    declare function bytesPerRow lib CocoaLib selector "bytesPerRow" (obj_id as Ptr) as Integer
			    
			    return bytesPerRow(self)
			  #endif
			End Get
		#tag EndGetter
		BytesPerRow As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the image rep’s colorSpace
			  
			  #if targetMacOS
			    if IsSnowLeopard then
			      declare function colorSpace lib CocoaLib selector "colorSpace" (obj_id as Ptr) as Ptr
			      
			      dim colorspaceRef as Ptr = colorSpace(self)
			      if colorspaceRef <> nil then
			        return new NSColorspace(colorspaceRef)
			      end if
			      
			    end if
			  #endif
			End Get
		#tag EndGetter
		ColorSpace As NSColorSpace
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns YES if image data is a planar configuration and NO if its in a meshed configuration.
			  
			  #if targetMacOS
			    declare function isPlanar lib CocoaLib selector "isPlanar" (obj_id as Ptr) as Boolean
			    
			    return isPlanar(self)
			  #endif
			End Get
		#tag EndGetter
		IsPlanar As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of separate planes image data is organized into.
			  
			  #if targetMacOS
			    declare function numberOfPlanes lib CocoaLib selector "numberOfPlanes" (obj_id as Ptr) as Integer
			    
			    return numberOfPlanes(self)
			  #endif
			End Get
		#tag EndGetter
		NumberOfPlanes As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of components in the data.
			  
			  #if targetMacOS
			    declare function samplesPerPixel lib CocoaLib selector "samplesPerPixel" (obj_id as Ptr) as Integer
			    
			    return samplesPerPixel(self)
			  #endif
			End Get
		#tag EndGetter
		SamplesPerPixel As Integer
	#tag EndComputedProperty


	#tag Constant, Name = NSAlphaFirstBitmapFormat, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSAlphaNonpremultipliedBitmapFormat, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSFloatingPointSamplesBitmapFormat, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSBitmapImageFileType, Type = UInt32, Flags = &h0
		NSTIFFFileType
		  NSBMPFileType
		  NSGIFFileType
		  NSJPEGFileType
		  NSPNGFileType
		NSJPEG2000FileType
	#tag EndEnum

	#tag Enum, Name = NSImageRepLoadStatus, Type = Integer, Flags = &h0
		NSImageRepLoadStatusUnknownType = -1
		  NSImageRepLoadStatusReadingHeader = -2
		  NSImageRepLoadStatusWillNeedAllData = -3
		  NSImageRepLoadStatusInvalidData = -4
		  NSImageRepLoadStatusUnexpectedEOF = -5
		NSImageRepLoadStatusCompleted = -6
	#tag EndEnum

	#tag Enum, Name = NSTIFFCompression, Type = UInteger, Flags = &h0
		NSTIFFCompressionNone = 1
		  NSTIFFCompressionCCITTFAX3 = 3
		  NSTIFFCompressionCCITTFAX4 = 4
		  NSTIFFCompressionLZW = 5
		  NSTIFFCompressionJPEG = 6
		  NSTIFFCompressionNEXT = 32766
		  NSTIFFCompressionPackBits = 32773
		NSTIFFCompressionOldJPEG = 32865
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="BitmapFormat"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BitsPerPixel"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BitsPerSample"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesPerPlane"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesPerRow"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorSpaceName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasAlpha"
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
			Name="IsOpaque"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsPlanar"
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
			Name="NumberOfPlanes"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PixelsHigh"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PixelsWide"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SamplesPerPixel"
			Group="Behavior"
			Type="Integer"
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
End Class
#tag EndClass

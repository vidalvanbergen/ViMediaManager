#tag Class
Class NSImageRep
Inherits NSObject
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
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSImageRep")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreatesWithFile(file as FolderItem) As NSImageRep()
		  
		  #if TargetMacOS
		    declare function imageRepsWithContentsOfFile lib CocoaLib selector "imageRepsWithContentsOfFile:" (class_id as Ptr, aPath as CFStringRef) as Ptr
		    
		    dim retArray() as NSImageRep
		    
		    if file <> nil then
		      dim arrayRef as Ptr = imageRepsWithContentsOfFile(ClassRef, file.POSIXPath)
		      if arrayRef <> nil then
		        dim ns_array as new NSArray(arrayRef)
		        
		        dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		        dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		        dim n as Integer = arrayRange.length-1
		        for i as integer = 0 to n
		          retArray.append new NSImageRep(Ptr(m.UInt64Value(i*SizeOfPointer)))
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
		Shared Function CreatesWithPasteboard(pasteboard as NSPasteboard) As NSImageRep()
		  #if TargetMacOS
		    declare function imageRepsWithPasteboard lib CocoaLib selector "imageRepsWithPasteboard:" (class_id as Ptr, pasteboard as Ptr) as Ptr
		    
		    dim retArray() as NSImageRep
		    
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
		        retArray.append new NSImageRep(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused pasteboard
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreatesWithURL(aURL as NSURL) As NSImageRep()
		  
		  #if TargetMacOS
		    declare function imageRepsWithContentsOfURL lib CocoaLib selector "imageRepsWithContentsOfURL:" (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    dim retArray() as NSImageRep
		    
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
		        retArray.append new NSImageRep(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithFile(file as FolderItem) As NSImageRep
		  
		  #if TargetMacOS
		    declare function imageRepWithContentsOfFile lib CocoaLib selector "imageRepWithContentsOfFile:" (class_id as Ptr, aPath as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim imageRepRef as Ptr = imageRepWithContentsOfFile(ClassRef, file.POSIXPath)
		      if imageRepRef <> nil then
		        return new NSImageRep(imageRepRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithPasteboard(pasteboard as NSPasteboard) As NSImageRep
		  
		  #if TargetMacOS
		    declare function imageRepWithPasteboard lib CocoaLib selector "imageRepWithPasteboard:" (class_id as Ptr, pasteboard as Ptr) as Ptr
		    
		    dim pasteboardRef as Ptr
		    if pasteboard <> nil then
		      pasteboardRef = pasteboard
		    end if
		    
		    dim imageRepRef as Ptr = imageRepWithPasteboard(ClassRef, pasteboardRef)
		    if imageRepRef <> nil then
		      return new NSImageRep(imageRepRef)
		    end if
		    
		  #else
		    #pragma unused pasteboard
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithURL(aURL as NSURL) As NSImageRep
		  
		  #if TargetMacOS
		    declare function imageRepWithContentsOfURL lib CocoaLib selector "imageRepWithContentsOfURL:" (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim imageRepRef as Ptr = imageRepWithContentsOfURL(ClassRef, urlRef)
		    if imageRepRef <> nil then
		      return new NSImageRep(imageRepRef)
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw()
		  
		  #if targetMacOS
		    declare sub draw lib CocoaLib selector "draw" (obj_id as Ptr)
		    
		    draw self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(aPoint as Cocoa.NSPoint)
		  
		  #if targetMacOS
		    declare sub drawAtPoint lib CocoaLib selector "drawAtPoint:" (obj_id as Ptr, aPoint as Cocoa.NSPoint)
		    
		    drawAtPoint self, aPoint
		    
		  #else
		    #pragma unused aPoint
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(aRect as Cocoa.NSRect)
		  
		  #if targetMacOS
		    declare sub drawInRect lib CocoaLib selector "drawInRect:" (obj_id as Ptr, aRect as Cocoa.NSRect)
		    
		    drawInRect self, aRect
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(srcSpacePortionRect as Cocoa.NSRect, dstSpacePortionRect as Cocoa.NSRect, operation as NSImage.NSComposite, opacity as Double, respectContextIsFlipped as Boolean, hints as NSDictionary)
		  
		  #if targetMacOS
		    declare sub drawInRect lib CocoaLib selector "drawInRect:fromRect:operation:fraction:respectFlipped:hints:" _
		    (obj_id as Ptr, dstRect as Cocoa.NSRect, srcRect as Cocoa.NSRect, op as NSImage.NSComposite, requestedAlpha as Double, _
		    respectContextIsFlipped as Boolean, hints as Ptr)
		    
		    dim hintsRef as Ptr
		    if hints <> nil then
		      hintsRef = hints
		    end if
		    
		    drawInRect(self, dstSpacePortionRect, srcSpacePortionRect, operation, opacity, respectContextIsFlipped, hintsRef)
		    
		  #else
		    #pragma unused srcSpacePortionRect
		    #pragma unused dstSpacePortionRect
		    #pragma unused operation
		    #pragma unused opacity
		    #pragma unused respectContextIsFlipped
		    #pragma unused hints
		  #endif
		End Sub
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
			  
			  #if targetMacOS
			    declare function bitsPerSample lib CocoaLib selector "bitsPerSample" (obj_id as Ptr) as Integer
			    
			    return bitsPerSample(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setBitsPerSample lib CocoaLib selector "setBitsPerSample:" (obj_id as Ptr, anInt as Integer)
			    
			    setBitsPerSample self, value
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		BitsPerSample As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function colorSpaceName lib CocoaLib selector "colorSpaceName" (obj_id as Ptr) as CFStringRef
			    
			    return colorSpaceName(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setColorSpaceName lib CocoaLib selector "setColorSpaceName:" (obj_id as Ptr, aString as CFStringRef)
			    
			    setColorSpaceName self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ColorSpaceName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function hasAlpha lib CocoaLib selector "hasAlpha" (obj_id as Ptr) as Boolean
			    
			    return hasAlpha(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setAlpha lib CocoaLib selector "setAlpha:" (obj_id as Ptr, flag as Boolean)
			    
			    setAlpha self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		HasAlpha As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isOpaque lib CocoaLib selector "isOpaque" (obj_id as Ptr) as Boolean
			    
			    return isOpaque(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
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
			  
			  #if targetMacOS
			    declare function pixelsHigh lib CocoaLib selector "pixelsHigh" (obj_id as Ptr) as Integer
			    
			    return pixelsHigh(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setPixelsHigh lib CocoaLib selector "setPixelsHigh:" (obj_id as Ptr, anInt as Integer)
			    
			    setPixelsHigh self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PixelsHigh As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function pixelsWide lib CocoaLib selector "pixelsWide" (obj_id as Ptr) as Integer
			    
			    return pixelsWide(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setPixelsWide lib CocoaLib selector "setPixelsWide:" (obj_id as Ptr, anInt as Integer)
			    
			    setPixelsWide self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PixelsWide As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function size_ lib CocoaLib selector "size" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return size_(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setSize lib CocoaLib selector "setSize:" (obj_id as Ptr, aSize as Cocoa.NSSize)
			    
			    setSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Size As Cocoa.NSSize
	#tag EndComputedProperty


	#tag Constant, Name = NSImageRepMatchesDevice, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BitsPerSample"
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

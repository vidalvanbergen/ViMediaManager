#tag Class
Class NSScreen
Inherits NSObject
	#tag Method, Flags = &h1000
		Function BackingAlignedRect(aRect as Cocoa.NSRect, options as UInt64) As Cocoa.NSRect
		  
		  #if TargetMacOS
		    declare function backingAlignedRect lib CocoaLib selector "backingAlignedRect:options:" (obj_id as Ptr, aRect as Cocoa.NSRect, options as UInt64) as Cocoa.NSRect
		    
		    return backingAlignedRect(self, aRect, options)
		    
		  #else
		    #pragma unused aRect
		    #pragma unused options
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSScreen")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ConvertRectFromBacking(aRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetMacOS
		    declare function convertRectFromBacking lib CocoaLib selector "convertRectFromBacking:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return convertRectFromBacking(self, aRect)
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ConvertRectToBacking(aRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if TargetMacOS
		    declare function convertRectToBacking lib CocoaLib selector "convertRectToBacking:" (obj_id as Ptr, aRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return convertRectToBacking(self, aRect)
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function DeepestScreen() As NSScreen
		  
		  #if TargetMacOS
		    declare function deepestScreen lib CocoaLib selector "deepestScreen" (class_id as Ptr) as Ptr
		    
		    dim screenRef as Ptr = deepestScreen(ClassRef)
		    if screenRef <> nil then
		      return new NSScreen(screenRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function MainScreen() As NSScreen
		  
		  #if TargetMacOS
		    declare function mainScreen lib CocoaLib selector "mainScreen" (class_id as Ptr) as Ptr
		    
		    dim screenRef as Ptr = mainScreen(ClassRef)
		    if screenRef <> nil then
		      return new NSScreen(screenRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Screens() As NSScreen()
		  
		  #if TargetMacOS
		    declare function screens lib CocoaLib selector "screens" (class_id as Ptr) as Ptr
		    
		    dim retArray() as NSScreen
		    
		    dim arrayRef as Ptr = screens(ClassRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSScreen(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function SupportedWindowDepths() As Integer()
		  
		  #if TargetMacOS
		    declare function supportedWindowDepths lib CocoaLib selector "supportedWindowDepths" (obj_id as Ptr) as Ptr
		    
		    const kSizeOfInteger = 4
		    dim m as MemoryBlock = supportedWindowDepths(self)
		    
		    dim retValue() as Integer
		    
		    if m <> nil then
		      dim wdepth as Integer
		      dim offset as UInt32
		      do
		        wdepth = m.Int32Value(offset)
		        if wdepth <> 0 then
		          retValue.append wdepth
		        end if
		        offset = offset + kSizeOfInteger
		      loop until wdepth = 0
		    end if
		    
		    return retValue
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function backingScaleFactor lib CocoaLib selector "backingScaleFactor" (obj_id as Ptr) as Double
			    
			    return backingScaleFactor(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		BackingScaleFactor As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function colorSpace lib CocoaLib selector "colorSpace" (obj_id as Ptr) as Ptr
			    
			    dim colorSpaceRef as Ptr = colorSpace(self)
			    if colorSpaceRef <> nil then
			      return new NSColorspace(colorSpaceRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ColorSpace As NSColorspace
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function depth lib CocoaLib selector "depth" (obj_id as Ptr) as Integer
			    
			    return depth(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Depth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
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
			  
			  #if targetMacOS
			    declare function frame lib CocoaLib selector "frame" (obj_id as Ptr) as Cocoa.NSRect
			    
			    return frame(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Frame As Cocoa.NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function visibleFrame lib CocoaLib selector "frame" (obj_id as Ptr) as Cocoa.NSRect
			    
			    return visibleFrame(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		VisibleFrame As Cocoa.NSRect
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BackingScaleFactor"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Depth"
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
End Class
#tag EndClass

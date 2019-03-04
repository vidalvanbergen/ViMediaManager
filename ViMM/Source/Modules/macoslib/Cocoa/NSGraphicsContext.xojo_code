#tag Class
Class NSGraphicsContext
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSGraphicsContext")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(g as Graphics)
		  self.Constructor(g, false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(g as Graphics, flipped as Boolean)
		  if g is nil then
		    return
		  end if
		  
		  #if targetCocoa
		    declare function graphicsContextWithGraphicsPort lib CocoaLib selector "graphicsContextWithGraphicsPort:flipped:" (class_id as Ptr, port as Ptr, flipped as Boolean) as Ptr
		    
		    self.Constructor(graphicsContextWithGraphicsPort(Cocoa.NSClassFromString("NSGraphicsContext"), Ptr(g.Handle(Graphics.HandleTypeCGContextRef)), flipped))
		    
		  #else
		    #pragma unused flipped
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithAttributes(attribs as NSDictionary) As NSGraphicsContext
		  
		  #if TargetMacOS
		    declare function graphicsContextWithAttributes lib CocoaLib selector "graphicsContextWithAttributes:" (class_id as Ptr, attribs as Ptr) as Ptr
		    
		    dim dictRef as Ptr
		    if attribs <> nil then
		      dictRef = attribs
		    end if
		    
		    dim contextRef as Ptr = graphicsContextWithAttributes(ClassRef, dictRef)
		    
		    if contextRef <> nil then
		      return new NSGraphicsContext(contextRef)
		    end if
		    
		  #else
		    #pragma unused attribs
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithBitmapImageRep(bitmapRep as NSBitmapImageRep) As NSGraphicsContext
		  
		  #if TargetMacOS
		    declare function graphicsContextWithBitmapImageRep lib CocoaLib selector "graphicsContextWithBitmapImageRep:" (class_id as Ptr, attribs as Ptr) as Ptr
		    
		    dim bitmapRepRef as Ptr
		    if bitmapRep <> nil then
		      bitmapRepRef = bitmapRep
		    end if
		    
		    dim contextRef as Ptr = graphicsContextWithBitmapImageRep(ClassRef, bitmapRepRef)
		    
		    if contextRef <> nil then
		      return new NSGraphicsContext(contextRef)
		    end if
		    
		  #else
		    #pragma unused bitmapRep
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithGraphicsPort(g as Graphics, initialFlippedState as Boolean = false) As NSGraphicsContext
		  
		  #if TargetMacOS
		    declare function graphicsContextWithGraphicsPort lib CocoaLib selector "graphicsContextWithGraphicsPort:flipped:" _
		    (class_id as Ptr, graphicsPort as Ptr, initialFlippedState as Boolean) as Ptr
		    
		    if g <> nil then
		      dim contextRef as Ptr = graphicsContextWithGraphicsPort(ClassRef, Ptr(g.Handle(Graphics.HandleTypeCGContextRef)), initialFlippedState)
		      
		      if contextRef <> nil then
		        return new NSGraphicsContext(contextRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused g
		    #pragma unused initialFlippedState
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithGraphicsPort(graphicsPort as Ptr, initialFlippedState as Boolean) As NSGraphicsContext
		  
		  #if TargetMacOS
		    declare function graphicsContextWithGraphicsPort lib CocoaLib selector "graphicsContextWithGraphicsPort:flipped:" _
		    (class_id as Ptr, graphicsPort as Ptr, initialFlippedState as Boolean) as Ptr
		    
		    if graphicsPort <> nil then
		      dim contextRef as Ptr = graphicsContextWithGraphicsPort(ClassRef, graphicsPort, initialFlippedState)
		      
		      if contextRef <> nil then
		        return new NSGraphicsContext(contextRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused graphicsPort
		    #pragma unused initialFlippedState
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithWindow(aWindow as NSWindow) As NSGraphicsContext
		  
		  #if TargetMacOS
		    declare function graphicsContextWithWindow lib CocoaLib selector "graphicsContextWithWindow:" (class_id as Ptr, aWindow as Ptr) as Ptr
		    
		    dim windowRef as Ptr
		    if aWindow <> nil then
		      windowRef = aWindow
		    end if
		    
		    dim contextRef as Ptr = graphicsContextWithWindow(ClassRef, windowRef)
		    
		    if contextRef <> nil then
		      return new NSGraphicsContext(contextRef)
		    end if
		    
		  #else
		    #pragma unused aWindow
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithWindow(aWindow as Window) As NSGraphicsContext
		  
		  #if TargetMacOS
		    declare function graphicsContextWithWindow lib CocoaLib selector "graphicsContextWithWindow:" (class_id as Ptr, aWindow as Ptr) as Ptr
		    
		    dim windowRef as Ptr
		    if aWindow <> nil then
		      windowRef = Ptr(aWindow.Handle)
		    end if
		    
		    dim contextRef as Ptr = graphicsContextWithWindow(ClassRef, windowRef)
		    
		    if contextRef <> nil then
		      return new NSGraphicsContext(contextRef)
		    end if
		    
		  #else
		    #pragma unused aWindow
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flush()
		  
		  #if targetMacOS
		    declare sub flushGraphics lib CocoaLib selector "flushGraphics" (obj_id as Ptr)
		    
		    flushGraphics(self)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub GraphicsState(assigns state as Integer)
		  
		  #if targetMacOS
		    declare sub setGraphicsState lib CocoaLib selector "setGraphicsState:" (class_id as Ptr, state as Integer)
		    
		    setGraphicsState(ClassRef, state)
		    
		  #else
		    #pragma unused state
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RestoreState()
		  #if targetMacOS
		    declare sub restoreGraphicsState lib CocoaLib selector "restoreGraphicsState" (class_id as Ptr)
		    
		    restoreGraphicsState(ClassRef)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreState()
		  
		  #if targetMacOS
		    declare sub restoreGraphicsState lib CocoaLib selector "restoreGraphicsState" (obj_id as Ptr)
		    
		    restoreGraphicsState(self)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SaveState()
		  #if targetMacOS
		    declare sub saveGraphicsState lib CocoaLib selector "saveGraphicsState" (class_id as Ptr)
		    
		    saveGraphicsState(ClassRef)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveState()
		  
		  #if targetMacOS
		    declare sub saveGraphicsState lib CocoaLib selector "saveGraphicsState" (obj_id as Ptr)
		    
		    saveGraphicsState(self)
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function shouldAntialias lib CocoaLib selector "shouldAntialias" (obj_id as Ptr) as Boolean
			    
			    return shouldAntialias(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setShouldAntialias lib CocoaLib selector "setShouldAntialias:" (obj_id as Ptr, antialias as Boolean)
			    
			    setShouldAntialias(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Antialias As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function attributes_ lib CocoaLib selector "attributes" (obj_id as Ptr) as Ptr
			    
			    dim dictRef as Ptr = attributes_(self)
			    
			    if dictRef <> nil then
			      return new NSDictionary(dictRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Attribs As NSDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function colorRenderingIntent lib CocoaLib selector "colorRenderingIntent" (obj_id as Ptr) as NSColorRenderingIntent
			    
			    return colorRenderingIntent(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setColorRenderingIntent lib CocoaLib selector "setColorRenderingIntent:" (obj_id as Ptr, intent as NSColorRenderingIntent)
			    
			    setColorRenderingIntent(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ColorRenderingIntent As NSColorRenderingIntent
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function compositingOperation lib CocoaLib selector "compositingOperation" (obj_id as Ptr) as NSImage.NSComposite
			    
			    return compositingOperation(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setCompositingOperation lib CocoaLib selector "setCompositingOperation:" (obj_id as Ptr, operation as NSImage.NSComposite)
			    
			    setCompositingOperation(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		CompositingOperation As NSImage.NSComposite
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function CIContext_ lib CocoaLib selector "CIContext" (obj_id as Ptr) as Ptr
			    
			    dim cicontextRef as Ptr = CIContext_(self)
			    
			    if cicontextRef <> nil then
			      return new CIContext(cicontextRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		CoreIMageContext As CIContext
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function currentContext lib CocoaLib selector "currentContext" (class_id as Ptr) as Ptr
			    
			    dim contextRef as Ptr = currentContext(ClassRef)
			    
			    if contextRef <> nil then
			      return new NSGraphicsContext(contextRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setCurrentContext lib CocoaLib selector "setCurrentContext:" (class_id as Ptr, context as Ptr)
			    
			    dim contextRef as Ptr
			    if value <> nil then
			      contextRef = value
			    end if
			    
			    setCurrentContext(ClassRef, contextRef)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Shared CurrentContext As NSGraphicsContext
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function currentContextDrawingToScreen lib CocoaLib selector "currentContextDrawingToScreen" (class_id as Ptr) as Boolean
			    
			    return currentContextDrawingToScreen(ClassRef)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Shared CurrentContextDrawingToScreen As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isDrawingToScreen lib CocoaLib selector "isDrawingToScreen" (obj_id as Ptr) as Boolean
			    
			    return isDrawingToScreen(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		DrawingToScreen As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function isFlipped lib CocoaLib selector "isFlipped" (obj_id as Ptr) as Boolean
			    
			    return isFlipped(self)
			  #endif
			End Get
		#tag EndGetter
		Flipped As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function graphicsPort lib CocoaLib selector "graphicsPort" (obj_id as Ptr) as Ptr
			    
			    return graphicsPort(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		GraphicsPort As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function imageInterpolation lib CocoaLib selector "imageInterpolation" (obj_id as Ptr) as NSImageInterpolation
			    
			    return imageInterpolation(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setImageInterpolation lib CocoaLib selector "setImageInterpolation:" (obj_id as Ptr, interpolation as NSImageInterpolation)
			    
			    setImageInterpolation(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ImageInterpolation As NSImageInterpolation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function patternPhase lib CocoaLib selector "patternPhase" (obj_id as Ptr) as Cocoa.NSPoint
			    
			    return patternPhase(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setPatternPhase lib CocoaLib selector "setPatternPhase:" (obj_id as Ptr, phase as Cocoa.NSPoint)
			    
			    setPatternPhase(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PatternPhase As Cocoa.NSPoint
	#tag EndComputedProperty


	#tag Enum, Name = NSColorRenderingIntent, Flags = &h0
		NSColorRenderingIntentDefault
		  NSColorRenderingIntentAbsoluteColorimetric
		  NSColorRenderingIntentRelativeColorimetric
		  NSColorRenderingIntentPerceptual
		NSColorRenderingIntentSaturation
	#tag EndEnum

	#tag Enum, Name = NSImageInterpolation, Flags = &h0
		NSImageInterpolationDefault
		  NSImageInterpolationNone
		  NSImageInterpolationLow
		  NSImageInterpolationHigh
		NSImageInterpolationMedium
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Antialias"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorRenderingIntent"
			Group="Behavior"
			Type="NSColorRenderingIntent"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSColorRenderingIntentDefault"
				"1 - NSColorRenderingIntentAbsoluteColorimetric"
				"2 - NSColorRenderingIntentRelativeColorimetric"
				"3 - NSColorRenderingIntentPerceptual"
				"4 - NSColorRenderingIntentSaturation"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DrawingToScreen"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageInterpolation"
			Group="Behavior"
			Type="NSImageInterpolation"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSImageInterpolationDefault"
				"1 - NSImageInterpolationNone"
				"2 - NSImageInterpolationLow"
				"3 - NSImageInterpolationHigh"
				"4 - NSImageInterpolationMedium"
			#tag EndEnumValues
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

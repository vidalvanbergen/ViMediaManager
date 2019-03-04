#tag Module
Protected Module ControlExtension
	#tag Method, Flags = &h0
		Function AlphaValue(extends c as Control) As Double
		  //# Returns the opacity of the control
		  
		  #if TargetCocoa then
		    declare function alphaValue lib CocoaLib selector "alphaValue" (obj_id as Integer) as Double
		    
		    if c.Handle <> 0 then
		      return alphaValue(c.Handle)
		    end if
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AlphaValue(extends c as Control, Assigns alpha as Double)
		  //# Sets the opacity of the control.
		  
		  #if TargetCocoa
		    declare sub setAlphaValue lib CocoaLib selector "setAlphaValue:" (obj_id as Integer, alpha as Double)
		    
		    if c.Handle <> 0 then
		      setAlphaValue(c.Handle, alpha)
		    end if
		    
		  #else
		    #pragma unused c
		    #pragma unused alpha
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bounds(extends c as Control) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function bounds lib CocoaLib selector "bounds" (obj_id as Integer) as Cocoa.NSRect
		    
		    if c.Handle <> 0 then
		      return bounds(c.Handle)
		    end if
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bounds(extends c as Control, Assigns boundsRect as Cocoa.NSRect)
		  
		  #if TargetCocoa
		    declare sub setBounds lib CocoaLib selector "setBounds:" (obj_id as Integer, boundsRect as Cocoa.NSRect)
		    
		    if c.Handle <> 0 then
		      setBounds(c.Handle, boundsRect)
		    end if
		    
		  #else
		    #pragma unused c
		    #pragma unused boundsRect
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BoundsRotation(extends c as Control) As Double
		  
		  #if TargetCocoa
		    declare function boundsRotation lib CocoaLib selector "boundsRotation" (obj_id as Integer) as Double
		    
		    if c.Handle <> 0 then
		      return boundsRotation(c.Handle)
		    end if
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BoundsRotation(extends c as Control, Assigns angle as Double)
		  
		  #if TargetCocoa
		    declare sub setBoundsRotation lib CocoaLib selector "setBoundsRotation:" (obj_id as Integer, angle as Double)
		    
		    if c.Handle <> 0 then
		      setBoundsRotation(c.Handle, angle)
		    end if
		    
		  #else
		    #pragma unused c
		    #pragma unused angle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Frame(extends c as Control) As Cocoa.NSRect
		  
		  #if TargetCocoa then
		    declare function frame lib CocoaLib selector "frame" (obj_id as Integer) as Cocoa.NSRect
		    
		    if c.Handle <> 0 then
		      return frame(c.Handle)
		    end if
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Frame(extends c as Control, Assigns frameRect as Cocoa.NSRect)
		  
		  #if TargetCocoa then
		    declare sub setFrame lib CocoaLib selector "setFrame:" (obj_id as Integer, frameRect as Cocoa.NSRect)
		    
		    if c.Handle <> 0 then
		      setFrame(c.Handle, frameRect)
		    end if
		    
		  #else
		    #pragma unused c
		    #pragma unused frameRect
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameCenterRotation(extends c as Control) As Double
		  
		  #if TargetCocoa then
		    declare function frameCenterRotation lib CocoaLib selector "frameCenterRotation" (obj_id as Integer) as Double
		    
		    if c.Handle <> 0 then
		      return frameCenterRotation(c.Handle)
		    end if
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameCenterRotation(extends c as Control, Assigns angle as Double)
		  //# Rotates the frame of the control about the layer’s position.
		  
		  #if TargetCocoa then
		    declare sub setFrameCenterRotation lib CocoaLib selector "setFrameCenterRotation:" (obj_id as Integer, angle as Double)
		    
		    if c.Handle <> 0 then
		      setFrameCenterRotation(c.Handle, angle)
		    end if
		    
		  #else
		    #pragma unused c
		    #pragma unused angle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameRotation(extends c as Control) As Double
		  //# Returns the control’s rotation about the layer’s position.
		  
		  #if TargetCocoa then
		    declare function frameRotation lib CocoaLib selector "frameRotation" (obj_id as Integer) as Double
		    
		    if c.Handle <> 0 then
		      return frameRotation(c.Handle)
		    end if
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameRotation(extends c as Control, Assigns angle as Double)
		  
		  #if TargetCocoa then
		    declare sub setFrameRotation lib CocoaLib selector "setFrameRotation:" (obj_id as Integer, angle as Double)
		    
		    if c.Handle <> 0 then
		      setFrameRotation(c.Handle, angle)
		    end if
		    
		  #else
		    #pragma unused c
		    #pragma unused angle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSControlObject(extends c as Control) As NSControl
		  
		  #if TargetMacOS then
		    return New NSControl( Ptr( c.Handle ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateByAngle(extends c as Control, angle as Double)
		  //# Rotates the control’s bounds rectangle by a specified degree value around the origin of the coordinate system, (0.0, 0.0).
		  
		  #if TargetCocoa
		    declare sub rotateByAngle lib CocoaLib selector "rotateByAngle:" (obj_id as Integer, angle as Double)
		    
		    if c.Handle <> 0 then
		      rotateByAngle(c.Handle, angle)
		    end if
		    
		  #else
		    #pragma unused c
		    #pragma unused angle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function View(extends c as Control) As NSView
		  
		  #if TargetMacOS then
		    return New NSView( Ptr( c.Handle ) )
		  #endif
		End Function
	#tag EndMethod


	#tag Enum, Name = NSBezelStyle, Flags = &h0
		NSRoundedBezelStyle = 1
		  NSRegularSquareBezelStyle
		  NSThickSquareBezelStyle
		  NSThickerSquareBezelStyle
		  NSDisclosureBezelStyle
		  NSShadowlessSquareBezelStyle
		  NSCircularBezelStyle
		  NSTexturedSquareBezelStyle
		  NSHelpButtonBezelStyle
		  NSSmallSquareBezelStyle
		  NSTexturedRoundedBezelStyle
		  NSRoundRectBezelStyle
		  NSRecessedBezelStyle
		  NSRoundedDisclosureBezelStyle
		  NSInlineBezelStyle
		NSSmallIconButtonBezelStyle = 2
	#tag EndEnum

	#tag Enum, Name = NSControlSize, Flags = &h0
		NSRegularControlSize
		  NSSmallControlSize
		NSMiniControlSize
	#tag EndEnum

	#tag Enum, Name = NSImagePosition, Flags = &h0
		NSNoImage
		  NSImageOnly
		  NSImageLeft
		  NSImageRight
		  NSImageBelow
		  NSImageAbove
		NSImageOverlaps
	#tag EndEnum

	#tag Enum, Name = NSImageScaling, Flags = &h0
		ProportionallyDown
		  AxesIndependently
		  None
		ProportionallyUpOrDown
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

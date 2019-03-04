#tag Class
Class NSGradient
Inherits NSObject
	#tag Method, Flags = &h0
		Function ColorSpace() As Cocoa.NSColorspace
		  // Returns the color space of the colors associated with the NSGradient.
		  // In the current version of MacOSLib, the line for ColorSpace in cocoa.NSObjectFromNSPtr has to be de-commented in order to make this funtion work.
		  
		  #if TargetMacOS
		    Declare Function colorSpace lib cocoalib selector "colorSpace"  (id as ptr) as ptr
		    return cocoa.NSObjectFromNSPtr (colorSpace ( self ), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ColorArray() as NSColor)
		  // Original Name: initWithColors:
		  
		  // Initializes a newly allocated gradient object with an array of colors.
		  // First and last NSColor are positioned at 0 and 1.0 (start and end),
		  // others are evenly distributed.
		  
		  // Use: myGradient = new NSGradient (NSColorArray)
		  
		  
		  #if TargetMacOS
		    Declare Function initWithColors lib cocoalib selector "initWithColors:" (id as ptr, ColorArray as Ptr) as Ptr
		    
		    // InitWithColors demands an NSArray wirh NSColors, so we create one:
		    dim colors as new NSArray (ColorArray, false)
		    
		    super.Constructor (initWithColors (Allocate("NSGradient"), colors), false)
		  #else
		    #pragma Unused ColorArray
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Attributes( Constructor = "forwarding to initWithColors:atLocations:colorSpace:" )  Sub Constructor(ColorArray() as NSColor, atLocations() as Double)
		  // // Original Name: initWithColorsAndLocations
		  //
		  // // Initializes a newly allocated gradient object with the specified colors and color locations.
		  // // Locations are singles from 0.0 to 1.0
		  // // Use: myGradient = new NSGradient (NSColorArray, LocationsArray)
		  //
		  
		  
		  // Note: This doesn‘t work. I couldn‘t figure out how to pass the values correctly.
		  // As a tweak use the  initWithColors:atLocations:colorSpace:constructor with a prechosen RGB ColorSpace
		  
		  self.Constructor (ColorArray, atLocations, NSColorspace.DeviceRGBColorSpace)
		  //
		  // #if TargetMacOS
		  // Declare Function initWithColorsAndLocations lib "Cocoa" selector "initWithColorsAndLocations:" (id as ptr, ColorAndLocations as Ptr) as Ptr
		  //
		  //
		  // // InitWithColors in its original demands a comma-separated list of NSColors and their positions, so we create one:
		  //
		  // dim colorblock As new MemoryBlock(20*(ColorArray.Ubound+1))
		  //
		  // //colorblock is a memoryblock a la   r g b a r g b a r g b a + its position
		  // // Thanks to Jim McKay for this information!
		  //
		  // for i as integer=0 to ColorArray.Ubound
		  // colorblock.SingleValue(i*20)=ColorArray(i).RedComponent
		  // colorblock.SingleValue(i*20+4)=ColorArray(i).GreenComponent
		  // colorblock.SingleValue(i*20+8)=ColorArray(i).BlueComponent
		  // colorblock.SingleValue(i*20+12)=ColorArray(i).AlphaComponent
		  // colorblock.SingleValue(i*20+16)=atlocations(i)
		  // next
		  //
		  //
		  //
		  // super.Constructor ( initWithColorsAndLocations (Allocate("NSGradient"), colorblock), false)
		  //
		  //
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ColorArray() as NSColor, atLocations() as Double, ColSpace as NSColorSpace)
		  // Original Name: initWithColors:atLocations:colorSpace:
		  
		  // Initializes a newly allocated gradient object with the specified colors, color locations, and color space.
		  // Locations are singles from 0.0 to 1.0
		  // Use: myGradient = new NSGradient (NSColorArray, LocationsArray, ColorSpace)
		  
		  
		  #if TargetMacOS
		    Declare Function initwithColorsAtLocationColorSpace lib cocoalib selector "initWithColors:atLocations:colorSpace:" (id as ptr, ColorArray as Ptr, atLocations as Ptr, ColSpace as Ptr) as Ptr
		    
		    Declare Function colorSpace lib cocoalib selector "colorSpace"  (id as ptr) as ptr // to convert the Ptr to a new ColorSpace
		    // In order to make this work, the Constructor of MacOSLib‘s NSColorSpace Class has to be made public.
		    // In fact it seems to miss the correct constructors (InitWith… methods)
		    
		    // InitWithColors demands an NSArray wirh NSColors, so we create one:
		    dim colors as new NSArray (ColorArray, false)
		    
		    // and we build a single memoryblock from the atLocations array pointer
		    dim locs As new MemoryBlock(4*(atlocations.Ubound+1))
		    for i as integer=0 to atlocations.Ubound
		      locs.SingleValue(i*4)=atlocations(i)
		    next
		    
		    // As last one the Colorspace
		    dim cs as  NSColorspace = cocoa.NSObjectFromNSPtr (ColSpace , false)
		    
		    super.Constructor ( initwithColorsAtLocationColorSpace (Allocate("NSGradient"), colors, locs, colspace), false)
		    
		  #else
		    #pragma Unused ColorArray
		    #pragma Unused atLocations
		    #pragma Unused ColSpace
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Startcolor as NSColor, EndColor as NSColor)
		  // Original Name: initWithStartingColor:endingColor:
		  
		  // Initializes a newly allocated gradient object with two colors.
		  // Use: myGradient = new NSGradient (StartColor, EndColor)
		  
		  
		  #if TargetMacOS
		    Declare Function InitWithStartingColor_EndingColor lib cocoalib selector "initWithStartingColor:endingColor:"  (id as ptr, Startcolor as ptr, EndColor as ptr) as Ptr
		    super.Constructor ( InitWithStartingColor_EndingColor ( Allocate("NSGradient"), startcolor, endcolor), false)
		  #else
		    #pragma Unused Startcolor
		    #pragma Unused EndColor
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFromCenterToCenter(StartCenter as NSPoint, startRadius as single, endCenter as NSPoint, endRadius as single, options as NSGradientDrawingOptions = NSGradientDrawingOptions.NSGradientStopsatBothLocations)
		  // Draws a radial gradient between the specified circles.
		  // Options can be set to extend both points to fill the entire painted area beyond their limits.
		  
		  #if TargetMacOS
		    Declare sub drawFromCenter_RadiusToCenter_Radius_Options lib cocoalib selector "drawFromCenter:radius:toCenter:radius:options:"  (id as ptr, startCenter as nspoint, startradius as single, endCenter as nspoint, endRadius as Single, options as NSGradientDrawingOptions)
		    drawFromCenter_RadiusToCenter_Radius_Options ( self, startCenter, startRadius, endCenter, endRadius, options )
		  #else
		    #pragma Unused StartCenter
		    #pragma Unused startRadius
		    #pragma Unused endCenter
		    #pragma Unused endRadius
		    #pragma Unused options
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFromPointToPoint(startingPoint as NSPoint, toPoint as NSPoint, options as NSGradientDrawingOptions = NSGradientDrawingOptions.NSGradientStopsatBothLocations)
		  // Draws a linear gradient between the specified start and end points.
		  // Options can be set to extend both points to fill the entire painted area beyond their limits.
		  
		  #if TargetMacOS
		    Declare sub drawFromPoint lib cocoalib selector "drawFromPoint:toPoint:options:"  (id as ptr, startingPoint as nspoint, toPoint as nspoint, options as NSGradientDrawingOptions)
		    
		    drawFromPoint ( self, startingPoint, toPoint, options )
		  #else
		    #pragma Unused startingPoint
		    #pragma Unused toPoint
		    #pragma Unused options
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawInBezierPath(path as NSBezierPath, angle as Single)
		  // Fills the specified rectangle with a linear gradient.
		  // The angle of rotation determines which corner contains the start color; see Table 1 in Apple docs.
		  
		  #if TargetMacOS
		    Declare sub DrawInBezierPath lib cocoalib selector "drawInBezierPath:angle:"  (id as ptr, path as ptr, angle as single)
		    
		    
		    DrawInBezierPath ( self, path, angle )
		  #else
		    #pragma Unused path
		    #pragma Unused angle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawInBezierPathRelativeCenter(path as NSBezierPath, relativeCenterPosition as NSPoint)
		  // Draws a radial gradient starting at the center point of the specified path.
		  // Relative center positions have to be between (-1.0, -1.0) and (1.0, 1.0)
		  
		  #if TargetMacOS
		    Declare sub DrawInBezierPathRelativeCenter lib cocoalib selector "drawInBezierPath:relativeCenterPosition:"  (id as ptr, path as ptr, relativeCenterPosition as NSPoint)
		    
		    
		    DrawInBezierPathRelativeCenter ( self, path, relativeCenterPosition )
		  #else
		    #pragma Unused path
		    #pragma Unused relativeCenterPosition
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawInRect(myRect as nsRect, angle as Single)
		  // Fills the specified rectangle with a linear gradient.
		  // The angle of rotation determines which corner contains the start color; see Table 1 in Apple docs.
		  
		  #if TargetMacOS
		    Declare sub DrawinRect lib cocoalib selector "drawInRect:angle:"  (id as ptr, myrect as nsrect, angle as single)
		    
		    DrawInRect ( self, myrect, angle )
		  #else
		    #pragma Unused myRect
		    #pragma Unused angle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawInRectRelativeCenterPosition(myRect as nsRect, relativeCenterPosition as NSPoint)
		  // Draws a radial gradient starting at the center of the specified rectangle.
		  // The relative position is a NSPoint made from singles  between -1.0 and 1.0
		  
		  #if TargetMacOS
		    Declare sub drawInRectRelativeCenterPosition lib cocoalib selector "drawInRect:relativeCenterPosition:"  (id as ptr, myrect as nsrect, relativeCenterPosition as NSPoint)
		    
		    drawInRectRelativeCenterPosition ( self, myrect, relativeCenterPosition )
		  #else
		    #pragma Unused myRect
		    #pragma Unused relativeCenterPosition
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetColor(byref getColor as NSColor, byref location as Single, atIndex as Integer)
		  // Returns information about the color stop at the specified index in the receiver’s color array.
		  
		  #if TargetMacOS
		    dim colorptr as ptr = getcolor
		    Declare sub getColorlocationatIndex lib CocoaLib selector "getColor:location:atIndex:"  (id as ptr, byref colorptr as ptr, byref location as single, atIndex as Integer)
		    getColorlocationatIndex ( self, colorptr, location, atIndex )
		    GetColor = cocoa.NSObjectFromNSPtr  (colorptr, true, true)
		  #else
		    #pragma Unused getColor
		    #pragma Unused location
		    #pragma Unused atIndex
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function interpolatedColorAtLocation(location as single) As NSColor
		  // Returns the color of the rendered gradient at the specified relative location.
		  // index needs to be between 0.0 and 1.0
		  
		  
		  
		  #if TargetMacOS
		    Declare Function interpolatedColorAtLocation lib CocoaLib selector "interpolatedColorAtLocation:"  (id as ptr, location as single) as Ptr
		    
		    return cocoa.NSObjectFromNSPtr (interpolatedColorAtLocation ( self, location ), false)
		  #else
		    #pragma Unused location
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberofColorStops() As Integer
		  // Returns the number of Color Stops that have been designed for this NSGradient.
		  
		  #if TargetMacOS
		    Declare Function NumberOfColorStops lib cocoalib selector "numberOfColorStops"  (id as ptr) as integer
		    return numberOfColorStops ( self )
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Read Me
		This is the Cocoa.NSGradient Class for easy color gradients.
		See https://developer.apple.com/library/mac/documentation/Cocoa/Reference/NSGradient_class/Reference/Reference.html for details.
		
		To use it, create an instance of this Class first by passing the appropriate values to the Constructor method 
		(see initWith… tasks in Apple doc) and then have it draw inside an object with one of the Draw methods.
		
		To make the ColorSpace method work, the line for ColorSpace in cocoa.NSObjectFromNSPtr in MacOSLib has to be de-commented.
		
		Written 2014 by Ulrich Bogun for MacOSLib
	#tag EndNote


	#tag Enum, Name = NSGradientDrawingOptions, Type = Integer, Flags = &h0
		NSGradientStopsatBothLocations = 0
		  NSGradientDrawsBeforeStartingLocation = 1
		  NSGradientDrawsAfterEndingLocation = 2
		NSGradientDrawsAfterBothLocations = 3
	#tag EndEnum


	#tag ViewBehavior
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

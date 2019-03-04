#tag Class
Class NSBezierPath
Inherits NSObject
	#tag Method, Flags = &h0
		Sub addClip()
		  // Intersects the area enclosed by the receiver's path with the clipping path of the current graphics context and makes the resulting shape the current clipping path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub addClip lib Cocoalib selector "addClip" (obj_ID as Ptr)
		    addClip (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub appendBezierPath(aPath as NSBezierPath)
		  // Appends the contents of the specified path object to the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr)
		    appendBezierPath (self, aPath)
		  #else
		    #pragma Unused aPath
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub appendBezierPathWithArcFromPointtoPoint(fromPoint as NSPoint, toPoint as NSPoint, radius as Single)
		  // Appends an arc to the receiver’s path.
		  
		  // fromPoint:
		  // The middle point of the angle.
		  // toPoint:
		  // The end point of the angle.
		  // radius:
		  // The radius of the circle inscribed in the angle.
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithArc lib Cocoalib selector "appendBezierPathWithArcFromPoint:toPoint:radius:" (obj_ID as Ptr, fromPoint as NSPoint, toPoint as NSPoint, radius as Single)
		    appendBezierPathWithArc (self, fromPoint, toPoint, radius)
		  #else
		    #pragma Unused fromPoint
		    #pragma Unused toPoint
		    #pragma Unused radius
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub appendBezierPathWithArcWithCenter(center as NSPoint, radius as Single, startAngle as Single, endAngle as Single)
		  // Appends an arc of a circle to the receiver’s path.
		  
		  // center:
		  // Specifies the center point of the circle used to define the arc.
		  // radius:
		  // Specifies the radius of the circle used to define the arc.
		  // startAngle:
		  // Specifies the starting angle of the arc, measured in degrees counterclockwise from the x-axis.
		  // endAngle:
		  // Specifies the end angle of the arc, measured in degrees counterclockwise from the x-axis.
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithArcWithCenter lib Cocoalib selector "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:" _
		    (obj_ID as Ptr, center as NSPoint, radius as Single, startAngle as Single, endAngle as Single )
		    appendBezierPathWithArcWithCenter (self, center, radius, startAngle, endAngle)
		  #else
		    #pragma Unused center
		    #pragma Unused radius
		    #pragma Unused startAngle
		    #pragma Unused endAngle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub appendBezierPathWithArcWithCenter(center as NSPoint, radius as Single, startAngle as Single, endAngle as Single, clockwise as boolean)
		  // Appends an arc of a circle to the receiver’s path.
		  
		  // center:
		  // Specifies the center point of the circle used to define the arc.
		  // radius:
		  // Specifies the radius of the circle used to define the arc.
		  // startAngle:
		  // Specifies the starting angle of the arc, measured in degrees counterclockwise from the x-axis.
		  // endAngle:
		  // Specifies the end angle of the arc, measured in degrees counterclockwise from the x-axis.
		  // clockwise
		  // True if you want the arc to be drawn in a clockwise direction; otherwise False to draw the arc in a counterclockwise direction.
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithArcWithCenterclockwise lib Cocoalib selector "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:" _
		    (obj_ID as Ptr, center as NSPoint, radius as Single, startAngle as Single, endAngle as Single, clockwise as boolean )
		    appendBezierPathWithArcWithCenterclockwise (self, center, radius, startAngle, endAngle, clockwise)
		  #else
		    #pragma Unused center
		    #pragma Unused radius
		    #pragma Unused startAngle
		    #pragma Unused endAngle
		    #pragma Unused clockwise
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub appendBezierPathWithOvalinRect(aRect as NSRect)
		  // Appends an oval path to the receiver, inscribing the oval in the specified rectangle.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithOvalInRect lib Cocoalib selector "appendBezierPathWithOvalInRect:" (obj_ID as Ptr, aRect as NSRect)
		    appendBezierPathWithOvalInRect (self, aRect)
		  #else
		    #pragma Unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( "Not implemented" )  Sub appendBezierPathWithPackedGlyphs(aRect as NSRect)
		  // PlaceHolder, not implemented yet
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPathWithOvalInRect lib Cocoalib selector "appendBezierPathWithOvalInRect:" (obj_ID as Ptr, aRect as NSRect)
		  // appendBezierPathWithOvalInRect (self, aRect)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub appendBezierPathWithPoints(points() as NSPoint, count as integer = - 1)
		  // Appends the contents of the specified path object to the receiver’s path.
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithPoints lib Cocoalib selector "appendBezierPathWithPoints:count:" (obj_ID as Ptr, points as Ptr, count as integer)
		    
		    //set up an array we can pass
		    dim pointsarray as new NSArray ("NSPoint")
		    pointsarray = NSArray.CreateFromObjectsArray (points)
		    
		    // and add count. Check user‘s entry before so it won‘t crash (or calculate anyway if the user did not enter a count)
		    
		    dim realcount as Integer
		    if count > pointsarray.count or count < 1 then
		      realcount = pointsarray.Count
		    else
		      realcount = count
		    end if
		    
		    appendBezierPathWithPoints (self, pointsarray, realcount)
		  #else
		    #pragma Unused points
		    #pragma Unused count
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub appendBezierPathWithRect(aRect as NSRect)
		  // Appends a rectangular path to the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithRect lib Cocoalib selector "appendBezierPathWithRect:" (obj_ID as Ptr, aRect as NSRect)
		    appendBezierPathWithRect (self, aRect)
		  #else
		    #pragma Unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub appendBezierPathWithRoundedRect(aRect as NSRect, xRadius as Single, yRadius as Single)
		  // Appends a rounded rectangular path to the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithRoundedRect lib Cocoalib selector "appendBezierPathWithRoundedRect:xRadius:yRadius:" (obj_ID as Ptr, aRect as NSRect, xRadius as Single, yRadius as Single)
		    appendBezierPathWithRoundedRect (self, aRect, xRadius, yRadius)
		  #else
		    #pragma Unused aRect
		    #pragma Unused xRadius
		    #pragma Unused yRadius
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( "Not implemented" )  Sub appendBezierWithGlyph(aPath as NSBezierPath)
		  // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr)
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( "Not implemented" )  Sub appendBezierWithGlyphinFont(aPath as NSBezierPath)
		  // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr)
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( "Not implemented" )  Sub appendBezierWithGlyphs(aPath as NSBezierPath)
		  // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr)
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( "Not implemented" )  Sub appendBezierWithGlyphsinFont(aPath as NSBezierPath)
		  // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr)
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( "Not implemented" )  Sub appendBezierWithPackedGlyphs(aPath as NSBezierPath)
		  // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr)
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function bezierPath() As NSBezierPath
		  // Creates and returns a new NSBezierPath object.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPath lib Cocoalib selector "bezierPath" (id as ptr) as Ptr
		    return cocoa.NSObjectFromNSPtr (bezierPath (ClassRef), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function bezierPathByFlatteningPath() As NSBezierPath
		  // Creates and returns a “flattened” copy of the receiver.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathByFlatteningPath lib Cocoalib selector "bezierPathByFlatteningPath" (obj_ID as Ptr) as Ptr
		    dim bezierRef as Ptr = bezierPathByFlatteningPath (self)
		    return new NSBezierPath(bezierRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function bezierPathByReversingPath() As NSBezierPath
		  // Creates and returns a new NSBezierPath object with the reversed contents of the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathByReversingPath lib Cocoalib selector "bezierPathByReversingPath" (obj_ID as Ptr) as Ptr
		    dim bezierRef as Ptr = bezierPathByReversingPath (self)
		    return new NSBezierPath(bezierRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function bezierPathWithOvalInRect(aRect as NSRect) As NSBezierPath
		  // Creates and returns a new NSBezierPath object initialized with an oval path inscribed in the specified rectangle.
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathWithOvalInRect lib Cocoalib selector "bezierPathWithOvalInRect:" (obj_ID as Ptr, aRect as NSRect) as Ptr
		    dim bezierRef as Ptr = bezierPathWithOvalInRect (classref, aRect)
		    return new NSBezierPath(bezierRef)
		  #else
		    #pragma Unused aRect
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function bezierPathWithRect(aRect as NSRect) As NSBezierPath
		  // Creates and returns a new NSBezierPath object initialized with a rectangular path.
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathWithRect lib Cocoalib selector "bezierPathWithRect:" (obj_ID as Ptr, arect as nsrect) as Ptr
		    dim bezierRef as Ptr = bezierPathWithRect (classref, aRect)
		    return new NSBezierPath(bezierRef)
		  #else
		    #pragma Unused aRect
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function bezierPathWithRoundedRect(aRect as NSRect, xRadius as Single, yRadius as Single) As NSBezierPath
		  // Creates and returns a new NSBezierPath object initialized with a rounded rectangular path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathWithRoundedRect lib Cocoalib selector "bezierPathWithRoundedRect:xRadius:yRadius:" (obj_ID as Ptr, arect as nsrect, xRadius as Single, yRadius as Single) as Ptr
		    dim bezierRef as Ptr = bezierPathWithRoundedRect (classref, aRect, xRadius, yRadius)
		    return new NSBezierPath(bezierRef)
		  #else
		    #pragma Unused aRect
		    #pragma Unused xRadius
		    #pragma Unused yRadius
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function bounds() As NSRect
		  // Returns the bounding box of the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bounds lib Cocoalib selector "bounds" (obj_ID as Ptr) as NSRect
		    return bounds (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSBezierPath")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub clipRect(aRect as NSRect)
		  // Intersects the specified rectangle with the clipping path of the current graphics context and makes the resulting shape the current clipping path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub clipRect lib Cocoalib selector "clipRect:" (id as ptr, aRect as NSRect)
		    clipRect (ClassRef, aRect)
		  #else
		    #pragma Unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub closePath()
		  // Closes the most recently added subpath.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub closePath lib Cocoalib selector "closePath" (obj_ID as Ptr)
		    closePath (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  //Holding the constructor private so one can only create a Bezier with the appropriate Class methods
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function containsPoint(aPoint as NSPoint) As boolean
		  // Returns a Boolean value indicating whether the receiver contains the specified point.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function containsPoint lib Cocoalib selector "containsPoint:" (obj_ID as Ptr, aPoint as NSPoint) as boolean
		    return containsPoint (self, aPoint)
		  #else
		    #pragma Unused aPoint
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function controlPointBounds() As NSRect
		  // Returns the bounding box of the receiver’s path, including any control points.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function controlPointBounds lib Cocoalib selector "controlPointBounds" (obj_ID as Ptr) as NSRect
		    return controlPointBounds (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function currentPoint() As NSPoint
		  // Returns the receiver’s current point (the trailing point or ending point in the most recently added segment).
		  
		  
		  
		  #if TargetMacOS
		    Declare Function currentPoint lib Cocoalib selector "currentPoint" (obj_ID as Ptr) as NSPoint
		    return currentPoint (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub curveToPoint(aPoint as NSPoint, controlPoint1 as NSPoint, controlPoint2 as NSPoint)
		  // Adds a Bezier cubic curve to the receiver’s path.
		  
		  // aPoint:
		  // The destination point of the curve segment, specified in the current coordinate system
		  // controlPoint1:
		  // The point that determines the shape of the curve near the current point.
		  // controlPoint2:
		  // The point that determines the shape of the curve near the destination point.
		  
		  
		  #if TargetMacOS
		    Declare Sub curveToPoint lib Cocoalib selector "curveToPoint:controlPoint1:controlPoint2:" (obj_ID as Ptr, Apoint as NSPoint, controlPoint1 as NSPoint, controlPoint2 as NSPoint)
		    curveToPoint (self, aPoint, controlPoint1, controlPoint2)
		  #else
		    #pragma Unused aPoint
		    #pragma Unused controlPoint1
		    #pragma Unused controlPoint2
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function elementAtIndex(index as integer) As NSBezierPathElement
		  // Returns the type of path element at the specified index.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function elementAtIndex lib Cocoalib selector "elementAtIndex:" (obj_ID as Ptr, index as Integer) as NSBezierPathElement
		    return elementAtIndex (self, index)
		  #else
		    #pragma Unused index
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( "Not working yet" )  Function elementAtIndex(index as integer, byref points() as NSPoint) As NSBezierPathElement
		  // Gets the element type and (and optionally) the associated points for the path element at the specified index.
		  
		  //set up an array we can pass
		  
		  // not working yet!
		  
		  // dim pointsarray as new NSArray ("NSPoint")
		  // pointsarray = NSArray.CreateFromObjectsArray (points)
		  //
		  //
		  // #if TargetMacOS
		  // Declare Function elementAtIndex lib Cocoalib selector "elementAtIndex:associatedPoints:" (obj_ID as Ptr, points as ptr) as NSBezierPathElement
		  // dim tempElement as NSBezierPathElement = elementAtIndex (self, index, pointsarray)
		  // points = pointsarray
		  // return tempElement
		  // #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function elementCount() As Integer
		  // Returns the total number of path elements in the receiver's path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function elementCount lib Cocoalib selector "elementCount" (obj_ID as Ptr) as Integer
		    return elementCount (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub fill()
		  // Paints the region enclosed by the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub fill lib Cocoalib selector "fill" (obj_ID as Ptr)
		    fill (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub fillRect(aRect as NSRect)
		  // Fills the specified rectangular path with the current fill color.
		  
		  
		  #if TargetMacOS
		    Declare Sub fillRect lib Cocoalib selector "fillRect:" (id as ptr, aRect as NSRect)
		    fillRect (ClassRef, aRect)
		  #else
		    #pragma Unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( "not working yet!" )  Sub getLineDash(byref pattern() as single, byref count as Integer, byref Phase as single)
		  // Returns the line-stroking pattern for the receiver.
		  
		  // not working!
		  
		  dim patternarray as new memoryblock (pattern.ubound + 1 * 4)
		  dim patternpointer as ptr = patternarray
		  
		  #if TargetMacOS
		    Declare Sub getLineDash lib Cocoalib selector "getLineDash:count:phase:" (obj_ID as Ptr, byref patternpointer as Ptr, byref count as integer, byref phase as single)
		    getLineDash (self, patternpointer, count, phase)
		    patternarray = Cocoa.NSObjectFromNSPtr (patternpointer)
		    msgbox str(patternarray.Size)+", "+str(count) +", "+str(phase)
		    // pattern = returnarray
		  #else
		    #pragma Unused pattern
		    #pragma Unused Count
		    #pragma Unused Phase
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isEmpty() As Boolean
		  // Returns a Boolean value indicating whether the receiver is empty.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function isEmpty lib Cocoalib selector "isEmpty" (obj_ID as Ptr) as Boolean
		    return isEmpty (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub linetoPoint(aPoint as NSPoint)
		  // Appends a straight line to the receiver’s path
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub lineToPoint lib Cocoalib selector "lineToPoint:" (obj_ID as Ptr, aPoint as NSPoint)
		    lineToPoint (self, aPoint)
		  #else
		    #pragma Unused aPoint
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub moveToPoint(aPoint as NSPoint)
		  // Moves the receiver’s current point to the specified location.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub moveToPoint lib Cocoalib selector "moveToPoint:" (obj_ID as Ptr, Apoint as NSPoint)
		    moveToPoint (self, aPoint)
		  #else
		    #pragma Unused aPoint
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub relativeCurveToPoint(aPoint as NSPoint, controlPoint1 as NSPoint, controlPoint2 as NSPoint)
		  // Adds a Bezier cubic curve to the receiver’s path from the current point to a new location, which is specified as a relative distance from the current point.
		  
		  // aPoint:
		  // The destination point of the curve segment, specified in the current coordinate system
		  // controlPoint1:
		  // The point that determines the shape of the curve near the current point.
		  // controlPoint2:
		  // The point that determines the shape of the curve near the destination point.
		  // All points are interpreted as a relative offset from the current point.
		  
		  
		  #if TargetMacOS
		    Declare Sub relativeCurveToPoint lib Cocoalib selector "relativeCurveToPoint:controlPoint1:controlPoint2:" (obj_ID as Ptr, Apoint as NSPoint, controlPoint1 as NSPoint, controlPoint2 as NSPoint)
		    relativeCurveToPoint (self, aPoint, controlPoint1, controlPoint2)
		  #else
		    #pragma Unused aPoint
		    #pragma Unused controlPoint1
		    #pragma Unused controlPoint2
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub relativeLinetoPoint(aPoint as NSPoint)
		  // Appends a straight line segment to the receiver’s path starting at the current point and moving towards the specified point, relative to the current location.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub relativeLineToPoint lib Cocoalib selector "relativeLineToPoint:" (obj_ID as Ptr, aPoint as NSPoint)
		    relativeLineToPoint (self, aPoint)
		  #else
		    #pragma Unused aPoint
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub relativeMoveToPoint(aPoint as NSPoint)
		  // Moves the receiver’s current point to a new point whose location is the specified distance from the current point.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub relativeMoveToPoint lib Cocoalib selector "relativeMoveToPoint:" (obj_ID as Ptr, Apoint as NSPoint)
		    relativeMoveToPoint (self, aPoint)
		  #else
		    #pragma Unused aPoint
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeAllPoints()
		  // Removes all path elements from the receiver, effectively clearing the path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub removeAllPoints lib Cocoalib selector "removeAllPoints" (obj_ID as Ptr)
		    removeAllPoints (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAssociatedPoints(points() as NSPoint, atIndex as Integer)
		  // Changes the points associated with the specified path element.
		  
		  // points
		  // A C-style array containing up to three NSPoint data types. This parameter must contain the correct number of points for the path element at the specified index. Move, close path, and line segment commands require one point. Curve operations require three points.
		  // index
		  // The index of the path element you want to modify.
		  
		  
		  #if TargetMacOS
		    Declare Sub setAssociatedPoints lib Cocoalib selector "setAssociatedPoints:atIndex:" (obj_ID as Ptr, points as Ptr, atIndex as Integer)
		    
		    //set up an array we can pass
		    dim pointsarray as new NSArray ("NSPoint")
		    pointsarray = NSArray.CreateFromObjectsArray (points)
		    
		    // and add count. Check user‘s entry before so it won‘t crash (or calculate anyway if the user did not enter a count)
		    
		    setAssociatedPoints (self, pointsarray, atIndex)
		  #else
		    #pragma Unused points
		    #pragma Unused atIndex
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setClip()
		  // Replaces the clipping path of the current graphics context with the area inside the receiver's path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub setClip lib Cocoalib selector "setClip" (obj_ID as Ptr)
		    setClip (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setLineDash(pattern() as single, count as Integer, Phase as single)
		  // Sets the line-stroking pattern for the receiver.
		  
		  // pattern:
		  // A C-style array of floating point values that contains the lengths (measured in points) of the line segments and gaps in the pattern. The values in the array alternate, starting with the first line segment length, followed by the first gap length, followed by the second line segment length, and so on
		  // count:
		  // The number of values in pattern.
		  // phase:
		  // The offset at which to start drawing the pattern, measured in points along the dashed-line pattern. For example, a phase of 6 in the pattern 5-2-3-2 would cause drawing to begin in the middle of the first gap
		  
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub setLineDash lib Cocoalib selector "setLineDash:count:phase:" (obj_ID as Ptr, pattern as ptr, count as integer, phase as single)
		    
		    // create a memoryblock from pattern() to pass it to the Sub
		    
		    const sizeofsingle=4
		    dim patternCount as Integer = pattern.ubound+1
		    dim m as new MemoryBlock(patternCount * sizeOfSingle)
		    for i as integer = 0 to patternCount-1
		      m.SingleValue(i*sizeOfSingle) = pattern(i)
		    next
		    
		    setLineDash (self, m, count, phase)
		  #else
		    #pragma Unused pattern
		    #pragma Unused count
		    #pragma Unused Phase
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stroke()
		  // Draws a line along the receiver’s path using the current stroke color and drawing attributes.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub stroke lib Cocoalib selector "stroke" (obj_ID as Ptr)
		    stroke (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub strokeLine(point1 as NSPoint, point2 as NSPoint)
		  // Strokes a line between two points using the current stroke color and the default drawing attributes.
		  
		  
		  #if TargetMacOS
		    Declare Sub strokeLine lib Cocoalib selector "strokeLineFromPoint:toPoint:" (id as ptr, Point1 as NSPoint, Point2 as NSPoint)
		    strokeLine (ClassRef, point1, point2)
		  #else
		    #pragma Unused point1
		    #pragma Unused point2
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub strokeRect(aRect as NSRect)
		  // Strokes the path of the specified rectangle using the current stroke color and the default drawing attributes.
		  
		  
		  #if TargetMacOS
		    Declare Sub strokeRect lib Cocoalib selector "strokeRect:" (id as ptr, aRect as NSRect)
		    strokeRect (ClassRef, aRect)
		  #else
		    #pragma Unused aRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub transform(aTransform as Cocoa.NSAffineTransform)
		  // Transforms all points in the receiver using the specified transform.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub transformUsingAffineTransform lib Cocoalib selector "transformUsingAffineTransform:" (obj_ID as Ptr, aTransform as ptr)
		    transformUsingAffineTransform (self, aTransform)
		  #else
		    #pragma Unused aTransform
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Read Me
		This is the implementation of Cocoa.NSBezierPath. See
		https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSBezierPath_Class/Reference/Reference.html#
		
		To use it, either set up a new instance with one of the Class‘ bezierPath… shared methods
		or set the class‘ defualt properties and draw directly to the parent.
		Check the NSBezierpathwindow for some examples in the Canvas‘ paint code.
		
		The glyph functions are not yet implemented
		
		Written 2014 by Ulrich Bogun for MacOSLib
		with a lot of help from Jim McKay
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the default flatness value for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default flatness value for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultFlatness lib Cocoalib selector "defaultFlatness" (id as ptr) as single
			    return defaultFlatness (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default flatness value for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultFlatness lib Cocoalib selector "setDefaultFlatness:" (id as ptr, avalue as single)
			    setdefaultFlatness (ClassRef, value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Shared defaultFlatness As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the default Line Cap Style for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default line cap style for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultLineCapStyle lib Cocoalib selector "defaultLineCapStyle" (id as ptr) as NSLineCapStyle
			    return defaultLineCapStyle (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default Line Cap Style value for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultLineCapStyle lib Cocoalib selector "setDefaultLineCapStyle:" (id as ptr, avalue as NSLineCapStyle)
			    setDefaultLineCapStyle (ClassRef, value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Shared defaultLineCapStyle As NSLineCapStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the default line join style for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default line join style for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultLineJoinStyle lib Cocoalib selector "defaultLineJoinStyle" (id as ptr) as NSLineJoinStyle
			    return defaultLineJoinStyle (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default Line Join Style value for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultLineJoinStyle lib Cocoalib selector "setDefaultLineJoinStyle:" (id as ptr, avalue as NSLineJoinStyle)
			    setDefaultLineJoinStyle (ClassRef, value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Shared defaultLineJoinStyle As NSLineJoinStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the default line width for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default line width for the all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultLineWidth lib Cocoalib selector "defaultLineWidth" (id as ptr) as Single
			    return defaultLineWidth (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default lie width for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultLineWidth lib Cocoalib selector "setDefaultLineWidth:" (id as ptr, avalue as single)
			    setDefaultLineWidth (ClassRef, value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Shared defaultLineWidth As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Sets the default miter limit for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default miter limit for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultMiterLimit lib Cocoalib selector "defaultMiterLimit" (id as ptr) as Single
			    return defaultMiterLimit (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default miter limit for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultMiterLimit lib Cocoalib selector "setDefaultMiterLimit:" (id as ptr, avalue as single)
			    setDefaultMiterLimit (ClassRef, value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Shared defaultMiterLimit As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the winding rule used to fill all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default winding rule used to fill all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultWindingRule lib Cocoalib selector "defaultWindingRule" (id as ptr) as NSWindingRule
			    return defaultWindingRule (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default winding rule used to fill all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultWindingRule lib Cocoalib selector "setDefaultWindingRule:" (id as ptr, avalue as NSWindingRule)
			    setDefaultWindingRule (ClassRef, value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Shared defaultWindingRule As NSWindingRule
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the flatness value of the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function flatness lib Cocoalib selector "flatness" (id as ptr) as single
			    return flatness (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the flatness value for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setFlatness lib Cocoalib selector "setFlatness:" (id as ptr, avalue as single)
			    setFlatness (Self, value)
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		Flatness As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the line cap style for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function lineCapStyle lib Cocoalib selector "lineCapStyle" (id as ptr) as NSLineCapStyle
			    return lineCapStyle (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the line cap style for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setLineCapStyle lib Cocoalib selector "setLineCapStyle:" (id as ptr, avalue as NSLineCapStyle)
			    setLineCapStyle (Self, value)
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		LineCapStyle As NSLineCapStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the receiver’s line join style.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function LineJoinStyle lib Cocoalib selector "LineJoinStyle" (id as ptr) as NSLineJoinStyle
			    return LineJoinStyle (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the line join style for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setLineJoinStyle lib Cocoalib selector "setLineJoinStyle:" (id as ptr, avalue as NSLineJoinStyle)
			    setLineJoinStyle (Self, value)
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		LineJoinStyle As NSLineJoinStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the line width of the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function lineWidth lib Cocoalib selector "lineWidth" (id as ptr) as Single
			    return lineWidth (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the line width of the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setLineWidth lib Cocoalib selector "setLineWidth:" (id as ptr, avalue as single)
			    setLineWidth (Self, value)
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		LineWidth As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the miter limit of the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function miterLimit lib Cocoalib selector "miterLimit" (id as ptr) as Single
			    return miterLimit (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the miter limit for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setMiterLimit lib Cocoalib selector "setMiterLimit:" (id as ptr, avalue as single)
			    setMiterLimit (Self, value)
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		MiterLimit As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Gets the winding rule for the path. This value may be either NSNonZeroWindingRule or NSEvenOddWindingRule.
			  
			  
			  #if TargetMacOS
			    Declare Function windingRule lib Cocoalib selector "windingRule" (id as ptr) as NSWindingRule
			    return windingRule (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the winding rule used to fill the receiver’s path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setWindingRule lib Cocoalib selector "setWindingRule:" (id as ptr, avalue as NSWindingRule)
			    setWindingRule (Self, value)
			  #else
			    #pragma Unused Value
			  #endif
			End Set
		#tag EndSetter
		WindingRule As NSWindingRule
	#tag EndComputedProperty


	#tag Enum, Name = NSBezierPathElement, Type = Integer, Flags = &h0
		NSMoveToBezierPathElement
		  NSLineToBezierPathElement
		  NSCurveToBezierPathElement
		NSClosePathBezierPathElement
	#tag EndEnum

	#tag Enum, Name = NSLineCapStyle, Type = Integer, Flags = &h0
		NSButtLineCapStyle   = 0
		  NSRoundLineCapStyle  = 1
		NSSquareLineCapStyle = 2
	#tag EndEnum

	#tag Enum, Name = NSLineJoinStyle, Type = Integer, Flags = &h0
		NSMiterLineJoinStyle = 0
		  NSRoundLineJoinStyle = 1
		NSBevelLineJoinStyle = 2
	#tag EndEnum

	#tag Enum, Name = NSWindingRule, Type = Integer, Flags = &h0
		NSNonZeroWindingRule = 0
		NSEvenOddWindingRule = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flatness"
			Group="Behavior"
			Type="single"
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
			Name="LineCapStyle"
			Group="Behavior"
			Type="NSLineCapStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSButtLineCapStyle"
				"1 - NSRoundLineCapStyle"
				"2 - NSSquareLineCapStyle"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineJoinStyle"
			Group="Behavior"
			Type="NSLineJoinStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSMiterLineJoinStyle"
				"1 - NSRoundLineJoinStyle"
				"2 - NSBevelLineJoinStyle"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineWidth"
			Group="Behavior"
			Type="single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MiterLimit"
			Group="Behavior"
			Type="single"
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
		#tag ViewProperty
			Name="WindingRule"
			Group="Behavior"
			Type="NSWindingRule"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSNonZeroWindingRule"
				"1 - NSEvenOddWindingRule"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

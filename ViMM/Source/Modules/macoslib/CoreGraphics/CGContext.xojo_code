#tag Class
Class CGContext
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddArc(x as Double, y as Double, radius as Double, startAngle as Double, endAngle as Double, clockwise as Integer)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddArc lib CarbonLib (context as Ptr, x as Double, y as Double, radius as Double, startAngle as Double, endAngle as Double, clockwise as Integer)
		    
		    CGContextAddArc me, x, y, radius, startAngle, endAngle, clockwise
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddArcToPoint(x1 as Double, y1 as Double, x2 as Double, y2 as Double, radius as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddArcToPoint lib CarbonLib (context as Ptr, x1 as Double, y1 as Double, x2 as Double, y2 as Double, radius as Double)
		    
		    CGContextAddArcToPoint me, x1, y1, x2, y2, radius
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCurveToPoint(cp1x as Double, cp1y as Double, cp2x as Double, cp2y as Double, x as Double, y as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddCurveToPoint lib CarbonLib (context as Ptr, cp1x as Double, cp1y as Double, cp2x as Double, cp2y as Double, x as Double, y as Double)
		    
		    CGContextAddCurveToPoint me, cp1x, cp1y, cp2x, cp2y, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddEllipseInRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddEllipseInRect lib CarbonLib (context as Ptr, rect as CGRect)
		    
		    CGContextAddEllipseInRect me, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLines(points() as CGPoint)
		  if me = nil then
		    return
		  end if
		  
		  if UBound(points) = -1 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddLines lib CarbonLib (context as ptr, points as Ptr, count as Integer)
		    
		    CGContextAddLines me, CArray(points), 1 + UBound(points)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLineToPoint(x as Double, y as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddLineToPoint lib CarbonLib (context as Ptr, x as Double, y as Double)
		    
		    CGContextAddLineToPoint me, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPath(path as CGPath)
		  if me = nil then
		    return
		  end if
		  
		  if path = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddPath lib CarbonLib (context as Ptr, path as Ptr)
		    
		    CGContextAddPath me, path
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddQuadCurveToPoint(cpx as Double, cpy as Double, x as Double, y as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddQuadCurveToPoint lib CarbonLib (path as Ptr, cpx as Double, cpy as Double, x as Double, y as Double)
		    
		    CGContextAddQuadCurveToPoint me, cpx, cpy, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddRect lib CarbonLib (context as Ptr, rect as CGRect)
		    
		    CGContextAddRect me, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRects(rects() as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  if UBound(rects) < 0 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextAddRects lib CarbonLib (context as Ptr, rects as Ptr, count as Integer)
		    
		    CGContextAddRects me, CArray(rects), 1 + UBound(rects)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginPath()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextBeginPath lib CarbonLib (context as Ptr)
		    
		    CGContextBeginPath me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginTransparencyLayer()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextBeginTransparencyLayer lib CarbonLib (context as Ptr, auxiliaryInfo as Ptr)
		    
		    //second parameter is currently unused, according to Apple docs
		    CGContextBeginTransparencyLayer me, nil
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CFloatArray(theList() as Double) As MemoryBlock
		  if UBound(theList) = -1 then
		    return nil
		  end if
		  
		  dim theArray as new MemoryBlock(SizeOfDouble *(1 + UBound(theList)))
		  dim offset as Integer = 0
		  for i as Integer = 0 to UBound(theList)
		    theArray.DoubleValue(offset) = theList(i)
		    offset = offset + SizeOfDouble
		  next
		  
		  return theArray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGContextGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextClearRect lib CarbonLib (context as Ptr, rect as CGRect)
		    
		    CGContextClearRect me, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clip()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextClip lib CarbonLib (context as Ptr)
		    
		    CGContextClip me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ClipBoundingBox() As CGRect
		  if me = nil then
		    return CGRectNull
		  end if
		  
		  #if targetMacOS
		    soft declare function CGContextGetClipBoundingBox lib CarbonLib (context as Ptr) as CGRect
		    
		    return CGContextGetClipBoundingBox(me)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClipToMask(rect as CGRect, mask as CGImage)
		  if me = nil then
		    return
		  end if
		  
		  if mask = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextClipToMask lib CarbonLib (c as Ptr, rect as CGRect, mask as Ptr)
		    
		    CGContextClipToMask me, rect, mask
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClipToRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextClipToRect lib CarbonLib (context as Ptr, rect as CGRect)
		    
		    CGContextClipToRect me, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClipToRects(rects() as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  if UBound(rects) < 0 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextClipToRects lib CarbonLib (context as Ptr, rects as Ptr, count as Integer)
		    
		    CGContextClipToRects me, CArray(rects), 1 + UBound(rects)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClosePath()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextClosePath lib CarbonLib (context as Ptr)
		    
		    CGContextClosePath me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConcatCTM(transform as CGAffineTransform)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextConcatCTM lib CarbonLib (context as Ptr, transform as CGAffineTransform)
		    
		    CGContextConcatCTM me, transform
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToDeviceSpace(rect as Cocoa.NSRect) As Cocoa.NSRect
		  #if targetMacOS
		    soft declare function CGContextConvertRectToDeviceSpace lib CarbonLib (c as Ptr, rect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    if self <> nil then
		      return CGContextConvertRectToDeviceSpace(self, rect)
		    else
		      dim r as Cocoa.NSRect
		      return r
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToUserSpace(rect as Cocoa.NSRect) As Cocoa.NSRect
		  #if targetMacOS
		    soft declare function CGContextConvertRectToUserSpace lib CarbonLib (c as Ptr, rect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    if self <> nil then
		      return CGContextConvertRectToUserSpace(self, rect)
		    else
		      dim r as Cocoa.NSRect
		      return r
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CTM() As CGAffineTransform
		  if me = nil then
		    return CoreGraphics.CGAffineTransformIdentity
		  end if
		  
		  #if targetMacOS
		    soft declare function CGContextGetCTM lib CarbonLib (context as Ptr) as CGAffineTransform
		    
		    return CGContextGetCTM(me)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawImage(image as CGImage, rect as CGRect)
		  if image is nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    
		    soft declare sub CGContextDrawImage lib CarbonLib (context as Ptr, rect as CGRect, image as Ptr)
		    
		    CGContextDrawImage me, rect, image
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPath(mode as CGPathDrawingMode)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextDrawPath lib CarbonLib (context as Ptr, mode as CGPathDrawingMode)
		    
		    CGContextDrawPath me, mode
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPDFPage(page as CGPDFPage)
		  if me = nil then
		    return
		  end if
		  if page = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextDrawPDFPage lib CarbonLib (context as Ptr, page as Ptr)
		    
		    CGContextDrawPDFPage me, page
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawShading(shading as CGShading)
		  if me = nil then
		    return
		  end if
		  
		  if shading = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextDrawShading lib CarbonLib (context as Ptr, shading as Ptr)
		    
		    CGContextDrawShading me, shading
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndTransparencyLayer()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextEndTransparencyLayer lib CarbonLib (context as Ptr)
		    
		    CGContextEndTransparencyLayer me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EOClip()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextEOClip lib CarbonLib (context as Ptr)
		    
		    CGContextEOClip me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EOFillPath()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextEOFillPath lib CarbonLib (context as Ptr)
		    
		    CGContextEOFillPath me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillEllipseInRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextFillEllipseInRect lib CarbonLib (context as Ptr, rect as CGRect)
		    
		    CGContextFillEllipseInRect me, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillPath()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextFillPath lib CarbonLib (context as Ptr)
		    
		    CGContextFillPath me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextFillRect lib CarbonLib (context as Ptr, rect as CGRect)
		    
		    CGContextFillRect me, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillRects(rects() as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextFillRects lib CarbonLib (context as Ptr, rects as Ptr, count as Integer)
		    
		    CGContextFillRects me, CArray(rects), 1 + UBound(rects)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flush()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextFlush lib CarbonLib (context as Ptr)
		    
		    CGContextFlush me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPathEmpty() As Boolean
		  if me = nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    soft declare function CGContextIsPathEmpty lib CarbonLib (context as Ptr) as Integer
		    
		    return (CGContextIsPathEmpty(me) = 1)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToPoint(x as Double, y as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextMoveToPoint lib CarbonLib (context as Ptr, x as Double, y as Double)
		    
		    CGContextMoveToPoint me, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathBoundingBox() As CGRect
		  if me = nil then
		    return CGRectNull
		  end if
		  
		  #if targetMacOS
		    soft declare function CGContextGetPathBoundingBox lib CarbonLib (context as Ptr) as CGRect
		    
		    return CGContextGetPathBoundingBox(me)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathContainsPoint(point as CGPoint, mode as CGPathDrawingMode) As Boolean
		  if me = nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    soft declare function CGContextPathContainsPoint lib CarbonLib (context as Ptr, point as CGPoint, mode as CGPathDrawingMode) as Boolean
		    
		    return CGContextPathContainsPoint(me, point, mode)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathCurrentPoint() As CGPoint
		  if me = nil then
		    return CGPointMake(0, 0)
		  end if
		  
		  #if targetMacOS
		    soft declare function CGContextGetPathCurrentPoint lib CarbonLib (context as Ptr) as CGPoint
		    
		    return CGContextGetPathCurrentPoint(me)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplacePathWithStrokedPath()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextReplacePathWithStrokedPath lib CarbonLib (c as Ptr)
		    
		    CGContextReplacePathWithStrokedPath me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreGState()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextRestoreGState lib CarbonLib (context as Ptr)
		    
		    CGContextRestoreGState me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateCTM(angle as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextRotateCTM lib CarbonLib (context as Ptr, angle as Double)
		    
		    CGContextRotateCTM me, angle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveGState()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSaveGState lib CarbonLib (context as Ptr)
		    
		    CGContextSaveGState me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScaleCTM(sx as Double, sy as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextScaleCTM lib CarbonLib (context as Ptr, sx as Double, sy as Double)
		    
		    CGContextScaleCTM me, sx, sy
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAlpha(value as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSetAlpha lib CarbonLib (context as Ptr, alpha as Double)
		    //values outside range 0.0-1.0 are clipped, according to CGContextRef documentation.
		    CGContextSetAlpha me, value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBlendMode(mode as CGBlendMode)
		  #if targetMacOS
		    soft declare sub CGContextSetBlendMode lib CarbonLib (context as Ptr, mode as CGBlendMode)
		    
		    CGContextSetBlendMode me, mode
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFillColor(c as CGColor)
		  if me = nil then
		    return
		  end if
		  if c = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSetFillColorWithColor lib CarbonLib (context as Ptr, color as Ptr)
		    
		    CGContextSetFillColorWithColor me, c
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFillColor(c as Color, alpha as Double = 1.0)
		  #if targetMacOS
		    soft declare sub CGContextSetRGBFillColor lib CarbonLib (context as Ptr, red as Double, green as Double, blue as Double, alpha as Double)
		    
		    CGContextSetRGBFillColor me, c.Red/255, c.Green/255, c.Blue/255, alpha
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFillPattern(pattern as CGPattern, components() as Double)
		  if UBound(components) = -1 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSetFillPattern lib CarbonLib (context as Ptr, pattern as Ptr, components as Ptr)
		    
		    dim componentArray as MemoryBlock = CFloatArray(components)
		    if componentArray is nil then
		      return
		    end if
		    
		    CGContextSetFillPattern me, pattern, componentArray
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFlatness(flatness as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSetFlatness lib CarbonLib (context as Ptr, flatness as Double)
		    
		    CGContextSetFlatness me, flatness
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFont(font as CGFont)
		  if font is nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    
		    soft declare sub CGContextSetFont lib CarbonLib (context as Ptr, font as Ptr)
		    
		    CGContextSetFont me, font
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFontSize(size as Double)
		  #if TargetMacOS
		    
		    soft declare sub CGContextSetFontSize lib CarbonLib (context as Ptr, size as Double)
		    
		    CGContextSetFontSize me, size
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLineCap(cap as CGLineCap)
		  #if targetMacOS
		    soft declare sub CGContextSetLineCap lib CarbonLib (context as Ptr, size as CGLineCap)
		    
		    CGContextSetLineCap me, cap
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLineDash(phase as Double, lengths() as Double, count as UInt32)
		  #if targetMacOS
		    soft declare sub CGContextSetLineDash lib CarbonLib (phase as Double, lengths as Ptr, count as UInt32)
		    
		    if UBound(lengths) > -1 then
		      dim lengthArray as MemoryBlock = CFloatArray(lengths)
		      if lengthArray is nil then
		        return
		      end if
		      CGContextSetLineDash phase, lengthArray, count
		      
		    else
		      CGContextSetLineDash phase, nil, count
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLineJoin(join as CGLineJoin)
		  #if targetMacOS
		    soft declare sub CGContextSetLineJoin lib CarbonLib (context as Ptr, join as CGLineJoin)
		    
		    CGContextSetLineJoin me, join
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLineWidth(width as Double)
		  #if targetMacOS
		    soft declare sub CGContextSetLineWidth lib CarbonLib (context as Ptr, width as Double)
		    
		    CGContextSetLineWidth me, width
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMiterLimit(limit as Double)
		  #if targetMacOS
		    soft declare sub CGContextSetMiterLimit lib CarbonLib (context as Ptr, limit as Double)
		    
		    CGContextSetMiterLimit me, limit
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPatternPhase(phase as CGSize)
		  #if targetMacOS
		    soft declare sub CGContextSetPatternPhase lib CarbonLib (context as Ptr, phase as CGSize)
		    
		    CGContextSetPatternPhase me, phase
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRenderingIntent(intent as CGColorRenderingIntent)
		  #if targetMacOS
		    soft declare sub CGContextSetRenderingIntent lib CarbonLib (context as ptr, intent as CGColorRenderingIntent)
		    
		    CGContextSetRenderingIntent me, intent
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSAllowsAntialiasing(allowsAntialiasing as Boolean)
		  #if targetMacOS
		    soft declare sub CGContextSetAllowsAntialiasing lib CarbonLib (context as Ptr, allowsAntialiasing as Boolean)
		    
		    CGContextSetAllowsAntialiasing me, allowsAntialiasing
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetShadow(offset as CGSize, blur as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSetShadow lib CarbonLib (context as Ptr, offset as CGSize, blur as Double)
		    
		    CGContextSetShadow me, offset, blur
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetShadow(offset as CGSize, blur as Double, color as CGColor)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSetShadowWithColor lib CarbonLib (context as Ptr, offset as CGSize, blur as Double, color as Ptr)
		    
		    if color <> nil then
		      CGContextSetShadowWithColor me, offset, blur, color
		    else
		      CGContextSetShadowWithColor me, offset, blur, nil
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetShouldAntialias(shouldAntialias as Boolean)
		  #if targetMacOS
		    soft declare sub CGContextSetShouldAntialias lib CarbonLib (context as Ptr, shouldAntialias as Boolean)
		    
		    CGContextSetShouldAntialias me, shouldAntialias
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetShouldSmoothFonts(shouldSmoothFonts as Boolean)
		  #if targetMacOS
		    soft declare sub CGContextSetShouldSmoothFonts lib CarbonLib (context as Ptr, shouldSmoothFonts as Boolean)
		    
		    CGContextSetShouldSmoothFonts me, shouldSmoothFonts
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStrokeColor(c as CGColor)
		  if me = nil then
		    return
		  end if
		  if c = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSetStrokeColorWithColor lib CarbonLib (context as Ptr, color as Ptr)
		    
		    CGContextSetStrokeColorWithColor me, c
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStrokeColor(c as Color, alpha as Double = 1.0)
		  #if targetMacOS
		    soft declare sub CGContextSetRGBStrokeColor lib CarbonLib (context as Ptr, red as Double, green as Double, blue as Double, alpha as Double)
		    
		    CGContextSetRGBStrokeColor me, c.Red/255, c.Green/255, c.Blue/255, alpha
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStrokePattern(pattern as CGPattern, components() as Double)
		  if UBound(components) = -1 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextSetStrokePattern lib CarbonLib (context as Ptr, pattern as Ptr, components as Ptr)
		    
		    dim componentArray as MemoryBlock = CFloatArray(components)
		    if componentArray is nil then
		      return
		    end if
		    
		    CGContextSetStrokePattern me, pattern, componentArray
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTextMatrix(transform as CGAffineTransform)
		  #if TargetMacOS
		    declare sub CGContextSetTextMatrix lib CarbonLib (context as Ptr, transform as CGAffineTransform)
		    
		    CGContextSetTextMatrix (self, transform)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTextPosition(x as Double, y as Double)
		  #if targetMacOS
		    declare sub CGContextSetTextPosition lib CarbonLib (context as Ptr, x as Double, y as Double)
		    
		    CGContextSetTextPosition me, x, y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowText(text as String)
		  #if targetMacOS
		    soft declare sub CGContextShowText lib CarbonLib (context as Ptr, bytes as CString, length as Integer)
		    
		    CGContextShowText me, text, LenB(text)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StrokeEllipseInRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextStrokeEllipseInRect lib CarbonLib (context as Ptr, rect as CGRect)
		    
		    CGContextStrokeEllipseInRect me, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StrokeLineSegments(points() as CGPoint)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextStrokeLineSegments lib CarbonLib (c as Ptr, points as Ptr, count as Integer)
		    
		    CGContextStrokeLineSegments me, CArray(points), 1 + UBound(points)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StrokePath()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextStrokePath lib CarbonLib (context as Ptr)
		    
		    CGContextStrokePath me
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StrokeRect(rect as CGRect)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextStrokeRect lib CarbonLib (context as Ptr, rect as CGRect)
		    
		    CGContextStrokeRect me, rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StrokeRect(rect as CGRect, width as Double)
		  if me = nil then
		    return
		  end if
		  
		  if width <= 0 then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextStrokeRectWithWidth lib CarbonLib (context as Ptr, rect as CGRect, width as Double)
		    
		    CGContextStrokeRectWithWidth me, rect, width
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateCTM(tx as Double, ty as Double)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CGContextTranslateCTM lib CarbonLib (context as Ptr, tx as Double, ty as Double)
		    
		    CGContextTranslateCTM me, tx, ty
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    soft declare function CGContextGetInterpolationQuality lib CarbonLib (context as Ptr) as CGInterpolationQuality
			    
			    return CGContextGetInterpolationQuality(me)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    soft declare sub CGContextSetInterpolationQuality lib CarbonLib (context as Ptr, quality as CGInterpolationQuality)
			    
			    CGContextSetInterpolationQuality me, value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		InterpolationQuality As CGInterpolationQuality
	#tag EndComputedProperty


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
			Name="InterpolationQuality"
			Group="Behavior"
			Type="CGInterpolationQuality"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - Low"
				"3 - High"
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

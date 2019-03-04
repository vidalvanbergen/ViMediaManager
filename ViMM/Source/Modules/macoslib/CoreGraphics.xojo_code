#tag Module
Protected Module CoreGraphics
	#tag Method, Flags = &h1
		Protected Function CArray(points() as CGPoint) As MemoryBlock
		  dim pointsArray as new MemoryBlock(CGPoint.Size*(1 + UBound(points)))
		  dim offset as Integer = 0
		  for i as Integer = 0 to UBound(points)
		    pointsArray.StringValue(offset, CGPoint.Size) = points(i).StringValue(TargetLittleEndian)
		    offset = offset + CGPoint.Size
		  next
		  return pointsArray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CArray(rects() as CGRect) As MemoryBlock
		  dim rectsArray as new MemoryBlock(CGRect.Size*(1 + UBound(rects)))
		  dim offset as Integer = 0
		  for i as Integer = 0 to UBound(rects)
		    rectsArray.StringValue(offset, CGRect.Size) = rects(i).StringValue(TargetLittleEndian)
		    offset = offset + CGRect.Size
		  next
		  return rectsArray
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformConcat Lib "Carbon.framework" (t1 as CGAffineTransform, t2 as CGAffineTransform) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformEqualToTransform Lib "Carbon.framework" (t1 as CGAffineTransform, t2 as CGAffineTransform) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CGAffineTransformIdentity() As CGAffineTransform
		  dim carbon as CFBundle = Carbon.Bundle
		  if carbon is nil then
		    dim oops as CGAffineTransform
		    return oops
		  end if
		  
		  dim p as Ptr = carbon.DataPointerNotRetained("CGAffineTransformIdentity")
		  if p = nil then
		    dim oops as CGAffineTransform
		    return oops
		  end if
		  
		  dim t as CGAffineTransform = p.CGAffineTransform(0)
		  return t
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformInvert Lib "Carbon.framework" (t as CGAffineTransform) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformIsIdentity Lib "Carbon.framework" (t as CGAffineTransform) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformMake Lib "Carbon.framework" (a as Double, b as Double, c as Double, d as Double, tx as Double, ty as Double) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformMakeRotation Lib "Carbon.framework" (angle as Double) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformMakeScale Lib "Carbon.framework" (sx as Double, sy as Double) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformMakeTranslation Lib "Carbon.framework" (tx as Double, ty as Double) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformRotate Lib "Carbon.framework" (t as CGAffineTransform, angle as Double) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformScale Lib "Carbon.framework" (t as CGAffineTransform, sx as Double, sy as Double) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGAffineTransformTranslate Lib "Carbon.framework" (t as CGAffineTransform, tx as Double, ty as Double) As CGAffineTransform
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGPointApplyAffineTransform Lib "Carbon.framework" (point as CGPoint, t as CGAffineTransform) As CGPoint
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGPointEqualToPoint Lib "Carbon.framework" (point1 as CGPoint, point2 as CGPoint) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CGPointMake(x as Double, y as Double) As CGPoint
		  dim pt as CGPoint
		  pt.x = x
		  pt.y = y
		  return pt
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CGPointOffset(pt as CGPoint, xOffset as Double, yOffset as Double) As CGPoint
		  // moves the CGPoint by the given offsets
		  
		  pt.x = pt.x + xOffset
		  pt.y = pt.y + yOffset
		  return pt
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectApplyAffineTransform Lib "Carbon.framework" (rect as CGRect, t as CGAffineTransform) As CGRect
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectContainsPoint Lib "Carbon.framework" (rect as CGRect, point as CGPoint) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectContainsRect Lib "Carbon.framework" (rect1 as CGRect, rect2 as CGRect) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Sub CGRectDivide Lib "Carbon.framework" (rect as CGRect, ByRef slice as CGRect, ByRef remainder as CGRect, amount as Double, edge as CGRectEdge)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectEqualToRect Lib "Carbon.framework" (rect1 as CGRect, rect2 as CGRect) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CGRectInfinite() As CGRect
		  dim carbon as CFBundle = Carbon.Bundle
		  if carbon is nil then
		    dim oops as CGRect
		    return oops
		  end if
		  
		  dim p as Ptr = carbon.DataPointerNotRetained("CGRectInfinite")
		  if p = nil then
		    dim oops as CGRect
		    return oops
		  end if
		  
		  return p.CGRect(0)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectInset Lib "Carbon.framework" (rect as CGRect, dx as Double, dy as Double) As CGRect
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectIntegral Lib "Carbon.framework" (rect as CGRect) As CGRect
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectIntersection Lib "Carbon.framework" (rect1 as CGRect, rect2 as CGRect) As CGRect
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectIntersectsRect Lib "Carbon.framework" (rect1 as CGRect, rect2 as CGRect) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectIsEmpty Lib "Carbon.framework" (rect as CGRect) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectIsInfinite Lib "Carbon.framework" (rect as CGRect) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectIsNull Lib "Carbon.framework" (rect as CGRect) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CGRectMake(x as Double, y as Double, width as Double, height as Double) As CGRect
		  dim rect as CGRect
		  rect.origin = CGPointMake(x, y)
		  rect.rectSize = CGSizeMake(width, height)
		  return rect
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CGRectNull() As CGRect
		  dim carbon as CFBundle = Carbon.Bundle
		  if carbon is nil then
		    dim oops as CGRect
		    return oops
		  end if
		  
		  dim p as Ptr = carbon.DataPointerNotRetained("CGRectNull")
		  if p = nil then
		    dim oops as CGRect
		    return oops
		  end if
		  
		  return p.CGRect(0)
		  
		  //note that this is not the same as an empty rect; see CGGeometry.h
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectOffset Lib "Carbon.framework" (rect as CGRect, dx as Double, dy as Double) As CGRect
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectStandardize Lib "Carbon.framework" (rect as CGRect) As CGRect
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGRectUnion Lib "Carbon.framework" (r1 as CGRect, r2 as CGRect) As CGRect
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGSizeApplyAffineTransform Lib "Carbon.framework" (size as CGSize, t as CGAffineTransform) As CGSize
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function CGSizeEqualToSize Lib "Carbon.framework" (size1 as CGSize, size2 as CGSize) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CGSizeMake(width as Double, height as Double) As CGSize
		  dim size as CGSize
		  size.width = width
		  size.height = height
		  return size
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Constant, Name = kCGBitmapAlphaInfoMask, Type = Double, Dynamic = False, Default = \"&h1F", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGBitmapByteOrder16Big, Type = Double, Dynamic = False, Default = \"12288", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGBitmapByteOrder16Little, Type = Double, Dynamic = False, Default = \"4096", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGBitmapByteOrder32Big, Type = Double, Dynamic = False, Default = \"16384", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGBitmapByteOrder32Little, Type = Double, Dynamic = False, Default = \"8192", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGBitmapByteOrderDefault, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGBitmapByteOrderMask, Type = Double, Dynamic = False, Default = \"&h7000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGBitmapFloatComponents, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGImageAlphaFirst, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGImageAlphaLast, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGImageAlphaNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGImageAlphaNoneSkipFirst, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGImageAlphaNoneSkipLast, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGImageAlphaPremultipliedFirst, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGImageAlphaPremultipliedLast, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CGAffineTransform, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		a as Double
		  b as Double
		  c as Double
		  d as Double
		  tx as Double
		ty as Double
	#tag EndStructure

	#tag Structure, Name = CGFunctionCallbacks, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		version as Integer
		  evaluate as Ptr
		releaseInfo as Ptr
	#tag EndStructure

	#tag Structure, Name = CGPathElement, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
	#tag EndStructure

	#tag Structure, Name = CGPatternCallbacks, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		version as Integer
		  drawPattern as Ptr
		releaseInfo as Ptr
	#tag EndStructure

	#tag Structure, Name = CGPoint, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		x as Double
		y as Double
	#tag EndStructure

	#tag Structure, Name = CGRect, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		origin as CGPoint
		rectSize as CGSize
	#tag EndStructure

	#tag Structure, Name = CGSize, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		width as Double
		height as Double
	#tag EndStructure


	#tag Enum, Name = CGBlendMode, Flags = &h0
		Normal
		  Multiply
		  Screen
		  Overlay
		  Darken
		  Lighten
		  ColorDodge
		  ColorBurn
		  SoftLight
		  HardLight
		  Difference
		  Exclusion
		  Hue
		  Saturation
		  Color
		Luminosity
	#tag EndEnum

	#tag Enum, Name = CGColorRenderingIntent, Flags = &h0
		Default
		  AbsoluteColorimetric
		  RelativeColorimetric
		  Perceptual
		Saturation
	#tag EndEnum

	#tag Enum, Name = CGFontPostScriptFormat, Flags = &h0
		Type1 = 1
		  Type3 = 3
		Type42 = 42
	#tag EndEnum

	#tag Enum, Name = CGInterpolationQuality, Flags = &h0
		Default
		  None
		  Low
		High
	#tag EndEnum

	#tag Enum, Name = CGLineCap, Flags = &h0
		Butt
		  Round
		Square
	#tag EndEnum

	#tag Enum, Name = CGLineJoin, Flags = &h0
		Miter
		  Round
		Bevel
	#tag EndEnum

	#tag Enum, Name = CGPathDrawingMode, Flags = &h0
		Fill
		  EOFill
		  Stroke
		  FillStroke
		EOFillStroke
	#tag EndEnum

	#tag Enum, Name = CGPathElementType, Flags = &h0
		MoveToPoint
		  AddLineToPoint
		  AddQuadCurveToPoint
		  AddCurveToPoint
		CloseSubpath
	#tag EndEnum

	#tag Enum, Name = CGPatternTiling, Flags = &h0
		NoDistortion
		  ConstantSpacingMinimalDistortion
		ConstantSpacing
	#tag EndEnum

	#tag Enum, Name = CGPDFBox, Flags = &h0
		Media
		  Crop
		  Bleed
		  Trim
		Art
	#tag EndEnum

	#tag Enum, Name = CGRectEdge, Flags = &h0
		MinXEdge
		  MinYEdge
		  MaxXEdge
		MaxYEdge
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

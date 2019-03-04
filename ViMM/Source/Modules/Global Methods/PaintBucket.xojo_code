#tag Module
Protected Module PaintBucket
	#tag Method, Flags = &h0
		Sub DrawGradient(Extends g as Graphics, StartColor as Color, EndColor as Color, Left as Integer, Top as Integer, Width as Integer, Height as Integer)
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  Dim Ratio, EndRatio as Double
		  
		  // DrawGradient
		  For i as Integer = 0 to Height
		    Ratio = ( Height - i ) / Height
		    EndRatio = i / Height
		    
		    g.ForeColor = RGB( _
		    EndColor.Red   * EndRatio + StartColor.Red   * Ratio, _
		    EndColor.Green * EndRatio + StartColor.Green * Ratio, _
		    EndColor.Blue  * EndRatio + StartColor.Blue  * Ratio, _
		    EndColor.Alpha * EndRatio + StartColor.Alpha * Ratio )
		    
		    g.DrawLine _
		    Left, _
		    Top + i, _
		    Left + Width - 1, _
		    Top + i
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawGradientVertical(Extends g as Graphics, StartColor as Color, EndColor as Color, Left as Integer, Top as Integer, Width as Integer, Height as Integer)
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  Dim Ratio, EndRatio as Double
		  
		  // DrawGradient
		  For i as Integer = 0 to Width
		    Ratio = ( Width - i ) / Width
		    EndRatio = i / Width
		    
		    g.ForeColor = RGB( _
		    EndColor.Red   * EndRatio + StartColor.Red   * Ratio, _
		    EndColor.Green * EndRatio + StartColor.Green * Ratio, _
		    EndColor.Blue  * EndRatio + StartColor.Blue  * Ratio, _
		    EndColor.Alpha * EndRatio + StartColor.Alpha * Ratio )
		    
		    g.DrawLine _
		    Left + i, _
		    Top, _
		    Left + i, _
		    Top + Height - 1
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawStringShadow(Extends g as Graphics, Textcolor as Color, Shadowcolor as Color, Text as String, x as Integer, y as Integer, Width as Integer = 0, Condense as Boolean = False)
		  
		  g.ForeColor = Shadowcolor
		  g.DrawString( Text, x, y + 1, Width, Condense )
		  
		  g.ForeColor = Textcolor
		  g.DrawString( Text, x, y, Width, Condense )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FlipImageHorizontal(P as Picture) As Picture
		  Dim pic as picture
		  Dim x, y, x2 as Integer
		  Dim picS, maskS, picS2, maskS2 as RGBSurface
		  
		  pic    = New Picture( p.width, p.height, p.depth)
		  picS   = p.rgbSurface
		  maskS  = p.mask.rgbSurface
		  picS2  = pic.rgbSurface
		  maskS2 = pic.mask.rgbSurface
		  
		  For x = p.width-1 downTo 0
		    For y = p.height-1 downTo 0
		      picS2.Pixel(x,y) =  picS.Pixel(x2,y)
		      maskS2.Pixel(x,y) = maskS.Pixel(x2,y)
		    next
		    x2=x2+1
		  next
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FlipImageVertical(P as Picture) As Picture
		  Dim pic as picture
		  Dim x, y, y2 as Integer
		  Dim picS, maskS, picS2, maskS2 as RGBSurface
		  
		  pic    = New Picture( p.width, p.height, p.depth )
		  picS   = p.rgbSurface
		  maskS  = p.mask.rgbSurface
		  picS2  = pic.rgbSurface
		  maskS2 = pic.mask.rgbSurface
		  
		  For y = p.height-1 downTo 0
		    For x = p.width-1 downTo 0
		      picS2.Pixel(x,y) =  picS.Pixel(x,y2)
		      maskS2.Pixel(x,y) = maskS.Pixel(x,y2)
		    next
		    y2=y2+1
		  next
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GrayScale(Extends Old_p as Picture) As Picture
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  If Old_p = Nil Then Return Nil
		  
		  Dim width, height As integer
		  Dim c as color
		  Dim gray as integer
		  
		  Dim New_p as picture
		  Dim New_RGB as RGBSurface
		  Dim Old_RGB as RGBSurface
		  width = Old_p.Graphics.Width
		  height = Old_p.Graphics.height
		  
		  // -- GrayScale Image
		  New_p = New Picture( width, height, 32 )
		  New_p.Graphics.drawpicture( old_p, 0, 0 )
		  New_RGB = New_p.RGBSurface
		  Old_RGB = Old_p.RGBSurface
		  
		  For y as uInt16 = 0 to height
		    For x as uInt16 = 0 to width
		      c = Old_RGB.Pixel( x, y )
		      gray = ( c.red * 0.2989 ) + ( c.green * 0.5870 ) + ( c.blue * .114 )
		      New_RGB.pixel( x, y ) = RGB( gray, gray, gray )
		    Next
		  Next
		  
		  New_p.Mask = Old_p.Mask
		  
		  Return New_p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HSL(h as Double, s as Double, l as Double) As Color
		  Return HSLa( h, s, l, 100 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HSLa(Hue as Double, Saturation as Double, Lightness as Double, Alpha as Double = 1) As Color
		  Dim Red, Green, Blue as Double
		  
		  Hue = Hue / 360
		  Saturation = Saturation / 100
		  Lightness = Lightness / 100
		  Alpha = ( 100 - Alpha ) / 100
		  
		  If Saturation = 0 Then
		    Red   = Lightness
		    Green = Lightness
		    Blue  = Lightness
		  Else
		    Dim q, p as Double
		    If Lightness < 0.5 Then
		      q = ( Lightness * ( 1 + Saturation ) )
		    Else
		      q = ( Lightness + Saturation - Lightness * Saturation )
		    End If
		    p = 2 * Lightness - q
		    
		    Red   = Hue2RGB( p, q, Hue + 1/3 )
		    Green = Hue2RGB( p, q, Hue )
		    Blue  = Hue2RGB( p, q, Hue - 1/3 )
		  End If
		  
		  Return RGB( Red * 255, Green * 255, Blue * 255, Alpha * 255 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Hue2RGB(p as Double, q as Double, t as Double) As Double
		  If t < 0 Then t = t + 1
		  If t > 1 Then t = t - 1
		  If t < 1/6 Then Return ( p + ( q - p ) * 6 * t )
		  If t < 1/2 Then Return ( q )
		  If t < 2/3 Then Return ( p + ( q - p ) * (2/3 - t) * 6 )
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IconTemplateSetGradient(Extends Icon as Picture, StartColor as Color, EndColor as Color) As Picture
		  
		  Dim pic, mask as Picture
		  pic = new Picture(icon.Width, icon.Height, 32)
		  mask = new Picture(icon.Width, icon.Height, 8)
		  
		  mask.Graphics.DrawPicture icon, 0, 0
		  
		  pic.Graphics.DrawGradient( StartColor, EndColor, 0, 0, pic.Width, pic.Height )
		  pic.Mask(true).graphics.drawpicture mask, 0, 0
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IconTemplateSetGradient(Icon as Picture, StartColor as Color, EndColor as Color) As Picture
		  Dim pic, mask as Picture
		  pic = new Picture(icon.Width, icon.Height, 32)
		  mask = new Picture(icon.Width, icon.Height, 8)
		  
		  mask.Graphics.DrawPicture icon, 0, 0
		  
		  pic.Graphics.DrawGradient( StartColor, EndColor, 0, 0, pic.Width, pic.Height )
		  pic.Mask(true).graphics.drawpicture mask, 0, 0
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IconTemplateSetGradient1(Extends Icon as Picture, StartColor as Color, EndColor as Color) As Picture
		  Return IconTemplateSetGradient(Icon, StartColor, EndColor)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RGB2HSL(R as Double, G as Double, B as Double) As Double()
		  r = r / 255
		  g = g / 255
		  b = b / 255
		  
		  Dim valMax as Double = Max( r, g, b )
		  Dim valMin as Double = Min( r, g, b )
		  
		  Dim h, s, l as Double = ( valMax + valMin ) / 2
		  
		  If valMax = valMin Then
		    h = 0
		    s = 0
		  Else
		    
		    Dim d as Double = valMax - valMin
		    
		    If l > 0.5 Then
		      s = d / ( 2 - valMax - valMin )
		    Else
		      s = d / ( valMax + valMin )
		    End If
		    
		    Select Case( valMax )
		      
		    Case r
		      h = (g -b) / d
		      If g < b Then h = h + 6
		      
		    Case g
		      h = (b - r) / d + 2
		      
		    Case b
		      h = (r - g) / d + 4
		      
		    End Select
		    h = h / 6
		    
		  End If
		  
		  Return Array( h * 360, s * 100, l * 100 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RGBa(Red as Integer, Green as Integer, Blue as Integer, Alpha as Double = 1) As Color
		  Alpha = 1 - Alpha
		  Return RGB( ( Red / 100 ) * 255, ( Green / 100 ) * 255, ( Blue / 100 ) * 255, Alpha * 255 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RotateImage90Deg(p as Picture) As Picture
		  Dim pic as Picture
		  Dim x, y, y2, w, h as Integer
		  Dim picS, maskS, picS2, maskS2 as RGBSurface
		  
		  pic = New Picture( p.width, p.height, p.depth )
		  
		  picS = p.RGBSurface
		  maskS = p.Mask.RGBSurface
		  picS2 = pic.RGBSurface
		  maskS2 = pic.Mask.RGBSurface
		  
		  w = p.Width - 1
		  h = p.Height - 1
		  
		  For x = 0 To w
		    For y = 0 to h
		      picS2.Pixel( y, x )  = picS.Pixel(  w - x, y )
		      maskS2.Pixel( y, x ) = maskS.Pixel( w - x, y )
		    next
		  next
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScaledDim(Pic as Picture, Width as Integer, Height as Integer, Length as Boolean = True, Upscale as Boolean = False) As Double
		  If Pic = Nil Then Return -1
		  
		  Dim Factor as Double = Min( Width / Pic.Width, Height / Pic.Height )
		  If NOT UpScale Then Factor = Min( Factor, 1.0 )
		  
		  'Dim Image as New Picture ( Pic.Width * Factor, Pic.Height * Factor, 32 )
		  
		  If Length Then
		    Return Pic.Width * Factor
		  Else
		    Return Pic.Height * Factor
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScaleImage(Extends g as Graphics, Pic as Picture, Width as Integer, Height as Integer, Left as Integer = 0, Top as Integer = 0, ScaleWidth as Boolean = False, ScaleHeight as Boolean = True, Upscale as Boolean = False)
		  'Dim ScaledPic as Picture
		  'Dim Factor as Double
		  'If Pic = Nil Then Return
		  '
		  'If NOT ScaleHeight AND ScaleWidth then
		  'Factor = Min( Width / pic.Width, pic.Height ) // Only scale width wise
		  'ElseIf NOT ScaleWidth AND ScaleHeight then
		  'Factor = Min( pic.Width, Height / pic.Height ) // Only scale height wise
		  'ElseIf ScaleWidth and ScaleHeight then
		  'Factor = Min( Width / pic.Width, Height / pic.Height ) // Scale both
		  'End if
		  '
		  'If NOT UpScale Then Factor = Min( Factor, 1.0 )
		  '
		  'ScaledPic  = New Picture( pic.Width * Factor, pic.Height * Factor, 32 )
		  ''ScaledPic.Graphics.DrawPicture      pic,      0, 0, ScaledPic.Width, ScaledPic.Height,   0, 0, pic.Width, pic.Height
		  ''ScaledPic.Mask.Graphics.DrawPicture pic.Mask, 0, 0, ScaledPic.Mask.Width, ScaledPic.Mask.Height,   0, 0, pic.Mask.Width, pic.Mask.Height
		  '
		  ''Return ScaledPic
		  '
		  'g.DrawPicture Pic, Left, Top, ScaledPic.Width, ScaledPic.Height,  0, 0, Pic.Width, Pic.Height
		  
		  If Pic = Nil Then Return
		  
		  Dim Factor as Double = Min( Width / Pic.Width, Height / Pic.Height )
		  If NOT UpScale Then Factor = Min( Factor, 1.0 )
		  
		  Dim nWidth as Double = Pic.Width * Factor
		  Dim nHeight as Double = Pic.Height * Factor
		  
		  If nWidth.InRange() And nHeight.InRange() Then
		    'Dim Image as New Picture ( Pic.Width * Factor, Pic.Height * Factor, 32 )
		    g.DrawPicture Pic, Left, Top, nWidth, nHeight, 0, 0, Pic.Width, Pic.Height
		  Else
		    g.DrawPicture Pic, left, top, Pic.width, Pic.height
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScaleImage(pic as Picture, Width As Integer, Height As Integer, UpScale As Boolean = False, ScaleWidth As Boolean = True, ScaleHeight As Boolean = True) As Picture
		  Dim ScaledPic as Picture
		  Dim Factor as Double
		  If pic = Nil then Return Nil
		  
		  If NOT ScaleHeight AND ScaleWidth then
		    Factor = Min( Width / pic.Width, pic.Height ) // Only scale width wise
		  ElseIf NOT ScaleWidth AND ScaleHeight then
		    Factor = Min( pic.Width, Height / pic.Height ) // Only scale height wise
		  ElseIf ScaleWidth and ScaleHeight then
		    Factor = Min( Width / pic.Width, Height / pic.Height ) // Scale both
		  End if
		  
		  If NOT UpScale Then Factor = Min( Factor, 1.0 )
		  
		  Dim nWidth as Double = Pic.Width * Factor
		  Dim nHeight as Double = Pic.Height * Factor
		  
		  If nWidth.InRange() And   nHeight.InRange() Then
		    ScaledPic  = New Picture( nWidth, nHeight, 32 )
		  Else
		    Return pic
		  End If
		  'ScaledPic.Transparent = 1
		  
		  ScaledPic.Graphics.DrawPicture      pic,      0, 0, ScaledPic.Width,      ScaledPic.Height,        0, 0, pic.Width,      pic.Height
		  if pic.Mask <> Nil then
		    ScaledPic.Mask.Graphics.DrawPicture pic.Mask, 0, 0, ScaledPic.Mask.Width, ScaledPic.Mask.Height,   0, 0, pic.Mask.Width, pic.Mask.Height
		  else
		    dim n as String
		  end if
		  
		  Return ScaledPic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Adjust_hue(c as Color, value as Double) As Color
		  Dim MyD() as Double = RGB2HSL( c.Red, c.Green, c.Blue )
		  
		  Return HSLa( MyD(0) + value, MyD(1), MyD(2), ( 254 - c.alpha ) / 254 * 100 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Complement(c as Color) As Color
		  Return _Adjust_hue( c, -180 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Darken(c as Color, value as Double) As Color
		  
		  If value < 1 Then value = value * 100
		  
		  Dim MyD() as Double = RGB2HSL( c.Red, c.Green, c.Blue )
		  
		  Return HSLa( MyD(0), MyD(1), MyD(2) - value, ( 254 - c.alpha ) / 254 * 100 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Desaturate(c as Color, value as Double) As Color
		  
		  If value < 1 Then value = value * 100
		  
		  Dim MyD() as Double = RGB2HSL( c.Red, c.Green, c.Blue )
		  
		  Return HSLa( MyD(0), MyD(1) - value, MyD(2), ( 254 - c.alpha ) / 254 * 100 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Grayscale(c as Color) As Color
		  Return _Desaturate( c, 100 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Invert(c as Color) As Color
		  Return RGB( 255 - c.Red, 255 - c.Green, 255 - c.Blue, 254 - c.Alpha )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Lighten(c as Color, value as Double) As Color
		  
		  If value < 1 Then value = value * 100
		  
		  Dim MyD() as Double = RGB2HSL( c.Red, c.Green, c.Blue )
		  
		  Return HSLa( MyD(0), MyD(1), MyD(2) + value, ( 254 - c.alpha ) / 254 * 100 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Opacify(c as Color, Value as Double) As Color
		  Return RGB( c.Red, c.Green, c.Blue, 254 - ( ( 254 - c.Alpha ) + ( ( Value / 100 ) * 254 ) ) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Saturate(c as Color, value as Double) As Color
		  
		  If value < 1 Then value = value * 100
		  
		  Dim MyD() as Double = RGB2HSL( c.Red, c.Green, c.Blue )
		  
		  Return HSLa( MyD(0), MyD(1) + value, MyD(2), ( 254 - c.alpha ) / 254 * 100 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Transparentize(c as Color, Value as Double) As Color
		  Return RGB( c.Red, c.Green, c.Blue, 254 - ( ( 254 - c.Alpha ) - ( ( Value / 100 ) * 254 ) ) )
		End Function
	#tag EndMethod


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

#tag Class
Class CGBitmapContext
Inherits CGContext
	#tag Method, Flags = &h0
		Function ColorSpace() As CGColorSpace
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGBitmapContextGetColorSpace lib CarbonLib (c as Ptr) as Ptr
		    
		    return new CGColorSpace(CGBitmapContextGetColorSpace(me), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(width as Integer, height as Integer, colorspace as CGColorSpace = nil, bitsPerPixel as Integer = 32, bitsPerComponent as Integer = 8, bitmapInfo as Integer = 0)
		  #if targetMacOS
		    soft declare function CGBitmapContextCreate lib CarbonLib (data as Ptr, width as Integer, height as Integer, bitsPerComponent as Integer, bytesPerRow as Integer, colorspace as Ptr, bitmapInfo as UInt32) as Ptr
		    
		    if colorspace is nil then
		      colorspace = CGColorspace.CreateWithName(CGColorSpace.ColorSpaceGenericRGB)
		    end if
		    
		    dim bytesPerRow as Integer = width*bitsPerComponent\8
		    me.Data = new MemoryBlock(bytesPerRow*height)
		    super.Constructor CGBitmapContextCreate(me.Data, width, height, bitsPerComponent, bytesPerRow, colorspace, bitmapInfo), true
		    
		  #else
		    #pragma unused width
		    #pragma unused height
		    #pragma unused colorSpace
		    #pragma unused bitsPerComponent
		    #pragma unused bitmapInfo
		  #endif
		  
		  
		  //the bitmapInfo parameter is set using one of the Coregraphics.kCGImageAlpha* constants plus the CoreGraphics.kCGBitmapByteOrder* constants.   The default value here is kCGImageAlphaNone.
		  
		  #pragma unused bitsPerPixel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyImage() As CGImage
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGBitmapContextCreateImage lib CarbonLib (c as Ptr) as Ptr
		    
		    dim image as new CGImage (CGBitmapContextCreateImage(me), true)
		    return image
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGBitmapContextGetAlphaInfo lib CarbonLib (c as Ptr) as Integer
			    
			    return CGBitmapContextGetAlphaInfo(me)
			  #endif
			End Get
		#tag EndGetter
		AlphaInfo As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGBitmapContextGetBitmapInfo lib CarbonLib (c as Ptr) as Integer
			    
			    return CGBitmapContextGetBitmapInfo(me)
			  #endif
			End Get
		#tag EndGetter
		BitmapInfo As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGBitmapContextGetBitsPerComponent lib CarbonLib (c as Ptr) as Integer
			    
			    return CGBitmapContextGetBitsPerComponent(me)
			  #endif
			End Get
		#tag EndGetter
		BitsPerComponent As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGBitmapContextGetBitsPerPixel lib CarbonLib (c as Ptr) as Integer
			    
			    return CGBitmapContextGetBitsPerPixel(me)
			  #endif
			End Get
		#tag EndGetter
		BitsPerPixel As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGBitmapContextGetBytesPerRow lib CarbonLib (c as Ptr) as Integer
			    
			    return CGBitmapContextGetBytesPerRow(me)
			  #endif
			End Get
		#tag EndGetter
		BytesPerRow As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Data As MemoryBlock
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGBitmapContextGetHeight lib CarbonLib (c as Ptr) as Integer
			    
			    return CGBitmapContextGetHeight(me)
			  #endif
			End Get
		#tag EndGetter
		Height As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGBitmapContextGetWidth lib CarbonLib (c as Ptr) as Integer
			    
			    return CGBitmapContextGetWidth(me)
			  #endif
			End Get
		#tag EndGetter
		Width As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlphaInfo"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BitmapInfo"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BitsPerComponent"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BitsPerPixel"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesPerRow"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

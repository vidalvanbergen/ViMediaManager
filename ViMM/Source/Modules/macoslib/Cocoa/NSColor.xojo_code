#tag Class
Class NSColor
Inherits NSObject
	#tag Method, Flags = &h0
		Function AlphaComponent() As Double
		  //# Returns the NSColor's alpha (opacity) component.
		  
		  //@discussion: The alpha component of the color object. If the NSColor has no alpha component, this is 1.0 (opaque).
		  
		  #if targetMacOS
		    declare function alphaComponent lib CocoaLib selector "alphaComponent" (id as Ptr) as Double
		    
		    return alphaComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AlternateSelectedControlColor() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_alternateSelectedControlColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AlternateSelectedControlTextColor() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_alternateSelectedControlTextColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Black() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_blackColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlackComponent() As Double
		  //# Returns the NSColor's black component.
		  
		  //@discussion: This method works only with objects representing colors in the NSDeviceCMYKColorSpace color space. Sending it to other objects raises an exception.
		  
		  #if targetMacOS
		    declare function blackComponent lib CocoaLib selector "blackComponent" (id as Ptr) as Double
		    
		    return blackComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlendedColor(fraction as Double, aColor as NSColor) As NSColor
		  //# Creates and returns an NSColor object whose component values are a weighted sum of the NSColor’s and the specified color object's.
		  
		  //@param fraction: The amount of the color to blend with the NSColor's color. The method converts color and a copy of the NSColor to RGB, and then sets each component of the returned color to fraction of color’s value plus 1 – fraction of the NSColor’s.
		  //@param aColor: The color to blend with the NSColor's color.
		  
		  //@result NSColor: The resulting color object or nil if the colors can’t be converted.
		  
		  
		  #if targetMacOS
		    declare function blendedColorWithFraction lib CocoaLib selector "blendedColorWithFraction:ofColor:" (id as Ptr, fraction as Double, aColor as Ptr) as Ptr
		    
		    dim aColorRef as Ptr
		    if aColor <> nil then
		      aColorRef = aColor
		    end if
		    
		    dim colorRef as Ptr = blendedColorWithFraction(self, fraction, aColorRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fraction
		    #pragma unused aColor
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Blue() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_blueColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlueComponent() As Double
		  //# Returns the NSColor's Blue component.
		  
		  #if targetMacOS
		    declare function blueComponent lib CocoaLib selector "blueComponent" (id as Ptr) as Double
		    
		    return blueComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BrightnessComponent() As Double
		  //# Returns the brightness component of the HSB color equivalent to the NSColor.
		  
		  //@return Single: The color object's brightness component.
		  
		  //@discussion: This method works only with objects representing colors in the NSCalibratedRGBColorSpace or NSDeviceRGBColorSpace color space. Sending it to other objects raises an exception.
		  
		  #if targetMacOS
		    declare function brightnessComponent lib CocoaLib selector "brightnessComponent" (id as Ptr) as Double
		    
		    return brightnessComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Brown() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_brownColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CatalogColor(listName as String, colorName as String) As NSColor
		  //# Creates and returns an NSColor object by finding the color with the specified name in the given catalog.
		  
		  #if targetMacOS
		    declare function colorWithCatalogName lib CocoaLib selector "colorWithCatalogName:colorName:" _
		    (id as Ptr, listName as CFStringRef, colorName as CFStringRef) as Ptr
		    
		    dim colorRef as Ptr = colorWithCatalogName(ClassRef, listName, colorName)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused listName
		    #pragma unused colorName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CatalogNameComponent() As String
		  //# Returns the name of the catalog containing the NSColor's name.
		  
		  //@result NSString: The name of the catalog containing the color object.
		  //@discussion: This method raises an exception if the NSColor’s color space isn’t NSNamedColorSpace.
		  
		  #if targetMacOS
		    declare function catalogNameComponent lib CocoaLib selector "catalogNameComponent" (id as Ptr) as CFStringRef
		    
		    return catalogNameComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function ClassMethodDelegate(class_id as Ptr) As Ptr
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSColor")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Clear() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_clearColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorFromPasteboard(pasteBoard as NSPasteboard) As NSColor
		  //# Returns the NSColor currently on the given pasteboard.
		  
		  //@param pasteBoard: The pasteboard from which to return the color.
		  
		  #if targetMacOS
		    declare function colorFromPasteboard lib CocoaLib selector "colorFromPasteboard:" (id as Ptr, pasteboard as Ptr) as Ptr
		    
		    dim pasteboardRef as Ptr
		    if pasteboard <> nil then
		      pasteboardRef = pasteboard
		    end if
		    
		    dim colorRef as Ptr = colorFromPasteboard(ClassRef, pasteboardRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused pasteboard
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorNameComponent() As String
		  //# Returns the NSColor's name.
		  
		  //@return String: The name of the color object.
		  //@discussion: This method raises an exception if the NSColor’s color space isn’t NSNamedColorSpace.
		  
		  #if targetMacOS
		    declare function colorNameComponent lib CocoaLib selector "colorNameComponent" (id as Ptr) as CFStringRef
		    
		    return colorNameComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorSpace() As NSColorspace
		  //# Returns an object representing the color space of the NSColor.
		  
		  //@return NSColorspace: An object representing a color space. The returned NSColorSpace object may represent a custom color space.
		  
		  #if targetMacOS
		    declare function colorSpace lib CocoaLib selector "colorSpace" (id as Ptr) as Ptr
		    
		    dim spaceRef as Ptr = colorSpace(self)
		    if spaceRef <> nil then
		      return new NSColorspace(spaceRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorspaceColor(space as NSColorspace, components() as Double) As NSColor
		  //# Returns an NSColor object created from the specified components of the given color space.
		  
		  #if targetMacOS
		    declare function colorWithColorSpace lib CocoaLib selector "colorWithColorSpace:components:count:" _
		    (id as Ptr, space as Ptr, components as Ptr, count as Integer) as Ptr
		    
		    if space <> nil then
		      dim componentCount as Integer = components.ubound+1
		      dim m as new MemoryBlock(componentCount*SizeOfDouble)
		      for i as integer = 0 to componentCount-1
		        m.DoubleValue(i*SizeOfDouble) = components(i)
		      next
		      
		      dim colorRef as Ptr = colorWithColorSpace(ClassRef, space, m, componentCount)
		      if colorRef <> nil then
		        return new NSColor(colorRef)
		      else
		        return nil
		      end if
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused space
		    #pragma unused components
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorWithAlpha(alpha as Double) As NSColor
		  //# Creates and returns an NSColor object that has the same color space and component values as the NSColor, but the specified alpha component.
		  
		  //@param alpha: The opacity value of the new NSColor object.
		  //@return NSColor: The new NSColor object. If the NSColor’s color space doesn’t include an alpha component, the NSColor is returned.
		  
		  #if targetMacOS
		    declare function colorWithAlphaComponent lib CocoaLib selector "colorWithAlphaComponent:" (id as Ptr, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithAlphaComponent(self, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function colorWithCMYK(cyan as Double, magenta as Double, yellow as Double, black as Double, alpha as Double) As NSColor
		  //# Creates and returns an NSColor object using the given opacity value and CMYK components.
		  
		  //@param cyan:     The cyan    component of the color object.
		  //@param magenta:  The magenta component of the color object.
		  //@param yellow:   The yellow  component of the color object.
		  //@param black:    The black   component of the color object.
		  //@param alpha:    The opacity value     of the color object.
		  
		  //@return NSColor: The color object.
		  
		  //@Discussion: Values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
		  
		  #if targetMacOS
		    declare function colorWithDeviceCyan lib CocoaLib selector "colorWithDeviceCyan:magenta:yellow:black:alpha:" _
		    (id as Ptr, cyan as Double, magenta as Double, yellow as Double, black as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithDeviceCyan(ClassRef, cyan, magenta, yellow, black, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused cyan
		    #pragma unused magenta
		    #pragma unused yellow
		    #pragma unused black
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function colorWithHSB(hue as Double, saturation as Double, brightness as Double, alpha as Double) As NSColor
		  //# Creates and returns an NSColor object using the given opacity value and HSB color space components.
		  
		  #if targetMacOS
		    declare function colorWithDeviceHue lib CocoaLib selector "colorWithDeviceHue:saturation:brightness:alpha:" _
		    (id as Ptr, hue as Double, saturation as Double, brightness as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithDeviceHue(ClassRef, hue, saturation, brightness, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused hue
		    #pragma unused saturation
		    #pragma unused brightness
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorWithHSBACalibrated(hue as Double, saturation as Double, brightness as Double, alpha as Double) As NSColor
		  //# Creates and returns an NSColor object using the given opacity and HSB color space components.
		  
		  #if targetMacOS
		    declare function colorWithCalibratedHue lib CocoaLib selector "colorWithCalibratedHue:saturation:brightness:alpha:" _
		    (id as Ptr, hue as Double, saturation as Double, brightness as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithCalibratedHue(ClassRef, hue, saturation, brightness, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused hue
		    #pragma unused saturation
		    #pragma unused brightness
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorWithRGB(red as Double, green as Double, blue as Double, alpha as Double) As NSColor
		  //# Creates and returns an NSColor object using the given opacity value and RGB components.
		  
		  #if targetMacOS
		    declare function colorWithDeviceRed lib CocoaLib selector "colorWithDeviceRed:green:blue:alpha:" _
		    (id as Ptr, red as Double, green as Double, blue as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithDeviceRed(ClassRef, red, green, blue, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused red
		    #pragma unused green
		    #pragma unused blue
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorWithRGBACalibrated(red as Double, green as Double, blue as Double, alpha as Double) As NSColor
		  
		  #if targetMacOS
		    declare function colorWithCalibratedRed lib CocoaLib selector "colorWithCalibratedRed:green:blue:alpha:" _
		    (id as Ptr, red as Double, green as Double, blue as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithCalibratedRed(ClassRef, red, green, blue, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused red
		    #pragma unused green
		    #pragma unused blue
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorWithSRGB(red as Double, green as Double, blue as Double, alpha as Double) As NSColor
		  //# Returns a color created from the specified components in the sRGB colorspace.
		  
		  #if targetMacOS
		    declare function colorWithSRGBRed lib CocoaLib selector "colorWithSRGBRed:green:blue:alpha:" _
		    (id as Ptr, red as Double, green as Double, blue as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithSRGBRed(ClassRef, red, green, blue, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused red
		    #pragma unused green
		    #pragma unused blue
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorWithWA(white as Double, alpha as Double) As NSColor
		  //# Creates and returns an NSColor object using the given opacity and grayscale values.
		  
		  #if targetMacOS
		    declare function colorWithDeviceWhite lib CocoaLib selector "colorWithDeviceWhite:alpha:" _
		    (id as Ptr, white as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithDeviceWhite(ClassRef, white, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused white
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorWithWACalibrated(white as Double, alpha as Double) As NSColor
		  //# Creates and returns an NSColor object using the given opacity and grayscale value.
		  
		  #if targetMacOS
		    declare function colorWithCalibratedWhite lib CocoaLib selector "colorWithCalibratedWhite:alpha:" _
		    (id as Ptr, white as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithCalibratedWhite(ClassRef, white, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused white
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Components() As Double()
		  //# Returns the components of the NSColor as an array.
		  
		  #if targetMacOS
		    declare sub getComponents lib CocoaLib selector "getComponents:" (id as Ptr, components as Ptr)
		    
		    dim rb_array() as Double
		    
		    dim n as Integer = self.NumberOfComponents
		    dim m as new MemoryBlock(n*SizeOfDouble)
		    getComponents self, m
		    
		    for i as integer = 0 to n-1
		      rb_array.append m.DoubleValue(i*SizeOfDouble)
		    next
		    
		    return rb_array
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ComputeColorValue() As Color
		  #if TargetMacOS
		    dim c as NSColor = self.ConvertColorspace("NSCalibratedRGBColorSpace")
		    
		    declare sub getRGBComponents lib CocoaLib selector "getRed:green:blue:alpha:" (id as Ptr, ByRef red as Double, ByRef green as Double, ByRef blue as Double, ByRef alpha as Double)
		    
		    dim red as Double
		    dim green as Double
		    dim blue as Double
		    dim alpha as Double
		    
		    if c<>nil then
		      getRGBComponents c.id, red, green, blue, alpha
		    else
		      getRGBComponents self, red, green, blue, alpha
		    end if
		    
		    #if RBVersion >= 2011.04
		      return RGB(255.0*red, 255.0*green, 255.0*blue, 255.0-(alpha*255.0))
		    #else
		      return RGB(255.0*red, 255.0*green, 255.0*blue)
		    #endif
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(c as Color, alpha as Double = 1.0)
		  #if TargetMacOS
		    declare function colorFromRGBA lib CocoaLib selector "colorWithCalibratedRed:green:blue:alpha:" (class_id as Ptr, red as Double, green as Double, blue as Double, alpha as Double) as Ptr
		    
		    #if RBVersion >= 2011.04 // RB 2011.04 and later supports colors with alpha value
		      #pragma unused alpha
		      super.Constructor(colorFromRGBA(NSClassFromString("NSColor"), c.Red/255, c.Green/255, c.Blue/255, (255-c.alpha)/255), not hasOwnership)
		    #else
		      super.Constructor(colorFromRGBA(NSClassFromString("NSColor"), c.Red/255, c.Green/255, c.Blue/255, alpha), not hasOwnership)
		    #endif
		    
		  #else
		    #pragma unused c
		    #pragma unused alpha
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlAlternatingRowBackgroundColors() As NSColor()
		  //# Returns an array containing the system specified background colors for alternating rows in tables and lists.
		  
		  #if targetMacOS
		    declare function controlAlternatingRowBackgroundColors lib CocoaLib selector "controlAlternatingRowBackgroundColors" (id as Ptr) as Ptr
		    
		    dim retArray() as NSColor
		    
		    dim arrayRef as Ptr = controlAlternatingRowBackgroundColors(ClassRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as NSRange = NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSColor(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlBackgroundColor() As NSColor
		  //# Returns the system color used for the background of large controls.
		  
		  #if targetMacOS
		    declare function controlBackgroundColor lib CocoaLib selector "controlBackgroundColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = controlBackgroundColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlColor() As NSColor
		  //# Returns the system color used for the flat surfaces of a control.
		  
		  #if targetMacOS
		    declare function controlColor lib CocoaLib selector "controlColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = controlColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlDarkShadowColor() As NSColor
		  //# Returns the system color used for the dark edge of the shadow dropped from controls.
		  
		  #if targetMacOS
		    declare function controlDarkShadowColor lib CocoaLib selector "controlDarkShadowColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = controlDarkShadowColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlHighlightColor() As NSColor
		  //#
		  
		  #if targetMacOS
		    declare function controlHighlightColor lib CocoaLib selector "controlHighlightColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = controlHighlightColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlLightHighlightColor() As NSColor
		  //# Returns the system color used for light highlights in controls.
		  
		  #if targetMacOS
		    declare function controlLightHighlightColor lib CocoaLib selector "controlLightHighlightColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = controlLightHighlightColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlShadowColor() As NSColor
		  //# Returns the system color used for the shadows dropped from controls.
		  
		  #if targetMacOS
		    declare function controlShadowColor lib CocoaLib selector "controlShadowColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = controlShadowColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlTextColor() As NSColor
		  //# Returns the system color used for text on controls that aren’t disabled.
		  
		  #if targetMacOS
		    declare function controlTextColor lib CocoaLib selector "controlTextColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = controlTextColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlTextColorDisabled() As NSColor
		  //# Returns the system color used for text on disabled controls.
		  
		  #if targetMacOS
		    declare function disabledControlTextColor lib CocoaLib selector "disabledControlTextColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = disabledControlTextColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlTint(controlTint as NSControlTint) As NSColor
		  //# Returns the NSColor object specified by the given control tint.
		  
		  #if TargetMacOS
		    declare function colorForControlTint lib CocoaLib selector "colorForControlTint:" (id as Ptr, controlTint as NSControlTint) as Ptr
		    
		    return new NSColor(colorForControlTint(NSClassFromString(NSClassName), controlTint))
		    
		  #else
		    #pragma unused controlTint
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlTintBlue() As NSColor
		  
		  return ControlTint(NSControlTint.NSBlueControlTint)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlTintClear() As NSColor
		  
		  return ControlTint(NSControlTint.NSClearControlTint)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlTintDefault() As NSColor
		  
		  return ControlTint(NSControlTint.NSDefaultControlTint)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlTintGraphite() As NSColor
		  
		  return ControlTint(NSControlTint.NSGraphiteControlTint)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertColorspace(colorSpace as NSColorspace) As NSColor
		  //# Returns a new color object representing the color of the NSColor in the specified color space.
		  
		  //@return NSColor: The new NSColor object. This method converts the NSColor's color to an equivalent one in the new color space. Although the new color might have different component values, it looks the same as the original. Returns nil if conversion is not possible.
		  
		  #if targetMacOS
		    declare function colorUsingColorSpace lib CocoaLib selector "colorUsingColorSpace:" (obj_id as Ptr, colorSpace as Ptr) as Ptr
		    
		    dim colorSpaceRef as Ptr
		    if colorSpace <> nil then
		      colorSpaceRef = colorSpace
		    end if
		    
		    dim p as Ptr = colorUsingColorSpace(self, colorSpaceRef)
		    if p <> nil then
		      if p = self.id then
		        return self
		      else
		        return new NSColor(p)
		      end if
		    else
		      //conversion could not be done
		      return nil
		    end if
		    
		  #else
		    #pragma unused colorSpace
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertColorspace(spaceName as String) As NSColor
		  //# Creates and returns an NSColor whose color is the same as the NSColor’s, except that the new NSColor is in the specified color space.
		  
		  #if TargetMacOS
		    declare function colorUsingColorSpaceName lib CocoaLib selector "colorUsingColorSpaceName:" (id as Ptr, colorSpace as CFStringRef) as Ptr
		    
		    dim p as Ptr = colorUsingColorSpaceName(self, spaceName)
		    if p <> nil then
		      if p = self.id then
		        return self
		      else
		        return new NSColor(p)
		      end if
		    else
		      //conversion could not be done
		      return nil
		    end if
		    
		  #else
		    #pragma unused spaceName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertColorspace(spaceName as String, deviceDescription as NSDictionary) As NSColor
		  //# Creates and returns an NSColor object whose color is the same as the NSColor’s, except that the new NSColor is in the given color space and is specific to the given device.
		  
		  #if targetMacOS
		    declare function colorUsingColorSpaceName lib CocoaLib selector "colorUsingColorSpaceName:device:" (obj_id as Ptr, spaceName as CFStringRef, deviceDescription as Ptr) as Ptr
		    
		    dim dictRef as Ptr
		    if deviceDescription <> nil then
		      dictRef = deviceDescription
		    end if
		    
		    dim p as Ptr = colorUsingColorSpaceName(self, spaceName, dictRef)
		    if p <> nil then
		      if p = self.id then
		        return self
		      else
		        return new NSColor(p)
		      end if
		    else
		      //conversion could not be done
		      return nil
		    end if
		    
		  #else
		    #pragma unused spaceName
		    #pragma unused deviceDescription
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CurrentControlTint() As NSControlTint
		  //# Returns the current system control tint.
		  
		  #if targetMacOS
		    declare function currentControlTint lib CocoaLib selector "currentControlTint" (id as Ptr) as NSControlTint
		    
		    return currentControlTint(ClassRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Cyan() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_cyanColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CyanComponent() As Double
		  //# Returns the NSColor's cyan component.
		  
		  #if targetMacOS
		    declare function cyanComponent lib CocoaLib selector "cyanComponent" (id as Ptr) as Double
		    
		    return cyanComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DarkGray() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_darkGrayColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawSwatchInRect(rect as NSRect)
		  //# Draws the current color in the given rectangle.
		  
		  #if targetMacOS
		    declare sub drawSwatchInRect lib CocoaLib selector "drawSwatchInRect:" (id as Ptr, rect as NSRect)
		    
		    drawSwatchInRect self, rect
		  #else
		    #pragma unused rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GenericGamma22Color(white as Double, alpha as Double) As NSColor
		  //# Returns an color created with the specified white and alpha values in the GenericGamma22 colorspace.
		  
		  #if targetMacOS
		    declare function colorWithGenericGamma22White lib CocoaLib selector "colorWithGenericGamma22White:alpha:" _
		    (id as Ptr, white as Double, alpha as Double) as Ptr
		    
		    dim colorRef as Ptr = colorWithGenericGamma22White(ClassRef, white, alpha)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused white
		    #pragma unused alpha
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetCMYKA(byRef cyan as Double, byRef magenta as Double, byRef yellow as Double, byRef black as Double, byRef alpha as Double)
		  //# Returns the NSColor's CMYK and opacity values.
		  
		  //@param cyan:    Upon return, contains the cyan    component of the color object.
		  //@param magenta: Upon return, contains the magenta component of the color object.
		  //@param yellow:  Upon return, contains the yellow  component of the color object.
		  //@param black:   Upon return, contains the black   component of the color object.
		  //@param alpha:   Upon return, contains opacity     value     of the color object.
		  
		  #if targetMacOS
		    declare sub getCyan lib CocoaLib selector "getCyan:magenta:yellow:black:alpha:" _
		    (id as Ptr, byRef cyan as Double, byRef magenta as Double, byRef yellow as Double, byRef black as Double, byRef alpha as Double)
		    
		    getCyan self, cyan, magenta, yellow, black, alpha
		  #else
		    #pragma unused cyan
		    #pragma unused magenta
		    #pragma unused yellow
		    #pragma unused black
		    #pragma unused alpha
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetHSBA(byRef hue as Double, byRef saturation as Double, byRef brightness as Double, byRef alpha as Double)
		  //# Returns the NSColor's HSB component and opacity values in the respective arguments.
		  
		  //#param hue:        Upon return, contains the hue        component of the color object.
		  //#param saturation: Upon return, contains the saturation component of the color object.
		  //#param brightness: Upon return, contains the brightness component of the color object.
		  //#param alpha:      Upon return, contains the opacity    value     of the color object.
		  
		  #if targetMacOS
		    declare sub getHue lib CocoaLib selector "getHue:saturation:brightness:alpha:" _
		    (id as Ptr, byRef hue as Double, byRef saturation as Double, byRef brightness as Double, byRef alpha as Double)
		    
		    getHue self, hue, saturation, brightness, alpha
		  #else
		    #pragma unused hue
		    #pragma unused saturation
		    #pragma unused brightness
		    #pragma unused alpha
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetRGBA(byRef red as Double, byRef green as Double, byRef blue as Double, byRef alpha as Double)
		  //# Returns the NSColor's RGB component and opacity values in the respective arguments.
		  
		  //@param red:   Upon return, contains the red     component of the color object.
		  //@param green: Upon return, contains the green   component of the color object.
		  //@param blue:  Upon return, contains the blue    component of the color object.
		  //@param alpha: Upon return, contains the opacity value     of the color object.
		  
		  //@discussion: If NULL is passed in as an argument, the method doesn’t set that value. _
		  // This method works only with objects representing colors in the NSCalibratedRGBColorSpace _
		  // or NSDeviceRGBColorSpace color space. Sending it to other objects raises an exception.
		  
		  #if targetMacOS
		    declare sub getRed lib CocoaLib selector "getRed:green:blue:alpha:" _
		    (id as Ptr, byRef red as Double, byRef green as Double, byRef blue as Double, byRef alpha as Double)
		    
		    getRed self, red, green, blue, alpha
		  #else
		    #pragma unused red
		    #pragma unused green
		    #pragma unused blue
		    #pragma unused alpha
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWA(byRef white as Double, byRef alpha as Double)
		  //# Returns the NSColor's grayscale value and alpha values.
		  
		  //@param white: Upon return, contains the grayscale value of the color object.
		  //@param alpha: Upon return, contains the opacity   value of the color object.
		  
		  #if targetMacOS
		    declare sub getWhite lib CocoaLib selector "getWhite:alpha:" (id as Ptr, byRef white as Double, byRef alpha as Double)
		    
		    getWhite self, white, alpha
		  #else
		    #pragma unused white
		    #pragma unused alpha
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Gray() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_grayColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Green() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_greenColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GreenComponent() As Double
		  //# Returns the NSColor's green component.
		  
		  #if targetMacOS
		    declare function greenComponent lib CocoaLib selector "greenComponent" (id as Ptr) as Double
		    
		    return greenComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GridColor() As NSColor
		  //# Returns the system color used for the optional gridlines in, for example, a table view.
		  
		  #if targetMacOS
		    declare function gridColor lib CocoaLib selector "gridColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = gridColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HeaderColor() As NSColor
		  //# Returns the system color used as the background color for header cells in table views and outline views.
		  
		  #if targetMacOS
		    declare function headerColor lib CocoaLib selector "headerColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = headerColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HeaderTextColor() As NSColor
		  //# Returns the system color used for text in header cells in table views and outline views.
		  
		  #if targetMacOS
		    declare function headerTextColor lib CocoaLib selector "headerTextColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = headerTextColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Highlight(highlightLevel as Double) As NSColor
		  //# Returns an NSColor object that represents a blend between the NSColor and the highlight color returned by highlightColor.
		  
		  //@param highlightLevel: The amount of the highlight color that is blended with the NSColor's color. This should be a number from 0.0 through 1.0. A highlightLevel below 0.0 is interpreted as 0.0; a highlightLevel above 1.0 is interpreted as 1.0.
		  
		  #if targetMacOS
		    declare function highlightWithLevel lib CocoaLib selector "highlightWithLevel:" (id as Ptr, highlightLevel as Double) as Ptr
		    
		    dim colorRef as Ptr = highlightWithLevel(self, highlightLevel)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused highlightLevel
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HighlightColor() As NSColor
		  //# Returns the system color that represents the virtual light source on the screen.
		  
		  #if targetMacOS
		    declare function highlightColor lib CocoaLib selector "highlightColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = highlightColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HueComponent() As Double
		  //# Returns the hue component of the HSB color equivalent to the NSColor.
		  
		  #if targetMacOS
		    declare function hueComponent lib CocoaLib selector "hueComponent" (id as Ptr) as Double
		    
		    return hueComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyboardFocusIndicatorColor() As NSColor
		  //# Returns the system color that represents the keyboard focus ring around controls.
		  
		  #if targetMacOS
		    declare function keyboardFocusIndicatorColor lib CocoaLib selector "keyboardFocusIndicatorColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = keyboardFocusIndicatorColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KnobColor() As NSColor
		  //# Returns the system color used for the flat surface of a slider knob that hasn’t been selected.
		  
		  #if targetMacOS
		    declare function knobColor lib CocoaLib selector "knobColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = knobColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LabelColor() As NSColor
		  //# Returns the system color used for the flat surfaces of a control.
		  
		  #if targetMacOS
		    if IsYosemite then
		      declare function labelColor lib CocoaLib selector "labelColor" (id as Ptr) as Ptr
		      
		      dim colorRef as Ptr = labelColor(ClassRef)
		      if colorRef <> nil then
		        return new NSColor(colorRef)
		      else
		        return nil
		      end if
		      
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LightGray() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_lightGrayColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalizedCatalogNameComponent() As String
		  //# Returns the name of the catalog containing the NSColor's name as a localized string.
		  
		  #if targetMacOS
		    declare function localizedCatalogNameComponent lib CocoaLib selector "localizedCatalogNameComponent" (id as Ptr) as CFStringRef
		    
		    return localizedCatalogNameComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalizedColorNameComponent() As String
		  //# Returns the name of the NSColor as a localized string.
		  
		  #if targetMacOS
		    declare function localizedColorNameComponent lib CocoaLib selector "localizedColorNameComponent" (id as Ptr) as CFStringRef
		    
		    return localizedColorNameComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Magenta() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_magentaColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MagentaComponent() As Double
		  //# Returns the NSColor's magenta component.
		  
		  #if targetMacOS
		    declare function magentaComponent lib CocoaLib selector "magentaComponent" (id as Ptr) as Double
		    
		    return magentaComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeObjectFromClassMethod(d as ClassMethodDelegate) As NSColor
		  #if TargetMacOS
		    return new NSColor(d.Invoke(NSClassFromString(NSClassName)))
		  #else
		    #pragma unused d
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_alternateSelectedControlColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function alternateSelectedControlColor lib CocoaLib selector "alternateSelectedControlColor" (id as Ptr) as Ptr
		    
		    return alternateSelectedControlColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_alternateSelectedControlTextColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function alternateSelectedControlTextColor lib CocoaLib selector "alternateSelectedControlTextColor" (id as Ptr) as Ptr
		    
		    return alternateSelectedControlTextColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_blackColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function blackColor lib CocoaLib selector "blackColor" (id as Ptr) as Ptr
		    
		    return blackColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_blueColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function blueColor lib CocoaLib selector "blueColor" (id as Ptr) as Ptr
		    
		    return blueColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_brownColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function brownColor lib CocoaLib selector "brownColor" (id as Ptr) as Ptr
		    
		    return brownColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_clearColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function clearColor lib CocoaLib selector "clearColor" (id as Ptr) as Ptr
		    
		    return clearColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_cyanColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function cyanColor lib CocoaLib selector "cyanColor" (id as Ptr) as Ptr
		    
		    return cyanColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_darkGrayColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function darkGrayColor lib CocoaLib selector "darkGrayColor" (id as Ptr) as Ptr
		    
		    return darkGrayColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_grayColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function grayColor lib CocoaLib selector "grayColor" (id as Ptr) as Ptr
		    
		    return grayColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_greenColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function greenColor lib CocoaLib selector "greenColor" (id as Ptr) as Ptr
		    
		    return greenColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_lightGrayColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function lightGrayColor lib CocoaLib selector "lightGrayColor" (id as Ptr) as Ptr
		    
		    return lightGrayColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_magentaColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function magentaColor lib CocoaLib selector "magentaColor" (id as Ptr) as Ptr
		    
		    return magentaColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_orangeColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function orangeColor lib CocoaLib selector "orangeColor" (id as Ptr) as Ptr
		    
		    return orangeColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_purpleColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function purpleColor lib CocoaLib selector "purpleColor" (id as Ptr) as Ptr
		    
		    return purpleColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_redColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function redColor lib CocoaLib selector "redColor" (id as Ptr) as Ptr
		    
		    return redColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_whiteColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function whiteColor lib CocoaLib selector "whiteColor" (id as Ptr) as Ptr
		    
		    return whiteColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_yellowColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function yellowColor lib CocoaLib selector "yellowColor" (id as Ptr) as Ptr
		    
		    return yellowColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfComponents() As Integer
		  //# Returns the number of components in the NSColor.
		  
		  #if targetMacOS
		    declare function numberOfComponents lib CocoaLib selector "numberOfComponents" (id as Ptr) as Integer
		    
		    return numberOfComponents(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Color
		  return self.ColorValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return me.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(aColor as Color)
		  
		  self.Constructor(aColor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Orange() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_orangeColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PatternImage() As NSImage
		  //# Returns the image that the NSColor is using as a pattern.
		  
		  #if targetMacOS
		    declare function patternImage lib CocoaLib selector "patternImage" (id as Ptr) as Ptr
		    
		    dim imageRef as Ptr = patternImage(self)
		    if imageRef <> nil then
		      return new NSImage(imageRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PatternImageColor(image as NSImage) As NSColor
		  //# Creates and returns an NSColor object that uses the specified image pattern.
		  
		  #if targetMacOS
		    declare function colorWithPatternImage lib CocoaLib selector "colorWithPatternImage:" (id as Ptr, image as Ptr) as Ptr
		    
		    dim imageRef as Ptr
		    if image <> nil then
		      imageRef = image
		    end if
		    
		    dim colorRef as Ptr = colorWithPatternImage(ClassRef, imageRef)
		    
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused image
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Purple() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_purpleColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Red() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_redColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RedComponent() As Double
		  //# Returns the NSColor's red component.
		  
		  #if targetMacOS
		    declare function redComponent lib CocoaLib selector "redComponent" (id as Ptr) as Double
		    
		    return redComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaturationComponent() As Double
		  //# Returns the NSColor's saturation component.
		  
		  #if targetMacOS
		    declare function saturationComponent lib CocoaLib selector "saturationComponent" (id as Ptr) as Double
		    
		    return saturationComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ScrollBarColor() As NSColor
		  //# Returns the system color used for scroll “bars”—that is, for the groove in which a scroller’s knob moves
		  
		  #if targetMacOS
		    declare function scrollBarColor lib CocoaLib selector "scrollBarColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = scrollBarColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SecondaryLabelColor() As NSColor
		  //# Returns the system color used for the flat surfaces of a control.
		  
		  #if targetMacOS
		    if IsYosemite then
		      declare function secondaryLabelColor lib CocoaLib selector "secondaryLabelColor" (id as Ptr) as Ptr
		      
		      dim colorRef as Ptr = secondaryLabelColor(ClassRef)
		      if colorRef <> nil then
		        return new NSColor(colorRef)
		      else
		        return nil
		      end if
		      
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SecondarySelectedControlColor() As NSColor
		  //# Returns the system color used in non-key views.
		  
		  #if targetMacOS
		    declare function secondarySelectedControlColor lib CocoaLib selector "secondarySelectedControlColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = secondarySelectedControlColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SelectedControlColor() As NSColor
		  //# Returns the system color used for the face of a selected control.
		  
		  #if targetMacOS
		    declare function selectedControlColor lib CocoaLib selector "selectedControlColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = selectedControlColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SelectedControlTextColor() As NSColor
		  //# Returns the system color used for text in a selected control—a control being clicked or dragged.
		  
		  #if targetMacOS
		    declare function selectedControlTextColor lib CocoaLib selector "selectedControlTextColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = selectedControlTextColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SelectedKnobColor() As NSColor
		  //# Returns the system color used for the slider knob when it is selected.
		  
		  #if targetMacOS
		    declare function selectedKnobColor lib CocoaLib selector "selectedKnobColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = selectedKnobColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SelectedMenuItemColor() As NSColor
		  //# Returns the system color used for the face of selected menu items.
		  
		  #if targetMacOS
		    declare function selectedMenuItemColor lib CocoaLib selector "selectedMenuItemColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = selectedMenuItemColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SelectedMenuItemTextColor() As NSColor
		  //# Returns the system color used for the text in menu items.
		  
		  #if targetMacOS
		    declare function selectedMenuItemTextColor lib CocoaLib selector "selectedMenuItemTextColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = selectedMenuItemTextColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SelectedTextBackgroundColor() As NSColor
		  //# Returns the system color used for the background of selected text.
		  
		  #if targetMacOS
		    declare function selectedTextBackgroundColor lib CocoaLib selector "selectedTextBackgroundColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = selectedTextBackgroundColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SelectedTextColor() As NSColor
		  //# Returns the system color used for selected text.
		  
		  #if targetMacOS
		    declare function selectedTextColor lib CocoaLib selector "selectedTextColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = selectedTextColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColor()
		  //# Sets the color of subsequent drawing to the color that the NSColor represents.
		  
		  //@discussion: This method should be implemented in subclasses.
		  
		  #if targetMacOS
		    declare sub set_ lib CocoaLib selector "set" (id as Ptr)
		    
		    set_ self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFillColor()
		  //# Sets the fill color of subsequent drawing to the NSColor’s color.
		  
		  //@discussion: This method should be implemented in subclasses.
		  
		  #if targetMacOS
		    declare sub setFill lib CocoaLib selector "setFill" (id as Ptr)
		    
		    setFill self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStrokeColor()
		  //# Sets the stroke color of subsequent drawing to the NSColor’s color.
		  
		  //@discussion: This method should be implemented in subclasses.
		  
		  #if targetMacOS
		    declare sub setStroke lib CocoaLib selector "setStroke" (id as Ptr)
		    
		    setStroke self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Shadow(shadowLevel as Double) As NSColor
		  //# Returns an NSColor object that represents a blend between the NSColor and the shadow color returned by shadowColor.
		  
		  //@param shadowLevel: The amount of the shadow color used for the blend. This should be a number from 0.0 through 1.0. A shadowLevel below 0.0 is interpreted as 0.0; a shadowLevel above 1.0 is interpreted as 1.0.
		  
		  #if targetMacOS
		    declare function shadowWithLevel lib CocoaLib selector "shadowWithLevel:" (id as Ptr, shadowLevel as Double) as Ptr
		    
		    dim colorRef as Ptr = shadowWithLevel(self, shadowLevel)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused shadowLevel
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ShadowColor() As NSColor
		  //# Returns the system color that represents the virtual shadows cast by raised objects on the screen.
		  
		  #if targetMacOS
		    declare function shadowColor lib CocoaLib selector "shadowColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = shadowColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TextBackgroundColor() As NSColor
		  //# Returns the system color used for the text background.
		  
		  #if targetMacOS
		    declare function textBackgroundColor lib CocoaLib selector "textBackgroundColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = textBackgroundColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TextColor() As NSColor
		  //# Returns the system color used for text.
		  
		  #if targetMacOS
		    declare function textColor lib CocoaLib selector "textColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = textColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function underPageBackgroundColor() As NSColor
		  //# Returns the color to use when areas revealed behind views.
		  
		  #if targetMacOS
		    if IsMountainLion then
		      declare function underPageBackgroundColor lib CocoaLib selector "underPageBackgroundColor" (id as Ptr) as Ptr
		      
		      dim colorRef as Ptr = underPageBackgroundColor(ClassRef)
		      if colorRef <> nil then
		        return new NSColor(colorRef)
		      else
		        return nil
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  
		  return  ColorValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function White() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_whiteColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhiteComponent() As Double
		  //# Returns the NSColor's white component.
		  
		  #if targetMacOS
		    declare function whiteComponent lib CocoaLib selector "whiteComponent" (id as Ptr) as Double
		    
		    return whiteComponent(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WindowBackgroundColor() As NSColor
		  //# Returns a pattern color that will draw the ruled lines for the window background.
		  
		  #if targetMacOS
		    declare function windowBackgroundColor lib CocoaLib selector "windowBackgroundColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = windowBackgroundColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WindowFrameColor() As NSColor
		  //# Returns the system color used for window frames, except for their text.
		  
		  #if targetMacOS
		    declare function windowFrameColor lib CocoaLib selector "windowFrameColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = windowFrameColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WindowFrameTextColor() As NSColor
		  //# Returns the system color used for the text in window frames.
		  
		  #if targetMacOS
		    declare function windowFrameTextColor lib CocoaLib selector "windowFrameTextColor" (id as Ptr) as Ptr
		    
		    dim colorRef as Ptr = windowFrameTextColor(ClassRef)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteToPasteboard(pasteboard as NSPasteboard)
		  //# Writes the NSColor’s data to the specified pasteboard.
		  
		  #if targetMacOS
		    declare sub writeToPasteboard lib CocoaLib selector "writeToPasteboard:" (id as Ptr, pasteboard as Ptr)
		    
		    dim pasteboardRef as Ptr
		    if pasteboard <> nil then
		      pasteboardRef = pasteboard
		    end if
		    
		    writeToPasteboard self, pasteboardRef
		  #else
		    #pragma unused pasteboard
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Yellow() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_yellowColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YellowComponent() As Double
		  //# Returns the NSColor's yellow component.
		  
		  #if targetMacOS
		    declare function yellowComponent lib CocoaLib selector "yellowComponent" (id as Ptr) as Double
		    
		    return yellowComponent(self)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the name of the NSColor's color space.
			  
			  #if TargetMacOS
			    declare function colorSpaceName lib CocoaLib selector "colorSpaceName" (id as Ptr) as CFStringRef
			    
			    return colorSpaceName(self)
			  #endif
			End Get
		#tag EndGetter
		ColorSpaceName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //On my machine, the first invocation of ComputeColorValue takes 1000 µs; subsequent invocations take around 20µs.  With caching, subsequent invocations
			  //take around 1 µs.  Since the caching is internal, simply implemented and NSColor as implemented here is immutable, I figure it's worth the one-time effort.
			  
			  if not self.rbcolorcomputed then
			    self.rbcolor = self.ComputeColorValue
			    self.rbcolorcomputed = true
			  end if
			  
			  return self.rbcolor
			End Get
		#tag EndGetter
		ColorValue As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Boolean value indicating whether the application supports alpha.
			  
			  #if targetMacOS
			    declare function ignoresAlpha lib CocoaLib selector "ignoresAlpha" (id as Ptr) as Boolean
			    
			    return ignoresAlpha(ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Specifies whether an application supports alpha.
			  
			  #if targetMacOS
			    declare sub setIgnoresAlpha lib CocoaLib selector "setIgnoresAlpha:" (id as Ptr, flag as Boolean)
			    
			    setIgnoresAlpha ClassRef, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Shared IgnoresAlpha As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Attributes( Hidden = true ) Private rbcolor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden = true ) Private rbcolorcomputed As Boolean
	#tag EndProperty


	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"NSColor", Scope = Private
	#tag EndConstant


	#tag Enum, Name = NSControlTint, Flags = &h0
		NSDefaultControlTint = 0
		  NSBlueControlTint = 1
		  NSGraphiteControlTint = 6
		NSClearControlTint = 7
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="ColorspaceName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorValue"
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
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

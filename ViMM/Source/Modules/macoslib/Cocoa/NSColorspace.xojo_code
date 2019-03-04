#tag Class
Class NSColorspace
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function AdobeRGB1998ColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing an Adobe RGB (1998) color space.
		  
		  #if TargetMacOS
		    declare function adobeRGB1998ColorSpace lib CocoaLib selector "adobeRGB1998ColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(adobeRGB1998ColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AvailableColorSpaces(model as NSColorSpaceModel) As NSColorspace()
		  //# Returns the list of color spaces available on the system that are displayed in the color panel, in the order they are displayed in the color panel.
		  
		  #if targetMacOS
		    declare function availableColorSpacesWithModel lib CocoaLib selector "availableColorSpacesWithModel:" (class_id as Ptr, model as NSColorSpaceModel) as Ptr
		    
		    dim retArray() as NSColorspace
		    
		    dim arrayRef as Ptr = availableColorSpacesWithModel(ClassRef, model)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSColorspace(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		  #else
		    #pragma unused model
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSColorspace")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  //
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DeviceCMYKColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing a calibrated or device-dependent CMYK color space.
		  
		  #if TargetMacOS
		    declare function deviceCMYKColorSpace lib CocoaLib selector "deviceCMYKColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(deviceCMYKColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DeviceGrayColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing a calibrated or device-dependent gray color space.
		  
		  #if TargetMacOS
		    declare function deviceGrayColorSpace lib CocoaLib selector "deviceGrayColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(deviceGrayColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DeviceRGBColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing a calibrated or device-dependent RGB color space.
		  
		  #if TargetMacOS
		    declare function deviceRGBColorSpace lib CocoaLib selector "deviceRGBColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(deviceRGBColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GenericCMYKColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing a device-independent RGB color space.
		  
		  #if TargetMacOS
		    declare function genericCMYKColorSpace lib CocoaLib selector "genericCMYKColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(genericCMYKColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GenericGamma22GrayColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing a gray color space with a gamma value of 2.2.
		  
		  #if TargetMacOS
		    declare function genericGamma22GrayColorSpace lib CocoaLib selector "genericGamma22GrayColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(genericGamma22GrayColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GenericGrayColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing a device-independent gray color space.
		  
		  #if TargetMacOS
		    declare function genericGrayColorSpace lib CocoaLib selector "genericGrayColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(genericGrayColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GenericRGBColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing a device-independent RGB color space.
		  
		  #if TargetMacOS
		    declare function genericRGBColorSpace lib CocoaLib selector "genericRGBColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(genericRGBColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return me.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function sRGBColorSpace() As NSColorspace
		  //# Returns an NSColorSpace object representing an sRGB color space.
		  
		  #if TargetMacOS
		    declare function sRGBColorSpace lib CocoaLib selector "sRGBColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(sRGBColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Core Graphics color-space object that represents a color space equivalent to the NSColorSpace’s.
			  
			  #if targetMacOS
			    declare function CGColorSpace lib CocoaLib selector "CGColorSpace" (id as Ptr) as Ptr
			    
			    return  CGColorSpace(self)
			  #endif
			End Get
		#tag EndGetter
		CGColorSpace As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the model on which the color space of the NSColorSpace is based.
			  
			  #if targetMacOS
			    declare function colorSpaceModel lib CocoaLib selector "colorSpaceModel" (id as Ptr) as NSColorSpaceModel
			    
			    return  colorSpaceModel(self)
			  #endif
			End Get
		#tag EndGetter
		ColorSpaceModel As NSColorSpaceModel
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the ColorSync profile from which the NSColorSpace was created.
			  
			  #if targetMacOS
			    declare function colorSyncProfile lib CocoaLib selector "colorSyncProfile" (id as Ptr) as Ptr
			    
			    return  colorSyncProfile(self)
			  #endif
			End Get
		#tag EndGetter
		ColorSyncProfile As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the ICC profile data from which the NSColorSpace was created.
			  
			  #if targetMacOS
			    declare function ICCProfileData lib CocoaLib selector "ICCProfileData" (id as Ptr) as Ptr
			    
			    dim dataRef as Ptr = ICCProfileData(self)
			    if dataRef <> nil then
			      return new NSData(dataRef)
			    else
			      return nil
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		ICCProfileData As NSData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the localized name of the NSColorSpace.
			  
			  #if TargetMacOS
			    declare function localizedName lib CocoaLib selector "localizedName" (id as Ptr) as CFStringRef
			    
			    return localizedName(self)
			  #endif
			End Get
		#tag EndGetter
		LocalizedName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of components supported by the NSColorSpace.
			  
			  #if targetMacOS
			    declare function numberOfColorComponents lib CocoaLib selector "numberOfColorComponents" (id as Ptr) as Integer
			    
			    return  numberOfColorComponents(self)
			  #endif
			End Get
		#tag EndGetter
		NumberOfColorComponents As Integer
	#tag EndComputedProperty


	#tag Enum, Name = NSColorSpaceModel, Flags = &h0
		NSUnknownColorSpaceModel = -1
		  NSGrayColorSpaceModel
		  NSRGBColorSpaceModel
		  NSCMYKColorSpaceModel
		  NSLABColorSpaceModel
		  NSDeviceNColorSpaceModel
		  NSIndexedColorSpaceModel
		NSPatternColorSpaceModel
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="ColorSpaceModel"
			Group="Behavior"
			Type="NSColorSpaceModel"
			EditorType="Enum"
			#tag EnumValues
				"-1 - NSUnknownColorSpaceModel"
				"0 - NSGrayColorSpaceModel"
				"1 - NSRGBColorSpaceModel"
				"2 - NSCMYKColorSpaceModel"
				"3 - NSLABColorSpaceModel"
				"4 - NSDeviceNColorSpaceModel"
				"5 - NSIndexedColorSpaceModel"
				"6 - NSPatternColorSpaceModel"
			#tag EndEnumValues
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
			Name="LocalizedName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumberOfColorComponents"
			Group="Behavior"
			Type="Integer"
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

#tag Class
Class CGColorSpace
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGColorSpaceGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithName(name as String) As CGColorSpace
		  #if TargetMacOS
		    
		    soft declare function CGColorSpaceCreateWithName lib CarbonLib (name as CFStringRef) as Ptr
		    
		    dim p as Ptr = CGColorSpaceCreateWithName(name)
		    if p = nil then
		      return nil
		    end if
		    
		    return new CGColorSpace(p, true)
		    
		    //pass one of the ColorSpace* constants to create a color space
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DeviceRGB() As CGColorSpace
		  #if TargetMacOS
		    
		    declare function CGColorSpaceCreateDeviceRGB lib CarbonLib () as Ptr
		    
		    return new CGColorSpace (CGColorSpaceCreateDeviceRGB(), hasOwnership)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GenericGray() As CGColorSpace
		  return CreateWithName(ColorspaceGenericGray)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GenericRGB() As CGColorSpace
		  return CreateWithName(ColorspaceGenericRGB)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if TargetMacOS
			    
			    soft declare function CGColorSpaceGetNumberOfComponents lib CarbonLib (cs as Ptr) as Integer
			    
			    return CGColorSpaceGetNumberOfComponents(me)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ComponentCount As Integer
	#tag EndComputedProperty


	#tag Constant, Name = ColorSpaceGenericCMYK, Type = String, Dynamic = False, Default = \"kCGColorSpaceGenericCMYK", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ColorSpaceGenericGray, Type = String, Dynamic = False, Default = \"kCGColorSpaceGenericGray", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ColorSpaceGenericRGB, Type = String, Dynamic = False, Default = \"kCGColorSpaceGenericRGB", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ComponentCount"
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

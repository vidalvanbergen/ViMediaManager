#tag Class
Class CGColor
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGColorGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorSpace() As CGColorSpace
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    declare function CGColorGetColorSpace lib CarbonLib (color as Ptr) as Ptr
		    
		    return new CGColorSpace(CGColorGetColorSpace(me), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Components() As Double()
		  #if targetMacOS
		    declare function CGColorGetComponents lib CarbonLib (color as Ptr) as Ptr
		    
		    dim p as Ptr = CGColorGetComponents(me)
		    if p = nil then
		      dim noList() as Double
		      return noList
		    end if
		    
		    dim theList() as Double
		    dim lastOffset as Integer = SizeOfDouble*me.ComponentCount - 1
		    for offset as Integer = 0 to lastOffset step SizeOfDouble
		      theList.Append p.Double(offset)
		    next
		    return theList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(c as CGColor)
		  if c = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    declare function CGColorCreateCopy lib CarbonLib (color as Ptr) as Ptr
		    
		    super.Constructor CGColorCreateCopy(c), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(c as CGColor, alpha as Double)
		  if c = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    declare function CGColorCreateCopyWithAlpha lib CarbonLib (color as Ptr, alpha as Double) as Ptr
		    super.Constructor CGColorCreateCopyWithAlpha(me, alpha), true
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(colorSpace as CGColorSpace, components() as Double)
		  #if targetMacOS
		    declare function CGColorCreate lib CarbonLib (colorspace as Ptr, component as Ptr) as Ptr
		    
		    //convert components to C array
		    
		    dim m as new MemoryBlock(SizeOfDouble*(1 + UBound(components)))
		    dim offset as Integer = 0
		    for i as Integer = 0 to UBound(components)
		      m.DoubleValue(offset) = components(i)
		      offset = offset + SizeOfDouble
		    next
		    
		    super.Constructor CGColorCreate(colorSpace, m), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(c as CGColor) As Boolean
		  //note that this method overloads, not overrides, CFType.Equal.
		  
		  if c is nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    declare function CGColorEqualToColor lib CarbonLib (color1 as Ptr, color2 as Ptr) as Boolean
		    
		    return CGColorEqualToColor(me, c)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pattern() As CGPattern
		  #if targetMacOS
		    declare function CGColorGetPattern lib CarbonLib (color as Ptr) as Ptr
		    
		    return new CGPattern(CGColorGetPattern(me), false)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0.0
			  end if
			  
			  #if targetMacOS
			    declare function CGColorGetAlpha lib CarbonLib (color as Ptr) as Double
			    
			    return CGColorGetAlpha(me)
			  #endif
			End Get
		#tag EndGetter
		Alpha As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    declare function CGColorGetNumberOfComponents lib CarbonLib (cs as Ptr) as Integer
			    
			    return CGColorGetNumberOfComponents(me)
			  #endif
			End Get
		#tag EndGetter
		ComponentCount As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alpha"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
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

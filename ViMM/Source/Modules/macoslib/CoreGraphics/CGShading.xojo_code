#tag Class
Class CGShading
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGShadingGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(colorspace as CGColorSpace, startPt as CGPoint, endPt as CGPoint, callbacks as CGFunction, extendStart as Boolean, extendEnd as Boolean)
		  if colorspace = nil then
		    return
		  end if
		  if callbacks = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGShadingCreateAxial lib CarbonLib (colorspace as Ptr, start as CGPoint, endpt as CGPoint, func as Ptr, extendStart as Boolean, extendEnd as Boolean) as Ptr
		    
		    super.Constructor CGShadingCreateAxial(colorspace, startPt, endPt, callbacks, extendStart, extendEnd), true
		    me.ShadingFunction = callbacks
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(colorspace as CGColorSpace, startPt as CGPoint, startRadius as Double, endPt as CGPoint, endRadius as Double, callbacks as CGFunction, extendStart as Boolean, extendEnd as Boolean)
		  if colorspace = nil then
		    return
		  end if
		  if callbacks = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGShadingCreateRadial lib CarbonLib (colorspace as Ptr, start as CGPoint, startRadius as Double, endPt as CGPoint, endRadius as Double, func as Ptr, extendStart as Boolean, extendEnd as Boolean) as Ptr
		    
		    super.Constructor CGShadingCreateRadial(colorspace, startPt, startRadius, endPt, endRadius, callbacks, extendStart, extendEnd), true
		    me.ShadingFunction = callbacks
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ShadingFunction As CGFunction
	#tag EndProperty


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

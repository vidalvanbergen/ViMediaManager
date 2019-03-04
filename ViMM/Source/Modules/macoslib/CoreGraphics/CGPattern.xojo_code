#tag Class
Class CGPattern
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGPatternGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(info as Ptr, bounds as CGRect, matrix as CGAffineTransform, xStep as Double, yStep as Double, tiling as CGPatternTiling, isColored as Boolean, callbacks as CGPatternCallbacks)
		  #if TargetMacOS
		    
		    soft declare function CGPatternCreate lib CarbonLib (info as Ptr, bounds as CGRect, matrix as CGAffineTransform, xStep as Double, yStep as Double, tiling as CGPatternTiling, isColored as Boolean, ByRef callbacks as CGPatternCallbacks) as Ptr
		    
		    super.Constructor CGPatternCreate(info, bounds, matrix, xStep, yStep, tiling, isColored, callbacks), true
		    
		  #else
		    
		    #pragma unused info
		    #pragma unused bounds
		    #pragma unused matrix
		    #pragma unused xStep
		    #pragma unused yStep
		    #pragma unused tiling
		    #pragma unused isColored
		    #pragma unused callbacks
		    
		  #endif
		  
		End Sub
	#tag EndMethod


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

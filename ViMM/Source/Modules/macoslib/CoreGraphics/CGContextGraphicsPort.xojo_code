#tag Class
Class CGContextGraphicsPort
Inherits CGContext
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // Made private so that there is no default constructor available
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(g as Graphics)
		  #if targetCarbon
		    me.Port = Ptr(g.Handle(Graphics.handleTypeCGrafPtr))
		    
		    declare function QDBeginCGContext lib CarbonLib (port as Ptr, ByRef contextPtr as Ptr) as Integer
		    
		    dim contextPtr as Ptr
		    dim OSError as Integer = QDBeginCGContext(Port, contextPtr)
		    if OSError <> 0 then
		      break
		      me.Port = nil
		      return
		    end if
		    
		    super.Constructor contextPtr, true
		    me.Retain
		  #endif
		  
		  #if targetCocoa
		    super.Constructor Ptr(g.Handle(Graphics.HandleTypeCGContextRef)), false
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  if me.Port = nil then
		    return
		  end if
		  
		  dim contextPtr as Ptr = me.Reference
		  if contextPtr = nil then
		    return
		  end if
		  
		  #if targetCarbon
		    declare sub CGContextSynchronize lib CarbonLib (context as Ptr)
		    declare function QDEndCGContext lib CarbonLib (port as Ptr, ByRef context as Ptr) as Integer
		    
		    CGContextSynchronize contextPtr
		    
		    dim OSError as Integer = QDEndCGContext(me.Port, contextPtr)
		    if OSError <> 0 then
		      break
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Port As Ptr
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

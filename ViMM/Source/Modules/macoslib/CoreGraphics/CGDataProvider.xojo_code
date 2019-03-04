#tag Class
Class CGDataProvider
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGDataProviderGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data as CFData)
		  if data is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGDataProviderCreateWithCFData lib CarbonLib (data as Ptr) as Ptr
		    
		    super.Constructor CGDataProviderCreateWithCFData(data), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url as CFURL)
		  if url is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGDataProviderCreateWithURL lib CarbonLib (url as Ptr) as Ptr
		    
		    super.Constructor CGDataProviderCreateWithURL(url), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyData() As CFData
		  
		  #if TargetMacOS
		    soft declare function CGDataProviderCopyData lib CarbonLib ( provider as Ptr ) as Ptr
		    return  new CFData( CGDataProviderCopyData( me ), false )
		  #endif
		End Function
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

#tag Class
Class CGImageSource
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGImageSourceGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url as CFURL)
		  if url = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageSourceCreateWithURL lib CarbonLib (url as Ptr, options as Ptr) as Ptr
		    
		    super.Constructor CGImageSourceCreateWithURL(url, nil), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Image(index as Integer) As CGImage
		  if me = nil then
		    return new CGImage(nil)
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageSourceCreateImageAtIndex lib CarbonLib (isrc as Ptr, index as Integer, options as Ptr) as Ptr
		    
		    return new CGImage(CGImageSourceCreateImageAtIndex(me, index, nil), true)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetaData(index as Integer) As CFDictionary
		  #if TargetMacOS
		    soft declare function CGImageSourceCopyPropertiesAtIndex lib CarbonLib (isrc as Ptr, index as Integer, options as Ptr) as Ptr
		    
		    return new CFDictionary(CGImageSourceCopyPropertiesAtIndex(me, index, nil), hasOwnership)
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
			    soft declare function CGImageSourceGetCount lib CarbonLib  (isrc as Ptr) as Integer
			    
			    return CGImageSourceGetCount(me)
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
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

#tag Class
Class CGImageDestination
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddImage(image as CGImage)
		  if image is nil then
		    return
		  end if
		  
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    'void CGImageDestinationAddImage (
		    'CGImageDestinationRef idst,
		    'CGImageRef image,
		    'CFDictionaryRef properties -- should add support for this sometime
		    ');
		    
		    soft declare sub CGImageDestinationAddImage lib CarbonLib (idst as Ptr, image as Ptr, properties as Ptr)
		    
		    CGImageDestinationAddImage me, image, nil
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGImageDestinationGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(URL as CFURL, type as String, imageCount as Integer = 1)
		  #if targetMacOS
		    soft declare function CGImageDestinationCreateWithURL lib CarbonLib (url as ptr, type as CFStringRef, count as Integer, options as Ptr) as Ptr
		    
		    static ReservedForFutureUse as Ptr = nil
		    super.Constructor CGImageDestinationCreateWithURL(URL, type, imageCount, ReservedForFutureUse), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Finalize() As Boolean
		  if me = nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageDestinationFinalize lib CarbonLib (idst as Ptr) as Boolean
		    
		    return CGImageDestinationFinalize(me)
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

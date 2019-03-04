#tag Class
Class CFAttributedString
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return self.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CoreFoundation.framework alias "CFAttributedStringGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(text as String, withAttributes as CFDictionary = nil)
		  #if targetMacOS
		    declare function CFAttributedStringCreate lib CoreFoundation.framework (alloc as Ptr, str as CFStringRef, attr as CFTypeRef) as CFTypeRef
		    
		    
		    dim attrRef as CFTypeRef
		    if withAttributes <> nil then
		      attrRef = withAttributes.Handle
		    end if
		    
		    self.Constructor (CFAttributedStringCreate(nil, text, attrRef), hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString() As String
		  #if TargetMacOS
		    declare function CFAttributedStringGetString lib CoreFoundation.framework (hdl as CFTypeRef) as CFStringRef
		    
		    if self <> nil then
		      return CFAttributedStringGetString(self)
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As Integer
		  #if TargetMacOS
		    declare function CFAttributedStringGetLength lib CoreFoundation.framework (hdl as CFTypeRef) as Integer
		    
		    if self <> nil then
		      return CFAttributedStringGetLength(self)
		    else
		      return 0
		    end if
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

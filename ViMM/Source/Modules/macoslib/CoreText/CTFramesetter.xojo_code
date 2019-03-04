#tag Class
Class CTFramesetter
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return CTFramesetter.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CTFramesetterGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(attributedText as CFAttributedString)
		  #if TargetMacOS
		    declare function CTFramesetterCreateWithAttributedString lib CarbonLib (attrStr as Ptr) as Ptr
		    
		    super.Constructor (CTFramesetterCreateWithAttributedString (attributedText), CFType.hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(txt as String)
		  #if TargetMacOS
		    dim cfa as new CFAttributedString (txt)
		    self.Constructor (cfa)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateFrame(stringRange as CFRange, path as CGPath, frameAttributes as CFDictionary) As CTFrame
		  #if TargetMacOS
		    declare function CTFramesetterCreateFrame lib CarbonLib (fs as Ptr, r as CFRange, path as Ptr, frameAttributes as Ptr) as Ptr
		    
		    dim fa as Ptr
		    if frameAttributes <> nil then fa = frameAttributes
		    dim p as Ptr = CTFramesetterCreateFrame (self, stringRange, path, fa)
		    
		    return new CTFrame (p, hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SuggestFrameSizeWithConstraints(stringRange as CFRange, frameAttributes as CFDictionary, constraints as CGSize, ByRef fitRange as CFRange) As CGSize
		  #if TargetMacOS
		    declare function CTFramesetterSuggestFrameSizeWithConstraints lib CarbonLib (fs as Ptr, stringRange as CFRange, frameAttributes as Ptr, constraints as CGSize, ByRef fitRange as CFRange) as CGSize
		    
		    return CTFramesetterSuggestFrameSizeWithConstraints (self, stringRange, frameAttributes, constraints, fitRange)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Typesetter() As CTTypesetter
		  #if TargetMacOS
		    declare function CTFramesetterGetTypesetter lib CarbonLib (fs as Ptr) as Ptr
		    
		    return new CTTypesetter (CTFramesetterGetTypesetter (self), not hasOwnership)
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

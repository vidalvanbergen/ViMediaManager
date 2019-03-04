#tag Class
Class CTTypesetter
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return CTTypesetter.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if TargetMacOS
		    declare function TypeID lib CarbonLib alias "CTTypesetterGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(attributedText as CFAttributedString)
		  #if TargetMacOS
		    declare function CTTypesetterCreateWithAttributedString lib CarbonLib (attrStr as Ptr) as Ptr
		    
		    super.Constructor (CTTypesetterCreateWithAttributedString (attributedText), CFType.hasOwnership)
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
		Function CreateLine(range as CFRange) As CTLine
		  #if TargetMacOS
		    declare function CTTypesetterCreateLine lib CarbonLib (ts as Ptr, range as CFRange) as Ptr
		    
		    return new CTLine (CTTypesetterCreateLine (self, range), hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SuggestLineBreak(startIdx as Integer, width as Double) As Integer
		  ' startIdx: The starting point for the line-break calculations. The break calculations include the character starting at startIndex.
		  
		  #if TargetMacOS
		    declare function CTTypesetterSuggestLineBreak lib CarbonLib (ts as Ptr, start as Integer, width as Double) as Integer
		    
		    return CTTypesetterSuggestLineBreak (self, startIdx, width)
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

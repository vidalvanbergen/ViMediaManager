#tag Class
Class CFCharacterSet
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    soft declare function TypeID lib CarbonLib alias "CFCharacterSetGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(theSetIdentifier as PredefinedSet)
		  #if TargetMacOS
		    declare function CFCharacterSetGetPredefined lib CarbonLib (theSetIdentifier as Integer) as Ptr
		    
		    super.Constructor (CFCharacterSetGetPredefined (Integer(theSetIdentifier)), false)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(char as String) As Boolean
		  #if targetMacOS
		    if char.Encoding is nil then
		      return false
		    end if
		    
		    soft declare function CFCharacterSetIsCharacterMember lib CarbonLib (theSet as Ptr, theChar as Int16) as Boolean
		    
		    return CFCharacterSetIsCharacterMember(me.Reference, Asc(ConvertEncoding(char, Encodings.UTF16)))
		  #endif
		End Function
	#tag EndMethod


	#tag Enum, Name = PredefinedSet, Type = Integer, Flags = &h0
		unused
		  control = 1
		  whitespace
		  whitespaceAndNewline
		  decimalDigit
		  letter
		  lowercaseLetter
		  uppercaseLetter
		  nonBase
		  decomposable
		  alphaNumeric
		  punctuation
		  capitalizedLetter
		  symbol
		  newline
		illegal
	#tag EndEnum


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

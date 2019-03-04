#tag Class
Class NSCharacterSet
Inherits NSObject
	#tag Method, Flags = &h0
		Function AllowedCharacters() As string
		  #if TargetMacOS
		    dim mb as MemoryBlock
		    dim value as integer
		    dim result as string = DefineEncoding( "", Encodings.UTF16 )
		    
		    mb = me.BitmapRepresentation.Data
		    
		    for byteNbr as integer = 0 to 8191
		      value = mb.Byte( byteNbr )
		      
		      for bitNbr as integer = 0 to 7
		        if  BitWise.BitAnd( value, RealBasic.Pow( 2., bitNbr ))<>0 then
		          result = result + Encodings.UTF16.Chr( byteNbr * 8 + bitNbr )
		        end if
		      next
		    next
		    
		    return  result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AlphanumericCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the characters in the categories Letters, Marks, and Numbers.
		  
		  #if TargetMacOS
		    declare function alphanumericCharacterSet lib CocoaLib selector "alphanumericCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = alphanumericCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BitmapRepresentation() As NSData
		  //# Returns an NSData object encoding the NSCharacterSet in binary format.
		  
		  #if TargetMacOS
		    declare function bitmapRepresentation lib CocoaLib selector "bitmapRepresentation" (id as Ptr) as Ptr
		    
		    dim p as Ptr = bitmapRepresentation( me.id )
		    
		    if p<>nil then
		      return   new NSData( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CapitalizedLetterCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the characters in the category of Titlecase Letters.
		  
		  #if TargetMacOS
		    declare function capitalizedLetterCharacterSet lib CocoaLib selector "capitalizedLetterCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = capitalizedLetterCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharacterIsMember(theCharacter as String) As Boolean
		  //# Returns a Boolean value that indicates whether a given character is in the NSCharacterSet.
		  
		  #if TargetMacOS
		    dim mb as MemoryBlock = theCharacter.ConvertEncoding( Encodings.UTF16 )
		    
		    declare function characterIsMember lib CocoaLib selector "characterIsMember:" (id as Ptr, theChar as UInt16) as Boolean
		    
		    return   characterIsMember( me.id, mb.UInt16Value( 0 ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CharacterSetWithBitmapRepresentation(data as NSData) As NSCharacterSet
		  //# Returns a character set containing characters determined by a given bitmap representation.
		  
		  #if TargetMacOS
		    declare function characterSetWithBitmapRepresentation lib CocoaLib selector "characterSetWithBitmapRepresentation:" (obj_id as Ptr, data as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim charSetRef as Ptr = characterSetWithBitmapRepresentation(ClassRef, dataRef)
		    
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #else
		    #pragma unused data
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CharacterSetWithRange(aRange as Cocoa.NSRange) As NSCharacterSet
		  //# Returns a character set containing characters with Unicode values in a given range.
		  
		  #if TargetMacOS
		    declare function characterSetWithRange lib CocoaLib selector "characterSetWithRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		    
		    dim charSetRef as Ptr = characterSetWithRange(ClassRef, aRange)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSCharacterSet")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlCharacterSet() As NSCharacterSet
		  
		  #if TargetMacOS
		    declare function controlCharacterSet lib CocoaLib selector "controlCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = controlCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromFile(file as FolderItem) As NSCharacterSet
		  //# Returns a character set read from the bitmap representation stored in the file a given path.
		  
		  #if TargetMacOS
		    declare function characterSetWithContentsOfFile lib CocoaLib selector "characterSetWithContentsOfFile:" (obj_id as Ptr, path as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim charSetRef as Ptr = characterSetWithContentsOfFile(ClassRef, file.POSIXPath)
		      if charSetRef <> nil then
		        return new NSCharacterSet(charSetRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromString(theString as String) As NSCharacterSet
		  //# Returns a character set containing the characters in a given string.
		  
		  #if TargetMacOS
		    declare function characterSetWithCharactersInString lib CocoaLib selector "characterSetWithCharactersInString:" (cls as Ptr, theStr as CFStringRef) as Ptr
		    
		    dim chars as string = theString.ConvertEncoding( Encodings.UTF16 )
		    return  new NSCharacterSet( characterSetWithCharactersInString( Cocoa.NSClassFromString( "NSCharacterSet" ), chars), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DecimalDigitCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the characters in the category of Decimal Numbers.
		  
		  #if TargetMacOS
		    declare function decimalDigitCharacterSet lib CocoaLib selector "decimalDigitCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = decimalDigitCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DecomposableCharacterSet() As NSCharacterSet
		  //# Returns a character set containing all individual Unicode characters that can also be represented as composed character sequences.
		  
		  //@Return: A character set containing all individual Unicode characters that can also be represented as composed character sequences _
		  // (such as for letters with accents), by the definition of “standard decomposition” in version 3.2 of the Unicode character encoding _
		  // standard.
		  
		  //@Discussion: These characters include compatibility characters as well as pre-composed characters.
		  
		  //@Note: This character set doesn’t currently include the Hangul characters defined in version 2.0 of the Unicode standard.
		  
		  #if TargetMacOS
		    declare function decomposableCharacterSet lib CocoaLib selector "decomposableCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = decomposableCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasMemberInPlane(thePlane as UInt8) As Boolean
		  //# Returns a Boolean value that indicates whether the NSCharacterSet has at least one member in a given character plane.
		  
		  #if TargetMacOS
		    declare function hasMemberInPlane lib CocoaLib selector "hasMemberInPlane:" (obj_id as Ptr, thePlane as UInt8) as Boolean
		    
		    return hasMemberInPlane(self, thePlane)
		  #else
		    #pragma unused thePlane
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IllegalCharacterSet() As NSCharacterSet
		  //# Returns a character set containing values in the category of Non-Characters or that have not yet been defined in version 3.2 of the Unicode standard.
		  
		  #if TargetMacOS
		    declare function illegalCharacterSet lib CocoaLib selector "illegalCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = illegalCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InvertedSet() As NSCharacterSet
		  //# Returns a character set containing only characters that don’t exist in the NSCharacterSet.
		  
		  #if TargetMacOS
		    declare function invertedSet lib CocoaLib selector "invertedSet:" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = invertedSet(self)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSupersetOfSet(theOtherSet as NSCharacterSet) As Boolean
		  //# Returns a Boolean value that indicates whether the NSCharacterSet is a superset of another given character set.
		  
		  #if TargetMacOS
		    declare function isSupersetOfSet lib CocoaLib selector "isSupersetOfSet:" (obj_id as Ptr, theOtherSet as Ptr) as Boolean
		    
		    dim otherSetRef as Ptr
		    if theOtherSet <> nil then
		      otherSetRef = theOtherSet
		    end if
		    
		    return isSupersetOfSet(self, otherSetRef)
		  #else
		    #pragma unused theOtherSet
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LetterCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the characters in the categories Letters and Marks.
		  
		  #if TargetMacOS
		    declare function letterCharacterSet lib CocoaLib selector "letterCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = letterCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongCharacterIsMember(theLongChar as UInt32) As Boolean
		  //# Returns a Boolean value that indicates whether a given long character is a member of the NSCharacterSet.
		  
		  #if TargetMacOS
		    declare function longCharacterIsMember lib CocoaLib selector "longCharacterIsMember:" (obj_id as Ptr, theLongChar as UInt32) as Boolean
		    
		    return longCharacterIsMember(self, theLongChar)
		  #else
		    #pragma unused theLongChar
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LowercaseLetterCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the characters in the category of Lowercase Letters.
		  
		  #if TargetMacOS
		    declare function lowercaseLetterCharacterSet lib CocoaLib selector "lowercaseLetterCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = lowercaseLetterCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeMutableCopy() As NSMutableCharacterSet
		  #if TargetMacOS
		    return  new NSMutableCharacterSet( NSObject( me ).id, true )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewlineCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the newline characters.
		  
		  #if TargetMacOS
		    declare function newlineCharacterSet lib CocoaLib selector "newlineCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = newlineCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NonBaseCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the characters in the category of Marks.
		  
		  #if TargetMacOS
		    declare function nonBaseCharacterSet lib CocoaLib selector "nonBaseCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = nonBaseCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PunctuationCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the characters in the category of Punctuation.
		  
		  #if TargetMacOS
		    declare function punctuationCharacterSet lib CocoaLib selector "punctuationCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = punctuationCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SymbolCharacterSet() As NSCharacterSet
		  //# Returns a character set containing the characters in the category of Symbols.
		  
		  #if TargetMacOS
		    declare function symbolCharacterSet lib CocoaLib selector "symbolCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = symbolCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UppercaseLetterCharacterSet() As NSCharacterSet
		  //@ Returns a character set containing the characters in the categories of Uppercase Letters and Titlecase Letters.
		  
		  #if TargetMacOS
		    declare function uppercaseLetterCharacterSet lib CocoaLib selector "uppercaseLetterCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = uppercaseLetterCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WhitespaceAndNewlineCharacterSet() As NSCharacterSet
		  //# Returns a character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
		  
		  #if TargetMacOS
		    declare function whitespaceAndNewlineCharacterSet lib CocoaLib selector "whitespaceAndNewlineCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = whitespaceAndNewlineCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WhitespaceCharacterSet() As NSCharacterSet
		  //# Returns a character set containing only the in-line whitespace characters space (U+0020) and tab (U+0009).
		  
		  #if TargetMacOS
		    declare function whitespaceCharacterSet lib CocoaLib selector "whitespaceCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = whitespaceCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
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

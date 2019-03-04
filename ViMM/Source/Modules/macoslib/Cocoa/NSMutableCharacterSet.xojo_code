#tag Class
Class NSMutableCharacterSet
Inherits NSCharacterSet
	#tag Method, Flags = &h0
		Sub AddCharacters(aRange as Cocoa.NSRange)
		  
		  #if TargetMacOS
		    declare sub addCharactersInRange lib CocoaLib selector "addCharactersInRange:" (obj_id as Ptr, aRange as Cocoa.NSRange)
		    
		    addCharactersInRange self, aRange
		    
		  #else
		    #pragma unused aRange
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCharacters(aString as String)
		  
		  #if TargetMacOS
		    declare sub addCharactersInString lib CocoaLib selector "addCharactersInString:" (obj_id as Ptr, aString as CFStringRef)
		    
		    addCharactersInString self, aString
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCharactersInString(theString as CFStringRef)
		  #if TargetMacOS
		    declare sub addCharactersInString lib CocoaLib selector "addCharactersInString:" (id as Ptr, thestr as CFStringRef)
		    
		    addCharactersInString(self, theString)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AlphanumericCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function alphanumericCharacterSet lib CocoaLib selector "alphanumericCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = alphanumericCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CapitalizedLetterCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function capitalizedLetterCharacterSet lib CocoaLib selector "capitalizedLetterCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = capitalizedLetterCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CharacterSetWithBitmapRepresentation(data as NSData) As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function characterSetWithBitmapRepresentation lib CocoaLib selector "characterSetWithBitmapRepresentation:" (obj_id as Ptr, data as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim charSetRef as Ptr = characterSetWithBitmapRepresentation(ClassRef, dataRef)
		    
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #else
		    #pragma unused data
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CharacterSetWithCharactersInString(aString as String) As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function characterSetWithCharactersInString lib CocoaLib selector "characterSetWithCharactersInString:" (obj_id as Ptr, aString as CFStringRef) as Ptr
		    
		    dim charSetRef as Ptr = characterSetWithCharactersInString(ClassRef, aString)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CharacterSetWithContentsOfFile(file as FolderItem) As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function characterSetWithContentsOfFile lib CocoaLib selector "characterSetWithContentsOfFile:" (obj_id as Ptr, path as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim charSetRef as Ptr = characterSetWithContentsOfFile(ClassRef, file.POSIXPath)
		      if charSetRef <> nil then
		        return new NSMutableCharacterSet(charSetRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CharacterSetWithRange(aRange as Cocoa.NSRange) As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function characterSetWithRange lib CocoaLib selector "characterSetWithRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		    
		    dim charSetRef as Ptr = characterSetWithRange(ClassRef, aRange)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSMutableCharacterSet")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    self.Constructor(NSObject.Initialize(NSObject.Allocate("NSMutableCharacterSet")), hasOwnership)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function controlCharacterSet lib CocoaLib selector "controlCharacterSet" (obj_id as Ptr) as Ptr
		    
		    return new NSMutableCharacterSet(controlCharacterSet(ClassRef))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DecimalDigitCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function decimalDigitCharacterSet lib CocoaLib selector "decimalDigitCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = decimalDigitCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DecomposableCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function decomposableCharacterSet lib CocoaLib selector "decomposableCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = decomposableCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FormIntersectionWithCharacterSet(charSet as NSCharacterSet)
		  #if TargetMacOS
		    declare sub formIntersectionWithCharacterSet lib CocoaLib selector "formIntersectionWithCharacterSet:" (id as Ptr, chars as Ptr)
		    
		    formIntersectionWithCharacterSet(self, charSet)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FormUnionWithCharacterSet(charSet as NSCharacterSet)
		  #if TargetMacOS
		    declare sub formUnionWithCharacterSet lib CocoaLib selector "formUnionWithCharacterSet:" (id as Ptr, chars as Ptr)
		    
		    formUnionWithCharacterSet(self, charSet)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IllegalCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function illegalCharacterSet lib CocoaLib selector "illegalCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = illegalCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Intersect(otherSet as NSCharacterSet)
		  
		  #if TargetMacOS
		    declare sub formIntersectionWithCharacterSet lib CocoaLib selector "formIntersectionWithCharacterSet:" (obj_id as Ptr, otherSet as Ptr)
		    
		    dim otherSetRef as Ptr
		    if otherSet <> nil then
		      otherSetRef = otherSet
		    end if
		    
		    formIntersectionWithCharacterSet self, otherSetRef
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invert()
		  
		  #if TargetMacOS
		    declare sub invert lib CocoaLib selector "invert" (obj_id as Ptr)
		    
		    invert self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LetterCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function letterCharacterSet lib CocoaLib selector "letterCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = letterCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LowercaseLetterCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function lowercaseLetterCharacterSet lib CocoaLib selector "lowercaseLetterCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = lowercaseLetterCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewlineCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function newlineCharacterSet lib CocoaLib selector "newlineCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = newlineCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NonBaseCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function nonBaseCharacterSet lib CocoaLib selector "nonBaseCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = nonBaseCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PunctuationCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function punctuationCharacterSet lib CocoaLib selector "punctuationCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = punctuationCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveCharacters(aRange as Cocoa.NSRange)
		  
		  #if TargetMacOS
		    declare sub removeCharactersInRange lib CocoaLib selector "removeCharactersInRange:" (obj_id as Ptr, aRange as Cocoa.NSRange)
		    
		    removeCharactersInRange self, aRange
		    
		  #else
		    #pragma unused aRange
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveCharacters(aString as String)
		  
		  #if TargetMacOS
		    declare sub removeCharactersInString lib CocoaLib selector "removeCharactersInString:" (obj_id as Ptr, aString as CFStringRef)
		    
		    removeCharactersInString self, aString
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveCharactersInString(theString as NSString)
		  #if TargetMacOS
		    declare sub removeCharactersInString lib CocoaLib selector "removeCharactersInString:" (id as Ptr, aString as Ptr)
		    declare sub string_ lib CocoaLib selector "string" (class_id as Ptr)
		    
		    if theString = nil then
		      //we treat it the same as an empty string; removeCharactersInString does nothing when aString = "".
		      return
		    end if
		    
		    removeCharactersInString(self, theString)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SymbolCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function symbolCharacterSet lib CocoaLib selector "symbolCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = symbolCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Union(otherSet as NSCharacterSet)
		  
		  #if TargetMacOS
		    declare sub formUnionWithCharacterSet lib CocoaLib selector "formUnionWithCharacterSet:" (obj_id as Ptr, otherSet as Ptr)
		    
		    dim otherSetRef as Ptr
		    if otherSet <> nil then
		      otherSetRef = otherSet
		    end if
		    
		    formUnionWithCharacterSet self, otherSetRef
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UppercaseLetterCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function uppercaseLetterCharacterSet lib CocoaLib selector "uppercaseLetterCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = uppercaseLetterCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WhitespaceAndNewlineCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function whitespaceAndNewlineCharacterSet lib CocoaLib selector "whitespaceAndNewlineCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = whitespaceAndNewlineCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WhitespaceCharacterSet() As NSMutableCharacterSet
		  
		  #if TargetMacOS
		    declare function whitespaceCharacterSet lib CocoaLib selector "whitespaceCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = whitespaceCharacterSet(ClassRef)
		    if charSetRef <> nil then
		      return new NSMutableCharacterSet(charSetRef)
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

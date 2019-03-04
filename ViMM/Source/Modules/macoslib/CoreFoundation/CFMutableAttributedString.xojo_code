#tag Class
Class CFMutableAttributedString
Inherits CFAttributedString
	#tag Method, Flags = &h0
		Sub BeginEditing()
		  #if TargetMacOS
		    declare sub CFAttributedStringBeginEditing lib CarbonLib (hdl as Ptr)
		    
		    CFAttributedStringBeginEditing (self)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(maxLength as Integer = 0)
		  #if targetMacOS
		    declare function CFAttributedStringCreateMutable lib CarbonLib (alloc as Ptr, maxLength as Integer) as Ptr
		    
		    if maxLength < 0 then maxLength = 0
		    self.Constructor (CFAttributedStringCreateMutable (nil, maxLength), hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(text as String, withAttributes as CFDictionary = nil)
		  ' This overrides the same constructor of the super class in order to prevent a
		  ' user from accidentally creating a non-mutable object when he tries to pass a
		  ' string to this class' constructor.
		  
		  #if targetMacOS
		    self.Constructor (0) ' constructs the mutable object
		    dim fullRange as CFRange = CFRangeMake (0, self.Length)
		    self.ReplaceString fullRange, text
		    if withAttributes <> nil then
		      self.SetAttributes fullRange, withAttributes, false
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy(maxLength as Integer = 0) As CFMutableAttributedString
		  #if targetMacOS
		    declare function CFAttributedStringCreateMutableCopy lib CarbonLib (alloc as Ptr, maxLength as Integer, fromStr as Ptr) as Ptr
		    
		    if maxLength < 0 then maxLength = 0
		    return new CFMutableAttributedString (CFAttributedStringCreateMutableCopy (nil, maxLength, self), hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndEditing()
		  #if TargetMacOS
		    declare sub CFAttributedStringEndEditing lib CarbonLib (hdl as Ptr)
		    
		    CFAttributedStringEndEditing (self)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MutableString() As CFMutableString
		  #if targetMacOS
		    declare function CFAttributedStringGetMutableString lib CarbonLib (ref as Ptr) as Ptr
		    
		    return new CFMutableString (CFAttributedStringGetMutableString (self), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceAttributedString(range as CFRange, replacement as CFAttributedString)
		  #if targetMacOS
		    declare sub CFAttributedStringReplaceAttributedString lib CarbonLib (ref as Ptr, range as CFRange, replacement as Ptr)
		    
		    CFAttributedStringReplaceAttributedString (self, range, replacement)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceString(range as CFRange, replacement as String)
		  #if targetMacOS
		    declare sub CFAttributedStringReplaceString lib CarbonLib (ref as Ptr, range as CFRange, replacement as CFStringRef)
		    
		    CFAttributedStringReplaceString (self, range, replacement)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttribute(range as CFRange, attrName as String, attrValue as CFType)
		  #if targetMacOS
		    declare sub CFAttributedStringSetAttribute lib CarbonLib (ref as Ptr, range as CFRange, attrName as CFStringRef, attrValue as Ptr)
		    
		    CFAttributedStringSetAttribute (self, range, attrName, attrValue)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttributes(range as CFRange, replacement as CFDictionary, clearOtherAttributes as Boolean)
		  #if targetMacOS
		    declare sub CFAttributedStringSetAttributes lib CarbonLib (ref as Ptr, range as CFRange, repl as Ptr, clearOtherAttributes as Boolean)
		    
		    CFAttributedStringSetAttributes (self, range, replacement, clearOtherAttributes)
		  #endif
		End Sub
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

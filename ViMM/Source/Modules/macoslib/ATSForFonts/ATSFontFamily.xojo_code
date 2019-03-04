#tag Class
Class ATSFontFamily
	#tag Method, Flags = &h0
		Shared Function FindFromName(name as String) As ATSFontFamily
		  #if targetMacOS
		    soft declare function ATSFontFamilyFindFromName lib CarbonLib (iName as CFStringRef, iOptions as UInt32) as UInt32
		    
		    dim theRef as UInt32 = ATSFontFamilyFindFromName(name, kATSOptionFlagsDefault)
		    if theRef <> kInvalidFontFamily then
		      dim theFontFamily as new ATSFontFamily
		      theFontFamily.ATSFontFamilyRef = theRef
		      return theFontFamily
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Operator_Convert() As UInt32
		  return me.ATSFontFamilyRef
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ATSFontFamilyRef As UInt32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.ATSFontFamilyRef = kInvalidFontFamily then
			    return ""
			  end if
			  
			  #if targetMacOS
			    soft declare function ATSFontFamilyGetName lib CarbonLib (iFamily as UInt32, iOptions as UInt32, ByRef oName as CFStringRef) as Integer
			    
			    dim theName as CFStringRef
			    dim OSError as Integer = ATSFontFamilyGetName(me.ATSFontFamilyRef, kATSOptionFlagsDefault, theName)
			    if OSError = noErr then
			      return theName
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function ATSFontFamilyGetQuickDrawName lib CarbonLib (iFamily as UInt32, oName as Ptr) as Integer
			    
			    dim qdName as new MemoryBlock(256)
			    dim OSError as Integer = ATSFontFamilyGetQuickDrawName(me.ATSFontFamilyRef, qdName)
			    return DefineEncoding(qdName.PString(0), Encodings.MacRoman)
			    
			    // Keep the compiler from complaining
			    #pragma unused OSError
			  #endif
			End Get
		#tag EndGetter
		QuickDrawName As String
	#tag EndComputedProperty


	#tag ViewBehavior
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
			Name="QuickDrawName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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

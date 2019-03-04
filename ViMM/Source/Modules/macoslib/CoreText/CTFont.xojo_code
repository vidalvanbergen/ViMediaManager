#tag Class
Class CTFont
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return CTFont.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CTFontGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithName(name as String, size as Double = 0.0) As CTFont
		  'CTFontRef CTFontCreateWithName (
		  'CFStringRef name,
		  'CGFloat size,
		  'const CGAffineTransform *matrix
		  ');
		  
		  //According to the CTFont documentation, the default font size is currently 12.0.
		  
		  #if targetMacOS
		    soft declare function CTFontCreateWithName lib CarbonLib (name as CFStringRef, size as Double, matrix as Ptr) as Ptr
		    
		    dim p as Ptr = CTFontCreateWithName(name, size, nil)
		    if p = nil then
		      return nil
		    end if
		    
		    return new CTFont(p, true)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportedLanguages() As CFArray
		  #if targetMacOS
		    soft declare function CTFontCopySupportedLanguages lib CarbonLib (font as Ptr) as Ptr
		    
		    return new CFArray(CTFontCopySupportedLanguages(self), CFType.hasOwnership)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function CTFontCopyFullName lib CarbonLib (font as Ptr) as CFStringRef
			    
			    return CTFontCopyFullName(me)
			  #endif
			End Get
		#tag EndGetter
		FullName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function CTFontGetSize lib CarbonLib (font as Ptr) as Double
			    
			    return CTFontGetSize(me)
			  #endif
			End Get
		#tag EndGetter
		Size As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullName"
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
			Name="Size"
			Group="Behavior"
			Type="Double"
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

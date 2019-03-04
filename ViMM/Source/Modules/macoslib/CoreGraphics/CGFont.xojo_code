#tag Class
Class CGFont
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CanCreatePostScriptSubset(format as CGFontPostScriptFormat) As Boolean
		  #if TargetMacOS
		    
		    soft declare function CGFontCanCreatePostScriptSubset lib CarbonLib (font as Ptr, format as CGFontPostScriptFormat) as Boolean
		    
		    return CGFontCanCreatePostScriptSubset(me, format)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGFontGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(variations as CFDictionary) As CGFont
		  #if TargetMacOS
		    
		    if variations is nil then
		      dim oops as new NilObjectException
		      oops.Message = "CGFont.Clone: variations cannot be nil."
		      raise oops
		    end if
		    
		    soft declare function CGFontCreateCopyWithVariations lib CarbonLib (font as Ptr, variations as Ptr) as Ptr
		    
		    return new CGFont(CGFontCreateCopyWithVariations(me, variations), true)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(font as ATSFont) As CGFont
		  if font is nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGFontCreateWithPlatformFont lib CarbonLib (ByRef platformFontReference as UInt32) as Ptr
		    
		    dim fontRef as UInt32 = font
		    dim theCGFont as new CGFont(CGFontCreateWithPlatformFont(fontRef), true)
		    if theCGFont <> nil then
		      return theCGFont
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariationAxes() As CFArray
		  #if TargetMacOS
		    
		    soft declare function CGFontCopyVariationAxes lib CarbonLib (font as Ptr) as Ptr
		    
		    dim theArray as new CFArray(CGFontCopyVariationAxes(me), true)
		    if theArray = nil then
		      //font does not support variations
		      return nil
		    else
		      return theArray
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Variations() As CFDictionary
		  #if TargetMacOS
		    
		    soft declare function CGFontCopyVariations lib CarbonLib (font as Ptr) as Ptr
		    
		    dim d as new CFDictionary(CGFontCopyVariations(me), true)
		    if d = nil then
		      //font does not support variations
		      return nil
		    else
		      return d
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    soft declare function CGFontCopyPostScriptName lib CarbonLib (font as Ptr) as CFStringRef
			    
			    return CGFontCopyPostScriptName(me)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		PostScriptName As String
	#tag EndComputedProperty


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
			Name="PostScriptName"
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

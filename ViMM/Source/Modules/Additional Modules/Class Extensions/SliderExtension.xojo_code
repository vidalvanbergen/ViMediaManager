#tag Module
Protected Module SliderExtension
	#tag Method, Flags = &h0
		Function AllowsTickMarkValuesOnly(Extends s as Slider) As Boolean
		  //# Returns a Boolean value indicating whether the slider fixes its values to those values represented by its tick marks.
		  
		  #if TargetCocoa then
		    declare function allowsTickMarkValuesOnly lib CocoaLib selector "allowsTickMarkValuesOnly" (obj_id as Integer) as Boolean
		    
		    return allowsTickMarkValuesOnly(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AllowsTickMarkValuesOnly(Extends s as Slider, assigns value as Boolean)
		  //# Sets whether the slider’s values are fixed to the values represented by the tick marks.
		  
		  #if TargetCocoa then
		    declare sub setAllowsTickMarkValuesOnly lib CocoaLib selector "setAllowsTickMarkValuesOnly:" (obj_id as Integer, value as Boolean)
		    
		    setAllowsTickMarkValuesOnly(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AltIncrementValue(Extends s as Slider) As Double
		  //# Returns the amount by which the slider changes its value when the user Option–drags the slider knob.
		  
		  #if TargetCocoa then
		    declare function altIncrementValue lib CocoaLib selector "altIncrementValue" (obj_id as Integer) as Double
		    
		    return altIncrementValue(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AltIncrementValue(Extends s as Slider, assigns increment as Double)
		  //# Sets the amount by which the slider modifies its value when the user Option-drags the knob.
		  
		  #if TargetCocoa then
		    declare sub setAltIncrementValue lib CocoaLib selector "setAltIncrementValue:" (obj_id as Integer, increment as Double)
		    
		    setAltIncrementValue(s.handle, increment)
		  #else
		    #pragma unused s
		    #pragma unused increment
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ClosestTickMarkValueToValue(Extends s as Slider, value as Double) As Double
		  //# Returns the value of the tick mark closest to the specified value.
		  
		  #if TargetCocoa then
		    declare function closestTickMarkValueToValue lib CocoaLib selector "closestTickMarkValueToValue:" (obj_id as Integer, value as Double) as Double
		    
		    return closestTickMarkValueToValue(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlSize(Extends s as Slider) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Integer) as NSControlSize
		    
		    return controlSize(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends s as Slider, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Integer, value as NSControlSize)
		    
		    setControlSize(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue(Extends s as Slider) As Double
		  //# Returns the value of the slider’s cell as a double-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare function doubleValue lib CocoaLib selector "doubleValue" (obj_id as Integer) as Double
		    
		    return doubleValue(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleValue(Extends s as Slider, Assigns value as Double)
		  //# Sets the value of the slider’s cell using a double-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare sub setDoubleValue lib CocoaLib selector "setDoubleValue:" (obj_id as Integer, value as Double)
		    
		    setDoubleValue(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(Extends s as Slider) As Integer
		  //# Returns the value of the slider’s cell as an NSInteger value.
		  
		  #if TargetCocoa then
		    declare function integerValue lib CocoaLib selector "integerValue" (obj_id as Integer) as Integer
		    
		    return integerValue(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntegerValue(Extends s as Slider, Assigns value as Integer)
		  //# Sets the value of the slider’s cell using an NSInteger value.
		  
		  #if TargetCocoa then
		    declare sub setIntegerValue lib CocoaLib selector "setIntegerValue:" (obj_id as Integer, value as Integer)
		    
		    setIntegerValue(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KnobThickness(Extends s as Slider) As Double
		  //# Returns the knob’s thickness, in pixels.
		  
		  #if TargetCocoa then
		    declare function knobThickness lib CocoaLib selector "knobThickness" (obj_id as Integer) as Double
		    
		    return knobThickness(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub KnobThickness(Extends s as Slider, assigns thickness as Double)
		  //# This method has been deprecated. Lets you set the knob’s thickness, measured in pixels.
		  
		  #if TargetCocoa then
		    declare sub setKnobThickness lib CocoaLib selector "setKnobThickness:" (obj_id as Integer, thickness as Double)
		    
		    setKnobThickness(s.handle, thickness)
		  #else
		    #pragma unused s
		    #pragma unused thickness
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaxValue(Extends s as Slider) As Double
		  //# Returns the maximum value the slider can send to its target.
		  
		  #if TargetCocoa then
		    declare function maxValue lib CocoaLib selector "maxValue" (obj_id as Integer) as Double
		    
		    return maxValue(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MaxValue(Extends s as Slider, Assigns value as Double)
		  //# Sets the maximum value the slider can send to its target.
		  
		  #if TargetCocoa then
		    declare sub setMaxValue lib CocoaLib selector "setMaxValue:" (obj_id as Integer, value as Double)
		    
		    setMaxValue(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MinValue(Extends s as Slider) As Double
		  //# Returns the slider’s minimum value.
		  
		  #if TargetCocoa then
		    declare function minValue lib CocoaLib selector "minValue" (obj_id as Integer) as Double
		    
		    return minValue(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MinValue(Extends s as Slider, Assigns value as Double)
		  //# Sets the minimum value the slider can represent to minValue.
		  
		  #if TargetCocoa then
		    declare sub setMinValue lib CocoaLib selector "setMinValue:" (obj_id as Integer, value as Double)
		    
		    setMinValue(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfTickMarks(Extends s as Slider) As Integer
		  //# Returns the number of tick marks associated with the slider.
		  
		  #if TargetCocoa then
		    declare function numberOfTickMarks lib CocoaLib selector "numberOfTickMarks" (obj_id as Integer) as Integer
		    
		    return numberOfTickMarks(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NumberOfTickMarks(Extends s as Slider, assigns value as Integer)
		  //# Sets the number of tick marks displayed by the slider (which include those assigned to the minimum and maximum values) to numberOfTickMarks.
		  
		  #if TargetCocoa then
		    declare sub setNumberOfTickMarks lib CocoaLib selector "setNumberOfTickMarks:" (obj_id as Integer, value as Integer)
		    
		    setNumberOfTickMarks(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SingleValue(Extends s as Slider) As Double
		  //# Returns the value of the slider’s cell as a single-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare function floatValue lib CocoaLib selector "floatValue" (obj_id as Integer) as Double
		    
		    return floatValue(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SingleValue(Extends s as Slider, Assigns value as Double)
		  //# Sets the value of the slider’s cell using a single-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare sub setFloatValue lib CocoaLib selector "setFloatValue:" (obj_id as Integer, value as Double)
		    
		    setFloatValue(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


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
End Module
#tag EndModule

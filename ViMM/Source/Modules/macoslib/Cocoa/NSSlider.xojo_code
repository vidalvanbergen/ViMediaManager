#tag Class
Class NSSlider
Inherits NSControl
	#tag Event
		Sub Action()
		  
		  raiseEvent ValueChanged
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function NSClassName() As String
		  return "NSSlider"
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.AllowsTickMarkValuesOnly = self.initialallowstickmarkvaluesonly
		  self.NumberOfTickMarks = self.initialnumberoftickmarks
		  self.SliderType = self.initialslidertype
		  self.TickMarkPosition = self.initialtickmarkposition
		  self.ControlSize = self.initialcontrolsize
		  self.MaxValue = self.initialmaxvalue
		  self.MinValue = self.initialminvalue
		  self.Value = self.initialvalue
		  
		  raiseEvent Open
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ClosestTickMarkValueToValue(aValue as Double) As Double
		  
		  #if TargetCocoa
		    
		    declare function closestTickMarkValueToValue lib CocoaLib selector "closestTickMarkValueToValue:" (id as Ptr, aValue as Double) as Double
		    
		    return closestTickMarkValueToValue(self.id, aValue)
		    
		  #else
		    
		    #pragma unused aValue
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetValue(ValueGetter as ValueGetterDelegate, initial_value as Double) As Double
		  #if targetCocoa
		    if self.id <> nil then
		      return ValueGetter.Invoke()
		    else
		      return initial_value
		    end if
		    
		  #else
		    #pragma unused ValueGetter
		    #pragma unused initial_value
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsVertical() As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isVertical lib CocoaLib selector "isVertical" (id as Ptr) as Boolean
		    
		    return isVertical(self.id)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TickMarkValueAtIndex(index as Integer) As Double
		  
		  #if TargetCocoa
		    
		    declare function tickMarkValueAtIndex lib CocoaLib selector "tickMarkValueAtIndex:" (id as Ptr, index as Integer) as Double
		    
		    return tickMarkValueAtIndex(self.id, index)
		    
		  #else
		    
		    #pragma unused index
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function ValueGetterDelegate() As Double
	#tag EndDelegateDeclaration


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function allowsTickMarkValuesOnly lib CocoaLib selector "allowsTickMarkValuesOnly" (id as Ptr) as Boolean
			      
			      return allowsTickMarkValuesOnly(self.id)
			    else
			      return self.initialallowstickmarkvaluesonly
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setAllowsTickMarkValuesOnly lib CocoaLib selector "setAllowsTickMarkValuesOnly:"  (id as Ptr, value as Boolean)
			      
			      setAllowsTickMarkValuesOnly self.id, value
			    else
			      self.initialallowstickmarkvaluesonly = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AllowsTickMarkValuesOnly As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function altIncrementValue lib CocoaLib selector "altIncrementValue" (id as Ptr) as Double
			      
			      return altIncrementValue(self.id)
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setAltIncrementValue lib CocoaLib selector "setAltIncrementValue:"  (id as Ptr, value as Double)
			      
			      setAltIncrementValue self.id, value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AltIncrementValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function cell lib CocoaLib selector "cell" (id as Ptr) as Ptr
			      declare function controlSize lib CocoaLib selector "controlSize" (id as Ptr) as NSControlSize
			      
			      return controlSize(cell(self.id))
			    else
			      return self.initialcontrolsize
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function cell lib CocoaLib selector "cell" (id as Ptr) as Ptr
			      declare sub setControlSize lib CocoaLib selector "setControlSize:"  (id as Ptr, value as NSControlSize)
			      
			      setControlSize cell(self.id), value
			    else
			      self.initialcontrolsize = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ControlSize As NSControlSize
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private initialallowstickmarkvaluesonly As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialcontrolsize As NSControlSize
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialmaxvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialminvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialnumberoftickmarks As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialslidertype As NSSliderType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialtickmarkposition As NSTickMarkPosition
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialvalue As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function maxValue lib CocoaLib selector "maxValue" (id as Ptr) as Double
			      
			      return maxValue(self.id)
			    else
			      return self.initialmaxvalue
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setMaxValue lib CocoaLib selector "setMaxValue:"  (id as Ptr, value as Double)
			      
			      setMaxValue self.id, value
			    else
			      self.initialmaxvalue = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MaxValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function minValue lib CocoaLib selector "minValue" (id as Ptr) as Double
			      
			      return minValue(self.id)
			    else
			      return self.initialminvalue
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setMinValue lib CocoaLib selector "setMinValue:"  (id as Ptr, value as Double)
			      
			      setMinValue self.id, value
			    else
			      self.initialminvalue = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MinValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function numberOfTickMarks lib CocoaLib selector "numberOfTickMarks" (id as Ptr) as Integer
			      
			      return numberOfTickMarks(self.id)
			    else
			      return self.initialnumberoftickmarks
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setNumberOfTickMarks lib CocoaLib selector "setNumberOfTickMarks:"  (id as Ptr, value as Integer)
			      
			      setNumberOfTickMarks self.id, value
			    else
			      self.initialnumberoftickmarks = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		NumberOfTickMarks As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return Integer(ControlSize)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  ControlSize = NSControlSize(value)
			  
			End Set
		#tag EndSetter
		Size As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function cell lib CocoaLib selector "cell" (id as Ptr) as Ptr
			      declare function sliderType lib CocoaLib selector "sliderType" (id as Ptr) as NSSliderType
			      
			      return sliderType(cell(self.id))
			    else
			      return self.initialslidertype
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function cell lib CocoaLib selector "cell" (id as Ptr) as Ptr
			      declare sub setSliderType lib CocoaLib selector "setSliderType:"  (id as Ptr, value as NSSliderType)
			      
			      setSliderType cell(self.id), value
			    else
			      self.initialslidertype = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		SliderType As NSSliderType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function tickMarkPosition lib CocoaLib selector "tickMarkPosition" (id as Ptr) as NSTickMarkPosition
			      
			      return tickMarkPosition(self.id)
			    else
			      return self.initialtickmarkposition
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setTickMarkPosition lib CocoaLib selector "setTickMarkPosition:"  (id as Ptr, value as NSTickMarkPosition)
			      
			      setTickMarkPosition self.id, value
			    else
			      self.initialtickmarkposition = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		TickMarkPosition As NSTickMarkPosition
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return Integer(TickMarkPosition)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  TickMarkPosition = NSTickMarkPosition(value)
			  
			End Set
		#tag EndSetter
		TickPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return Integer(SliderType)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  SliderType = NSSliderType(value)
			End Set
		#tag EndSetter
		Type As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If self.id <> nil then
			    return self.DoubleValue
			  else
			    return self.initialvalue
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if self.id <> nil then
			    self.DoubleValue = value
			    raiseEvent ValueChanged
			  else
			    self.initialvalue = value
			  end if
			End Set
		#tag EndSetter
		Value As Double
	#tag EndComputedProperty


	#tag Enum, Name = NSControlSize, Type = Integer, Flags = &h0
		NSRegularControlSize
		  NSSmallControlSize
		NSMiniControlSize
	#tag EndEnum

	#tag Enum, Name = NSSliderType, Type = Integer, Flags = &h0
		NSLinearSlider
		NSCircularSlider
	#tag EndEnum

	#tag Enum, Name = NSTickMarkPosition, Type = Integer, Flags = &h0
		NSTickMarkBelow
		  NSTickMarkAbove
		  NSTickMarkLeft = 1
		NSTickMarkRight = 0
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Group="Behavior"
			Type="NSTextAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Right"
				"2 - Center"
				"3 - Justified"
				"4 - Natural"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsExpansionToolTips"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsTickMarkValuesOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AltIncrementValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlSize"
			Group="Behavior"
			Type="NSControlSize"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSRegularControlSize"
				"1 - NSSmallControlSize"
				"2 - NSMiniControlSize"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FloatValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxValue"
			Visible=true
			Group="Initial State"
			InitialValue="100"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinValue"
			Visible=true
			Group="Initial State"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumberOfTickMarks"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Size"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Regular"
				"1 - Small"
				"2 - Mini"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SliderType"
			Group="Behavior"
			Type="NSSliderType"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSLinearSlider"
				"1 - NSCircularSlider"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="0.0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TickMarkPosition"
			Group="Behavior"
			Type="NSTickMarkPosition"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSTickMarkBelow"
				"1 - NSTickMarkAbove"
				"1 - NSTickMarkLeft"
				"0 - NSTickMarkRight"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TickPosition"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"1 - Top Left"
				"0 - Bottom Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Linear"
				"1 - Circular"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underlined"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=true
			Group="Initial State"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

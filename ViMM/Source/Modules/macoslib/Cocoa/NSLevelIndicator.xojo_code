#tag Class
Class NSLevelIndicator
Inherits NSControl
	#tag Event
		Function NSClassName() As String
		  return "NSLevelIndicator"
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.CriticalValue = self.initialcriticalvalue
		  self.MaxValue = self.initialmaxvalue
		  self.MinValue = self.initialminvalue
		  self.Value = self.initialvalue
		  self.WarningValue = self.initialwarningvalue
		  self.Style = self.initialstyle
		  
		  raiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function GetCriticalValue() As Double
		  #if targetCocoa
		    soft declare function criticalValue lib CocoaLib selector "criticalValue" (id as Ptr) as Double
		    
		    return criticalValue(self.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMaxValue() As Double
		  #if targetCocoa
		    soft declare function maxValue lib CocoaLib selector "maxValue" (id as Ptr) as Double
		    
		    return maxValue(self.id)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMinValue() As Double
		  #if targetCocoa
		    soft declare function minValue lib CocoaLib selector "minValue" (id as Ptr) as Double
		    
		    return minValue(self.id)
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

	#tag Method, Flags = &h21
		Private Function GetWarningValue() As Double
		  #if targetCocoa
		    soft declare function warningValue lib CocoaLib selector "warningValue" (id as Ptr) as Double
		    
		    return warningValue(self.id)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TickMarkValue(index as Integer) As Double
		  #if targetCocoa
		    declare function tickMarkValueAtIndex lib CocoaLib selector "tickMarkValueAtIndex:" (id as Ptr, index as Integer) as Double
		    
		    if self.id <> nil then
		      return tickMarkValueAtIndex(self.id, index)
		    else
		      return 0.0
		    end if
		    
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.GetValue(AddressOf GetCriticalValue, self.initialcriticalvalue)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if self.id <> nil then
			      soft declare sub setCriticalValue lib CocoaLib selector "setCriticalValue:"  (id as Ptr, criticalValue as Double)
			      
			      setCriticalValue self.id, value
			    else
			      self.initialcriticalvalue = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		CriticalValue As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Attributes( HIdden = true ) Private initialcriticalvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden = true ) Private initialmaxvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialminvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialstyle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialwarningvalue As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    if me.id <> nil then
			      soft declare function numberOfMajorTickMarks lib CocoaLib selector "numberOfMajorTickMarks" (id as Ptr) as Integer
			      
			      return numberOfMajorTickMarks(me.id)
			    else
			      return 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if me.id <> nil then
			      soft declare sub setNumberOfMajorTickMarks lib CocoaLib selector "setNumberOfMajorTickMarks:" (id as Ptr, count as Integer)
			      
			      setNumberOfMajorTickMarks me.id, value
			      
			    else
			      return
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		MajorTickMarks As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.GetValue(AddressOf GetMaxValue, self.initialmaxvalue)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if self.id <> nil then
			      soft declare sub setMaxValue lib CocoaLib selector "setMaxValue:"  (id as Ptr, maxValue as Double)
			      
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
			  return self.GetValue(AddressOf GetMinValue, self.initialminvalue)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if self.id <> nil then
			      soft declare sub setMinValue lib CocoaLib selector "setMinValue:"  (id as Ptr, minValue as Double)
			      
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
			      dim cell_id as Ptr = self.Cell
			      if cell_id = nil then
			        return 0
			      end if
			      
			      soft declare function levelIndicatorStyle lib CocoaLib selector "levelIndicatorStyle" (id as Ptr) as Integer
			      
			      return levelIndicatorStyle(cell_id)
			      
			    else
			      return self.initialstyle
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if self.id <> nil then
			      dim cell_id as Ptr = self.Cell
			      if cell_id = nil then
			        //I think this shouldn't happen; if it does, I just return.
			        return
			      end if
			      
			      soft declare sub setLevelIndicatorStyle lib CocoaLib selector "setLevelIndicatorStyle:"  (id as Ptr, levelIndicatorStyle as Integer)
			      
			      setLevelIndicatorStyle cell_id, value
			      
			    else
			      self.initialstyle = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Style As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function tickMarkPosition lib CocoaLib selector "tickMarkPosition" (id as Ptr) as NSTickMarkPosition
			    
			    if self.id <> nil then
			      return tickMarkPosition(self.id)
			    else
			      return NSTIckMarkPosition.Below
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setTickMarkPosition lib CocoaLib selector "setTickMarkPosition:" (id as Ptr, position as NSTickMarkPosition)
			    
			    if self.id <> nil then
			      setTickMarkPosition self.id, value
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
			  #if targetCocoa
			    if me.id <> nil then
			      soft declare function numberOfTickMarks lib CocoaLib selector "numberOfTickMarks" (id as Ptr) as Integer
			      
			      return numberOfTickMarks(me.id)
			    else
			      return 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if me.id <> nil then
			      soft declare sub setNumberOfTickMarks lib CocoaLib selector "setNumberOfTickMarks:" (id as Ptr, count as Integer)
			      
			      setNumberOfTickMarks me.id, value
			      
			    else
			      return
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TickMarks As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if self.id <> Nil then
			    return self.DoubleValue
			  else
			    return self.initialvalue
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if self.id <> nil then
			    self.DoubleValue = value
			  else
			    self.initialvalue = value
			  end if
			End Set
		#tag EndSetter
		Value As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.GetValue(AddressOf GetWarningValue, self.initialwarningvalue)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if self.id <> nil then
			      soft declare sub setWarningValue lib CocoaLib selector "setWarningValue:"  (id as Ptr, warningValue as Double)
			      
			      setWarningValue self.id, value
			    else
			      self.initialwarningvalue = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		WarningValue As Double
	#tag EndComputedProperty


	#tag Constant, Name = ContinuousCapacityLevelIndicator, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DiscreteCapacityLevelIndicator, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RatingLevelIndicator, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RelevancyLevelIndicator, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSTickMarkPosition, Type = Integer, Flags = &h0
		Below = 0
		Above = 1
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
			Name="CriticalValue"
			Visible=true
			Group="Behavior"
			Type="Double"
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
			Name="MajorTickMarks"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxValue"
			Visible=true
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinValue"
			Visible=true
			Group="Behavior"
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
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Style"
			Visible=true
			Group="Behavior"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - RelevancyLevelIndicator"
				"1 - ContinuousCapacityLevelIndicator"
				"2 - DiscreteCapacityLevelIndicator"
				"3 - RatingLevelIndicator"
			#tag EndEnumValues
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
				"0 - Below"
				"1 - Above"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TickMarks"
			Group="Behavior"
			Type="Integer"
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
			Group="Behavior"
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
			Name="WarningValue"
			Visible=true
			Group="Behavior"
			Type="Double"
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

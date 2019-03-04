#tag Class
Class NSStepper
Inherits NSControl
	#tag Event
		Function NSClassName() As String
		  return "NSStepper"
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.MaxValue = self.initialmaxvalue
		  self.MinValue = self.initialminvalue
		  self.Value = self.initialvalue
		  self.Autorepeat = self.initialautorepeat
		  self.Increment = self.initialincrement
		  self.valueWraps = self.initialvaluewraps
		  
		  raiseEvent Open
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function GetIncrement() As Double
		  #if targetCocoa
		    declare function increment lib CocoaLib selector "increment" (id as Ptr) as Double
		    
		    return increment(self.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMaxValue() As Double
		  #if targetCocoa
		    declare function maxValue lib CocoaLib selector "maxValue" (id as Ptr) as Double
		    
		    return maxValue(self.id)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMinValue() As Double
		  #if targetCocoa
		    declare function minValue lib CocoaLib selector "minValue" (id as Ptr) as Double
		    
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

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function ValueGetterDelegate() As Double
	#tag EndDelegateDeclaration


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function autorepeat lib CocoaLib selector "autorepeat" (id as Ptr) as Boolean
			      
			      return autorepeat(self.id)
			      
			    else
			      return self.initialautorepeat
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setAutorepeat lib CocoaLib selector "setAutorepeat:"  (id as Ptr, autorepeat as Boolean)
			      
			      setAutorepeat self.id, value
			    else
			      self.initialautorepeat = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Autorepeat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.GetValue(AddressOf GetIncrement, self.initialincrement)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setIncrement lib CocoaLib selector "setIncrement:"  (id as Ptr, increment as Double)
			      
			      setIncrement self.id, value
			    else
			      self.initialincrement = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Increment As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private initialautorepeat As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialincrement As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialmaxvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialminvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialvaluewraps As Boolean
	#tag EndProperty

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
			      declare sub setMaxValue lib CocoaLib selector "setMaxValue:"  (id as Ptr, maxValue as Double)
			      
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
			      declare sub setMinValue lib CocoaLib selector "setMinValue:"  (id as Ptr, minValue as Double)
			      
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
			  if self.id <> nil then
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
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function valueWraps lib CocoaLib selector "valueWraps" (id as Ptr) as Boolean
			      
			      return valueWraps(self.id)
			    else
			      return self.initialvaluewraps
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setValueWraps lib CocoaLib selector "setValueWraps:"  (id as Ptr, valueWraps as Boolean)
			      
			      setValueWraps self.id, value
			    else
			      self.initialvaluewraps = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ValueWraps As Boolean
	#tag EndComputedProperty


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
			Name="Autorepeat"
			Visible=true
			Group="Behavior"
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
			Name="Increment"
			Visible=true
			Group="Initial State"
			InitialValue="1"
			Type="Double"
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
			Group="Initial State"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValueWraps"
			Visible=true
			Group="Behavior"
			Type="Boolean"
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

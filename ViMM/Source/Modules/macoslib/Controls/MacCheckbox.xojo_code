#tag Class
Protected Class MacCheckbox
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if me.ControlRef = nil then
		    return false
		  end if
		  
		  return true
		  
		  #pragma unused X
		  #pragma unused Y
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if me.ControlRef = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function HandleControlClick lib CarbonLib (inControl as ptr, inWhere as MacPoint, inModifiers as UInt16, inAction as Ptr) as Int16
		    
		    dim where as MacPoint
		    if me.ParentWindow.Composite then
		      where.v = Y
		      where.h = X
		    else
		      where.v = me.MouseY
		      where.h = me.MouseX
		    end if
		    
		    dim partCode as Int16 = HandleControlClick(me.ControlRef, where, Modifiers(Keyboard.CommandKey, Keyboard.ShiftKey, Keyboard.OptionKey, Keyboard.ControlKey), nil)
		    #pragma unused partCode
		    
		  #else
		    #pragma unused X
		    #pragma unused Y
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.AutoToggle = true
		  me.ControlRef = me.CreateControl
		  
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if me.ControlRef = nil then
		    return
		  end if
		  
		  me.ControlEnabled = me.Enabled
		  
		  #pragma unused g
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CreateControl() As Ptr
		  #if targetMacOS
		    soft declare function CreateCheckBoxControl lib CarbonLib (window as WindowPtr, ByRef boundsRect as MacRect, title as CFStringRef, initialValue as Int32, autoToggle as Boolean, ByRef outControl as Ptr) as Int32
		    
		    dim p as Ptr
		    dim bounds as MacRect
		    bounds.top = me.LocalTop
		    bounds.left = me.LocalLeft
		    bounds.bottom = bounds.Top + me.Height
		    bounds.right = bounds.left + me.Width
		    dim OSError as Integer = CreateCheckBoxControl(me.ParentWindow, bounds, me.InitialCaption, me.InitialValue, me.AutoToggle, p)
		    if OSError = noErr then
		      return p
		    else
		      break
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LocalLeft() As Integer
		  dim w as Window = me.Window
		  if w isA ContainerControl then
		    return w.Left + me.Left
		  else
		    return me.Left
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LocalTop() As Integer
		  dim w as Window = me.Window
		  if w isA ContainerControl then
		    return w.Top + me.Top
		  else
		    return me.Top
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Modifiers(commandKey as Boolean, shiftKey as Boolean, optionKey as Boolean, controlKey as Boolean) As UInt16
		  dim theResult as UInt16
		  if commandKey then
		    theResult = theResult or ShiftLeft(1, Carbon.cmdKeyBit)
		  end if
		  if shiftKey then
		    theResult = theResult or ShiftLeft(1, Carbon.shiftKeyBit)
		  end if
		  if optionKey then
		    theResult = theResult or ShiftLeft(1, Carbon.optionKeyBit)
		  end if
		  if controlKey then
		    theResult = theResult or ShiftLeft(1, Carbon.controlKeyBit)
		  end if
		  
		  return theResult
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParentWindow() As Window
		  dim w as Window = me.Window
		  do
		    if w IsA ContainerControl then
		      w = ContainerControl(w).Window
		    else
		      exit
		    end if
		  loop
		  return w
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Note, Name = Setting Values in IDE
		Values set in the IDE are assigned before the control's Open event handler is called, and thus
		before the Mac OS control is created.  These values are saved to properties and then assigned in the Open event handler.
	#tag EndNote


	#tag Property, Flags = &h0
		AutoToggle As Boolean = true
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    if me.ControlRef <> nil then
			      soft declare function CopyControlTitleAsCFString lib CarbonLib (inControl as Ptr, ByRef outString as CFStringRef) as Integer
			      
			      dim value as CFStringRef
			      dim OSError as Integer = CopyControlTitleAsCFString(me.ControlRef, value)
			      if OSError = noErr then
			        return value
			      else
			        return ""
			      end if
			      
			    else
			      return me.InitialCaption
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //see note Setting Values in IDE for info on pCaption
			  
			  #if targetMacOS
			    dim OSError as Integer
			    if me.ControlRef  <> nil then
			      soft declare function SetControlTitleWithCFString lib CarbonLib (inControl as Ptr, inString as CFStringRef) as Int32
			      
			      OSError = SetControlTitleWithCFString(me.ControlRef, value)
			    else
			      me.InitialCaption = value
			    end if
			    
			    // Keep the compiler from complaining
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Caption As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Setter
			Set
			  if me.ControlRef = nil then
			    return
			  end if
			  
			  
			  #if targetMacOS
			    dim w as Window = me.ParentWindow
			    if w is nil then
			      return
			    end if
			    dim OSError as Integer
			    if w.Composite then
			      soft declare function HIViewSetEnabled lib CarbonLib (inView as Ptr, inSetEnabled as Boolean) as Integer
			      
			      OSError = HIViewSetEnabled(me.ControlRef, value)
			      
			    else
			      if me.Enabled then
			        soft declare function EnableControl lib CarbonLib (inControl as Ptr) as Integer
			        
			        OSError = EnableControl(me.ControlRef)
			        
			      else
			        soft declare function DisableControl lib CarbonLib (inControl as Ptr) as Integer
			        
			        OSError = DisableControl(me.ControlRef)
			      end if
			    end if
			    
			    // Keep the compiler from complaining
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Private ControlEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ControlRef As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if me.ControlRef = nil then
			    return false
			  end if
			  
			  #if targetMacOS
			    soft declare function HIViewIsVisible lib CarbonLib (inView as Ptr) as Boolean
			    
			    return HIViewIsVisible(me.ControlRef)
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if me.ControlRef = nil then
			    return
			  end if
			  
			  #if targetMacOS
			    dim w as Window = me.ParentWindow
			    if w is nil then
			      return
			    end if
			    dim OSError as Integer
			    if w.Composite then
			      soft declare function HIViewSetVisible lib CarbonLib (inView as Ptr, visible as Boolean) as Integer
			      
			      OSError = HIViewSetVisible(me.ControlRef, value)
			    else
			      soft declare function SetControlVisibility lib CarbonLib (inControl as Ptr, inIsVisible as Boolean, inDoDraw as Boolean) as Integer
			      
			      OSError = SetControlVisibility(me.ControlRef, value, true)
			    end if
			    
			    // Keep the compiler from complaining
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Private ControlVisible As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private InitialCaption As String = "MacCheckbox"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAutoToggle As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.ControlRef = nil then
			    return 0
			  end if
			  
			  
			  #if targetMacOS
			    soft declare function GetControl32BitValue lib CarbonLib (theControl as Ptr) as Int32
			    
			    return GetControl32BitValue(me.ControlRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    if me.ControlRef <> nil then
			      soft declare sub SetControl32BitValue lib CarbonLib (theControl as Ptr, newValue as Int32)
			      
			      SetControl32BitValue me.ControlRef, value
			    else
			      me.InitialValue = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Value As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Canvas(me).Visible
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.ControlVisible = value
			  Canvas(me).Visible = value
			End Set
		#tag EndSetter
		Visible As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = Checked, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mixed, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Unchecked, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
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
			Name="AutoToggle"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Behavior"
			InitialValue="MacCheckbox"
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
			Group="Behavior"
			Type="String"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
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
			Name="UseFocusRing"
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unchecked"
				"1 - Checked"
				"2 - Mixed"
			#tag EndEnumValues
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

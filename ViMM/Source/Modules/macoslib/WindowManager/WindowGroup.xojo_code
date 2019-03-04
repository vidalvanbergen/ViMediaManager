#tag Class
Class WindowGroup
	#tag Method, Flags = &h0
		Sub Add(w as Ptr)
		  if w = nil then
		    return
		  end if
		  
		  if me = nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    soft declare function SetWindowGroup lib CarbonLib (inWindow as Ptr, inNewGroup as Ptr) as Integer
		    
		    dim OSError as Integer = SetWindowGroup(w, me.GroupRef)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(w as Window)
		  if w is nil then
		    return
		  end if
		  
		  me.Add Ptr(w.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  #if targetMacOS
		    soft declare function CreateWindowGroup lib CarbonLib (inAttributes as UInt32, ByRef outGroup as Ptr) as Integer
		    
		    dim theRef as Ptr
		    dim OSError as Integer = CreateWindowGroup(0, theRef)
		    if OSError <> 0 then
		      return
		    end if
		    me.Operator_Convert theRef
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(w as Window) As Boolean
		  if w is nil then
		    return false
		  end if
		  
		  if me = nil then
		    return false
		  end if
		  
		  #if TargetMacOS
		    soft declare function IsWindowContainedInGroup lib CarbonLib (inWindow as WindowPtr, inGroup as Ptr) as Boolean
		    
		    return IsWindowContainedInGroup(w, me)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  if me = nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    soft declare function ReleaseWindowGroup lib CarbonLib (inGroup as Ptr) as Integer
		    
		    dim OSError as Integer = ReleaseWindowGroup(me.GroupRef)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DocumentClassWindowGroup() As WindowGroup
		  return WindowGroupOfClass(kDocumentWindowClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsAttributeSet(theAttribute as UInt32) As Boolean
		  if me = nil then
		    return false
		  end if
		  
		  #if TargetMacOS
		    soft declare function GetWindowGroupAttributes lib CarbonLib (inGroup as Ptr, ByRef outAttributes as UInt32) as Integer
		    
		    dim theAttributes as UInt32
		    dim OSError as Integer = GetWindowGroupAttributes(me.GroupRef, theAttributes)
		    return ((theAttributes and kWindowGroupAttrHideOnCollapse) = kWindowGroupAttrHideOnCollapse)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		  
		  #pragma unused theAttribute
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return me.GroupRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(theRef as Ptr)
		  if theRef = nil then
		    return
		  end if
		  
		  me.GroupRef = theRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parent() As WindowGroup
		  if me = nil then
		    return nil
		  end if
		  
		  #if TargetMacOS
		    soft declare function GetWindowGroupParent lib CarbonLib (inGroup as Ptr) as Ptr
		    
		    dim theParent as WindowGroup = GetWindowGroupParent(me.GroupRef)
		    if theParent = nil then
		      return nil
		    end if
		    //Presumably reference counting follows Core Foundation conventions, and this is a Get function.
		    theParent.Retain
		    return theParent
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parent(assigns value as WindowGroup)
		  if me = nil then
		    return
		  end if
		  if value is nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    soft declare function SetWindowGroupParent lib CarbonLib (inGroup as Ptr, inNewGroup as Ptr) as Integer
		    
		    dim OSError as Integer = SetWindowGroupParent(me, value)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function ReleaseWindowGroup lib CarbonLib (inGroup as Ptr) as Integer
		    
		    dim OSError as Integer = ReleaseWindowGroup(me)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Retain()
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function RetainWindowGroup lib CarbonLib (inGroup as Ptr) as Integer
		    
		    dim OSError as Integer = RetainWindowGroup(me.GroupRef)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendBehind(theGroup as WindowGroup)
		  if me = nil then
		    return
		  end if
		  if theGroup is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function SendWindowGroupBehind lib CarbonLib (inGroup as Ptr, behindGroup as Ptr) as Integer
		    
		    dim OSError as Integer = SendWindowGroupBehind(me, theGroup)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetAttribute(theAttribute as UInt32, value as Boolean)
		  if me = nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    soft declare function ChangeWindowGroupAttributes lib CarbonLib (inGroup as Ptr, setTheseAttributes as UInt32, clearTheseAttributes as UInt32) as Integer
		    
		    dim OSError as Integer
		    If value then
		      OSError = ChangeWindowGroupAttributes(me.GroupRef, theAttribute, 0)
		    Else
		      OSError = ChangeWindowGroupAttributes(me.GroupRef, 0, theAttribute)
		    End if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLevel(levelKey as integer)
		  if me = nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    
		    soft declare function CGWindowLevelForKey lib CarbonLib ( key as integer ) as integer
		    
		    soft declare function SetWindowGroupLevel lib CarbonLib ( inGroup as Ptr , inLevel as integer) as Integer
		    
		    dim level as integer
		    dim result as integer
		    
		    level = CGWindowLevelForKey(levelKey)
		    
		    result = SetWindowGroupLevel(GroupRef, level)
		    
		    if result <> 0 then
		      break
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function WindowGroupOfClass(windowClass as UInt32) As WindowGroup
		  #if targetMacOS
		    soft declare function GetWindowGroupOfClass lib CarbonLib (windowClass as UInt32) as Ptr
		    
		    dim group as WindowGroup = GetWindowGroupOfClass(windowClass)
		    if group = nil then
		      return nil
		    end if
		    group.Retain
		    return group
		  #endif
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private GroupRef As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.IsAttributeSet(kWindowGroupAttrHideOnCollapse)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetAttribute kWindowGroupAttrHideOnCollapse, value
			End Set
		#tag EndSetter
		HideOnCollapse As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.IsAttributeSet(kWindowGroupAttrLayerTogether)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetAttribute kWindowGroupAttrLayerTogether, value
			End Set
		#tag EndSetter
		LayerTogether As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.IsAttributeSet(kWindowGroupAttrMoveTogether)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetAttribute kWindowGroupAttrMoveTogether, value
			End Set
		#tag EndSetter
		MoveTogether As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return ""
			  end if
			  
			  #if TargetMacOS
			    soft declare function CopyWindowGroupName lib CarbonLib (inGroup as Ptr, ByRef outName as CFStringRef) as Integer
			    
			    dim theName as CFStringRef
			    dim OSError as Integer = CopyWindowGroupName(me.GroupRef, theName)
			    return theName
			    
			    // Keep the compiler from complaining
			    #pragma unused OSError
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if me = nil then
			    return
			  end if
			  
			  #if targetMacOS
			    soft declare function SetWindowGroupName lib CarbonLib (inGroup as Ptr, inName as CFStringRef) as Integer
			    
			    dim OSError as Integer = SetWindowGroupName(me, value)
			    
			    // Keep the compiler from complaining
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.IsAttributeSet(kWindowGroupAttrSelectAsLayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetAttribute kWindowGroupAttrSelectAsLayer, value
			End Set
		#tag EndSetter
		SelectAsLayer As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.IsAttributeSet(kWindowGroupAttrSharedActivation)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetAttribute kWindowGroupAttrSharedActivation, value
			End Set
		#tag EndSetter
		SharedActivation As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = CarbonLib, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac Carbon PEF, Language = Default, Definition  = \"CarbonLib"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Carbon.framework"
	#tag EndConstant

	#tag Constant, Name = kCGBackstopMenuLevelKey, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGBaseWindowLevelKey, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGCursorWindowLevelKey, Type = Double, Dynamic = False, Default = \"19", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGDesktopIconWindowLevelKey, Type = Double, Dynamic = False, Default = \"18", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGDesktopWindowLevelKey, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGDockWindowLevelKey, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGDraggingWindowLevelKey, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGFloatingWindowLevelKey, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGHelpWindowLevelKey, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGMainMenuWindowLevelKey, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGMaximumWindowLevelKey, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGMinimumWindowLevelKey, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGModalPanelWindowLevelKey, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGNormalWindowLevelKey, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGOverlayWindowLevelKey, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGPopUpMenuWindowLevelKey, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGScreenSaverWindowLevelKey, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGStatusWindowLevelKey, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGTornOffMenuWindowLevelKey, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCGUtilityWindowLevelKey, Type = Double, Dynamic = False, Default = \"17", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowGroupAttrHideOnCollapse, Type = Double, Dynamic = False, Default = \"16", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWindowGroupAttrLayerTogether, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWindowGroupAttrMoveTogether, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWindowGroupAttrSelectAsLayer, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWindowGroupAttrSharedActivation, Type = Double, Dynamic = False, Default = \"8", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="HideOnCollapse"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LayerTogether"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MoveTogether"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectAsLayer"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SharedActivation"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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

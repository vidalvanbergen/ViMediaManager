#tag Class
Class PowerSource
	#tag Method, Flags = &h21
		Private Function IntegerValue(key as String) As Integer
		  dim cfKey as new CFString(key)
		  if self.Description <> nil and self.Description.HasKey(cfKey) then
		    dim value as CFNumber = CFNumber(self.Description.Value(cfKey))
		    return value.IntegerValue
		  else
		    return 0
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub IOPowerSourceCallback(context as Ptr)
		  if PowerSourceChanged <>nil then
		    PowerSourceChanged.Invoke
		  end if
		  
		  #pragma unused context
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List() As PowerSource()
		  #if targetMacOS
		    soft declare function IOPSCopyPowerSourcesInfo lib IOKit () as Ptr
		    soft declare function IOPSCopyPowerSourcesList lib IOKit (blob as Ptr) as Ptr
		    soft declare function IOPSGetPowerSourceDescription lib IOKit (blob as Ptr, ps as Ptr) as Ptr
		    soft declare sub CFRelease lib CarbonLib (cf as Ptr)
		    
		    dim theList() as PowerSource
		    
		    const hasOwnership = true
		    dim sourcesInfo as new CFType(IOPSCopyPowerSourcesInfo(), hasOwnership)
		    if ( sourcesInfo is nil ) then
		      return theList
		    end if
		    
		    dim sourcesList as new CFArray(IOPSCopyPowerSourcesList(sourcesInfo), hasOwnership)
		    
		    for i as Integer = 0 to sourcesList.Count - 1
		      dim d as new CFDictionary(IOPSGetPowerSourceDescription(sourcesInfo, sourcesList.Value(i)), false)
		      dim source as new PowerSource
		      source.Description = d
		      theList.Append source
		    next
		    
		    return theList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewRunLoopSource() As CFRunLoopSource
		  #if targetMacOS
		    soft declare function IOPSNotificationCreateRunLoopSource lib IOKit (callback as Ptr, context as Ptr) as Ptr
		    
		    dim p as Ptr = IOPSNotificationCreateRunLoopSource(AddressOf IOPowerSourceCallback, nil)
		    if p <> nil then
		      const hasOwnership = true
		      return new CFRunLoopSource(p, hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub PowerSourceChangedDelegate()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Sub RegisterForNotification()
		  if RunLoopSource = nil then
		    RunLoopSource = NewRunLoopSource
		  end if
		  CFRunLoop.Main.AddSource(RunLoopSource)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StringValue(key as String) As String
		  dim cfKey as new CFString(key)
		  if self.Description <> nil and self.Description.HasKey(cfKey) then
		    dim value as CFString = CFString(self.Description.Value(cfKey))
		    return value
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub UnregisterForNotification()
		  if RunLoopSource = nil then
		    return
		  end if
		  CFRunLoop.Main.RemoveSource(RunLoopSource)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.StringValue(kIOPSBatteryHealthKey)
			End Get
		#tag EndGetter
		BatteryHealth As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Description As CFDictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.StringValue(kIOPSNameKey)
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return PowerSourceChangedData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> PowerSourceChangedData then
			    if value <> nil then
			      if PowerSourceChangedData = nil then
			        RegisterForNotification
			      else
			        //
			      end if
			      
			    else
			      UnregisterForNotification
			      
			    end if
			    
			    PowerSourceChangedData = value
			  else
			    //
			  end if
			End Set
		#tag EndSetter
		Shared PowerSourceChanged As PowerSourceChangedDelegate
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Attributes( Hidden = true ) Private Shared PowerSourceChangedData As PowerSourceChangedDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared RunLoopSource As CFRunLoopSource
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.StringValue(kIOPSTypeKey)
			End Get
		#tag EndGetter
		Type As String
	#tag EndComputedProperty


	#tag Constant, Name = kIOPSBatteryHealthKey, Type = String, Dynamic = False, Default = \"BatteryHealth", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIOPSInternalBatteryType, Type = String, Dynamic = False, Default = \"InternalBattery", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIOPSNameKey, Type = String, Dynamic = False, Default = \"Name", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIOPSTypeKey, Type = String, Dynamic = False, Default = \"Type", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BatteryHealth"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

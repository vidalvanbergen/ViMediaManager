#tag Class
Class ExternalPowerAdapter
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  //instances should not be created using New operator outside this class.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CopyExternalPowerAdapterDetails() As CFDictionary
		  #if targetMacOS
		    dim start as Double = Microseconds
		    soft declare function IOPSCopyExternalPowerAdapterDetails lib IOKit () as Ptr
		    
		    dim p as Ptr = IOPSCopyExternalPowerAdapterDetails()
		    dim stop as Double = Microseconds
		    System.DebugLog "IOPSCopyExternalPowerAdapterDetails took " + Format(stop - start, "#") + " microseconds."
		    if p <> nil then
		      const hasOwnership = true
		      return new CFDictionary(p, hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Details() As ExternalPowerAdapter
		  dim d as CFDictionary = CopyExternalPowerAdapterDetails
		  if d <> nil then
		    dim adapter as new ExternalPowerAdapter
		    adapter.PowerAdapterDetails = d
		    return adapter
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub InformationChangedDelegate()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Sub Initialize()
		  #if TargetMacOS
		    
		    if RunLoopSource is nil then
		      'PowerAdapterDetails = CopyExternalPowerAdapterDetails
		      
		      'soft declare function IOPSNotificationCreateRunLoopSource lib IOKit (callback as Ptr, context as Ptr) as Ptr
		      'dim p as Ptr = IOPSNotificationCreateRunLoopSource(AddressOf IOPowerSourceCallback, nil)
		      'if p <> nil then
		      'const hasOwnership = true
		      'RunLoopSource = new CFRunLoopSource(p, hasOwnership)
		      'end if
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IntegerValue(key as String) As Integer
		  //All kIOPSPowerAdapter keys return CFNumber integer values as of Mac OS 10.6.x.
		  
		  dim cfKey as new CFString(key)
		  if PowerAdapterDetails.HasKey(cfKey) then
		    dim value as CFNumber = CFNumber(PowerAdapterDetails.Value(cfKey))
		    return value.IntegerValue
		  else
		    return 0
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub IOPowerSourceCallback(context as Ptr)
		  //call CopyExternalPowerAdapterDetails...
		  
		  if InformationChanged <>nil then
		    InformationChanged.Invoke
		  end if
		  
		  #pragma unused context
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Read Me
		IOKit.ExternalPowerAdapter returns some information about the attached external power adapter.
		
		The shared method Details() returns an ExternalPowerAdapter object, if an adapter is attached.  It returns
		Nil if no adapter is attached.
		
		I've not yet found a notification that is sent when the adapter is attached or detached.  If this is something you
		need to know, use a Timer to create an ExternalPowerAdapter object periodically.  Some minimal testing suggested that 
		such an approach isn't too slow.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.IntegerValue(kIOPSPowerAdapterFamilyKey)
			End Get
		#tag EndGetter
		FamilyCode As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.IntegerValue(kIOPSPowerAdapterIDKey)
			End Get
		#tag EndGetter
		ID As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared InformationChanged As InformationChangedDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PowerAdapterDetails As CFDictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.IntegerValue(kIOPSPowerAdapterRevisionKey)
			End Get
		#tag EndGetter
		Revision As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared RunLoopSource As CFRunLoopSource
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.IntegerValue(kIOPSPowerAdapterSerialNumberKey)
			End Get
		#tag EndGetter
		SerialNumber As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.IntegerValue(kIOPSPowerAdapterWattsKey)
			End Get
		#tag EndGetter
		Watts As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kIOPSPowerAdapterFamilyKey, Type = String, Dynamic = False, Default = \"FamilyCode", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIOPSPowerAdapterIDKey, Type = String, Dynamic = False, Default = \"AdapterID", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIOPSPowerAdapterRevisionKey, Type = String, Dynamic = False, Default = \"AdapterRevision", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIOPSPowerAdapterSerialNumberKey, Type = String, Dynamic = False, Default = \"SerialNumber", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIOPSPowerAdapterWattsKey, Type = String, Dynamic = False, Default = \"Watts", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="FamilyCode"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ID"
			Group="Behavior"
			Type="Integer"
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
			Name="Revision"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SerialNumber"
			Group="Behavior"
			Type="Integer"
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
			Name="Watts"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

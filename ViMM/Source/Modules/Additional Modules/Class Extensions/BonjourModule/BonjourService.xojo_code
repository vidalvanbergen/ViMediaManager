#tag Class
Class BonjourService
	#tag Method, Flags = &h0
		Sub AddParent(parent as BonjourControl)
		  
		  if parent<>nil then
		    ParentBonjourControls.Append   new WeakRef( parent )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Addresses() As String()
		  #if TargetMacOS
		    return  nsns.Addresses
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  //No empty constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(name as string, type as string, domain as string = "")
		  
		  nsns = NSNetService.InitForResolving( name, domain, type )
		  
		  if nsns=nil then
		    raise  new MacOSError( -50, "Impossible to create an instance of BonjourService. Parameter error." )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromCocoaObject(service as NSNetService) As BonjourService
		  
		  dim bs as new BonjourService
		  
		  bs.nsns = service
		  
		  return  bs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Domain() As string
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      return  nsns.Domain
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindParents() As BonjourControl()
		  
		  dim result() as BonjourControl
		  dim wr as WeakRef
		  
		  for i as integer = ParentBonjourControls.Ubound downto 0
		    wr = ParentBonjourControls( i )
		    if wr=nil OR wr.Value=nil then
		      ParentBonjourControls.Remove i
		    else
		      result.Append  BonjourControl( wr.Value )
		    end if
		  next
		  
		  Return  result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  
		  return   nsns.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidNotResolve(sender as NSNetService, errorCode as integer, errorDomain as integer)
		  
		  #if TargetMacOS
		    RaiseEvent   ResolutionError( errorCode, errorDomain )
		    
		  #else
		    #pragma unused errorCode
		    #pragma unused errorDomain
		  #endif
		  
		  #pragma unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidResolve(sender as NSNetService)
		  
		  #if TargetMacOS
		    RaiseEvent   Resolved()
		    
		    nsns.StartMonitoring
		    
		  #endif
		  
		  #pragma unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidStopResolving(sender as NSNetService)
		  
		  #if TargetMacOS
		    RaiseEvent   StoppedResolving()
		  #endif
		  
		  #pragma unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidUpdateTXTRecord(sender as NSNetService)
		  
		  #if TargetMacOS
		    RaiseEvent   TXTDataChanged
		  #endif
		  
		  #pragma unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As string
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      return  nsns.Name
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Port() As integer
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      return  nsns.Port
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterHandlers()
		  //# Setup communication between the underlying object and BonjourService
		  
		  //@ DO NOT EDIT
		  
		  AddHandler   nsns.DidNotResolve, AddressOf Handle_DidNotResolve
		  AddHandler   nsns.DidResolve, AddressOf Handle_DidResolve
		  AddHandler   nsns.DidStopResolving, AddressOf Handle_DidStopResolving
		  AddHandler   nsns.DidUpdateTXTRecord, AddressOf Handle_DidUpdateTXTRecord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resolve(timeoutInSeconds as double)
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      nsns.Resolve   timeoutInSeconds
		    else
		      raise new NilObjectException
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopResolving()
		  //# Interrupt resolving a service
		  
		  nsns.Stop
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As string
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      return  nsns.Type
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ResolutionError(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resolved()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event StoppedResolving()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TXTDataChanged()
	#tag EndHook


	#tag Note, Name = Documentation
		A BonjourService object represents any service that you published on the network or that you discovered by browsing for a particular type.
		
		Such object contains information on the service (name, type, port, TXT data, addresses).
		
		
		NOTE: once you got a BonjourService, you need to call Resolve to determine the IP addresses allowing connection.
	#tag EndNote


	#tag Property, Flags = &h1
		#tag Note
			// The underlying Cocoa object
		#tag EndNote
		Protected m_nsns As NSNetService
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return m_nsns
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			  if value.GetDelegate=nil then
			    value.SetDelegate
			  end if
			  m_nsns = value
			  RegisterHandlers
			End Set
		#tag EndSetter
		Protected nsns As NSNetService
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			//The parent BonjourControl(s), when necessary
		#tag EndNote
		Private ParentBonjourControls() As WeakRef
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return  nsns.ServiceTXTDictionary
			End Get
		#tag EndGetter
		TXTRecord As Dictionary
	#tag EndComputedProperty


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
End Class
#tag EndClass

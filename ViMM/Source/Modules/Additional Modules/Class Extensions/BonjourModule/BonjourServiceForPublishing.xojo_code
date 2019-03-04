#tag Class
Class BonjourServiceForPublishing
Inherits BonjourService
	#tag Event
		Sub ResolutionError(errorCode as integer, errorDomain as integer)
		  //Not applicable in BonjourServiceForPublishing
		  #pragma unused errorCode
		  #pragma unused errorDomain
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resolved()
		  //Not applicable in BonjourServiceForPublishing
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub StoppedResolving()
		  //Not applicable in BonjourServiceForPublishing
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TXTDataChanged()
		  //Not applicable in BonjourServiceForPublishing
		  
		End Sub
	#tag EndEvent


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
		Sub Constructor(name as string, type as string, domain as string = "", port as integer)
		  
		  nsns = NSNetService.InitForPublishing( name, domain, type, port )
		  
		  if nsns=nil then
		    raise  new MacOSError( -50, "Impossible to create an instance of BonjourService. Parameter error." )
		  end if
		  
		  RegisterHandlers
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromCocoaObject(service as NSNetService) As BonjourServiceForPublishing
		  
		  dim bs as new BonjourServiceForPublishing
		  
		  if service.Port<=0 then
		    raise new MacOSError( -50, "Service was not configured for publishing. Parameter error." )
		  end if
		  
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
		Private Sub Handle_DidNotPublish(sender as NSNetService, errorCode as integer, errorDomain as integer)
		  #pragma unused sender
		  
		  RaiseEvent   PublishingError( errorCode, errorDomain )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidPublish(sender as NSNetService)
		  #pragma Unused sender
		  
		  RaiseEvent  Published()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidStop(sender as NSNetService)
		  #pragma unused sender
		  
		  RaiseEvent  StoppedPublishing()
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

	#tag Method, Flags = &h21
		Private Function Parent() As BonjourControl
		  //Not applicable in BonjourServiceForPublishing
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Publish()
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      nsns.Publish
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterHandlers()
		  //# Setup communication between the underlying object and BonjourServiceForPublishing
		  
		  //@ DO NOT EDIT
		  
		  AddHandler   nsns.DidNotPublish, AddressOf Handle_DidNotPublish
		  AddHandler   nsns.DidPublish, AddressOf Handle_DidPublish
		  AddHandler   nsns.DidStopPublishing, AddressOf Handle_DidStop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Resolve(timeoutInSeconds as double)
		  //Block this inherited method which does not apply here
		  
		  #pragma unused timeoutInSeconds
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetParent(parent as BonjourControl)
		  //Not applicable in BonjourServiceForPublishing
		  
		  #pragma unused parent
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopPublishing()
		  //# Stop publishing
		  
		  nsns.Stop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StopResolving()
		  //Only available for Super
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
		Event Published()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PublishingError(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event StoppedPublishing()
	#tag EndHook


	#tag Note, Name = Documentation
		See BonjourModule notes.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  nsns.State
			End Get
		#tag EndGetter
		State As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return  nsns.ServiceTXTDictionary
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  nsns.ServiceTXTDictionary = value
			  
			End Set
		#tag EndSetter
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
			Name="State"
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
	#tag EndViewBehavior
End Class
#tag EndClass

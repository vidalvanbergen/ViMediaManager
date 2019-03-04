#tag Module
Protected Module BonjourModule
	#tag Method, Flags = &h1
		Protected Sub DidNotPublish(sender as NSNetService, errCode as integer, errDomain as integer)
		  '//A service failed to be published. Broadcast the event to all the BonjourControls and the CustomBonjourEvents module.
		  '
		  '#if TargetMacOS
		  'dim wr as WeakRef
		  'dim bc as BonjourControl
		  '
		  'CustomBonjourEvents.event_ServicePublishingError
		  '
		  'for i as integer=BonjourControls.Ubound downto 0
		  'wr = BonjourControls( i )
		  'if wr.Value = nil then
		  'BonjourControls.Remove  i
		  '
		  'else
		  'bc = BonjourControl( wr.Value )
		  'bc.Private_HandleCallbacks   sender, "DidNotPublish", errDict
		  '
		  'end if
		  '
		  'next
		  '#endif
		  
		  #pragma unused sender
		  #pragma unused errCode
		  #pragma unused errDomain
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DidPublish(sender as NSNetService)
		  '//A service has been published. Broadcast the event to all the BonjourControls
		  '
		  '#if targetMacOS
		  'dim wr as WeakRef
		  'dim bc as BonjourControl
		  '
		  'for i as integer=BonjourControls.Ubound downto 0
		  'wr = BonjourControls( i )
		  'if wr.Value = nil then
		  'BonjourControls.Remove  i
		  '
		  'else
		  'bc = BonjourControl( wr.Value )
		  'bc.Private_HandleCallbacks   sender, "DidPublish"
		  '
		  'end if
		  '
		  'next
		  '#endif
		  
		  #pragma unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PublishService(service as BonjourServiceForpublishing)
		  
		  RegisteredServices.Append   service
		  service.Publish
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PublishService(nsns as NSNetService)
		  
		  if nsns<>nil then
		    dim service as BonjourServiceForPublishing = BonjourServiceForPublishing.CreateFromCocoaObject( nsns )
		    RegisteredServices.Append   service
		    service.Publish
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PublishService(Name as string, type as string, domain as string = "", port as integer, TXTDictionary as Dictionary = nil)
		  //# Publish a new service but does not return the new object (which is stored internally)
		  
		  #if TargetMacOS
		    dim dummy as BonjourServiceForPublishing
		    dummy = PublishService( Name, type, domain, port, TXTDictionary )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PublishService(Name as string, type as string, domain as string = "", port as integer, TXTDictionary as Dictionary = nil) As BonjourServiceForPublishing
		  //# Publish a new service and return the created object
		  
		  #if TargetMacOS
		    dim service as BonjourServiceForPublishing
		    
		    service = new BonjourServiceForPublishing( name, type, domain, port )
		    service.TXTRecord = TXTDictionary
		    RegisteredServices.Append   service
		    service.Publish
		    
		    return  service
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterControl(bc as BonjourControl)
		  //Automatically called by BonjourControl.Constructor
		  
		  #if TargetMacOS
		    dim wr as WeakRef
		    dim shouldReturn as Boolean
		    
		    for i as integer = BonjourControls.Ubound downto 0
		      wr = BonjourControls( i )
		      if wr.Value=bc then //Already registered. We do not return immediately to allow cleanup
		        shouldReturn = true
		        
		      elseif wr.value=nil then //Do some cleanup
		        BonjourControls.Remove  i
		      end if
		    next
		    
		    if shouldReturn then //Already registered
		      return
		    else //Store new control
		      BonjourControls.Append   new WeakRef( bc )
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnpublishAllServices()
		  //# Unpublish all the services (usually when the application quits)
		  
		  for each service as BonjourServiceForPublishing in RegisteredServices
		    if service.State <>NSNetService.kStatePublished then
		      service.StopPublishing
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnpublishService(Name as string, type as string, domain as string, port as integer)
		  dim service as BonjourServiceForPublishing
		  
		  for i as integer=0 to RegisteredServices.Ubound
		    service = RegisteredServices( i )
		    if service.Name = name AND service.Type = type AND service.Domain = domain AND service.port = port then
		      service.StopPublishing
		    end if
		  next
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		Bonjour is the Apple's trademark for the zeroconf/dns-sd technology (available on any platform). It allows you to advertise (publish) a service over
		  the network so other computers using Bonjour can auto-detect it and connect. There are then 2 different classes: one for publishing a service
		  over the network (BonjourServiceForPublishing) and one to determine (resolve) the current address and port of a service (BonjourService).
		
		The BonjourControl control also allows you to search for all the currently active services of one type, e.g. shared printers, and let the end-user
		  pick one.
		
		Note that all Bonjour operations are asynchronous, so the result of an operation is given to you through events.
		
		
		== Publishing a Bonjour service ==
		
		The first step is to create your server and make it listen for connections. Then you can create a BonjourServiceForPublishing object which is
		  identified by its name, its type and its domain (which is usually ""). Note that the combination or name+type+domain must be unique over
		  the network.
		
		The recommended way to publish a service is the following:
		1. Create a subclass of BonjourServiceForPublishing
		2. Add some code in the different events to detect success or failure of the publication on the network
		3. For each service you want to publish, create an instance and call the Publish method
		4. If publication succeeds, the Published event is fired
		
		
		== Browsing the network for a type of services ==
		
		The BonjourControl allows browsing the network for services of a certain type
		
		1. Add a BonjourControl in a Window
		2. Call BrowseBonjourServicesOfType with the type to look for, e.g. "_printer.m_tcp", and the domain (usually "")
		3. Services detected or removed from the network will trigger ServiceAdded or ServiceRemoved events
		4. Once a service has been detected, you may call its Resolve method to determine its IP addresses and port
		
		Note: BonjourService events are forwarded to their parent BonjourControl, which makes easier to implement them.
		
		
		== Resolving a previously stored service ==
		
		If you stored the name, type and domain of a service, you can resolve it without user interaction.
		
		1. Create a BonjourService or a subclass of it with the stored name, type and domain
		2. Call the Resolve method
		3. Once the Resolved event has been invoked, you can use one of the Addresses to connect to the service
	#tag EndNote


	#tag Property, Flags = &h1
		Protected BonjourControls() As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RegisteredServices() As BonjourServiceForPublishing
	#tag EndProperty


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

#tag Class
Class NSNetServiceBrowser
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  self.Constructor(NSObject.Initialize(NSObject.Allocate("NSNetServiceBrowser")), hasOwnership)
		  SetDelegate
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidFindDomain(id as Ptr, sel as Ptr, cntl as Ptr, domain as Ptr, more as Boolean)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim nss as NSString = new NSString( domain )
		      obj.HandleDidFindDomain   nss.StringValue, more
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidFindService(id as Ptr, sel as Ptr, cntl as Ptr, service as Ptr, more as Boolean)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim nsns as NSNetService = new NSNetService( service, false )
		      obj.HandleDidFindservice   nsns, more
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidNotSearch(id as Ptr, sel as Ptr, cntl as Ptr, err as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim NSdict as NSDictionary = new NSDictionary( err, false )
		      dim dict as Dictionary = NSDict.VariantValue
		      
		      obj.HandleDidNotSearch  dict
		      
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveDomain(id as Ptr, sel as Ptr, cntl as Ptr, domain as Ptr, more as Boolean)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim nss as NSString = new NSString( domain )
		      obj.HandleDidRemoveDomain   nss.StringValue, more
		      
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveService(id as Ptr, sel as Ptr, cntl as Ptr, service as Ptr, more as Boolean)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim nsns as NSNetService = new NSNetService( service, false )
		      obj.HandleDidRemoveService   nsns, more
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidStopSearch(id as Ptr, sel as Ptr, cntl as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      obj.HandleDidStop
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As NSSearchField
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return NSSearchField(w.Value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFindDomain(DomainName as string, moreComing as Boolean)
		  'dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  '
		  'if bc<>nil then
		  'bc.Private_HandleCallbacks( me, "DidFindDomain", DomainName, moreComing )
		  'end if
		  
		  RaiseEvent   DomainAdded  DomainName, moreComing
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFindService(Service as NSNetService, moreComing as Boolean)
		  'dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  '
		  'if bc<>nil then
		  'bc.Private_HandleCallbacks( me, "DidFindService", service, moreComing )
		  'end if
		  
		  RaiseEvent   ServiceAdded  Service.Name + " @ " + Service.HostName, Service.ServiceTXTDictionary, moreComing, Service
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidNotSearch(errDict as Dictionary)
		  
		  #if TargetMacOS
		    RaiseEvent   SearchError( errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 ))
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidRemoveDomain(DomainName as string, moreComing as Boolean)
		  'dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  '
		  'if bc<>nil then
		  'bc.Private_HandleCallbacks( me, "DidRemoveDomain", DomainName, moreComing )
		  'end if
		  
		  RaiseEvent   DomainRemoved  DomainName, moreComing
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidRemoveService(Service as NSNetService, moreComing as Boolean)
		  'dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  '
		  'if bc<>nil then
		  'bc.Private_HandleCallbacks( me, "DidRemoveService", service, moreComing )
		  'end if
		  
		  RaiseEvent   ServiceRemoved  Service.Name, moreComing, service
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidStop()
		  'dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  '
		  'if bc<>nil then
		  'bc.Private_HandleCallbacks( me, "DidStop" )
		  'end if
		  
		  RaiseEvent   SearchStopped
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "netServiceBrowser:didFindDomain:moreComing:" : CType( AddressOf  delegate_DidFindDomain, Ptr ) : "v@:@@B"
		    methodList.Append  "netServiceBrowser:didRemoveDomain:moreComing:" : CType( AddressOf  delegate_DidRemoveDomain, Ptr ) : "v@:@@B"
		    methodList.Append  "netServiceBrowser:didFindService:moreComing:" : CType( AddressOf  delegate_DidFindService, Ptr ) : "v@:@@B"
		    methodList.Append  "netServiceBrowser:didRemoveService:moreComing:" : CType( AddressOf delegate_DidRemoveService, Ptr ) : "v@:@@B"
		    methodList.Append  "netServiceBrowser:didNotSearch:" : CType( AddressOf delegate_DidNotSearch, Ptr ) : "v@:@@"
		    methodList.Append  "netServiceBrowserDidStopSearch:" : CType( AddressOf delegate_DidStopSearch, Ptr ) : "v@:@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList)
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveFromRunLoop()
		  
		  #if TargetMacOS
		    declare sub removeFromRunLoop lib CocoaLib selector "removeFromRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Current
		    
		    removeFromRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSRunLoopCommonModes" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ScheduleInRunLoop()
		  
		  #if TargetMacOS
		    declare sub scheduleInRunLoop lib CocoaLib selector "scheduleInRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Main
		    
		    scheduleInRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSDefaultRunLoopMode" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchForAllServiceTypes(inDomain as string = "")
		  #pragma unused inDomain
		  
		  //dns-sd -B m_services.m_dns-sd.m_udp .
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchForBrowsableDomains()
		  //# Search for browsable domains. Results are reported asynchronously in DomainAdded and DomainRemoved events
		  
		  #if TargetMacOS
		    declare sub searchForBrowsableDomains lib CocoaLib selector "searchForBrowsableDomains" (id as Ptr)
		    
		    searchForBrowsableDomains( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchForServicesOfType(ServiceType as String, DomainName as string = "")
		  //# Search for available services of type ServiceType. Results are reported asynchronously in ServiceAdded and ServiceRemoved events.
		  
		  //@ The found/removed BonjourService object (as NSNetService) is passed to the events so you can store/remove it from, e.g. a ListBox. However, you do
		  //@ not need to store it as you can create another instance from the service name, type and domain.
		  
		  #if TargetMacOS
		    declare sub m_searchForServicesOfType lib CocoaLib selector "searchForServicesOfType:inDomain:" (id as Ptr, type as CFStringRef, domain as CFStringRef)
		    
		    m_searchForServicesOfType   me.id, ServiceType, DomainName
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function sockaddrToString(sockaddr as MemoryBlock) As string
		  
		  dim result as string
		  dim components() as string
		  dim port as integer
		  
		  sockaddr.LittleEndian = false
		  port = sockaddr.UInt16Value( 2 )
		  
		  select case sockaddr.Byte( 1 )
		  case 2 //IPv4
		    for i as integer = 4 to 7
		      components.Append   Str( sockaddr.Byte( i ))
		    next
		    result = Join( components, "." ) + ":" + Str( port )
		    
		  case 30 //IPv6
		    for i as integer = 8 to 22 step 2
		      if sockaddr.UInt16Value( i )=0 then
		        components.Append  ""
		      else
		        components.Append  Hex( sockaddr.UInt16Value( i ))
		      end if
		    next
		    //WARNING: this is not completely correct as only one "::" is allowed
		    result = "[" + Join( components, ":" ) + "]:" + Str( port )
		    
		  else
		    return ""
		    
		  end select
		  
		  return  result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSearch()
		  //# Stop searching (either domains or services). When stopped, it fires the SearchStopped event
		  
		  #if TargetMacOS
		    declare sub m_stop lib CocoaLib selector "stop" (id as Ptr)
		    
		    m_stop  me.id
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DomainAdded(DomainName as string, moreComing as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DomainRemoved(DomainName as string, moreComing as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SearchError(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SearchStopped()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceAdded(ServiceName as string, TXTDict as Dictionary, moreComing as Boolean, BonjourService as NSNetService)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceRemoved(ServiceName as string, moreComing as Boolean, BonjourService as NSNetService)
	#tag EndHook


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSNetServiceBrowserDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesActivityInProgress, Type = Double, Dynamic = False, Default = \"-72003", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesBadArgumentError, Type = Double, Dynamic = False, Default = \"-72004", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesCancelledError, Type = Double, Dynamic = False, Default = \"-72005", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesCollisionError, Type = Double, Dynamic = False, Default = \"-72001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesInvalidError, Type = Double, Dynamic = False, Default = \"-72006", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesNotFoundError, Type = Double, Dynamic = False, Default = \"-72002", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesTimeoutError, Type = Double, Dynamic = False, Default = \"-72007", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesUnknownError, Type = Double, Dynamic = False, Default = \"-72000", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
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
	#tag EndViewBehavior
End Class
#tag EndClass

#tag Class
Class NSNetService
Inherits NSObject
	#tag Method, Flags = &h0
		Function Addresses() As String()
		  //# Return an array of all the addresses available to communicate with the distant service
		  
		  #if TargetMacOS
		    declare function addresses lib CocoaLib selector "addresses" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( addresses( me.id ), false )
		    dim nsd as NSData
		    dim result() as string
		    
		    for i as integer=0 to nsa.Count - 1
		      nsd = new NSData( nsa.Value( i ))
		      result.Append  sockaddrToString( nsd.Data )
		    next
		    
		    return   result
		  #endif
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DataFromTXTRecordDictionary(dict as NSDictionary) As NSData
		  
		  #if TargetMacOS
		    declare function m_dataFromTXTRecordDictionary lib CocoaLib selector "dataFromTXTRecordDictionary:" ( Cls as Ptr, data as ptr ) as Ptr
		    
		    dim p as Ptr
		    
		    if dict=nil then
		      return  nil
		    end if
		    
		    p = m_dataFromTXTRecordDictionary( Cocoa.NSClassFromString( "NSNetService" ), dict.id )
		    
		    if p<>nil then
		      return  new NSData( p, false )
		    else
		      return  nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidNotPublish(id as Ptr, sel as Ptr, cntl as Ptr, err as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      dim NSdict as NSDictionary = new NSDictionary( err, false )
		      dim dict as Dictionary = NSDict.VariantValue
		      
		      obj.HandleDidNotPublish   dict
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidNotResolve(id as Ptr, sel as Ptr, cntl as Ptr, err as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      dim NSdict as NSDictionary = new NSDictionary( err, false )
		      dim dict as Dictionary = NSDict.VariantValue
		      
		      obj.HandleDidNotResolve  dict
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidPublish(id as Ptr, sel as Ptr, cntl as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidPublish
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidResolve(id as Ptr, sel as Ptr, cntl as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidResolve
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidStop(id as Ptr, sel as Ptr, cntl as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidStop
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidUpdateTXTRecord(id as Ptr, sel as Ptr, cntl as Ptr, dataPtr as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidUpdateTXTRecord( dataPtr )
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_WillPublish(id as Ptr, sel as Ptr, cntl as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleWillPublish
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_WillResolve(id as Ptr, sel as Ptr, cntl as Ptr)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleWillResolve
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DictionaryFromTXTRecordData(data as NSData) As NSDictionary
		  
		  #if TargetMacOS
		    declare function m_dictionaryFromTXTRecordData lib CocoaLib selector "dictionaryFromTXTRecordData:" ( Cls as Ptr, data as ptr ) as Ptr
		    
		    dim p as Ptr
		    
		    p = m_dictionaryFromTXTRecordData( Cocoa.NSClassFromString( "NSNetService" ), data.id )
		    
		    if p<>nil then
		      return  new NSDictionary( p, false )
		    else
		      return  nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Domain() As String
		  
		  #if TargetMacOS
		    declare function m_domain lib CocoaLib selector "domain" (id as Ptr) as CFStringRef
		    
		    return  m_domain( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As NSSearchField
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return NSSearchField(w.Value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidNotPublish(errDict as Dictionary)
		  mState = kStateIsServer
		  
		  RaiseEvent   DidNotPublish( errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 ))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidNotResolve(errDict as Dictionary)
		  RaiseEvent   DidNotResolve( errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 ))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidPublish()
		  mState = kStatePublished
		  
		  RaiseEvent   DidPublish
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidResolve()
		  mState = kStateResolved
		  
		  RaiseEvent  DidResolve
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidStop()
		  if State=kStateIsResolving then
		    RaiseEvent   DidStopResolving
		    
		  elseif State=kStateIsTryingToPublish OR State=kStatePublished OR State=kStateIsTryingToUnpublish then
		    RaiseEvent   DidStopPublishing
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidUpdateTXTRecord(dataPtr as Ptr)
		  
		  me.TXTData = new NSData( dataPtr, false )
		  
		  RaiseEvent   DidUpdateTXTRecord
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillPublish()
		  RaiseEvent   WillPublish
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillResolve()
		  RaiseEvent   WillResolve
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HostName() As String
		  
		  #if TargetMacOS
		    declare function m_hostname lib CocoaLib selector "hostName" (id as Ptr) as CFStringRef
		    
		    return  m_hostname( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function InitForPublishing(name as String, domain as string, type as string, port as integer) As NSNetService
		  
		  #if TargetMacOS
		    declare function initWithDomain lib CocoaLib selector "initWithDomain:type:name:port:" ( id as Ptr, domain as CFStringRef, type as CFStringRef, name as CFStringRef, port as Integer ) as Ptr
		    
		    dim p as Ptr = NSObject.Allocate( "NSNetService" )
		    dim nsns as NSNetService
		    
		    p = initWithDomain( p, domain, type, name, port )
		    
		    if p<>nil then
		      nsns = new NSNetService( p, false )
		      nsns.mState = kStateIsServer
		      nsns.SetDelegate
		      return  nsns
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function InitForResolving(name as String, domain as string, type as string) As NSNetService
		  
		  #if TargetMacOS
		    declare function initWithDomain lib CocoaLib selector "initWithDomain:type:name:" ( id as Ptr, domain as CFStringRef, type as CFStringRef, name as CFStringRef ) as Ptr
		    
		    dim p as Ptr = NSObject.Allocate( "NSNetService" )
		    dim nsns as NSNetService
		    
		    p = initWithDomain( p, domain, type, name )
		    
		    if p<>nil then
		      nsns = new NSNetService( p, false )
		      nsns.mState = kStateIsClient
		      nsns.SetDelegate
		      return  nsns
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "netService:didNotPublish:" : CType( AddressOf  delegate_DidNotPublish, Ptr ) : "v@:@@"
		    methodList.Append  "netService:didNotResolve:" : CType( AddressOf  delegate_DidNotResolve, Ptr ) : "v@:@@"
		    methodList.Append  "netService:didUpdateTXTRecordData:" : CType( AddressOf  delegate_DidUpdateTXTRecord, Ptr ) : "v@:@@"
		    methodList.Append  "netServiceDidPublish:" : CType( AddressOf delegate_DidPublish, Ptr ) : "v@:@"
		    methodList.Append  "netServiceDidResolveAddress:" : CType( AddressOf delegate_DidResolve, Ptr ) : "v@:@"
		    methodList.Append  "netServiceDidStop:" : CType( AddressOf delegate_DidStop, Ptr ) : "v@:@"
		    methodList.Append  "netServiceWillPublish:" : CType( AddressOf delegate_WillPublish, Ptr ) : "v@:@"
		    methodList.Append  "netServiceWillResolve:" : CType( AddressOf delegate_WillResolve, Ptr ) : "v@:@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList)
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  
		  #if TargetMacOS
		    declare function m_name lib CocoaLib selector "name" (id as Ptr) as CFStringRef
		    
		    return  m_name( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Port() As integer
		  
		  #if TargetMacOS
		    declare function m_port lib CocoaLib selector "port" (id as Ptr) as integer
		    
		    return  m_port( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Publish(allowAutoRenaming as boolean = true)
		  #if TargetMacOS
		    declare sub m_publishWithOptions lib CocoaLib selector "publishWithOptions:" ( id as Ptr, opt as integer )
		    
		    dim options as Integer
		    if allowAutoRenaming then
		      options = 0
		    else
		      options = 1
		    end if
		    
		    m_publishWithOptions(self.id, options)
		    self.mState = kStateIsTryingToPublish
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFromRunLoop()
		  
		  #if TargetMacOS
		    declare sub removeFromRunLoop lib CocoaLib selector "removeFromRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Current
		    
		    removeFromRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSRunLoopCommonModes" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resolve(timeoutInSeconds as double)
		  
		  #if TargetMacOS
		    declare sub resolveWithTimeout lib CocoaLib selector "resolveWithTimeout:" ( id as Ptr, timeout as double )
		    
		    mState = kStateIsResolving
		    resolveWithTimeout   me.id, timeoutInSeconds
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScheduleInRunLoop()
		  
		  #if TargetMacOS
		    declare sub scheduleInRunLoop lib CocoaLib selector "scheduleInRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Main
		    
		    scheduleInRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSDefaultRunLoopMode" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDelegate()
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
		Sub StartMonitoring()
		  
		  #if TargetMacOS
		    declare sub m_StartMonitoring lib CocoaLib selector "startMonitoring" (id as Ptr)
		    
		    if State=kStateResolved then
		      m_StartMonitoring   me.id
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  
		  #if TargetMacOS
		    declare sub m_stop lib CocoaLib selector "stop" (id as Ptr)
		    
		    if State>=kStateIsServer then
		      mState = kStateIsTryingToUnpublish
		    else
		      mState = kStateIsResolving
		    end if
		    m_stop  me.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopMonitoring()
		  
		  #if TargetMacOS
		    declare sub m_StopMonitoring lib CocoaLib selector "stopMonitoring" (id as Ptr)
		    
		    if State=kStateResolved then
		      m_StopMonitoring   me.id
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As String
		  
		  #if TargetMacOS
		    declare function m_type lib CocoaLib selector "type" (id as Ptr) as CFStringRef
		    
		    return  m_type( me.id )
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidNotPublish(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidNotResolve(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidPublish()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidResolve()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidStopPublishing()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidStopResolving()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidUpdateTXTRecord()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillPublish()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillResolve()
	#tag EndHook


	#tag Note, Name = Documentation
		The NSNetService object allows you to register a network service on the network or detect computers which provide the service you are looking for.
		
		DECLARING A SERVICE ON THE NETWORK: First create you Socket of ServerSocket to manage incoming connections. The create a NSNetService instance
		   with the shared method "InitForPublishing" and call "Publish". You will get the confirmation that your service has been properly registered in the
		   "DidPublish" event. If an error occurred, you will receive the error code in the "DidNotPublish" event.
		
		DETECTING A SERVICE ON THE NETWORK: see Documentation in the NSNetServiceBrowser class
		
		USING A SERVICE ON THE NETWORK: you do not need to use NSNetServiceBrowser to get a functional NSNetService that you can also create using the name,
		   type and domain of a service (if you know them) with the "InitForResolving" shared method
		
		CONNECTING TO A SERVICE: no matter how you get a NSNetService object, you first need to resolve the actual address(es) of the service. Depending on how many interfaces
		   are active (1 or 2 Ethernet cards, the WiFi network...) you will get a number of IPv4 and IPv6 addresses. Fortunately, you do not need to pick one when using
		   NSNetService.
	#tag EndNote


	#tag Property, Flags = &h21
		Private mState As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    dim data as NSData
			    dim nsd as NSDictionary
			    
			    data = me.TXTData
			    nsd = NSNetService.DictionaryFromTXTRecordData( data )
			    
			    if nsd<>nil then
			      return   nsd.VariantValue
			    else
			      return  new Dictionary
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    dim data as NSData
			    dim nsd as NSDictionary = NSDictionary.CreateFromDictionary( value )
			    
			    data = NSNetService.DataFromTXTRecordDictionary( nsd )
			    
			    me.TXTData = data
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ServiceTXTDictionary As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mState
			End Get
		#tag EndGetter
		State As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function TXTRecordData lib CocoaLib selector "TXTRecordData" (id as Ptr) as Ptr
			    
			    if updatedData<>nil then
			      return  updatedData
			    end if
			    
			    dim p as Ptr = TXTRecordData( me.id )
			    if p<>nil then
			      return   new NSData( p, false )
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare function TXTRecordData lib CocoaLib selector "setTXTRecordData:" (id as Ptr, data as Ptr) as boolean
			    
			    dim OK as Boolean
			    
			    if value = nil then
			      OK = TXTRecordData( me.id, nil )
			    else
			      OK = TXTRecordData( me.id, value.id )
			    end if
			    
			    if NOT OK then //Couldn't update
			      updatedData = value //Set in cache even in case of failure
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TXTData As NSData
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private updatedData As NSData
	#tag EndProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSNetServiceDelegate", Scope = Private
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

	#tag Constant, Name = kStateIsClient, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsResolving, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsServer, Type = Double, Dynamic = False, Default = \"100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsTryingToPublish, Type = Double, Dynamic = False, Default = \"101", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsTryingToUnpublish, Type = Double, Dynamic = False, Default = \"103", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStatePublished, Type = Double, Dynamic = False, Default = \"102", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateResolved, Type = Double, Dynamic = False, Default = \"2", Scope = Public
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

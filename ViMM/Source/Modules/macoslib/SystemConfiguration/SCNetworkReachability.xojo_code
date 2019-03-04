#tag Class
Class SCNetworkReachability
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return SCNetworkReachability.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Sub Callback(target as ptr, flags as Integer, info as Ptr)
		  #pragma unused info
		  
		  dim obj as SCNetworkReachability = FindObject(target)
		  if obj = nil then
		    return
		  end if
		  
		  obj.Invoke_ReachabilityChanged(flags)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib SystemConfiguration.framework alias "SCNetworkReachabilityGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor(ref as Ptr, hasOwnership as Boolean)
		  //SCNetworkReachability objects are to be created via shared methods.
		  super.Constructor(ref, hasOwnership)
		  objectmap.Append new WeakRef(self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithAddress(address as String) As SCNetworkReachability
		  #if targetMacOS
		    declare function SCNetworkReachabilityCreateWithAddress lib SystemConfiguration.framework (allocator as Ptr, ByRef address as sockaddr) as Ptr
		    
		    const AF_INET = 2
		    
		    dim addr as sockaddr
		    addr.sa_len = sockaddr.Size
		    addr.sa_family = AF_INET
		    addr.sa_data = address
		    
		    dim p as Ptr = SCNetworkReachabilityCreateWithAddress(nil, addr)
		    if p <> nil then
		      return new SCNetworkReachability(p,hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithName(name as String) As SCNetworkReachability
		  #if targetMacOS
		    declare function SCNetworkReachabilityCreateWithName lib SystemConfiguration.framework (allocator as ptr, nodename as CString) as Ptr
		    
		    dim p as Ptr = SCNetworkReachabilityCreateWithName(nil, name)
		    if p <> nil then
		      return new SCNetworkReachability(p,hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  self.Stop
		  objectmap = RemoveObject(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObject(ref as Ptr) As SCNetworkReachability
		  dim theObject as SCNetworkReachability
		  
		  for each item as WeakRef in objectmap
		    dim value as SCNetworkReachability = SCNetworkReachability(item.Value)
		    if value <> nil and value.Reference = ref then
		      theObject = value
		      exit
		    end if
		  next
		  
		  return theObject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Invoke_ReachabilityChanged(flags as Integer)
		  raiseEvent ReachabilityChanged(flags)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsReachable() As Boolean
		  #if targetMacOS
		    declare function SCNetworkReachabilityGetFlags lib SystemConfiguration.framework (target as Ptr, ByRef flags as Integer) as Boolean
		    
		    dim flags as Integer
		    return (SCNetworkReachabilityGetFlags(self, flags) and ((flags and Reachable) = Reachable))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function RemoveObject(obj as SCNetworkReachability) As WeakRef()
		  dim W() as WeakRef
		  for each item as WeakRef in objectmap
		    if item <> nil then
		      dim value as SCNetworkReachability = SCNetworkReachability(item.Value)
		      if value <> nil and value <> obj then
		        W.Append item
		      end if
		    end if
		  next
		  return W
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function RunLoop() As CFRunLoop
		  #if targetCocoa
		    return NSRunLoop.Main.CFRunLoop
		  #elseif targetCarbon
		    return CFRunLoop.Main
		  #else
		    return nil
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  #if targetMacOS
		    declare function SCNetworkReachabilitySetCallback lib SystemConfiguration.framework (target as Ptr, callout as Ptr, context as Ptr) as Boolean
		    
		    if not SCNetworkReachabilitySetCallback(self, AddressOf Callback, nil) then
		      dim errorCode as Integer = SystemConfiguration.ErrorCode
		      raise new MacOSError(errorCode, SystemConfiguration.ErrorMessage(errorCode))
		    end if
		    
		    declare function SCNetworkReachabilityScheduleWithRunLoop lib SystemConfiguration.framework (target as Ptr, runLoop as Ptr, runLoopMode as Ptr) as Boolean
		    
		    if not SCNetworkReachabilityScheduleWithRunLoop(self, RunLoop, CFRunLoop.DefaultMode) then
		      dim errorCode as Integer = SystemConfiguration.ErrorCode
		      raise new MacOSError(errorCode, SystemConfiguration.ErrorMessage(errorCode))
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  #if targetMacOS
		    declare function SCNetworkReachabilityUnscheduleFromRunLoop lib SystemConfiguration.framework (target as ptr, runLoop as Ptr, runLoopMode as Ptr) as Boolean
		    
		    dim unscheduled as Boolean = SCNetworkReachabilityUnscheduleFromRunLoop(self, RunLoop, CFRunLoop.DefaultMode)
		    #pragma unused unscheduled
		    
		    declare function SCNetworkReachabilitySetCallback lib SystemConfiguration.framework (target as Ptr, callout as Ptr, context as Ptr) as Boolean
		    
		    dim b as Boolean = SCNetworkReachabilitySetCallback(self, nil , nil)
		    #pragma unused b
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ReachabilityChanged(flags as Integer)
	#tag EndHook


	#tag Note, Name = Documentation
		From the Apple documentation:
		
		"The SCNetworkReachability programming interface allows an application to determine the status of a 
		system's current network configuration and the reachability of a target host. A remote host is considered 
		reachable when a data packet, sent by an application into the network stack, can leave the local device. 
		Reachability does not guarantee that the data packet will actually be received by the host."
		
		A little testing suggests that this means that IsReachable will succeed if the machine is hooked to a network and, if 
		CreateWithName is used to create an SCNetworkReachability object, the name can be resolved via DNS.
		
		
		SCNetworkReachability can be used for a synchronous test.
		
		dim network as SCNetworkReachability = SCNetworkReachability.CreateWithName("www.realsoftware.com")
		return network.IsReachable
		
		
		SCNetworkReachability can also be used for asynchronous testing.
		
		//network is a property of some other object
		network = SCNetworkReachability.CreateWithName("www.realsoftware.com")
		network.Start
		AddHandler network.ReachabilityChanged, AddressOf ReachabilityChanged
		
		The ReachabilityChanged event handler is invoked when a change in network reachability is detected.
		The same object can also be used for a synchronous test.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Shared objectmap() As WeakRef
	#tag EndProperty


	#tag Constant, Name = ConnectionOnDemand, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ConnectionOnTraffic, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ConnectionRequired, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InterventionRequired, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IsDirect, Type = Double, Dynamic = False, Default = \"131072", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IsLocalAddress, Type = Double, Dynamic = False, Default = \"65536", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Reachable, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TransientConnection, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag Structure, Name = sockaddr, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		sa_len as UInt8
		  sa_family as UInt8
		sa_data as String*14
	#tag EndStructure


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

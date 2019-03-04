#tag Class
Class FSEventStream
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ref as Ptr, opts as integer, relativeToDevice as FolderItem = nil)
		  #if TargetMacOS
		    me.m_reference = ref
		    me.m_options = opts
		    me.m_RelativeTo = relativeToDevice
		    
		    if gFSEventStreams=nil then
		      gFSEventStreams = new Dictionary
		    end if
		    
		    gFSEventStreams.Value( me.Reference ) = new WeakRef( me )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CopyUUIDForDevice(dev as UInt32) As String
		  
		  #if TargetMacOS
		    declare function FSEventsCopyUUIDForDevice lib CarbonLib ( dev as UInt32 ) as Ptr
		    
		    dim p as Ptr = FSEventsCopyUUIDForDevice( dev )
		    if p<>nil then
		      dim uuid as new CFUUID( p, false )
		      
		      return uuid.StringValue
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromListOfFolderItems(forFolders() as FolderItem, options as integer, latencyInSeconds as double, fromID as UInt64 = 0) As FSEventStream
		  
		  #if TargetMacOS
		    dim paths() as string
		    
		    for i as integer=0 to forFolders.Ubound
		      paths.Append  forFolders( i ).POSIXPath
		    next
		    
		    return  FSEventStream.CreateFromListOfPaths( paths, options OR 1, latencyInSeconds, fromID )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromListOfPaths(forPaths() as string, options as integer, latencyInSeconds as double = 3.0, fromID as UInt64 = 0) As FSEventStream
		  #if TargetMacOS
		    declare function FSEventStreamCreate lib CarbonLib (alloc as Ptr, callback as Ptr, context as Ptr, Paths as Ptr, sinceWhen as UInt64, latency as double, flags as UInt32) as Ptr
		    
		    
		    dim Paths as CFArray = CFArray.CreateFromObjectsArray( forPaths )
		    dim sinceWhen as UInt64
		    if fromID = 0 then
		      sinceWhen = kFSEventStreamEventIdSinceNow
		    else
		      sinceWhen = fromID
		    end if
		    
		    dim myStreamRef as Ptr = FSEventStreamCreate( nil, AddressOf FSEventCallback, nil, Paths.Reference, sinceWhen, latencyInSeconds, options OR 1 )
		    
		    if myStreamRef=nil then
		      return  nil
		    end if
		    
		    return   new FSEventStream( myStreamRef, options, nil )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromListOfPathsForDevice(device as FolderItem, forPaths() as string, options as integer, latencyInSeconds as double = 3.0, fromID as UInt64 = 0) As FSEventStream
		  #if TargetMacOS
		    declare function FSEventStreamCreateRelativeToDevice lib CarbonLib (alloc as Ptr, callback as Ptr, context as Ptr, device as UInt32, Paths as Ptr, sinceWhen as UInt64, latency as double, flags as UInt32) as Ptr
		    
		    dim deviceURL as new CFURL(device)
		    dim stat as BSD.stat = BSD.lstat(deviceURL.Path)
		    
		    dim Paths as CFArray = CFArray.CreateFromObjectsArray( forPaths )
		    dim sinceWhen as UInt64
		    if fromID = 0 then
		      sinceWhen = kFSEventStreamEventIdSinceNow
		    else
		      sinceWhen = fromID
		    end if
		    
		    dim myStreamRef as Ptr = FSEventStreamCreateRelativeToDevice(nil, AddressOf FSEventCallback, nil, stat.st_dev, Paths.Reference, sinceWhen, latencyInSeconds, options OR 1)
		    
		    if myStreamRef = nil then
		      return nil
		    end if
		    
		    return new FSEventStream(myStreamRef, options, device)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DebugReportRepresentation(formatSpec as string = "") As variant
		  // Part of the DebugReportFormatter interface.
		  
		  #if TargetMacOS
		    declare function FSEventStreamCopyDescription lib CarbonLib (ref as Ptr) as CFStringRef
		    
		    return   FSEventStreamCopyDescription( me.Reference )
		  #endif
		  
		  #pragma unused formatSpec
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  #if TargetMacOS
		    if me.State = kStateStarted then  //Stop running (incl. automatic flushing)
		      me.Stop
		    end if
		    
		    if me.State > kStateInitialized then //Was scheduled with runloop. Unschedule.
		      UnscheduleFromRunLoop
		      me.m_State = 0
		    end if
		    
		    gFSEventStreams.Remove( me.Reference ) //Remove global reference
		    
		    soft declare sub FSEventStreamRelease lib CarbonLib (ref as Ptr)
		    
		    FSEventStreamRelease   me.Reference
		    me.m_reference = nil
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindInstance(ref as integer) As FSEventStream
		  
		  dim wr as WeakRef
		  
		  if gFSEventStreams<>nil then
		    wr = gFSEventStreams.Lookup( ref, nil )
		    
		    if wr<>nil then
		      return   FSEventStream( wr.Value )
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FlushAsync() As UInt64
		  #if TargetMacOS
		    declare function FSEventStreamFlushAsync lib CarbonLib (streamref as Ptr) as UInt64
		    
		    return  FSEventStreamFlushAsync( me.Reference )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlushSync()
		  #if TargetMacOS
		    declare sub FSEventStreamFlushSync lib CarbonLib (streamref as Ptr)
		    
		    FSEventStreamFlushSync   me.Reference
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub FSEventCallback(streamRef as integer, clientCallbackInfo as Ptr, numEvents as integer, eventPaths as Ptr, eventFlags as Ptr, eventIDs as Ptr)
		  #pragma DisableBackgroundTasks
		  #pragma StackOverflowChecking false
		  
		  dim stream as FSEventStream = FindInstance( streamref )
		  
		  if stream<>nil then
		    stream.HandleEvent   numEvents, eventPaths, eventFlags, eventIDs
		  end if
		  
		  #pragma unused clientCallbackInfo
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FSEventsGetLastEventIdForDeviceBeforeTime(dev as Int32, beforeDate as Date) As UInt64
		  #if TargetMacOS
		    declare function FSEventsGetLastEventIdForDeviceBeforeTime lib CarbonLib (dev as Int32, time as double) as UInt64
		    
		    return  FSEventsGetLastEventIdForDeviceBeforeTime( dev, CoreFoundation.ConvertDateToCFAbsoluteTime( beforeDate ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEvent(numEvents as integer, eventPaths as Ptr, eventFlags as Ptr, eventIDs as Ptr)
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    #pragma StackOverflowChecking false
		    
		    declare function CFArrayGetStringAtIndex lib CarbonLib alias "CFArrayGetValueAtIndex" (theArray as Ptr, idx as Integer) as CFStringRef
		    declare function CFArrayGetValueAtIndex lib CarbonLib alias "CFArrayGetValueAtIndex" (theArray as Ptr, idx as Integer) as Ptr
		    declare function CFNumberGetValue lib CarbonLib (nbr as Ptr, theType as integer, outValue as Ptr) as Boolean
		    
		    const kCFNumberIntType = 9
		    const kCFNumberLongType = 10
		    
		    dim id as UInt64
		    dim path as String
		    dim flags as UInt32
		    'dim mb as new MemoryBlock( 8 )
		    dim mb2, mb3 as MemoryBlock
		    'dim p as Ptr
		    dim arp() as string
		    dim arf() as Integer
		    dim arid() as UInt64
		    dim f as FolderItem
		    
		    mb2 = eventFlags
		    mb3 = eventIDs
		    
		    for i as integer=0 to numEvents - 1
		      path = CFArrayGetStringAtIndex( eventPaths, i )
		      arp.Append   path
		      
		      if RelativeTo<>nil then
		        f = GetFolderItemFromPOSIXPath( RelativeTo.POSIXPath + "/" + path )
		      else
		        f = GetFolderItemFromPOSIXPath( path )
		      end if
		      
		      flags = mb2.UInt32Value( i * 4 )
		      arf.Append   flags
		      
		      id = mb3.UInt64Value( i * 8 )
		      arid.Append   id
		    next
		    
		    RaiseEvent  FilesystemModified( arp, arf, arid )
		    
		  #else
		    
		    #pragma unused numEvents
		    #pragma unused eventPaths
		    #pragma unused eventFlags
		    #pragma unused eventIDs
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LatestEventID() As UInt64
		  //Get the latest eventID passed to this stream
		  
		  #if TargetMacOS
		    declare function FSEventStreamGetLatestEventId lib CarbonLib (ref as Ptr) as UInt64
		    
		    return  FSEventStreamGetLatestEventId( me.Reference )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScheduleWithRunLoop()
		  #if TargetMacOS
		    declare sub FSEventStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoop as Ptr, runLoopMode as CFStringRef )
		    
		    if me.State = kStateInitialized then
		      FSEventStreamScheduleWithRunLoop   me.Reference, CFRunLoop.Current.Reference, "kCFRunLoopDefaultMode"
		      me.m_state = kStateScheduled
		    else
		      raise  new macoslibException( "Could not schedule FSEventStream. Incompatible state" )
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Start() As Boolean
		  #if TargetMacOS
		    declare function FSEventStreamStart lib CarbonLib (streamref as Ptr) as Boolean
		    
		    if me.State = kStateScheduled OR me.State = kStateStopped then
		      dim OK as Boolean = FSEventStreamStart( me.Reference )
		      if OK then
		        me.m_state = kStateStarted
		      end if
		      return  OK
		    else
		      raise new macoslibException( "FSEventStream cannot be started. Incompatible state." )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  #if TargetMacOS
		    declare sub FSEventStreamStop lib CarbonLib (streamref as Ptr)
		    
		    if me.State = kStateStarted then
		      FlushSync
		      FSEventStreamStop   me.Reference
		      m_State = kStateStopped
		    else
		      raise new macoslibException( "Cannot stop FSEventStream. Incompatible state." )
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SystemLatestEventID() As UInt64
		  #if TargetMacOS
		    declare Function FSEventsGetCurrentEventId lib CarbonLib ( ) as UInt64
		    
		    return  FSEventsGetCurrentEventId( )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnscheduleFromRunLoop()
		  #if TargetMacOS
		    declare sub FSEventStreamInvalidate lib CarbonLib (ref as Ptr)
		    
		    if me.State>=kStateScheduled then
		      FSEventStreamInvalidate( me.Reference )
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FilesystemModified(alteredPaths() as string, eventFlags() as integer, eventIDs() as UInt64)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared gFSEventStreams As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_options As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_Reference As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_RelativeTo As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_State As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return   m_Reference
			End Get
		#tag EndGetter
		Reference As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  m_RelativeTo
			End Get
		#tag EndGetter
		RelativeTo As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  m_State
			End Get
		#tag EndGetter
		State As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kStateInitialized, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateScheduled, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateStarted, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateStopped, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant


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

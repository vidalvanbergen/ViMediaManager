#tag Class
Class MacFSEventStream
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(fromStream as FSEventStream)
		  #if TargetMacOS
		    me.stream = fromStream
		    
		    AddHandler   stream.FilesystemModified, AddressOf HandleEvents
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CopyUUIDForDevice(dev as FolderItem) As String
		  //# Copy the UUID (Universally Unique ID) of the FSEvents persistent store on the given volume
		  
		  //@ Before you use the "fromID" parameter with a previously stored value in CreateFromListOfPathsForDevice, you
		  //@   should check that the FSEvents database has the same UUID as before.
		  //@   The UUID may change if the volume has been erased or when the eventID has gone beyond the upper limit of a UInt64
		  //@   in which case it rolls back to 0.
		  
		  //@ Note: this UUID is only related to FSEvents and must not be confused with VolumeUUID or the DeviceUUID
		  
		  #if TargetMacOS
		    declare function FSEventsCopyUUIDForDevice lib CarbonLib ( dev as UInt32 ) as Ptr
		    
		    dim devURL as new CFURL(dev)
		    dim stat as BSD.stat = BSD.lstat(devURL.Path)
		    dim p as Ptr = FSEventsCopyUUIDForDevice(stat.st_dev)
		    if p<>nil then
		      dim uuid as new CFUUID(p, CFUUID.hasOwnership)
		      return uuid.StringValue
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromListOfFolderItems(forFolders() as FolderItem, options as integer, latencyInSeconds as double, fromID as UInt64 = 0) As MacFSEventStream
		  //# Create a MacFSEventStream from an array of FolderItems, which can correspond to folders on several volumes
		  
		  #if TargetMacOS
		    return  new MacFSEventStream( FSEventStream.CreateFromListOfFolderItems( forFolders, options, latencyInSeconds, fromID ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromListOfPaths(forPaths() as string, options as integer, latencyInSeconds as double = 3.0, fromID as UInt64 = 0) As MacFSEventStream
		  //# Create a MacFSEventStream from an array of POSIX paths, which can correspond to folders on several volumes
		  
		  #if TargetMacOS
		    return  new MacFSEventStream( FSEventStream.CreateFromListOfPaths( forPaths, options, latencyInSeconds, fromID ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromListOfPathsForDevice(device as FolderItem, forPaths() as string, options as integer, latencyInSeconds as double = 3.0, fromID as UInt64 = 0) As MacFSEventStream
		  //# Create a MacFSEventStream from an array of POSIX paths relative to a given volume (device)
		  
		  #if TargetMacOS
		    return  new MacFSEventStream( FSEventStream.CreateFromListOfPathsForDevice( device, forPaths, options, latencyInSeconds, fromID ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DebugReportRepresentation(formatSpec as string = "") As variant
		  // Part of the DebugReportFormatter interface.
		  
		  #if TargetMacOS
		    return   stream.DebugReportRepresentation( formatSpec )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FlushAsync() As UInt64
		  //# Asynchronously flush pending events in the stream and return the last eventID
		  
		  //@ You can store the last eventID and pass it to a future MacFSEventStream in order to get all the events which occurred while your application
		  //@   was not running.
		  
		  #if TargetMacOS
		    return  stream.FlushAsync
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlushSync()
		  //# Synchronously flush pending events in the stream
		  
		  //@ This is automatically called when you call Stop
		  
		  #if TargetMacOS
		    stream.FlushSync
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEvents(obj as FSEventStream, alteredPaths() as string, eventFlags() as integer, eventIDs() as UInt64)
		  #if TargetMacOS
		    dim events() as MacFSEvent
		    
		    for i as integer=0 to alteredPaths.Ubound
		      events.Append   new MacFSEvent( alteredPaths( i ), eventFlags( i ), eventIDs( i ))
		    next
		    
		    RaiseEvent   FilesystemModified( events )
		  #endif
		  
		  #pragma unused obj
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LatestEventID() As UInt64
		  //# Return the latest eventID received by the stream
		  
		  #if TargetMacOS
		    return   stream.LatestEventID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Start() As Boolean
		  //# Start receiving events in the FilesystemModified event
		  
		  #if TargetMacOS
		    if stream.State = stream.kStateInitialized then
		      stream.ScheduleWithRunLoop
		    end if
		    return   stream.Start
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  //# Stop receiving events in the FilesystemModified event
		  
		  #if TargetMacOS
		    if stream.State = stream.kStateStarted then
		      stream.Stop
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SystemLatestEventID() As UInt64
		  //# Return the latest eventID issued by the system
		  
		  #if TargetMacOS
		    return  FSEventStream.SystemLatestEventID
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FilesystemModified(events() as MacFSEvent)
	#tag EndHook


	#tag Note, Name = Documentation
		On Mac OS X, every file modification event is kept in a database and the events are dispatched to applications which registered for such notifications through
		  a MacFSEventStream. Not only it allows to receive FSEvents in nearly real-time, but also can your application play back all the events which occurred between
		  the last time your application stopped and the current time.
		
		When you create a MacFSEventStream, you can specify an arbitrary number of paths to check.
		
		Notes:
		  • On Mac OS X 10.5 and 10.6, only the parent folder is passed when a file is created/modified which means that you must build and keep up-to-date the
		      whole hierarchy of files and folders that you are interested in and detect where the modifications occurred.
		  • Starting with Mac OS X 10.7, you can select to get the events at the file level.
		  • FSEvents are sent in order but FSEvents in rapid succession will be coalesced into one event.
	#tag EndNote


	#tag Property, Flags = &h21
		Private stream As FSEventStream
	#tag EndProperty


	#tag Constant, Name = kFSEventStreamCreateFlagFileEvents, Type = Double, Dynamic = False, Default = \"&h10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamCreateFlagIgnoreSelf, Type = Double, Dynamic = False, Default = \"&h8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamCreateFlagNoDefer, Type = Double, Dynamic = False, Default = \"&h2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamCreateFlagUseCFTypes, Type = Double, Dynamic = False, Default = \"&h1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamCreateFlagWatchRoot, Type = Double, Dynamic = False, Default = \"&h4", Scope = Public
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

#tag Class
Class MacDeviceItem
	#tag Method, Flags = &h0
		Function BusProtocol() As String
		  return zBusProtocol
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromDictionary(dict As Dictionary) As MacDeviceItem
		  if dict is nil then return nil
		  
		  dim isPartition as boolean = not dict.Lookup( "WholeDisk", false )
		  
		  dim r as MacDiskUtil.MacDeviceItem
		  if isPartition then
		    r = new MacPartitionItem
		  else
		    r = new MacDeviceItem
		  end if
		  
		  r.zIsPartition = isPartition
		  r.pRefresh( dict )
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Eject() As Boolean
		  dim r as boolean
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "eject " + me.Identifier
		  dim sh as Shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  r = ( sh.ErrorCode = 0 )
		  if r then
		    me.Refresh
		  end if
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Identifier() As String
		  return zIdentifier
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Internal() As Boolean
		  return zInternal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LowLevelFormatSupported() As Boolean
		  return zLowLevelFormatSupported
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MediaType() As String
		  return zMediaType
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MountDisk() As Boolean
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "mountDisk "
		  cmd = cmd + me.ParentIdentifier
		  
		  dim r as shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  return r.ErrorCode = 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MountPoint() As String
		  return zMountPoint
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Node() As String
		  return zNode
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  return Identifier
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentIdentifier() As String
		  return zParentIdentifier
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Partitions() As MacPartitionItem()
		  dim r() as MacPartitionItem
		  
		  dim info as Dictionary = pGetDiskUtilList( me.Identifier )
		  if info is nil then return r
		  
		  dim disksArr() as Variant = info.Lookup( "AllDisksAndPartitions", nil )
		  if disksArr is nil or disksArr.Ubound = -1 then return r
		  
		  dim thisDisk as Dictionary = disksArr( 0 )
		  if thisDisk.Count = 0 then return r
		  
		  dim partitionsListArr() as Variant
		  dim v as Variant = thisDisk.Lookup( "Partitions", nil )
		  #if DebugBuild
		    dim thisType as integer = v.Type
		    #pragma unused thisType
		  #endif
		  if v is nil or v.Type < Variant.TypeArray then
		    return r
		  end if
		  
		  partitionsListArr = v
		  if partitionsListArr.Ubound = -1 then return r
		  
		  for i as integer = 0 to partitionsListArr.Ubound
		    dim partitionDict as Dictionary = partitionsListArr( i )
		    dim id as string = partitionDict.Lookup( "DeviceIdentifier", "" )
		    if id <> "" then
		      dim partition as MacDiskUtil.MacPartitionItem = MacDiskUtil.MacPartitionItem( Device( id ) )
		      r.Append partition
		    end if
		  next
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pGrepInfo(term As String) As String
		  dim r as string
		  
		  term = " " + term + ": "
		  dim quotedTerm as string = "'" + term + "'"
		  
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "info " + me.Identifier + " | grep " + quotedTerm
		  dim sh as Shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  if sh.ErrorCode = 0 then
		    r = sh.Result
		    dim parts() as string = r.Split( term )
		    r = parts( parts.Ubound )
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pRefresh(dict As Dictionary)
		  if dict = nil then return
		  
		  zDict = dict
		  
		  'me.zBootable = dict.Lookup( "Bootable", false )
		  me.zBusProtocol = dict.Lookup( "BusProtocol", "" )
		  
		  'me.zCanBeMadeBootable = dict.Lookup( "CanBeMadeBootable", false )
		  'me.zCanBeMadeBootableRequiresDestroy = dict.Lookup( "CanBeMadeBootableRequiresDestroy", false )
		  'me.zType = dict.Lookup( "Content", "" )
		  'me.zBlockSize = dict.Lookup( "DeviceBlockSize", false )
		  me.zIdentifier = dict.Lookup( "DeviceIdentifier", "" )
		  me.zNode = dict.Lookup( "DeviceNode", "" )
		  me.zTreePath = dict.Lookup( "DeviceTreePath", "" )
		  'me.zEjectable = dict.Lookup( "Ejectable", false )
		  'me.zGlobalPermissionsEnabled = dict.Lookup( "GlobalPermissionsEnabled", false )
		  'me.zIOKitSize = dict.Lookup( "IOKitSize", false )
		  me.zInternal = dict.Lookup( "Internal", false )
		  if not zIsPartition then
		    me.zLowLevelFormatSupported = dict.Lookup( "LowLevelFormatSupported", false )
		  end if
		  'me.zMediaName = dict.Lookup( "MediaName", "" )
		  me.zMediaType = dict.Lookup( "MediaType", "" )
		  me.zMountPoint = dict.Lookup( "MountPoint", "" )
		  me.zParentIdentifier = dict.Lookup( "ParentWholeDisk", "" )
		  'me.zRAIDMaster = dict.Lookup( "RAIDMaster", false )
		  'me.zRAIDSlice = dict.Lookup( "RAIDSlice", false )
		  'me.zSupportsGlobalPermissionsDisable = dict.Lookup( "SupportsGlobalPermissionsDisable", false )
		  'me.zSystemImage = dict.Lookup( "SystemImage", false )
		  me.zTotalSize = dict.Lookup( "TotalSize", false )
		  'me.zVolumeName = dict.Lookup( "VolumeName", "" )
		  'me.zWritable = dict.Lookup( "Writable", false )
		  'me.zWritableMedia = dict.Lookup( "WritableMedia", false )
		  'me.zWritableVolume = dict.Lookup( "WritableVolume", false )
		  
		  RaiseEvent RefreshFromDict( dict )
		  
		  zLastRefreshMicroseconds = Microseconds
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pValueFromKey(key As String) As Variant
		  dim r as Variant = ""
		  
		  dim elapsed as Double = Microseconds - zLastRefreshMicroseconds
		  if elapsed > kRefreshIntervalMicroseconds then
		    me.Refresh
		  end if
		  
		  if zDict is nil then return r
		  r = zDict.Lookup( key, "" )
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh()
		  // Updates all the properties
		  
		  dim dict as Dictionary = MacDiskUtil.pGetDiskUtilInfo( me.Identifier )
		  zDict = dict
		  if dict <> nil then
		    me.pRefresh( dict )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalSize() As UInt64
		  return zTotalSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TreePath() As String
		  return zTreePath
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnmountDisk(force As Boolean = False) As Boolean
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "unmountDisk "
		  if force then
		    cmd = cmd + "force "
		  end if
		  cmd = cmd + me.ParentIdentifier
		  
		  dim r as shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  return r.ErrorCode = 0
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RefreshFromDict(dict As Dictionary)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "DeviceBlockSize" )
			  
			End Get
		#tag EndGetter
		BlockSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "Bootable" )
			  
			End Get
		#tag EndGetter
		Bootable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "CanBeMadeBootable" )
			  
			End Get
		#tag EndGetter
		CanBeMadeBootable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "CanBeMadeBootableRequiresDestroy" )
			  
			End Get
		#tag EndGetter
		CanBeMadeBootableRequiresDestroy As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not zIsPartition then return me
			  
			  dim r as MacDeviceItem
			  
			  dim id as string = zParentIdentifier
			  if id <> "" then
			    try
			      r = Device( id )
			    catch
			      r = nil
			    end try
			  else
			    r = nil
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		Device As MacDeviceItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "Ejectable" )
			  
			End Get
		#tag EndGetter
		Ejectable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "FreeSpace" )
			  
			End Get
		#tag EndGetter
		FreeSpace As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "GlobalPermissionsEnabled" )
			  
			End Get
		#tag EndGetter
		GlobalPermissionsEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "Content" )
			  
			End Get
		#tag EndGetter
		IOContent As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "IOKitSize" )
			  
			End Get
		#tag EndGetter
		IOKitSize As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "MediaName" )
			  
			End Get
		#tag EndGetter
		MediaName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			i
		#tag EndNote
		#tag Getter
			Get
			  return me.MountStatus = MountType.Mounted
			End Get
		#tag EndGetter
		Mounted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as MountType = MountType.Unknown
			  
			  try
			    dim text as string = pGrepInfo( "Mounted" )
			    if text.InStr( "not applicable" ) <> 0 then
			      r = MountType.NotApplicable
			    elseif text.InStr( "yes" ) <> 0 then
			      r = MountType.Mounted
			    elseif text.InStr( "no" ) <> 0 then
			      r = MountType.Unmounted
			    end if
			    
			  catch
			  end
			  
			  return r
			  
			End Get
		#tag EndGetter
		MountStatus As MountType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "RAIDMaster" )
			  
			End Get
		#tag EndGetter
		RAIDMaster As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "RAIDSlice" )
			  
			End Get
		#tag EndGetter
		RAIDSlice As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "SMARTStatus" ).StringValue
			  
			End Get
		#tag EndGetter
		SMARTStatus As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "SupportsGlobalPermissionsDisable" )
			  
			End Get
		#tag EndGetter
		SupportsGlobalPermissionsDisable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "SystemImage" )
			  
			End Get
		#tag EndGetter
		SystemImage As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "VolumeName" )
			  
			End Get
		#tag EndGetter
		VolumeName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "Writable" )
			  
			End Get
		#tag EndGetter
		Writable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "WritableMedia" )
			  
			End Get
		#tag EndGetter
		WritableMedia As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "WritableVolume" )
			  
			End Get
		#tag EndGetter
		WritableVolume As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected zBusProtocol As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zIdentifier As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zInternal As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zIsPartition As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zLastRefreshMicroseconds As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zLowLevelFormatSupported As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zMediaType As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zMountPoint As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zNode As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zParentIdentifier As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zTotalSize As UInt64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zTreePath As String
	#tag EndProperty


	#tag Constant, Name = kRefreshIntervalMicroseconds, Type = Double, Dynamic = False, Default = \"100000.", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = MountType, Type = Integer, Flags = &h0
		Unknown = -2
		  NotApplicable = -1
		  Unmounted = 0
		Mounted = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="BlockSize"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bootable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBeMadeBootable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBeMadeBootableRequiresDestroy"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ejectable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FreeSpace"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GlobalPermissionsEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IOContent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IOKitSize"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MediaName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mounted"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MountStatus"
			Group="Behavior"
			Type="MountType"
			EditorType="Enum"
			#tag EnumValues
				"-2 - Unknown"
				"-1 - NotApplicable"
				"0 - Unmounted"
				"1 - Mounted"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RAIDMaster"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RAIDSlice"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SMARTStatus"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SupportsGlobalPermissionsDisable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SystemImage"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VolumeName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Writable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WritableMedia"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WritableVolume"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

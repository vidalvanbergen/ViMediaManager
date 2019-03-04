#tag Class
Protected Class MacSystemProfiler
	#tag Method, Flags = &h0
		Shared Function AllDataTypes() As String()
		  dim r() as string
		  
		  #if TargetMacOS
		    
		    ConstructorShared()
		    
		    redim r( zAllDataTypes.Ubound )
		    for i as integer = 0 to zAllDataTypes.Ubound
		      r( i ) = zAllDataTypes( i )
		    next
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AllDataTypes(index As Integer) As String
		  dim r as string
		  
		  #if TargetMacOS
		    
		    ConstructorShared()
		    
		    r = zAllDataTypes( index )
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsText() As String
		  #if TargetMacOS
		    
		    if zTextProfile = "" then
		      zTextProfile = pExecute( "-detailLevel", zDetailLevelString, DataTypesAsString )
		    end if
		    
		  #endif
		  
		  return zTextProfile
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsXML() As String
		  return zXMLProfile
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(level As DetailLevel, ParamArray dataType As String)
		  #if TargetMacOS
		    
		    ConstructorShared()
		    
		    select case level
		    case DetailLevel.Mini
		      zDetailLevelString = "mini"
		    case DetailLevel.Basic
		      zDetailLevelString = "basic"
		    else
		      zDetailLevelString = "full"
		    end
		    
		    for i as integer =  0 to dataType.Ubound
		      dataType( i ) = pFixDataType( dataType( i ) )
		    next
		    
		    dim dTypesString as string = join( dataType, " " )
		    dim s as string = pExecute( "-xml -detailLevel", zDetailLevelString, dTypesString )
		    
		    // Remove any errors from the plist
		    dim pos as integer = s.InStr( "<?xml version=" )
		    if pos > 1 then
		      s = s.Mid( pos )
		    end if
		    pos = s.InStr( "</plist>" )
		    if pos <> 0 then
		      s = s.Left( pos + 8 )
		    end if
		    
		    zXMLProfile = s
		    zProfile = MacPListBrowser.CreateFromPListString( zXMLProfile )
		    
		    // Split up the sections
		    zSections = new Dictionary
		    dim lastSectionIndex as integer = zProfile.Count - 1
		    redim zDataTypes( lastSectionIndex )
		    for i as integer = 0 to lastSectionIndex
		      dim section as MacPListBrowser = zProfile.Child( i )
		      dim thisKey as string = section.Child( "_dataType" ).VariantValue
		      zSections.Value( thisKey ) = section
		      zDataTypes( i ) = thisKey
		    next
		    
		  #else
		    #pragma unused level
		    #pragma unused dataType
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParamArray dataType As String)
		  me.Constructor( DetailLevel.Basic, join( dataType, " " ) )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub ConstructorShared()
		  if not zInitedShared and IsAvailable then
		    zInitedShared = true // Have to do this first to prevent a loop
		    
		    pInitAllDataTypes()
		    pInitHardwareInfo()
		    pInitSystemSoftwareInfo()
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CurrentSSID() As String
		  // Convenience method to return the currently connected SSID, if any
		  
		  dim r as string
		  
		  #if TargetMacOS
		    
		    dim sp as new MacSystemProfiler( "AirPort" )
		    dim profiles() as MacPListBrowser = sp.Profile.FindByKey( "spairport_current_network_information" )
		    for each thisProfile as MacPListBrowser in profiles
		      if thisProfile.HasKey( "_name" ) then
		        r = thisProfile.Child( "_name" ).VariantValue
		        exit
		      end if
		    next
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataTypes() As String()
		  static arr() as string
		  
		  #if TargetMacOS
		    
		    if arr.Ubound <> ( SectionCount - 1 ) then
		      redim arr( zDataTypes.Ubound )
		      for i as integer = 0 to zDataTypes.Ubound
		        arr( i ) = zDataTypes( i )
		      next
		    end if
		    
		  #endif
		  
		  return arr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsAvailable() As Boolean
		  #if TargetMacOS
		    dim f as FolderItem = GetFolderItem( kSystemProfilerShellPath, FolderItem.PathTypeShell )
		    return f <> nil and f.Exists
		  #else
		    return false
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(dataType As String, itemIndex As Integer) As MacPListBrowser
		  dataType = pFixDataType( dataType )
		  if dataType = "" and zDataTypes.Ubound = 0 then
		    dataType = zDataTypes( 0 )
		  end if
		  dim sec as MacPListBrowser = zSections.Value( dataType )
		  sec = sec.Child( "_items" )
		  return sec.Child( itemIndex ).Clone
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemCount(dataType As String) As Integer
		  dim r as integer
		  
		  dataType = pFixDataType( dataType )
		  if dataType = "" and zDataTypes.Ubound = 0 then
		    dataType = zDataTypes( 0 )
		  end if
		  
		  #if TargetMacOS
		    
		    dim sec as MacPListBrowser = zSections.Value( dataType )
		    dim plist as MacPListBrowser = sec.Child( "_items" )
		    r = plist.Count
		    
		  #endif
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Items(dataType As String) As MacPListBrowser()
		  dim r() as MacPListBrowser
		  
		  dataType = pFixDataType( dataType )
		  if dataType = "" and zDataTypes.Ubound = 0 then
		    dataType = zDataTypes( 0 )
		  end if
		  
		  #if TargetMacOS
		    
		    dim sec as MacPListBrowser = zSections.Value( dataType )
		    sec = sec.Child( "_items" )
		    dim lastIndex as integer = sec.Count - 1
		    for i as integer = 0 to lastIndex
		      r.Append sec.Child( i ).Clone
		    next i
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function pExecute(ParamArray switches As String) As String
		  #if TargetMacOS
		    
		    dim cmd as string = kSystemProfilerShellPath
		    dim s as string = join( switches, " " )
		    if s <> "" then
		      cmd = cmd + " " + s
		    end if
		    dim sh as new Shell
		    sh.Execute cmd
		    return sh.Result
		    
		  #else
		    
		    #pragma unused switches
		    
		    return ""
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pFixDataType(dataType As String) As String
		  dataType = dataType.Trim
		  if dataType = "" then return ""
		  
		  dataType = dataType.ConvertEncoding( Encodings.UTF8 )
		  if dataType.Left( 2 ) <> "SP" then
		    dataType = "SP" + dataType
		  end if
		  if dataType.Right( 8 ) <> "DataType" then
		    dataType = dataType + "DataType"
		  end if
		  
		  return dataType
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function pGetHardwareValue(key As String) As Variant
		  ConstructorShared()
		  return zHardwareInfo.Value( key )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function pGetSoftwareValue(key As String) As Variant
		  #if TargetMacOS
		    
		    dim profile as new MacSystemProfiler( MacSystemProfiler.DetailLevel.Basic, DataTypeSoftware )
		    return profile.Value( key )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub pInitAllDataTypes()
		  #if TargetMacOS
		    
		    if zAllDataTypes.Ubound = -1 then
		      
		      dim s as string = pExecute( "-listDataTypes" )
		      s = ReplaceLineEndings( s, EndOfLine.Macintosh )
		      s = s.Trim
		      zAllDataTypes = s.SplitB( EndOfLine.Macintosh )
		      zAllDataTypes.Remove 0 // It's a label
		      
		      while zAllDataTypes.Ubound <> -1 and zAllDataTypes( zAllDataTypes.Ubound ) = ""
		        zAllDataTypes.Remove zAllDataTypes.Ubound
		      wend
		      
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub pInitHardwareInfo()
		  #if TargetMacOS
		    
		    if zHardwareInfo is nil then
		      dim p as new MacSystemProfiler( DetailLevel.Basic, DataTypeHardware )
		      dim plist as MacPListBrowser = p.Section( DataTypeHardware ).Child( "_items" ).Child( 0 )
		      dim dict as Dictionary = plist.VariantValue
		      zHardwareInfo = dict
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub pInitSystemSoftwareInfo()
		  #if TargetMacOS
		    
		    if zSystemSoftwareVersion = "" or zSystemSoftwareBuild = "" then
		      
		      dim sh as new Shell
		      sh.Execute "/usr/bin/sw_vers -productVersion"
		      zSystemSoftwareVersion = sh.Result
		      
		      sh.Execute "/usr/bin/sw_vers -buildVersion"
		      zSystemSoftwareBuild = sh.Result
		      
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function pMemoryStringAsDouble(value As String) As Double
		  dim r as double
		  
		  if value <> "" then
		    
		    dim parts() as string = SplitB( value, " " )
		    r = parts( 0 ).Val
		    if parts.Ubound = 1 then
		      select case parts( 1 )
		      case "PB"
		        r = r * ( 1024. ^ 5. )
		      case "TB"
		        r = r * ( 1024. ^ 4. )
		      case "GB"
		        r = r * ( 1024. ^ 3. )
		      case "MB"
		        r = r * ( 1024. ^ 2. )
		      case "KB"
		        r = r * 1024.
		      end
		    end if
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Profile() As MacPListBrowser
		  return zProfile.Clone
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Section(dataType As String) As MacPListBrowser
		  #if TargetMacOS
		    
		    dataType = pFixDataType( dataType )
		    if dataType = "" and zDataTypes.Ubound = 0 then
		      dataType = zDataTypes( 0 )
		    end if
		    dim r as MacPListBrowser = zSections.Value( dataType )
		    return r.Clone
		    
		  #else
		    
		    #pragma unused dataType
		    
		    return nil
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionCount() As Integer
		  return zSections.Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Shared Function SelfTestShared() As Boolean
		  try
		    
		    dim v as Variant
		    v = MacSystemProfiler.HW_BootROMVersion
		    v = MacSystemProfiler.HW_BusSpeed
		    v = MacSystemProfiler.HW_CPUType
		    v = MacSystemProfiler.HW_UUID
		    v = MacSystemProfiler.HW_L2CachePerProcessor
		    v = MacSystemProfiler.HW_MachineName
		    v = MacSystemProfiler.HW_Memory
		    v = MacSystemProfiler.HW_ModelIdentifier
		    v = MacSystemProfiler.HW_NumberOfCores
		    v = MacSystemProfiler.HW_NumberOfProcessors
		    v = MacSystemProfiler.HW_ProcessorSpeed
		    v = MacSystemProfiler.HW_SerialNumber
		    v = MacSystemProfiler.HW_SMCVersion
		    
		    v = SystemSoftwareVersion
		    if v = "" then
		      return false
		    end if
		    v = SystemSoftwareBuild
		    if v = "" then
		      return false
		    end if
		    v = SystemSoftwareVersionAsInt
		    
		    dim d as date = SW_BootDate
		    #pragma unused d
		    v = SW_BootMode
		    v = SW_BootVolume
		    v = SW_ComputerName
		    v = SW_KernelVersion
		    v = SW_SecureVMEnabled
		    v = SW_SystemVersion
		    v = SW_UptimeInSecs
		    v = SW_UserNameLong
		    v = SW_UserNameShort
		    
		    return true
		    
		  catch
		    return false
		    
		  end try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_BootDate() As Date
		  dim d as new Date
		  d.TotalSeconds = d.TotalSeconds - SW_UpTimeInSecs
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_BootMode() As String
		  return pGetSoftwareValue( "boot_mode" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_BootVolume() As String
		  return pGetSoftwareValue( "boot_volume" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_ComputerName() As String
		  return pGetSoftwareValue( "local_host_name" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_KernelVersion() As String
		  return pGetSoftwareValue( "kernel_version" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_SecureVMEnabled() As Boolean
		  dim s as string = pGetSoftwareValue( "secure_vm" )
		  return s.InStrB( "_enabled" ) <> 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_SystemVersion() As String
		  return pGetSoftwareValue( "os_version" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_UptimeInSecs() As Double
		  dim s as string = pGetSoftwareValue( "uptime" )
		  s = s.Replace( "up ", "" )
		  dim digits() as string = s.SplitB( ":" )
		  dim r as double
		  if digits.Ubound <> -1 then
		    r = digits( 0 ).Val * 24. * 3600.
		    if digits.Ubound > 0 then
		      r = r + digits( 1 ).Val * 3600.
		      if digits.Ubound > 1 then
		        r = r + digits( 2 ).Val * 60.
		        if digits.Ubound > 2 then
		          r = r + digits( 3 ).Val
		        end if
		      end if
		    end if
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_UserNameLong() As String
		  dim un as string = pGetSoftwareValue( "user_name" )
		  dim pos as integer = un.InStrB( "(" )
		  if pos <> 0 then
		    un = un.LeftB( pos - 1 )
		  end if
		  return un.Trim
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SW_UserNameShort() As String
		  dim un as string = pGetSoftwareValue( "user_name" )
		  dim pos as integer = un.InStrB( "(" )
		  if pos <> 0 then
		    un = un.MidB( pos + 1 )
		    un = un.LeftB( un.LenB - 1 )
		  end if
		  return un.Trim
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SystemSoftwareBuild() As String
		  static vers as string
		  
		  #if TargetMacOS
		    
		    if vers = "" then
		      pInitSystemSoftwareInfo
		      vers = zSystemSoftwareBuild
		    end if
		    
		  #endif
		  
		  return vers
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SystemSoftwareVersion() As String
		  static vers as string
		  
		  #if TargetMacOS
		    
		    if vers = "" then
		      ConstructorShared()
		      vers = zSystemSoftwareVersion
		    end if
		    
		  #endif
		  
		  return vers
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SystemSoftwareVersionAsInt() As Integer
		  static vers as integer
		  
		  #if TargetMacOS
		    
		    if vers = 0 then
		      ConstructorShared()
		      vers = Carbon.VersionAsInteger( zSystemSoftwareVersion )
		    end if
		    
		  #endif
		  
		  return vers
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key As String, dataType As String = "", identifierValue As String = "", identifierKey As String = "_name") As Variant
		  // Finds the given key, but looks only in the given dataType.
		  // If a key occurs more than once, only the first occurrence will be returned (shouldn't happen).
		  
		  dim r as Variant
		  
		  key = key.Trim
		  if key = "" then return r
		  
		  identifierKey = identifierKey.Trim
		  identifierValue = identifierValue.Trim
		  
		  dataType = pFixDataType( dataType )
		  
		  #if TargetMacOS
		    
		    dim p() as MacPListBrowser
		    if dataType = "" then
		      dim v() as Variant = zSections.Values
		      for i as integer = 0 to v.Ubound
		        p.Append v( i )
		      next
		    else
		      p.Append zSections.Value( key ) // Will generate an exception if the key doesn't exist
		    end if
		    
		    for i as integer = 0 to p.Ubound
		      dim item as MacPListBrowser = p( i ).Child( "_items" )
		      dim found() as MacPListBrowser
		      if identifierKey = "" or identifierValue = "" then
		        found = item.FindByKey( key )
		      else
		        found = item.FindByKeyAndValue( identifierKey, identifierValue )
		        if found.Ubound <> -1 then
		          item = found( 0 ).Parent
		          found = item.FindByKey( key )
		        end if
		      end if
		      
		      if found.Ubound <> -1 then
		        r = found( 0 ).VariantValue
		        exit
		      end if
		    next
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Data Types
		
		As of this writing on OS X 10.8.2, these are the acceptible data types.
		You can get list on your system in MacSystemProfiler.AllDataTypes or by typing in Terminal:
		
		  system_profiler -listDataTypes
		
		Available Datatypes:
		SPParallelATADataType
		SPUniversalAccessDataType
		SPApplicationsDataType
		SPAudioDataType
		SPBluetoothDataType
		SPCardReaderDataType
		SPComponentDataType
		SPDeveloperToolsDataType
		SPDiagnosticsDataType
		SPDiscBurningDataType
		SPEthernetDataType
		SPExtensionsDataType
		SPFibreChannelDataType
		SPFireWireDataType
		SPFirewallDataType
		SPFontsDataType
		SPFrameworksDataType
		SPDisplaysDataType
		SPHardwareDataType
		SPHardwareRAIDDataType
		SPInstallHistoryDataType
		SPNetworkLocationDataType
		SPLogsDataType
		SPManagedClientDataType
		SPMemoryDataType
		SPModemDataType
		SPNetworkDataType
		SPPCIDataType
		SPParallelSCSIDataType
		SPPowerDataType
		SPPrefPaneDataType
		SPPrintersSoftwareDataType
		SPPrintersDataType
		SPConfigurationProfileDataType
		SPSASDataType
		SPSerialATADataType
		SPSoftwareDataType
		SPStartupItemDataType
		SPSyncServicesDataType
		SPThunderboltDataType
		SPUSBDataType
		SPNetworkVolumeDataType
		SPWWANDataType
		SPAirPortDataType
	#tag EndNote

	#tag Note, Name = Legal
		This class was created by Kem Tekinay, MacTechnologies Consulting (ktekinay@mactechnologies.com).
		It is copyright ©2013, all rights reserved.
		
		You may use this class AS IS at your own risk for any purpose. The author does not warrant its use
		for any particular purpose and disavows any responsibility for bad design, poor execution,
		or any other faults.
		
		The author does not actively support this class, although comments and recommendations
		are welcome.
		
		You may modify code in this class as long as those modifications are clearly indicated
		via comments in the source code.
		
		You may distribute this class, modified or unmodified, as long as any modifications
		are clearly indicated, as noted above, and this copyright notice is not disturbed or removed.
		
		This class is distributed as part of, and is dependent on, the MacOSLib project.
	#tag EndNote

	#tag Note, Name = Release Notes
		1.02:
		- Added SSID shared method.
		
		1.01:
		- Changed constant name to kSystemProfilerShellPath from kSystemProfiler to be more descriptive.
		- Wrapped the Section code in an #if.
		
		1.0:
		- Initial release.
	#tag EndNote

	#tag Note, Name = Usage
		
		This class is in ongoing development and is meant to get easy access to the Mac 
		System Profile.
		
		The properties prefixed with "HW_" and "SW_" are shared and will always be
		up-to-date. You do not need to instantiate for these:
		
		  dim sn as string = MacSystemProfiler.HW_SerialNumber
		
		If you need a particular section (DataType), you can create a new
		instance like this:
		
		  dim profile as new MacSystemProfiler( [ dataType1, dataType2, dataType3, ... ] )
		
		The acceptable values for dataType can be found at:
		
		  MacSystemProfiler.AllDataTypes
		
		CAUTION: Creating a MacSystemProfiler without any parameter for dataType can take a long
		time. You're better off specifying the type or types you actually need.
		
		If you need more information, you can specify a detail level:
		
		  dim profile as new MacSystemProfiler( MacSystemProfiler.DetailLevel.Full [, dataType1, ...] )
		
		or less:
		
		  dim profile as new MacSystemProfiler( MacSystemProfiler.DetailLevel.Mini [, dataType1, ...] )
		
		Once you have an instance, you can pull a particular value out of it like this:
		
		  dim s as string = profile.Value( key )
		
		This will return the first matching key it finds among all the sections, or nill if it can't find a key.
		The keys are based on the XML version of the report so use this in Terminal to figure out
		where your data appears and under what key:
		
		  system_profiler -xml dataType
		
		If you created the profile with multiple data types, you can narrow the search by specifying the dataType:
		
		  dim s as string = profile.Value( key, dataType )
		
		If a key repeats, e.g., "interface" in the "SPNetworkDataType" section, you can also specify name of that
		item within that section. For example:
		
		  dim s as string = profile.Value( "interface", "Network", "Ethernet 1" ) // "Network" here is not a typo. See below.
		
		If you need some other identifier than name, you can supply an identifier key:
		
		  dim s as string = profile.Value( "ip_assigned", "", "en0", "interface" ) // Note that the dataType does not have to be provided when there is only one.
		
		If you need better control of the data you retrieve, you can get the MacPLIstBrowser behind it
		and its tools. (See below.)
		
		You can get the entire profile as a MacPLIstBrowser with the Profile property, or look up an individual 
		section by dataType or index with Section. You can get the items (where the actual data lives) behind 
		section using the Items (for an array) or Item methods.
		
		Data types always take the form "SP...DataType", e.g., "SPHardwareDataType" and "SPSoftwareDataType". As a
		convenience, you only need to specify the part between "SP" and "DataType" and MacSystemProfiler will
		fill in the rest for you, e.g., "Hardware" will automagically become "SPHardwareDataType".
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return join( zDataTypes, " " )
			  
			End Get
		#tag EndGetter
		DataTypesAsString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "boot_rom_version" )
			  
			End Get
		#tag EndGetter
		Shared HW_BootROMVersion As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "bus_speed" )
			  
			End Get
		#tag EndGetter
		Shared HW_BusSpeed As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "cpu_type" )
			  
			End Get
		#tag EndGetter
		Shared HW_CPUType As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "l2_cache_share" )
			  
			End Get
		#tag EndGetter
		Shared HW_L2CachePerProcessor As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static r as double
			  
			  if r = 0. then
			    
			    #if TargetMacOS
			      
			      try
			        dim s as string = HW_L2CachePerProcessor
			        r = pMemoryStringAsDouble( s )
			        
			      catch
			        r = 0.
			        zInitedShared  = false
			        ConstructorShared() // Try is again
			        
			      end try
			      
			    #endif
			    
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		Shared HW_L2CachePerProcessorAsBytes As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "machine_name" )
			  
			End Get
		#tag EndGetter
		Shared HW_MachineName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "physical_memory" )
			  
			End Get
		#tag EndGetter
		Shared HW_Memory As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static r as double
			  
			  if r = 0. then
			    
			    #if TargetMacOS
			      
			      try
			        dim s as string = HW_Memory
			        r = pMemoryStringAsDouble( s )
			        
			      catch
			        r = 0.
			        zInitedShared  = false
			        ConstructorShared() // Try is again
			        
			      end try
			      
			    #endif
			    
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		Shared HW_MemoryAsBytes As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "machine_model" )
			  
			End Get
		#tag EndGetter
		Shared HW_ModelIdentifier As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "number_processors" )
			  
			End Get
		#tag EndGetter
		Shared HW_NumberOfCores As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "packages" )
			  
			End Get
		#tag EndGetter
		Shared HW_NumberOfProcessors As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "current_processor_speed" )
			  
			End Get
		#tag EndGetter
		Shared HW_ProcessorSpeed As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "serial_number" )
			  
			End Get
		#tag EndGetter
		Shared HW_SerialNumber As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "SMC_version_system" )
			  
			End Get
		#tag EndGetter
		Shared HW_SMCVersion As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pGetHardwareValue( "platform_UUID" )
			  
			End Get
		#tag EndGetter
		Shared HW_UUID As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Shared zAllDataTypes() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zDataTypes() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zDetailLevelString As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared zHardwareInfo As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared zInitedShared As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zProfile As MacPListBrowser
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zSections As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared zSystemSoftwareBuild As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared zSystemSoftwareVersion As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zTextProfile As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zXMLProfile As String
	#tag EndProperty


	#tag Constant, Name = DataTypeApplications, Type = String, Dynamic = False, Default = \"SPApplicationsDataType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DataTypeHardware, Type = String, Dynamic = False, Default = \"SPHardwareDataType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DataTypeMemory, Type = String, Dynamic = False, Default = \"SPMemoryDataType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DataTypeNetwork, Type = String, Dynamic = False, Default = \"SPNetworkDataType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DataTypeSoftware, Type = String, Dynamic = False, Default = \"SPSoftwareDataType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSystemProfilerShellPath, Type = String, Dynamic = False, Default = \"/usr/sbin/system_profiler", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"1.02", Scope = Public
	#tag EndConstant


	#tag Enum, Name = DetailLevel, Type = Integer, Flags = &h0
		Mini
		  Basic
		Full
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="DataTypesAsString"
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

#tag Module
Protected Module MacDiskUtil
	#tag Method, Flags = &h1
		Protected Function Device(identifier As String) As MacDeviceItem
		  dim dict as Dictionary = pGetDiskUtilInfo( identifier )
		  dim r as MacDeviceItem = MacDeviceItem.CreateFromDictionary( dict )
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Devices() As MacDeviceItem()
		  dim r() as MacDeviceItem
		  
		  dim info as Dictionary = pGetDiskUtilList( )
		  if info is nil then return r
		  
		  dim disksArr() as Variant = info.Lookup( "WholeDisks", nil )
		  if disksArr <> nil then
		    for i as integer = 0 to disksArr.Ubound
		      dim thisDisk as string = disksArr( i )
		      r.Append Device( thisDisk )
		    next
		  end if
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Mount(item As MacDeviceItem, force As Boolean = false) As Boolean
		  dim cmd as string
		  if item IsA MacPartitionItem then
		    cmd = "mount "
		  else
		    cmd = "mountDisk "
		  end if
		  if force then
		    cmd = cmd + "force "
		  end if
		  cmd = kDiskUtilCmd + cmd + item.Identifier
		  
		  dim r as shell = pExecuteShellCommand( cmd )
		  return r.ErrorCode = 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Partition(identifier As String) As MacPartitionItem
		  return MacPartitionItem( Device( identifier ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Personalities() As MacFormatPersonality()
		  dim r() as MacFormatPersonality
		  
		  #if TargetMacOS
		    
		    dim sh as shell = pExecuteShellCommand( kDiskUtilCmd + "listFileSystems -plist" )
		    dim s as string
		    if sh <> nil then
		      s = sh.Result
		      dim plist as CoreFoundation.CFPropertyList = CFType.CreateFromPListString( s, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		      if plist <> nil then
		        dim arr() as Variant = plist.VariantValue
		        for each d As Dictionary in arr
		          dim p as MacFormatPersonality = MacFormatPersonality.CreateFromDictionary( d )
		          r.Append p
		        next
		      end if
		      
		    end if
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pExecuteShellCommand(cmd As String) As Shell
		  dim sh as new shell
		  sh.Execute cmd
		  return sh
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pGetDiskUtilInfo(device As String = "") As Dictionary
		  #if TargetMacOS
		    
		    dim cmd as string = kDiskUtilCmd + "info -plist " + device
		    dim r as shell = pExecuteShellCommand( cmd )
		    dim plist as CoreFoundation.CFPropertyList = CFTYpe.CreateFromPListString( r.Result, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		    if plist <> nil then
		      return plist.VariantValue
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused device
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pGetDiskUtilList(deviceIdentifier As String = "") As Dictionary
		  #if TargetMacOS
		    
		    dim cmd as string = kDiskUtilCmd + "list -plist " + deviceIdentifier
		    dim r as shell = pExecuteShellCommand( cmd )
		    dim plist as CoreFoundation.CFPropertyList = CFType.CreateFromPListString( r.Result, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		    if plist <> nil then
		      return plist.VariantValue
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused deviceIdentifier
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Attributes( Hidden ) Protected Sub SelfTest()
		  dim devicesArr() as MacDeviceItem = Devices
		  dim partitionArr() as MacPartitionItem
		  for each d as MacDiskUtil.MacDeviceItem in devicesArr
		    partitionArr = d.Partitions
		    partitionArr = partitionArr // A place to break
		    
		    dim id as string = d
		    #pragma unused id
		    dim b as boolean = d.Mounted
		    #pragma unused b
		    dim status as MacDiskUtil.MacDeviceItem.MountType = d.MountStatus
		    #pragma unused status
		    
		    dim f as UInt64 = d.FreeSpace
		    
		    for each p as MacDiskUtil.MacPartitionItem in partitionArr
		      f = p.FreeSpace
		      
		      f = f // A place to break
		    next
		  next d
		  
		  dim arr() as MacDiskUtil.MacFormatPersonality = Personalities
		  #pragma unused arr
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		
		This module is meant to make access to the diskutil CLI more convenient. It is a work in
		progress and, while I will try to minimize them, subject to sudden changes that may break 
		existing code.
	#tag EndNote

	#tag Note, Name = Legal
		This module was created by Kem Tekinay, MacTechnologies Consulting (ktekinay@mactechnologies.com).
		It is copyright ©2014, all rights reserved.
		
		You may use this class AS IS at your own risk for any purpose. The author does not warrant its use
		for any particular purpose and disavows any responsibility for bad design, poor execution,
		or any other faults.
		
		The author does not actively support this module, although comments and recommendations
		are welcome.
		
		You may modify code in this class as long as those modifications are clearly indicated
		via comments in the source code.
		
		You may distribute this class, modified or unmodified, as long as any modifications
		are clearly indicated, as noted above, and this copyright notice is not disturbed or removed.
		
		This class is distributed as part of, and is dependent on, the MacOSLib project.
	#tag EndNote

	#tag Note, Name = Release Notes
		
		1.0:
		- Initial release.
	#tag EndNote


	#tag Constant, Name = kDiskUtilCmd, Type = String, Dynamic = False, Default = \"/usr/sbin/diskutil ", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"1.0", Scope = Protected
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
End Module
#tag EndModule

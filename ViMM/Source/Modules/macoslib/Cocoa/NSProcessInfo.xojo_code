#tag Class
Class NSProcessInfo
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString("NSProcessInfo")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableAutomaticTermination(reason as String)
		  
		  #if targetMacOS
		    declare sub disableAutomaticTermination lib CocoaLib selector "disableAutomaticTermination:" (obj_id as Ptr, reason as CFStringRef)
		    
		    disableAutomaticTermination self, reason
		    
		  #else
		    #pragma unused reason
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableSuddenTermination()
		  
		  #if targetMacOS
		    declare sub disableSuddenTermination lib CocoaLib selector "disableSuddenTermination" (obj_id as Ptr)
		    
		    disableSuddenTermination self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableAutomaticTermination(reason as String)
		  
		  #if targetMacOS
		    declare sub enableAutomaticTermination lib CocoaLib selector "enableAutomaticTermination:" (obj_id as Ptr, reason as CFStringRef)
		    
		    enableAutomaticTermination self, reason
		    
		  #else
		    #pragma unused reason
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableSuddenTermination()
		  
		  #if targetMacOS
		    declare sub enableSuddenTermination lib CocoaLib selector "enableSuddenTermination" (obj_id as Ptr)
		    
		    enableSuddenTermination self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ProcessInfo() As NSProcessInfo
		  #if targetMacOS
		    declare function defaultCenter lib CocoaLib selector "processInfo" (class_id as Ptr) as Ptr
		    
		    static c as new NSProcessInfo(defaultCenter(NSClassFromString(NSClassName)))
		    return c
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function activeProcessorCount lib CocoaLib selector "activeProcessorCount" (obj_id as Ptr) as UInt32
			    
			    return activeProcessorCount(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ActiveProcessorCount As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function arguments lib CocoaLib selector "arguments" (obj_id as Ptr) as Ptr
			    
			    dim ns_arrayRef as Ptr = arguments(self)
			    if ns_arrayRef <> nil then
			      return new NSArray(ns_arrayRef)
			    else
			      return Nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Arguments As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function automaticTerminationSupportEnabled lib CocoaLib selector "automaticTerminationSupportEnabled" (obj_id as Ptr) as Boolean
			    
			    return automaticTerminationSupportEnabled(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setAutomaticTerminationSupportEnabled lib CocoaLib selector "setAutomaticTerminationSupportEnabled:" (obj_id as Ptr, flag as Boolean)
			    
			    setAutomaticTerminationSupportEnabled self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AutomaticTerminationSupportEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function environment lib CocoaLib selector "environment" (obj_id as Ptr) as Ptr
			    
			    dim ns_dictRef as Ptr = environment(self)
			    if ns_dictRef <> nil then
			      return new NSDictionary(ns_dictRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Environment As NSDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function globallyUniqueString lib CocoaLib selector "globallyUniqueString" (obj_id as Ptr) as CFStringRef
			    
			    return globallyUniqueString(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		GloballyUniqueString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function hostName lib CocoaLib selector "hostName" (obj_id as Ptr) as CFStringRef
			    
			    return hostName(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		HostName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function operatingSystem lib CocoaLib selector "operatingSystem" (obj_id as Ptr) as UInt32
			    
			    return operatingSystem(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		OperatingSystem As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function operatingSystemName lib CocoaLib selector "operatingSystemName" (obj_id as Ptr) as CFStringRef
			    
			    return operatingSystemName(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		OperatingSystemName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Available in OS X v10.10 and later.
			  //
			  // Returns 0, 0, 0 if called on systems before 10.10.
			  //
			  // Hint: If you need this to work on pre-10.10 systems, use Carbon.SystemVersionAsInt
			  
			  #if TargetMacOS
			    declare function operatingSystemVersion lib CocoaLib selector "operatingSystemVersion" (obj_id as Ptr) as OSVersion
			    
			    if me.RespondsToSelector("operatingSystemVersion") then
			      'dim mb as Ptr = operatingSystemVersion(self)
			      dim result as OSVersion = operatingSystemVersion(self)
			      'result.major = mb.Int32Value(0)
			      'result.minor = mb.Int32Value(4)
			      'result.patch = mb.Int32Value(8)
			      return result
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		OperatingSystemVersion As OSVersion
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function operatingSystemVersionString lib CocoaLib selector "operatingSystemVersionString" (obj_id as Ptr) as CFStringRef
			    
			    return operatingSystemVersionString(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		OperatingSystemVersionString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function physicalMemory lib CocoaLib selector "physicalMemory" (obj_id as Ptr) as UInt64
			    
			    return physicalMemory(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		PhysicalMemory As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function processIdentifier lib CocoaLib selector "processIdentifier" (obj_id as Ptr) as Integer
			    
			    return processIdentifier(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ProcessIdentifier As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function processName lib CocoaLib selector "processName" (obj_id as Ptr) as CFStringRef
			    
			    return processName(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetMacOS
			    declare sub setProcessName lib CocoaLib selector "setProcessName" (obj_id as Ptr, name as CFStringRef)
			    
			    setProcessName self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ProcessName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function processorCount lib CocoaLib selector "processorCount" (obj_id as Ptr) as UInt32
			    
			    return processorCount(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ProcessorCount As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function systemUptime lib CocoaLib selector "systemUptime" (obj_id as Ptr) as Double
			    
			    return systemUptime(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		SystemUptime As Double
	#tag EndComputedProperty


	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"NSProcessInfo", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSHPUXOperatingSystem, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMACHOperatingSystem, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSOSF1OperatingSystem, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSolarisOperatingSystem, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSunOSOperatingSystem, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWindows95OperatingSystem, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWindowsNTOperatingSystem, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag Structure, Name = OSVersion, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		major as Integer
		  minor as Integer
		patch as Integer
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActiveProcessorCount"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticTerminationSupportEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GloballyUniqueString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HostName"
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
			Name="OperatingSystem"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OperatingSystemName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OperatingSystemVersionString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PhysicalMemory"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProcessIdentifier"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProcessName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProcessorCount"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SystemUptime"
			Group="Behavior"
			Type="Double"
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

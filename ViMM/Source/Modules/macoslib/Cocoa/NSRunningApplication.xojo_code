#tag Class
Class NSRunningApplication
Inherits NSObject
	#tag Method, Flags = &h0
		Function Activate() As Boolean
		  #if targetMacOS
		    declare function activateWithOptions lib CocoaLib selector "activateWithOptions:" (obj_id as Ptr, options as Integer) as Boolean
		    
		    return activateWithOptions(self, 0)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSRunningApplication")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CurrentApplication() As NSRunningApplication
		  #if targetMacOS
		    declare function currentApplication lib CocoaLib selector "currentApplication" (class_id as Ptr) as Ptr
		    
		    dim p as Ptr = currentApplication(Cocoa.NSClassFromString("NSRunningApplication"))
		    if p <> nil then
		      return new NSRunningApplication(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ForceTerminate() As Boolean
		  
		  #if targetMacOS
		    declare function forceTerminate lib CocoaLib selector "forceTerminate" (obj_id as Ptr) as Boolean
		    
		    return forceTerminate(self)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Hide()
		  
		  #if targetMacOS
		    declare sub hide lib CocoaLib selector "hide" (obj_id as Ptr)
		    
		    hide(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Dictionary
		  //# Convert the NSRunningApplication to a RS Dictionary
		  
		  dim dict as new Dictionary
		  
		  dict.Value( "Localized Name" ) = me.LocalizedName
		  dict.Value( "NSRunningApplication object" ) = me
		  'dict.Value( "BundleIdentifier" ) = me.BundleIdentifier
		  
		  return  dict
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RunningApplication(pid as Integer) As NSRunningApplication
		  
		  #if targetMacOS
		    declare function runningApplicationWithProcessIdentifier lib CocoaLib selector "runningApplicationWithProcessIdentifier:" _
		    (class_id as Ptr, pid as Integer) as Ptr
		    
		    dim p as Ptr = runningApplicationWithProcessIdentifier(ClassRef, pid)
		    if p <> nil then
		      return new NSRunningApplication(p)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused pid
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RunningApplication(bundleIdentifier as String) As NSRunningApplication
		  
		  #if targetMacOS
		    declare function runningApplicationsWithBundleIdentifier lib CocoaLib selector "runningApplicationsWithBundleIdentifier:" _
		    (class_id as Ptr, bundleIdentifier as CFStringRef) as Ptr
		    
		    dim p as Ptr = runningApplicationsWithBundleIdentifier(ClassRef, bundleIdentifier)
		    if p <> nil then
		      return new NSRunningApplication(p)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused bundleIdentifier
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Terminate() As Boolean
		  
		  #if targetMacOS
		    declare function terminate lib CocoaLib selector "terminate" (obj_id as Ptr) as Boolean
		    
		    return terminate(self)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub TerminateAutomaticallyTerminableApplications()
		  
		  #if targetMacOS
		    declare sub terminateAutomaticallyTerminableApplications lib CocoaLib selector "terminateAutomaticallyTerminableApplications" (class_id as Ptr)
		    
		    terminateAutomaticallyTerminableApplications(ClassRef)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unhide()
		  
		  #if targetMacOS
		    declare sub unhide lib CocoaLib selector "unhide" (obj_id as Ptr)
		    
		    unhide(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //@New
			  #if targetMacOS
			    declare function activationPolicy lib CocoaLib selector "activationPolicy" (obj_id as Ptr) as NSApplicationActivationPolicy
			    
			    return activationPolicy(self)
			    
			  #endif
			End Get
		#tag EndGetter
		ActivationPolicy As NSApplicationActivationPolicy
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isActive lib CocoaLib selector "isActive" (obj_id as Ptr) as Boolean
			    
			    return isActive(self)
			    
			  #endif
			End Get
		#tag EndGetter
		Active As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function getBundleIdentifier lib CocoaLib selector "bundleIdentifier" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue( getBundleIdentifier(self) )
			  #endif
			End Get
		#tag EndGetter
		BundleIdentifier As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function bundleURL lib CocoaLib selector "bundleURL" (obj_id as Ptr) as Ptr
			    
			    return New NSURL( bundleURL(self) )
			  #endif
			End Get
		#tag EndGetter
		BundleURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function executableArchitecture lib CocoaLib selector "executableArchitecture" (obj_id as Ptr) as NSBundle.NSBundleExecutableArchitecture
			    
			    return executableArchitecture(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ExecutableArchitecture As NSBundle.NSBundleExecutableArchitecture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function executableURL lib CocoaLib selector "executableURL" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr = executableURL(self)
			    if p <> nil then
			      return new NSURL(p)
			    else
			      return nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ExecutableURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isFinishedLaunching lib CocoaLib selector "isFinishedLaunching" (obj_id as Ptr) as Boolean
			    
			    return isFinishedLaunching(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		FinishedLaunching As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isHidden lib CocoaLib selector "isHidden" (obj_id as Ptr) as Boolean
			    
			    return isHidden(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Hidden As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function icon lib CocoaLib selector "icon" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr = icon(self)
			    if p <> nil then
			      return new NSImage(p)
			    else
			      return nil
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		Icon As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function launchDate lib CocoaLib selector "launchDate" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr = launchDate(self)
			    if p <> nil then
			      return new NSDate(p)
			    else
			      return nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		LaunchDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function localizedName lib CocoaLib selector "localizedName" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(localizedName(self))
			  #endif
			End Get
		#tag EndGetter
		LocalizedName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function ownsMenuBar lib CocoaLib selector "ownsMenuBar" (obj_id as Ptr) as Boolean
			    
			    return ownsMenuBar(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		OwnsMenuBar As Boolean
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
			    declare function isTerminated lib CocoaLib selector "isTerminated" (obj_id as Ptr) as Boolean
			    
			    return isTerminated(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Terminated As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = NSApplicationActivateAllWindows, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSApplicationActivateIgnoringOtherApps, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSApplicationActivationPolicy, Flags = &h0
		NSApplicationActivationPolicyRegular
		  NSApplicationActivationPolicyAccessory
		NSApplicationActivationPolicyProhibited
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActivationPolicy"
			Group="Behavior"
			Type="NSApplicationActivationPolicy"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSApplicationActivationPolicyRegular"
				"1 - NSApplicationActivationPolicyAccessory"
				"2 - NSApplicationActivationPolicyProhibited"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Active"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BundleIdentifier"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FinishedLaunching"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hidden"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LocalizedName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OwnsMenuBar"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProcessIdentifier"
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
			Name="Terminated"
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
	#tag EndViewBehavior
End Class
#tag EndClass

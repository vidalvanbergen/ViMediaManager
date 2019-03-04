#tag Class
Protected Class ICDeviceBrowser
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    RequireFramework  ICLib
		    
		    self.Constructor(Initialize(Allocate( "ICDeviceBrowser")), hasOwnership)
		    self.SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create() As ICDeviceBrowser
		  #if TargetMacOS
		    dim result as ICDeviceBrowser
		    RequireFramework  IKLib
		    RequireFramework  ICLib
		    
		    dim p as Ptr = Initialize( Allocate( "ICDeviceBrowser" ))
		    if p <> nil then
		      result = new ICDeviceBrowser( p, hasOwnership)
		      result.SetDelegate
		    end if
		    
		    return  result
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
		Private Shared Sub delegate_DeviceDidChangeName(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr)
		  'deviceBrowser:(ICDeviceBrowser*)browser deviceDidChangeName:(ICDevice*)device
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused device
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidChangeSharingState(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr)
		  'deviceBrowser:(ICDeviceBrowser*)browser deviceDidChangeSharingState:(ICDevice*)device
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused device
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidAddDevice(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr, moreComing as Boolean)
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICDeviceBrowser = ICDeviceBrowser( w.Value )
		    if obj <> nil then
		      obj.Handle_DidAddDevice   device, moreComing
		      
		    else
		      break
		    end if
		  else
		    break
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidEnumerateLocalDevices(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICDeviceBrowser = ICDeviceBrowser( w.Value )
		    if obj <> nil then
		      obj.Handle_DidEnumerateLocalDevices
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveDevice(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr, moreGoing as boolean)
		  'deviceBrowser:(ICDeviceBrowser*)browser didRemoveDevice:(ICDevice*)device moreGoing:(BOOL)moreGoing
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused device
		  #pragma unused moreGoing
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_RequestsSelectDevice(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr)
		  'deviceBrowser:(ICDeviceBrowser*)browser requestsSelectDevice:(ICDevice*)device;
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused device
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As NSSearchField
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return NSSearchField(w.Value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidAddDevice(device as Ptr, moreComing as Boolean)
		  RaiseEvent DeviceAdded( ImageKit_ImageCapture.ICDeviceFromPtr( device ), moreComing )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidEnumerateLocalDevices()
		  RaiseEvent FinishedEnumeratingLocalDevices
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "deviceBrowser:didAddDevice:moreComing:" : CType( AddressOf  delegate_DidAddDevice, Ptr ) : "v@:@@B"
		    methodList.Append  "deviceBrowser:didRemoveDevice:moreGoing:" : CType( AddressOf  delegate_DidRemoveDevice, Ptr ) : "v@:@@B"
		    methodList.Append  "deviceBrowser:deviceDidChangeName:" : CType( AddressOf  delegate_DeviceDidChangeName, Ptr ) : "v@:@@"
		    methodList.Append  "deviceBrowser:deviceDidChangeSharingState:" : CType( AddressOf delegate_DeviceDidChangeSharingState, Ptr ) : "v@:@@"
		    methodList.Append  "deviceBrowser:requestsSelectDevice:" : CType( AddressOf delegate_RequestsSelectDevice, Ptr ) : "v@:@@"
		    methodList.Append  "deviceBrowserDidEnumerateLocalDevices:" : CType( AddressOf delegate_DidEnumerateLocalDevices, Ptr ) : "v@:@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList, "ICDeviceBrowserDelegate")
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
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
		    setDelegate   self.id, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  #if TargetMacOS
		    declare sub start lib ICLib selector "start" (id as Ptr)
		    
		    start(self)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  #if TargetMacOS
		    declare sub stop lib ICLib selector "stop" (id as Ptr)
		    
		    stop(self)
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DeviceAdded(device as ICDevice, moreComing as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FinishedEnumeratingLocalDevices()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function devices lib ICLib selector "devices" (id as Ptr) as Ptr
			    
			    return  new NSArray( devices( me.id ), false )
			  #endif
			End Get
		#tag EndGetter
		Devices As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function browsedDeviceTypeMask lib ICLib selector "browsedDeviceTypeMask" (id as Ptr) as integer
			    
			    return  browsedDeviceTypeMask( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setBrowsedDeviceTypeMask lib ICLib selector "setBrowsedDeviceTypeMask:" (id as Ptr, value as integer)
			    
			    setBrowsedDeviceTypeMask( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		DeviceTypes As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function isBrowsing lib ICLib selector "isBrowsing" (id as Ptr) as Boolean
			    
			    return  isBrowsing( me.id )
			  #endif
			End Get
		#tag EndGetter
		IsBrowsing As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = ClassName, Type = String, Dynamic = False, Default = \"ICDeviceBrowser", Scope = Private
	#tag EndConstant

	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibICDeviceBrowserDelegate", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DeviceTypes"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsBrowsing"
			Group="Behavior"
			Type="Boolean"
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

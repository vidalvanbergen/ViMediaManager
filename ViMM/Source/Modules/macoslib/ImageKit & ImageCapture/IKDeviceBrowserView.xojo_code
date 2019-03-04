#tag Class
Protected Class IKDeviceBrowserView
Inherits Canvas
	#tag Event
		Sub Close()
		  #if TargetMacOS
		    RaiseEvent   Close
		    
		    'declare function release lib CocoaLib selector "release" (id as Ptr) as Ptr
		    '
		    'call  release( me.DeviceBrowser.id )
		    me.Release
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  RequireFramework   IKLib
		  RequireFramework   ICLib
		  
		  #if targetMacOS
		    dim frame as Cocoa.NSRect
		    frame.x = 0.0
		    frame.y = 0.0
		    frame.w = self.Width
		    frame.h = self.Height
		    
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as Cocoa.NSRect) as Ptr
		    
		    self.m_id = initWithFrame( NSObject.Allocate( self.NSClassName ), frame )
		    if self.id = nil then
		      raise new macoslibException( "Unable to instantiate class " + NSClassName )
		    end if
		    
		    soft declare sub addSubview lib CocoaLib selector "addSubview:" (id as Ptr, aView as Ptr)
		    soft declare sub setAutoresizingMask lib CocoaLib selector "setAutoresizingMask:" (id as Ptr, mask as Integer)
		    soft declare sub setFrame lib CocoaLib selector "setFrame:" (id as Ptr, frameRect as Cocoa.NSRect)
		    
		    const NSViewWidthSizable = 2
		    const NSViewHeightSizable = 16
		    const NSViewMinYMargin = 8
		    
		    addSubview Ptr(self.Handle), self.id
		    
		    //here we lock the control to the canvas superview so that resizing is handled by the canvas.
		    setAutoresizingMask self.id, NSViewWidthSizable or NSViewHeightSizable
		    
		  #endif
		  
		  SetDelegate
		  
		  #if NOT DisableUndocumentedFeatures
		    SetHidesExtrasContainer   true
		  #endif
		  
		  dim icdb as ICDeviceBrowser
		  
		  icdb = me.DeviceBrowser
		  icdb.start
		  
		  RaiseEvent   Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DelegateError(id as Ptr, sel as Ptr, browser as Ptr, error as Ptr)
		  #pragma unused sel
		  #pragma unused browser
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as IKDeviceBrowserView = IKDeviceBrowserView( w.Value )
		    if obj <> nil then
		      obj.Handle_Error   error
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DelegateSelectionChanged(id as Ptr, sel as Ptr, browser as Ptr, newSelection as Ptr)
		  #pragma unused sel
		  #pragma unused browser
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as IKDeviceBrowserView = IKDeviceBrowserView( w.Value )
		    if obj <> nil then
		      obj.Handle_SelectionChanged   newSelection
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeviceBrowser() As ICDeviceBrowser
		  #if TargetMacOS
		    declare function deviceBrowser lib IKLib selector "deviceBrowser" (id as Ptr) as Ptr
		    
		    return   new ICDeviceBrowser( deviceBrowser( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As IKDeviceBrowserView
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return IKDeviceBrowserView( w.Value )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_Error(err as Ptr)
		  #if TargetMacOS
		    dim e as NSException = new NSException( err )
		    
		    RaiseEvent  Error( e.Message )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_SelectionChanged(newSelection as Ptr)
		  
		  #if TargetMacOS
		    dim obj as ICDevice
		    
		    if Cocoa.InheritsFromClass( newSelection, "ICScannerDevice" ) then
		      obj = new ICScannerDevice( newSelection, false )
		    elseif Cocoa.InheritsFromClass( newSelection, "ICCameraDevice" ) then
		      obj = new ICCameraDevice( newSelection, false )
		    end if
		    
		    RaiseEvent   SelectionChanged( obj )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invalidate()
		  
		  #if TargetMacOS
		    declare sub setNeedsDisplay lib CocoaLib selector "setNeedsDisplay:" (id as Ptr, flag as boolean)
		    
		    setNeedsDisplay( me.id, true )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSView") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "deviceBrowserView:didEncounterError:" : CType( AddressOf DelegateError, Ptr ) : "v@:@@"
		    methodList.Append  "deviceBrowserView:selectionDidChange:" : CType( AddressOf DelegateSelectionChanged, Ptr ) : "v@:@@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList, "IKDeviceBrowserViewDelegate")
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  #if TargetMacOS
		    declare function release lib CocoaLib selector "release" (id as Ptr) as Ptr
		    
		    call  release( me.id )
		  #endif
		End Sub
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
		    setDelegate self.id, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHidesAccessoryView(YesNo as Boolean)
		  //# Undocumented feature whose name suggests that it should show/hide the "accessory view", i.e. the extra
		  //#   settings for a given device like a camera, but has apparently no effect.
		  
		  //@ Use the shared method ShowBrowserAccessoryView instead.
		  
		  #if TargetMacOS AND NOT DisableUndocumentedFeatures
		    declare sub setHidesAccessoryView lib IKLib selector "setHidesAccessoryView:" (id as Ptr, value as Boolean)
		    declare function subviews lib CocoaLib selector "subviews" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( subviews( me.id ))
		    
		    setHidesAccessoryView( nsa.Value( 0 ), YesNo )
		    me.Invalidate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHidesExtrasContainer(YesNo as Boolean)
		  //# Show/hide the control bar at the bottom of the View
		  
		  //@ The control bar may have several buttons which are independently showed/hidden with:
		  //@   • SetHidesNetworkButton
		  //@   • SetHidesResizeView
		  
		  #if TargetMacOS AND NOT DisableUndocumentedFeatures
		    declare sub setHidesExtrasContainer lib IKLib selector "setHidesExtrasContainer:" (id as Ptr, value as Boolean)
		    declare function subviews lib CocoaLib selector "subviews" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( subviews( me.id ))
		    
		    setHidesExtrasContainer( nsa.Value( 0 ), YesNo )
		    SetHidesResizeView   true
		    SetHidesNetworkButton  true
		    SetHidesAccessoryView  false
		    me.Invalidate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHidesNetworkButton(YesNo as Boolean)
		  //# Undocumented feature which adds/removes a network icon to the control bar to show/hide network devices
		  
		  #if TargetMacOS AND NOT DisableUndocumentedFeatures
		    declare sub setHidesNetworkButton lib IKLib selector "setHidesNetworkButton:" (id as Ptr, value as Boolean)
		    declare function subviews lib CocoaLib selector "subviews" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( subviews( me.id ))
		    
		    setHidesNetworkButton( nsa.Value( 0 ), YesNo )
		    me.Invalidate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHidesResizeView(YesNo as Boolean)
		  #if TargetMacOS AND NOT DisableUndocumentedFeatures
		    declare sub setHidesResizeView lib IKLib selector "setHidesResizeView:" (id as Ptr, value as Boolean)
		    declare function subviews lib CocoaLib selector "subviews" (id as Ptr) as Ptr
		    
		    'dim nsa as NSArray = new NSArray( subviews( me.id ))
		    
		    setHidesResizeView( me.id, YesNo )
		    me.Invalidate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub ShowBrowserAccessoryView(YesNo as Boolean)
		  //# Set the preference to show/hide the browser accessory view.
		  
		  //@ This shared method must be invoke BEFORE you instantiate an IKDeviceBrowserView as it modifies the
		  //@   preferences file.
		  
		  #if TargetMacOS
		    dim nsu as NSUserDefaults = NSUserDefaults.StandardUserDefaults
		    
		    nsu.BooleanValue( "com.apple.imagekit.accessoryViewOpen" ) = YesNo
		    nsu.Synchronize
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(ErrorMessage as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionChanged(newSelection as ICDevice)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function displaysLocalCameras lib IKLib selector "displaysLocalCameras" (id as Ptr) as Boolean
			    
			    return  displaysLocalCameras( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setDisplaysLocalCameras lib IKLib selector "setDisplaysLocalCameras:" (id as Ptr, value as boolean)
			    
			    setDisplaysLocalCameras( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		displaysLocalCameras As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function displaysLocalScanners lib IKLib selector "displaysLocalScanners" (id as Ptr) as Boolean
			    
			    return  displaysLocalScanners( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setDisplaysLocalScanners lib IKLib selector "setDisplaysLocalScanners:" (id as Ptr, value as boolean)
			    
			    setDisplaysLocalScanners( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		displaysLocalScanners As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function displaysNetworkCameras lib IKLib selector "displaysNetworkCameras" (id as Ptr) as Boolean
			    
			    return  displaysNetworkCameras( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setDisplaysNetworkCameras lib IKLib selector "setDisplaysNetworkCameras:" (id as Ptr, value as boolean)
			    
			    setDisplaysNetworkCameras( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		displaysNetworkCameras As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function displaysNetworkScanners lib IKLib selector "displaysNetworkScanners" (id as Ptr) as Boolean
			    
			    return  displaysNetworkScanners( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setDisplaysNetworkScanners lib IKLib selector "setDisplaysNetworkScanners:" (id as Ptr, value as boolean)
			    
			    setDisplaysNetworkScanners( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		displaysNetworkScanners As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  m_id
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function mode lib IKLib selector "mode" (id as Ptr) as integer
			    
			    return  mode( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setMode lib IKLib selector "setMode:" (id as Ptr, value as integer)
			    
			    setMode( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		mode As integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private m_id As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    dim p as Ptr = me.SelectedDevicePtr
			    
			    return  ImageKit_ImageCapture.ICDeviceFromPtr( p )
			  #endif
			End Get
		#tag EndGetter
		SelectedDevice As ICDevice
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function selectedDevice lib IKLib selector "selectedDevice" (id as Ptr) as Ptr
			    
			    return   selectedDevice( me.id )
			  #endif
			End Get
		#tag EndGetter
		SelectedDevicePtr As Ptr
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibIKDeviceBrowserViewDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = DisableUndocumentedFeatures, Type = Boolean, Dynamic = False, Default = \"false", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IKDeviceBrowserViewDisplayModeIcon, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKDeviceBrowserViewDisplayModeOutline, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKDeviceBrowserViewDisplayModeTable, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"IKDeviceBrowserView", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="displaysLocalCameras"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="displaysLocalScanners"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="displaysNetworkCameras"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="displaysNetworkScanners"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mode"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

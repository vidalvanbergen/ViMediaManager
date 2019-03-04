#tag Class
Protected Class IKCameraDeviceView
Inherits Canvas
	#tag Event
		Sub Close()
		  me.CameraDevice = nil
		  
		  RaiseEvent   Close
		  
		  me.Release
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  RequireFramework   IKLib
		  RequireFramework   ICLib
		  
		  #if targetMacOS
		    AssertOSVersion  100600
		    
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
		  
		  RaiseEvent   Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AttributeKeys() As NSArray
		  
		  #if TargetMacOS
		    dim nsa as NSArray
		    
		    declare function attributeKeys lib CocoaLib selector "attributeKeys" (id as Ptr) as Ptr
		    
		    nsa = new NSArray( attributeKeys( self.id ))
		    
		    return  nsa
		    
		  #endif
		End Function
	#tag EndMethod

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
		Private Shared Sub delegate_DidDownloadFile(id as Ptr, sel as Ptr, sender as Ptr, cameraFile as Ptr, url as Ptr, data as Ptr, error as Ptr)
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused cameraFile
		  
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKCameraDeviceView = IKCameraDeviceView( w.Value )
		      if obj <> nil then
		        obj.Handle_DownloadFinished   url, data, error
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		    
		  #else
		    #pragma unused id
		    #pragma unused url
		    #pragma unused data
		    #pragma unused error
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_Error(id as Ptr, sel as Ptr, sender as Ptr, error as Ptr)
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKCameraDeviceView = IKCameraDeviceView( w.Value )
		      if obj <> nil then
		        obj.Handle_Error   error
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		    
		  #else
		    #pragma unused id
		    #pragma unused error
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_SelectionChanged(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKCameraDeviceView = IKCameraDeviceView( w.Value )
		      if obj <> nil then
		        obj.Handle_SelectionChanged
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		    
		  #else
		    #pragma unused id
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DownloadFinished(url as Ptr, data as Ptr, err as Ptr)
		  #if TargetMacOS
		    if err<>nil then
		      dim e as new NSException( err )
		      RaiseEvent  DownloadError( "", e.Message ) //<<<<<<<<<<<<<<<<<<<<<<<<
		      
		    else
		      if url<>nil then
		        dim nsu as new NSURL( url, false )
		        RaiseEvent   DownloadedFile( nsu.Item, nil )
		      else
		        dim nsd as new NSData( data, false )
		        RaiseEvent   DownloadedFile( nil, nsd )
		      end if
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_Error(err as Ptr)
		  #if TargetMacOS
		    dim e as new NSException( err )
		    
		    RaiseEvent  Error( e.Message )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_SelectionChanged()
		  #if TargetMacOS
		    RaiseEvent  SelectionChanged
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "cameraDeviceView:didDownloadFile:location:fileData:error:" : CType( AddressOf delegate_DidDownloadFile, Ptr ) : "v@:@@@@@"
		    methodList.Append  "cameraDeviceView:didEncounterError:" : CType( AddressOf delegate_Error, Ptr ) : "v@:@@"
		    methodList.Append  "cameraDeviceViewSelectionDidChange:" : CType( AddressOf delegate_SelectionChanged, Ptr ) : "v@:@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList, "IKCameraDeviceViewDelegate")
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

	#tag Method, Flags = &h0
		Function RetainCount() As integer
		  #if TargetMacOS
		    
		    declare function retainCount lib CocoaLib Selector "retainCount" (id as Ptr) as integer
		    
		    return   retainCount( me.id )
		    
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
		    setDelegate self.id, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadedFile(file as FolderItem, fileData as MemoryBlock)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadError(fileName as string, errorMessage as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(errorMessage as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    return  mCameraDevice
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setCameraDevice lib IKLib selector "setCameraDevice:" (id as Ptr, value as Ptr)
			    
			    AssertOSVersion 100600
			    
			    mCameraDevice = value
			    
			    if mCameraDevice=nil then
			      setCameraDevice( me.id, nil )
			    else
			      setCameraDevice( me.id, mCameraDevice )
			    end if
			  #endif
			End Set
		#tag EndSetter
		CameraDevice As ICCameraDevice
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function displaysDownloadsDirectoryControl lib IKLib selector "displaysDownloadsDirectoryControl" (id as Ptr) as Boolean
			    
			    return  displaysDownloadsDirectoryControl( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setDisplaysDownloadsDirectoryControl lib IKLib selector "setDisplaysDownloadsDirectoryControl:" (id as Ptr, value as boolean)
			    
			    setDisplaysDownloadsDirectoryControl( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		displaysDownloadsDirectoryControl As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function hasDisplayModeIcon lib IKLib selector "hasDisplayModeIcon" (id as Ptr) as Boolean
			    
			    return  hasDisplayModeIcon( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setHasDisplayModeIcon lib IKLib selector "setHasDisplayModeIcon:" (id as Ptr, value as boolean)
			    
			    setHasDisplayModeIcon( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		hasDisplayModeIcon As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function hasDisplayModeTable lib IKLib selector "hasDisplayModeTable" (id as Ptr) as Boolean
			    
			    return  hasDisplayModeTable( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setHasDisplayModeTable lib IKLib selector "setHasDisplayModeTable:" (id as Ptr, value as boolean)
			    
			    setHasDisplayModeTable( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		hasDisplayModeTable As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  m_id
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCameraDevice As ICCameraDevice
	#tag EndProperty

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
			    declare function transferMode lib IKLib selector "transferMode" (id as Ptr) as integer
			    
			    return  transferMode( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setTransferMode lib IKLib selector "setTransferMode:" (id as Ptr, value as integer)
			    
			    setTransferMode( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		TransferMode As integer
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibIKCameraDeviceViewDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"IKCameraDeviceView", Scope = Private
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
			Name="displaysDownloadsDirectoryControl"
			Group="Behavior"
			Type="boolean"
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
			Name="hasDisplayModeIcon"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasDisplayModeTable"
			Group="Behavior"
			Type="boolean"
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
			Name="TransferMode"
			Group="Behavior"
			Type="integer"
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

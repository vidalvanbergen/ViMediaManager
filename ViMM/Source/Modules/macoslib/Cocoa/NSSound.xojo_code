#tag Class
Class NSSound
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = NSClassFromString("NSSound")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(audioFile As FolderItem, byReference As Boolean)
		  // Convenience to construct from FolderItem
		  
		  #if TargetMacOS
		    
		    dim url as new NSURL( audioFile )
		    me.Constructor( url, byReference )
		    
		  #else
		    
		    #pragma unused audioFile
		    #pragma unused byReference
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(audioData As NSData)
		  #if TargetMacOS
		    
		    declare function initWithData lib Framework selector "initWithData:" _
		    ( obj_id as Ptr, audioData As Ptr ) As Ptr
		    
		    dim dataRef as Ptr
		    if audioData <> nil then
		      dataRef = audioData.id
		    end if
		    
		    super.Constructor( initWithData( Allocate( "NSSound" ), dataRef ), NSObject.hasOwnership )
		    SetDelegate()
		    
		  #else
		    
		    #pragma unused audioData
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(filePath As NSString, byReference As Boolean)
		  #if TargetMacOS
		    
		    declare function initWithContentsOfFile lib Framework selector "initWithContentsOfFile:byReference:" _
		    ( obj_id as Ptr, filePath As Ptr, byReference As Boolean ) As Ptr
		    
		    dim filePathRef as Ptr
		    if filePath <> nil then
		      filePathRef = filePath.id
		    end if
		    
		    super.Constructor( initWithContentsOfFile( Allocate( "NSSound" ), filePathRef, byReference ), NSObject.hasOwnership )
		    SetDelegate()
		    
		  #else
		    
		    #pragma unused filePath
		    #pragma unused byReference
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(fileURL As NSURL, byReference As Boolean)
		  #if TargetMacOS
		    
		    declare function initWithContentsOfURL lib Framework selector "initWithContentsOfURL:byReference:" _
		    ( obj_id as Ptr, fileURL As Ptr, byReference As Boolean ) As Ptr
		    
		    dim fileURLRef as Ptr
		    if fileURL <> nil then
		      fileURLRef = fileURL.id
		    end if
		    
		    super.Constructor( initWithContentsOfURL( Allocate( "NSSound" ), fileURLRef, byReference ), NSObject.hasOwnership )
		    SetDelegate()
		    
		  #else
		    
		    #pragma unused fileURL
		    #pragma unused byReference
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_DidFinishPlaying(id as Ptr, sel as Ptr, cntl as Ptr, value as Boolean) As Boolean
		  #pragma unused sel
		  #pragma Unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSound = NSSound(w.Value)
		    if obj <> nil then
		      obj.HandleDidFinishPlaying(value)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  if StopOnDestruct then
		    call Stop
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFinishPlaying(finishedPlaying As Boolean)
		  RaiseEvent DidFinishPlaying( finishedPlaying )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append "sound:didFinishPlaying:" : CType( AddressOf delegate_DidFinishPlaying, Ptr ) : "v@:@@"
		    
		    return Cocoa.MakeDelegateClass( className, superclassName, methodList )
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pause() As Boolean
		  #if TargetMacOS
		    
		    declare function PauseIt lib Framework selector "pause" ( obj_id As Ptr ) As Boolean
		    
		    dim r as boolean = PauseIt( self.id )
		    return r
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Play() As Boolean
		  #if TargetMacOS
		    
		    declare function PlayIt lib Framework selector "play" ( obj_id As Ptr ) As Boolean
		    
		    dim r as boolean = PlayIt( self.id )
		    return r
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resume() As Boolean
		  #if TargetMacOS
		    
		    declare function ResumeIt lib Framework selector "resume" ( obj_id As Ptr ) As Boolean
		    
		    dim r as boolean = ResumeIt( self.id )
		    return r
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  
		  #if TargetMacOS then
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SoundNamed(soundName As NSString) As NSSound
		  dim r as NSSound
		  
		  #if TargetMacOS
		    
		    declare function getSoundNamed lib Framework selector "soundNamed:" ( id As Ptr, soundName As Ptr ) As Ptr
		    
		    dim p as Ptr
		    if soundName <> nil then
		      p = getSoundNamed( ClassRef, soundName.id )
		    else
		      p = getSoundNamed( ClassRef, nil )
		    end if
		    
		    if p <> nil then
		      r = new NSSound( p, not NSObject.hasOwnership )
		    end if
		    
		  #else
		    
		    #pragma unused soundName
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Stop() As Boolean
		  #if TargetMacOS
		    
		    declare function StopIt lib Framework selector "stop" ( obj_id As Ptr ) As Boolean
		    
		    dim r as boolean = StopIt( self.id )
		    return r
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidFinishPlaying(finishedPlaying As Boolean)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function getCurrentTime lib Framework selector "currentTime" ( obj_id As Ptr ) As Double
			    
			    return getCurrentTime( self.id )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare sub setCurrentTime lib Framework selector "setCurrentTime:" ( obj_id As Ptr, currTime As Double )
			    
			    setCurrentTime( self.id, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		CurrentTime As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function isPlaying lib Framework selector "isPlaying" ( obj_id As Ptr ) As Boolean
			    
			    return isPlaying( self.id )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsPlaying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function getLoops lib Framework selector "loops" ( obj_id As Ptr ) As Boolean
			    return getLoops( self.id )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare sub setLoops lib Framework selector "setLoops:" ( obj_id As Ptr, loops As Boolean )
			    setLoops( self.id, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		Loops As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function getName lib Framework selector "name" ( obj_id As Ptr ) As Ptr
			    
			    dim p As Ptr = getName( self.id )
			    dim nameObject as NSString
			    if p <> nil then
			      nameObject = new NSString( p, not NSObject.hasOwnership )
			    end if
			    
			    return nameObject
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare sub setName lib Framework selector "setName:" ( obj_id As Ptr, soundName As Ptr )
			    
			    if value <> nil then
			      dim p as Ptr = value.id
			      setName( self.id, p )
			    else
			      setName( self.id, nil )
			    end if
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		Name As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function getPlaybackDeviceIdentifier lib Framework selector "playbackDeviceIdentifier" ( obj_id As Ptr ) As Ptr
			    
			    dim p as Ptr = getPlaybackDeviceIdentifier( self.id )
			    dim nameObject as NSString
			    if p <> nil then
			      nameObject = new NSString( p, not NSObject.hasOwnership )
			    end if
			    return nameObject
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare sub setPlaybackDeviceIdentifier lib Framework selector "setPlaybackDeviceIdentifier:" ( obj_id As Ptr, soundName As Ptr )
			    
			    if value <> nil then
			      setPlaybackDeviceIdentifier( self.id, value.id )
			    else
			      setPlaybackDeviceIdentifier( self.id, nil )
			    end if
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		PlaybackDeviceIdentifier As NSString
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		StopOnDestruct As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function volume_ lib Framework selector "volume" ( obj_id As Ptr ) as Double
			    
			    return volume_( self.id )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare sub setVolume lib Framework selector "setVolume:" ( obj_id As Ptr, volume as Double )
			    
			    setVolume( self.id, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		Volume As Double
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSSoundDidFinishPlayingDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Framework, Type = String, Dynamic = False, Default = \"AppKit.framework", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CurrentTime"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
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
			Name="IsPlaying"
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
			Name="Loops"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopOnDestruct"
			Group="Behavior"
			Type="Boolean"
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
		#tag ViewProperty
			Name="Volume"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

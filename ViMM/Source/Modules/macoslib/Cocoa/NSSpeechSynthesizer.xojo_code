#tag Class
Class NSSpeechSynthesizer
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function AttributesForVoice(theVoice as string) As NSDictionary
		  
		  #if TargetMacOS
		    declare function attributesForVoice lib CocoaLib selector "attributesForVoice:" (Cls as Ptr, voice as CFStringRef) as Ptr
		    
		    dim p as Ptr = attributesForVoice( Cocoa.NSClassFromString( "NSSpeechSynthesizer" ), theVoice )
		    if p<>nil then
		      return  new NSDictionary( p, false )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AvailableVoices() As NSArray
		  
		  #if TargetMacOS
		    declare function availableVoices lib CocoaLib selector "availableVoices" (Cls as Ptr) as Ptr
		    
		    dim p as Ptr = availableVoices( Cocoa.NSClassFromString( "NSSpeechSynthesizer" ))
		    if p<>nil then
		      return  new NSArray( p, false )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  //Initializes with the default user settings
		  
		  #if TargetMacOS
		    declare function initWithVoice lib CocoaLib selector "initWithVoice:" (id as Ptr, p as Ptr) as Ptr
		    
		    Super.Constructor( initWithVoice( Allocate( "NSSpeechSynthesizer" ), nil ), true )
		    me.SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContinueSpeaking()
		  #if TargetMacOS
		    declare sub continueSpeaking lib CocoaLib selector "continueSpeaking" (id as Ptr)
		    
		    continueSpeaking( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultVoice() As String
		  
		  #if TargetMacOS
		    declare function defaultVoice lib CocoaLib selector "defaultVoice" (Cls as Ptr) as CFStringRef
		    
		    return   defaultVoice( Cocoa.NSClassFromString( "NSSpeechSynthesizer" ))
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
		Private Shared Sub Delegate_DidFinishSpeaking(id as Ptr, sel as Ptr, cntl as Ptr, IsSuccess as Boolean)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSSpeechSynthesizer = NSSpeechSynthesizer( w.Value )
		    if obj <> nil then
		      obj.HandleDidFinishSpeaking( IsSuccess )
		      
		    else
		      break
		      //something might be wrong.
		    end if
		  else
		    break
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub Delegate_Error(id as Ptr, sel as Ptr, cntl as Ptr, errorAtIndex as Integer, inString as CFStringRef, errMsg as CFStringRef)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSSpeechSynthesizer = NSSpeechSynthesizer( w.Value )
		    if obj <> nil then
		      dim s as string = inString
		      dim errorMsg as string = errMsg
		      obj.HandleSpeechError( errorAtIndex, s, errorMsg )
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_SyncMessage(id as Ptr, sel as Ptr, cntl as Ptr, syncMsg as CFStringRef)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSSpeechSynthesizer = NSSpeechSynthesizer( w.Value )
		    if obj <> nil then
		      dim s as string = syncMsg
		      obj.HandleSyncMessage( s )
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_WillSpeakPhoneme(id as Ptr, sel as Ptr, cntl as Ptr, opcode as Int16)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSSpeechSynthesizer = NSSpeechSynthesizer( w.Value )
		    if obj <> nil then
		      obj.HandleWillSpeakPhoneme( opcode )
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_WillSpeakWord(id as Ptr, sel as Ptr, cntl as Ptr, range as NSRange, inString as CFStringRef)
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSSpeechSynthesizer = NSSpeechSynthesizer( w.Value )
		    if obj <> nil then
		      dim s as string = inString
		      obj.HandleWillSpeakWord( range, s )
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if TargetMacOS
		    
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    declare sub release lib CocoaLib
		    setDelegate   me.id, nil
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As NSSearchField
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return NSSearchField(w.Value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFinishSpeaking(success as Boolean)
		  #if TargetMacOS
		    RaiseEvent  FinishedSpeaking( success )
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSpeechError(position as integer, inText as string, errorMsg as string)
		  #if TargetMacOS
		    RaiseEvent  SpeechError( errorMsg, position + 1, inText )
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSyncMessage(msg as string)
		  #if TargetMacOS
		    RaiseEvent   SyncMessage( msg )
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillSpeakPhoneme(opcode as Int16)
		  #if TargetMacOS
		    RaiseEvent  WillSpeakPhoneme( opcode )
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillSpeakWord(wordRange as NSRange, inString as string)
		  #if TargetMacOS
		    'dim r as new Realbasic.Range( wordRange.location + 1, wordRange.length )
		    'r.StartPos = wordRange.location + 1
		    'r.Length = wordRange.length
		    RaiseEvent   WillSpeakWord( wordRange, inString )
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsAnyApplicationSpeaking() As Boolean
		  
		  #if TargetMacOS
		    declare function isAnyApplicationSpeaking lib CocoaLib selector "isAnyApplicationSpeaking" (Cls as Ptr) as Boolean
		    
		    return   isAnyApplicationSpeaking( Cocoa.NSClassFromString( "NSSpeechSynthesizer" ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSpeaking() As Boolean
		  #if TargetMacOS
		    declare function isSpeaking lib CocoaLib selector "isSpeaking" (id as Ptr) as Boolean
		    
		    return  isSpeaking( me.id )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "speechSynthesizer:didEncounterErrorAtIndex:ofString:message:" : CType( AddressOf  delegate_Error, Ptr ) : "v@:@I@@"
		    methodList.Append  "speechSynthesizer:didEncounterSyncMessage:" : CType( AddressOf  delegate_SyncMessage, Ptr ) : "v@:@@"
		    methodList.Append  "speechSynthesizer:didFinishSpeaking:" : CType( AddressOf  delegate_DidFinishSpeaking, Ptr ) : "v@:@B"
		    methodList.Append  "speechSynthesizer:willSpeakPhoneme:" : CType( AddressOf delegate_WillSpeakPhoneme, Ptr ) : "v@:@s"
		    methodList.Append  "speechSynthesizer:willSpeakWord:ofString:" : CType( AddressOf delegate_WillSpeakWord, Ptr ) : "v@:@{name=NSRange}@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList)
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForProperty(propertyName as String) As variant
		  #if TargetMacOS
		    declare function objectForProperty lib CocoaLib selector "objectForProperty:error:" (id as Ptr, speechProperty as CFStringRef, byref outErr as Ptr) as Ptr
		    
		    dim p, err as Ptr
		    dim pname as string
		    if PropertyKeyList.Instr( propertyName )<>0 then
		      pname = Cocoa.StringConstant( propertyName )
		    else
		      pname = propertyName
		    end if
		    p = objectForProperty( me.id, pname, err )
		    if p=nil then //Error occurred
		      return  new NSException( err )
		    else
		      return   Cocoa.NSObjectFromNSPtr( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForProperty(propertyName as String, value as variant, byref error as NSException) As boolean
		  #if TargetMacOS
		    declare function setObjectForProperty lib CocoaLib selector "setObject:forProperty:error:" (id as Ptr, obj as Ptr, speechProperty as CFStringRef, byref outErr as Ptr) as boolean
		    
		    dim err as Ptr
		    dim nso as NSObject = Cocoa.NSObjectFromVariant( value )
		    dim pname as string
		    if PropertyKeyList.Instr( propertyName )<>0 then
		      pname = Cocoa.StringConstant( propertyName )
		    else
		      pname = propertyName
		    end if
		    
		    dim OK as boolean = setObjectForProperty( me.id, nso.id, pname, err )
		    
		    if OK then
		      error = nil
		    else
		      error = new NSException( err )
		    end if
		    return  OK
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PauseSpeakingAtBoundary(Boundary as integer)
		  
		  #if TargetMacOS
		    declare sub pauseSpeakingAtBoundary lib CocoaLib selector "pauseSpeakingAtBoundary:" (id as Ptr, bnd as integer)
		    
		    if Boundary<0 OR Boundary>2 then
		      dim e as new OutOfBoundsException
		      e.Message = "Boundary value must be in range 0-2."
		      raise   e
		    end if
		    
		    pauseSpeakingAtBoundary( me.id, Boundary )
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PhonemesFromText(theText as string) As string
		  
		  #if TargetMacOS
		    declare function phonemesFromText lib CocoaLib selector "phonemesFromText:" (id as Ptr, theText as CFStringRef ) as CFStringRef
		    
		    return   phonemesFromText( me.id, theText )
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
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartSpeakingStringToURL(text as string, targetFile as NSURL) As Boolean
		  #if TargetMacOS
		    declare function StartSpeakingStringToURL_ lib CocoaLib selector "startSpeakingString:toURL:" (id as Ptr, text as CFStringRef, url as Ptr) as Boolean
		    
		    return   StartSpeakingStringToURL_( me.id, text, targetFile )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartSpeakingText(theText as string) As Boolean
		  
		  #if TargetMacOS
		    declare function startSpeakingString lib CocoaLib selector "startSpeakingString:" (id as Ptr, theText as CFStringRef ) as Boolean
		    
		    return  startSpeakingString( me.id, theText )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSpeaking()
		  
		  #if TargetMacOS
		    declare sub stopSpeaking lib CocoaLib selector "stopSpeaking" (id as Ptr)
		    
		    stopSpeaking( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSpeakingAtBoundary(Boundary as integer)
		  
		  #if TargetMacOS
		    declare sub stopSpeakingAtBoundary lib CocoaLib selector "stopSpeakingAtBoundary:" (id as Ptr, bnd as integer)
		    
		    if Boundary<0 OR Boundary>2 then
		      dim e as new OutOfBoundsException
		      e.Message = "Boundary value must be in range 0-2."
		      raise   e
		    end if
		    
		    stopSpeakingAtBoundary( me.id, Boundary )
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FinishedSpeaking(successfully as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SpeechError(errorMsg as string, atPosition as integer, inString as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SyncMessage(message as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillSpeakPhoneme(phonemeCode as Int16)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillSpeakWord(wordRange as NSRange, inString as string)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function getRate lib CocoaLib selector "rate" (id as Ptr) as Double
			    
			    return  getRate( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setRate lib CocoaLib selector "setRate:" (id as Ptr, newRate as Double)
			    
			    setRate( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Rate As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function getVoice lib CocoaLib selector "voice" (id as Ptr) as CFStringRef
			    
			    return  getVoice( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare function setVoice lib CocoaLib selector "setVoice:" (id as Ptr, newVoice as CFStringRef) as Boolean
			    
			    call  setVoice( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Voice As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function getVolume lib CocoaLib selector "volume" (id as Ptr) as Double
			    
			    return  getVolume( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setVolume lib CocoaLib selector "setVolume:" (id as Ptr, newVol as Double)
			    
			    if value<0.0 OR value>1.0 then
			      raise new  macoslibException( "NSSpeechSynthesizer volume must be in range 0.0 to 1.0" )
			    end if
			    
			    setVolume( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Volume As Double
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSSpeechsynthesizerDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kNSSpeechImmediateBoundary, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSpeechSentenceBoundary, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSpeechWordBoundary, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PropertyKeyList, Type = String, Dynamic = False, Default = \"NSSpeechStatusProperty\rNSSpeechErrorsProperty\rNSSpeechInputModeProperty\rNSSpeechCharacterModeProperty\rNSSpeechNumberModeProperty\rNSSpeechRateProperty\rNSSpeechPitchBaseProperty\rNSSpeechPitchModProperty\rNSSpeechVolumeProperty\rNSSpeechSynthesizerInfoProperty\rNSSpeechRecentSyncProperty\rNSSpeechPhonemeSymbolsProperty\rNSSpeechCurrentVoiceProperty\rNSSpeechCommandDelimiterProperty\rNSSpeechResetProperty\rNSSpeechOutputToFileURLProperty\rNSSpeechModeText\rNSSpeechModePhoneme\rNSSpeechModeNormal\rNSSpeechModeLiteral\rNSSpeechStatusOutputBusy\rNSSpeechStatusOutputPaused\rNSSpeechStatusNumberOfCharactersLeft\rNSSpeechStatusPhonemeCode\rNSSpeechErrorCount\rNSSpeechErrorOldestCode\rNSSpeechErrorOldestCharacterOffset\rNSSpeechErrorNewestCode\rNSSpeechErrorNewestCharacterOffset\rNSSpeechSynthesizerInfoIdentifier\rNSSpeechSynthesizerInfoVersion\rNSSpeechPhonemeInfoOpcode\rNSSpeechPhonemeInfoSymbol\rNSSpeechPhonemeInfoExample\rNSSpeechPhonemeInfoHiliteStart\rNSSpeechPhonemeInfoHiliteEnd\rNSSpeechCommandPrefix\rNSSpeechCommandSuffix\rNSSpeechDictionaryLocaleIdentifier\rNSSpeechDictionaryModificationDate\rNSSpeechDictionaryPronunciations\rNSSpeechDictionaryAbbreviations\rNSSpeechDictionaryEntrySpelling\rNSSpeechDictionaryEntryPhonemes", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
			Name="Rate"
			Group="Behavior"
			Type="Double"
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
			Name="Voice"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Volume"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

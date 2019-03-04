#tag Class
Protected Class MacSpeechSynthesizer
	#tag Method, Flags = &h0
		Shared Function AttributesForVoice(theVoice as string) As Dictionary
		  //# Read the voice attributes and return them as a dictionary
		  
		  #if TargetMacOS
		    dim nsd as NSDictionary = NSSpeechSynthesizer.AttributesForVoice( theVoice )
		    if nsd<>nil then
		      return  nsd.VariantValue
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AvailableVoices() As string()
		  //# Return a list of available voices identifiers
		  
		  #if TargetMacOS
		    dim nsa as NSArray = NSSpeechSynthesizer.AvailableVoices
		    return nsa.StringValues
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  //# Initialize with the default voice
		  
		  m_synth = new NSSpeechSynthesizer
		  
		  //Redirect events
		  AddHandler   synth.FinishedSpeaking, WeakAddressOf HandleDidFinishSpeaking
		  AddHandler   synth.SpeechError, WeakAddressOf HandleSpeechError
		  AddHandler   synth.SyncMessage, WeakAddressOf HandleSyncMessage
		  AddHandler   synth.WillSpeakPhoneme, WeakAddressOf HandleWillSpeakPhoneme
		  AddHandler   synth.WillSpeakWord, WeakAddressOf HandleWillSpeakWord
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContinueSpeaking()
		  //# Continue speaking after it has been paused
		  
		  synth.ContinueSpeaking
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultVoice() As String
		  //# Return the default voice identifier (as defined in System Preferences)
		  
		  return  NSSpeechSynthesizer.DefaultVoice
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  if synth<>nil then
		    RemoveHandler   synth.FinishedSpeaking, AddressOf HandleDidFinishSpeaking
		    RemoveHandler   synth.SpeechError, AddressOf HandleSpeechError
		    RemoveHandler   synth.SyncMessage, AddressOf HandleSyncMessage
		    RemoveHandler   synth.WillSpeakPhoneme, AddressOf HandleWillSpeakPhoneme
		    RemoveHandler   synth.WillSpeakWord, AddressOf HandleWillSpeakWord
		    
		    m_synth = nil
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFinishSpeaking(sender as NSSpeechSynthesizer, success as Boolean)
		  #pragma unused success
		  #pragma unused sender
		  
		  #if TargetMacOS
		    RaiseEvent  FinishedSpeaking( success )
		    
		  #else
		    #pragma unused success
		  #endif
		  
		  #pragma unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSpeechError(sender as NSSpeechSynthesizer, errorMsg as string, position as integer, inText as string)
		  #pragma unused  sender
		  
		  #if TargetMacOS
		    RaiseEvent  SpeechError( errorMsg, position, inText )
		    
		  #else
		    #pragma unused errorMsg
		    #pragma unused position
		    #pragma unused inText
		  #endif
		  
		  #pragma unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSyncMessage(sender as NSSpeechSynthesizer, msg as string)
		  #pragma unused sender
		  
		  #if TargetMacOS
		    RaiseEvent   SyncMessage( msg )
		    
		  #else
		    #pragma unused msg
		  #endif
		  
		  #pragma unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillSpeakPhoneme(sender as NSSpeechSynthesizer, opcode as Int16)
		  #pragma unused sender
		  
		  #if TargetMacOS
		    RaiseEvent  WillSpeakPhoneme( opcode )
		    
		  #else
		    #pragma unused opcode
		  #endif
		  
		  #pragma unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillSpeakWord(sender as NSSpeechSynthesizer, wordRange as Cocoa.NSRange, inString as string)
		  #pragma unused sender
		  
		  #if TargetMacOS
		    RaiseEvent   WillSpeakWord( wordRange, inString )
		    
		  #else
		    #pragma unused wordRange
		    #pragma unused inString
		  #endif
		  
		  #pragma unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsAnyApplicationSpeaking() As Boolean
		  //# Check if the speech synthesizer core is busy talking in any running application
		  
		  #if TargetMacOS
		    return   NSSpeechSynthesizer.IsAnyApplicationSpeaking
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSpeaking() As Boolean
		  //# Return true if the speech synthesizer is in use.
		  
		  return  synth.IsSpeaking
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForProperty(propertyName as String) As variant
		  //# Get a property of the speech synthesizer. Returns nil on error.
		  
		  //@ PropertyName can be any name in NSSpeechSynthesizer.PropertyKeyList or its true Cocoa value
		  
		  #if TargetMacOS
		    dim nso as NSObject
		    dim v as variant
		    
		    v = me.synth.ObjectForProperty( propertyName )
		    if v isa NSException then
		      return  nil
		    else
		      nso = v
		      return  nso.VariantValue
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForProperty(propertyName as String, value as variant) As string
		  //# Set a property value
		  
		  //@ Returns an error message if any, or an empty string on success
		  //@ PropertyName can be any name in NSSpeechSynthesizer.PropertyKeyList or its true Cocoa value
		  
		  #if TargetMacOS
		    dim nso as NSObject
		    dim err as NSException
		    
		    nso = Cocoa.NSObjectFromVariant( value )
		    
		    if NOT synth.ObjectForProperty( propertyName, nso, err ) then
		      return  err.Message
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PauseSpeakingAtBoundary(Boundary as integer)
		  //# Pause speaking at the given boundary (any of the kNSSpeech...Boundary constants)
		  
		  //@ You can resume speaking with ContinueSpeaking.
		  
		  #if TargetMacOS
		    synth.PauseSpeakingAtBoundary   Boundary
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PhonemesFromText(theText as string) As string
		  //# Return the phonemes that correspond to 'theText'
		  
		  //@ Note: this method returns an empty string with the new high-quality voices in Lion.
		  
		  
		  #if TargetMacOS
		    return  synth.PhonemesFromText( theText )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartSpeakingText(theText as string) As Boolean
		  //# Start speaking the passed text
		  
		  return  synth.StartSpeakingText( theText )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartSpeakingTextToFile(text as string, targetFile as FolderItem) As Boolean
		  //# Start speaking the given text and write the output to the 'targetFile'
		  
		  #if TargetMacOS
		    return  synth.StartSpeakingStringToURL( text, new NSURL( targetFile ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSpeaking()
		  //# Stop speaking text immediately
		  
		  synth.StopSpeaking
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSpeakingAtBoundary(Boundary as integer)
		  //# Stop speaking at the given boundary (any of the kNSSpeech...Boundary constants)
		  
		  #if TargetMacOS
		    synth.StopSpeakingAtBoundary   Boundary
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
		Event WillSpeakWord(wordRange as Cocoa.NSRange, inString as string)
	#tag EndHook


	#tag Property, Flags = &h21
		Private m_synth As NSSpeechSynthesizer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Speech rate in words per minute. Usually between 180 and 220.
		#tag EndNote
		#tag Getter
			Get
			  return  synth.rate
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  synth.Rate = value
			  
			End Set
		#tag EndSetter
		Rate As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Get the underlying Cocoa object
			  
			  return  m_synth
			End Get
		#tag EndGetter
		synth As NSSpeechSynthesizer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The current voice identifier
		#tag EndNote
		#tag Getter
			Get
			  return   synth.Voice
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  synth.Voice = value
			End Set
		#tag EndSetter
		Voice As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The volume in the range 0.0 to 1.0
		#tag EndNote
		#tag Getter
			Get
			  return   synth.Volume
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  synth.Volume = value
			End Set
		#tag EndSetter
		Volume As Double
	#tag EndComputedProperty


	#tag Constant, Name = kNSSpeechImmediateBoundary, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSpeechSentenceBoundary, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSpeechWordBoundary, Type = Double, Dynamic = False, Default = \"1", Scope = Public
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

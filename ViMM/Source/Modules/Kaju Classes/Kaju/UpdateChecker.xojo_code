#tag Class
Protected Class UpdateChecker
	#tag Method, Flags = &h21
		Private Sub AsyncHTTP_Error(sender As HTTPSocketAsync, err As RuntimeException)
		  #pragma unused sender
		  
		  dim index as integer = AsyncCheckers.IndexOf( self )
		  if index <> -1 then
		    AsyncCheckers.Remove index
		  end if
		  
		  dim errMsg as string = err.Message
		  if errMsg = "" then
		    err.Message = "An exception of type " + Introspection.GetType( err ).Name + " has occurred"
		  end if
		  
		  LastError = err
		  
		  if HandleError( errMsg ) then
		    FetchAsync
		  else
		    RaiseEvent ExecuteAsyncComplete
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AsyncHTTP_PageReceived(sender As HTTPSocketAsync, url As String, httpStatus As Integer, content As String)
		  #pragma unused sender
		  #pragma unused url
		  
		  dim index as integer = AsyncCheckers.IndexOf( self )
		  if index <> -1 then
		    AsyncCheckers.Remove index
		  end if
		  
		  dim statusCode as integer = httpStatus
		  dim raw as string = content
		  
		  if statusCode = 404 then // Not found
		    mResult = ResultType.PageNotFound
		    RaiseEvent ExecuteAsyncComplete
		    
		  elseif ProcessRaw( raw ) then
		    FetchAsync()
		    
		  else
		    RaiseEvent ExecuteAsyncComplete
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(preferencesFolder As FolderItem, preferencesFilename As String = kDefaultPreferencesName)
		  self.PrefFile = preferencesFolder.Child( preferencesFilename )
		  
		  LoadPrefs()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  SavePrefs()
		  
		  if AsyncHTTP isa object then
		    RemoveHandler AsyncHTTP.PageReceived, WeakAddressOf AsyncHTTP_PageReceived
		    RemoveHandler AsyncHTTP.Error, WeakAddressOf AsyncHTTP_Error
		    AsyncHTTP = nil
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DryRun() As Boolean
		  return mDryRun
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Execute()
		  // Pull the data from the URL, check it, and preset the window if needed
		  // Returns true if the app should quit in preparation of the update.
		  //
		  // The caller should be prepared to handle an exception in case of error.
		  //
		  
		  if not PreCheck then
		    return
		  end if
		  
		  FetchAndProcess
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExecuteAsync()
		  //
		  // Uses the new socket to check asynchronously
		  // (required for newer certificates)
		  //
		  // The caller should be prepared to handle an exception in case of error.
		  //
		  
		  if not PreCheck then
		    return
		  end if
		  
		  FetchAsync
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FetchAndProcess()
		  //
		  // Look for redirection
		  //
		  dim url as string = self.UpdateURL
		  if AllowRedirection then
		    dim redirector as new Kaju.HTTPSSocket
		    url = redirector.GetRedirectAddress( url, 5 )
		  end if
		  
		  //
		  // Repeat the check until we get data or the user gives up
		  //
		  do
		    
		    dim http as new Kaju.HTTPSSocket
		    
		    dim raw as string = http.Get( url, 5 )
		    dim statusCode as integer = http.HTTPStatusCode
		    
		    if statusCode = 404 then // Not found
		      mResult = ResultType.PageNotFound
		      exit do
		    end if
		    
		    if not ProcessRaw( raw ) then
		      exit do
		    end if
		  loop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FetchAsync()
		  //
		  // The new socket will always redirect so
		  // AllowRedirection must be set to true.
		  // If it isn't, we will let the consumer know through
		  // an exception.
		  //
		  
		  if not AllowRedirection then
		    const kErrorString = _
		    "AllowRedirection must be set to True when using asynchrous operations"
		    raise new Kaju.KajuException( kErrorString, CurrentMethodName )
		  end if
		  
		  dim url as string = UpdateURL
		  dim http as Kaju.HTTPSocketAsync = GetAsyncHTTPSocket
		  http.Get url
		  
		  mResult = ResultType.FetchingUpdateInfo
		  
		  //
		  // Processing will resume in the events
		  //
		  
		  //
		  // But we have to hold a reference to this object in case the consumer decided to use
		  // a temporary variable
		  //
		  
		  if AsyncCheckers.IndexOf( self ) = -1 then
		    AsyncCheckers.Append self
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetAsyncHTTPSocket() As Kaju.HTTPSocketAsync
		  if AsyncHTTP is nil then
		    AsyncHTTP = new HTTPSocketAsync
		    AddHandler AsyncHTTP.PageReceived, WeakAddressOf AsyncHTTP_PageReceived
		    AddHandler AsyncHTTP.Error, WeakAddressOf AsyncHTTP_Error
		  end if
		  
		  return AsyncHTTP
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleError(msg As String) As Boolean
		  // Displays a dialog to the user with the message and asks if they want to try again now or later
		  // Returns True to try now, False to try later
		  
		  dim r as boolean
		  
		  if IsAllowed( kAllowErrorDialog ) then
		    //
		    // The dialog is allowed
		    //
		    dim dlg as new MessageDialog
		    dlg.ActionButton.Visible = true
		    dlg.ActionButton.Caption = KajuLocale.kTryAgainButton
		    dlg.CancelButton.Visible = true
		    dlg.CancelButton.Caption = KajuLocale.kLaterButton
		    dlg.AlternateActionButton.Visible = false
		    dlg.Message = KajuLocale.kErrorOccurredMessage
		    dlg.Explanation = msg
		    
		    dim btn as MessageDialogButton = dlg.ShowModal
		    if btn is dlg.ActionButton then
		      r = true
		    else
		      r = false
		    end if
		    
		  end if
		  
		  //
		  // If the dialog wasn't allowed, just try again later
		  //
		  if not r then
		    mResult = ResultType.Error
		  end if
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub IgnoreVersion(version As String)
		  if version <> "" and IgnoreVersionsPref.IndexOf( version ) = -1 then
		    IgnoreVersionsPref.Append version
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsAllowed(testValue As Integer) As Boolean
		  if testValue = 0 then // Special case
		    return AllowedInteraction = 0
		  else
		    dim result as integer = AllowedInteraction and testValue
		    return result = testValue
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function JSONToStringArray(data As JSONItem) As String()
		  dim ub as integer = data.Count - 1
		  dim arr() as string
		  redim arr( ub )
		  
		  for i as integer = 0 to ub
		    arr( i ) = data( i )
		  next
		  
		  return arr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadPrefs()
		  // Load the preferences from the known file
		  //
		  // Preferences are a JSON file
		  
		  if not PrefFile.Exists then
		    //
		    // Nothing to load
		    //
		    return
		  end if
		  
		  dim tis as TextInputStream = TextInputStream.Open( PrefFile )
		  dim raw as string = tis.ReadAll( Encodings.UTF8 )
		  
		  dim j as new JSONItem( raw )
		  
		  //
		  // Load the individual variables here
		  //
		  
		  dim ti as Introspection.TypeInfo = Introspection.GetType( self )
		  dim props() as Introspection.PropertyInfo = ti.GetProperties
		  for each prop as Introspection.PropertyInfo in props
		    dim thisName as string = prop.Name
		    if StrComp( thisName.Right( 4 ), "Pref", 0 ) <> 0 or not j.HasName( prop.Name ) then
		      continue for prop
		    end if
		    
		    if prop.PropertyType.Name = "String()" then
		      prop.Value( self ) = JSONToStringArray( j.Value( thisName ) )
		    else
		      prop.Value( self ) = j.Value( thisName )
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OSIsSupported() As Boolean
		  // Ensures that the right tools are available on the current OS
		  
		  dim errorCode as integer = 0 // Assume it's fine
		  dim errorMessage as string
		  
		  //
		  // Try more than once, just in case
		  //
		  for repeatIndex as integer = 1 to 2
		    
		    #if TargetMacOS then
		      
		      errorCode = 0 // If this app can run, it has the right tools
		      errorMessage = ""
		      
		    #elseif TargetWindows then
		      
		      dim sh as new Shell
		      sh.TimeOut = 3000
		      sh.Execute "XCOPY /?"
		      errorCode = sh.ErrorCode
		      if errorCode <> 0 then
		        errorMessage = sh.Result.Trim
		      end if
		      
		    #else // Linux
		      
		      dim cmds() as string = array( "rsync --version", "/usr/bin/logger --version" )
		      
		      dim sh as new shell
		      for each cmd as string in cmds
		        sh.Execute cmd
		        errorCode = sh.ErrorCode
		        
		        if errorCode <> 0 then
		          errorMessage = "(" + cmd + ") " + sh.Result.Trim
		          exit for cmd
		        end if
		      next
		      
		    #endif
		    
		    if errorCode = 0 then
		      exit for repeatIndex
		    else
		      errorMessage = errorMessage.Trim
		      System.Log System.LogLevelCritical, _
		      CurrentMethodName + ": Tool not available, code " + str( errorCode ) + _
		      if( errorMessage <> "", ": " + errorMessage, "" )
		    end if
		  next
		  
		  return errorCode = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Precheck() As Boolean
		  //
		  // If there is already an update in progress, do nothing
		  //
		  if UpdateWindowIsOpen then
		    mResult = ResultType.UpdateAlreadyInProgress
		    return false
		  end if
		  
		  //
		  // Clear the last error
		  //
		  LastError = nil
		  
		  //
		  // Make sure the OS is supported
		  //
		  if not OSIsSupported() then
		    mResult = ResultType.UnsupportedOS
		    return false
		  end if
		  
		  //
		  // Check for write permission
		  //
		  if true then // Scope
		    
		    dim executable as FolderItem = Kaju.TrueExecutableFile
		    
		    #if TargetMacOS then
		      if not executable.Parent.IsWriteable or not Kaju.IsWriteableRecursive( executable ) then
		        mResult = ResultType.NoWritePermission
		        return false
		      end if
		    #else
		      if not Kaju.IsWriteableRecursive( executable.Parent ) then
		        mResult = ResultType.NoWritePermission
		        return false
		      end if
		    #endif
		    
		  end if
		  
		  mDryRun = false
		  
		  //
		  // Make sure we have some URL
		  //
		  
		  if UpdateURL.Trim = "" then
		    raise new KajuException( KajuException.kErrorMissingUpdateURL, CurrentMethodName )
		  end if
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessRaw(raw As String) As Boolean
		  //
		  // Processes the raw packet
		  // 
		  // Returns True if the process should contine, False if it's done
		  // or was cancelled
		  //
		  
		  if raw = "" then
		    return HandleError( KajuLocale.kErrorNoUpdateData ) 
		  end if
		  
		  raw = raw.DefineEncoding( Encodings.UTF8 )
		  
		  dim firstLine as string
		  dim remainder as string
		  SeparatePacket( raw, firstLine, remainder )
		  raw = remainder
		  
		  dim sig as string = firstLine.Left( kUpdatePacketMarker.Len )
		  if StrComp( sig, kUpdatePacketMarker, 0 ) <> 0 then
		    return HandleError( KajuLocale.kErrorIncorrectPacketMarker )
		  end if
		  
		  sig = firstLine.Mid( sig.Len + 1 ).Trim
		  sig = DecodeHex( sig )
		  
		  //
		  // It's possible the EOL in the JSON got changed so we will try all
		  // possibilities before giving up
		  //
		  dim isValid as boolean
		  
		  dim eolChars() as string = array( "", &u0A, &u0D, &u0D + &u0A )
		  for each eol as string in eolChars
		    dim tester as string = raw
		    if eol <> "" then
		      tester = ReplaceLineEndings( tester, eol )
		    end if
		    
		    isValid = Crypto.RSAVerifySignature( tester, sig, ServerPublicRSAKey )
		    if isValid then
		      exit for eol
		    end if
		  next
		  
		  if not isValid then
		    return HandleError( KajuLocale.kErrorIncorrectPacketSignature )
		  end if
		  
		  return not ProcessUpdateData( raw )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessUpdateData(raw As String) As Boolean
		  // Return true if there was no error or if the user wants to try later
		  
		  mResult = ResultType.NoUpdateAvailable // Assume this is true
		  
		  dim j as new JSONItem( raw )
		  dim versionDouble as double = if( DryRun, -1.0, Kaju.VersionToDouble( Kaju.AppVersionString ) )
		  
		  //
		  // Get an array of the info
		  //
		  dim ub as integer = j.Count - 1
		  dim info() as Kaju.UpdateInformation
		  dim updateIsRequired as boolean
		  for i as integer = 0 to ub
		    //
		    // Make sure it has a Security Token
		    //
		    dim thisElement as JSONItem = j( i )
		    if thisElement.Lookup( kNameSecurityToken, "" ) = "" then
		      raise new KajuException( KajuLocale.kMissingReason + " security token", CurrentMethodName )
		    end if
		    
		    dim thisInfo as new Kaju.UpdateInformation( thisElement )
		    
		    //
		    // See if the binary information is present
		    //
		    dim binary as Kaju.BinaryInformation
		    if Target32Bit and Allow32bitTo64bitUpdates then
		      binary = thisInfo.PlatformBinaryAny
		    else
		      binary = thisInfo.PlatformBinarySameBitness
		    end if
		    
		    if binary is nil then
		      continue for i
		    end if
		    
		    //
		    // See if the stage on this update is allowed
		    //
		    if thisInfo.StageCode < AllowedStage then
		      continue for i
		    end if
		    
		    //
		    // See if this update is for a higher version
		    //
		    if thisInfo.VersionAsDouble <= versionDouble then
		      continue for i
		    end if
		    
		    //
		    // See if this update is required
		    //
		    dim thisUpdateIsRequired as boolean
		    if thisInfo.MinimumRequiredVersion <> "" and Kaju.VersionToDouble( thisInfo.MinimumRequiredVersion ) > versionDouble then
		      thisUpdateIsRequired = true
		      updateIsRequired = true
		    end if
		    
		    //
		    // An ignored version? (but only if not required)
		    //
		    if not thisUpdateIsRequired and HonorIgnored and IgnoreVersionsPref.IndexOf( thisInfo.Version ) <> -1 then
		      mResult = ResultType.IgnoredUpdateAvailable
		      continue for i
		    end if
		    
		    //
		    // This is a viable update
		    //
		    
		    info.Append thisInfo
		  next
		  
		  if info.Ubound <> -1 then
		    //
		    // There are updates
		    //
		    mResult = if( updateIsRequired, ResultType.RequiredUpdateAvailable, ResultType.UpdateAvailable )
		    if IsAllowed( kAllowUpdateWindow ) then
		      KajuUpdateWindow.ChooseUpdate( self, info )
		    end if
		  end if
		  
		  return true
		  
		  Exception err as RuntimeException
		    if err isa EndException or err isa ThreadEndException then
		      raise err
		    end if
		    
		    System.DebugLog err.Message
		    return not HandleError( KajuLocale.kErrorBadUpdateData + _
		    if( err.Message <> "", " - " + err.Message, "" ) )
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetIgnored()
		  redim IgnoreVersionsPref( -1 )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SavePrefs()
		  dim j as new JSONItem
		  
		  //
		  // Save the individual prefs here.
		  // Properties that end with "Pref" will be saved
		  //
		  
		  dim ti as Introspection.TypeInfo = Introspection.GetType( self )
		  dim props() as Introspection.PropertyInfo = ti.GetProperties
		  for each prop as Introspection.PropertyInfo in props
		    if StrComp( prop.Name.Right( 4 ), "Pref", 0 ) = 0 then
		      if prop.PropertyType.Name = "String()" then
		        j.Value( prop.Name ) = StringArrayToJSON( prop.Value( self ) )
		      else
		        j.Value( prop.Name ) = prop.Value( self )
		      end if
		    end if
		  next
		  
		  //
		  // Save the file
		  //
		  
		  j.Compact = false
		  dim raw as string = j.ToString
		  
		  dim tos as TextOutputStream = TextOutputStream.Create( PrefFile )
		  tos.Write raw
		  tos = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SeparatePacket(raw As String, ByRef firstLine As String, ByRef remainder As String)
		  // Separate the incoming packet by the EOL when we don't know exactly what
		  // the EOL is.
		  
		  dim rx as new RegEx
		  rx.SearchPattern = "\A([^\r\n]*)\R([\s\S]*)\z"
		  
		  dim match as RegExMatch = rx.Search( raw )
		  if match is nil then
		    //
		    // Really shouldn't happen
		    //
		    firstLine = raw
		    remainder = ""
		    
		  else
		    
		    firstLine = match.SubExpressionString( 1 )
		    remainder = match.SubExpressionString( 2 )
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StringArrayToJSON(arr() As String) As JSONItem
		  dim j as new JSONItem( "[]" )
		  for i as integer = 0 to arr.Ubound
		    j.Append arr( i )
		  next
		  
		  return j
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestUpdate(jsonString As String)
		  // Allows a dry run with the update information that would otherwise be obtained
		  // from the UpdateURL
		  
		  //
		  // If there is already an update in progress, do nothing
		  //
		  if UpdateWindowIsOpen then
		    mResult = ResultType.UpdateAlreadyInProgress
		    return
		  end if
		  
		  mDryRun = true
		  
		  do
		    if ProcessUpdateData( jsonString ) then
		      exit do
		    end if
		  loop
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ExecuteAsyncComplete()
	#tag EndHook


	#tag Property, Flags = &h0
		Allow32bitTo64bitUpdates As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowedInteraction As UInt32 = kAllowAll
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowedStage As Integer = App.Development
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowRedirection As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared AsyncCheckers() As Kaju.UpdateChecker
	#tag EndProperty

	#tag Property, Flags = &h21
		Private AsyncHTTP As Kaju.HTTPSocketAsync
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultUseTransparency As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		HonorIgnored As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IgnoreVersionsPref() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastError As RuntimeException
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDryRun As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( hidden ) Private mResult As ResultType = ResultType.NotYetChecked
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrefFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		QuitOnCancelIfRequired As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mResult
			End Get
		#tag EndGetter
		Result As ResultType
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ServerPublicRSAKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		UpdateURL As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as boolean
			  
			  dim lastIndex as integer = WindowCount - 1
			  for i as integer = 0 to lastIndex
			    if Window( i ) IsA KajuUpdateWindow then
			      r = true
			      exit
			    end if
			  next
			  
			  return r
			End Get
		#tag EndGetter
		UpdateWindowIsOpen As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = kAllowAll, Type = Double, Dynamic = False, Default = \"&hFFFF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAllowErrorDialog, Type = Double, Dynamic = False, Default = \"&b00001000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAllowNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAllowUpdateWindow, Type = Double, Dynamic = False, Default = \"&b10000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDefaultPreferencesName, Type = String, Dynamic = False, Default = \"Kaju_Preferences", Scope = Public
	#tag EndConstant


	#tag Enum, Name = ResultType, Type = Integer, Flags = &h0
		NotYetChecked = -9999
		  UpdateAlreadyInProgress = -100
		  UnsupportedOS = -70
		  NoWritePermission = -50
		  Error = -1
		  NoUpdateAvailable = 0
		  IgnoredUpdateAvailable
		  UpdateAvailable
		  RequiredUpdateAvailable
		  FetchingUpdateInfo
		PageNotFound = 404
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Allow32bitTo64bitUpdates"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowedInteraction"
			Group="Behavior"
			InitialValue="kAllowAll"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowedStage"
			Group="Behavior"
			InitialValue="App.Development"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRedirection"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultImage"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultUseTransparency"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HonorIgnored"
			Group="Behavior"
			InitialValue="True"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="QuitOnCancelIfRequired"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Result"
			Group="Behavior"
			Type="ResultType"
			EditorType="Enum"
			#tag EnumValues
				"-9999 - NotYetChecked"
				"-100 - UpdateAlreadyInProgress"
				"-70 - UnsupportedOS"
				"-50 - NoWritePermission"
				"-1 - Error"
				"0 - NoUpdateAvailable"
				"1 - IgnoredUpdateAvailable"
				"2 - UpdateAvailable"
				"3 - RequiredUpdateAvailable"
				"4 - FetchingUpdateInfo"
				"404 - PageNotFound"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerPublicRSAKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="UpdateURL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UpdateWindowIsOpen"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

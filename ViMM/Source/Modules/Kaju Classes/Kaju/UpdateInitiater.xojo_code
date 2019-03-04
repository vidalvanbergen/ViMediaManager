#tag Class
Protected Class UpdateInitiater
	#tag Method, Flags = &h21
		Private Function ArrayToShellScript(arr() As String, variableName As String) As String
		  // Converts the given array to shell script code to form an array
		  
		  dim r as string
		  
		  #if TargetMacOS or TargetLinux then
		    
		    dim builder() as string
		    for i as integer = 0 to arr.Ubound
		      builder.Append variableName
		      builder.Append "["
		      builder.Append str( i )
		      builder.Append "]="
		      builder.Append ShellQuote( arr( i ) )
		      builder.Append EndOfLine.UNIX
		    next i
		    
		    r = join( builder, "" )
		    
		  #else // Windows
		    //
		    // No array in Windows
		    //
		    raise new Kaju.KajuException( Kaju.KajuException.kErrorImproperFunction, CurrentMethodName )
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cancel()
		  ReplacementAppFolder = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  RunScript
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetAppVersionForScript() As String
		  dim thisVersion as string = Kaju.AppVersionString
		  if Target32Bit then
		    thisVersion = thisVersion + Kaju.kBitMarker32Bit
		  elseif Target64Bit then
		    thisVersion = thisVersion + Kaju.kBitMarker64Bit
		  end if
		  
		  return thisVersion
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetManifest(sourceFolder As FolderItem, excludeName As String) As String()
		  // Retrieves the names of the files and folders contained in the sourceFolder
		  // except for the excluded name and .DS_Store
		  
		  dim r() as string
		  
		  dim cnt as integer = sourceFolder.Count
		  for i as integer = 1 to cnt
		    dim f as FolderItem = sourceFolder.Item( i )
		    dim name as string = f.Name
		    if name <> excludeName and name <> ".DS_Store" then
		      r.Append name
		    end if
		  next
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunScript()
		  if ReplacementAppFolder is nil or not ReplacementAppFolder.Exists then
		    ReplacementAppFolder = nil
		    return
		  end if
		  
		  //
		  // Set up a temporary folder
		  //
		  dim tempFolder as FolderItem
		  #if DebugBuild then
		    tempFolder = SpecialFolder.Desktop.Child( "KajuTempFolder" + str( Ticks ) )
		    if tempFolder.Exists then
		      Kaju.DeleteRecursive( tempFolder )
		    end if
		    tempFolder.CreateAsFolder
		  #elseif TargetWindows then
		    dim parent as FolderItem = App.ExecutableFile.Parent
		    dim folderName as string = App.ExecutableFile.Name + "-tempfolder"
		    tempFolder = parent.Child( folderName )
		    Kaju.DeleteRecursive( tempFolder )
		    tempFolder.CreateAsFolder
		  #else
		    tempFolder = Kaju.GetTemporaryFolder
		  #endif
		  
		  //
		  // Set up the PID file
		  //
		  dim pid as FolderItem = GetTemporaryFolderItem()
		  
		  #if TargetMacOS then
		    RunScriptMac( tempFolder, pid )
		  #elseif TargetLinux then
		    RunScriptLinux( tempFolder, pid )
		  #else // Windows
		    RunScriptWindows( tempFolder, pid )
		  #endif
		  
		  Exception err As RuntimeException
		    MsgBox "Could not complete update - " + err.Message
		    
		  Finally
		    
		    if pid <> nil then
		      pid.Delete
		    end if
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunScriptLinux(tempFolder As FolderItem, pid As FolderItem)
		  dim script as string = kUpdaterScript
		  
		  //
		  // Get a FolderItem for the current executable
		  //
		  dim executable as FolderItem = App.ExecutableFile
		  
		  //
		  // We are going to tack the bitness onto the version
		  //
		  dim thisVersion as string = GetAppVersionForScript
		  
		  script = script.ReplaceAll( kMarkerAppName, ShellQuote( executable.Name ) )
		  script = script.ReplaceAll( kMarkerAppParent, ShellPathQuote( executable.Parent ) )
		  script = script.ReplaceAll( kMarkerAppVersion, ShellQuote( thisVersion ) )
		  script = script.ReplaceAll( kMarkerNewAppName, ShellQuote( ReplacementExecutableName ) )
		  script = script.ReplaceAll( kMarkerNewAppParent, ShellPathQuote( ReplacementAppFolder ) )
		  script = script.ReplaceAll( kMarkerTempFolder, ShellPathQuote( TempFolder ) )
		  
		  script = script.ReplaceAll( kMarkerPIDFilePath, ShellPathQuote( pid ) )
		  
		  //
		  // Get the names of the other files/folders in the replacement folder
		  //
		  dim otherFiles() as string = GetManifest( ReplacementAppFolder, ReplacementExecutableName )
		  
		  //
		  // Fill in the other array
		  //
		  if true then // Scope
		    script = script.Replace( kMarkerOtherUbound, str( otherFiles.Ubound ) )
		    
		    dim segment as string = ArrayToShellScript( otherFiles, kOtherArrayVariableName )
		    script = script.Replace( kMarkerOtherArray, segment )
		  end if
		  
		  //
		  // Prepare for saving
		  //
		  script = ReplaceLineEndings( script, EndOfLine.UNIX )
		  
		  //
		  // Save it
		  //
		  dim scriptFile as FolderItem = saveScript( script, tempFolder )
		  if scriptFile <> nil then
		    //
		    // Adjust the permissions
		    //
		    dim p as new Permissions( scriptFile.Permissions )
		    p.OwnerExecute = true
		    p.GroupExecute = true
		    p.OthersExecute = true
		    scriptFile.Permissions = p
		    
		    //
		    // Run the script
		    //
		    dim sh as new Shell
		    sh.Mode = 1 // Asynchronous
		    
		    dim cmd as string
		    cmd = "/usr/bin/nohup " + ShellQuote( scriptFile.NativePath ) + " &"
		    
		    sh.Execute( cmd )
		    dim targetTicks as integer = Ticks + 60
		    while Ticks < targetTicks
		      sh.Poll
		      App.YieldToNextThread
		    wend
		    
		  end if
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunScriptMac(tempFolder As FolderItem, pid As FolderItem)
		  dim script as string = kUpdaterScript
		  
		  //
		  // Get a FolderItem for the current app
		  //
		  dim appFolderItem as FolderItem = Kaju.TrueExecutableFile
		  
		  //
		  // Change the name of the replacment app to match
		  //
		  if ReplacementAppFolder.Name <> appFolderItem.Name then
		    ReplacementAppFolder.Name = appFolderItem.Name
		  end if
		  
		  //
		  // We are going to tack the bitness onto the version
		  //
		  dim thisVersion as string = GetAppVersionForScript
		  
		  script = script.ReplaceAll( kMarkerAppName, ShellQuote( appFolderItem.Name ) )
		  script = script.ReplaceAll( kMarkerAppParent, ShellPathQuote( appFolderItem.Parent ) )
		  script = script.ReplaceAll( kMarkerAppVersion, ShellQuote( thisVersion ) )
		  script = script.ReplaceAll( kMarkerNewAppName, ShellQuote( ReplacementAppFolder.Name ) )
		  script = script.ReplaceAll( kMarkerNewAppParent, ShellPathQuote( ReplacementAppFolder.Parent ) )
		  script = script.ReplaceAll( kMarkerTempFolder, ShellPathQuote( TempFolder ) )
		  
		  script = script.ReplaceAll( kMarkerPIDFilePath, ShellPathQuote( pid ) )
		  
		  //
		  // Prepare for saving
		  //
		  script = ReplaceLineEndings( script, EndOfLine.UNIX )
		  
		  //
		  // Save it
		  //
		  dim scriptFile as FolderItem = saveScript( script, tempFolder )
		  if scriptFile <> nil then
		    //
		    // Adjust the permissions
		    //
		    dim p as new Permissions( scriptFile.Permissions )
		    p.OwnerExecute = true
		    p.GroupExecute = true
		    p.OthersExecute = true
		    scriptFile.Permissions = p
		    
		    //
		    // Run the script
		    //
		    dim sh as new Shell
		    sh.Mode = 1 // Asynchronous
		    
		    dim cmd as string
		    cmd = "nohup " + ShellQuote( scriptFile.NativePath ) + " &"
		    
		    sh.Execute( cmd )
		    dim targetTicks as integer = Ticks + 60
		    while Ticks < targetTicks
		      sh.Poll
		      App.YieldToNextThread
		    wend
		    
		  end if
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunScriptWindows(tempFolder As FolderItem, pid As FolderItem)
		  dim script as string = kUpdaterScript
		  
		  //
		  // Get a FolderItem for the current executable
		  //
		  dim executable as FolderItem = App.ExecutableFile
		  
		  //
		  // We are going to tack the bitness onto the version
		  //
		  dim thisVersion as string = GetAppVersionForScript
		  
		  script = script.ReplaceAll( kMarkerAppName, executable.Name )
		  script = script.ReplaceAll( kMarkerAppParent, ShellPathQuote( executable.Parent ) )
		  script = script.ReplaceAll( kMarkerAppVersion, thisVersion )
		  script = script.ReplaceAll( kMarkerNewAppName, ReplacementExecutableName )
		  script = script.ReplaceAll( kMarkerNewAppParent, ShellPathQuote( ReplacementAppFolder ) )
		  script = script.ReplaceAll( kMarkerTempFolder, ShellPathQuote( TempFolder ) )
		  script = script.ReplaceAll( kMarkerDecompressedFolderPath, ShellPathQuote( ReplacementAppFolder.Parent ) )
		  script = script.ReplaceAll( kMarkerPIDFilePath, ShellPathQuote( pid ) )
		  
		  //
		  // Get the names of the other files/folders in the replacement folder
		  //
		  dim otherFiles() as string = GetManifest( ReplacementAppFolder, ReplacementExecutableName )
		  
		  //
		  // Fill in the other array
		  // Since Windows batch files don't really do array, we will pull out the section of
		  // code that serves as a template and repeat is for each file
		  //
		  dim rx as new RegEx
		  rx.SearchPattern = kMarkerWinArrayStart + "(.+)" + kMarkerWinArrayEnd
		  rx.Options.DotMatchAll = true
		  rx.Options.Greedy = false
		  
		  dim match as RegExMatch = rx.Search( script )
		  dim masterTemplate as string = match.SubExpressionString( 1 )
		  
		  dim arr() as string
		  for each file as string in otherFiles
		    dim template as string = masterTemplate
		    template = template.ReplaceAll( kMarkerWinOther, file )
		    template = template.ReplaceAll( kMarkerWinOtherWithoutSpaces, file.ReplaceAll( " ", "_" ) )
		    arr.Append template
		  next
		  dim replacement as string = join( arr, "" )
		  replacement = replacement.ReplaceAll( "\", "\\" )
		  replacement = replacement.ReplaceAll( "$", "\$" )
		  rx.ReplacementPattern = replacement
		  script = rx.Replace( script )
		  
		  //
		  // Prepare for saving
		  //
		  script = ReplaceLineEndings( script, EndOfLine.Windows )
		  
		  //
		  // Save it
		  //
		  dim scriptFile as FolderItem = SaveScript( script, tempFolder )
		  if scriptFile <> nil then
		    //
		    // Run the script
		    //
		    scriptFile.Launch
		    dim targetTicks as integer = Ticks + 60
		    while Ticks < targetTicks
		      App.YieldToNextThread
		    wend
		    
		  end if
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SaveScript(script As String, tempFolder As FolderItem) As FolderItem
		  dim scriptName as string = kScriptName
		  dim scriptFile as FolderItem = tempFolder.Child( scriptName )
		  dim bs as BinaryStream = BinaryStream.Create( scriptFile, true )
		  bs.Write( script )
		  if bs.LastErrorCode <> 0 then
		    MsgBox "Error writing script file: " + str( bs.LastErrorCode )
		    scriptFile = nil
		  end if
		  bs.Close
		  bs = nil
		  
		  return scriptFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ShellPathQuote(f As FolderItem) As String
		  #if TargetWindows then
		    const kSlash = "\"
		  #else
		    const kSlash = "/"
		  #endif
		  
		  dim s as string = f.NativePath
		  
		  dim properLen as integer = s.Len
		  while s.Mid( properLen, 1 ) = kSlash
		    properLen = properLen - 1
		  wend
		  s = s.Left( properLen )
		  
		  #if not TargetWindows then
		    s = ShellQuote( s )
		  #endif
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ShellQuote(s As String) As String
		  #if TargetWindows then
		    
		    s = """" + s + """"
		    
		  #else
		    
		    const kQuote = "'"
		    const kReplacement = "'\''"
		    
		    s = s.ReplaceAll( kQuote, kReplacement )
		    s = kQuote + s + kQuote
		    
		  #endif
		  
		  
		  return s
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ReplacementAppFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ReplacementExecutableName As String
	#tag EndProperty


	#tag Constant, Name = kMarkerAppName, Type = String, Dynamic = False, Default = \"@@APP_NAME@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerAppParent, Type = String, Dynamic = False, Default = \"@@APP_PARENT@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerAppVersion, Type = String, Dynamic = False, Default = \"@@APP_VERSION@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerDecompressedFolderPath, Type = String, Dynamic = False, Default = \"@@DECOMPRESSED_FOLDER@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerNewAppName, Type = String, Dynamic = False, Default = \"@@NEW_APP_NAME@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerNewAppParent, Type = String, Dynamic = False, Default = \"@@NEW_APP_PARENT@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerOtherArray, Type = String, Dynamic = False, Default = \"@@NEW_APP_OTHER_ARRAY@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerOtherUbound, Type = String, Dynamic = False, Default = \"@@NEW_APP_OTHER_UB@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerPIDFilePath, Type = String, Dynamic = False, Default = \"@@PID_FILE_PATH@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerTempFolder, Type = String, Dynamic = False, Default = \"@@TEMP_FOLDER@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerWinArrayEnd, Type = String, Dynamic = False, Default = \"REM END PSEUDO-ARRAY", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerWinArrayStart, Type = String, Dynamic = False, Default = \"REM BEGIN PSEUDO-ARRAY", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerWinOther, Type = String, Dynamic = False, Default = \"@@OTHER_NAME@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMarkerWinOtherWithoutSpaces, Type = String, Dynamic = False, Default = \"@@OTHER_NAME_WO_SPACES@@", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kOtherArrayVariableName, Type = String, Dynamic = False, Default = \"NEW_APP_OTHER_NAME", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kScriptName, Type = String, Dynamic = False, Default = \"kaju_updater.sh", Scope = Private
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"kaju_updater.bat"
	#tag EndConstant

	#tag Constant, Name = kUpdaterScript, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"#!/bin/bash\n\n#\n# FUNCTIONS\n#\n\nfunction log_cmd {\n  /usr/bin/logger -t \"Kaju Update Script\" $@\n}\n\n# END FUNCTIONS\n\n#\n# These will be filled in by the calling app\n#\n\nAPP_NAME\x3D@@APP_NAME@@\nAPP_PARENT\x3D@@APP_PARENT@@\nAPP_VERSION\x3D@@APP_VERSION@@\nNEW_APP_NAME\x3D@@NEW_APP_NAME@@\nNEW_APP_PARENT\x3D@@NEW_APP_PARENT@@\nTEMP_FOLDER_PATH\x3D@@TEMP_FOLDER@@\nPID_FILE\x3D@@PID_FILE_PATH@@\n\n#\n# -----------------\n#\n\nreadonly true\x3D1\nreadonly false\x3D0\n\nAPP_PATH\x3D$APP_PARENT/$APP_NAME\nNEW_APP_PATH\x3D$NEW_APP_PARENT/$NEW_APP_NAME\n\nRENAMED_APP_NAME\x3D`echo \"$APP_NAME\" | /usr/bin/sed -E s/\\.[aA][pP]{2}//`-`date +%Y%m%d%H%M%S`.app\nRENAMED_APP_PATH\x3D$APP_PARENT/$RENAMED_APP_NAME\n\nlog_cmd \"STARTING UPDATE OF $APP_NAME\"\n\ncounter\x3D10\nwhile [ -f \"$PID_FILE\" ]\ndo\n  log_cmd \"Checking to see if $PIDFILE exists\x2C $counter\"\n  sleep 1\n  \n  let counter\x3Dcounter-1\n  \n  if [ $counter \x3D\x3D 0 ]\n  then\n  \tlog_cmd \'ERROR: Could not update app\x2C it never quit\'\n  \texit 1\n  fi\ndone\n\nPROCEED\x3D$true\n\n#\n# Rename the old application\n#\nlog_cmd \"Renaming old application $APP_NAME to $RENAMED_APP_NAME\"\nmv \"$APP_PATH\" \"$RENAMED_APP_PATH\"\n\n#\n# Make sure that succeeded\n#\nif [ $\? \x3D\x3D 0 ]\nthen\n  log_cmd \'...confirmed\'\nelse\n  log_cmd \"Could not rename old application to $RENAMED_APP_PATH\"\n  PROCEED\x3D0\nfi\n\n#\n# Move in the replacement app\n#\nif [ $PROCEED \x3D\x3D $true ]\nthen\n  log_cmd \"Moving new application $NEW_APP_PATH to folder $APP_PARENT\"\n  mv \"$NEW_APP_PATH\" \"$APP_PARENT\"\n\n  #\n  # Make sure that worked\n  #\n  if [ $\? \x3D\x3D 0 ]\n  then\n    log_cmd \'...confirmed\'\n  else\n    log_cmd \"Could not move in new application\"\n    log_cmd \"Attempting to restore old application and launch it\"\n    mv \"$RENAMED_APP_PATH\" \"$APP_PATH\"\n    open \"$APP_PATH\" --args --kaju-fail\n    PROCEED\x3D$false\n  fi\nfi\n\nif [ $PROCEED \x3D\x3D $true ]\nthen\n  log_cmd \"Removing old application $RENAMED_APP_NAME\"\n  rm -fr \"$RENAMED_APP_PATH\"\n  \n  APP_PATH\x3D$APP_PARENT/$NEW_APP_NAME\n  log_cmd \"Starting new application at $APP_PATH\"\n  \n  open \"$APP_PATH\" --args --kaju-success \"$APP_VERSION\"\nfi\n\nif [ $PROCEED \x3D\x3D $true ]\nthen\n  log_cmd \'Removing temp folder\'\n  rm -fr \"$TEMP_FOLDER_PATH\"\nfi\n"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"#!/bin/bash\n\n#\n# FUNCTIONS\n#\n\nfunction log_cmd {\n\t/usr/bin/logger -t \"Kaju Update Script\" $@\n}\n\n# END FUNCTIONS\n\n#\n# These will be filled in by the calling app\n#\n\nAPP_NAME\x3D@@APP_NAME@@\nAPP_PARENT\x3D@@APP_PARENT@@\nAPP_VERSION\x3D@@APP_VERSION@@\nNEW_APP_NAME\x3D@@NEW_APP_NAME@@\nNEW_APP_PARENT\x3D@@NEW_APP_PARENT@@\nTEMP_FOLDER_PATH\x3D@@TEMP_FOLDER@@\nPID_FILE\x3D@@PID_FILE_PATH@@\n\n#\n# This array will store the names of the items next to the executable\n# under the variable NEW_APP_OTHER_NAME\n#\nNEW_APP_OTHER_UB\x3D@@NEW_APP_OTHER_UB@@\n\n@@NEW_APP_OTHER_ARRAY@@\n\n#\n# -----------------\n#\n\nreadonly true\x3D1\nreadonly false\x3D0\n\nAPP_PATH\x3D$APP_PARENT/$APP_NAME\n\nBACKUP_PARENT\x3D$APP_PARENT/${APP_NAME}-`date +%Y%m%d%H%M%S`\nmkdir \"$BACKUP_PARENT\"\n\nlog_cmd \"STARTING UPDATE OF $APP_NAME\"\n\ncounter\x3D10\nwhile [ -f \"$PID_FILE\" ]\ndo\n\tlog_cmd  \"Checking to see if $PIDFILE exists\x2C $counter\"\n\tsleep 1\n\t\n\tlet counter\x3Dcounter-1\n\t\n\tif [ $counter \x3D\x3D 0 ]\n\tthen\n\t\tlog_cmd  \'ERROR: Could not update app\x2C it never quit\'\n\t\texit 1\n\tfi\ndone\n\nPROCEED\x3D$true\n\n#\n# Move the other items\n#\nlog_cmd \"Copying other items to backup $BACKUP_PARENT\"\n\ncounter\x3D0\nwhile [ $counter -le $NEW_APP_OTHER_UB ]\ndo\n\tthis_item\x3D${NEW_APP_OTHER_NAME[$counter]}\n\tlog_cmd \"Looking for item $this_item in $APP_PARENT\"\n\t\n\tthis_path\x3D$APP_PARENT/$this_item\n\tif [ -d \"$this_path\" ] || [ -f \"$this_path\" ]\n\tthen\n\t\tlog_cmd \"...found\x2C copying\"\n\t\tcp -pr \"$this_path\" \"$BACKUP_PARENT\"\n\t\tif [ $\? \x3D\x3D 0 ]\n\t\tthen\n\t\t\tlog_cmd \"...confirmed\"\n\t\telse\n\t\t\t log_cmd \"...FAILED!\"\n\t\t\t PROCEED\x3D$false\n\t\t\t break\n\t\tfi\n\tfi\n\t(( counter++ ))\ndone\n\n#\n# Move the executable\n#\nif [ $PROCEED \x3D\x3D $true ]\nthen\n\tlog_cmd \"Moving the executable $APP_NAME to backup\"\n\tmv \"$APP_PARENT/$APP_NAME\" \"$BACKUP_PARENT\"\n\tif [ $\? \x3D\x3D 0 ]\n\tthen\n\t\tlog_cmd \"...confirmed\"\n\telse\n\t\tlog_cmd \"...FAILED! (Error $\?)\"\n\t\tPROCEED\x3D$false\n\tfi\nfi\n\n#\n# Make sure there wasn\'t an error during the backup\n#\nif [ $PROCEED \x3D\x3D $true ]\nthen\n\tlog_cmd \'All items backed up\'\nelse\n\tlog_cmd \'Attempting to copy items back to parent\'\n\trsync -a --exclude\x3D\'.DS_Store\' \"${BACKUP_PARENT}/\" \"$APP_PARENT\"\nfi\n\n#\n# Move in the replacement files\n#\nif [ $PROCEED \x3D\x3D $true ]\nthen\n\tlog_cmd  \"Copying files from $NEW_APP_PARENT to folder $APP_PARENT\"\n\trsync -a --exclude\x3D\'.DS_Store\' \"${NEW_APP_PARENT}/\" \"$APP_PARENT\"\n\t\n\tif [ $\? \x3D\x3D 0 ]\n\tthen\n\t\tlog_cmd  \'...confirmed\'\n\telse\n\t\tlog_cmd  \"...FAILED! (Error $\?)\"\n\t\tlog_cmd  \"Attempting to restore old application\"\n\t\trsync -a --exclude\x3D\'.DS_Store\' \"${BACKUP_PARENT}/\" \"$APP_PARENT\"\n\t\tPROCEED\x3D$false\n\t\tbreak\n\tfi\nfi\n\n#\n# Removed the backup folder if everything has gone swimmingly so\n#\nif [ $PROCEED \x3D\x3D $true ]\nthen\n\tlog_cmd \'Removing backup\'\n\trm -r \"$BACKUP_PARENT\"\nfi\n\n#\n# Launch the application\n#\nif [ $PROCEED \x3D $true ]\nthen\n\tlog_cmd \'Making the new app executable\'\n\tchmod +x \"$APP_PARENT/$NEW_APP_NAME\"\n\tlog_cmd \'Launching new app\'\n\t\"$APP_PARENT/$NEW_APP_NAME\" --kaju-success \"$APP_VERSION\"\nelse\n\tlog_cmd \'Launching old app\'\n\t\"$APP_PARENT/$APP_NAME\" --kaju-fail\nfi\n\nlog_cmd  \'Removing temp folder\'\nrm -fr \"$TEMP_FOLDER_PATH\"\n"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"@ECHO OFF \n\nREM\nREM These will be filled in by the calling app\nREM\n\nSET APP_NAME\x3D@@APP_NAME@@\nSET APP_PARENT\x3D@@APP_PARENT@@\nSET APP_VERSION\x3D@@APP_VERSION@@\nSET NEW_APP_NAME\x3D@@NEW_APP_NAME@@\nSET NEW_APP_PARENT\x3D@@NEW_APP_PARENT@@\nSET TEMP_FOLDER_PATH\x3D@@TEMP_FOLDER@@\nSET DECOMPRESSED_FOLDER_PATH\x3D@@DECOMPRESSED_FOLDER@@\nSET PID_FILE\x3D@@PID_FILE_PATH@@\n\nREM\nREM -----------------\nREM\n\nSET TODAY_DATE\x3D%DATE:~10\x2C4%-%DATE:~4\x2C2%-%DATE:~7\x2C2% %TIME:~0\x2C2%:%TIME:~3\x2C2%:%TIME:~6\x2C2%\nSET APP_PATH\x3D%APP_PARENT%\\%APP_NAME%\n\nSET BACKUP_PARENT\x3D%APP_PATH%-%DATE:~10\x2C4%%DATE:~4\x2C2%%DATE:~7\x2C2%%TIME:~0\x2C2%%TIME:~3\x2C2%%TIME:~6\x2C2%\n\nSET LOGGER\x3D%APP_PARENT%\\%NEW_APP_NAME% Update Log.txt\nECHO \"STARTED ON %TODAY_DATE%\" >> \"%LOGGER%\" 2>&1\n\nFOR /L %%i IN (1\x2C1\x2C10) DO (\n\tIF NOT EXIST \"%PID_FILE%\" (\n\t\tGOTO :program_exited\n\t)\n\n\tREM Windows version of sleep 1. Starting in Windows Vista\x2C the sleep command was removed.\n\tping -n 2 127.0.0.1 >nul\n\n\tIF %%i \x3D\x3D 10 (\n\t\tECHO ERROR: Could not update app\x2C it never quit >> \"%LOGGER%\" 2>&1\n\t\tEXIT /B 1\n\t)\n)\n:program_exited\n\nmkdir \"%BACKUP_PARENT%\"\n\nSET PROCEED\x3D1\n\nREM\nREM Move the other items\nREM\nECHO \"Copying items to backup %BACKUP_PARENT%\" >> \"%LOGGER%\" 2>&1\n\nREM We will need to manually populate these move commands. Windows Batch doesn\'t really handle arrays\x2C\nREM only looping through space delimited elements of a string. Below is a template for moving one such file.\n\nREM BEGIN PSEUDO-ARRAY\nSET THIS_ITEM\x3D@@OTHER_NAME@@\nSET THIS_PATH\x3D%APP_PARENT%\\%THIS_ITEM%\nECHO \"Looking for item %THIS_PATH%\" >> \"%LOGGER%\" 2>&1\nIF EXIST \"%THIS_PATH%\" (\n\tGOTO :copy_@@OTHER_NAME_WO_SPACES@@\n)\nECHO \"...not found as file\x2C trying as directory\" >> \"%LOGGER%\" 2>&1\nIF EXIST \"%THIS_PATH%\\NUL\" (\n\tGOTO :copy_@@OTHER_NAME_WO_SPACES@@\n) ELSE (\n\tECHO \"...NOT FOUND!\" >> \"%LOGGER%\" 2>&1\n\tGOTO :finished_with_@@OTHER_NAME_WO_SPACES@@\n)\n\n:copy_@@OTHER_NAME_WO_SPACES@@\n\nECHO \"...found\x2C copying\" >> \"%LOGGER%\" 2>&1\nCOPY \"%THIS_PATH%\" \"%BACKUP_PARENT%\" >> \"%LOGGER%\" 2>&1\nIF %ERRORLEVEL% NEQ 0 (\n\tECHO \"...FAILED! (Error %ERRORLEVEL%)\" >> \"%LOGGER%\" 2>&1\n\tSET PROCEED\x3D0\n\tGOTO :restore_from_backup\n) ELSE (\n\tECHO \"...confirmed\" >> \"%LOGGER%\" 2>&1\n)\n\n:finished_with_@@OTHER_NAME_WO_SPACES@@\n\nREM END PSEUDO-ARRAY\n\nREM\nREM Move the executable to backup\nREM\nIF %PROCEED% \x3D\x3D 1 (\n\tECHO \"Moving the executable %APP_NAME% to backup\" >> \"%LOGGER%\" 2>&1\n\tMOVE \"%APP_PATH%\" \"%BACKUP_PARENT%\" >> \"%LOGGER%\" 2>&1\n\tIF %ERRORLEVEL% NEQ 0 (\n\t\tECHO \"...FAILED! (Error %ERRORLEVEL%)\" >> \"%LOGGER%\" 2>&1\n\t\tSET PROCEED\x3D0\n\t\tGOTO :restore_from_backup\n\t) ELSE (\n\t\tECHO \"...confirmed\" >> \"%LOGGER%\" 2>&1\n\t)\n)\n\nREM\nREM Make sure there wasn\'t an error during the move\nREM\nIF %PROCEED% \x3D\x3D 1 (\n\tECHO \"All items moved to backup\" >> \"%LOGGER%\" 2>&1\n)\n\nREM\nREM Copy in the replacement files\nREM\n\nIF %PROCEED% \x3D\x3D 1 (\n\tECHO \"Copying files from %NEW_APP_PARENT% to folder %APP_PARENT%\" >> \"%LOGGER%\" 2>&1\n\tXCOPY /g /y /e /k \"%NEW_APP_PARENT%\" \"%APP_PARENT%\" >> \"%LOGGER%\" 2>&1\n\tIF %ERRORLEVEL% NEQ 0 (\n\t\tECHO \"...FAILED! (Error %ERRORLEVEL%)\" >> \"%LOGGER%\" 2>&1\n\t\tSET PROCEED\x3D0\n\t\tGOTO :restore_from_backup\n\t) ELSE (\n\t\tECHO \"...confirmed\" >> \"%LOGGER%\" 2>&1\n\t)\n)\n\nREM\nREM If we get here\x2C it all worked\nREM\nIF %PROCEED% \x3D\x3D 1 (\n\tGOTO :all_succeeded\n)\n\n:restore_from_backup\nIF %PROCEED% \x3D\x3D 0 (\n\tECHO  \"Attempting to restore old application\" >> \"%LOGGER%\" 2>&1\n\n\tXCOPY /g /y /e /k \"%BACKUP_PARENT%\" \"%APP_PARENT%\" >> \"%LOGGER%\" 2>&1\n\tIF %ERRORLEVEL% EQU 0 (\n\t\tRMDIR /S /Q \"%BACKUP_PARENT%\" >> \"%LOGGER%\" 2>&1\n\t)\n)\nGOTO :launch_application\n\n:all_succeeded\nREM\nREM Remove the backup and decompressed folders if everything has gone swimmingly so far\nREM\nIF %PROCEED% \x3D\x3D 1 (\n\tECHO \"Removing backup\" >> \"%LOGGER%\" 2>&1\n\tRMDIR /S /Q \"%BACKUP_PARENT%\" >> \"%LOGGER%\" 2>&1\n\tECHO \"Removing decompressed folder\" >> \"%LOGGER%\" 2>&1\n\tRMDIR /S /Q \"%DECOMPRESSED_FOLDER_PATH%\" >> \"%LOGGER%\" 2>&1\n)\n\nREM\nREM Launch the application\nREM\n:launch_application\nIF %PROCEED% \x3D\x3D 1 (\n\tECHO \"Launching new app\" >> \"%LOGGER%\" 2>&1\n\tSTART \"\" \"%APP_PARENT%\\%NEW_APP_NAME%\" --kaju-success %APP_VERSION%\n\tGOTO :remove_backup_folder\n) ELSE (\n\tECHO \"Launching old app\" >> \"%LOGGER%\" 2>&1\n\tSTART \"\" \"%APP_PATH%\" --kaju-fail\n)\n\n:remove_backup_folder\nECHO \"Removing temp folder\" >> \"%LOGGER%\" 2>&1\nRMDIR /S /Q \"%TEMP_FOLDER_PATH%\" >> \"%LOGGER%\" 2>&1\n"
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
			Name="ReplacementExecutableName"
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
	#tag EndViewBehavior
End Class
#tag EndClass

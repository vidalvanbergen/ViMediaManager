#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  Preferences.WriteDefaults
		  
		  If SpecialFolder.Temporary.Child( App.Identifier ).Exists Then SpecialFolder.Temporary.Child( App.Identifier ).Delete
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  App.DebugMode = Keyboard.AsyncAltKey
		  
		  HelpAbout.Text = Menu.HelpAbout + " " + App.kAppName
		  
		  Preferences.LoadDefaults
		  
		  'Growl.Register // Register growl
		  'nc.Register // Register Notification Center
		  
		  'VersionCurrent = App.ShortVersion.ReplaceAll("v", "Version ")
		  VersionCurrent = str( App.MajorVersion ) + "." + str( App.MinorVersion )
		  If App.BugVersion > 0 Then VersionCurrent = VersionCurrent + "." + str( App.BugVersion )
		  If App.StageCode = 2  Then VersionCurrent = VersionCurrent + "β" + str( App.NonReleaseVersion )
		  If App.StageCode = 1  Then VersionCurrent = VersionCurrent + "α" + str( App.NonReleaseVersion )
		  '#If TargetCocoa Then VersionCurrent = VersionCurrent + "c"
		  '#If TargetCarbon Then VersionCurrent = VersionCurrent + "i"
		  'If Experimental Then VersionCurrent = VersionCurrent + Chr(13) + "Nightly"
		  
		  
		  '#If DebugBuild then
		  ''InitializeSparkle("http://localhost/~Vidal/appcast-alpha.xml") // Local testing
		  'InitializeSparkle("https://raw.githubusercontent.com/vidalvanbergen/ViMediaManager/gh-pages/appcast-cocoa.xml") // Official Cocoa AppCast
		  '#ElseIf TargetCocoa Then
		  'InitializeSparkle("https://raw.githubusercontent.com/vidalvanbergen/ViMediaManager/gh-pages/appcast-cocoa.xml") // Official Cocoa AppCast
		  '#ElseIf TargetCarbon Then
		  'InitializeSparkle("https://raw.githubusercontent.com/vidalvanbergen/ViMediaManager/gh-pages/appcast-intel.xml") // Official Intel AppCast
		  '#Else
		  'InitializeSparkle("https://raw.githubusercontent.com/vidalvanbergen/ViMediaManager/gh-pages/appcast-alpha.xml")
		  '#EndIf
		  
		  If NOT SpecialFolder.Temporary.Child( App.Identifier ).Exists Then SpecialFolder.Temporary.Child( App.Identifier ).CreateAsFolder
		  
		  AppSettings.InitializeKaju
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  dlgProgress.Close
		  
		  'Dim w as New wndBugReporter
		  'w.Init( error, "Unknown (caught at app level)" + chr(13) + ErrorMessage )
		  Return AppSettings.HandleError( error, "Unknown (caught at app level)" )
		  
		  Return True
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function EditPreferences() As Boolean Handles EditPreferences.Action
			wndPreferences.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileQuit() As Boolean Handles FileQuit.Action
			Quit
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			wndAbout.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpCheckforUpdates() As Boolean Handles HelpCheckforUpdates.Action
			AppSettings.CheckForUpdates
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpContactAuthor() As Boolean Handles HelpContactAuthor.Action
			ShowURL "mailto:vimediamanager@gmail.com?subject=ViMediaManager Contact Author"
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpDonate() As Boolean Handles HelpDonate.Action
			ShowURL DonationURL
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpDownloadStudioLogosets() As Boolean Handles HelpDownloadStudioLogosets.Action
			MsgBox Loc.kInstructions + chr(13) + chr(13) + kLogoPackInstructions
			
			ShowURL ( "http://forum.xbmc.org/showthread.php?t=100652" )
			ShowURL ( "http://forum.xbmc.org/showthread.php?t=99554"  )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpRequest() As Boolean Handles HelpRequest.Action
			
			Dim Experiment as String
			If Experimental Then Experiment = " Nightly"
			
			ShowURL "mailto:vimediamanager@gmail.com?subject=ViMediaManager Request Help (v" + VersionCurrent + Experiment + ")"
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpSuggestion() As Boolean Handles HelpSuggestion.Action
			
			Dim Experiment as String
			If Experimental Then Experiment = " Nightly"
			
			ShowURL "mailto:vimediamanager@gmail.com?subject=ViMediaManager Suggestion (v" + VersionCurrent + Experiment + ")"
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpVisitKodiForumThread() As Boolean Handles HelpVisitKodiForumThread.Action
			ShowURL XBMCForumURL
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpVisitWebsite() As Boolean Handles HelpVisitWebsite.Action
			ShowURL AppSettings.kWebsiteURL
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowBringAlltoFront() As Boolean Handles WindowBringAlltoFront.Action
			For i as Integer = WindowCount - 1 DownTo 0
			Window( WindowCount - 1 ).Show
			Next
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Function HandleSparkleCancelQuit() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSparkleFoundVersion(isNew as Boolean, version as String)
		  Dim Major, Minor, Bug, Stage, NonRelease As Integer = 0
		  Dim VersionPart() as String = Version.Split(".")
		  
		  If VersionPart.Ubound = -1 then Return
		  
		  Major = Val( VersionPart(0) )
		  If VersionPart.Ubound >= 1 then Minor      = Val( VersionPart(1) )
		  If VersionPart.Ubound >= 2 then Bug        = Val( VersionPart(2) )
		  If VersionPart.Ubound >= 3 then Stage      = Val( VersionPart(3) )
		  If VersionPart.Ubound >= 4 then NonRelease = Val( VersionPart(4) )
		  
		  VersionNew = str( Major ) + "." + str( Minor )
		  If Bug > 0   then VersionNew = VersionNew + "." + str( Bug )
		  If Stage = 2 Then VersionNew = VersionNew + "β" + str( NonRelease )
		  If Stage = 1 Then VersionNew = VersionNew + "α" + str( NonRelease )
		  
		  VersionNew = Version
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitializeSparkle(FeedURL as String)
		  'Dim SparkleFramework as FolderItem = App.ApplicationBundle.Child("Contents").Child("Frameworks").Child("Sparkle.framework")
		  '
		  'if NOT SUUpdaterMBS.LoadFramework( SparkleFramework ) then
		  'Log "Failed to load sparkle framework", 2
		  'Return // Exit
		  'end if
		  '
		  'Sparkle = New SUUpdaterMBS
		  'Sparkle.feedURL = FeedURL
		  '
		  'dim d as Date = Sparkle.lastUpdateCheckDate
		  'if d = Nil then
		  'Sparkle.automaticallyChecksForUpdates = True
		  'end if
		  '
		  'if Sparkle.automaticallyChecksForUpdates then
		  'Sparkle.checkForUpdatesInBackground
		  'end if
		  
		  'Exception err as NSExceptionMBS
		  'Log "Sparkle Update Failed, " + err.Message, 2
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DebugMode As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorMessage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Experimental As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ScalingFactor As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		VersionCurrent As String
	#tag EndProperty

	#tag Property, Flags = &h0
		VersionNew As String
	#tag EndProperty


	#tag Constant, Name = Category, Type = String, Dynamic = False, Default = \"Video", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DonationURL, Type = String, Dynamic = False, Default = \"https://www.paypal.com/cgi-bin/webscr\?cmd\x3D_donations&business\x3Dvidal%2evanbergen%40gmail%2ecom&lc\x3DGB&item_name\x3DSupport%20ViMediaManager%20development&currency_code\x3DEUR&bn\x3DPP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Identifier, Type = String, Dynamic = False, Default = \"com.vidalvanbergen.vimediamanager-alpha", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppName, Type = String, Dynamic = False, Default = \"ViMediaManager", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = True, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Beenden"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"&Avsluta"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quitter"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kLogoPackInstructions, Type = String, Dynamic = True, Default = \"Once you\'ve downloaded the logo\'s pack\x2C put the pictures inside a folder named \"Studios\" in the same location as ViMediaManager or in the following path: \"~/Library/Application Support/ViMediaManager/Studios/\".", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Once you\'ve downloaded the logo\'s pack\x2C put the pictures inside a folder named \"Studios\" in the same location as ViMediaManager or in the following path: \"~/Library/Application Support/ViMediaManager/Studios/\"."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wanneer je de studio logo\'s gedownload hebt\x2C plaats de afbeeldingen in een map genaamd \"Studios\" in de zelfde map als ViMediaManager\x2C of in de volgende locatie: \"~/Library/Application Support/ViMediaManager/Studios/\"."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"N\xC3\xA4r du har laddat ned logopaketet\x2C placera det i en mapp med namnet \"Studios\" p\xC3\xA5 samma plats som ViMediaManager (normal s\xC3\xB6kv\xC3\xA4g \xC3\xA4r \"~/Library/Application Support/ViMediaManager/Studios/\")."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wenn das Logo-Pack heruntergeladen wurde\x2C dann kopiere es in einen Ordner und benenne diesen \'Studios\'. Kopiere diesen in das Verzeichnis in dem der ViMediaManager liegt. Alternativ in folgenden Pfad \'~/Library/Application Support/ViMediaManager/Studios/\'."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quand vous aurez t\xC3\xA9l\xC3\xA9charg\xC3\xA9 le pack de logos\x2C placez les images \xC3\xA0 l\'int\xC3\xA9rieur d\'un dossier nomm\xC3\xA9 \"Studios\" au m\xC3\xAAme endroit que l\'application ViMediaManager ou dans le r\xC3\xA9pertoire \"~/Library/Application Support/ViMediaManager/Studios/\"."
	#tag EndConstant

	#tag Constant, Name = XBMCForumURL, Type = String, Dynamic = False, Default = \"http://forum.xbmc.org/showthread.php\?p\x3D886768", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugMode"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Experimental"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScalingFactor"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VersionCurrent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VersionNew"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

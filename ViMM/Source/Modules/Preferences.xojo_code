#tag Module
Protected Module Preferences
	#tag Method, Flags = &h0
		Sub AppSupport()
		  fAppSupport = SpecialFolder.ApplicationData.Child( app.kAppName )
		  If fAppSupport = Nil or NOT fAppSupport.Exists then fAppSupport.CreateAsFolder
		  fAppSupport.Child("Cache").CreateAsFolder
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDefaults()
		  // DO NOT DELETE:
		  Prefs = new TTsSmartPreferences(App.kAppName)'NSUserDefaultsMBS.standardUserDefaults
		  'Preferences.Prefs.setBoolValue "AppleMagnifiedMode", False // Enable retina support as soon as possible!
		  
		  // Main window and element sizing, load application support.
		  Dim i as integer
		  Dim t() as String
		  AppSupport()
		  
		  'If wndMain.Visible = False Then Return
		  
		  wndMain.FullScreenAllowed = True
		  Preferences.LoadWindowPos( wndMain, "wndMain" )
		  'If Preferences.Prefs.boolForKey("ExitFullScreen") Then wndMain.ToggleFullScreen
		  
		  'LoadWindowPos( wndMain, "NSWindow Main Size" )
		  
		  // Sidebar Widths ------------------------------------------
		  If Preferences.Prefs.integerForKey("NSMoviesSidebarWidth") > 0 then
		    i = Preferences.Prefs.integerForKey("NSMoviesSidebarWidth")
		    wndMain.lstMovies.Width = i
		    wndMain.ActBar(0).Width = i
		    'wndMain.cvsMovies.Left  = i - 1
		    wndMain.cvsMovieDetails.Left = i - 1
		    wndMain.ccSearchBoxMovies.Width = i - 1
		    
		    #If TargetCocoa Then
		      wndMain.pthsMovie.Left = i - 1
		      wndMain.pthsMovie.Width = wndMain.Width - wndMain.ActBar(0).Width + 1
		    #endif
		    
		    If ( DebugBuild OR App.Experimental ) And ActiveSection = 0 And wndMain.lstSearch.Left > 0 Then
		      'wndMain.lstSearch.Left = i - 2
		      'wndMain.lstSearch.Width = wndMain.Width - i + 3
		    End If
		    
		    // wndMain.cvsMovies.Width = 780 - i + 1 // Window default width - actbar width + negative actbar left
		  End If
		  'wndMain.cvsMovies.Width = wndMain.Width - wndMain.ActBar(0).Width + 1
		  wndMain.cvsMovieDetails.Width = wndMain.Width - wndMain.ActBar(0).Width + 1
		  
		  
		  
		  
		  If Preferences.Prefs.integerForKey("NSTVShowsSidebarWidth") > 0 then
		    i = Preferences.Prefs.integerForKey("NSTVShowsSidebarWidth")
		    
		    wndMain.lstTVShows.Width = i
		    wndMain.ActBar(1).Width  = i
		    
		    wndMain.cvsTVShowDetails.Left    = i - 1
		    wndMain.ccSearchBoxTVShows.Width = i -1
		    
		    #If TargetCocoa Then
		      wndMain.PthsTVShows.Left = i - 1
		      wndMain.PthsTVShows.Width = wndMain.Width - wndMain.ActBar(0).Width + 1
		    #endif
		    
		    
		    If ( DebugBuild OR App.Experimental ) And ActiveSection = 1 And wndMain.lstSearch.Left > 0 Then
		      'wndMain.lstSearch.Left = i - 2
		      'wndMain.lstSearch.Width = wndMain.Width - i + 3
		    End If
		  End If
		  wndMain.cvsTVShowDetails.Width = wndMain.Width - wndMain.ActBar(1).Width + 1
		  
		  
		  
		  If Preferences.Prefs.integerForKey("NSAnimeSidebarWidth") > 0 then
		    ' me.Width
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadWindowPos(w As Window, name as String)
		  If Name <> "" And Preferences.Prefs.stringForKey( name ) <> "" Then
		    
		    Dim t() as String = Preferences.Prefs.stringForKey( name ).Split(" ")
		    w.Left   = val( t(0) )
		    w.Top    = val( t(1) )
		    w.Width  = val( t(2) )
		    w.Height = val( t(3) )
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveWindowPos(w as Window, name as String)
		  If Name <> "" Then Preferences.Prefs.setStringValue name, str( w.Left ) + " " + str( w.Top ) + " " + str( w.Width ) + " " + str( w.Height )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFirstStartPrefs()
		  Preferences.Prefs.setStringValue("DBLanguage"), SystemLanguage
		  Preferences.Prefs.boolForKey("MainToolbarVisible") = True
		  
		  // Auto downloads
		  Preferences.Prefs.boolForKey("AutoDownloadPoster")       = True
		  Preferences.Prefs.boolForKey("AutoDownloadBackdrop")     = True
		  Preferences.Prefs.boolForKey("AutoDownloadBanner")       = True
		  
		  Preferences.Prefs.boolForKey("AutoDownloadExtraThumbs")  = True
		  Preferences.Prefs.boolForKey("AutoDownloadExtraFanart")  = True
		  Preferences.Prefs.boolForKey("AutoDownloadSeasonArt")    = True
		  
		  Preferences.Prefs.boolForKey("AutoDownloadClearArt")     = True
		  Preferences.Prefs.boolForKey("AutoDownloadCharacterArt") = True
		  Preferences.Prefs.boolForKey("AutoDownloadLogo")         = True
		  Preferences.Prefs.boolForKey("AutoDownloadThumb")        = True
		  Preferences.Prefs.boolForKey("AutoDownloadDiscArt")      = True
		  
		  Preferences.Prefs.boolForKey("AutoDownloadEpisodeThumb") = True
		  
		  Preferences.Prefs.boolForKey("AutoDownloadThemesong")    = True
		  Preferences.Prefs.boolForKey("AutoDownloadTrailer")      = False
		  
		  Preferences.Prefs.boolForKey("AutoDownloadActorThumbs")  = False
		  
		  // --------
		  
		  // Mini List icons
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Poster" )         = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Backdrop" )       = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Banner" )         = True
		  
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-ExtraThumbs" )    = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-ExtraFanart" )    = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-SeasonArt" )      = True
		  
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-ClearArt" )       = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-CharacterArt" )   = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Logo" )           = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Thumb" )          = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-DiscArt" )        = True
		  
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Trailer" )        = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Themesong" )      = True
		  
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Subtitles" )      = True
		  Preferences.Prefs.boolForKey( "ShowMiniIcon-Resolution" )     = True
		  
		  // --------
		  
		  // Get recommendations
		  Preferences.Prefs.boolForKey("GetRecommendations") = True
		  
		  // Use folder name foor look-up
		  Preferences.Prefs.boolForKey("UseFolderNameForLookUp")   = True
		  
		  // Match Finder Labels
		  Preferences.Prefs.boolForKey("MatchFinderLabelsToTVStatus")    = False
		  Preferences.Prefs.boolForKey("MatchFinderLabelsToAnimeStatus") = False
		  
		  // Anime Genre Weight
		  If Preferences.Prefs.integerForKey("AnimeGenreWeight") <= 0 Then Preferences.Prefs.setIntegerValue "AnimeGenreWeight", 200
		  
		  // Extra Art Size
		  If Preferences.Prefs.stringForKey( "PosterSize" ) = "" Then Preferences.Prefs.setStringValue( "PosterSize", "original" )
		  If Preferences.Prefs.stringForKey( "FanartSize" ) = "" Then Preferences.Prefs.setStringValue( "FanartSize", "original" )
		  
		  // Extra Thumbs/Fanart Maximum downloads
		  If Preferences.Prefs.integerForKey("MaxThumbs")    <= 0 Then Preferences.Prefs.setIntegerValue "MaxThumbs",    4
		  If Preferences.Prefs.integerForKey("MaxBackdrops") <= 0 Then Preferences.Prefs.setIntegerValue "MaxBackdrops", 4
		  If Preferences.Prefs.integerForKey("MaxActors")    <= 0 Then Preferences.Prefs.setIntegerValue "MaxActors",    20
		  
		  // Auto Rename
		  Preferences.Prefs.boolForKey("TargetNOTMacOS") = True
		  Preferences.Prefs.boolForKey("AutoManageMedia") = False
		  
		  // --------
		  
		  'If Preferences.Prefs.integerForKey("SortBy")       <=  0 then Preferences.Prefs.integerForKey("SortBy")       =  0
		  Preferences.Prefs.boolForKey( "SortMovieAscending" ) = False
		  Preferences.Prefs.boolForKey( "SortTVAscending" )    = False
		  Preferences.Prefs.boolForKey( "SortAnimeAscending" ) = False
		  
		  // Set default trailer download source/quality
		  If Preferences.Prefs.stringForKey("TrailerSource")  = "" Then Preferences.Prefs.setStringValue "TrailerSource",  "apple.com"
		  If Preferences.Prefs.stringForKey("TrailerQuality") = "" Then Preferences.Prefs.setStringValue "TrailerQuality", "480p"
		  
		  
		  If Preferences.Prefs.integerForKey("MovieListSize") <= 0 Then Preferences.Prefs.integerForKey("MovieListSize") = 2
		  If Preferences.Prefs.integerForKey("SortByMovie")  <=  0 then Preferences.Prefs.integerForKey("SortByMovie")  =  0
		  If Preferences.Prefs.integerForKey("SortByTV")     <=  0 then Preferences.Prefs.integerForKey("SortByTV")     =  0
		  
		  If Preferences.Prefs.integerForKey("TimeOut")      <=  0 then Preferences.Prefs.integerForKey("TimeOut")      = 30
		  If Preferences.Prefs.integerForKey("BatchRename")  <=  0 then Preferences.Prefs.integerForKey("BatchRename")  =  0
		  If Preferences.Prefs.integerForKey( "PreviewThumbSize" ) <= 0 then Preferences.Prefs.integerForKey( "PreviewThumbSize" ) = 128
		  If Preferences.Prefs.integerForKey("KeepImages")   <=  0 Then Preferences.Prefs.integerForKey("KeepImages") = 0
		  
		  // Use Folder.jpg for file
		  If Preferences.Prefs.stringForKey("FolderJPGForFileTV")    = "" then Preferences.Prefs.setStringValue "FolderJPGForFileTV",    Loc.None
		  If Preferences.Prefs.stringForKey("FolderJPGForFileAnime") = "" then Preferences.Prefs.setStringValue "FolderJPGForFileAnime", Loc.None
		  
		  // Default Thumbs
		  If Preferences.Prefs.stringForKey("DefaultThumbTV")    = ""   then Preferences.Prefs.setStringValue "DefaultThumbTV",    "Poster"
		  If Preferences.Prefs.stringForKey("DefaultThumbAnime") = ""   then Preferences.Prefs.setStringValue "DefaultThumbAnime", "Poster"
		  
		  // Renaming Patterns
		  If Preferences.Prefs.stringForKey("RenameStringMovies")      = "" then Preferences.Prefs.setStringValue "RenameStringMovies",      "$S ($Y)"
		  If Preferences.Prefs.stringForKey("RenameStringMovieFiles")  = "" then Preferences.Prefs.setStringValue "RenameStringMovieFiles",  "$T ($Y)"
		  
		  If Preferences.Prefs.stringForKey("RenameStringTVShows")  = "" then Preferences.Prefs.setStringValue "RenameStringTVShows",  "$S"
		  If Preferences.Prefs.stringForKey("RenameStringEpisodes") = "" then Preferences.Prefs.setStringValue "RenameStringEpisodes", "$N S$0SE$0E - $T"
		  
		  If Preferences.Prefs.stringForKey("RenameStringAnime")         = "" then Preferences.Prefs.setStringValue "RenameStringAnime",   "$T"
		  
		  // File Names
		  If Preferences.Prefs.stringForKey("FileNamePoster")  = "" then Preferences.Prefs.setStringValue "FileNamePoster",  "<movie>-poster.jpg"
		  If Preferences.Prefs.stringForKey("FileNameFanart")  = "" then Preferences.Prefs.setStringValue "FileNameFanart",  "<movie>-fanart.jpg"
		  If Preferences.Prefs.stringForKey("FileNameBanner")  = "" then Preferences.Prefs.setStringValue "FileNameBanner",  "<movie>-banner.jpg"
		  If Preferences.Prefs.stringForKey("FileNameNFO")     = "" then Preferences.Prefs.setStringValue "FileNameNFO",     "<movie>.nfo"
		  If Preferences.Prefs.stringForKey("FileNameTrailer") = "" then Preferences.Prefs.setStringValue "FileNameTrailer", "<movie>-trailer"
		  
		  If Preferences.Prefs.stringForKey("FileNameNFOTV")    = "" then Preferences.Prefs.setStringValue "FileNameNFOTV",    "tvshow.nfo"
		  If Preferences.Prefs.stringForKey("FileNameNFOAnime") = "" then Preferences.Prefs.setStringValue "FileNameNFOAnime", "tvshow.nfo"
		  
		  // FileNamePoster  = Preferences.Prefs.stringForKey("FileNamePoster")
		  // FileNameFanart  = Preferences.Prefs.stringForKey("FileNameFanart")
		  // FileNameNFO     = Preferences.Prefs.stringForKey("FileNameNFO")
		  // FileNameTrailer = Preferences.Prefs.stringForKey("FileNameTrailer")
		  
		  
		  // Services
		  // General
		  If Preferences.Prefs.stringForKey("PreferredRatings") = "" Then Preferences.Prefs.stringForKey("PreferredRatings") = "IMDb"
		  
		  // TMDB
		  If Preferences.Prefs.integerForKey("TMDBRecommendations") <= 0 Then Preferences.Prefs.integerForKey("TMDBRecommendations") = 10
		  
		  // Rotten Tomatoes
		  Preferences.Prefs.boolForKey("RTEnabled") = True
		  Preferences.Prefs.boolForKey("RTRecsEnabled") = True
		  Preferences.Prefs.boolForKey("RTRatingsEnabled") = True
		  
		  // Fanart.tv
		  Preferences.Prefs.boolForKey("FanartTVEnabled") = True
		  
		  // IMDb
		  Preferences.Prefs.boolForKey("IMDbFullCast") = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteDefaults()
		  'If Preferences.Prefs.synchronize then
		  'If DebugBuild then MsgBox "Saved preferences!"
		  'End If
		  Preferences.Prefs.Sync
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		fAppSupport As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Prefs As TTsSmartPreferences
	#tag EndProperty


	#tag Constant, Name = SystemLanguage, Type = String, Dynamic = True, Default = \"en", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"en"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"nl"
		#Tag Instance, Platform = Any, Language = da, Definition  = \"da"
		#Tag Instance, Platform = Any, Language = fi, Definition  = \"fi"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"de"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"it"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"es"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"fr"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"pl"
		#Tag Instance, Platform = Any, Language = hu, Definition  = \"hu"
		#Tag Instance, Platform = Any, Language = el, Definition  = \"el"
		#Tag Instance, Platform = Any, Language = tr, Definition  = \"tr"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"ru"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"he"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"ja"
		#Tag Instance, Platform = Any, Language = pt, Definition  = \"pt"
		#Tag Instance, Platform = Any, Language = zh_TW, Definition  = \"zh"
		#Tag Instance, Platform = Any, Language = cs, Definition  = \"cs"
		#Tag Instance, Platform = Any, Language = sk, Definition  = \"sl"
		#Tag Instance, Platform = Any, Language = hr, Definition  = \"hr"
		#Tag Instance, Platform = Any, Language = ko, Definition  = \"ko"
		#Tag Instance, Platform = Any, Language = no, Definition  = \"no"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"sv"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"gb"
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
End Module
#tag EndModule

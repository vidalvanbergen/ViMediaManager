#tag Window
Begin Window dlgProgress
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   130
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   False
   Title           =   "#Loc.kProgress"
   Visible         =   True
   Width           =   486
   Begin cvsLogo Logo
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   64
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   64
   End
   Begin Label lblAction
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   96
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Action:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   370
   End
   Begin Label lblDescription
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   96
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Description"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   34
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   370
   End
   Begin ProgressBar pgBar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   96
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      Top             =   58
      Value           =   0
      Visible         =   True
      Width           =   370
   End
   Begin PushButton btnCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "#Loc.dlgStop"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   386
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   90
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TaskTimer thrProgress
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin Label lblDebug
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   28
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   96
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   82
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   278
   End
   Begin Timer TimerProgress
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin TrailerSckt ScktTrailer
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      Handle          =   0
      httpProxyAddress=   ""
      httpProxyPort   =   0
      Index           =   -2147483648
      IsConnected     =   False
      LastErrorCode   =   0
      LocalAddress    =   ""
      LockedInPosition=   False
      Port            =   0
      RemoteAddress   =   ""
      Scope           =   0
      TabPanelIndex   =   0
      yield           =   False
   End
   Begin Timer StartStuff
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  
		  // Reset Main
		  CommonCore.MassSearch = False
		  wndMain.ProgressRunning = False
		  wndMain.lstMovies.Enabled = True
		  wndMain.lstTVShows.Enabled = True
		  'ReDim CommonCore.UnfoundTitles(-1)
		  'ReDim CommonCore.UnfoundPaths(-1)
		  
		  'If ActiveSection = 0 Then
		  'wndMain.cvsMovieDetails.Reload
		  'ElseIf ActiveSection = 1 Then
		  'wndMain.cvsTVShowDetails.Reload
		  'End If
		  
		  // Clean Up
		  'TrailerSckteer.Close
		  'If ThreadMode = "GetTrailer" Then
		  'Dim f as FolderItem = SpecialFolder.Temporary.Child( App.Identifier ).Child("trailer.downloading")
		  'If f <> Nil and f.Exists Then f.Delete
		  'wndMain.lstMovies.UpdateRow
		  'End If
		  
		  // Reset Self
		  ThreadMode = ""
		  ItemID = ""
		  ItemName = ""
		  
		  
		  
		  // Stop what you're doing!
		  thrProgress.Kill
		  StartStuff.Mode = timer.ModeOff
		  
		  If ActiveSection = 0 Then wndMain.cvsMovieDetails.Reload
		  If ActiveSection = 1 Then wndMain.cvsTVShowDetails.Reload
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  Self.SetFocus
		  Self.Show
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Self.Title = ""
		  
		  'ReDim CommonCore.UnfoundTitles(-1)
		  'ReDim CommonCore.UnfoundPaths(-1)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Stop()
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub Add(Action as String = "", Description as String = "", addValue as Integer = 1, MaxValue as Integer = - 1)
		  If Action <> "" Then lblAction.Text = Action.ReplaceAll( " & ", " && " )
		  If NOT DebugBuild Then Description = Trim( RegExThis( Description, "\[.*\]", "" ) ) 'lblDescription.Text = Trim( RegExThis( Description, "\[.*\]", "" ) ).ReplaceAll( " & ", " and " )
		  If Description <> "" Then lblDescription.Text = Description.ReplaceAll( " & ", " && " )
		  
		  
		  'If MaxValue > -1 Then pgBar.Maximum = MaxValue
		  'pgBar.Value = pgBar.Value + addValue
		  If MaxValue > -1 Then ProgressMax = MaxValue
		  ProgressValue = ProgressValue + addValue
		  'If pgBar.Value >= pgBar.Maximum Then pgBar.Maximum = 0
		  If ProgressValue = ProgressMax Then ProgressMax = 0
		  'Self.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Debug(debugtext as String)
		  lblDebug.Text = debugtext.ReplaceAll( " & ", " && " )
		  'LabelDebug = debugtext
		  'Self.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoStuff()
		  '#pragma DisableBackgroundTasks
		  '#If NOT DebugBuild Then
		  '#pragma DisableBoundsChecking
		  '#pragma NilObjectChecking False
		  '#pragma StackOverflowChecking False
		  '#endif
		  
		  Dim ID as String
		  Dim LstBox as ListBox = ActiveListBox
		  Dim Lindex as Integer = LstBox.ListIndex
		  
		  wndMain.ProgressRunning = True
		  
		  wndMain.lstMovies.Enabled = False
		  wndMain.lstTVShows.Enabled = False
		  'wndMain.lstAnime.Enabled = False
		  
		  Select Case ActiveSection
		  Case 0
		    ID = MovieAttr.ID_TMDB
		    If ID = "" Then ID = MovieAttr.ID_IMDB
		  Case 1
		    ID = TVAttr.ID_TVDB
		    If ID = "" Then ID = TVAttr.ID_IMDb
		  Case 2
		    'ID = AnimeAttr.ID_AniDB
		    'If ID = "" Then ID = AnimeAttr.ID_IMDb
		  End Select
		  
		  Select Case ThreadMode
		    
		  Case "LoadLists"
		    wndMain.lstMovies.LoadList()
		    wndMain.lstTVShows.LoadList()
		    
		  End Select
		  
		  
		  // ## Movies
		  
		  Select Case ThreadMode
		    
		  Case "ReloadMovies"
		    wndMain.lstMovies.CreateList( CommonCore.ReloadUpdate )
		    
		  Case "BatchRenameMovies"
		    lblDescription.TextSize = 10
		    LstBox.ListIndex = -1
		    
		    For i as Integer = 0 to LstBox.ListCount -1
		      If LstBox.Cell( i, 2 ) = "" Then Continue // If unscraped, Skip It!
		      SingleRenamer( GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell ), i, True )
		    Next
		    
		    lblDescription.TextSize = 0
		    LstBox.ListIndex = Lindex
		    
		    
		  Case "SearchMovie"
		    MovieCore.MovieSearch( lblDescription.Text )
		  Case "ManualSearchMovie"
		    MovieCore.MovieSearch( lblDescription.Text, True )
		    
		    
		  Case "FetchSingleMovie"
		    MovieCore.MovieByID( ItemID )
		  Case "FetchMissingMovies"
		    MovieCore.MissingMovies()
		    
		  Case "UpdateSingleMovie"
		    MovieCore.MovieUpdate( ID )
		  Case "UpdateAllMovies"
		    MovieCore.MovieUpdateAll()
		    
		    
		  Case "UpdateSingleMovieRating"
		    MovieCore.MovieUpdateRating()
		  Case "UpdateAllMovieRatings"
		    CommonCore.MassSearch = True
		    For i as Integer = 0 to LstBox.ListCount -1
		      Dim f as FolderItem = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		      If ( f = NIL OR NOT f.Exists ) OR LstBox.Cell( i, 2 ) = "" Then Continue // If nothing to update, Skip It!
		      
		      
		      MovieAttr.FolderParent = f
		      MovieAttr.NFORead( f )
		      
		      Self.Add( Loc.kUpdating + ":", CommonCore.CurrentItemName, 1, LstBox.ListCount )
		      
		      MovieCore.MovieUpdateRating( i )
		    Next
		    CommonCore.MassSearch = False
		    
		    
		  Case "UpdateSingleMovieImages"
		    lblDescription.TextSize = 10
		    MovieCore.UpdateArt( LstBox.Cell( LstBox.ListIndex, 2 ), LstBox.ListIndex )
		    wndMain.cvsMovieDetails.Reload
		    
		    'MsgBox kmsgFinishedFetchingImages
		    
		  Case "UpdateAllMovieImages"
		    lblDescription.TextSize = 10
		    CommonCore.MassSearch = True
		    Dim LastIndex as Integer = LstBox.ListIndex
		    
		    For i as Integer = 0 to LstBox.ListCount - 1
		      If LstBox.Cell( i, 2 ) = "" Then Continue // If unscraped, Skip it!
		      MovieCore.UpdateArt( LstBox.Cell( i, 2 ), i )
		    Next
		    
		    lblDescription.TextSize = 0
		    CommonCore.MassSearch = False
		    LstBox.ListIndex = LastIndex
		    
		    'MsgBox kmsgFinishedFetchingImages
		    
		  End Select
		  
		  // -- Extra Downloads
		  
		  Select Case ThreadMode
		    
		    // TMDB Art
		  Case "GetMoviePoster"       // Poster
		    MovieCore.MovieArt( ID, "Posters" )
		  Case "GetMovieFanart"       // Fanart
		    MovieCore.MovieArt( ID, "Backdrops" )
		    
		  Case "GetMovieExtrathumbs"  // ExtraThumbs
		    MovieCore.MovieExtraArts( ID, "ExtraThumbs" )
		  Case "GetMovieExtraFanart"  // ExtraFanart
		    MovieCore.MovieExtraArts( ID, "ExtraBackdrops" )
		    
		    // Fanart.TV Art
		  Case "GetMovieBanner"        // Banner
		    MovieCore.MovieArt( ID, "Banners" )
		  Case "GetMovieLogo"          // Logo
		    MovieCore.MovieArt( ID, "Logos" )
		  Case "GetMovieClearArt"      // ClearArt
		    MovieCore.MovieArt( ID, "ClearArt")
		  Case "GetMovieDisc"          // DiscArt
		    MovieCore.MovieArt( ID, "DiscArt" )
		  Case "GetMovieThumb"         // Landscape
		    MovieCore.MovieArt( ID, "Thumbs" )
		    
		    // Trailer
		  Case "GetTrailer"            // Trailer
		    'TrailerSckteer.Download()
		    Dim Dict as Dictionary = MovieCore.MovieTrailers( ID, True )
		    
		  End Select
		  
		  
		  // ## Television
		  
		  Select Case ThreadMode
		    
		  Case "ReloadTVShows"
		    wndMain.lstTVShows.CreateList( CommonCore.ReloadUpdate )
		    
		  Case "BatchRenameTVShows"
		    lblDescription.TextSize = 10
		    LstBox.ListIndex = -1
		    
		    Dim Shadow as Listbox = wndMain.lstTVShadow
		    For i as Integer = 0 to Shadow.ListCount -1
		      If Shadow.Cell( i, 2 ) = "" Then Continue // If unscraped, Skip It!
		      SingleRenamer( GetFolderItem( Shadow.Cell( i, 1 ), FolderItem.PathTypeShell ), i, True )
		    Next
		    
		    lblDescription.TextSize = 0
		    wndMain.lstTVShows.ResetFolderStatus()
		    LstBox.ListIndex = Lindex
		    
		    
		  Case "SearchTVShow"
		    TVCore.ShowSearch( lblDescription.Text )
		  Case "ManualSearchTVShow"
		    TVCore.ShowSearch( lblDescription.Text, True )
		    
		  Case "FetchSingleTVShow"
		    TVCore.ShowByID( ItemID )
		  Case "FetchMissingTVShows"
		    TVCore.MissingShows()
		    
		  Case "UpdateSingleTVShow"
		    TVCore.ShowUpdate( ID )
		  Case "UpdateAllTVShows"
		    TVCore.ShowUpdateAll()
		    
		  Case "UpdateSingleTVShowStatus"
		    TVCore.ShowStatus( TVAttr.Title, TVAttr.ID_TVDB )
		    
		    TVAttr.NFOWrite( TVAttr.FolderParent )
		    wndMain.lstTVShows.UpdateRow
		    'TVAttr.LoadImages( TVAttr.FolderParent )
		    wndMain.cvsTVShowDetails.Reload
		    
		  Case "UpdateAllTVShowStatus"
		    TVCore.ShowStatusAll()
		    
		  Case "UpdateSingleTVShowRating"
		    If TVAttr.ID_TVDB <> "" Then
		      TVCore.ShowUpdateRating( TVAttr.ID_TVDB )
		    ElseIf TVAttr.ID_IMDb <> "" Then
		      TVCore.ShowUpdateRating( TVAttr.ID_IMDb )
		    End If
		    
		  Case "UpdateAllTVShowRatings"
		    CommonCore.MassSearch = True
		    LstBox = wndMain.lstTVShadow
		    For i as Integer = 0 to LstBox.ListCount -1
		      Dim f as FolderItem = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		      If ( f = NIL OR NOT f.Exists ) OR LstBox.Cell( i, 2 ) = "" Then Continue // If nothing to update, Skip It!
		      
		      TVAttr.FolderParent = f
		      TVAttr.NFORead( f )
		      If TVAttr.Locked Then Continue
		      
		      Self.Add( Loc.kUpdating + ":", TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "...", 1, LstBox.ListCount )
		      ID = TVAttr.ID_TVDB
		      If ID = "" Then ID = TVAttr.ID_IMDb
		      
		      TVCore.ShowUpdateRating( ID )
		      wndMain.lstTVShows.UpdateRow( i, Nil, True )
		    Next
		    CommonCore.MassSearch = False
		    wndMain.lstTVShows.ResetFolderStatus
		    wndMain.lstTVShows.ListIndex = wndMain.lstTVShows.ListIndex
		    
		  Case "UpdateSingleTVShowImages"
		    TVCore.ShowUpdateArt( ID )
		    'MsgBox kmsgFinishedFetchingImages
		    
		  Case "UpdateAllTVShowImages"
		    TVCore.ShowUpdateArtAll()
		    'MsgBox kmsgFinishedFetchingImages
		    
		  End Select
		  
		  // -- Extra Downloads
		  
		  Select Case ThreadMode
		    // TVDB
		  Case "GetTVShowPoster"       // Poster
		    TVCore.ShowArt( ID, "Posters" )
		    
		    // Mixed TVDB & Fanart.TV
		  Case "GetTVShowFanart"       // Fanart
		    TVCore.ShowArt( ID, "Backdrops" )
		  Case "GetTVShowBanner"       // Banner
		    TVCore.ShowArt( ID, "Banners" )
		    
		    // Fanart.TV Art
		  Case "GetTVShowLogo"         // Logo
		    TVCore.ShowArt( ID, "Logos" )
		  Case "GetTVShowClearArt"     // ClearArt
		    TVCore.ShowArt( ID, "ClearArt" )
		  Case "GetTVShowThumb"        // Landscape
		    TVCore.ShowArt( ID, "Thumbs" )
		  Case "GetTVShowCharacterArt" // CharacterArt
		    TVCore.ShowArt( ID, "CharacterArt" )
		    
		    // Season Art
		  Case "GetSeasonPoster"
		    TVCore.ShowArt( ID, "SeasonPoster", Season )
		  Case "GetSeasonFanart"
		    TVCore.ShowArt( ID, "SeasonFanart", Season )
		  Case "GetSeasonBanner"
		    TVCore.ShowArt( ID, "SeasonBanner", Season )
		  Case "GetSeasonThumb"
		    TVCore.ShowArt( ID, "SeasonThumb", Season )
		    
		  Case "GetTVThemeSongs"
		    TVCore.GetThemeSong( TVAttr.Title, False )
		    
		  End Select
		  
		  
		  // Episodes
		  Select Case ThreadMode
		    
		  Case "UpdateEpisodes"
		    ID = TVAttr.ID_TVDB
		    If ID = "" Then ID = TVAttr.ID_IMDb
		    TVCore.EpisodeUpdate( ID )
		    
		    'MsgBox kmsgFinishedFetchingInformation
		    
		  Case "UpdateAllEpisodes"
		    CommonCore.MassSearch = True
		    EpisodesToTVShows()
		    Lindex = LstBox.ListIndex
		    LstBox = wndMain.lstTVShadow
		    For i as Integer = 0 to LstBox.ListCount -1
		      
		      'If CommonCore.ReloadUpdate And Val( LstBox.Cell( i, 24 ) ) = 0 Then Continue
		      
		      Dim f as FolderItem = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		      If ( f = NIL OR NOT f.Exists ) OR LstBox.Cell( i, 2 ) = "" Then Continue // If nothing to update, Skip It!
		      
		      TVAttr.FolderParent = f
		      TVAttr.NFORead( f )
		      If TVAttr.Locked Then Continue
		      
		      Dim Eps() as FolderItem = FindEpisodeFiles( f )
		      LstBox.Cell( i, 24 ) = LeadingZero( Eps.Ubound + 1, 5 )
		      If CommonCore.ReloadUpdate And Val( LstBox.Cell( i, 24 ) ) <= 0 Then Continue
		      
		      
		      Self.Add( Loc.kUpdating + ":", TVAttr.Title + " " + Loc.kEpisodes.ReplaceAll(":","").Lowercase + "...", 1, LstBox.ListCount )
		      ID = TVAttr.ID_TVDB
		      If ID = "" Then ID = TVAttr.ID_IMDb
		      
		      TVCore.EpisodeUpdate( ID )
		      wndMain.lstTVShows.UpdateRow( i, Nil, True )
		    Next
		    If LstBox.ListCount > 0 Then wndMain.lstTVShows.UpdateRow( 0, Nil, True )
		    CommonCore.MassSearch = False
		    wndMain.lstTVShows.SortList
		    'wndMain.lstTVShows.ResetFolderStatus
		    wndMain.lstTVShows.ListIndex = Lindex
		    
		  Case "UpdateLocalEpisodes"
		    CommonCore.MassSearch = True
		    EpisodesToTVShows()
		    Lindex = LstBox.ListIndex
		    LstBox = wndMain.lstTVShadow
		    For i as Integer = 0 to LstBox.ListCount -1
		      
		      Dim f as FolderItem = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		      If f = Nil OR NOT f.Exists OR LstBox.Cell( i, 2 ) = "" Then Continue // Nothing to update, skip it!
		      
		      TVAttr.FolderParent = f
		      TVAttr.NFORead( f )
		      If TVAttr.Locked Then Continue
		      
		      Self.Add( Loc.kUpdating + ":", TVAttr.Title + " " + Loc.kEpisodes.ReplaceAll(":", "").Lowercase + "...", 1, LstBox.ListCount )
		      
		      Dim EpisodeFiles() as FolderItem = FindEpisodeFiles( f )
		      If EpisodeFiles.Ubound < 0 Then Continue // Nothing to update, skip it!
		      
		      Dim b as Boolean = True
		      For n as Integer = 0 to EpisodeFiles.Ubound
		        Dim EpNFO, EpThumb as FolderItem = EpisodeFiles(n).Parent
		        EpNFO = EpNFO.Child( EpisodeFiles(n).NameNoExtension + ".nfo" )
		        EpThumb = EpThumb.Child( EpisodeFiles(n).NameNoExtension + ".jpg" )
		        If EpThumb = Nil OR NOT EpThumb.Exists Then EpThumb = EpisodeFiles(n).Parent.Child( EpisodeFiles(n).NameNoExtension + "-thumb.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" And EpThumb = Nil OR NOT EpThumb.Exists Then EpThumb = EpisodeFiles(n).Parent.Child( EpisodeFiles(n).NameNoExtension + ".videoimage.jpg" )
		        
		        If EpThumb = Nil OR NOT EpThumb.Exists Then
		          For p as Integer = 1 to EpisodeFiles(n).Parent.Count
		            Dim item as FolderItem = EpisodeFiles(n).Parent.Item(p)
		            If item <> Nil And item.Exists And item.Type = "" And item.Name.InStr( 0, EpisodeFiles(n).NameNoExtension ) > 0 Then
		              EpThumb = item
		              Exit
		            End If
		          Next
		        End If
		        
		        If NOT EpNFO.Exists OR NOT EpThumb.Exists Then
		          b = False
		          Exit
		        End If
		      Next
		      If b Then Continue // Nothing to update, skip it!
		      
		      'Dim ShowNFO as FolderItem = FindNFOFile(  )
		      TVAttr.NFORead( GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell ) )
		      ID = TVAttr.ID_TVDB
		      If ID = "" Then ID = TVAttr.ID_IMDb
		      'ID = LstBox.Cell( i, 2 )
		      TVCore.EpisodeUpdate( ID )
		      wndMain.lstTVShows.UpdateRow( i, Nil, True )
		    Next
		    CommonCore.MassSearch = False
		    wndMain.lstSearch.CopyFrom( wndMain.lstTVShadow )
		    
		    Dim b as Boolean = False
		    For i as Integer = 0 to wndMain.lstTVShows.ListCount -1
		      If wndMain.lstTVShows.RowTag( i ) = "Folder" Then
		        b = True
		        Exit
		      End If
		    Next
		    If b Then
		      wndMain.lstTVShows.ResetFolderStatus
		    Else
		      wndMain.lstSearch.CopyTo( wndMain.lstTVShows )
		    End If
		    wndMain.lstTVShows.ListIndex = Lindex
		    
		  End Select
		  
		  
		  // ## Anime
		  
		  // -- Extra Downloads
		  'Select Case ThreadMode
		  'End Select
		  
		  
		  // ## Close Process
		  
		  
		  wndMain.lstMovies.Enabled = True
		  wndMain.lstTVShows.Enabled = True
		  'wndMain.lstAnime.Enabled = False
		  
		  wndMain.ProgressRunning = False
		  
		  'If ThreadMode <> "GetTrailer" Then Close
		  Close
		  
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  'pgBar.Value = 0
		  ProgressValue = 0
		  Self.Debug( "" )
		  'Self.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SpecialInit(tmpItemID as String, tmpItemName as String)
		  ItemID = tmpItemID
		  ItemName = tmpItemName
		  
		  If ActiveSection = 0 Then
		    Start( Loc.kProcessing + ":", "TMDb: " + tmpItemName, 15, "FetchSingleMovie" )
		  ElseIf ActiveSection = 1 Then
		    Start( Loc.kProcessing + ":", "TVDB: " + tmpItemName, 15, "FetchSingleTVShow" )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SpecialSeason(tmpItemID as String, tmpItemName as String, tmpSeason as Integer = - 1, tmpMode as String = "Season")
		  ItemID = tmpItemID
		  ItemName = tmpItemName
		  Season = tmpSeason
		  
		  If ActiveSection = 1 Then
		    
		    Select Case tmpMode
		      
		    Case "SeasonPoster"
		      Start( Loc.kProcessing + ":", "Art: " + tmpItemName + "...", 0, "GetSeasonPoster" )
		    Case "SeasonFanart"
		      Start( Loc.kProcessing + ":", "Art: " + tmpItemName + "...", 0, "GetSeasonFanart" )
		    Case "SeasonBanner"
		      Start( Loc.kProcessing + ":", "Art: " + tmpItemName + "...", 0, "GetSeasonBanner" )
		    Case "SeasonThumb"
		      Start( Loc.kProcessing + ":", "Art: " + tmpItemName + "...", 0, "GetSeasonThumb" )
		      
		    End Select
		    
		  End If
		  
		  'Season = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start(Action as String, Description as String, Max as Integer, RunThread as String)
		  StartStuff.mode = timer.ModeOff
		  
		  thrProgress.Kill
		  lblAction.Text = Action
		  If NOT DebugBuild Then Description = Trim( RegExThis( Description, "\[.*\]", "" ) )'.ReplaceAll( " & ", " and " )
		  lblDescription.Text = Description.ReplaceAll( " & ", " && " )
		  
		  
		  'pgBar.Maximum = Max
		  'pgBar.Value = 0
		  ProgressMax = Max
		  ProgressValue = 0
		  'self.Refresh
		  
		  ThreadMode = RunThread
		  thrProgress.Run
		  StartStuff.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  'pgBar.Value = pgBar.Maximum
		  ProgressValue = ProgressMax
		  'Self.Refresh
		  If CommonCore.UnfoundTitles.Ubound > -1 Then CommonCore.ShowUnfoundTitles( "" )
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(Action as String = "", Description as String = "", Value as Integer, Max as Integer = - 1)
		  If Action <> "" then lblAction.Text = Action.ReplaceAll( " & ", " && " )
		  If NOT DebugBuild Then Description = Trim( RegExThis( Description, "\[.*\]", "" ) ).ReplaceAll( " & ", " && " )
		  If Description <> "" then lblDescription.Text = Description.ReplaceAll( " & ", " && " )
		  
		  
		  If Max > -1 Then ProgressMax = Max 'pgBar.Maximum = Max
		  If Value = -1 Then
		    'ProgressValue = ProgressValue 'pgBar.Value = pgBar.Value
		  Else
		    If Value >= pgBar.Maximum Then pgBar.Maximum = 0 Else pgBar.Value = Value
		    If Value >= ProgressMax Then ProgressMax = 0 Else ProgressValue = Value
		  End If
		  'Self.Refresh
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ItemID As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ItemName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LabelAction As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LabelDebug As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LabelDescription As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected pID As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected pLindex As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected pLstBox As Listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressMax As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressValue As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Season As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ThreadMode As String
	#tag EndProperty


	#tag Constant, Name = kmsgFinishedFetchingImages, Type = String, Dynamic = True, Default = \"Finished fetching images.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Finished fetching images."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klaar met het ophalen van afbeeldingen."
	#tag EndConstant

	#tag Constant, Name = kmsgFinishedFetchingInformation, Type = String, Dynamic = True, Default = \"Finished fetching information.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Finished fetching information."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klaar met het ophalen van informatie."
	#tag EndConstant

	#tag Constant, Name = msgNoDestination, Type = String, Dynamic = True, Default = \"Destination not found.", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Destination not found."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bestemming niet gevonden."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Destinationen hittades inte."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ziel nicht gefunden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Destination non trouv\xC3\xA9e."
	#tag EndConstant


#tag EndWindowCode

#tag Events btnCancel
	#tag Event
		Sub Action()
		  thrProgress.Kill
		  Stop()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thrProgress
	#tag Event
		Sub Begin()
		  'pLstBox = ActiveListBox
		  'pLindex = pLstBox.ListIndex
		  '
		  'wndMain.lstMovies.Enabled = False
		  'wndMain.lstTVShows.Enabled = False
		  '
		  'Select Case ActiveSection
		  'Case 0
		  'pID = MovieAttr.ID_TMDB
		  'If pID = "" Then pID = MovieAttr.ID_IMDB
		  'Case 1
		  'pID = TVAttr.ID_TVDB
		  'If pID = "" Then pID = TVAttr.ID_IMDb
		  'Case 2
		  ''ID = AnimeAttr.ID_AniDB
		  ''If ID = "" Then ID = AnimeAttr.ID_IMDb
		  'End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub Finished()
		  
		  'wndMain.lstMovies.Enabled = True
		  'wndMain.lstTVShows.Enabled = True
		  
		  'close
		End Sub
	#tag EndEvent
	#tag Event
		Sub Killed()
		  
		  'wndMain.lstMovies.Enabled = True
		  'wndMain.lstTVShows.Enabled = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub Run()
		  'DoStuff
		  
		  
		  'Select case ThreadMode
		  '
		  '
		  ''case "ReloadMovies"
		  ''wndMain.lstMovies.CreateList( CommonCore.ReloadUpdate )
		  '
		  'else  
		  'log "Progress TODO: " + ThreadMode
		  ''me.UpdateUI(new Pair("mode", ThreadMode))
		  '
		  'End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub UpdateUI(args as Dictionary)
		  
		  'dim mode as String = args.Lookup("mode", "")
		  '
		  'Select case mode
		  '
		  'case "LoadLists"
		  'wndMain.lstMovies.LoadList()
		  'wndMain.lstTVShows.LoadList()
		  '
		  'case "ReloadMovies"
		  'wndMain.lstMovies.CreateList( CommonCore.ReloadUpdate )
		  '
		  'End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimerProgress
	#tag Event
		Sub Action()
		  'lblAction.Text = LabelAction.ReplaceAll( " & ", " && " )
		  'lblDescription.Text = LabelDescription.ReplaceAll( " & ", " && " )
		  'lblDebug.Text = LabelDebug.ReplaceAll( " & ", " && " )
		  
		  pgBar.Value = ProgressValue
		  pgBar.Maximum = ProgressMax
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScktTrailer
	#tag Event
		Sub ReceiveProgress(bytesReceived as Integer, totalBytes as Integer, newData as String, Progress as String)
		  ProgressMax = totalBytes
		  ProgressValue = bytesReceived
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartStuff
	#tag Event
		Sub Action()
		  DoStuff
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="ProgressMax"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ProgressValue"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior

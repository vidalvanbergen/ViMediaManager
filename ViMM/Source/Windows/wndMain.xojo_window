#tag Window
Begin WindowPro wndMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   True
   HasBackColor    =   False
   Height          =   760
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   343001748
   MenuBarVisible  =   True
   MinHeight       =   500
   MinimizeButton  =   True
   MinWidth        =   700
   Placement       =   2
   Resizeable      =   True
   Title           =   "#App.kAppName"
   Visible         =   True
   Width           =   1024
   Begin PagePanel ppMain
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   760
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   4
      Panels          =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   1024
      Begin ListMovies lstMovies
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   27
         ColumnsResizable=   True
         ColumnWidths    =   "100%, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   64
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   704
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         InitialValue    =   ""
         Italic          =   False
         LastKeyPressed  =   ""
         LastKeyPressedAt=   0
         Left            =   -1
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   True
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   33
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin ccSearch ccSearchBoxMovies
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         CueText         =   "#cCueText"
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   33
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   0
         LiveSearch      =   False
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
      End
      Begin ccSearch ccSearchBoxTVShows
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         CueText         =   "#cCueText"
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   33
         HelpTag         =   ""
         InitialParent   =   "ppMain"
         Left            =   0
         LiveSearch      =   False
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
      End
      Begin ActionBar ActBar
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppMain"
         Left            =   -1
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MinLeft         =   150
         MinRight        =   50
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "## Items"
         Top             =   736
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   300
      End
      Begin ListTVShows lstTVShows
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   25
         ColumnsResizable=   False
         ColumnWidths    =   "100%, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   64
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   704
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         InitialValue    =   ""
         Italic          =   False
         LastKeyPressed  =   ""
         LastKeyPressedAt=   0
         Left            =   -1
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   True
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   33
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin ActionBar ActBar
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppMain"
         Left            =   -1
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MinLeft         =   150
         MinRight        =   50
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "## Items"
         Top             =   736
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   300
      End
      Begin MediaDetails cvsMovieDetails
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   737
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         Left            =   299
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   725
      End
      Begin MediaDetails cvsTVShowDetails
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   577
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         Left            =   299
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   725
         Begin Listbox lstTVShadow
            AutoDeactivate  =   True
            AutoHideScrollbars=   True
            Bold            =   False
            Border          =   True
            ColumnCount     =   1
            ColumnsResizable=   False
            ColumnWidths    =   ""
            DataField       =   ""
            DataSource      =   ""
            DefaultRowHeight=   -1
            Enabled         =   True
            EnableDrag      =   False
            EnableDragReorder=   False
            GridLinesHorizontal=   0
            GridLinesVertical=   0
            HasHeading      =   False
            HeadingIndex    =   -1
            Height          =   100
            HelpTag         =   ""
            Hierarchical    =   False
            Index           =   -2147483648
            InitialParent   =   "cvsTVShowDetails"
            InitialValue    =   ""
            Italic          =   False
            Left            =   299
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            RequiresSelection=   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollBarVertical=   True
            SelectionType   =   0
            ShowDropIndicator=   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   477
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   725
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
      End
      Begin Cocoa.NSPathControl pthsMovie
         AcceptFocus     =   False
         AcceptTabs      =   False
         Alignment       =   ""
         AllowsExpansionToolTips=   False
         AutoDeactivate  =   True
         autoresizesSubviews=   False
         Backdrop        =   0
         BackgroundColor =   &c00000000
         Bold            =   False
         Description     =   ""
         DoubleBuffer    =   False
         DoubleValue     =   0.0
         Enabled         =   True
         EraseBackground =   False
         FloatValue      =   0.0
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         IntegerValue    =   0
         IsFlipped       =   False
         Italic          =   False
         Left            =   299
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         PathStyle       =   0
         Scope           =   0
         StringValue     =   ""
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   False
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   737
         Transparent     =   True
         Underlined      =   False
         URL             =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   725
      End
      Begin Cocoa.NSPathControl PthsTVShows
         AcceptFocus     =   False
         AcceptTabs      =   False
         Alignment       =   ""
         AllowsExpansionToolTips=   False
         AutoDeactivate  =   True
         autoresizesSubviews=   False
         Backdrop        =   0
         BackgroundColor =   &c00000000
         Bold            =   False
         Description     =   ""
         DoubleBuffer    =   False
         DoubleValue     =   0.0
         Enabled         =   True
         EraseBackground =   False
         FloatValue      =   0.0
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppMain"
         IntegerValue    =   0
         IsFlipped       =   False
         Italic          =   False
         Left            =   299
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         PathStyle       =   0
         Scope           =   0
         StringValue     =   ""
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   False
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   737
         Transparent     =   True
         Underlined      =   False
         URL             =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   725
      End
   End
   Begin Thread zThrRefreshInfo
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin SearchList lstSearch
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   15
      ColumnsResizable=   True
      ColumnWidths    =   "200"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   160
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   -130
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   577
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   False
      Width           =   117
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer tmRefreshInfo
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Thread LoadMovieListImagesOLD
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin Thread LoadTVShowListImagesOLD
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin Timer tmrLoadMovieListImages
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Timer tmrLoadTVShowListImages
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  'LoadMovieListImages.Kill
		  'LoadTVShowListImages.Kill
		  tmrLoadMovieListImages.Mode = timer.ModeOff
		  tmrLoadTVShowListImages.Mode = timer.ModeOff
		  
		  
		  Preferences.Prefs.boolForKey("ExitFullScreen") = Self.IsFullScreen
		  If NOT Self.IsFullScreen Then Preferences.SaveWindowPos( Self, "wndMain" )
		  
		  ccSearchBoxMovies.Reset
		  ccSearchBoxTVShows.Reset
		  
		  Quit
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructToolbar(Toolbar as NSToolbar) As Boolean
		  
		  // Default toolbar settings
		  Toolbar.AllowsUserCustomization = True
		  Toolbar.AutosavesConfiguration = True
		  Toolbar.DisplayMode = NSToolbar.NSToolbarDisplayMode.NSToolbarDisplayModeIconAndLabel 'NSToolbarDisplayModeIconOnly
		  
		  
		  // This is an array of items identifiers to specify the default items (and order) in toolbar
		  // this template is used the first time the app is launched and for defining the default set in toolbar customization
		  Toolbar.DefaultItems = Array( _
		  "MainMovies", "MainTVShows", "MainAnime", NSToolbarSpaceItemIdentifier, _
		  "MainFetchData", "MainUpdateData", "MainSearch","MainExtras", "MainEdit", "MainRefresh", "MainClean", "MainSets", "MainEpisodes", "MainTVGuide", _
		  NSToolbarFlexibleSpaceItemIdentifier, "MainDonate", "MainExperimental" )
		  
		  Toolbar.SelectableItems = Array( "MainMovies", "MainTVShows", "MainAnime" )
		  
		  
		  
		  // This is an array of items identifiers to specify all the allowed items in toolbar
		  // this template is used to populate the toolbar customization panel
		  Toolbar.AllowedItems = Array ( _
		  _ // Commonly used toolbar items
		  NSToolbarSpaceItemIdentifier, _
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  NSToolbarCustomizeToolbarItemIdentifier, _
		  NSToolbarSeparatorItemIdentifier, _
		  _ // Your toolbar items
		  "MainMovies", "MainTVShows", "MainAnime", _
		  "MainFetchData", "MainUpdateData", "MainSearch","MainExtras", "MainEdit", "MainRefresh", "MainClean", "MainSets", "MainEpisodes", "MainTVGuide", _
		  "MainDonate", "MainExperimental" )
		  
		  
		  // Add toolbar items
		  'Toolbar.AddControl( PushButton1, "Pushbutton" ) // Simplified method to add customtoolbar items with controls
		  'Toolbar.AddButton( "mainAdvanced", NSImage.Advanced, "Advanced", "", "", False )
		  
		  
		  Toolbar.AddButton( "MainMovies", NSImage.LoadByName( "template_movie" ), Loc.Movies, "", "", True )
		  Toolbar.AddButton( "MainTVShows", NSImage.LoadByName( "template_television" ), Loc.TVShows, "", "", True )
		  Toolbar.AddButton( "MainAnime", NSImage.LoadByName( "template_anime" ), Loc.Anime, "", "", True )
		  
		  dim mMenu as new NSMenu
		  mMenu.Append new NSMenuItem("Test", 0)
		  mMenu.Append new NSMenuItem("Test II", 1)
		  
		  Toolbar.AddButton( "MainFetchData", NSImage.LoadByName( "template_fetch" ), Loc.FetchMetadata, "", "", True )
		  Toolbar.AddButton( "MainUpdateData", NSImage.LoadByName( "template_update" ), Loc.kUpdateMetadata, "", "", True )
		  Toolbar.AddButton( "MainSearch", NSImage.LoadByName( "template_search" ), Loc.ManualSearch, "", "", True )
		  Toolbar.AddButton( "MainExtras", NSImage.LoadByName( "template_images" ), Menu.ToolsExtras, "", "", True )
		  Toolbar.AddButton( "MainEdit", NSImage.LoadByName( "template_edit" ), Loc.kEditMetadata, "", "", True )
		  Toolbar.AddButton( "MainRefresh", NSImage.LoadByName( "template_refresh" ), Loc.Refresh, "", "", True )
		  Toolbar.AddButton( "MainClean", NSImage.LoadByName( "template_clean"), Loc.Clean, "", "", True )
		  Toolbar.AddButton( "MainSets", NSImage.LoadByName( "template_sets" ), Loc.MovieSetsManager, "", "", True )
		  Toolbar.AddButton( "MainEpisodes", NSImage.LoadByName( "template_episodes" ), Loc.kEpisodes, "", "", True )
		  Toolbar.AddButton( "MainTVGuide", NSImage.LoadByName( "template_openbook" ), Loc.ktvguide, "", "", True )
		  
		  Toolbar.AddButton( "MainDonate", NSImage.LoadByName( "template_heart" ), Loc.Donate, "", "", True )
		  if DebugBuild or app.Experimental then
		    Toolbar.AddButton( "MainExperimental", NSImage.LoadByName( "template_experimental" ), loc.kExperimental, "", "", True )
		  end if
		  
		  
		  toolbar.SelectedItemIdentifier = "MainMovies"
		  
		  'self.SetToolbar Toolbar // Setting this so I have access to the toolbaritems
		  '
		  'Toolbar.ItemByIdentifier("MainAnime").Enabled = False
		  'Toolbar.ItemByIdentifier("MainSets").Enabled = True
		  'Toolbar.ItemByIdentifier("MainEpisodes").Enabled = False
		  
		  
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  #If TargetCocoa Then
		    If self.Visible = True Then App.ScalingFactor = ScalingFactor( self ) Else App.ScalingFactor = 1
		  #Else
		    App.ScalingFactor = 1
		  #endif
		  
		  If Preferences.Prefs.boolForKey("SplashShown") = False then
		    SetFirstStartPrefs
		    wndSplash.Show
		    Toolbar.Visible = True
		  End If
		  
		  #If TargetCarbon Then
		    ViewFullscreen.Visible = False
		  #ElseIf TargetCocoa Then
		    If Preferences.Prefs.boolForKey("ExitFullScreen") Then wndMain.ToggleFullScreen
		  #endif
		  
		  CheckMenuItems()
		  
		  If Preferences.Prefs.stringForKey( "PosterSize" ) = "" Then Preferences.Prefs.setStringValue( "PosterSize", "original" )
		  If Preferences.Prefs.stringForKey( "FanartSize" ) = "" Then Preferences.Prefs.setStringValue( "FanartSize", "original" )
		  
		  // Default toolbar items enabled state
		  Toolbar.ItemByIdentifier("MainAnime").Enabled = False
		  Toolbar.ItemByIdentifier("MainSets").Enabled = True
		  Toolbar.ItemByIdentifier("MainEpisodes").Enabled = False
		  
		  SwitchPanels( Preferences.Prefs.integerForKey("wndMainTab") )
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  cvsMovieDetails.Width  = Me.Width - ActBar(0).Width + 1
		  cvsTVShowDetails.Width = Me.Width - ActBar(1).Width + 1
		  
		  If Self.IsFullScreen Then
		    ViewFullscreen.Text = Menu.ViewExitFullscreen
		  Else
		    ViewFullscreen.Text = Menu.ViewEnterFullscreen
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Settings()
		  self.PrefToolbarName = "NSToolbarMain" // Activate toolbar support.
		  'self.TitleVisible = False // Merge toolbar with titlebar.
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarActions(Identifier as String, hitItem as NSMenuItem)
		  
		  
		  '"MainFetchData", "MainUpdateData", "MainSearch","MainExtras", "MainEdit", "MainRefresh", "MainClean", "MainSets", "MainEpisodes", "MainTVGuide", _
		  'NSToolbarFlexibleSpaceItemIdentifier, "MainDonate", "MainExperimental" )
		  
		  
		  // Toolbar buttons
		  Select case Identifier
		    
		  case "MainExperimental"
		    #if NOT DebugBuild then
		      MsgBox loc.kExperimentalMsg
		    #else
		      test()
		    #endif
		    
		  case "MainMovies"
		    ppMain.Value = 0
		  case "MainTVShows"
		    ppMain.Value = 1
		    'case "MainAnime"
		    'ppMain.Value = 2
		    
		  case "MainFetchData"
		    Dim base as New MenuItem
		    
		    If ActiveSection = 0 And lstMovies.ListIndex > -1 And lstMovies.RowTag( lstMovies.ListIndex ) <> "Folder" Then
		      base.Append New MenuItem( Loc.kSelection, "FetchMetadata" )
		    ElseIf ActiveSection = 1 And lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" Then
		      base.Append New MenuItem( Loc.kSelection, "FetchMetadata" )
		    End If
		    
		    base.Append New MenuItem( Loc.kAllMissingMetadata, "FetchMissingMetadata" )
		    
		    Dim uHitItem as MenuItem = base.PopUp
		    If uHitItem <> Nil Then
		      CMActions uHitItem.Tag
		    End If
		    
		  case "MainUpdateData"
		    If MenuUpdate( ActiveListbox ) <> Nil Then
		      Dim uHitItem as MenuItem = MenuUpdate( ActiveListbox ).PopUp
		      If uHitItem <> Nil Then CMActions uHitItem.Tag
		    End If
		    
		  case "MainSearch"
		    CommonCore.ManualSearch
		    
		  case "MainExtras"
		    Dim lstBox as Listbox = ActiveListbox
		    If MenuExtraArt( lstBox ) <> Nil Then
		      Dim uHitItem as MenuItem = MenuExtraArt( lstBox ).PopUp
		      If uHitItem <> Nil Then CMActions uhitItem.Tag
		    End If
		    
		  case "MainEdit"
		    CommonCore.EditInfo
		    
		  case "MainRefresh"
		    CommonCore.ReloadList( NOT Keyboard.AsyncOptionKey )
		    
		  case "MainClean"
		    CommonCore.Clean
		    
		  case "MainSets"
		    If Trim( ccSearchBoxMovies.srchField.StringValue ) <> "" Then
		      ccSearchBoxMovies.Reset
		      wndMain.lstMovies.ListIndex = 0
		    End If
		    wndSetManager.Show
		    
		  case "MainEpisodes"
		    If Keyboard.AsyncAltKey Then
		      CommonCore.UpdateEpisodes
		    Else
		      If lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" Then
		        wndEpisodeManager.Show
		      End If
		    End If
		    
		  case "MainTVGuide"
		    wndTVGuide.Show
		    
		  case "MainDonate"
		    ShowURL app.DonationURL
		    
		  else
		    Break
		    'MsgBox Identifier
		    
		  End Select
		  
		  
		  // Dropdown Menus
		  'if hitItem <> Nil then
		  'MsgBox hitItem.Title
		  'Select case hitItem.Title
		  '
		  ''case
		  '
		  'else
		  'MsgBox hitItem.Title
		  '
		  'End Select
		  '
		  'end if
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ExportPrint() As Boolean Handles ExportPrint.Action
			PrintList
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FetchMetadataMissingMetadata() As Boolean Handles FetchMetadataMissingMetadata.Action
			'CommonActions( "FetchMissingMetadata" )
			CommonCore.FetchMissingMetadata
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FetchMetadataSelection() As Boolean Handles FetchMetadataSelection.Action
			'CommonActions( "FetchMetadata" )
			CommonCore.FetchMetadata
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Self.Close
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileExportAsHTML() As Boolean Handles FileExportAsHTML.Action
			If ProgressRunning Then Return False
			wndHTMLExporter.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileListRefresh() As Boolean Handles FileListRefresh.Action
			CommonCore.ReloadList False
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileListUpdate() As Boolean Handles FileListUpdate.Action
			CommonCore.ReloadList
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileManualSearch() As Boolean Handles FileManualSearch.Action
			'CommonActions( "ManualSearch" )
			CommonCore.ManualSearch
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpenInFinder() As Boolean Handles FileOpenInFinder.Action
			'CommonActions( "Reveal" )
			CommonCore.ShowInFinder
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MenuViewHideToolbar() As Boolean Handles MenuViewHideToolbar.Action
			Toolbar.Visible = NOT Toolbar.Visible
			If Toolbar.Visible then MenuViewHideToolbar.Text = Menu.ViewHideToolbar else MenuViewHideToolbar.Text = Menu.ViewShowToolbar
			
			Preferences.Prefs.boolForKey("MainToolbarVisible") = Toolbar.Visible
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MenuViewMovies() As Boolean Handles MenuViewMovies.Action
			'ppMain.Value = 0
			SwitchPanels 0
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MenuViewTVShows() As Boolean Handles MenuViewTVShows.Action
			SwitchPanels 1
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ShareFacebook() As Boolean Handles ShareFacebook.Action
			'CommonActions("ShareOnFaceBook")
			CommonCore.ShareOn("Facebook")
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ShareTwitter() As Boolean Handles ShareTwitter.Action
			'CommonActions( "ShareOnTwitter" )
			CommonCore.ShareOn("Twitter")
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SortListAscending(index as Integer) As Boolean Handles SortListAscending.Action
			CommonCore.SortAscending
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SortListDescending(index as Integer) As Boolean Handles SortListDescending.Action
			CommonCore.SortDescending
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsBatchRenaming() As Boolean Handles ToolsBatchRenaming.Action
			CommonCore.RenameAll
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsClean() As Boolean Handles ToolsClean.Action
			'CommonActions "Clean"
			CommonCore.Clean
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtBanner(index as Integer) As Boolean Handles ToolsExtraArtBanner.Action
			CommonCore.GetImageBanner
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtCharacterArt() As Boolean Handles ToolsExtraArtCharacterArt.Action
			CommonCore.GetImageCharacterArt()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtClearArt(index as Integer) As Boolean Handles ToolsExtraArtClearArt.Action
			'If GetActiveListbox = lstMovies Then
			''CommonActions("GetMovieArt")
			'Else
			'CommonActions("GetClearArt")
			'End If
			CommonCore.GetImageClearArt
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtDiscArt(index as Integer) As Boolean Handles ToolsExtraArtDiscArt.Action
			'CommonActions("GetMovieDisc")
			CommonCore.GetImageDiscArt
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtExtraFanart(index as Integer) As Boolean Handles ToolsExtraArtExtraFanart.Action
			'CommonActions("GetExtraFanart")
			CommonCore.GetImagesExtraBackdrops
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtFanart(index as Integer) As Boolean Handles ToolsExtraArtFanart.Action
			'CommonActions( "GetFanart" )
			CommonCore.GetImageBackdrop
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtLogo(index as Integer) As Boolean Handles ToolsExtraArtLogo.Action
			'If GetActiveListbox = lstMovies Then
			'CommonActions("GetMovieLogo")
			'Else
			'CommonActions("GetLogo")
			'End If
			CommonCore.GetImageLogo
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtPoster(index as Integer) As Boolean Handles ToolsExtraArtPoster.Action
			'CommonActions( "GetPoster" )
			CommonCore.GetImagePoster
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtThumb(index as Integer) As Boolean Handles ToolsExtraArtThumb.Action
			'If GetActiveListbox = lstMovies Then CommonActions("GetMovieThumb")
			CommonCore.GetImageThumb
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraArtThumbs(index as Integer) As Boolean Handles ToolsExtraArtThumbs.Action
			'CommonActions( "GetExtraThumbs" )
			CommonCore.GetImagesExtraThumbs
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraThemeSong() As Boolean Handles ToolsExtraThemeSong.Action
			CommonCore.GetThemeSong
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsExtraTrailer() As Boolean Handles ToolsExtraTrailer.Action
			'CommonActions( "GetTrailer" )
			CommonCore.GetMovieTrailer
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsGetAllMissingArtwork(index as Integer) As Boolean Handles ToolsGetAllMissingArtwork.Action
			'CommonActions("UpdateAllImages")
			CommonCore.UpdateAllImages
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsGetMissingArtwork(index as Integer) As Boolean Handles ToolsGetMissingArtwork.Action
			'CommonActions("UpdateSingleImages")
			CommonCore.UpdateSingleImages
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsMarkasLocked() As Boolean Handles ToolsMarkasLocked.Action
			CommonCore.MarkAsLocked()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsMarkasWatched() As Boolean Handles ToolsMarkasWatched.Action
			CommonCore.MarkAsWatched
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsMovies2Folders() As Boolean Handles ToolsMovies2Folders.Action
			If ppMain.Value = 0 then MassMovies2Folders( lstMovies )
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsRenameSelection() As Boolean Handles ToolsRenameSelection.Action
			'CommonActions( "RenameSelection" )
			CommonCore.RenameSelection
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function TrakttvMarkasSeen() As Boolean Handles TrakttvMarkasSeen.Action
			TraktTV.MarkMovieAsSeen()
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function TrakttvMarkasUnseen() As Boolean Handles TrakttvMarkasUnseen.Action
			TraktTV.MarkMovieAsUnseen()
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateAll() As Boolean Handles UpdateAll.Action
			CommonCore.UpdateMetadata
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateAllEpisodes() As Boolean Handles UpdateAllEpisodes.Action
			CommonCore.UpdateAllEpisodes()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateAllRatings() As Boolean Handles UpdateAllRatings.Action
			CommonCore.UpdateAllRatings
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateAllShowStatus() As Boolean Handles UpdateAllShowStatus.Action
			CommonCore.UpdateAllShowStatus
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateEpisodes() As Boolean Handles UpdateEpisodes.Action
			If ActiveListbox.ListIndex > -1 And ActiveListbox.RowTag( ActiveListbox.ListIndex ) <> "Folder" Then CommonCore.UpdateEpisodes
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateNewEpisodes() As Boolean Handles UpdateNewEpisodes.Action
			CommonCore.UpdateAllEpisodes( True )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateRating() As Boolean Handles UpdateRating.Action
			If ActiveListbox.ListIndex > -1 And ActiveListbox.RowTag( ActiveListbox.ListIndex ) <> "Folder" Then CommonCore.UpdateSingleRating
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateSelected() As Boolean Handles UpdateSelected.Action
			If ActiveListbox.ListIndex > -1 And ActiveListbox.RowTag( ActiveListbox.ListIndex ) <> "Folder" Then CommonCore.UpdateSingleItem
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UpdateShowStatus() As Boolean Handles UpdateShowStatus.Action
			If ActiveListbox.ListIndex > -1 And ActiveListbox.RowTag( ActiveListbox.ListIndex ) <> "Folder" Then CommonCore.UpdateSingleTVShowStatus
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewEditMetadata() As Boolean Handles ViewEditMetadata.Action
			'CommonActions( "EditInfo" )
			CommonCore.EditInfo
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewFullscreen() As Boolean Handles ViewFullscreen.Action
			Self.ToggleFullScreen
			
			'If IsFullScreen Then
			'mBarMain.Child( Menu.ViewEnterFullscreen ).Text = Menu.ViewExitFullscreen
			'Else
			'mBarMain.Child( Menu.ViewExitFullscreen ).Text = Menu.ViewEnterFullscreen
			'End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtBackdrop(index as Integer) As Boolean Handles ViewSortByArtBackdrop.Action
			CommonCore.SortByExtras( "Fanart" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtBanner(index as Integer) As Boolean Handles ViewSortByArtBanner.Action
			CommonCore.SortByExtras( "Banner" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtCharacterArt() As Boolean Handles ViewSortByArtCharacterArt.Action
			CommonCore.SortByExtras( "CharacterArt" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtClearArt(index as Integer) As Boolean Handles ViewSortByArtClearArt.Action
			CommonCore.SortByExtras( "ClearArt" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtDisc() As Boolean Handles ViewSortByArtDisc.Action
			CommonCore.SortByExtras( "DiscArt" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtExtraBackdrops(index as Integer) As Boolean Handles ViewSortByArtExtraBackdrops.Action
			CommonCore.SortByExtras( "ExtraFanart" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtExtraThumbs(index as Integer) As Boolean Handles ViewSortByArtExtraThumbs.Action
			CommonCore.SortByExtras( "ExtraThumbs" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtLogo(index as Integer) As Boolean Handles ViewSortByArtLogo.Action
			CommonCore.SortByExtras( "Logo" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtPoster(index as Integer) As Boolean Handles ViewSortByArtPoster.Action
			CommonCore.SortByExtras( "Poster" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByArtThumb(index as Integer) As Boolean Handles ViewSortByArtThumb.Action
			CommonCore.SortByExtras( "Landscape" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByMovieSortTitle() As Boolean Handles ViewSortByMovieSortTitle.Action
			'CommonActions( "MovieSortTitle" )
			CommonCore.SortByTitleSort
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByMovieTitle() As Boolean Handles ViewSortByMovieTitle.Action
			'CommonActions( "MovieTitle" )
			CommonCore.SortByTitle
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByNextAired() As Boolean Handles ViewSortByNextAired.Action
			'CommonActions( "NextAired" )
			CommonCore.SortByNextAired
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByPath(index as Integer) As Boolean Handles ViewSortByPath.Action
			'CommonActions( "Path" )
			CommonCore.SortByPath
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByPremiereDate(index as Integer) As Boolean Handles ViewSortByPremiereDate.Action
			'CommonActions( "PremiereDate" )
			CommonCore.SortByPremiereDate
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByQuality() As Boolean Handles ViewSortByQuality.Action
			'CommonActions( "Quality" )
			CommonCore.SortByQuality
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByRating(index as Integer) As Boolean Handles ViewSortByRating.Action
			'CommonActions( "Rating" )
			CommonCore.SortByRating
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByRuntime(index as Integer) As Boolean Handles ViewSortByRuntime.Action
			CommonCore.SortByRuntime
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortBySize() As Boolean Handles ViewSortBySize.Action
			CommonCore.SortBySize
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortBySubtitles() As Boolean Handles ViewSortBySubtitles.Action
			CommonCore.SortByExtras( "Subtitle" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByThemeSong() As Boolean Handles ViewSortByThemeSong.Action
			CommonCore.SortByExtras("Themesong")
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByTrailer() As Boolean Handles ViewSortByTrailer.Action
			CommonCore.SortByExtras( "Trailer" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByTVShowEpisodeFiles() As Boolean Handles ViewSortByTVShowEpisodeFiles.Action
			CommonCore.SortByEpisodes
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByTVShowSortTitle() As Boolean Handles ViewSortByTVShowSortTitle.Action
			'CommonActions( "ShowSortTitle" )
			CommonCore.SortByTitleSort
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByTVShowStatus() As Boolean Handles ViewSortByTVShowStatus.Action
			CommonCore.SortByStatus
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByTVShowTitle() As Boolean Handles ViewSortByTVShowTitle.Action
			'CommonActions( "ShowTitle" )
			CommonCore.SortByTitle
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSortByWatchedStatus() As Boolean Handles ViewSortByWatchedStatus.Action
			'CommonActions( "WatchedStatus" )
			CommonCore.SortByStatus
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowEpisodeManager() As Boolean Handles WindowEpisodeManager.Action
			If lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" Then wndEpisodeManager.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowMinimize() As Boolean Handles WindowMinimize.Action
			Self.Minimize
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowSetsmanager() As Boolean Handles WindowSetsmanager.Action
			If Trim( ccSearchBoxMovies.srchField.StringValue ) <> "" Then
			ccSearchBoxMovies.Reset
			wndMain.lstMovies.ListIndex = 0
			End If
			wndSetManager.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowTVGuide() As Boolean Handles WindowTVGuide.Action
			wndTVGuide.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowZoom() As Boolean Handles WindowZoom.Action
			Self.Maximize
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub CMActions(Action as String)
		  
		  If Action = "GetHash" Then
		    MsgBox Hash( FindMovieItem( GetFolderItem( ActiveListbox.Cell( ActiveListbox.ListIndex, 1 ), FolderItem.PathTypeShell ) ) )
		  End If
		  
		  // ----- Main Actions
		  Select case Action
		    
		    // List Actions
		  Case "ReloadList"
		    CommonCore.ReloadList
		    
		  Case "SortList"
		    CommonCore.SortList
		    
		    // Get Data
		  Case "FetchMetadata"
		    CommonCore.FetchMetadata
		    
		  Case "FetchMissingMetadata"
		    CommonCore.FetchMissingMetadata
		    
		  Case "ManualSearch"
		    CommonCore.ManualSearch
		    
		    // Modify data
		  Case "EditInfo"
		    CommonCore.EditInfo
		    
		    // --
		    
		  Case "UpdateSelection"
		    CommonCore.UpdateSingleItem
		    
		  Case "UpdateRating"
		    CommonCore.UpdateSingleRating
		    
		  Case "UpdateTVShowStatus"
		    CommonCore.UpdateSingleTVShowStatus
		    
		  Case "UpdateEpisodes"
		    CommonCore.UpdateEpisodes
		    
		    // --
		    
		  Case "UpdateAll"
		    CommonCore.UpdateMetadata
		    
		  Case "UpdateAllRatings"
		    CommonCore.UpdateAllRatings
		    
		  Case "UpdateAllTVShowStatus"
		    CommonCore.UpdateAllShowStatus
		    
		  Case "UpdateAllEpisodes"
		    CommonCore.UpdateAllEpisodes
		    
		    // --
		    
		  Case "UpdateNewEpisodes"
		    CommonCore.UpdateAllEpisodes( True )
		    
		    // --
		    
		  Case "LockedStatus"
		    CommonCore.MarkAsLocked
		    
		  Case "WatchedStatus"
		    CommonCore.MarkAsWatched
		    
		  Case "Rename"
		    CommonCore.RenameSelection
		    
		    // Show Item
		  Case "Reveal"
		    CommonCore.ShowInFinder
		    
		    // Watch
		  Case "WatchMovie"
		    CommonCore.WatchMovie
		    
		  Case "WatchTrailer"
		    CommonCore.WatchTrailer
		    
		    // Remove
		  Case "RemoveItem"
		    CommonCore.DeleteItem
		    
		  End Select
		  
		  // ----- Show on the web
		  Select Case Action
		    
		  Case "ShowListingIMDb"
		    CommonCore.ShowListingIMDb
		  Case "ShowListingTMDB"
		    CommonCore.ShowListingTMDB
		  Case "ShowListingTVDB"
		    CommonCore.ShowListingTVDB
		  Case "SearchGoogle"
		    CommonCore.ShowListingGoogle
		  Case "ShowListingWiki"
		    CommonCore.ShowListingWiki
		    
		  Case "TPB", "KAT", "META", "TOR", "LIME", "REACTOR", "LEETX", "RARBG", "EXTRAT", "EZTV", "HOUND", "TORDL", "SNOOP", "LOCK"
		    if TVAttr.TVNetwork.Contains( "Tokyo" ) OR _
		      TVAttr.TVNetwork.Contains( "FUNIMATION" ) OR _
		      TVAttr.TVNetwork = "MBS" OR _
		      TVAttr.TVNetwork = "AT-X" OR _
		      TVAttr.TVNetwork = "BS11" then
		      CommonCore.GetLatestEpisode( TVAttr.Title, Trim( lstTVShows.Cell( lstTVShows.ListIndex, 9 ).NthField(" - ", 1 ).ReplaceAll("&","").NthField("E",2) ), Action )
		    else
		      CommonCore.GetLatestEpisode( TVAttr.Title, Trim( lstTVShows.Cell( lstTVShows.ListIndex, 9 ).NthField(" - ", 1 ).ReplaceAll("&","") ), Action )
		    end if
		    
		  Case "YourTVSeries"
		    Dim EpisodeStr as String = lstTVShows.Cell( lstTVShows.ListIndex, 9 )
		    Dim Season  as String = "season-" + Trim( EpisodeStr.NthField(" - ",1).NthField("E",1).ReplaceAll("S","") )
		    Dim Episode as String = "-episode-" + Trim( EpisodeStr.NthField(" - ",1).NthField("E",2).ReplaceAll("E","") )
		    Dim EpisodeTitle as String = Season + Episode + "-" + Trim( EpisodeStr.NthField(" - ",2) ).ReplaceAll(" ", "-").ReplaceAll("…","...").ReplaceAll(",","")
		    CommonCore.GetLatestEpisode( TVAttr.Title, EpisodeTitle, "YourTVSeries" )
		  Case "YourTVSeriesAllEpisodes"
		    CommonCore.GetLatestEpisode( TVAttr.Title.ReplaceAll(" ", "-").ReplaceAll("…","...").ReplaceAll(",",""), "All", "YourTVSeriesAllEpisodes" )
		  End Select
		  
		  // ------ Sort Actions
		  Select Case Action
		    
		  Case "SortAscending"
		    CommonCore.SortAscending
		  Case "SortDescending"
		    CommonCore.SortDescending
		    
		  Case "SortByTitle"
		    CommonCore.SortByTitle
		  Case "SortByTitleSort"
		    CommonCore.SortByTitleSort
		    
		  Case "SortByPath"
		    CommonCore.SortByPath
		  Case "SortByWatched"
		    CommonCore.SortByStatus
		  Case "SortByPremiere"
		    CommonCore.SortByPremiereDate
		  Case "SortByQuality"
		    CommonCore.SortByQuality
		    
		  Case "SortByRating"
		    CommonCore.SortByRating
		  Case "SortBySize"
		    CommonCore.SortBySize
		  Case "SortByRuntime"
		    CommonCore.SortByRuntime
		    
		  Case "SortByNextAired"
		    CommonCore.SortByNextAired
		  Case "SortByShowStatus"
		    CommonCore.SortByStatus
		    
		  Case "SortByEpisodeFiles"
		    CommonCore.SortByEpisodes
		    
		  End Select
		  
		  // ----- Share Actions
		  Select Case Action
		    
		  Case "ShareOnFacebook"
		    CommonCore.ShareOn("Facebook")
		  Case "ShareOnTwitter"
		    CommonCore.ShareOn("Twitter")
		    
		  End Select
		  
		  // ----- GetArt
		  Select Case Action
		    
		  Case "GetMissingImages"
		    CommonCore.UpdateSingleImages
		    
		  Case "GetAllMissingImages"
		    CommonCore.UpdateAllImages
		    
		  Case "GetPoster"
		    CommonCore.GetImagePoster
		  Case "GetBackdrop"
		    CommonCore.GetImageBackdrop
		    
		  Case "GetLogo"
		    CommonCore.GetImageLogo
		  Case "GetBanner"
		    CommonCore.GetImageBanner
		  Case "GetClearArt"
		    CommonCore.GetImageClearArt
		  Case "GetThumb"
		    CommonCore.GetImageThumb
		  Case "GetCharacterArt"
		    CommonCore.GetImageCharacterArt
		  Case "GetDiscArt"
		    CommonCore.GetImageDiscArt
		    
		  Case "GetExtraThumbs"
		    CommonCore.GetImagesExtraThumbs
		  Case "GetExtraBackdrops"
		    CommonCore.GetImagesExtraBackdrops
		    
		  Case "GetTrailer"
		    CommonCore.GetMovieTrailer
		  Case "GetThemeSong"
		    CommonCore.GetThemeSong
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListSearch(SearchText as String)
		  Dim lstBox, SearchList as Listbox
		  Dim SectionName, Path as String
		  
		  Select Case ppMain.Value
		  Case 0
		    lstBox = lstMovies
		    Path = lstBox.Cell( lstBox.ListIndex, 1 )
		    SearchList = lstSearch
		    lstMovies.SearchList( SearchText )
		    SectionName = Loc.Movies
		  Case 1
		    lstBox = lstTVShows
		    Path = lstBox.Cell( lstBox.ListIndex, 1 )
		    SearchList = lstSearch
		    lstTVShows.SearchList( SearchText )
		    SectionName = Loc.TVShows
		  Case 2
		    'lstBox = lstAnime
		    'SectionName = Loc.Anime
		  End Select
		  
		  // Get listindex
		  Dim Lindex as Integer = 0
		  For i as Integer = 0 to lstBox.ListCount -1
		    If Path = lstBox.Cell( i, 1 ) Then
		      Lindex = i
		      Exit
		    End If
		  Next
		  If lstBox.ListCount -1 >= Lindex Then lstBox.ListIndex = Lindex
		  
		  'Select Case ppMain.Value
		  'Case 0
		  'lstMovies.SearchList( SearchText )
		  'Case 1
		  'lstTVShows.SearchList( SearchText )
		  'Case 2
		  ''lstAnime.SearchList( SearchText )
		  'End Select
		  
		  If ActiveSection = 1 Then lstBox = lstTVShadow
		  If SearchText <> "" Then
		    ActBar( ppMain.Value ).TextValue( Str( LstBox.ListCount ) + Loc.k1of2 + Str( SearchList.ListCount ) + " " + SectionName )
		  Else
		    If ActBar( ppMain.Value ) <> Nil Then ActBar( ppMain.Value ).TextValue( Str( LstBox.ListCount ) + " " + SectionName )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MenuConstructor(base as MenuItem, LstBox as listbox)
		  Dim miSeperator as New MenuItem( "-", "-" )
		  Dim Folder as Boolean = False
		  If LstBox.ListIndex > -1 And LstBox.ListIndex < LstBox.ListCount And LstBox.RowTag( LstBox.ListIndex ) = "Folder" Then Folder = True
		  
		  // ----- SearchWeb ----- //
		  Dim miSearchWeb as New MenuItem( Menu.CMMSearchTheWeb, "SearchTheWeb" )
		  
		  miSearchWeb.Append New MenuItem( loc.urlIMDBListing, "ShowListingIMDb" )
		  If ActiveSection = 0 Then miSearchWeb.Append New MenuItem( Loc.urlTMDBListing, "ShowListingTMDB" )
		  If ActiveSection = 1 Then miSearchWeb.Append New MenuItem( Loc.urlTVDBListing, "ShowListingTVDB" )
		  miSearchWeb.Append New MenuItem( Loc.urlGoogleListing, "SearchGoogle"  )
		  miSearchWeb.Append New MenuItem( Loc.urlWIKIListing, "ShowListingWiki" )
		  If ActiveSection = 1 Then
		    // YourTVSeri.es/YourTVSho.ws Alternative.
		  End If
		  
		  If Keyboard.AsyncAltKey And ActiveSection = 1 Then
		    miSearchWeb.Append New MenuItem( "-")
		    
		    'miSearchWeb.Append New MenuItem( Loc.urlKATEpisode, "KAT" )
		    'miSearchWeb.Child( Loc.urlKATEpisode ).Icon = ScaleImage( icokat, 16, 16 )
		    
		    'miSearchWeb.Append New MenuItem( loc.urlMetaSearchEpisode, "META" )
		    'miSearchWeb.Child( Loc.urlMetaSearchEpisode ).Icon = ScaleImage( icometa, 16, 16 )
		    
		    'miSearchWeb.Append New MenuItem( Loc.urlTOREpisode, "TOR" )
		    'miSearchWeb.Child( Loc.urlTOREpisode ).Icon = ScaleImage( icotorrentz, 16, 16 )
		    
		    dim mi as MenuItem
		    
		    mi = New MenuItem( Loc.urlThePirateBayEpisode, "TPB" )
		    mi.Icon = ScaleImage( icotpb, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on EZTV", "EZTV" )
		    mi.Icon = ScaleImage( icoeztv, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on TorrentReactor", "REACTOR" )
		    mi.Icon = ScaleImage( icotorrentreactor, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    
		    mi = New MenuItem( "Download episode on 1337x", "LEETX" )
		    mi.Icon = ScaleImage( icoleetx, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on ExtraTorrent", "EXTRAT" )
		    mi.Icon = ScaleImage( icoextratorrent, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on RARBG", "RARBG" )
		    mi.Icon = ScaleImage( icorarbg, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on LimeTorrents", "LIME" )
		    mi.Icon = ScaleImage( icolimetorrents, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on torrentHound", "HOUND" )
		    mi.Icon = ScaleImage( icotorrenthound, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on Torrent Downloads", "TORDL" )
		    mi.Icon = ScaleImage( icotorrentdownloads, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on BitSnoop", "SNOOP" )
		    mi.Icon = ScaleImage( icobitsnoop, 16, 16 )
		    miSearchWeb.Append( mi )
		    
		    mi = New MenuItem( "Download episode on TorLock", "LOCK" )
		    mi.Icon = ScaleImage( icotorlock, 16, 16 )
		    miSearchWeb.Append( mi )
		  End If
		  
		  If miSearchWeb.Child( Loc.urlIMDBListing )   <> Nil Then miSearchWeb.Child( Loc.urlIMDBListing ).Icon   = ScaleImage( icoimdb, 16, 16 )
		  If miSearchWeb.Child( Loc.urlTVDBListing )   <> Nil Then miSearchWeb.Child( Loc.urlTVDBListing ).Icon   = ScaleImage( icotvdb, 16, 16 )
		  If miSearchWeb.Child( Loc.urlTMDBListing )   <> Nil Then miSearchWeb.Child( Loc.urlTMDBListing ).Icon   = ScaleImage( icotmdb, 16, 16 )
		  If miSearchWeb.Child( Loc.urlGoogleListing ) <> Nil Then miSearchWeb.Child( Loc.urlGoogleListing ).Icon = ScaleImage( icogoogle, 16, 16 )
		  If miSearchWeb.Child( Loc.urlWIKIListing )   <> Nil Then miSearchWeb.Child( Loc.urlWIKIListing ).Icon   = ScaleImage( icowikipedia, 16, 16 )
		  
		  If ActiveSection = 0 Then miSearchWeb.Child( Loc.urlIMDBListing ).Enabled = ( LstBox = lstMovies And MovieAttr.ID_IMDB <> "" )
		  If ActiveSection = 0 Then miSearchWeb.Child( Loc.urlTMDBListing ).Enabled = ( LstBox = lstMovies And MovieAttr.ID_TMDB <> "" )
		  
		  If ActiveSection = 1 Then miSearchWeb.Child( Loc.urlIMDBListing ).Enabled = ( LstBox = lstTVShows And TVAttr.ID_IMDb <> "" )
		  If ActiveSection = 1 Then miSearchWeb.Child( Loc.urlTVDBListing ).Enabled = ( LstBox = lstTVShows And TVAttr.ID_TVDB <> "" )
		  
		  // ----- @END Search Web ----- //
		  
		  
		  // ----- @START Update ----- //
		  
		  Dim miUpdate as New MenuItem( Loc.PrefsUpdate, "Update" )
		  
		  miUpdate.Append New MenuItem( Loc.kSelection, "UpdateSelection"   ) // Update Selection
		  miUpdate.Append New MenuItem( Loc.kUpdateRating,     "UpdateRating"  ) // Update Rating
		  If ActiveSection = 1 Then
		    miUpdate.Append miSeperator.Clone
		    miUpdate.Append New MenuItem( Loc.kUpdateTVShowStatus, "UpdateTVShowStatus" ) // Update TV Show Status
		    miUpdate.Append New MenuItem( Loc.kEpisodes,     "UpdateEpisodes" ) // Update Episodes
		  End If
		  
		  // ----- @END Update ----- //
		  
		  
		  // Locked Status
		  
		  Dim miLockedStatus as New MenuItem( Menu.CMMMarkAsLocked, "LockedStatus" )
		  If ActiveSection = 0 And MovieAttr.Locked Then miLockedStatus.Text = Menu.CMMMarkAsUnlocked
		  If ActiveSection = 1 And TVAttr.Locked Then miLockedStatus.Text = Menu.CMMMarkAsUnlocked
		  
		  
		  // Watched Status
		  Dim miWatchedStatus as New MenuItem( Menu.CMMMarkAsWatched, "WatchedStatus" )
		  If ActiveSection = 0 And MovieAttr.StatusWatched Then miWatchedStatus.Text = Menu.CMMMarkAsUnwatched
		  
		  // Build menu
		  If DebugBuild And ActiveSection = 0 Then base.Append New MenuItem( "Get hash", "GetHash" )
		  base.Append New MenuItem( Loc.Refresh,           "ReloadList"    ) // Reload List
		  If LstBox.ListIndex < 0 OR Folder Then Return
		  base.Append MenuSortBy( LstBox )                                   // Sort By (>)
		  base.Append miSeperator.Clone                                      // ------
		  base.Append New MenuItem( Loc.FetchMetadata,     "FetchMetadata" ) // Fetch Metadata
		  base.Append New MenuItem( Menu.FileManualSearch, "ManualSearch"  ) // Manual Search...
		  base.Append New MenuItem( Menu.ViewEditMetadata, "EditInfo"      ) // Edit Metadata
		  base.Append miSeperator.Clone                                      // ------
		  base.Append miUpdate                                               // Update (>)
		  base.Append miLockedStatus                                         // Mark as Locked/Unlocked
		  If ActiveSection = 0 Then base.Append miWatchedStatus              // Mark as Watched/Unwatched
		  base.Append New MenuItem( Menu.ToolsRenameSelection, "Rename"    ) // Rename Selection
		  base.Append miSeperator.Clone                                      // ------
		  If MenuShare <> Nil Then base.Append MenuShare                     // Share (>)
		  base.Append miSearchWeb                                            // Search The Web (>)
		  If MenuExtraArt(LstBox) <> Nil And NOT App.DebugMode Then
		    base.Append MenuExtraArt( LstBox )                               // Extra Art (>)
		  End If
		  base.Append miSeperator.Clone                                      // ------
		  base.Append New MenuItem( Menu.FileShowInFinder,  "Reveal"       ) // Show in Finder
		  If ActiveSection = 0 Then
		    base.Append New MenuItem( Menu.CMMWatchMovie,   "WatchMovie"    ) // Watch Movie
		    base.Append New MenuItem( Menu.CMMWatchTrailer, "WatchTrailer"  ) // Watch Trailer
		  End If
		  base.Append miSeperator.Clone                                      // ------
		  Select Case ActiveSection                                          // Remove <item>...
		  case 0
		    base.Append New MenuItem( Menu.CMMRemoveMovie, "RemoveItem" )
		  case 1
		    base.Append New MenuItem( Menu.CMMRemoveTVShow, "RemoveItem" )
		  case 2
		    base.Append New MenuItem( Menu.CMMRemoveAnime, "RemoveItem" )
		  end select
		  
		  
		  // Enable List
		  Dim NFOFile as FolderItem
		  If ActiveSection = 0 Then
		    NFOFile = FindNFOFile( MovieAttr.FolderParent )
		  ElseIf ActiveSection = 1 Then
		    NFOFile = FindNFOFile( TVAttr.FolderParent )
		  End If
		  
		  base.Child( Menu.ToolsRenameSelection ).Enabled = ( NFOFile <> Nil AND NFOFile.Exists ) '( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )
		  miUpdate.Child( Loc.kSelection ).Enabled = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )
		  miUpdate.Child( Loc.kUpdateRating ).Enabled = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )
		  If LstBox = lstMovies Then
		    If base.Child( Menu.CMMMarkAsWatched )   <> Nil Then base.Child( Menu.CMMMarkAsWatched).Enabled   = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )
		    If base.Child( Menu.CMMMarkAsUnwatched ) <> Nil Then base.Child( Menu.CMMMarkAsUnwatched).Enabled = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )
		    'base.Child( Loc.kUpdateRating ).Enabled = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )
		    base.Child( Menu.CMMWatchTrailer ).Enabled = ( FindTrailerItem( MovieAttr.FolderParent ) <> Nil )
		    base.Child( Menu.CMMWatchMovie   ).Enabled = ( FindMovieItem(   MovieAttr.FolderParent ) <> Nil )
		  ElseIf LstBox = lstTVShows Then
		    miUpdate.Child( Loc.kUpdateTVShowStatus ).Enabled  = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )
		    miUpdate.Child( Loc.kEpisodes ).Enabled            = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MenuExtraArt(LstBox as Listbox) As MenuItem
		  If LstBox = lstMovies and MovieAttr.ID_IMDB = "" And MovieAttr.ID_TMDB = "" Then Return Nil
		  IF LstBox = lstTVShows and TVAttr.ID_IMDb = "" ANd TVAttr.ID_TVDB = "" Then Return Nil
		  
		  Dim miExtraArt  as New MenuItem( Menu.ToolsExtras, "GetExtras" )
		  Dim miSeperator as New MenuItem( "-", "-" )
		  
		  
		  // Menu Items
		  miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetMissing, "GetMissingImages" ) // Get Missing Images
		  miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetMissingAll, "GetAllMissingImages" ) // Get All Missing Images
		  miExtraArt.Append miSeperator.Clone                                                // ------
		  miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetPoster, "GetPoster"   )       // Download Poster...
		  miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetFanart, "GetBackdrop" )       // Download Backdrop...
		  If LstBox = lstTVShows Then
		    miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetBanner,   "GetBanner"   )     // Download Banner...
		  End If
		  miExtraArt.Append miSeperator.Clone                                                // ------
		  miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetLogo,     "GetLogo"     )     // Download Logo...
		  If LstBox = lstMovies Then
		    miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetBanner,   "GetBanner"   )     // Download Banner...
		  End If
		  miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetClearArt, "GetClearArt" )     // Download ClearArt...
		  miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetThumb,    "GetThumb"    )     // Download Thumb...
		  If LstBox = lstMovies Then
		    miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetDisc,     "GetDiscArt"    ) // Download Disc Art...
		    miExtraArt.Append miSeperator.Clone                                              // ------
		    miExtraArt.Append new MenuItem( Menu.ToolsExtraArtGetExtraThumbs, "GetExtraThumbs" ) // Download Extra Thumbs...
		    miExtraArt.Append new MenuItem( Menu.ToolsExtraArtGetExtraFanart, "GetExtraBackdrops" ) // Download Extra Fanart...
		    miExtraArt.Append miSeperator.Clone                                              // ------
		    miExtraArt.Append New MenuItem( Menu.ToolsExtraTrailer,           "GetTrailer" )
		  ElseIf LstBox = lstTVShows Then
		    miExtraArt.Append New MenuItem( Menu.ToolsExtraArtGetCharacterArt, "GetCharacterArt" ) // Download CharacterArt...
		    miExtraArt.Append miSeperator.Clone
		    miExtraArt.Append New MenuItem( Menu.ToolsExtraThemeSongs, "GetThemeSong" ) // Download Themesong
		  End If
		  
		  // Menu Icons
		  if Globals.IsDarkMode then
		    miExtraArt.Child( Menu.ToolsExtraArtGetPoster ).Icon = extra_poster_active 'NSImage.LoadByName( "extra_poster_active" )
		    miExtraArt.Child( Menu.ToolsExtraArtGetFanart ).Icon = extra_fanart_active
		    
		    miExtraArt.Child( Menu.ToolsExtraArtGetLogo ).Icon     = extra_logo_active
		    miExtraArt.Child( Menu.ToolsExtraArtGetBanner ).Icon   = extra_banner_active
		    miExtraArt.Child( Menu.ToolsExtraArtGetClearArt ).Icon = extra_clearart_active
		    miExtraArt.Child( Menu.ToolsExtraArtGetThumb ).Icon    = extra_landscape_active
		    If LstBox = lstMovies Then
		      miExtraArt.Child( Menu.ToolsExtraArtGetDisc ).Icon     = extra_discart_active
		      
		      miExtraArt.Child( Menu.ToolsExtraArtGetExtraThumbs ).Icon = extra_extrathumbs_active
		      miExtraArt.Child( Menu.ToolsExtraArtGetExtraFanart ).Icon = extra_extrafanart_active
		      
		      miExtraArt.Child( Menu.ToolsExtraTrailer ).Icon = extra_trailer_active
		    ElseIf LstBox = lstTVShows Then
		      miExtraArt.Child( Menu.ToolsExtraArtGetCharacterArt ).Icon = extra_character_active
		      miExtraArt.Child( Menu.ToolsExtraThemeSongs ).Icon = extra_themesong_active
		    End If
		    
		  else
		    miExtraArt.Child( Menu.ToolsExtraArtGetPoster ).Icon = extra_poster_inactive
		    miExtraArt.Child( Menu.ToolsExtraArtGetFanart ).Icon = extra_fanart_inactive
		    
		    miExtraArt.Child( Menu.ToolsExtraArtGetLogo ).Icon     = extra_logo_inactive
		    miExtraArt.Child( Menu.ToolsExtraArtGetBanner ).Icon   = extra_banner_inactive
		    miExtraArt.Child( Menu.ToolsExtraArtGetClearArt ).Icon = extra_clearart_inactive
		    miExtraArt.Child( Menu.ToolsExtraArtGetThumb ).Icon    = extra_landscape_inactive
		    If LstBox = lstMovies Then
		      miExtraArt.Child( Menu.ToolsExtraArtGetDisc ).Icon     = extra_discart_inactive
		      
		      miExtraArt.Child( Menu.ToolsExtraArtGetExtraThumbs ).Icon = extra_extrathumbs_inactive
		      miExtraArt.Child( Menu.ToolsExtraArtGetExtraFanart ).Icon = extra_extrafanart_inactive
		      
		      miExtraArt.Child( Menu.ToolsExtraTrailer ).Icon = extra_trailer_inactive
		    ElseIf LstBox = lstTVShows Then
		      miExtraArt.Child( Menu.ToolsExtraArtGetCharacterArt ).Icon = extra_character_inactive
		      miExtraArt.Child( Menu.ToolsExtraThemeSongs ).Icon = extra_themesong_inactive
		    End If
		  end if
		  
		  Return miExtraArt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MenuShare() As MenuItem
		  // Disable menu if no ID's are found.
		  If ActiveSection = 0 And ( MovieAttr.ID_TMDB = "" And MovieAttr.ID_IMDB = "" ) Then Return Nil
		  
		  Dim miShare as new MenuItem( Loc.kShare )
		  
		  miShare.Append New MenuItem( "Facebook", "ShareOnFacebook" )
		  miShare.Child( "Facebook").Icon = icofacebook
		  miShare.Append New MenuItem( "Twitter",  "ShareOnTwitter"  )
		  miShare.Child( "Twitter" ).Icon = icotweet
		  
		  Return miShare
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MenuSortBy(LstBox as Listbox) As MenuItem
		  Dim miSortBy    as New MenuItem( Menu.CMMSortList, "SortList" )
		  Dim miSeperator as New MenuItem( "-", "-" )
		  
		  // Ascending
		  miSortBy.Append New MenuItem( Menu.SortAscending, "SortAscending" )
		  If ActiveSection = 0 Then miSortBy.Child( Menu.SortAscending ).Checked = Preferences.Prefs.boolForKey("SortMovieAscending")
		  If ActiveSection = 1 Then miSortBy.Child( Menu.SortAscending ).Checked = Preferences.Prefs.boolForKey("SortTVAscending")
		  
		  // Descending
		  miSortBy.Append New MenuItem( Menu.SortDescending, "SortDescending" )
		  If ActiveSection = 0 Then miSortBy.Child( Menu.SortDescending ).Checked = NOT Preferences.Prefs.boolForKey("SortMovieAscending")
		  If ActiveSection = 1 Then miSortBy.Child( Menu.SortDescending ).Checked = NOT Preferences.Prefs.boolForKey("SortTVAscending")
		  
		  miSortBy.Append miSeperator.Clone // ----
		  
		  If LstBox = lstMovies Then
		    // Title
		    miSortBy.Append New MenuItem( Menu.ViewSortByMovieTitle,     "SortByTitle" )
		    miSortBy.Child( Menu.ViewSortByMovieTitle ).Checked     = ( Preferences.Prefs.integerForKey("SortByMovie") = 0 )
		    
		    // Title Sort
		    miSortBy.Append New MenuItem( Menu.ViewSortByMovieSortTitel, "SortByTitleSort" )
		    miSortBy.Child( Menu.ViewSortByMovieSortTitel ).Checked = ( Preferences.Prefs.integerForKey("SortByMovie") = 1 )
		  ElseIf LstBox = lstTVShows Then
		    // Title
		    miSortBy.Append New MenuItem( Menu.ViewSortByTVShowTitle,     "SortByTitle" )
		    miSortBy.Child( Menu.ViewSortByTVShowTitle ).Checked     = ( Preferences.Prefs.integerForKey("SortByTV") = 0 )
		    
		    // Title Sort
		    miSortBy.Append New MenuItem( Menu.ViewSortByTVShowSortTitle, "SortByTitleSort" )
		    miSortBy.Child( Menu.ViewSortByTVShowSortTitle ).Checked = ( Preferences.Prefs.integerForKey("SortByTV") = 1 )
		  End If
		  
		  miSortBy.Append miSeperator.Clone // ----
		  
		  // Path
		  miSortBy.Append New MenuItem( Menu.ViewSortByPath,          "SortByPath" )
		  If ActiveSection = 0 Then miSortBy.Child( Menu.ViewSortByPath ).Checked = ( Preferences.Prefs.integerForKey("SortByMovie") = 2 )
		  If ActiveSection = 1 Then miSortBy.Child( Menu.ViewSortByPath ).Checked = ( Preferences.Prefs.integerForKey("SortByTV") = 2 )
		  
		  If LstBox = lstMovies Then
		    // Watched Status
		    miSortBy.Append New MenuItem( Menu.ViewSortByWatchedStatus, "SortByWatched" )
		    miSortBy.Child( Menu.ViewSortByWatchedStatus ).Checked = ( Preferences.Prefs.integerForKey("SortByMovie") = 3 )
		  End If
		  
		  // Premiere date
		  miSortBy.Append New MenuItem( Menu.ViewSortByPremiereDate,  "SortByPremiere" )
		  If ActiveSection = 0 Then miSortBy.Child( Menu.ViewSortByPremiereDate ).Checked = ( Preferences.Prefs.integerForKey("SortByMovie") = 4 )
		  If ActiveSection = 1 Then miSortBy.Child( Menu.ViewSortByPremiereDate ).Checked = ( Preferences.Prefs.integerForKey("SortByTV") = 7 )
		  
		  If LstBox = lstMovies Then
		    // Quality
		    miSortBy.Append New MenuItem( Menu.ViewSortByQuality,       "SortByQuality" )
		    miSortBy.Child( Menu.ViewSortByQuality ).Checked = ( Preferences.Prefs.integerForKey("SortByMovie") = 5 )
		  End If
		  
		  If LstBox = lstTVShows Then
		    // Next Aired
		    miSortBy.Append New MenuItem( Menu.ViewSortByNextAired, "SortByNextAired" )
		    miSortBy.Child( Menu.ViewSortByNextAired ).Checked = ( Preferences.Prefs.integerForKey("SortByTV") = 3 )
		  End If
		  
		  // Rating
		  miSortBy.Append New MenuItem( Menu.ViewSortByRating,    "SortByRating" )
		  If ActiveSection = 0 Then miSortBy.Child( Menu.ViewSortByRating ).Checked = ( Preferences.Prefs.integerForKey("SortByMovie") = 6 )
		  If ActiveSection = 1 Then miSortBy.Child( Menu.ViewSortByRating ).Checked = ( Preferences.Prefs.integerForKey("SortByTV") = 4 )
		  
		  // Size
		  If LstBox = lstMovies Then
		    miSortBy.Append New MenuItem( Loc.kSize,                "SortBySize" )
		    miSortBy.Child( Loc.kSize ).Checked = ( ActiveListbox = lstMovies And Preferences.Prefs.integerForKey("SortByMovie") = 7 )
		  End If
		  
		  // Runtime
		  miSortBy.Append New MenuItem( Loc.kRuntime, "SortByRuntime" )
		  If ActiveSection = 0 Then miSortBy.Child( Loc.kRuntime ).Checked = ( Preferences.Prefs.integerForKey("SortByMovie") = 8 )
		  If ActiveSection = 1 Then miSortBy.Child( Loc.kRuntime ).Checked = ( Preferences.Prefs.integerForKey("SortByTV") = 6 )
		  
		  If LstBox = lstTVShows Then
		    // Show Status
		    miSortBy.Append New MenuItem( Menu.ViewSortByTVShowStatus, "SortByShowStatus" )
		    miSortBy.Child( Menu.ViewSortByTVShowStatus ).Checked = ( Preferences.Prefs.integerForKey("SortByTV") = 5 )
		    
		    // Episode files
		    miSortBy.Append New MenuItem( Loc.kEpisodeFiles, "SortByEpisodeFiles" )
		    miSortBy.Child( Loc.kEpisodeFiles ).Checked = ( Preferences.Prefs.integerForKey("SortByTV") = 8 )
		  End If
		  
		  Return miSortBy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MenuUpdate(lstbox as Listbox) As MenuItem
		  
		  'If lstbox.RowTag( lstbox.ListIndex ) = "Folder" Then Return Nil
		  Dim base as New MenuItem
		  
		  
		  // All
		  base.Append New MenuItem( Loc.kAll, "UpdateAll" )
		  base.Append New MenuItem( Menu.FileUpdateRatings, "UpdateAllRatings" )
		  If ActiveSection = 1 Then
		    base.Append New MenuItem( Menu.FileUpdateShowStatus, "UpdateAllTVShowStatus" )
		    base.Append New MenuItem( Loc.kUpdateEpisodes, "UpdateAllEpisodes" )
		  End If
		  
		  
		  // Selection
		  If lstbox.ListIndex > -1 And lstbox.RowTag( lstbox.ListIndex ) <> "Folder" Then
		    Dim f as FolderItem
		    If ActiveSection = 0 Then f = FindNFOFile( MovieAttr.FolderParent )
		    If ActiveSection = 1 Then f = FindNFOFile( TVAttr.FolderParent )
		    
		    If f <> Nil And f.Exists Then
		      base.Append New MenuItem( "-" )
		      base.Append New MenuItem( Loc.kSelection, "UpdateSelection" )
		      base.Append New MenuItem( Loc.kUpdateRating, "UpdateRating" )
		      If ActiveSection = 1 Then
		        base.Append New MenuItem( Loc.kUpdateTVShowStatus, "UpdateTVShowStatus" )
		        base.Append New MenuItem( Loc.kEpisodes, "UpdateEpisodes" )
		      End If
		    End If
		    
		  End If
		  
		  
		  // New
		  If ActiveSection = 1 Then
		    base.Append New MenuItem( "-" )
		    base.Append New MenuItem( Loc.kNewEpisodes, "UpdateNewEpisodes" )
		  End If
		  
		  Return base
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintList()
		  dim g as Graphics
		  g = OpenPrinterDialog
		  
		  if g <> Nil then
		    
		  else
		    Return
		  end if
		  
		  g.TextFont = "Verdana"
		  g.TextSize = 10
		  g.ForeColor = HSL( 0, 0, 0 )
		  dim pageLength as Integer = ( 672/ ( g.TextHeight + 2 ) ) // The number of liens that can fit on the page
		  // This can vary according to the size of the paper in the rpinter
		  
		  dim lines as Integer = 0
		  
		  // Title
		  g.Bold = True
		  g.DrawString "My Media Collection", 50, 40 + ( lines * ( g.TextHeight + 2 ) )
		  g.Bold = False
		  
		  // Listbox Content
		  dim lstBox as Listbox
		  Select case ppMain.Value
		  case 0
		    lstBox = lstMovies
		  case 1
		    lstBox = lstTVShows
		  case 2
		    //lstBox = lstAnime
		    
		  End Select
		  
		  if lstBox <> Nil then
		    for row as Integer = 0 to lstBox.LastIndex
		      g.DrawString lstBox.Cell( row, 0 ), 50, 80 + lines * ( g.TextHeight + 2 )
		      lines = lines + 1
		      
		      if lines > pageLength then
		        g.NextPage
		        lines = 0
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwitchPanels(Index as Integer)
		  'ToolButton( MainTB.Item( Index ) ).Pushed = True
		  
		  // Reset search
		  'If ppMain.Value = 0 And ccSearchBoxMovies.srchField.StringValue  <> "" Then ccSearchBoxMovies.Reset
		  'If ppMain.Value = 1 And ccSearchBoxTVShows.srchField.StringValue <> "" Then ccSearchBoxTVShows.Reset
		  
		  if Toolbar <> Nil then
		    Select case Index
		    case 0
		      toolbar.SelectedItemIdentifier = "MainMovies"
		    case 1
		      toolbar.SelectedItemIdentifier = "MainTVShows"
		    End Select
		  end if
		  
		  ppMain.Value = Index
		  
		  Return
		  
		  
		  #if TargetLinux then
		    'If NOT DebugBuild And App.Experimental And Index > 0 Then MessageBox "UNDER CONSTRUCTION!" + EndOfLine + EndOfLine + "The nothingness you see here is still being constructed, please disregard while the Developer is still building this section."
		    
		    
		    'If Index > 0 then ToolsMovies2Folders.Enabled = False Else ToolsMovies2Folders.Enabled = True
		    
		    // Set up the toolbuttons
		    If ScalingFactor( self ) = 2 Then
		      ToolButton( MainTB.Item( 0 ) ).Icon = tb_movies2x
		      ToolButton( MainTB.Item( 1 ) ).Icon = tb_television2x
		      ToolButton( MainTB.Item( 2 ) ).Icon = tb_anime2x
		      
		      If Index = 0 Then ToolButton( MainTB.Item( 0 ) ).Icon = tb_moviesselected2x
		      If Index = 1 Then ToolButton( MainTB.Item( 1 ) ).Icon = tb_televisionselected2x
		      If Index = 2 Then ToolButton( MainTB.Item( 2 ) ).Icon = tb_animeselected2x
		    Else
		      ToolButton( MainTB.Item( 0 ) ).Icon = tb_movies
		      ToolButton( MainTB.Item( 1 ) ).Icon = tb_television
		      ToolButton( MainTB.Item( 2 ) ).Icon = tb_anime
		      
		      If Index = 0 Then ToolButton( MainTB.Item( 0 ) ).Icon = tb_moviesselected
		      If Index = 1 Then ToolButton( MainTB.Item( 1 ) ).Icon = tb_televisionselected
		      If Index = 2 Then ToolButton( MainTB.Item( 2 ) ).Icon = tb_animeselected
		    End If
		    
		    // Debugging searchlist
		    If DebugBuild And lstSearch.Left > 0 Then
		      lstSearch.Left = ActBar( Index ).Width - 2
		      lstSearch.Width = Me.Width - ActBar( Index ).Width + 3
		    End If
		    
		    // Set up the search list
		    If Index = 0 Then
		      lstSearch.CopyFrom( lstMovies )
		      
		      If MovieAttr.FolderParent = Nil Then
		        If lstMovies.ListIndex > -1 Then MovieAttr.FolderParent = GetFolderItem( lstMovies.Cell( lstMovies.ListIndex, 1 ), FolderItem.PathTypeShell )
		        
		        If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then
		          MovieAttr.NFORead( MovieAttr.FolderParent )
		          If NOT App.DebugMode Then MovieAttr.LoadImages( MovieAttr.FolderParent )
		        End If
		        
		        cvsMovieDetails.Reload
		      End If
		      
		      If lstMovies.ListCount <= 0 And Preferences.Prefs.dictionaryForKey("MoviePaths") <> Nil And Preferences.Prefs.dictionaryForKey("MoviePaths").Count > 0 Then CommonCore.ReloadList
		    ElseIf Index = 1 Then
		      lstSearch.CopyFrom( lstTVShadow )
		      
		      If TVAttr.FolderParent = Nil Then
		        If lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" And lstTVShows.Cell( lstTVShows.ListIndex, 1 ) <> "" Then TVAttr.FolderParent = GetFolderItem( lstTVShows.Cell( lstTVShows.ListIndex, 1 ), FolderItem.PathTypeShell )
		        
		        If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then
		          TVAttr.NFORead( TVAttr.FolderParent )
		          If NOT App.DebugMode Then TVAttr.LoadImages( TVAttr.FolderParent )
		        End If
		        
		        cvsTVShowDetails.Reload
		      End If
		      
		      If lstTVShows.ListCount <= 0 And Preferences.Prefs.dictionaryForKey("TVShowPaths") <> Nil And Preferences.Prefs.dictionaryForKey("TVShowPaths").Count > 0 Then CommonCore.ReloadList
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test()
		  'wndBugReporter.Show
		  if True then
		    'wndTVGuide.Show
		    'wndTVGuide.Show
		    'dim t as Dictionary
		    't.Value( "Nil" ) = "Objection"
		    
		    'PrintList
		    
		    'ViMMCore.RenameEpisodes( TVAttr.FolderParent )
		    
		    'nc.Message("Test")
		    'CommonCore.FetchPilots( "" )
		    'wndTVGuide.Show
		    
		    
		    'Dim xDoc as New XmlDocument
		    'xDoc.LoadXml( s )
		    
		    
		    
		    'TVAttr.Locked = NOT TVAttr.Locked
		    'TVAttr.NFOWrite( TVAttr.FolderParent )
		    'lstTVShows.UpdateRow
		    'wndSplash.show
		    Return
		    
		    ViMMCore.GatherRecommendations()
		    Return
		    
		    CommonCore.MarkAsFavorite()
		    
		    Return
		    
		    'wndMainAlt.Show
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ProgressRunning As Boolean = False
	#tag EndProperty


#tag EndWindowCode

#tag Events ppMain
	#tag Event
		Sub Change()
		  
		  // Reset search
		  If ppMain.Value = 0 And ccSearchBoxMovies.srchField.StringValue  <> "" Then ccSearchBoxMovies.Reset
		  If ppMain.Value = 1 And ccSearchBoxTVShows.srchField.StringValue <> "" Then ccSearchBoxTVShows.Reset
		  
		  
		  // Menu Items visibility
		  'FileExport.Visible = DebugBuild' OR App.Experimental
		  FileExport.Visible = True
		  FileExportAsHTML.Visible = True
		  'FileExportAsHTML.Visible = DebugBuild
		  
		  ToolsTraktTV.Visible = false '( Me.Value = 0 ) // Trakt.tv support currently only for movies.
		  ToolsMovies2Folders.Visible  = ( Me.Value = 0 ) // Movies to Folders
		  WindowSetsmanager.Visible    = ( Me.Value = 0 ) // Sets Manager
		  WindowEpisodeManager.Visible = ( Me.Value = 1 OR Me.Value = 2 ) // Episodes Manager
		  
		  UpdateEpisodes.Visible   = ( Me.Value = 1 OR Me.Value = 2 )
		  UpdateAllEpisodes.Visible = ( Me.Value = 1 OR Me.Value = 2 )
		  UpdateNewEpisodes.Visible = ( Me.Value = 1 OR Me.Value = 2 )
		  
		  'ToolsMarkasLocked.Visible = ( Me.Value = 1 ) // Mark as Locked
		  ToolsMarkasWatched.Visible = ( Me.Value = 0 ) // Mark as Watched
		  MenuViewSortByMovie.Visible  = ( Me.Value = 0 ) // Sort by Movies
		  MenuToolsExtraDownloadsMovies.Visible = ( Me.Value = 0 ) // Download Movie Extras
		  
		  UpdateShowStatus.Visible = ( Me.Value = 1 OR Me.Value = 2 ) // Update Show Status
		  UpdateAllShowStatus.Visible = ( Me.Value = 1 OR Me.Value = 2 ) // Update ALL show status
		  
		  MenuViewSortByTVShow.Visible = ( Me.Value = 1 ) // Sort by TV Shows
		  MenuToolsExtraDownloadsShows.Visible = ( Me.Value = 1 ) // Download Show Extras
		  
		  
		  'If Me.Value < 3 Then
		  'ToolButton( MainTB.Item( me.Value ) ).Pushed = True
		  'End If
		  'For i as Integer = 0 to MainTB.Count - 1
		  'If MainTB.Item(i).Name = "MovieSets" Then MainTB.Item(i).Enabled = ( Me.Value = 0 )
		  'If MainTB.Item(i).Name = "tbiEpisodes" Then MainTB.Item(i).Enabled = ( Me.Value = 1 )
		  'Next
		  
		  
		  // Enable/Disable toolbar items
		  if Toolbar <> Nil then
		    Select case me.Value
		      
		    case 0
		      Toolbar.ItemByIdentifier("MainSets").Enabled = True
		      Toolbar.ItemByIdentifier("MainEpisodes").Enabled = False
		      'Toolbar.ItemByIdentifier("MainTVGuide").Enabled = False
		    case 1
		      Toolbar.ItemByIdentifier("MainSets").Enabled = False
		      Toolbar.ItemByIdentifier("MainEpisodes").Enabled = True
		      'Toolbar.ItemByIdentifier("MainTVGuide").Enabled = True
		      
		    End Select
		  end if
		  
		  
		  Preferences.Prefs.Value( "wndMainTab" ) = Me.Value
		  
		  Select Case me.Value
		    
		  Case 0
		    CommonCore.SectionName = Loc.Movies
		  Case 1
		    CommonCore.SectionName = Loc.TVShows
		  Case 2
		    CommonCore.SectionName = Loc.Anime
		    
		  End Select
		  
		  CheckMenuItems()
		  
		  
		  // Debugging searchlist
		  If DebugBuild And lstSearch.Left > 0 Then
		    lstSearch.Left = ActBar( me.Value ).Width - 2
		    lstSearch.Width = Me.Width - ActBar( me.Value ).Width + 3
		  End If
		  
		  // Set up the search list
		  If me.Value = 0 Then
		    lstSearch.CopyFrom( lstMovies )
		    
		    If MovieAttr.FolderParent = Nil Then
		      If lstMovies.ListIndex > -1 Then MovieAttr.FolderParent = GetFolderItem( lstMovies.Cell( lstMovies.ListIndex, 1 ), FolderItem.PathTypeShell )
		      
		      If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then
		        MovieAttr.NFORead( MovieAttr.FolderParent )
		        If NOT App.DebugMode Then MovieAttr.LoadImages( MovieAttr.FolderParent )
		      End If
		      
		      cvsMovieDetails.Reload
		    End If
		    
		    If lstMovies.ListCount <= 0 And Preferences.Prefs.dictionaryForKey("MoviePaths") <> Nil And Preferences.Prefs.dictionaryForKey("MoviePaths").Count > 0 Then CommonCore.ReloadList
		  ElseIf me.Value = 1 Then
		    lstSearch.CopyFrom( lstTVShadow )
		    
		    If TVAttr.FolderParent = Nil Then
		      If lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" And lstTVShows.Cell( lstTVShows.ListIndex, 1 ) <> "" Then TVAttr.FolderParent = GetFolderItem( lstTVShows.Cell( lstTVShows.ListIndex, 1 ), FolderItem.PathTypeShell )
		      
		      If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then
		        TVAttr.NFORead( TVAttr.FolderParent )
		        If NOT App.DebugMode Then TVAttr.LoadImages( TVAttr.FolderParent )
		      End If
		      
		      cvsTVShowDetails.Reload
		    End If
		    
		    If lstTVShows.ListCount <= 0 And Preferences.Prefs.dictionaryForKey("TVShowPaths") <> Nil And Preferences.Prefs.dictionaryForKey("TVShowPaths").Count > 0 Then CommonCore.ReloadList
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Value = 0
		  Me.Value = Preferences.Prefs.integerForKey("wndMainTab")
		  
		  
		  
		  'Select case me.Value
		  '
		  'case 0
		  'Toolbar.ItemByIdentifier("MainSets").Enabled = True
		  'Toolbar.ItemByIdentifier("MainEpisodes").Enabled = False
		  'Toolbar.ItemByIdentifier("MainTVGuide").Enabled = False
		  'case 1
		  'Toolbar.ItemByIdentifier("MainSets").Enabled = False
		  'Toolbar.ItemByIdentifier("MainEpisodes").Enabled = True
		  'Toolbar.ItemByIdentifier("MainTVGuide").Enabled = True
		  '
		  'End Select
		  
		  'Return
		  
		  'If Me.Value < 3 Then ToolButton( MainTB.Item( me.Value ) ).Pushed = True
		  '
		  'For i as Integer = 0 to MainTB.Count - 1
		  'If MainTB.Item(i).Name = "MovieSets" Then MainTB.Item(i).Enabled = ( Me.Value = 0 )
		  'If MainTB.Item(i).Name = "tbiEpisodes" Then MainTB.Item(i).Enabled = ( Me.Value = 1 )
		  'Next
		  '
		  'Preferences.Prefs.Value( "wndMainTab" ) = Me.Value
		  '
		  'Select Case me.Value
		  '
		  'Case 0
		  'CommonCore.SectionName = Loc.Movies
		  'Case 1
		  'CommonCore.SectionName = Loc.TVShows
		  'Case 2
		  'CommonCore.SectionName = Loc.Anime
		  '
		  'End Select
		  '
		  'CheckMenuItems()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstMovies
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  MenuConstructor base, Me
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  CMActions hitItem.Tag
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If Me.Cell( Me.ListIndex, 2 ) = "" then CommonCore.FetchMetadata Else CommonCore.EditInfo
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If ToolsMarkasWatched <> Nil Then
		    If Me.Cell( Me.ListIndex, 4 ) = "False" Then
		      ToolsMarkasWatched.Text = Menu.CMMMarkAsWatched
		    Else
		      ToolsMarkasWatched.Text = Menu.CMMMarkAsUnwatched
		    End If
		  End If
		  
		  
		  If NOT ProgressRunning Then
		    'ThrRefreshInfo.Kill
		    'ThrRefreshInfo.Run
		    tmRefreshInfo.Reset
		    tmRefreshInfo.Mode = 1
		  Else
		    MovieAttr.ClearProperties
		    If lstMovies.ListIndex > -1  And lstMovies.Cell( lstMovies.ListIndex, 1 ) <> "" Then
		      MovieAttr.FolderParent = GetFolderItem( lstMovies.Cell( lstMovies.ListIndex, 1 ), FolderItem.PathTypeShell )
		    End If
		    
		    If lstMovies.ListIndex > -1 And MovieAttr.FolderParent <> Nil and MovieAttr.FolderParent.Exists Then
		      MovieAttr.NFORead    MovieAttr.FolderParent
		      If NOT App.DebugMode Then MovieAttr.LoadImages MovieAttr.FolderParent
		      Dim MovieFile as FolderItem = FindMovieItem( MovieAttr.FolderParent )
		      If MovieFile <> Nil And MovieFile.Exists Then pthsMovie.URL = MovieFile.URLPath
		    ElseIf lstMovies.ListIndex > -1 Then
		      MsgBox Loc.msg404Movie
		      MovieAttr.FolderParent = Nil
		      pthsMovie.URL = ""
		    End If
		    
		    cvsMovieDetails.Reload
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  If Preferences.Prefs.integerForKey("MovieListSize") = 0 Then Preferences.Prefs.Value("MovieListSize") = 2
		  wndMain.lstMovies.DefaultRowHeight = Preferences.Prefs.integerForKey("MovieListSize") * 22
		  
		  'LoadMovieListImages.Run
		  tmrLoadMovieListImages.Mode = timer.ModeSingle
		  'dlgProgress.Start( Loc.kStarring, "Lists", 0, "LoadLists" )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ccSearchBoxMovies
	#tag Event
		Sub Open()
		  'Me.LiveSearch = True
		  me.srchField.SendWholeSearchString = False
		  me.srchField.SendSearchStringImmediately = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoSearch(SearchText as String)
		  If Me.LiveSearch And Len( SearchText ) < 2 Then Return
		  ListSearch( SearchText )
		End Sub
	#tag EndEvent
	#tag Event
		Sub ResetSearch()
		  ListSearch( "" )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ccSearchBoxTVShows
	#tag Event
		Sub DoSearch(SearchText as String)
		  'lstSearch.Search( SearchText, lstTVShows )
		  If Me.LiveSearch And Len( SearchText ) < 2 Then Return
		  ListSearch( SearchText )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'Me.LiveSearch = True
		  me.srchField.SendWholeSearchString = False
		  me.srchField.SendSearchStringImmediately = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub ResetSearch()
		  'ListSearch("")
		  Dim Path as String = lstTVShows.Cell( lstTVShows.ListIndex, 1 )
		  
		  lstTVShows.SortList
		  
		  For i as Integer = 0 to lstTVShows.ListCount -1
		    If Path = lstTVShows.Cell( i, 1 ) Then
		      lstTVShows.ListIndex = i
		      Exit
		    End If
		  Next
		  'lstTVShows.AddFolders()
		  '
		  'Dim s() as String = Preferences.Prefs.textStringArrayForKey( "TVShows Folders CollapseState" )
		  'Dim t as Integer = s.Ubound
		  'For i as Integer = 0 to lstTVShows.ListCount - 1
		  'If lstTVShows.RowTag(i) <> "Folder" Then Continue
		  'If t > -1 Then
		  'lstTVShows.Expanded(i) = ( s(t) = "True" )
		  't = t - 1
		  'End If
		  'Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ActBar
	#tag Event
		Sub Open(index as Integer)
		  me.ClearAttachments
		  
		  Select case index
		  case 0
		    'me.AttachLeft ccSearchBox
		    me.AttachLeft lstMovies
		    me.AttachRight cvsMovieDetails
		    Me.AttachRight pthsMovie
		    If DebugBuild Then Me.AttachRight lstSearch
		    
		  case 1
		    Me.AttachLeft lstTVShows
		    Me.AttachRight cvsTVShowDetails
		    Me.AttachRight PthsTVShows
		    If DebugBuild Then Me.AttachRight lstSearch
		    
		  case 2
		    
		  End Select
		  
		  ActBar( 0 ).TextValue( Str( lstMovies.ListCount ) + " " + Loc.Movies )
		  ActBar( 1 ).TextValue( Str( lstTVShadow.ListCount ) + " " + Loc.TVShows )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Moved(index as Integer, Distance as Integer)
		  Select case index
		  case 0
		    Preferences.Prefs.integerForKey("NSMoviesSidebarWidth")  = me.Width
		    ccSearchBoxMovies.Width = me.Width - 1
		    
		  case 1
		    Preferences.Prefs.integerForKey("NSTVShowsSidebarWidth") = me.Width
		    ccSearchBoxTVShows.Width = me.Width - 1
		  case 2
		    Preferences.Prefs.integerForKey("NSAnimeSidebarWidth")   = me.Width
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionMenu(index as Integer)
		  Dim base as New MenuItem
		  
		  Select Case Me.Index
		    
		  Case 0
		    MenuConstructor base, lstMovies
		    
		  Case 1
		    MenuConstructor base, lstTVShows
		    
		  Case 2
		    'MenuConstructor base, lstAnime
		    
		  End Select
		  
		  Dim HitItem as MenuItem = base.PopUp
		  If HitItem IsA object Then 'CommonActions( HitItem.Name )
		    CMActions hitItem.Tag
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionMinus(index as Integer)
		  'CommonActions "DeleteItem"
		  CommonCore.DeleteItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstTVShows
	#tag Event
		Sub Change()
		  'ThrRefreshInfo.Kill
		  'ThrRefreshInfo.Run
		  
		  If NOT ProgressRunning Then
		    tmRefreshInfo.Reset
		    tmRefreshInfo.Mode = 1
		    'ThrRefreshInfo.Kill
		    'ThrRefreshInfo.Run
		  Else
		    TVAttr.ClearProperties
		    If lstTVShows.ListIndex > -1 And lstTVShows.Cell( lstTVShows.ListIndex, 1 ) <> "" Then
		      TVAttr.FolderParent = GetFolderItem( lstTVShows.Cell( lstTVShows.ListIndex, 1 ), FolderItem.PathTypeShell )
		    End If
		    
		    If lstTVShows.ListIndex > -1 And TVAttr.FolderParent <> Nil and TVAttr.FolderParent.Exists Then
		      TVAttr.NFORead    TVAttr.FolderParent
		      If NOT App.DebugMode Then TVAttr.LoadImages TVAttr.FolderParent
		      PthsTVShows.URL = TVAttr.FolderParent.URLPath
		    ElseIf lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" Then
		      MsgBox Loc.msg404TV
		      TVAttr.FolderParent = Nil
		      PthsTVShows.URL = ""
		    End If
		    
		    cvsTVShowDetails.Reload
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  MenuConstructor( base, Me )
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  CMActions hitItem.Tag
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If Me.Cell( Me.ListIndex, 2 ) = "" then CommonCore.FetchMetadata Else CommonCore.EditInfo
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  If DebugBuild Then Me.SelectionType = Me.SelectionMultiple
		  
		  'LoadTVShowListImages.Run
		  tmrLoadTVShowListImages.Mode = timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsMovieDetails
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  MenuConstructor base, lstMovies
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  CMActions hitItem.Tag
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Width  = Me.Width - ActBar(0).Width + 1
		  #If TargetCocoa Then
		    Me.Height = Self.Height - pthsMovie.Height
		  #Else
		    Me.Height = Self.Height
		  #endif
		  'If NOT DebugBuild Or NOT App.Experimental Then Me.Height = self.Height
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // White BG Filler
		  If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = &c000000
		  g.FillRect 0, 0, me.Width, me.Height
		  
		  // Draw Backdrop
		  If MovieAttr.ART_Fanart = Nil Then Me.DrawBackdrop( g, Nil )
		  If ProgressRunning Then Me.DrawBackdrop( g, IMGmovies )
		  
		  g.HollidaysPainter
		  
		  If lstMovies.ListIndex < 0 Then Return 'OR ProgressRunning Then Return
		  
		  // Draw Backdrop
		  Me.DrawBackdrop( g, MovieAttr.ART_Fanart )
		  
		  // Draw Poster
		  If MovieAttr.ART_Poster <> Nil Then Me.DrawPoster( g, MovieAttr.ART_Poster, -1 ) 'MovieAttr.Rating )
		  
		  
		  
		  // ## Draw Studio Logo & Movie Logo if clearart is available.
		  Me.DrawLogoTop( g, MovieAttr.ART_Studio, MovieAttr.ART_Logo, MovieAttr.ART_ClearArt <> Nil )
		  
		  // ## Banner
		  If MovieAttr.ART_Banner <> Nil And Me.Width > 535 + 420 Then Me.DrawBanner( g, MovieAttr.ART_Banner )
		  
		  
		  // --- MetaTags
		  Dim MetaTagsTop as Integer = 10
		  Dim TagsLeft as Integer = 20
		  
		  g.ForeColor = &cFFFFFF
		  g.Bold = True
		  g.TextSize = 28
		  
		  If MovieAttr.ART_Banner <> Nil And Me.Width > 535 + 420 Then MetaTagsTop = MetaTagsTop + ( BannerOverlay.Height / 2 ) + 4' + 10
		  MetaTagsTop = me.Height - MetaTagsTop - 50
		  
		  // ## Rating
		  If MovieAttr.Rating > 0 And TagsLeft + 75 < Me.Width - 420 Then
		    g.DrawPicture metatagsrating, TagsLeft, MetaTagsTop, 75, 50, 0, 0, metatagsrating.Width, metatagsrating.Height
		    
		    Dim s as Integer = g.StringWidth( Str( MovieAttr.Rating ) )
		    g.DrawString( Str( MovieAttr.Rating ), TagsLeft + ( (75/2) - (s/2) ), MetaTagsTop + ( 50 - 14 ) )
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  // ## Resolution
		  g.TextSize = 18
		  If lstMovies.Cell( lstMovies.ListIndex, 6 ) <> "" And lstMovies.Cell( lstMovies.ListIndex, 6 ) <> "N/A" And TagsLeft + 75 < Me.Width - 420 Then
		    g.DrawPicture metatagsresolution, TagsLeft, MetaTagsTop, 75, 50, 0, 0, metatagsresolution.Width, metatagsresolution.Height
		    
		    Dim Resolution as String = lstMovies.Cell( lstMovies.ListIndex, 6 )
		    If Resolution = "SD" And MovieAttr.InfoVideoHeight > 0 Then Resolution = Str( MovieAttr.InfoVideoHeight ) + "p"
		    
		    g.DrawString( Resolution, TagsLeft + ( (75/2) - (g.StringWidth( Resolution )/2) ), MetaTagsTop + ( 50 - 18 ) )
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  // ## Ratio
		  g.TextSize = 16
		  If MovieAttr.InfoVideoAspect <> "" And TagsLeft + 75 < Me.Width - 420 Then
		    Dim i as Double = Val( MovieAttr.InfoVideoAspect.NthField(":",1) )
		    Dim Pic as Picture
		    
		    If i > 1 And i < 1.66 Then
		      Pic = metatagsratio133 //  4:3
		    ElseIf i >= 1.66 And i < 1.78 Then
		      Pic = metatagsratio166
		    ElseIf i >= 1.75 And i < 1.81 Then
		      Pic = metatagsratio178 // 16:9
		    ElseIf i >= 1.80 And i < 1.91 Then
		      Pic = metatagsratio185
		    ElseIf i >= 2.33 And i < 2.39 Then
		      Pic = metatagsratio235
		    ElseIf i >= 2.39 And i < 2.40 Then
		      Pic = metatagsratio239
		    ElseIf i = 2.4 Then
		      Pic = metatagsratio240
		    End If
		    
		    If MovieAttr.InfoVideoAspect =  "4:3" Then Pic = metatagsratio133
		    If MovieAttr.InfoVideoAspect = "16:9" Then Pic = metatagsratio178
		    
		    If Pic <> Nil Then
		      g.DrawPicture Pic, TagsLeft, MetaTagsTop, 75, 50, 0, 0, Pic.Width, Pic.Height
		    Else
		      g.DrawPicture metatagsratio, TagsLeft, MetaTagsTop, 75, 50, 0, 0, metatagsratio.Width, metatagsratio.Height
		      
		      g.DrawString( MovieAttr.InfoVideoAspect, TagsLeft + 3 + ( (75/2) - (g.StringWidth( MovieAttr.InfoVideoAspect )/2) ), MetaTagsTop + ( 50 - 20 ) )
		    End If
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  // ## VideoCodec
		  g.TextSize = 18
		  If MovieAttr.InfoVideoCodec <> "" And TagsLeft + 75 < Me.Width - 420 Then
		    
		    Dim Codec as String = MovieAttr.InfoVideoCodec.ReplaceAll("h264", "H.264")
		    Codec = Trim( Codec.ReplaceAll("AVC", "H.264") )
		    Codec = Trim( Codec.ReplaceAll("-","") )
		    Codec = Trim( Codec.ReplaceAll("Visual","") )
		    Codec = Trim( Codec.ReplaceAll("Video","") )
		    
		    Dim Pic as Picture
		    Select Case MovieAttr.InfoVideoCodec
		      
		    Case "h264"
		      Pic = metatagsvideoh264
		    Case "h.264"
		      Pic = metatagsvideoh264
		    Case "AVC"
		      Pic = metatagsvideoh264
		    case "mpeg"
		      Pic = metatagsvideompeg
		    case "MPEG Video"
		      Pic = metatagsvideompeg
		    case "MPEG-4 Visual"
		      Pic = metatagsvideodivx
		    case "MPEG4 Visual"
		      Pic = metatagsvideodivx
		    case "divx"
		      Pic = metatagsvideodivx
		    case "xvid"
		      Pic = metatagsvideoxvid
		    End Select
		    
		    Dim Codes() as String = Codec.Split("/")
		    If Codes.Ubound > -1 Then Codec = Codes( Codes.Ubound )
		    If Codec.InStr(0, "ISO") > 0 Then Codec = "ISO"
		    
		    If Pic <> Nil Then
		      g.DrawPicture Pic, TagsLeft, MetaTagsTop, 75, 50, 0, 0, Pic.Width, Pic.Height
		      TagsLeft = TagsLeft + 80
		    ElseIf Codec.Len < 6 Then
		      g.DrawPicture metatags, TagsLeft, MetaTagsTop, 75, 50, 0, 0, metatags.Width, metatags.Height
		      
		      g.DrawString( Codec, TagsLeft + ( (75/2) - (g.StringWidth( Codec )/2) ), MetaTagsTop + ( 50 - 18 ) )
		      TagsLeft = TagsLeft + 80
		    End If
		  End If
		  
		  // ## AudioCodec
		  If MovieAttr.InfoAudioCodec.Ubound > -1 And TagsLeft + 75 < Me.Width - 420 Then
		    
		    Dim Codec as String = MovieAttr.InfoAudioCodec(0).ReplaceAll("AC3", "AC-3")
		    Codec = Trim( Codec.ReplaceAll("Audio","") )
		    
		    Dim Pic as Picture
		    
		    Select Case MovieAttr.InfoAudioCodec(0)
		      
		    Case "AC-3"
		      Pic = metatagsaudioac3
		    Case "AC3"
		      Pic = metatagsaudioac3
		    Case "AAC"
		      Pic = metatagsaudioaac
		    Case "DTS"
		      Pic = metatagsaudiodts
		    case "dts_ma"
		      Pic = metatagsaudiodts_ma
		    Case "dtshd_ma"
		      Pic = metatagsaudiodtshd_ma
		    Case "MP3"
		      Pic = metatagsaudiomp3
		    Case "MPEG Audio"
		      Pic = metatagsaudiompeg
		    Case "WMA"
		      Pic = metatagsaudiowma
		    Case "TrueHD"
		      Pic = metatagsaudiotruehd
		      
		    End Select
		    
		    If Pic <> Nil Then
		      g.DrawPicture Pic, TagsLeft, MetaTagsTop, 75, 50, 0, 0, Pic.Width, Pic.Height
		      TagsLeft = TagsLeft + 80
		    ElseIf Codec.Len < 6 Then
		      g.DrawPicture metatags, TagsLeft, MetaTagsTop, 75, 50, 0, 0, metatags.Width, metatags.Height
		      
		      g.DrawString( Codec, TagsLeft + ( (75/2) - (g.StringWidth( Codec )/2) ), MetaTagsTop + ( 50 - 18 ) )
		      TagsLeft = TagsLeft + 80
		    End If
		  End If
		  
		  // ## AudioChannels
		  g.TextSize = 22
		  If MovieAttr.InfoAudioChannels.Ubound > -1 And TagsLeft + 75 < Me.Width - 420 Then
		    'g.DrawPicture( ScaleImage( metatagschannels, 75, 50 ), TagsLeft, MetaTagsTop )
		    g.DrawPicture metatagschannels, TagsLeft, MetaTagsTop, 75, 50, 0, 0, metatagschannels.Width, metatagschannels.Height
		    
		    
		    Dim Channels as Double = MovieAttr.InfoAudioChannels(0)
		    If Channels > 2 Then Channels = Channels - 0.9
		    
		    Dim Chan as String = Str( Channels )
		    If Chan.Len = 1 Then Chan = Chan + ".0"
		    If Chan = "11.1" Then Chan = "10.2"
		    If Chan = "23.1" Then Chan = "22.2"
		    
		    g.DrawString( Chan, TagsLeft - 12 + ( (75/2) - (g.StringWidth( Chan )/2) ), MetaTagsTop + (50 - 16) )
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  // ## MPAA Rating
		  If MovieAttr.ART_MPAARating <> Nil Then
		    If TagsLeft > 20 Then MetaTagsTop = MetaTagsTop - 55
		    g.ScaleImage MovieAttr.ART_MPAARating, 75, 50, 20, MetaTagsTop
		    
		    'TagsLeft = TagsLeft + 80
		  End If
		  
		  // -----
		  Dim TextTop as Integer = 13
		  Dim TextLeft as Integer = 20
		  If MovieAttr.ART_Poster <> Nil Then TextLeft = 184
		  
		  Dim RightBounds as Integer = 20
		  If MovieAttr.ART_Studio <> Nil OR ( MovieAttr.ART_ClearArt <> Nil And MovieAttr.ART_Logo <> Nil ) Then
		    RightBounds = 161 + 20 + 20
		  End If
		  
		  Dim Title as String = MovieAttr.Title
		  If MovieAttr.Title = "" Then
		    Title = lstMovies.Cell( wndMain.lstMovies.ListIndex, 0 )
		  ElseIf MovieAttr.DateYear > 0 Then
		    Title = Title + " (" + Str(MovieAttr.DateYear) + ")"
		  End If
		  
		  If Title.Len  >= 56 Then
		    g.TextSize = 14
		  ElseIf Title.Len >= 36 Then
		    g.TextSize = 18
		  Else
		    g.TextSize = 28
		  End If
		  g.Bold = True
		  TextTop = TextTop + g.TextSize
		  
		  // ## Write Title
		  If MovieAttr.Title <> "" Then
		    
		    Dim YearLeft as Integer = TextLeft + g.StringWidth( MovieAttr.Title )
		    If MovieAttr.DateYear > 0 Then
		      If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c000000 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		      g.Transparency = 40
		      g.DrawString " (" + Str( MovieAttr.DateYear ) + ")", YearLeft, TextTop - 1 // Year - Shadow
		      g.Transparency = 0
		    End If
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString MovieAttr.Title, TextLeft, TextTop + 1, Me.Width - 300 - RightBounds, True '84, True // Title - HiLite
		    If MovieAttr.DateYear > 0 Then g.DrawString " (" + Str( MovieAttr.DateYear ) + ")", YearLeft, TextTop + 1 // Year - HiLite
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString MovieAttr.Title, TextLeft, TextTop, Me.Width - 300 - RightBounds, True '84, True // Title
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c999999 Else g.ForeColor = RGBa( 100, 100, 100, .4 )
		    If MovieAttr.DateYear > 0 Then g.DrawString " (" + Str( MovieAttr.DateYear ) + ")", YearLeft, TextTop // Year
		  Else
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Title, TextLeft, TextTop + 1, Me.Width - 300 - RightBounds, True '300 - 84, True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Title, TextLeft, TextTop, Me.Width - 300 - RightBounds, True ' - 84, True
		  End If
		  
		  TextTop = TextTop + 18
		  
		  // ## Write Original Title
		  If MovieAttr.TitleOriginal <> "" And MovieAttr.TitleOriginal <> MovieAttr.Title Then
		    g.TextSize = 14
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString MovieAttr.TitleOriginal, TextLeft, TextTop + 1, Me.Width - 300 - RightBounds, True '84, True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c666666 Else g.ForeColor = RGBa( 100, 100, 100, .6 )
		    g.DrawString MovieAttr.TitleOriginal, TextLeft, TextTop, Me.Width - 300 - RightBounds, True '84, True
		    
		    TextTop = TextTop + 16
		  End If
		  
		  g.Bold     = False
		  g.Italic   = True
		  g.TextSize = 12
		  'TextTop    = TextTop + 18
		  
		  // ## Write Tagline
		  If MovieAttr.DescriptionTagline <> "" Then
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString MovieAttr.DescriptionTagline, TextLeft, TextTop + 1, Me.Width - TextLeft - RightBounds, False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c33333340 Else g.ForeColor = RGBa( 80, 80, 80, .75 )
		    g.DrawString MovieAttr.DescriptionTagline, TextLeft, TextTop,     Me.Width - TextLeft - RightBounds, False
		    
		    TextTop = TextTop + 4 + g.StringHeight( MovieAttr.DescriptionTagline, Me.Width - TextLeft - RightBounds )
		  End If
		  
		  // ## Write Duration - Size - Genre(s) - Premiere
		  Dim SubTagline as String
		  g.Italic = False
		  
		  // Duration
		  Dim Runtime as Integer = Val( lstMovies.Cell( lstMovies.ListIndex, 12 ) )
		  If Runtime > 0 Then SubTagline = PrettyTime( Runtime ) + " "
		  
		  // Movie file size
		  Dim size as Double = Val( lstMovies.Cell( lstMovies.ListIndex, 11 ) )
		  If Size > 0 Then
		    If SubTagline <> "" Then SubTagline = SubTagline + "- "
		    SubTagline = SubTagline + BytesToString( Size )
		  End If
		  
		  // Genre(s)
		  If MovieAttr.Genres.Ubound > -1 Then
		    If SubTagline <> "" Then SubTagline = SubTagline + "- "
		    
		    For i as Integer = 0 to 2
		      If MovieAttr.Genres.Ubound < i Then Continue
		      
		      If MovieAttr.Genres.Ubound > i And i < 2 Then
		        SubTagline = SubTagline + MovieAttr.Genres(i) + " | "
		      Else
		        SubTagline = SubTagline + MovieAttr.Genres(i) + " "
		      End If
		      
		    Next
		    
		  End If
		  
		  // Premiere
		  If MovieAttr.DatePremiered <> "" Then
		    If SubTagline <> "" Then SubTagline = SubTagline + "- "
		    
		    If lstMovies <> Nil Then SubTagline = SubTagline + PrettyDate( lstMovies.Cell( lstMovies.ListIndex, 5 ), True ) 'MovieAttr.DatePremiered, True )
		  End If
		  
		  // ## Write
		  If SubTagline <> "" Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString SubTagline, TextLeft, TextTop + 1, Me.Width - TextLeft - RightBounds, True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c555555 Else g.ForeColor = RGBa( 100, 100, 100, .67 )
		    g.DrawString SubTagline, TextLeft, TextTop, Me.Width - TextLeft - RightBounds, True
		    
		    g.Bold = False
		    
		    TextTop = TextTop + ( 18 * 2 )
		  End If
		  
		  // ## Write Plot
		  If MovieAttr.DescriptionPlot <> "" Then
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString MovieAttr.DescriptionPlot, TextLeft, TextTop + 1, Me.Width - TextLeft - RightBounds, False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString MovieAttr.DescriptionPlot, TextLeft, TextTop, Me.Width - TextLeft - RightBounds, False
		    
		    TextTop = TextTop + g.StringHeight( MovieAttr.DescriptionPlot, Me.Width - TextLeft - RightBounds ) + 12
		  End If
		  
		  
		  If TextTop < 255 Then TextTop = 255
		  TextLeft = 14
		  
		  // ----- High Ruler -----
		  'If MovieAttr.DescriptionPlot <> "" Then
		  'g.Transparency = 80
		  If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = RGBa( 0, 0, 0, .20 ) Else g.ForeColor = RGBa( 100, 100, 100, .6 )
		  '&c000000
		  g.DrawLine TextLeft, TextTop, Me.Width - 20, TextTop
		  'g.Transparency = 40
		  If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = RGBa( 100, 100, 100, .6 ) Else g.ForeColor = RGBa( 100, 100, 100, .10 )
		  '&cFFFFFF
		  g.DrawLine TextLeft, TextTop + 1, Me.Width - 20, TextTop + 1
		  'End If
		  
		  g.Transparency = 0
		  
		  // ## Draw ClearArt or Logo
		  Me.DrawLogoBottom( g, MovieAttr.ART_ClearArt, MovieAttr.ART_Logo )
		  
		  // ## Kijkwijzer
		  If MovieAttr.RatingMPAA <> "" Then
		    Dim MPAA as String = MovieAttr.RatingMPAA
		    Dim ImageLeft as Integer = Me.Width - 20 - 40
		    
		    Dim Kijkwijzer() as Picture = MPAA2Themes( MPAA )
		    If Kijkwijzer.Ubound > -1 Then
		      For i as Integer = 0 to Kijkwijzer.Ubound
		        g.DrawPicture Kijkwijzer(i), ImageLeft, TextTop + 10, 40, 40,   0, 0, Kijkwijzer(i).Width, Kijkwijzer(i).Height
		        ImageLeft = ImageLeft - 40 - 5
		      Next
		    End If
		    
		  End If
		  
		  
		  TextTop = TextTop + 22
		  TextLeft = 20
		  Dim txtLeft as Integer = TextLeft + 100
		  
		  // --- Credits
		  
		  // ## Director
		  If MovieAttr.CreditDirector <> "" Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Loc.mDirector, TextLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Loc.mDirector, TextLeft, TextTop
		    
		    g.Bold = False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString MovieAttr.CreditDirector, txtLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString MovieAttr.CreditDirector, txtLeft, TextTop
		    
		    TextTop = TextTop + 18
		  End If
		  
		  // ## Writer
		  If MovieAttr.CreditWriter <> "" Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Loc.mWriter, TextLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Loc.mWriter, TextLeft, TextTop
		    
		    g.Bold = False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString MovieAttr.CreditWriter, txtLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString MovieAttr.CreditWriter, txtLeft, TextTop
		    
		    TextTop = TextTop + 18
		  End If
		  
		  // ## Sound
		  If MovieAttr.CreditMusic <> "" Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Loc.mSound, TextLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Loc.mSound, TextLeft, TextTop
		    
		    g.Bold = False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString MovieAttr.CreditMusic, txtLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString MovieAttr.CreditMusic, txtLeft, TextTop
		    
		    TextTop = TextTop + 18
		  End If
		  
		  // ## Top 5 Actors
		  If MovieAttr.ActorStar.Ubound > -1 Or MovieAttr.ActorName.Ubound > -1 Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Loc.kActors, TextLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Loc.kActors, TextLeft, TextTop
		    
		    g.Bold = False
		  End If
		  
		  If MovieAttr.ActorStar.Ubound > -1 Then
		    Dim Actors as String
		    
		    For i as Integer = 0 to MovieAttr.ActorStar.Ubound
		      If Actors = "" Then
		        Actors = "★ " + MovieAttr.ActorStar(i)
		      Else
		        Actors = Actors + " ★ " + MovieAttr.ActorStar(i)
		      End If
		    Next
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Actors, txtleft, TextTop +1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Actors, txtleft, TextTop
		    
		    TextTop = TextTop + 18
		  ElseIf MovieAttr.ActorName.Ubound > -1 Then
		    Dim Actors as String
		    
		    For i as Integer = 0 to MovieAttr.ActorName.Ubound
		      If i = 3 Then Exit
		      
		      If Actors = "" Then
		        Actors = "★ " + MovieAttr.ActorName(i)
		      Else
		        Actors = Actors + " ★ " + MovieAttr.ActorName(i)
		      End If
		    Next
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Actors, txtleft, TextTop +1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Actors, txtleft, TextTop
		    
		    TextTop = TextTop + 18
		  End If
		  
		  g.ForeColor = rgb(202, 202, 202)
		  g.DrawLine 0, g.Height - 1, g.Width, g.Height - 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsTVShowDetails
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = &c000000
		  g.FillRect 0, 0, Me.Width, Me.Height
		  
		  // ## Backdrop
		  If TVAttr.ART_Fanart = Nil Then Me.DrawBackdrop( g, Nil )
		  
		  If ProgressRunning Then Me.DrawBackdrop( g, IMGtvshows )
		  
		  g.HollidaysPainter
		  
		  If lstTVShows.ListIndex < 0 OR lstTVShows.RowTag( lstTVShows.ListIndex ) = "Folder" Then Return 'OR ProgressRunning Then Return
		  
		  Me.DrawBackdrop( g, TVAttr.ART_Fanart )
		  
		  // ## Poster
		  Me.DrawPoster( g, TVAttr.ART_Poster, -1 ) 'TVAttr.Rating )
		  
		  
		  // ## Studio Logo & TV Logo if available.
		  Me.DrawLogoTop( g, TVAttr.ART_Studio, TVAttr.ART_Logo, TVAttr.ART_ClearArt <> Nil )
		  
		  // ## Banner
		  If TVAttr.ART_Banner <> Nil And Me.Width > 535 + 420 Then Me.DrawBanner( g, TVAttr.ART_Banner )
		  
		  // ----
		  Dim TextTop as Integer = 13
		  Dim TextLeft as Integer = 20
		  If TVAttr.ART_Poster <> Nil Then TextLeft = 184
		  
		  Dim RightBounds as Integer = 20
		  If TVAttr.ART_Studio <> Nil OR ( TVAttr.ART_ClearArt <> Nil And TVAttr.ART_Logo <> Nil ) OR TVAttr.ART_CharacterArt <> Nil Then
		    RightBounds = 161 + 20 + 20
		  End If
		  
		  Dim Title as String = TVAttr.Title
		  If TVAttr.Title = "" Then Title = lstTVShows.Cell( lstTVShows.ListIndex, 0 )
		  'If TVAttr.DateYear > 0 Then Title = Title + " (" + Str( TVAttr.DateYear ) + ")"
		  
		  // Title Size
		  If Title.Len >= 56 Then
		    g.TextSize = 14
		  ElseIf Title.Len >= 36 Then
		    g.TextSize = 18
		  Else
		    g.TextSize = 28
		  End If
		  g.Bold = True
		  TextTop = TextTop + g.TextSize
		  
		  
		  // ## Write Title
		  If Title <> "" Then
		    
		    // Year position
		    'Dim YearLeft as Integer = TextLeft + g.StringWidth( Title )
		    'If TVAttr.DateYear > 0 Then
		    'g.ForeColor = &c0000003C
		    'g.DrawString " (" + Str( TVAttr.DateYear ) + ")", YearLeft, TextTop - 1 // Year - Shadow
		    'End If
		    
		    // HiLite
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Title, TextLeft, TextTop + 1, Me.Width - TextLeft - RightBounds, False
		    'If TVAttr.DateYear > 0 Then g.DrawString " (" + Str( TVAttr.DateYear ) + ")", YearLeft, TextTop + 1
		    
		    // Forecolor
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Title, TextLeft, TextTop, Me.Width - TextLeft - RightBounds, False
		    
		    'g.ForeColor = &c999999
		    'If TVAttr.DateYear > 0 Then g.DrawString " (" + Str( TVAttr.DateYear ) + ")", YearLeft, TextTop
		    
		    TextTop = g.TextSize + g.StringHeight( Title, Me.Width - TextLeft - RightBounds )' + 4
		    'self.Title = Str( g.StringHeight( Title, Me.Width - TextLeft - RightBounds ) ) + " - " + Str( TextTop ) + " + " + s
		  End If
		  
		  
		  // ## Original Title
		  g.TextSize = 14
		  If TVAttr.TitleOriginal <> "" And TVAttr.TitleOriginal <> TVAttr.Title Then
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString TVAttr.TitleOriginal, TextLeft, TextTop + 1, Me.Width - TextLeft - RightBounds, False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c666666 Else g.ForeColor = RGBa( 100, 100, 100, .6 )
		    g.DrawString TVAttr.TitleOriginal, TextLeft, TextTop, Me.Width - TextLeft - RightBounds, False
		    
		    TextTop = TextTop + g.StringHeight( TVAttr.TitleOriginal, Me.Width - TextLeft - RightBounds )
		  End If
		  
		  
		  // ## Tagline
		  g.Bold = False
		  g.Italic = True
		  g.TextSize = 12
		  
		  If TVAttr.DescriptionTagline <> "" Then
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString TVAttr.DescriptionTagline, TextLeft, TextTop + 1, Me.Width - TextLeft - RightBounds, False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c33333340 Else g.ForeColor = RGBa( 80, 80, 80, .75 )
		    g.DrawString TVAttr.DescriptionTagline, TextLeft, TextTop, Me.Width - TextLeft - RightBounds, False
		    
		    TextTop = TextTop + g.StringHeight( TVAttr.DescriptionTagline, Me.Width - TextLeft - RightBounds ) + 4
		  End If
		  
		  
		  // ## Duration - Status - Genre(s) - Premiere
		  Dim SubTagline as String
		  g.Italic = False
		  
		  // Duration
		  Dim Runtime as Integer = TVAttr.DurationRuntime
		  If Runtime > 60 Then
		    SubTagline = PrettyTime( Runtime )
		  ElseIf Runtime > 0 Then
		    SubTagline = Str( Runtime ) + Trim( Loc.kMinutes ).Left(1).Lowercase
		  End If
		  
		  Dim ShowStatus as String = TVAttr.Status
		  If ShowStatus <> "" Then
		    If SubTagline <> "" Then SubTagline = SubTagline + " - "
		    SubTagline = SubTagline + ShowStatus
		  End If
		  
		  // Genres
		  Dim Genres as String
		  For i as Integer = 0 to TVAttr.Genres.Ubound
		    If i = 3 Then Exit
		    If Genres = "" Then
		      Genres = TVAttr.Genres(i)
		    Else
		      Genres = Genres + " | " + TVAttr.Genres(i)
		    End If
		  Next
		  
		  If SubTagline <> "" And Genres <> "" Then SubTagline = SubTagline + " - "
		  If Genres <> "" Then SubTagline = SubTagline + Genres
		  
		  // Premiered
		  If SubTagline <> "" And TVAttr.DatePremiered <> "" Then SubTagline = SubTagline + " - "
		  If TVAttr.DatePremiered <> "" Then  SubTagline = SubTagline + PrettyDate( TVAttr.DatePremiered )
		  
		  // ## Write
		  If SubTagline <> "" Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString SubTagline, TextLeft, TextTop + 1, Me.Width - TextLeft - RightBounds, True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c555555 Else g.ForeColor = RGBa( 100, 100, 100, .67 )
		    g.DrawString SubTagline, TextLeft, TextTop,     Me.Width - TextLeft - RightBounds, True
		    
		    g.Bold = False
		  End If
		  TextTop = TextTop + ( g.TextHeight * 2 )
		  
		  
		  // ## Plot
		  If TVAttr.DescriptionPlot <> "" Then
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString TVAttr.DescriptionPlot, TextLeft, TextTop + 1, Me.Width - TextLeft - RightBounds, False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString TVAttr.DescriptionPlot, TextLeft, TextTop,     Me.Width - TextLeft - RightBounds, False
		    
		    TextTop = TextTop + g.StringHeight( TVAttr.DescriptionPlot, Me.Width - TextLeft - RightBounds )
		  End If
		  
		  If TextTop < 255 Then TextTop = 255
		  TextLeft = 14
		  
		  // ----- High Ruler
		  'g.ForeColor = &c000000CC
		  'g.DrawLine TextLeft, TextTop, Me.Width - 20, TextTop
		  'g.ForeColor = &cFFFFFF66
		  'g.DrawLine TextLeft, TextTop +1, Me.Width - 20, TextTop +1
		  
		  // ## Bottom Logo/ClearArt
		  Me.DrawLogoBottom( g, TVAttr.ART_ClearArt, TVAttr.ART_Logo )
		  
		  // ## Kijkwijzer
		  If TVAttr.RatingMPAA <> "" Then
		    Dim ImageLeft as Integer = Me.Width - 20 - 40
		    Dim Kijkwijzer() as Picture = MPAA2Themes( TVAttr.RatingMPAA )
		    For i as Integer = 0 to Kijkwijzer.Ubound
		      g.DrawPicture Kijkwijzer(i), ImageLeft, TextTop + 10, 40, 40,  0, 0, Kijkwijzer(i).Width, Kijkwijzer(i).Height
		      ImageLeft = ImageLeft - 40 - 5
		    Next
		  End If
		  
		  
		  // ## MetaTags
		  Dim TagsLeft as Integer = 20
		  Dim MetaTagsTop as Integer = 10
		  If TVAttr.ART_Banner <> Nil And Me.Width > 535 + 420 Then MetaTagsTop = MetaTagsTop + ( BannerOverlay.Height / 2 ) + 4
		  MetaTagsTop = Me.Height - MetaTagsTop - 50
		  
		  // -- MPAA
		  If TVAttr.ART_MPAARating <> Nil Then
		    g.ScaleImage TVAttr.ART_MPAARating, 75, 50, TagsLeft, MetaTagsTop
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  // -- Rating
		  If TVAttr.Rating > 0 And TagsLeft + 75 < Me.Width - 420 Then
		    g.ForeColor = &cFFFFFF
		    g.Bold = True
		    g.TextSize = 28
		    
		    g.DrawPicture metatagsrating, TagsLeft, MetaTagsTop, 75, 50, 0, 0, metatagsrating.Width, metatagsrating.Height
		    
		    Dim s as Integer = g.StringWidth( Str( TVAttr.Rating ) )
		    g.DrawString( Str( TVAttr.Rating ), TagsLeft + ( (75/2) - (s/2) ), MetaTagsTop + ( 50 - 14 ) )
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  // ## Credits
		  g.TextSize = 13
		  TextTop = TextTop + 22
		  TextLeft = 20
		  Dim txtLeft as Integer = TextLeft + 100
		  
		  // Director
		  If TVAttr.CreditDirector <> "" Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Loc.mDirector, TextLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Loc.mDirector, TextLeft, TextTop
		    
		    g.Bold = False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString TVAttr.CreditDirector, TextLeft + 100, TextTop +1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString TVAttr.CreditDirector, TextLeft + 100, TextTop
		    
		    TextTop = TextTop + g.StringHeight( Loc.mDirector, 999 )
		  End If
		  
		  // Writer
		  If TVAttr.CreditWriter <> "" Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Loc.mWriter, TextLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Loc.mWriter, TextLeft, TextTop
		    
		    g.Bold = False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString TVAttr.CreditWriter, TextLeft + 100, TextTop +1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString TVAttr.CreditWriter, TextLeft + 100, TextTop
		    
		    TextTop = TextTop + g.StringHeight( Loc.mWriter, 999 )
		  End If
		  
		  // Sounds
		  If TVAttr.CreditMusic <> "" Then
		    g.Bold = True
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Loc.mSound, TextLeft, TextTop + 1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Loc.mSound, TextLeft, TextTop
		    
		    g.Bold = False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString TVAttr.CreditMusic, TextLeft + 100, TextTop +1
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString TVAttr.CreditMusic, TextLeft + 100, TextTop
		    
		    TextTop = TextTop + g.StringHeight( Loc.mSound, 999 )
		  End If
		  
		  If TVAttr.ART_CharacterArt <> Nil Then
		    Dim Top as Integer = 10
		    If TVAttr.ART_Studio <> Nil Then Top = Top + 109
		    If TVAttr.ART_Logo <> Nil And TVAttr.ART_ClearArt <> Nil Then Top = Top + 64
		    g.DrawPicture( TVAttr.ART_CharacterArt, g.Width - 30 - 128, Top, 128, 128,   0, 0, TVAttr.ART_CharacterArt.Width, TVAttr.ART_CharacterArt.Height )
		    'g.ForeColor = &cFF0000
		    'g.DrawRect( g.Width - 30 - 128, Top, 128, 128 )
		  End If
		  
		  'If DebugBuild OR App.Experimental Then
		  'g.ForeColor = &cFF0000
		  'g.DrawRect 0, 0, me.Width, me.Height - 1
		  'End If
		  
		  
		  g.ForeColor = rgb(202, 202, 202)
		  g.DrawLine 0, g.Height - 1, g.Width, g.Height - 1
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'Me.Height = self.Height
		  #If TargetCocoa Then
		    Me.Height = Self.Height - PthsTVShows.Height
		  #Else
		    Me.Height = Self.Height
		  #endif
		  'If DebugBuild Then Me.Height = self.Height - lstSearch.Height
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  MenuConstructor base, lstTVShows
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  CMActions hitItem.Tag
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events lstTVShadow
	#tag Event
		Sub Open()
		  Me.Width = 10
		  Me.Left = -800
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pthsMovie
	#tag Event
		Sub Action(clickedComponentCell as NSPathComponentCell)
		  'If clickedComponentCell = Nil Then Return
		  If clickedComponentCell = Nil OR clickedComponentCell.URL = "" Then Return
		  Dim f as FolderItem = GetFolderItem( clickedComponentCell.URL, FolderItem.PathTypeURL )
		  If f <> Nil And f.Exists Then f.RevealInFinder
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'Me.UseFocusRing = False
		  #If NOT TargetCocoa Then Me.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PthsTVShows
	#tag Event
		Sub Action(clickedComponentCell as NSPathComponentCell)
		  If clickedComponentCell = Nil Then Return
		  Dim f as FolderItem = GetFolderItem( clickedComponentCell.URL, FolderItem.PathTypeURL )
		  If f <> Nil And f.Exists Then f.RevealInFinder
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  #If NOT TargetCocoa Then Me.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events zThrRefreshInfo
	#tag Event
		Sub Run()
		  Select Case ppMain.Value
		    
		  Case 0
		    
		    MovieAttr.ClearProperties
		    If lstMovies.ListIndex > -1 And lstMovies.Cell( lstMovies.ListIndex, 1 ) <> "" Then
		      MovieAttr.FolderParent = GetFolderItem( lstMovies.Cell( lstMovies.ListIndex, 1 ), FolderItem.PathTypeShell )
		    Else
		      cvsMovieDetails.Reload
		      Return
		    End If
		    
		    If MovieAttr.FolderParent <> Nil and MovieAttr.FolderParent.Exists Then
		      MovieAttr.NFORead    MovieAttr.FolderParent
		      If NOT App.DebugMode Then MovieAttr.LoadImages MovieAttr.FolderParent
		    ElseIf lstMovies.ListIndex > -1 Then
		      MessageBox Loc.msg404Movie
		      MovieAttr.FolderParent = Nil
		    End If
		    cvsMovieDetails.Reload
		    
		    // Show poster in the list.
		    If lstMovies.ListIndex > -1 And lstMovies.RowTag( lstMovies.ListIndex ) <> "Folder" And lstMovies.CellTag( lstMovies.ListIndex, 15 ) = Nil Then
		      Dim ID as String = lstMovies.Cell( lstMovies.ListIndex, 2 )
		      
		      If Preferences.Prefs.boolForKey("ShowPostersInList") And ID <> "" Then
		        Dim Poster as FolderItem = FindImagePoster( MovieAttr.FolderParent )
		        Dim PCache as FolderItem = Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" )
		        
		        // Set cache image
		        If Poster IsA FolderItem And NOT PCache IsA FolderItem Then CacheImageSet( Picture.Open( Poster ), ID + ".movie.poster.jpg" )
		        
		        // Load Cached Poster
		        If PCache IsA FolderItem Then lstMovies.CellTag( lstMovies.ListIndex, 15 ) = ScaleImage( Picture.Open( PCache ), 128, 128 )
		        If NOT PCache IsA FolderItem And Poster IsA FolderItem Then lstMovies.CellTag( lstMovies.ListIndex, 15 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		        
		        // Don't forget the search list
		        lstSearch.CopyFrom( lstMovies )
		      End If
		      
		    End If
		    
		  Case 1
		    
		    TVAttr.ClearProperties
		    Dim t as String = lstTVShows.Cell( lstTVShows.ListIndex, 1 )
		    If lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" And lstTVShows.Cell( lstTVShows.ListIndex, 1 ) <> "" Then '.Cell( lstTVShows.ListIndex, 1 ) <> "" Then
		      TVAttr.FolderParent = GetFolderItem( lstTVShows.Cell( lstTVShows.ListIndex, 1 ), FolderItem.PathTypeShell )
		    Else
		      cvsTVShowDetails.Reload
		      Return
		    End If
		    
		    If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then
		      TVAttr.NFORead TVAttr.FolderParent
		      If NOT App.DebugMode Then TVAttr.LoadImages TVAttr.FolderParent
		    ElseIf lstTVShows.ListIndex > -1 Then
		      MessageBox Loc.msg404TV
		      TVAttr.FolderParent = Nil
		    End If
		    cvsTVShowDetails.Reload
		    
		    
		    // Show poster in the list.
		    If lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" And lstTVShows.CellTag( lstTVShows.ListIndex, 10 ) = Nil Then
		      Dim ID as String = lstTVShows.Cell( lstTVShows.ListIndex, 2 )
		      
		      If Preferences.Prefs.boolForKey("ShowPostersInList") And ID <> "" Then
		        Dim Poster as FolderItem = FindImagePoster( TVAttr.FolderParent )
		        Dim PCache as FolderItem = Preferences.fAppSupport.Child("Cache").Child( ID + ".television.poster.jpg" )
		        
		        // Set cache image
		        If Poster IsA FolderItem And NOT PCache IsA FolderItem Then CacheImageSet( Picture.Open( Poster ), ID + ".television.poster.jpg" )
		        
		        // Load Cached Poster
		        If PCache IsA FolderItem Then lstTVShows.CellTag( lstTVShows.ListIndex, 10 ) = ScaleImage( Picture.Open( PCache ), 128, 128 )
		        If NOT PCache IsA FolderItem And Poster IsA FolderItem Then lstTVShows.CellTag( lstTVShows.ListIndex, 10 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		        
		        // Don't forget the shadow list.
		        For i as Integer = 0 to lstTVShadow.ListCount -1
		          If lstTVShadow.Cell( i, 1 ) = lstTVShows.Cell( lstTVShows.ListIndex, 1 ) Then
		            lstTVShadow.CellTag( i, 10 ) = lstTVShows.CellTag( lstTVShows.ListIndex, 10 )
		            Exit
		          End If
		        Next
		        
		        // And the search list
		        lstSearch.CopyFrom( lstTVShadow )
		      End If
		      
		    End If
		    
		    
		  Case 2
		    
		    
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstSearch
	#tag Event
		Sub Open()
		  
		  'If DebugBuild Then
		  'Me.Visible = True
		  '
		  'Me.Width  = Self.Width - ActBar(0).Width + 2
		  'Me.Height = Me.Height + ActBar(0).Height
		  '
		  'Me.Top = 576
		  'Me.Left = ActBar(0).Width - 2
		  'Else
		  Me.Width = 100
		  Me.Left = -200
		  'End If
		  
		  'Me.ColumnWidths = "250, 0, 0, 0, 0, 0, 0, 0, 250, 250, 0, 0, *"
		End Sub
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If DebugBuild Then Self.Title = Me.Cell( row, column )
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tmRefreshInfo
	#tag Event
		Sub Action()
		  Select Case ppMain.Value
		    
		  Case 0
		    
		    MovieAttr.ClearProperties
		    If lstMovies.ListIndex > -1 And lstMovies.Cell( lstMovies.ListIndex, 1 ) <> "" Then
		      MovieAttr.FolderParent = GetFolderItem( lstMovies.Cell( lstMovies.ListIndex, 1 ), FolderItem.PathTypeShell )
		    Else
		      cvsMovieDetails.Reload
		      Return
		    End If
		    
		    If MovieAttr.FolderParent <> Nil and MovieAttr.FolderParent.Exists Then
		      MovieAttr.NFORead    MovieAttr.FolderParent
		      If NOT App.DebugMode Then MovieAttr.LoadImages MovieAttr.FolderParent
		      
		      Dim MovieFile as FolderItem = FindMovieItem( MovieAttr.FolderParent )
		      If MovieFile <> Nil And MovieFile.Exists Then pthsMovie.URL = MovieFile.URLPath
		      
		    ElseIf lstMovies.ListIndex > -1 Then
		      MessageBox Loc.msg404Movie
		      MovieAttr.FolderParent = Nil
		      pthsMovie.URL = ""
		    End If
		    cvsMovieDetails.Reload
		    
		    // Show poster in the list.
		    If lstMovies.ListIndex > -1 And lstMovies.RowTag( lstMovies.ListIndex ) <> "Folder" And lstMovies.CellTag( lstMovies.ListIndex, 15 ) = Nil Then
		      Dim ID as String = lstMovies.Cell( lstMovies.ListIndex, 2 )
		      
		      If Preferences.Prefs.boolForKey("ShowPostersInList") And ID <> "" Then
		        Dim Poster as FolderItem = FindImagePoster( MovieAttr.FolderParent )
		        Dim PCache as FolderItem = Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" )
		        
		        // Set cache image
		        If Poster IsA FolderItem And NOT PCache IsA FolderItem Then CacheImageSet( Picture.Open( Poster ), ID + ".movie.poster.jpg" )
		        
		        // Load Cached Poster
		        If PCache IsA FolderItem Then lstMovies.CellTag( lstMovies.ListIndex, 15 ) = ScaleImage( Picture.Open( PCache ), 128, 128 )
		        If NOT PCache IsA FolderItem And Poster IsA FolderItem Then lstMovies.CellTag( lstMovies.ListIndex, 15 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		        
		        // Don't forget the search list
		        lstSearch.CopyFrom( lstMovies )
		      End If
		      
		    End If
		    
		  Case 1
		    
		    TVAttr.ClearProperties
		    Dim t as String = lstTVShows.Cell( lstTVShows.ListIndex, 1 )
		    If lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" And lstTVShows.Cell( lstTVShows.ListIndex, 1 ) <> "" Then '.Cell( lstTVShows.ListIndex, 1 ) <> "" Then
		      TVAttr.FolderParent = GetFolderItem( lstTVShows.Cell( lstTVShows.ListIndex, 1 ), FolderItem.PathTypeShell )
		    Else
		      cvsTVShowDetails.Reload
		      Return
		    End If
		    
		    If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then
		      TVAttr.NFORead TVAttr.FolderParent
		      If NOT App.DebugMode Then TVAttr.LoadImages TVAttr.FolderParent
		      PthsTVShows.URL = TVAttr.FolderParent.URLPath
		    ElseIf lstTVShows.ListIndex > -1 Then
		      MessageBox Loc.msg404TV
		      TVAttr.FolderParent = Nil
		      PthsTVShows.URL = ""
		    End If
		    cvsTVShowDetails.Reload
		    
		    
		    // Show poster in the list.
		    If lstTVShows.ListIndex > -1 And lstTVShows.RowTag( lstTVShows.ListIndex ) <> "Folder" And lstTVShows.CellTag( lstTVShows.ListIndex, 10 ) = Nil Then
		      Dim ID as String = lstTVShows.Cell( lstTVShows.ListIndex, 2 )
		      
		      If Preferences.Prefs.boolForKey("ShowPostersInList") And ID <> "" Then
		        Dim Poster as FolderItem = FindImagePoster( TVAttr.FolderParent )
		        Dim PCache as FolderItem = Preferences.fAppSupport.Child("Cache").Child( ID + ".television.poster.jpg" )
		        
		        // Set cache image
		        If Poster IsA FolderItem And NOT PCache IsA FolderItem Then CacheImageSet( Picture.Open( Poster ), ID + ".television.poster.jpg" )
		        
		        // Load Cached Poster
		        If PCache IsA FolderItem and lstTVShadow.ListIndex > -1 Then lstTVShows.CellTag( lstTVShows.ListIndex, 10 ) = ScaleImage( Picture.Open( PCache ), 128, 128 )
		        If NOT PCache IsA FolderItem And Poster IsA FolderItem Then lstTVShows.CellTag( lstTVShows.ListIndex, 10 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		        
		        // Don't forget the shadow list.
		        For i as Integer = 0 to lstTVShadow.ListCount -1
		          If lstTVShadow.Cell( i, 1 ) = lstTVShows.Cell( lstTVShows.ListIndex, 1 ) Then
		            lstTVShadow.CellTag( i, 10 ) = lstTVShows.CellTag( lstTVShows.ListIndex, 10 )
		            Exit
		          End If
		        Next
		        
		        // And the search list
		        lstSearch.CopyFrom( lstTVShadow )
		      End If
		      
		    End If
		    
		    
		  Case 2
		    
		    
		  End Select
		  
		  Exception err as NilObjectException
		    Log( "Borked at refreshing the display" )
		    Return
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadMovieListImagesOLD
	#tag Event
		Sub Run()
		  'lstMovies.Enabled = False
		  'lstMovies.LoadList()
		  'If ActiveSection = 0 Then
		  'ActBar(0).TextValue( Str( lstMovies.ListCount ) + " " + Loc.Movies )
		  'lstSearch.CopyFrom( lstMovies )
		  'End If
		  '
		  'lstMovies.Enabled = True
		  
		  If NOT Preferences.Prefs.boolForKey("ShowPostersInList") Then
		    Me.Kill
		  End If
		  Dim lstBox as Listbox = lstMovies
		  
		  'ProgressRunning = True
		  'lstMovies.Enabled = False
		  
		  
		  
		  For i as Integer = 0 to lstBox.ListCount -1
		    If lstBox.Cell( i, 2 ) = "" Then Continue
		    Dim ID as String = lstBox.Cell( i, 2 )
		    
		    Dim f as FolderItem = GetFolderItem( lstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If f = Nil OR NOT f.Exists Then Continue
		    
		    Dim Poster as FolderItem = FindImagePoster( f )
		    
		    Dim pCache as FolderItem = Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" )
		    If pCache <> Nil And pCache.Exists Then
		      Poster = pCache
		    End If
		    
		    If Poster <> Nil And Poster.Exists Then lstBox.CellTag( i, 15 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		  Next
		  
		  If ActiveSection = 0 Then lstSearch.CopyFrom( lstBox )
		  
		  'ProgressRunning = False
		  'lstMovies.Enabled = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadTVShowListImagesOLD
	#tag Event
		Sub Run()
		  'ProgressRunning = True
		  'lstTVShows.Enabled = False
		  'lstTVShows.LoadList()
		  
		  // Select the first non-folder item.
		  'If lstTVShows.ListCount > 0 Then
		  'For i as Integer = 0 to lstTVShows.ListCount -1
		  'If lstTVShows.RowTag( i ) <> "Folder" Then
		  'lstTVShows.ListIndex = i
		  'Exit
		  'End If
		  'Next
		  'End If
		  
		  'If ActiveSection = 1 Then
		  'ActBar(1).TextValue( Str( lstTVShadow.ListCount ) + " " + Loc.TVShows )
		  'lstSearch.CopyFrom( lstTVShadow )
		  'End If
		  'ProgressRunning = False
		  
		  'lstTVShows.Enabled = True
		  
		  If NOT Preferences.Prefs.boolForKey("ShowPostersInList") OR lstTVShadow.ListCount = 0 Then Me.Kill
		  Dim lstBox as Listbox = lstTVShadow
		  
		  'ProgressRunning = True
		  'lstTVShows.Enabled = False
		  
		  For i as Integer = 0 to lstBox.ListCount -1
		    If lstBox.Cell( i, 2 ) = "" Then Continue
		    Dim ID as String = lstBox.Cell( i, 2 )
		    
		    Dim f as FolderItem = GetFolderItem( lstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If f = Nil OR NOT f.Exists Then Continue
		    
		    Dim Poster as FolderItem = FindImagePoster( f )
		    
		    Dim pCache as FolderItem = Preferences.fAppSupport.Child("Cache").Child( ID + ".television.poster.jpg" )
		    If pCache <> Nil And pCache.Exists Then
		      Poster = pCache
		    End If
		    
		    If Poster <> Nil And Poster.Exists Then lstBox.CellTag( i, 10 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		  Next
		  
		  If ActiveSection = 1 Then lstSearch.CopyFrom( lstBox )
		  lstTVShows.SortList
		  
		  'ProgressRunning = False
		  'lstTVShows.Enabled = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrLoadMovieListImages
	#tag Event
		Sub Action()
		  'lstMovies.Enabled = False
		  'lstMovies.LoadList()
		  'If ActiveSection = 0 Then
		  'ActBar(0).TextValue( Str( lstMovies.ListCount ) + " " + Loc.Movies )
		  'lstSearch.CopyFrom( lstMovies )
		  'End If
		  '
		  'lstMovies.Enabled = True
		  
		  If NOT Preferences.Prefs.boolForKey("ShowPostersInList") or lstMovies.ListCount = 0 Then
		    // Do nothing
		  else
		    Dim lstBox as Listbox = lstMovies
		    
		    'ProgressRunning = True
		    'lstMovies.Enabled = False
		    
		    
		    
		    For i as Integer = 0 to lstBox.ListCount -1
		      If lstBox.Cell( i, 2 ) = "" Then Continue
		      Dim ID as String = lstBox.Cell( i, 2 )
		      
		      Dim f as FolderItem = GetFolderItem( lstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		      If f = Nil OR NOT f.Exists Then Continue
		      
		      Dim Poster as FolderItem = FindImagePoster( f )
		      
		      Dim pCache as FolderItem = Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" )
		      If pCache <> Nil And pCache.Exists Then
		        Poster = pCache
		      End If
		      
		      If Poster <> Nil And Poster.Exists Then lstBox.CellTag( i, 15 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		    Next
		    
		    If ActiveSection = 0 Then lstSearch.CopyFrom( lstBox )
		    
		    'ProgressRunning = False
		    'lstMovies.Enabled = True
		    lstMovies.Invalidate
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrLoadTVShowListImages
	#tag Event
		Sub Action()
		  'ProgressRunning = True
		  'lstTVShows.Enabled = False
		  'lstTVShows.LoadList()
		  
		  // Select the first non-folder item.
		  'If lstTVShows.ListCount > 0 Then
		  'For i as Integer = 0 to lstTVShows.ListCount -1
		  'If lstTVShows.RowTag( i ) <> "Folder" Then
		  'lstTVShows.ListIndex = i
		  'Exit
		  'End If
		  'Next
		  'End If
		  
		  'If ActiveSection = 1 Then
		  'ActBar(1).TextValue( Str( lstTVShadow.ListCount ) + " " + Loc.TVShows )
		  'lstSearch.CopyFrom( lstTVShadow )
		  'End If
		  'ProgressRunning = False
		  
		  'lstTVShows.Enabled = True
		  
		  If NOT Preferences.Prefs.boolForKey("ShowPostersInList") OR lstTVShadow.ListCount = 0 Then
		    // Do nothing
		  else
		    Dim lstBox as Listbox = lstTVShadow
		    
		    'ProgressRunning = True
		    'lstTVShows.Enabled = False
		    
		    For i as Integer = 0 to lstBox.ListCount -1
		      If lstBox.Cell( i, 2 ) = "" Then Continue
		      Dim ID as String = lstBox.Cell( i, 2 )
		      
		      Dim f as FolderItem = GetFolderItem( lstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		      If f = Nil OR NOT f.Exists Then Continue
		      
		      Dim Poster as FolderItem = FindImagePoster( f )
		      
		      Dim pCache as FolderItem = Preferences.fAppSupport.Child("Cache").Child( ID + ".television.poster.jpg" )
		      If pCache <> Nil And pCache.Exists Then
		        Poster = pCache
		      End If
		      
		      If Poster <> Nil And Poster.Exists Then lstBox.CellTag( i, 10 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		    Next
		    
		    If ActiveSection = 1 Then lstSearch.CopyFrom( lstBox )
		    lstTVShows.SortList
		    
		    'ProgressRunning = False
		    'lstTVShows.Enabled = True
		  End If
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
		Name="ProgressRunning"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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

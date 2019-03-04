#tag Window
Begin Window wndPreviewThumbs
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1167647679
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   True
   Title           =   "Thumb Previewer"
   Visible         =   True
   Width           =   600
   Begin ccCancelSave CancelSave
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      CaptionCancel   =   ""
      CaptionOK       =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   380
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   358
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
   End
   Begin ccThumbView ccThumbs
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   346
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaxCols         =   0
      MaxRows         =   0
      MaxRowsOnScreen =   0
      Scope           =   0
      Selection       =   -1
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      ThumbSize       =   128
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   600
   End
   Begin Slider sldThumbSize
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   512
      Minimum         =   32
      PageStep        =   20
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   "0"
      Top             =   358
      Transparent     =   False
      Value           =   128
      Visible         =   True
      Width           =   298
   End
   Begin Label lblSize
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   330
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "###"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   38
   End
   Begin ProgressBar pgBar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   416
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   348
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Preferences.SaveWindowPos( Self, "wndArtPreview" )
		  wndMain.ProgressRunning = False
		  wndMain.lstMovies.Enabled = True
		  wndMain.lstTVShows.Enabled = True
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  'self.Show
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Preferences.LoadWindowPos( Self, "wndArtPreview" )
		  
		  wndMain.ProgressRunning = True
		  wndMain.lstMovies.Enabled = False
		  wndMain.lstTVShows.Enabled = False
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub Init(Images() as Picture, Optional Dimensions() as String, Optional Locations() as String, CurrentMode as String, CurrentSeason as Integer = - 1)
		  If Images.Ubound     > -1 Then ccThumbs.Thumbs     = Images
		  If Dimensions.Ubound > -1 Then ccThumbs.Dimensions = Dimensions
		  If Locations.Ubound  > -1 Then ccThumbs.Locations  = Locations
		  Mode = CurrentMode
		  Season = CurrentSeason
		  
		  If Images.Ubound > -1 Then
		    Self.Title = Str( Images.Ubound +1 ) + " " + Loc.kImages.Lowercase
		  Else
		    Self.Title = ""
		  End If
		  
		  ccThumbs.cvsPreview.Reload
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveImage()
		  Dim ImageDestination, ImageFile as FolderItem
		  Dim Title, Type as String
		  Dim tmpPic as Picture
		  
		  Select Case ActiveSection
		    
		  Case 0
		    ImageDestination = MovieAttr.FolderParent
		    Title = MovieAttr.Title
		    
		  Case 1
		    ImageDestination = TVAttr.FolderParent
		    Title = TVAttr.Title
		    
		  Case 2
		    'ImageDestination = AnimeAttr.FolderParent
		    'Title = AnimeAttr.Title
		    
		  End Select
		  
		  'lblSize.Visible = False
		  'sldThumbSize.Visible = False
		  'CancelSave.Enabled = False
		  
		  'pgBar.Visible = True
		  'pgBar.Top = sldThumbSize.Top
		  
		  Dim SeasonName as String
		  
		  Select Case Mode
		    
		    // Movies@TMDB
		  Case "Posters"
		    If ActiveSection = 0 Then
		      ImageFile = MovieAttr.DestinationPoster( ImageDestination )
		    Else
		      ImageFile = ImageDestination.Child("poster.jpg")
		    End If
		    Type = Loc.kPoster
		    
		  Case "Backdrops"
		    If ActiveSection = 0 Then
		      ImageFile = MovieAttr.DestinationFanart( ImageDestination )
		    Else
		      ImageFile = ImageDestination.Child("fanart.jpg")
		    End If
		    Type = Loc.kFanart
		    
		    
		  Case "Banners"
		    If ActiveSection = 0 Then
		      ImageFile = MovieAttr.DestinationBanner( ImageDestination )
		    Else
		      ImageFile = ImageDestination.Child("banner.jpg")
		    End If
		    Type = Loc.kBanner
		    
		  Case "ClearArt"
		    ImageFile = ImageDestination.Child("clearart.png")
		    Type = Loc.kClearArt
		    
		  Case "Logos"
		    ImageFile = ImageDestination.Child("logo.png")
		    Type = Loc.kLogo
		    
		  Case "Thumbs"
		    ImageFile = ImageDestination.Child("landscape.jpg")
		    Type = Loc.kThumb
		    
		  Case "DiscArt"
		    ImageFile = ImageDestination.Child("disc.png")
		    Type = Loc.kDiscArt
		    
		  Case "CharacterArt"
		    ImageFile = ImageDestination.Child("character.png")
		    Type = Loc.kCharacterArt
		    
		    
		    
		  Case "SeasonThumb"
		    SeasonName = "season%S-landscape.jpg"
		    If Season = 0 Then SeasonName = "season-specials-landscape.jpg"
		    If Season < 0 Then SeasonName = "season-all-landscape.jpg"
		    
		    // YAMJ
		    If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		      SeasonName = "season %S.landscape.jpg"
		      If Season = 0 Then SeasonName = "specials.landscape.jpg"
		      If Season < 0 Then SeasonName = "seasonall.landscape.jpg"
		    End If
		    
		    Type = Loc.kSeasonThumb
		    
		  Case "SeasonPoster"
		    SeasonName = "season%S-poster.jpg"
		    If Season = 0 Then SeasonName = "season-specials-poster.jpg"
		    If Season < 0 Then SeasonName = "season-all-poster.jpg"
		    
		    Type = Loc.kSeason + " " + Loc.kPoster
		    
		  Case "SeasonBanner"
		    SeasonName = "season%S-banner.jpg"
		    If Season = 0 Then SeasonName = "season-specials-banner.jpg"
		    If Season < 0 Then SeasonName = "season-all-banner.jpg"
		    
		    // YAMJ
		    If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		      SeasonName = "season %S.banner.jpg"
		      If Season = 0 Then SeasonName = "specials.banner.jpg"
		      If Season < 0 Then SeasonName = "seasonall.banner.jpg"
		    End If
		    
		    Type = Loc.kSeason + " " + Loc.kBanner
		    
		  Case "SeasonFanart"
		    SeasonName = "season%S-fanart.jpg"
		    If Season = 0 Then SeasonName = "season-specials-fanart.jpg"
		    If Season < 0 Then SeasonName = "season-all-fanart.jpg"
		    
		    // YAMJ
		    If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		      SeasonName = "season %S.fanart.jpg"
		      If Season = 0 Then SeasonName = "specials.fanart.jpg"
		      If Season < 0 Then SeasonName = "seasonall.fanart.jpg"
		    End If
		    
		    Type = Loc.kSeason + " " + Loc.kFanart
		    
		  End Select
		  
		  
		  // Season location
		  If Mode.InStr( 0, "Season" ) > 0 Then
		    
		    'If Season = -1 Then Season = 1
		    
		    Dim SeasonDisplay as String = Str( Season )
		    If SeasonDisplay.Len = 1 And Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then SeasonDisplay = "0" + SeasonDisplay
		    
		    If Season = 0 Then
		      'If ImageDestination.Child("Specials").Exists Then ImageDestination = ImageDestination.Child("Specials")
		      ImageFile = ImageDestination.Child( SeasonName.ReplaceAll( "%S", "all" ) )
		    Else
		      'If ImageDestination.Child( "Season " + SeasonDisplay ).Exists Then 'SeasonName.ReplaceAll( "%S", SeasonDisplay ) ).Exists Then
		      'ImageFile = ImageDestination.Child( "Season " + SeasonDisplay ).Child( SeasonName.ReplaceAll( "%S", SeasonDisplay ) )
		      'ElseIf ImageDestination.Child( TVAttr.Title.ReplaceAll( ":", " - " ) ) <> Nil And ImageDestination.Child( TVAttr.Title.ReplaceAll( ":", " - " ) ).Exists Then
		      'ImageFile = ImageDestination.Child( TVAttr.Title ).Child( SeasonName.ReplaceAll( "%S", SeasonDisplay ) )
		      'End If
		      
		      If ImageFile = Nil Then ImageFile = TVAttr.FolderParent.Child( SeasonName.ReplaceAll( "%S", SeasonDisplay ) )
		      'ImageFile = ImageDestination.Child( SeasonName.ReplaceAll( "%S", SeasonDisplay ) )
		      ImageDestination = ImageFile.Parent
		      
		    End If
		    
		  End If
		  
		  
		  
		  Dim c1 as Integer = ccThumbs.Selection
		  Dim c2 as Integer = ccThumbs.Locations.Ubound
		  
		  If ImageFile <> Nil And ImageFile.Exists Then
		    If MsgDlg( Nil, 1, msgPriorArtFound.ReplaceAll("<image>", Type.Lowercase).ReplaceAll("<title>", Title), msgPriorArtDeletion.ReplaceAll("<image>", Type.Lowercase), Loc.dlgReplace, Loc.dlgCancel ) = 1 Then
		      If ImageFile <> Nil ANd ImageFile.IsWriteable Then
		        If ImageFile.IsNetworkVolume Then ImageFile.Delete Else ImageFile.MoveToTrash()
		      End If
		      ImageFile = ImageFile.Parent.Child( ImageFile.Name )
		    Else
		      'CancelSave.Enabled = True
		      'pgBar.Visible = False
		      Return
		    End If
		  End If
		  
		  lblSize.Visible = False
		  sldThumbSize.Visible = False
		  CancelSave.Enabled = False
		  
		  pgBar.Visible = True
		  pgBar.Top = sldThumbSize.Top
		  
		  If ( ImageFile = Nil or NOT ImageFile.Exists ) And ImageDestination.Exists Then
		    Dim Location as String
		    If ccThumbs.Selection > -1 Then
		      Location = ccThumbs.Locations( ccThumbs.Selection )
		    Else
		      Location = ccThumbs.Locations( 0 )
		    End If
		    
		    If Location.Left(4) = "file" Then
		      
		      Dim f as FolderItem = GetFolderItem( Location )
		      If f <> Nil and F.Exists Then
		        tmpPic = Picture.Open( f )
		        f.MoveFileTo ImageDestination
		      End If
		      
		    ElseIf Location.Left(4) = "http" Then
		      Location = Location.ReplaceAll("assets.fanart.tv", "www.fanart.tv")
		      tmpPic = URL2Picture( Location, ImageDestination, ImageFile.Name ) 'URL2Picture( Location, ImageFile.NameNoExtension, ImageFile.Extension, ImageDestination )
		    End If
		    
		  End If
		  
		  
		  Select Case Mode
		    
		  Case "Posters"
		    If ActiveSection = 0 Then
		      MovieAttr.ART_Poster = tmpPic
		      CacheImageSet( MovieAttr.ART_Poster, MovieAttr.ID_IMDB + ".movie.poster.jpg" )
		    ElseIf ActiveSection = 1 Then
		      TVAttr.ART_Poster = tmpPic
		      CacheImageSet( tmpPic, TVAttr.ID_IMDb + ".television.poster.jpg" )
		    End If
		    
		  Case "Backdrops"
		    If ActiveSection = 0 Then
		      MovieAttr.ART_Fanart = tmpPic
		      CacheImageSet( MovieAttr.ART_Fanart, MovieAttr.ID_IMDB + ".movie.fanart.jpg" )
		    ElseIf ActiveSection = 1 Then
		      TVAttr.ART_Fanart = tmpPic
		      CacheImageSet( tmpPic, TVAttr.ID_IMDb + ".television.fanart.jpg" )
		    End If
		    
		  Case "Banners"
		    If ActiveSection = 0 Then
		      MovieAttr.ART_Banner = tmpPic
		    ElseIf ActiveSection = 1 Then
		      TVAttr.ART_Banner = tmpPic
		    End If
		    
		  Case "ClearArt"
		    If ActiveSection = 0 Then
		      MovieAttr.ART_ClearArt = tmpPic
		    ElseIf ActiveSection = 1 Then
		      TVAttr.ART_ClearArt = tmpPic
		    End If
		    
		  Case "Logos"
		    If ActiveSection = 0 Then
		      MovieAttr.ART_Logo = tmpPic
		    ElseIf ActiveSection = 1 Then
		      TVAttr.ART_Logo = tmpPic
		    End If
		    
		  Case "Thumbs"
		    If ActiveSection = 0 Then
		      MovieAttr.ART_Thumb = tmpPic
		    ElseIf ActiveSection = 1 Then
		      TVAttr.ART_TVThumb = tmpPic
		    End If
		    
		  Case "CharacterArt"
		    If ActiveSection = 1 Then
		      TVAttr.ART_CharacterArt = tmpPic
		    End If
		    
		  End Select
		  
		  If ActiveSection = 0 Then
		    wndMain.lstMovies.UpdateRow
		    wndMain.cvsMovieDetails.Reload
		  ElseIf ActiveSection = 1 And Mode.InStr(0, "Season") = 0 Then
		    wndMain.lstTVShows.UpdateRow
		    wndMain.cvsTVShowDetails.Reload
		  ElseIf ActiveSection = 2 Then
		    // TODO
		  End If
		  
		  pgBar.Visible = False
		  Close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Mode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Season As Integer
	#tag EndProperty


	#tag Constant, Name = msgPriorArtDeletion, Type = String, Dynamic = True, Default = \"Would you like to replace your existing <image> file with the chosen image\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Would you like to replace your existing <image> file with the chosen image\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wil je het bestaande <image> bestand vervangen met het gekozen afbeeldingen\?"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Vill du ers\xC3\xA4tta befintlig <image> fil med den valda bilden\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Soll die existierende <image> Datei durch das gew\xC3\xA4hlte Bild ersetzt werden\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Voulez-vous remplacer votre <image> actuelle par l\'image s\xC3\xA9lectionn\xC3\xA9e \?"
	#tag EndConstant

	#tag Constant, Name = msgPriorArtFound, Type = String, Dynamic = True, Default = \"ViMediaManager has found an existing <image> file for \'<title>\'.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"ViMediaManager has found an existing <image> file for \'<title>\'."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"ViMediaManager heeft een al bestaande <image> bestand gevonden voor \'<title>\'."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"ViMediaManager har hittat en befintlig <image> fil f\xC3\xB6r \'<title>\'."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"ViMediaManager hat eine existierende <image> Datei f\xC3\xBCr \'<title>\' gefunden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"ViMediaManager a trouv\xC3\xA9 une <image> existante pour \'<title>\'."
	#tag EndConstant


#tag EndWindowCode

#tag Events CancelSave
	#tag Event
		Sub ActionCancel()
		  Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionOK()
		  SaveImage()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.CaptionOK = Loc.kDownload
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ccThumbs
	#tag Event
		Sub DoubleClick(X as Integer, Y as Integer)
		  If Me.Selection > -1 Then SaveImage()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Activate()
		  wndMain.lstMovies.Enabled = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sldThumbSize
	#tag Event
		Sub ValueChanged()
		  If NOT Keyboard.AsyncCommandKey Then
		    If Me.Value < 64 + 10  And Me.Value > 64 - 10  Then Me.Value = 64
		    If Me.Value < 128 + 10 And Me.Value > 128 - 10 Then Me.Value = 128
		    If Me.Value < 256 + 10 And Me.Value > 256 - 10 Then Me.Value = 256
		    If Me.Value < 384 + 10 And Me.Value > 384 - 10 Then Me.Value = 384
		  End If
		  
		  ccThumbs.ThumbSize = Me.Value
		  Preferences.Prefs.integerForKey( "PreviewThumbSize" ) = Me.Value
		  lblSize.Text = Str( Me.Value )
		  
		  ccThumbs.cvsPreview.Reload
		  ccThumbs.scrBar.PageStep = Me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Value = Preferences.Prefs.integerForKey( "PreviewThumbSize" )
		  lblSize.Text = Str( Me.Value )
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
		Name="Mode"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Season"
		Group="Behavior"
		Type="Integer"
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

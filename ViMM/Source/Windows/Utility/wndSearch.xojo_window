#tag Window
Begin Window wndSearch
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   False
   Title           =   "Search [NAME]"
   Visible         =   True
   Width           =   900
   Begin ccSearch ccSearchBox
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      CueText         =   "#cCueText"
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   33
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LiveSearch      =   False
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   300
   End
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
      Left            =   680
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   558
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
   End
   Begin SuperListbox lstResults
      AlternatingRowColors=   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   15
      ColumnsResizable=   False
      ColumnWidths    =   "100%, 0"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   22
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   513
      HelpTag         =   ""
      Hierarchical    =   False
      IgnoreChange    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      IsFocused       =   False
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaxWidth        =   600
      MinWidth        =   200
      PrefName        =   ""
      RequiresSelection=   False
      Resizable       =   False
      RestoreOnChange =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   33
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin MediaDetails cvsInfo
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   546
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   300
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin Timer ThrSearchMovieResult
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin ProgressBar prgBar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   312
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Maximum         =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   558
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   356
   End
   Begin PopupArrow popWeb
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   1
      Height          =   10
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   639
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   638
      Transparent     =   False
      Visible         =   True
      Width           =   10
   End
   Begin Timer ThrSearchTVResult
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin PopupMenu popLinks
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#Menu.CMMSearchTheWeb"
      Italic          =   False
      Left            =   20
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   558
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  ThrSearchTVResult.Mode = timer.ModeOff
		  ThrSearchMovieResult.Mode = timer.ModeOff
		  'Sckt.Close
		  
		  wndMain.lstTVShows.Enabled = True
		  wndMain.lstMovies.Enabled = True
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'self.bottomBorderThickness = 54
		  
		  wndMain.lstTVShows.Enabled = False
		  wndMain.lstMovies.Enabled = False
		  
		  Select Case ActiveSection
		    
		  Case 0
		    Self.Title = wTitleSearchMovie
		  Case 1
		    Self.Title = wTitleSearchShow
		  Case 2
		    Self.Title = wTitleSearchAnime
		    
		  End Select
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h1
		Protected Lindex As Integer = -1
	#tag EndProperty


	#tag Constant, Name = kSearchFieldHelpText, Type = String, Dynamic = True, Default = \"Title (year) or IMDb ID", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Title (year) or IMDb ID"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Titel (jaar) of IMDb ID"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Titel (\xC3\xA5r) eller IMDb ID"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Titel (Jahr) oder IMDb ID"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Titre (Ann\xC3\xA9e) ou IMDB ID"
	#tag EndConstant

	#tag Constant, Name = kUseIMDBID, Type = String, Dynamic = True, Default = \"Instead of key words\x2C you can also use an IMDb ID to search for a movie.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Instead of key words\x2C you can also use an IMDb ID to search for a movie."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"In plaats van sleutelwoorden\x2C kunt u ook een IMDb ID gebruiken om te zoeken naar een film."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Inst\xC3\xA4llet f\xC3\xB6r nyckelord kan du anv\xC3\xA4nda IMDb ID f\xC3\xB6r att s\xC3\xB6ka efter en film."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Anstelle von Suchbegriffen kann auch eine IMDb ID dazu genutzt werden um nach einem Film zu suchen."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Au lieu de mots cl\xC3\xA9s\x2C vous pouvez aussi utiliser l\'ID IMDB pour trouver un film."
	#tag EndConstant

	#tag Constant, Name = wTitleSearchAnime, Type = String, Dynamic = True, Default = \"Search Anime", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search Anime"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek Anime"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Anime suchen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S\xC3\xB6k tecknat"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher un anime"
	#tag EndConstant

	#tag Constant, Name = wTitleSearchMovie, Type = String, Dynamic = True, Default = \"Search Movies", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search Movies"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek Films"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S\xC3\xB6k filmer"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Film suchen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher un film"
	#tag EndConstant

	#tag Constant, Name = wTitleSearchShow, Type = String, Dynamic = True, Default = \"Search TV Shows", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search Shows"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek Series"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Serie suchen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S\xC3\xB6k TV-serier"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher une S\xC3\xA9rie TV"
	#tag EndConstant


#tag EndWindowCode

#tag Events ccSearchBox
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(Key) = 13 Then Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  If ActiveSection <= 1 Then
		    'Me.edtSearch.CueText = kSearchFieldHelpText
		    'Me.edtSearch.HelpTag = kUseIMDBID
		    me.srchField.PlaceholderText = kSearchFieldHelpText
		    me.srchField.HelpTag = kUseIMDBID
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub ResetSearch()
		  'Me.srchField.StringValue = ""
		  me.srchField.StringValue = ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoSearch(SearchText as String)
		  If Trim(SearchText) = "" Then Return
		  Dim ID as String = Trim( match( "[0-9]*", SearchText ) )
		  
		  If ID.Len >= 5 Then
		    Self.Close
		    dlgProgress.SpecialInit( ID, lstResults.Cell( lstResults.ListIndex, 0 ) )
		  ElseIf SearchText.Left(2) = "tt" OR SearchText.Left(3) = "id:" Then
		    dlgProgress.SpecialInit( Trim( SearchText.ReplaceAll("id:","") ), lstResults.Cell( lstResults.ListIndex, 0 ) )
		    Self.Close
		  Else
		    If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", SearchText, 0, "ManualSearchMovie" )
		    If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", SearchText, 0, "ManualSearchTVShow" )
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelSave
	#tag Event
		Sub ActionCancel()
		  dlgProgress.Close
		  Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionOK()
		  Dim ID   as String = lstResults.Cell( lstResults.ListIndex, 2 )
		  If ID = "" Then ID = lstResults.Cell( lstResults.ListIndex, 1 )
		  Dim Name as String = lstResults.Cell( lstResults.ListIndex, 0 )
		  dlgProgress.Close
		  
		  
		  Dim FolderParent as FolderItem
		  If ActiveSection = 0 Then FolderParent = MovieAttr.FolderParent
		  If ActiveSection = 1 Then FolderParent =    TVAttr.FolderParent
		  
		  Self.Close
		  
		  If PriorArtFound( FolderParent ) Then
		    
		    If Preferences.Prefs.integerForKey("KeepImages") = 0 Then // Ask First
		      Dim i as Integer = MsgDlg( Nil, 1, MovieCore.msgPriorMovieArtFound.ReplaceAll( "<movie>", CurrentItemName ), MovieCore.msgPriorArtDeletion, MovieCore.btnReplaceExistingArtwork, Loc.dlgCancel, MovieCore.btnDownloadMissingArtwork )
		      If i = 1 Then PriorArtDelete( FolderParent )
		      If i = 2 Then Return
		    ElseIf Preferences.Prefs.integerForKey("KeepImages") = 1 Then // Always
		      PriorArtDelete( FolderParent )
		    End If
		    
		  End If
		  
		  dlgProgress.SpecialInit( ID, Name )
		  'If ActiveSection = 0 Then dlgProgress.SpecialInit( ID, Name )
		  'If ActiveSection = 1 Then dlgProgress.SpecialInit( ID, Name )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.btnRight.Default = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstResults
	#tag Event
		Sub DoubleClick()
		  If Me.ListIndex > -1 Then CancelSave.btnRight.Push
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key as String) As Boolean
		  If Keyboard.AsyncKeyDown( &h4C ) or Keyboard.AsyncKeyDown( &h24 ) then // Pressed Enter
		    If Me.ListIndex > -1 then CancelSave.btnRight.Push
		  ElseIf Keyboard.AsyncKeyDown( &h35 ) then // Pressed Escape
		    CancelSave.btnLeft.Push
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  CancelSave.btnRight.Enabled = ( Me.ListIndex > -1 )
		  
		  If Me.ListIndex = Lindex Then Return
		  
		  ThrSearchMovieResult.Mode = timer.ModeOff
		  ThrSearchTVResult.Mode = timer.ModeOff
		  
		  If ActiveSection = 0 Then ThrSearchMovieResult.Mode = timer.ModeSingle
		  If ActiveSection = 1 Then ThrSearchTVResult.Mode = timer.ModeSingle
		  
		  Lindex = Me.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsInfo
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = &c000000
		  g.FillRect 0, 0, me.Width, me.Height
		  
		  
		  // ## Backdrop
		  If lstResults.ListIndex < 0 Then Me.DrawBackdrop( g, Nil )
		  
		  // #### Return if there's nothing selected
		  If lstResults.ListIndex < 0 Then Return
		  
		  
		  // ## Backdrop
		  Me.DrawBackdrop( g, lstResults.CellTag( lstResults.ListIndex, 6 ) )
		  
		  // ## Poster
		  Me.DrawPoster( g, lstResults.CellTag( lstResults.ListIndex, 5 ) )
		  
		  
		  
		  // ## Write
		  Dim TextTop as Integer = 13
		  Dim TextLeft as Integer = 20
		  If lstResults.CellTag( lstResults.ListIndex, 5 ) <> Nil Then TextLeft = 184
		  
		  
		  // -- Title
		  g.TextSize = 16
		  g.Bold = True
		  TextTop = TextTop + g.TextSize
		  
		  Dim Title as String = lstResults.Cell( lstResults.ListIndex, 3 )
		  Dim DateYear as Integer = Val( lstResults.Cell( lstResults.ListIndex, 4 ).Left(4) )
		  If DateYear < 1000 Then DateYear = Val( lstResults.Cell( lstResults.ListIndex, 4 ).Right(4) )
		  
		  Dim DisplayTitle as String = Title
		  If DateYear > 1000 And ActiveSection = 0 Then DisplayTitle = Title + " (" + Str( DateYear ) + ")"
		  
		  If Title <> "" Then
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString DisplayTitle, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString DisplayTitle, TextLeft, TextTop,     Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + g.StringHeight( DisplayTitle, Me.Width - TextLeft - 20 ) - 2
		  End If
		  
		  
		  // -- Original Title
		  Dim OriginalTitle as String = lstResults.Cell( lstResults.ListIndex, 13 )
		  If OriginalTitle <> "" And lstResults.Cell( lstResults.ListIndex, 3 ) <> OriginalTitle Then
		    g.TextSize = 14
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString OriginalTitle, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c666666 Else g.ForeColor = RGBa( 100, 100, 100, .6 )
		    g.DrawString OriginalTitle, TextLeft, TextTop, Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + g.StringHeight( OriginalTitle, Me.Width - TextLeft - 20 )
		  End If
		  
		  
		  // -- Tagline
		  g.Bold = False
		  g.TextSize = 12
		  g.Italic = True
		  
		  Dim Tagline as String = lstResults.Cell( lstResults.ListIndex, 8 )
		  If Tagline <> "" Then
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Tagline, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c33333340 Else g.ForeColor = RGBa( 80, 80, 80, .75 )
		    g.DrawString Tagline, TextLeft, TextTop,     Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + 4 + g.StringHeight( Tagline, Me.Width - TextLeft - 20 )
		  End If
		  
		  
		  // -- Duration - Genre(s) - Premiere
		  Dim SubTagLine as String
		  g.Italic = False
		  
		  Dim Duration as String = lstResults.Cell( lstResults.ListIndex, 10 )
		  Dim Genres   as String = lstResults.Cell( lstResults.ListIndex, 11 )
		  Dim Premiere as String = lstResults.Cell( lstResults.ListIndex,  4 )
		  
		  // Duration
		  If Val( Duration ) > 0 Then
		    If Val( Duration ) > 60 Then
		      SubTagLine = PrettyTime( Val( Duration ) )
		    Else
		      SubTagLine = Duration + Trim( loc.kMinutesShort ).Left(1)
		    End If
		  End If
		  If SubTagLine <> "" And Genres <> "" Then SubTagLine = SubTagLine + " - "
		  If Genres <> "" Then SubTagLine = SubTagLine + Genres
		  If SubTagLine <> "" And Premiere <> "" Then SubTagLine = SubTagLine + " - "
		  If Premiere <> "" And Premiere <> "False" Then SubTagLine = SubTagLine + PrettyDate( Premiere )
		  
		  // -- Write SubTagLine
		  If SubTagLine <> "" Then
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString SubTagLine, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c555555 Else g.ForeColor = RGBa( 100, 100, 100, .67 )
		    g.DrawString SubTagLine, TextLeft, TextTop,     Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + g.StringHeight( SubTagLine, Me.Width - TextLeft - 20 ) + g.TextSize
		  End If
		  
		  // ## Write Plot
		  Dim Plot as String = lstResults.Cell( lstResults.Listindex, 9 )
		  If Plot <> "" Then
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		    g.DrawString Plot, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    
		    If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c333333 Else g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString Plot, TextLeft, TextTop,     Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + g.StringHeight( Plot, Me.Width - TextLeft - 20 ) + 12
		  End If
		  
		  
		  // ## Write Path
		  Dim path as String
		  If ActiveSection = 0 Then path = MovieAttr.FolderParent.ShellPath.ReplaceAll("\","")
		  If ActiveSection = 1 Then path = TVAttr.FolderParent.ShellPath.ReplaceAll("\","")
		  
		  TextTop = Me.Height - g.StringHeight( path, Me.Width - 40 )
		  If lstResults.CellTag( lstResults.ListIndex, 7 ) <> Nil Then TextTop = TextTop - 100
		  
		  If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &cFFFFFF Else g.ForeColor = RGBa( 100, 100, 100, .2 )
		  g.DrawString path, 20, TextTop, Me.Width - 40, False
		  
		  If NOT Preferences.Prefs.boolForKey("DarkUI") Then g.ForeColor = &c666666 Else g.ForeColor = RGBa( 100, 100, 100, .6 )
		  g.DrawString path, 20, TextTop, Me.Width - 40, False
		  
		  
		  Me.DrawBanner( g, lstResults.CellTag( lstResults.ListIndex, 7 ) )
		  
		  // ## Borders
		  g.ForeColor = &cC3C3C3
		  g.DrawLine 0, 0, me.Width, 0
		  g.DrawLine 0, me.Height - 1, me.Width, me.Height - 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ThrSearchMovieResult
	#tag Event
		Sub Action()
		  
		  prgBar.Visible = False
		  cvsInfo.Reload
		  If lstResults.ListIndex = -1 Then Return
		  
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage").NthField( "-", 1 )
		  Dim ID as String = lstResults.Cell( lstResults.ListIndex, 1 ) // IMDB ID
		  If ID = "" Then ID = lstResults.Cell( lstResults.ListIndex, 2 ) // TMDB ID
		  
		  If ID = "" Then Return
		  
		  
		  // ## If no previous data has been fetched
		  If lstResults.CellTag( lstResults.ListIndex, 5 ) <> Nil And lstResults.CellTag( lstResults.ListIndex, 6 ) <> Nil Then Return
		  Dim Sckt as New MovieSckt
		  Sckt.Yield = True
		  
		  prgBar.Visible = True
		  prgBar.Maximum = 6
		  prgBar.Value = 0
		  
		  
		  prgBar.Value = prgBar.Value + 1
		  // ## Local Info JSON
		  Dim JSONString as String = DefineEncoding( Sckt.Get( Sckt.URL("MovieInfo", lstResults.Cell( lstResults.ListIndex, 1 ), Preferences.Prefs.stringForKey("DBLanguage") ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  Sckt.Close
		  'JSONString = DecodingFromHTMLMBS( JSONString )
		  
		  Dim TMDBLocal as New JSONItem
		  If JSONString.ValidJSON("TMDb Local") Then TMDBLocal.Load JSONString
		  JSONString = ""
		  
		  prgBar.Value = prgBar.Value + 1
		  // ## US Info JSON
		  Dim TMDBUS as New JSONItem
		  If NOT TMDBLocal.HasName("status_message") And Lang.instr( 0, "en" ) = 0 Then
		    JSONString = DefineEncoding( Sckt.Get( Sckt.URL("MovieInfo", lstResults.Cell( lstResults.ListIndex, 1 ), "en" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    If JSONString.ValidJSON("TMDb US") Then TMDBUS.load JSONString
		    JSONString = ""
		  End If
		  
		  prgBar.Value = prgBar.Value + 1
		  // ## IMDb Info JSON
		  Dim IMDb as New JSONItem
		  If ID.Left(2) = "tt" And NOT TMDBLocal.HasName("imdb_id") Then
		    IMDb = GetIMDbJSON( ID, True )
		    'JSONString = DefineEncoding( IMDBjson( ID, True ), Encodings.UTF8 )
		    'If JSONString.ValidJSON( "IMDb" ) Then IMDB.Load JSONString
		  elseif id.Left(2) <> "tt" and TMDBLocal.HasName("imdb_id") then
		    ID = TMDBLocal.Value("imdb_id")
		    IMDb = GetIMDbJSON(ID, True )
		  End If
		  
		  
		  // :0 Display Title / :1 IMDb / :2 Database ID / :3 Original Title / :4 ReleaseDate / :5 PosterURL / :6 FanartURL / :7 BannerURL
		  
		  // :0 Display Title
		  // :1 IMDb ID
		  If lstResults.Cell( lstResults.ListIndex, 1 ) = "" And TMDBLocal.HasName("imdb_id") And TMDBLocal.Value("imdb_id") <> "" Then
		    lstResults.Cell( lstResults.ListIndex, 1 ) = TMDBLocal.Value("imdb_id")
		  End If
		  // :2 TMDb ID
		  If lstResults.Cell( lstResults.ListIndex, 2 ) = "" And TMDBLocal.HasName("id") And TMDBLocal.Value("id") <> "" Then
		    lstResults.Cell( lstResults.ListIndex, 2 ) = TMDBLocal.Value("id")
		  End If
		  // :3 Title
		  Dim DisplayName as String
		  If TMDBUS <> Nil and TMDBUS.HasName("title")    And TMDBUS.Value("title")    <> "" Then DisplayName = TMDBUS.Value("title")
		  If IMDb <> Nil and IMDb.HasName("TITLE")      And IMDb.Value("TITLE")      <> "" Then DisplayName = IMDb.Value("TITLE")
		  If TMDBLocal <> Nil and TMDBLocal.HasName("title") And TMDBLocal.Value("title") <> "" Then DisplayName = TMDBLocal.Value("title")
		  
		  lstResults.Cell( lstResults.ListIndex, 3 ) = ReplaceAll( DisplayName, "&amp;", "&" )
		  // :4 Release Date
		  If IMDb <> Nil and IMDb.HasName("RELEASE_DATE")      And IMDb.Value("RELEASE_DATE")      <> "" Then lstResults.Cell( lstResults.ListIndex, 4 ) = IMDb.Value("RELEASE_DATE")
		  If TMDBUS.HasName("release_date")    And TMDBUS.Value("release_date")    <> "" Then lstResults.Cell( lstResults.ListIndex, 4 ) = TMDBUS.Value("release_date")
		  If TMDBLocal.HasName("release_date") And TMDBLocal.Value("release_date") <> "" Then lstResults.Cell( lstResults.ListIndex, 4 ) = TMDBLocal.Value("release_date")
		  // 5: PosterURL
		  Dim PosterURL as String = lstResults.Cell( lstResults.ListIndex, 5 )
		  // 6: FanartURL
		  Dim FanartURL as String = lstResults.Cell( lstResults.ListIndex, 6 )
		  // 7: BannerURL
		  Dim BannerURL as String = lstResults.Cell( lstResults.ListIndex, 7 )
		  // 8: Tagline
		  If TMDBUS.HasName("tagline")    And TMDBUS.value("tagline")    <> "" Then lstResults.Cell( lstResults.ListIndex, 8 ) = TMDBUS.Value("tagline") // U.S. Backup
		  If imdb <> Nil and IMDb.HasName("TAGLINE")      And IMDb.Value("TAGLINE")      <> "" Then lstResults.Cell( lstResults.ListIndex, 8 ) = IMDb.Value("TAGLINE")
		  If TMDBLocal.HasName("tagline") And TMDBLocal.Value("tagline") <> "" Then lstResults.Cell( lstResults.ListIndex, 8 ) = TMDBLocal.Value("tagline") // Local
		  // 9: Plot
		  If TMDBUS.HasName("overview")    And TMDBUS.Value("overview")    <> "" Then lstResults.Cell( lstResults.ListIndex, 9 ) = DecodeHTML( TMDBUS.Value("overview") ) // U.S. Backup
		  If IMDb <> Nil and IMDb.HasName("STORYLINE")     And IMDb.Value("STORYLINE")     <> "" Then lstResults.Cell( lstResults.ListIndex, 9 ) = DecodeHTML( IMDb.Value("STORYLINE") )
		  If TMDBLocal.HasName("overview") And TMDBLocal.Value("overview") <> "" Then lstResults.Cell( lstResults.ListIndex, 9 ) = DecodeHTML( TMDBLocal.Value("overview") ) // Local
		  // 10: Runtime
		  If TMDBUS.HasName("runtime")     And TMDBUS.Value("runtime")     <> "" Then lstResults.Cell( lstResults.ListIndex, 10 ) = TMDBUS.Value("runtime")
		  If TMDBLocal.HasName("runtime")  And TMDBLocal.Value("runtime")  <> "" Then lstResults.Cell( lstResults.ListIndex, 10 ) = TMDBLocal.Value("runtime")
		  // 11: Genres
		  If TMDBLocal.HasName("genres") And TMDBLocal.Child("genres").Count > 0 Then
		    Dim genres as String
		    For i as Integer = 0 To TMDBLocal.Child("genres").Count - 1
		      If i = 3 Then Exit
		      If genres = "" Then
		        genres = TMDBLocal.Child("genres").Child(i).Value("name")
		      Else
		        genres = genres + " | " + TMDBLocal.Child("genres").Child(i).Value("name")
		      End If
		    Next
		    lstResults.Cell( lstResults.ListIndex, 11 ) = genres
		  End If
		  // 12: Rating
		  If TMDBUS.HasName("vote_average") And TMDBUS.Value("vote_average") <> "" Then lstResults.Cell( lstResults.ListIndex, 12 ) = Str( Round( TMDBUS.Value("vote_average") * 10 ) / 10 )
		  If imdb <> Nil and IMDb.HasName("RATING")         And IMDb.Value("RATING")         <> "" Then lstResults.Cell( lstResults.ListIndex, 12 ) = Str( IMDb.Value("RATING") )
		  // 13: Original Title
		  Dim OriginalTitle as String
		  If TMDBLocal.HasName("original_title") And TMDBLocal.Value("original_title") <> "" Then OriginalTitle = TMDBLocal.Value("original_title")
		  If imdb <> Nil and IMDb.HasName("TITLE")               And IMDb.Value("TITLE")               <> "" Then OriginalTitle = IMDb.Value("TITLE")
		  If imdb <> Nil and IMDb.HasName("ORIGINAL_TITLE")      And IMDb.Value("ORIGINAL_TITLE")      <> "" Then OriginalTitle = IMDb.Value("ORIGINAL_TITLE")
		  
		  If TMDBUS.HasName("title") And TMDBUS.Value("title") <> "" Then OriginalTitle = TMDBUS.Value("title")
		  
		  lstResults.Cell( lstResults.ListIndex, 13 ) = OriginalTitle
		  // 14: MPAA Rating
		  If imdb <> Nil and IMDb.HasName("MPAA_RATING") And IMDb.Value("MPAA_RATING") = "" Then lstResults.Cell( lstResults.ListIndex, 14 ) = IMDb.Value("MPAA_RATING")
		  // 15: = Homepage
		  If TMDBUS.HasName("homepage")    And TMDBUS.Value("homepage")    <> "" Then lstResults.Cell( lstResults.ListIndex, 15 ) = TMDBUS.Value("homepage")
		  If TMDBLocal.HasName("homepage") And TMDBLocal.Value("homepage") <> "" Then lstResults.Cell( lstResults.ListIndex, 15 ) = TMDBLocal.Value("homepage")
		  
		  
		  // Get Poster IMG
		  prgBar.Value = prgBar.Value + 1
		  If PosterURL <> "" And PosterURL.Left(4) = "http" Then
		    lstResults.CellTag( lstResults.ListIndex, 5 ) = Picture.FromData( CURLGet( PosterURL ) ) ', Preferences.Prefs.IntegerForKey("TimeOut") ) )
		  End If
		  
		  // Get Backdrop IMG
		  prgBar.Value = prgBar.Value + 1
		  If FanartURL <> "" And FanartURL.Left(4) = "http" Then
		    lstResults.CellTag( lstResults.ListIndex, 6 ) = Picture.FromData( CURLGet( FanartURL ) ) ', Preferences.Prefs.integerForKey("TimeOut") ) )
		  End If
		  
		  // Get Banner IMG
		  prgBar.Value = prgBar.Value + 1
		  If BannerURL <> "" And BannerURL.Left(4) = "http" Then
		    lstResults.CellTag( lstResults.ListIndex, 7 ) = Picture.FromData( CURLGet( BannerURL ) ) ', Preferences.Prefs.integerForKey("TimeOut") ) )
		  End If
		  
		  Sckt.Close
		  cvsInfo.Reload
		  prgBar.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popWeb
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If X > 0 And Y > 0 And _
		    X < Me.Width And Y < Me.Width Then
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If X < 0 And Y < 0 And _
		  X > Me.Width And Y > Me.Width Then Return
		  
		  If lstResults.ListIndex = -1 Then Return
		  
		  Dim imdbID as String = lstResults.Cell( lstResults.ListIndex, 1 )
		  Dim tmdbID as String = lstResults.Cell( lstResults.ListIndex, 2 )
		  Dim Title  as String = lstResults.Cell( lstResults.ListIndex, 3 )
		  Dim TitleOriginal as String = lstResults.Cell( lstResults.ListIndex, 13 )
		  Dim ReleaseDate as String = lstResults.Cell( lstResults.ListIndex, 4 )
		  Dim HomePageURL as String = lstResults.Cell( lstResults.ListIndex, 15 )
		  
		  PopUpWebMenu imdbID, tmdbID, Title, TitleOriginal, ReleaseDate, HomePageURL
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ThrSearchTVResult
	#tag Event
		Sub Action()
		  prgBar.Visible = False
		  cvsInfo.Reload
		  If lstResults.ListIndex = -1 Then Return
		  
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage").NthField( "-", 1 )
		  Dim ID as String = lstResults.Cell( lstResults.ListIndex, 2 ) // TVDB ID
		  If ID = "" Then ID = lstResults.Cell( lstResults.ListIndex, 1 ) // IMDb ID
		  
		  If ID = "" Then Return
		  
		  // ## If no previous data has been fetched
		  If lstResults.CellTag( lstResults.ListIndex, 5 ) <> Nil And lstResults.CellTag( lstResults.ListIndex, 6 ) <> Nil Then Return
		  Dim sckt as New TVDBSckt
		  sckt.Yield = True
		  Dim JSONString as String
		  
		  prgBar.Visible = True
		  prgBar.Maximum = 8
		  prgBar.Value = 0
		  
		  
		  prgBar.Value = prgBar.Value + 1
		  // ## If IMDb ID
		  If ID.Left(2) = "tt" Then
		    JSONString = DefineEncoding( sckt.Get( TVCore.URL( "InfoAlias", ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    sckt.Close
		    'JSONString = DecodingFromHTMLMBS( JSONString )
		    'JSONString = JSONString.XML2JSON
		    
		    Dim TVDBAlias as New JSONItem
		    'If JSONString.ValidJSON("TVDB Alias") Then TVDBAlias.Load JSONString
		    TVDBAlias = JSONString.XML2JSON
		    If TVDBAlias <> Nil And TVDBAlias.HasName("Data") And TVDBAlias.ToString.InStr( 0, "Series" ) <> 0 And TVDBAlias.Child("Data").HasName("Series") And TVDBAlias.Child("Data").Child("Series").HasName("id") Then ID = TVDBAlias.Child("Data").Child("Series").Value("id")
		    JSONString = ""
		  End If
		  
		  
		  prgBar.Value = prgBar.Value + 1
		  // ## Local Info JSON
		  If ID.Left(2) <> "tt" Then
		    JSONString = DefineEncoding( sckt.Get( TVCore.URL( "InfoShort", ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    sckt.Close
		    'JSONString = DecodingFromHTMLMBS( JSONString )
		    'JSONString = JSONString.XML2JSON
		  End If
		  
		  Dim TVDBLocal as New JSONItem
		  'If JSONString.ValidJSON("TVDB Local", True) Then TVDBLocal.Load JSONString
		  TVDBLocal = JSONString.XML2JSON
		  If TVDBLocal <> Nil And TVDBLocal.HasName("Data") And TVDBLocal.Child("Data").HasName("Series") Then TVDBLocal.Load TVDBLocal.Child("Data").Child("Series").ToString
		  JSONString = ""
		  
		  
		  prgBar.Value = prgBar.Value + 1
		  // ## US Info JSON
		  If ID.Left(2) <> "tt" And Lang <> "en" Then
		    JSONString = DefineEncoding( sckt.Get( TVCore.URL( "InfoShort", ID, "en" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    sckt.Close
		    'JSONString = DecodingFromHTMLMBS( JSONString )
		    'JSONString = JSONString.XML2JSON
		  End If
		  
		  Dim TVDBUS as New JSONItem
		  If Lang <> "en" Then
		    'If JSONString.ValidJSON("TVDB US") Then TVDBUS.Load JSONString
		    TVDBUS = JSONString.XML2JSON
		    If TVDBUS.HasName("Data") And TVDBUS.Child("Data").HasName("Series") Then TVDBUS.Load TVDBUS.Child("Data").Child("Series").ToString
		    JSONString = ""
		  End If
		  
		  
		  prgBar.Value = prgBar.Value + 1
		  // ## IMDb JSON
		  Dim IMDb as New JSONItem
		  If ID.Left(2) = "tt" And ( TVDBLocal <> Nil And TVDBLocal.HasName("Data") And TVDBLocal.Value("Data") = "" ) Then
		    IMDb = GetIMDbJSON( ID, True )
		    'JSONString = IMDBjson( ID, True )
		    'If JSONString.ValidJSON("IMDb") Then IMDb.Load JSONString
		    'JSONString = ""
		  elseif ID.Left(2) <> "tt" and TVDBLocal <> Nil and TVDBLocal.HasName("IMDB_ID") then
		    ID = TVDBLocal.Value("IMDB_ID")
		    IMDb = GetIMDbJSON( ID, True )
		  End If
		  
		  
		  prgBar.Value = prgBar.Value + 1
		  // ## Set cells
		  
		  // :0 Display Title
		  // :1 IMDb ID
		  If lstResults.Cell( lstResults.ListIndex, 1 ) = "" And TVDBLocal <> Nil And TVDBLocal.HasName("IMDB_ID") And TVDBLocal.Value("IMDB_ID") <> "" Then lstResults.Cell( lstResults.ListIndex, 1 ) = TVDBLocal.Value("IMDB_ID")
		  // :2 TVDB ID
		  If IMDb <> Nil And IMDb.HasName("TITLE_ID") And IMDb.Value("TITLE_ID") <> "" Then lstResults.Cell( lstResults.ListIndex, 2 ) = IMDb.Value("TITLE_ID")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("id") And TVDBLocal.Value("id") <> "" Then lstResults.Cell( lstResults.ListIndex, 2 ) = TVDBLocal.Value("id")
		  // :3 Title
		  If imdb <> Nil And IMDb.HasName("TITLE")           And IMDb.Value("TITLE")           <> "" Then lstResults.Cell( lstResults.ListIndex, 3 ) = IMDb.Value("TITLE")
		  If TVDBUS <> Nil And TVDBUS.HasName("SeriesName")    And TVDBUS.Value("SeriesName")    <> "" Then lstResults.Cell( lstResults.ListIndex, 3 ) = TVDBUS.Value("SeriesName")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("SeriesName") And TVDBLocal.Value("SeriesName") <> "" Then lstResults.Cell( lstResults.ListIndex, 3 ) = TVDBLocal.Value("SeriesName")
		  lstResults.Cell( lstResults.ListIndex, 3 ) = ReplaceAll( lstResults.Cell( lstResults.ListIndex, 3 ), "&amp;", "&" )
		  // :4 Release Date
		  If IMDb <> Nil And IMDb.HasName("RELEASE_DATE")    And IMDb.Value("RELEASE_DATE")    <> "" Then lstResults.Cell( lstResults.ListIndex, 4 ) = IMDb.Value("RELEASE_DATE")
		  If TVDBUS <> Nil And TVDBUS.HasName("FirstAired")    And TVDBUS.Value("FirstAired")    <> "" Then lstResults.Cell( lstResults.ListIndex, 4 ) = TVDBUS.Value("FirstAired")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("FirstAired") And TVDBLocal.Value("FirstAired") <> "" Then lstResults.Cell( lstResults.ListIndex, 4 ) = TVDBLocal.Value("FirstAired")
		  // :5 Poster URL
		  Dim PosterURL as String = lstResults.Cell( lstResults.ListIndex, 5 )
		  If IMDb <> Nil And IMDb.HasName("POSTER")      And IMDb.Value("POSTER")      <> "" Then PosterURL = IMDb.Value("POSTER")
		  If TVDBUS <> Nil And TVDBUS.HasName("poster")    And TVDBUS.Value("poster")    <> "" Then PosterURL = TVDBUS.Value("poster")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("poster") And TVDBLocal.Value("poster") <> "" Then PosterURL = TVDBLocal.Value("poster")
		  If PosterURL.Left(4) <> "http" then PosterURL = "https://www.thetvdb.com/banners/_cache/" + PosterURL
		  lstResults.Cell( lstResults.ListIndex, 5 ) = PosterURL
		  // :6 Fanart URL
		  Dim FanartURL as String = lstResults.Cell( lstResults.ListIndex, 6 )
		  If IMDb <> Nil And IMDb.HasName("MEDIA_IMAGES") And IMDb.Child("MEDIA_IMAGES").Count > 1 Then FanartURL = IMDb.Child("MEDIA_IMAGES").Value(0)
		  If TVDBUS <> Nil And TVDBUS.HasName("fanart")     And TVDBUS.Value("fanart")         <> "" Then FanartURL = TVDBUS.Value("fanart")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("fanart")  And TVDBLocal.Value("fanart")      <> "" Then FanartURL = TVDBLocal.Value("fanart")
		  If FanartURL.Left(4) <> "http" Then FanartURL = "https://www.thetvdb.com/banners/_cache/" + FanartURL
		  lstResults.Cell( lstResults.ListIndex, 6 ) = FanartURL
		  // :7 Banner URL
		  Dim BannerURL as String = lstResults.Cell( lstResults.ListIndex, 7 )
		  If TVDBUS <> Nil And TVDBUS.HasName("banner")    And TVDBUS.Value("banner")    <> "" Then BannerURL = TVDBUS.Value("banner")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("banner") And TVDBLocal.Value("banner") <> "" Then BannerURL = TVDBLocal.Value("banner")
		  If BannerURL.Left(4) <> "http" Then BannerURL = "https://www.thetvdb.com/banners/" + BannerURL
		  lstResults.Cell( lstResults.ListIndex, 7 ) = BannerURL
		  // :8 Tagline
		  Dim Tagline as String '= lstResults.Cell( lstResults.ListIndex, 8 )
		  If TVDBUS <> Nil And TVDBUS.HasName("Network")    And TVDBUS.Value("Network")    <> "" Then Tagline = TVDBUS.Value("Network")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("Network") And TVDBLocal.Value("Network") <> "" Then Tagline = TVDBLocal.Value("Network")
		  If IMDb <> Nil And IMDb.HasName("TAGLINE")      And IMDb.Value("TAGLINE")      <> "" Then Tagline = IMDb.Value("TAGLINE")
		  
		  If TVDBLocal <> Nil And TVDBLocal.HasName("Status") And TVDBLocal.Value("Status") <> "" Then Tagline = Tagline + " | " + TVDBLocal.Value("Status")
		  
		  lstResults.Cell( lstResults.ListIndex, 8 ) = Tagline
		  // :9 Plot
		  dim plot as String
		  If plot = "" and IMDb <> Nil And IMDb.HasName("STORYLINE")     And IMDb.Value("STORYLINE")     <> "" Then plot = IMDb.Value("STORYLINE")
		  If plot = "" and TVDBUS <> Nil And TVDBUS.HasName("Overview")    And TVDBUS.Value("Overview")    <> "" Then plot = TVDBUS.Value("Overview")
		  If plot = "" and TVDBLocal <> Nil And TVDBLocal.HasName("Overview") And TVDBLocal.Value("Overview") <> "" Then plot = TVDBLocal.Value("Overview")
		  lstResults.Cell( lstResults.ListIndex, 9 ) = DecodeHTML( plot )
		  // :10 Runtime
		  If IMDb <> Nil And IMDb.HasName("RUNTIME")      And IMDb.Value("RUNTIME")      <> "" Then lstResults.Cell( lstResults.ListIndex, 10 ) = IMDb.Value("RUNTIME")
		  If TVDBUS <> Nil And TVDBUS.HasName("Runtime")    And TVDBUS.Value("Runtime")    <> "" Then lstResults.Cell( lstResults.ListIndex, 10 ) = TVDBUS.Value("Runtime")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("Runtime") And TVDBLocal.Value("Runtime") <> "" Then lstResults.Cell( lstResults.ListIndex, 10 ) = TVDBLocal.Value("Runtime")
		  // :11 Genres
		  Dim Genres as String
		  If TVDBUS <> Nil And TVDBUS.HasName("Genre") And TVDBUS.Value("Genre") <> "" Then Genres = TVDBUS.Value("Genre")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("Genre") And TVDBLocal.Value("Genre") <> "" Then Genres = TVDBLocal.Value("Genre")
		  Genres = Trim( Genres.ReplaceAll("|", " | ").ReplaceAll(" and ", " & " ) )
		  Genres = Genres.Left( Genres.Len - 2 )
		  Genres = Genres.Right( Genres.Len - 2 )
		  lstResults.Cell( lstResults.ListIndex, 11 ) = Genres
		  // :12 Rating
		  If IMDb <> Nil And IMDb.HasName("RATING")      And IMDb.Value("RATING")      <> "" Then lstResults.Cell( lstResults.ListIndex, 12 ) = IMDb.Value("RATING")
		  If TVDBUS <> Nil And TVDBUS.HasName("Rating")    And TVDBUS.Value("Rating")    <> "" Then lstResults.Cell( lstResults.ListIndex, 12 ) = TVDBUS.Value("Rating")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("Rating") And TVDBLocal.Value("Rating") <> "" Then lstResults.Cell( lstResults.ListIndex, 12 ) = TVDBLocal.Value("Rating")
		  // :13 Original Title
		  If IMDb <> Nil And IMDb.HasName("ORIGINAL_TITLE") And IMDb.Value("ORIGINAL_TITLE") <> "" Then lstResults.Cell( lstResults.ListIndex, 13 ) = IMDb.Value("ORIGINAL_TITLE")
		  // 14: MPAA Rating
		  If TVDBUS <> Nil And TVDBUS.HasName("ContentRating") And TVDBUS.Value("ContentRating") <> "" Then lstResults.Cell( lstResults.ListIndex, 14 ) = TVDBUS.Value("ContentRating")
		  If IMDb <> Nil And IMDb.HasName("MPAA_RATING") And IMDb.Value("MPAA_RATING") = "" Then lstResults.Cell( lstResults.ListIndex, 14 ) = IMDb.Value("MPAA_RATING")
		  If TVDBLocal <> Nil And TVDBLocal.HasName("ContentRating") And TVDBLocal.Value("ContentRating") <> "" Then lstResults.Cell( lstResults.ListIndex, 14 ) = TVDBLocal.Value("ContentRating")
		  
		  
		  cvsInfo.Reload
		  // Get Banner IMG
		  prgBar.Value = prgBar.Value + 1
		  If BannerURL <> "" And BannerURL.Left(4) = "http" Then
		    lstResults.CellTag( lstResults.ListIndex, 7 ) = Picture.FromData( CURLGet( BannerURL ) ) ', Preferences.Prefs.integerForKey("TimeOut") ) )
		  End If
		  
		  cvsInfo.Reload
		  // Get Poster IMG
		  prgBar.Value = prgBar.Value + 1
		  If PosterURL <> "" And PosterURL.Left(4) = "http" Then
		    'If ActiveSection = 0 Then
		    lstResults.CellTag( lstResults.ListIndex, 5 ) = Picture.FromData( CURLGet( PosterURL ) ) ', Preferences.Prefs.IntegerForKey("TimeOut") ) )
		  End If
		  
		  cvsInfo.Reload
		  // Get Backdrop IMG
		  prgBar.Value = prgBar.Value + 1
		  If FanartURL <> "" And FanartURL.Left(4) = "http" Then
		    'If ActiveSection = 0 Then
		    lstResults.CellTag( lstResults.ListIndex, 6 ) = Picture.FromData( CURLGet( FanartURL ) ) ', Preferences.Prefs.integerForKey("TimeOut") ) )
		  End If
		  
		  sckt.Close
		  cvsInfo.Reload
		  prgBar.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popLinks
	#tag Event
		Sub Open()
		  Me.PullsDown = True
		  'Me.BezelStyle = PopupMenuExtension.NSBezelStyle.NSTexturedRoundedBezelStyle
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Me.DeleteAllRows
		  Me.AddRow Menu.CMMSearchTheWeb
		  
		  Dim HomePageURL, IMDbID, DBID, SearchTitle as String
		  IMDbID = lstResults.Cell( lstResults.ListIndex, 1 )
		  DBID = lstResults.Cell( lstResults.ListIndex, 2 )
		  SearchTitle = lstResults.Cell( lstResults.ListIndex, 3 )
		  If SearchTitle = "" Then SearchTitle = lstResults.Cell( lstResults.ListIndex, 13 )
		  SearchTitle = EncodeURLComponent( SearchTitle )
		  
		  // Homepage
		  If HomePageURL <> "" Then
		    Me.AddRowWithTagAndPicture "Homepage", HomePageURL, Nil
		    Me.AddRow "-"
		  End If
		  
		  // IMDB ID
		  If IMDbID.Left(2) = "tt" Then Me.AddRowWithTagAndPicture "IMDb", "http://www.imdb.com/title/" + IMDbID, ScaleImage( icoimdb, 16, 16 )
		  
		  // Database ID
		  If DBID <> "" And DBID.Left(2) <> "tt" And ActiveSection = 0 Then
		    Me.AddRowWithTagAndPicture "TMDb", "http://www.themoviedb.org/movie/" + DBID, ScaleImage( icotmdb, 16, 16 )
		  ElseIf DBID <> "" And DBID.Left(2) <> "tt" And ActiveSection = 1 Then
		    Me.AddRowWithTagAndPicture "TVDB", "http://thetvdb.com/?tab=series&id=" + DBID, ScaleImage( icotvdb, 16, 16 )
		  End If
		  
		  // Search
		  If SearchTitle <> "" Then
		    Me.AddRowWithTagAndPicture "Wikipedia", "http://en.wikipedia.org/wiki/Special:Search?search=" + SearchTitle, ScaleImage( icowikipedia, 16, 16 )
		    If ActiveSection = 0 Then
		      Me.AddRowWithTagAndPicture "RottenTomatoes", "http://www.rottentomatoes.com/search/?search=" + SearchTitle, ScaleImage( icorottentomatoes, 16, 16 )
		      Me.AddRowWithTagAndPicture "YouTube", "http://www.youtube.com/results?search_query=" + SearchTitle, ScaleImage( icoyoutube, 16, 16 )
		      Me.AddRowWithTagAndPicture "Netflix", "http://www.netflix.com/Search?v1=" + SearchTitle, ScaleImage( iconetflix, 16, 16 )
		    End If
		  End If
		  
		  // Torrentz
		  If Keyboard.AsyncAltKey And SearchTitle <> "" Then
		    
		    Me.AddRow "-"
		    
		    Me.AddRowWithTagAndPicture "The PirateBay", "http://pirateproxy.net/search/" + SearchTitle, ScaleImage( icotpb, 16, 16 )
		    Me.AddRowWithTagAndPicture "Torrentz", "http://torrentz.eu/search?q=" + SearchTitle, ScaleImage( icotorrentz, 16, 16 )
		    Me.AddRowWithTagAndPicture "KickAssTorrents", "http://kickass.to/usearch/" + SearchTitle, ScaleImage( icokat, 16, 16 )
		    If ActiveSection = 0 Then
		      Me.AddRowWithTagAndPicture "Movies.io", "http://movies.io/m/search?utf8=✓&q=" + SearchTitle, ScaleImage( icomoviesio, 16, 16 )
		      Me.AddRowWithTagAndPicture "YIFY Torrents", "http://yify-torrents.com/browse-movie/" + SearchTitle, ScaleImage( icoyify, 16, 16 )
		    End If
		    
		  End If
		  
		  // Buy Legally
		  If SearchTitle <> "" Then
		    Me.AddRow "-"
		    Me.AddRowWithTagAndPicture "eBay", "http://shop.ebay.com/?_from=R40&_trksid=p5197.m570.l1313&_nkw=" + SearchTitle + "&_sacat=See-All-Categories", ScaleImage( icoebay, 16, 16 )
		    Me.AddRowWithTagAndPicture "Amazon.com", "http://www.amazon.com/s/vime03-20/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=" + SearchTitle + "&x=0&y=0", ScaleImage( icoamazon, 16, 16 )
		    Me.AddRowWithTagAndPicture "Amazon.co.uk", "http://www.amazon.co.uk/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=" + SearchTitle + "&x=0&y=0", ScaleImage( icoamazon, 16, 16 )
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.RowTag( Me.ListIndex ) <> Nil Then
		    ShowURL Me.RowTag( Me.ListIndex )
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

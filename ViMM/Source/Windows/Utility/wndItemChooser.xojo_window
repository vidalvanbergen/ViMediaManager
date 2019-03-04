#tag Window
Begin Window wndItemChooser
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   342
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
   Title           =   "#Loc.kThemeSong"
   Visible         =   True
   Width           =   600
   Begin Canvas cvsLogoArt
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   32
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
      Width           =   32
   End
   Begin Label lblTitle
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
      Left            =   64
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
      Text            =   "Choose a themesong:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   218
   End
   Begin Label lblExplanation
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   64
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kChooserWarningThemesong"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   38
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   516
   End
   Begin PushbuttonPro btnPreview
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Loc.kPreview"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   477
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   68
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   103
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
      Left            =   380
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   300
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
   End
   Begin HTTPSocket SndSocket
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
   Begin ProgressBar prgBar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   64
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   300
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   304
   End
   Begin MoviePlayer sndPlayer
      AutoDeactivate  =   True
      AutoPlay        =   True
      AutoResize      =   False
      Border          =   False
      Controller      =   1
      HasStep         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   477
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Looping         =   False
      Movie           =   "0"
      Palindrome      =   False
      PlayerType      =   1
      Scope           =   0
      Speaker         =   True
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   100
      Transparent     =   False
      Visible         =   False
      Width           =   103
   End
   Begin TrailerSckt TrailerSckteer
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
   Begin Label lblSpeed
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   12
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   64
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "##/##"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   322
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   304
   End
   Begin SuperListbox lstResults
      AlternatingRowColors=   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "100%, 60, 60"
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
      Height          =   220
      HelpTag         =   ""
      Hierarchical    =   True
      IgnoreChange    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      IsFocused       =   False
      Italic          =   False
      Left            =   64
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaxWidth        =   600
      MinWidth        =   200
      PrefName        =   ""
      RequiresSelection=   True
      Resizable       =   False
      RestoreOnChange =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   68
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   401
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer TimerProgress
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin PushButton btnDelete
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Loc.kDelete"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   54
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   300
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  If ActiveSection = 0 Then wndMain.lstMovies.UpdateRow
		  If ActiveSection = 1 Then wndMain.lstTVShows.UpdateRow
		  
		  SndSocket.Close
		  TrailerSckteer.Close
		  
		  wndMain.ProgressRunning = False
		  wndMain.lstMovies.Enabled = True
		  wndMain.lstTVShows.Enabled = True
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'HTMLPlayer = New HTMLViewer
		  If ActiveSection = 0 Then Me.Title = Loc.kTrailers
		  
		  wndMain.ProgressRunning = True
		  wndMain.lstMovies.Enabled = False
		  wndMain.lstTVShows.Enabled = False
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Self.Close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h0
		Closing As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressLabel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressValue As Integer
	#tag EndProperty


	#tag Constant, Name = kChooseItem, Type = String, Dynamic = True, Default = \"Choose a %S", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Choose a %S"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kies een %S"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Choisir %S"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"W\xC3\xA4hle eine %S"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"V\xC3\xA4lj en %S"
	#tag EndConstant

	#tag Constant, Name = kChooserWarningThemesong, Type = String, Dynamic = False, Default = \"Downloading a theme song will replace the exising theme song.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Downloading a theme song will replace the exising theme song."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Het downloaden van een nieuw thema lied vervangt het bestaande thema lied."
	#tag EndConstant

	#tag Constant, Name = kChooserWarningTrailer, Type = String, Dynamic = False, Default = \"Downloading a trailer will replace the exising trailer.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Downloading a trailer will replace the exising trailer."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Het downloaden van een nieuwe trailer vervangt de bestaande trailer."
	#tag EndConstant


#tag EndWindowCode

#tag Events cvsLogoArt
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'If App.ScalingFactor < 2 Then Return
		  
		  If ActiveSection = 0 Then
		    'If App.ScalingFactor = 1 Then Me.Backdrop = tb_metatrailers
		    g.ScaleImage( template_trailer, g.Width, g.Height )
		  ElseIf ActiveSection = 1 Then
		    'If App.ScalingFactor = 1 Then Me.Backdrop = tb_themesong
		    g.ScaleImage( template_music, g.Width, g.Height )
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblTitle
	#tag Event
		Sub Open()
		  If ActiveSection = 0 Then
		    Me.Text = kChooseItem.ReplaceAll( "%S", Loc.kTrailer )
		  ElseIf ActiveSection = 1 Then
		    Me.Text = kChooseItem.ReplaceAll( "%S", Loc.kThemeSong )
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblExplanation
	#tag Event
		Sub Open()
		  If ActiveSection = 0 THen Me.Text = kChooserWarningTrailer
		  If ActiveSection = 1 Then Me.Text = kChooserWarningThemesong
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPreview
	#tag Event
		Sub Action()
		  If lstResults.ListIndex < 0 Then Return
		  
		  Dim f as FolderItem
		  If lstResults.RowTag( lstResults.ListIndex ) IsA FolderItem Then f = lstResults.RowTag( lstResults.ListIndex )
		  
		  // Trailers
		  If ActiveSection = 0 Then
		    
		    If lstResults.RowTag( lstResults.ListIndex ) IsA FolderItem Then
		      If f <> Nil Then f.Launch
		    Else
		      ShowURL lstResults.RowTag( lstResults.ListIndex )
		    End If
		    
		    // TV Shows
		  ElseIf ActiveSection = 1 Then
		    
		    // Hide snd player
		    'sndPlayer.Visible = False
		    'sndPlayer.Refresh
		    
		    // Stop snd player
		    If Me.Caption = Loc.dlgStop Then
		      SndSocket.Close
		      sndPlayer.Stop
		      sndPlayer.Movie = Nil
		      
		      Me.Caption = Loc.kPreview
		      sndPlayer.Visible = False
		      sndPlayer.Refresh
		      
		      // Play Local
		    ElseIf lstResults.RowTag( lstResults.ListIndex ) IsA FolderItem Then
		      sndPlayer.Visible = True
		      sndPlayer.Movie = f.OpenAsMovie
		      sndPlayer.Refresh
		      
		      Me.Caption = Loc.dlgStop
		      sndPlayer.Play
		      
		      // Play URL
		    Else
		      SndSocket.Yield = True
		      prgBar.Visible = True
		      Me.Enabled = False
		      
		      SndSocket.Get( lstResults.RowTag( lstResults.ListIndex ), SpecialFolder.Temporary.Child( App.Identifier ).Child( "tmp-theme.mp3" ) )
		      'SndSocket.Close
		      'sndPlayer.Visible = True
		      
		      Me.Caption = Loc.dlgStop
		      sndPlayer.Refresh
		      
		    End If
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelSave
	#tag Event
		Sub ActionCancel()
		  Self.Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionOK()
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  If lstResults.ListIndex = -1 Then Return
		  
		  Dim URL as String
		  'Dim TheFile as FolderItem =
		  If NOT lstResults.RowTag( lstResults.ListIndex ) IsA FolderItem Then
		    URL = Trim( lstResults.RowTag( lstResults.ListIndex ) )
		  Else
		    'TheFile = lstResults.RowTag( lstResults.ListIndex )
		    'If ActiveSection = 0 And FindTrailerItem( MovieAttr.FolderParent ) <> Nil And TheFile.ShellPath = FindTrailerItem( MovieAttr.FolderParent ).ShellPath Then Return
		    'If ActiveSection = 1 And TheFile.ShellPath = TVAttr.FolderParent.Child( "theme.mp3" ).ShellPath Then Return
		    Return
		  End If
		  
		  // Trailer download
		  If ActiveSection = 0 Then
		    
		    // Remove existing trailer?
		    Dim TrailerFile as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		    If TrailerFile <> Nil And TrailerFile.Exists Then
		      If MsgDlg( Nil, 1, Loc.msgTrailerExists, Loc.kCantBeUndone, Loc.dlgCancel, Loc.dlgReplace ) = 1 Then Return
		    End If
		    
		    prgBar.Visible = True
		    prgBar.Refresh
		    
		    lblSpeed.Visible = True
		    Me.btnRight.Enabled = False
		    btnPreview.Enabled = False
		    
		    If URL.Left(4) = "http" Then TrailerSckteer.Download URL
		    wndMain.lstMovies.UpdateRow
		    
		    // Themesong
		  ElseIf ActiveSection = 1 Then
		    
		    // Quit the open sndPlayer
		    sndPlayer.Movie = Nil
		    sndPlayer.Visible = False
		    
		    Closing = True
		    
		    // Ask if they want to remove the existing Theme.
		    If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Child( "theme.mp3" ).Exists Then
		      If MsgDlg( Self, 1, Loc.msgDeleteThemeSong, Loc.kCantBeUndone, Loc.kDelete, Loc.dlgCancel ) = 1 Then
		        If TVAttr.FolderParent.IsNetworkVolume Then TVAttr.FolderParent.Child("theme.mp3").Delete Else TVAttr.FolderParent.Child( "theme.mp3" ).MoveToTrash
		      Else
		        Return
		      End If
		    End If
		    
		    prgBar.Visible = True
		    prgBar.Refresh
		    
		    // Get URL
		    Dim tmpTheme as FolderItem = SpecialFolder.Temporary.Child( app.Identifier ).Child("theme.mp3")
		    
		    If tmpTheme <> Nil And SndSocket.Get( URL, tmpTheme, Preferences.Prefs.integerForKey("TimeOut") * 2 ) Then
		      If tmpTheme <> Nil And tmpTheme.Exists Then tmpTheme.MoveFileTo( TVAttr.FolderParent.Child( "theme.mp3" ) )
		      wndMain.lstTVShows.UpdateRow
		    Else
		      MessageBox Loc.kNothingLeft
		    End If
		    
		    prgBar.Visible = False
		    Self.Close
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.CaptionOK = Loc.kDownload
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SndSocket
	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  'File.ShowInFinder
		  If NOT Closing Then
		    btnPreview.Caption = Loc.dlgStop
		    btnPreview.Enabled = True
		    
		    prgBar.Visible = False
		    prgBar.Maximum = 0
		    prgBar.Value = 0
		    
		    
		    sndPlayer.Movie = File.OpenAsMovie
		    sndPlayer.Visible = True
		    sndPlayer.Refresh
		    sndPlayer.Play
		    Me.Close
		  End if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  
		  If prgBar.Maximum <> totalBytes Then prgBar.Maximum = totalBytes
		  prgBar.Value = bytesReceived
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events prgBar
	#tag Event
		Sub Open()
		  If ActiveSection = 1 Then
		    Me.Width = Self.Width - CancelSave.Width - 20 - 10 - Me.Left
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TrailerSckteer
	#tag Event
		Sub ReceiveProgress(bytesReceived as Integer, totalBytes as Integer, newData as String, Progress as String)
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  If prgBar.Maximum <> totalBytes Then prgBar.Maximum = totalBytes
		  ProgressValue = bytesReceived
		  ProgressLabel = Progress
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadComplete(url as String, httpStatus as Integer, Headers as internetHeaders, file as FolderItem)
		  'MessageBox Loc.kDownloadComplete
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblSpeed
	#tag Event
		Sub Open()
		  me.Text = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstResults
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If ActiveSection = 0 Then
		    
		    // ## Right Rating
		    If Me.Cell( row, 1 ) <> "" And column = 0 then
		      If Me.ListIndex = Row then
		        g.ForeColor = &cFFFFFF
		      ElseIf Me.ListIndex <> Row and NOT Me.Active then
		        g.ForeColor = &cA5A5A5
		      Else
		        g.ForeColor = &c98A5B3
		      End If
		      
		      Dim Rate as String = Me.Cell( row, 1 )
		      g.TextSize = 10
		      g.Bold = True
		      
		      g.FillRoundRect g.Width - g.StringWidth( Rate ) - 15, 4, g.StringWidth( Rate ) + 10, g.TextSize + 3, 15, 15
		      
		      If Me.ListIndex = Row then g.ForeColor = &c98A5B3 Else g.ForeColor = &cFFFFFF
		      g.DrawString Rate, g.Width - g.StringWidth( Rate ) - 10, 4 + g.TextSize
		    End If
		    
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If btnPreview.Enabled Then btnPreview.Push
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  // Draw themesong
		  If ActiveSection = 1 And column = 0 And Row < Me.ListCount Then g.ScaleImage themesonginactive2x, 16, 16, 4, 4
		  
		  // Draw Trailer source
		  If ActiveSection = 0 And column = 0 And Row < Me.ListCount Then
		    
		    Dim Ico as Picture
		    Dim Source as String
		    If Me.RowTag(row) <> Nil And Me.RowTag( row ).Type = Variant.TypeString Then Source = Me.RowTag( row )
		    
		    If ScalingFactor( self ) > 1 Then
		      if globals.IsDarkMode then
		        ico = traileractive
		      else
		        Ico = trailerinactive
		      end if
		    Else
		      if Globals.IsDarkMode then
		        ico = traileractive2x
		      else
		        Ico = trailerinactive2x
		      End If
		    End If
		    If Source.Contains( "Aol" ) Then Ico = icoaol
		    If Source.Contains( "Apple" ) Then Ico = icoapple
		    If Source.Contains( "Yahoo" ) Then Ico = icoyahoo
		    If Source.Contains( "Youtube" ) Then Ico = icoyoutube
		    If Source.Contains( "HD-Trailers" ) Then Ico = icohdtrailers
		    
		    If Ico <> Nil Then g.ScaleImage( ico, 16, 16, 4, 4 )
		    
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  btnDelete.Visible = ( Me.ListIndex > -1 And Me.RowTag( Me.ListIndex ) IsA FolderItem )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimerProgress
	#tag Event
		Sub Action()
		  prgBar.Value = ProgressValue
		  lblSpeed.Text = ProgressLabel
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDelete
	#tag Event
		Sub Open()
		  Me.Left = 64
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If lstResults.ListIndex > -1 And lstResults.RowTag( lstResults.ListIndex ) IsA FolderItem Then
		    Dim f as FolderItem = lstResults.RowTag( lstResults.ListIndex )
		    If f <> Nil And f.Exists And MsgDlg( Self, 1, Loc.msgDeleteTrailer, Loc.kCantBeUndone, Loc.kDelete, Loc.dlgCancel ) = 1 Then
		      If NOT f.IsNetworkVolume Then f.MoveToTrash() Else f.Delete
		      lstResults.RemoveRow( lstResults.ListIndex )
		      
		      If lstResults.LastIndex >= 0 Then lstResults.ListIndex = 0
		    End If
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
		Name="Closing"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
		Name="ProgressLabel"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ProgressValue"
		Group="Behavior"
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

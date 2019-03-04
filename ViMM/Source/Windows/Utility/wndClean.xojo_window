#tag Window
Begin Window wndClean
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   164
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
   Title           =   "#Loc.Clean"
   Visible         =   True
   Width           =   468
   Begin Canvas cvsSweep
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   333015082
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
   Begin PopupMenu popMode
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   134
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   88
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin ccCancelSave btnsCancelSave
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
      Left            =   248
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   122
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   96
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
      Text            =   "#txtTitle"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   352
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   96
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#txtMessage"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   352
   End
   Begin Timer ThrClean
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin ProgressBar pgCleaned
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   124
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   211
   End
   Begin Label lblDebug
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   146
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   314
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  wndMain.lstTVShows.Enabled = True
		  wndMain.lstMovies.Enabled = True
		  wndMain.ProgressRunning = False
		  
		  ThrClean.Mode = Timer.ModeOff
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  wndMain.lstTVShows.Enabled = False
		  wndMain.lstMovies.Enabled = False
		  wndMain.ProgressRunning = True
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected Choice As String
	#tag EndProperty


	#tag Constant, Name = txtMessage, Type = String, Dynamic = True, Default = \"Depending on your choice\x2C the .nfo files\x2C extra art images and/or <media> will be deleted when you clean your files.", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Depending on your choice\x2C the .nfo files\x2C extra art images and/or <media> will be deleted when you clean your files."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Afhangende van je keuze\x2C de .nfo bestanden\x2C extra afbeeldingen en/of <media> zullen worden gewist wanneer je je bestanden verschoont."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Beroende p\xC3\xA5 dina val\x2C nfo-filer\x2C extra art-bilder och/eller <media> kommer att raderas n\xC3\xA4r du rensar filer."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Abh\xC3\xA4ngig von der Auswahl werden alle NFO- Dateien\x2C Extra Fanarts und/oder <media> gel\xC3\xB6scht."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Selon votre choix\x2C les .NFO\x2C les extra arts et/ou les  <media> seront effac\xC3\xA9s quand vous nettoierez vos fichiers."
	#tag EndConstant

	#tag Constant, Name = txtTitle, Type = String, Dynamic = True, Default = \"Choose what you want to clean:", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Choose what you want to clean:"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kies wat je wilt schoonmaken:"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"V\xC3\xA4lj det du vill rensa:"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"W\xC3\xA4hle was bereinigt werden soll:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"S\xC3\xA9lectionnez ce que vous voulez nettoyer :"
	#tag EndConstant


#tag EndWindowCode

#tag Events cvsSweep
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'If App.ScalingFactor = 2 Then
		  
		  g.DrawPicture template_clean, 0, 0, g.Width, g.Height,   0, 0, template_clean.width, template_clean.height
		  'Else
		  'g.DrawPicture tb_clean2x, 0, 0
		  'End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Backdrop = Nil
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popMode
	#tag Event
		Sub Open()
		  Me.AddRow Loc.kAll                                   // All
		  Me.AddRow "-"                                        // ----
		  Me.AddRow Loc.kMetadata                              // Metadata
		  Me.AddRow Loc.kImages.Titlecase                      // Images
		  If ActiveSection = 0 Then Me.AddRow Loc.kTrailers    // Trailers
		  If ActiveSection = 1 Then Me.AddRow Loc.kThemeSongs  // Theme Songs
		  Me.AddRow Loc.kOther                                 // Other
		  
		  Me.ListIndex = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnsCancelSave
	#tag Event
		Sub Open()
		  Me.CaptionOK = Loc.Clean
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionCancel()
		  Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionOK()
		  'Dim Choice as String
		  
		  Select case popMode.ListIndex
		    
		  Case 0
		    Choice = "All"
		  case 2
		    Choice = "Metadata"
		  case 3
		    Choice = "Images"
		  case 4
		    Choice = "Media"
		  case 5
		    Choice = "Other"
		    
		  End Select
		  
		  btnsCancelSave.btnRight.Enabled = False
		  popMode.Enabled = False
		  pgCleaned.Visible = True
		  lblDebug.Visible = True
		  
		  'If ActiveSection = 0 Then ThrClean.Run 'ViMMCore.MassClean( wndMain.lstMovies, Choice )
		  ThrClean.Mode = timer.ModeSingle
		  
		  
		  
		  'CommonCore.ReloadList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblArray
	#tag Event
		Sub Open(index as Integer)
		  If ActiveSection = 0 Then
		    Me.Text = Me.Text.ReplaceAll( "<media>", Loc.kTrailers )
		  Else
		    Me.Text = Me.Text.ReplaceAll( "<media>", Loc.kThemeSongs )
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ThrClean
	#tag Event
		Sub Action()
		  btnsCancelSave.btnLeft.Caption = Loc.dlgStop
		  If ActiveSection = 0 Then
		    If wndMain.ccSearchBoxMovies.srchField.StringValue <> "" Then wndMain.ccSearchBoxMovies.srchField.StringValue = ""
		    ViMMCore.MassClean( wndMain.lstSearch, Choice )
		  End If
		  If ActiveSection = 1 Then ViMMCore.MassClean( wndMain.lstTVShadow, Choice )
		  Close
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

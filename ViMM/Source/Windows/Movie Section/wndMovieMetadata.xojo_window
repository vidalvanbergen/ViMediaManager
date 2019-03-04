#tag Window
Begin WindowPro wndMovieMetadata
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
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   False
   Title           =   "#Loc.mMetadataEditor"
   Visible         =   True
   Width           =   900
   Begin ccCancelSave CancelSave
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      CaptionCancel   =   ""
      CaptionOK       =   ""
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   22
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   680
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   558
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
   End
   Begin PagePanel ppTabs
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   546
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   6
      Panels          =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   0
      Value           =   5
      Visible         =   True
      Width           =   900
      Begin Canvas cvsSummaryPoster
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   191
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   14
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppTabs"
         Left            =   350
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   476
         Visible         =   True
         Width           =   200
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppTabs"
         Left            =   350
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   363
         Visible         =   True
         Width           =   200
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppTabs"
         Left            =   350
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   544
         Visible         =   True
         Width           =   200
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppTabs"
         Left            =   350
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   411
         Visible         =   False
         Width           =   200
      End
      Begin Label lblSummaryOutline
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   48
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Outline\rOutline\rOutline"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   39
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   718
      End
      Begin Label lblSummaryTomatoConcensusTitle
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mTomatoConcensus"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   91
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   718
      End
      Begin Label lblSummaryTomatoConcensus
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   45
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "TomatoConcensus\rConcensus Tomatoes\rComatose Tomato"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   108
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   718
      End
      Begin Separator Sep
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppTabs"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   233
         Visible         =   True
         Width           =   860
      End
      Begin Separator Sep
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppTabs"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   374
         Visible         =   True
         Width           =   860
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
         InitialParent   =   "ppTabs"
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
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.kFileSize"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   243
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppTabs"
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
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mRuntime"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   263
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppTabs"
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
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.kDimensions"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   302
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppTabs"
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
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.kAspectRatio"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   322
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Label lblSummaryTitle
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   24
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Title (Year)"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   718
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppTabs"
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
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.kCodecVideo"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   282
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   324
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.kCodecsAudio"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   263
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Label lblSummaryFileSize
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   14
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "4.5GB"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   246
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblSummaryDuration
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   15
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "1 Hour and 42 Minutes"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   266
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblSummaryDimensions
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   16
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "1024 x 768"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   306
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblSummaryRatio
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   17
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "1.77:1"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   326
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblSummaryVideoCodec
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   18
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "AVI"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   286
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblSummaryAudioCodec
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   466
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   19
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "MP3, AAC"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   267
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   20
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mWhere"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   388
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   860
      End
      Begin Label lblSummaryLocation
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   48
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   21
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Absolute\rPath"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   408
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   860
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   7
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   324
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   22
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.kCodecAudioChannels"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   283
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Label lblSummaryAudioChannels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   466
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   23
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "2, 2"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   287
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   8
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   324
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   24
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.kCodecAudioStreams"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   243
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Label lblSummaryAudioStreams
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   466
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   25
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "2"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   248
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblSummaryAudioLanguages
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   35
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   466
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   26
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "English, Dutch"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   307
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   9
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   324
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   27
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.kCodecAudioLanguages"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   303
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin Canvas cvsTomatoCritics
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   185955873
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   28
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   169
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   52
      End
      Begin Canvas cvsTomatoAudience
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   305029249
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   330
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   29
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   169
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   52
      End
      Begin LinkLabelCanvas llIMDb
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   680
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MyState         =   0
         Scope           =   0
         StringHeight    =   0
         StringWidth     =   0
         TabIndex        =   30
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Link"
         Top             =   241
         Transparent     =   True
         URL             =   "http://"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
      End
      Begin LinkLabelCanvas llTMDB
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   680
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MyState         =   0
         Scope           =   0
         StringHeight    =   0
         StringWidth     =   0
         TabIndex        =   31
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Link"
         Top             =   265
         Transparent     =   True
         URL             =   "http://"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
      End
      Begin LinkLabelCanvas llRottenTomatoes
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   680
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MyState         =   0
         Scope           =   0
         StringHeight    =   0
         StringWidth     =   0
         TabIndex        =   32
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Link"
         Top             =   289
         Transparent     =   True
         URL             =   "http://"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
      End
      Begin Label lblTRCritics
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   218
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   33
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "100%"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   28.0
         TextUnit        =   0
         Top             =   169
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label lblTRAudience
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   386
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   34
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "80%"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   28.0
         TextUnit        =   0
         Top             =   169
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   11
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTitle"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   11
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
      End
      Begin SuperTextfield edtTitle
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   32
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   280
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   12
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTitleOriginal"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
      End
      Begin SuperTextfield edtTitleOriginal
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   79
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   280
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   13
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTitleSort"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   105
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
      End
      Begin SuperTextfield edtTitleSort
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   126
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   280
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   14
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mRating"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   152
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin SuperTextfield edtRating
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "99.#"
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "10.9"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   173
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   45
      End
      Begin UpDownArrows udRating
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   69
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   173
         Visible         =   True
         Width           =   13
      End
      Begin SuperTextfield edtYear
         AcceptTabs      =   False
         Alignment       =   3
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   111
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "####"
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "2012"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   173
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   45
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   16
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   113
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   14
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mYear"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   152
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   62
      End
      Begin UpDownArrows upYear
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   160
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   173
         Visible         =   True
         Width           =   13
      End
      Begin SuperTextfield edtPremiere
         AcceptTabs      =   False
         Alignment       =   3
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   185
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "9999-99-99"
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "0000-00-00"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   173
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   98
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   17
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   187
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   17
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kpremiered"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   152
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   115
      End
      Begin UpDownArrows udDate
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   287
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   172
         Visible         =   True
         Width           =   13
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   18
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   20
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mStudios"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   198
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
      End
      Begin SuperListbox lstStudios
         AlternatingRowColors=   True
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   False
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   20
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   True
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   64
         HelpTag         =   ""
         Hierarchical    =   False
         IgnoreChange    =   False
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         InitialValue    =   ""
         IsFocused       =   False
         Italic          =   False
         Left            =   20
         LockBottom      =   False
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
         SelectionType   =   1
         ShowDropIndicator=   False
         TabIndex        =   9
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   219
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   280
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   19
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   314
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   24
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTagline"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   11
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   568
      End
      Begin SuperTextfield edtTagline
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   312
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   32
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   551
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   20
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   314
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   26
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mOutline"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   568
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   21
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   314
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   28
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kPlot"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   152
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   568
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   22
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   314
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   29
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mGenres"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   368
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   238
      End
      Begin SuperTextfield edtGenres
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   312
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   19
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   389
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   551
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   23
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   32
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mCountries"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   320
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
      End
      Begin SuperTextfield edtCountries
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   342
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   280
      End
      Begin SuperTextfield edtLanguages
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   13
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   389
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   280
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   25
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   627
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   36
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kCommaSeparated"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   368
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   238
      End
      Begin PopupArrow popGenres
         AutoDeactivate  =   True
         Enabled         =   True
         Facing          =   1
         Height          =   10
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   870
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   37
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   395
         Visible         =   True
         Width           =   10
      End
      Begin SuperTextArea edtOutline
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   69
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   312
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   False
         TabIndex        =   17
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   79
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   568
      End
      Begin SuperTextArea edtPlot
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   191
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   312
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   False
         TabIndex        =   18
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   173
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   568
      End
      Begin Canvas cvsActorIMG
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   191
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   750
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   14
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin ProgressBar pgActor
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   750
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Scope           =   0
         TabIndex        =   70
         TabPanelIndex   =   3
         Top             =   217
         Value           =   0
         Visible         =   False
         Width           =   130
      End
      Begin SuperListbox lstActors
         AlternatingRowColors=   True
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   4
         ColumnsResizable=   False
         ColumnWidths    =   "150, 200, *, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   22
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   True
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   191
         HelpTag         =   ""
         Hierarchical    =   False
         IgnoreChange    =   False
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         InitialValue    =   "#Loc.kName	#Loc.kRole	#Loc.kThumbURL	ID"
         IsFocused       =   False
         Italic          =   False
         Left            =   20
         LockBottom      =   False
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
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   14
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   718
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin SuperTextfield edtActorName
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   217
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   150
      End
      Begin SuperTextfield edtActorRole
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   169
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   217
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   200
      End
      Begin SuperTextfield edtActorThumbURL
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   368
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   217
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   313
      End
      Begin SuperTextfield edtDirector
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   269
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   353
      End
      Begin SuperTextfield edtWriter
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   385
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   269
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   353
      End
      Begin SuperTextfield edtSound
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   321
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   353
      End
      Begin ExtraArtCanvas cvsExtraArtPreviewer
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   518
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mode            =   "Poster"
         PreviewArt      =   0
         ScaledPic       =   0
         Scope           =   0
         Season          =   -1
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   14
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   748
      End
      Begin PopupMenu popImageMode
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         InitialValue    =   "#Loc.kPoster\r#Loc.kFanart\r-\r#Loc.kLogo\r#Loc.kBanner\r#Loc.kClearArt\r#Loc.kThumb\r#Loc.kDiscArt"
         Italic          =   False
         Left            =   780
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushButton btnDeleteArt
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kDelete"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   780
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   110
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushButton btnDownloadArt
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kDownload"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   780
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   46
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushButton btnOpenArt
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kOpen"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   780
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   78
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin SuperTextfield edtTrailerURL
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   31
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   443
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   580
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   15
         HelpTag         =   ""
         Index           =   29
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   31
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "#lblURLTrailer"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   425
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   280
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   14
         HelpTag         =   ""
         Index           =   10
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   31
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "#lblTrailerMessage"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   469
         Transparent     =   True
         Underline       =   False
         Visible         =   False
         Width           =   580
      End
      Begin ProgressBar pgTrailer
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   31
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Maximum         =   100
         Scope           =   0
         TabIndex        =   87
         TabPanelIndex   =   5
         Top             =   487
         Value           =   0
         Visible         =   False
         Width           =   580
      End
      Begin Label lblDownloadProgress
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   12
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   385
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "###/###"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   511
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   226
      End
      Begin PushbuttonPro btnTrailerDownload
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kDownload"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   645
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   443
         Underline       =   False
         Visible         =   False
         Width           =   100
      End
      Begin PopupArrow popTrailer
         AutoDeactivate  =   True
         Enabled         =   True
         Facing          =   1
         Height          =   10
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   623
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   448
         Visible         =   False
         Width           =   10
      End
      Begin PushbuttonPro btnTrailerDelete
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kDelete"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   780
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   46
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushbuttonPro btnWatchOnline
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kWatchOnline"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   780
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   443
         Underline       =   False
         Visible         =   False
         Width           =   100
      End
      Begin Label lblIMDbTop250
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   559
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   35
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#250"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   28.0
         TextUnit        =   0
         Top             =   169
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   95
      End
      Begin Canvas cvsIMDBTop250
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   2077839514
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   498
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   36
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   169
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   52
      End
      Begin SuperTextArea edtStudio
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   77
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   False
         Styled          =   True
         TabIndex        =   11
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   295
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   223
      End
      Begin PopupArrow popTagLines
         AutoDeactivate  =   True
         Enabled         =   True
         Facing          =   1
         Height          =   10
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   870
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   41
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   38
         Visible         =   True
         Width           =   10
      End
      Begin PopupArrow popMPAA
         AutoDeactivate  =   True
         Enabled         =   True
         Facing          =   1
         Height          =   10
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   290
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   42
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   442
         Visible         =   True
         Width           =   10
      End
      Begin SuperTextfield edtMPAA
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   436
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   263
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   15
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   44
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mMPAARating"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   415
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   211
      End
      Begin SuperTextfield edtMPAAFor
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   312
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   436
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   568
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   30
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   314
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   46
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mMPAARatedFor"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   415
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   211
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppTabs"
         Left            =   350
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   6
         TabStop         =   True
         Top             =   485
         Visible         =   False
         Width           =   200
      End
      Begin MyHierListBox lstRecMovies
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   15
         ColumnsResizable=   False
         ColumnWidths    =   "100%, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   25
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         FolderIcon      =   0
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   488
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         InitialValue    =   ""
         Italic          =   False
         Left            =   -1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   1
         TabPanelIndex   =   6
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   -1
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   221
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Canvas cvsRecommendations
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   True
         Height          =   487
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   220
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   6
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   680
         Begin ProgressWheel prgRecommendations
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "cvsRecommendations"
            Left            =   839
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   6
            TabStop         =   True
            Top             =   457
            Visible         =   False
            Width           =   16
         End
         Begin PopupArrow popGetRecomendedMovie
            AutoDeactivate  =   True
            Enabled         =   True
            Facing          =   1
            Height          =   10
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "cvsRecommendations"
            Left            =   867
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   6
            TabStop         =   True
            Top             =   460
            Visible         =   True
            Width           =   10
         End
      End
      Begin PushButton btnDeleteCache
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.btnClearCache"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   760
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   37
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   201
         Underline       =   False
         Visible         =   False
         Width           =   120
      End
      Begin PushbuttonPro btnWatchOffline
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kWatchOffline"
         Default         =   True
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   780
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   118
         Underline       =   False
         Visible         =   False
         Width           =   100
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   24
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   35
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mLanguages"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   368
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   31
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   627
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   47
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kCommaSeparated"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   462
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   238
      End
      Begin TextField edtTags
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   111
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   48
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   484
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   769
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppTabs"
         Left            =   350
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   50
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   518
         Visible         =   True
         Width           =   200
      End
      Begin SuperTextfield edtCamera
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   385
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   321
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   353
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   33
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   387
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#Loc.mCinematography"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   299
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   353
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   28
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   12
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#Loc.mSound"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   299
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   353
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   26
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#Loc.mDirector"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   248
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   353
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   27
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   387
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#Loc.mWriter"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   248
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   353
      End
      Begin PopupArrow popRipSource
         AutoDeactivate  =   True
         Enabled         =   True
         Facing          =   1
         Height          =   10
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   90
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   52
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   491
         Visible         =   True
         Width           =   10
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   35
         InitialParent   =   "ppTabs"
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
         TabIndex        =   38
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mRipSource"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   342
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin SuperTextfield edtSource
         AcceptTabs      =   False
         Alignment       =   0
         AutoComplete    =   False
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "####"
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   54
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   484
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   62
      End
      Begin Label lblSummarySource
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   186
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   41
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "DVD"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   346
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   32
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   113
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   49
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTags"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   462
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   238
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   34
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   22
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   53
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mRipSource"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   462
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   62
      End
      Begin Canvas cvsRipSource
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   40
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   344
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   20
      End
      Begin PushbuttonPro btnGetTrailer
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kDownload"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   780
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin QTKit.QTMovieView TrailerView
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         ControllerBarHeight=   0.0
         ControllerVisible=   False
         DoubleBuffer    =   False
         Editable        =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   385
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PreservesAspectRatio=   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   14
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   684
      End
      Begin Label lblSummaryTomatoConcensusTitle1
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   162
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   42
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Rotten Tomatoes® Score:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   153
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   718
      End
      BeginSegmented AddRemoveButton AddRemoveActor
         AddEnabled      =   False
         Enabled         =   True
         Height          =   24
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   690
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacControlStyle =   6
         RemoveEnabled   =   False
         Scope           =   2
         Segments        =   "\n\nFalse\r\n\nFalse"
         SelectionType   =   2
         TabIndex        =   71
         TabPanelIndex   =   3
         Top             =   217
         Visible         =   True
         Width           =   48
      End
      BeginSegmented AddRemoveButton AddRemoveStudio
         AddEnabled      =   False
         Enabled         =   True
         Height          =   24
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacControlStyle =   6
         RemoveEnabled   =   False
         Scope           =   2
         Segments        =   "\n\nFalse\r\n\nFalse"
         SelectionType   =   2
         TabIndex        =   55
         TabPanelIndex   =   2
         Top             =   295
         Visible         =   True
         Width           =   48
      End
   End
   Begin PushbuttonPro btnPrevious
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Loc.btnPrevious"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   558
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushbuttonPro btnNext
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Loc.btnNext"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   112
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   558
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin HTTPSocket scktActor
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      Handle          =   0
      httpProxyAddress=   ""
      httpProxyPort   =   0
      Index           =   -2147483648
      InitialParent   =   ""
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
   Begin Timer thrActor
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin TrailerSckt TrailerSckteer
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      Handle          =   0
      httpProxyAddress=   ""
      httpProxyPort   =   0
      Index           =   -2147483648
      InitialParent   =   ""
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
   Begin Timer thrRecommendations
      Index           =   -2147483648
      InitialParent   =   ""
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
		  Preferences.SaveWindowPos( Self, "wndMetadataMovies" )
		  wndMain.lstMovies.Enabled = True
		  wndMain.ProgressRunning = False
		  
		  thrActor.mode = timer.ModeOff 'Kill
		  thrRecommendations.mode = timer.ModeOff 'Kill
		  scktActor.Close
		  TrailerSckteer.Close
		  
		  'MovieAttr.LoadImages MovieAttr.FolderParent
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
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  "MovieMetaSummary", "MovieMetaInfo", "MovieMetaPeople", "MovieMetaImages", "MovieMetaTrailer", "MovieMetaRecommendations", _
		  NSToolbarFlexibleSpaceItemIdentifier )
		  Toolbar.SelectableItems = Array( "MovieMetaSummary", "MovieMetaInfo", "MovieMetaPeople", "MovieMetaImages", "MovieMetaTrailer", "MovieMetaRecommendations" )
		  
		  
		  // This is an array of items identifiers to specify all the allowed items in toolbar
		  // this template is used to populate the toolbar customization panel
		  Toolbar.AllowedItems = Array ( _
		  _ // Commonly used toolbar items
		  NSToolbarSpaceItemIdentifier, _
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  NSToolbarCustomizeToolbarItemIdentifier, _
		  NSToolbarSeparatorItemIdentifier, _
		  _ // Your toolbar items
		  "MovieMetaSummary", "MovieMetaInfo", "MovieMetaPeople", "MovieMetaImages", "MovieMetaTrailer", "MovieMetaRecommendations" )
		  
		  
		  // Add toolbar items
		  'Toolbar.AddControl( PushButton1, "Pushbutton" ) // Simplified method to add customtoolbar items with controls
		  'Toolbar.AddButton( "mainAdvanced", NSImage.Advanced, "Advanced", "", "", False )
		  
		  Toolbar.AddButton( "MovieMetaSummary", NSImage.LoadByName( "template_summary" ), Loc.mTabSummary, Loc.mTabSummary, Loc.mTabSummary, True )
		  Toolbar.AddButton( "MovieMetaInfo", NSImage.LoadByName( "template_info" ), Loc.mTabInfo, "", "", True )
		  Toolbar.AddButton( "MovieMetaPeople", NSImage.LoadByName( "template_people" ), Loc.mTabPeople, "", "", True )
		  Toolbar.AddButton( "MovieMetaImages", NSImage.LoadByName( "template_images" ), Loc.kImages, "", "", True )
		  Toolbar.AddButton( "MovieMetaTrailer", NSImage.LoadByName( "template_trailer" ), Loc.kTrailer, "", "", True )
		  Toolbar.AddButton( "MovieMetaRecommendations", NSImage.LoadByName( "template_link" ), Loc.kRecMovies, "", "", True )
		  
		  toolbar.SelectedItemIdentifier = "MovieMetaSummary"
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  If Keyboard.AsyncCommandKey Then
		    
		    // Switch Tabs
		    If Asc(Key) >= 49 And Asc(Key) <= 54 And ppTabs.Value <> Val( Key ) -1 Then
		      SwitchPanels Val( Key )
		      Return True
		    End If
		    
		    // Left Arrow & UpArrow
		    If ( Asc(Key) = 28 Or Asc(Key) = 30 ) And btnPrevious.Enabled Then
		      btnPrevious.Push
		      Return True
		    End If
		    
		    // Right Arrow & Down Arrows
		    If ( Asc(Key) = 29 Or Asc(Key) = 31 ) And btnNext.Enabled Then
		      btnNext.Push
		      Return True
		    End If
		    
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  wndMain.ProgressRunning = True
		  wndMain.lstMovies.Enabled = False
		  
		  Preferences.LoadWindowPos( Self, "wndMetadataMovies" )
		  
		  If Preferences.Prefs.integerForKey("NSWindow MetadataMovie Tab") +1 < 7 Then
		    SwitchPanels Preferences.Prefs.integerForKey("NSWindow MetadataMovie Tab") +1
		  Else
		    SwitchPanels 1
		  End If
		  
		  GetNFO()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Settings()
		  self.PrefToolbarName = "NSToolbarMovieMetadata" // Activate toolbar support.
		  'self.TitleVisible = False // Merge toolbar with titlebar.
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarActions(Identifier as String, hitItem as NSMenuItem)
		  
		  Select case Identifier
		    
		  case "MovieMetaSummary"
		    SwitchPanels 1
		  case "MovieMetaInfo"
		    SwitchPanels 2
		  case "MovieMetaPeople"
		    SwitchPanels 3
		  case "MovieMetaImages"
		    SwitchPanels 4
		  case "MovieMetaTrailer"
		    SwitchPanels 5
		  case "MovieMetaRecommendations"
		    SwitchPanels 6
		    
		  End Select
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Self.Close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub GetNFO()
		  // Prev & Next Buttons
		  If wndMain.lstMovies.ListIndex = wndMain.lstMovies.ListCount - 1 Then btnNext.Enabled = False Else btnNext.Enabled = True
		  If wndMain.lstMovies.ListIndex = 0 Then btnPrevious.Enabled = False Else btnPrevious.Enabled = True
		  
		  If MovieAttr.Title <> "" And MovieAttr.DateYear > 0 Then
		    Self.Title = MovieAttr.Title + " (" + Str( MovieAttr.DateYear ) + ")"
		  ElseIf MovieAttr.Title <> "" Then
		    Self.Title = MovieAttr.Title
		  Else
		    Self.Title = FindMovieName( MovieAttr.FolderParent, True, NOT Preferences.Prefs.boolForKey("UseFolderNameForLookUp") )
		  End If
		  
		  // &----- Tab Summary
		  cvsSummaryPoster.Reload
		  
		  // Summary Title
		  lblSummaryTitle.Text = Self.Title
		  
		  // Summary Outline
		  lblSummaryOutline.Text = MovieAttr.DescriptionOutline
		  
		  // Tomato Concensus
		  If MovieAttr.TomatoConcensus = "" Then
		    lblSummaryTomatoConcensusTitle.Text = ""
		    lblSummaryTomatoConcensus.Text      = ""
		  Else
		    lblSummaryTomatoConcensusTitle.Text = Loc.mTomatoConcensus
		    lblSummaryTomatoConcensus.Text      = MovieAttr.TomatoConcensus
		  End If
		  
		  // Rotten Tomatoes
		  If MovieAttr.TomatoCriticsScore > -1 Then
		    lblTRCritics.Text = Str( MovieAttr.TomatoCriticsScore ) + "%"
		    If MovieAttr.TomatoCriticsRating = "Fresh" Then RT_Critics = rtratingfresh
		    If MovieAttr.TomatoCriticsRating = "Rotten" Then RT_Critics = rtratingrotten
		    If MovieAttr.TomatoCriticsRating = "Certified Fresh" Then RT_Critics = rtratingcertified
		  ElseIf MovieAttr.TomatoCriticsScore = -1 And MovieAttr.TomatoAudienceScore > -1 Then
		    lblTRCritics.Text = Str( MovieAttr.TomatoAudienceScore ) + "%"
		    If MovieAttr.TomatoAudienceRating = "Spilled" Then RT_Critics = rtratingspilled
		    If MovieAttr.TomatoAudienceRating = "Upright" Then RT_Critics = rtratingupright
		  Else
		    lblTRCritics.Text = ""
		    RT_Critics = Nil
		  End If
		  
		  If MovieAttr.TomatoAudienceScore > -1 And MovieAttr.TomatoCriticsScore > -1 Then
		    lblTRAudience.Text = Str( MovieAttr.TomatoAudienceScore ) + "%"
		    If MovieAttr.TomatoAudienceRating = "Spilled" Then RT_User = rtratingspilled
		    If MovieAttr.TomatoAudienceRating = "Upright" Then RT_User = rtratingupright
		  Else
		    lblTRAudience.Text = ""
		    RT_User = Nil
		  End If
		  
		  // IMDb Top 250
		  If MovieAttr.RatingTop250 > -1 Then
		    lblIMDbTop250.Text = "#" + Str( MovieAttr.RatingTop250 )
		    IMDB_Top250 = IMDbTop250
		  Else
		    lblIMDbTop250.Text = ""
		    IMDB_Top250 = Nil
		  End If
		  
		  cvsTomatoCritics.Backdrop = Nil
		  cvsTomatoAudience.Backdrop = Nil
		  cvsIMDBTop250.Backdrop = Nil
		  
		  cvsTomatoCritics.Reload
		  cvsTomatoAudience.Reload
		  cvsIMDBTop250.Reload
		  
		  
		  // Links
		  If MovieAttr.ID_IMDB <> "" Then
		    llIMDb.Visible = True
		    llIMDb.Text = "IMDb: " + MovieAttr.ID_IMDB
		    llIMDb.URL = "http://www.imdb.com/title/" + MovieAttr.ID_IMDB
		    'llIMDb.Width = 20 + 5 + Graphics.StringWidth( llIMDb.Text ) + 10
		  Else
		    llIMDb.Visible = False
		    llIMDb.Text = ""
		    llIMDb.URL = ""
		  End If
		  llIMDb.Reload
		  
		  If MovieAttr.ID_TMDB <> "" Then
		    llTMDB.Visible = True
		    llTMDB.Text = "TMDb: " + MovieAttr.ID_TMDB
		    llTMDB.URL = "http://www.themoviedb.org/movie/" + MovieAttr.ID_TMDB
		    'llTMDB.Width = 20 + 5 + Graphics.StringWidth( llTMDB.Text ) + 10
		  Else
		    llTMDB.Visible = False
		    llTMDB.Text = ""
		    llTMDB.URL = ""
		  End If
		  llTMDB.Reload
		  
		  If MovieAttr.ID_RottenTomatoes <> "" Then
		    llRottenTomatoes.Visible = True
		    llRottenTomatoes.Text = "Tomatoes: " + MovieAttr.ID_RottenTomatoes
		    llRottenTomatoes.URL = "http://www.rottentomatoes.com/m/" + MovieAttr.ID_RottenTomatoes
		    'llRottenTomatoes.Width = 20 + 5 + Graphics.StringWidth( llRottenTomatoes.Text ) + 10
		  Else
		    llRottenTomatoes.Visible = False
		    llRottenTomatoes.Text = ""
		    llRottenTomatoes.URL = ""
		  End If
		  llRottenTomatoes.Reload
		  
		  // Techies
		  Dim MovieFiles() as FolderItem = FindMovieItems( MovieAttr.FolderParent )
		  Dim TotalSize as String
		  
		  if MovieFiles <> Nil then
		    For i as Integer = 0 to MovieFiles.Ubound
		      If MovieFiles(i).Name = "VIDEO_TS" or MovieFiles(i).Name.Contains(".dvdmedia") Then
		        TotalSize = "4630" + "000" + "000"
		      ElseIf MovieFiles(i).Name = "BDMV" Then
		        TotalSize = "25000" + "000" + "000"
		      Else
		        TotalSize = Str( Val( TotalSize ) + ( MovieFiles(i).Length ) )' / 1000 / 1000 ) )
		      End If
		    Next
		  end if
		  
		  // File Size
		  If Val( TotalSize ) > -1 Then lblSummaryFileSize.Text = BytesToString( TotalSize )
		  
		  lblSummaryLocation.Text = ""
		  if MovieFiles <> Nil then
		    For i as integer = 0 to MovieFiles.Ubound
		      lblSummaryLocation.Text = lblSummaryLocation.Text + MovieFiles(i).ShellPath.ReplaceAll("\","") + EndOfLine
		    Next
		  end if
		  
		  // Duration
		  If Val( MovieAttr.InfoVideoRuntime ) > 0 Then
		    lblSummaryDuration.Text = Val( MovieAttr.InfoVideoRuntime ).Minutes2Hours
		  Else
		    lblSummaryDuration.Text = Loc.kNotAvailable
		  End If
		  
		  // Dimensions
		  If MovieAttr.InfoVideoWidth > -1 And MovieAttr.InfoVideoHeight > -1 Then
		    lblSummaryDimensions.Text = Str( MovieAttr.InfoVideoWidth ) + " x " + Str( MovieAttr.InfoVideoHeight )
		  Else
		    lblSummaryDimensions.Text = Loc.kNotAvailable
		  End If
		  
		  // Aspect Ratio
		  If MovieAttr.InfoVideoAspect <> "" Then
		    lblSummaryRatio.Text = MovieAttr.InfoVideoAspect
		  Else
		    lblSummaryRatio.Text = Loc.kNotAvailable
		  End If
		  
		  // Video Codec
		  If MovieAttr.InfoVideoCodec <> "" Then
		    lblSummaryVideoCodec.Text = MovieAttr.InfoVideoCodec
		  Else
		    lblSummaryVideoCodec.Text = Loc.kNotAvailable
		  End If
		  
		  // Rip Source
		  If MovieAttr.RipSource <> "" Then
		    lblSummarySource.Text = MovieAttr.RipSource
		  Else
		    lblSummarySource.Text = Loc.kNotAvailable
		  End If
		  'cvsRipSource.Invalidate()
		  
		  // Audio Codec
		  If MovieAttr.InfoAudioCodec.Ubound > -1 Then
		    lblSummaryAudioStreams.Text = Str( MovieAttr.InfoAudioCodec.Ubound + 1 )
		    
		    For i as integer = 0 to MovieAttr.InfoAudioCodec.Ubound
		      If i = 0 Then
		        
		        lblSummaryAudioCodec.Text = MovieAttr.InfoAudioCodec(i)
		        
		        If MovieAttr.InfoAudioChannels.Ubound >= i Then
		          lblSummaryAudioChannels.Text = Str( MovieAttr.InfoAudioChannels(i) )
		        Else
		          lblSummaryAudioChannels.Text = Loc.kNotAvailable
		        End If
		        
		        If MovieAttr.InfoAudioLanguage.Ubound >= i Then
		          lblSummaryAudioLanguages.Text = MovieAttr.InfoAudioLanguage(i)
		        Else
		          lblSummaryAudioLanguages.Text = Loc.kNotAvailable
		        End If
		        
		      Else
		        
		        lblSummaryAudioCodec.Text = lblSummaryAudioCodec.Text + ", " + MovieAttr.InfoAudioCodec(i)
		        
		        If MovieAttr.InfoAudioChannels.Ubound >= i Then
		          lblSummaryAudioChannels.Text = lblSummaryAudioChannels.Text + ", " + Str( MovieAttr.InfoAudioChannels(i) )
		        Else
		          lblSummaryAudioChannels.Text = lblSummaryAudioChannels.Text + ", " + Loc.kNotAvailable
		        End If
		        
		        If MovieAttr.InfoAudioLanguage.Ubound >= i Then
		          lblSummaryAudioLanguages.Text = lblSummaryAudioLanguages.Text + ", " + MovieAttr.InfoAudioLanguage(i)
		        Else
		          lblSummaryAudioLanguages.Text = Loc.kNotAvailable
		        End If
		        
		      End If
		    Next
		  Else
		    lblSummaryAudioStreams.Text   = Loc.kNotAvailable
		    lblSummaryAudioCodec.Text     = Loc.kNotAvailable
		    lblSummaryAudioStreams.Text   = Loc.kNotAvailable
		    lblSummaryAudioLanguages.Text = Loc.kNotAvailable
		    lblSummaryAudioChannels.Text  = Loc.kNotAvailable
		  End If
		  
		  
		  // &----- Tab Info
		  
		  // Title
		  edtTitle.Text         = MovieAttr.Title
		  edtTitleOriginal.Text = MovieAttr.TitleOriginal
		  edtTitleSort.Text     = MovieAttr.TitleSort
		  
		  // Rating
		  If MovieAttr.Rating > -1 Then edtRating.Text        = Str( MovieAttr.Rating ) Else edtRating.Text = ""
		  Dim sx1 as Integer    = MovieAttr.RatingMPAA.InStr(0, " for ")
		  If sx1 > 0 Then
		    edtMPAA.Text          = Trim( MovieAttr.RatingMPAA.Left(sx1) )
		    // Capitalize first letter.
		    edtMPAAFor.Text       = Trim( MovieAttr.RatingMPAA.Right( MovieAttr.RatingMPAA.Len - sx1 - 4 ).Left(1).Uppercase ) + Trim( MovieAttr.RatingMPAA.Right( MovieAttr.RatingMPAA.Len - sx1 - 5 ) )
		  Else
		    edtMPAA.Text          = MovieAttr.RatingMPAA
		    edtMPAAFor.Text       = ""
		  End If
		  
		  // Premiere
		  If MovieAttr.DateYear > -1 Then edtYear.Text          = Str( MovieAttr.DateYear ) Else edtYear.Text =  ""
		  edtPremiere.Text      = MovieAttr.DatePremiered
		  
		  // Studios
		  lstStudios.DeleteAllRows
		  For i as Integer = 0 to MovieAttr.Studios.Ubound
		    lstStudios.AddRow MovieAttr.Studios(i)
		  Next
		  
		  // Tagline
		  edtTagline.Text = MovieAttr.DescriptionTagline
		  edtOutline.Text = MovieAttr.DescriptionOutline
		  edtPlot.Text    = MovieAttr.DescriptionPlot
		  If MovieAttr.DescriptionTaglines.Ubound > -1 Then
		    popTagLines.Visible = True
		    edtTagline.Width = 551
		  Else
		    popTagLines.Visible = False
		    edtTagline.Width = 568
		  End If
		  
		  // Countries
		  edtCountries.Text = ""
		  For i as Integer = 0 to MovieAttr.Countries.Ubound
		    If edtCountries.Text = "" Then
		      edtCountries.Text = MovieAttr.Countries(i)
		    Else
		      edtCountries.Text = edtCountries.Text + ", " + MovieAttr.Countries(i)
		    End If
		  Next
		  
		  // Languages
		  edtLanguages.Text = ""
		  For i as Integer = 0 to MovieAttr.LanguagesSpoken.Ubound
		    If edtLanguages.Text = "" Then
		      edtLanguages.Text = MovieAttr.LanguagesSpoken(i)
		    Else
		      edtLanguages.Text = edtLanguages.Text + ", " + MovieAttr.LanguagesSpoken(i)
		    End If
		  Next
		  
		  // Genres
		  edtGenres.Text = ""
		  For i as Integer = 0 to MovieAttr.Genres.Ubound
		    If edtGenres.Text = "" Then
		      edtGenres.Text = MovieAttr.Genres(i)
		    Else
		      edtGenres.Text = edtGenres.Text + ", " + MovieAttr.Genres(i)
		    End If
		  Next
		  
		  // Tags
		  edtTags.Text = ""
		  For i as Integer = 0 to MovieAttr.Tags.Ubound
		    If edtTags.Text = "" Then
		      edtTags.Text = MovieAttr.Tags(i)
		    Else
		      edtTags.Text = edtTags.Text + ", " + MovieAttr.Tags(i)
		    End If
		  Next
		  
		  // Rip Source
		  edtSource.Text = Trim( MovieAttr.RipSource )
		  
		  
		  // &----- Tab People
		  
		  lstActors.DeleteAllRows
		  For i as Integer = 0 to MovieAttr.ActorName.Ubound
		    lstActors.AddRow MovieAttr.ActorName(i), MovieAttr.ActorRole(i), MovieAttr.ActorThumbURL(i), MovieAttr.ActorID(i)
		    Dim b as Boolean = False
		    For n as Integer = 0 to MovieAttr.ActorStar.Ubound
		      If ( MovieAttr.ActorName(i) = MovieAttr.ActorStar(n) ) Then
		        lstActors.RowPicture( lstActors.LastIndex ) = starring 'ScaleImage( starring, 16, 16 )
		        Exit
		      End If
		    Next
		  Next
		  
		  edtDirector.Text = MovieAttr.CreditDirector
		  edtWriter.Text   = MovieAttr.CreditWriter
		  edtSound.Text    = MovieAttr.CreditMusic
		  edtCamera.Text   = MovieAttr.CreditCamera
		  
		  
		  // &----- Tab ExtraArt
		  Dim f as FolderItem
		  Dim m as String
		  
		  Select Case popImageMode.ListIndex
		    
		  Case 0
		    f = FindImagePoster( MovieAttr.FolderParent )
		    m = "Poster"
		  Case 1
		    f = FindImageFanart( MovieAttr.FolderParent )
		    m = "Fanart"
		    
		  Case 3
		    f = MovieAttr.FolderParent.Child( "logo.png" )
		    m = "Logo"
		  Case 4
		    f = FindImageBanner( MovieAttr.FolderParent )
		    m = "Banner"
		  Case 5
		    f = MovieAttr.FolderParent.Child( "clearart.png" )
		    m = "ClearArt"
		  Case 6
		    f = MovieAttr.FolderParent.Child( "landscape.jpg" )
		    m = "Thumb"
		  Case 7
		    f = MovieAttr.FolderParent.Child( "disc.png" )
		    m = "DiscArt"
		    
		  End Select
		  
		  cvsExtraArtPreviewer.Mode = m
		  If f <> Nil and f.Exists Then
		    cvsExtraArtPreviewer.Reload Picture.Open( f )
		    btnDeleteArt.Enabled = True
		  Else
		    cvsExtraArtPreviewer.Reload Nil
		    btnDeleteArt.Enabled = False
		  End If
		  
		  // &----- Tab Trailer
		  Dim TrailerFile as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		  btnTrailerDelete.Enabled = ( TrailerFile <> Nil )
		  btnWatchOffline.Enabled = ( TrailerFile <> Nil )
		  
		  TrailerView.Pause
		  TrailerView.Movie = Nil
		  
		  If TrailerFile <> Nil ANd TrailerFile.Exists Then
		    Dim qt_movie As QTMovie = QTMovie.LoadFromFolderItem( TrailerFile )
		    If qt_movie <> Nil Then
		      TrailerView.Visible = True
		      TrailerView.Movie = qt_movie
		    Else
		      TrailerView.Visible = False
		    End If
		  End If
		  
		  // &----- Recommendations
		  lstRecMovies.DeleteAllRows
		  Dim RottenTomatoes, TMDB, IMDb, TraktTV as Boolean = False
		  For i as Integer = 0 to MovieAttr.RecMoviesIDs.Ubound
		    If NOT RottenTomatoes And ( MovieAttr.RecMoviesIDs(i).InStr( 0, "rottentomatoes" ) > 0 OR ( MovieAttr.RecMoviesSources.Ubound >= i And MovieAttr.RecMoviesSources(i) = "RottenTomatoes" ) ) Then RottenTomatoes = True
		    If NOT TMDB And MovieAttr.RecMoviesIDs(i).Left(2) <> "tt" Then TMDB = True
		    If NOT IMDb And MovieAttr.RecMoviesIDs(i).Left(2) = "tt" Then IMDb = True
		    
		    If MovieAttr.RecMoviesSources(i) = "imdb" Then TraktTV = True
		    If MovieAttr.RecMoviesSources(i) = "tmdb" Then TraktTV = True
		    If MovieAttr.RecMoviesSources(i) = "rottentomatoes" Then TraktTV = True
		    If MovieAttr.RecMoviesSources(i) = "Trakt.tv" Then TraktTV = True
		  Next
		  
		  If RottenTomatoes Then
		    lstRecMovies.AddFolder "RottenTomatoes"
		    lstRecMovies.RowPicture( lstRecMovies.LastIndex ) = ScaleImage( icorottentomatoes, 16, 16 )
		    lstRecMovies.RowTag( lstRecMovies.LastIndex ) = "Folder"
		  End If
		  
		  If TMDB Then
		    lstRecMovies.AddFolder "TMDb"
		    lstRecMovies.RowPicture( lstRecMovies.LastIndex ) = icotmdb
		    lstRecMovies.RowTag( lstRecMovies.LastIndex ) = "Folder"
		  End If
		  
		  If IMDb Then
		    lstRecMovies.AddFolder "IMDb"
		    lstRecMovies.RowPicture( lstRecMovies.LastIndex ) = icoimdb
		    lstRecMovies.RowTag( lstRecMovies.LastIndex ) = "Folder"
		  End If
		  
		  If TraktTV Then
		    lstRecMovies.AddFolder "Trakt.tv"
		    lstRecMovies.RowPicture( lstRecMovies.LastIndex ) = ScaleImage( icotrakttv, 16, 16 )
		    lstRecMovies.RowTag( lstRecMovies.LastIndex ) = "Folder"
		  End If
		  
		  For i as Integer = lstRecMovies.ListCount - 1 DownTo 0
		    lstRecMovies.Expanded ( i ) = False
		  Next
		  
		  For i as Integer = lstRecMovies.ListCount - 1 DownTo 0
		    lstRecMovies.Expanded ( i ) = True
		  Next
		  
		  'For i as Integer = 0 to MovieAttr.RecMovies.Ubound
		  'lstRecMovies.AddRow MovieAttr.RecMovies(i), MovieAttr.RecMoviesIDs(i)
		  'Next
		  'cvsRecommendations.Reload
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveNFO()
		  
		  // ----- Info
		  MovieAttr.Title         = Trim( edtTitle.Text         )
		  MovieAttr.TitleOriginal = Trim( edtTitleOriginal.Text )
		  MovieAttr.TitleSort     = Trim( edtTitleSort.Text     )' Else MovieAttr.TitleSort = Articulator( MovieAttr.Title )
		  
		  MovieAttr.DescriptionTagline = Trim( edtTagline.Text )
		  MovieAttr.DescriptionOutline = Trim( edtOutline.Text )
		  MovieAttr.DescriptionPlot    = Trim( edtPlot.Text    )
		  
		  MovieAttr.RatingMPAA    = Trim( edtMPAA.Text  )
		  If edtMPAAFor.Text <> "" Then MovieAttr.RatingMPAA = MovieAttr.RatingMPAA + " for " + Trim( edtMPAAFor.Text ).Lowercase
		  If Trim( edtRating.Text ) <> "" Then MovieAttr.Rating        = Val( edtRating.Text )
		  If Trim( edtYear.Text ) <> "" Then
		    MovieAttr.DateYear      = Val( edtYear.Text )
		    MsgBox Str( MovieAttr.DateYear )
		  End If
		  MovieAttr.DatePremiered = Trim( edtPremiere.Text )
		  
		  // Studios
		  ReDim MovieAttr.Studios(-1)
		  For i as Integer = 0 to lstStudios.ListCount - 1
		    MovieAttr.Studios.Append Trim( lstStudios.Cell( i, 0 ) )
		  Next
		  
		  // Genres
		  ReDim MovieAttr.Genres(-1)
		  Dim GenreStr as String = edtGenres.Text
		  While GenreStr.InStr( 0, ", " ) > 0
		    GenreStr = GenreStr.ReplaceAll( ", ", "," )
		  Wend
		  MovieAttr.Genres = Trim( GenreStr ).Split(",")
		  'MovieAttr.Genres.Sort
		  
		  // Tags
		  ReDim MovieAttr.Tags(-1)
		  Dim TagsStr as String = edtTags.Text
		  While TagsStr.InStr( 0, ", " ) > 0
		    TagsStr = TagsStr.ReplaceAll( ", ", "," )
		  Wend
		  MovieAttr.Tags = Trim( TagsStr ).Split(",")
		  'MovieAttr.Tags.Sort
		  
		  // Countries
		  ReDim MovieAttr.Countries(-1)
		  Dim CountryStr as String = edtCountries.Text
		  While CountryStr.InStr( 0, ", " ) > 0
		    CountryStr = Trim( CountryStr.ReplaceAll( ", ", "," ) )
		  Wend
		  MovieAttr.Countries = CountryStr.Split(",")
		  
		  // Languages
		  ReDim MovieAttr.LanguagesSpoken(-1)
		  ReDim MovieAttr.LanguagesSpokenCode(-1)
		  
		  Dim LanguageString as String = edtLanguages.Text
		  While LanguageString.InStr( 0, ", " ) > 0
		    LanguageString = Trim( LanguageString.ReplaceAll( ", ", "," ) )
		  Wend
		  MovieAttr.LanguagesSpoken = LanguageString.Split(",")
		  
		  For i as Integer = 0 to MovieAttr.LanguagesSpoken.Ubound
		    MovieAttr.LanguagesSpokenCode.Append FlagLanguage( MovieAttr.LanguagesSpoken(i) )
		  Next
		  
		  // ----- People
		  ReDim MovieAttr.ActorID(-1)
		  ReDim MovieAttr.ActorName(-1)
		  ReDim MovieAttr.ActorRole(-1)
		  ReDim MovieAttr.ActorThumbURL(-1)
		  
		  For i as Integer = 0 to lstActors.ListCount - 1
		    MovieAttr.ActorID.Append       lstActors.Cell(i, 3)
		    MovieAttr.ActorName.Append     lstActors.Cell(i, 0)
		    MovieAttr.ActorRole.Append     lstActors.Cell(i, 1)
		    MovieAttr.ActorThumbURL.Append lstActors.Cell(i, 2)
		  Next
		  
		  MovieAttr.CreditDirector = Trim( edtDirector.Text )
		  MovieAttr.CreditWriter   = Trim( edtWriter.Text )
		  MovieAttr.CreditMusic    = Trim( edtSound.Text )
		  MovieAttr.CreditCamera   = Trim( edtCamera.Text )
		  
		  // Rip Source
		  MovieAttr.RipSource = Trim( edtSource.Text )
		  
		  // ----- Write NFO
		  MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		  
		  // ----- AutoManage Media
		  If Modified And Preferences.Prefs.boolForKey("AutoManageMedia") Then
		    CommonCore.MassSearch = True
		    SingleRenamer MovieAttr.FolderParent, -1, True // 18
		    CommonCore.MassSearch = False
		  End if
		  Modified = False
		  
		  wndMain.lstMovies.UpdateRow
		  MovieAttr.LoadImages( MovieAttr.FolderParent )
		  wndMain.cvsMovieDetails.Reload
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwitchPanels(Index as Integer)
		  thrActor.mode = timer.ModeOff 'Kill
		  thrRecommendations.mode = timer.ModeOff 'Kill
		  scktActor.Close
		  TrailerSckteer.Close
		  
		  
		  Select case Index
		  case 1
		    toolbar.SelectedItemIdentifier = "MovieMetaSummary"
		    
		  case 2
		    Toolbar.SelectedItemIdentifier = "MovieMetaInfo"
		    
		  case 3
		    toolbar.SelectedItemIdentifier = "MovieMetaPeople"
		    
		  case 4
		    toolbar.SelectedItemIdentifier = "MovieMetaImages"
		    
		  case 5
		    toolbar.SelectedItemIdentifier = "MovieMetaTrailer"
		    
		  case 6
		    toolbar.SelectedItemIdentifier = "MovieMetaRecommendations"
		    
		  End Select
		  
		  'If Index > 6 Then Return
		  
		  
		  'If App.ScalingFactor = 2 Then
		  'ToolButton( tbMetaEditor.Item( 1 ) ).Icon = tb_metasummary2x
		  'ToolButton( tbMetaEditor.Item( 2 ) ).Icon = tb_metainfo2x
		  'ToolButton( tbMetaEditor.Item( 3 ) ).Icon = tb_metapeople2x
		  'ToolButton( tbMetaEditor.Item( 4 ) ).Icon = tb_metaimages2x
		  'ToolButton( tbMetaEditor.Item( 5 ) ).Icon = tb_metatrailers2x
		  'ToolButton( tbMetaEditor.Item( 6 ) ).Icon = tb_metarecmovies2x
		  'Else
		  'ToolButton( tbMetaEditor.Item( 1 ) ).Icon = tb_metasummary
		  'ToolButton( tbMetaEditor.Item( 2 ) ).Icon = tb_metainfo
		  'ToolButton( tbMetaEditor.Item( 3 ) ).Icon = tb_metapeople
		  'ToolButton( tbMetaEditor.Item( 4 ) ).Icon = tb_metaimages
		  'ToolButton( tbMetaEditor.Item( 5 ) ).Icon = tb_metatrailers
		  'ToolButton( tbMetaEditor.Item( 6 ) ).Icon = tb_metarecmovies
		  'End If
		  
		  
		  'Dim tb as ToolButton = ToolButton( tbMetaEditor.Item( Index ) )
		  
		  'Select Case Index
		  '
		  'Case 1
		  '
		  'If App.ScalingFactor = 2 Then
		  'tb.Icon = tb_metasummaryselected2x
		  'Else
		  'tb.Icon = tb_metasummaryselected
		  'End If
		  '
		  '
		  'Case 2
		  'If App.ScalingFactor = 2 Then
		  'tb.Icon = tb_metainfoselected2x
		  'Else
		  'tb.Icon = tb_metainfoselected
		  'End If
		  '
		  '
		  'Case 3
		  'If App.ScalingFactor = 2 Then
		  'tb.Icon = tb_metapeopleselected2x
		  'Else
		  'tb.Icon = tb_metapeopleselected
		  'End If
		  '
		  '
		  'Case 4
		  'If App.ScalingFactor = 2 Then
		  'tb.Icon = tb_metaimagesselected2x
		  'Else
		  'tb.Icon = tb_metaimagesselected
		  'End If
		  '
		  '
		  'Case 5
		  ''CommonCore.GetMovieTrailer()
		  ''Return
		  '
		  'If App.ScalingFactor = 2 Then
		  'tb.Icon = tb_metatrailersselected2x
		  'Else
		  'tb.Icon = tb_metatrailersselected
		  'End If
		  '
		  '
		  'Case 6
		  'If App.ScalingFactor = 2 Then
		  'tb.Icon = tb_metarecmoviesselected2x
		  'Else
		  'tb.Icon = tb_metarecmoviesselected
		  'End If
		  '
		  'End Select
		  
		  
		  'If Index-1 <> ppTabs.Value Then ppTabs.Value = Index -1
		  
		  'SmoothResize( self, self.Width, SepArray( ppTabs.Value ).Top + SepArray( ppTabs.Value ).Height + 55, 4 )
		  SmoothResize( self, self.Width, SepArray( Index-1 ).Top + SepArray( Index-1 ).Height + 55, 4 )
		  'Self.Height = SepArray( ppTabs.Value ).Top + SepArray( ppTabs.Value ).Height + 54 // To make sure that the controls move correctly
		  Self.Height = SepArray( Index-1 ).Top + SepArray( Index-1 ).Height + 54
		  'self.Refresh
		  'ppTabs.Refresh
		  
		  ppTabs.Value = Index -1
		  
		  SmoothResize( self, self.Width, SepArray( ppTabs.Value ).Top + SepArray( ppTabs.Value ).Height + 55, 4 )
		  Self.Height = SepArray( ppTabs.Value ).Top + SepArray( ppTabs.Value ).Height + 54 // To make sure that the controls move correctly
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ActorIMG As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ActorLastSelection As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		IMDB_Top250 As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Modified As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		RecMovieFanart As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RecMoviePoster As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		RT_Critics As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		RT_User As Picture
	#tag EndProperty


	#tag Constant, Name = lblTrailerMessage, Type = String, Dynamic = True, Default = \"If left empty\x2C ViMediaManager will try to find a trailer on it\'s own.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"If left empty\x2C ViMediaManager will try to find a trailer on it\'s own."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Als dit veld leeg gelaten wordt\x2C dan zal ViMediaManager zelf proberen een trailer te vinden."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Om l\xC3\xA4mnad tom kommer ViMediaManager att f\xC3\xB6rs\xC3\xB6ka hitta en trailer."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Bleibt das Feld leer\x2C so versucht ViMediaManager selbstt\xC3\xA4tig nach einem Trailer zu suchen."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Laissez vide pour que ViMediaManager recherche une bande-annonce par lui-m\xC3\xAAme."
	#tag EndConstant

	#tag Constant, Name = lblURLTrailer, Type = String, Dynamic = True, Default = \"YouTube or Direct URL:", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"YouTube or Direct URL:"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"YouTube of een directe URL:"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"YouTube- eller direkt URL:"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"YouTube oder URL:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Youtube ou URL directe :"
	#tag EndConstant


#tag EndWindowCode

#tag Events CancelSave
	#tag Event
		Sub ActionCancel()
		  wndMain.lstMovies.UpdateRow()
		  Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionOK()
		  SaveNFO()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ppTabs
	#tag Event
		Sub Change()
		  Preferences.Prefs.integerForKey("NSWindow MetadataMovie Tab") = Me.Value
		  
		  'SmoothResize( self, self.Width, SepArray( ppTabs.Value ).Top + SepArray( ppTabs.Value ).Height + 55, 4 )
		  'Self.Height = SepArray( ppTabs.Value ).Top + SepArray( ppTabs.Value ).Height + 54 // To make sure that the controls move correctly
		  'If TargetCarbon And App.ScalingFactor = 2 Then Self.Refresh
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsSummaryPoster
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If MovieAttr.ART_Poster <> Nil then
		    g.ScaleImage MovieAttr.ART_Poster, Me.Width, Me.Height
		    
		    g.ForeColor = &c000000
		    g.DrawRect 0, 0, ScaledDim( MovieAttr.ART_Poster, Me.Width, Me.Height, True ), ScaledDim( MovieAttr.ART_Poster, Me.Width, Me.Height, False )
		  Else
		    g.ForeColor = &cFFFFFF
		    g.FillRect 0, 0, me.Width, me.Height
		    
		    
		    // Split sentence on linebreak, and draw each in center.
		    Dim TextTop as Integer = ( Me.Height / 2 ) - ( g.TextSize * 2 )
		    Dim part1, part2 as String
		    part1 = Trim( Loc.kNoPosterAvailable.Left( Loc.kNoPosterAvailable.InStr( 0, chr(13) ) ) )
		    part2 = Trim( Loc.kNoPosterAvailable.ReplaceAll( part1, "" ) )
		    
		    g.ForeColor = &cAAAAAA
		    'g.DrawString( kNoPosterAvailable, ( Me.Width / 2 ) - ( g.StringWidth( kNoPosterAvailable ) / 4), ( Me.Height / 2 ) - ( g.TextSize * 2 ), Me.Width, False )
		    
		    g.DrawString part1, ( Me.Width / 2 ) - ( g.StringWidth( part1 ) / 2 ), TextTop, Me.Width, False
		    TextTop = TextTop + g.TextSize + 2
		    g.DrawString part2, ( Me.Width / 2 ) - ( g.StringWidth( part2 ) / 2 ), TextTop, Me.Width, False
		    
		    
		    g.ForeColor = &c000000
		    g.DrawRect 0, 0, Me.Width, Me.Height
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SepArray
	#tag Event
		Sub Open(index as Integer)
		  Me.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblArray
	#tag Event
		Sub Open(index as Integer)
		  If TargetCocoa And NOT Me.Enabled Then Me.TextColor = &c929292
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsTomatoCritics
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ScaleImage RT_Critics, Me.Width, Me.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsTomatoAudience
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ScaleImage RT_User, Me.Width, Me.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtTitle
	#tag Event
		Sub TextChange()
		  Modified = ( MovieAttr.Title <> Trim( Me.Text ) And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$T") > 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtTitleOriginal
	#tag Event
		Sub TextChange()
		  Modified = ( MovieAttr.TitleOriginal <> Trim( Me.Text ) And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$O") > 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtTitleSort
	#tag Event
		Sub TextChange()
		  Modified = ( MovieAttr.TitleSort <> Trim( Me.Text ) And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$S") > 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtRating
	#tag Event
		Sub TextChange()
		  Modified = ( Str( MovieAttr.Rating ) <> Me.Text And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$#") > 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events udRating
	#tag Event
		Sub Up()
		  If Val( edtRating.Text ) < 10 Then edtRating.Text = Str( Val( edtRating.Text ) + .1 )
		  If edtRating.Text.Len = 1 Then edtRating.Text = edtRating.Text + ".0"
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  If Val( edtRating.Text ) > 0 Then edtRating.Text = Str( Val( edtRating.Text ) - .1 )
		  If edtRating.Text.Len = 1 Then edtRating.Text = edtRating.Text + ".0"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtYear
	#tag Event
		Sub TextChange()
		  Modified = ( Str( MovieAttr.DateYear ) <> Me.Text And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$Y") > 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events upYear
	#tag Event
		Sub Up()
		  edtYear.Text = Str( Val( edtYear.Text ) + 1 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  edtYear.Text = Str( Val( edtYear.Text ) - 1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events udDate
	#tag Event
		Sub Up()
		  Dim DatePremiered() as String = edtPremiere.Text.Split("-")
		  
		  if DatePremiered.Ubound = -1 then
		    edtPremiere.Text = "1986-09-05"
		    return
		  end if
		  
		  
		  // Append month/day if it's too short.
		  If DatePremiered.Ubound = 0 Then
		    DatePremiered.Append "1"
		    DatePremiered.Append "1"
		  Elseif DatePremiered.Ubound = 1 Then
		    DatePremiered.Append "1"
		  End If
		  
		  If Val( DatePremiered( 2 ) ) < 31 Then
		    DatePremiered( 2 ) = Str( Val( DatePremiered( 2 ) ) + 1 )
		    
		  ElseIf Val( DatePremiered( 2 ) ) >= 31 And Val( DatePremiered( 1 ) ) < 12 Then
		    DatePremiered( 2 ) = "1"
		    DatePremiered( 1 ) = Str( Val( DatePremiered( 1 ) ) + 1 )
		    
		  ElseIf Val( DatePremiered( 2 ) ) >= 31 And Val( DatePremiered( 1 ) ) >= 12 Then
		    DatePremiered( 2 ) = "1"
		    DatePremiered( 1 ) = "1"
		    DatePremiered( 0 ) = Str( Val( DatePremiered( 0 ) ) + 1 )
		    
		  ElseIf DatePremiered( 0 ).Val >= 9999 Then
		    DatePremiered( 2 ) = "31"
		    DatePremiered( 1 ) = "12"
		    DatePremiered( 0 ) = "9999"
		  End If
		  
		  If DatePremiered(0).Len = 1 Then DatePremiered(0) = "000" + DatePremiered(0)
		  If DatePremiered(0).Len = 2 Then DatePremiered(0) = "00"  + DatePremiered(0)
		  If DatePremiered(0).Len = 3 Then DatePremiered(0) = "0"   + DatePremiered(0)
		  
		  If DatePremiered(1).Len = 1 Then DatePremiered(1) = "0" + DatePremiered(1)
		  If DatePremiered(2).Len = 1 Then DatePremiered(2) = "0" + DatePremiered(2)
		  
		  edtPremiere.Text = DatePremiered( 0 ) + "-" + DatePremiered( 1 ) + "-" + DatePremiered( 2 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  Dim DatePremiered() as String = edtPremiere.Text.Split("-")
		  
		  if DatePremiered.Ubound = -1 then
		    edtPremiere.Text = "1986-09-05"
		    return
		  end if
		  
		  // Append month/day if it's too short.
		  If DatePremiered.Ubound = 0 Then
		    DatePremiered.Append "1"
		    DatePremiered.Append "1"
		  Elseif DatePremiered.Ubound = 1 Then
		    DatePremiered.Append "1"
		  End If
		  
		  If Val( DatePremiered( 2 ) ) > 1 Then
		    DatePremiered( 2 ) = Str( Val( DatePremiered( 2 ) ) - 1 )
		    
		  ElseIf Val( DatePremiered( 2 ) ) <= 1 And Val( DatePremiered( 1 ) ) > 1 Then
		    DatePremiered( 2 ) = "31"
		    DatePremiered( 1 ) = Str( Val( DatePremiered( 1 ) ) - 1 )
		    
		  ElseIf Val( DatePremiered( 2 ) ) <= 1 And Val( DatePremiered( 1 ) ) <= 1 And Val( DatePremiered( 0 ) ) > 0 Then
		    DatePremiered( 2 ) = "31"
		    DatePremiered( 1 ) = "12"
		    DatePremiered( 0 ) = Str( Val( DatePremiered( 0 ) ) - 1 )
		    
		  ElseIf Val( DatePremiered( 2 ) ) <= 1 And Val( DatePremiered( 1 ) ) <= 1 And Val( DatePremiered(0) ) <= 1 Then
		    DatePremiered( 2 ) = "0"
		    DatePremiered( 1 ) = "0"
		    DatePremiered( 0 ) = "0000"
		  End If
		  
		  If DatePremiered(0).Len = 1 Then DatePremiered(0) = "000" + DatePremiered(0)
		  If DatePremiered(0).Len = 2 Then DatePremiered(0) = "00"  + DatePremiered(0)
		  If DatePremiered(0).Len = 3 Then DatePremiered(0) = "0"   + DatePremiered(0)
		  
		  If DatePremiered(1).Len = 1 Then DatePremiered(1) = "0" + DatePremiered(1)
		  If DatePremiered(2).Len = 1 Then DatePremiered(2) = "0" + DatePremiered(2)
		  
		  edtPremiere.Text = DatePremiered( 0 ) + "-" + DatePremiered( 1 ) + "-" + DatePremiered( 2 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstStudios
	#tag Event
		Sub Change()
		  AddRemoveStudio.RemoveEnabled = ( Me.ListIndex > -1 )
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key as String) As Boolean
		  If Keyboard.AsyncCommandKey And asc(Key) = 8 And Me.ListIndex > -1 Then me.RemoveRow Me.ListIndex
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Me.EditCell( Me.ListIndex, 0 )
		End Sub
	#tag EndEvent
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  Modified = ( newPosition = 0 And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$C") > 0 )
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events popGenres
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
		  
		  Dim base        as New MenuItem
		  Dim miSeperator as New MenuItem ( "-" )
		  
		  base.Append New MenuItem( Loc.kCasingUpper )      // Upper Case
		  base.Append New MenuItem( Loc.kCasingLower )      // Lower Case
		  base.Append New MenuItem( Loc.kCasingCapitalize ) // Title Case
		  base.Append miSeperator
		  
		  Dim Genres() as String = GenreList
		  For i as Integer = 0 To Genres.Ubound
		    base.Append New MenuItem( Genres(i) )
		    base.Child( Genres(i) ).Checked = (edtGenres.Text.InStr( 0, Genres(i) ) > 0 )
		  Next
		  
		  
		  Dim HitItem as MenuItem = base.PopUp
		  If HitItem = Nil Then Return
		  
		  If HitItem.Text = Loc.kCasingUpper Then
		    edtGenres.Text = edtGenres.Text.Uppercase
		  ElseIf HitItem.Text = Loc.kCasingLower Then
		    edtGenres.Text = edtGenres.Text.Lowercase
		  ElseIf HitItem.Text = Loc.kCasingCapitalize Then
		    edtGenres.Text = edtGenres.Text.Titlecase
		  ElseIf edtGenres.Text.InStr( 0, HitItem.Text ) > 0 Then
		    edtGenres.Text = edtGenres.Text.ReplaceAll( ", " + HitItem.Text, "" )
		    edtGenres.Text = edtGenres.Text.ReplaceAll( HitItem.Text + ", ", "" )
		    edtGenres.Text = edtGenres.Text.ReplaceAll( HitItem.Text, "" )
		  ElseIf edtGenres.Text <> "" Then
		    If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then HitItem.Text = HitItem.Text.Uppercase
		    edtGenres.Text = edtGenres.Text + ", " + HitItem.Text
		  Else
		    edtGenres.Text = HitItem.Text
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsActorIMG
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If ActorIMG <> Nil Then
		    g.ScaleImage ActorIMG, Me.Width, Me.Height, 0, 0, False, True, True
		    
		    g.ForeColor = &c000000
		    g.DrawRect 0, 0, ScaledDim( ActorIMG, Me.Width, Me.Height, True, True ), ScaledDim( ActorIMG, Me.Width, Me.Height, False, True )
		  Else
		    g.ForeColor = &cFFFFFF
		    g.FillRect 0, 0, Me.Width, Me.Height
		    
		    Dim TextTop as Integer = ( Me.Height / 2 ) - ( g.TextSize * 2 )
		    Dim part1, part2 as String
		    part1 = Trim( Loc.mNoImageAvailable.Left( Loc.mNoImageAvailable.InStr( 0, chr(13) ) ) )
		    part2 = Trim( Loc.mNoImageAvailable.ReplaceAll( part1, "" ) )
		    
		    g.ForeColor = &cAAAAAA
		    'g.DrawString Loc.mNoImageAvailable, ( Me.Width / 2 ) - ( g.StringWidth( Loc.mNoImageAvailable ) / 4 ), ( Me.Height / 2 ) - ( g.TextSize * 2 ), Me.Width, False
		    
		    g.DrawString part1, ( Me.Width / 2 ) - ( g.StringWidth( part1 ) / 2 ), TextTop, Me.Width, False
		    TextTop = TextTop + g.TextSize + 2
		    g.DrawString part2, ( Me.Width / 2 ) - ( g.StringWidth( part2 ) / 2 ), TextTop, Me.Width, False
		    
		    g.ForeColor = &c000000
		    g.DrawRect 0, 0, Me.Width, Me.Height
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstActors
	#tag Event
		Sub Open()
		  If DebugBuild Then Me.ColumnWidths = "150, 200, *, 50"
		  scktActor.Yield = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Dim row, column as Integer
		  row =    Me.RowFromXY(    System.MouseX - Me.Left - Self.Left, System.MouseY - Me.Top - Self.Top )
		  column = Me.ColumnFromXY( System.MouseX - Me.Left - Self.Left, System.MouseY - Me.Top - Self.Top )
		  If row > -1 And column > -1 Then
		    Me.EditCell( row, column )
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Dim f as FolderItem = Preferences.fAppSupport.Child("Actors").Child( Me.Cell( Me.ListIndex, 0 ).Lowercase.ReplaceAll( " ", "_" ) + ".jpg" )
		  AddRemoveActor.RemoveEnabled = ( Me.ListIndex > -1 )
		  pgActor.Visible = False
		  
		  If Me.ListIndex = ActorLastSelection Then Return
		  thrActor.mode = Timer.ModeOff 'Kill
		  scktActor.Close
		  ActorIMG = Nil
		  
		  If Me.Cell( Me.ListIndex, 0 ) <> "" And f <> Nil and F.Exists Then ActorIMG = Picture.Open( f )
		  cvsActorIMG.Reload
		  
		  
		  If ActorIMG = Nil And Me.Cell( Me.ListIndex, 2 ) <> "" And System.Network.IsConnected Then
		    pgActor.Visible = True
		    thrActor.Mode = Timer.ModeSingle 'Run
		  End If
		  
		  ActorLastSelection = Me.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsExtraArtPreviewer
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  Dim f as FolderItem
		  
		  Select Case popImageMode.Index
		    
		  Case 0
		    f = FindImagePoster( MovieAttr.FolderParent )
		    
		  Case 1
		    f = FindImageFanart( MovieAttr.FolderParent )
		    
		  Case 3
		    f = MovieAttr.FolderParent.Child( "logo.png" )
		    
		  Case 4
		    f = FindImageBanner( MovieAttr.FolderParent )
		    
		  Case 5
		    f = MovieAttr.FolderParent.Child( "clearart.png" )
		    
		  Case 6
		    f = MovieAttr.FolderParent.Child( "landscape.jpg" )
		    
		  Case 7
		    f = MovieAttr.FolderParent.Child( "disc.png" )
		    
		  End Select
		  
		  If f <> Nil And f.Exists Then f.Launch
		End Sub
	#tag EndEvent
	#tag Event
		Sub ObjectDropped()
		  Dim f as FolderItem
		  
		  Select Case popImageMode.Index
		    
		  Case 0
		    f = FindImagePoster( MovieAttr.FolderParent )
		    
		  Case 1
		    f = FindImageFanart( MovieAttr.FolderParent )
		    
		  Case 3
		    f = MovieAttr.FolderParent.Child( "logo.png" )
		    
		  Case 4
		    f = FindImageBanner( MovieAttr.FolderParent )
		    
		  Case 5
		    f = MovieAttr.FolderParent.Child( "clearart.png" )
		    
		  Case 6
		    f = MovieAttr.FolderParent.Child( "landscape.jpg" )
		    
		  Case 7
		    f = MovieAttr.FolderParent.Child( "disc.png" )
		    
		  End Select
		  
		  btnDeleteArt.Enabled = f <> Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub Activate()
		  Dim f as FolderItem
		  
		  Select Case popImageMode.ListIndex
		    
		  Case 0
		    f = FindImagePoster( MovieAttr.FolderParent )
		  Case 1
		    f = FindImageFanart( MovieAttr.FolderParent )
		    
		  Case 3
		    f = MovieAttr.FolderParent.Child( "logo.png" )
		  Case 4
		    f = FindImageBanner( MovieAttr.FolderParent )
		  Case 5
		    f = MovieAttr.FolderParent.Child( "clearart.png" )
		  Case 6
		    f = MovieAttr.FolderParent.Child( "landscape.jpg" )
		  Case 7
		    f = MovieAttr.FolderParent.Child( "disc.png" )
		    
		  End Select
		  
		  If f <> Nil and f.Exists Then
		    cvsExtraArtPreviewer.Reload Picture.Open( f )
		    btnDeleteArt.Enabled = True
		  Else
		    cvsExtraArtPreviewer.Reload Nil
		    btnDeleteArt.Enabled = False
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Dim f as FolderItem
		  
		  Select Case popImageMode.ListIndex
		    
		  Case 0
		    f = FindImagePoster( MovieAttr.FolderParent )
		  Case 1
		    f = FindImageFanart( MovieAttr.FolderParent )
		    
		  Case 3
		    f = MovieAttr.FolderParent.Child( "logo.png" )
		  Case 4
		    f = FindImageBanner( MovieAttr.FolderParent )
		  Case 5
		    f = MovieAttr.FolderParent.Child( "clearart.png" )
		  Case 6
		    f = MovieAttr.FolderParent.Child( "landscape.jpg" )
		  Case 7
		    f = MovieAttr.FolderParent.Child( "disc.png" )
		    
		  End Select
		  
		  If f <> Nil and f.Exists Then
		    cvsExtraArtPreviewer.Reload Picture.Open( f )
		    btnDeleteArt.Enabled = True
		  Else
		    cvsExtraArtPreviewer.Reload Nil
		    btnDeleteArt.Enabled = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popImageMode
	#tag Event
		Sub Change()
		  Dim f as FolderItem
		  Dim m as String
		  
		  Select Case Me.ListIndex
		    
		  Case 0
		    f = FindImagePoster( MovieAttr.FolderParent )
		    m = "Poster"
		  Case 1
		    f = FindImageFanart( MovieAttr.FolderParent )
		    m = "Fanart"
		    
		  Case 3
		    f = MovieAttr.FolderParent.Child( "logo.png" )
		    m = "Logo"
		  Case 4
		    f = FindImageBanner( MovieAttr.FolderParent )
		    m = "Banner"
		  Case 5
		    f = MovieAttr.FolderParent.Child( "clearart.png" )
		    m = "ClearArt"
		  Case 6
		    f = MovieAttr.FolderParent.Child( "landscape.jpg" )
		    m = "Thumb"
		  Case 7
		    f = MovieAttr.FolderParent.Child( "disc.png" )
		    m = "DiscArt"
		    
		  End Select
		  
		  cvsExtraArtPreviewer.Mode = m
		  If f <> Nil and f.Exists Then
		    cvsExtraArtPreviewer.Reload Picture.Open( f )
		  Else
		    cvsExtraArtPreviewer.Reload Nil
		  End If
		  
		  btnDeleteArt.Enabled = ( f <> Nil And f.Exists )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteArt
	#tag Event
		Sub Action()
		  Dim f, k as FolderItem
		  
		  Dim DBID as String = MovieAttr.ID_IMDB
		  If DBID = "" Then DBID = MovieAttr.ID_TMDB
		  
		  Select Case popImageMode.ListIndex
		    
		  Case 0
		    f = FindImagePoster( MovieAttr.FolderParent )
		    k = Preferences.fAppSupport.Child("Cache").Child( DBID + ".movie.poster.jpg" )'.MoveFileToTrash
		    
		  Case 1
		    f = FindImageFanart( MovieAttr.FolderParent )
		    k = Preferences.fAppSupport.Child("Cache").Child( DBID + ".movie.fanart.jpg" )'.MoveFileToTrash
		    
		  Case 3
		    f = MovieAttr.FolderParent.Child( "logo.png" )
		    
		  Case 4
		    f = FindImageBanner( MovieAttr.FolderParent )
		    
		  Case 5
		    f = MovieAttr.FolderParent.Child( "clearart.png" )
		    
		  Case 6
		    f = MovieAttr.FolderParent.Child( "landscape.jpg" )
		    
		  Case 7
		    f = MovieAttr.FolderParent.Child( "disc.png" )
		    
		  End Select
		  
		  
		  If f <> Nil And f.Exists Then
		    If MsgDlg( Self, 1, Loc.msgDeleteImage, Loc.kCantBeUndone, Loc.kDelete, Loc.dlgCancel ) = 2 Then Return
		    
		    If f.IsNetworkVolume Then f.Delete Else f = f.MoveToTrash()
		    If k <> Nil And k.Exists Then
		      If k.IsNetworkVolume Then k.Delete Else k.MoveToTrash()
		    End If
		    
		    cvsExtraArtPreviewer.Reload Nil
		    Me.Enabled = False '( f <> Nil And f.Exists )
		  Else
		    MsgBox Loc.msgNoImageToDelete
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDownloadArt
	#tag Event
		Sub Action()
		  Dim f as FolderItem
		  
		  Select Case popImageMode.ListIndex
		    
		  Case 0
		    CommonCore.GetImagePoster
		    f = FindImagePoster( MovieAttr.FolderParent )
		  Case 1
		    CommonCore.GetImageBackdrop
		    f = FindImageFanart( MovieAttr.FolderParent )
		    
		  Case 3
		    CommonCore.GetImageLogo
		    f = MovieAttr.FolderParent.Child( "logo.png" )
		  Case 4
		    CommonCore.GetImageBanner
		    f = FindImageBanner( MovieAttr.FolderParent )
		  Case 5
		    CommonCore.GetImageClearArt
		    f = MovieAttr.FolderParent.Child( "clearart.png" )
		  Case 6
		    CommonCore.GetImageThumb
		    f = MovieAttr.FolderParent.Child( "landscape.jpg" )
		  Case 7
		    CommonCore.GetImageDiscArt
		    f = MovieAttr.FolderParent.Child( "disc.png" )
		    
		  End Select
		  
		  If f <> Nil and f.Exists Then
		    cvsExtraArtPreviewer.Reload Picture.Open( f )
		    btnDeleteArt.Enabled = True
		  Else
		    cvsExtraArtPreviewer.Reload Nil
		    btnDeleteArt.Enabled = False
		  End If
		  
		  wndMain.lstMovies.Enabled = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOpenArt
	#tag Event
		Sub Action()
		  Dim TheFile as FolderItem = GetOpenFolderItem( "image/any" )
		  If TheFile <> Nil and TheFile.Exists Then cvsExtraArtPreviewer.AddImage TheFile
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtTrailerURL
	#tag Event
		Sub TextChange()
		  Modified = ( MovieAttr.Title <> Trim( Me.Text ) And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$T") > 0 )
		  btnWatchOnline.Enabled = ( Me.Text.Left(4) = "http" )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnTrailerDownload
	#tag Event
		Sub Action()
		  'Dim f as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		  '
		  'If f <> Nil And f.Exists Then
		  '
		  'Select Case MsgDlg( Self, 1, msgDeleteTrailer, Loc.kCantBeUndone, Loc.kDelete, Loc.dlgCancel )
		  '
		  'Case 1
		  'f.MoveFileToTrash
		  '
		  'Case 2
		  'Return
		  '
		  'End Select
		  '
		  'End If
		  
		  TrailerSckteer.Download edtTrailerURL.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popTrailer
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
		  
		  Dim base        as New MenuItem
		  
		  If MovieAttr.TrailerURLs.Ubound > -1 Then
		    base.Append New MenuItem( "" )
		    base.Append New MenuItem( "-" )
		    
		    For i as Integer = 0 to MovieAttr.TrailerURLs.Ubound
		      If MovieAttr.TrailerNames.Ubound >= i And MovieAttr.TrailerNames(i) <> "" Then
		        If MovieAttr.TrailerQuality.Ubound >= i And MovieAttr.TrailerQuality(i) <> "" Then
		          base.Append New MenuItem( Trim( MovieAttr.TrailerNames(i).ReplaceAll("HD","") ) + " - " + MovieAttr.TrailerQuality(i), MovieAttr.TrailerURLs(i) )
		        Else
		          base.Append New MenuItem( Trim( MovieAttr.TrailerNames(i).ReplaceAll("HD","") ), MovieAttr.TrailerURLs(i) )
		        End If
		        
		      Else
		        base.Append New MenuItem( MovieAttr.TrailerURLs(i), MovieAttr.TrailerURLs(i) )
		      End If
		    Next
		    
		  Else
		    
		    base.Append New MenuItem( Loc.kNotAvailable )
		    
		  End If
		  
		  Dim hitItem as MenuItem = base.PopUp
		  If hitItem = Nil Then Return
		  edtTrailerURL.Text = hitItem.Tag
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnTrailerDelete
	#tag Event
		Sub Action()
		  Dim TheFile as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		  If TheFile <> Nil And TheFile.Exists Then
		    If MsgDlg( Self, 1, Loc.msgDeleteTrailer, Loc.kCantBeUndone, Loc.kDelete, Loc.dlgCancel ) = 1 Then
		      If TheFile.IsNetworkVolume Then TheFile.Delete Else TheFile.MoveToTrash()
		    End If
		    
		    Me.Enabled = ( FindTrailerItem( MovieAttr.FolderParent ) <> Nil )
		  Else
		    MsgBox Loc.kNothingToDelete
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnWatchOnline
	#tag Event
		Sub Action()
		  ShowURL edtTrailerURL.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsIMDBTop250
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ScaleImage IMDB_Top250, Me.Width, Me.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtStudio
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If asc(Key) = 13 Then
		    
		    
		    Dim b as Boolean = False
		    For i as Integer = 0 to lstStudios.ListCount - 1
		      b = ( Trim( lstStudios.Cell( i, 0 ) ) = Trim( edtStudio.Text ) )
		      If b Then Exit
		    Next
		    
		    If b Then
		      MsgBox Loc.msgPriorStudioFound
		      Return True
		    End If
		    
		    If edtStudio.Text <> "" And NOT b Then lstStudios.AddRow Trim( edtStudio.Text )
		    edtStudio.Text = ""
		    
		    'Modified = ( lstStudios.ListCount = 1 And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$C") > 0 )
		    
		    
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events popTagLines
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
		  Dim Base as New MenuItem
		  
		  base.Append New MenuItem( ""  )
		  base.Append New MenuItem( "-" )
		  
		  For i as Integer = 0 to MovieAttr.DescriptionTaglines.Ubound
		    base.Append New MenuItem( MovieAttr.DescriptionTaglines(i) )
		    base.Child( MovieAttr.DescriptionTaglines(i) ).Checked = ( edtTagline.Text.InStr( 0, MovieAttr.DescriptionTaglines(i) ) > 0 )
		  Next
		  
		  Dim HitItem as MenuItem = base.PopUp
		  If HitItem = Nil Then Return Else edtTagline.Text = HitItem.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popMPAA
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
		  
		  Dim base        as New MenuItem
		  Base.Append New MenuItem ( ""  )
		  base.Append New MenuItem ( "-" )
		  
		  Select Case Preferences.Prefs.stringForKey( "DBLanguage" )
		    
		  Case "en"
		    base.Append New MenuItem ( "Rated G" )
		    base.Append New MenuItem ( "Rated PG" )
		    base.Append New MenuItem ( "Rated PG-13" )
		    base.Append New MenuItem ( "Rated R" )
		    base.Append New MenuItem ( "Rated NC-17" )
		    
		  Case "gb"
		    base.Append New MenuItem( "Rated Uc"  )
		    base.Append New MenuItem( "Rated U"   )
		    base.Append New MenuItem( "Rated PG"  )
		    base.Append New MenuItem( "Rated 12A" )
		    base.Append New MenuItem( "Rated 12"  )
		    base.Append New MenuItem( "Rated 15"  )
		    base.Append New MenuItem( "Rated 18"  )
		    base.Append New MenuItem( "Rated R18" )
		    
		  case "nl"
		    base.Append New MenuItem( "AL" )
		    base.Append New MenuItem( "6"  )
		    base.Append New MenuItem( "9"  )
		    base.Append New MenuItem( "12" )
		    base.Append New MenuItem( "16" )
		    
		  case "de"
		    base.Append New MenuItem( "FSK 0" )
		    base.Append New MenuItem( "FSK 6" )
		    base.Append New MenuItem( "FSK 12" )
		    base.Append New MenuItem( "FSK 16" )
		    base.Append New MenuItem( "FSK 18" )
		    base.Append New MenuItem( "Infoprogramm" )
		    
		  case "fr"
		    base.Append New MenuItem( "Nominale: U" )
		    base.Append New MenuItem( "Nominale: 10" )
		    base.Append New MenuItem( "Nominale: 12" )
		    base.Append New MenuItem( "Nominale: 16" )
		    base.Append New MenuItem( "Nominale: 18" )
		    base.Append New MenuItem( "Nominale: -18" )
		    
		  case "ja"
		    base.Append New MenuItem( "映倫 G" )
		    base.Append New MenuItem( "映倫 PG-12" )
		    base.Append New MenuItem( "映倫 R15+" )
		    base.Append New MenuItem( "映倫 R18+" )
		    
		  case "da"
		    base.Append New MenuItem( "Klassificering: A"  )
		    base.Append New MenuItem( "Klassificering: 7"  )
		    base.Append New MenuItem( "Klassificering: 11" )
		    base.Append New MenuItem( "Klassificering: 15" )
		    base.Append New MenuItem( "Klassificering: F"  )
		    
		  case "fi"
		    base.Append New MenuItem( "Luokitus: S" )
		    base.Append New MenuItem( "Luokitus: K-7" )
		    base.Append New MenuItem( "Luokitus: K-12" )
		    base.Append New MenuItem( "Luokitus: K-16" )
		    base.Append New MenuItem( "Luokitus: K-18" )
		    base.Append New MenuItem( "Luokitus: K-E" )
		    
		  End Select
		  
		  If base.Child( edtMPAA.Text ) <> Nil Then base.Child( edtMPAA.Text ).Checked = True
		  
		  Dim hitItem as MenuItem = base.PopUp
		  If hitItem = Nil Then Return
		  edtMPAA.Text = hitItem.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtMPAA
	#tag Event
		Sub TextChange()
		  Modified = ( MovieAttr.RatingMPAA <> Me.Text And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$M") > 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstRecMovies
	#tag Event
		Sub Change()
		  thrRecommendations.mode = timer.ModeOff 'Kill
		  thrRecommendations.mode = timer.ModeSingle 'Run
		  
		  popGetRecomendedMovie.Visible = lstRecMovies.ListIndex > -1
		End Sub
	#tag EndEvent
	#tag Event
		Sub Close()
		  thrRecommendations.mode = timer.ModeOff 'Kill
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  For i as Integer = 0 to MovieAttr.RecMoviesIDs.Ubound
		    
		    Select Case Me.Cell( row, 0 )
		      
		    case "RottenTomatoes"
		      If MovieAttr.RecMoviesIDs(i).InStr(0, "rottentomatoes") > 0 OR _
		        ( MovieAttr.RecMoviesSources.Ubound >= i And MovieAttr.RecMoviesSources(i) = "RottenTomatoes" ) Then
		        Me.AddRow MovieAttr.RecMovies(i), MovieAttr.RecMoviesIDs(i)
		      End If
		      
		    case "TMDB"
		      If MovieAttr.RecMoviesIDs(i).Left(2) <> "tt" Then
		        Me.AddRow MovieAttr.RecMovies(i), MovieAttr.RecMoviesIDs(i)
		      End If
		      
		      
		    case "IMDb"
		      If ( MovieAttr.RecMoviesIDs(i).InStr(0, "rottentomatoes") = 0 And MovieAttr.RecMoviesIDs(i).Left(2) = "tt" And _
		        ( MovieAttr.RecMoviesSources.Ubound >= i And MovieAttr.RecMoviesSources(i) <> "RottenTomatoes" And MovieAttr.RecMovies(i) <> "Trakt.tv" ) )  Then
		        Me.AddRow MovieAttr.RecMovies(i), MovieAttr.RecMoviesIDs(i)
		      End If
		      
		    Case "Trakt.tv"
		      If MovieAttr.RecMoviesSources(i) = "Trakt.tv" Then
		        Me.AddRow MovieAttr.RecMovies(i), MovieAttr.RecMoviesIDs(i)
		      End If
		      
		    End Select
		    
		    'If Me.LastIndex <= Me.ListCount - 1 And Me.RowTag( Me.LastIndex ) <> "Folder" Then Me.RowPicture( Me.LastIndex ) = miniconmovieII
		    
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  'If Keyboard.AsyncKeyDown(&h30) Then Return False
		  
		  If Me.ListIndex >= 0 Then
		    
		    
		    Select Case Asc(Key)
		      
		    Case 28 // Left Arrow
		      If Me.RowTag( Me.ListIndex ) = "Folder" Then
		        If Keyboard.AsyncCommandKey Then Me.AllExpanded False Else Me.Expanded( Me.ListIndex ) = False
		      Else
		        Me.ListIndex = Me.ParentIndex( Me.ListIndex )
		      End If
		      Return True
		      
		    Case 29 // Right Arrow
		      If Me.RowTag( Me.ListIndex ) = "Folder" Then
		        If Keyboard.AsyncCommandKey Then Me.AllExpanded True Else Me.Expanded( Me.ListIndex ) = True
		      End If
		      Return True
		      
		    End Select
		    
		    
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  If Me.RowTag( Me.ListIndex ) = "Folder" then
		    Return False 'OR thrRecommendations.State = thrRecommendations.Running Then Return False
		  else
		    
		    Dim imdbID as String = lstRecMovies.SelCol( 1 ).ReplaceAll("rottentomatoes","")
		    Dim tmdbID as String = lstRecMovies.SelCol( 2 )
		    Dim Title  as String = lstRecMovies.SelCol( 0 )
		    Dim TitleOriginal as String = lstRecMovies.SelCol( 11 )
		    Dim ReleaseDate as String = lstRecMovies.SelCol( 5 )
		    Dim HomePageURL as String = lstRecMovies.SelCol( 13 )
		    
		    PopUpWebMenu imdbID, tmdbID, Title, TitleOriginal, ReleaseDate, HomePageURL
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cvsRecommendations
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Background
		  g.ForeColor = &cFFFFFF
		  g.FillRect 0, 0, me.Width, me.Height
		  
		  // Borders
		  g.ForeColor = &cC3C3C3
		  g.DrawLine 0, 0, me.Width, 0
		  g.DrawLine 0, me.Height - 1, me.Width, me.Height - 1
		  
		  g.ForeColor = &c666666
		  g.TextSize = 14
		  If lstRecMovies.ListCount <= 0 Then g.DrawString Loc.kUpdateMovie + ".", 20, 20
		  
		  
		  // ## Backdrop
		  Dim Backdrop as Picture
		  If lstRecMovies.ListIndex > -1 Then Backdrop = lstRecMovies.CellTag( lstRecMovies.ListIndex, 10 )
		  If Backdrop = Nil Then Backdrop = IMGmovies
		  
		  If Backdrop <> Nil Then
		    Dim Factor as Double = Me.Width / Backdrop.Width
		    
		    Dim ScaleWidth, ScaleHeight as Double
		    ScaleWidth = Backdrop.Width * Factor
		    ScaleHeight = Backdrop.Height * Factor
		    
		    Dim Pic as New Picture( ScaleWidth, ScaleHeight, 32 )
		    
		    g.ScaleImage Backdrop, ScaleWidth + 1, ScaleHeight, 0, 0, False, False, True
		    
		    g.DrawPicture Backdrop,         0, 0, Pic.Width, Pic.Height, 0, 0, Backdrop.Width, Backdrop.Height
		    g.DrawPicture IMGFanartOverlay, 0, 0, Pic.Width, Pic.Height, 0, 0, IMGFanartOverlay.Width, IMGFanartOverlay.Height
		    
		  End If
		  
		  If lstRecMovies.ListIndex = -1 Then Return
		  
		  // ## Poster
		  Dim Poster as Picture = lstRecMovies.CellTag( lstRecMovies.ListIndex, 9 )
		  If Poster <> Nil Then
		    g.DrawPicture posterbg, -32, 2
		    g.DrawPicture Poster, 53 - 32, 16 + 2, 145, 217, 0, 0, Poster.Width, Poster.Height
		  End If
		  
		  Dim TextTop as Integer = 13
		  Dim TextLeft as Integer = 20
		  If Poster <> Nil Then TextLeft = 184
		  
		  Dim Title as String = lstRecMovies.Cell( lstRecMovies.ListIndex, 0 )
		  Dim OriginalTitle as String = lstRecMovies.Cell( lstRecMovies.ListIndex, 11 )
		  
		  Dim DateYear as Integer = Val( lstRecMovies.Cell( lstRecMovies.ListIndex, 5 ).Left(4) )
		  If DateYear < 1000 Then DateYear = Val( lstRecMovies.Cell( lstRecMovies.ListIndex, 5 ).Right(4) )
		  If DateYear < 1000 Then DateYear = -1
		  
		  g.TextSize = 18
		  g.Bold = True
		  TextTop = TextTop + g.TextSize
		  
		  // ## Write Title
		  If Title <> "" And DateYear > 0 Then
		    
		    Dim DisplayTitle as String = Title
		    If DateYear > 0 Then DisplayTitle = Title + " (" + Str( DateYear ) + ")"
		    
		    g.ForeColor = &cFFFFFF
		    g.DrawString DisplayTitle, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False // Title - HiLite
		    
		    g.ForeColor = &c333333
		    g.DrawString DisplayTitle, TextLeft, TextTop, Me.Width - TextLeft - 20, False // Title
		    
		    g.ForeColor = &c999999
		    
		    TextTop = TextTop + g.StringHeight( DisplayTitle, Me.Width - TextLeft - 20 ) - 4
		  Else
		    
		    g.ForeColor  = &cFFFFFF
		    g.DrawString Title, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    
		    g.ForeColor  = &c333333
		    g.DrawString Title, TextLeft, TextTop, Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + g.StringHeight( Title, Me.Width - TextLeft - 20 ) - 4
		  End If
		  
		  
		  // ## Write Original Title
		  If OriginalTitle <> "" And Title <> OriginalTitle Then
		    g.TextSize = 14
		    
		    g.ForeColor = &CFFFFFF
		    g.DrawString OriginalTitle, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    
		    g.ForeColor = &c666666
		    g.DrawString OriginalTitle, TextLeft, TextTop, Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + g.StringHeight( OriginalTitle, Me.Width - TextLeft - 20 )
		  End If
		  
		  g.Bold     = False
		  g.Italic   = True
		  g.TextSize = 12
		  
		  // ## Write Tagline
		  Dim Tagline as String = lstRecMovies.Cell( lstRecMovies.ListIndex, 3 )
		  If Tagline <> "" Then
		    g.ForeColor = &cFFFFFF
		    g.DrawString Tagline, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    g.ForeColor = &c33333320
		    g.DrawString Tagline, TextLeft, TextTop,     Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + 4 + g.StringHeight( Tagline, Me.Width - TextLeft - 20 )
		  End If
		  
		  
		  // ## Write Duration - Genre(s) - Premiere
		  Dim SubTagline as String
		  g.Italic = False
		  
		  Dim Duration as String = lstRecMovies.Cell( lstRecMovies.Listindex, 6 )
		  Dim Genres   as String = lstRecMovies.Cell( lstRecMovies.ListIndex, 7 )
		  Dim Premiere as String = lstRecMovies.Cell( lstRecMovies.ListIndex, 5 )
		  
		  // Duration
		  If Val( Duration ) > 0 Then SubTagline = PrettyTime( Val( Duration ) ) + " "
		  
		  // Genre(s)
		  If SubTagline <> "" Then SubTagline = SubTagline + "- "
		  If Genres <> "" Then SubTagline = SubTagline + Trim( Genres.ReplaceAll(", ", " | ") ) + " "
		  
		  // Premiere
		  If Genres <> "" Then SubTagline = SubTagline + "- "
		  If Premiere <> "" Then SubTagline = SubTagline + PrettyDate( Premiere, True )
		  
		  // Write
		  If SubTagline <> "" Then
		    g.Bold = True
		    
		    g.ForeColor = &cFFFFFF
		    g.DrawString SubTagline, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, True
		    
		    g.ForeColor = &c555555
		    g.DrawString SubTagline, TextLeft, TextTop,     Me.Width - TextLeft - 20, True
		    
		    g.Bold = False
		    
		    TextTop = TextTop + ( 18 * 2 )
		  End If
		  
		  // ## Write Plot
		  Dim Plot as String = lstRecMovies.Cell( lstRecMovies.Listindex, 4 )
		  If Plot <> "" Then
		    
		    g.ForeColor = &cFFFFFF
		    g.DrawString Plot, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    
		    g.ForeColor = &c333333
		    g.DrawString Plot, TextLeft, TextTop, Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + g.StringHeight( Plot, Me.Width - TextLeft - 20 ) + 12
		  End If
		  
		  // ## MetaTags
		  Dim Rating as Double = Val( lstRecMovies.Cell( lstRecMovies.ListIndex, 8 ) )
		  
		  Dim MPAA as String = lstRecMovies.Cell( lstRecMovies.ListIndex, 12 )
		  
		  
		  // ## Kijkwijzer
		  If MPAA <> "" Then
		    Dim Kijkwijzer() as Picture = MPAA2Themes( MPAA )
		    Dim ImageLeft as Integer = Me.Width - 50 - 40
		    Dim ImageTop as Integer = Me.Height - 10 - 40
		    
		    If Kijkwijzer.Ubound > 0 Then
		      For i as Integer = 0 to Kijkwijzer.Ubound
		        g.DrawPicture Kijkwijzer(i), ImageLeft, ImageTop, 40, 40,   0, 0, Kijkwijzer(i).Width, Kijkwijzer(i).Height
		        ImageLeft = ImageLeft - 40 - 5
		      Next
		      
		    End If
		    
		  End If
		  
		  
		  Dim TagsLeft as Integer = 20
		  g.ForeColor = &cFFFFFF
		  g.Bold = True
		  g.TextSize = 28
		  
		  Dim sx2 as Integer = MPAA.InStr(0, " for ")
		  If sx2 > 0 Then MPAA = Trim( MPAA.Left( sx2 ) )
		  
		  // ## MPAA
		  If MPAA <> "" And MPAA2Logo( MPAA ) <> Nil Then
		    g.ScaleImage MPAA2Logo( MPAA ), 75, 50, TagsLeft, Me.Height - 50 - 11
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  
		  // ## Rating
		  If Rating > 0 Then
		    g.ScaleImage metatagsrating, 75, 50, TagsLeft, Me.Height - 50 - 11
		    
		    Dim s as Integer = g.StringWidth( Str( Rating ) )
		    g.DrawString( Str( Rating ), TagsLeft + ( (75/2) - (s/2) ), Me.Height - 50 - 11 + ( 50 - 14 ) )
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  'Dim Provider as String = "TMDB"
		  'If lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ) = "" Then Provider = ""
		  'If lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ).Left(2) = "tt" And lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ).InStr(0, "TMDB") = 0 Then Provider = "IMDb"
		  'If lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ).Left(2) = "tt" And lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ).InStr(0, "RottenTomatoes") > 0 Then Provider = "RottenTomatoes"
		  '
		  'If Provider <> "" Then
		  'g.TextSize = 12
		  'g.Bold     = False
		  'TagsLeft = TagsLeft + 5
		  '
		  'g.ForeColor = &cFFFFFF
		  'g.DrawString Loc.kRecProvidedBy + " " + Provider + ".", TagsLeft, Me.Height - 15
		  '
		  'g.ForeColor = &c666666
		  'g.DrawString Loc.kRecProvidedBy + " " + Provider + ".", TagsLeft, Me.Height - 15
		  'End If
		  
		  // Borders
		  g.ForeColor = &cC3C3C3
		  g.DrawLine 0, me.Height - 1, me.Width, me.Height - 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popGetRecomendedMovie
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
		  
		  If lstRecMovies.ListIndex = -1 Then Return
		  
		  Dim imdbID as String = lstRecMovies.SelCol( 1 ).ReplaceAll("rottentomatoes","")
		  Dim tmdbID as String = lstRecMovies.SelCol( 2 )
		  Dim Title  as String = lstRecMovies.SelCol( 0 )
		  Dim TitleOriginal as String = lstRecMovies.SelCol( 11 )
		  Dim ReleaseDate as String = lstRecMovies.SelCol( 5 )
		  Dim HomePageURL as String = lstRecMovies.SelCol( 13 )
		  
		  PopUpWebMenu imdbID, tmdbID, Title, TitleOriginal, ReleaseDate, HomePageURL
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Visible = lstRecMovies.ListIndex > -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteCache
	#tag Event
		Sub Open()
		  'Me.Visible = DebugBuild
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  CacheImageDelete MovieAttr.ID_IMDB
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnWatchOffline
	#tag Event
		Sub Action()
		  Dim TheFile as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		  
		  If TheFile <> Nil And TheFile.Exists Then
		    TheFile.Launch
		  Else
		    MsgBox Loc.kCouldNotBeFound.ReplaceAll( "%S", Loc.kTrailer )
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popRipSource
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
		  
		  Dim base as New MenuItem
		  
		  base.Append New MenuItem( "", "" )
		  base.Append New MenuItem( "-", "" )
		  base.Append New MenuItem( "SDTV", "SDTV" )
		  base.Append New MenuItem( "HDTV", "HDTV" )
		  base.Append New MenuItem( "DVD", "DVD" )
		  base.Append New MenuItem( "HDDVD", "HDDVD" )
		  base.Append New MenuItem( "HD-DVD", "HD-DVD" )
		  base.Append New MenuItem( "BluRay", "BluRay" )
		  base.Append New MenuItem( "Blu-Ray", "Blu-Ray" )
		  base.Append New MenuItem( "3D BluRay", "3D BluRay" )
		  base.Append New MenuItem( "3D Blu-Ray", "3D Blu-Ray" )
		  base.Append New MenuItem( "3DBD", "3DBD" )
		  
		  If base.Child( MovieAttr.RipSource ) <> Nil Then base.Child( MovieAttr.RipSource ).Checked = True
		  
		  Dim hitItem as MenuItem = base.PopUp()
		  
		  If hitItem = Nil Then Return
		  edtSource.Text = hitItem.Tag
		  'cvsRipSource.Reload()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtSource
	#tag Event
		Sub TextChange()
		  Modified = ( Str( MovieAttr.DateYear ) <> Me.Text And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$Y") > 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsRipSource
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'Me.Backdrop = Nil
		  #If TargetCocoa Then
		    lblSummarySource.Visible = False
		    lblSummarySource.Left = Me.Left + Me.Width + 10
		  #endif
		  
		  Dim Pic as Picture
		  Select Case MovieAttr.RipSource
		    
		  Case "HDTV"
		    If App.ScalingFactor = 1 Then Pic = hdtvinactive Else Pic = hdtvinactive2x
		    
		  Case "DVD"
		    If App.ScalingFactor = 1 Then Pic = DVDinactive Else Pic = DVDinactive2x
		    
		  Case "HD-DVD"
		    If App.ScalingFactor = 1 Then Pic = DVDinactive Else Pic = DVDinactive2x
		    
		  Case "Blu-Ray"
		    If App.ScalingFactor = 1 Then Pic = bluinactive Else Pic = bluinactive2x
		    
		  Case "3D Blu-Ray"
		    If App.ScalingFactor = 1 Then Pic = bluinactive Else Pic = bluinactive2x
		    
		  Case "3DBD"
		    If App.ScalingFactor = 1 Then Pic = bluinactive Else Pic = bluinactive2x
		    
		  Else
		    // Nothing
		    #If TargetCocoa Then
		      lblSummarySource.Visible = True
		      lblSummarySource.Left = Me.Left
		    #endif
		    
		  End Select
		  
		  If Pic <> Nil Then g.ScaleImage( Pic, 20, 20, 0, 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnGetTrailer
	#tag Event
		Sub Action()
		  CommonCore.GetMovieTrailer()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TrailerView
	#tag Event
		Sub Close()
		  Me.Pause
		  Me.Movie = Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If Me.Movie = Nil Then
		    Dim s as String = "No movie found or movie format not supported"
		    if TargetCarbon then s = "Trailer view not supported in the 'Intel' version, use the Cocoa version instead"
		    g.DrawString s, ( Me.Width / 2 ) - ( g.StringWidth( s ) / 2 ), ( ( Me.Height / 2 ) - ( g.StringHeight( s, Me.Width ) / 2 ) ) + g.TextAscent
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Activate()
		  dim TrailerFile as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		  
		  
		  If TrailerView.Movie = Nil and TrailerFile <> Nil ANd TrailerFile.Exists Then
		    Dim qt_movie As QTMovie = QTMovie.LoadFromFolderItem( TrailerFile )
		    If qt_movie <> Nil Then
		      TrailerView.Visible = True
		      TrailerView.Movie = qt_movie
		    Else
		      TrailerView.Visible = False
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddRemoveActor
	#tag Event
		Sub ActionAdd()
		  lstActors.AddRow edtActorName.Text, edtActorRole.Text, edtActorThumbURL.Text
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionRemove()
		  If lstActors.ListIndex = -1 Then Return
		  lstActors.RemoveRow lstActors.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddRemoveStudio
	#tag Event
		Sub ActionAdd()
		  Dim b as Boolean = False
		  For i as Integer = 0 to lstStudios.ListCount - 1
		    b = ( Trim( lstStudios.Cell( i, 0 ) ) = Trim( edtStudio.Text ) )
		    If b Then Exit
		  Next
		  
		  If b Then
		    MsgBox Loc.msgPriorStudioFound
		    Return
		  End If
		  
		  If edtStudio.Text <> "" And NOT b Then lstStudios.AddRow Trim( edtStudio.Text )
		  edtStudio.Text = ""
		  
		  'Modified = ( lstStudios.ListCount = 1 And Preferences.Prefs.stringForKey("RenameStringMovies").InStr(0, "$C") > 0 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionRemove()
		  If lstStudios.ListIndex <> -1 Then lstStudios.RemoveRow lstStudios.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPrevious
	#tag Event
		Sub Action()
		  If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then SaveNFO()
		  
		  lstRecMovies.DeleteAllRows
		  
		  thrActor.mode = timer.ModeOff 'Kill
		  thrRecommendations.mode = timer.ModeOff 'Kill
		  scktActor.Close
		  TrailerSckteer.Close
		  wndMain.lstMovies.UpdateRow
		  
		  If wndMain.lstMovies.ListIndex > 0 Then wndMain.lstMovies.ListIndex = wndMain.lstMovies.ListIndex - 1
		  If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then
		    GetNFO()
		  Else
		    Me.Push
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNext
	#tag Event
		Sub Action()
		  If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then SaveNFO()
		  
		  lstRecMovies.DeleteAllRows
		  
		  thrActor.mode = timer.ModeOff 'Kill
		  thrRecommendations.mode = timer.ModeOff 'Kill
		  scktActor.Close
		  TrailerSckteer.Close
		  wndMain.lstMovies.UpdateRow
		  
		  If wndMain.lstMovies.ListIndex < ( wndMain.lstMovies.ListCount - 1 ) Then wndMain.lstMovies.ListIndex = wndMain.lstMovies.ListIndex + 1
		  
		  If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then
		    GetNFO()
		  Else
		    Me.Push
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Left = btnPrevious.Left + btnPrevious.Width + 10
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scktActor
	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  pgActor.Visible = ( totalBytes < bytesReceived )
		  
		  pgActor.Maximum = totalBytes
		  pgActor.Value   = bytesReceived
		  
		  pgActor.Visible = ( totalBytes >= bytesReceived )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(code as integer)
		  SocketError( code, Me )
		  
		  Exception err as NilObjectException
		    Me.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thrActor
	#tag Event
		Sub Action()
		  Dim FullURL  as String = Trim( lstActors.Cell( lstActors.ListIndex, 2 ) )
		  Dim FullName as String = Trim( lstActors.Cell( lstActors.ListIndex, 0 ) )'.ReplaceAll( " ", "_" ).Lowercase
		  Dim ActorIMGFolder as FolderItem = Preferences.fAppSupport.Child( "Actors" )
		  If NOT ActorIMGFolder.Exists Then ActorIMGFolder.CreateAsFolder
		  
		  Dim Name as String = Trim( lstActors.Cell( lstActors.ListIndex, 0 ) )
		  Dim Name_Parts() as String = Name.Split(" ")
		  Dim LastName  as String = Name_Parts( Name_Parts.Ubound )
		  Dim FirstName as String = Trim( Name.ReplaceAll( LastName, "" ) ).ReplaceAll( " ", "_" ).Lowercase
		  
		  
		  If lstActors.ListIndex > -1 And FullURL.Left(4) = "http" Then
		    ActorIMG = URL2Picture( FullURL, ActorIMGFolder, LastName.Lowercase + ",_" + FirstName + ".jpg" ) 'URL2Picture( FullURL, LastName.Lowercase + ",_" + FirstName, "jpg", ActorIMGFolder )
		  ElseIf lstActors.ListIndex > -1 Then
		    Dim f as FolderItem
		    If FullURL.Left(1) = "/" Then
		      f = GetFolderItem( FullURL, FolderItem.PathTypeShell )
		    Else
		      f = GetFolderItem( MovieAttr.FolderParent.ShellPath + "/" + FullURL, FolderItem.PathTypeShell )
		    End If
		    If f <> Nil Then ActorIMG = Picture.Open( f )
		  End If
		  
		  pgActor.Visible = False
		  cvsActorIMG.Reload
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TrailerSckteer
	#tag Event
		Sub ReceiveProgress(bytesReceived as Integer, totalBytes as Integer, newData as String, Progress as String)
		  pgTrailer.Visible = True
		  pgTrailer.Maximum = totalBytes
		  pgTrailer.Value = bytesReceived
		  
		  lblDownloadProgress.Visible = True
		  lblDownloadProgress.Text = Progress
		  
		  edtTrailerURL.Enabled = False
		  btnTrailerDownload.Enabled = False
		  btnTrailerDelete.Enabled = False
		  btnWatchOffline.Enabled = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadComplete(url as String, httpStatus as Integer, Headers as internetHeaders, file as FolderItem)
		  pgTrailer.Visible = False
		  lblDownloadProgress.Visible = False
		  
		  edtTrailerURL.Enabled = True
		  edtTrailerURL.Text = ""
		  btnTrailerDownload.Enabled = True
		  btnTrailerDelete.Enabled = FindTrailerItem( MovieAttr.FolderParent ) <> Nil
		  btnWatchOffline.Enabled = FindTrailerItem( MovieAttr.FolderParent ) <> Nil
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thrRecommendations
	#tag Event
		Sub Action()
		  
		  Dim DB as String = "IMDb"
		  If lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ).InStr( 0, "TMDB" ) > 0 OR lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ).Left(2) <> "tt" Then DB = "TMDB"
		  If lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ).InStr( 0, "RottenTomatoes" ) > 0 Then DB = "RottenTomatoes"
		  
		  Dim ID as String = Trim( lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ).ReplaceAll("TMDB", "").ReplaceAll("RottenTomatoes", "") )
		  If ID = "" Then ID = Trim( lstRecMovies.Cell( lstRecMovies.ListIndex, 2 ) )
		  
		  prgRecommendations.Visible = False
		  cvsRecommendations.Reload
		  
		  // If NO ID, then Return
		  If ID = "" Then Return
		  
		  // ElseIf ID Then Continue
		  If lstRecMovies.ListIndex = -1 Then Return
		  If lstRecMovies.CellTag( lstRecMovies.ListIndex, 9 ) <> Nil And lstRecMovies.CellTag( lstRecMovies.ListIndex, 10 ) <> Nil And lstRecMovies.Cell( lstRecMovies.ListIndex, 12 ) <> "" Then Return
		  prgRecommendations.Visible = True
		  
		  Dim MvSckt as New MovieSckt
		  MvSckt.Yield = True
		  Dim JSONString as String = DefineEncoding( MvSckt.Get( MvSckt.URL( "MovieInfo", ID, Preferences.Prefs.stringForKey("DBLanguage") ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  
		  // ## TMDB Local
		  Dim TMDBLocal as New JSONItem
		  If JSONString.ValidJSON("TMDb") Then TMDBLocal.Load( JSONString.ReplaceAll("&#x27;","'").ReplaceAll("&#x22;","\""").ReplaceAll("&#x26;","&") )
		  JSONString = ""
		  
		  
		  // ## TMDB U.S. Backup
		  Dim TMDBUS as New JSONItem
		  If NOT TMDBLocal.HasName("status_message") And Preferences.Prefs.stringForKey("DBLanguage").InStr( 0, "en" ) = 0 Then
		    JSONString = DefineEncoding( MvSckt.Get( MvSckt.URL( "MovieInfo", ID, "en" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    If JSONString.ValidJSON("TMDb U.S.") Then TMDBUS.Load( JSONString.ReplaceAll("&#x27;","'").ReplaceAll("&#x22;","\""").ReplaceAll("&#x26;","&") )
		    JSONString = ""
		  End If
		  
		  
		  // ## IMDb
		  Dim IMDb as New JSONItem
		  If ID.left(2) = "tt" Then
		    IMDb = GetIMDbJSON( ID, True )
		  ElseIf TMDBLocal.HasName("imdb_id") And TMDBLocal.Value("imdb_id") <> "" Then
		    IMDb = GetIMDbJSON( TMDBLocal.Value("imdb_id") )
		  ENd If
		  
		  // Determine country for original title
		  Dim Country as String = "USA"
		  If IMDb <> Nil And IMDb.HasName("COUNTRY") And IMDb.Child("COUNTRY").Count > 0 Then
		    For i as Integer = 0 to IMDb.Child("COUNTRY").Count - 1
		      Dim Stratos as String = IMDb.Child("COUNTRY").Value(i)
		      
		      If Stratos = "Japan" or Stratos = "China" Then Country = "Asia"
		    Next
		  End If
		  
		  
		  // :0 = Title
		  'Dim Cell as String = lstRecMovies.Cell( lstRecMovies.ListIndex, 0 )
		  
		  'If TMDBUS.HasName("title")    And TMDBUS.Value("title")    <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 0 ) = TMDBUS.Value("title")
		  'If TMDBLocal.HasName("title") And TMDBLocal.Value("title") <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 0 ) = TMDBLocal.Value("title")
		  'If IMDb.HasName("TITLE")      And IMDb.Value("TITLE")      <> "" And Preferences.Prefs.stringForKey("DBLanguage").InStr(0, "en") = 0 Then lstRecMovies.Cell( lstRecMovies.ListIndex, 0 ) = IMDb.Value("TITLE")
		  
		  'If Cell <> lstRecMovies.Cell(lstRecMovies.ListIndex, 0 ) Then
		  'MovieAttr.RecMovies( lstRecMovies.ListIndex ) = lstRecMovies.Cell( lstRecMovies.ListIndex, 0 )
		  'MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		  'End If
		  
		  // :1 = IMDb ID
		  If TMDBLocal <> Nil And TMDBLocal.HasName("id") Then lstRecMovies.Cell( lstRecMovies.ListIndex, 1 ) = TMDBLocal.Value("imdb_id") + " " + DB '" TMDB"
		  
		  // :2 = TMDB ID
		  If TMDBLocal <> Nil And TMDBLocal.HasName("id") Then lstRecMovies.Cell( lstRecMovies.ListIndex, 2 ) = TMDBLocal.Value("id")
		  // :3 = Tagline
		  If IMDb <> Nil And IMDb.HasName("TAGLINE")          And IMDb.Value("TAGLINE")            <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 3 ) = RegExThis( IMDb.Value("TAGLINE"), "\(Series .*\)|\(Season .*\)", "" )
		  If TMDBUS <> Nil And TMDBUS.HasName("tagline")        And TMDBUS.Value("tagline")          <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 3 ) = TMDBUS.Value("tagline")
		  If TMDBLocal <> Nil And TMDBLocal.HasName("tagline")     And TMDBLocal.Value("tagline")       <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 3 ) = TMDBLocal.Value("tagline")
		  // :4 = Plot
		  Dim Plot as String
		  If TMDBUS <> Nil And TMDBUS.HasName("overview")        And TMDBUS.Value("overview")        <> "" Then Plot = TMDBUS.Value("overview")
		  If IMDb <> Nil And IMDb.HasName("STORYLINE")         And IMDb.Value("STORYLINE")         <> "" Then Plot = IMDb.Value("STORYLINE")
		  If Preferences.Prefs.stringForKey("DBLanguage").Instr(0, "en") = 0 And TMDBLocal.HasName("overview")     And TMDBLocal.Value("overview")     <> "" Then Plot = TMDBLocal.Value("overview")
		  
		  Dim sx1 as Integer = Plot.InStr( 1500, " " )
		  If sx1 > 0 Then Plot = Trim( Plot.Left( sx1 - 1 ) ) + "..."
		  lstRecMovies.Cell( lstRecMovies.ListIndex, 4 ) = Plot
		  
		  // :5 = Release Date
		  If IMDb <> Nil And IMDb.HasName("RELEASE_DATE")      And IMDb.Value("RELEASE_DATE")      <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 5 ) = IMDb.Value("RELEASE_DATE")
		  If TMDBUS <> Nil And TMDBUS.HasName("release_date")    And TMDBUS.Value("release_date")    <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 5 ) = TMDBUS.Value("release_date")
		  If TMDBLocal <> Nil And TMDBLocal.HasName("release_date") And TMDBLocal.Value("release_date") <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 5 ) = TMDBLocal.Value("release_date")
		  // :6 = Runtime
		  If IMDb <> Nil And IMDb.HasName("RUNTIME")           And IMDb.Value("RUNTIME")            > 0  Then lstRecMovies.Cell( lstRecMovies.ListIndex, 6 ) = IMDb.Value("RUNTIME")
		  If TMDBUS <> Nil And TMDBUS.HasName("runtime")         And Val( TMDBUS.Value("runtime") )   > 0  Then lstRecMovies.Cell( lstRecMovies.ListIndex, 6 ) = TMDBUS.Value("runtime")
		  If TMDBLocal <> Nil And TMDBLocal.HasName("runtime")      And Val( TMDBLocal.Value("runtime")) > 0  Then lstRecMovies.Cell( lstRecMovies.ListIndex, 6 ) = TMDBLocal.Value("runtime")
		  // :7 = Genres
		  Dim genres as String
		  
		  If IMDb <> Nil And IMDb.HasName("GENRES")            And  IMDb.Child("GENRES").Count      > 0  Then
		    For i as Integer = 0 to IMDb.Child("GENRES").Count - 1
		      If i = 3 Then Exit
		      If genres = "" Then
		        genres = IMDb.Child("GENRES").Value(i)
		      Else
		        genres = genres + " | " + IMDb.Child("GENRES").Value(i)
		      End If
		    Next
		  End If
		  
		  If TMDBLocal <> Nil And TMDBLocal.HasName("genres")      And TMDBLocal.Child("genres").Count    > 0 Then
		    genres = ""
		    For i  as Integer = 0 to TMDBLocal.Child("genres").Count - 1
		      If i = 3 Then Exit
		      If genres = "" Then
		        genres = TMDBLocal.Child("genres").Child(i).Value("name")
		      Else
		        genres = genres + " | " + TMDBLocal.Child("genres").Child(i).Value("name")
		      End If
		    Next
		  End If
		  
		  lstRecMovies.Cell( lstRecMovies.ListIndex, 7 ) = genres.ReplaceAll("SciFi", "Sci-Fi")
		  // :8 = Rating
		  If TMDBLocal <> Nil And TMDBLocal.HasName("vote_average") And TMDBLocal.Value("vote_average") <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 8 ) = Str( Round( Val( TMDBLocal.Value("vote_average") ) * 10 ) / 10 )
		  If IMDb <> Nil And IMDb.HasName("RATING")            And IMDb.Value("RATING")            <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 8 ) = Str( IMDb.Value("RATING") )
		  
		  cvsRecommendations.Reload
		  // :9 = Poster
		  Dim pSize as String = "w342"
		  If App.ScalingFactor = 2 Then pSize = "w342" Else pSize = "w185"
		  If IMDb <> Nil And IMDb.HasName("POSTER_LARGE")      And IMDb.Value("POSTER_LARGE")      <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 9 ) = IMDb.Value("POSTER_LARGE")
		  If TMDBLocal <> Nil And TMDBLocal.HasName("poster_path")  And TMDBLocal.Value("poster_path")  <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 9 ) = MovieSckt.URLbase_image + pSize + TMDBLocal.Value("poster_path")
		  If lstRecMovies.Cell( lstRecMovies.ListIndex, 9 ) <> "" Then
		    lstRecMovies.CellTag( lstRecMovies.Listindex, 9 ) = Picture.FromData( MvSckt.Get( lstRecMovies.Cell( lstRecMovies.ListIndex, 9 ), Preferences.Prefs.integerForKey("TimeOut") ) )
		  End If
		  
		  cvsRecommendations.Reload
		  // :10 = Backdrop
		  Dim bSize as String = "w780"
		  If App.ScalingFactor = 2 Then pSize = "w780" Else bSize = "w300"
		  If IMDb <> Nil And IMDb.HasName("MEDIA_IMAGES") And IMDb.Child("MEDIA_IMAGES").IsArray      And IMDb.Child("MEDIA_IMAGES").Count > 0 Then lstRecMovies.Cell( lstRecMovies.ListIndex, 10 ) = IMDb.Child("MEDIA_IMAGES").Value(0)
		  If TMDBLocal <> Nil And TMDBLocal.HasName("backdrop_path") And TMDBLocal.Value("backdrop_path") <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 10 ) = MovieSckt.URLbase_image + bSize + TMDBLocal.Value("backdrop_path")
		  If lstRecMovies.Cell( lstRecMovies.ListIndex, 10 ) <> "" Then
		    lstRecMovies.CellTag( lstRecMovies.Listindex, 10 ) = Picture.FromData( MvSckt.Get( lstRecMovies.Cell( lstRecMovies.ListIndex, 10 ), Preferences.Prefs.IntegerForKey("TimeOut") ) )
		  End If
		  
		  // :11 = Original Title
		  Dim CellOT as String
		  If TMDBLocal <> Nil And TMDBLocal.HasName("original_title") And TMDBLocal.Value("original_title") <> "" Then CellOT = TMDBLocal.Value("original_title")
		  If IMDb <> Nil And IMDb.HasName("TITLE")               And IMDb.Value("TITLE")               <> "" Then CellOT = IMDb.Value("TITLE")
		  If IMDb <> Nil And IMDb.HasName("ORIGINAL_TITLE")      And IMDb.Value("ORIGINAL_TITLE")      <> "" Then CellOT = IMDb.Value("ORIGINAL_TITLE")
		  If Preferences.Prefs.stringForKey("DBLanguage").InStr(0, "en") = 0 And Country = "Asia" And IMDb.HasName("AKA") And IMDb.Value("AKA") <> "" Then CellOT = IMDb.Value("AKA")
		  If TMDBUS.HasName("title") And TMDBUS.Value("title") <> "" Then CellOT = TMDBUS.Value("title")
		  
		  lstRecMovies.Cell( lstRecMovies.ListIndex, 11 ) = CellOT
		  // :12 = MPAA Rating
		  Dim MPAA as String
		  If IMDb <> Nil And IMDb.HasName("MPAA_RATING") And IMDb.Value("MPAA_RATING") = "" Then MPAA = "-"
		  If IMDb <> Nil And IMDb.HasName("MPAA_RATING")         And IMDb.Value("MPAA_RATING")         <> "" Then MPAA = IMDb.Value("MPAA_RATING")
		  'Dim sx2 as Integer = MPAA.InStr(0, " for ")
		  'If sx2 > 0 Then MPAA = Trim( MPAA.Left( sx2 ) )
		  lstRecMovies.Cell( lstRecMovies.ListIndex, 12 ) = MPAA
		  
		  
		  // :13 = Homepage
		  If TMDBUS <> Nil And TMDBUS.HasName("homepage")    And TMDBUS.Value("homepage")    <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 13 ) = TMDBUS.Value("homepage")
		  If TMDBLocal <> Nil And TMDBLocal.HasName("homepage") And TMDBLocal.Value("homepage") <> "" Then lstRecMovies.Cell( lstRecMovies.ListIndex, 13 ) = TMDBLocal.Value("homepage")
		  
		  MvSckt.Close
		  prgRecommendations.Visible = False
		  cvsRecommendations.Reload
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
		Name="IMDB_Top250"
		Group="Behavior"
		Type="Picture"
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
		Name="RecMovieFanart"
		Group="Behavior"
		Type="Picture"
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
		Name="RT_Critics"
		Group="Behavior"
		Type="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="RT_User"
		Group="Behavior"
		Type="Picture"
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

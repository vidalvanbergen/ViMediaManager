#tag Window
Begin WindowPro wndShowMetadata
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
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
      TabIndex        =   2
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
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      PanelCount      =   6
      Panels          =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   -1
      Value           =   1
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
         Top             =   13
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   130
      End
      Begin Canvas cvsSummaryLogo
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   95
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
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   13
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   245
      End
      Begin Canvas cvsSummaryBanner
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   95
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
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   109
         Transparent     =   True
         UseFocusRing    =   True
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
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   216
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
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mAiredNextEpisode"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   247
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   172
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
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mAiredNext"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   267
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   172
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
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mAiredPrevEpisode"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   227
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   172
         Begin ProgressWheel prgStatusUpdate
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "lblArray$2"
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
            Top             =   227
            Visible         =   False
            Width           =   16
         End
      End
      Begin Label lblPrevEpisode
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
         Left            =   204
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
         Text            =   "S##E## - Episode Name"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   230
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   350
      End
      Begin Label lblNextEpisode
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
         Left            =   204
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
         Text            =   "S##E## - Episode Name"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   250
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   350
      End
      Begin Label lblNextEpisodeDate
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
         Left            =   204
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
         Text            =   "2012-12-21 2:00 AM"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   270
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   203
      End
      Begin LinkLabelCanvas llTVDB
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
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Link"
         Top             =   226
         Transparent     =   True
         URL             =   "http://"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
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
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Link"
         Top             =   250
         Transparent     =   True
         URL             =   "http://"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
      End
      Begin LinkLabelCanvas llTVRage
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
         TabIndex        =   14
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Link"
         Top             =   274
         Transparent     =   True
         URL             =   "http://"
         UseFocusRing    =   True
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
         TabIndex        =   15
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mNetwork"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   287
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   172
      End
      Begin Label lblNetwork
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
         Left            =   204
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
         Text            =   "SBS6"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   290
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   203
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
         TabIndex        =   17
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mRuntime"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   307
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   172
      End
      Begin Label lblRuntime
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
         Left            =   204
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
         Text            =   "60 Minutes"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   310
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   203
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
         TabIndex        =   19
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   338
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
         Index           =   5
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
         TabIndex        =   20
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Loc.mWhere"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   349
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   172
      End
      Begin Label lblPath
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   34
         HelpTag         =   ""
         Index           =   -2147483648
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
         TabIndex        =   21
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "/Path/To/Show/folder\r///"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   372
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   860
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   4
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppTabs"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   22
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   426
         Visible         =   False
         Width           =   900
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   4
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppTabs"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   480
         Visible         =   False
         Width           =   900
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   4
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppTabs"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   302
         Visible         =   False
         Width           =   900
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   4
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppTabs"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   541
         Visible         =   False
         Width           =   900
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
         Top             =   10
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
         Top             =   31
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   280
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
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "0000-00-00"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   172
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
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kpremiered"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   151
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   115
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
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mYear"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   151
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   62
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
         Top             =   172
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
         Top             =   172
         Visible         =   True
         Width           =   13
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
         Top             =   172
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
         TabIndex        =   9
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mRating"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   151
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
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
         Top             =   125
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
         TabIndex        =   11
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTitleSort"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   104
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
         Top             =   78
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
         TabIndex        =   13
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTitleOriginal"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   57
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
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
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   171
         Visible         =   True
         Width           =   13
      End
      Begin SuperTextfield edtNetwork
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
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   218
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
         TabIndex        =   16
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mNetwork"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   197
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
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
         TabIndex        =   10
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   341
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   223
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
         Top             =   265
         Underline       =   False
         UseFocusRing    =   False
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
         Top             =   244
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   280
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
         TabIndex        =   21
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   394
         Visible         =   True
         Width           =   10
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
         TabIndex        =   22
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kCommaSeparated"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   367
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
         TabIndex        =   15
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   388
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
         TabIndex        =   24
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mGenres"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   367
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   238
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
         TabIndex        =   14
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   172
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
         TabIndex        =   26
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kPlot"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   151
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   568
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
         TabIndex        =   13
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   78
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
         TabIndex        =   28
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mOutline"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   57
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   568
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
         TabIndex        =   29
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   37
         Visible         =   True
         Width           =   10
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
         TabIndex        =   12
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   31
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
         TabIndex        =   31
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTagline"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   10
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   568
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
         TabIndex        =   32
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   394
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
         TabIndex        =   11
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   388
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
         TabIndex        =   34
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mMPAARating"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   367
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   211
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
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#Loc.mDirector"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   247
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   250
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
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   268
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   250
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
         Left            =   282
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
         Top             =   268
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   250
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
         Left            =   284
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#Loc.mWriter"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   247
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   250
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
         Left            =   544
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
         Top             =   268
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   250
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
         Left            =   546
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#Loc.mSound"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   247
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   250
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
         TabIndex        =   7
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   13
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
         TabIndex        =   65
         TabPanelIndex   =   3
         Top             =   216
         Value           =   0
         Visible         =   False
         Width           =   130
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
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   216
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
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   216
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
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   216
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   313
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
         InitialValue    =   "#Loc.kPoster\r#Loc.kFanart\r#Loc.kBanner\r-\r#Loc.kLogo\r#Loc.kClearArt\r#Loc.kThumb\r#Loc.kCharacterArt"
         Italic          =   False
         Left            =   780
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   13
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
         TabIndex        =   2
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   109
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
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   45
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
         TabIndex        =   4
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   77
         Underline       =   False
         Visible         =   True
         Width           =   100
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
         TabIndex        =   5
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   13
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   748
      End
      Begin MyHierListBox lstRecShows
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
         TabIndex        =   2
         TabPanelIndex   =   6
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   -2
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   221
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   4
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppTabs"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   6
         TabStop         =   True
         Top             =   484
         Visible         =   False
         Width           =   900
      End
      Begin MediaDetails cvsRecommendations
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   True
         Height          =   486
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
         TabIndex        =   4
         TabPanelIndex   =   6
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   680
         Begin PopupArrow popGetRecomended
            AutoDeactivate  =   True
            Enabled         =   True
            Facing          =   1
            Height          =   10
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "cvsRecommendations"
            Left            =   870
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   6
            TabStop         =   True
            Top             =   459
            Visible         =   True
            Width           =   10
         End
         Begin ProgressWheel prgRecommendations
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "cvsRecommendations"
            Left            =   842
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   6
            TabStop         =   True
            Top             =   456
            Visible         =   False
            Width           =   16
         End
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
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   13
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   718
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton btnEpGuide
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Go To EpGuide"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   759
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   23
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   77
         Underline       =   False
         Visible         =   False
         Width           =   121
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   29
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
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "#Loc.kDirectURL"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   11
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   250
      End
      Begin TextField edtThemeURL
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
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   33
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   726
      End
      Begin PopupArrow popThemeSongs
         AutoDeactivate  =   True
         Enabled         =   True
         Facing          =   1
         Height          =   10
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   758
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   39
         Visible         =   True
         Width           =   10
      End
      Begin Pushbutton btnSndPreview
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
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   646
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
         Top             =   67
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushButton btnSndStop
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.dlgStop"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   554
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   67
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushbuttonPro btnSndDownload
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.kDownload"
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
         Top             =   33
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   27
         HelpTag         =   ""
         Index           =   10
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
         TabIndex        =   8
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "#lblThemesongMessage"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   65
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   522
      End
      Begin ProgressWheel PrgSnd
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Left            =   758
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   67
         Visible         =   False
         Width           =   16
      End
      Begin Separator SepArray
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   4
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppTabs"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   112
         Visible         =   False
         Width           =   900
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
         TabIndex        =   35
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   438
         Underline       =   False
         UseFocusRing    =   False
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
         TabIndex        =   36
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTags"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   416
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
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   30
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
         TabIndex        =   37
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kCommaSeparated"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   416
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   238
      End
      Begin PushButton btnEpCache
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Clear Cache"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppTabs"
         Italic          =   False
         Left            =   759
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   24
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   50
         Underline       =   False
         Visible         =   False
         Width           =   121
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
         TabIndex        =   38
         TabPanelIndex   =   2
         Top             =   341
         Visible         =   True
         Width           =   48
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
         TabIndex        =   66
         TabPanelIndex   =   3
         Top             =   216
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
      TabIndex        =   0
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
   Begin MoviePlayer sndPlayer
      AutoDeactivate  =   True
      AutoPlay        =   True
      AutoResize      =   True
      Border          =   True
      Controller      =   2
      HasStep         =   True
      Height          =   45
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Looping         =   True
      Movie           =   "0"
      Palindrome      =   False
      PlayerType      =   0
      Scope           =   0
      Speaker         =   True
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -77
      Visible         =   True
      Width           =   243
   End
   Begin HTMLViewer htmlSound
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   39
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   313
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Renderer        =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -71
      Visible         =   True
      Width           =   369
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
   Begin Timer UpdateStatus
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
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
		  UpdateStatus.Mode = timer.ModeOff
		  thrRecommendations.Mode = timer.ModeOff
		  scktActor.Close
		  
		  wndMain.ProgressRunning = False
		  wndMain.lstTVShows.Enabled = True
		  
		  Preferences.SaveWindowPos( Self, "wndMetadataTVShows" )
		  
		  wndMain.lstTVShows.ListIndex = wndMain.lstTVShows.ListIndex
		  
		  'If Modified Then
		  ''TVAttr.LoadImages( TVAttr.FolderParent )
		  'End If
		  wndMain.lstTVShows.UpdateRow( -1, TVAttr.FolderParent )
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
		  "TVShowMetaSummary", "TVShowMetaInfo", "TVShowMetaPeople", "TVShowMetaImages", "TVShowMetaMusic", "TVShowMetaRecommendations", _
		  NSToolbarFlexibleSpaceItemIdentifier )
		  Toolbar.SelectableItems = Array( "TVShowMetaSummary", "TVShowMetaInfo", "TVShowMetaPeople", "TVShowMetaImages", "TVShowMetaMusic", "TVShowMetaRecommendations" )
		  
		  
		  // This is an array of items identifiers to specify all the allowed items in toolbar
		  // this template is used to populate the toolbar customization panel
		  Toolbar.AllowedItems = Array ( _
		  _ // Commonly used toolbar items
		  NSToolbarSpaceItemIdentifier, _
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  NSToolbarCustomizeToolbarItemIdentifier, _
		  NSToolbarSeparatorItemIdentifier, _
		  _ // Your toolbar items
		  "TVShowMetaSummary", "TVShowMetaInfo", "TVShowMetaPeople", "TVShowMetaImages", "TVShowMetaMusic", "TVShowMetaRecommendations" )
		  
		  
		  // Add toolbar items
		  'Toolbar.AddControl( PushButton1, "Pushbutton" ) // Simplified method to add customtoolbar items with controls
		  'Toolbar.AddButton( "mainAdvanced", NSImage.Advanced, "Advanced", "", "", False )
		  
		  Toolbar.AddButton( "TVShowMetaSummary", NSImage.LoadByName( "template_summary" ), Loc.mTabSummary, Loc.mTabSummary, Loc.mTabSummary, True )
		  Toolbar.AddButton( "TVShowMetaInfo", NSImage.LoadByName( "template_info" ), Loc.mTabInfo, "", "", True )
		  Toolbar.AddButton( "TVShowMetaPeople", NSImage.LoadByName( "template_people" ), Loc.mTabPeople, "", "", True )
		  Toolbar.AddButton( "TVShowMetaImages", NSImage.LoadByName( "template_images" ), Loc.kImages, "", "", True )
		  Toolbar.AddButton( "TVShowMetaMusic", NSImage.LoadByName( "template_music" ), Loc.kThemeSong, "", "", True )
		  Toolbar.AddButton( "TVShowMetaRecommendations", NSImage.LoadByName( "template_link" ), Loc.kRecMovies, "", "", True )
		  
		  toolbar.SelectedItemIdentifier = "TVShowMetaSummary"
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  If Keyboard.AsyncCommandKey Then
		    
		    // Switch Tabs
		    If Asc(Key) >= 49 And Asc(Key) <= 54 And ppTabs.Value <> Val( Key ) -1 Then
		      SwitchPanels( Val( Key ) )
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
		  wndMain.lstTVShows.Enabled = False
		  
		  Preferences.LoadWindowPos( Self, "wndMetadataTVShows" )
		  
		  dim index as Integer = Preferences.Prefs.integerForKey("NSWindow MetadataTVShow Tab")
		  If index < 5 Then
		    SwitchPanels( index )
		    
		    Select case Index
		    case 0
		      toolbar.SelectedItemIdentifier = "TVShowMetaSummary"
		      
		    case 1
		      Toolbar.SelectedItemIdentifier = "TVShowMetaInfo"
		      
		    case 2
		      toolbar.SelectedItemIdentifier = "TVShowMetaPeople"
		      
		    case 3
		      toolbar.SelectedItemIdentifier = "TVShowMetaImages"
		      
		    case 4
		      toolbar.SelectedItemIdentifier = "TVShowMetaMusic"
		      
		    case 5
		      toolbar.SelectedItemIdentifier = "TVShowMetaRecommendations"
		      
		    End Select
		  Else
		    SwitchPanels(0)
		  End If
		  
		  GetNFO()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Settings()
		  self.PrefToolbarName = "NSToolbarTVShowMetadata" // Activate toolbar support.
		  'self.TitleVisible = False // Merge toolbar with titlebar.
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarActions(Identifier as String, hitItem as NSMenuItem)
		  
		  Select case Identifier
		    
		  case "TVShowMetaSummary"
		    SwitchPanels 0
		  case "TVShowMetaInfo"
		    SwitchPanels 1
		  case "TVShowMetaPeople"
		    SwitchPanels 2
		  case "TVShowMetaImages"
		    SwitchPanels 3
		  case "TVShowMetaMusic"
		    SwitchPanels 4
		  case "TVShowMetaRecommendations"
		    SwitchPanels 5
		    
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
		  Dim Lstbox as Listbox = wndMain.lstTVShows
		  
		  // ## Previous button
		  Dim bPrev as Boolean = False
		  If Lstbox.ListIndex > 0 And Lstbox.RowTag( Lstbox.ListIndex -1 ) = "Folder" Then
		    Dim Index as Integer = Lstbox.ListIndex
		    While Index -1 > 0 ' And Lstbox.RowTag( Lstbox.ListIndex -1 ) = "Folder"
		      Index = index -1
		      If Lstbox.RowTag( Index ) <> "Folder" Then
		        bPrev = True
		        Exit
		      End If
		    Wend
		  ElseIf Lstbox.ListIndex > 0 Then
		    bPrev = True
		  Else
		    bPrev = False
		  End If
		  
		  btnPrevious.Enabled = bPrev
		  
		  // ## Next button
		  Dim bNext as Boolean = False
		  If Lstbox.ListIndex < Lstbox.ListCount -1 And Lstbox.RowTag( Lstbox.ListIndex +1 ) = "Folder" Then
		    Dim Index as Integer = Lstbox.ListIndex
		    While Index +1 < Lstbox.ListCount -1
		      Index = Index +1
		      If Lstbox.RowTag( Index ) <> "Folder" Then
		        bNext = True
		        Exit
		      End If
		    Wend
		  ElseIf Lstbox.ListIndex < Lstbox.ListCount -1 Then
		    bNext = True
		  Else
		    bNext = False
		  End If
		  
		  btnNext.Enabled = bNext
		  
		  
		  // ## Summary
		  TVAttr.LoadImages( TVAttr.FolderParent )
		  
		  // # Canvas'
		  cvsSummaryPoster.Invalidate
		  cvsSummaryLogo.Invalidate
		  cvsSummaryBanner.Invalidate
		  
		  
		  // # Episode NFO
		  Dim Date, Time, GMT as String
		  Date = TVAttr.NextAired_Date.NthField( "T", 1 )
		  Time = TVAttr.NextAired_Date.NthField( "T", 2 ).NthField( "G", 1 )
		  GMT  = TVAttr.NextAired_Date.NthField( "T", 2 ).NthField( "G", 2 )
		  
		  If TVAttr.LastAired_Episode <> "" Then lblPrevEpisode.Text = TVAttr.LastAired_Episode Else lblPrevEpisode.Text = Loc.kNotAvailable
		  lblNextEpisode.Text = TVAttr.NextAired_Episode
		  If TVAttr.NextAired_Date <> "" Then lblNextEpisodeDate.Text = PrettyDate( Date, False ) + " | " + Time + " GMT " + GMT Else lblNextEpisodeDate.Text = ""
		  
		  
		  // # Links
		  // -- IMDb
		  If TVAttr.ID_TVDB <> "" Then
		    llTVDB.Visible = True
		    llTVDB.Text = "TVDb: " + TVAttr.ID_TVDB
		    llTVDB.URL = "http://thetvdb.com/?tab=series&id=" + TVAttr.ID_TVDB
		    'llTVDB.Width = 20 + 5 + Graphics.StringWidth( llTVDB.Text ) + 10
		  Else
		    llTVDB.Visible = False
		    llTVDB.Text = ""
		    llTVDB.URL = ""
		  End If
		  llTVDB.Reload
		  
		  // -- IMDb
		  If TVAttr.ID_IMDB <> "" Then
		    llIMDb.Visible = True
		    llIMDb.Text = "IMDb: " + TVAttr.ID_IMDB
		    llIMDb.URL = "http://www.imdb.com/title/" + TVAttr.ID_IMDB
		    'llIMDb.Width = 20 + 5 + Graphics.StringWidth( llIMDb.Text ) + 10
		  Else
		    llIMDb.Visible = False
		    llIMDb.Text = ""
		    llIMDb.URL = ""
		  End If
		  llIMDb.Reload
		  
		  // -- TVRage
		  If TVAttr.ID_TVRage <> "" Then
		    llTVRage.Visible = True
		    llTVRage.Text = "TVRage: " + TVAttr.ID_TVRage
		    'llTVRage.URL = "http://www.tvrage.com/" + TVAttr.Title.ReplaceAll(" ","_")
		    llTVRage.URL = "http://www.tvrage.com/shows/id-" + TVAttr.ID_TVRage
		    'llTVRage.Width = 20 + 5 + Graphics.StringWidth( llTVRage.Text ) + 10
		  Else
		    llTVRage.Visible = False
		    llTVRage.Text = ""
		    llTVRage.URL = ""
		  End If
		  llTVRage.Reload
		  
		  
		  // -- Network
		  If TVAttr.TVNetwork <> "" Then lblNetwork.Text = TVAttr.TVNetwork Else lblNetwork.Text = Loc.kNotAvailable
		  
		  // -- Runtime
		  If TVAttr.DurationRuntime > 0 Then lblRuntime.Text = Str( TVAttr.DurationRuntime ) + Loc.kMinutes Else lblRuntime.Text = Loc.kNotAvailable
		  
		  // -- Path
		  If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then lblPath.Text = TVAttr.FolderParent.ShellPath.ReplaceAll("\", "") Else lblPath.Text = Loc.kNotAvailable
		  
		  
		  
		  // ## Information
		  
		  // Title
		  edtTitle.Text         = TVAttr.Title
		  edtTitleSort.Text     = TVAttr.TitleSort
		  edtTitleOriginal.Text = TVAttr.TitleOriginal
		  
		  // Rating
		  If TVAttr.Rating > -1 Then edtRating.Text = Str( TVAttr.Rating ) Else edtRating.Text = ""
		  
		  // -- Date
		  If TVAttr.DateYear > -1 Then edtYear.Text     = Str( TVAttr.DateYear ) Else edtYear.Text = ""
		  edtPremiere.Text = Str( TVAttr.DatePremiered )
		  
		  // -- Network
		  edtNetwork.Text = TVAttr.TVNetwork
		  
		  // -- Studios
		  lstStudios.DeleteAllRows
		  For i as Integer = 0 to TVAttr.Studios.Ubound
		    lstStudios.AddRow TVAttr.Studios(i)
		  Next
		  
		  // -- MPAA
		  edtMPAA.Text = TVAttr.RatingMPAA
		  
		  
		  
		  // -- Tagline
		  edtTagline.Text = TVAttr.DescriptionTagline
		  If TVAttr.DescriptionTaglines.Ubound > -1 Then
		    popTagLines.Visible = True
		    edtTagline.Width = 551
		  Else
		    popTagLines.Visible = False
		    edtTagline.Width = 568
		  End If
		  
		  // -- Outline
		  edtOutline.Text = TVAttr.DescriptionOutline
		  // -- Plot
		  edtPlot.Text    = TVAttr.DescriptionPlot
		  
		  // -- Genre(s)
		  edtGenres.Text = ""
		  For i as Integer = 0 to TVAttr.Genres.Ubound
		    If edtGenres.Text = "" Then
		      edtGenres.Text = TVAttr.Genres(i)
		    Else
		      edtGenres.Text = edtGenres.Text + ", " + TVAttr.Genres(i)
		    End If
		  Next
		  
		  // -- Tag(s)
		  edtTags.Text = ""
		  For i as Integer = 0 to TVAttr.Tags.Ubound
		    If edtTags.Text = "" Then
		      edtTags.Text = TVAttr.Tags(i)
		    Else
		      edtTags.Text = edtTags.Text + ", " + TVAttr.Tags(i)
		    End If
		  Next
		  
		  
		  // ## People
		  lstActors.DeleteAllRows
		  For i as Integer = 0 to TVAttr.Actor_Name.Ubound
		    lstActors.AddRow TVAttr.Actor_Name(i), TVAttr.Actor_Role(i), TVAttr.Actor_ThumbURL(i), TVAttr.Actor_ID(i)
		  Next
		  
		  // Direction
		  edtDirector.Text = TVAttr.CreditDirector
		  edtWriter.Text   = TVAttr.CreditWriter
		  edtSound.Text    = TVAttr.CreditMusic
		  
		  
		  // ## Extra Art
		  Dim f as FolderItem
		  Dim m as String
		  
		  Select Case popImageMode.ListIndex
		    
		  Case 0
		    f = TVAttr.FolderParent.Child( "poster.jpg" ) 'FindImagePoster( TVAttr.FolderParent )
		    m = "Poster"
		  Case 1
		    f = TVAttr.FolderParent.Child( "fanart.jpg" ) 'FindImageFanart( TVAttr.FolderParent )
		    m = "Fanart"
		  Case 2
		    f = TVAttr.FolderParent.Child( "banner.jpg" ) 'FindImageBanner( TVAttr.FolderParent )
		    m = "Banner"
		    
		  Case 4
		    f = TVAttr.FolderParent.Child( "logo.png" )
		    m = "Logo"
		  Case 5
		    f = TVAttr.FolderParent.Child( "clearart.png" )
		    m = "ClearArt"
		  Case 6
		    f = TVAttr.FolderParent.Child( "landscape.jpg" )
		    m = "Thumb"
		  Case 7
		    f = TVAttr.FolderParent.Child( "character.png" )
		    m = "CharacterArt"
		    
		  End Select
		  
		  cvsExtraArtPreviewer.Mode = m
		  If f <> Nil and f.Exists Then
		    cvsExtraArtPreviewer.Reload Picture.Open( f )
		    btnDeleteArt.Enabled = True
		  Else
		    cvsExtraArtPreviewer.Reload Nil
		    btnDeleteArt.Enabled = False
		  End If
		  
		  // ## Themesound
		  btnSndDownload.Enabled = ( TVAttr.ThemeSongs.Ubound > -1 )
		  edtThemeURL.Text = ""
		  
		  // ## Recommendations
		  lstRecShows.DeleteAllRows
		  If TVAttr.RecShows.Ubound > -1 Then
		    lstRecShows.AddFolder "IMDb"
		    lstRecShows.RowPicture( lstRecShows.LastIndex ) = icoimdb
		    lstRecShows.RowTag( lstRecShows.LastIndex ) = "Folder"
		  End If
		  
		  For i as Integer = lstRecShows.ListCount - 1 DownTo 0
		    lstRecShows.Expanded ( i ) = False
		  Next
		  
		  For i as Integer = lstRecShows.ListCount - 1 DownTo 0
		    lstRecShows.Expanded ( i ) = True
		  Next
		  
		  
		  // ## Update Airdate
		  If TVAttr.NextAired_Date <> "" And Val( CountHours( TVAttr.NextAired_Date ) ) < 0 Then
		    'UpdateStatus.Mode = timer.ModeOff
		    UpdateStatus.Reset
		    UpdateStatus.Mode = timer.ModeSingle
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveNFO()
		  // Informatoin
		  TVAttr.Title         = Trim( edtTitle.Text )
		  TVAttr.TitleSort     = Trim( edtTitleSort.Text )
		  TVAttr.TitleOriginal = Trim( edtTitleOriginal.Text )
		  
		  If Trim( edtYear.Text ) <> "" Then TVAttr.DateYear       = Val( edtYear.Text )
		  TVAttr.DatePremiered  = Trim( edtPremiere.Text )
		  'TVAttr.DateEnded
		  
		  TVAttr.TVNetwork = edtNetwork.Text
		  
		  If Trim( edtRating.Text ) <> "" Then TVAttr.Rating     = Val( edtRating.Text )
		  TVAttr.RatingMPAA = Trim( edtMPAA.Text )
		  
		  TVAttr.DescriptionTagline = Trim( edtTagline.Text )
		  TVAttr.DescriptionOutline = Trim( edtOutline.Text )
		  TVAttr.DescriptionPlot    = Trim( edtPlot.Text    )
		  
		  // Studios
		  ReDim TVAttr.Studios(-1)
		  For i as Integer = 0 to lstStudios.ListCount - 1
		    TVAttr.Studios.Append Trim( lstStudios.Cell( i, 0 ) )
		  Next
		  
		  // Genres
		  ReDim TVAttr.Genres(-1)
		  Dim GenreStr as String = edtGenres.Text
		  While GenreStr.InStr( 0, ", " ) > 0
		    GenreStr = GenreStr.ReplaceAll( ", ", "," )
		  Wend
		  TVAttr.Genres = Trim( GenreStr ).Split(",")
		  
		  // Tags
		  ReDim TVAttr.Tags(-1)
		  Dim TagStr as String = edtTags.Text
		  While TagStr.InStr( 0, ", " ) > 0
		    TagStr = TagStr.ReplaceAll( ", ", "," )
		  Wend
		  TVAttr.Tags = Trim( TagStr ).Split(",")
		  
		  // Countries
		  'ReDim TVAttr.Countries(-1)
		  'Dim CountryStr as String = edtCountries.Text
		  'While CountryStr.InStr( 0, ", " ) > 0
		  'CountryStr = Trim( CountryStr.ReplaceAll( ", ", "," ) )
		  'Wend
		  'TVAttr.Countries = CountryStr.Split(",")
		  
		  // ----- People
		  ReDim TVAttr.Actor_ID(-1)
		  ReDim TVAttr.Actor_Name(-1)
		  ReDim TVAttr.Actor_Role(-1)
		  ReDim TVAttr.Actor_ThumbURL(-1)
		  
		  For i as Integer = 0 to lstActors.ListCount - 1
		    TVAttr.Actor_ID.Append       lstActors.Cell(i, 3)
		    TVAttr.Actor_Name.Append     lstActors.Cell(i, 0)
		    TVAttr.Actor_Role.Append     lstActors.Cell(i, 1)
		    TVAttr.Actor_ThumbURL.Append lstActors.Cell(i, 2)
		  Next
		  
		  If edtDirector.Text <> "" Then TVAttr.CreditDirector = Trim( edtDirector.Text )
		  If edtWriter.Text   <> "" Then TVAttr.CreditWriter   = Trim( edtWriter.Text )
		  If edtSound.Text    <> "" Then TVAttr.CreditMusic    = Trim( edtSound.Text )
		  
		  
		  // Write NFO
		  TVAttr.NFOWrite( TVAttr.FolderParent )
		  
		  // ----- AutoManage Media
		  If Modified And Preferences.Prefs.boolForKey("AutoManageMedia") Then
		    CommonCore.MassSearch = True
		    SingleRenamer TVAttr.FolderParent, -1, True // 18
		    CommonCore.MassSearch = False
		  End if
		  Modified = False
		  
		  
		  wndMain.lstTVShows.UpdateRow( -1, TVAttr.FolderParent )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SwitchPanels(Index as Integer)
		  UpdateStatus.Mode = timer.ModeOff
		  thrRecommendations.Mode = timer.ModeOff
		  scktActor.Close
		  
		  'Index = Index -1
		  
		  // Reset tab buttons
		  'If App.ScalingFactor = 2 Then
		  'ToolButton( tbMetaEditor.Item( 1 ) ).Icon = tb_metasummary2x
		  'ToolButton( tbMetaEditor.Item( 2 ) ).Icon = tb_metainfo2x
		  'ToolButton( tbMetaEditor.Item( 3 ) ).Icon = tb_metapeople2x
		  'ToolButton( tbMetaEditor.Item( 4 ) ).Icon = tb_metaimages2x
		  'ToolButton( tbMetaEditor.Item( 5 ) ).Icon = tb_themesong2x
		  'ToolButton( tbMetaEditor.Item( 6 ) ).Icon = tb_metarecmovies2x
		  'Else
		  'ToolButton( tbMetaEditor.Item( 1 ) ).Icon = tb_metasummary
		  'ToolButton( tbMetaEditor.Item( 2 ) ).Icon = tb_metainfo
		  'ToolButton( tbMetaEditor.Item( 3 ) ).Icon = tb_metapeople
		  'ToolButton( tbMetaEditor.Item( 4 ) ).Icon = tb_metaimages
		  'ToolButton( tbMetaEditor.Item( 5 ) ).Icon = tb_themesong
		  'ToolButton( tbMetaEditor.Item( 6 ) ).Icon = tb_metarecmovies
		  'End If
		  
		  
		  // Push tab button
		  'Dim tb as ToolButton = ToolButton( tbMetaEditor.Item( Index + 1 ) )
		  '
		  'Select Case Index +1
		  '
		  'Case 1
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
		  'If App.ScalingFactor = 2 Then
		  'tb.Icon = tb_themesongselected2x
		  'Else
		  'tb.Icon = tb_themesongselected
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
		  
		  
		  // Set ppTabs
		  SmoothResize( self, self.Width, SepArray( Index ).Top + SepArray( Index ).Height + 55, 4 )
		  Self.Height = SepArray( Index ).Top + SepArray( Index ).Height + 54 // To make sure that the controls move correctly
		  
		  ppTabs.Value = Index
		  
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
		Modified As Boolean = False
	#tag EndProperty


	#tag Constant, Name = lblThemesongMessage, Type = String, Dynamic = True, Default = \"If left empty\x2C ViMediaManager will try to find a theme song on it\'s own.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"If left empty\x2C ViMediaManager will try to find a theme song on it\'s own."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Als dit veld leeg gelaten wordt\x2C dan zal ViMediaManager zelf proberen een thema liedje te vinden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Laissez vide pour que ViMediaManager recherche le g\xC3\xA9n\xC3\xA9rique par lui-m\xC3\xAAme."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Bleibt das Feld leer\x2C versucht  ViMediaManager selbstt\xC3\xA4tig nach der Titelmelodie zu suchen."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Om l\xC3\xA4mnad tom kommer ViMediaManager att f\xC3\xB6rs\xC3\xB6ka hitta temamusik."
	#tag EndConstant


#tag EndWindowCode

#tag Events CancelSave
	#tag Event
		Sub ActionCancel()
		  wndMain.lstTVShows.UpdateRow()
		  wndMain.cvsTVShowDetails.Reload()
		  Self.Close
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
		  Preferences.Prefs.integerForKey("NSWindow MetadataTVShow Tab") = Me.Value
		  
		  'SmoothResize( self, self.Width, SepArray( ppTabs.Value ).Top + SepArray( ppTabs.Value ).Height + 55, 4 )
		  'Self.Height = SepArray( ppTabs.Value ).Top + SepArray( ppTabs.Value ).Height + 54 // To make sure that the controls move correctly
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsSummaryPoster
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If TVAttr.ART_Poster <> Nil Then
		    g.ScaleImage TVAttr.ART_Poster, Me.Width, Me.Height
		    
		    g.ForeColor = &c000000
		    g.DrawRect 0, 0, ScaledDim( TVAttr.ART_Poster, Me.Width, Me.Height, True ), ScaledDim( TVAttr.ART_Poster, Me.Width, Me.Height, False )
		  Else
		    g.ForeColor = &cFFFFFF
		    g.FillRect 0, 0, Me.Width, Me.Height
		    
		    // Split sentence on linebreak, and draw each in center.
		    Dim TextTop as Integer = ( Me.Height / 2 ) - ( g.TextSize * 2 )
		    Dim part1, part2 as String
		    part1 = Trim( Loc.kNoPosterAvailable.Left( Loc.kNoPosterAvailable.InStr( 0, chr(13) ) ) )
		    part2 = Trim( Loc.kNoPosterAvailable.ReplaceAll( part1, "" ) )
		    
		    g.ForeColor = &cAAAAAA
		    g.DrawString part1, ( Me.Width / 2 ) - ( g.StringWidth( part1 ) / 2 ), TextTop, Me.Width, False
		    TextTop = TextTop + g.TextSize + 2
		    g.DrawString part2, ( Me.Width / 2 ) - ( g.StringWidth( part2 ) / 2 ), TextTop, Me.Width, False
		    
		    
		    g.ForeColor = &c000000
		    g.DrawRect 0, 0, Me.Width, Me.Height
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsSummaryLogo
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  If TVAttr.ART_Logo = Nil Then
		    g.TextSize = 16
		    g.Bold = True
		    if Globals.IsDarkMode then
		      g.ForeColor = &cFFFFFF
		    End If
		    g.DrawString( TVAttr.Title, 0, g.TextSize )
		  Else
		    g.DrawPicture( TVAttr.ART_Logo, 0, 0, ScaledDim( TVAttr.ART_Logo, TVAttr.ART_Logo.Width, g.Height ), g.Height,   0, 0, TVAttr.ART_Logo.Width, TVAttr.ART_Logo.Height )
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsSummaryBanner
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  If TVAttr.ART_Banner <> Nil Then
		    Dim BannerWidth as Double = ScaledDim( TVAttr.ART_Banner, TVAttr.ART_Banner.Width, g.Height )
		    g.DrawPicture( TVAttr.ART_Banner, 0, 0, BannerWidth, g.Height,   0, 0, TVAttr.ART_Banner.Width, TVAttr.ART_Banner.Height )
		    g.DrawRect( 0, 0, BannerWidth, g.Height )
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtTitle
	#tag Event
		Sub TextChange()
		  Modified = ( Preferences.Prefs.stringForKey("RenameStringTVShows").InStr(0, "$T") > 0 And TVAttr.Title <> Trim( Me.Text ) )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtYear
	#tag Event
		Sub TextChange()
		  Modified = ( Preferences.Prefs.stringForKey("RenameStringTVShows").InStr(0, "$Y") > 0 And Str( TVAttr.DateYear ) <> Me.Text )
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
#tag Events edtRating
	#tag Event
		Sub TextChange()
		  Modified = ( Preferences.Prefs.stringForKey("RenameStringTVShows").InStr(0, "$#") > 0 And Str( TVAttr.Rating ) <> Me.Text )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtTitleSort
	#tag Event
		Sub TextChange()
		  Modified = ( Preferences.Prefs.stringForKey("RenameStringTVShows").InStr(0, "$S") > 0 And TVAttr.TitleSort <> Trim( Me.Text ) )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtTitleOriginal
	#tag Event
		Sub TextChange()
		  Modified = ( Preferences.Prefs.stringForKey("RenameStringTVShows").InStr(0, "$O") > 0 And TVAttr.TitleOriginal <> Trim( Me.Text ) )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events udDate
	#tag Event
		Sub Up()
		  Dim DatePremiered() as String = edtPremiere.Text.Split("-")
		  
		  // Append month/day if it's too short.
		  If DatePremiered.Ubound = 0 Then
		    DatePremiered.Append "1"
		    DatePremiered.Append "1"
		  Elseif DatePremiered.Ubound = 1 Then
		    DatePremiered.Append "1"
		  End If
		  
		  
		  If DatePremiered.Ubound >= 2 and Val( DatePremiered( 2 ) ) < 31 Then
		    DatePremiered( 2 ) = Str( Val( DatePremiered( 2 ) ) + 1 )
		    
		  ElseIf DatePremiered.Ubound >= 2 and Val( DatePremiered( 2 ) ) >= 31 And Val( DatePremiered( 1 ) ) < 12 Then
		    DatePremiered( 2 ) = "1"
		    DatePremiered( 1 ) = Str( Val( DatePremiered( 1 ) ) + 1 )
		    
		  ElseIf DatePremiered.Ubound >= 2 and Val( DatePremiered( 2 ) ) >= 31 And Val( DatePremiered( 1 ) ) >= 12 Then
		    DatePremiered( 2 ) = "1"
		    DatePremiered( 1 ) = "1"
		    DatePremiered( 0 ) = Str( Val( DatePremiered( 0 ) ) + 1 )
		    
		  ElseIf DatePremiered.Ubound >= 0 and DatePremiered( 0 ).Val >= 9999 Then
		    DatePremiered(2) = Str(5)
		    DatePremiered(1) = Str(9)
		    DatePremiered(0) = Str(1986)
		  else
		    Redim DatePremiered(2)
		    DatePremiered(2) = Str(5)
		    DatePremiered(1) = Str(9)
		    DatePremiered(0) = Str(1986)
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
		  
		  // Append month/day if it's too short.
		  If DatePremiered.Ubound = 0 Then
		    DatePremiered.Append "1"
		    DatePremiered.Append "1"
		  Elseif DatePremiered.Ubound = 1 Then
		    DatePremiered.Append "1"
		  End If
		  
		  If DatePremiered.Ubound >= 2 and Val( DatePremiered( 2 ) ) > 1 Then
		    DatePremiered( 2 ) = Str( Val( DatePremiered( 2 ) ) - 1 )
		    
		  ElseIf DatePremiered.Ubound >= 2 and Val( DatePremiered( 2 ) ) <= 1 And Val( DatePremiered( 1 ) ) > 1 Then
		    DatePremiered( 2 ) = "31"
		    DatePremiered( 1 ) = Str( Val( DatePremiered( 1 ) ) - 1 )
		    
		  ElseIf DatePremiered.Ubound >= 2 and Val( DatePremiered( 2 ) ) <= 1 And Val( DatePremiered( 1 ) ) <= 1 And Val( DatePremiered( 0 ) ) > 0 Then
		    DatePremiered( 2 ) = "31"
		    DatePremiered( 1 ) = "12"
		    DatePremiered( 0 ) = Str( Val( DatePremiered( 0 ) ) - 1 )
		    
		  ElseIf DatePremiered.Ubound >= 2 and Val( DatePremiered( 2 ) ) <= 1 And Val( DatePremiered( 1 ) ) <= 1 And Val( DatePremiered(0) ) <= 1 Then
		    DatePremiered(2) = Str(5)
		    DatePremiered(1) = Str(9)
		    DatePremiered(0) = Str(1986)
		  else
		    Redim DatePremiered(2)
		    DatePremiered(2) = Str(5)
		    DatePremiered(1) = Str(9)
		    DatePremiered(0) = Str(1986)
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
#tag Events edtNetwork
	#tag Event
		Sub TextChange()
		  Modified = ( Preferences.Prefs.stringForKey("RenameStringTVShows").InStr(0, "$S") > 0 And TVAttr.TitleSort <> Trim( Me.Text ) )
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
		  
		  For i as Integer = 0 to TVAttr.DescriptionTaglines.Ubound
		    base.Append New MenuItem( TVAttr.DescriptionTaglines(i) )
		    base.Child( TVAttr.DescriptionTaglines(i) ).Checked = ( edtTagline.Text.InStr( 0, TVAttr.DescriptionTaglines(i) ) > 0 )
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
		    base.Append New MenuItem ( "TV-G"  )
		    base.Append New MenuItem ( "TV-PG" )
		    base.Append New MenuItem ( "TV-14" )
		    base.Append New MenuItem ( "TV-MA" )
		    
		    base.Append New MenuItem ( "TV-Y7" )
		    base.Append New MenuItem ( "TV-Y"  )
		    base.Append New MenuItem ( "TV-Y7FV" )
		    
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
		    base.Append New MenuItem( "Kijkwijzer: AL" )
		    base.Append New MenuItem( "Kijkwijzer: 6"  )
		    base.Append New MenuItem( "Kijkwijzer: 9"  )
		    base.Append New MenuItem( "Kijkwijzer: 12" )
		    base.Append New MenuItem( "Kijkwijzer: 16" )
		    
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
#tag Events popImageMode
	#tag Event
		Sub Change()
		  Dim f as FolderItem
		  Dim m as String
		  
		  Select Case Me.ListIndex
		    
		  Case 0
		    f = FindImagePoster( TVAttr.FolderParent )
		    m = "Poster"
		  Case 1
		    f = FindImageFanart( TVAttr.FolderParent )
		    m = "Fanart"
		  Case 2
		    f = FindImageBanner( TVAttr.FolderParent )
		    m = "Banner"
		    
		  Case 4
		    f = TVAttr.FolderParent.Child( "logo.png" )
		    m = "Logo"
		  Case 5
		    f = TVAttr.FolderParent.Child( "clearart.png" )
		    m = "ClearArt"
		  Case 6
		    f = TVAttr.FolderParent.Child( "landscape.jpg" )
		    m = "Thumb"
		  Case 7
		    f = TVAttr.FolderParent.Child( "character.png" )
		    m = "CharacterArt"
		    
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
		  If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Return
		  
		  Dim f, k as FolderItem
		  
		  Dim DBID as String = TVAttr.ID_IMDb
		  If DBID = "" Then DBID = TVAttr.ID_TVDB
		  
		  Select Case popImageMode.ListIndex
		    
		  Case 0
		    f = FindImagePoster( TVAttr.FolderParent )
		    k = Preferences.fAppSupport.Child("Cache").Child( DBID + ".television.poster.jpg" )
		  Case 1
		    f = FindImageFanart( TVAttr.FolderParent )
		    k = Preferences.fAppSupport.Child("Cache").Child( DBID + ".television.fanart.jpg" )
		  Case 2
		    f = FindImageBanner( TVAttr.FolderParent )
		    
		  Case 4
		    f = TVAttr.FolderParent.Child( "logo.png" )
		  Case 5
		    f = TVAttr.FolderParent.Child( "clearart.png" )
		  Case 6
		    f = TVAttr.FolderParent.Child( "landscape.jpg" )
		  Case 7
		    f = TVAttr.FolderParent.Child( "Character.jpg" )
		    
		  End Select
		  
		  
		  If f <> Nil And f.Exists Then
		    If MsgDlg( Self, 1, Loc.msgDeleteImage, Loc.kCantBeUndone, Loc.kDelete, Loc.dlgCancel ) = 2 Then Return
		    If f.IsNetworkVolume Then f.Delete Else f.MoveToTrash()
		    If k <> Nil and k.Exists Then
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
		    f = FindImagePoster( TVAttr.FolderParent )
		  Case 1
		    CommonCore.GetImageBackdrop
		    f = FindImageFanart( TVAttr.FolderParent )
		  Case 2
		    CommonCore.GetImageBanner
		    f = FindImageBanner( TVAttr.FolderParent )
		    
		  Case 4
		    CommonCore.GetImageLogo
		    f = TVAttr.FolderParent.Child( "logo.png" )
		  Case 5
		    CommonCore.GetImageClearArt
		    f = TVAttr.FolderParent.Child( "clearart.png" )
		  Case 6
		    CommonCore.GetImageThumb
		    f = TVAttr.FolderParent.Child( "landscape.jpg" )
		  Case 7
		    CommonCore.GetImageCharacterArt
		    f = TVAttr.FolderParent.Child( "character.png" )
		    
		  End Select
		  
		  If f <> Nil and f.Exists Then
		    cvsExtraArtPreviewer.Reload Picture.Open( f )
		    btnDeleteArt.Enabled = True
		  Else
		    cvsExtraArtPreviewer.Reload Nil
		    btnDeleteArt.Enabled = False
		  End If
		  
		  'wndMain.lstTVShows.Enabled = False
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
#tag Events cvsExtraArtPreviewer
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  Dim f as FolderItem
		  
		  Select Case popImageMode.Index
		    
		  Case 0
		    f = FindImagePoster( TVAttr.FolderParent )
		  Case 1
		    f = FindImageFanart( TVAttr.FolderParent )
		  Case 2
		    f = FindImageBanner( TVAttr.FolderParent )
		    
		  Case 4
		    f = TVAttr.FolderParent.Child( "logo.png" )
		  Case 5
		    f = TVAttr.FolderParent.Child( "clearart.png" )
		  Case 6
		    f = TVAttr.FolderParent.Child( "landscape.jpg" )
		  Case 7
		    f = TVAttr.FolderParent.Child( "character.png" )
		    
		  End Select
		  
		  If f <> Nil And f.Exists Then f.Launch
		End Sub
	#tag EndEvent
	#tag Event
		Sub ObjectDropped()
		  Dim f as FolderItem
		  
		  Select Case popImageMode.Index
		    
		  Case 0
		    f = FindImagePoster( TVAttr.FolderParent )
		  Case 1
		    f = FindImageFanart( TVAttr.FolderParent )
		  Case 2
		    f = FindImageBanner( TVAttr.FolderParent )
		    
		  Case 4
		    f = TVAttr.FolderParent.Child( "logo.png" )
		  Case 5
		    f = TVAttr.FolderParent.Child( "clearart.png" )
		  Case 6
		    f = TVAttr.FolderParent.Child( "landscape.jpg" )
		  Case 7
		    f = TVAttr.FolderParent.Child( "character.png" )
		    
		  End Select
		  
		  btnDeleteArt.Enabled = f <> Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub Activate()
		  
		  Dim f as FolderItem
		  
		  Select Case popImageMode.ListIndex
		    
		  Case 0
		    f = FindImagePoster( TVAttr.FolderParent )
		  Case 1
		    f = FindImageFanart( TVAttr.FolderParent )
		  Case 2
		    f = FindImageBanner( TVAttr.FolderParent )
		    
		  Case 4
		    f = TVAttr.FolderParent.Child( "logo.png" )
		  Case 5
		    f = TVAttr.FolderParent.Child( "clearart.png" )
		  Case 6
		    f = TVAttr.FolderParent.Child( "landscape.jpg" )
		  Case 7
		    f = TVAttr.FolderParent.Child( "character.png" )
		    
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
#tag Events lstRecShows
	#tag Event
		Sub Change()
		  thrRecommendations.Reset
		  thrRecommendations.Mode = timer.ModeSingle 'Kill
		  'thrRecommendations.Run
		  
		  popGetRecomended.Visible = lstRecShows.ListIndex > -1
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
		  For i as Integer = 0 to TVAttr.RecShow_IDs.Ubound
		    
		    Select Case Me.Cell( row, 0 )
		      
		    case "TVDB"
		      If TVAttr.RecShow_IDs(i).Left(2) <> "tt" Then
		        Me.AddRow TVAttr.RecShows(i), TVAttr.RecShow_IDs(i)
		      End If
		      
		      
		    case "IMDb"
		      If TVAttr.RecShow_IDs(i).Left(2) = "tt" Then
		        Me.AddRow TVAttr.RecShows(i), TVAttr.RecShow_IDs(i)
		      End If
		      
		      
		    End Select
		    
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
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
		  If Me.RowTag( Me.ListIndex ) = "Folder" OR thrRecommendations.mode = timer.ModeSingle Then Return False
		  
		  Dim imdbID as String = lstRecShows.SelCol( 1 )
		  Dim tvdbID as String = lstRecShows.SelCol( 2 )
		  Dim Title  as String = lstRecShows.SelCol( 0 )
		  Dim TitleOriginal as String = lstRecShows.SelCol( 12 )
		  Dim ReleaseDate as String = "" 'lstRecShows.SelCol( 5 )
		  Dim HomePageURL as String ' = lstRecShows.SelCol( 13 )
		  
		  PopUpWebMenu imdbID, tvdbID, Title, TitleOriginal, ReleaseDate, HomePageURL
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
		  If lstRecShows.ListCount <= 0 Then g.DrawString Loc.kUpdateTVShow + ".", 20, 20
		  
		  
		  // ## Backdrop
		  Dim Backdrop as Picture
		  If lstRecShows.ListIndex > -1 Then Backdrop = lstRecShows.CellTag( lstRecShows.ListIndex, 10 )
		  If Backdrop = Nil Then Backdrop = IMGtvshows
		  
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
		  
		  If lstRecShows.ListIndex = -1 Then Return
		  
		  // ## Poster
		  Dim Poster as Picture = lstRecShows.CellTag( lstRecShows.ListIndex, 9 )
		  If Poster <> Nil Then
		    g.DrawPicture posterbg, -32, 2
		    g.DrawPicture Poster, 53 - 32, 16 + 2, 145, 217, 0, 0, Poster.Width, Poster.Height
		  End If
		  
		  // ## Banner
		  Dim Banner as Picture = lstRecShows.CellTag( lstRecShows.ListIndex, 11 )
		  If Banner <> Nil Then
		    Me.DrawBanner( g, Banner )
		  End If
		  
		  'Dim TextTop as Integer = 13
		  'Dim TextLeft as Integer = 20
		  'If Poster <> Nil Then TextLeft = 184
		  '
		  'Dim Title as String = lstRecShows.Cell( lstRecShows.ListIndex, 0 )
		  'Dim OriginalTitle as String = lstRecShows.Cell( lstRecShows.ListIndex, 12 )
		  '
		  'Dim DateYear as Integer = Val( lstRecShows.Cell( lstRecShows.ListIndex, 5 ).Left(4) )
		  'If DateYear < 1000 Then DateYear = Val( lstRecShows.Cell( lstRecShows.ListIndex, 5 ).Right(4) )
		  'If DateYear < 1000 Then DateYear = -1
		  '
		  'g.TextSize = 18
		  'g.Bold = True
		  'TextTop = TextTop + g.TextSize
		  '
		  '// ## Write Title
		  'If Title <> "" And DateYear > 0 Then
		  '
		  'Dim DisplayTitle as String = Title
		  'If DateYear > 0 Then DisplayTitle = Title + " (" + Str( DateYear ) + ")"
		  '
		  'g.ForeColor = &cFFFFFF
		  'g.DrawString DisplayTitle, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False // Title - HiLite
		  '
		  'g.ForeColor = &c333333
		  'g.DrawString DisplayTitle, TextLeft, TextTop, Me.Width - TextLeft - 20, False // Title
		  '
		  'g.ForeColor = &c999999
		  '
		  'TextTop = TextTop + g.StringHeight( DisplayTitle, Me.Width - TextLeft - 20 ) - 4
		  'Else
		  '
		  'g.ForeColor  = &cFFFFFF
		  'g.DrawString Title, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		  '
		  'g.ForeColor  = &c333333
		  'g.DrawString Title, TextLeft, TextTop, Me.Width - TextLeft - 20, False
		  '
		  'TextTop = TextTop + g.StringHeight( Title, Me.Width - TextLeft - 20 ) - 4
		  'End If
		  '
		  '
		  '// ## Write Original Title
		  'If OriginalTitle <> "" And Title <> OriginalTitle Then
		  'g.TextSize = 14
		  '
		  'g.ForeColor = &CFFFFFF
		  'g.DrawString OriginalTitle, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		  '
		  'g.ForeColor = &c666666
		  'g.DrawString OriginalTitle, TextLeft, TextTop, Me.Width - TextLeft - 20, False
		  '
		  'TextTop = TextTop + g.StringHeight( OriginalTitle, Me.Width - TextLeft - 20 )
		  'End If
		  '
		  'g.Bold     = False
		  'g.Italic   = True
		  'g.TextSize = 12
		  '
		  '// ## Write Tagline
		  'Dim Tagline as String = lstRecShows.Cell( lstRecShows.ListIndex, 3 )
		  'If Tagline <> "" Then
		  'g.ForeColor = &cFFFFFF
		  'g.DrawString Tagline, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		  'g.ForeColor = &c33333320
		  'g.DrawString Tagline, TextLeft, TextTop,     Me.Width - TextLeft - 20, False
		  '
		  'TextTop = TextTop + 4 + g.StringHeight( Tagline, Me.Width - TextLeft - 20 )
		  'End If
		  '
		  '
		  '// ## Write Duration - Genre(s) - Premiere
		  'Dim SubTagline as String
		  'g.Italic = False
		  '
		  'Dim Duration as String = lstRecShows.Cell( lstRecShows.Listindex, 6 )
		  'Dim Genres   as String = lstRecShows.Cell( lstRecShows.ListIndex, 7 )
		  'Dim Premiere as String = lstRecShows.Cell( lstRecShows.ListIndex, 5 )
		  '
		  '// Duration
		  'If Val( Duration ) > 0 Then SubTagline = PrettyTime( Val( Duration ) ) + " "
		  '
		  '// Genre(s)
		  'If SubTagline <> "" Then SubTagline = SubTagline + "- "
		  'If Genres <> "" Then SubTagline = SubTagline + Trim( Genres.ReplaceAll(", ", " | ") ) + " "
		  '
		  '// Premiere
		  'If Genres <> "" Then SubTagline = SubTagline + "- "
		  'If Premiere <> "" Then SubTagline = SubTagline + PrettyDate( Premiere, True )
		  '
		  '// Write
		  'If SubTagline <> "" Then
		  'g.Bold = True
		  '
		  'g.ForeColor = &cFFFFFF
		  'g.DrawString SubTagline, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, True
		  '
		  'g.ForeColor = &c555555
		  'g.DrawString SubTagline, TextLeft, TextTop,     Me.Width - TextLeft - 20, True
		  '
		  'g.Bold = False
		  '
		  'TextTop = TextTop + ( 18 * 2 )
		  'End If
		  '
		  '// ## Write Plot
		  'Dim Plot as String = lstRecShows.Cell( lstRecShows.Listindex, 4 )
		  'If Plot <> "" Then
		  '
		  'g.ForeColor = &cFFFFFF
		  'g.DrawString Plot, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		  '
		  'g.ForeColor = &c333333
		  'g.DrawString Plot, TextLeft, TextTop, Me.Width - TextLeft - 20, False
		  '
		  'TextTop = TextTop + g.StringHeight( Plot, Me.Width - TextLeft - 20 ) + 12
		  'End If
		  '
		  '// ## MetaTags
		  'Dim Rating as Double = Val( lstRecShows.Cell( lstRecShows.ListIndex, 8 ) )
		  '
		  'Dim MPAA as String = lstRecShows.Cell( lstRecShows.ListIndex, 12 )
		  '
		  '
		  '// ## Kijkwijzer
		  'If MPAA <> "" Then
		  'Dim Kijkwijzer() as Picture = MPAA2Themes( MPAA )
		  'Dim ImageLeft as Integer = Me.Width - 50 - 40
		  'Dim ImageTop as Integer = Me.Height - 10 - 40
		  '
		  'If Kijkwijzer.Ubound > 0 Then
		  'For i as Integer = 0 to Kijkwijzer.Ubound
		  'g.DrawPicture Kijkwijzer(i), ImageLeft, ImageTop, 40, 40,   0, 0, Kijkwijzer(i).Width, Kijkwijzer(i).Height
		  'ImageLeft = ImageLeft - 40 - 5
		  'Next
		  '
		  'End If
		  '
		  'End If
		  '
		  '
		  'Dim TagsLeft as Integer = 20
		  'g.ForeColor = &cFFFFFF
		  'g.Bold = True
		  'g.TextSize = 28
		  '
		  'Dim sx2 as Integer = MPAA.InStr(0, " for ")
		  'If sx2 > 0 Then MPAA = Trim( MPAA.Left( sx2 ) )
		  '
		  '// ## MPAA
		  'If MPAA <> "" And MPAA2Logo( MPAA ) <> Nil Then
		  'g.ScaleImage MPAA2Logo( MPAA ), 75, 50, TagsLeft, Me.Height - 50 - 11
		  'TagsLeft = TagsLeft + 80
		  'End If
		  '
		  '
		  '// ## Rating
		  'If Rating > 0 Then
		  'g.ScaleImage metatagsrating, 75, 50, TagsLeft, Me.Height - 50 - 11
		  '
		  'Dim s as Integer = g.StringWidth( Str( Rating ) )
		  'g.DrawString( Str( Rating ), TagsLeft + ( (75/2) - (s/2) ), Me.Height - 50 - 11 + ( 50 - 14 ) )
		  'TagsLeft = TagsLeft + 80
		  'End If
		  
		  'Dim Provider as String = "TMDB"
		  'If lstRecShows.Cell( lstRecShows.ListIndex, 1 ) = "" Then Provider = ""
		  'If lstRecShows.Cell( lstRecShows.ListIndex, 1 ).Left(2) = "tt" And lstRecShows.Cell( lstRecShows.ListIndex, 1 ).InStr(0, "TMDB") = 0 Then Provider = "IMDb"
		  'If lstRecShows.Cell( lstRecShows.ListIndex, 1 ).Left(2) = "tt" And lstRecShows.Cell( lstRecShows.ListIndex, 1 ).InStr(0, "RottenTomatoes") > 0 Then Provider = "RottenTomatoes"
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
		  'g.ForeColor = &cC3C3C3
		  'g.DrawLine 0, me.Height - 1, me.Width, me.Height - 1
		  
		  
		  '#if TargetLinux then
		  // Background
		  'g.ForeColor = &cFFFFFF
		  'g.FillRect 0, 0, me.Width, me.Height
		  '
		  '// Borders
		  'g.ForeColor = &cC3C3C3
		  'g.DrawLine 0, 0, me.Width, 0
		  'g.DrawLine 0, me.Height - 1, me.Width, me.Height - 1
		  
		  'g.ForeColor = &c666666
		  'g.TextSize = 14
		  'If lstRecShows.ListCount <= 0 Then g.DrawString Loc.kUpdateTVShowMovie + ".", 20, 20
		  
		  
		  // ## Backdrop
		  'Dim Backdrop as Picture
		  'If lstRecShows.ListIndex > -1 Then Backdrop = lstRecShows.CellTag( lstRecShows.ListIndex, 10 )
		  'Me.DrawBackdrop( g, Backdrop )
		  '
		  'If lstRecShows.ListIndex = -1 Then Return
		  '
		  '// ## Poster
		  'Dim Poster as Picture = lstRecShows.CellTag( lstRecShows.ListIndex, 9 )
		  'Me.DrawPoster( g, Poster )
		  ''If Poster <> Nil Then
		  ''g.DrawPicture posterbg, -32, 2
		  ''g.DrawPicture Poster, 53 - 32, 16 + 2, 145, 217, 0, 0, Poster.Width, Poster.Height
		  ''End If  
		  '
		  '// ## Banner
		  'Dim Banner as Picture = lstRecShows.CellTag( lstRecShows.ListIndex, 11 )
		  'If Banner <> Nil Then Me.DrawBanner( g, Banner )
		  
		  Dim TextTop as Integer = 13
		  Dim TextLeft as Integer = 20
		  If Poster <> Nil Then TextLeft = 184
		  
		  Dim Title as String = lstRecShows.Cell( lstRecShows.ListIndex, 0 )
		  Dim OriginalTitle as String = lstRecShows.Cell( lstRecShows.ListIndex, 12 )
		  
		  Dim DateYear as Integer = Val( lstRecShows.Cell( lstRecShows.ListIndex, 5 ).Left(4) )
		  If DateYear < 1000 Then DateYear = Val( lstRecShows.Cell( lstRecShows.ListIndex, 5 ).Right(4) )
		  If DateYear < 1000 Then DateYear = -1
		  
		  g.TextSize = 18
		  g.Bold = True
		  TextTop = TextTop + g.TextSize
		  
		  // ## Write Title
		  If Title <> "" And DateYear > 0 Then
		    
		    Dim DisplayTitle as String = Title
		    'If DateYear > 0 Then DisplayTitle = Title + " (" + Str( DateYear ) + ")"
		    
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
		  Dim Tagline as String = lstRecShows.Cell( lstRecShows.ListIndex, 3 )
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
		  
		  Dim Duration as String = lstRecShows.Cell( lstRecShows.Listindex, 6 )
		  If Duration <> "" Then
		    If Val( Duration ) > 60 Then Duration = PrettyTime( Val( Duration ) ) Else Duration = Duration + Trim( Loc.kMinutes ).Left(1).Lowercase
		  End If
		  Dim Genres   as String = lstRecShows.Cell( lstRecShows.ListIndex, 7 )
		  Dim Premiere as String = lstRecShows.Cell( lstRecShows.ListIndex, 5 )
		  Dim Status   as String = lstRecShows.Cell( lstRecShows.ListIndex, 14 )
		  
		  // Duration
		  'If Val( Duration ) > 0 Then SubTagline = PrettyTime( Val( Duration ) ) + " "
		  SubTagline = Duration + " "
		  
		  // Status
		  If Trim( SubTagline ) <> "" And Status <> "" Then SubTagline = SubTagline + "- "
		  If Status <> "" Then SubTagline = SubTagline + Status + " "
		  
		  // Genre(s)
		  If Trim( SubTagline ) <> "" And Genres <> "" Then SubTagline = SubTagline + "- "
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
		  Dim Plot as String = lstRecShows.Cell( lstRecShows.Listindex, 4 )
		  If Plot <> "" Then
		    
		    g.ForeColor = &cFFFFFF
		    g.DrawString Plot, TextLeft, TextTop + 1, Me.Width - TextLeft - 20, False
		    
		    g.ForeColor = &c333333
		    g.DrawString Plot, TextLeft, TextTop, Me.Width - TextLeft - 20, False
		    
		    TextTop = TextTop + g.StringHeight( Plot, Me.Width - TextLeft - 20 ) + 12
		  End If
		  
		  // ## MetaTags
		  Dim Rating as Double = Val( lstRecShows.Cell( lstRecShows.ListIndex, 8 ) )
		  
		  Dim MPAA as String = lstRecShows.Cell( lstRecShows.ListIndex, 13 )
		  
		  
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
		  
		  Dim TagsTop as Integer = Me.Height - 50 - 11
		  If Banner <> Nil Then TagsTop = TagsTop - 100
		  
		  // ## MPAA
		  If MPAA <> "" And MPAA2Logo( MPAA ) <> Nil Then
		    g.ScaleImage MPAA2Logo( MPAA ), 75, 50, TagsLeft, TagsTop
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  
		  // ## Rating
		  If Rating > 0 Then
		    g.ScaleImage metatagsrating, 75, 50, TagsLeft, TagsTop
		    
		    Dim s as Integer = g.StringWidth( Str( Rating ) )
		    g.DrawString( Str( Rating ), TagsLeft + ( (75/2) - (s/2) ), TagsTop + ( 50 - 14 ) )
		    TagsLeft = TagsLeft + 80
		  End If
		  
		  'Dim Provider as String = "TMDB"
		  'If lstRecShows.Cell( lstRecShows.ListIndex, 1 ) = "" Then Provider = ""
		  'If lstRecShows.Cell( lstRecShows.ListIndex, 1 ).Left(2) = "tt" And lstRecShows.Cell( lstRecShows.ListIndex, 1 ).InStr(0, "TMDB") = 0 Then Provider = "IMDb"
		  'If lstRecShows.Cell( lstRecShows.ListIndex, 1 ).Left(2) = "tt" And lstRecShows.Cell( lstRecShows.ListIndex, 1 ).InStr(0, "RottenTomatoes") > 0 Then Provider = "RottenTomatoes"
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
		  '#endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popGetRecomended
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
		  
		  If lstRecShows.ListIndex = -1 Then Return
		  
		  Dim imdbID as String = lstRecShows.SelCol( 1 )
		  Dim tvdbID as String = lstRecShows.SelCol( 2 )
		  Dim Title  as String = lstRecShows.SelCol( 0 )
		  Dim TitleOriginal as String = lstRecShows.SelCol( 12 )
		  Dim ReleaseDate as String = "" 'lstRecShows.SelCol( 5 )
		  Dim HomePageURL as String ' = lstRecShows.SelCol( 13 )
		  
		  PopUpWebMenu imdbID, tvdbID, Title, TitleOriginal, ReleaseDate, HomePageURL
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Visible = lstRecShows.ListIndex > -1
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
		  Me.EditCell( row, column )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Dim f as FolderItem = Preferences.fAppSupport.Child("Actors").Child( Me.Cell( Me.ListIndex, 0 ).Lowercase.ReplaceAll( " ", "_" ) + ".jpg" )
		  AddRemoveActor.RemoveEnabled = ( Me.ListIndex > -1 )
		  pgActor.Visible = False
		  
		  If Me.ListIndex = ActorLastSelection Then Return
		  thrActor.Mode = Timer.ModeOff
		  scktActor.Close
		  ActorIMG = Nil
		  
		  If Me.Cell( Me.ListIndex, 0 ) <> "" And f <> Nil and F.Exists Then ActorIMG = Picture.Open( f )
		  cvsActorIMG.Reload
		  
		  
		  If ActorIMG = Nil And Me.Cell( Me.ListIndex, 2 ) <> "" And System.Network.IsConnected Then
		    pgActor.Visible = True
		    thrActor.Mode = timer.ModeSingle
		  End If
		  
		  ActorLastSelection = Me.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEpGuide
	#tag Event
		Sub Action()
		  Dim f as FolderItem = Preferences.fAppSupport.Child("EpisodeGuides").Child( TVAttr.ID_TVDB + ".json" )
		  If f <> Nil And f.Exists Then f.RevealInFinder
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Visible = DebugBuild
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtThemeURL
	#tag Event
		Sub TextChange()
		  btnSndDownload.Enabled = ( Trim( Me.Text ) <> "" OR TVAttr.ThemeSongs.Ubound > -1 )
		  btnSndPreview.Enabled = ( Trim( Me.Text ) <> "" OR TVAttr.FolderParent.Child( "theme.mp3" ).Exists )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popThemeSongs
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
		  
		  If TVAttr.ThemeSongs.Ubound > -1 Then
		    base.Append New MenuItem( "" )
		    base.Append New MenuItem( "-" )
		    
		    For i as Integer = 0 to TVAttr.ThemeSongs.Ubound
		      Dim Split() as String = TVAttr.ThemeSongs(i).Split("/")
		      Dim Name as String = Trim( Split( Split.Ubound ).ReplaceAll(".mp3","").ReplaceAll("%20"," ") )
		      
		      base.Append New MenuItem( Name, TVAttr.ThemeSongs(i) )
		    Next
		    
		  Else
		    base.Append New MenuItem( Loc.kNotAvailable )
		  End If
		  
		  Dim hitItem as MenuItem = base.PopUp
		  If hitItem = Nil Then Return
		  edtThemeURL.Text = hitItem.Tag
		  
		  btnSndPreview.Enabled = ( edtThemeURL.Text <> "" OR TVAttr.FolderParent.Child("theme.mp3").Exists )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSndPreview
	#tag Event
		Sub Action()
		  htmlSound.LoadURL( "" )
		  sndPlayer.Stop
		  sndPlayer.Movie = Nil
		  PrgSnd.Visible = True
		  
		  
		  Dim f as FolderItem = TVAttr.FolderParent.Child("theme.mp3")
		  If edtThemeURL.Text <> "" Then
		    htmlSound.LoadURL( edtThemeURL.Text )
		  ElseIf f <> Nil And f.Exists Then
		    sndPlayer.Movie = f.OpenAsMovie
		    sndPlayer.Play
		    PrgSnd.Visible = False
		  Else
		    MsgBox "Nothing to play!"
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  btnSndPreview.Enabled = ( edtThemeURL.Text <> "" OR TVAttr.FolderParent.Child("theme.mp3").Exists )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSndStop
	#tag Event
		Sub Action()
		  htmlSound.LoadURL( "" )
		  sndPlayer.Stop
		  sndPlayer.Movie = Nil
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSndDownload
	#tag Event
		Sub Action()
		  
		  If TVAttr.FolderParent.Child( "theme.mp3" ).Exists Then
		    If MsgDlg( Self, 1, Loc.msgDeleteThemeSong, Loc.kCantBeUndone, Loc.kDelete, Loc.dlgCancel ) = 1 Then
		      If TVAttr.FolderParent.IsNetworkVolume Then TVAttr.FolderParent.Child("theme.mp3").Delete Else TVAttr.FolderParent.Child( "theme.mp3" ).MoveToTrash()
		    Else
		      Return
		    End If
		  End If
		  PrgSnd.Visible = True
		  
		  Dim URL as String = Trim( edtThemeURL.Text )
		  If edtThemeURL.Text = "" And TVAttr.ThemeSongs.Ubound > -1 Then URL = TVAttr.ThemeSongs(0)
		  
		  Dim sckt as New TVDBSckt
		  If sckt.Get( URL, SpecialFolder.Temporary.Child( App.Identifier ).Child( "theme.mp3" ), Preferences.Prefs.integerForKey("TimeOut") ) Then
		    SpecialFolder.Temporary.Child( App.Identifier ).Child( "theme.mp3" ).MoveFileTo( TVAttr.FolderParent.Child( "theme.mp3" ) )
		    MsgBox Loc.kDownloadComplete
		  Else
		    MsgBox Loc.kNothingLeft
		  End If
		  PrgSnd.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEpCache
	#tag Event
		Sub Action()
		  'Dim f as FolderItem = Preferences.fAppSupport.Child("EpisodeGuides").Child( TVAttr.ID_TVDB + ".json" )
		  'If f <> Nil And f.Exists Then f.ShowInFinder
		  Dim DBID as String = TVAttr.ID_IMDb
		  If DBID = "" Then DBID = TVAttr.ID_TVDB
		  
		  CacheImageDelete( DBID )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Visible = DebugBuild
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
#tag Events btnPrevious
	#tag Event
		Sub Action()
		  UpdateStatus.Mode = timer.ModeOff
		  scktActor.Close
		  
		  If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then SaveNFO()
		  
		  If Modified Then wndMain.lstTVShows.UpdateRow
		  
		  Dim LstBox as Listbox = wndMain.lstTVShows
		  
		  If LstBox.ListIndex -1 > 0 And LstBox.RowTag( LstBox.ListIndex - 1 ) = "Folder" Then
		    LstBox.ListIndex = LstBox.ListIndex -1
		    While LstBox.ListIndex -1 > 0 And LstBox.RowTag( LstBox.ListIndex ) = "Folder"
		      LstBox.ListIndex = LstBox.ListIndex -1
		    Wend
		    
		  ElseIf LstBox.ListIndex -1 > 0 Then
		    LstBox.ListIndex = LstBox.ListIndex -1
		  End If
		  
		  If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then
		    GetNFO()
		  Else
		    Me.Push
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNext
	#tag Event
		Sub Open()
		  Me.Left = btnPrevious.Left + btnPrevious.Width + 10
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  UpdateStatus.Mode = timer.ModeOff
		  scktActor.Close
		  
		  If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then SaveNFO()
		  
		  If Modified Then wndMain.lstTVShows.UpdateRow
		  
		  Dim LstBox as Listbox = wndMain.lstTVShows
		  
		  If LstBox.ListIndex +1 < LstBox.ListCount -1 And LstBox.RowTag( LstBox.ListIndex + 1 ) = "Folder" Then
		    LstBox.ListIndex = LstBox.ListIndex +1
		    While LstBox.ListIndex +1 < LstBox.ListCount -1 And LstBox.RowTag( LstBox.ListIndex ) = "Folder"
		      LstBox.ListIndex = LstBox.ListIndex +1
		    Wend
		    
		  ElseIf LstBox.ListIndex +1 < LstBox.ListCount -1 Then
		    LstBox.ListIndex = LstBox.ListIndex +1
		  End If
		  
		  If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then
		    GetNFO()
		  ElseIf LstBox.ListIndex +1 < LstBox.ListCount -1 Then
		    Me.Push
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events htmlSound
	#tag Event
		Sub DocumentComplete(URL as String)
		  PrgSnd.Visible = False
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
		  Dim FullName as String = Trim( lstActors.Cell( lstActors.ListIndex, 0 ) ).ReplaceAll( " ", "_" ).Lowercase
		  Dim ActorIMGFolder as FolderItem = Preferences.fAppSupport.Child( "Actors" )
		  If NOT ActorIMGFolder.Exists Then ActorIMGFolder.CreateAsFolder
		  
		  Dim Name as String = Trim( lstActors.Cell( lstActors.ListIndex, 0 ) )
		  Dim Name_Parts() as String = Name.Split(" ")
		  Dim LastName  as String = Name_Parts( Name_Parts.Ubound )
		  Dim FirstName as String = Trim( Name.ReplaceAll( LastName, "" ) ).ReplaceAll( " ", "_" ).Lowercase
		  
		  If lstActors.ListIndex > -1 And FullURL.Left(4) = "http" Then
		    dim sckt as new HTTPSocket
		    sckt.Yield = True
		    
		    dim data as String = sckt.Get( FullURL, 30 )
		    
		    if data.Contains("<H1>ERROR</H1>") then
		      Break
		    elseif data <> "" then
		      ActorIMG = Picture.FromData( data )
		    end if
		    
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
#tag Events UpdateStatus
	#tag Event
		Sub Action()
		  prgStatusUpdate.Visible = True
		  TVCore.ShowStatus( TVAttr.Title, TVAttr.ID_TVDB )
		  TVAttr.NFOWrite( TVAttr.FolderParent )
		  
		  Dim Date as String = TVAttr.NextAired_Date.NthField( "T", 1 )
		  Dim Time as String = TVAttr.NextAired_Date.NthField( "T", 2 ).NthField( "G", 1 )
		  Dim GMT  as String = TVAttr.NextAired_Date.NthField( "T", 2 ).NthField( "G", 2 )
		  
		  'If TVAttr.LastAired_Episode <> "" Then lblPrevEpisode.Text = TVAttr.LastAired_Episode Else lblPrevEpisode.Text = Loc.kNotAvailable
		  lblPrevEpisode.Text = TVAttr.LastAired_Episode
		  lblNextEpisode.Text = TVAttr.NextAired_Episode
		  If TVAttr.NextAired_Date <> "" Then lblNextEpisodeDate.Text = PrettyDate( Date, False ) + " | " + Time + " GMT " + GMT Else lblNextEpisodeDate.Text = ""
		  prgStatusUpdate.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thrRecommendations
	#tag Event
		Sub Action()
		  If lstRecShows.ListIndex < 0 Then Return
		  
		  Dim ID as String = lstRecShows.Cell( lstRecShows.ListIndex, 1 )
		  
		  
		  prgRecommendations.Visible = False
		  cvsRecommendations.Reload
		  Dim JSONString as String
		  
		  // If no ID then Return
		  If ID = "" Then Return
		  If lstRecShows.CellTag( lstRecShows.ListIndex, 9 ) <> Nil And lstRecShows.CellTag( lstRecShows.ListIndex, 10 ) <> Nil And lstRecShows.CellTag( lstRecShows.ListIndex, 11 ) <> Nil Then Return
		  prgRecommendations.Visible = True
		  
		  // ## Gather Data
		  Dim Sckt as New TVDBSckt
		  Dim TVDBID as String = Sckt.IMDb2TVDB( ID )
		  
		  Dim TVDB as New JSONItem
		  If TVDBID <> "" Then
		    JSONString = DefineEncoding( Sckt.Get( TVCore.URL( "InfoShort", TVDBID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    Sckt.Close
		    If JSONString.InStr( 0, "404 Not Found" ) = 0 Then
		      'JSONString = JSONString.XML2JSON
		      'If JSONString.ValidJSON("TVDB") Then TVDB.Load( JSONString )
		      TVDB = JSONString.XML2JSON
		      If TVDB.HasName("Data") And TVDB.ToString.InStr( 0, "Series" ) > 0 And TVDB.Child("Data").HasName("Series") Then TVDB = TVDB.Child("Data").Child("Series")
		    End If
		  End If
		  
		  
		  // If it can't be found on TVDB, it may be a movie
		  Dim TMDB as New JSONItem
		  If JSONString.InStr( 0, "404 Not Found" ) > 0 Then
		    JSONString = ""
		    Dim ScktMovie as New MovieSckt
		    JSONString = DefineEncoding( Sckt.Get( ScktMovie.URL( "MovieInfo", ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    If JSONString.ValidJSON("TMDb") Then TMDB.Load( JSONString )
		  End If
		  
		  Dim IMDb as New JSONItem
		  If ID <> "" Then IMDb = GetIMDbJSON( ID, True )
		  
		  Dim English as Boolean = ( Preferences.Prefs.stringForKey("DBLanguage") = "en" OR Preferences.Prefs.stringForKey("DBLanguage") = "gb" )
		  
		  // Process Data
		  
		  // :0 Title
		  If TVDB.HasName("SeriesName") Then lstRecShows.Cell( lstRecShows.ListIndex, 0 ) = TVDB.Value("SeriesName")
		  // :1 IMDb ID
		  // :2 TVDB/TMDB ID
		  lstRecShows.Cell( lstRecShows.ListIndex, 2 ) = TVDBID
		  If TMDB.HasName("id") And TMDB.Value("id") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 2 ) = TMDB.Value("id") + " TMDB"
		  // :3 Tagline
		  If IMDb <> Nil And IMDb.HasName("TAGLINE") And IMDb.Value("TAGLINE") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 3 ) = RegExThis( IMDb.Value("TAGLINE"), "\(Series .*\)|\(Season .*\)", "" )
		  If TMDB.HasName("tagline") And TMDB.Value("tagline") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 3 ) = TMDB.Value("tagline")
		  // :4 Plot
		  Dim Plot as String
		  If TVDB.HasName("Overview") And TVDB.Value("Overview") <> "" Then Plot = TVDB.Value("Overview")
		  If TMDB.HasName("overview") And TMDB.Value("overview") <> "" Then Plot = TMDB.Value("overview")
		  If English And IMDb.HasName("STORYLINE") And IMDb.Value("STORYLINE") <> "" And Len( IMDb.Value("STORYLINE") ) > Len( Plot ) Then
		    Plot = IMDb.Value("STORYLINE")
		  End If
		  Dim sx1 as Integer = Plot.InStr( 1000, " " )
		  If sx1 > 0 Then Plot = Trim( Plot.Left( sx1 - 1 ) ) + "..."
		  lstRecShows.Cell( lstRecShows.ListIndex, 4 ) = Plot
		  
		  // :5 Premiere Date
		  If TVDB.HasName("FirstAired") Then lstRecShows.Cell( lstRecShows.ListIndex, 5 ) = TVDB.Value("FirstAired")
		  If TMDB.HasName("release_date") Then lstRecShows.Cell( lstRecShows.ListIndex, 5 ) = TMDB.Value("release_date")
		  // :6 Runtime
		  If TVDB.HasName("Runtime") Then lstRecShows.Cell( lstRecShows.ListIndex, 6 ) = TVDB.Value("Runtime")
		  If TMDB.HasName("runtime") Then lstRecShows.Cell( lstRecShows.ListIndex, 6 ) = TMDB.Value("runtime")
		  // :7 Genres
		  Dim Genres() as String
		  If TVDB.HasName("Genre") Then
		    Genres = TVDB.Value("Genre").StringValue.Split("|")
		    For i as Integer = Genres.Ubound DownTo 0
		      If Trim( Genres(i) ) = "" Then Genres.Remove(i)
		    Next
		  End If
		  If TMDB.HasName("genres") Then
		    For i as Integer = 0 to TMDB.Child("genres").Count -1
		      Genres.Append TMDB.Child("genres").Child(i).Value("name")
		    Next
		  End If
		  If English And  IMDb <> Nil And IMDb.HasName("GENRES") Then
		    For i as Integer = 0 to IMDb.Child("GENRES").Count -1
		      Genres.Append IMDb.Child("GENRES").Value(i)
		    Next
		  End If
		  Genres = RemoveDuplicatesFromArray( Genres )
		  
		  Dim GenreList as String
		  For i as Integer = 0 to Genres.Ubound
		    If i = 3 Then Exit
		    If GenreList = "" Then
		      GenreList = Genres(i)
		    Else
		      GenreList = GenreList + " | " + Genres(i)
		    End If
		  Next
		  lstRecShows.Cell( lstRecShows.ListIndex, 7 ) = GenreList
		  // :8 Rating
		  If TVDB.HasName("Rating") Then lstRecShows.Cell( lstRecShows.ListIndex, 8 ) = TVDB.Value("Rating")
		  If TMDB.HasName("vote_average") Then lstRecShows.Cell( lstRecShows.ListIndex, 8 ) = TMDB.Value("vote_average")
		  If IMDb <> Nil And IMDb.HasName("RATING") And IMDb.Value("RATING") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 8 ) = IMDb.Value("RATING")
		  
		  // :12 Original Title
		  If TVDB.HasName("SeriesName") Then lstRecShows.Cell( lstRecShows.ListIndex, 12 ) = TVDB.Value("SeriesName")
		  If TMDB.HasName("original_title") Then lstRecShows.Cell( lstRecShows.ListIndex, 12 ) = TMDB.Value("original_title")
		  If IMDb <> Nil And IMDb.HasName("ORIGINAL_TITLE") And IMDb.Value("ORIGINAL_TITLE") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 12 ) = IMDb.Value("ORIGINAL_TITLE")
		  // :13 MPAA Rating
		  If TVDB.HasName("ContentRating") Then lstRecShows.Cell( lstRecShows.ListIndex, 13 ) = TVDB.Value("ContentRating")
		  If IMDb <> Nil And IMDb.HasName("MPAA_RATING") And IMDb.Value("MPAA_RATING") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 13 ) = IMDb.Value("MPAA_RATING")
		  // :14 Status
		  If TVDB.HasName("Status") Then lstRecShows.Cell( lstRecShows.ListIndex, 14 ) = TVDB.Value("Status")
		  
		  // :9 Poster
		  cvsRecommendations.Reload
		  If IMDb <> Nil And IMDb.HasName("POSTER_LARGE") And IMDb.Value("POSTER_LARGE") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 9 ) = IMDb.Value("POSTER_LARGE")
		  If TVDB.HasName("poster") And TVDB.Value("poster") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 9 ) = TVCore.GraphicsPath + TVDB.Value("poster")
		  If TMDB.HasName("poster_path") And TMDB.Value("poster_path") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 9 ) = "http://cf2.imgobject.com/t/p/w342" + TMDB.Value("poster_path")
		  If lstRecShows.Cell( lstRecShows.ListIndex, 9 ) <> "" Then
		    dim URL as String = lstRecShows.Cell( lstRecShows.ListIndex, 9 )
		    dim posterData as String = CURLGet(URL)
		    if posterData <> "" then
		      lstRecShows.CellTag( lstRecShows.ListIndex, 9 ) = Picture.FromData( posterData )
		    End If
		  End If
		  // :10 Fanart
		  cvsRecommendations.Reload
		  If IMDb <> Nil And IMDb.HasName("MEDIA_IMAGES") And IMDb.Child("MEDIA_IMAGES").IsArray And IMDb.Child("MEDIA_IMAGES").Count > 0 Then lstRecShows.Cell( lstRecShows.ListIndex, 10 ) = IMDb.Child("MEDIA_IMAGES").Value(0)
		  If TVDB.HasName("fanart") And TVDB.Value("fanart") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 10 ) = TVCore.GraphicsPath + TVDB.Value("fanart")
		  If TMDB.HasName("backdrop_path") And TMDB.Value("backdrop_path") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 10 ) = "http://cf2.imgobject.com/t/p/w780" + TMDB.Value("backdrop_path")
		  If lstRecShows.Cell( lstRecShows.ListIndex, 10 ) <> "" Then
		    dim URL as String = lstRecShows.Cell( lstRecShows.ListIndex, 10 )
		    dim posterData as String = CURLGet(URL)
		    if posterData <> "" then
		      lstRecShows.CellTag( lstRecShows.ListIndex, 10 ) = Picture.FromData( posterData )
		    End If
		  End If
		  // :11 Banner
		  cvsRecommendations.Reload
		  If TVDB.HasName("banner") And TVDB.Value("banner") <> "" Then lstRecShows.Cell( lstRecShows.ListIndex, 11 ) = TVCore.GraphicsPath + TVDB.Value("banner")
		  If lstRecShows.Cell( lstRecShows.ListIndex, 11 ) <> "" Then
		    dim URL as String = lstRecShows.Cell( lstRecShows.ListIndex, 11 )
		    dim posterData as String = CURLGet(URL)
		    if posterData <> "" then
		      lstRecShows.CellTag( lstRecShows.ListIndex, 11 ) = Picture.FromData( posterData )
		    End If
		  End If
		  
		  Sckt.Close
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
		Name="Modified"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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

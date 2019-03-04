#tag Window
Begin Window wndEpisodeManager
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   708
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
   MinWidth        =   250
   Placement       =   3
   Resizeable      =   False
   Title           =   "#Loc.kEpisodes"
   Visible         =   True
   Width           =   900
   Begin PagePanel ppEpisodes
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   699
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      Value           =   1
      Visible         =   True
      Width           =   900
      Begin Canvas cvsShowInfo
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   128
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   0
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
         UseFocusRing    =   True
         Visible         =   True
         Width           =   350
         Begin ProgressWheel prgMarkAsWatched
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "cvsShowInfo"
            Left            =   322
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   100
            Transparent     =   False
            Visible         =   False
            Width           =   16
         End
      End
      Begin ExtraArtCanvas cvsSeasonArt
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   128
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   350
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mode            =   "Poster"
         PreviewArt      =   0
         ScaledPic       =   0
         Scope           =   0
         Season          =   -1
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   202
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   550
         Begin PopupArrow popSeason
            AutoDeactivate  =   True
            Enabled         =   True
            Facing          =   1
            Height          =   10
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "cvsSeasonArt"
            Left            =   870
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   304
            Transparent     =   False
            Visible         =   True
            Width           =   10
         End
      End
      Begin Canvas cvsEpisodeInfo
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   True
         Height          =   190
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   350
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   False
         Width           =   550
         Begin Canvas cvsMetaDataEditor
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   2119844407
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   32
            HelpTag         =   "#Loc.Metadata"
            Index           =   -2147483648
            InitialParent   =   "cvsEpisodeInfo"
            Left            =   848
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   84
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   32
         End
         Begin Canvas cvsWatchedStatus
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   1299585919
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   32
            HelpTag         =   "#Menu.CMMMarkAsWatched"
            Index           =   -2147483648
            InitialParent   =   "cvsEpisodeInfo"
            Left            =   804
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   84
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   32
         End
         Begin Canvas cvsClean
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   499747484
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   True
            Height          =   32
            HelpTag         =   "#Loc.Metadata"
            Index           =   -2147483648
            InitialParent   =   "cvsEpisodeInfo"
            Left            =   760
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   83
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   32
         End
         Begin HTMLViewer htmlPlot
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   63
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "cvsEpisodeInfo"
            Left            =   350
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Renderer        =   0
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   127
            Visible         =   True
            Width           =   550
         End
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
         InitialParent   =   "ppEpisodes"
         Left            =   680
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   666
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
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mTitle"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   300
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
         InitialParent   =   "ppEpisodes"
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
         Top             =   38
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   318
      End
      Begin UpDownArrows udRating
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   69
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   87
         Transparent     =   False
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
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "10.9"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   87
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   45
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   15
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppEpisodes"
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
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mRating"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   69
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin UpDownArrows udDate
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   264
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   86
         Transparent     =   False
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
         InitialParent   =   "ppEpisodes"
         Italic          =   False
         Left            =   162
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
         Top             =   87
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   98
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   15
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kpremiered"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   69
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
         Index           =   3
         InitialParent   =   "ppEpisodes"
         Italic          =   False
         Left            =   350
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
         Text            =   "#Loc.kPlot"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   530
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
         Height          =   169
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Italic          =   False
         Left            =   350
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
         Styled          =   True
         TabIndex        =   10
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   38
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   530
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   15
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppEpisodes"
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
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mSeasonNumber"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   507
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
         Height          =   15
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   12
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mEpisodeNumber"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   507
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   130
      End
      Begin TextField edtSeasonNumber
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
         InitialParent   =   "ppEpisodes"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "9999"
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
         Top             =   527
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   44
      End
      Begin TextField edtEpisodeNumber
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
         InitialParent   =   "ppEpisodes"
         Italic          =   False
         Left            =   162
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "9999"
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
         Top             =   527
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   44
      End
      Begin UpDownArrows upEpNr
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   210
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   527
         Transparent     =   False
         Visible         =   True
         Width           =   13
      End
      Begin UpDownArrows upSsNr
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   69
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   527
         Transparent     =   False
         Visible         =   True
         Width           =   13
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
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   18
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   185
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   318
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   27
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   19
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mWriter"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   167
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   318
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   26
         InitialParent   =   "ppEpisodes"
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
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.mDirector"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   118
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   318
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
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   21
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   136
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   318
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
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   25
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   471
         Transparent     =   False
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
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   26
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   471
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   200
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
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   27
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   268
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   718
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
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
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   29
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   471
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   313
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
         InitialParent   =   "ppEpisodes"
         Left            =   750
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   33
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   268
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
         InitialParent   =   "ppEpisodes"
         Left            =   750
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Scope           =   0
         TabIndex        =   30
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   471
         Transparent     =   False
         Value           =   0
         Visible         =   False
         Width           =   130
      End
      Begin Canvas grpSpecials
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   46
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   304
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   34
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   503
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   404
         Begin Label lblArray
            AutoDeactivate  =   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   7
            InitialParent   =   "grpSpecials"
            Italic          =   False
            Left            =   304
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "#Loc.kEMBeforeSeason"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   503
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
            Height          =   22
            HelpTag         =   ""
            Index           =   8
            InitialParent   =   "grpSpecials"
            Italic          =   False
            Left            =   446
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
            Text            =   "#Loc.kEMAfterSeason"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   503
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   130
         End
         Begin UpDownArrows udBeforeSeason
            AcceptFocus     =   False
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   23
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpSpecials"
            Left            =   352
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Top             =   526
            Transparent     =   False
            Visible         =   True
            Width           =   13
         End
         Begin TextField edtBeforeSeason
            AcceptTabs      =   False
            Alignment       =   1
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
            InitialParent   =   "grpSpecials"
            Italic          =   False
            Left            =   304
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   "9999"
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   526
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   False
            Visible         =   True
            Width           =   44
         End
         Begin TextField edtAfterSeason
            AcceptTabs      =   False
            Alignment       =   1
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
            InitialParent   =   "grpSpecials"
            Italic          =   False
            Left            =   446
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   "9999"
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   526
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   False
            Visible         =   True
            Width           =   44
         End
         Begin UpDownArrows udAfterSeason
            AcceptFocus     =   False
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   23
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpSpecials"
            Left            =   494
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            Top             =   526
            Transparent     =   False
            Visible         =   True
            Width           =   13
         End
         Begin Label lblArray
            AutoDeactivate  =   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   6
            InitialParent   =   "grpSpecials"
            Italic          =   False
            Left            =   588
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "#Loc.kEMBeforeEpisode"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   503
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
         Begin TextField edtBeforeEpisode
            AcceptTabs      =   False
            Alignment       =   1
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
            InitialParent   =   "grpSpecials"
            Italic          =   False
            Left            =   588
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   "9999"
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   527
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   False
            Visible         =   True
            Width           =   44
         End
         Begin UpDownArrows udBeforeEpisode
            AcceptFocus     =   False
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   23
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpSpecials"
            Left            =   636
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   2
            TabStop         =   True
            Top             =   526
            Transparent     =   False
            Visible         =   True
            Width           =   13
         End
      End
      Begin SuperTextfield edtGuests
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
         InitialParent   =   "ppEpisodes"
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
         Top             =   237
         Transparent     =   False
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
         Height          =   15
         HelpTag         =   ""
         Index           =   29
         InitialParent   =   "ppEpisodes"
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
         TabIndex        =   36
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#Loc.kGuests"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   219
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   860
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
         InitialParent   =   "ppEpisodes"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MyState         =   0
         Scope           =   0
         StringHeight    =   0
         StringWidth     =   0
         TabIndex        =   37
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         Top             =   584
         Transparent     =   True
         URL             =   "http://"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
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
         InitialParent   =   "ppEpisodes"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MyState         =   0
         Scope           =   0
         StringHeight    =   0
         StringWidth     =   0
         TabIndex        =   38
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         Top             =   560
         Transparent     =   True
         URL             =   "http://"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
      End
      Begin ProgressWheel prgWheel
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   652
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   39
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   669
         Transparent     =   False
         Visible         =   False
         Width           =   16
      End
      Begin HierListBox lstEpisodes
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   16
         ColumnsResizable=   True
         ColumnWidths    =   "100%, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   48
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   571
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         InitialValue    =   ""
         Italic          =   False
         Left            =   0
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
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   128
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   350
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      BeginSegmented AddRemoveButton arActor
         AddEnabled      =   False
         Enabled         =   True
         Height          =   24
         Index           =   -2147483648
         InitialParent   =   "ppEpisodes"
         Left            =   686
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacControlStyle =   6
         RemoveEnabled   =   False
         Scope           =   0
         Segments        =   "\n\nFalse\r\n\nFalse"
         SelectionType   =   2
         TabIndex        =   40
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   471
         Transparent     =   False
         Visible         =   True
         Width           =   48
      End
   End
   Begin Timer ThrMarkSeasonAsWatched
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Timer Initiate
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  If NOT Self.IsFullScreen Then Preferences.SaveWindowPos( Self, "wndEpisodeManager" )
		  
		  'thrEpisodeThumb.Kill
		  Initiate.Mode = timer.ModeOff
		  ThrMarkSeasonAsWatched.Mode = timer.ModeOff
		  scktActor.Close
		  
		  wndMain.lstTVShows.Enabled = True
		  wndMain.ProgressRunning = False
		  
		  wndMain.lstTVShows.UpdateRow
		  wndMain.cvsTVShowDetails.Reload
		  
		  ToolsMarkasWatched.Visible = False // MENU Mark as Watched
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Preferences.LoadWindowPos( Self, "wndEpisodeManager" )
		  Self.Title = TVAttr.Title + " " + Loc.kEpisodes.Lowercase
		  
		  FolderParent = TVAttr.FolderParent
		  wndMain.lstTVShows.Enabled = False
		  wndMain.ProgressRunning = True
		  
		  Initiate.Mode = Timer.ModeSingle
		  
		  ToolsMarkasWatched.Visible = True // MENU Mark as Watched
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Close
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpenInFinder() As Boolean Handles FileOpenInFinder.Action
			Dim f as FolderItem = lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 )
			If f <> Nil And f.Exists Then f.RevealInFinder
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsMarkasWatched() As Boolean Handles ToolsMarkasWatched.Action
			If lstEpisodes.RowTag( lstEpisodes.ListIndex ) = "Folder" Then
			'MarkFolder( ( ToolsMarkasWatched.Text = Menu.CMMMarkAsWatched ), lstEpisodes.CellTag( lstEpisodes.ListIndex, 0 ) )
			MarkAsWatched = ( ToolsMarkasWatched.Text = Menu.CMMMarkAsWatched )
			ThrMarkSeasonAsWatched.Mode = timer.ModeOff
			ThrMarkSeasonAsWatched.Mode = timer.ModeSingle
			Else
			MarkItem( ( ToolsMarkasWatched.Text = Menu.CMMMarkAsWatched ) )
			End If
			
			If ToolsMarkasWatched.Text = Menu.CMMMarkAsWatched Then ToolsMarkasWatched.Text = Menu.CMMMarkAsUnwatched Else ToolsMarkasWatched.Text = Menu.CMMMarkAsWatched
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewEditMetadata() As Boolean Handles ViewEditMetadata.Action
			If lstEpisodes.RowTag( lstEpisodes.ListIndex ) = "Folder" Then Return False
			ReadEpisodeNFO()
			ppEpisodes.Value = 1
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Sub GetSeasonInfo(SeasonNr as String, Mode as String = "")
		  If Mode = "" Then Mode = "SeasonPoster"
		  ReDim ArtFiles(-1)
		  
		  Dim DisplaySeason as String = SeasonNr
		  If DisplaySeason.Len = 1 Then DisplaySeason = "0" + DisplaySeason
		  
		  Dim Specials as Boolean = ( Val( DisplaySeason ) = 0 )
		  Dim All      as Boolean = ( Val( DisplaySeason ) < 0 )
		  
		  If All Then DisplaySeason = "-all"
		  If Specials Then DisplaySeason = "-specials"
		  
		  Dim SeasonFolder, ImageFile as FolderItem
		  
		  // Get Season Folder
		  'SeasonFolder = FolderParent.Child( "Season " + DisplaySeason )
		  'If Specials Then SeasonFolder = FolderParent.Child( "Specials" )
		  
		  If SeasonFolder <> Nil  And SeasonFolder.Exists And SeasonFolder.Directory Then
		    // Folder exists, don't change anything.
		  Else
		    SeasonFolder = FolderParent
		  End If
		  
		  
		  'ArtFiles.Append SeasonFolder.Child( "season" + DisplaySeason + "-poster.jpg" )
		  'ArtFiles.Append SeasonFolder.Child( "season" + DisplaySeason + "-fanart.jpg" )
		  'ArtFiles.Append SeasonFolder.Child( "season" + DisplaySeason + "-banner.jpg" )
		  'ArtFiles.Append SeasonFolder.Child( "season" + DisplaySeason + "-landscape.jpg" )
		  '
		  'Select Case Mode
		  '
		  'Case "SeasonPoster"
		  'ImageFile = SeasonFolder.Child( "season" + DisplaySeason + "-poster.jpg" )
		  'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "specials.jpg" )
		  'Case "SeasonFanart"
		  'ImageFile = SeasonFolder.Child( "season" + DisplaySeason + "-fanart.jpg" )
		  'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "specials-fanart.jpg" )
		  'Case "SeasonBanner"
		  'ImageFile = SeasonFolder.Child( "season" + DisplaySeason + "-banner.jpg" )
		  'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "specials-banner.jpg" )
		  'Case "SeasonThumb"
		  'ImageFile = SeasonFolder.Child( "season" + DisplaySeason + "-landscape.jpg" )
		  'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "specials-landscape.jpg" )
		  'End Select
		  
		  
		  // Specials YAMJ
		  If Specials And Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		    
		    ArtFiles.Append SeasonFolder.Child( "specials.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "specials.fanart.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "specials.banner.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "specials.landscape.jpg" )
		    
		    Select Case Mode
		      
		    Case "SeasonPoster"
		      ImageFile = SeasonFolder.Child( "specials.jpg" )
		    Case "SeasonFanart"
		      ImageFile = SeasonFolder.Child( "specials.fanart.jpg" )
		    Case "SeasonBanner"
		      ImageFile = SeasonFolder.Child( "specials.banner.jpg" )
		    Case "SeasonThumb"
		      ImageFile = SeasonFolder.Child( "specials.landscape.jpg" )
		      
		    End Select
		    
		    // Specials
		    'ElseIf Specials Then
		    '
		    'ArtFiles.Append SeasonFolder.Child( "season-specials-poster.jpg" )
		    'ArtFiles.Append SeasonFolder.Child( "season-specials-fanart.jpg" )
		    'ArtFiles.Append SeasonFolder.Child( "season-specials-banner.jpg" )
		    'ArtFiles.Append SeasonFolder.Child( "season-specials-landscape.jpg" )
		    '
		    'Select Case Mode
		    '
		    'Case "SeasonPoster"
		    'ImageFile = SeasonFolder.Child( "season-specials-poster.jpg" )
		    'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "specials.jpg" )
		    'Case "SeasonFanart"
		    'ImageFile = SeasonFolder.Child( "season-specials-fanart.jpg" )
		    'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "specials-fanart.jpg" )
		    'Case "SeasonBanner"
		    'ImageFile = SeasonFolder.Child( "season-specials-banner.jpg" )
		    'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "specials-banner.jpg" )
		    'Case "SeasonThumb"
		    'ImageFile = SeasonFolder.Child( "season-specials-landscape.jpg" )
		    'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "specials-landscape.jpg" )
		    'End Select
		    
		    // All YAMJ
		  ElseIf All And Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		    
		    ArtFiles.Append SeasonFolder.Child( "seasonall.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "seasonall.fanart.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "seasonall.banner.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "seasonall.landscape.jpg" )
		    
		    Select Case Mode
		      
		    Case "SeasonPoster"
		      ImageFile = SeasonFolder.Child( "seasonall.jpg" )
		    Case "SeasonFanart"
		      ImageFile = SeasonFolder.Child( "seasonall.fanart.jpg" )
		    Case "SeasonBanner"
		      ImageFile = SeasonFolder.Child( "seasonall.banner.jpg" )
		    Case "SeasonThumb"
		      ImageFile = SeasonFolder.Child( "seasonall.landscape.jpg" )
		    End Select
		    
		    // All
		    'ElseIf All Then
		    '
		    'ArtFiles.Append SeasonFolder.Child( "season-all-poster.jpg" )
		    'ArtFiles.Append SeasonFolder.Child( "season-all-fanart.jpg" )
		    'ArtFiles.Append SeasonFolder.Child( "season-all-banner.jpg" )
		    'ArtFiles.Append SeasonFolder.Child( "season-all-landscape.jpg" )
		    '
		    'Select Case Mode
		    '
		    'Case "SeasonPoster"
		    'ImageFile = SeasonFolder.Child( "season-all-poster.jpg" )
		    'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "seasonall.jpg" )
		    'Case "SeasonFanart"
		    'ImageFile = SeasonFolder.Child( "season-all-fanart.jpg" )
		    'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "seasonall-fanart.jpg" )
		    'Case "SeasonBanner"
		    'ImageFile = SeasonFolder.Child( "season-all-banner.jpg" )
		    'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "seasonall-banner.jpg" )
		    'Case "SeasonThumb"
		    'ImageFile = SeasonFolder.Child( "season-all-landscape.jpg" )
		    'If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "seasonall-landscape.jpg" )
		    'End Select
		    
		    //ElseIf YAMJ
		  ElseIf Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		    DisplaySeason = Str( Val( DisplaySeason ) )
		    
		    ArtFiles.Append SeasonFolder.Child( "season " + DisplaySeason + ".jpg" )
		    ArtFiles.Append SeasonFolder.Child( "season " + DisplaySeason + ".fanart.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "season " + DisplaySeason + ".banner.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "season " + DisplaySeason + ".landscape.jpg" )
		    
		    Select Case Mode
		      
		    Case "SeasonPoster"
		      ImageFile = SeasonFolder.Child( "season " + DisplaySeason + ".jpg" )
		    Case "SeasonFanart"
		      ImageFile = SeasonFolder.Child( "season " + DisplaySeason + ".fanart.jpg" )
		    Case "SeasonBanner"
		      ImageFile = SeasonFolder.Child( "season " + DisplaySeason + ".banner.jpg" )
		    Case "SeasonThumb"
		      ImageFile = SeasonFolder.Child( "season " + DisplaySeason + ".landscape.jpg" )
		    End Select
		    
		    // Else
		  Else
		    
		    ArtFiles.Append SeasonFolder.Child( "season" + DisplaySeason + "-poster.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "season" + DisplaySeason + "-fanart.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "season" + DisplaySeason + "-banner.jpg" )
		    ArtFiles.Append SeasonFolder.Child( "season" + DisplaySeason + "-landscape.jpg" )
		    
		    Select Case Mode
		      
		    Case "SeasonPoster"
		      ImageFile = SeasonFolder.Child( "season" + DisplaySeason + "-poster.jpg" )
		      If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "season " + DisplaySeason + ".jpg" )
		    Case "SeasonFanart"
		      ImageFile = SeasonFolder.Child( "season" + DisplaySeason + "-fanart.jpg" )
		      If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "season " + DisplaySeason + "-fanart.jpg" )
		    Case "SeasonBanner"
		      ImageFile = SeasonFolder.Child( "season" + DisplaySeason + "-banner.jpg" )
		      If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "season " + DisplaySeason + "-banner.jpg" )
		    Case "SeasonThumb"
		      ImageFile = SeasonFolder.Child( "season" + DisplaySeason + "-landscape.jpg" )
		      If ImageFile = Nil OR NOT ImageFile.Exists Then ImageFile = SeasonFolder.Child( "season " + DisplaySeason + "-landscape.jpg" )
		    End Select
		    
		  End If
		  
		  
		  
		  // Load Image
		  
		  cvsSeasonArt.Mode = Mode
		  If ImageFile IsA FolderItem Then cvsSeasonArt.Reload( Picture.Open( ImageFile ) ) Else cvsSeasonArt.Reload( Nil )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarkFolder(Watched as Boolean = True, Season as Integer)
		  'Dim Season as Integer = lstEpisodes.CellTag( lstEpisodes.ListIndex, 0 )
		  
		  If Season >= 0 Then
		    
		    For i as Integer = 0 to Episodes.Count -1
		      Dim jItem as New JSONItem
		      jItem = Episodes.Child(i)
		      
		      'lblMarkingAsWatched.Text = "S" + jItem.Value("SeasonNumber") + "E" + jItem.Value("EpisodeNumber") + " - " + jItem.Value("EpisodeName")
		      
		      // Find the corresponding episode file
		      Dim EpisodeFile as FolderItem
		      Dim Lindex as Integer
		      
		      Dim EpisodeNrs() as String
		      
		      For n as Integer = 0 to EpisodeFiles.Ubound
		        Dim OOxOO as String = RegExEpisode( EpisodeFiles(n) )
		        Dim SeasonNr as Integer = Val( OOxOO.NthField( "x", 1 ) )
		        Dim EpisodeNr as Integer = Val( OOxOO.NthField( "x", 2 ) )
		        EpisodeNrs = OOxOO.Split("x")
		        
		        If SeasonNr = Season And jItem.Value("EpisodeNumber") = EpisodeNr Then
		          EpisodeFile = EpisodeFiles(n)
		          Lindex = n
		          Exit
		        End If
		      Next
		      
		      // Don't mark if futuredate
		      Dim Today as New Date, Showdate as New Date
		      Dim ReleaseDate as String = jItem.Value("FirstAired")
		      Dim b as Boolean
		      If ReleaseDate <> "" Then
		        Showdate.Day   = Val( ReleaseDate.NthField( "-", 3 ) )
		        Showdate.Month = Val( ReleaseDate.NthField( "-", 2 ) )
		        Showdate.Year  = Val( ReleaseDate.NthField( "-", 1 ) )
		        
		        
		        b = ( Showdate.Year > Today.Year OR _
		        ( Showdate.Year = Today.Year And Showdate.Month > Today.Month ) OR _
		        ( Showdate.Year = Today.Year AND Showdate.Month = Today.Month And Showdate.Day > Today.Day ) )
		      End If
		      
		      
		      If jItem.Value("SeasonNumber") = Season And jItem.Value("FirstAired") <> "" And NOT b Then
		        // Update watched count
		        Dim WatchedCount as Integer = Val( lstEpisodes.Cell( lstEpisodes.ListIndex, 2 ) )
		        If NOT Watched Then WatchedCount = WatchedCount -1 Else WatchedCount = WatchedCount + 1
		        If jItem.Value("watched") <> Watched And WatchedCount >= 0 AND WatchedCount <= Val( lstEpisodes.Cell( lstEpisodes.ListIndex, 1 ) ) Then
		          lstEpisodes.Cell( lstEpisodes.ListIndex, 2 ) = Str( WatchedCount )
		        End If
		        
		        // Mark (Un)Watched
		        jItem.Value("watched") = Watched
		        'If EpisodeFile <> Nil And EpisodeFile.Exists Then EpisodeFiles(Lindex) = TVAttr.EpisodeNFO( jItem, EpisodeFile )
		        
		        If EpisodeFile <> Nil And EpisodeFile.Exists Then
		          Dim Multi as Boolean = ( EpisodeNrs.Ubound >= 2 )
		          
		          If NOT Multi Then
		            EpisodeFiles(Lindex) = TVAttr.EpisodeNFO( jItem, EpisodeFile )
		          Else
		            Dim MultiEpisode() as JSONItem
		            
		            For n as Integer = 1 to EpisodeNrs.Ubound
		              
		              For t as Integer = 0 to Episodes.Count -1
		                If Episodes.Child(t).HasName("SeasonNumber") And Episodes.Child(t).Value("SeasonNumber") = jItem.Value("SeasonNumber") And _
		                  Episodes.Child(t).HasName("EpisodeNumber") And Val( Episodes.Child(t).Value("EpisodeNumber") ) = Val( EpisodeNrs(n) ) Then
		                  // Add Multi-Episodes
		                  Episodes.Child(t).Value("watched") = Watched
		                  MultiEpisode.Append Episodes.Child(t)
		                End If
		              Next
		              
		            Next
		            
		            EpisodeFiles(Lindex) = TVAttr.EpisodeNFO( Nil, EpisodeFile, MultiEpisode )
		          End If
		          
		        End If
		        
		        
		      End If
		      
		      Dim s as String
		    Next
		    
		  ElseIf Season = -1 Then
		    
		    For i as Integer = 0 to Episodes.Count -1
		      Dim jItem as New JSONItem
		      jItem = Episodes(i)
		      Season = jItem.Value("SeasonNumber")
		      
		      // Find the corresponding episode file
		      Dim EpisodeFile as FolderItem
		      Dim Lindex as Integer
		      
		      Dim EpisodeNrs() as String
		      
		      For n as Integer = 0 to EpisodeFiles.Ubound
		        Dim OOxOO as String = RegExEpisode( EpisodeFiles(n) )
		        Dim SeasonNr as Integer = Val( OOxOO.NthField( "x", 1 ) )
		        Dim EpisodeNr as Integer = Val( OOxOO.NthField( "x", 2 ) )
		        EpisodeNrs = OOxOO.Split("x")
		        
		        If SeasonNr = Season And jItem.Value("EpisodeNumber") = EpisodeNr Then
		          EpisodeFile = EpisodeFiles(n)
		          Lindex = n
		          Exit
		        End If
		      Next
		      
		      // Don't mark if futuredate
		      Dim Today as New Date, Showdate as New Date
		      Dim ReleaseDate as String = jItem.Value("FirstAired")
		      Dim b as Boolean
		      If ReleaseDate <> "" Then
		        Showdate.Day   = Val( ReleaseDate.NthField( "-", 3 ) )
		        Showdate.Month = Val( ReleaseDate.NthField( "-", 2 ) )
		        Showdate.Year  = Val( ReleaseDate.NthField( "-", 1 ) )
		        
		        
		        b = ( Showdate.Year > Today.Year OR _
		        ( Showdate.Year = Today.Year And Showdate.Month > Today.Month ) OR _
		        ( Showdate.Year = Today.Year AND Showdate.Month = Today.Month And Showdate.Day > Today.Day ) )
		      End If
		      
		      // Mark
		      If jItem.Value("SeasonNumber") = Season And jItem.Value("FirstAired") <> "" And NOT b Then
		        // Find season listindex
		        Dim Sindex as Integer = 0
		        For n as Integer = 0 to lstEpisodes.ListCount -1
		          If lstEpisodes.RowTag( n ) <> "Folder" Then Continue
		          If lstEpisodes.CellTag( n, 0 ) = Str( Season ) Then
		            sindex = n
		            Exit
		          End If
		        Next
		        
		        // Update watched count
		        Dim WatchedCount as Integer = Val( lstEpisodes.Cell( Sindex, 2 ) )
		        If NOT Watched Then WatchedCount = WatchedCount -1 Else WatchedCount = WatchedCount + 1
		        If jItem.Value("watched") <> Watched And WatchedCount >= 0 AND WatchedCount <= Val( lstEpisodes.Cell( Sindex, 1 ) ) Then
		          lstEpisodes.Cell( Sindex, 2 ) = Str( WatchedCount )
		        End If
		        
		        jItem.Value("watched") = Watched
		        'If EpisodeFile <> Nil And EpisodeFile.Exists Then EpisodeFiles(Lindex) = TVAttr.EpisodeNFO( jItem, EpisodeFile )
		        
		        
		        If EpisodeFile <> Nil And EpisodeFile.Exists Then
		          Dim Multi as Boolean = ( EpisodeNrs.Ubound >= 2 )
		          
		          If NOT Multi Then
		            EpisodeFiles(Lindex) = TVAttr.EpisodeNFO( jItem, EpisodeFile )
		          Else
		            Dim MultiEpisode() as JSONItem
		            
		            For n as Integer = 1 to EpisodeNrs.Ubound
		              
		              For t as Integer = 0 to Episodes.Count -1
		                If Episodes.Child(t).HasName("SeasonNumber") And Episodes.Child(t).Value("SeasonNumber") = jItem.Value("SeasonNumber") And _
		                  Episodes.Child(t).HasName("EpisodeNumber") And Val( Episodes.Child(t).Value("EpisodeNumber") ) = Val( EpisodeNrs(n) ) Then
		                  // Add Multi-Episodes
		                  Episodes.Child(t).Value("watched") = Watched
		                  MultiEpisode.Append Episodes.Child(t)
		                End If
		              Next
		              
		            Next
		            
		            EpisodeFiles(Lindex) = TVAttr.EpisodeNFO( Nil, EpisodeFile, MultiEpisode )
		          End If
		          
		        End If
		        
		      End If
		      
		      Episodes.Value(i) = jItem
		    Next
		    
		    'For i as Integer = 0 To lstEpisodes.ListCount -1
		    'If lstEpisodes.RowTag( i ) <> "Folder" Then Continue
		    '
		    'If NOT Watched Then lstEpisodes.Cell( i, 2 ) = "0"
		    'Next
		    
		  End If
		  
		  Dim ID as String
		  If ActiveSection = 1 Then
		    ID = TVAttr.ID_TVDB
		    If ID = "" Then ID = TVAttr.ID_IMDb
		  ElseIf ActiveSection = 2 Then
		    'ID = AnimeAttr.ID_TVDB
		    'If ID = "" THen ID = AnimeAttr.ID_IMDb
		  End If
		  
		  WriteJSON( ID )
		  
		  Dim AllWatchedCount as Integer = 0
		  Dim Lindex as Integer = 0
		  For i as Integer = 0 to lstEpisodes.ListCount -1
		    If lstEpisodes.RowTag( i ) <> "Folder" Then Continue
		    AllWatchedCount = AllWatchedCount + Val( lstEpisodes.Cell( i, 2 ) )
		    Lindex = i
		  Next
		  lstEpisodes.Cell( Lindex, 2 ) = Str( AllWatchedCount - Val( lstEpisodes.Cell( Lindex, 2 ) ) )
		  
		  
		  If lstEpisodes.Expanded( lstEpisodes.ListIndex ) Then
		    lstEpisodes.Expanded( lstEpisodes.ListIndex ) = False
		    lstEpisodes.Expanded( lstEpisodes.ListIndex ) = True
		  End If
		  
		  lstEpisodes.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarkItem(Watched as Boolean = True)
		  Dim File as FolderItem = lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 )
		  
		  ThisEpisode.Value("watched") = Watched
		  lstEpisodes.Cell( lstEpisodes.ListIndex, 3 ) = Str( Watched )
		  
		  Episodes.Value( Val( lstEpisodes.Cell( lstEpisodes.ListIndex, 5 ) ) ) = ThisEpisode
		  
		  'If File <> Nil And File.Exists Then File = TVAttr.EpisodeNFO( ThisEpisode, File )
		  
		  // Save multi-episodes
		  If File <> Nil And File.Exists Then
		    
		    Dim Multi as Boolean = ( lstEpisodes.Cell( lstEpisodes.ListIndex, 15 ) <> "" )
		    Dim EpisodeNrs() as String = lstEpisodes.Cell( lstEpisodes.ListIndex, 15 ).Split( "," )
		    
		    If NOT Multi Then
		      'EpisodeFiles( Val( lstEpisodes.Cell( lstEpisodes.ListIndex, 5 ) ) ) = TVAttr.EpisodeNFO( ThisEpisode, File )
		      File = TVAttr.EpisodeNFO( ThisEpisode, File )
		    Else
		      Dim MultiEpisode() as JSONItem
		      'MultiEpisode.Append ThisEpisode
		      For n as Integer = 0 to EpisodeNrs.Ubound
		        
		        For i as Integer = 0 to Episodes.Count -1
		          If Episodes.Child(i).HasName("SeasonNumber") And Episodes.Child(i).Value("SeasonNumber") = ThisEpisode.Value("SeasonNumber") And _
		            Episodes.Child(i).HasName("EpisodeNumber") And Val( Episodes.Child(i).Value("EpisodeNumber") ) = Val( EpisodeNrs(n) ) Then
		            // Add Multi-Episodes
		            MultiEpisode.Append Episodes.Child(i)
		          End If
		        Next
		        
		      Next
		      
		      'EpisodeFiles( Val( lstEpisodes.Cell( lstEpisodes.ListIndex, 5 ) ) ) = TVAttr.EpisodeNFO( Nil, File, MultiEpisode )
		      File = TVAttr.EpisodeNFO( Nil, File, MultiEpisode )
		    End If
		    
		  End If
		  
		  
		  // Update season watchedcount
		  For n as Integer = lstEpisodes.ListIndex DownTo 0
		    If lstEpisodes.RowTag( n ) = "Folder" Then
		      Dim WatchedCount as Integer = Val( lstEpisodes.Cell( n, 2 ) )
		      If NOT Watched Then WatchedCount = WatchedCount -1 Else WatchedCount = WatchedCount +1
		      lstEpisodes.Cell( n, 2 ) = Str( WatchedCount )
		      Exit
		    End If
		  Next
		  
		  // Multi-Selection
		  'If lstEpisodes.SelCount > 1 Then
		  'For i as Integer = 0 To lstEpisodes.ListCount -1 'lstEpisodes.ListIndex + 1 To lstEpisodes.ListIndex + lstEpisodes.SelCount -1
		  'If NOT lstEpisodes.Selected(i) Then Continue
		  'If lstEpisodes.RowTag( i ) = "Folder" Then Continue
		  '
		  '// Match episode files
		  'Dim ThisFile as FolderItem = lstEpisodes.CellTag( i, 1 )
		  'Dim Lindex as Integer = lstEpisodes.CellTag( lstEpisodes.ListIndex, 2 )
		  '
		  'Dim CurrentEpisode as New JSONItem
		  'CurrentEpisode = Episodes.Child( Val( lstEpisodes.Cell( i, 5 ) ) )
		  '
		  'CurrentEpisode.Value("watched") = Watched
		  'lstEpisodes.Cell( i, 3 ) = Str( Watched )
		  '
		  'Episodes.Child( Val( lstEpisodes.Cell( i, 5 ) ) ) = CurrentEpisode
		  '
		  'If ThisFile <> Nil And ThisFile.Exists Then EpisodeFiles(Lindex) = TVAttr.EpisodeNFO( CurrentEpisode, ThisFile )
		  '
		  'Next
		  'End If
		  
		  If Watched Then cvsWatchedStatus.HelpTag = Menu.CMMMarkAsUnwatched Else cvsWatchedStatus.HelpTag = Menu.CMMMarkAsWatched
		  
		  WriteJSON( TVAttr.ID_TVDB )
		  cvsWatchedStatus.Reload
		  
		  // Update "All Seasons" watched Count
		  Dim AllWatchedCount as Integer = 0
		  Dim Lindex as Integer = 0
		  For i as Integer = 0 to lstEpisodes.ListCount -1
		    If lstEpisodes.RowTag( i ) <> "Folder" Then Continue
		    AllWatchedCount = AllWatchedCount + Val( lstEpisodes.Cell( i, 2 ) )
		    Lindex = i
		  Next
		  lstEpisodes.Cell( Lindex, 2 ) = Str( AllWatchedCount - Val( lstEpisodes.Cell( Lindex, 2 ) ) )
		  
		  lstEpisodes.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReadEpisodeNFO()
		  If ThisEpisode = Nil Then Return
		  
		  // ## JSON Info
		  // Link Labels
		  If ThisEpisode.HasName("id") And ThisEpisode.Value("id") <> "" Then
		    llTVDB.Visible = True
		    llTVDB.Text = "TVDB: " + ThisEpisode.Value("id")
		    llTVDB.URL  = "http://thetvdb.com/?tab=episode&seriesid=" + TVAttr.ID_TVDB + "&id=" + ThisEpisode.Value("id")
		    'llTVDB.Width = 20 + 5 + Graphics.StringWidth( llTVDB.Text ) + 10
		  Else
		    llTVDB.Visible = False
		    llTVDB.Text = ""
		    llTVDB.URL = ""
		  End If
		  llTVDB.Reload
		  
		  // -- IMDb
		  If ThisEpisode.HasName("IMDB_ID") And ThisEpisode.Value("IMDB_ID") <> "" Then
		    llIMDb.Visible = True
		    llIMDb.Text = "IMDb: " + ThisEpisode.Value("IMDB_ID")
		    llIMDb.URL = "http://www.imdb.com/title/" + ThisEpisode.Value("IMDB_ID")
		    'llIMDb.Width = 20 + 5 + Graphics.StringWidth( llIMDb.Text ) + 10
		  Else
		    llIMDb.Visible = False
		    llIMDb.Text = ""
		    llIMDb.URL = ""
		  End If
		  llIMDb.Reload
		  
		  
		  If ThisEpisode.HasName("EpisodeName")   Then edtTitle.Text    = ThisEpisode.Value("EpisodeName") Else edtTitle.Text = ""
		  If ThisEpisode.HasName("Rating")        Then edtRating.Text   = ThisEpisode.Value("Rating")      Else edtRating.Text = ""
		  If ThisEpisode.HasName("FirstAired")    Then edtPremiere.Text = ThisEpisode.Value("FirstAired")  Else edtPremiere.Text = ""
		  If ThisEpisode.HasName("plot")          Then edtPlot.Text     = ThisEpisode.Value("plot")        Else edtPlot.Text = ""
		  
		  // Episode Nr.s
		  If ThisEpisode.HasName("SeasonNumber")  Then edtSeasonNumber.Text  = ThisEpisode.Value("SeasonNumber") Else edtSeasonNumber.Text = ""
		  If ThisEpisode.HasName("EpisodeNumber") Then edtEpisodeNumber.Text = ThisEpisode.Value("EpisodeNumber") ELse edtEpisodeNumber.Text = ""
		  
		  // Specials Nr.s
		  If ThisEpisode.HasName("airsbefore_season") And ThisEpisode.Value("airsbefore_season") <> "" Then
		    grpSpecials.Visible = True
		    
		    If ThisEpisode.HasName("airsbefore_season")  Then edtBeforeSeason.Text  = ThisEpisode.Value("airsbefore_season")   Else edtBeforeSeason.Text = ""
		    If ThisEpisode.HasName("airsbefore_episode") Then edtBeforeEpisode.Text = ThisEpisode.Value("airsbefore_episode")  Else edtBeforeEpisode.Text = ""
		    If ThisEpisode.HasName("airsafter_season")   Then edtAfterSeason.Text   = ThisEpisode.Value("airsafter_season")    Else edtAfterSeason.Text = ""
		  Else
		    grpSpecials.Visible = False
		    
		    edtBeforeEpisode.Text = ""
		    edtBeforeSeason.Text = ""
		    edtAfterSeason.Text = ""
		  End If
		  
		  // People
		  If ThisEpisode.HasName("director") Then edtDirector.Text = ThisEpisode.Value("director") Else edtDirector.Text = ""
		  If ThisEpisode.HasName("credits")  Then edtWriter.Text   = ThisEpisode.Value("credits")  Else edtWriter.Text   = ""
		  If ThisEpisode.HasName("guests")   Then edtGuests.Text   = ThisEpisode.Value("guests")   Else edtGuests.Text   = ""
		  
		  // Actors
		  lstActors.DeleteAllRows
		  If ThisEpisode.HasName("Cast") And ThisEpisode.HasName("Roles") And ThisEpisode.HasName("CastThumbs") Then
		    
		    For i as Integer = 0 to ThisEpisode.Child("Cast").Count -1
		      lstActors.AddRow ThisEpisode.Child("Cast").Value(i), ThisEpisode.Child("Roles").Value(i), ThisEpisode.Child("CastThumbs").Value(i)
		    Next
		    
		  End If
		  
		  
		  // ## XML info
		  // Get XML
		  // Get episodeFile
		  Dim EpisodeFile as FolderItem = lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 )
		  
		  // Get NFO file
		  Dim NFOFile As FolderItem
		  If EpisodeFile IsA FolderItem Then NFOFile = EpisodeFile.Parent.Child( EpisodeFile.NameNoExtension + ".nfo" )
		  
		  Dim XMLEpisode as New XmlDocument
		  XMLEpisode.PreserveWhitespace = False
		  
		  If NFOFile = Nil OR NOT NFOFile.Exists Then Return
		  Dim Content as String = ReadTextFile( NFOFile )
		  
		  If Content.InStr( 200, "<episodedetails>" ) = 0 Then
		    If Trim( Content ).InStr( 0, "<?xml") > 0 Then XMLEpisode.LoadXml( Content )
		  Else
		    XMLEpisode = Nil
		  End If
		  If XMLEpisode = Nil Then Return
		  
		  
		  
		  Dim xRoot, xNode, xItem as XmlNode
		  
		  xRoot = XMLEpisode.FirstChild
		  
		  Dim ActName(), ActRole(), ActThumb() as String
		  
		  For i as Integer = 0 to xRoot.ChildCount -1
		    xNode = xRoot.Child(i)
		    If xNode.FirstChild = Nil Then Continue
		    
		    Select Case xNode.Name
		      
		    Case "title"
		      edtTitle.Text = xNode.FirstChild.Value
		      
		    Case "season"
		      edtSeasonNumber.Text = xNode.FirstChild.Value
		    Case "episode"
		      edtEpisodeNumber.Text = xNode.FirstChild.Value
		      
		    Case "aired"
		      edtPremiere.Text = xNode.FirstChild.Value
		    Case "rating"
		      edtRating.Text = xNode.FirstChild.Value
		    Case "plot"
		      edtPlot.Text = xNode.FirstChild.Value
		      
		    Case "director"
		      edtDirector.Text = xNode.FirstChild.Value
		    Case "credits"
		      edtWriter.Text = xNode.FirstChild.Value
		    Case "guests"
		      edtGuests.Text = xNode.FirstChild.Value
		      
		    Case "actor"
		      ActName.Append  xNode.ToString.MyMid( "<name>",  "</name>" )
		      ActRole.Append  xNode.ToString.MyMid( "<role>",  "</role>" )
		      ActThumb.Append xNode.ToString.MyMid( "<thumb>", "</thumb>" )
		      
		    Case "displayseason"
		      edtBeforeSeason.Text = xNode.FirstChild.Value
		    Case "displayepisode"
		      edtBeforeEpisode.Text = xNode.FirstChild.Value
		      
		    Case "airsafterseason"
		      edtAfterSeason.Text = xNode.FirstChild.Value
		    Case "airsbeforeseason"
		      edtBeforeSeason.Text = xNode.FirstChild.Value
		    Case "airsbeforeepisode"
		      edtBeforeEpisode.Text = xNode.FirstChild.Value
		      
		    End Select
		  Next
		  
		  If ActName.Ubound > 0 Then
		    lstActors.DeleteAllRows
		    For i as Integer = 0 to ActName.Ubound
		      lstActors.AddRow ActName(i), ActRole(i), ActThumb(i)
		    Next
		  End If
		  
		  'Dim XmlString as String = ReadTextFile( NFOFile )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadJSON(TVDBID as String)
		  
		  
		  Dim ErrString as String = "Initializing"
		  
		  // Find episode files.
		  If FolderParent <> Nil And FolderParent.Exists Then EpisodeFiles = FindEpisodeFiles( FolderParent )
		  
		  EpDictionary = New Dictionary
		  if EpisodeFiles.Ubound > -1 then
		    for i as Integer = 0 to EpisodeFiles.Ubound
		      dim file as FolderItem = EpisodeFiles(i)
		      dim sOOeOO as string = RegExEpisode( file )
		      dim d as New Dictionary
		      
		      d.Value("File") = file
		      d.Value("Season") = sOOeOO.Left(2)
		      dim eps() as String = sOOeOO.Split("x")
		      if eps.Ubound > 0 then eps.Remove(0)
		      d.Value("Episodes") = eps
		      
		      EpDictionary.Value(EpisodeFiles(i).ShellPath) = d
		    next
		  end if
		  
		  
		  // Please update if no episode guide is found.
		  lstEpisodes.DeleteAllRows
		  If lstEpisodes.ListCount <= 0 Then
		    lstEpisodes.AddRow kPleaseUpdate + " " + TVAttr.Title
		    lstEpisodes.ListIndex = lstEpisodes.LastIndex
		  End If
		  
		  ErrString = "Can the episode guide be located and does it exists?"
		  Dim EpGuide as FolderItem = Preferences.fAppSupport.Child("EpisodeGuides").Child( TVDBID + ".json" )
		  If EpGuide <> Nil And EpGuide.Exists And NOT TVAttr.FolderParent.Child( "EpisodeGuide.json" ).Exists Then EpGuide.MoveFileTo TVAttr.FolderParent.Child("EpisodeGuide.json")
		  
		  if TVAttr.FolderParent = Nil then Return
		  
		  EpGuide = TVAttr.FolderParent.Child("EpisodeGuide.json")
		  If EpGuide = Nil OR NOT EpGuide.Exists Then Return
		  
		  // Otherwise reset lstbox, and start filling it with episodes.
		  lstEpisodes.DeleteAllRows
		  lstEpisodes.AddRow "Loading list, please wait..." + chr(13) + BytesToString( EpGuide.Length )
		  
		  ErrString = "Can I read the episode guide?"
		  Dim Content as String = ReadTextFile( EpGuide )
		  
		  lstEpisodes.DeleteAllRows
		  lstEpisodes.AddRow "Loading list, please wait...." + chr(13) + BytesToString( EpGuide.Length )
		  
		  // Set JSON item
		  ErrString = "Can I load the episode guide as a valid JSON file?"
		  If Content <> "" Then
		    Episodes = New JSONItem
		    Episodes.Compact = False
		    'If Content.ValidJSON( "Episodes Manager" ) Then
		    try
		      Episodes.Load( Content )
		    Catch err as JSONException
		      Break
		    end try
		    'End If
		    If Episodes <> Nil and Episodes.HasName("episodes") Then Episodes = Episodes.Child("episodes")
		  End If
		  If Episodes = Nil Then Return
		  
		  lstEpisodes.DeleteAllRows
		  lstEpisodes.AddRow "Loading list, please wait....." + chr(13) + BytesToString( EpGuide.Length )
		  
		  
		  // Get highest season number
		  ErrString = "What is the highest season?"
		  Dim HighestSeason as Integer = -1
		  For i as Integer = 0 to Episodes.Count -1
		    If Episodes.Child(i).HasName("SeasonNumber") And Episodes.Child(i).Value("SeasonNumber") > HighestSeason Then
		      HighestSeason = Episodes.Child(i).Value("SeasonNumber")
		    End If
		  Next
		  
		  lstEpisodes.DeleteAllRows
		  ErrString = "Can I translate all seasons into folders?"
		  For i as Integer = HighestSeason DownTo -1
		    
		    // Count episodes in the current season.
		    Dim EpisodeCount as Integer = 0
		    Dim WatchedCount as Integer = 0
		    Dim EpisodeFileCount as Integer = 0
		    For n as Integer = 0 to Episodes.Count -1
		      If i > -1 And Episodes.Child(n).HasName("SeasonNumber") And Episodes.Child(n).Value("SeasonNumber") = i Then
		        EpisodeCount = EpisodeCount + 1
		        If Episodes.Child(n).Value("watched") Then WatchedCount = WatchedCount + 1
		      End If
		      If i = -1 Then
		        EpisodeCount = EpisodeCount +1 // Count all episodes
		        If Episodes.Child(n).Value("watched") Then WatchedCount = WatchedCount + 1
		      End If
		    Next
		    
		    // Look up episode file information
		    for each key as Variant in EpDictionary.Keys
		      dim dict as Dictionary = EpDictionary.Value(key)
		      
		      if dict.Lookup("season", "") = i then
		        EpisodeFileCount = EpisodeFileCount + 1
		      end if
		    next
		    
		    // Add folder
		    If i = 0 Then
		      lstEpisodes.AddFolder Loc.kTVSpecials
		      
		      lstEpisodes.CellTag( lstEpisodes.LastIndex, 1 ) = FolderParent.Child( "Specials" )
		    ElseIf i = -1 Then
		      lstEpisodes.AddFolder Loc.kEpisodesAll
		      EpisodeFileCount = EpisodeFiles.Ubound + 1
		    Else
		      lstEpisodes.AddFolder Loc.kSeason + " " + Str( i )
		      
		      Dim DisplaySeason as String = Str( i )
		      If DisplaySeason.Len = 1 Then DisplaySeason = "0" + DisplaySeason
		      lstEpisodes.CellTag( lstEpisodes.LastIndex, 1 ) = FolderParent.Child( "Season " + DisplaySeason )
		    End If
		    
		    // Add additional data.
		    lstEpisodes.CellTag( lstEpisodes.LastIndex, 0 ) = Str( i ) // Tag Season Nr.
		    lstEpisodes.RowTag( lstEpisodes.LastIndex ) = "Folder" // Mark as folder
		    lstEpisodes.Cell( lstEpisodes.LastIndex, 1 ) = Str( EpisodeCount )
		    lstEpisodes.Cell( lstEpisodes.LastIndex, 2 ) = Str( WatchedCount )
		    lstEpisodes.Cell( lstEpisodes.LastIndex, 3 ) = Str( EpisodeFileCount )
		  Next
		  If lstEpisodes.ListCount > 0 Then lstEpisodes.ListIndex = 0
		  
		  
		  Exception err as NilObjectException
		    If NOT DebugBuild Then
		      MessageBox ErrString
		      Return
		    End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveEpisode(File as FolderItem)
		  If NOT File IsA FolderItem Then Return
		  
		  Dim strRemoveItem   as String = Loc.msgRemoveItem.ReplaceAll( "%S", File.Name ).ReplaceAll( "%F", File.Parent.Name )
		  Dim strMovedToTrash as String = Loc.msgWillBeMovedToTrash.ReplaceAll( "%F", File.Parent.Name )
		  
		  If MsgDlg( Self, 1, strRemoveItem, strMovedToTrash, Loc.btnMoveToTrash, Loc.btnKeepIt ) = 2 Then Return
		  
		  // Find extra files
		  Dim Extras() as FolderItem
		  For i as Integer = 1 To File.Parent.Count
		    Dim Item as FolderItem = File.Parent.Item(i)
		    If Item <> Nil And Item.Exists And Item.Name.InStr( 0, File.NameNoExtension ) > 0 Then
		      Extras.Append Item
		    End If
		  Next
		  
		  If File.IsNetworkVolume Then File.Delete Else File.MoveToTrash()
		  dim v as Variant = lstEpisodes.CellTag( lstEpisodes.ListIndex, 2 )
		  
		  'Try
		  'If lstEpisodes.CellTag( lstEpisodes.ListIndex, 2 ) <> Nil Then EpisodeFiles.Remove( lstEpisodes.CellTag( lstEpisodes.ListIndex, 2 ) )
		  'Catch err as OutOfBoundsException
		  'MessageBox "The file doesn't exist"
		  'End Try
		  
		  For i as Integer = 0 to Extras.Ubound
		    If Extras(i) = Nil OR NOT extras(i).Exists Then Continue
		    If Extras(i).IsNetworkVolume Then Extras(i).Delete Else Extras(i).MoveToTrash()
		  Next
		  'If Thumb IsA FolderItem Then Thumb.MoveFileToTrash( False )
		  'If NFO IsA FolderItem Then NFO.MoveFileToTrash( False )
		  lstEpisodes.Cell( lstEpisodes.ListIndex, 2 ) = ""
		  lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 ) = Nil
		  lstEpisodes.CellTag( lstEpisodes.ListIndex, 2 ) = Nil
		  
		  lstEpisodes.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveEpisodeNFO()
		  
		  
		  ThisEpisode.Value("EpisodeName") = edtTitle.Text
		  ThisEpisode.Value("Rating")      = edtRating.Text
		  ThisEpisode.Value("FirstAired")  = edtPremiere.Text
		  ThisEpisode.Value("plot")        = edtPlot.Text
		  
		  ThisEpisode.Value("SeasonNumber")  = edtSeasonNumber.Text
		  ThisEpisode.Value("EpisodeNumber") = edtEpisodeNumber.Text
		  
		  If edtBeforeSeason.Text  <> "" Then ThisEpisode.Value("airsbefore_season")  = edtBeforeSeason.Text
		  If edtBeforeEpisode.Text <> "" Then ThisEpisode.Value("airsbefore_episode") = edtBeforeEpisode.Text
		  If edtAfterSeason.Text   <> "" Then ThisEpisode.Value("airsafter_season")   = edtAfterSeason.Text
		  
		  ThisEpisode.Value("director") = edtDirector.Text
		  ThisEpisode.Value("credits")  = edtWriter.Text
		  ThisEpisode.Value("guests")   = edtGuests.Text
		  
		  Dim Cast as New JSONItem, Roles as New JSONItem, Thumbs as New JSONItem
		  
		  For i as Integer = 0 to lstActors.ListCount - 1
		    Cast.Value(i)   = lstActors.Cell( i, 0 )
		    Roles.Value(i)  = lstActors.Cell( i, 1 )
		    Thumbs.Value(i) = lstActors.Cell( i, 2 )
		  Next
		  
		  Dim s as String
		  
		  ThisEpisode.Value("Cast")  = Cast
		  ThisEpisode.Value("Roles") = Roles
		  ThisEpisode.Value("CastThumbs") = Thumbs
		  
		  Episodes.Value( Val( lstEpisodes.Cell( lstEpisodes.ListIndex, 5 ) ) ) = ThisEpisode
		  WriteJSON( TVAttr.ID_TVDB )
		  
		  'If Preferences.Prefs.boolForKey("SkipEpisodeFiles") Then Return // The user has chosen not to manage episode files.
		  
		  // XML
		  Dim EpisodeFile as FolderItem = lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 )
		  If NOT EpisodeFile IsA FolderItem Then Return
		  
		  Dim Lindex as Integer = lstEpisodes.CellTag( lstEpisodes.ListIndex, 2 )
		  
		  
		  Dim Multi as Boolean = ( lstEpisodes.Cell( lstEpisodes.ListIndex, 15 ) <> "" )
		  Dim EpisodeNrs() as String = lstEpisodes.Cell( lstEpisodes.ListIndex, 15 ).Split( "," )
		  
		  If NOT Multi Then
		    EpisodeFiles(Lindex) = TVAttr.EpisodeNFO( ThisEpisode, EpisodeFile )
		  Else
		    Dim MultiEpisode() as JSONItem
		    'MultiEpisode.Append ThisEpisode
		    For n as Integer = 0 to EpisodeNrs.Ubound
		      
		      For i as Integer = 0 to Episodes.Count -1
		        If Episodes.Child(i).HasName("SeasonNumber") And Episodes.Child(i).Value("SeasonNumber") = ThisEpisode.Value("SeasonNumber") And _
		          Episodes.Child(i).HasName("EpisodeNumber") And Val( Episodes.Child(i).Value("EpisodeNumber") ) = Val( EpisodeNrs(n) ) Then
		          // Add Multi-Episodes
		          MultiEpisode.Append Episodes.Child(i)
		        End If
		      Next
		      
		    Next
		    
		    'EpisodeFiles(Lindex)
		    Dim e as FolderItem = TVAttr.EpisodeNFO( Nil, EpisodeFile, MultiEpisode )
		    If e <> Nil Then EpisodeFiles(Lindex) = e
		  End If
		  
		  If EpisodeFiles(Lindex) <> Nil And EpisodeFiles(Lindex).Exists Then
		    lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 ) = EpisodeFiles(Lindex)
		    lstEpisodes.Cell( lstEpisodes.ListIndex, 2 ) = EpisodeFiles(Lindex).ShellPath
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteJSON(TVDBID as String)
		  If TVDBID = "" Then Return
		  
		  Dim JSONLocation as FolderItem = TVAttr.FolderParent.Child( "EpisodeGuide.json" ) 'Preferences.fAppSupport.Child("EpisodeGuides").Child( TVDBID + ".json" )
		  If JSONLocation = Nil Then Return
		  
		  Dim EpGuide as New JSONItem
		  EpGuide.Value("episodes") = Episodes
		  EpGuide.Compact = False
		  
		  WriteTextFile( EpGuide.ToString, JSONLocation )
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ActorIMG As Picture = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActorLastSelection As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ArtFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EpDictionary As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected EpisodeFiles() As Folderitem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Episodes As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		FolderParent As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		MarkAsWatched As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		PressedCleaner As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PressedEditor As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PressedMarker As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ThisEpisode As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ThisEpisodeThumb As Picture
	#tag EndProperty


	#tag Constant, Name = HTML, Type = String, Dynamic = False, Default = \"<!doctype html>\r<html>\r<head>\r  <meta charset\x3D\"utf-8\">\r\r  <style>\r    * { box-sizing: border-box; }\r    html\x2C body { margin: 0; padding: 0; }\r    body {\r      font-family : \"Lucida Grande\"\x2C Verdana\x2C sans-serif;\r      font-size   : 14px;\r      color       : #3F4149;\r      line-height : 1.4em;\r      text-align  : left;\r    }\r\r    img {\r      max-width: 100%;\r      width: 100%;\r      box-shadow: 0px 3px 5px hsla( 0\x2C 0%\x2C 0%\x2C .3);\r    }\r\r    p { margin: 0; padding: 0 10px; }\r      p:first-child { margin-top: 5px; }\r    p.credits { font-size: .85em; line-height: 1.4em; }\r      p.credits:first-child { padding-top: 1em; }\r      p:last-child  { padding-bottom: 1em; }\r    b { display: inline-block; width: 100px; }\r  </style>\r</head>\r<body>\r\r  <img src\x3D\"%thumb%\" alt\x3D\"Thumbnail\" class\x3D\"thumb\">\r  <div>\r    <p>\r      %plot%\r    </p>\r    <br/>\r    <p class\x3D\"credits\"><b>%directors%</b> %directorlist%</p>\r    <p class\x3D\"credits\"><b>%writers%</b> %writerlist%</p>\r    <p class\x3D\"credits\"><b>%guests%</b> %guestslist%</p>\r  </div>\r\r</body>\r</html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPleaseUpdate, Type = String, Dynamic = True, Default = \"Please Update", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Please Update"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Update alstublieft"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Merci de mettre \xC3\xA0 jour"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Bitte aktualisieren"
	#tag EndConstant

	#tag Constant, Name = kRemoveEpisode, Type = String, Dynamic = True, Default = \"Remove Episode", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Remove Episode"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijder aflevering"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Enlever l\'\xC3\xA9pisode"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Folge entfernen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ta bort avsnitt"
	#tag EndConstant

	#tag Constant, Name = kWatchEpisode, Type = String, Dynamic = True, Default = \"Watch Episode", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Watch Episode"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bekijk aflevering"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Regarder l\'\xC3\xA9pisode"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Folge ansehen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Titta p\xC3\xA5 avsnitt"
	#tag EndConstant


#tag EndWindowCode

#tag Events ppEpisodes
	#tag Event
		Sub Open()
		  Me.Height = Self.Height
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  ToolsMarkasWatched.Enabled = ( Me.Value = 0 ) // MENU Mark as Watched
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsShowInfo
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawGradient( RGBa( 100, 100, 100 ), RGBa( 80, 80, 80 ), 0, 64, g.Width, g.Height ) // Background
		  
		  'g.DrawGradientVertical( RGBa( 0, 0, 0, .15 ), RGBa( 0, 0, 0, 0 ),  0, 64, 40, 64 ) // Left Shade
		  'g.DrawGradientVertical( RGBa( 0, 0, 0, 0 ),  RGBa( 0, 0, 0, .15 ), g.Width - 40, 64, 40, 64 ) // Left Shade
		  
		  g.DrawGradient( RGBa( 0, 0, 0, .40 ), RGBa( 0, 0, 0, 0 ), 0, 64, g.Width, 4 ) // Shadow
		  
		  Dim BannerPic as Picture
		  If ActiveSection = 1 Then BannerPic = TVAttr.ART_Banner
		  'If ActiveSection = 2 Then BannerPic = AnimeAttr.ART_Banner
		  
		  If BannerPic <> Nil Then
		    g.ScaleImage( BannerPic, g.Width, g.Height, 0, 0 )
		  Else
		    // Draw replacement
		    g.ScaleImage( bannerplaceholder, g.Width, g.Height, 0, 0 )
		    
		    g.TextSize = 24
		    If TVAttr.Title.Len > 17 Then g.TextSize = 18
		    If TVAttr.Title.Len > 38 Then g.TextSize = 12
		    g.Bold = True
		    g.TextFont = "Tekton Pro"
		    
		    Dim Title as String
		    If ActiveSection = 1 Then Title = TVAttr.Title
		    'If ActiveSection = 2 Then Title = AnimeAttr.Title
		    
		    g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString( Title, ( g.Width / 2 ) - ( g.StringWidth( Title ) / 2 ), g.TextSize + ( 62 / 2 ) - ( g.StringHeight( Title, g.Width - 20 ) / 2 ) +2, g.Width - 20 )
		    
		    g.ForeColor = RGBa( 55, 55, 55 )
		    g.DrawString( Title, ( g.Width / 2 ) - ( g.StringWidth( Title ) / 2 ), g.TextSize + ( 64 / 2 ) - ( g.StringHeight( Title, g.Width - 20 ) / 2 ), g.Width - 20 )
		  End If
		  
		  g.Bold = False
		  g.TextSize = 13
		  g.TextFont = "System"
		  
		  Dim ShowDate as New Date
		  Dim LocalGMT as Integer = ShowDate.GMTOffset
		  
		  Dim ReviewDate as String
		  Dim Network as String
		  
		  If ActiveSection = 1 Then
		    ReviewDate = TVAttr.NextAired_Date
		    If ReviewDate = "" Then ReviewDate = TVAttr.LastAired_Date
		    Network = TVAttr.TVNetwork
		  ElseIf ActiveSection = 2 Then
		    'ReviewDate = AnimeAttr.NextAired_Date
		    'If ReviewDate = "" Then ReviewDate = AnimeAttr.LastAired_Date
		    'Network = AnimeAttr.TVNetwork
		  End If
		  
		  Dim SplitDate() as String = Split( ReviewDate.NthField( "T", 1 ), "-" )
		  
		  
		  If SplitDate.Ubound > 0 Then
		    
		    ShowDate.GMTOffset = Val( ReviewDate.NthField( "G", 2 ) )
		    
		    ShowDate.Year = Val( SplitDate(0) )
		    ShowDate.Month = Val( SplitDate(1) )
		    If SplitDate.Ubound >= 2 Then ShowDate.Day = Val( SplitDate(2) ) Else ShowDate.Day = 1
		    
		    ShowDate.Hour      = Val( ReviewDate.NthField( "T", 2 ).NthField( ":", 1 ) )
		    ShowDate.Minute    = Val( ReviewDate.NthField( "T", 2 ).NthField( ":", 2 ).NthField( "G", 1 ) )
		    
		    ShowDate.GMTOffset = LocalGMT
		    
		    // Display Minutes
		    Dim DisplayMinutes as String = Str( ShowDate.Minute )
		    If DisplayMinutes.Len = 1 Then DisplayMinutes = "0" + DisplayMinutes
		    
		    // Day of Week
		    Dim DayOfWeek as String
		    Select Case ShowDate.DayOfWeek
		      
		    Case 1
		      DayOfWeek = Loc.t_day1Sunday
		    Case 2
		      DayOfWeek = Loc.t_day2Monday
		    Case 3
		      DayOfWeek = Loc.t_day3Tuesday
		    Case 4
		      DayOfWeek = Loc.t_day4Wednesday
		    Case 5
		      DayOfWeek = Loc.t_day5Thursday
		    Case 6
		      DayOfWeek = Loc.t_day6Friday
		    Case 7
		      DayOfWeek = Loc.t_day7Saturday
		      
		    End Select
		    
		    Dim AMPM as String = "AM"
		    Dim DisplayHour as String = Str( ShowDate.Hour )
		    
		    If ShowDate.Hour > 12 Then
		      AMPM = "PM"
		      DisplayHour = Str( Val( DisplayHour ) - 12 )
		    End If
		    
		    // Write Display Date
		    Dim DisplayDate as String = DayOfWeek + " " + Loc.kAtTime + " " + DisplayHour + ":" + DisplayMinutes + " " + AMPM
		    If Network <> "" Then DisplayDate = DisplayDate + " " + Loc.kOnNetwork + " " + Network
		    
		    'g.TextSize = 14
		    'g.Bold = True
		    g.ForeColor = RGBa( 100, 100, 100, .8 )
		    g.DrawString( DisplayDate, ( g.Width / 2 ) - ( g.StringWidth( DisplayDate ) / 2 ), 64 + g.TextSize + ( 64 / 2 ) - ( g.StringHeight( DisplayDate, g.Width - 20 ) / 2 ) +1 )
		    
		    g.ForeColor = RGBa( 45, 45, 45 )
		    g.DrawString( DisplayDate, ( g.Width / 2 ) - ( g.StringWidth( DisplayDate ) / 2 ), 64 + g.TextSize + ( 64 / 2 ) - ( g.StringHeight( DisplayDate, g.Width - 20 ) / 2 ) )
		    
		  End If
		  
		  
		  // Right Border
		  g.ForeColor = RGBa( 80, 80, 80 )
		  If lstEpisodes.ListIndex < 0 Then Return
		  If lstEpisodes.RowTag( lstEpisodes.ListIndex ) <> "Folder" Then g.DrawLine g.Width -1, 0, g.Width -1, g.Height
		  'g.DrawLine 0, 0, 0, g.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsSeasonArt
	#tag Event
		Sub Open()
		  Me.Top = 0
		  Me.Height = ppEpisodes.Height
		  Me.Mode = "SeasonPoster"
		End Sub
	#tag EndEvent
	#tag Event
		Sub Activate()
		  
		  If lstEpisodes.ListIndex > -1 and lstEpisodes.RowTag( lstEpisodes.ListIndex ) <> "Folder" Then Return
		  
		  
		  Dim Season as String = lstEpisodes.CellTag( lstEpisodes.ListIndex, 0 ) 'Trim( lstEpisodes.Cell( lstEpisodes.ListIndex, 0 ).ReplaceAll( Loc.kSeason, "" ) )
		  GetSeasonInfo( Season, Me.Mode )
		  
		  'Select Case Me.Mode
		  '
		  'Case "SeasonPoster"
		  '
		  'Case "SeasonFanart"
		  'GetSeasonInfo( Season, "Fanart" )
		  'Case "SeasonBanner"
		  'GetSeasonInfo( Season, "Banner" )
		  'Case "SeasonThumb"
		  'GetSeasonInfo( Season, "Thumb" )
		  '
		  'End Select
		  
		  
		  'Me.Reload( SeasonImage )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popSeason
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
		  
		  If X < 0 OR Y < 0 OR _
		    X > Me.Width OR Y > Me.Width Then
		    Return
		  End If
		  
		  Dim Base As New MenuItem
		  Dim MiSeperator as New MenuItem( "-" )
		  
		  base.Append New MenuItem( Loc.kPoster )
		  base.Append New MenuItem( Loc.kFanart )
		  base.Append New MenuItem( Loc.kBanner )
		  base.Append New MenuItem( Loc.kThumb  )
		  
		  If base.Child( Loc.kPoster ) <> Nil Then base.Child( Loc.kPoster ).Checked = ( cvsSeasonArt.Mode = "SeasonPoster" )
		  If base.Child( Loc.kFanart ) <> Nil Then base.Child( Loc.kFanart ).Checked = ( cvsSeasonArt.Mode = "SeasonFanart" )
		  If base.Child( Loc.kBanner ) <> Nil Then base.Child( Loc.kBanner ).Checked = ( cvsSeasonArt.Mode = "SeasonBanner" )
		  If base.Child( Loc.kThumb )  <> Nil Then base.Child( Loc.kThumb ).Checked  = ( cvsSeasonArt.Mode = "SeasonThumb" )
		  
		  
		  If Base.Child( Loc.kPoster ) <> Nil Then
		    If ArtFiles(0).Exists Then Base.Child( Loc.kPoster ).Icon = posterinactive    Else Base.Child( Loc.kPoster ).Icon = posteractive
		  End If
		  
		  If Base.Child( Loc.kFanart ) <> Nil Then
		    If ArtFiles(1).Exists Then Base.Child( Loc.kFanart ).Icon = fanartinactive    Else Base.Child( Loc.kFanart ).Icon = fanartactive
		  End If
		  
		  If Base.Child( Loc.kBanner ) <> Nil Then
		    If ArtFiles(2).Exists Then Base.Child( Loc.kBanner ).Icon = bannerinactive    Else Base.Child( Loc.kBanner ).Icon = banneractive
		  End If
		  
		  If Base.Child( Loc.kThumb  ) <> Nil Then
		    If ArtFiles(3).Exists Then Base.Child( Loc.kThumb  ).Icon = landscapeinactive Else Base.Child( Loc.kThumb  ).Icon = landscapeactive
		  End If
		  
		  
		  base.Append New MenuItem( "-" )
		  base.Append New MenuItem( Menu.ToolsExtraArtGetPoster )
		  base.Append New MenuItem( Menu.ToolsExtraArtGetFanart )
		  base.Append New MenuItem( Menu.ToolsExtraArtGetBanner )
		  base.Append New MenuItem( Menu.ToolsExtraArtGetThumb  )
		  
		  Dim HitItem as MenuItem = base.PopUp
		  If HitItem = Nil Then Return
		  
		  Dim Season as Integer = lstEpisodes.CellTag( lstEpisodes.ListIndex, 0 ) 'Val( Trim( lstEpisodes.Cell( lstEpisodes.ListIndex, 0 ).ReplaceAll( Loc.kSeason, "" ) ) )
		  
		  Select Case HitItem.Text
		    
		  Case Loc.kPoster
		    GetSeasonInfo( Str( Season ), "SeasonPoster" )
		  Case Loc.kFanart
		    GetSeasonInfo( Str( Season ), "SeasonFanart" )
		  Case Loc.kBanner
		    GetSeasonInfo( Str( Season ), "SeasonBanner" )
		  Case Loc.kThumb
		    GetSeasonInfo( Str( Season ), "SeasonThumb" )
		    
		    
		  Case Menu.ToolsExtraArtGetPoster
		    CommonCore.GetImageSeason( "Poster", Season )
		    GetSeasonInfo( Str( Season ), "SeasonPoster" )
		  Case Menu.ToolsExtraArtGetFanart
		    CommonCore.GetImageSeason( "Fanart", Season )
		    GetSeasonInfo( Str( Season ), "SeasonFanart" )
		  Case Menu.ToolsExtraArtGetBanner
		    CommonCore.GetImageSeason( "Banner", Season )
		    GetSeasonInfo( Str( Season ), "SeasonBanner" )
		  Case Menu.ToolsExtraArtGetThumb
		    CommonCore.GetImageSeason( "Thumb", Season )
		    GetSeasonInfo( Str( Season ), "SeasonThumb" )
		    
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsEpisodeInfo
	#tag Event
		Sub Open()
		  Me.Top = 0
		  Me.Height = ppEpisodes.Height
		  
		  htmlPlot.Height = 205
		  htmlPlot.Top = ppEpisodes.Height - htmlPlot.Height
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  
		  g.DrawGradient( RGBa( 100, 100, 100 ), RGBa( 80, 80, 80 ), 0, 0, g.Width, ( 64 * 2 ) -1 ) // Background
		  
		  // ## Info
		  Dim Fantasy, Western, History, Science, Horror as Boolean = False
		  Dim Genres() as String
		  If ActiveSection = 1 Then Genres = TVAttr.Genres
		  'If ActiveSection = 2 Then Genres = AnimeAttr.Genres
		  
		  For i as Integer = 0 to Genres.Ubound
		    If Genres(i) = Genre.Fantasy Then Fantasy = True
		    If Genres(i) = Genre.Western Then Western = True
		    If Genres(i) = Genre.History Then History = True
		    If Genres(i) = Genre.ScienceFiction OR Genres(i).InStr( 0, "Science" ) > 0 Then Science = True
		    If Genres(i) = Genre.Horror Then Horror = True
		  Next
		  
		  // Episode Title
		  If NOT Science Then g.Bold = True
		  g.TextSize = 26
		  'g.TextFont = "Arial Narrow Bold"
		  g.TextFont = "Trebuchet MS"
		  'If Fantasy Then g.TextFont = "Hobo Std"
		  If History Then g.TextFont = "Papyrus"
		  If Western Then g.TextFont = "Rosewood Std"
		  If Science Then g.TextFont = "Futura"
		  If Horror  Then g.TextFont = "Cochin"
		  
		  Dim TextTop as Integer = g.TextSize + 10
		  
		  If ThisEpisode = Nil Then Return
		  
		  // Title
		  g.ForeColor = RGBa( 100, 100, 100 )
		  g.DrawString( ThisEpisode.Value( "EpisodeName" ), 20, TextTop + 1, g.Width - 40 )
		  
		  g.ForeColor = RGBa( 0, 0, 0, .70 )
		  g.DrawString( ThisEpisode.Value( "EpisodeName" ), 20, TextTop,     g.Width - 40 )
		  
		  TextTop = TextTop - 8 + g.StringHeight( ThisEpisode.Value( "EpisodeName" ), g.Width - 40 )
		  
		  // Season ## Episode ##
		  g.TextSize = 13
		  g.TextFont = "System"
		  g.Bold = False
		  
		  Dim EpisodeText as String = Loc.kSeason + " " + ThisEpisode.Value( "SeasonNumber" ) + ", " + Loc.kEpisode + " " + ThisEpisode.Value("EpisodeNumber")
		  
		  g.ForeColor = RGBa( 100, 100, 100 )
		  g.DrawString( EpisodeText, 20, TextTop + 1, g.Width - 40 )
		  
		  g.ForeColor = RGBa( 0, 0, 0, .60 )
		  g.DrawString( EpisodeText, 20, TextTop,     g.Width - 40 )
		  
		  TextTop = TextTop + 5 + g.StringHeight( EpisodeText, g.Width - 40 )
		  
		  
		  // Date
		  g.ForeColor = RGBa( 100, 100, 100 )
		  g.DrawString( PrettyDate( ThisEpisode.Value("FirstAired"), True ), 20, TextTop + 1, g.Width - 40 )
		  
		  g.ForeColor = RGBa( 0, 0, 0, .60 )
		  g.DrawString( PrettyDate( ThisEpisode.Value("FirstAired"), True ), 20, TextTop,     g.Width - 40 )
		  
		  
		  // ## Thumb
		  'Dim ThumbHeight as Double = ( 64 * 2 ) + ScaledDim( ThisEpisodeThumb, g.Width, g.Height, False, True )
		  'If ThumbHeight <= ( 64 * 2 ) Then ThumbHeight = ( 64 * 2 )
		  '
		  'g.ForeColor = RGBa( 100, 100, 100 )
		  'g.FillRect( 0, ThumbHeight, g.Width, 12 )
		  '
		  'g.DrawGradient( RGBa( 0, 0, 0, 50 ), RGBa( 0, 0, 0, 0 ), 0, ThumbHeight, g.Width, 8 ) // Shadow
		  '
		  'If ThisEpisodeThumb <> Nil Then g.ScaleImage( ThisEpisodeThumb, g.Width, g.Height, 0, ( 64 * 2 ) + 1, False, True, True )
		  
		  'If NOT Pressed Then g.Transparency = 50
		  'g.DrawPicture( tb_editor2x, g.Width - 15 - ( tb_editor2x.Width / 2 ), ( 62 * 2 ) - 5 - ( tb_editor2x.Height / 2 ), 32, 32,   0, 0, tb_editor2x.Width, tb_editor2x.Height )
		  'g.Transparency = 0
		  
		  // ## Borders
		  g.ForeColor = RGBa( 0, 0, 0, .13 )
		  g.DrawLine( 0, ( 64 * 2 ), g.Width, ( 64 * 2 ) )
		  'g.DrawLine( 0, g.Height -1, g.Width, g.Height -1 )
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  'If x > Me.Width - 15 - 32 And x < Me.Width - 15 And _
		  'y > ( 64 * 2 ) - 8 - 32 And Y < ( 64 * 2 ) - 8 Then
		  'Pressed = True
		  'Me.RefreshRect( Me.Width - 15 - 32, ( 64 * 2 ) - 8 - 32, 32, 32 )
		  'Return True
		  'End If
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  '
		  '
		  'If x > Me.Width - 15 - 32 And x < Me.Width - 15 And _
		  'y > ( 64 * 2 ) - 8 - 32 And Y < ( 64 * 2 ) - 8 Then
		  'Pressed = True
		  'Else
		  'Pressed = False
		  'End If
		  'Me.RefreshRect( Me.Width - 15 - 32, ( 64 * 2 ) - 8 - 32, 32, 32 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  'Pressed = False
		  'Me.RefreshRect( Me.Width - 15 - 32, ( 64 * 2 ) - 8 - 32, 32, 32 )
		  '
		  'If x > Me.Width - 15 - 32 And x < Me.Width - 15 And _
		  'y > ( 64 * 2 ) - 8 - 32 And Y < ( 64 * 2 ) - 8 Then
		  'ReadEpisodeNFO()
		  'ppEpisodes.Value = 1
		  'End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsMetaDataEditor
	#tag Event
		Sub Open()
		  Me.Backdrop = Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  If ThisEpisode = Nil Then Return
		  If NOT PressedEditor Then g.Transparency = 50
		  
		  'If App.ScalingFactor = 1 Then
		  'g.DrawPicture( template, 0, 0 )
		  'Else
		  'g.DrawPicture( tb_editor2x, 0, 0, g.Width, g.Height,  0, 0, tb_editor2x.Width, tb_editor.Height )
		  g.ScaleImage( template_edit, g.Width, g.Height, 0, 0 )
		  'End If
		  
		  'g.DrawRect( 0, 0, g.Width, g.Height )
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If ThisEpisode = Nil Then Return False
		  If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		    PressedEditor = True
		    Me.Reload
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If ThisEpisode = Nil Then Return
		  If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		    PressedEditor = True
		    Me.Reload
		  Else
		    PressedEditor = False
		    Me.Reload
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If ThisEpisode = Nil Then Return
		  If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		    PressedEditor = False
		    Me.Reload
		    
		    ReadEpisodeNFO()
		    ppEpisodes.Value = 1
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsWatchedStatus
	#tag Event
		Sub Open()
		  Me.Backdrop = Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  If ThisEpisode = Nil Then Return
		  
		  If NOT PressedMarker Then g.Transparency = 50
		  
		  If ThisEpisode.HasName("Ignored") And ThisEpisode.Value("Ignored") = True Then
		    cvsWatchedStatus.HelpTag = Menu.CMMMarkAsUnwatched
		    Return
		  End If
		  
		  If ThisEpisode.Value("watched") Then
		    g.ScaleImage( watched, g.Width, g.Height, 0, 0 )
		    cvsWatchedStatus.HelpTag = Menu.CMMMarkAsUnwatched
		  Else
		    g.ScaleImage( unwatched, g.Width, g.Height, 0, 0 )
		    cvsWatchedStatus.HelpTag = Menu.CMMMarkAsWatched
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If ThisEpisode = Nil Then Return False
		  If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		    PressedMarker = True
		    Me.Reload
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If ThisEpisode = Nil Then Return
		  If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		    PressedMarker = True
		    Me.Reload
		  Else
		    PressedMarker = False
		    Me.Reload
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If ThisEpisode = Nil Then Return
		  If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		    PressedMarker = False
		    Me.Reload
		    
		    MarkItem( NOT ThisEpisode.Value("watched") )
		  End If
		  Me.Reload
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsClean
	#tag Event
		Sub Open()
		  Me.Backdrop = Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  If ThisEpisode = Nil OR NOT lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 ) IsA FolderItem Then Return
		  If NOT PressedCleaner Then g.Transparency = 50
		  
		  'If App.ScalingFactor = 1 Then
		  'g.DrawPicture( tb_clean, 0, 0 )
		  'Else
		  g.ScaleImage( template_clean, g.Width, g.Height, 0, 0 )
		  'End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If ThisEpisode = Nil OR NOT lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 ) IsA FolderItem Then Return False
		  If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		    PressedCleaner = True
		    Me.Reload
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If ThisEpisode = Nil OR NOT lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 ) IsA FolderItem Then Return
		  'If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		  PressedCleaner = ( x > 0 And Y > 0 And x < Me.Width And Y < Me.Width )
		  Me.Reload
		  'Else
		  'PressedCleaner = False
		  'Me.Reload
		  'End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If ThisEpisode = Nil OR NOT lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 ) IsA FolderItem Then Return
		  If x > 0 And Y > 0 And x < Me.Width And Y < Me.Width Then
		    PressedCleaner = False
		    Me.Reload
		    
		    RemoveEpisode( lstEpisodes.CellTag( lstEpisodes.ListIndex, 1 ) )
		    'ReadEpisodeNFO()
		    'ppEpisodes.Value = 1
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelSave
	#tag Event
		Sub ActionCancel()
		  ppEpisodes.Value = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionOK()
		  prgWheel.Visible = True
		  SaveEpisodeNFO()
		  
		  // Title
		  lstEpisodes.Cell( lstEpisodes.ListIndex, 0 ) = ThisEpisode.Value("EpisodeName")
		  
		  // AirDate
		  lstEpisodes.Cell( lstEpisodes.ListIndex, 4 ) = ThisEpisode.Value("FirstAired")
		  
		  // DisplayEpisode
		  Dim DisplayEpisode as String = ThisEpisode.Value("EpisodeNumber")
		  If DisplayEpisode.Len = 1 Then DisplayEpisode = "0" + DisplayEpisode
		  
		  Dim Season as Integer = Val( Trim(lstEpisodes.CellTag( lstEpisodes.ListIndex, 0 ) ) )
		  If Season = -1 Then DisplayEpisode = ThisEpisode.Value("SeasonNumber") + "x" + DisplayEpisode
		  
		  lstEpisodes.Cell( lstEpisodes.ListIndex, 6 ) = DisplayEpisode
		  
		  prgWheel.Visible = False
		  
		  ppEpisodes.Value = 0
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
#tag Events udDate
	#tag Event
		Sub Up()
		  Dim DatePremiered() as String = edtPremiere.Text.Split("-")
		  
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
#tag Events upEpNr
	#tag Event
		Sub Up()
		  edtEpisodeNumber.Text = Str( Val( edtEpisodeNumber.Text ) + 1 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  edtEpisodeNumber.Text = Str( Val( edtEpisodeNumber.Text ) - 1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events upSsNr
	#tag Event
		Sub Up()
		  edtSeasonNumber.Text = Str( Val( edtSeasonNumber.Text ) + 1 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  edtSeasonNumber.Text = Str( Val( edtSeasonNumber.Text ) - 1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstActors
	#tag Event
		Sub Open()
		  'If DebugBuild Then Me.ColumnWidths = "150, 200, *, 50"
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
		  arActor.RemoveEnabled = ( Me.ListIndex > -1 )
		  pgActor.Visible = False
		  
		  If Me.ListIndex = ActorLastSelection Then Return
		  thrActor.Mode = timer.ModeOff
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
#tag Events udBeforeSeason
	#tag Event
		Sub Up()
		  edtBeforeSeason.Text = Str( Val( edtBeforeSeason.Text ) + 1 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  edtBeforeSeason.Text = Str( Val( edtBeforeSeason.Text ) - 1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events udAfterSeason
	#tag Event
		Sub Up()
		  edtAfterSeason.Text = Str( Val( edtAfterSeason.Text ) + 1 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  edtAfterSeason.Text = Str( Val( edtAfterSeason.Text ) - 1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events udBeforeEpisode
	#tag Event
		Sub Up()
		  edtBeforeEpisode.Text = Str( Val( edtBeforeEpisode.Text ) + 1 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  edtBeforeEpisode.Text = Str( Val( edtBeforeEpisode.Text ) - 1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstEpisodes
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
		  Dim iLeft as Integer = 0
		  If ( Me.ListCount - 1 ) * Me.DefaultRowHeight > Me.Height Then iLeft = 16
		  
		  Dim CellWidth as Integer = 350 ' Me.Width
		  
		  If Me.RowTag( row ) = "Folder" And _
		    y > ( Me.DefaultRowHeight / 2 ) - 8 And y < ( ( Me.DefaultRowHeight / 2 ) - 8 ) + 18 And _
		    x > CellWidth - 10 - 50 - iLeft And x < CellWidth - 10 - iLeft Then
		    
		    Me.Expanded( row ) = NOT Me.Expanded( row )
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub CollapseRow(row As Integer)
		  If Me.RowTag( Me.ListIndex ) <> "Folder" Then Me.ListIndex = Me.ParentIndex( Me.ListIndex )
		  
		  While Me.ListCount > row + 1 And Me.RowTag( row + 1 ) <> "Folder"
		    Me.RemoveRow row + 1
		  Wend
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim Season as Integer = Val( Trim( Me.CellTag( row, 0 ) ) )
		  
		  
		  For i as Integer = Episodes.Count -1 DownTo 0
		    dim jItem as New JSONItem
		    jItem = Episodes.Child(i)
		    
		    If Season > -1 then
		      If NOT jItem.HasName("SeasonNumber") OR jItem.Value("SeasonNumber") <> Season Then Continue
		    End If
		    
		    // Get the numbers
		    Dim DisplaySeason  as String = jItem.Value("SeasonNumber")
		    Dim DisplayEpisode as String = LeadingZero( jItem.Value("EpisodeNumber") )
		    
		    dim display as string = DisplayEpisode + "."
		    if season = -1 then display = DisplaySeason + "x" + DisplayEpisode
		    
		    // Find the corresponding episode file
		    Dim EpisodeFile as FolderItem
		    for each key as Variant in EpDictionary.Keys
		      dim dict as Dictionary = EpDictionary.Lookup(key, Nil)
		      if dict = nil then Continue
		      
		      Dim EpisodeNrs() as String = dict.Lookup("Episodes", Array(-1) )
		      
		      if Val( dict.Value("Season") ) = Val( jItem.Value("SeasonNumber") ) then
		        For each episodeNr as String in EpisodeNrs
		          if Val( episodeNr ) = Val( jItem.Value("EpisodeNumber") ) then
		            EpisodeFile = dict.Value("File")
		            Exit
		          end if
		          
		          if EpisodeFile <> Nil And EpisodeFile.Exists then
		            Exit
		          end if
		        Next
		        
		      end if
		      
		      if EpisodeFile <> Nil And EpisodeFile.Exists then
		        Exit
		      end if
		    next
		    
		    Dim Path as String
		    If EpisodeFile <> Nil Then Path = EpisodeFile.ShellPath
		    
		    Dim Ignored as Boolean = False
		    If jItem.HasName("ignored") Then Ignored = jItem.Value("ignored")
		    
		    // 0. Title
		    // 1. ID
		    // 2. Path
		    // 3. Watched
		    // 4. AirDate
		    // 5. Episodes.ChildNumber
		    // 6. Display Episode Number
		    // 7. Display Season Number
		    // 8. Thumb URL
		    // 9. Plot
		    // 10. Guests
		    // 11. Director
		    // 12. Writer
		    // 13. Rating
		    // 14. Ignored
		    // 15. Multi-part episode numbers
		    Me.AddRow _
		    jItem.Value("EpisodeName"), _
		    jItem.Value("id"), _
		    Path, _
		    Str( jItem.Value("watched") ).Titlecase, _
		    jItem.Value("FirstAired"), _
		    Str( i ), _
		    display, _
		    Str( Season ), _
		    jItem.Value( "filename" ), _
		    jItem.Value( "plot" ), _
		    jItem.Value( "guests" ), _
		    jItem.Value( "director" ), _
		    jItem.Value( "credits" ), _
		    jItem.Value( "Rating" ), _
		    Str( Ignored )', _
		    'Eps
		    
		    If EpisodeFile <> Nil And EpisodeFile.Exists Then
		      Me.CellTag( Me.LastIndex, 1 ) = EpisodeFile
		    End If
		  Next
		  
		  Return
		  
		  #if TargetLinux then
		    For i as Integer = Episodes.Count -1 DownTo 0
		      
		      Dim jItem as New JSONItem
		      jItem = Episodes.Child(i)
		      
		      // Get Pretty Episode Number
		      Dim DisplayEpisode as String = jItem.Value("EpisodeNumber")
		      If DisplayEpisode.Len = 1 Then DisplayEpisode = "0" + DisplayEpisode
		      // Get Pretty Season Number
		      Dim DisplaySeason as String = jItem.Value("SeasonNumber")
		      If DisplaySeason.Len = 1 Then DisplaySeason = "0" + DisplaySeason
		      
		      
		      // Find the corresponding episode file
		      Dim EpisodeFile as FolderItem
		      Dim Lindex as Integer = -1
		      
		      Dim Episodes() as String
		      Dim Eps as String
		      Dim Multi as Boolean = False
		      
		      For n as Integer = 0 to EpisodeFiles.Ubound
		        Dim OOxOO as String = RegExEpisode( EpisodeFiles(n) )
		        Dim SeasonNr as Integer = Val( OOxOO.NthField( "x", 1 ) )
		        Dim EpisodeNr as Integer = Val( OOxOO.NthField( "x", 2 ) )
		        
		        // Multi-episode?
		        Episodes = OOxOO.Split("x")
		        Multi = ( Episodes.Ubound >= 2 )
		        
		        If NOT Multi Then
		          // Check single-episodes
		          If SeasonNr = jItem.Value("SeasonNumber") And jItem.Value("EpisodeNumber") = EpisodeNr Then
		            EpisodeFile = EpisodeFiles(n)
		            Lindex = n
		            Exit
		          End If
		          
		        Else
		          
		          For t as Integer = 1 to Episodes.Ubound
		            If t = 0 Then Eps = Episodes(t) Else Eps = Eps + "," + Episodes(t)
		          Next
		          
		          // Check multi-episodes
		          For t as Integer = 1 to Episodes.Ubound
		            If SeasonNr = jItem.Value("SeasonNumber") And jItem.Value("EpisodeNumber") = Episodes(t) Then
		              EpisodeFile = EpisodeFiles(n)
		              Lindex = n
		              Exit
		            End If
		          Next
		          
		        End If
		        
		      Next
		      
		      
		      // Get Path
		      Dim Path as String
		      If EpisodeFile <> Nil Then Path = EpisodeFile.ShellPath
		      
		      Dim Ignored as Boolean = False
		      If jItem.HasName("ignored") Then Ignored = jItem.Value("ignored")
		      
		      // Append Rows
		      If jItem.HasName("SeasonNumber") And jItem.Value("SeasonNumber") = Season Then
		        // 0. Title
		        // 1. ID
		        // 2. Path
		        // 3. Watched
		        // 4. AirDate
		        // 5. Episodes.ChildNumber
		        // 6. Display Episode Number
		        // 7. Display Season Number
		        // 8. Thumb URL
		        // 9. Plot
		        // 10. Guests
		        // 11. Director
		        // 12. Writer
		        // 13. Rating
		        // 14. Ignored
		        // 15. Multi-part episode numbers
		        
		        Me.AddRow _
		        jItem.Value("EpisodeName"), _
		        jItem.Value("id"), _
		        Path, _
		        Str( jItem.Value("watched") ).Titlecase, _
		        jItem.Value("FirstAired"), _
		        Str( i ), _
		        DisplayEpisode + ".", _
		        Str( Season ), _
		        jItem.Value( "filename" ), _
		        jItem.Value( "plot" ), _
		        jItem.Value( "guests" ), _
		        jItem.Value( "director" ), _
		        jItem.Value( "credits" ), _
		        jItem.Value( "Rating" ), _
		        Str( Ignored ), _
		        Eps
		        
		      ElseIf Season = -1 Then // All Episodes
		        
		        Me.AddRow _
		        jItem.Value("EpisodeName"), _
		        jItem.Value("id"), _
		        Path, _
		        Str( jItem.Value("watched") ).Titlecase, _
		        jItem.Value("FirstAired"), _
		        Str( i ), _
		        jItem.Value("SeasonNumber") + "x" + DisplayEpisode, _
		        Str( Season ), _
		        jItem.Value( "filename" ), _
		        jItem.Value( "plot" ), _
		        jItem.Value( "guests" ), _
		        jItem.Value( "director" ), _
		        jItem.Value( "credits" ), _
		        jItem.Value( "Rating" ), _
		        Str( Ignored ), _
		        Eps
		        
		      End If
		      
		      
		      If EpisodeFile <> Nil And EpisodeFile.Exists Then
		        Me.CellTag( Me.LastIndex, 1 ) = EpisodeFile
		        Me.CellTag( Me.LastIndex, 2 ) = Lindex
		      End If
		    Next
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  'ThrMarkSeasonAsWatched.Kill
		  If Me.ListIndex < 0 Then Return
		  cvsShowInfo.Reload
		  
		  
		  If Me.RowTag( Me.ListIndex ) = "Folder" Then
		    cvsSeasonArt.Visible = True
		    cvsEpisodeInfo.Visible = False
		    GetSeasonInfo( Me.CellTag( Me.ListIndex, 0 ), cvsSeasonArt.Mode )
		    
		    ToolsMarkasWatched.Text = Menu.CMMMarkAsWatched
		  Else
		    cvsSeasonArt.Visible = False
		    cvsEpisodeInfo.Visible = True
		    
		    // Get JSON
		    If Me.Cell( Me.ListIndex, 5 ) = "" Then
		      ThisEpisode = Nil
		      Return
		    End If
		    ThisEpisode = Episodes.Child( Val( Me.Cell( Me.ListIndex, 5 ) ) )
		    cvsWatchedStatus.Reload
		    cvsClean.Reload
		    If ThisEpisode.Value("watched") Then ToolsMarkasWatched.Text = Menu.CMMMarkAsUnwatched Else ToolsMarkasWatched.Text = Menu.CMMMarkAsWatched
		    
		    // Get episode file
		    'Dim ThisEpisodeFile as FolderItem
		    'If Me.Cell( Me.ListIndex, 1 ) <> "" Then
		    'ThisEpisodeFile = Me.CellTag( Me.ListIndex, 1 )
		    'End If
		    Self.Title = Me.Cell( Me.ListIndex, 4 )
		    
		    Dim Page as String = HTML
		    
		    
		    // Episode Thumb
		    Dim EpisodeFile as FolderItem = Me.CellTag( Me.ListIndex, 1 )
		    Dim EpisodeThumbFile as FolderItem
		    If EpisodeFile <> Nil And EpisodeFile.Exists Then EpisodeThumbFile = EpisodeFile.Parent.Child( EpisodeFile.NameNoExtension + ".jpg" )
		    If EpisodeFile <> Nil And EpisodeFile.Exists And ( EpisodeThumbFile = Nil OR NOT EpisodeThumbFile.Exists ) Then EpisodeThumbFile = EpisodeFile.Parent.Child( EpisodeFile.NameNoExtension + "-thumb.jpg" )
		    If EpisodeFile <> Nil And EpisodeFile.Exists And ( EpisodeThumbFile = Nil OR NOT EpisodeThumbFile.Exists ) Then EpisodeThumbFile = EpisodeFile.Parent.Child( EpisodeFile.NameNoExtension + ".videoimage.jpg" )
		    
		    'Page = Page.ReplaceAll( "%thumb%", "file://" + TVAttr.FolderParent.Child("fanart.jpg").ShellPath.ReplaceAll("\","") ) 'EpisodeThumbFile.ShellPath.ReplaceAll("\","") )
		    If EpisodeThumbFile <> Nil And EpisodeThumbFile.Exists Then
		      Page = Page.ReplaceAll( "%thumb%", "file://" + EpisodeThumbFile.Parent.ShellPath.ReplaceAll("\", "") + "/" + URLEncode( EpisodeThumbFile.name ) )
		    ElseIf Me.Cell( Me.ListIndex, 8 ) <> "" Then
		      Page = Page.ReplaceAll( "%thumb%", Me.Cell( Me.ListIndex, 8 ) )
		    Else
		      Page = Page.ReplaceAll( "%thumb%", "file://" + App.ExecutableFile.Parent.Parent.Child("Resources").Child("episodethumb-placeholder.jpg").ShellPath.ReplaceAll("\","") )
		    End If
		    
		    
		    // Directors
		    If ThisEpisode.Value("director") <> "" Then
		      Page = Page.ReplaceAll( "%directors%", Loc.mDirector )
		      Page = Page.ReplaceAll( "%directorlist%", ThisEpisode.Value("director") )
		    Else
		      Page = Page.ReplaceAll("<p class=""credits""><b>%directors%</b> %directorlist%</p>", "" )
		    End If
		    
		    // Writers
		    If ThisEpisode.Value("credits") <> "" Then
		      Page = Page.ReplaceAll( "%writers%", Loc.mWriter )
		      Page = Page.ReplaceAll( "%writerlist%", ThisEpisode.Value("credits") )
		    Else
		      Page = Page.ReplaceAll("<p class=""credits""><b>%writers%</b> %writerlist%</p>", "" )
		    End If
		    
		    // Guests
		    If ThisEpisode.Value("guests") <> "" Then
		      Page = Page.ReplaceAll( "%guests%", Loc.kGuests )
		      Page = Page.ReplaceAll( "%guestslist%", ThisEpisode.Value("guests") )
		    Else
		      Page = Page.ReplaceAll("<p class=""credits""><b>%guests%</b> %guestslist%</p>", "" )
		    End If
		    
		    
		    // Plot
		    Dim Plot as String = ThisEpisode.Value("plot").StringValue.ReplaceAll( EndOfLine.UNIX, "<br/>" )
		    Page = Page.ReplaceAll( "%plot%", Plot )
		    
		    
		    // HTML Plot
		    htmlPlot.Top = ( 64 * 2 ) + 1
		    htmlPlot.Height = cvsEpisodeInfo.Height - htmlPlot.Top - 1
		    
		    // Prevent an HTMLViewer error.
		    Dim f as FolderItem = SpecialFolder.Temporary.Child( App.Identifier ).Child( "episode.html" )
		    If f <> Nil And NOT f.Exists Then WriteTextFile( Page, f )
		    
		    htmlPlot.LoadPage( Page, f )
		    'f.ShowInFinder
		    
		    cvsEpisodeInfo.Reload
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim File as FolderItem = Me.CellTag( Me.ListIndex, 1 )
		  Dim Folder as Boolean = ( Me.RowTag( Me.ListIndex ) = "Folder" )
		  
		  
		  If DebugBuild Then
		    If NOT Folder And File IsA FolderItem Then base.Append new MenuItem( "Get Hash", "GetHash" )
		    If NOT Folder And File IsA FolderItem Then base.Append New MenuItem("-")
		  End If
		  
		  
		  If NOT Folder Then base.Append New MenuItem( Loc.kEditMetadata, "EditMetadata" ) // Edit Metadata
		  
		  // Mark Episode as (un)Watched
		  If NOT Folder And Me.Cell( Me.ListIndex, 3 ) <> "True" Then base.Append New MenuItem( Menu.CMMMarkAsWatched,   "MarkAsWatched" )
		  If NOT Folder And Me.Cell( Me.ListIndex, 3 ) =  "True" Then base.Append New MenuItem( Menu.CMMMarkAsUnwatched, "MarkAsUnWatched" )
		  
		  // Mark episode as (un)Ignored
		  'If NOT Folder And Me.Cell( Me.ListIndex, 14 ) <> "True" Then base.Append New MenuItem( "Mark as Ignored", "MarkAsIgnored" )
		  'If NOT Folder And Me.Cell( Me.ListIndex, 14 )  = "True" Then base.Append New MenuItem( "Mark as Unignored", "MarkAsUnIgnored" )
		  
		  // Mark Folder as (un)Watched)
		  If Folder Then base.Append New MenuItem( Menu.CMMMarkAsWatched,   "MarkFolderAsWatched" )
		  If Folder Then base.Append New MenuItem( Menu.CMMMarkAsUnwatched, "MarkFolderAsUnWatched" )
		  
		  base.Append New MenuItem( "-" ) // ------
		  If File <> Nil And File.Exists Then base.Append New MenuItem( Menu.FileShowInFinder, "RevealInFinder" )    // Show In Finder
		  base.Append New MenuItem( "-" ) // ------
		  If NOT Folder And File IsA FolderItem Then base.Append New MenuItem( kWatchEpisode, "WatchEpisode" )    // Watch Episode
		  If NOT Folder And File IsA FolderItem Then base.Append New MenuItem( kRemoveEpisode, "RemoveEpisode" )  // Remove Episode
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Dim File as FolderItem = Me.CellTag( Me.ListIndex, 1 )
		  
		  Select Case hitItem.Tag
		    
		    // Debug - Get Hash
		  Case "GetHash"
		    If File IsA FolderItem And File.Type = "video/any" Then MsgBox Hash( File ) Else MsgBox "Not a valid movie file"
		    
		  Case "RevealInFinder"
		    If File IsA FolderItem Then File.RevealInFinder
		    
		  Case "WatchEpisode"
		    If File IsA FolderItem And Me.RowTag( Me.ListIndex ) <> "Folder" Then File.Launch
		    
		  Case "EditMetadata"
		    ReadEpisodeNFO()
		    ppEpisodes.Value = 1
		    
		    // Remove Episode
		  Case "RemoveEpisode"
		    RemoveEpisode( File )
		    
		    
		    // Mark Episode as Watched
		  Case "MarkAsWatched"
		    MarkItem( True )
		    
		    // Mark Episode as Unwatched
		  Case "MarkAsUnWatched"
		    MarkItem( False )
		    
		    
		    // Mark Episode as Ignored
		  Case "MarkAsIgnored"
		    'MarkItemIgnored( True )
		    
		  Case "MarkAsUnignored"
		    'MarkItemIgnored( False )
		    
		    
		    // Mark Folder as Watched
		  Case "MarkFolderAsWatched"
		    'MarkFolder( True, lstEpisodes.CellTag( lstEpisodes.ListIndex, 0 ) )
		    MarkAsWatched = True
		    ThrMarkSeasonAsWatched.Mode = timer.ModeOff
		    ThrMarkSeasonAsWatched.Mode = timer.ModeSingle
		    
		    // Mark Folder As Unwatched
		  Case "MarkFolderAsUnWatched"
		    MarkAsWatched = False
		    'MarkFolder( False, lstEpisodes.CellTag( lstEpisodes.ListIndex, 0 ) )
		    ThrMarkSeasonAsWatched.Mode = timer.ModeOff
		    ThrMarkSeasonAsWatched.Mode = timer.ModeSingle
		    
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If Me.RowTag( Me.ListIndex ) = "Folder" OR ThisEpisode = Nil Then Return
		  ReadEpisodeNFO()
		  ppEpisodes.Value = 1
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key as String) As Boolean
		  
		  If Me.ListIndex > -1 And Me.CellTag( Me.ListIndex, 1 ) IsA FolderItem And Keyboard.AsyncCommandKey And Asc(Key) = 8 Then
		    RemoveEpisode( Me.CellTag( Me.ListIndex, 1 ) )
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If column > 0 Then Return False
		  
		  Dim Today as New Date, Showdate as New Date
		  Dim b as Boolean = False
		  If Row < Me.ListCount And Me.Cell( row, 4 ) <> "" Then
		    'Showdate.GMTOffset = Val( Me.Cell( row, 4 ).NthField( "G", 2 ) )
		    Dim ReviewDate as String
		    If ActiveSection = 1 Then
		      ReviewDate = TVAttr.NextAired_Date
		      If ReviewDate = "" Then ReviewDate = TVAttr.LastAired_Date
		    ElseIf ActiveSection = 2 Then
		      
		    End If
		    Showdate.GMTOffset = Val( ReviewDate.NthField( "G", 2 ) )
		    
		    ShowDate.Hour      = Val( ReviewDate.NthField( "T", 2 ).NthField( ":", 1 ) )
		    ShowDate.Minute    = Val( ReviewDate.NthField( "T", 2 ).NthField( ":", 2 ).NthField( "G", 1 ) )
		    
		    Showdate.Day   = Val( Me.Cell( row, 4 ).NthField( "-", 3 ) )
		    Showdate.Month = Val( Me.Cell( row, 4 ).NthField( "-", 2 ) )
		    Showdate.Year  = Val( Me.Cell( row, 4 ).NthField( "-", 1 ) )
		    Showdate.GMTOffset = Today.GMTOffset
		    
		    b = ( Showdate.Year > Today.Year OR _
		    ( Showdate.Year = Today.Year And Showdate.Month > Today.Month ) OR _
		    ( Showdate.Year = Today.Year AND Showdate.Month = Today.Month And Showdate.Day > Today.Day ) )
		  End If
		  
		  // Set foreground color
		  If Me.Active And Me.Enabled And Row < Me.ListCount And Me.Cell( row, 3 ) = "true" Then
		    g.ForeColor = RGBa( 100, 85, 85 ) // Marked as Watched
		  ElseIf Me.Active And Me.EnableD And Row < Me.ListCount And ( Me.Cell( row, 4 ) = "" OR b ) Then
		    g.ForeColor = RGBa( 91, 91, 96 ) // Futuredate
		  ElseIf Me.Active And Me.Enabled Then
		    g.ForeColor = RGBa( 91, 91, 91 )
		  Else
		    g.ForeColor = RGBa( 100, 100, 100 )
		  End If
		  
		  // Draw background
		  If Row < Me.ListCount And Me.RowTag( row ) = "Folder" Then
		    g.DrawGradient( RGBa( 100, 100, 100 ), RGBa( 90, 90, 90 ), 0, 0, g.Width * 2, g.Height * 2)
		  Else
		    g.FillRect 0, 0, g.Width, g.Height
		  End If
		  
		  // Draw shadow/HiLite lines
		  If Row < Me.ListCount Then
		    // Top Border
		    g.ForeColor = RGBa( 100, 100, 100 )
		    g.DrawLine 0, 0, g.Width, 0
		    
		    // Bottom Border
		    g.ForeColor = RGBa(   0,   0,   0, .10 )
		    g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		  End If
		  
		  // Selection Gradient
		  If row > -1 And Me.Selected( row ) then
		    If Me.Cell( row, 3 ) = "true" Then
		      g.DrawGradient( RGBa( 80, 70, 80 ), RGBa( 70, 60, 70 ), 0, 0, g.Width, g.Height ) // Marked as Watched
		    ElseIf Me.RowTag( row ) = "Folder" Then
		      g.DrawGradient( RGBa( 80, 80, 80), RGBa( 70, 70, 70 ), 0, 0, g.Width, g.Height )
		      
		      // Transparent white top border
		      g.ForeColor = RGBa( 100, 100, 100, .70 )
		      g.DrawLine( 0, 0, g.Width, 0 )
		    Else
		      // General Row
		      
		      // Colors
		      Dim StartColor, EndColor, TopColor, BorderTopColor, BorderBottomColor as Color
		      If NOT Me.Active OR NOT me.Enabled then
		        StartColor        = RGBa( 73, 77, 87 )
		        EndColor          = RGBa( 60, 66, 78 )
		      Else
		        StartColor        = RGBa( 45, 69, 89 )
		        EndColor          = RGBa( 28, 51, 82 )
		      End If
		      TopColor          = RGBa( 100, 100, 100, .25 )
		      BorderTopColor    = RGBa(   0,   0,   0,  .05 )
		      BorderBottomColor = RGBa(   0,   0,   0, .10 )
		      
		      g.DrawGradient( StartColor, EndColor, 0, 0, g.Width, g.Height )
		      
		      g.ForeColor = TopColor
		      g.DrawLine 0, 1, g.Width, 1
		      
		      g.ForeColor = BorderTopColor
		      g.DrawLine 0, 0, g.Width, 0
		      
		      g.ForeColor = BorderBottomColor
		      g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		    End If
		  End If
		  
		  
		  // Folder Shadow
		  If Row < Me.ListCount - 1 And row > 0 And Me.RowTag( row - 1 ) = "Folder" And Me.Expanded( row - 1 ) And Me.RowTag( row ) <> "Folder" Then 'And NOT Me.Selected( row ) Then
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .25 ) Else g.ForeColor = RGBa( 0, 0, 0, .35 )
		    g.DrawLine 0, 0, g.Width, 0
		    
		    g.ForeColor = RGBa( 0, 0, 0, .15 )
		    g.DrawLine 0, 1, g.Width, 1
		    
		    g.ForeColor = RGBa( 0, 0, 0, .05 )
		    g.DrawLine 0, 2, g.Width, 2
		  End If
		  
		  
		  // Show/Hide Button
		  If Row < Me.ListCount And Me.RowTag( row ) = "Folder" Then
		    g.TextFont = "Arial Narrow Bold"
		    g.TextSize = 13
		    
		    Dim btnText as String = Loc.kShow
		    If Me.Expanded( row ) Then btnText = Loc.kHide
		    btnText = btnText.Uppercase
		    
		    // Draw button bg
		    g.ForeColor = RGBa( 100, 100, 100 )
		    g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 7,   50, 18,   10, 10
		    
		    g.ForeColor = RGBa( 65, 65, 65 )
		    g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 9,   50, 18,   10, 10
		    
		    If Me.selected( row ) Then g.ForeColor = RGBa( 85, 85, 85 ) Else g.ForeColor = RGBa( 75, 75, 75 )
		    g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 8,   50, 18,   10, 10
		    
		    // Draw button text
		    g.ForeColor = RGBa( 100, 100, 100 )
		    g.DrawString btnText, ( ( g.Width - 10 - 50 ) + 25 ) - ( g.StringWidth( btnText ) / 2 ), g.TextSize + 1 + ( g.Height / 2 ) - ( g.StringHeight( btnText, Me.Width ) / 2 )
		    
		    g.ForeColor = RGBa( 35, 35, 35)
		    g.DrawString btnText, ( ( g.Width - 10 - 50 ) + 25 ) - ( g.StringWidth( btnText ) / 2 ), g.TextSize + ( g.Height / 2 ) - ( g.StringHeight( btnText, Me.Width ) / 2 )
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If Row >= Me.ListCount OR column > 0 Then Return False
		  g.Bold = Me.Selected( row )
		  
		  // ## Folder
		  If Me.RowTag( row ) = "Folder" Then
		    // ## Draw Title
		    g.TextSize = 16
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		    g.DrawString Me.Cell( row, column ), 10, g.TextSize + ( g.Height / 2 ) - ( g.TextSize / 2 ) + 1
		    
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		    g.DrawString Me.Cell( row, column ), 10, g.TextSize + ( g.Height / 2 ) - ( g.TextSize / 2 )
		    
		    // Draw Episode Count
		    if me.Selected(row) then
		      g.TextFont = "Arial Bold"
		    else
		      g.TextFont = "Arial Narrow Bold"
		    end if
		    
		    #if DebugBuild then
		      Dim TotalEpisodeCount as String = Me.Cell( row, 1 )
		      Dim UnWatchedCount    as String = Str( Val( Me.Cell( row, 1 ) ) - Val( Me.Cell( row, 2 ) ) )
		      Dim EpisodeFileCount  as String = Me.Cell( row, 3 )
		      
		      g.TextSize = 11
		      Dim Spacer as Integer = 4
		      Dim WordRight as Integer = 110
		      Dim NrRight as Integer = 80
		      
		      // Total episodes
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString "Total " + Loc.kEpisodes, g.Width - WordRight - g.StringWidth( "Total " + Loc.kEpisodes ), g.TextAscent + Spacer + 1
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      g.DrawString "Total " + Loc.kEpisodes, g.Width - WordRight - g.StringWidth( "Total " + Loc.kEpisodes ), g.TextAscent + Spacer
		      
		      // Unwatched
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString loc.kUnwatched, g.Width - WordRight - g.StringWidth( Loc.kUnwatched ), ( ( g.TextAscent + Spacer ) * 2 ) + 1
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      g.DrawString Loc.kUnwatched, g.Width - WordRight - g.StringWidth( Loc.kUnwatched ), ( g.TextAscent + Spacer ) * 2
		      
		      // Local Files
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString "Local Files", g.Width - WordRight - g.StringWidth( "Local Files" ), ( ( g.TextAscent + Spacer ) * 3 ) + 1
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      g.DrawString "Local Files", g.Width - WordRight - g.StringWidth( "Local Files" ), ( g.TextAscent + Spacer ) * 3
		      
		      // ## Numbers
		      'g.TextFont = "Arial Bold"
		      
		      // Total Episodes
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString TotalEpisodeCount, g.Width - NrRight - g.StringWidth( TotalEpisodeCount ), g.TextAscent + Spacer + 1
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      g.DrawString TotalEpisodeCount, g.Width - NrRight - g.StringWidth( TotalEpisodeCount ), g.TextAscent + Spacer
		      
		      // Unwatched
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString UnWatchedCount, g.Width - NrRight - g.StringWidth( UnWatchedCount ), ( ( g.TextAscent + Spacer ) * 2 ) + 1
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      g.DrawString UnWatchedCount, g.Width - NrRight - g.StringWidth( UnWatchedCount ), ( g.TextAscent + Spacer ) * 2
		      
		      // Local Files
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString EpisodeFileCount, g.Width - NrRight - g.StringWidth( EpisodeFileCount ), ( ( g.TextAscent + Spacer ) * 3 ) + 1
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      g.DrawString EpisodeFileCount, g.Width - NrRight - g.StringWidth( EpisodeFileCount ), ( g.TextAscent + Spacer ) * 3
		      
		    #else
		      // Set widths
		      Dim UnWatchedCount as Integer = Val( Me.Cell( row, 1 ) ) - Val( Me.Cell( row, 2 ) )
		      Dim EpisodeFileCount as Integer = Val( Me.Cell( row, 3 ) )
		      g.TextSize = 26
		      Dim EpCountStrWidth as Integer = g.StringWidth( Me.Cell( row, 1 ) )
		      Dim EpWatchStrWidth as Integer = g.StringWidth( Str( UnWatchedCount ) )
		      Dim EpFilesStrWidth as Integer = g.StringWidth( me.Cell( row, 3 ) )
		      g.TextSize = 11
		      Dim EpisodesStrWidth as Integer = g.StringWidth( Loc.kEpisodes )
		      Dim WatchedStrWidth  as Integer = g.StringWidth( Loc.kUnwatched )
		      Dim FilesStrWidth as Integer = g.StringWidth( "Local Files" )
		      
		      
		      // ## Episode Count
		      g.TextSize = 26
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString Me.Cell( row, 1 ), g.Width - 80 - ( EpisodesStrWidth / 2 ) - ( EpCountStrWidth / 2 ), 3 + 1 + g.TextSize
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      g.DrawString Me.Cell( row, 1 ), g.Width - 80 - ( EpisodesStrWidth / 2 ) - ( EpCountStrWidth / 2 ), 3 + g.TextSize
		      
		      // "Episodes"
		      g.TextSize = 11
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString Loc.kEpisodes, g.Width - 80 - EpisodesStrWidth, g.Height - 6 + 1
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      g.DrawString Loc.kEpisodes, g.Width - 80 - EpisodesStrWidth, g.Height - 6
		      
		      // Vertical seperator lines
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100, .4 ) Else g.ForeColor = RGBa( 0, 0, 0, .20 )
		      g.DrawLine g.Width - 80 - EpisodesStrWidth - 10, 10, g.Width - 80 - EpisodesStrWidth - 10, g.Height - 10
		      g.DrawLine g.Width - 20 - EpisodesStrWidth - 10, 10, g.Width - 20 - EpisodesStrWidth - 10, g.Height - 10
		      
		      
		      // ## Watched Count
		      If UnWatchedCount > 0 Then
		        g.TextSize = 26
		        If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		        g.DrawString Str( UnWatchedCount ), g.Width - ( 140 ) - ( WatchedStrWidth / 2 ) - ( EpWatchStrWidth / 2 ), 3 + 1 + g.TextSize
		        
		        If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		        g.DrawString Str( UnWatchedCount ), g.Width - ( 140 ) - ( WatchedStrWidth / 2 ) - ( EpWatchStrWidth / 2 ), 3 + g.TextSize
		        
		        // "Episodes"
		        g.TextSize = 11
		        If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		        g.DrawString Loc.kUnwatched, g.Width - 140 - WatchedStrWidth, g.Height - 6 + 1
		        
		        If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		        g.DrawString Loc.kUnwatched, g.Width - 140 - WatchedStrWidth, g.Height - 6
		        
		        // Vertical seperator line
		        If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100, .4 ) Else g.ForeColor = RGBa( 0, 0, 0, .20 )
		        g.DrawLine g.Width - 140 - WatchedStrWidth - 10, 10, g.Width - 140 - WatchedStrWidth - 10, g.Height - 10
		      End If
		      
		      
		      // ## Episode Files
		      'If EpisodeFileCount > 0 then
		      'g.TextSize = 26
		      'dim right as Integer = 210
		      'If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      'g.DrawString Str( EpisodeFileCount ), g.Width - ( right ) - ( FilesStrWidth / 2 ) - ( EpFilesStrWidth / 2 ), 3 + 1 + g.TextSize
		      '
		      'If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      'g.DrawString Str( EpisodeFileCount ), g.Width - ( right ) - ( FilesStrWidth / 2 ) - ( EpFilesStrWidth / 2 ), 3 + g.TextSize
		      '
		      '// "Episodes"
		      'g.TextSize = 11
		      'If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      'g.DrawString "Local Files", g.Width - right - FilesStrWidth, g.Height - 6 + 1
		      '
		      'If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		      'g.DrawString "Local Files", g.Width - right - FilesStrWidth, g.Height - 6
		      '
		      '// Vertical seperator line
		      'If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100, .4 ) Else g.ForeColor = RGBa( 0, 0, 0, .20 )
		      'g.DrawLine g.Width - right - FilesStrWidth - 10, 10, g.Width - right - FilesStrWidth - 10, g.Height - 10
		      'End If
		    #endif
		    
		  Else
		    // Episodes
		    Dim PosterSize as Integer = 48 - 10
		    Dim TextLeft as Integer = 45 + 28
		    If Me.Cell( row, 7 ) = "-1" Then TextLeft = 60 + 28
		    g.TextSize = 14
		    
		    Dim TitleTop as Integer = g.TextSize + ( g.Height / 4 ) - ( g.TextSize / 2 )
		    Dim SubTop   as Integer = g.TextSize + ( g.Height / 4 ) + ( g.TextSize )
		    
		    
		    // ## Left Status Icon
		    Dim i as Integer = 0
		    If Me.DefaultRowHeight <= 22 Then i = 3
		    
		    Dim PosterInfo as Picture = videoclean
		    
		    // Retina
		    If App.ScalingFactor = 2 Then
		      
		      If Me.Cell( row, 2 ) <> "" Then
		        If Me.Cell( row, 3 ) = "False" Then
		          PosterInfo = videounwatched2x
		        ElseIf Me.Cell( row, 3 ) = "True" Then
		          PosterInfo = videowatched2x
		        Else
		          PosterInfo = videoclean2x
		        End If
		      Else
		        PosterInfo = videoclean2x
		      End If
		      
		      // SD
		    Else'If App.ScalingFactor = 1 Then
		      
		      If Me.Cell( row, 2 ) <> "" Then
		        If Me.Cell( row, 3 ) = "False" Then
		          PosterInfo = videounwatchedsmall
		        ElseIf Me.Cell( row, 3 ) = "True" Then
		          PosterInfo = videowatchedsmall
		        Else
		          PosterInfo = videocleansmall
		        End If
		      Else
		        PosterInfo = videocleansmall
		      End If
		      
		    End If
		    
		    g.DrawPicture PosterInfo, 5 - i, ( Me.DefaultRowHeight / 2 ) - ( PosterSize / 2 ), PosterSize / 1.5, PosterSize,  0, 0, PosterInfo.Width, PosterInfo.Height
		    
		    
		    
		    // Episode
		    'g.TextSize = 12 + 14 + 6
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		    g.DrawString Me.Cell( row, 6 ), 10 + 28, TitleTop + 1
		    
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		    g.DrawString Me.Cell( row, 6 ), 10 + 28, TitleTop
		    
		    
		    // Title
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		    g.DrawString Me.Cell( row, column ), TextLeft, TitleTop + 1, g.Width - TextLeft - 35, True
		    
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 20, 20, 20 )
		    g.DrawString Me.Cell( row, column ), TextLeft, TitleTop, g.Width - TextLeft - 35, True
		    
		    
		    // Air Date
		    If Me.Cell( row, 4 ) <> "" Then
		      Dim ShowDate as New Date
		      Dim LocalGMT as Integer = ShowDate.GMTOffset
		      
		      Dim ReviewDate as String
		      If ActiveSection = 1 Then
		        ReviewDate = TVAttr.NextAired_Date
		        If ReviewDate = "" Then ReviewDate = TVAttr.LastAired_Date
		      ElseIf ActiveSection = 2 Then
		        'ReviewDate = AnimeAttr.NextAired_Date
		        'If ReviewDate = "" Then ReviewDate = AnimeAttr.LastAired_Date
		      End If
		      
		      Dim SplitDate() as String = Split( Me.Cell( row, 4 ), "-" )
		      
		      If SplitDate.Ubound > 0 Then
		        ShowDate.GMTOffset = Val( ReviewDate.NthField( "G", 2 ) )
		        
		        ShowDate.Year  = Val( SplitDate(0) )
		        ShowDate.Month = Val( SplitDate(1) )
		        ShowDate.Day   = Val( SplitDate(2) )
		        
		        ShowDate.Hour      = Val( ReviewDate.NthField( "T", 2 ).NthField( ":", 1 ) )
		        ShowDate.Minute    = Val( ReviewDate.NthField( "T", 2 ).NthField( ":", 2 ).NthField( "G", 1 ) )
		        
		        // Set back to local GMT
		        ShowDate.GMTOffset = LocalGMT
		      End If
		      
		      Dim Boringdate as String = Str( ShowDate.Year ) + "-" + Str( ShowDate.Month ) + "-" + Str( ShowDate.Day )
		      
		      
		      g.TextSize = 12
		      g.Bold = False
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .40 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.DrawString PrettyDate( Boringdate, True ), TextLeft, SubTop + 1
		      
		      If Me.Selected( row ) Then g.ForeColor = RGBa( 100, 100, 100 ) Else g.ForeColor = RGBa( 0, 0, 0, .45 )
		      g.DrawString PrettyDate( Boringdate, True ), TextLeft, SubTop
		    End If
		    
		    
		    // Rating
		    If Me.Cell( row, 13 ) <> "" and Val( Me.Cell( row, 13 ) ) > 0 then
		      If Me.ListIndex = Row Then 'OR ( Me.ListIndex >= row AND ( Row <= Me.ListIndex + Me.SelCount ) then
		        g.ForeColor = RGBa( 100, 100, 100 )
		      ElseIf Me.ListIndex <> Row and NOT me.Active then
		        g.ForeColor = RGBa( 65, 65, 65 )
		      Else
		        g.ForeColor = RGBa( 60, 65, 70 )
		      End If
		      
		      Dim Rate as String = Me.Cell( row, 13 )
		      
		      g.FillRoundRect g.Width - g.StringWidth( Rate ) - 15, 6, g.StringWidth( Rate ) + 10, g.TextSize + 3, 15, 15
		      
		      If Me.ListIndex = Row then g.ForeColor = RGBa( 60, 65, 70 ) Else g.ForeColor = RGBa( 100, 100, 100 )
		      g.Bold = True
		      g.DrawString Rate, g.Width - g.StringWidth( Rate ) - 10, 6 + g.TextSize
		    End If
		    
		    'If Me.Cell( row, 3 ) = "False" Then
		    'g.ScaleImage( unwatched, 24, 24, g.Width - 24 - 8, g.Height - 24 - 2 )
		    'Else
		    'g.ScaleImage( watched, 24, 24, g.Width - 24 - 8, g.Height - 24 - 2 )
		    'End If
		    
		  End If
		  
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events arActor
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
#tag Events ThrMarkSeasonAsWatched
	#tag Event
		Sub Action()
		  prgMarkAsWatched.Visible = True
		  lstEpisodes.Enabled = False
		  MarkFolder( MarkAsWatched, lstEpisodes.CellTag( lstEpisodes.ListIndex, 0 ) )
		  lstEpisodes.Enabled = True
		  prgMarkAsWatched.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Initiate
	#tag Event
		Sub Action()
		  
		  prgMarkAsWatched.Visible = True
		  lstEpisodes.Enabled = False
		  
		  ReadJSON( TVAttr.ID_TVDB )
		  RefreshRect 0, 0, self.Width, self.Height, True
		  
		  lstEpisodes.Enabled = True
		  prgMarkAsWatched.Visible = False
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
		Name="MarkAsWatched"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
		Name="PressedCleaner"
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

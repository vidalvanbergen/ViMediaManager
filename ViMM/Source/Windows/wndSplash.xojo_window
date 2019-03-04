#tag Window
Begin Window wndSplash
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Compatibility   =   ""
   Composite       =   True
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   365
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
   Placement       =   0
   Resizeable      =   False
   Title           =   "#Setup"
   Visible         =   True
   Width           =   514
   Begin PagePanel ppSplash
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   364
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
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      Value           =   2
      Visible         =   True
      Width           =   514
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Welcome"
         TextAlign       =   1
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   168
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppSplash"
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
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#WelcomeParagraph"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin PushButton btnNext
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.btnNext"
         Default         =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   414
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnSkip
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   True
         Caption         =   "#Loc.btnSkip"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   322
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnFinish
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.btnFinish"
         Default         =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   414
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   6
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnBack
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   True
         Caption         =   "#Loc.btnBack"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   322
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   6
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
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
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#WhereTitleMovies"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   33
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppSplash"
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
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#WhereParagraphMovies"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   38
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin SuperListbox lstArray
         AlternatingRowColors=   True
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   False
         ColumnWidths    =   "100%, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   48
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   True
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   237
         HelpTag         =   ""
         Hierarchical    =   True
         IgnoreChange    =   False
         Index           =   0
         InitialParent   =   "ppSplash"
         InitialValue    =   ""
         IsFocused       =   False
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
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
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   75
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   474
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   33
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppSplash"
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
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#WhereParagraphTVShows"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   38
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
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
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#WhereTitleTVShows"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin SuperListbox lstArray
         AlternatingRowColors=   True
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   False
         ColumnWidths    =   "100%, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   48
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   True
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   237
         HelpTag         =   ""
         Hierarchical    =   True
         IgnoreChange    =   False
         Index           =   1
         InitialParent   =   "ppSplash"
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
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   75
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   474
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   33
         HelpTag         =   ""
         Index           =   12
         InitialParent   =   "ppSplash"
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
         TabIndex        =   2
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "Click the '+' button to browse for folders containing your anime.\rAlternatively you can drag and drop your anime folders onto the listbox."
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   38
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
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
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "#WhereTitleAnime"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin SuperListbox lstArray
         AlternatingRowColors=   True
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   False
         ColumnWidths    =   "100%, 0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   48
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   True
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   237
         HelpTag         =   ""
         Hierarchical    =   True
         IgnoreChange    =   False
         Index           =   2
         InitialParent   =   "ppSplash"
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
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   4
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   13.0
         TextUnit        =   0
         Top             =   75
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   474
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "ppSplash"
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
         TabIndex        =   2
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#FinishParagraph"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppSplash"
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
         TabIndex        =   3
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "TheMovieDB.org"
         Top             =   58
         Transparent     =   True
         URL             =   "http://themoviedb.org"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppSplash"
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
         TabIndex        =   4
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "IMDb.com"
         Top             =   82
         Transparent     =   True
         URL             =   "http://IMDb.com"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppSplash"
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
         TabIndex        =   5
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "TheTVDB.com"
         Top             =   130
         Transparent     =   True
         URL             =   "http://www.thetvdb.com"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppSplash"
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
         TabIndex        =   6
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "AniDB.net"
         Top             =   178
         Transparent     =   True
         URL             =   "http://anidb.net"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppSplash"
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
         TabIndex        =   7
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "Fanart.tv"
         Top             =   202
         Transparent     =   True
         URL             =   "http://fanart.tv"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppSplash"
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
         TabIndex        =   8
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "TVMaze.com"
         Top             =   154
         Transparent     =   True
         URL             =   "http://tvmaze.com"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   8
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionIMDB"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   82
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   9
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionTVDB"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   130
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   10
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionAniDB"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   178
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   13
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionFanartTV"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   202
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   14
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   12
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionTVRage"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   154
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   7
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionTMDB"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin PushButton btnNext
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.btnNext"
         Default         =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   414
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnNext
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.btnNext"
         Default         =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   414
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnNext
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.btnNext"
         Default         =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   414
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnBack
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   True
         Caption         =   "#Loc.btnBack"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   322
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnBack
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   True
         Caption         =   "#Loc.btnBack"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   322
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnBack
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   True
         Caption         =   "#Loc.btnBack"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   322
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnNext
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#Loc.btnNext"
         Default         =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   414
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnBack
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   True
         Caption         =   "#Loc.btnBack"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   322
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   324
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
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
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "#WhichMediaPlayer"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   33
         HelpTag         =   ""
         Index           =   15
         InitialParent   =   "ppSplash"
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
         TabIndex        =   3
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "#WhichParagraphMediaPlayer"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   38
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   474
      End
      Begin PopupMenu popMediaPlayer
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppSplash"
         InitialValue    =   "XBMC\rYAMJ\rBoxee"
         Italic          =   False
         Left            =   182
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   83
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin Canvas cvsMediaPlayer
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   777900174
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   101
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppSplash"
         Left            =   147
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   132
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   220
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   17
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   14
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionRottenTomatoes"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   106
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "ppSplash"
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
         TabIndex        =   15
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "RottenTomatoes.com"
         Top             =   106
         Transparent     =   True
         URL             =   "http://www.rottentomatoes.com"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   7
         InitialParent   =   "ppSplash"
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
         TabIndex        =   16
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "HD-Trailers.net"
         Top             =   226
         Transparent     =   True
         URL             =   "http://www.hd-trailers.net"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   18
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   17
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionHDTrailers"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   226
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin LinkLabelCanvas LinkLblArray
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   8
         InitialParent   =   "ppSplash"
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
         TabIndex        =   18
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "televisiontunes.com"
         Top             =   250
         Transparent     =   True
         URL             =   "http://www.televisiontunes.com"
         UseFocusRing    =   True
         Visible         =   True
         Width           =   152
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   19
         InitialParent   =   "ppSplash"
         Italic          =   False
         Left            =   184
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   19
         TabPanelIndex   =   6
         TabStop         =   True
         Text            =   "#DescriptionTVTunes"
         TextAlign       =   0
         TextColor       =   &c0A0A0A00
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   250
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      BeginSegmented AddRemoveButton AddRemoveMediaLists
         AddEnabled      =   False
         Enabled         =   True
         Height          =   24
         Index           =   0
         InitialParent   =   "ppSplash"
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
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   324
         Transparent     =   False
         Visible         =   True
         Width           =   48
      End
      BeginSegmented AddRemoveButton AddRemoveMediaLists
         AddEnabled      =   False
         Enabled         =   True
         Height          =   24
         Index           =   1
         InitialParent   =   "ppSplash"
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
         TabIndex        =   8
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   324
         Transparent     =   False
         Visible         =   True
         Width           =   48
      End
      BeginSegmented AddRemoveButton AddRemoveMediaLists
         AddEnabled      =   False
         Enabled         =   True
         Height          =   24
         Index           =   2
         InitialParent   =   "ppSplash"
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
         TabIndex        =   8
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   324
         Transparent     =   False
         Visible         =   True
         Width           =   48
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Preferences.Prefs.boolForKey("SplashShown") = True
		  'self.bottomBorderThickness = 48
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim BottomHeight as Integer = g.Height
		  #If TargetCocoa Then
		    'BottomHeight = g.Height - 14 - 20 - 14 - 1
		    if Globals.IsDarkMode then
		      g.DrawGradient( hsl(0, 0, 55), hsl(0, 0, 35), 0, 0, g.Width, BottomHeight )
		    else
		      g.DrawGradient( hsl(0, 0, 95), hsl(0, 0, 75), 0, 0, g.Width, BottomHeight )
		    end if
		  #endif
		End Sub
	#tag EndEvent


	#tag Constant, Name = DescriptionAniDB, Type = String, Dynamic = True, Default = \"- The most complete internet anime database.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- The most complete internet anime database."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- De meest complete internet anime database."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- Den mest kompletta internetdatabasen f\xC3\xB6r tecknade filmer."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- Die vollst\xC3\xA4ndigste Internet-Anime-Datenbank."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- La plus compl\xC3\xA8te des bases de donn\xC3\xA9es d\'animes sur internet."
	#tag EndConstant

	#tag Constant, Name = DescriptionFanartTV, Type = String, Dynamic = True, Default = \"- Central repository for media centre fanart.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- Central repository for media centre fanart."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- Centrale opslagplaats voor media center fanart."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- Centralt arkiv f\xC3\xB6r Mediacenter Fanart."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- Die zentrale Anlaufstelle f\xC3\xBCr Media-Center-Fanart."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- D\xC3\xA9positaire central de fanart pour Media Center."
	#tag EndConstant

	#tag Constant, Name = DescriptionHDTrailers, Type = String, Dynamic = True, Default = \"- Best place on the web to download HD trailers.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- Best place on the web to download HD trailers."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- De beste plaats op het internet voor HD trailers."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- Meilleur endroit sur le web pour t\xC3\xA9l\xC3\xA9charger des bandes-annonces en HD."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- Der bester Platz wenn man HD-Trailer sucht."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- B\xC3\xA4sta st\xC3\xA4llet p\xC3\xA5 webben att ladda ner HD-trailers."
	#tag EndConstant

	#tag Constant, Name = DescriptionIMDB, Type = String, Dynamic = True, Default = \"- The internet movie database.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- The internet movie database."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- De internet film database."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- Filmdatabas p\xC3\xA5 Internet."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- Die Internet-Film-Datenbank."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- The internet movie database."
	#tag EndConstant

	#tag Constant, Name = DescriptionRottenTomatoes, Type = String, Dynamic = True, Default = \"- The ultimate movie database.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- The ultimate movie database."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- De ultieme movie database."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- Den b\xC3\xA4sta filmdatabasen."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- Die ultimative Film Datenbank."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- The ultimate movie database."
	#tag EndConstant

	#tag Constant, Name = DescriptionTMDB, Type = String, Dynamic = True, Default = \"- The open movie database.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- The open movie database."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- De open film database."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- Den \xC3\xB6ppna filmdatabasen."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- Die Offene-Film-Datenbank."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- The open movie database."
	#tag EndConstant

	#tag Constant, Name = DescriptionTVDB, Type = String, Dynamic = True, Default = \"- An open database for television fans.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- An open database for television fans."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- Een open database voor televisie fans."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- En \xC3\xB6ppen databas f\xC3\xB6r TV-fantaster."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- Eine offene Datenbak f\xC3\xBCr Serien Fans."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- Une base de donn\xC3\xA9es ouverte pour les fans de t\xC3\xA9l\xC3\xA9vision."
	#tag EndConstant

	#tag Constant, Name = DescriptionTVRage, Type = String, Dynamic = True, Default = \"- Television show guides and air dates.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- Television show guides and air dates."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- Televisie serie gidsen en uitzend data."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- Tv-guider och s\xC3\xA4ndningsdatum."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- Serienf\xC3\xBChrer und Ausstrahlungstermine."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- Guide TV des \xC3\xA9missions avec dates de diffusion."
	#tag EndConstant

	#tag Constant, Name = DescriptionTVTunes, Type = String, Dynamic = True, Default = \"- TV theme music and songs.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"- TV theme music and songs."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"- TV thema muziek en liedjes."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"- G\xC3\xA9n\xC3\xA9riques de S\xC3\xA9ries TV."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"- TV Titelmelodien"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"- TV temamusik och s\xC3\xA5nger."
	#tag EndConstant

	#tag Constant, Name = FinishParagraph, Type = String, Dynamic = True, Default = \"ViMediaManager gathers information about your media from the following providers. Many thanks go out to the people who make these services possible!", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"ViMediaManager gathers information about your media from the following providers. Many thanks go out to the people who make these services possible!"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"ViMediaManager verzamelt informatie over uw media van de volgende diensten. Mijn dank gaat uit naar alle mensen die deze diensten mogelijk maken!"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"ViMediaManager h\xC3\xA4mtar information om dina mediafiler fr\xC3\xA5n f\xC3\xB6ljande leverant\xC3\xB6rer. V\xC3\xA5rt tack g\xC3\xA5r till alla de m\xC3\xA4nniskor som g\xC3\xB6r dessa tj\xC3\xA4nster m\xC3\xB6jligt!"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"ViMediaManager benutzt Informationen f\xC3\xBCr deine Medien von folgenden Anbietern. Vielen Dank an die Personen welche  diese Dienste erm\xC3\xB6glichen!"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"ViMediaManager recherche des informations sur vos m\xC3\xA9dias depuis les sites ci-dessous. Sinc\xC3\xA8res remerciements \xC3\xA0 tous ceux qui rendent ces services possibles !"
	#tag EndConstant

	#tag Constant, Name = Setup, Type = String, Dynamic = True, Default = \"Setup", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Setup"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Instellingen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Inst\xC3\xA4llning"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Einrichten"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Configuration"
	#tag EndConstant

	#tag Constant, Name = Welcome, Type = String, Dynamic = True, Default = \"Welcome to ViMediaManager!", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Welcome to ViMediaManager!"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Welkom bij ViMediaManager!"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Tack f\xC3\xB6r att du anv\xC3\xA4nder ViMediaManager"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Willkommen im ViMediaManager!"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Merci d\'utiliser ViMediaManager !"
	#tag EndConstant

	#tag Constant, Name = WelcomeParagraph, Type = String, Dynamic = True, Default = \"To help you get started\x2C we\'d like to guide you through a few steps to set up your media library.\rYou can always change these settings later through the preferences.\r\rClick on the next button to begin.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"To help you get started\x2C we\'d like to guide you through a few steps to set up your media library.\rYou can always change these settings later through the preferences.\r\rClick on the next button to begin."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Om u te helpen wil ik u graag door een paar stappen leiden om uw media bibliotheek aan ViMediaManager toe te voegen.\rAls u deze instellingen later wilt aanpassen kunt u dit doen via het voorkeuren menu.\r\rKlik op de \'Volgende\' knop om te beginnen."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"F\xC3\xB6r att hj\xC3\xA4lpa dig komma ig\xC3\xA5ng kommer du att guidas genom n\xC3\xA5gra steg\x2C bland annat f\xC3\xB6r att st\xC3\xA4lla in s\xC3\xB6kv\xC3\xA4garna till dina/ditt mediabibliotek.\rDu kan alltid \xC3\xA4ndra s\xC3\xB6kv\xC3\xA4gar och inst\xC3\xA4llningar i efterhand.\r\rKlicka p\xC3\xA5 N\xC3\xA4sta f\xC3\xB6r att starta guiden."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Um dir beim Einstieg zu helfen\x2C ben\xC3\xB6tigt es ein paar Schritte um deine Medienbibliothek einzurichten.\rDiese Konfiguration kannst du jederzeit in den \'Einstellungen\' \xC3\xA4ndern."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afin de vous aider\x2C nous aimerions vous guider \xC3\xA0 travers quelques \xC3\xA9tapes afin de commencer \xC3\xA0 organiser votre librairie de m\xC3\xA9dias.\rVous pourrez changer ces options dans les pr\xC3\xA9f\xC3\xA9rences\x2C par la suite.\r\rAppuyer sur le bouton pour commencer."
	#tag EndConstant

	#tag Constant, Name = WhereParagraphAnime, Type = String, Dynamic = True, Default = \"Click the \'+\' button to browse for folders containing your anime.\rAlternatively you can drag and drop your anime folders onto the listbox.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Click the \'+\' button to browse for folders containing your anime.\rAlternatively you can drag and drop your anime folders onto the listbox."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klik de \'+\' knop om te zoeken naar mappens waarin u uw anime bewaard.\rU kunt ook uw anime mappen toevoegen door ze naar de lijst te slepen."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Klicka p\xC3\xA5 \'+\'-knappen f\xC3\xB6r att bl\xC3\xA4ddra till mappen som inneh\xC3\xA5ller dina tecknade filmer.\r(du kan \xC3\xA4ven dra mappen direkt till listan)"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Klicke den \'+\' Button um die Anime Ordner anzuzeigen.\rAlternativ kann ein Anime Ordner per Drag & Drop in die Liste gezogen werden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Appuyer sur le bouton \'+\' pour ajouter les dossiers qui contiennent vos animes.\rVous pouvez aussi les d\xC3\xA9placer directement dans cette fen\xC3\xAAtre."
	#tag EndConstant

	#tag Constant, Name = WhereParagraphMovies, Type = String, Dynamic = True, Default = \"Click the \'+\' button to browse for folders containing your movies.\rAlternatively you can drag and drop your movie folders onto the listbox.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Click the \'+\' button to browse for folders containing your movies.\rAlternatively you can drag and drop your movie folders onto the listbox."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klik de \'+\' knop om te zoeken naar mappens waarin u uw films bewaard.\rU kunt ook uw film mappen toevoegen door ze naar de lijst te slepen."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Klicka p\xC3\xA5 \'+\'-knappen f\xC3\xB6r att bl\xC3\xA4ddra till mappen som inneh\xC3\xA5ller dina filmer.\r(du kan \xC3\xA4ven dra mappen direkt till listan)"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Klicke den \'+\' Button um die Filme Ordner anzuzeigen.\rAlternativ kann ein Film Ordner per Drag & Drop in die Liste gezogen werden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Appuyer sur le bouton \'+\' pour ajouter les dossiers qui contiennent vos films.\rVous pouvez aussi les d\xC3\xA9placer directement dans cette fen\xC3\xAAtre."
	#tag EndConstant

	#tag Constant, Name = WhereParagraphTVShows, Type = String, Dynamic = True, Default = \"Click the \'+\' button to browse for folders containing your TV shows.\rAlternatively you can drag and drop your TV show folders onto the listbox.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Click the \'+\' button to browse for folders containing your TV shows.\rAlternatively you can drag and drop your TV show folders onto the listbox."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klik de \'+\' knop om te zoeken naar mappens waarin u uw TV series bewaard.\rU kunt ook uw TV serie mappen toevoegen door ze naar de lijst te slepen."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Klicka p\xC3\xA5 \'+\'-knappen f\xC3\xB6r att bl\xC3\xA4ddra till mappen som inneh\xC3\xA5ller dina TV-serier.\r(du kan \xC3\xA4ven dra mappen direkt till listan)"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Klicke den \'+\' Button um die Serien Ordner anzuzeigen.\rAlternativ kann ein TV-Serien Ordner per Drag & Drop in die Liste gezogen werden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Appuyer sur le bouton \'+\' pour ajouter les dossiers qui contiennent vos S\xC3\xA9ries TV.\rVous pouvez aussi les d\xC3\xA9placer directement dans cette fen\xC3\xAAtre."
	#tag EndConstant

	#tag Constant, Name = WhereTitleAnime, Type = String, Dynamic = True, Default = \"Where are your anime located\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Where are your anime located\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Waar zijn uw anime te vinden\?"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Vart \xC3\xA4r dina tecknade filmer placerade\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wo sind deine Animes abgelegt\? "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"O\xC3\xB9 sont situ\xC3\xA9s vos animes \?"
	#tag EndConstant

	#tag Constant, Name = WhereTitleMovies, Type = String, Dynamic = True, Default = \"Where are your movies located\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Where are your movies located\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Waar zijn je films te vinden\?"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Vart finns dina filmer\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wo sind deine Filme abgelegt\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"O\xC3\xB9 sont situ\xC3\xA9s vos films \?"
	#tag EndConstant

	#tag Constant, Name = WhereTitleTVShows, Type = String, Dynamic = True, Default = \"Where are your TV shows located\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Where are your television shows located\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Waar zijn je televisie series te vinden\?"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Vart finns dina TV-serier\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wo sind deine Serien abgelegt\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"O\xC3\xB9 sont situ\xC3\xA9es vos S\xC3\xA9ries TV \?"
	#tag EndConstant

	#tag Constant, Name = WhichMediaPlayer, Type = String, Dynamic = True, Default = \"Which media player will you be using\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Which media player will you be using\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Welke media speler wilt u gebruiken\?"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Vilken mediaspelare kommer du att anv\xC3\xA4nda\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Welcher Medienplayer soll benutzt werden\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quel Media Player utilisez-vous \?"
	#tag EndConstant

	#tag Constant, Name = WhichParagraphMediaPlayer, Type = String, Dynamic = True, Default = \"This option will set all the default file names for the chosen media player.\rYou can change these settings later in the preferences dialog.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"This option will set all the default file names for the chosen media player.\rYou can change these settings later in the preferences dialog."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Deze optie zet alle bestands namen voor de gekozen media speler.\rU kunt later deze opties zelf aanpassen in de  voorkeuren."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Detta alternativ st\xC3\xA4ller in alla filnamn till den valda mediaspelaren.\rDu kan \xC3\xA4ndra dessa inst\xC3\xA4llningar senare under Inst\xC3\xA4llningar."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Diese Einstellung wird alle Standard Dateinamen f\xC3\xBCr den Mediaplayer benutzen.\rDu kannst die Einstellung sp\xC3\xA4ter in Einstellungsdialog \xC3\xA4ndern."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cette option configurera tous les noms de fichiers par d\xC3\xA9faut pour votre Media Player.\rVous pouvez changer ces options par la suite dans les pr\xC3\xA9f\xC3\xA9rences."
	#tag EndConstant


#tag EndWindowCode

#tag Events btnNext
	#tag Event
		Sub Action(index as Integer)
		  ppSplash.Value = ppSplash.Value + 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSkip
	#tag Event
		Sub Action()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnFinish
	#tag Event
		Sub Action()
		  Dim Movies as new Dictionary
		  Dim TVShows as new Dictionary
		  Dim Anime as new Dictionary
		  Dim i, index as Integer
		  Dim key, value as String
		  
		  For index = 0 to 2
		    For i = 0 to lstArray( index ).ListCount - 1
		      'Dim f as FolderItem = GetFolderItem( lstArray( index ).Cell( i, 1 ), FolderItem.PathTypeShell )
		      
		      key   = lstArray( index ).Cell( i, 1 )
		      value = lstArray( index ).Cell( i, 0 )
		      
		      Select case index
		      case 0
		        Movies.Value( key ) = value
		      case 1
		        TVShows.Value( key ) = value
		      case 2
		        Anime.Value( key ) = value
		      End Select
		      
		    Next
		    If index = 0 then Preferences.Prefs.setDictionaryValue "MoviePaths",  Movies
		    If index = 1 then Preferences.Prefs.setDictionaryValue "TVShowPaths", TVShows
		    If index = 2 then Preferences.Prefs.setDictionaryValue "AnimePaths",  Anime
		  Next
		  
		  Preferences.WriteDefaults
		  Close
		  
		  'wndMain.CommonActions( "ReloadList" )
		  CommonCore.ReloadList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnBack
	#tag Event
		Sub Action(index as Integer)
		  ppSplash.Value = ppSplash.Value - 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstArray
	#tag Event
		Sub Change(index as Integer)
		  AddRemoveMediaLists(index).RemoveEnabled = me.ListIndex > -1
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open(index as Integer)
		  '#If DebugBuild Then me.ColumnWidths = "100, *"
		  
		  me.AcceptFileDrop("special/folder")
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(index as Integer, Key as String) As Boolean
		  If Keyboard.AsyncKeyDown( &h33 ) or Keyboard.AsyncKeyDown( &h75 ) then
		    If me.ListIndex > -1 then me.RemoveRow( me.ListIndex )
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub DropObject(index as Integer, obj As DragItem, action As Integer)
		  While obj.FolderItemAvailable
		    me.AddRow "     " + obj.FolderItem.Name, obj.FolderItem.ShellPath
		    dim icon as MacIcon = MacIcon.NewIconFromFolderItem(obj.FolderItem)
		    icon.size = 48
		    me.RowPicture( me.LastIndex ) = icon 'obj.FolderItem.FileIcon(48/4)
		    If not obj.NextItem then Exit
		  Wend
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popMediaPlayer
	#tag Event
		Sub Change()
		  
		  Preferences.Prefs.setStringValue "MediaPlayer", Me.Text
		  Preferences.Prefs.setStringValue "MediaPlayerFileNames", Me.Text
		  
		  Select Case Me.Text
		    
		  Case "XBMC"
		    cvsMediaPlayer.Backdrop = XBMC
		    
		    Preferences.Prefs.setStringValue "FileNamePoster",   "<movie>-poster.jpg"
		    Preferences.Prefs.setStringValue "FileNameFanart",   "<movie>-fanart.jpg"
		    Preferences.Prefs.setStringValue "FileNameBanner",   "<movie>-banner.jpg"
		    Preferences.Prefs.setStringValue "FileNameNFO",      "<movie>.nfo"
		    Preferences.Prefs.setStringValue "FileNameTrailer",  "<movie>-trailer"
		    
		    Preferences.Prefs.setStringValue "FileNameNFOTV",    "tvshow.nfo"
		    Preferences.Prefs.setStringValue "FileNameNFOAnime", "tvshow.nfo"
		    
		  Case "YAMJ"
		    cvsMediaPlayer.Backdrop = YAMJ
		    
		    Preferences.Prefs.setStringValue "FileNamePoster",   "<movie>.jpg"
		    Preferences.Prefs.setStringValue "FileNameFanart",   "<movie>.fanart.jpg"
		    Preferences.Prefs.setStringValue "FileNameBanner",   "<movie>.banner.jpg"
		    Preferences.Prefs.setStringValue "FileNameNFO",      "<movie>.nfo"
		    Preferences.Prefs.setStringValue "FileNameTrailer",  "<movie>[trailer]"
		    
		    Preferences.Prefs.setStringValue "FileNameNFOTV",    "Set_<show>_1.nfo"
		    Preferences.Prefs.setStringValue "FileNameNFOAnime", "Set_<show>_1.nfo"
		    
		    
		    // Auto Downloads
		    Preferences.Prefs.boolForKey("AutoDownloadPoster")    = True
		    Preferences.Prefs.boolForKey("AutoDownloadBackdrop")  = True
		    Preferences.Prefs.boolForKey("AutoDownloadBanner")    = False
		    
		    Preferences.Prefs.boolForKey("AutoDownloadClearArt")     = False
		    Preferences.Prefs.boolForKey("AutoDownloadCharacterArt") = False
		    Preferences.Prefs.boolForKey("AutoDownloadLogo")         = False
		    Preferences.Prefs.boolForKey("AutoDownloadThumb")        = False
		    Preferences.Prefs.boolForKey("AutoDownloadDiscArt")      = False
		    
		    Preferences.Prefs.boolForKey("AutoDownloadExtraThumbs")  = False
		    Preferences.Prefs.boolForKey("AutoDownloadExtraFanart")  = False
		    Preferences.Prefs.boolForKey("AutoDownloadSeasonArt")    = False
		    Preferences.Prefs.boolForKey("AutoDownloadTrailer")      = False
		    Preferences.Prefs.boolForKey("AutoDownloadThemesong")    = False
		    
		    Preferences.Prefs.boolForKey("AutoDownloadEpisodeThumb") = False
		    
		    // Mini-Icons
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Poster" )         = True
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Backdrop" )       = True
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Banner" )         = False
		    
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-ClearArt" )       = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-CharacterArt" )   = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Logo" )           = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Thumb" )          = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-DiscArt" )        = False
		    
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-ExtraThumbs" )    = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-ExtraFanart" )    = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-SeasonArt" )      = False
		    
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Subtitles" )      = True
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Resolution" )     = True
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Trailer" )        = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Themesong" )      = False
		    
		    
		  Case "Boxee"
		    cvsMediaPlayer.Backdrop = Boxee
		    
		    Preferences.Prefs.setStringValue "FileNamePoster",   "folder.jpg"
		    Preferences.Prefs.setStringValue "FileNameFanart",   "fanart.jpg"
		    Preferences.Prefs.setStringValue "FileNameBanner",   "banner.jpg"
		    Preferences.Prefs.setStringValue "FileNameNFO",      "<movie>.nfo"
		    Preferences.Prefs.setStringValue "FileNameTrailer",  "<movie>-trailer"
		    
		    Preferences.Prefs.setStringValue "FileNameNFOTV",    "tvshow.nfo"
		    Preferences.Prefs.setStringValue "FileNameNFOAnime", "tvshow.nfo"
		    
		    Preferences.Prefs.setStringValue "FolderJPGForFileTV", Loc.kPoster
		    Preferences.Prefs.setStringValue "FolderJPGForFileAnime", Loc.kPoster
		    
		    // Auto Downloads
		    Preferences.Prefs.boolForKey("AutoDownloadPoster")  = True
		    Preferences.Prefs.boolForKey("AutoDownloadBackdrop")  = True
		    Preferences.Prefs.boolForKey("AutoDownloadBanner")  = False
		    
		    Preferences.Prefs.boolForKey("AutoDownloadClearArt")     = False
		    Preferences.Prefs.boolForKey("AutoDownloadCharacterArt") = False
		    Preferences.Prefs.boolForKey("AutoDownloadLogo")         = False
		    Preferences.Prefs.boolForKey("AutoDownloadThumb")        = False
		    Preferences.Prefs.boolForKey("AutoDownloadDiscArt")      = False
		    
		    Preferences.Prefs.boolForKey("AutoDownloadExtraThumbs")  = False
		    Preferences.Prefs.boolForKey("AutoDownloadExtraFanart")  = False
		    Preferences.Prefs.boolForKey("AutoDownloadSeasonArt")    = False
		    Preferences.Prefs.boolForKey("AutoDownloadTrailer")      = False
		    Preferences.Prefs.boolForKey("AutoDownloadThemesong")    = False
		    
		    Preferences.Prefs.boolForKey("AutoDownloadEpisodeThumb") = False
		    
		    // Mini-Icons
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Poster" )         = True
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Backdrop" )       = True
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Banner" )         = False
		    
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-ClearArt" )       = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-CharacterArt" )   = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Logo" )           = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Thumb" )          = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-DiscArt" )        = False
		    
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-ExtraThumbs" )    = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-ExtraFanart" )    = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-SeasonArt" )      = False
		    
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Subtitles" )      = True
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Resolution" )     = True
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Trailer" )        = False
		    Preferences.Prefs.boolForKey( "ShowMiniIcon-Themesong" )      = False
		    
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.ListIndex = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddRemoveMediaLists
	#tag Event
		Sub ActionAdd(index as Integer)
		  Dim dlg as new SelectFolderDialog
		  Dim f as FolderItem = dlg.ShowModal
		  Dim lstbox as Listbox = lstArray(index)
		  
		  If f <> nil then
		    lstbox.AddRow "     " + f.Name, f.ShellPath
		    dim Icon as MacIcon = MacIcon.NewIconFromFolderItem(f)
		    icon.Size = 48
		    lstbox.RowPicture( lstbox.LastIndex ) = Icon
		  End If
		  
		  Exception err as NilObjectException
		    MsgBox "File not found."
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionRemove(index as Integer)
		  if lstArray(index).ListIndex > -1 then lstArray(index).RemoveRow( lstArray(index).ListIndex )
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

#tag Window
Begin Window wndRecommendations
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   581
   ImplicitInstance=   True
   LiveResize      =   True
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
   Resizeable      =   True
   Title           =   "#Loc.kRecMovies"
   Visible         =   True
   Width           =   1021
   Begin SuperListbox lstRecs
      AlternatingRowColors=   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   26
      ColumnsResizable=   True
      ColumnWidths    =   "100%, *"
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
      Height          =   533
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   275
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Thread thrGatherData
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin SuperListbox lstRecBy
      AlternatingRowColors=   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   3
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
      Height          =   533
      HelpTag         =   ""
      Hierarchical    =   False
      IgnoreChange    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      IsFocused       =   False
      Italic          =   False
      Left            =   733
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   288
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin MediaDetails cvsRecDetails
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   533
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   274
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   460
   End
   Begin PushbuttonPro btnOK
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Loc.dlgOK"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   921
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
      Top             =   545
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
		  thrGatherData.Kill
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.BorderBottomThickness = 48
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim BottomHeight as Integer = g.Height
		  #If TargetCocoa Then
		    BottomHeight = g.Height - 49 'g.Height - 14 - 20 - 14 - 1
		    g.DrawGradient( hsl(0, 0, 95), hsl(0, 0, 75), 0, 0, g.Width, BottomHeight )
		  #endif
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Close
			Return True
			
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events lstRecs
	#tag Event
		Sub Change()
		  thrGatherData.Kill
		  thrGatherData.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thrGatherData
	#tag Event
		Sub Run()
		  cvsRecDetails.Reload
		  
		  If lstRecs.ListIndex = -1 Then Return
		  
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage").NthField( "-", 1 )
		  Dim ID as String = lstRecs.Cell( lstRecs.ListIndex, 1 ) // IMDbID
		  
		  If ID = "" Then Return
		  
		  // Recommended by
		  lstRecBy.DeleteAllRows
		  Dim RecdBy() as String = lstRecs.Cell( lstRecs.ListIndex, 3 ).Split("|")
		  Dim LstBox as Listbox = wndMain.lstMovies
		  If ActiveSection = 1 Then LstBox = wndMain.lstTVShows
		  
		  For each Item as String in RecdBy
		    Dim b as Boolean = False
		    For i as Integer = 0 to LstBox.ListCount -1
		      If LstBox.Cell( i, 1 ) <> Item Then Continue
		      b = True
		      
		      lstRecBy.AddRow LstBox.Cell( i, 0 ), LstBox.Cell( i, 1 ), LstBox.Cell( i, 2 )
		      If ActiveSection = 0 Then
		        lstRecBy.RowTag( lstRecBy.LastIndex ) = LstBox.CellTag( i, 15 )
		      ElseIf ActiveSection = 1 Then
		        lstRecBy.RowTag( lstRecBy.LastIndex ) = LstBox.CellTag( i, 10 )
		      End If
		      
		    Next
		    If NOT b Then lstRecBy.AddRow Item
		  Next
		  
		  // ## If no previous data has been fetched
		  If lstRecs.CellTag( lstRecs.ListIndex, 5 ) <> Nil And lstRecs.CellTag( lstRecBy.ListIndex, 6 ) <> Nil Then Return
		  Dim ScktMovie as New MovieSckt
		  Dim ScktShow as New TVDBSckt
		  ScktMovie.Yield = True
		  ScktShow.Yield = True
		  
		  Dim JSONString as String
		  If ActiveSection = 0 Then
		    JSONString = DefineEncoding( ScktMovie.Get( ScktMovie.URL("MovieInfo", lstRecs.Cell( lstRecs.ListIndex, 1 ), Preferences.Prefs.stringForKey("DBLanguage") ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    ScktMovie.Close
		  Else
		    If ID.Left(2) = "tt" Then
		      JSONString = DefineEncoding( ScktShow.Get( TVCore.URL( "InfoAlias", ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		      ScktShow.Close
		      'JSONString = DecodingFromHTMLMBS( JSONString )
		    Else
		      
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsRecDetails
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = HSL( 0, 100, 50 )
		  g.DrawRect( 0, 0, g.Width, g.Height )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOK
	#tag Event
		Sub Open()
		  Me.BezelStyle = NSBezelStyle.NSTexturedRoundedBezelStyle
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

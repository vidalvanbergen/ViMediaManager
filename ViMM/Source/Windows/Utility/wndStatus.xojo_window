#tag Window
Begin Window wndStatus
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
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin Listbox lstResults
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
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
      Height          =   380
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
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
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Preferences.SaveWindowPos( Self, "wndStatus" )
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Preferences.LoadWindowPos( Self, "wndStatus" )
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Close
			Return True
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Sub ShowInList(f as FolderItem)
		  
		  Dim Lindex as Integer = -1
		  
		  For i as Integer = 0 to ActiveListbox.ListCount -1
		    If f.ShellPath = ActiveListbox.Cell( i, 1 ) Then
		      Lindex = i
		      Exit
		    End If
		  Next
		  
		  
		  If Lindex = -1 Then
		    If ActiveListbox = wndMain.lstTVShows Then wndMain.lstTVShows.AllExpanded( True )
		    
		    For i as Integer = 0 to ActiveListbox.ListCount -1
		      If f.ShellPath = ActiveListbox.Cell( i, 1 ) Then
		        Lindex = i
		        Exit
		      End If
		    Next
		  End If
		  
		  If Lindex > -1 Then
		    ActiveListbox.ListIndex = Lindex
		    'self.Close
		  Else
		    MsgBox "Couldn't find selection."
		  End If
		End Sub
	#tag EndMethod


	#tag Constant, Name = kShowInList, Type = String, Dynamic = True, Default = \"Show in List", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show in List"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon in lijst"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher dans la liste"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"In der Liste anzeigen"
	#tag EndConstant


#tag EndWindowCode

#tag Events lstResults
	#tag Event
		Sub Open()
		  'If NOT DebugBuild And NOT App.Experimental Then Me.HasHeading = False
		  
		  Me.Top = -1
		  Me.Left = -1
		  
		  Me.Height = Self.Height + 1
		  Me.Width = Self.Width + 2
		  
		  Self.Title = Str( Me.ListCount ) + " "
		  If ActiveSection = 0 Then
		    Self.Title = Self.Title + Loc.Movies
		  ElseIf ActiveSection = 1 Then
		    Self.Title = self.Title + Loc.TVShows
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  '// Background
		  'If Me.Active AND Me.Enabled Then
		  'g.ForeColor = RGB( 232, 232, 232 )
		  'Else
		  'g.ForeColor = RGB( 255, 255, 255 )
		  'End If
		  'g.FillRect 0, 0, g.Width, g.Height
		  '
		  '
		  'If row < Me.ListCount Then
		  '
		  'g.ForeColor = RGB( 214, 214, 214 )
		  'g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		  '
		  'g.ForeColor = RGB( 255, 255, 255 )
		  'g.DrawLine 0, 0, g.Width, 0
		  'End If
		  '
		  '// Selection Gradient
		  'If Row > -1 And Me.Selected( row ) Then
		  'g.DrawGradient( RGB(115, 176, 227), RGB( 71, 131, 208), 0, 0, g.Width, g.Height )
		  'End If
		  '
		  '
		  '// Borders
		  'If row < Me.ListCount Then
		  ''g.ForeColor = RGB( 214, 214, 214, ( 80 / 100 ) * 255 )
		  'g.ForeColor = RGBa(   0,   0,   0, .10 )
		  'g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		  '
		  ''g.ForeColor = RGB( 255, 255, 255, ( 80 / 100 ) * 255 )
		  'g.ForeColor = RGBa( 100, 100, 100, .4 )
		  'g.DrawLine 0, 1, g.Width, 1
		  'End If
		  
		  #if XojoVersion <= 2017.030 then
		    if globals.IsDarkMode and row > -1 then
		      g.ForeColor = rgb(46, 43, 42)
		      g.FillRect 0, 0, g.Width, g.Height
		    end if
		  #endif
		  
		  // Alternating Row colors
		  if row < me.ListCount and NOT me.Selected( row ) then
		    
		    #if TargetMacOS then
		      
		      dim AlternatingRowBackgroundColors() as NSColor = NSColor.ControlAlternatingRowBackgroundColors
		      
		      g.ForeColor = AlternatingRowBackgroundColors(row mod 2)
		    #else
		      if row mod 2 = 0 then
		        g.ForeColor = HSL( 0, 0, 0, 5 )
		      else
		        g.ForeColor = HSL( 0, 0, 100 )
		      end if
		    #endif
		    
		    g.FillRect 0, 0, g.Width, g.Height
		  end if
		  
		  
		  
		  // Show/Hide Button
		  Dim f as FolderItem
		  If Row < Me.ListCount Then
		    f = Me.RowTag( Row )
		    
		    If f <> Nil And f.Exists Then
		      
		      g.TextFont = "Arial Narrow Bold"
		      g.TextSize = 13
		      
		      Dim btnText as String = "Show"
		      'If Me.Expanded( row ) Then btnText = "Hide"
		      btnText = btnText.Uppercase
		      
		      // Draw button bg
		      'g.ForeColor = RGB( 255, 255, 255 )
		      g.ForeColor = RGBa( 100, 100, 100, .6 )
		      g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 7,   50, 18,   10, 10
		      
		      'g.ForeColor = RGBa( 65, 65, 65 )
		      g.ForeColor = RGBa( 0, 0, 0, .20 )
		      g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 9,   50, 18,   10, 10
		      
		      g.ForeColor = RGBa( 79, 79, 79, .80 )
		      g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 8,   50, 18,   10, 10
		      
		      // Draw button text
		      g.ForeColor = RGB( 255, 255, 255 )
		      g.DrawString btnText, ( ( g.Width - 10 - 50 ) + 25 ) - ( g.StringWidth( btnText ) / 2 ), g.TextSize + 1 + ( g.Height / 2 ) - ( g.StringHeight( btnText, Me.Width ) / 2 )
		      
		      g.ForeColor = RGBa( 39, 39, 39 )
		      g.DrawString btnText, ( ( g.Width - 10 - 50 ) + 25 ) - ( g.StringWidth( btnText ) / 2 ), g.TextSize + ( g.Height / 2 ) - ( g.StringHeight( btnText, Me.Width ) / 2 )
		      
		    End If
		    
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  If column <> 0 Then Return False
		  
		  
		  // ## Left Poster icon
		  Dim posteritem as FolderItem = Me.RowTag( row )
		  Dim PosterSize as Integer = 52
		  
		  If Preferences.Prefs.boolForKey("ShowPostersInList") Then
		    Dim i as Integer = 0
		    If Me.DefaultRowHeight <= 22 Then i = 3
		    
		    posteritem = FindImagePoster( posteritem )
		    If posteritem <> Nil And posteritem.Exists Then
		      
		      Dim PosterPic as Picture = Picture.Open( posteritem )
		      If PosterPic <> Nil Then
		        Dim Factor as Double = PosterSize / PosterPic.Height
		        g.DrawPicture PosterPic, 5 - i, ( Me.DefaultRowHeight / 2 ) - ( PosterSize / 2 ),       PosterPic.Width * Factor,         PosterPic.Height * Factor,      0, 0, PosterPic.Width, PosterPic.Height
		        g.DrawRect               4 - i, ( Me.DefaultRowHeight / 2 ) - ( PosterSize / 2 ) - 1, ( PosterPic.Width * Factor ) + 2, ( PosterPic.Height * Factor ) + 2
		      End If
		      
		    End If
		  End If
		  
		  
		  // ## Left Status Icon
		  If ( posteritem = Nil Or NOT posteritem.Exists ) OR NOT Preferences.Prefs.boolForKey("ShowPostersInList") Then
		    Dim i as Integer = 0
		    If Me.DefaultRowHeight <= 22 Then i = 3
		    
		    Dim PosterInfo as Picture = videoclean
		    
		    If App.ScalingFactor = 2 Then // Retina
		      If Me.DefaultRowHeight <= 22 Then PosterInfo = videounwatchedsmall Else PosterInfo = videounwatched2x
		    Else // SD
		      If Me.DefaultRowHeight >= 64 Then PosterInfo = videounwatched Else PosterInfo = videounwatchedsmall
		    End If
		    
		    g.DrawPicture PosterInfo, 5 - i, ( Me.DefaultRowHeight / 2 ) - ( PosterSize / 2 ), PosterSize / 1.5, PosterSize,  0, 0, PosterInfo.Width, PosterInfo.Height
		  End If
		  
		  
		  // Text
		  g.TextSize = 12
		  If Me.Selected( row ) Then g.Bold = True
		  g.DrawString( Me.Cell( row, column ), PosterSize + 4, g.TextSize + ( g.Height / 2 ) - ( ( g.StringHeight( Me.Cell( row, column ), g.Width - ( PosterSize + 4 ) - 50 ) / 2 ) ), g.Width - ( PosterSize + 4 ) - 50 )
		  
		  
		  Dim MyObj as New PopupArrow
		  MyObj.Left = 0
		  MyObj.Top  = 0
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  If X > 0 And Y > 0 And _
		    X < Me.Width And Y < Me.Width Then
		    
		    base.Append New MenuItem( Menu.FileShowInFinder, "ShowInFinder" )
		    base.Append New MenuItem( kShowInList, "ShowInList" )
		    
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem = Nil Then Return False
		  
		  
		  Dim f as FolderItem = Me.RowTag( Me.ListIndex )
		  
		  Select Case hitItem.Tag
		    
		  Case "ShowInFinder"
		    If f <> Nil And f.Exists Then f.RevealInFinder()
		    
		  Case "ShowInList"
		    ShowInList(f)
		    
		  End Select
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
		  Dim iLeft as Integer = 0
		  If ( Me.ListCount - 1 ) * Me.DefaultRowHeight > Me.Height Then iLeft = 16
		  
		  If Me.RowTag( row ) <> Nil And _ 'Me.RowTag( row ) = "Folder" And _
		    y > ( Me.DefaultRowHeight / 2 ) - 8 And y < ( ( Me.DefaultRowHeight / 2 ) - 8 ) + 18 And _
		    x > Me.Width - 10 - 50 - iLeft And x < Me.Width - 10 - iLeft Then
		    
		    Dim f as FolderItem = Me.RowTag( row )
		    'If f <> Nil And f.Exists Then f.ShowInFinder
		    ShowInList(f)
		    
		    'Me.Expanded( row ) = NOT Me.Expanded( row )
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  'Self.Title = Str( Me.ListCount ) + " "
		  'If ActiveSection = 0 Then
		  'Self.Title = Self.Title + Loc.Movies
		  'ElseIf ActiveSection = 1 Then
		  'Self.Title = self.Title + Loc.TVShows
		  'End If
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

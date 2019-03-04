#tag Window
Begin Window wndAbout
   BackColor       =   &cFFFFFF00
   Backdrop        =   1452980029
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   290
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
   Title           =   "#Loc.kAbout"
   Visible         =   True
   Width           =   600
   Begin cvsLogo ViMediaManagerLogo
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   256
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   17
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   256
   End
   Begin Canvas cvsViMediaManagerTextLogo
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   288
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   17
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   292
   End
   Begin btnImage btnLink
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   1275508021
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   32
      HelpTag         =   ""
      imgActive       =   0
      imgHover        =   0
      imgInactive     =   0
      imgPressed      =   0
      Index           =   0
      InitialParent   =   ""
      Left            =   368
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   241
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   32
   End
   Begin btnImage btnLink
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   1821575627
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   32
      HelpTag         =   ""
      imgActive       =   0
      imgHover        =   0
      imgInactive     =   0
      imgPressed      =   0
      Index           =   1
      InitialParent   =   ""
      Left            =   404
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   241
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   32
   End
   Begin btnImage btnLink
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   783271628
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   32
      HelpTag         =   ""
      imgActive       =   0
      imgHover        =   0
      imgInactive     =   0
      imgPressed      =   0
      Index           =   2
      InitialParent   =   ""
      Left            =   440
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   241
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   32
   End
   Begin Placard plcViewer
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   185
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   288
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   False
      Value           =   True
      Visible         =   True
      Width           =   292
      Begin HTMLViewer htmlAbout
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   183
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "plcViewer"
         Left            =   289
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Renderer        =   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   47
         Visible         =   True
         Width           =   290
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.Title = Loc.kAbout + " " + App.kAppName
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.Bold = True
		  g.AntiAlias = True
		  
		  // Software ----------
		  g.ForeColor = RGBa( 100, 100, 100, .6 ) '&cEEEEEE
		  g.DrawString( Loc.Software, 288, Height - g.TextSize - 9 )
		  
		  g.ForeColor = RGBa( 32, 33, 36 ) '&c52535C rgb(82, 83, 92)
		  g.DrawString( Loc.Software, 288, Height - g.TextSize - 10 )
		  
		  // Version -----------
		  g.ForeColor = RGBa( 100, 100, 100, .6 ) 'g.ForeColor = &CEEEEEE
		  g.DrawString( Loc.Version, width - g.StringWidth(App.VersionCurrent) - g.StringWidth(Loc.Version) - 25, Height - g.TextSize - 9 )
		  
		  g.ForeColor = RGBa( 32, 33, 36 ) 'g.ForeColor = &C52535C
		  g.DrawString( Loc.Version, width - g.StringWidth(App.VersionCurrent) - g.StringWidth(Loc.Version) - 25, Height - g.TextSize - 10 )
		  
		  // vers --------------
		  g.ForeColor = RGBa( 100, 100, 100, .6 ) 'g.ForeColor = &cEEEEEE
		  g.DrawString( App.VersionCurrent, Width - g.StringWidth(App.VersionCurrent) - 20, Height - g.TextSize - 9 )
		  
		  g.ForeColor = RGBa( 32, 33, 36 ) 'g.ForeColor = &c52535C
		  g.DrawString( App.VersionCurrent, Width - g.StringWidth(App.VersionCurrent) - 20, Height - g.TextSize - 10 )
		  
		  // Vitalis -----------
		  'If App.ScalingFactor = 2 Then
		  'g.DrawPicture Vitalis2x, plcViewer.Left - 3, plcViewer.Top + plcViewer.Height + 8, 59, 19, 0, 0, Vitalis2x.Width, Vitalis2x.Height
		  'Else
		  g.DrawPicture Vitalis, plcViewer.Left - 3, plcViewer.Top + plcViewer.Height + 8
		  'End If
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			Close
			Return True
			
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events cvsViMediaManagerTextLogo
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.Bold      = True
		  g.AntiAlias = True
		  g.TextSize  = 24
		  
		  g.ForeColor = &cEEEEEE
		  g.DrawString App.kAppName, ( me.Width / 2 ) - ( g.StringWidth( App.kAppName ) / 2 ), g.TextSize - 4 '21
		  
		  g.ForeColor = &c52535C
		  g.DrawString App.kAppName, ( me.Width / 2 ) - ( g.StringWidth( App.kAppName ) / 2 ), g.TextSize - 5 '20
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnLink
	#tag Event
		Sub MouseEnter(index as Integer)
		  MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit(index as Integer)
		  MouseCursor = Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(index as Integer)
		  Select Case Index
		    
		  Case 0
		    ShowURL "http://twitter.com/ViMediaManager"
		    
		  Case 1
		    ShowURL "https://www.facebook.com/ViMediaManager"
		    
		  Case 2
		    ShowURL "mailto:vidal.vanbergen@gmail.com"
		    
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events htmlAbout
	#tag Event
		Sub Open()
		  'MessageBox App.ExecutableFile.Parent.Parent.Child("Resources").Child( "credits.html" )'.ShellPath
		  Me.LoadPage( credits, App.ExecutableFile.Parent.Parent.Child("Resources").Child( "credits.html" ) )
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

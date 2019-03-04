#tag Window
Begin Window wndAdvancedSettings
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   569
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
   Title           =   "Advanced Settings"
   Visible         =   True
   Width           =   691
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
      Left            =   471
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   527
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
   End
   Begin PagePanel ppSettings
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   515
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   691
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppSettings"
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
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Log Level:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin CheckBox chkLogLevelHidden
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hidden"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Hides ""enable debugging"" guisetting."
         Index           =   -2147483648
         InitialParent   =   "ppSettings"
         Italic          =   False
         Left            =   182
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   100
      End
      Begin PopupMenu popLogLevel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "The logging level that XBMC will use to log errors and information."
         Index           =   -2147483648
         InitialParent   =   "ppSettings"
         InitialValue    =   "No logging, suppresses all log output\rNormal logging, only logging errors (default)\rDebug logging\rDebug logging with freemem, fps and cpu usage shown on screen\rDebug logging with freemem, fps and cpu usage and full smb logging"
         Italic          =   False
         Left            =   294
         ListIndex       =   1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   13
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   377
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
         InitialParent   =   "ppSettings"
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
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Package Folder Size:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   45
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin TextField edtpackagefoldersize
         AcceptTabs      =   False
         Alignment       =   3
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
         HelpTag         =   "The amount (in megabytes) of add-on zip packages saved from previous add-on installs. These packages are mainly used for the add-on rollback feature. Increasing the size should increase the amount of past versions saved."
         Index           =   -2147483648
         InitialParent   =   "ppSettings"
         Italic          =   False
         Left            =   182
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "#####"
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "500"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
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
         InitialParent   =   "ppSettings"
         Italic          =   False
         Left            =   286
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "MB"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   45
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin UpDownArrows udPackageFolderSize
         AcceptFocus     =   False
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppSettings"
         Left            =   266
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   45
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
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppSettings"
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
         Text            =   "Skip Loop Filter:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   80
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin PopupMenu popSkipLoopFilter
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "This amount of the loop filter to skip on h264 decoding. This can help the performance of slower machines when decoding h264 content. Values, in decreasing CPU usage (and decreasing quality)"
         Index           =   -2147483648
         InitialParent   =   "ppSettings"
         InitialValue    =   "-16	None\r0	Skip only empty frames (default)\r8	Skip non-reference frames (default on ATV)\r16	Skip bi-dir frames\r32	Skip all non-key frames\r48	Skip all frames"
         Italic          =   False
         Left            =   182
         ListIndex       =   1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   79
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   277
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
         InitialParent   =   "ppSettings"
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
         Text            =   "cddbaddress:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   111
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   150
      End
      Begin TextField edtcddbaddress
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
         HelpTag         =   "The amount (in megabytes) of add-on zip packages saved from previous add-on installs. These packages are mainly used for the add-on rollback feature. Increasing the size should increase the amount of past versions saved."
         Index           =   -2147483648
         InitialParent   =   "ppSettings"
         Italic          =   False
         Left            =   182
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "#####"
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "freedb.freedb.org"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   110
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   277
      End
   End
   Begin PushButton btnDefaults
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Defaults"
      Default         =   False
      Enabled         =   True
      Height          =   20
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
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   527
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  AdvancedSettingsFile = SpecialFolder.ApplicationData.Child("XBMC").Child("userdata").Child("advancedsettings.xml")
		  If DebugBuild OR App.Experimental Then AdvancedSettingsFile = SpecialFolder.Desktop.Child("advancedsettings.xml")
		  
		  If AdvancedSettingsFile <> Nil And AdvancedSettingsFile.Exists Then ReadSettings
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ReadSettings()
		  Dim Xml as New XmlDocument
		  Dim xRoot, xNode, xItem as XmlNode
		  Xml.PreserveWhitespace = False
		  
		  If AdvancedSettingsFile <> Nil And AdvancedSettingsFile.Exists Then
		    Xml.LoadXml( ReadTextFile( AdvancedSettingsFile ) )
		  Else
		    Return
		  End If
		  
		  xRoot = Xml.FirstChild
		  
		  If xRoot = Nil Then Return
		  
		  For i as Integer = 0 to xRoot.ChildCount -1
		    xNode = xRoot.Child(i)
		    
		    Select Case xNode.Name
		      
		      // -- Log Level
		    Case "loglevel"
		      If xNode.AttributeCount > 0 Then chkLogLevelHidden.Value = ( xNode.GetAttribute("hide") = "True" )
		      popLogLevel.ListIndex = Val( xNode.FirstChild.Value ) + 1
		      
		      // -- packagefoldersize
		    Case "packagefoldersize"
		      edtpackagefoldersize.Text = xNode.FirstChild.Value
		      
		      // -- SkipLoopFilter
		    Case "skiploopfilter"
		      Select Case xNode.FirstChild.Value
		      Case "-16"
		        popSkipLoopFilter.ListIndex = 0
		      Case "0"
		        popSkipLoopFilter.ListIndex = 1
		      Case "8"
		        popSkipLoopFilter.ListIndex = 2
		      Case "16"
		        popSkipLoopFilter.ListIndex = 3
		      Case "32"
		        popSkipLoopFilter.ListIndex = 4
		      Case "48"
		        popSkipLoopFilter.ListIndex = 5
		      End Select
		      
		      
		    Case "edtcddbaddress"
		      edtcddbaddress.Text = xNode.FirstChild.Value
		      
		      
		    End Select
		    
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteSettings()
		  Dim Xml as New XmlDocument
		  Dim xRoot, xNode, xItem as XmlNode
		  Xml.PreserveWhitespace = True
		  
		  xRoot = Xml.AppendChild( Xml.CreateElement( "advancedsettings" ) )
		  
		  // ## Logging
		  xNode = xRoot.AppendNewChild( "loglevel" )
		  xNode.SetAttribute( "hide", Str( chkLogLevelHidden.Value ) )
		  xNode.SetValue( Str( popLogLevel.ListIndex - 1 ) )
		  
		  // ## PackageFolderSize
		  xRoot.AppendSimpleChild( "packagefoldersize", edtpackagefoldersize.Text )
		  
		  // SkipLoopFilter
		  xRoot.AppendSimpleChild( "skiploopfilter", popSkipLoopFilter.Text.NthField( Chr(9), 1 ) )
		  
		  // edtcddbaddress
		  xRoot.AppendSimpleChild( "edtcddbaddress", edtcddbaddress.Text )
		  
		  xRoot.Indent(0)
		  WriteTextFile( xRoot.ToString, AdvancedSettingsFile )
		End Sub
	#tag EndMethod


	#tag Note, Name = AdvancedSettings
		http://wiki.xbmc.org/index.php?title=Advancedsettings.xml
	#tag EndNote


	#tag Property, Flags = &h0
		AdvancedSettingsFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events CancelSave
	#tag Event
		Sub ActionOK()
		  WriteSettings()
		  Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionCancel()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events udPackageFolderSize
	#tag Event
		Sub Up()
		  If Val( edtpackagefoldersize.Text ) < 9999 Then edtpackagefoldersize.Text = Str( Val( edtpackagefoldersize.Text ) + 1 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  If Val( edtpackagefoldersize.Text ) > 0 Then edtpackagefoldersize.Text = Str( Val( edtpackagefoldersize.Text ) - 1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDefaults
	#tag Event
		Sub Action()
		  
		  // -- LogLevel
		  popLogLevel.ListIndex = 1
		  chkLogLevelHidden.Value = False
		  
		  // -- PackageFolderSize
		  edtpackagefoldersize.Text = "500"
		  
		  // -- SkipLoopFilter
		  popSkipLoopFilter.ListIndex = 1
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

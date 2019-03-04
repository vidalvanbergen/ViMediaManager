#tag Window
Begin Window wndHTMLExporter
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   11
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   606
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
   Title           =   "HTML Exporter"
   Visible         =   True
   Width           =   640
   Begin PopupMenu popTemplateSelector
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
      Left            =   157
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
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
      Index           =   0
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kSelectTemplate"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   125
   End
   Begin Canvas cvsPreview
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   400
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   152
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
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
      InitialParent   =   ""
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Loc.kName"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   125
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
      InitialParent   =   ""
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Loc.kAuthor"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   125
   End
   Begin Label lblTmplName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   157
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Loc.kNotAvailable"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   463
   End
   Begin Label lblTmplAuthor
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   157
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Loc.kNotAvailable"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   463
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
      InitialParent   =   ""
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Loc.kDescription"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   94
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   125
   End
   Begin Label lblTmplDescription
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   46
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   157
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Loc.kNotAvailable"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   94
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   463
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
      Left            =   420
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   564
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
   End
   Begin ProgressBar prgBar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   564
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   388
   End
   Begin Label lblDebug
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   16
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
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Debug"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   585
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Sub Preview(TemplateFolder as FolderItem)
		  If TemplateFolder = Nil OR NOT TemplateFolder.Exists Then Return
		  
		  // ## Get HTML file
		  Dim HTMLFile as FolderItem
		  Dim HTML as String
		  If TemplateFolder.Child( "index.html" ).Exists Then
		    HTMLFile = TemplateFolder.Child( "index.html" )
		  Else
		    
		    For i as Integer = 1 to TemplateFolder.Count
		      Dim Item as FolderItem = TemplateFolder.Item(i)
		      
		      If Item <> Nil And Item.Exists And Item.Type = "text/html" Then
		        HTMLFile = Item
		        HTML = ReadTextFile( HTMLFile )
		        
		        // Validate and exit or continue on.
		        If HTML.InStr( 0, "<template>" ) > 0 Then Exit
		        HTMLFile = Nil
		        HTML = ""
		      End If
		      
		    Next
		    
		  End If
		  
		  
		  // Read HTML file in.
		  If HTMLFile IsA FolderItem Then HTML = ReadTextFile( HTMLFile )
		  
		  If Trim( HTML ) = "" Then
		    'HTMLPreview.LoadPage( "", App.ExecutableFile )
		    Return
		  End If
		  
		  // Make a preview template.
		  
		  HTML = HTML.ReplaceAll( "%media%", CommonCore.SectionName )
		  'HTML = HTML.ReplaceAll( "%username%", SystemInformationMBS.UserName )
		  
		  Dim Template as String = HTML.MyMid( "<template>", "</template>" )
		  'HTML = RegExThis( HTML, "<template>(.*?)</template>", "%template%" )
		  
		  Dim FullTemplate as String
		  Dim n as Integer = 0
		  For i as Integer = 0 to ActiveListbox.ListCount
		    If n = 10 Then Exit // only the first 10 or so.
		    
		    Dim tmpTemplate as String = Template
		    
		    Dim FolderParent as FolderItem = GetFolderItem( ActiveListbox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If FolderParent = Nil OR NOT FolderParent.Exists Then Continue
		    
		    Dim NFOfile as FolderItem = FindNFOFile( FolderParent )
		    If NFOfile = Nil OR NOT NFOfile.Exists Then Continue
		    Dim NFOText as String = ReadTextFile( NFOfile )
		    If Trim( NFOText ) = "" OR Trim( NFOText ).Left(5) <> "<?xml" Then Continue
		    
		    n = n + 1
		    
		    // ## Fill in the blanks.
		    
		    // Poster
		    Dim PosterFile as FolderItem = FindImagePoster( FolderParent )
		    If PosterFile IsA FolderItem Then tmpTemplate = tmpTemplate.ReplaceAll( "%posterpath%",      "file://" + PosterFile.ShellPath.ReplaceAll("\","") ) Else tmpTemplate = tmpTemplate.ReplaceAll( "%posterpath%", "" )
		    If PosterFile IsA FolderItem Then tmpTemplate = tmpTemplate.ReplaceAll( "%posterthumbpath%", "file://" + PosterFile.ShellPath.ReplaceAll("\","") ) Else tmpTemplate = tmpTemplate.ReplaceAll( "%posterthumbpath%", "" )
		    
		    // Fanart
		    Dim FanartFile as FolderItem = FindImageFanart( FolderParent )
		    If FanartFile IsA FolderItem Then tmpTemplate = tmpTemplate.ReplaceAll( "%fanartpath%",      "file://" + FanartFile.ShellPath.ReplaceAll("\","") ) Else tmpTemplate = tmpTemplate.ReplaceAll( "%fanartpath%", "" )
		    If FanartFile IsA FolderItem Then tmpTemplate = tmpTemplate.ReplaceAll( "%fanartthumbpath%", "file://" + FanartFile.ShellPath.ReplaceAll("\","") ) Else tmpTemplate = tmpTemplate.ReplaceAll( "fanartthumbpath%", "" )
		    
		    // NFO
		    tmpTemplate = tmpTemplate.ReplaceAll( "%title%", NFOText.MyMid( "<title>", "</title>" ) )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%titlesort%", NFOText.MyMid( "<sorttitle>", "</sorttitle>" ) )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%titleoriginal%", NFOText.MyMid( "<originaltitle>", "</originaltitle>" ) )
		    
		    FullTemplate = FullTemplate + tmpTemplate
		  Next
		  
		  HTML = RegExThis( HTML, "<template>(.*?)</template>", FullTemplate )
		  
		  
		  
		  'HTMLPreview.LoadPage( html, HTMLFile )
		  'HTMLPreview.zoomPageOutMBS
		  'HTMLPreview.zoomPageOutMBS
		  'HTMLPreview.zoomPageOutMBS
		  'HTMLPreview.zoomPageOutMBS
		  'HTMLPreview.Refresh
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private DestinationFolder As FolderItem
	#tag EndProperty


	#tag Constant, Name = kSelectTemplate, Type = String, Dynamic = True, Default = \"Select Template:", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Select Template:"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Selecteer sjabloon:"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vorlage ausw\xC3\xA4hlen:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Choisir un mod\xC3\xA8le :"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"V\xC3\xA4lj tema:"
	#tag EndConstant


#tag EndWindowCode

#tag Events popTemplateSelector
	#tag Event
		Sub Change()
		  If Me.ListIndex < 0 Then Return
		  
		  HTMLTemplate.ReadTemplateInfo( Me.RowTag( Me.ListIndex ) )
		  
		  lblTmplName.Text = HTMLTemplate.TemplateName
		  lblTmplAuthor.Text = HTMLTemplate.TemplateAuthor
		  lblTmplDescription.Text = HTMLTemplate.TemplateDescription
		  
		  cvsPreview.Reload
		  'Preview( Me.RowTag( Me.ListIndex ) )
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Dim TemplatesFolder as FolderItem = Preferences.fAppSupport.Child("Templates")
		  If NOT TemplatesFolder IsA FolderItem Then
		    MsgBox "No templates available."
		    Close
		    Return
		  End If
		  
		  // Default first
		  For i as Integer = 1 to TemplatesFolder.Count
		    If TemplatesFolder.Item(i) = Nil OR NOT TemplatesFolder.Item(i).Directory Then Continue
		    If TemplatesFolder.Item(i).Name = "default" Then
		      Me.AddRow( TemplatesFolder.Item(i).Name )
		      Me.RowTag( Me.ListCount -1 ) = TemplatesFolder.Item(i)
		      Me.AddRow( "-" )
		    End If
		  Next
		  
		  // Add the rest
		  For i as Integer = 1 to TemplatesFolder.Count
		    If TemplatesFolder.Item(i) = Nil OR NOT TemplatesFolder.Item(i).Directory OR TemplatesFolder.Item(i).Name = "default" Then Continue
		    Me.AddRow( TemplatesFolder.Item(i).Name )
		    Me.RowTag( Me.ListCount -1 ) = TemplatesFolder.Item(i)
		  Next
		  
		  If Me.ListCount > 0 Then Me.ListIndex = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblArray
	#tag Event
		Sub Open(index as Integer)
		  If index = 1 Then Me.Text = Loc.kName + ":"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsPreview
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = &c929292
		  g.FillRect 0, 0, Width, Height
		  
		  If HTMLTemplate.Screenshot <> Nil Then
		    Dim ScaledWidth as Double = ScaledDim( HTMLTemplate.Screenshot, g.Width, g.Height, True )
		    Dim ScaledHeight as Double = ScaledDim( HTMLTemplate.Screenshot, g.Width, g.Height, False )
		    
		    g.ScaleImage( HTMLTemplate.Screenshot, g.Width, g.Height, ( g.Width / 2 ) - ( ScaledWidth / 2 ), ( g.Height / 2 ) - ( ScaledHeight / 2 ) )
		  End If
		  
		  g.ForeColor = &c000000
		  g.DrawRect 0, 0, g.Width, g.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelSave
	#tag Event
		Sub Open()
		  Me.CaptionOK = Loc.dlgSave
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionCancel()
		  Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub ActionOK()
		  
		  If Trim( popTemplateSelector.Text ) = "" Then
		    MessageBox "Make a selection first!"
		    Return
		  End If
		  
		  DestinationFolder = SelectFolder
		  If DestinationFolder = Nil Or NOT DestinationFolder.Exists Then Return
		  
		  // Set progress bar Max & visible
		  Dim tmpMax as Integer = 0
		  If ActiveSection = 0 Then
		    For i as Integer = 0 to wndMain.lstMovies.ListCount -1
		      If wndMain.lstMovies.Cell( i, 2 ) = "" Then Continue
		      tmpMax = tmpMax + 1
		    Next
		  ElseIf ActiveSection = 1 Then
		    For i as Integer = 0 to wndMain.lstTVShadow.ListCount -1
		      If wndMain.lstTVShadow.Cell( i, 2 ) = "" Then Continue
		      tmpMax = tmpMax + 1
		    Next
		  End If
		  prgBar.Maximum = tmpMax
		  prgBar.Visible = True
		  
		  Me.btnLeft.Enabled = False
		  Me.btnRight.Enabled = False
		  
		  HTMLTemplate.ProcessTemplate( popTemplateSelector.RowTag( popTemplateSelector.ListIndex ), DestinationFolder )
		  
		  prgBar.Visible = False
		  
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lblDebug
	#tag Event
		Sub Open()
		  me.Text = ""
		  me.Visible = ( DebugBuild OR App.Experimental )
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

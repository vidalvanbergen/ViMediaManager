#tag Window
Begin Window wndRenameTags
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   350
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   150
   MinimizeButton  =   True
   MinWidth        =   325
   Placement       =   3
   Resizeable      =   True
   Title           =   "#TitleRenameTags"
   Visible         =   True
   Width           =   375
   Begin SuperListbox lstTags
      AlternatingRowColors=   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "60, *"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   18
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   233
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Monaco"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   375
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   55
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kExampleMovies"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   275
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   335
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Loc.kExamples"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   245
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   335
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Init(Mode as String = "Movie")
		  Self.Show
		  
		  If Mode = "Movie" Then
		    lstTags.AddRow "", kLeftEmpty
		    
		    lstTags.AddRow "$T", Loc.mTitle.ReplaceAll(":","")
		    lstTags.AddRow "$S", Loc.mTitleSort.ReplaceAll(":","")
		    lstTags.AddRow "$O", Loc.mTitleOriginal.ReplaceAll(":","")
		    lstTags.AddRow "$Y", Loc.mYear.ReplaceAll(":","")
		    
		    lstTags.AddRow "$C", Menu.ViewSortByStudio
		    lstTags.AddRow "$M", Loc.mMPAARating.ReplaceAll(":", "")
		    lstTags.AddRow "$#", Loc.mRating.ReplaceAll(":","")
		    
		    lstTags.AddRow "$R", Loc.kResolution
		    lstTags.AddRow "$V", Loc.kCodecVideo.ReplaceAll(":", "")
		    lstTags.AddRow "$A", Loc.kCodecAudio.ReplaceAll(":", "")
		    lstTags.AddRow "$F", Loc.kCodecAudioChannels.ReplaceAll(":","")
		    lstTags.AddRow "$L", Loc.kCodecAudioLanguages.ReplaceAll(":", "")
		    lstTags.AddRow "$D", Loc.mRipSource.ReplaceAll( ":", "" ) + " (SDTV/HDTV/DVD/HD-DVD/Blu-Ray)"
		    lstTags.AddRow "$P", Loc.mDirector.ReplaceAll(":", "")
		    
		    lstTags.AddRow ".",  kReplaceSpacesWithDots
		    
		    lblArray(1).Text = kExampleMovies
		  ElseIf Mode = "TVShows" Then
		    lstTags.AddRow "$T", Loc.mTitle.ReplaceAll(":","")
		    lstTags.AddRow "$S", Loc.mTitleSort.ReplaceAll(":","")
		    lstTags.AddRow "$O", Loc.mTitleOriginal.ReplaceAll(":","")
		    lstTags.AddRow "$Y", Loc.mYear.ReplaceAll(":","")
		    lstTags.AddRow "$C", Loc.mNetwork.ReplaceAll(":","")
		    lstTags.AddRow "$M", Loc.mMPAARating.ReplaceAll(":", "")
		    lstTags.AddRow "$#", Loc.mRating.ReplaceAll(":","")
		    lstTags.AddRow "$P", Loc.mDirector.ReplaceAll(":", "")
		    lstTags.AddRow ".",  kReplaceSpacesWithDots
		    
		    lblArray(1).Text = kExampleTVShows
		  ElseIf Mode = "Episodes" Then
		    lstTags.AddRow "$T", Loc.kTitleEpisode.ReplaceAll(":","")
		    lstTags.AddRow "$N", Loc.mTitleSeries.ReplaceAll(":","")
		    lstTags.AddRow "$S", Loc.mSeasonNumber.ReplaceAll(":","")
		    lstTags.AddRow "$0S", Loc.mSeasonNumber.ReplaceAll(":","") + " " + Loc.kLeadingZero
		    lstTags.AddRow "$E", Loc.mEpisodeNumber.ReplaceAll(":","")
		    lstTags.AddRow "$0E", Loc.mEpisodeNumber.ReplaceAll(":","") + " " + Loc.kLeadingZero
		    lstTags.AddRow "$#", Loc.mRating.ReplaceAll(":","")
		    lstTags.AddRow "$R", Loc.kResolution
		    lstTags.AddRow "$Y", Loc.mYear.ReplaceAll(":","")
		    lstTags.AddRow "$M", Loc.mMonth
		    lstTags.AddRow "$D", Loc.mDay
		    lstTags.AddRow ".",  kReplaceSpacesWithDots
		    
		    lblArray(1).Text = kExampleEpisodes
		  End If
		End Sub
	#tag EndMethod


	#tag Constant, Name = kExampleEpisodes, Type = String, Dynamic = True, Default = \"S$0SE$0E - $T \x3D S02E03 - The Euclid Alternative\r[$N] $Sx$0E - $T \x3D [The Big Bang Theory] 2x03 - The Euclid Alternative\r$S$0E $T \x3D 203 The Euclid Alternative", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"S$0SE$0E - $T \x3D S02E03 - The Euclid Alternative\r[$N] $Sx$0E - $T \x3D [The Big Bang Theory] 2x03 - The Euclid Alternative\r$S$0E $T \x3D 203 The Euclid Alternative"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"S$0SE$0E - $T \x3D S02E03 - The Euclid Alternative\r[$N] $Sx$0E - $T \x3D [The Big Bang Theory] 2x03 - The Euclid Alternative\r$S$0E $T \x3D 203 The Euclid Alternative"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S$0SE$0E - $T \x3D S02E03 - The Euclid Alternative\r[$N] $Sx$0E - $T \x3D [The Big Bang Theory] 2x03 - The Euclid Alternative\r$S$0E $T \x3D 203 The Euclid Alternative"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"S$0SE$0E - $T \x3D S02E03 - The Euclid Alternative\r[$N] $Sx$0E - $T \x3D [The Big Bang Theory] 2x03 - The Euclid Alternative\r$S$0E $T \x3D 203 The Euclid Alternative"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"S$0SE$0E - $T \x3D S02E03 - The Euclid Alternative\r[$N] $Sx$0E - $T \x3D [The Big Bang Theory] 2x03 - The Euclid Alternative\r$S$0E $T \x3D 203 The Euclid Alternative"
	#tag EndConstant

	#tag Constant, Name = kExampleMovies, Type = String, Dynamic = True, Default = \"$T ($Y) \x3D  Stars Wars: Episode IV - A New Hope (1977)\r[$M] $S ($R) \x3D [Rated PG-13] Addams Family\x2C The (720p)\r$O.[$Y] \x3D Back.to.the.Future.III.[1985]", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"$T ($Y) \x3D  Stars Wars: Episode IV - A New Hope (1977)\r[$M] $S ($R) \x3D [Rated PG-13] Addams Family\x2C The (720p)\r$O.[$Y] \x3D Back.to.the.Future.III.[1985]"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"$T ($Y) \x3D  Stars Wars: Episode IV - A New Hope (1977)\r[$M] $S ($R) \x3D [Rated PG-13] Addams Family\x2C The (720p)\r$O.[$Y] \x3D Back.to.the.Future.III.[1985]"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"$T ($Y) \x3D  Stars Wars: Episod IV - Ett nytt hopp (1977)\r[$M] $S ($R) \x3D [Rated PG-13] Addams Familjen\x2C The (720p)\r$O.[$Y] \x3D Tillbaka.till.framtiden.III.[1985]"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"$T ($Y) \x3D  Stars Wars: Episode IV - Eine neue Hoffnung (1977)\r[$M] $S ($R) \x3D [12] Addams Family\x2C Die (720p)\r$O.[$Y] \x3D Zur\xC3\xBCck.in.die.Zukunft.III.[1985]"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"$T ($Y) \x3D  Stars Wars: Episode IV - A New Hope (1977)\r[$M] $S ($R) \x3D [Rated PG-13] Addams Family\x2C The (720p)\r$O.[$Y] \x3D Back.to.the.Future.III.[1985]"
	#tag EndConstant

	#tag Constant, Name = kExampleTVShows, Type = String, Dynamic = True, Default = \"$T ($Y) \x3D The Big Bang Theory (2007)\r[$C] $S / $M \x3D [CBS] Big Bang Theory\x2C The / TV-PG\r$O.[$Y] \x3D The.Big.Bang.Theory.[2007]", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"$T ($Y) \x3D The Big Bang Theory (2007)\r[$C] $S / $M \x3D [CBS] Big Bang Theory\x2C The / TV-PG\r$O.[$Y] \x3D The.Big.Bang.Theory.[2007]"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"$T ($Y) \x3D The Big Bang Theory (2007)\r[$C] $S / $M \x3D [CBS] Big Bang Theory\x2C The / TV-PG\r$O.[$Y] \x3D The.Big.Bang.Theory.[2007]"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"$T ($Y) \x3D The Big Bang Theory (2007)\r[$C] $S / $M \x3D [CBS] Big Bang Theory\x2C The / TV-PG\r$O.[$Y] \x3D The.Big.Bang.Theory.[2007]"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"$T ($Y) \x3D The Big Bang Theory (2007)\r[$C] $S / $M \x3D [CBS] Big Bang Theory\x2C The / TV-PG\r$O.[$Y] \x3D The.Big.Bang.Theory.[2007]"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"$T ($Y) \x3D The Big Bang Theory (2007)\r[$C] $S / $M \x3D [CBS] Big Bang Theory\x2C The / TV-PG\r$O.[$Y] \x3D The.Big.Bang.Theory.[2007]"
	#tag EndConstant

	#tag Constant, Name = kLeftEmpty, Type = String, Dynamic = True, Default = \"If left empty\x2C no changes will be made.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"If left empty\x2C no changes will be made."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bij een leeg veld\x2C zullen geen wijzigingen worden gemaakt."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wenn leer\x2C dann werden keine \xC3\x84nderungen vorgenommen."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Si laiss\xC3\xA9 vide\x2C rien ne sera modifi\xC3\xA9."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Om l\xC3\xA4mnad tom kommer inga \xC3\xA4ndringar att g\xC3\xB6ras."
	#tag EndConstant

	#tag Constant, Name = kReplaceSpacesWithDots, Type = String, Dynamic = True, Default = \"Replace spaces with dots", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Replace spaces with dots"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Vervang spaties met punten"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ers\xC3\xA4tt mellanslag med punkter"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Leerzeichen durch Punkte ersetzen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Remplacer les espaces avec des points"
	#tag EndConstant

	#tag Constant, Name = TitleRenameTags, Type = String, Dynamic = True, Default = \"Rename Tags", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Rename Tags"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Hernaming Tags"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"D\xC3\xB6p om Tags"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Tags umbenennen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Renommer les Tags"
	#tag EndConstant


#tag EndWindowCode

#tag Events lblArray
	#tag Event
		Sub Open(index as Integer)
		  If Me.Index = 0 Then Me.Text = Me.Text + ":"
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

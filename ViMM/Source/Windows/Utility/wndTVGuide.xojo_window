#tag Window
Begin Window wndTVGuide
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   654
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   600
   MinimizeButton  =   True
   MinWidth        =   940
   Placement       =   1
   Resizeable      =   True
   Title           =   "#Loc.TVShows"
   Visible         =   True
   Width           =   1024
   Begin SuperListbox lstTVGuide
      AlternatingRowColors=   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   7
      ColumnsResizable=   True
      ColumnWidths    =   "100%, *"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   44
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   569
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
      Top             =   33
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   467
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin ProgressBar pgBar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   479
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   614
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   96
   End
   Begin ccSearch SearchField
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      CueText         =   "#cCueText"
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   33
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LiveSearch      =   False
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   467
   End
   Begin HTMLViewer HTMLShowInfo
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   602
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   468
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   556
   End
   Begin PopupMenu popContext
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#Loc.kAll\r#MyShows\r-\r#TVPilots\r#NewSeries\r#NewSeasons\r-\r#Loc.t_Yesterday\r#Loc.t_Today\r#Loc.t_Tomorrow\r#Loc.t_Week\r#Loc.t_Month"
      Italic          =   False
      Left            =   739
      ListIndex       =   0
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
      Top             =   614
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   140
   End
   Begin PopupMenu popDestination
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
      Left            =   20
      ListIndex       =   0
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
      Top             =   614
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   274
   End
   Begin PushButton btnAdd
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Loc.MenuAddDir"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   325
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   614
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   130
   End
   Begin PopupMenu popCountries
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
      Left            =   587
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   614
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   140
   End
   Begin PopupMenu popNetworks
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
      Left            =   891
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   614
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   113
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Preferences.SaveWindowPos( self, "wndPilots" )
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.BorderBottomThickness = 52
		  'Preferences.LoadWindowPos( self, "wndPilots" )
		  
		  if LocalTitles = "" then
		    LocalTitles = FetchTitles
		  end if
		  
		  'FetchEpisodeGuide
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			self.Close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub BuildList()
		  
		  if lstTVGuide <> Nil and TVGuide <> Nil and TVGuide.Count > 0 then
		    lstTVGuide.DeleteAllRows
		    
		    for each showKey as string in TVGuide.Keys
		      dim currentShow as Dictionary = TVGuide.Lookup( showKey, Nil )
		      
		      if currentShow <> Nil and lstTVGuide <> Nil then
		        
		        dim name as string = currentShow.Lookup( "show-name", "" )
		        dim network as string = currentShow.Lookup( "network", "" )
		        dim status as string = currentShow.Lookup( "status", "" )
		        dim episodeseason as Integer = currentShow.Lookup( "episode-season", "" )
		        dim episodenumber as Integer = currentShow.Lookup( "episode-number", "" )
		        dim episodename as string = currentShow.Lookup( "episode-name", "" )
		        
		        
		        // Season/Episode Nr.
		        dim season as string = str( episodeseason )
		        dim number as string = str( episodenumber )
		        if season.len = 1 then
		          season = "0" + str( season )
		        end if
		        if number.len = 1 then
		          number = "0" + str( number )
		        end if
		        
		        // episode 'status'
		        dim episodestatus as string
		        if episodeseason = 1 and episodenumber = 1 then
		          episodestatus = TVPilot
		        else
		          episodestatus = "S" + season + "E" + number
		        end if
		        
		        // episode formatted name
		        dim formattedName as string
		        formattedName = "S" + season + "E" + number
		        if episodename <> "" then
		          formattedName = formattedName + " - " + episodename
		        end if
		        
		        // Pretty date
		        dim prettydate as string
		        dim ShowDays as Integer
		        dim today as new NativeSubclass.DateExtended
		        
		        dim ShowDate as new NativeSubclass.DateExtended
		        
		        if currentShow.Lookup( "episode-airstamp", "" ) <> "" then
		          ShowDate.ISO8601 = currentShow.Lookup( "episode-airstamp", "" )
		          ShowDate.GMTOffset = today.GMTOffset // Set to local GMT
		          
		          ShowDays = Floor( ( ShowDate.TotalSeconds - Today.TotalSeconds ) / 60 / 60 / 24 )
		          
		          Select Case ShowDays
		          Case Is <= -2
		            PrettyDate = Str( Abs(ShowDays) ) + " " + Loc.time_DaysAgo
		          Case -1
		            PrettyDate = Loc.t_Yesterday
		          case 0
		            PrettyDate = Loc.t_Today
		          case 1
		            PrettyDate = Loc.t_Tomorrow
		          Else
		            PrettyDate = InDays.ReplaceAll( "%S", Str( ShowDays ) )
		          End Select
		          PrettyDate = PrettyDate + " " + ShowDate.ShortTime
		          
		        end if
		        
		        
		        // Filters
		        if LocalTitles = "" then
		          LocalTitles = FetchTitles
		        end if
		        
		        Select case popContext.Text
		          
		        case Loc.kAll
		          // Add
		          
		        case MyShows
		          dim ShowName as string = currentShow.Lookup( "show-name", "√√" )
		          if LocalTitles.Contains( "|" + ShowName + "|" ) then
		            // Add
		          else
		            Continue
		          end if
		          
		          
		        case TVPilots
		          if episodestatus = TVPilot then
		            // Add
		          else
		            Continue
		          end if
		          
		        case NewSeries
		          if episodeseason = 1 and episodenumber <= 12 then
		            // Add
		          else
		            Continue
		          end if
		          
		          
		        case NewSeasons
		          if episodeseason = 1 then
		            // Add
		          else
		            Continue
		          end if
		          
		          
		        case Loc.t_Yesterday
		          if ShowDays = -1 then
		            // Add
		          else
		            Continue
		          end if
		          
		        case Loc.t_Today
		          if ShowDays = 0 then
		            // Add
		          else
		            Continue
		          end if
		          
		        case Loc.t_Tomorrow
		          if ShowDays = 1 then
		            // Add
		          else
		            Continue
		          end if
		          
		        case Loc.t_Week
		          if ShowDays <= 7 and ShowDays >= 0 then
		            // Add
		          else
		            Continue
		          end if
		          
		        case Loc.t_Month
		          if ShowDays <= 30 and ShowDays >= 0 then
		            // Add
		          else
		            Continue
		          end if
		          
		        else
		          // Continue
		          
		        end select
		        
		        
		        // Networks
		        if popNetworks.Text <> "" then
		          if network <> popNetworks.Text then
		            Continue
		          end if
		        end if
		        
		        
		        // Searchfield
		        if SearchField <> Nil and SearchField.srchField.StringValue <> "" then
		          dim search as string = SearchField.srchField.StringValue
		          if name.Contains( search ) or network.Contains( search ) then
		            // Add
		          else
		            Continue
		          end if
		        end if
		        
		        
		        
		        if lstTVGuide <> Nil then
		          lstTVGuide.AddRow name, network, prettydate, formattedName, currentShow.Lookup( "key_id", "" ), currentShow.Lookup( "episode-airstamp", "" ), str( ShowDays ), str( LocalTitles.Contains( name ) )
		        end if
		      end if
		      
		    next
		    
		  else
		    lstTVGuide.AddRow "No guide information available"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FetchEpisodeGuide()
		  
		  dim d as new Date // Today
		  TVGuide = New Dictionary
		  
		  dim networks() as string
		  
		  dim FutureDays as Integer = 30 * 8
		  dim CountryCode as string
		  if popCountries <> Nil then
		    CountryCode = popCountries.RowTag( popCountries.ListIndex )
		    popCountries.Enabled = False
		  end if
		  
		  pgBar.Visible = True
		  pgBar.Maximum = FutureDays // ±# Months
		  pgBar.Value = 0
		  
		  if lstTVGuide <> Nil then
		    lstTVGuide.Enabled = False
		  end if
		  
		  
		  for i as Integer = 0 to FutureDays + 1
		    if pgBar <> Nil then
		      pgBar.Value = i + 1
		    else
		      Return
		    end if
		    
		    dim ThisDaysGuide as new Dictionary
		    dim content as string
		    
		    // Get today's date
		    dim month as string = Str( d.Month )
		    if month.Len = 1 then
		      month = "0" + month
		    end if
		    
		    dim day as string = Str( d.Day )
		    if day.len = 1 then
		      day = "0" + day
		    end if
		    
		    dim Date as string = Str( d.Year ) + "-" + month + "-" + day
		    
		    
		    
		    // Download 'todays' schedule.
		    dim sckt as new HTTPSocket
		    sckt.Yield = True
		    content = Trim( DefineEncoding( sckt.Get( URLCore.TVMaze( Date, "Schedule", CountryCode ), Preferences.Prefs.integerForKey( "TimeOut" ) ), encodings.UTF8 ) )
		    sckt.Close
		    
		    dim jItems as JSONItem
		    if content.Contains("Too Many Requests") then
		      // Return // Server overloaded
		    elseif content <> "" then
		      jItems = new JSONItem( content )
		    end if
		    
		    // Process items
		    if jItems <> Nil and jItems.Count > 0 then
		      
		      for index as Integer = 0 to jItems.Count -1
		        if jItems.Child( index ) = Nil then
		          Continue
		        end if
		        
		        dim EpisodeInfo as JSONItem = jItems.Child( index )
		        dim EpisodeDict as new Dictionary
		        dim ID as string
		        
		        if EpisodeInfo <> Nil and EpisodeInfo.Count > 0 then
		          dim ShowInfo as JSONItem = EpisodeInfo.Lookup( "show", Nil )
		          
		          
		          if ShowInfo <> Nil and ShowInfo.Count > 0 then
		            ID = ShowInfo.Lookup( "name", "" ) + "@@" + EpisodeInfo.Lookup( "airstamp", "" )
		            
		            EpisodeDict.Value( "key_id" ) = id
		            EpisodeDict.Value( "show-name" ) = ShowInfo.Lookup( "name", "" )
		            EpisodeDict.Value( "show-id" ) = ShowInfo.Lookup( "id", "" )
		            EpisodeDict.Value( "show-url" ) = ShowInfo.Lookup( "url", "" )
		            EpisodeInfo.Value( "show-status" ) = ShowInfo.Lookup( "status", "" )
		            EpisodeDict.Value( "show-premiere" ) = ShowInfo.Lookup( "premiered", "" ) // Show Premiere (YYYY-MM-DD)
		            EpisodeDict.Value( "show-summary" ) = ShowInfo.Lookup( "summary", "" )
		            
		            dim showgenres as string
		            if ShowInfo.HasName( "genres" ) then
		              dim genres as JSONItem = ShowInfo.Value( "genres" )
		              'if genres <> Nil and genres.IsArray then
		              showgenres = genres.ToString
		              showgenres = showgenres.ReplaceAll( "[""", "" )
		              showgenres = showgenres.ReplaceAll( """]", "" )
		              showgenres = showgenres.ReplaceAll( """", "" )
		              showgenres = showgenres.ReplaceAll( "{", "" )
		              showgenres = showgenres.ReplaceAll( "}", "" )
		              showgenres = showgenres.ReplaceAll( ",", ", " )
		              
		              'dim s as string
		              'end if
		              
		            end if
		            EpisodeDict.Value( "show-genres" ) = showgenres
		            
		            
		            if ShowInfo.HasName( "image" ) then
		              if ShowInfo.Value( "image" ) IsA JSONItem then
		                dim showimages as JSONItem = ShowInfo.Lookup( "image", Nil )
		                if showimages <> Nil and showimages.Count > 0 then
		                  EpisodeDict.Value( "show-imagethumb" ) = showimages.Lookup( "medium", "" )
		                  EpisodeDict.Value( "show-image" ) = showimages.Lookup( "original", "" )
		                end if
		              else
		                EpisodeDict.Value( "show-imagethumb" ) = ShowInfo.Lookup( "image", "" )
		                EpisodeDict.Value( "show-image" ) = ShowInfo.Lookup( "image", "" )
		              end if
		            end if
		            
		            
		            if ShowInfo.HasName( "externals" ) then
		              dim externals as JSONItem = ShowInfo.Lookup( "externals", Nil )
		              if externals <> Nil and externals.Count > 0 then
		                EpisodeDict.Value( "tvdbid" ) = externals.Lookup( "thetvdb", "" ) // TVDB ID
		              end if
		            end if
		            
		            EpisodeDict.Value( "type" ) = ShowInfo.Lookup( "type", "" )
		            EpisodeDict.Value( "language" ) = ShowInfo.Lookup( "language", "" )
		            
		            
		            if ShowInfo.HasName( "network" ) then
		              dim networkInfo as JSONItem = ShowInfo.Lookup( "network", Nil )
		              if networkInfo <> Nil and networkInfo.lookup( "name", "" ) <> "" then
		                EpisodeDict.Value( "network" ) = networkInfo.Lookup( "name", "" )
		                if networks.IndexOf( networkInfo.Lookup( "name", "" ) ) = -1 then
		                  networks.Append( networkInfo.Lookup( "name", "" ) )
		                end if
		              end if
		              
		              if networkInfo <> Nil and networkInfo.HasName( "country" ) then
		                dim countryInfo as JSONItem = networkInfo.Lookup( "country", Nil )
		                if countryInfo <> Nil and countryInfo.Count > 0 then
		                  EpisodeDict.Value( "country-name" ) = countryInfo.Lookup( "name", "" )
		                  EpisodeDict.Value( "country-code" ) = countryInfo.Lookup( "code", "" )
		                end if
		              end if
		            end if
		            
		            
		          end if // @END ShowInfo <> Nil
		          
		          // Season & Episode combo (S01E01)
		          dim SeasonAndEpisode as string
		          dim Season as string = EpisodeDict.Lookup( "season", "" )
		          if Season.Len = 1 then
		            Season = "0" + Season
		          end if
		          
		          dim Episode as string = EpisodeDict.Lookup( "number", "" )
		          if Episode.Len = 1 then
		            Episode = "0" + Episode
		          end if
		          SeasonAndEpisode = "S" + Season + "E" + Episode
		          EpisodeDict.Value( "episode-seasonandnumber" ) = SeasonAndEpisode
		          
		          
		          EpisodeDict.Value( "episode-name" ) = EpisodeInfo.Lookup( "name", "" )
		          EpisodeDict.Value( "episode-season" ) = EpisodeInfo.Lookup( "season", "" )
		          EpisodeDict.Value( "episode-number" ) = EpisodeInfo.Lookup( "number", "" )
		          EpisodeDict.Value( "episode-url" ) = EpisodeInfo.Lookup( "url", "" )
		          EpisodeDict.Value( "episode-airstamp" ) = EpisodeInfo.Lookup( "airstamp", "" )
		          EpisodeDict.Value( "episode-runtime" ) = EpisodeInfo.Lookup( "runtime", "" )
		          EpisodeDict.Value( "episode-summary" ) = EpisodeInfo.Lookup( "summary", "" )
		          
		          
		          if EpisodeInfo <> Nil and EpisodeInfo.HasName( "image" ) then
		            if EpisodeInfo.Value( "image" ) IsA JSONItem then
		              dim episodeimages as JSONItem = EpisodeInfo.Lookup( "image", Nil )
		              if episodeimages <> Nil and episodeimages.Count > 0 then
		                EpisodeDict.Value( "episode-imagethumb" ) = episodeimages.Lookup( "medium", "" )
		                EpisodeDict.Value( "episode-image" ) = episodeimages.Lookup( "original", "" )
		              end if
		            else
		              EpisodeDict.Value( "episode-imagethumb" ) = EpisodeInfo.Lookup( "image", "" )
		              EpisodeDict.Value( "episode-image" ) = EpisodeInfo.Lookup( "image", "" )
		            end if
		          end if
		          
		          
		          
		        end if // @END currentItem <> Nil
		        
		        if id <> "" then
		          TVGuide.Value( id ) = EpisodeDict
		        end if
		        
		      next // @NEXT jItems.Child
		      
		    end if // @END if jItems <> Nil
		    
		    'Break
		    
		    
		    'TVGuide.Value( Date ) = ThisDaysGuide
		    
		    d.Day = d.Day + 1
		  next
		  
		  
		  
		  if lstTVGuide <> Nil then
		    BuildList
		    lstTVGuide.Enabled = True
		  end if
		  
		  if pgBar <> Nil then
		    pgBar.Visible = False
		  end if
		  
		  if popCountries <> Nil then
		    popCountries.Enabled = True
		  end if
		  
		  if networks <> Nil then
		    Networks.Sort
		    Networks.Insert(0, "")
		    
		    popNetworks.deleteallrows
		    
		    for each networkname as string in networks
		      popNetworks.addrow networkname
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchTitles() As String
		  // Get ALL the tv/anime titles and put them in a single string for later matching.
		  
		  Dim Paths() as FolderItem
		  For i as Integer = 0 to popDestination.ListCount -1
		    If popDestination.RowTag( i ) IsA FolderItem Then
		      Paths.Append popDestination.RowTag( i )
		    End If
		  Next
		  
		  
		  Dim Titles as String
		  For each Path as FolderItem in Paths
		    If Path = Nil OR NOT Path.Exists Then
		      Continue
		    End If
		    
		    For i as Integer = 1 to Path.Count
		      
		      if Path.Item(i).Directory then
		        Dim NFOFile as FolderItem = FindNFOFile( Path.Item(i) )
		        dim folderParent as string = Path.Item(i).Name
		        If NFOFile = Nil OR NOT NFOFile.Exists Then
		          Continue
		        End If
		        
		        Dim s as String = ReadTextFile( NFOFile )
		        Titles = Titles + "|" + s.MyMid("<title>", "</title>") + "|"
		        Titles = Titles + "|" + s.MyMid("<originaltitle>", "</original>") + "|"
		        'Titles = Titles + Path.Item(i).Name + "|"
		      end if
		      
		    Next
		    
		  Next
		  
		  Titles = Titles.ReplaceAll( "&amp;", "&" )
		  while Titles.Contains( "||" )
		    Titles = Titles.ReplaceAll( "||", "|" )
		  wend
		  
		  Return Titles
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAddButtonStatus()
		  
		  // Enable/Disable 'Add' button
		  Dim ParentFolder, ShowFolder as FolderItem
		  If popDestination.ListIndex > -1 And popDestination.RowTag( popDestination.ListIndex ) <> Nil Then
		    ParentFolder = popDestination.RowTag( popDestination.ListIndex )
		  End If
		  
		  If lstTVGuide.ListIndex > -1 And ParentFolder <> Nil And ParentFolder.Exists Then
		    Dim Name as String = lstTVGuide.Cell( lstTVGuide.ListIndex, 0 )
		    ShowFolder = ParentFolder.Child( CleanName( Name ) )
		    If ShowFolder = Nil OR NOT ShowFolder.Exists Then
		      ShowFolder = ParentFolder.Child( Articulator( CleanName( Name ) ) )
		    End If
		    
		    dim ShowFolderDoesNotYetExists as Boolean = ShowFolder <> Nil And NOT ShowFolder.Exists
		    btnAdd.Enabled =  ShowFolderDoesNotYetExists // TV Show doesn't exist yet
		  Else
		    btnAdd.Enabled = False
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private HTMLString As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LocalTitles As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pCountriesLastIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		popCountriesOpening As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		TVGuide As Dictionary
	#tag EndProperty


	#tag Constant, Name = HTMLPage, Type = String, Dynamic = False, Default = \"<!doctype html>\n<html>\n  <head>\n    <meta charset\x3D\"utf-8\">\n    <title>%name%</title>\n    <style>\n      * {\n        -webkit-box-sizing: border-box;\n        -moz-box-sizing: border-box;\n        box-sizing: border-box; }\n\n      html\x2C body {\n        border-right : 0;\n        color        : hsla( 0\x2C 0%\x2C 5%\x2C 1 );\n        font-family  : \"lucida grande\"\x2C sans-serif;\n        font-size    : 13px;\n        margin       : 0; padding: 0;\n        min-height   : 100%;\n        text-shadow  : 0 1px 0 white;\n      }\n      body {\n        /*background   : hsl( 0\x2C 0%\x2C 92.5% );*/\n      }\n      a { color: #369; text-decoration: none; }\n      a:hover { border-bottom: 1px solid; }\n\n      /*img.thumb   { max-width: 100%; min-width: 100%; }*/\n      img.thumb {\n        max-width: 250px;\n        float: right;\n        margin-left: 10px;\n        margin-right: 7px;\n        margin-bottom: 10px;\n        margin-top: 7px;\n\n        padding: 5px;\n        background-image : -webkit-linear-gradient( hsl( 0\x2C 0%\x2C 100% )\x2C hsl( 0\x2C 0%\x2C 93% ) );\n        background-image : linear-gradient( hsl( 0\x2C 0%\x2C 100% )\x2C hsl( 0\x2C 0%\x2C 93% ) );\n        border           : 1px solid hsl( 0\x2C 0%\x2C 80% );\n        border-radius    : 3px;\n        box-shadow       : 0 2px 3px hsla( 0\x2C 0%\x2C 0%\x2C .2 );\n      }\n      img.network {\n        max-width: 150px;\n        float: left;\n\n        padding: 5px;\n        background-image : -webkit-linear-gradient( hsl( 0\x2C 0%\x2C 100% )\x2C hsl( 0\x2C 0%\x2C 93% ) );\n        background-image : linear-gradient( hsl( 0\x2C 0%\x2C 100% )\x2C hsl( 0\x2C 0%\x2C 93% ) );\n        border           : 1px solid hsl( 0\x2C 0%\x2C 80% );\n        border-radius    : 3px;\n        box-shadow       : 0 2px 3px hsla( 0\x2C 0%\x2C 0%\x2C .2 );\n        margin-bottom    : 1em;\n        margin-right     : 1em;\n      }\n      img[src\x3D\"\"] { display: none; }\n\n      h1\x2C h2\x2C h3 { margin: 0; padding: 0; }\n      h1 { font-size: 1.6em; }\n      h3 { font-size: 1.2em; }\n      p:last-child { margin-bottom: 0; }\n      .episodeinfo {\n        background-image : -webkit-linear-gradient( hsl( 0\x2C 0%\x2C 100% )\x2C hsl( 0\x2C 0%\x2C 93% ) );\n        background-image : linear-gradient( hsl( 0\x2C 0%\x2C 100% )\x2C hsl( 0\x2C 0%\x2C 93% ) );\n        border           : 1px solid hsl( 0\x2C 0%\x2C 80% );\n        border-radius    : 3px;\n        box-shadow       : 0 2px 3px hsla( 0\x2C 0%\x2C 0%\x2C .2 );\n        clear            : both;\n        padding          : 10px;\n        margin           : 1em 0;\n        overflow         : hidden;\n      }\n      .episodeinfo img { float: right; max-width: 200px; max-height: 120px; margin-left: 10px; margin-bottom: 10px; }\n      .info { color: hsl( 0\x2C 0%\x2C 50% ); margin: 0; font-weight: normal; }\n      .moreinfo { font-size: .85em; }\n      .staff b { min-width: 75px; display: inline-block; }\n      section { padding: 10px; }\n      footer {\n        text-align: right;\n        padding: 3px 8px 8px 3px;\n        font-size: .85em;\n      }\n    </style>\n  </head>\n  <body>\n\n    <img src\x3D\"%url%\" class\x3D\"thumb\">\n\n    <section>\n      <h1>%name%</h1>\n      <p class\x3D\"info\">\n        <!-- <span class\x3D\"date\">%date%</span> | -->\n        <span class\x3D\"country\">%country%</span> |\n        <span class\x3D\"network\">%network%</span> |\n        <span class\x3D\"type\">%type%</span> |\n        <span class\x3D\"status\">%status%</span>\n      </p>\n      <span class\x3D\"genres\">%genres%</span>\n\n      <p>%desciption%</p>\n      <p class\x3D\"moreinfo\">TV Show information on <a href\x3D\"%link%\">TVMaze</a></p>\n\n      <img src\x3D\"%networklogo%\" class\x3D\"network\">\n\n      <!--script>\n        if ( !(\"\" \x3D\x3D\x3D \"%trailerurl%\") ) {\n          document.write(\"<video width\x3D\"100%\"\" height\x3D\"auto\" controls poster\x3D\"%trailerposter%\"><source src\x3D\"%trailerurl%\" type\x3D\"video/avi\"></video>\")\n        };\n      </script-->\n\n      <div class\x3D\"episodeinfo\">\n        <img src\x3D\"%episodethumb%\">\n        <h3><span class\x3D\"number\">%number%</span> %episodetitle%</h3>\n\n        <p class\x3D\"info\">\n          <span class\x3D\"premiere\">%premiere%</span> |\n          <span class\x3D\"airdate\">%date%</span> |\n          <span class\x3D\"airtime\">%time%</span>\n        </p>\n        <p>%episodesummary%</p>\n\n        <!--p class\x3D\"staff\">\n          <b>Director:</b>%episodedirector%<br/>\n          <b>Writer:</b>%episodewriter%\n        </p-->\n\n        <p class\x3D\"moreinfo\">Episode Information on <a href\x3D\"%episodelink%\">TVMaze</a></p>\n      </div>\n    </section>\n\n\n    <!--footer>\n      <p>Powered by <a href\x3D\"http://tvrage.com/\">TVRage.com</a></p>\n    </footer-->\n  </body>\n</html>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InDays, Type = String, Dynamic = True, Default = \"In %S Days", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"In %S Days"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"In %S Dagen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"In %s Tage"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dans %s jours"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"I %s dagar"
	#tag EndConstant

	#tag Constant, Name = kSelectCountries, Type = String, Dynamic = True, Default = \"Select Country from the popdown menu below", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Select Country from the popdown menu below"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Selecteer land van popdown menu beneden"
	#tag EndConstant

	#tag Constant, Name = MyShows, Type = String, Dynamic = True, Default = \"My Shows", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"My Shows"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Mijn TV Series"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Meine TV-Shows"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Mes \xC3\xA9missions de TV"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Mina TV-program"
	#tag EndConstant

	#tag Constant, Name = NewSeason, Type = String, Dynamic = True, Default = \"New Season", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"New Season"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Nieuw seizoen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Neue Saison"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouvelles saison"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Nya s\xC3\xA4song"
	#tag EndConstant

	#tag Constant, Name = NewSeasons, Type = String, Dynamic = True, Default = \"New Seasons", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"New Seasons"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Nieuwe seizoenen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Neue Saison"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouvelles saisons"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Nya s\xC3\xA4songer"
	#tag EndConstant

	#tag Constant, Name = NewSerie, Type = String, Dynamic = True, Default = \"New Serie", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"New Serie"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Nieuwe Serie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Neue Serie"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouvelle s\xC3\xA9rie"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ny serie"
	#tag EndConstant

	#tag Constant, Name = NewSeries, Type = String, Dynamic = True, Default = \"New Series", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"New Series"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Nieuwe Series"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Neue Series"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouvelle s\xC3\xA9rien"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ny serien"
	#tag EndConstant

	#tag Constant, Name = TVPilot, Type = String, Dynamic = True, Default = \"Pilot", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Pilot"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Pilot"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Pilote"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Pilot"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Pilot"
	#tag EndConstant

	#tag Constant, Name = TVPilots, Type = String, Dynamic = True, Default = \"Pilots", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Pilots"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Pilots"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Pilotes"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Pilots"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Pilots"
	#tag EndConstant


#tag EndWindowCode

#tag Events lstTVGuide
	#tag Event
		Sub Open()
		  Me.InitialValue = Me.InitialValue.ReplaceAll(":","")
		  me.AddRow kSelectCountries
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  
		  
		  if column = 2 then
		    
		    // Set dates
		    dim AirStamp1, AirStamp2 as string
		    AirStamp1 = me.Cell( row1, 5 )
		    AirStamp2 = me.Cell( row2, 5 )
		    
		    dim Date1 as new NativeSubclass.DateExtended
		    dim Date2 as new NativeSubclass.DateExtended
		    if AirStamp1 <> "" then
		      Date1.ISO8601 = AirStamp1
		    end if
		    if AirStamp2 <> "" then
		      Date2.ISO8601 = AirStamp2
		    end if
		    
		    
		    if AirStamp1 > AirStamp2 then
		      result = 1
		    elseif AirStamp1 = AirStamp2 then
		      result = 0
		    elseif AirStamp1 < AirStamp2 then
		      result = -1
		    end if
		    
		    Return True
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  if column = 0 then
		    
		    'dim TextForeColor, SubTextForecolor, TextShadowColor as Color
		    'if me.Selected( row ) then
		    'TextForeColor = RGB( 255, 255, 255 )
		    'SubTextForeColor = RGB( 255, 255, 255 )
		    'TextShadowColor = RGB(  51,  84, 133 )
		    'g.Bold = True
		    'else
		    'TextForeColor = RGB( 0, 0, 0 )
		    'SubTextForecolor = RGB( 100, 100, 100 )
		    'TextShadowColor = RGB( 255, 255, 255, 255 )
		    'end if
		    
		    
		    dim padding as Integer = 6
		    
		    dim row1, row2 as Integer = g.TextAscent + 4
		    row2 = row1 + 13 + padding
		    
		    dim ShowName, Episode, Network, PrettyDate as string
		    ShowName = me.Cell( row, 0 )
		    Network = me.Cell( row, 1 )
		    PrettyDate = me.Cell( row, 2 )
		    Episode = me.Cell( row, 3 )
		    
		    dim NetworkWidth as Double = g.StringWidth( Network )
		    dim PrettyDateWidth as Double = g.StringWidth( PrettyDate )
		    
		    
		    
		    g.DrawString Network, g.Width - padding - NetworkWidth, row1  
		    
		    dim TextForeColor as Color
		    if me.Cell( row, 7 ) = "true" then
		      'ShowName = "√ " + ShowName
		      if NOT me.Selected( row ) then
		        g.ForeColor = rgb(0, 127, 225) 'RGB( 255, 255, 255 )
		      end if
		    end if
		    g.DrawString ShowName, padding, row1, g.Width - padding - NetworkWidth - padding, true
		    
		    
		    if NOT me.Selected(row) then
		      g.ForeColor = HSL( 0, 0, 50 )
		    end if
		    g.DrawString PrettyDate, g.Width - padding - PrettyDateWidth, row2
		    g.DrawString Episode, padding, row2, g.Width - padding - PrettyDateWidth - padding, true
		    
		    
		    'g.DrawStringShadow TextForeColor, TextShadowColor, ShowName, padding, row1, g.Width - padding - NetworkWidth - padding, true // Title
		    'g.DrawStringShadow SubTextForecolor, TextShadowColor, Episode, padding, row2, g.Width - padding - PrettyDateWidth - padding, true // S00E00 - Name
		    
		    'g.DrawStringShadow TextForeColor, TextShadowColor, Network, g.Width - padding - NetworkWidth, row1
		    'g.DrawStringShadow SubTextForecolor, TextShadowColor, PrettyDate, g.Width - padding - PrettyDateWidth, row2
		    
		    Return True
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  
		  // Empty Cache file
		  HTMLString = ""
		  Dim g as FolderItem = SpecialFolder.Temporary.Child( App.Identifier ).Child( "tvguide.html" )
		  If g <> Nil And NOT g.Exists and g.IsWriteable Then
		    WriteTextFile( HTMLString, g )
		  End If
		  
		  // Show blanko page
		  HTMLShowInfo.LoadPage( HTMLString, g )
		  
		  pgBar.Maximum = 11
		  pgBar.Value = 0
		  pgBar.Visible = True
		  
		  
		  // Step 1 - Verify everything is ready to go.
		  pgBar.Value = pgBar.Value +1
		  
		  // make sure there is a selection
		  if lstTVGuide.ListIndex > -1 and TVGuide <> Nil then
		    
		    
		    HTMLString = HTMLPage
		    
		    // 'Add' button enabled status.
		    SetAddButtonStatus
		    
		    // Get dictionary entry
		    dim ShowEntry as Dictionary = TVGuide.Lookup( me.Cell( me.ListIndex, 4 ), Nil )
		    
		    if ShowEntry <> Nil and ShowEntry.Count > -1 then
		      
		      // Step 2 - Get a pretty episode air date
		      pgBar.Value = pgBar.Value +1
		      
		      
		      // Format date
		      dim EpisodePremiere as string = ShowEntry.Lookup( "episode-airstamp", "" )
		      dim premiereDate as new NativeSubclass.DateExtended
		      dim today as new NativeSubclass.DateExtended
		      
		      if EpisodePremiere <> "" then
		        premiereDate.ISO8601 = EpisodePremiere
		        premiereDate.GMTOffset = today.GMTOffset
		      end if
		      
		      dim ShowDay as Integer = Floor( ( premiereDate.TotalSeconds - today.TotalSeconds ) / 60 / 60 / 24 )
		      
		      Select case ShowDay
		        
		      case Is < -1
		        EpisodePremiere = "Aired " + Str( Abs( ShowDay ) ) + " " + Loc.DateDays + " ago"
		      case -1
		        EpisodePremiere = "Aired " + Loc.t_Yesterday
		      case 0
		        EpisodePremiere = "Airing " + Loc.t_Today
		      case 1
		        EpisodePremiere = "Airing " + Loc.t_Tomorrow
		      case Is > 1
		        EpisodePremiere = "Airing in " + Str( ShowDay ) + " " + Loc.DateDays
		        
		      end select
		      
		      // Step 3 - Replace the HTMLstring variables with show variables
		      pgBar.Value = pgBar.Value +1
		      
		      HTMLString = HTMLString.ReplaceAll("%name%", ShowEntry.Lookup( "show-name", "" ) )
		      HTMLString = HTMLString.ReplaceAll("%episodetitle%", ShowEntry.Lookup( "episode-name", "" ) )
		      HTMLString = HTMLString.ReplaceAll("%date%", Int2Month( premiereDate.Month, True ) + " " + Format( premiereDate.Day, "00" ) + ", " + Str( premiereDate.Year ) )
		      HTMLString = HTMLString.ReplaceAll("%time%", premiereDate.ShortTime )
		      HTMLString = HTMLString.ReplaceAll("%premiere%", EpisodePremiere )
		      HTMLString = HTMLString.ReplaceAll("%number%", ShowEntry.Lookup( "episode-episode-seasonandnumber", "" ) )
		      HTMLString = HTMLString.ReplaceAll("%link%", ShowEntry.Lookup( "show-url", "" ) )
		      
		      'HTMLString = HTMLString.ReplaceAll("%classification%", ShowEntry.Lookup( "classification", "$classification$" ) )
		      HTMLString = HTMLString.ReplaceAll("%genres%", ShowEntry.Lookup( "show-genres", "" ) )
		      HTMLString = HTMLString.ReplaceAll("%status%", ShowEntry.Lookup( "show-status", "" ) )
		      
		      HTMLString = HTMLString.ReplaceAll("%desciption%", ShowEntry.Lookup( "show-summary", "" ) )
		      'HTMLString = HTMLString.ReplaceAll("%url%", ShowEntry.Lookup("show-imagethumb", "") )
		      HTMLString = HTMLString.ReplaceAll("%network%", ShowEntry.Lookup( "network", "" ) )
		      HTMLString = HTMLString.ReplaceAll("%type%", ShowEntry.Lookup( "type", "" ) )
		      HTMLString = HTMLString.ReplaceAll("%country%", ShowEntry.Lookup( "country-name", "" ) )
		      
		      'HTMLString = HTMLString.ReplaceAll("%trailerurl%", ShowEntry.Lookup( "trailer", "" ) )
		      'HTMLString = HTMLString.ReplaceAll("%trailerposter%", ShowEntry.Lookup( "trailerposter", "" ) )
		      
		      dim thumbURL as String = ShowEntry.Lookup("show-imagethumb", "")
		      if thumbURL <> "" then
		        dim thumbImage as Picture = HTTPGetImage(thumbURL)
		        if thumbImage <> Nil then
		          dim svdata as String = PictureToURL(thumbImage)
		          HTMLString = HTMLString.ReplaceAll("%url%", svdata)
		        end if
		      end if
		      
		      HTMLString = HTMLString.ReplaceAll( "%episodethumb%", ShowEntry.Lookup("episode-image", "") )
		      HTMLString = HTMLString.ReplaceAll( "%episodesummary%", ShowEntry.Lookup("episode-summary","") )
		      HTMLString = HTMLString.ReplaceAll( "%episodelink%", ShowEntry.Lookup("episode-url", "") )
		      
		      'HTMLString = HTMLString.ReplaceAll( "%episodedirector%", ShowEntry.Lookup("episode-director", "") )
		      'HTMLString = HTMLString.ReplaceAll( "%episodewriter%", ShowEntry.Lookup("episode-writer", "") )
		      
		      HTMLString = HTMLString.ReplaceAll( "%episodeairdate%", ShowEntry.Lookup("episode-airstamp", "") )
		      
		      // Step 4 - Get the network logo image if available
		      pgBar.Value = pgBar.Value + 1
		      
		      dim StudioLogo as FolderItem = Preferences.fAppSupport.Child("Studios").Child( ShowEntry.Lookup("network","").StringValue.ReplaceAll(":", "-") + ".png" )
		      If StudioLogo <> Nil And StudioLogo.Exists Then
		        HTMLString = HTMLString.ReplaceAll("%networklogo%", StudioLogo.URLPath )
		      Else
		        HTMLString = HTMLString.ReplaceAll("%networklogo%", "" )
		      End If
		      
		      // Step 5 - load the page
		      pgBar.Value = pgBar.Value + 1
		      HTMLString = RegExThis( RegExThis( HTMLString, ">\%(.*?)\%<" ), "\'\%(.*?)\%\'", "''" ) // Remove unreplaced %<>%
		      HTMLShowInfo.LoadPage( HTMLString, g )
		      
		      
		    end if // @END ShowEntry <> Nil
		    
		    
		    
		  end if // @END lstTVGuide.ListIndex > -1
		  
		  pgBar.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SearchField
	#tag Event
		Sub Open()
		  'me.LiveSearch = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoSearch(SearchText as String)
		  BuildList
		End Sub
	#tag EndEvent
	#tag Event
		Sub ResetSearch()
		  BuildList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popContext
	#tag Event
		Sub Change()
		  BuildList
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'Me.BezelStyle = PopupMenuExtension.NSBezelStyle.NSTexturedRoundedBezelStyle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popDestination
	#tag Event
		Sub Open()
		  'Me.BezelStyle = PopupMenuExtension.NSBezelStyle.NSTexturedRoundedBezelStyle
		  
		  'If ActiveSection = 1 Then
		  Me.DeleteAllRows
		  
		  // TV Show Paths
		  Dim Dict as Dictionary = Preferences.Prefs.dictionaryForKey("TVShowPaths")
		  Dim Paths() as FolderItem
		  
		  
		  If Dict <> Nil Then
		    For Each Key as Variant in Dict.Keys
		      If Key.StringValue.InStr( 0, ":" ) > 0 Then
		        Paths.Append GetFolderItem( Key )
		      Else
		        Paths.Append GetFolderItem( Key, FolderItem.PathTypeShell )
		      End If
		    Next
		  End If
		  
		  // Anime Paths
		  Dict = Preferences.Prefs.dictionaryForKey("AnimePaths")
		  
		  If Dict <> Nil Then
		    
		    For Each Key as Variant in Dict.Keys
		      If Key.StringValue.InStr( 0, ":" ) > 0 Then
		        Paths.Append GetFolderItem( Key )
		      Else
		        Paths.Append GetFolderItem( Key, FolderItem.PathTypeShell )
		      End If
		    Next
		    
		  End If
		  
		  // Add All Paths
		  For each Folder as FolderItem in Paths
		    If Folder = Nil OR NOT Folder.Exists Then Continue
		    #If TargetCocoa Then
		      dim icon as MacIcon = MacIcon.NewIconFromFolderItem(Folder)
		      icon.Size = 16
		      Me.AddRowWithTagAndPicture( Folder.Name, Folder, icon )
		    #Else
		      Me.AddRowWithTagAndPicture( Folder.Name, Folder )
		    #endif
		  Next
		  
		  // Select first path
		  If Me.ListCount > 0 Then
		    Me.ListIndex = 0
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  SetAddButtonStatus
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAdd
	#tag Event
		Sub Action()
		  Dim f, NewF as FolderItem
		  If popDestination.ListIndex > -1 And popDestination.RowTag( popDestination.ListIndex ) <> Nil Then f = popDestination.RowTag( popDestination.ListIndex )
		  
		  If f <> Nil And f.Exists Then
		    NewF = f.Child( CleanName( lstTVGuide.Cell( lstTVGuide.ListIndex, 0 ) ) )
		    If NewF <> Nil And NOT NewF.Exists And f.IsWriteable Then
		      NewF.CreateAsFolder
		      LocalTitles = LocalTitles + "|" + lstTVGuide.Cell( lstTVGuide.ListIndex, 0 ) + "|"
		    End If
		    Me.Enabled = ( NewF <> Nil And NOT NewF.Exists )
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  #if TargetCocoa then
		    'Me.BezelStyle = PushButtonExtension.NSBezelStyle.NSTexturedRoundedBezelStyle
		    'me.Top = me.Top - 1
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popCountries
	#tag Event
		Sub Change()
		  
		  if popCountriesOpening then
		    popCountriesOpening = False
		  else
		    if pCountriesLastIndex <> me.ListIndex then
		      FetchEpisodeGuide
		      pCountriesLastIndex = me.ListIndex
		    end if
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'Me.BezelStyle = PopupMenuExtension.NSBezelStyle.NSTexturedRoundedBezelStyle
		  
		  
		  Me.AddRowWithTagAndPicture Loc.mCountries.ReplaceAll(":", ""), "", Nil
		  me.AddRow "-"
		  Me.AddRowWithTagAndPicture "America", "US", us
		  Me.AddRowWithTagAndPicture "Australia", "AU", au
		  Me.AddRowWithTagAndPicture "België", "BE", be
		  Me.AddRowWithTagAndPicture "Brasil", "BR", br
		  Me.AddRowWithTagAndPicture "Canada", "CA", ca
		  Me.AddRowWithTagAndPicture "Deutschland", "DE", de
		  Me.AddRowWithTagAndPicture "España", "ES", es
		  Me.AddRowWithTagAndPicture "France", "FR", fr
		  Me.AddRowWithTagAndPicture "Ireland", "IE", ie
		  Me.AddRowWithTagAndPicture "Italia", "IT", it
		  Me.AddRowWithTagAndPicture "México", "MX", mx
		  Me.AddRowWithTagAndPicture "Nederland", "NL", nl
		  Me.AddRowWithTagAndPicture "Suomi", "FI", fi
		  Me.AddRowWithTagAndPicture "Sverige", "SE", se
		  Me.AddRowWithTagAndPicture "Türkiye", "TR", tr
		  Me.AddRowWithTagAndPicture "United Kingdom", "GB", gb
		  Me.AddRowWithTagAndPicture "Россия", "RU", ru
		  Me.AddRowWithTagAndPicture "中国", "CN", cn
		  Me.AddRowWithTagAndPicture "日本", "JP", ja
		  
		  Me.ListIndex = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popNetworks
	#tag Event
		Sub Change()
		  BuildList
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
		Name="LocalTitles"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="pCountriesLastIndex"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
		Name="popCountriesOpening"
		Group="Behavior"
		InitialValue="True"
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

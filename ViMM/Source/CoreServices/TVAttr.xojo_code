#tag Module
Protected Module TVAttr
	#tag Method, Flags = &h1
		Protected Sub ClearProperties()
		  ReDim Actor_ID(-1)
		  ReDim Actor_Name(-1)
		  ReDim Actor_Role(-1)
		  ReDim Actor_ThumbURL(-1)
		  
		  
		  ReDim ART_PosterURLs(-1)
		  ReDim ART_SeasonURLs(-1)
		  ReDim ART_SeasonNumbers(-1)
		  
		  ReDim ART_FanartDimensions(-1)
		  ReDim ART_FanartThumbURLs(-1)
		  ReDim ART_FanartURLs(-1)
		  
		  ReDim Art_BannerURLs(-1)
		  
		  
		  ART_Poster       = Nil
		  ART_Fanart       = Nil
		  ART_Banner       = Nil
		  
		  ART_Logo         = Nil
		  ART_ClearArt     = Nil
		  ART_TVThumb      = Nil
		  ART_CharacterArt = Nil
		  
		  ART_MPAARating   = Nil
		  ART_Studio       = Nil
		  
		  ID_IMDb   = ""
		  ID_TVDB   = ""
		  ID_TVRage = ""
		  
		  Title         = ""
		  TitleSort     = ""
		  TitleOriginal = ""
		  
		  
		  CreditDirector = ""
		  CreditWriter   = ""
		  CreditMusic    = ""
		  
		  DateYear = -1
		  DatePremiered = ""
		  DateEnded = ""
		  
		  ReDim DescriptionTaglines(-1)
		  DescriptionTagline = ""
		  DescriptionOutline = ""
		  DescriptionPlot    = ""
		  
		  DurationRuntime = -1
		  
		  ReDim Genres(-1)
		  
		  LastAired_Date = ""
		  LastAired_Episode = ""
		  NextAired_Date = ""
		  NextAired_Episode = ""
		  
		  Rating = -1
		  RatingMPAA = ""
		  RatingVotes = -1
		  
		  Status = ""
		  TVNetwork = ""
		  Classification = ""
		  ReDim RatingCertification(-1)
		  
		  ReDim Studios(-1)
		  ReDim Countries(-1)
		  ReDim Languages(-1)
		  ReDim ActorStars(-1)
		  
		  ReDim RecShows(-1)
		  ReDim RecShow_IDs(-1)
		  
		  ReDim ThemeSongs(-1)
		  ReDim Tags(-1)
		  
		  Locked = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EpisodeNFO(ThisEpisode as JSONItem, EpisodeFile as FolderItem, Multi() as JSONItem = Nil) As FolderItem
		  If EpisodeFile = Nil OR NOT EpisodeFile.Exists Then Return Nil
		  
		  Dim MultiEpisodes() as JSONItem
		  If Multi = Nil Then MultiEpisodes.Append ThisEpisode Else MultiEpisodes = Multi
		  
		  Dim EpisodeNrs() as Integer
		  For i as Integer = 0 to MultiEpisodes.Ubound
		    If MultiEpisodes(i) = Nil Then Continue
		    If MultiEpisodes(i).HasName("EpisodeNumber") Then EpisodeNrs.Append Val( MultiEpisodes(i).Value("EpisodeNumber") )
		  Next
		  
		  Dim YAMJ, XBMC as String = ""
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then YAMJ = ".videoimage"
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "XBMC" Then XBMC = "-thumb"
		  
		  
		  
		  // Process Episode NFO.
		  Dim xRoot, xNode, xItem as XmlNode
		  Dim xContent as String
		  
		  App.ErrorMessage = "EpisodeNFO: Going through " + Str( MultiEpisodes.Ubound + 1 ) + " episode(s)"
		  Dim Count as Integer = 0
		  
		  For Each Episode as JSONItem in MultiEpisodes
		    If Episode = Nil Then Continue
		    Count = Count + 1
		    App.ErrorMessage = Chr(13) + Str( Count ) + " of " + Str( MultiEpisodes.Ubound + 1 )
		    
		    'Dim OldNFO as String
		    'If EpisodeFile.Parent.Child( EpisodeFile.NameNoExtension + ".nfo" ).Exists Then
		    'OldNFO = ReadTextFile( EpisodeFile.Parent.Child( EpisodeFile.NameNoExtension + ".nfo" ) )
		    'End If
		    
		    Dim Xml as New XmlDocument
		    Xml.PreserveWhitespace = True
		    xRoot = Xml.AppendChild( Xml.CreateElement ( "episodedetails" ) )
		    
		    // TVDB Episode ID
		    If Episode.HasName("id") Then
		      If Preferences.Prefs.stringForKey("MediaPlayer") <> "Boxee" Then
		        xNode = xRoot.AppendNewChild("id")
		        xNode.SetValue( Episode.Value("id") )
		        xNode.SetAttribute("moviedb", "TVDB")
		      Else
		        xRoot.AppendSimpleChild( "boxeeTVDB", Episode.Value("id") )
		      End If
		    End If
		    
		    // IMDb Episode ID
		    If Episode.HasName("IMDB_ID") And Episode.Value("IMDB_ID") <> "" Then
		      If Preferences.Prefs.stringForKey("MediaPlayer") <> "Boxee" Then
		        xNode = xRoot.AppendNewChild("id")
		        xNode.SetValue( Episode.Value("IMDB_ID") )
		        xNode.SetAttribute("moviedb", "IMDb")
		      Else
		        xRoot.AppendSimpleChild( "boxeeIMDb", Episode.Value("IMDB_ID") )
		      End If
		    End If
		    
		    // -- About episode
		    
		    // Title
		    If Episode.Value("EpisodeName") <> "" Then xRoot.AppendSimpleChild( "title", Episode.Value("EpisodeName") )
		    
		    // Season x Episode
		    If Episode.HasName("SeasonNumber")   And Episode.Value("SeasonNumber")   <> "" Then xRoot.AppendSimpleChild( "season", Episode.Value( "SeasonNumber" ) )
		    If Episode.HasName("EpisodeNumber")  And Episode.Value("EpisodeNumber")  <> "" Then xRoot.AppendSimpleChild( "episode", Episode.Value( "EpisodeNumber" ) )
		    If Episode.HasName("DVDSeason")      And Episode.Value("DVDSeason")      <> "" Then xRoot.AppendSimpleChild( "dvdseason", Episode.Value("DVDSeason") )
		    If Episode.HasName("DVDEpisode")     And Episode.Value("DVDEpisode")     <> "" Then xRoot.AppendSimpleChild( "dvdepisode", Episode.Value("DVDEpisode") )
		    If Episode.HasName("AbsoluteNumber") And Episode.Value("AbsoluteNumber") <> "" Then xRoot.AppendSimpleChild( "absoluteorder", Episode.Value("AbsoluteNumber") )
		    
		    Dim SeasonNr as Integer = Episode.Value("SeasonNumber")
		    Dim EpisodeNr as Integer = Episode.Value("EpisodeNumber")
		    
		    // Air Date
		    If Episode.HasName("FirstAired") And Episode.Value("FirstAired") <> "" Then xRoot.AppendSimpleChild("aired", Episode.Value("FirstAired") )
		    
		    //Special episode airs before:
		    If SeasonNr = 0 And Episode.HasName("airsbefore_season") And Episode.Value("airsbefore_season") <> "" Then
		      xRoot.AppendSimpleChild( "displayseason", Episode.Value("airsbefore_season") )
		      
		      If Episode.HasName("airsbefore_episode") And Episode.Value("airsbefore_episode") <> "" Then
		        xRoot.AppendSimpleChild( "displayepisode", Episode.Value("airsbefore_episode") )
		      Else
		        xRoot.AppendSimpleChild( "displayepisode", "4096" )
		      End If
		      
		      xRoot.AppendSimpleChild( "airsafterseason",   Episode.Value("airsafter_season") )
		      xRoot.AppendSimpleChild( "airsbeforeseason",  Episode.Value("airsbefore_season") )
		      xRoot.AppendSimpleChild( "airsbeforeepisode", Episode.Value("airsbefore_episode") )
		    End If
		    
		    // Runtime
		    If Episode.HasName("Runtime") And Episode.Value("Runtime") <> "" Then xRoot.AppendSimpleChild( "runtime", Episode.Value("Runtime") )
		    
		    // Rating
		    If Episode.HasName("Rating") And Episode.Value("Rating") <> "" Then xRoot.AppendSimpleChild( "rating", Episode.Value("Rating") )
		    If Episode.HasName("Votes")  And Episode.Value("Votes")  <> "" Then xRoot.AppendSimpleChild( "votes", Episode.Value("Votes") )
		    
		    // Watched/Unwatched
		    If Episode.HasName("watched") And Episode.Value("watched") <> "" And Episode.Value("watched") Then
		      xRoot.AppendSimpleChild( "playcount", "1" ) // Because XBMC actually doesn't read the 'watched' tag.
		      xRoot.AppendSimpleChild( "watched", Episode.Value("watched") )
		    End If
		    
		    // Plot
		    If Episode.HasName("plot") And Episode.Value("plot") <> "" Then xRoot.AppendSimpleChild( "plot", Episode.Value("plot") )
		    
		    // Thumb
		    If Episode.HasName("filename") And Episode.Value("filename") <> "" Then xRoot.AppendSimpleChild( "thumb", Episode.Value("filename") )
		    
		    // Credits
		    If Episode.HasName("director") And Episode.Value("director") <> "" Then xRoot.AppendSimpleChild( "director", Episode.Value("director") )
		    If Episode.HasName("credits")  And Episode.Value("credits")  <> "" Then xRoot.AppendSimpleChild( "credits",  Episode.Value("credits")  )
		    If Episode.HasName("guests")   And Episode.Value("guests")   <> "" Then xRoot.AppendSimpleChild( "guests",   Episode.Value("guests")   )
		    
		    // File information
		    FileInfo( xRoot, EpisodeFile )
		    
		    // Episode Bookmark
		    Dim epbookmark as Int64 = Val( xRoot.ToString.MyMid( "<durationinseconds>", "</durationinseconds>" ) )
		    If epbookmark > 0 And MultiEpisodes.Ubound >= 1And Count > 1 Then
		      xRoot.AppendSimpleChild( "epbookmark", Format( epbookmark / ( MultiEpisodes.Ubound + 1 ), "#" ) )
		    End If
		    
		    // Auto manage media
		    If Preferences.Prefs.boolForKey("AutoManageMedia") And Count = 1 And TVAttr.FolderParent <> Nil And EpisodeFile.Exists Then
		      
		      Dim Parent as FolderItem = EpisodeFile.Parent
		      
		      // Get thumbnail/nfo/subtitles/etc
		      Dim MediaFiles() as FolderItem
		      For n as Integer = 1 to Parent.Count
		        Dim Item as FolderItem = Parent.Item(n)
		        If Item <> Nil And Item.Name <> EpisodeFile.Name And Item.Name.Contains( EpisodeFile.NameNoExtension ) And Item.Type <> "video/any" Then
		          MediaFiles.Append Item
		        End If
		      Next
		      
		      // Set appropriate folder to move episode file to.
		      Dim Destination as FolderItem
		      'If NOT Parent.Name.Lowercase.Contains( "season " ) And NOT Parent.Name.Lowercase.Contains("specials") And Preferences.Prefs.integerForKey("BatchRename") = 1 Then
		      If Preferences.Prefs.integerForKey("BatchRename") = 1 Then
		        // Create appropriate season folder
		        Destination = TVAttr.FolderParent.Child( "Season " + Format( SeasonNr, "00" ) )
		        If SeasonNr = 0 Then Destination = TVAttr.FolderParent.Child( "Specials" )
		        If SeasonNr < 0 Then Destination = TVAttr.FolderParent.Child( TVAttr.FolderParent.Name )
		        If Destination <> Nil And NOT Destination.Exists Then Destination.CreateAsFolder
		        
		      Else
		        Destination = Parent
		      End If
		      
		      // Set names
		      Dim NewName as String = EpisodeFile.Name
		      Dim OldName as String = EpisodeFile.NameNoExtension
		      
		      If Preferences.Prefs.integerForKey("BatchRename") = 0 Then
		        // Don't move or rename episode files
		      Else
		        // Set new name for files.
		        NewName = Preferences.Prefs.stringForKey("RenameStringEpisodes")
		        
		        Dim b as Boolean = NewName.Contains( "." )
		        
		        // SeasonNr
		        NewName = NewName.ReplaceAll( "$S", Str( SeasonNr ) )
		        NewName = NewName.ReplaceAll( "$0S", Format( SeasonNr, "00" ) )
		        
		        // EpisodeNr(s)
		        If MultiEpisodes.Ubound > 0 Then
		          Dim Pre, Nrs as String
		          Dim k as Integer
		          
		          Dim Formatting as String = "##0"
		          If NewName.Contains( "$0E" ) Then Formatting = "#00"
		          
		          k = NewName.InStr( 0, "$E" )
		          If k = 0 Then k = NewName.InStr( 0, "$0E" )
		          Pre = NewName.Mid( k -1, 1 )
		          For r as Integer = 0 to EpisodeNrs.Ubound
		            If Pre.Lowercase = "e" or Pre.Lowercase = "x" or Pre = " " Then
		              If r = 0 Then Nrs = Format( EpisodeNrs(r), Formatting ) Else Nrs = Nrs + Pre + Format( EpisodeNrs(r), Formatting )
		            Else
		              If r = 0 Then Nrs = Format( EpisodeNrs(r), Formatting ) Else Nrs = Nrs + Format( EpisodeNrs(r), Formatting )
		            End If
		          Next
		          NewName = NewName.ReplaceAll( "$E", Nrs )
		          NewName = NewName.ReplaceAll( "$0E", Nrs )
		          
		          'k = NewName.InStr( 0, "$0E" )
		          'Pre = NewName.Mid( k -1, 1 )
		          'For r as Integer = 0 to EpisodeNrs.Ubound
		          'Dim tmpEpNr as String
		          'If Len( Str( EpisodeNrs(r) ) ) = 1 Then tmpEpNr = "0" + Str( EpisodeNrs(r) ) Else tmpEpNr = Str( EpisodeNrs(r) )
		          '
		          'If Pre = "e" or Pre = "x" or Pre = " " Then
		          'If r = 0 Then Nrs = tmpEpNr Else Nrs = Nrs + Pre + tmpEpNr
		          'Else
		          'If r = 0 Then Nrs = tmpEpNr Else Nrs = Nrs + tmpEpNr
		          'End If
		          'Next
		          'NewName = NewName.ReplaceAll( "$0E", Nrs )
		          
		        Else
		          // Single episode
		          NewName = NewName.ReplaceAll( "$E", Str( EpisodeNr ) )
		          NewName = NewName.ReplaceAll( "$0E", Format( EpisodeNr, "00" ) )
		        End If // @END EpisodeNr(s)
		        
		        
		        NewName = NewName.ReplaceAll("$#", Episode.Value("Rating") ) // Rating
		        NewName = NewName.ReplaceAll( "$R", Xml.ToString.MyMid("<height>","</height>" + "p" ) ) // Ratio
		        NewName = NewName.ReplaceAll( "$N", TVAttr.Title ) // Series Name
		        If MultiEpisodes.Ubound > 0 Then
		          NewName = NewName.ReplaceAll( "$T", Trim( RegExThis( Episode.Value("EpisodeName"), "\([0-9]\)" ) ) )
		        Else
		          NewName = NewName.ReplaceAll( "$T", Episode.Value("EpisodeName") )
		        End If
		        
		        Dim DateString as String = Xml.ToString.MyMid( "<aired>", "</aired>" )
		        dim d as new date
		        d.Year = Val( DateString.Left(4) )
		        d.Month = Val( DateString.MyMid( "-", "-" ) )
		        d.Day = Val( DateString.Right(2) )
		        
		        NewName = NewName.ReplaceAll( "$Y", Format( d.Year, "0000" ) )
		        NewName = NewName.ReplaceAll( "$M", Format( d.Month, "00" ) ) 'DateString.Mid( "-", "-" ) )
		        NewName = NewName.ReplaceAll( "$D", Format( d.Day, "00" ) ) 'DateString.Right(2) )
		        
		        NewName = NewName.ReplaceAll( "$LD", d.LongDate )
		        NewName = NewName.ReplaceAll( "$SQL", d.SQLDate )
		        
		        // Clean name of illegal characters
		        NewName = ViMMCore.CleanName( NewName )
		        
		        // Dotter file name
		        If b Then NewName = NewName.ReplaceAll( " ", "." )
		        While NewName.Right(1) = "."
		          NewName = NewName.Left( NewName.Len - 1 )
		        Wend
		        While NewName.Left(1) = "."
		          NewName = NewName.Right( NewName.Len - 1 )
		        Wend
		        
		        // Make sure the new name is valid.
		        If Trim( NewName ) <> "" Then
		          NewName = Trim( NewName ) + "." + EpisodeFile.Extension
		        Else
		          NewName = EpisodeFile.Name
		        End If
		        
		        // Move files to destination.
		        If NOT Destination.Child( NewName ).Exists Then
		          EpisodeFile.MoveFileTo( Destination.Child( NewName ) ) // Move position
		          EpisodeFile = Destination.Child( NewName ) // Remember what we did with the EpisodeFile.
		          
		          // Move old files
		          For each item as FolderItem in MediaFiles
		            If item = Nil OR NOT item.Exists Then Continue
		            
		            Dim Name as String   = EpisodeFile.NameNoExtension
		            Dim Ext as String = "." + item.NameExtension
		            
		            Dim NameParts() as String = item.NameNoExtension.Split(".")
		            Dim Lang as String
		            If NameParts.Ubound > -1 Then Lang = Trim( NameParts( NameParts.Ubound ) )
		            
		            If item.Type = "special/subtitle" And item.NameNoExtension <> OldName And Lang <> "" Then
		              // Consider this file as having a language flag
		              If NOT EpisodeFile.Parent.Child( Name + "." + Lang + Ext ).Exists Then item.MoveFileTo( EpisodeFile.Parent.Child( Name + "." + Lang + Ext ) )
		            ElseIf item.Type = "image/any" OR item.Type = "image/png" OR item.Type = "image/jpg" OR item.Type = "image/tbn" Then
		              If NOT EpisodeFile.Parent.Child( Name + YAMJ + XBMC + Ext ).Exists Then item.MoveFileTo( EpisodeFile.Parent.Child( Name + YAMJ + XBMC + Ext ) )
		            Else
		              If NOT EpisodeFile.Parent.Child( Name + Ext ).Exists Then item.MoveFileTo( EpisodeFile.Parent.Child( Name + Ext ) )
		            End If
		            
		          Next // @END MediaFiles
		          
		          // Delete old parent folder if it's not the tv show folder or a season/specials folder.
		          If Parent <> Nil And Parent.Exists Then
		            
		            // Compare parent name
		            If NOT Parent.Name.Lowercase.Contains( "season" ) And NOT Parent.Name.Lowercase.Contains( "specials" ) And _
		              Parent.Name <> TVAttr.Title And Parent.Name <> TVAttr.TitleOriginal And Parent.Name <> TVAttr.TitleSort Then
		              
		              // Compare parent path
		              If Parent.ShellPath <> TVAttr.FolderParent.ShellPath And Parent.Name <> TVAttr.FolderParent.Name Then
		                If NOT Parent.IsNetworkVolume Then Parent.MoveToTrash() // If NOT network volume, then move folder to trash
		              End If
		              
		            End If // @END compare parent name
		          End If // @END parent exists
		          
		        End If
		        
		      End If // @END BatchRename = 1
		      
		    End If
		    
		    // ------
		    
		    // Save Thumbnail
		    If Preferences.Prefs.boolForKey("AutoDownloadEpisodeThumb") And Episode.Value("filename") <> "" Then
		      Dim sckt as New TVDBSckt
		      
		      dim ext as String = ".jpg"
		      if Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" then ext = ".tbn"
		      URL2Picture( Episode.Value("filename"), EpisodeFile.Parent, EpisodeFile.NameNoExtension + YAMJ + XBMC + ext )
		    End If
		    
		    // Set Content
		    xRoot.Indent(0)
		    If xContent = "" Then
		      xContent = Xml.ToString.ReplaceAll( "encoding=""UTF-8""?>", "encoding=""UTF-8""?>" + Chr(13) )
		    Else
		      xContent = xContent + chr(13) + chr(13) + xRoot.ToString
		    End If
		    
		  Next
		  
		  // Save NFO file
		  'Xml.SaveXml( EpisodeFile.Parent.Child( EpisodeFile.NameNoExtension + ".nfo" ) )
		  WriteTextFile( xContent, EpisodeFile.Parent.Child( EpisodeFile.NameNoExtension + ".nfo" ) )
		  
		  Return EpisodeFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadImages(TVParent as FolderItem)
		  If App.DebugMode Then Return
		  
		  TVAttr.ART_Poster = Nil
		  TVAttr.ART_Fanart = Nil
		  TVAttr.ART_Banner = Nil
		  
		  TVAttr.ART_Logo         = Nil
		  TVAttr.ART_TVThumb      = Nil
		  TVAttr.ART_ClearArt     = Nil
		  TVAttr.ART_CharacterArt = Nil
		  
		  TVAttr.ART_Studio     = Nil
		  TVAttr.ART_MPAARating = Nil
		  
		  Dim ArtFile as FolderItem
		  Dim ID as String = TVAttr.ID_IMDb
		  If ID = "" Then ID = TVAttr.ID_TVDB
		  Dim CachedPoster as String = ID + ".television.poster.jpg"
		  Dim CachedFanart as String = ID + ".television.fanart.jpg"
		  
		  
		  // ## Load poster
		  TVAttr.ART_Poster = CacheImageLoad( CachedPoster )
		  If TVAttr.ART_Poster = Nil Then
		    ArtFile = FindImagePoster( TVParent )
		    If ArtFile <> Nil And ArtFile.Exists Then
		      CacheImageSet( Picture.Open( ArtFile ), CachedPoster )
		      TVAttr.ART_Poster = CacheImageLoad( CachedPoster )
		      If TVAttr.ART_Poster = Nil Then TVAttr.ART_Poster = Picture.Open( ArtFile ) // Last resort
		    End If
		  End If
		  ArtFile = Nil
		  
		  
		  // ## Load Fanart
		  TVAttr.ART_Fanart = CacheImageLoad( CachedFanart )
		  If TVAttr.ART_Fanart = Nil Then
		    ArtFile = FindImageFanart( TVParent )
		    If ArtFile <> Nil And ArtFile.Exists Then
		      CacheImageSet( Picture.Open( ArtFile ), CachedFanart )
		      TVAttr.ART_Fanart = CacheImageLoad( CachedFanart )
		      If TVAttr.ART_Fanart = Nil Then TVAttr.ART_Fanart = Picture.Open( ArtFile ) // Last resort
		    End If
		  End If
		  ArtFile = Nil
		  
		  
		  If TVParent.Child("logo.png").Exists      Then TVAttr.ART_Logo     = Picture.Open( TVParent.Child("logo.png") )     // ## Load Logo
		  If TVParent.Child("clearart.png").Exists  Then TVAttr.ART_ClearArt = Picture.Open( TVParent.Child("clearart.png") ) // ## Load ClearArt
		  If TVParent.Child("character.png").Exists Then TVAttr.ART_CharacterArt = Picture.Open( TVParent.Child("character.png") )
		  
		  ArtFile = FindImageBanner( TVParent )
		  If ArtFile <> Nil And ArtFile.Exists Then TVAttr.ART_Banner = Picture.Open( ArtFile ) // ## Banner
		  
		  // ----
		  
		  // ## MPAA
		  TVAttr.ART_MPAARating = Nil
		  For i as Integer = 0 to TVAttr.RatingCertification.Ubound
		    If FlagCountry( TVAttr.RatingCertification(i).NthField(":", 1) )  = Preferences.Prefs.stringForKey("DBLanguage") Then
		      TVAttr.ART_MPAARating = MPAA2Logo( TVAttr.RatingCertification(i).NthField(":", 2) )
		      'If TVAttr.ART_MPAARating <> Nil Then Exit
		    End If
		  Next
		  
		  If TVAttr.ART_MPAARating = Nil Then
		    Dim sx1 as Integer = TVAttr.RatingMPAA.InStr( 0, " for " )
		    Dim Rating as String
		    If sx1 = 0 Then Rating = TVAttr.RatingMPAA Else Rating = Trim( TVAttr.RatingMPAA.Left( sx1 ) )
		    If Rating <> "" Then TVAttr.ART_MPAARating = MPAA2Logo( Rating )
		  End If
		  
		  // ## Studio
		  Dim StudioArt as FolderItem = GetFolderItem( "Studios" )
		  If StudioArt = Nil OR NOT StudioArt.Exists Then StudioArt = Preferences.fAppSupport.Child("Studios")
		  StudioArt = StudioArt.Child( TVAttr.TVNetwork + ".png" )
		  
		  If StudioArt <> Nil And StudioArt.Exists Then TVAttr.ART_Studio = Picture.Open( StudioArt )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NFORead(NFOParent as FolderItem)
		  Dim Xml as New XmlDocument
		  Dim xRoot, xNode, xItem as XmlNode
		  
		  If NFOParent = Nil OR NOT NFOParent.Exists OR NOT NFOParent.IsReadable Then Return
		  Dim NFOFile as FolderItem = FindNFOFile( NFOParent )
		  
		  ClearProperties
		  Xml.PreserveWhitespace = False
		  
		  // Is there an NFO file?
		  
		  If NFOFile = Nil OR NOT NFOFile.Exists Then Return
		  If NOT NFOFile.IsReadable Then 'OR NOT NFOFile.IsWriteable Then
		    MsgBox "I don't have permission to read the .nfo file"
		    Return
		  End If
		  
		  Dim Content as String = ReadTextFile( NFOFile )
		  'Dim TextIn as TextInputStream = TextInputStream.Open( NFOFile )
		  'Content = Trim( TextIn.ReadAll )
		  'TextIn.Close
		  
		  Content = Trim( RemoveLinks( Content ) )
		  If Content.Left(10).InStr( 0, "<?xml" ) > 0 Then
		    Xml.LoadXml( Content )
		  ElseIf Content.Left(5) = "http:" And Content.InStr( 0, "imdb.com" ) > 0 Then
		    Dim s() as String = Content.Split("/")
		    For i as Integer = 0 to s.Ubound
		      If s(i).Left(2) = "tt" Then TVAttr.ID_IMDb = s(i)
		    Next
		    Return
		  Else
		    Return
		  End If
		  
		  For i as Integer = 0 to Xml.ChildCount - 1
		    If Xml.Child(i).Name = "tvshow" Then xRoot = Xml.Child(i)
		  Next
		  If xRoot = Nil Then Return
		  
		  For i as Integer = 0 to xRoot.ChildCount - 1
		    xNode = xRoot.Child(i)
		    
		    If xNode.FirstChild = Nil Then Continue
		    
		    Select Case xNode.Name
		      
		      // ID
		    Case "id"
		      If xNode.FirstChild.Value.Left(2) = "tt" Then
		        TVAttr.ID_IMDb = xNode.FirstChild.Value
		      Else
		        If TVAttr.ID_TVDB = "" Then TVAttr.ID_TVDB = xNode.FirstChild.Value
		      End If
		      
		      
		      If xNode.GetAttribute("movieDB").Lowercase = "tvdb" then
		        TVAttr.ID_TVDB   = xNode.FirstChild.Value
		      ElseIf xNode.GetAttribute("movieDB").Lowercase = "imdb" then
		        TVAttr.ID_IMDb   = xNode.FirstChild.Value
		      ElseIf xNode.GetAttribute("movieDB").Lowercase = "tvrage" Then
		        TVAttr.ID_TVRage = xNode.FirstChild.Value
		        
		      ElseIf xNode.GetAttribute("moviedb") = "TVDB" then
		        TVAttr.ID_TVDB   = xNode.FirstChild.Value
		      ElseIf xNode.GetAttribute("moviedb") = "IMDb" then
		        TVAttr.ID_IMDb   = xNode.FirstChild.Value
		      ElseIf xNode.GetAttribute("moviedb") = "TVRage" Then
		        TVAttr.ID_TVRage = xNode.FirstChild.Value
		        
		      ElseIf xNode.GetAttribute("db") = "TVDB" Then
		        TVAttr.ID_TVDB = xNode.FirstChild.Value
		      ElseIf xNode.GetAttribute("db") = "IMDb" Then
		        TVAttr.ID_IMDb = xNode.FirstChild.Value
		      ElseIf xNode.GetAttribute("db") = "TVRage" Then
		        TVAttr.ID_TVRage = xNode.FirstChild.Value
		      End If
		      
		    case "boxeeTVDB"
		      TVAttr.ID_TVDB = xNode.FirstChild.Value
		    case "boxeeIMDb"
		      TVAttr.ID_IMDb = xNode.FirstChild.Value
		    case "boxeeTVRage"
		      TVAttr.ID_TVRage = xNode.FirstChild.Value
		      
		      // Title
		    case "title"
		      TVAttr.Title = xNode.FirstChild.Value
		    case "sorttitle"
		      TVAttr.TitleSort = xNode.FirstChild.Value
		    case "originaltitle"
		      TVAttr.TitleOriginal = xNode.FirstChild.Value
		      
		    case "tagline"
		      TVAttr.DescriptionTagline = xNode.FirstChild.Value
		    case "outline"
		      TVAttr.DescriptionOutline = xNode.FirstChild.Value
		    case "plot"
		      TVAttr.DescriptionPlot    = xNode.FirstChild.Value
		      
		    case "taglines"
		      For n as Integer = 0 to xNode.ChildCount - 1
		        xItem = xNode.Child(n)
		        If xItem.FirstChild <> Nil Then TVAttr.DescriptionTaglines.Append xItem.FirstChild.Value
		      Next
		      
		    case "status"
		      TVAttr.Status = xNode.FirstChild.Value
		      
		      // Rating
		    case "rating"
		      TVAttr.Rating = Val( xNode.FirstChild.Value )
		    case "votes"
		      TVAttr.RatingVotes = Val( xNode.FirstChild.Value )
		    case "mpaa"
		      TVAttr.RatingMPAA = xNode.FirstChild.Value
		      
		      // Dates
		    case "year"
		      TVAttr.DateYear = Val( xNode.FirstChild.Value )
		    case "premiered"
		      TVAttr.DatePremiered = xNode.FirstChild.Value
		    case "ended"
		      TVAttr.DateEnded  = xNode.FirstChild.Value
		      
		      // Last/Next Aired
		    case "lastaired"
		      For n as Integer = 0 to xNode.ChildCount - 1
		        xItem = xNode.Child(n)
		        If xItem.Name = "episode" And xItem.FirstChild <> Nil Then TVAttr.LastAired_Episode = xItem.FirstChild.Value
		        If xItem.Name = "date"    And xItem.FirstChild <> Nil Then TVAttr.LastAired_Date    = xItem.FirstChild.Value
		      Next
		      
		    case "nextaired"
		      For n as Integer = 0 to xNode.ChildCount - 1
		        xItem = xNode.Child(n)
		        If xItem.Name = "episode" And xItem.FirstChild <> Nil Then TVAttr.NextAired_Episode = xItem.FirstChild.Value
		        If xItem.Name = "date"    And xItem.FirstChild <> Nil Then TVAttr.NextAired_Date    = xItem.FirstChild.Value
		      Next
		      
		      // Other
		    case "classification"
		      TVAttr.Classification = xNode.FirstChild.Value
		    case "certification"
		      TVAttr.RatingCertification.Append xNode.FirstChild.Value
		      
		    case "country"
		      TVAttr.Countries.Append xNode.FirstChild.Value
		    case "language"
		      TVAttr.Languages.Append xNode.FirstChild.Value
		      
		    case "genre"
		      TVAttr.Genres.Append xNode.FirstChild.Value
		    case "tag"
		      TVAttr.Tags.Append xNode.FirstChild.Value
		    case "studio"
		      TVAttr.TVNetwork = xNode.FirstChild.Value
		    case "studios"
		      For n as Integer = 0 to xNode.ChildCount - 1
		        xItem = xNode.Child(n)
		        If xItem.FirstChild <> Nil Then TVAttr.Studios.Append xItem.FirstChild.Value
		      Next
		      
		    case "locked"
		      TVAttr.Locked = ( xNode.FirstChild.Value = "True" )
		    case "status"
		      TVAttr.Status = xNode.FirstChild.Value
		    case "runtime"
		      TVAttr.DurationRuntime = Val( xNode.FirstChild.Value )
		      
		      // Credits
		    case "director"
		      TVAttr.CreditDirector = xNode.FirstChild.Value
		      
		    case "credits"
		      If xNode.FirstChild.FirstChild <> Nil Then
		        // Ember support.
		        TVAttr.CreditWriter = xNode.FirstChild.FirstChild.Value
		      Else
		        TVAttr.CreditWriter = xNode.FirstChild.Value
		      End If
		      
		    case "sound"
		      TVAttr.CreditMusic = xNode.FirstChild.Value
		      
		      // Actors Starring
		    case "starring"
		      For n as Integer = 0 to xNode.ChildCount - 1
		        xItem = xNode.Child(n)
		        TVAttr.ActorStars.Append xItem.FirstChild.Value
		      Next
		      
		      // Actors
		    case "actor"
		      // Actor ID
		      If xNode.AttributeCount > -1 Then Actor_ID.Append xNode.GetAttribute("id") Else Actor_ID.Append ""
		      
		      For n as Integer = 0 to xNode.ChildCount -1
		        xItem = xNode.Child(n)
		        
		        If xNode.ChildCount > 2 Then
		          Select case xItem.Name
		          Case "name"
		            If xItem.FirstChild <> Nil Then TVAttr.Actor_Name.Append xItem.FirstChild.Value Else TVAttr.Actor_Name.Append ""
		          case "role"
		            If xItem.FirstChild <> Nil Then TVAttr.Actor_Role.Append xItem.FirstChild.Value Else TVAttr.Actor_Role.Append ""
		          case "thumb"
		            If xItem.FirstChild <> Nil Then TVAttr.Actor_ThumbURL.Append xItem.FirstChild.Value Else TVAttr.Actor_ThumbURL.Append ""
		            
		          End Select
		          
		          
		        ElseIf xNode.ChildCount = 2 Then
		          Select case xItem.Name
		          Case "name"
		            If xItem.FirstChild <> Nil Then TVAttr.Actor_Name.Append xItem.FirstChild.Value Else TVAttr.Actor_Name.Append ""
		          case "role"
		            If xItem.FirstChild <> Nil Then TVAttr.Actor_Role.Append xItem.FirstChild.Value Else TVAttr.Actor_Role.Append ""
		            
		          End Select
		          
		          TVAttr.Actor_ThumbURL.Append ""
		          
		        ElseIf xNode.ChildCount = 1 Then
		          Select case xItem.Name
		          Case "name"
		            If xItem.FirstChild <> Nil Then TVAttr.Actor_Name.Append xItem.FirstChild.Value Else TVAttr.Actor_Name.Append ""
		          End Select
		          
		          TVAttr.Actor_Role.Append ""
		          TVAttr.Actor_ThumbURL.Append ""
		          
		        End If
		        
		      Next
		      
		    case "thumb"
		      If xNode.GetAttribute("type") = "season" and xNode.GetAttribute("season") <> "-1" Then
		        TVAttr.ART_SeasonURLs.Append     xNode.FirstChild.Value
		        TVAttr.ART_SeasonNumbers.Append  xNode.GetAttribute("season")
		      ElseIf xNode.FirstChild.Value.InStr(0, "graphical") > 0 Or xNode.FirstChild.Value.InStr(0, "text") > 0 Or xNode.FirstChild.Value.InStr(0, "blank") > 0 Then
		        TVAttr.Art_BannerURLs.Append     xNode.FirstChild.Value
		      ElseIf xNode.FirstChild.Value.InStr(0, "poster") > 0 And xNode.AttributeCount = 0 And xNode.FirstChild.Value.Left(4) = "http" Then
		        TVAttr.ART_PosterURLs.Append     xNode.FirstChild.Value
		      End If
		      
		    case "fanart"
		      For n as Integer = 0 to xNode.ChildCount - 1
		        xItem = xNode.Child(n)
		        
		        TVAttr.ART_FanartURLs.Append        xItem.FirstChild.Value
		        TVAttr.ART_FanartThumbURLs.Append   xItem.GetAttribute("preview")
		        TVAttr.ART_FanartDimensions.Append  xItem.GetAttribute("dim")
		      Next
		      
		      // Recommendations
		    case "recommendations"
		      For n as Integer = 0 to xNode.ChildCount - 1
		        xItem = xNode.Child(n)
		        If xItem.FirstChild <> Nil   Then TVAttr.RecShows.Append    xItem.FirstChild.Value
		        If xItem.AttributeCount > -1 Then TVAttr.RecShow_IDs.Append xItem.GetAttribute("id")
		      Next
		      
		      // Themesongs
		    Case "themesongs"
		      For n as Integer = 0 to xNode.ChildCount -1
		        If xNode.Child(n).FirstChild <> Nil Then TVAttr.ThemeSongs.Append xNode.Child(n).FirstChild.Value
		      Next
		      
		    End Select
		    
		  Next
		  
		  Exception err as NilObjectException
		    MessageBox "File not found or invalid XML item found." + chr(13) + chr(13) + "Please let the author know about this as soon as possible."
		    Return
		    
		  Exception err as OutOfBoundsException
		    MessageBox "Something went wrong while reading a movie's NFO file..." + chr(13) + chr(13) + "Please let the author know about this as soon as possible."
		    Return
		    
		  Exception err as XmlException
		    MessageBox "Invalid or not well-formed XML NFO file found for movie" + chr(13) + chr(13) + "You should consider removing the NFO file for said movie item before continuing."
		    Return
		    
		  Exception err as IOException
		    MessageBox "IOException error Number: " + str(err.ErrorNumber) + chr(13) + chr(13) + _
		    err.Message + chr(13) + _
		    "Something might have gone wrong while reading: " + MovieAttr.FolderParent.Name + chr(13) + _
		    "Please contact the author."
		    Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NFOWrite(NFOParent as FolderItem)
		  'If NFOParent = Nil OR NOT NFOParent.Exists Then Return
		  
		  Dim Xml as New XmlDocument
		  Dim xRoot, xNode, xItem as XmlNode
		  Xml.PreserveWhitespace = True
		  
		  'xRoot = Xml.AppendNewChild( "tvshow" )
		  xRoot = Xml.AppendChild( Xml.CreateElement( "tvshow" ) )
		  'xRoot.SetAttribute( "version", App.VersionCurrent )
		  
		  Dim Info as String = "NFOWrite( " + NFOParent.Name + " ) - "
		  
		  App.ErrorMessage = Info + "Title: " + TVAttr.Title
		  // ## Title
		  If Trim( TVAttr.Title )         <> "" Then xRoot.AppendSimpleChild( "title",         Trim( TVAttr.Title ) )
		  If Trim( TVAttr.TitleSort )     <> "" Then xRoot.AppendSimpleChild( "sorttitle",     Trim( TVAttr.TitleSort ) )
		  If Trim( TVAttr.TitleOriginal ) <> "" Then xRoot.AppendSimpleChild( "originaltitle", Trim( TVAttr.TitleOriginal ) )
		  
		  // ## ID
		  App.ErrorMessage = Info + "ID: " + TVAttr.ID_TVDB
		  If Preferences.Prefs.stringForKey("MediaPlayer") <> "Boxee" Then
		    
		    If TVAttr.ID_IMDB <> "" Then
		      xNode = xRoot.AppendNewChild("id")
		      xNode.SetAttribute("moviedb", "IMDb")
		      xNode.SetValue( TVAttr.ID_IMDb )
		    End If
		    
		    If TVAttr.ID_TVDB <> "" and TVAttr.ID_TVDB.Left(2) <> "tt" Then
		      xNode = xRoot.AppendNewChild("id")
		      xNode.SetAttribute("moviedb", "TVDB")
		      xNode.SetValue( TVAttr.ID_TVDB )
		    End If
		    
		    If TVAttr.ID_TVRage <> "" Then
		      xNode = xRoot.AppendNewChild("id")
		      xNode.SetAttribute("moviedb", "TVRage")
		      xNode.SetValue( TVAttr.ID_TVRage )
		    End If
		    
		  End If
		  
		  App.ErrorMessage = Info + "Dates: " + TVAttr.DatePremiered
		  // ## Dates
		  If TVAttr.DateYear       > 0  Then xRoot.AppendSimpleChild( "year", Str( TVAttr.DateYear ) )
		  If TVAttr.DatePremiered <> "" Then xRoot.AppendSimpleChild( "premiered", TVAttr.DatePremiered )
		  If TVAttr.DateEnded     <> "" Then xRoot.AppendSimpleChild( "ended", TVAttr.DateEnded )
		  
		  App.ErrorMessage = Info + "Rating: " + Str( TVAttr.Rating )
		  // ## Rating
		  If TVAttr.Rating      > 0  Then xRoot.AppendSimpleChild( "rating", Str( TVAttr.Rating ) )
		  If TVAttr.RatingVotes > 0  Then xRoot.AppendSimpleChild( "votes", Str( TVAttr.RatingVotes ) )
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then
		    If TVAttr.RatingMPAA <> "" Then xRoot.AppendSimpleChild( "mpaa", Trim( TVAttr.RatingMPAA.ReplaceAll("Rating","") ) )
		  Else
		    If TVAttr.RatingMPAA <> "" Then xRoot.AppendSimpleChild( "mpaa", Trim( TVAttr.RatingMPAA ) )
		  End If
		  
		  App.ErrorMessage = Info + "Tagline: " + TVAttr.DescriptionTagline
		  // ## Tagline
		  If Trim( TVAttr.DescriptionTagline ) <> "" Then xRoot.AppendSimpleChild( "tagline", Trim( TVAttr.DescriptionTagline ) )
		  If TVAttr.DescriptionTaglines.Ubound > -1 Then
		    xNode = xRoot.AppendNewChild("taglines")
		    For i as Integer = 0 to TVAttr.DescriptionTaglines.Ubound
		      xNode.AppendSimpleChild "tagline", TVAttr.DescriptionTaglines(i)
		    Next
		  End If
		  
		  App.ErrorMessage = Info + "Outline & Plot"
		  // ## Outline & Plot
		  If Trim( TVAttr.DescriptionOutline ) <> "" Then xRoot.AppendSimpleChild( "outline", Trim( TVAttr.DescriptionOutline ) )
		  If Trim( TVAttr.DescriptionPlot    ) <> "" Then xRoot.AppendSimpleChild( "plot",    Trim( TVAttr.DescriptionPlot    ) )
		  
		  // ## Other
		  
		  App.ErrorMessage = Info + "Classification"
		  // Classification
		  If Trim( TVAttr.Classification ) <> "" Then xRoot.AppendSimpleChild( "classification", Trim( TVAttr.Classification ) )
		  
		  App.ErrorMessage = Info + "Certification"
		  // Certification
		  For i as Integer = 0 to TVAttr.RatingCertification.Ubound
		    If TVAttr.RatingCertification(i) <> "" Then xRoot.AppendSimpleChild( "certification", Trim( TVAttr.RatingCertification(i) ) )
		  Next
		  
		  App.ErrorMessage = Info + "Countries"
		  // Countries
		  TVAttr.Countries = RemoveDuplicatesFromArray( TVAttr.Countries )
		  For i as Integer = 0 to TVAttr.Countries.Ubound
		    If Trim( TVAttr.Countries(i) ) <> "" Then xRoot.AppendSimpleChild( "country", Trim( TVAttr.Countries(i) ) )
		  Next
		  
		  App.ErrorMessage = Info + "Languages"
		  // Languages
		  For i as Integer = 0 to TVAttr.Languages.Ubound
		    If Trim( TVAttr.Languages(i) ) <> "" Then xRoot.AppendSimpleChild( "language", Trim( TVAttr.Languages(i) ) )
		  Next
		  
		  App.ErrorMessage = Info + "Locked"
		  // Locked
		  If TVAttr.Locked Then xRoot.AppendSimpleChild( "locked", Str( TVAttr.Locked ) )
		  
		  App.ErrorMessage = Info + "Status"
		  // Status
		  If Trim( TVAttr.Status ) <> "" Then xRoot.AppendSimpleChild( "status", Trim( TVAttr.Status ) )
		  
		  App.ErrorMessage = Info + "Runtime"
		  // Runtime
		  If TVAttr.DurationRuntime > 0 Then xRoot.AppendSimpleChild( "runtime", Str( TVAttr.DurationRuntime ) )
		  
		  App.ErrorMessage = Info + "Network & Studio"
		  // Network & Studio
		  If Trim( TVAttr.TVNetwork ) <> "" Then xRoot.AppendSimpleChild( "studio", Trim( TVAttr.TVNetwork ) )
		  If TVAttr.Studios.Ubound > -1 Then
		    xNode = xRoot.AppendNewChild("studios")
		    For i as Integer = 0 to TVAttr.Studios.Ubound
		      xNode.AppendSimpleChild( "studio", Trim( TVAttr.Studios(i) ) )
		    Next
		  End If
		  
		  App.ErrorMessage = Info + "Genres"
		  // Genres
		  For i as Integer = 0 to TVAttr.Genres.Ubound
		    If Preferences.Prefs.stringForKey( "MediaPlayer" ) = "Boxee" Then
		      If Trim( TVAttr.Genres(i) ) <> "" Then
		        
		        dim genre as string = TVAttr.Genres(i).Uppercase
		        if genre = "SCIENCE-FICTION" or genre = "SCIENCE FICTION" or genre = "SciFy" or genre = "Sifi" then
		          genre = "SCI_FI"
		        end if
		        genre = genre.ReplaceAll( " ", "_" )
		        
		        xRoot.AppendSimpleChild( "genre", Trim( genre ) )
		      End If
		    Else
		      If Trim( TVAttr.Genres(i) ) <> "" Then xRoot.AppendSimpleChild( "genre", Trim( TVAttr.Genres(i) ) )
		    End If
		  Next
		  
		  App.ErrorMessage = Info + "Tags"
		  // Tags
		  For i as Integer = 0 to TVAttr.Tags.Ubound
		    If Trim( TVAttr.Tags(i) ) <> "" Then xRoot.AppendSimpleChild( "tag", Trim( TVAttr.Tags(i) ) )
		  Next
		  
		  App.ErrorMessage = Info + "Episode Guide"
		  // ## Episode Guide
		  If TVAttr.ID_TVDB <> "" Then
		    xNode = xRoot.AppendNewChild( "episodeguide" )
		    
		    xItem = xNode.AppendNewChild( "url" )
		    xItem.SetAttribute( "cache", TVAttr.ID_TVDB + ".xml" )
		    xItem.SetValue( TVCore.URL( "EpisodeGuide", TVAttr.ID_TVDB ) )
		  End If
		  
		  App.ErrorMessage = Info + "Last Aired"
		  // ## Last Aired
		  If TVAttr.LastAired_Episode <> "" OR TVAttr.LastAired_Date <> "" Then
		    xNode = xRoot.AppendNewChild( "lastaired" )
		    If LastAired_Date    <> "" Then xNode.AppendSimpleChild( "date",    Trim( TVAttr.LastAired_Date ) )
		    If LastAired_Episode <> "" Then xNode.AppendSimpleChild( "episode", Trim( TVAttr.LastAired_Episode ) )
		  End If
		  
		  App.ErrorMessage = Info + "Next Aired"
		  // ## Next Aired
		  If NextAired_Episode <> "" OR NextAired_Date <> "" Then
		    xNode = xRoot.AppendNewChild("nextaired")
		    If TVAttr.NextAired_Date <> ""    Then xNode.AppendSimpleChild( "date",    Trim( TVAttr.NextAired_Date ) )
		    If TVAttr.NextAired_Episode <> "" Then xNode.AppendSimpleChild( "episode", Trim( TVAttr.NextAired_Episode ) )
		  End If
		  
		  App.ErrorMessage = Info + "Credits"
		  // ## Credits
		  If Trim( TVAttr.CreditDirector ) <> "" Then xRoot.AppendSimpleChild( "director", Trim( TVAttr.CreditDirector ) )
		  If Trim( TVAttr.CreditWriter   ) <> "" Then xRoot.AppendSimpleChild( "credits",  Trim( TVAttr.CreditWriter   ) )
		  If Trim( TVAttr.CreditMusic    ) <> "" Then xRoot.AppendSimpleChild( "sound",    Trim( TVAttr.CreditMusic    ) )
		  
		  App.ErrorMessage = Info + "Starring"
		  // ## Starring
		  If TVAttr.ActorStars.Ubound > -1 Then
		    xNode = xRoot.AppendNewChild("starring")
		    For i as Integer = 0 to TVAttr.ActorStars.Ubound
		      xNode.AppendSimpleChild( "star", Trim( TVAttr.ActorStars(i) ) )
		    Next
		  End If
		  
		  App.ErrorMessage = Info + "Actors"
		  // ## Actors
		  For i as Integer = 0 To Actor_Name.Ubound
		    xNode = xRoot.AppendNewChild( "actor" )
		    xNode.SetAttribute( "id", TVAttr.Actor_ID(i) )
		    
		    if TVAttr.Actor_Name.Ubound >= i then
		      xNode.AppendSimpleChild( "name",  TVAttr.Actor_Name(i) )
		    end if
		    
		    if TVAttr.Actor_Role.Ubound >= i then
		      xNode.AppendSimpleChild( "role",  TVAttr.Actor_Role(i) )
		    end if
		    
		    if TVAttr.Actor_ThumbURL.Ubound >= i then
		      xNode.AppendSimpleChild( "thumb", TVAttr.Actor_ThumbURL(i) )
		    end if
		  Next
		  
		  // ## Thumbs
		  
		  App.ErrorMessage = Info + "Default Thumb"
		  // Default Thumb
		  Dim DefaultThumb as FolderItem
		  If Preferences.Prefs.stringForKey("DefaultThumbTV") = Loc.kPoster Then
		    DefaultThumb = FindImagePoster( NFOParent )
		  ElseIf Preferences.Prefs.stringForKey("DefaultThumbTV") = Loc.kBanner Then
		    DefaultThumb = FindImageBanner( NFOParent )
		  End If
		  
		  If DefaultThumb <> Nil And DefaultThumb.Exists Then
		    If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then
		      xRoot.AppendSimpleChild( "thumb", DefaultThumb.ShellPath.ReplaceAll("\","") )
		    Else
		      xRoot.AppendSimpleChild( "thumb", DefaultThumb.Name )
		    End If
		  End If
		  
		  App.ErrorMessage = Info + "Posters"
		  // Posters
		  Try
		    If NFOParent <> Nil And NFOParent.Child("poster.jpg") <> Nil And ( NFOParent.Child("poster.jpg").Exists OR NFOParent.Child("Poster.jpg").Exists ) Then
		      If xRoot <> Nil Then xRoot.AppendSimpleChild( "thumb", "poster.jpg" )
		    End If
		  Catch err as NilObjectException
		    
		  End Try
		  
		  App.ErrorMessage = Info + "Posters 2"
		  If TVAttr.ART_PosterURLs <> Nil Then
		    For i as Integer = 0 to TVAttr.ART_PosterURLs.Ubound
		      If Trim( TVAttr.ART_PosterURLs(i) ) <> "" Then xRoot.AppendSimpleChild( "thumb", Trim( TVAttr.ART_PosterURLs(i) ))
		    Next
		  End If
		  
		  App.ErrorMessage = Info + "Banners"
		  // Banners
		  If TVAttr.ART_BannerURLs <> Nil Then
		    For i as Integer = 0 to TVAttr.ART_BannerURLs.Ubound
		      If Trim( TVAttr.ART_BannerURLs(i) ) <> "" Then xRoot.AppendSimpleChild( "thumb", Trim( TVAttr.ART_BannerURLs(i) ))
		    Next
		  End If
		  
		  App.ErrorMessage = Info + "Season -1 Posters"
		  // Season -1 Posters
		  For i as Integer = 0 to TVAttr.ART_PosterURLs.Ubound
		    If Trim( TVAttr.ART_PosterURLs(i) ) <> "" Then
		      xNode = xRoot.AppendNewChild( "thumb" )
		      xNode.SetValue( Trim( TVAttr.ART_PosterURLs(i) ) )
		      
		      xNode.SetAttribute( "type", "season" )
		      xNode.SetAttribute( "season", "-1"   )
		    End If
		  Next
		  
		  App.ErrorMessage = Info + "Season Art"
		  // Season Art
		  For i as Integer = 0 to TVAttr.ART_SeasonURLs.Ubound
		    If Trim( TVAttr.ART_SeasonURLs(i) ) = "" Then Continue
		    
		    xNode = xRoot.AppendNewChild( "thumb" )
		    xNode.SetValue( TVAttr.ART_SeasonURLs(i) )
		    
		    xNode.SetAttribute( "type", "season" )
		    xNode.SetAttribute( "season", TVAttr.ART_SeasonNumbers(i) )
		  Next
		  
		  App.ErrorMessage = Info + "Fanart"
		  // ## Fanart
		  If TVAttr.ART_FanartURLs.Ubound > -1 Then
		    xNode = xRoot.AppendNewChild( "fanart" )
		    'xNode.SetAttribute( "url", TVCore.GraphicsPath )
		    
		    For i as Integer = 0 to TVAttr.ART_FanartURLs.Ubound
		      If Trim( TVAttr.ART_FanartURLs(i) ) = "" Then Continue
		      
		      xItem = xNode.AppendNewChild( "thumb" )
		      xItem.SetValue TVAttr.ART_FanartURLs(i)
		      
		      xItem.SetAttribute( "dim",     TVAttr.ART_FanartDimensions(i) )
		      xItem.SetAttribute( "preview", TVAttr.ART_FanartThumbURLs(i) )
		    Next
		  End If
		  
		  App.ErrorMessage = Info + "Recommendations"
		  // Recommendations
		  If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then
		    If TVAttr.RecShows.Ubound > -1 Then
		      xNode = xRoot.AppendNewChild("recommendations")
		      For i as Integer = 0 to TVAttr.RecShows.Ubound
		        xItem = xNode.AppendNewChild("show")
		        xItem.SetValue( Trim( TVAttr.RecShows(i) ) )
		        xItem.SetAttribute( "id", TVAttr.RecShow_IDs(i) )
		      Next
		    End If
		  End If
		  
		  
		  App.ErrorMessage = Info + "Themesongs"
		  // Themesongs
		  If TVAttr.ThemeSongs.Ubound > -1 Then
		    xNode = xRoot.AppendNewChild("themesongs")
		    For i as Integer = 0 to TVAttr.ThemeSongs.Ubound
		      xNode.AppendSimpleChild( "theme", TVAttr.ThemeSongs(i) )
		    NEXT
		  End If
		  
		  App.ErrorMessage = Info + "Boxee ID"
		  // Boxee ID
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then
		    
		    If TVAttr.ID_IMDB <> "" Then
		      xNode = xRoot.AppendNewChild("boxeeIMDb")
		      xNode.SetValue( TVAttr.ID_IMDb )
		    End If
		    
		    If TVAttr.ID_TVDB <> "" Then
		      xNode = xRoot.AppendNewChild("boxeeTVDB")
		      xNode.SetValue( TVAttr.ID_TVDB )
		    End If
		    
		    If TVAttr.ID_TVRage <> "" Then
		      xNode = xRoot.AppendNewChild("boxeeTVRage")
		      xNode.SetValue( TVAttr.ID_TVRage )
		    End If
		    
		  End If
		  
		  App.ErrorMessage = Info + "Save XML"
		  // ## Save XML
		  xRoot.Indent(0)
		  'Xml.SaveXml( NFOParent.Child( Preferences.Prefs.stringForKey("FileNameNFOTV").ReplaceAll("<show>", TVAttr.Title ) ) )
		  Dim FileName as String = Preferences.Prefs.stringForKey("FileNameNFOTV").ReplaceAll("<show>", TVAttr.Title )
		  If Trim( FileName ) = "" Then FileName = "tvshow.nfo"
		  'If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then FileName = TVAttr.Title + ".nfo"
		  
		  App.ErrorMessage = "Writing NFO"
		  If Trim( FileName ) <> "" Then
		    If NFOParent.IsReadable And NFOParent.IsWriteable Then
		      WriteTextFile( Xml.ToString.ReplaceAll( "encoding=""UTF-8""?>", "encoding=""UTF-8""?>" + Chr(13) ), NFOParent.Child( CleanName( FileName ) ) )
		    Else
		      MessageBox "I don't have permission to write the .nfo file to " + NFOParent.Name
		    End If
		  End If
		  
		  App.ErrorMessage = ""
		  
		  
		  Exception err as NilObjectException
		    
		    If Xml = Nil Then
		      App.ErrorMessage = App.ErrorMessage + chr(13) + "Write TV NFO: XML = Nil"
		    ElseIf NFOParent = Nil Then
		      App.ErrorMessage = App.ErrorMessage + chr(13) + "Write TV NFO: NFOParent = Nil"
		    ElseIf NFOParent.Child( FileName ) = Nil Then
		      App.ErrorMessage = App.ErrorMessage + chr(13) + "Write TV NFO: " + NFOParent.ShellPath.ReplaceAll("\","") + ".Child( " + FileName + " ) = Nil"
		    End If
		    
		    'Dim w as New wndBugReporter
		    'w.Init( err, App.ErrorMessage )
		    if AppSettings.HandleError( err, "OutOfBoundsException (caught at NFOWrite) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		    
		    App.ErrorMessage = ""
		    
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ActorStars() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Actor_ID() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Actor_Name() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Actor_Role() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Actor_ThumbURL() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Banner As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_BannerURLs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_CharacterArt As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_ClearArt As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Fanart As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_FanartDimensions() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_FanartThumbURLs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_FanartURLs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Logo As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_MPAARating As PIcture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Poster As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_PosterURLs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_SeasonNumbers() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_SeasonURLs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Studio As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_TVThumb As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Classification As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Countries() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CreditDirector As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CreditMusic As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CreditWriter As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DateEnded As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DatePremiered As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DateYear As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DescriptionOutline As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DescriptionPlot As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DescriptionTagline As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DescriptionTaglines() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DurationRuntime As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected FolderParent As Folderitem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Genres() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ID_IMDb As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ID_TVDB As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ID_TVRage As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Languages() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastAired_Date As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastAired_Episode As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Locked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected NextAired_Date As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected NextAired_Episode As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Rating As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RatingCertification() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RatingMPAA As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RatingVotes As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RecShows() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RecShow_IDs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Studios() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Tags() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ThemeSongs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Title As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TitleOriginal As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TitleSort As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TVNetwork As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule

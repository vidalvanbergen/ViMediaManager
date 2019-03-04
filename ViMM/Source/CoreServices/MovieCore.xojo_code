#tag Module
Protected Module MovieCore
	#tag Method, Flags = &h1
		Protected Sub MissingMovies()
		  'Dim UnFoundTitles() as String
		  Dim sckt as New MovieSckt
		  sckt.Yield = True
		  CommonCore.MassSearch = True
		  ReDim CommonCore.UnFoundTitles(-1)
		  ReDim CommonCore.UnfoundPaths(-1)
		  
		  Dim LstBox as Listbox = wndMain.lstMovies
		  
		  For i as Integer = 0 To LstBox.ListCount - 1
		    
		    // If item has been scraped before (DB ID is available), continue to the next list item.
		    'If LstBox.Cell(i, 2) <> "" And LstBox.Cell(i, 1) <> "" Then Continue
		    
		    // If Movie parent doesn't exist, continue to the next item.
		    MovieAttr.FolderParent = GetFolderItem( LstBox.Cell(i, 1), FolderItem.PathTypeShell )
		    If MovieAttr.FolderParent = Nil OR NOT MovieAttr.FolderParent.Exists Then Continue
		    
		    // Don't fetch if nfo file exists.
		    Dim nfofile as FolderItem = FindNFOFile( MovieAttr.FolderParent )
		    If nfofile <> Nil And nfofile.Exists And nfofile.IsReadable Then
		      // Don't fetch if nfo file is movie xml.nfo
		      Dim Content as String = ReadTextFile( nfofile )
		      If Content.Contains( "<movie>" ) Then Continue
		      'Continue
		    End If
		    
		    
		    
		    // If the movie doesn't have a name, continue to the next item.
		    Dim MovieName as String = FindMovieName( MovieAttr.FolderParent, True, NOT Preferences.Prefs.boolForKey("UseFolderNameForLookUp") )
		    If MovieName = "" Then Continue
		    
		    // Get JSON
		    dlgProgress.Add( Loc.kSearching + ":", MovieName + "..." )
		    Dim JSONString as String = sckt.Get( sckt.URL( "SearchMovie", MovieName, Preferences.Prefs.stringForKey("DBLanguage") ), Preferences.Prefs.integerForKey("TimeOut") )
		    sckt.Close
		    
		    
		    
		    // Load Valid JSON
		    If NOT JSONString.ValidJSON( "TMDb" ) Then
		      'If NOT nc.Available Then
		      'If NOT Growl.Notify( Loc.FetchAllMetadata + ":", Loc.kCouldNotBeFound.ReplaceAll( "%s", MovieName ) ) Then
		      '// NOT Growling!
		      'End If
		      'Else
		      nc.Message Loc.kCouldNotBeFound.ReplaceAll( "%S", MovieName )
		      'End If
		      
		      CommonCore.UnFoundTitles.Append MovieName + chr(13) + "Invalid JSON returned from Server."' + chr(13) + MovieAttr.FolderParent.ShellPath.ReplaceAll("\","") + JSONString
		      CommonCore.UnfoundPaths.Append MovieAttr.FolderParent
		      Continue
		    End If
		    
		    Dim ID as String
		    Dim SearchResult as new JSONItem
		    SearchResult.Load JSONString
		    
		    // Get ID if available.
		    
		    If SearchResult.Child("results").Count <= 0 Then
		      Dim IMDbResult as New JSONItem
		      IMDbResult = GetIMDbJSON( MovieName )
		      'JSONString = ""
		      'JSONString = IMDBjson( MovieName )
		      
		      
		      If IMDbResult = Nil OR NOT IMDbResult.HasName("TITLE") Then 'JSONString.ValidJSON("IMDb") Then
		        'If NOT nc.Available Then
		        'If NOT Growl.Notify( Loc.FetchAllMetadata + ":", Loc.kCouldNotBeFound.ReplaceAll( "%s", MovieName ) ) Then
		        '// Growling!
		        'End If
		        'Else
		        nc.Message Loc.kCouldNotBeFound.ReplaceAll( "%", MovieName )
		        'End If
		        
		        CommonCore.UnFoundTitles.Append MovieName + chr(13) + kNoResultsFound ' + chr(13) + MovieAttr.FolderParent.ShellPath.ReplaceAll("\","")
		        CommonCore.UnfoundPaths.Append MovieAttr.FolderParent
		        Continue
		      End If
		      
		      SearchResult = IMDbResult
		      'SearchResult.Load JSONString
		      
		      ID = SearchResult.Value("TITLE_ID")
		      MovieName = SearchResult.Value("TITLE")
		      
		      MovieByID ID
		      
		      If Preferences.Prefs.boolForKey("AutoManageMedia") Then
		        SingleRenamer MovieAttr.FolderParent, i, True
		      Else
		      End If
		      wndMain.lstMovies.UpdateRow i
		      
		      'If LstBox.ListIndex = i Then
		      'MovieAttr.LoadImages( MovieAttr.FolderParent )
		      'wndMain.cvsMovieDetails.Reload
		      'End If
		      
		      Continue
		    End If
		    
		    Dim MultipleResults as Boolean = SearchResult.Child("results").Count > 1
		    SearchResult = SearchResult.Child("results").Child(0)
		    
		    ID = SearchResult.Value("id")
		    MovieName = SearchResult.Value("original_title")
		    
		    // Download Movie INFO & images.
		    MovieByID ID
		    
		    If Preferences.Prefs.boolForKey("AutoManageMedia") Then
		      SingleRenamer MovieAttr.FolderParent, i, True
		    Else
		    End If
		    wndMain.lstMovies.UpdateRow i
		    
		    If MultipleResults Then
		      CommonCore.UnfoundTitles.Append MovieAttr.FolderParent.Name + chr(13) + Loc.kMultipleResultsFound.ReplaceAll( "%@", SearchResult.Value("original_title") + " (" + SearchResult.Value("release_date").StringValue.Left(4) + ")" )
		      CommonCore.UnfoundPaths.Append MovieAttr.FolderParent
		    End If
		    
		    'If LstBox.ListIndex = i Then
		    'MovieAttr.LoadImages( MovieAttr.FolderParent )
		    'wndMain.cvsMovieDetails.Reload
		    'End If
		    
		  Next
		  
		  CommonCore.MassSearch = False
		  wndMain.lstMovies.SortList
		  
		  MessageBox Loc.kDownloadComplete
		  
		  
		  
		  CommonCore.ShowUnfoundTitles( Loc.Movies ) 'Loc.kCouldNotBeFoundFollowing.ReplaceAll( "%S", Loc.Movies.Lowercase ) )
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MovieArt(ID as String, Mode as String)
		  If ID = "" Then
		    MessageBox msgNoIDMovie
		    Return
		  End If
		  
		  
		  Dim JSONString as String
		  Dim Sckt as New MovieSckt
		  Sckt.Yield = True
		  
		  dlgProgress.Reset
		  
		  Dim bTMDBArt as Boolean = ( Mode = "Posters" OR Mode = "Backdrops" )
		  Dim bFanArt as Boolean = ( Mode <> "Posters" )
		  
		  
		  
		  // ## TMDB Art
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( "[TMDb] " + Loc.kReadingInfo + "...", "", 1, 3 )
		  If bTMDBArt Then JSONString = DefineEncoding( Sckt.Get( Sckt.URL( "MovieImages", ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  Sckt.Close
		  
		  Dim TMDBArt as New JSONItem
		  If bTMDBArt And JSONString.ValidJSON( "TMDb Art") Then TMDBArt.Load( JSONString )
		  JSONString = ""
		  
		  
		  // ## FanartTV Art
		  Dim FanartTV as New JSONItem
		  FanartTV.Value("Loading") = "Nothing"
		  
		  If Preferences.Prefs.boolForKey("FanartTVEnabled") Then
		    If NOT CommonCore.MassSearch Then dlgProgress.Add( "[Fanart.TV] " + Loc.kReadingInfo + "..." )
		    If bFanArt Then JSONString = DefineEncoding( Sckt.Get( URLCore.FanartTV( ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    Sckt.Close
		    
		    If bFanArt And JSONString.ValidJSON( "FanartTV Art" ) Then FanartTV.Load( JSONString )
		  End If
		  
		  
		  Dim Thumbs() as Picture
		  Dim Dimensions(), URLs(), ThumbURLs(), Type as String
		  
		  // TMDB
		  Dim TMDBPosters as New JSONItem
		  If TMDBArt.HasName("posters") Then TMDbPosters = TMDBArt.Child("posters")
		  Dim TMDBBackdrops as New JSONItem
		  If TMDBArt.HasName("backdrops") Then TMDBBackdrops = TMDBArt.Child("backdrops")
		  
		  // FanartTV
		  Dim FTVBackdrops as New JSONItem
		  If FanartTV.HasName("moviebackground") Then FTVBackdrops  = FanartTV.Child("moviebackground")
		  Dim FTVThumbs as New JSONItem
		  If FanartTV.HasName("moviethumb")      Then FTVThumbs     = FanartTV.Child("moviethumb")
		  Dim FTVBanners as New JSONItem
		  If FanartTV.HasName("moviebanner")     Then FTVBanners    = FanartTV.Child("moviebanner")
		  Dim FTVClearArt as New JSONItem
		  If FanartTV.HasName("movieart")        Then FTVClearArt   = FanartTV.Child("movieart")
		  Dim FTVClearArtHD as New JSONItem
		  If FanartTV.HasName("hdmovieclearart") Then FTVClearArtHD = FanartTV.Child("hdmovieclearart")
		  Dim FTVLogos as New JSONItem
		  If FanartTV.HasName("movielogo")       Then FTVLogos      = FanartTV.Child("movielogo")
		  Dim FTVLogosHD as New JSONItem
		  If FanartTV.HasName("hdmovielogo")     Then FTVLogosHD    = FanartTV.Child("hdmovielogo")
		  Dim FTVDiscArt as New JSONItem
		  If FanartTV.HasName("moviedisc")       Then FTVDiscArt    = FanartTV.Child("moviedisc")
		  
		  
		  // Get the images
		  Select Case Mode
		    
		    // ## Posters
		  Case "Posters"
		    Type = Loc.kPoster
		    
		    // TMDB
		    For i as Integer = 0 to TMDbPosters.Count -1
		      URLs.Append       Sckt.URLbase_image + Preferences.Prefs.stringForKey( "PosterSize" ) + TMDbPosters.Child(i).Value("file_path")
		      ThumbURLs.Append  Sckt.URLbase_image + "w342"     + TMDbPosters.Child(i).Value("file_path")
		      Dimensions.Append TMDbPosters.Child(i).Value("width") + "x" + TMDbPosters.Child(i).Value("height")
		    Next
		    
		    // Download Default
		    Dim PosterItem as FolderItem = MovieAttr.DestinationPoster( MovieAttr.FolderParent )
		    If URLs.Ubound = 0 And ( PosterItem = Nil OR NOT PosterItem.Exists ) Then
		      MovieAttr.ART_Poster = URL2Picture( URLs(0), PosterItem.Parent, PosterItem.Name ) 'URL2Picture( URLs(0), PosterItem.NameNoExtension, PosterItem.Extension, MovieAttr.FolderParent )
		      CacheImageSet( MovieAttr.ART_Poster, MovieAttr.ID_IMDB + ".movie.poster.jpg" )
		      wndMain.cvsMovieDetails.Reload
		      Return
		    End If
		    
		    // ## Backdrops
		  Case "Backdrops"
		    Type = Loc.kFanart
		    
		    // TMDB
		    For i as Integer = 0 to TMDBBackdrops.Count -1
		      URLs.Append       Sckt.URLbase_image + Preferences.Prefs.stringForKey( "FanartSize" ) + TMDBBackdrops.Child(i).Value("file_path")
		      ThumbURLs.Append  Sckt.URLbase_image + "w300"     + TMDBBackdrops.Child(i).Value("file_path")
		      Dimensions.Append TMDBBackdrops.Child(i).Value("width") + "x" + TMDBBackdrops.Child(i).Value("height")
		    Next
		    
		    // Fanart.TV
		    For i as Integer = 0 to FTVBackdrops.Count -1
		      URls.Append       FTVBackdrops.Child(i).Value("url")
		      ThumbURLs.Append  FTVBackdrops.Child(i).Value("url")' + "/preview"
		      Dimensions.Append "1920x1080"
		    Next
		    
		    // Download Default
		    Dim FanartItem as FolderItem = MovieAttr.DestinationFanart( MovieAttr.FolderParent )
		    If URLs.Ubound = 0 And ( FanartItem = Nil OR NOT FanartItem.Exists ) Then
		      MovieAttr.ART_Fanart = URL2Picture( URLs(0), FanartItem.Parent, FanartItem.Name ) 'URL2Picture( URLs(0), FanartItem.NameNoExtension, FanartItem.Extension, MovieAttr.FolderParent )
		      CacheImageSet( MovieAttr.ART_Fanart, MovieAttr.ID_IMDB + ".movie.fanart.jpg" )
		      wndMain.cvsMovieDetails.Reload
		      Return
		    End If
		    
		    
		    // ## Banners
		  Case "Banners"
		    Type = Loc.kBanner
		    
		    // Fanart.TV
		    For i as Integer = 0 to FTVBanners.Count -1
		      URLs.Append       FTVBanners.Child(i).Value("url")
		      ThumbURLs.Append  FTVBanners.Child(i).Value("url")' + "/preview"
		      Dimensions.Append "1000x185"
		    Next
		    
		    // Download Default
		    If URLs.Ubound = 0 And NOT MovieAttr.FolderParent.Child("banner.jpg").Exists Then
		      MovieAttr.ART_Banner = URL2Picture( URLs(0), MovieAttr.FolderParent, "banner.jpg" ) 'URL2Picture( URLs(0), "banner", "jpg", MovieAttr.FolderParent )
		      wndMain.cvsMovieDetails.Reload
		      Return
		    End If
		    
		    
		    // ## Logos
		  Case "Logos"
		    Type = Loc.kLogo
		    
		    // HD
		    For i as Integer = 0 to FTVLogosHD.Count -1
		      URLs.Append       FTVLogosHD.Child(i).Value("url")
		      ThumbURLs.Append  FTVLogosHD.Child(i).Value("url")' + "/preview"
		      Dimensions.Append "800x310"
		    Next
		    
		    // SD
		    For i as Integer = 0 to FTVLogos.Count -1
		      URLs.Append       FTVLogos.Child(i).Value("url")
		      ThumbURLs.Append  FTVLogos.Child(i).Value("url")' + "/preview"
		      Dimensions.Append "400x155"
		    Next
		    
		    // Default image
		    If URLs.Ubound = 0 And NOT MovieAttr.FolderParent.Child("logo.png").Exists Then
		      MovieAttr.ART_Logo = URL2Picture( URLs(0), MovieAttr.FolderParent, "logo.png" ) 'URL2Picture( URLs(0), "logo", "png", MovieAttr.FolderParent )
		      wndMain.cvsMovieDetails.Reload
		      Return
		    End If
		    
		    
		    // ## ClearArt
		  Case "ClearArt"
		    Type = Loc.kClearArt
		    
		    // HD
		    For i as Integer = 0 to FTVClearArtHD.Count -1
		      URLs.Append       FTVClearArtHD.Child(i).Value("url")
		      ThumbURLs.Append  FTVClearArtHD.Child(i).Value("url") ' + "/preview"
		      Dimensions.Append "1000x562"
		    Next
		    
		    // SD
		    For i as Integer = 0 to FTVClearArt.Count -1
		      URLs.Append       FTVClearArt.Child(i).Value("url")
		      ThumbURLs.Append  FTVClearArt.Child(i).Value("url") ' + "/preview"
		      Dimensions.Append "500x281"
		    Next
		    
		    // Default image
		    If URLs.Ubound = 0 And NOT MovieAttr.FolderParent.Child("clearart.png").Exists Then
		      MovieAttr.ART_ClearArt = URL2Picture( URLs(0), MovieAttr.FolderParent, "clearart.png" ) 'URL2Picture( URLs(0), "clearart", "png", MovieAttr.FolderParent )
		      wndMain.cvsMovieDetails.Reload
		      Return
		    End If
		    
		    
		    // Thumbs
		  Case "Thumbs"
		    Type = Loc.kThumb
		    
		    For i as Integer = 0 to FTVThumbs.Count -1
		      URLs.Append       FTVThumbs.Child(i).Value("url")
		      ThumbURLs.Append  FTVThumbs.Child(i).Value("url") ' + "/preview"
		      Dimensions.Append "1000x562"
		    Next
		    
		    // Default image
		    If URLs.Ubound = 0 And NOT MovieAttr.FolderParent.Child("landscape.jpg").Exists Then
		      MovieAttr.ART_ClearArt = URL2Picture( URLs(0), MovieAttr.FolderParent, "landscape.jpg" ) 'URL2Picture( URLs(0), "landscape", "jpg", MovieAttr.FolderParent )
		      wndMain.cvsMovieDetails.Reload
		      Return
		    End If
		    
		    
		    // DiscArt
		  Case "DiscArt"
		    Type = Loc.kDiscArt
		    
		    For i as Integer = 0 to FTVDiscArt.Count -1
		      URLs.Append       FTVDiscArt.Child(i).Value("url")
		      ThumbURLs.Append  FTVDiscArt.Child(i).Value("url") ' + "/preview"
		      Dimensions.Append "1000x1000"
		    Next
		    
		    // Default image
		    If URLs.Ubound = 0 And NOT MovieAttr.FolderParent.Child("disc.png").Exists Then
		      MovieAttr.ART_ClearArt = URL2Picture( URLs(0), MovieAttr.FolderParent, "disc.png" ) 'URL2Picture( URLs(0), "disc", "png", MovieAttr.FolderParent )
		      wndMain.cvsMovieDetails.Reload
		      Return
		    End If
		    
		  End Select
		  
		  
		  // Download image thumbs.
		  dlgProgress.Reset
		  For i as Integer = 0 to ThumbURLs.Ubound
		    dlgProgress.Add( Loc.kDownloading + ":", Str( i + 1 ) + Loc.k1of2 + Str( ThumbURLs.Ubound + 1 ) + " " + Type + " " + Loc.kImages + "...", 1, ThumbURLs.Ubound + 1)
		    
		    'dim tmpURL as string = ThumbURLs(i)
		    'dim tmpTimeOut as Integer = Preferences.Prefs.integerForKey("TimeOut")
		    'dim tmpData as String = Sckt.Get( tmpURL, tmpTimeOut )
		    'dim tmpPic as Picture = Picture.FromData( tmpData )
		    'thumbs.Append tmpPic
		    
		    Thumbs.Append Picture.FromData( Sckt.Get( ThumbURLs(i), Preferences.Prefs.integerForKey("TimeOut") ) )
		    Sckt.Close
		    If Thumbs(i) <> Nil And val( Dimensions(i).ReplaceAll("x","") ) <= 0 Then Dimensions(i) = Str( Thumbs(i).Width ) + "x" + Str( Thumbs(i).Height )
		  Next
		  
		  // No images available
		  If Thumbs = Nil OR Thumbs.Ubound <= -1 Then
		    MessageBox MovieCore.kNoImagesFound.ReplaceAll( "%S", Type )
		    wndMain.cvsMovieDetails.Reload
		    Return
		  End If
		  
		  wndPreviewThumbs.Init( Thumbs, Dimensions, URLs, Mode )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MovieByID(ID as String, Update as Boolean = False)
		  
		  If MovieAttr.Locked Then
		    If NOT CommonCore.MassSearch Then MessageBox Loc.kIsLocked.ReplaceAll("%@", MovieAttr.Title)
		    Return
		  End If
		  
		  Dim sckt as New MovieSckt
		  sckt.Yield = True
		  
		  If ID = "" Then
		    'MsgBox msgNoIDMovie
		    MessageBox msgNoIDMovie
		    Return
		  End If
		  
		  // Reset current search.
		  If NOT CommonCore.MassSearch Then wndMain.ccSearchBoxMovies.srchField.StringValue = ""
		  
		  
		  Dim MovieParent as FolderItem = MovieAttr.FolderParent
		  Dim MovieName as String = FindMovieName( MovieParent, True, NOT Preferences.Prefs.boolForKey("UseFolderNameForLookUp") )
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kSearching + ":", MovieName, 1, 5 ) // 1
		  
		  // Get Movie data & images
		  sckt.GetMovieNFO ID, Update
		  
		  // Update Display
		  If NOT CommonCore.MassSearch Then
		    wndMain.lstMovies.UpdateRow
		    wndMain.lstMovies.ListIndex = wndMain.lstMovies.ListIndex
		    'wndMain.cvsMovieDetails.Reload
		    
		    'wndMain.lstMovies.SortList
		  End If
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MovieExtraArts(ID as String, Mode as String)
		  Dim Sckt as New MovieSckt
		  Sckt.Yield = True
		  
		  If ID = "" Then
		    MessageBox msgNoIDMovie
		    Return
		  End If
		  
		  
		  Dim Destination as FolderItem = MovieAttr.FolderParent.Child("extrathumbs")
		  If Mode = "ExtraBackdrops" Then Destination = MovieAttr.FolderParent.Child("extrafanart")
		  If Destination = Nil OR NOT Destination.Exists Then Destination.CreateAsFolder
		  
		  Dim Type as String = Loc.kExtraThumbs
		  If Mode = "ExtraBackdrops" Then Type = Loc.kExtraFanarts
		  
		  dlgProgress.Reset
		  
		  
		  // TMDB
		  dlgProgress.Add( Loc.kDownloading + ":", "[TMDb] " + Loc.kExtraFanarts, 1, 5 )
		  Dim JSONString as String = DefineEncoding( Sckt.Get( Sckt.URL( "MovieImages", ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  Sckt.Close
		  
		  Dim TMDBart as New JSONItem
		  If JSONString.ValidJSON( "TMDb" ) Then TMDBart.Load( JSONString )
		  If TMDBart.HasName("backdrops") Then TMDBart = TMDBart.Child("backdrops")
		  JSONString = ""
		  
		  // Fanart.TV
		  dlgProgress.Add( Loc.kDownloading + ":", "[Fanart.TV] " + Loc.kExtraFanarts )
		  JSONString = DefineEncoding( Sckt.Get( URLCore.FanartTV( ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  Sckt.Close
		  
		  If JSONString <> "" Then
		    Dim FirstBracketLoc as Integer = JSONString.InStr( 2, "{" )
		    JSONString = JSONString.Right( JSONString.Len - FirstBracketLoc + 1)
		  End If
		  
		  Dim FanartTV as New JSONItem
		  If JSONString.ValidJSON( "Fanart.TV" ) Then FanartTV.Load( JSONString )
		  If FanartTV.HasName("moviebackground") Then FanartTV = FanartTV.Child("moviebackground") Else FanartTV.Load( "{}" )
		  JSONString = ""
		  
		  
		  // Gather it all up.
		  Dim URLs(), Names() as String
		  Dim ImageWidth as String = Preferences.Prefs.stringForKey( "FanartSize" )
		  If Mode = "ExtraThumbs" Then ImageWidth = "w300"
		  
		  // TMDB
		  For i as Integer = 0 to TMDBart.Count -1
		    URLs.Append       Sckt.URLbase_image + ImageWidth + TMDBart.Child(i).Value("file_path")
		    Dim TmpName() as String = TMDBart.Child(i).Value("file_path").StringValue.Split( "/" )
		    Names.Append      TmpName( TmpName.Ubound )
		  Next
		  
		  // Fanart.TV
		  For i as Integer = 0 to FanartTV.Count -1
		    URls.Append       FanartTV.Child(i).Value("url")
		    Dim TmpName() as String = FanartTV.Child(i).Value("url").StringValue.Split( "/" )
		    Names.Append      TmpName( TmpName.Ubound )
		  Next
		  
		  
		  dlgProgress.Add( Loc.kDownloading + ":", Type + "..." )
		  
		  For i as Integer = 0 to URLs.Ubound
		    dlgProgress.Debug( Str( i+1 ) + Loc.k1of2 + Str( URLs.Ubound + 1 ) + " " + Loc.kImages.Titlecase + "..." )
		    ImageWidth = "300"
		    
		    If Mode = "ExtraThumbs" Then
		      If Preferences.Prefs.integerForKey( "MaxThumbs" ) > 0 And i = Preferences.Prefs.integerForKey( "MaxThumbs" ) Then Continue
		      If Destination.Child( "thumb" + Str( i + 1 ) + ".jpg" ).Exists Then Continue
		      
		      If i >= TMDBart.Count Then
		        Dim Pic as Picture = Picture.FromData( Sckt.Get( URLs(i), Preferences.Prefs.integerForKey("TimeOut") ) )
		        SaveImage( ScaleImage( Pic, Val( ImageWidth ), 600 ), Destination.Child( "thumb" + Str(i+1) + ".jpg" ), FileTypes.ImageJpeg )
		      Else
		        URL2Picture( URLs(i), Destination, "thumb" + Str(i+1) + ".jpg" )
		      End If
		      
		    ElseIf Mode = "ExtraBackdrops" Then
		      If Preferences.Prefs.integerForKey( "MaxBackdrops" ) > 0 And i = Preferences.Prefs.integerForKey( "MaxBackdrops" ) Then Continue
		      If Destination.Child( Names(i) ).Exists Then Continue
		      
		      URL2Picture( URLs(i), Destination, Names(i) )
		    End If
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MovieSearch(MovieName as String, ManualSearch as Boolean = False)
		  If MovieAttr.Locked Then
		    If NOT CommonCore.MassSearch Then MessageBox Loc.kIsLocked.ReplaceAll("%@", MovieAttr.Title)
		    Return
		  End If
		  
		  Dim JSONString as String
		  Dim Sckt as New MovieSckt
		  Sckt.Yield = True
		  
		  dlgProgress.Add( Loc.kSearching + ":", MovieName )
		  Dim Year as String = MovieName.Right(7)
		  'If Year.InStr(0,"(") > 0 And Year.InStr(0,")") > 0 Then
		  'Year = Trim( Year.ReplaceAll("(","").ReplaceAll(")","") )
		  'MovieName = MovieName.Left( MovieName.Len - 7 )
		  'ElseIf Year.InStr(0,"[") > 0 And Year.InStr(0,"]") > 0 Then
		  'Year = Trim( Year.ReplaceAll("[","").ReplaceAll("]","") )
		  'MovieName = MovieName.Left( MovieName.Len - 7 )
		  'ElseIf Year.InStr(0,"{") > 0 And Year.InStr(0,"}") > 0 Then
		  'Year = Trim( Year.ReplaceAll("{","").ReplaceAll("}","") )
		  'MovieName = MovieName.Left( MovieName.Len - 7 )
		  'Else
		  'Year = ""
		  'End If
		  Year = ""
		  
		  JSONString = DefineEncoding( Sckt.Get( Sckt.URL( "SearchMovie", Trim( MovieName.ReplaceAll(" - "," ").ReplaceAll("%","") ), Preferences.Prefs.stringForKey("DBLanguage"), 1, Year ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  'Sckt.Close
		  'If Year <> "" Then MovieName = MovieName + " (" + Year + ")"
		  
		  If NOT JSONString.ValidJSON("TMDb Search") Then Return
		  
		  Dim JSON as New JSONItem
		  JSON.Load JSONString.ConvertEncoding( Encodings.UTF8 )
		  
		  Dim TotalPages   as Integer' = JSON.Value("total_pages")
		  Dim TotalResults as Integer' = JSON.Value("total_results")
		  If JSON.HasName("total_pages") Then TotalPages = JSON.Value("total_pages")
		  If JSON.HasName("total_results") Then TotalResults = JSON.Value("total_results")
		  'MessageBox "Help Me!"
		  
		  // Process Result(s)
		  If TotalResults <= 0 Or TotalResults > 99 Then
		    
		    Dim IMDbItem as New JSONItem
		    IMDbItem = GetIMDbJSON( MovieName, True )
		    
		    If IMDbItem <> Nil And IMDbItem.HasName("TITLE_ID") Then
		      TotalResults = 1
		      
		      If ManualSearch Then
		        
		        Dim FanartURL as String
		        If IMDbItem.HasName("MEDIA_IMAGES") And IMDbItem.Child("MEDIA_IMAGES").Count > 0 Then FanartURL = IMDbItem.Child("MEDIA_IMAGES").Value(0)
		        
		        CommonCore.ShowSearchResult( IMDbItem.Value("TITLE_ID"), "", IMDbItem.Value("TITLE"), IMDbItem.Value("RELEASE_DATE"), IMDbItem.Value("POSTER"), FanartURL, "" )
		        
		        dlgProgress.Close
		        Return
		        
		      Else
		        MovieByID IMDbItem.Value("TITLE_ID")
		      End If
		      
		      Return
		    End If
		  End If
		  
		  
		  Dim ID(), Title(), ReleaseDate(), PosterURL(), FanartURL() as String
		  
		  // No Results
		  If TotalResults = 0 Then
		    
		    If NOT CommonCore.MassSearch Then MessageBox kNoMoviesFoundTryAgain
		    wndSearch.Show
		    If NOT ManualSearch Then wndSearch.ccSearchBox.srchField.StringValue = FindMovieName( MovieAttr.FolderParent, True, NOT Preferences.Prefs.boolForKey("UseFolderNameForLookUp") )
		    dlgProgress.Close
		    Return
		    
		    // 1 Result NOT Manual Search
		  ElseIf NOT ManualSearch And JSON.Child("results").Count = 1 Then 'TotalResults = 1 Then
		    MovieCore.MovieByID( JSON.Child("results").Child(0).Value("id") )
		    Return
		  End If
		  
		  For i as Integer = 1 to TotalPages
		    
		    // Multi-Page results.
		    If i > 1 Then
		      JSONString = DefineEncoding( Sckt.Get( Sckt.URL( "SearchMovie", MovieName, Preferences.Prefs.stringForKey("DBLanguage"), i, Year ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		      Sckt.Close
		      If NOT JSONString.ValidJSON( "TMDb Page Search" ) Then
		        Return
		      End If
		      JSON.Load JSONString.ConvertEncoding( Encodings.UTF8 )
		    End If
		    
		    For n as Integer = 0 to JSON.Child("results").Count - 1
		      Dim Jitem as JSONItem = JSON.Child("results").Child(n)
		      dlgProgress.Add( Loc.kSearchResults + ":", Jitem.Value("title"), 1, TotalResults )
		      
		      ID.Append            Jitem.Value("id")
		      Title.Append         Jitem.Value("title")
		      ReleaseDate.Append   Jitem.Value("release_date")
		      
		      Dim pSize as String
		      Dim bSize as String
		      If App.ScalingFactor = 2 Then pSize = "w342" Else pSize   = "w185"
		      If App.ScalingFactor = 2 Then bSize = "w780" Else bSize = "w300"
		      
		      If Jitem.Value("poster_path") <> "" Then
		        PosterURL.Append Sckt.URLbase_image + pSize + Jitem.Value("poster_path")
		      Else
		        PosterURL.Append ""
		      End If
		      
		      If Jitem.Value("backdrop_path") <> "" Then
		        FanartURL.Append Sckt.URLbase_image + bSize + Jitem.Value("backdrop_path")
		      Else
		        FanartURL.Append ""
		      End If
		      
		    Next
		    
		    JSONString = ""
		  Next
		  
		  ShowSearchResults( ID, ID, Title, ReleaseDate, PosterURL, FanartURL )
		  
		  dlgProgress.Close
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MovieTrailers(ID as String, ShowAll as Boolean = False) As Dictionary
		  ReDim MovieAttr.TrailerURLs (-1)
		  ReDim MovieAttr.TrailerNames (-1)
		  ReDim MovieAttr.TrailerQuality (-1)
		  Dim TrailerSources() as String
		  
		  'MovieAttr.NFORead( MovieAttr.FolderParent )
		  
		  Dim Names(), URLs(), Qualities() as String
		  
		  Dim Sckt as New MovieSckt
		  Dim JSONString as String
		  
		  Dim MovieInfo as String = CurrentItemName + " " + Loc.mTabInfo.Lowercase + "..."
		  
		  // Get TMDB Trailer data.
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TMDb Trailers] " + MovieInfo ) Else dlgProgress.Debug( "[TMDb Trailers] " + MovieInfo )
		  If ID.Left(2) <> "tt" Then JSONString = DefineEncoding( Sckt.Get( Sckt.URL( "MovieTrailers", ID, "en" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  Sckt.Close
		  
		  Dim TMDB_Trailers as New JSONItem
		  If ID.Left(2) <> "tt" And JSONString.ValidJSON( "TMDb Trailers" ) Then TMDB_Trailers.Load( JSONString )
		  JSONString = ""
		  
		  // ## TMDb Trailer
		  If TMDB_Trailers.HasName("youtube") Then
		    
		    For i as Integer = 0 to TMDB_Trailers.Child("youtube").Count -1
		      Dim jItem as New JSONItem
		      jItem = TMDB_Trailers.Child("youtube").Child(i)
		      
		      If jItem.Value("source") <> "" Then
		        MovieAttr.TrailerURLs.Append     "http://www.youtube.com/watch?v=" + jItem.Value("source")
		        MovieAttr.TrailerNames.Append    "YouTube: " + jItem.Value("name")
		        MovieAttr.TrailerQuality.Append  jItem.Value("size")
		        'TrailerSources.Append "Youtube: "
		        
		        Dim ytsckt as New TrailerSckt
		        Dim Dict as Dictionary = ytsckt.VideoLinks( "http://www.youtube.com/watch?v=" + jItem.Value("source") )
		        
		        If Dict <> Nil Then
		          For Each Key as Variant in Dict.Keys
		            URLs.Append Key
		            Names.Append "YouTube " + jItem.Value("name")
		            Qualities.Append Dict.Value( Key )
		          Next
		        End If
		        
		      End If
		    Next
		  End If
		  
		  // ## HD-Trailers.net
		  dim searchString as string = MovieAttr.TitleOriginal.ReplaceAll(":","").ReplaceAll(" - ", " ").ReplaceAll( " ", "-" ).Lowercase
		  if searchString.Left(4) = "The " then
		    searchString = searchString.Right( searchString.Len - 4 )
		  end if
		  
		  Dim HDTrailers as String = "http://www.hd-trailers.net/movie/" + String2Entities( Trim( searchString ) ) + "/"
		  Dim HTML as String = Sckt.Get( HDTrailers, Preferences.Prefs.integerForKey("TimeOut") )
		  If HTML.InStr( 0, "Redirecting..." ) > 0 Then HTML = Sckt.Get( HTML.MyMid( "<meta http-equiv=""refresh"" content=""0;url=", """ />" ), Preferences.Prefs.integerForKey("TimeOut") )
		  
		  Dim TrailerURLs() as String = match_all( "Mediabox.open\( (.*?) \);", HTML.ReplaceAll( """", "" ) )
		  
		  For i as Integer = 0 to TrailerURLs.Ubound
		    Dim Source as String = Trim( TrailerURLs(i).NthField( ",", 1 ) )
		    Dim URL as String = Trim( TrailerURLs(i).NthField( ",", 1 ) )
		    
		    If Source.InStr( 0, "aol.com" ) > 0 Then
		      Source = "AOL: "
		    ElseIf Source.InStr( 0, "apple.com" ) > 0 Then
		      Source = "Apple: "
		    ElseIf Source.InStr( 0, "yahoo.com" ) > 0 Then
		      Source = "Yahoo: "
		    ElseIf Source.InStr( 0, "hd-trailers" ) > 0 Then
		      Source = "HD-Trailers: "
		      
		    ElseIf Source.InStr( 0, "youtube" ) > 0 Then
		      Source = "YouTube: "
		      
		    Else
		      Source = ""
		    End If
		    
		    'TrailerSources.Append            Source
		    MovieAttr.TrailerURLs.Append     URL.ReplaceAll( Source, "" )
		    MovieAttr.TrailerNames.Append    Source + Trim( TrailerURLs(i).NthField( ",", 2 ) ).NthField( " - ", 2 ).ReplaceAll( "&#039;", "'" )
		    MovieAttr.TrailerQuality.Append  Trim( TrailerURLs(i).NthField( ",", 3 ) ).NthField( " ", 1 ).ReplaceAll( "res", "" )
		    
		    Names.Append Source + Trim( TrailerURLs(i).NthField( ",", 2 ) ).NthField( " - ", 2 ).ReplaceAll( "&#039;", "'" )
		    URLs.Append  URL.ReplaceAll( Source, "" ).ReplaceAll("&amp;", "&")
		    Qualities.Append Trim( TrailerURLs(i).NthField( ",", 3 ) ).NthField( " ", 1 ).ReplaceAll( "res", "" )
		  Next
		  
		  
		  MovieAttr.NFOWrite( MovieAttr.FolderParent )
		  
		  If ShowAll Then
		    Dim TrailerFile as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		    
		    If URLs.Ubound > -1 Or TrailerFile <> Nil ANd TrailerFile.Exists Then
		      
		      wndItemChooser.Show
		      wndItemChooser.lstResults.DeleteAllRows
		      
		      // External Files
		      For i as Integer = 0 to URLs.Ubound
		        wndItemChooser.lstResults.AddRow( Names(i), Qualities(i) )
		        wndItemChooser.lstResults.RowTag( wndItemChooser.lstResults.LastIndex ) = URLs(i)
		      Next
		      
		      // Sort list
		      wndItemChooser.lstResults.SortedColumn = 0
		      wndItemChooser.lstResults.Sort
		      
		      
		      // Local file
		      If TrailerFile <> Nil And TrailerFile.Exists Then
		        wndItemChooser.lstResults.InsertRow( 0, Loc.kTrailer.Titlecase )
		        wndItemChooser.lstResults.Cell( 0, 1 ) = Loc.kNotAvailable
		        wndItemChooser.lstResults.RowTag( 0 ) = TrailerFile
		      End If
		      
		      If wndItemChooser.lstResults.ListCount > 0 Then wndItemChooser.lstResults.ListIndex = 0
		      
		    Else
		      MessageBox Loc.kCouldNotBeFound.ReplaceAll( "%S", Loc.kTrailers )
		    End If
		  End If
		  
		  Dim Dict as New Dictionary
		  For i as Integer = 0 to URLs.Ubound
		    Dict.Value( URLs(i) ) = Qualities(i)
		  Next
		  
		  Return Dict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MovieUpdate(ID as String)
		  If MovieAttr.Locked Then
		    If NOT CommonCore.MassSearch Then MessageBox Loc.kIsLocked.ReplaceAll("%@", MovieAttr.Title)
		    Return
		  End If
		  
		  Dim LstBox as Listbox = wndMain.lstMovies
		  CommonCore.MassSearch = False
		  
		  If ID = "" Then
		    'MsgBox msgNoIDMovie
		    MessageBox msgNoIDMovie
		    Return
		  End If
		  
		  // Reset current search.
		  If NOT CommonCore.MassSearch Then wndMain.ccSearchBoxMovies.srchField.StringValue = ""
		  
		  
		  dlgProgress.Add( Loc.kDownloading + ":", FindMovieName( MovieAttr.FolderParent, True, NOT Preferences.Prefs.boolForKey("UseFolderNameForLookUp") ) )
		  MovieByID ID, True
		  
		  MovieAttr.LoadImages( MovieAttr.FolderParent )
		  wndMain.cvsMovieDetails.Reload
		  
		  wndMain.lstMovies.UpdateRow( LstBox.ListIndex )
		  wndMain.lstMovies.Sort
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MovieUpdateAll()
		  Dim LstBox as Listbox = wndMain.lstSearch
		  CommonCore.MassSearch = True
		  ReDim CommonCore.UnFoundTitles(-1)
		  ReDim CommonCore.UnfoundPaths(-1)
		  MovieAttr.FolderParent = Nil
		  
		  For i as Integer = 0 to LstBox.ListCount - 1
		    
		    Dim ID as String = LstBox.Cell(i, 2)
		    If ID = "" Then Continue
		    
		    MovieAttr.FolderParent = GetFolderItem( LstBox.Cell(i, 1), FolderItem.PathTypeShell )
		    If MovieAttr.FolderParent = Nil or NOT MovieAttr.FolderParent.Exists Then Continue
		    
		    MovieAttr.ClearProperties // Remove previous properties
		    MovieAttr.NFORead( MovieAttr.FolderParent ) // Load properties from current item.
		    If MovieAttr.Locked Then Continue
		    
		    dlgProgress.Add( Loc.kDownloading + ":", FindMovieName( MovieAttr.FolderParent, True, NOT Preferences.Prefs.boolForKey("UseFolderNameForLookUp") ) )
		    MovieByID ID, True
		    
		    
		    If Preferences.Prefs.boolForKey("AutoManageMedia") Then
		      SingleRenamer MovieAttr.FolderParent, i, True
		    Else
		      wndMain.lstMovies.UpdateRow i
		    End If
		    
		    If i = LstBox.ListIndex Then
		      MovieAttr.LoadImages( MovieAttr.FolderParent )
		      wndMain.cvsMovieDetails.Reload
		    End If
		    
		  Next
		  
		  wndMain.lstMovies.Sort
		  
		  CommonCore.ShowUnfoundTitles( Loc.kCouldNotBeFoundFollowing.ReplaceAll( "%S", Loc.Movies.Lowercase ) )
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MovieUpdateRating(CurrentRow as Integer = - 1)
		  
		  Dim MovieName as String = CommonCore.CurrentItemName
		  Dim JSONString as String
		  Dim sckt as New MovieSckt
		  sckt.Yield = True
		  
		  If MovieAttr.ID_IMDB = "" Then
		    MsgBox msgNoID
		    Return
		  End If
		  
		  // ## TMDB
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", MovieName + " TMDb " + Loc.mRating.ReplaceAll(":", "...") )
		  JSONString = DefineEncoding( sckt.Get( sckt.URL( "MovieInfo", MovieAttr.ID_IMDB, Preferences.Prefs.stringForKey("DBLanguage") ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  sckt.Close
		  'JSONString = DecodingFromHTMLMBS( JSONString )
		  
		  Dim TMDB as New JSONItem
		  If JSONString.ValidJSON("TMDB") Then TMDB.Load JSONString
		  JSONString = ""
		  
		  // ## TMDB Releases
		  JSONString = DefineEncoding( sckt.Get( sckt.URL( "MovieReleases", MovieAttr.ID_IMDB, Preferences.Prefs.stringForKey("DBLanguage") ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  sckt.Close
		  'JSONString = DecodingFromHTMLMBS( JSONString )
		  
		  Dim TMDBReleases as New JSONItem
		  If JSONString.ValidJSON("TMDb Releases") Then TMDBReleases.Load( JSONString )
		  
		  // ## IMDB
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", MovieName + " IMDb " + Loc.mRating.ReplaceAll(":", "...") )
		  Dim IMDB as New JSONItem
		  IMDb = GetIMDbJSON( MovieAttr.ID_IMDB )
		  'JSONString = DefineEncoding( IMDBjson( MovieAttr.ID_IMDB, True ), Encodings.UTF8 )
		  'sckt.Close
		  '
		  'Dim IMDB as New JSONItem
		  'If JSONString.ValidJSON("IMDb") Then IMDB.Load ConvertEncoding( JSONString, Encodings.UTF8 ) Else Return
		  'JSONString = ""
		  
		  // ## Rotten Tomatoes
		  Dim Tomato as New JSONItem
		  If Preferences.Prefs.boolForKey("RTEnabled") And Preferences.Prefs.boolForKey("RTRatingsEnabled") Then
		    If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", MovieName + " RottenTomatoes " + Loc.mRating.ReplaceAll(":", "...") )
		    JSONString = Trim( DefineEncoding( sckt.Get( sckt.URL( "TomatoesMovieAlias", MovieAttr.ID_IMDB.ReplaceAll("tt","") ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		    JSONString = Trim( DefineEncoding( Sckt.Get( URLCore.RottenTomatoes( MovieAttr.ID_IMDB.ReplaceAll( "tt", "" ), "Alias" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		    sckt.Close
		    
		    If JSONString.ValidJSON("RottenTomatoes") Then Tomato.Load( ConvertEncoding( JSONString, Encodings.UTF8 ) )
		    JSONString = ""
		  End If
		  
		  
		  // Set TMDB Data
		  If Preferences.Prefs.stringForKey("PreferredRatings").Contains("TMDb") Then
		    If TMDB.HasName("vote_average") And TMDB.Value("vote_average") <> "" Then MovieAttr.Rating      = Round( Val( TMDB.Value("vote_average") ) * 10 ) / 10
		    If TMDB.HasName("vote_count")   And TMDB.Value("vote_count")   <> "" Then MovieAttr.RatingVotes = Val( TMDB.Value("vote_count") )
		  End If
		  
		  // Set IMDB Data
		  If Preferences.Prefs.stringForKey("PreferredRatings").Contains("IMDb") OR Preferences.Prefs.stringForKey("PreferredRatings") = "" Then
		    If IMDB.HasName("RATING")  And IMDB.Value("RATING")  <> "" Then MovieAttr.Rating       = Val( IMDB.Value("RATING") )
		    If IMDB.HasName("VOTES")   And IMDB.Value("VOTES")   <> "" Then MovieAttr.RatingVotes  = Val( Str( IMDB.Value("VOTES") ).ReplaceAll(",","") )
		  End If
		  If IMDB.HasName("TOP_250") And IMDB.Value("TOP_250") <> "" Then MovieAttr.RatingTop250 = Val( IMDB.Value("TOP_250") )
		  
		  
		  If Preferences.Prefs.stringForKey("PreferredRatings").Contains("Tomato") And Preferences.Prefs.stringForKey("PreferredRatings").Contains("Critics") And MovieAttr.TomatoCriticsScore > 0 Then
		    MovieAttr.RatingVotes = -1
		    MovieAttr.Rating = ( MovieAttr.TomatoCriticsScore / 10 )
		  End If
		  
		  If Preferences.Prefs.stringForKey("PreferredRatings").Contains("Tomato") And Preferences.Prefs.stringForKey("PreferredRatings").Contains("Audience") And MovieAttr.TomatoAudienceScore > 0 Then
		    MovieAttr.RatingVotes = -1
		    MovieAttr.Rating = ( MovieAttr.TomatoCriticsScore / 10 )
		  End If
		  
		  // Get MPAA Data
		  Dim MPAA as String
		  If IMDB.HasName("MPAA_RATING") And IMDB.Value("MPAA_RATING") <> "" Then MPAA = IMDB.Value("MPAA_RATING")
		  MovieAttr.RatingMPAA = MPAA
		  
		  Dim sx1 as Integer = MPAA.InStr(0," for ")
		  Dim MPAAExplanation as String = Trim( MPAA.ReplaceAll( MPAA.Left(sx1 - 1), "" ) )
		  MPAA = Trim( MPAA.Left( sx1 ) )
		  
		  
		  // ## TMDB Releases MPAA
		  If TMDBReleases.HasName("countries") And TMDBReleases.Child("countries").Count > 0 Then
		    MovieAttr.RatingMPAA = ""
		    MovieAttr.DatePremiered = ""
		    ReDim MovieAttr.RatingCertification(-1)
		    
		    Dim Country(), Rating() as String
		    
		    For i as Integer = 0 to TMDBReleases.Child("countries").Count - 1
		      Dim jItem as New JSONItem
		      jItem = TMDBReleases.Child("countries").Child(i)
		      
		      Country.Append jItem.Value("iso_3166_1")
		      Rating.Append  jItem.Value("certification")
		      
		      If jItem.Value("iso_3166_1") = "US" Then
		        If jItem.Value("release_date")  <> "" And MovieAttr.DatePremiered = "" Then MovieAttr.DatePremiered = jItem.Value("release_date")
		        If jItem.Value("certification") <> "" And MovieAttr.RatingMPAA = ""    Then MovieAttr.RatingMPAA = MPAAFromCountry( jItem.Value("certification"), "US" )
		      End If
		      
		      If jItem.Value("iso_3166_1") = Preferences.Prefs.stringForKey("DBLanguage") THen
		        If jItem.Value("release_date")  <> "" Then
		          MovieAttr.DatePremiered = jItem.Value("release_date")
		          If Val( Str( jItem.Value("release_date") ).left(4) ) > 1000 Then MovieAttr.DateYear      = Val( Str( jItem.Value("release_date") ).Left(4) )
		        End If
		        If jItem.Value("certification") <> "" Then MovieAttr.RatingMPAA    = MPAAFromCountry( jItem.Value("certification"), Preferences.Prefs.stringForKey("DBLanguage") )
		      End If
		    Next
		    
		    For i as Integer = 0 to Country.Ubound
		      If Country(i) <> "" And Rating(i) <> "" Then MovieAttr.RatingCertification.Append FlagCountry( Country(i) ) + ":" + Rating(i)
		    Next
		    
		    If MovieAttr.RatingMPAA = ""  And MPAA <> "" Then MovieAttr.RatingMPAA = MPAA
		    If MovieAttr.RatingMPAA <> "" And MPAAExplanation <> "" Then MovieAttr.RatingMPAA = MovieAttr.RatingMPAA + " " + MPAAExplanation
		  End If
		  
		  
		  // ## RottenTomatoes
		  If Preferences.Prefs.boolForKey("RTEnabled") And Preferences.Prefs.boolForKey("RTRatingsEnabled") Then
		    If Tomato.HasName("critics_consensus") And Tomato.Value("critics_consensus") <> "" Then MovieAttr.TomatoConcensus = Tomato.Value("critics_consensus")
		    If Tomato.HasName("ratings") Then
		      Dim jItem as New JSONItem
		      jItem = Tomato.Child("ratings")
		      
		      If jItem.HasName("critics_rating") And jItem.Value("critics_rating") <> "" Then MovieAttr.TomatoCriticsRating = jItem.Value("critics_rating")
		      If jItem.HasName("critics_score")  And jItem.Value("critics_score")  <> "" Then MovieAttr.TomatoCriticsScore  = jItem.Value("critics_score")
		      
		      If jItem.HasName("audience_rating") And jItem.Value("audience_rating") <> "" Then MovieAttr.TomatoAudienceRating = jItem.Value("audience_rating")
		      If jItem.HasName("audience_score")  And jItem.Value("audience_score")  <> "" Then MovieAttr.TomatoAudienceScore  = jItem.Value("audience_score")
		    End If
		    If Tomato.HasName("release_dates") And Tomato.Child("release_dates").HasName("dvd") And Tomato.Child("release_dates").Value("dvd") <> "" Then
		      MovieAttr.DateReleasedOnDVD = Tomato.Child("release_dates").Value("dvd")
		    End If
		  End If
		  
		  
		  // Write NFO
		  MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		  
		  // Update wndMain
		  If ActiveSection = 0 Then
		    wndMain.lstMovies.UpdateRow
		    If CurrentRow = -1 Or CurrentRow = wndMain.lstMovies.ListIndex Then
		      MovieAttr.LoadImages( MovieAttr.FolderParent )
		      wndMain.cvsMovieDetails.Reload
		    End If
		  End If
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateArt(ID as String, ListIndex as Integer)
		  If ListIndex <= -1 Then Return
		  
		  Dim lstBox as Listbox = wndMain.lstMovies
		  
		  // If item has not been scraped before, (No ID is available) then continue to the next item.
		  If ID = "" Then Return
		  
		  // If item doesn't exist, continue to the next item.
		  If lstBox.Cell(ListIndex, 1).Contains(":") Then
		    MovieAttr.FolderParent = GetFolderItem( lstBox.Cell(ListIndex, 1) )
		  Else
		    MovieAttr.FolderParent = GetFolderItem( lstBox.Cell(ListIndex, 1), FolderItem.PathTypeShell )
		  End If
		  
		  If MovieAttr.FolderParent = Nil Or NOT MovieAttr.FolderParent.Exists Then Return
		  MovieAttr.NFORead( MovieAttr.FolderParent )
		  
		  Dim Title as String = lstBox.Cell( ListIndex, 0 )
		  
		  
		  dlgProgress.Add( Loc.kDownloading + ":", Title + "..." ) // 1
		  Dim scktM as New MovieSckt
		  scktM.GetArt ID, Title
		  
		  MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		  
		  wndMain.lstMovies.UpdateRow ListIndex
		  
		  If CommonCore.MassSearch = False And wndMain.lstMovies.ListIndex = ListIndex Then
		    MovieAttr.LoadImages MovieAttr.FolderParent
		    wndMain.cvsMovieDetails.Reload
		  End If
		  Return
		End Sub
	#tag EndMethod


	#tag Constant, Name = ApiKey_FanartTV, Type = String, Dynamic = False, Default = \"79220e0c14eab8f46eedbb611288572e", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ApiKey_RottenTomatoes, Type = String, Dynamic = False, Default = \"4kqwjrydumjyz9b8bc9bkert", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ApiKey_TMDB, Type = String, Dynamic = False, Default = \"683359f622e4e27f41832a019d90b002", Scope = Public
	#tag EndConstant

	#tag Constant, Name = btnDownloadMissingArtwork, Type = String, Dynamic = True, Default = \"Download Missing Images Only", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Missing Images Only"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download ontbrekende afbeeldingen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda endast ned saknade bilder"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Nur Fehlende Extras herunterladen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger les images manquantes seulement"
	#tag EndConstant

	#tag Constant, Name = btnReplaceExistingArtwork, Type = String, Dynamic = True, Default = \"Replace Existing Images", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Replace Existing Images"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Vervang bestaande afbeeldingen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ers\xC3\xA4tt befintliga bilder"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alle ersetzen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Remplacer les images actuelles"
	#tag EndConstant

	#tag Constant, Name = kConnectionError, Type = String, Dynamic = True, Default = \"Error establishing a database connection.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Error establishing a database connection."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Fout in een verbinding met de database."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kan inte ansluta till databasen."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Fehler beim Aufbau der Datenbankverbindung."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Erreur de connection \xC3\xA0 la base de donn\xC3\xA9es."
	#tag EndConstant

	#tag Constant, Name = kFileInfo, Type = String, Dynamic = True, Default = \"File Information", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"File Information"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bestands informatie"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Filinformation"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Datei Information"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Information du fichier"
	#tag EndConstant

	#tag Constant, Name = kImageURLsFound, Type = String, Dynamic = True, Default = \"%s image URLs...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"%s image URLs..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"%s afbeeldingen URLs..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"%s bild-URL..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"%s Bild URLs..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'URL de l\'image %s..."
	#tag EndConstant

	#tag Constant, Name = kManualSearchMovie, Type = String, Dynamic = True, Default = \"Do you want to manually search for the movie\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Do you want to manually search for the movie\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wil je handmatig naar de film zoeken\?"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Vill du s\xC3\xB6ka efter filmen manuellt\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Soll der Film manuell gesucht werden\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Voulez vous rechercher manuellement ce film \?"
	#tag EndConstant

	#tag Constant, Name = kNoImagesFound, Type = String, Dynamic = True, Default = \"No %s images found.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No %s images found."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen %s afbeeldingen gevonden."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Inga %sbilder hittades."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Keine %s Extras gefunden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'image %s n\'a pu \xC3\xAAtre trouv\xC3\xA9e."
	#tag EndConstant

	#tag Constant, Name = kNoMoviesFoundTryAgain, Type = String, Dynamic = True, Default = \"No movies were found\x2C try again with fewer keywords or an alternative title.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No movies were found\x2C try again with fewer keywords or an alternative title."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen films gevonden\x2C probeer opnieuw met minder sleutel woorden of een alternatieve titel."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ingen film hittades\x2C f\xC3\xB6rs\xC3\xB6k igen med f\xC3\xA4rre s\xC3\xB6kord eller en alternativ filmtitel."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Keine Filme gefunden. Versuche es mit weniger Suchw\xC3\xB6rtern oder mit einem anderen Titel."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aucun film trouv\xC3\xA9\x2C veuillez modifier vos mots cl\xC3\xA9s ou essayer un titre alternatif."
	#tag EndConstant

	#tag Constant, Name = kNoResultsFound, Type = String, Dynamic = True, Default = \"No results found\x2C try a different name.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No results found\x2C try a different name."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen resultaten gevonden\x2C probeer een andere naam."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Keine Ergebnisse gefunden\x2C versuchen Sie einen anderen Namen."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aucun r\xC3\xA9sultat\x2C essayez avec un nom diff\xC3\xA9rent."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Hittade inget\x2C f\xC3\xB6rs\xC3\xB6k med ett annat namn."
	#tag EndConstant

	#tag Constant, Name = kNothingFound, Type = String, Dynamic = True, Default = \"Nothing found.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Nothing found."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Niets gevonden."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ingenting hittat."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Nichts gefunden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aucune correspondance."
	#tag EndConstant

	#tag Constant, Name = kServiceUnavailable, Type = String, Dynamic = True, Default = \"Service Unavailable", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Service Unavailable"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Dienst niet beschikbaar"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Tj\xC3\xA4nsten \xC3\xA4r inte tillg\xC3\xA4nglig"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Dienst nicht verf\xC3\xBCgbar"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Service non disponible"
	#tag EndConstant

	#tag Constant, Name = msgDatabaseError, Type = String, Dynamic = True, Default = \"Database Error", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Database Error"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Database fout"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Databasfel"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Datenbank Fehler"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Erreur de base de donn\xC3\xA9es"
	#tag EndConstant

	#tag Constant, Name = msgDBConnectionError, Type = String, Dynamic = True, Default = \"Failed to connect to the %s database.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Failed to connect to the %s database."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kon geen verbinding maken met de %s database."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kan inte ansluta till %s databas."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Verbindung zur Datenbank %s nicht m\xC3\xB6glich."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Impossible de se connecter \xC3\xA0 la %s base de donn\xC3\xA9es."
	#tag EndConstant

	#tag Constant, Name = msgIMDBApi, Type = String, Dynamic = True, Default = \"IMDb Api did not respond\x2C please try again later.\r\rWhile the IMDb Api did not work\x2C The MovieDB information has still been saved.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"IMDb Api did not respond\x2C please try again later.\r\rWhile the IMDb Api did not work\x2C The MovieDB information has still been saved."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"IMDb Api gaf geen antwoord\x2C probeer later opnieuw.\r\rAlhoewel de IMDb Api geen antwoord gaf\x2C de informatie van TMDB is wel opgeslagen."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"IMDb API svarade inte\x2C f\xC3\xB6rs\xC3\xB6k igen senare.\r\r\xC3\x84ven fast IMDb API inte fungerade har informationen fr\xC3\xA5n The MovieDB sparats."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Das IMDb API reagiert nicht\x2C bitte sp\xC3\xA4ter nochmal versuchen.\r\rSolange das API nicht funktioniert\x2C werden Informationen von \'The MovieDB\' beibehalten."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'API d\'IMDB n\'a pas r\xC3\xA9pondu\x2C veuillez essayer plus tard.\r\rBien que l\'API d\'IMDB ne fonctionne pas\x2C les informations de MovieDB ont \xC3\xA9t\xC3\xA9 sauvegard\xC3\xA9es."
	#tag EndConstant

	#tag Constant, Name = msgIMDBApiError, Type = String, Dynamic = True, Default = \"The unofficial IMDb API doesn\'t have this movie in it\'s database.\r\rIf this movie does exist in TMDb\x2C it\'ll still be scraped.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"The unofficial IMDb API doesn\'t have this movie in it\'s database.\r\rIf this movie does exist in TMDb\x2C it\'ll still be scraped."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De onoffici\xC3\xABle IMDb API heeft deze film niet in zijn database.\r\rAls de film wel bestaand in TMDb\x2C dan is die informatie wel gedownload."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Den inofficiella IMDb API:n har inte den h\xC3\xA4r filmen i sin databas.\r\rOm den h\xC3\xA4r filmen finns i TMDb kan den fortfarande uppdateras."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Das inoffizielle IMDb API f\xC3\xBChrt diesen Film nicht in der Datenbank.\r\rWenn der Film in der TMDb Datenbank gefunden wird\x2C werden diese Informationen genutzt."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'API non officielle d\'IMDB n\'a pas ce film dans sa base de donn\xC3\xA9s.\r\rSi le film existe sur TMDb\x2C il sera r\xC3\xA9cup\xC3\xA9r\xC3\xA9."
	#tag EndConstant

	#tag Constant, Name = msgInvalidContent, Type = String, Dynamic = True, Default = \"Invalid content found", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Invalid content found"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ongeldige inhoud gevonden"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ogiltligt inneh\xC3\xA5ll hittades"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ung\xC3\xBCltiger Inhalt gefunden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Contenu invalide trouv\xC3\xA9"
	#tag EndConstant

	#tag Constant, Name = msgNoID, Type = String, Dynamic = True, Default = \"I can\'t find a database ID for this item.\r\rPlease fetch metadata for this item first.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"I can\'t find a database ID for this item.\r\rPlease fetch metadata for this item first."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ik kan geen database ID vinden voor het geselecteerde voorwerp.\r\rDownload alstublieft eerst de metadata."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Det finns inget databas-ID f\xC3\xB6r det h\xC3\xA4r objektet.\r\rH\xC3\xA4mta metadata f\xC3\xB6r objektet f\xC3\xB6rst."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Es wurde hierf\xC3\xBCr keine Datenbank ID gefunden.\r\rBitte die Metadaten hierf\xC3\xBCr zuerst abfragen."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Je ne peux pas trouver une ID de base de donn\xC3\xA9es pour cet \xC3\xA9l\xC3\xA9ment.\r\rMerci de r\xC3\xA9cup\xC3\xA9rer tout d\'abord les Metadatas pour cet \xC3\xA9l\xC3\xA9ment."
	#tag EndConstant

	#tag Constant, Name = msgNoIDMovie, Type = String, Dynamic = True, Default = \"I do not know which movie this is.\r\rPlease fetch metadata for this movie first.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"I do not know which movie this is.\r\rPlease fetch metadata for this movie first."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ik weet niet welke film dit is.\r\rDownload alstublieft eerst de metadata voor deze film."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"K\xC3\xA4nner inte igen den h\xC3\xA4r filmen.\r\rH\xC3\xA4mta metadata f\xC3\xB6r den h\xC3\xA4r filmen f\xC3\xB6rst."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Der Filmtitel wurde nicht erkannt!\r\rBitte eine manuelle Suche durchf\xC3\xBChren und den Titel anpassen."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Je ne connais pas ce film.\r\rMerci de r\xC3\xA9cup\xC3\xA9rer tout d\'abord les Metadatas pour cet \xC3\xA9l\xC3\xA9ment."
	#tag EndConstant

	#tag Constant, Name = msgPriorArtDeletion, Type = String, Dynamic = True, Default = \"Would you like to replace your existing images with newly downloaded images\x2C or only download missing images\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Would you like to replace your existing images with newly downloaded images\x2C or only download missing images\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wil je de bestaande afbeeldingen vervangen door nieuwe afbeeldings\x2C of alleen de ontbrekende plaatjes downloaden\?"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Vill du ers\xC3\xA4tta dina befintliga bilder med nya nedladdade bilder\x2C eller vill du endast ladda ner saknade bilder\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sollen die existierenden Extras durch die neu heruntergeladenen Extras ersetzt werden oder sollen nur die fehlenden Extras heruntergeladen werden\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Voulez-vous remplacer les images actuelles par des \xC3\xA9l\xC3\xA9ments plus r\xC3\xA9cents\x2C ou seulement t\xC3\xA9l\xC3\xA9charger les images manquantes \?"
	#tag EndConstant

	#tag Constant, Name = msgPriorMovieArtFound, Type = String, Dynamic = True, Default = \"ViMediaManager has found existing image files for \'<movie>\'.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"ViMediaManager has found existing images for \'<movie>\'."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"ViMediaManager heeft al bestaande afbeeldingen gevonden voor \'<movie>\'."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"ViMediaManager har hittat befintliga bildfiler f\xC3\xB6r \'<movie>\'"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"ViMediaManager hat f\xC3\xBCr \'<movie>\' bereits existierende Extras gefunden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"ViMediaManager a trouv\xC3\xA9 une image existante pour le film \'<movie>\'."
	#tag EndConstant

	#tag Constant, Name = msgTMDBConnectionError, Type = String, Dynamic = True, Default = \"Failed to connect to <database>.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Failed to connect to <database>."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kon geen verbinding maken met <database>."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kan inte ansluta till <database>."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Verbindung zur Datenbank <database> nicht m\xC3\xB6glich."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Impossible de se connecter \xC3\xA0 <database>."
	#tag EndConstant


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

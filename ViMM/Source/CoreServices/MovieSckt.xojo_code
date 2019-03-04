#tag Class
Protected Class MovieSckt
Inherits HTTPSocket
	#tag Event
		Sub Error(code as integer)
		  
		  If CommonCore.MassSearch Then
		    CommonCore.UnfoundTitles.Append "HTTP Error: " + str(code) + " occured."
		    CommonCore.UnfoundPaths.Append  MovieAttr.FolderParent
		  End If
		  
		  SocketError( code, Me )
		  
		  Exception err as NilObjectException
		    Me.Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  Dim Progress as String = BytesToString( bytesReceived ) + Loc.k1of2 + BytesToString( totalBytes )
		  dlgProgress.Debug( Progress )
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GetArt(ID as String, Title as String)
		  Dim Info as String = "GetArt( " + ID + ", " + Title + " ) - "
		  
		  Dim Sckt as New MovieSckt
		  Dim JSONString as String
		  
		  Dim CacheID as String = MovieAttr.ID_IMDB
		  If CacheID = "" Then CacheID = MovieAttr.ID_TMDB
		  
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage")
		  If Lang = "gb" Then Lang = "en"
		  
		  Dim TimeOut as Integer = Preferences.Prefs.integerForKey("TimeOut")
		  
		  Dim Count as Integer = 1
		  
		  If NOT CommonCore.MassSearch Then
		    dlgProgress.Reset
		  Else
		    Count = -1
		  End If
		  
		  Dim bFanartTV as Boolean = Preferences.Prefs.boolForKey("AutoDownloadClearArt") Or _
		  Preferences.Prefs.boolForKey("AutoDownloadLogo") Or _
		  Preferences.Prefs.boolForKey("AutoDownloadDiscArt") Or _
		  Preferences.Prefs.boolForKey("AutoDownloadThumb") Or _
		  Preferences.Prefs.boolForKey("AutoDownloadBanner") Or _
		  Preferences.Prefs.boolForKey("AutoDownloadBackdrop")
		  
		  If NOT Preferences.Prefs.boolForKey("FanartTVEnabled") Then bFanartTV = False
		  
		  Dim bTMDB as Boolean = Preferences.Prefs.boolForKey("AutoDownloadBackdrop") OR Preferences.Prefs.boolForKey("AutoDownloadPoster")
		  
		  
		  // :1 ## Get TMDB Info
		  App.ErrorMessage = Info + "Get TMDB Info"
		  If NOT CommonCore.MassSearch Then
		    dlgProgress.Update( Loc.kDownloading + ":", "[TMDB] " + Loc.kImages.Titlecase + " " + Loc.kReadingInfo.Lowercase + "...", Count, 12 )
		  Else
		    dlgProgress.Debug( Loc.kDownloading + " " + Loc.kImages + " " + Loc.mTabInfo.Lowercase + "..." )
		  End If
		  If bTMDB Then JSONString = DefineEncoding( Sckt.Get( URL( "MovieImages", ID, Lang ), TimeOut ), Encodings.UTF8 )
		  Sckt.Close
		  
		  Dim TMDB_Art as New JSONItem
		  If bTMDB And JSONString.ValidJSON( "TMDB Art" ) Then TMDB_Art.Load( JSONString )
		  JSONString = ""
		  
		  
		  Dim TMDB_Backdrops as New JSONItem
		  Dim TMDB_Posters   as New JSONItem
		  If TMDB_Art <> Nil And TMDB_Art.HasName("backdrops") Then TMDB_Backdrops = TMDB_Art.Child("backdrops")
		  If TMDB_Art <> Nil And TMDB_Art.HasName("posters")   Then TMDB_Posters   = TMDB_Art.Child("posters")
		  
		  
		  
		  Count = Count +1
		  // :2 ## FanartTV
		  If bFanartTV Then
		    App.ErrorMessage = Info + "Get FanartTV Info"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", "[Fanart.TV] " + Loc.kImages.Titlecase + " " + Loc.kReadingInfo.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kImages + " " + Loc.mTabInfo.Lowercase + "..." )
		    End If
		    If bFanartTV Then JSONString = Trim( DefineEncoding( Sckt.Get( URLCore.FanartTV( ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		    Sckt.Close
		    
		    'If JSONString <> "" Then
		    'Dim FirstBracketLoc as Integer = JSONString.InStr( 2, "{" )
		    'JSONString = JSONString.Right( JSONString.Len - FirstBracketLoc + 1)
		    'End If
		    
		    Dim FanartTV as New JSONItem
		    If bFanartTV And JSONString.ValidJSON( "FanartTV" ) Then FanartTV.Load( JSONString )
		    JSONString = ""
		    
		    
		    Dim FanartTV_Logos       as New JSONItem
		    Dim FanartTV_HDLogos     as New JSONItem
		    Dim FanartTV_ClearArt    as New JSONItem
		    Dim FanartTV_HDClearArt  as New JSONItem
		    Dim FanartTV_Thumb       as New JSONItem
		    Dim FanartTV_Banner      as New JSONItem
		    Dim FanartTV_Disc        as New JSONItem
		    Dim FanartTV_Fanart      as New JSONItem
		    
		    If FanartTV.HasName("movielogo")       Then FanartTV_Logos      = FanartTV.Child("movielogo")
		    If FanartTV.HasName("hdmovielogo")     Then FanartTV_HDLogos    = FanartTV.Child("hdmovielogo")
		    If FanartTV.HasName("movieart")        Then FanartTV_ClearArt   = FanartTV.Child("movieart")
		    If FanartTV.HasName("hdmovieclearart") Then FanartTV_HDClearArt = FanartTV.Child("hdmovieclearart")
		    If FanartTV.HasName("moviethumb")      Then FanartTV_Thumb      = FanartTV.Child("moviethumb")
		    If FanartTV.HasName("moviebanner")     Then FanartTV_Banner     = FanartTV.Child("moviebanner")
		    If FanartTV.HasName("moviedisc")       Then FanartTV_Disc       = FanartTV.Child("moviedisc")
		    If FanartTV.HasName("moviebackground") Then FanartTV_Fanart     = FanartTV.Child("moviebackground")
		    
		    
		    Count = Count +1
		    // :3 ## Posters
		    App.ErrorMessage = Info + "Get TMDb Posters"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kPoster + " " + Loc.kImage.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kPoster + " " + Loc.kImage.Lowercase + "..." )
		    End If
		    
		    If TMDB_Posters <> Nil Then
		      Dim FirstPosterURL as String
		      
		      For i as Integer = 0 to TMDB_Posters.Count -1
		        Dim jItem as New JSONItem
		        jItem = TMDB_Posters.Child(i)
		        
		        If jItem.Value("file_path") = "" Then Continue
		        
		        If FirstPosterURL = "" And ( jItem.Value("iso_639_1") = Lang OR jItem.Value("iso_639_1") = "" ) Then
		          FirstPosterURL = URLbase_image + Preferences.Prefs.stringForKey( "PosterSize" ) + jItem.Value("file_path")
		        End If
		        
		        MovieAttr.ART_PosterURLs.Append       URLbase_image + "original" + jItem.Value("file_path")
		        MovieAttr.ART_PosterThumbURLs.Append  URLbase_image + "w92" + jItem.Value("file_path")
		        MovieAttr.ART_PosterDimensions.Append jItem.Value("width") + "x" + jItem.Value("height")
		      Next
		      
		      // First Poster
		      Dim DestPoster as FolderItem = MovieAttr.DestinationPoster( MovieAttr.FolderParent )
		      If FirstPosterURL = "" And MovieAttr.ART_PosterURLs.Ubound > -1 Then FirstPosterURL = MovieAttr.ART_PosterURLs(0)
		      If Preferences.Prefs.boolForKey("AutoDownloadPoster") And FirstPosterURL <> "" And DestPoster <> Nil And NOT DestPoster.Exists Then
		        MovieAttr.ART_Poster = URL2Picture( FirstPosterURL, DestPoster.Parent, DestPoster.Name )
		        CacheImageSet( MovieAttr.ART_Poster, CacheID + ".movie.poster.jpg" )
		      End If
		    End If
		    
		    
		    Count = Count + 1
		    // :4 ## Backdrops
		    App.ErrorMessage = Info + "Get TMDb Backdrops"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kFanart + " " + Loc.kImage.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kFanart + " " + Loc.kImage.Lowercase + "..." )
		    End If
		    
		    // TMDB Fanarts
		    Dim FirstBackdropURL as String
		    
		    If TMDB_Backdrops <> Nil Then
		      
		      For i as Integer = 0 to TMDB_Backdrops.Count -1
		        Dim jItem as New JSONItem
		        jItem = TMDB_Backdrops.Child(i)
		        
		        If jItem.Value("file_path") = "" Then Continue
		        
		        If FirstBackdropURL = "" And ( jItem.Value("iso_639_1") = Lang OR jItem.Value("iso_639_1") = "" ) Then
		          FirstBackdropURL = URLbase_image + Preferences.Prefs.stringForKey( "FanartSize" ) + jItem.Value("file_path")
		        End If
		        
		        MovieAttr.ART_FanartURLs.Append       URLbase_image + "original" + jItem.Value("file_path")
		        MovieAttr.ART_FanartThumbURLs.Append  URLbase_image + "w300" + jItem.Value("file_path")
		        MovieAttr.ART_FanartDimensions.Append jItem.Value("width") + "x" + jItem.Value("height")
		      Next
		      
		    End If
		    
		    // FanartTV Fanarts
		    App.ErrorMessage = Info + "Get FanartTV Fanarts"
		    If FanartTV_Fanart <> Nil Then
		      For i as Integer = 0 to FanartTV_Fanart.Count -1
		        
		        MovieAttr.ART_FanartURLs.Append       FanartTV_Fanart.Child(i).Value("url")
		        MovieAttr.ART_FanartThumbURLs.Append  FanartTV_Fanart.Child(i).Value("url") + "/preview"
		        MovieAttr.ART_FanartDimensions.Append "1920x1080"
		      Next
		    End If
		    
		    // First Fanart
		    Dim DestFanart as FolderItem = MovieAttr.DestinationFanart( MovieAttr.FolderParent )
		    If FirstBackdropURL= "" And MovieAttr.ART_FanartURLs.Ubound > -1 Then FirstBackdropURL = MovieAttr.ART_FanartURLs(0)
		    If Preferences.Prefs.boolForKey("AutoDownloadBackdrop") And FirstBackdropURL <> "" And DestFanart <> Nil And NOT DestFanart.Exists Then
		      MovieAttr.ART_Poster = URL2Picture( FirstBackdropURL, DestFanart.Parent, DestFanart.Name )
		      CacheImageSet( MovieAttr.ART_Poster, CacheID + ".movie.fanart.jpg" )
		    End If
		    
		    
		    
		    Count = Count + 1
		    // :5 ## First Logo
		    App.ErrorMessage = Info + "Get Logos"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kLogo + " " + Loc.kImage.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kLogo + " " + Loc.kImage.Lowercase + "..." )
		    End If
		    
		    If Preferences.Prefs.boolForKey("AutoDownloadLogo") And NOT MovieAttr.FolderParent.Child("logo.png").Exists Then
		      Dim FirstLogo as String
		      
		      if FanartTV_HDLogos <> Nil And FanartTV_HDLogos.Count > 0 Then
		        For i as Integer = 0 to FanartTV_HDLogos.Count -1
		          If FirstLogo = "" And FanartTV_HDLogos.Child(i).Value("lang") = Lang Then FirstLogo = FanartTV_HDLogos.Child(i).Value("url")
		        Next
		        'if FirstLogo = "" Then FirstLogo = FanartTV_HDLogos.Child(0).Value("url")
		      End If
		      
		      If FanartTV_Logos <> Nil And FanartTV_Logos.Count > 0 Then
		        For i as Integer = 0 to FanartTV_Logos.Count -1
		          If FirstLogo = "" And FanartTV_Logos.Child(i).Value("lang") = Lang Then FirstLogo = FanartTV_Logos.Child(i).Value("url")
		        Next
		      End If
		      'If FirstLogo = "" Then FirstLogo = FanartTV_Logos.Child(0).Value("url")
		      If FirstLogo = "" And FanartTV_HDLogos <> Nil And FanartTV_HDLogos.Count > 0 Then FirstLogo = FanartTV_HDLogos.Child(0).Value("url")
		      If FirstLogo = "" And FanartTV_Logos <> Nil And FanartTV_Logos.Count   > 0 Then FirstLogo = FanartTV_Logos.Child(0).Value("url")
		      
		      If FirstLogo <> "" Then URL2Picture( FirstLogo, MovieAttr.FolderParent, "logo.png" )
		    End If
		    
		    
		    Count = Count + 1
		    // :6 ## First ClearArt
		    App.ErrorMessage = Info + "Get ClearArt"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kClearArt + " " + Loc.kImage.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kClearArt + " " + Loc.kImage.Lowercase + "..." )
		    End If
		    
		    If Preferences.Prefs.boolForKey("AutoDownloadClearArt") And NOT MovieAttr.FolderParent.Child("clearart.png").Exists Then
		      Dim FirstClearArt as String
		      
		      If FanartTV_HDClearArt <> Nil And FanartTV_HDClearArt.Count > 0 Then
		        For i as Integer = 0 to FanartTV_HDClearArt.Count -1
		          If FirstClearArt = "" And FanartTV_HDClearArt.Child(i).Value("lang") = Lang Then FirstClearArt = FanartTV_HDClearArt.Child(i).Value("url")
		        Next
		        
		      End If
		      
		      If FirstClearArt = "" And FanartTV_ClearArt <> Nil And FanartTV_ClearArt.Count > 0 Then
		        For i as Integer = 0 to FanartTV_ClearArt.Count -1
		          If FirstClearArt = "" And FanartTV_ClearArt.Child(i).Value("lang") = Lang Then FirstClearArt = FanartTV_ClearArt.Child(i).Value("url")
		        Next
		        'If FirstClearArt = "" Then FirstClearArt = FanartTV_ClearArt.Child(0).Value("url")
		      End If
		      
		      If FirstClearArt = "" And FanartTV_HDClearArt <> Nil And FanartTV_HDClearArt.Count > 0 Then FirstClearArt = FanartTV_HDClearArt.Child(0).Value("url")
		      If FirstClearArt = "" And FanartTV_ClearArt <> Nil And FanartTV_ClearArt.Count > 0 Then FirstClearArt = FanartTV_ClearArt.Child(0).Value("url")
		      
		      If FirstClearArt <> "" Then URL2Picture( FirstClearArt, MovieAttr.FolderParent, "clearart.png" )
		    End If
		    
		    
		    Count = Count + 1
		    // :7 ## First Thumb
		    App.ErrorMessage = Info + "Get Thumb"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kThumb + " " + Loc.kImage.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kThumb + " " + Loc.kImage.Lowercase + "..." )
		    End If
		    
		    If Preferences.Prefs.boolForKey("AutoDownloadThumb") And NOT MovieAttr.FolderParent.Child("landscape.jpg").Exists Then
		      Dim FirstThumb as String
		      
		      If FanartTV_Thumb <> Nil And FanartTV_Thumb.Count > 0 Then
		        For i as Integer = 0 to FanartTV_Thumb.Count -1
		          If FirstThumb = "" And FanartTV_Thumb.Child(i).Value("lang") = Lang Then FirstThumb = FanartTV_Thumb.Child(i).Value("url")
		        Next
		        If FirstThumb = "" Then FirstThumb = FanartTV_Thumb.Child(0).Value("url")
		      End If
		      
		      If FirstThumb <> "" Then URL2Picture( FirstThumb, MovieAttr.FolderParent, "landscape.jpg" )
		    End If
		    
		    
		    Count = Count + 1
		    // :8 ## First Banner
		    App.ErrorMessage = Info + "Get Banner"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kBanner + " " + Loc.kImage.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kBanner + " " + Loc.kImage.Lowercase + "..." )
		    End If
		    
		    Dim BannerFile as FolderItem = FindImageBanner( MovieAttr.FolderParent )
		    If BannerFile = Nil Then BannerFile = MovieAttr.DestinationBanner( MovieAttr.FolderParent )
		    
		    If Preferences.Prefs.boolForKey("AutoDownloadBanner") And NOT BannerFile.Exists Then
		      Dim FirstBanner as String
		      
		      If FanartTV_Banner <> Nil And FanartTV_Banner.Count > 0 Then
		        For i as Integer = 0 to FanartTV_Banner.Count -1
		          If FirstBanner = "" And FanartTV_Banner.Child(i).Value("lang") = Lang Then FirstBanner = FanartTV_Banner.Child(i).Value("url")
		        Next
		        If FirstBanner = "" Then FirstBanner = FanartTV_Banner.Child(0).Value("url")
		      End If
		      
		      If FirstBanner <> "" Then URL2Picture( FirstBanner, BannerFile.Parent, BannerFile.Name )
		    End If
		    
		    
		    Count = Count + 1
		    // :9 ## First Disc
		    App.ErrorMessage = Info + "Get DiscArt"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kDiscArt + " " + Loc.kImage.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kDiscArt + " " + Loc.kImage.Lowercase + "..." )
		    End If
		    
		    If Preferences.Prefs.boolForKey("AutoDownloadDiscArt") And NOT MovieAttr.FolderParent.Child("disc.png").Exists Then
		      Dim FirstDisc as String
		      
		      If FanartTV_Disc <> Nil And FanartTV_Disc.Count > 0 Then
		        For i as Integer = 0 to FanartTV_Disc.Count -1
		          If FirstDisc = "" And FanartTV_Disc.Child(i).Value("lang") = Lang Then FirstDisc = FanartTV_Disc.Child(i).Value("url")
		        Next
		        If FirstDisc = "" Then FirstDisc = FanartTV_Disc.Child(0).Value("url")
		      End If
		      
		      If FirstDisc <> "" Then URL2Picture( FirstDisc, MovieAttr.FolderParent, "disc.png" )
		    End If
		    
		    
		    Count = Count + 1
		    // :10 ## ExtraThumbs
		    App.ErrorMessage = Info + "Get ExtraThumbs"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kExtraThumbs + " " + Loc.kImages.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kExtraThumbs + " " + Loc.kImages.Lowercase + "..." )
		    End If
		    
		    If Preferences.Prefs.boolForKey("AutoDownloadExtraThumbs") And MovieAttr.FolderParent <> Nil ANd MovieAttr.FolderParent.Exists And MovieAttr.FolderParent.IsWriteable And NOT MovieAttr.FolderParent.FolderError Then
		      Dim Destination as FolderItem = MovieAttr.FolderParent.Child("extrathumbs")
		      If NOT Destination.Exists And DestFanart.IsWriteable And NOT DestFanart.FolderError Then Destination.CreateAsFolder
		      Dim n as Integer = 0
		      Dim Total as Integer = 0
		      
		      If Destination <> Nil And Destination.Exists And MovieAttr.ART_FanartURLs <> Nil And MovieAttr.ART_FanartURLs.Ubound > -1 Then
		        For i as Integer = 0 to MovieAttr.ART_FanartURLs.Ubound
		          If MovieAttr.ART_FanartURLs(i).InStr( 0, "original" ) > 0 Then Total = Total + 1
		        Next
		        
		        For i as Integer = 0 to MovieAttr.ART_FanartURLs.Ubound
		          If Preferences.Prefs.integerForKey( "MaxThumbs" ) > 0 And i = Preferences.Prefs.integerForKey( "MaxThumbs" ) Then Exit
		          
		          Dim Max as Integer = MovieAttr.ART_FanartURLs.Ubound + 1
		          If Preferences.Prefs.integerForKey( "MaxThumbs" ) > 0 And Preferences.Prefs.integerForKey( "MaxThumbs" ) < Max Then Max = Preferences.Prefs.integerForKey( "MaxThumbs" )
		          
		          If i > Max Then Exit
		          dlgProgress.Debug( Str( i + 1 ) + Loc.k1of2 + Str( Max ) + " " + Loc.kExtraThumbs + "..." )
		          
		          If MovieAttr.ART_FanartURLs(i).InStr( 0, "original" ) = 0 Then Continue
		          n = n + 1
		          If Destination.Child( "thumb" + str(n) + ".jpg" ).Exists Then Continue
		          
		          If MovieAttr.ART_FanartURLs.Ubound > -1 Then URL2Picture( MovieAttr.ART_FanartURLs(i).ReplaceAll("original", "w780"), Destination, "thumb" + Str(n) + ".jpg" )
		        Next
		      End If
		      
		    End If
		    
		    
		    Count = Count + 1
		    // :11 ## ExtraFanart
		    App.ErrorMessage = Info + "Get ExtraFanart"
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", Loc.kExtraFanarts + " " + Loc.kImage.Lowercase + "...", Count )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + Loc.kExtraFanarts + " " + Loc.kImage.Lowercase + "..." )
		    End If
		    
		    If Preferences.Prefs.boolForKey("AutoDownloadExtraFanart") Then
		      Dim Destination as FolderItem = MovieAttr.FolderParent.Child("extrafanart")
		      If NOT Destination.Exists Then Destination.CreateAsFolder
		      
		      If Destination <> Nil And Destination.Exists And MovieAttr.ART_FanartURLs <> Nil And MovieAttr.ART_FanartURLs.Ubound > -1 Then
		        
		        Dim Max as Integer = MovieAttr.ART_FanartURLs.Ubound + 1
		        If Preferences.Prefs.integerForKey( "MaxBackdrops" ) > 0 And Preferences.Prefs.integerForKey( "MaxBackdrops") < Max Then Max = Preferences.Prefs.integerForKey( "MaxBackdrops" )
		        
		        For i as Integer = 0 to MovieAttr.ART_FanartURLs.Ubound
		          If i >= Max Then Exit
		          
		          dlgProgress.Debug( Str( i + 1 ) + Loc.k1of2 + Str( Max ) + " " + Loc.kExtraFanarts + "..." )
		          
		          Dim Name() as String = MovieAttr.ART_FanartURLs(i).Split("/")
		          If Name.Ubound = -1 Then Continue
		          
		          Dim FileName as String = Name( Name.Ubound )
		          
		          If Destination.Child( FileName ).Exists Then Continue
		          
		          If MovieAttr.ART_FanartURLs.Ubound >= i Then URL2Picture( MovieAttr.ART_FanartURLs(i).ReplaceAll( "original", Preferences.Prefs.stringForKey( "FanartSize" ) ), Destination )
		        Next
		        
		      End If
		      
		    End If
		    
		  End If // @END bFanartTV = True
		  
		  
		  dlgProgress.Debug( "" )
		  App.ErrorMessage = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetMovieNFO(ID as String, Update as Boolean = False)
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  Dim Sckt as New MovieSckt
		  Sckt.Yield = True
		  'Sckt.Anonymouse
		  
		  Dim rand as New Random
		  Dim IP as String = Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) )
		  Sckt.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  Sckt.SetRequestHeader( "User-agent", "Mozilla/" + Str( rand.InRange(3,5) ) + "." + Str( rand.InRange(0,3) ) + " (Windows NT " + Str( rand.InRange(3,5) ) + "." + Str( rand.InRange(0,2) ) + "; rv:2.0.1) Gecko/20100101 Firefox/" + Str( rand.InRange(3,5) ) + ".0.1" )
		  
		  Dim MovieInfo as String = CurrentItemName + " " + Loc.mTabInfo.Lowercase + "..."
		  
		  // Temporary Save
		  Dim PrevTitle, PrevTitleSort, PrevTitleOriginal, PrevSet, PrevSetOrder, PrevTagline, PrevRipSource as String
		  dim prevGenres(), prevTags() as string
		  Dim PrevWatchedStatus as Boolean = MovieAttr.StatusWatched
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Resetting properties."
		  
		  If Update Then
		    PrevTitle         = MovieAttr.Title
		    PrevTitleSort     = MovieAttr.TitleSort
		    PrevTitleOriginal = MovieAttr.TitleOriginal
		    PrevTagline       = MovieAttr.DescriptionTagline
		    
		    for each genre as string in MovieAttr.Genres
		      prevGenres.Append genre
		    next
		    for each tag as string in MovieAttr.Tags
		      prevTags.Append tag
		    next
		    
		    PrevSet           = MovieAttr.Set
		    PrevSetOrder      = Str( MovieAttr.SetOrder )
		    PrevWatchedStatus = MovieAttr.StatusWatched
		    
		    PrevRipSource     = MovieAttr.RipSource
		  End If
		  
		  MovieAttr.ClearProperties
		  
		  If Update Then
		    MovieAttr.Title              = PrevTitle
		    MovieAttr.TitleSort          = PrevTitleSort
		    MovieAttr.TitleOriginal      = PrevTitleOriginal
		    MovieAttr.DescriptionTagline = PrevTagline
		    
		    MovieAttr.Genres   = PrevGenres
		    MovieAttr.Set      = PrevSet
		    MovieAttr.SetOrder = Val( PrevSetOrder )
		    MovieAttr.StatusWatched = PrevWatchedStatus
		    
		    MovieAttr.RipSource = PrevRipSource
		    
		    MovieAttr.Tags = PrevTags
		  End If
		  
		  
		  If NOT CommonCore.MassSearch Then dlgProgress.Reset
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Fathering Info"
		  // ## Gathering Info
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage").NthField( "-", 1 )
		  Dim TimeOut as Integer = Preferences.Prefs.integerForKey("TimeOut") / 2
		  Dim JSONString as String = ""
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - TMDb U.S."
		  // :1 ## TMDB U.S. Info
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TMDb] " + MovieInfo, 1, 20 ) Else dlgProgress.Debug( "[TMDb] " + MovieInfo )
		  JSONString = DefineEncoding( Sckt.Get( URL( "MovieInfo", ID, "en" ), TimeOut ), Encodings.UTF8 )
		  Sckt.Close
		  
		  // Got a valid response from TMDb?
		  Dim TMDBValid as Boolean = ( JSONString.InStr( 0, "Invalid id - The pre-requisite id is invalid or not found" ) = 0 AND JSONString <> "" )
		  
		  Dim TMDB_US as New JSONItem
		  If TMDBValid And JSONString.ValidJSON( "TMDb - Info" ) Then TMDB_US.Load( JSONString )
		  JSONString = ""
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - TMDb Localized: " + Lang
		  // :2 ## TMDB Localized Info
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TMDb Localised] " + MovieInfo ) Else dlgProgress.Debug( "[TMDb Localised] " + MovieInfo )
		  If TMDBValid And Lang <> "en" Then JSONString = DefineEncoding( Sckt.Get( URL( "MovieInfo", ID, Lang ), TimeOut ), Encodings.UTF8 )
		  Sckt.Close
		  
		  Dim TMDB_Local as New JSONItem
		  If TMDBValid And Lang <> "en" And JSONString.ValidJSON( "TMDb - Localised", True ) Then TMDB_Local.Load( JSONString )
		  JSONString = ""
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - TMDb Alternative Titles"
		  // :3 ## TMDB Alternative Titles
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TMDb Alt-Titles] " + MovieInfo ) Else dlgProgress.Debug( "[TDMB Alt-Titles] " + MovieInfo )
		  If TMDBValid Then JSONString = DefineEncoding( Sckt.Get( URL( "MovieAlternativeTitles", ID, "en" ), TimeOut), Encodings.UTF8 )
		  Sckt.Close
		  
		  Dim TMDB_AltTitles as New JSONItem
		  If TMDBValid And JSONString.ValidJSON( "TMDb Alt-Titles" ) Then TMDB_AltTitles.Load( JSONString )
		  JSONString = ""
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - TMDb Cast"
		  // :4 ## TMDB Cast
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TMDb Cast] " + MovieInfo ) Else dlgProgress.Debug( "[TMDb Cast] " + MovieInfo )
		  If TMDBValid Then JSONString = DefineEncoding( Sckt.Get( URL( "MovieCast", ID, "en" ), TimeOut), Encodings.UTF8 )
		  Sckt.Close
		  
		  Dim TMDB_Cast as New JSONItem
		  If TMDBValid And JSONString.ValidJSON( "TMDb Cast" ) Then TMDB_Cast.Load( JSONString )
		  JSONString = ""
		  
		  
		  // :5 ## TMDb Images
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - TMDb Releases"
		  // :6 ## TMDb Releases
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TMDb Releases] " + MovieInfo ) Else dlgProgress.Debug( "[TMDb Releases] " + MovieInfo )
		  If TMDBValid Then JSONString = DefineEncoding( Sckt.Get( URL( "MovieReleases", ID, "en" ), TimeOut ), Encodings.UTF8 )
		  Sckt.Close
		  
		  Dim TMDB_Releases as New JSONItem
		  If TMDBValid And JSONString.ValidJSON( "TMDb Releases" ) Then TMDB_Releases.Load( JSONString )
		  JSONString = ""
		  
		  
		  // :7 ## TMDB Trailers
		  'If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TMDB Trailers] " + MovieInfo ) Else dlgProgress.Debug( "[TMDB Trailers] " + MovieInfo )
		  'If TMDBValid Then JSONString = DefineEncoding( Sckt.Get( URL( "MovieTrailers", ID, "en" ), TimeOut ), Encodings.UTF8 )
		  'Sckt.Close
		  '
		  'Dim TMDB_Trailers as New JSONItem
		  'If TMDBValid And JSONString.ValidJSON( "TMDB Trailers" ) Then TMDB_Trailers.Load( JSONString )
		  'JSONString = ""
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - IMDb"
		  // :8 ## IMDb
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[IMDb] " + MovieInfo ) Else dlgProgress.Debug( "[IMDb] " + MovieInfo )
		  
		  Dim IMDbID as String = ID
		  If TMDB_US.HasName("imdb_id") Then IMDbID = TMDB_US.Value("imdb_id")
		  
		  Dim IMDb as New JSONItem
		  If IMDbID.Left(2) = "tt" Then IMDb = GetIMDbJSON( IMDbID )
		  
		  Dim Tomatoes as New JSONItem
		  If Preferences.Prefs.boolForKey("RTEnabled") Then
		    App.ErrorMessage = "Update: " + Str( Update ) + " - Rotten Tomatoes"
		    // :9 ## Rotten Tomatoes
		    If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[Rotten Tomatoes] " + MovieInfo ) Else dlgProgress.Debug( "[Rotten Tomatoes] " + MovieInfo )
		    If IMDbID.Left(2) = "tt"     Then JSONString = Trim( DefineEncoding( Sckt.Get( URLCore.RottenTomatoes( IMDbID.ReplaceAll( "tt", "" ), "Alias" ), TimeOut ), Encodings.UTF8 ) )
		    Sckt.Close
		    
		    If JSONString <> "" and JSONString.Left(1) = "{" Then
		      'Dim FirstBracketLoc as Integer = JSONString.InStr(0, "{" )
		      'JSONString = Trim( JSONString.Right( JSONString.Len - FirstBracketLoc + 1) )
		      If JSONString.ValidJSON( "Rotten Tomatoes" ) Then Tomatoes.Load( JSONString )
		    End If
		  End If
		  JSONString = ""
		  
		  
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Recommendations"
		  // :10 ## Recommendations
		  If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" And Preferences.Prefs.boolForKey("GetRecommendations") Then
		    
		    
		    If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[" + Loc.kRecMovies + "] " + MovieInfo ) Else dlgProgress.Debug( "[" + Loc.kRecMovies + "] " + MovieInfo )
		    
		    If Preferences.Prefs.boolForKey("RTEnabled") And Preferences.Prefs.boolForKey("RTRecsEnabled") Then
		      App.ErrorMessage = "Update: " + Str( Update ) + " - RottenTomatoes Recommendations"
		      // RottenTomatoes
		      If Tomatoes <> Nil And Tomatoes.HasName("id") And Tomatoes.Value("id") <> "" Then
		        dlgProgress.Debug( "Rotten Tomatoes " + Loc.kRecMovies + "..." )
		        
		        JSONString = DefineEncoding( Sckt.Get( URLCore.RottenTomatoes( Tomatoes.Value("id"), "Recommendations" ), TimeOut), Encodings.UTF8 )
		        Sckt.Close
		        
		        Dim TomatoesRecommendations as New JSONItem
		        If JSONString.ValidJSON("RT Recommendations") Then TomatoesRecommendations.Load( JSONString )
		        JSONString = ""
		        
		        If TomatoesRecommendations <> Nil And TomatoesRecommendations.HasName("movies") Then
		          For i as Integer = 0 to TomatoesRecommendations.Child("movies").Count -1
		            Dim jItem as New JSONItem
		            jItem = TomatoesRecommendations.Child("movies").Child(i)
		            
		            If jItem.HasName("title") And jItem.HasName("alternate_ids") And jItem.Child("alternate_ids").HasName("imdb") Then
		              MovieAttr.RecMovies.Append     jItem.Value("title")
		              MovieAttr.RecMoviesIDs.Append  "tt" + jItem.Child("alternate_ids").Value("imdb")' + " RottenTomatoes"
		              MovieAttr.RecMoviesSources.Append "RottenTomatoes"
		            End If
		            
		          Next
		        End If
		        
		      End If
		      
		    End If
		    
		    App.ErrorMessage = "Update: " + Str( Update ) + " - TMDb Recommendations"
		    // TMDB Recommendations
		    If Preferences.Prefs.integerForKey("TMDBRecommendations") > -1 Then
		      If TMDBValid Then JSONString = DefineEncoding( Sckt.Get( URL( "MovieRecommendations", ID, Lang ), TimeOut ), Encodings.UTF8 )
		      Sckt.Close
		      
		      Dim TMDB_Recommendations As New JSONItem
		      If TMDBValid And JSONString.ValidJSON( "TMDb Recommendations" ) Then TMDB_Recommendations.Load( JSONString )
		      JSONString = ""
		      
		      Dim Pages as Integer = -1
		      If TMDB_Recommendations.HasName("total_pages") Then Pages = TMDB_Recommendations.Value("total_pages")
		      If Preferences.Prefs.integerForKey("TMDBRecommendations") <> 0 And Pages > Preferences.Prefs.integerForKey("TMDBRecommendations") Then Pages = Preferences.Prefs.integerForKey("TMDBRecommendations")
		      
		      dlgProgress.Debug( "1" + Loc.k1of2 + Str( Pages ) + " Pages of TMDb " + Loc.kRecMovies )
		      
		      // Process Page 1
		      If TMDB_Recommendations.HasName("results") And TMDB_Recommendations.Count > 0 Then
		        For i as Integer = 0 to TMDB_Recommendations.Child("results").Count -1
		          Dim jItem as New JSONItem
		          If TMDB_Recommendations.Child("results").Value(i) <> Nil Then jItem = TMDB_Recommendations.Child("results").Value(i) Else Continue
		          
		          MovieAttr.RecMovies.Append     jItem.Value("title")
		          MovieAttr.RecMoviesIDs.Append  jItem.Value("id")
		          MovieAttr.RecMoviesSources.Append "TMDB"
		        Next
		      End If
		      
		      
		      // Process Page 2+
		      If Preferences.Prefs.integerForKey("TMDBRecommendations") > 1 Or Preferences.Prefs.integerForKey("TMDBRecommendations") = 0 Then
		        If TMDB_Recommendations.HasName("total_pages") Then
		          
		          
		          For i as Integer = 2 To Pages
		            dlgProgress.Debug( Str( i ) + Loc.k1of2 + Str( Pages ) + " " + Loc.kRecMovies )
		            App.ErrorMessage = "Update: " + Str( Update ) + " - TMDb Recommendations Page " + Str( i ) + " of " + Str( Pages )
		            
		            JSONString = ""
		            If TMDBValid Then JSONString = DefineEncoding( Sckt.Get( URL( "MovieRecommendations", ID, Lang, i ), TimeOut ), Encodings.UTF8 )
		            Sckt.Close
		            
		            Dim RecommendedPage as New JSONItem
		            If TMDBValid And JSONString.ValidJSON( "TMDb " + Loc.kRecMovies + " " + Str( i ) ) Then RecommendedPage.Load( JSONString )
		            JSONString = ""
		            
		            // Process Page results
		            If RecommendedPage <> Nil And RecommendedPage.HasName("results") And RecommendedPage.Child("results").Count > 0 Then
		              
		              For n as Integer = 0 to RecommendedPage.Child("results").Count - 1
		                Dim jItem as New JSONItem
		                If RecommendedPage.Child("results").Value(n) <> Nil Then jItem = RecommendedPage.Child("results").Value(n) Else Continue
		                
		                If jItem.HasName("title") And jItem.HasName("id") Then
		                  MovieAttr.RecMovies.Append     jItem.Value("title")
		                  MovieAttr.RecMoviesIDs.Append  jItem.Value("id")
		                  MovieAttr.RecMoviesSources.Append "TMDB"
		                End If
		                
		              Next
		              
		            End If
		          Next
		          
		        End If // @END RecommendedPages
		      End If // @END Preferences.Prefs.integerForKey("TMDBRecommendations") > 1
		      
		    End If // @END Preferences.Prefs.integerForKey("TMDBRecommendations") > 0
		    
		    
		    App.ErrorMessage = "Update: " + Str( Update ) + " - IMDb Recommendations"
		    // IMDb Recommendations
		    If IMDb <> Nil And IMDb.HasName("RECOMMENDATIONS") Then
		      dlgProgress.Debug( "IMDb " + Loc.kRecMovies + "..." )
		      
		      For i as Integer = 0 to IMDb.Child("RECOMMENDATIONS").Count -1
		        Dim RecTitle as String = Trim( RegExThis( IMDb.Child("RECOMMENDATIONS").Value(i), "\[.*\]", "" ) )
		        Dim RecID as String    = Trim( RegExThis( IMDb.Child("RECOMMENDATIONS").Value(i), ".*\[", "" ) ).ReplaceAll("]","")
		        If RecTitle = "" Then RecTitle = Loc.kNotAvailable
		        
		        MovieAttr.RecMovies.Append    RecTitle
		        MovieAttr.RecMoviesIDs.Append RecID
		        MovieAttr.RecMoviesSources.Append "IMDb"
		      Next
		    End If
		    
		    
		    JSONString = ""
		    App.ErrorMessage = "Update: " + Str( Update ) + " - TraktTV Recommendations"
		    If ID <> "" And Preferences.Prefs.stringForKey("Trakttv_Password") <> "" And Preferences.Prefs.stringForKey("Trakttv_UserName") <> "" Then 'And Preferences.Prefs.boolForKey("TraktTVEnabled") Then
		      dlgProgress.Debug( "TraktTV " + Loc.kRecMovies + "..." )
		      Dim TraktTV as New JSONItem
		      JSONString = Sckt.Get( URLCore.TraktTV( "MovieRelated", ID ), 30 )
		      If JSONString.ValidJSON("TraktTV", True) Then TraktTV.Load JSONString
		      
		      If TraktTV <> Nil And TraktTV.IsArray Then
		        For i as Integer = 0 to TraktTV.Count -1
		          Dim jItem as New JSONItem
		          jItem = TraktTV.Child(i)
		          If jItem <> Nil And jItem.HasName("title") And jItem.Value("title") <> "" And ( jItem.HasName("imdb_id") OR jItem.HasName("tmdb_id") ) Then
		            MovieAttr.RecMovies.Append jItem.Value("title")
		            If jItem.HasName("imdb_id") and jItem.Value("imdb_id") <> "" Then
		              MovieAttr.RecMoviesIDs.Append jItem.Value("imdb_id")
		            ElseIf jItem.HasName("tmdb_id") And jItem.Value("tmdb_id") <> "" Then
		              MovieAttr.RecMoviesIDs.Append jItem.Value("tmdb_id")
		            Else
		              MovieAttr.RecMoviesIDs.Append ""
		            End If
		            MovieAttr.RecMoviesSources.Append "Trakt.tv"
		          End If
		        Next
		      End If
		      
		    End If
		    
		  End If // @END NOT YAMJ & Get Recommendations
		  
		  dlgProgress.Debug("")
		  
		  
		  // ## ---- Process Information
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Information"
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kReadingInfo + ":", MovieInfo ) Else dlgProgress.Debug( Loc.kProcessing + " " + MovieInfo )
		  
		  If Lang = "en-gb" Then Lang = "GB"
		  If Lang.InStr(0, "en") > 0 Then Lang = "US" Else Lang = Lang.Uppercase
		  Dim IMDbEnabled as Boolean = ( IMDb <> Nil And Trim( IMDb.ToString ) <> "" )
		  
		  
		  // ## ID's
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process IDs"
		  If IMDbID.Left(2) = "tt"  Then MovieAttr.ID_IMDB = IMDbID
		  If TMDB_US.HasName("id")  Then MovieAttr.ID_TMDB = TMDB_US.Value("id")
		  If Tomatoes <> Nil And Tomatoes.HasName("id") Then MovieAttr.ID_RottenTomatoes = Tomatoes.Value("id")
		  
		  
		  // ## Title
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Title"
		  If NOT Update OR Trim( MovieAttr.Title ) = ""  Then
		    If TMDB_US <> Nil And TMDB_US.HasName("title") And TMDB_US.Value("title")    <> "" Then MovieAttr.Title = TMDB_US.Value("title")
		    
		    'If ( Lang <> "US" And Lang <> "GB" And MovieAttr.Title = "" ) or MovieAttr.Title = "" Then
		    If MovieAttr.Title = "" And IMDb <> Nil And IMDb.HasName("TITLE") And IMDb.Value("TITLE") <> "" Then MovieAttr.Title = IMDb.Value("TITLE")
		    'End If
		    
		    If TMDB_Local <> Nil And TMDB_Local.HasName("title") And TMDB_Local.Value("title") <> "" Then MovieAttr.Title = TMDB_Local.Value("title")
		  End If
		  
		  
		  // ## Localized Title
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Localized Title"
		  If NOT Update And Lang <> "US" And TMDB_AltTitles.HasName("titles") Then 'And Lang <> "GB"
		    For i as Integer = 0 to TMDB_AltTitles.Child("titles").Count -1
		      Dim jItem as New JSONItem
		      jItem = TMDB_AltTitles.Child("titles").Child(i)
		      If jItem.Value("iso_3166_1") = Lang And jItem.Value("title") <> "" Then
		        MovieAttr.Title = jItem.Value("title")
		        Exit
		      End If
		    Next
		  End If
		  
		  
		  // ## Original Title
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Original Title"
		  If NOT Update OR Trim( MovieAttr.TitleOriginal ) = "" Then
		    If TMDB_US.HasName("original_title") And TMDB_US.Value("original_title") <> "" Then MovieAttr.TitleOriginal = TMDB_US.Value("original_title")
		    'If Lang <> "US" And Lang <> "GB" And IMDb <> Nil And IMDb.HasName("TITLE")          And IMDb.Value("TITLE")          <> "" And Len( IMDb.Value("TITLE") ) >= Len( MovieAttr.TitleOriginal ) Then MovieAttr.TitleOriginal = IMDb.Value("TITLE")
		    If MovieAttr.TitleOriginal = "" And IMDb <> Nil And IMDb.HasName("ORIGINAL_TITLE") And IMDb.Value("ORIGINAL_TITLE") <> "" Then MovieAttr.TitleOriginal = IMDb.Value("ORIGINAL_TITLE")
		    
		    If MovieAttr.TitleOriginal = "" And MovieAttr.Title <> "" Then MovieAttr.TitleOriginal = MovieAttr.Title
		    If MovieAttr.Title = "" And MovieAttr.TitleOriginal <> "" Then MovieAttr.Title = MovieAttr.TitleOriginal
		  End If
		  
		  
		  // ## Sort Title
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Sort Title"
		  If NOT Update OR Trim( MovieAttr.TitleSort ) = "" Then MovieAttr.TitleSort = Articulator( MovieAttr.Title )
		  
		  
		  // ## Descriptions
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Descriptions"
		  // -- Plot
		  If TMDB_US.HasName("overview")    And TMDB_US.Value("overview")    <> "" Then MovieAttr.DescriptionPlot = TMDB_US.Value("overview")
		  If TMDB_Local.HasName("overview") And TMDB_Local.Value("overview") <> "" Then MovieAttr.DescriptionPlot = TMDB_Local.Value("overview")
		  
		  // -- Tagline
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Tagline"
		  If TMDB_US.HasName("tagline") and TMDB_US.Value("tagline") <> "" Then
		    MovieAttr.DescriptionTagline = TMDB_US.Value("tagline")
		    MovieAttr.DescriptionTaglines.Append TMDB_US.Value("tagline")
		  End If
		  
		  If TMDB_Local.HasName("tagline") and TMDB_Local.Value("tagline") <> "" Then
		    MovieAttr.DescriptionTagline = TMDB_Local.Value("tagline")
		    MovieAttr.DescriptionTaglines.Append TMDB_Local.Value("tagline")
		  End If
		  
		  // Extra Tagline(s)
		  If IMDb <> Nil And IMDb.HasName("TAGLINES") Then
		    For i as Integer = 0 to IMDb.Child("TAGLINES").Count -1
		      MovieAttr.DescriptionTaglines.Append  Trim( RegExThis( IMDb.Child("TAGLINES").Value(i), "\[.*\]", "" ) )
		    Next
		  End If
		  
		  MovieAttr.DescriptionTaglines = RemoveDuplicatesFromArray( MovieAttr.DescriptionTaglines )
		  If MovieAttr.DescriptionTagline = "" And MovieAttr.DescriptionTaglines.Ubound >= 0 Then MovieAttr.DescriptionTagline = MovieAttr.DescriptionTaglines(0)
		  
		  // -- Outline
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Outline"
		  If Lang = "US" OR Lang = "GB" Then
		    If IMDb <> Nil And IMDb.HasName("PLOT") And IMDb.Value("PLOT") <> "" And Len( IMDb.Value("PLOT") ) > Len( MovieAttr.DescriptionPlot ) Then MovieAttr.DescriptionPlot = IMDb.Value("PLOT")
		    If IMDb <> Nil And IMDb.HasName("STORYLINE") And IMDb.Value("STORYLINE") <> "" And _
		    Len( IMDb.Value("STORYLINE") ) > Len( MovieAttr.DescriptionPlot ) Then MovieAttr.DescriptionPlot = IMDb.Value("STORYLINE")
		    
		    // In case the storyline has been shortened, get the full version.
		    If IMDb <> Nil And IMDb.HasName("STORYLINES") And IMDb.Child("STORYLINES").Count > 0 And _
		    Len( IMDb.Child("STORYLINES").Value(0) ) > Len( MovieAttr.DescriptionPlot ) Then MovieAttr.DescriptionPlot = IMDb.Child("STORYLINES").Value(0)
		  End If
		  
		  
		  // If the outline hasn't been filled yet, take the localized plot, and shorten it.
		  If MovieAttr.DescriptionOutline = "" And MovieAttr.DescriptionPlot <> "" Then
		    Dim Outline as String = MovieAttr.DescriptionPlot
		    Dim sx1 as Integer = Outline.InStr( 200, "." )
		    Dim sx2 as Integer = Outline.InStr( sx1, "." ) // catch a second sentence.
		    If sx2 > 0 Then
		      Outline = Trim( Outline.Left( sx2 ) ) + ".."
		    ElseIf sx1 > 0 Then
		      Outline = Trim( Outline.Left( sx1 ) ) + ".."
		    End If
		    
		    MovieAttr.DescriptionOutline = Outline
		  End If
		  
		  
		  // ## Release Dates
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Release Dates"
		  If TMDB_US.HasName("release_date") Then MovieAttr.DatePremiered = TMDB_US.Value("release_date")
		  If TMDB_Local.HasName("release_date") Then MovieAttr.DatePremiered = TMDB_Local.Value("release_date")
		  If MovieAttr.DatePremiered <> "" Then MovieAttr.DateYear = Val( MovieAttr.DatePremiered.Left(4) )
		  If Tomatoes <> Nil And Tomatoes.HasName("release_dates") And Tomatoes.Child("release_dates").HasName("dvd") Then
		    MovieAttr.DateReleasedOnDVD = Tomatoes.Child("release_dates").Value("dvd")
		  End If
		  
		  If IMDb <> Nil And IMDb.HasName("RELEASE_DATE") And IMDb.Value("RELEASE_DATE") <> "" And IMDb.Value("RELEASE_DATE") <> "False" Then
		    MovieAttr.DatePremiered = _
		    IMDb.Value("RELEASE_DATE").StringValue.Right(4) + "-" + _ // Year -
		    Month2Int( Trim( RegExThis( IMDb.Value("RELEASE_DATE"), "[0-9]", "" ) ) ) + "-" + _ // Month -
		    IMDb.Value("RELEASE_DATE").StringValue.Left(2) // Day
		  End If
		  If IMDb <> Nil And IMDb.HasName("YEAR") And IMDb.Value("YEAR") <> "" THen MovieAttr.DateYear = IMDb.Value("YEAR")
		  
		  
		  
		  // ## MPAA
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process MPAA"
		  Dim MPAAExplanation as String
		  If IMDb <> Nil And IMDb.HasName("MPAA_RATING") And IMDb.Value("MPAA_RATING").StringValue.InStr( 0, " for " ) > 0 Then
		    MPAAExplanation = Trim( RegExThis( IMDb.Value("MPAA_RATING").StringValue, "RATED.*for ", "" ) )
		    MPAAExplanation = Trim( MPAAExplanation.ReplaceAll("(re-rating on appeal)","").ReplaceAll("on appeal","") )
		  End If
		  
		  // TMDB Certifications
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process TMDb Certifications"
		  If TMDB_Releases.HasName("countries") Then
		    Dim aCountries(), aMPAA() as String
		    
		    For i as Integer = 0 to TMDB_Releases.Child("countries").Count -1
		      Dim jItem as New JSONItem
		      jItem = TMDB_Releases.Child("countries").Child(i)
		      
		      aCountries.Append jItem.Value("iso_3166_1")
		      aMPAA.Append      jItem.Value("certification")
		      
		      // U.S.
		      If jItem.Value("iso_3166_1") = "US" Then
		        If MovieAttr.DatePremiered = "" Then MovieAttr.DatePremiered = jItem.Value("release_date")
		        If Trim( jItem.Value("certification") ) <> "" And MovieAttr.RatingMPAA = "" Then MovieAttr.RatingMPAA = MPAAFromCountry( jItem.Value("certification"), "US" )
		      End If
		      
		      // Local
		      If jItem.Value("iso_3166_1") = Lang Then
		        MovieAttr.DatePremiered = jItem.Value("release_date")
		        If Trim( jItem.Value("certification") ) <> "" Then MovieAttr.RatingMPAA = MPAAFromCountry( jItem.Value("certification"), Lang )
		      End If
		      
		    Next // @END ReleaseCountries.count
		    
		    For i as Integer = 0 to aCountries.Ubound
		      If aMPAA(i) <> "" Then MovieAttr.RatingCertification.Append FlagCountry( aCountries(i) ) + ":" + aMPAA(i)
		    Next
		  End If // @END TMDB_Releases.HasName("countries")
		  
		  // IMDb Certifications
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process IMDb Certifications"
		  If IMDb <> Nil And IMDb.HasName("CERTIFICATIONS") Then
		    For i as Integer = 0 To IMDb.Child("CERTIFICATIONS").Count -1
		      MovieAttr.RatingCertification.Append IMDb.Child("CERTIFICATIONS").Value(i)
		    Next
		  End If
		  
		  MovieAttr.RatingCertification = RemoveDuplicatesFromArray( MovieAttr.RatingCertification )
		  
		  If MovieAttr.RatingMPAA = "" And IMDb <> Nil And IMDb.HasName("MPAA_RATING") Then
		    MovieAttr.RatingMPAA = Trim( IMDb.Value("MPAA_RATING").StringValue.Left( IMDb.Value("MPAA_RATING").StringValue.InStrB( 0, " for " ) ) )
		    MovieAttr.RatingMPAA = MovieAttr.RatingMPAA.ReplaceAll("on appeal","")
		  End If
		  
		  // String 'em up together
		  If MPAAExplanation <> "" And MovieAttr.RatingMPAA <> "" Then MovieAttr.RatingMPAA = MovieAttr.RatingMPAA + " for " + MPAAExplanation + "."
		  
		  
		  // ## Rating
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Ratings"
		  
		  If Preferences.Prefs.stringForKey("PreferredRatings").Contains("TMDb") OR MovieAttr.Rating <= 0 Then
		    If TMDB_US.HasName("vote_average") Then MovieAttr.Rating      = Round( TMDB_US.Value( "vote_average" ) * 10 ) / 10
		    If TMDB_US.HasName("vote_count")   Then MovieAttr.RatingVotes = TMDB_US.Value("vote_count")
		  End If
		  
		  If Preferences.Prefs.stringForKey("PreferredRatings").Contains("IMDb") OR Preferences.Prefs.stringForKey("PreferredRatings") = "" OR MovieAttr.Rating <= 0 Then
		    If IMDb <> Nil And IMDb.HasName("RATING") And IMDb.Value("RATING").StringValue <> "" Then MovieAttr.Rating = IMDb.Value("RATING").DoubleValue
		    If IMDb <> Nil And IMDb.HasName("VOTES")  And IMDb.Value("VOTES").StringValue <> ""  Then MovieAttr.RatingVotes = Val( IMDb.Value("VOTES").StringValue.ReplaceAll(",","") )
		  End If
		  
		  // Top250
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Top250"
		  If IMDb <> Nil And IMDb.HasName("TOP_250") And IMDb.Value("TOP_250") > 0 Then MovieAttr.RatingTop250 = IMDb.Value("TOP_250")
		  
		  
		  // ## Genres
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Genres"
		  Dim TmpArray() as String
		  If TMDB_Local.HasName("genres") Then
		    TmpArray = JSONArray( TMDB_Local.Child("genres"), "name" )
		  ElseIf TMDB_US.HasName("genres") Then
		    TmpArray = JSONArray( TMDB_US.Child("genres"), "name" )
		  End If
		  
		  For i as Integer = 0 to TmpArray.Ubound
		    MovieAttr.Genres.Append TmpArray(i)
		  Next
		  
		  If IMDb <> Nil Then
		    If IMDbEnabled And IMDb.HasName("GENRES") And ( Lang = "US" OR Lang = "GB" ) Then
		      TmpArray = JSONArray( IMDb.Child("GENRES") )
		      For i as Integer = 0 to TmpArray.Ubound
		        MovieAttr.Genres.Append TmpArray(i).ReplaceAll("Sci-Fi", "Science-Fiction")
		      Next
		    End If
		  End If
		  
		  // Sort out doubles.
		  MovieAttr.Genres = RemoveDuplicatesFromArray( MovieAttr.Genres )
		  
		  // All Caps for Boxee
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then
		    For i as Integer = 0 To MovieAttr.Genres.Ubound
		      MovieAttr.Genres(i) = MovieAttr.Genres(i).Uppercase
		    Next
		  End If
		  
		  
		  // ## Studios
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Studios"
		  If Tomatoes <> Nil And Tomatoes.HasName("studio") And Tomatoes.Value("studio") <> "" Then MovieAttr.Studios.Append Tomatoes.Value("studio")
		  If TMDB_US.HasName("production_companies") Then MovieAttr.Studios = JSONArray( TMDB_US.Child("production_companies"), "name" )
		  If IMDb <> Nil And IMDb.HasName("STUDIOS") Then
		    For i as Integer = 0 to IMDb.Child("STUDIOS").Count -1
		      MovieAttr.Studios.Append IMDb.Child("STUDIOS").Value(i)
		    Next
		  End If
		  MovieAttr.Studios = RemoveDuplicatesFromArray( MovieAttr.Studios )
		  
		  
		  // ## Countries
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Countries"
		  If TMDB_US.HasName("production_countries") Then MovieAttr.Countries = JSONArray( TMDB_US.Child("production_countries"), "name" )
		  If IMDb <> Nil And IMDb.HasName("COUNTRY") Then
		    For i as Integer = 0 to IMDb.Child("COUNTRY").Count -1
		      MovieAttr.Countries.Append IMDb.Child("COUNTRY").Value(i)
		    Next
		  End If
		  MovieAttr.Countries = RemoveDuplicatesFromArray( MovieAttr.Countries )
		  
		  
		  // ## Spoken Languages
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Spoken Languages"
		  If TMDB_US.HasName("spoken_languages") Then
		    MovieAttr.LanguagesSpoken = JSONArray( TMDB_US.Child("spoken_languages"), "name" )
		    MovieAttr.LanguagesSpokenCode = JSONArray( TMDB_US.Child("spoken_languages"), "iso_639_1" )
		  End If
		  
		  If IMDb <> Nil And IMDb.HasName("LANGUAGE") Then
		    For i as Integer = 0 to IMDb.Child("LANGUAGE").Count -1
		      MovieAttr.LanguagesSpoken.Append IMDb.Child("LANGUAGE").Value(i)
		    Next
		  End If
		  MovieAttr.LanguagesSpoken = RemoveDuplicatesFromArray( MovieAttr.LanguagesSpoken )
		  
		  
		  // ## Runtime
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Runtime"
		  If TMDB_US.HasName("runtime") Then MovieAttr.InfoRuntime = Val( TMDB_US.Value("runtime").StringValue.ReplaceAll("Min","").ReplaceAll("Minutes","") )
		  
		  
		  // ## IMDb Stars
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process IMDb Stars"
		  If IMDb <> Nil And IMDb.HasName("STARS") Then MovieAttr.ActorStar = JSONArray( IMDb.Child("STARS") )
		  
		  
		  // ## Cast
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Cast"
		  If IMDb <> Nil And IMDb.HasName("CAST") And IMDb.HasName("ROLES") And IMDb.HasName("CASTTHUMBS") Then
		    App.ErrorMessage = "Update: " + Str( Update ) + " - Process IMDb Cast"
		    
		    For i as Integer = 0 to IMDb.Child("CAST").Count -1
		      
		      // Search cast ID if available.
		      If TMDB_Cast.HasName("cast") Then
		        Dim b as Boolean = False
		        For n as Integer = 0 to TMDB_Cast.Child("cast").Count -1
		          If TMDB_Cast.Child("cast").Child(n).Value("name") = IMDb.Child("CAST").Value(i) Then
		            MovieAttr.ActorID.Append TMDB_Cast.Child("cast").Child(n).Value("id")
		            b = True
		            Exit
		          End If
		        Next
		        If NOT b Then MovieAttr.ActorID.Append ""
		      Else
		        MovieAttr.ActorID.Append ""
		      End If
		      MovieAttr.ActorName.Append      IMDb.Child("CAST").Value(i)
		      MovieAttr.ActorRole.Append      IMDb.Child("ROLES").Value(i)
		      MovieAttr.ActorThumbURL.Append  IMDb.Child("CASTTHUMBS").Value(i)
		    Next
		    
		  ElseIf TMDB_Cast.HasName("cast") Then
		    App.ErrorMessage = "Update: " + Str( Update ) + " - Process TMDb Cast"
		    For i as Integer = 0 to TMDB_Cast.Child("cast").Count - 1
		      Dim jItem as New JSONItem
		      jItem = TMDB_Cast.Child("cast").Child(i)
		      
		      MovieAttr.ActorID.Append   jItem.value("id")
		      MovieAttr.ActorName.Append jItem.Value("name")
		      MovieAttr.ActorRole.Append jItem.Value("character")
		      If jItem.Value("profile_path") = "" Then MovieAttr.ActorThumbURL.Append "" Else MovieAttr.ActorThumbURL.Append URLbase_image + "w342" + jItem.Value("profile_path")
		    Next
		  End If
		  
		  
		  // ## Crew
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process TMDb Crew"
		  Dim TmpDirectors(), TmpWriters(), TmpCamera() as String
		  
		  If TMDB_Cast.HasName("crew") Then
		    For i as Integer = 0 to TMDB_Cast.Child("crew").Count -1
		      Dim jItem as New JSONItem
		      jItem = TMDB_Cast.Child("crew").Child(i)
		      
		      If jItem.Value("department") = "Directing" Then TmpDirectors.Append jItem.Value("name")
		      If jItem.Value("department") = "Writing"   Then TmpWriters.Append   jItem.Value("name")
		      If jItem.Value("department") = "Camera"    Then TmpCamera.Append    jItem.Value("name")
		      
		      If jItem.Value("department") = "Sound" OR jItem.Value("department") = "Music" Then
		        If MovieAttr.CreditMusic = "" Then
		          MovieAttr.CreditMusic = jItem.Value("name")
		        Else
		          MovieAttr.CreditMusic = MovieAttr.CreditMusic + ", " + jItem.Value("name")
		        End If
		      End If
		      
		    Next // @END Crew.Count
		  End If // @END Crew
		  
		  // IMDb Directors
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process IMDb Directors"
		  If IMDb <> Nil And IMDb.HasName("DIRECTORS") Then
		    For i as Integer = 0 to IMDb.Child("DIRECTORS").Count -1
		      TmpDirectors.Append IMDb.Child("DIRECTORS").Value(i)
		    Next
		  End If
		  
		  // IMDb Writers
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process IMDb Writers"
		  If IMDb <> Nil And IMDb.HasName("WRITERS") Then
		    For i as Integer = 0 to IMDb.Child("WRITERS").Count -1
		      TmpWriters.Append IMDb.Child("WRITERS").Value(i)
		    Next
		  End If
		  
		  
		  TmpDirectors = RemoveDuplicatesFromArray( TmpDirectors )
		  TmpWriters   = RemoveDuplicatesFromArray(  TmpWriters  )
		  TmpCamera    = RemoveDuplicatesFromArray(   TmpCamera  )
		  
		  For i as Integer = 0 to TmpDirectors.Ubound
		    If MovieAttr.CreditDirector = "" Then
		      MovieAttr.CreditDirector = TmpDirectors(i)
		    Else
		      MovieAttr.CreditDirector = MovieAttr.CreditDirector + ", " + TmpDirectors(i)
		    End If
		  Next
		  
		  For i as Integer = 0 to TmpWriters.Ubound
		    If MovieAttr.CreditWriter = "" Then
		      MovieAttr.CreditWriter = TmpWriters(i)
		    Else
		      MovieAttr.CreditWriter = MovieAttr.CreditWriter + ", " + TmpWriters(i)
		    End If
		  Next
		  
		  For i as Integer = 0 to TmpCamera.Ubound
		    If MovieAttr.CreditCamera = "" Then
		      MovieAttr.CreditCamera = TmpCamera(i)
		    Else
		      MovieAttr.CreditCamera = MovieAttr.CreditCamera + ", " + TmpCamera(i)
		    End If
		  Next
		  
		  
		  // ## RottenTomatoes
		  If Preferences.Prefs.boolForKey("RTEnabled") And Preferences.Prefs.boolForKey("RTRatingsEnabled") Then
		    App.ErrorMessage = "Update: " + Str( Update ) + " - Process Rotten Tomatoes Critics"
		    If Tomatoes <> Nil And Tomatoes.HasName("critics_consensus") Then MovieAttr.TomatoConcensus = Tomatoes.Value("critics_consensus")
		    If Tomatoes <> Nil And Tomatoes.HasName("ratings") Then
		      Dim jItem as New JSONItem
		      jItem = Tomatoes.Child("ratings")
		      
		      If jItem.HasName("critics_rating") Then MovieAttr.TomatoCriticsRating = jItem.Value("critics_rating")
		      If jItem.HasName("critics_score")  Then MovieAttr.TomatoCriticsScore  = jItem.Value("critics_score")
		      If Preferences.Prefs.stringForKey("PreferredRatings").Contains("Tomato") And Preferences.Prefs.stringForKey("PreferredRatings").Contains("Critics") And MovieAttr.TomatoCriticsScore > 0 Then
		        MovieAttr.RatingVotes = -1
		        MovieAttr.Rating = ( MovieAttr.TomatoCriticsScore / 10 )
		      End If
		      
		      If jItem.HasName("audience_rating") Then MovieAttr.TomatoAudienceRating = jItem.Value("audience_rating")
		      If jItem.HasName("audience_score")  Then MovieAttr.TomatoAudienceScore  = jItem.Value("audience_score")
		      If Preferences.Prefs.stringForKey("PreferredRatings").Contains("Tomato") And Preferences.Prefs.stringForKey("PreferredRatings").Contains("Audience") And MovieAttr.TomatoAudienceScore > 0 Then
		        MovieAttr.RatingVotes = -1
		        MovieAttr.Rating = ( MovieAttr.TomatoAudienceScore / 10 )
		      End If
		      
		    End If
		  End If
		  
		  
		  // ## Download actor images.
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Download Actor Images"
		  If Preferences.Prefs.boolForKey("AutoDownloadActorThumbs") Then
		    If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kActorThumbs + "..." ) Else dlgProgress.Debug( Loc.kDownloading + " " + Loc.kActorThumbs.Lowercase + "..." )
		    
		    App.ErrorMessage = ID + " -  Creating .actors folder"
		    If NOT MovieAttr.FolderParent.Child(".actors").Exists Then MovieAttr.FolderParent.Child(".actors").CreateAsFolder
		    
		    App.ErrorMessage = ID + " -  Remove pre-existing symlink folder"
		    dim symdest as FolderItem = MovieAttr.FolderParent.Child("actors")
		    symdest.Visible = True
		    
		    App.ErrorMessage = ID + " -  Creating symlink folder"
		    If SymLink( MovieAttr.FolderParent.Child( ".actors" ), MovieAttr.FolderParent.Child( "actors" ) ) Then
		      // Created symlink
		    End If
		    
		    App.ErrorMessage = ID + " -  Getting actors folder"
		    Dim ActorFolder as FolderItem = MovieAttr.FolderParent.Child(".actors")
		    If ActorFolder = Nil OR NOT ActorFolder.Exists Then ActorFolder = MovieAttr.FolderParent.Child("actors")
		    
		    App.ErrorMessage = ID + " -  Setting Max Actor Downloads"
		    Dim Max as Integer = MovieAttr.ActorThumbURL.Ubound
		    If Preferences.Prefs.integerForKey("MaxActors") > 0 And Preferences.Prefs.integerForKey("MaxActors") <= Max Then Max = Preferences.Prefs.integerForKey("MaxActors")
		    
		    If ActorFolder <> Nil And ActorFolder.Exists Then
		      For i as Integer = 0 to Max
		        App.ErrorMessage = ID + " - Actor Name: " + MovieAttr.ActorName(i).ReplaceAll(":","") + " " + Str( i ) + " of " + Str( Max )
		        Dim ActorFile as FolderItem = ActorFolder.Child( MovieAttr.ActorName(i).ReplaceAll(":","").ReplaceAll(" ", "_") + ".jpg" )
		        
		        
		        If MovieAttr.ActorThumbURL(i) <> "" And MovieAttr.ActorName(i) <> "" And NOT ActorFile.Exists Then
		          dlgProgress.Debug( "Downloading " + Str( i + 1 ) + Loc.k1of2 + Str( Max + 1 )  + " " + MovieAttr.ActorName(i) + " " + Loc.kThumb.Lowercase + "..." )
		          
		          App.ErrorMessage = App.ErrorMessage + Chr(13) + "Downloading: " + MovieAttr.ActorThumbURL(i) + chr(13) + "Destionation: " + ActorFile.ShellPath.ReplaceAll("\","")
		          URL2Picture( MovieAttr.ActorThumbURL(i), ActorFile.Parent, ActorFile.Name )
		          if ActorFile <> Nil and ActorFile.Exists then
		            MovieAttr.ActorThumbURL(i) = ActorFile.ShellPath.ReplaceAll("\", "")
		          end if
		          'If Sckt.Get( MovieAttr.ActorThumbURL(i), ActorFile, TimeOut ) Then
		          'MovieAttr.ActorThumbURL(i) = ActorFile.ShellPath.ReplaceAll( "\", "" )
		          'Else
		          'Sckt.Close
		          'If ActorFile IsA FolderItem Then ActorFile.Delete
		          'End If
		          'Sckt.Close
		          
		        ElseIf ActorFile.Exists Then
		          MovieAttr.ActorThumbURL(i) = ActorFile.ShellPath.ReplaceAll( "\", "" )
		        End If
		        
		      Next
		    End If
		    
		    dlgProgress.Debug ""
		  End If
		  
		  
		  // ## Get Art
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Download Images"
		  dlgProgress.Debug( loc.kDownloading + " " + Loc.kImages.Lowercase )
		  
		  GetArt( ID, MovieAttr.Title )
		  
		  // Get IMDb Poster
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Download IMDb Images"
		  If IMDb <> Nil And IMDb.HasName("POSTER_FULL") And IMDb.Value("POSTER_FULL").StringValue <> "" And IMDb.Value("POSTER_FULL").StringValue.InStr( 0, "scorecardresearch" ) = 0 Then
		    MovieAttr.ART_PosterURLs.Append       IMDb.Value("POSTER_FULL")
		    MovieAttr.ART_PosterThumbURLs.Append  IMDb.Value("POSTER_SMALL")
		    MovieAttr.ART_PosterDimensions.Append ""
		    
		    Dim PosterDest as FolderItem = MovieAttr.DestinationPoster( MovieAttr.FolderParent )
		    If PosterDest <> Nil And NOT PosterDest.Exists And Preferences.Prefs.boolForKey("AutoDownloadPoster") Then
		      'URL2Picture( IMDb.Value("POSTER_FULL"), MovieAttr.FolderParent, PosterDest.Name )
		      If Sckt.Get( IMDb.Value("POSTER_FULL"), PosterDest, TimeOut ) Then MovieAttr.ART_Poster = Picture.Open( PosterDest )
		      Sckt.Close
		    End If
		    
		  End If
		  
		  // ## Trailer Links
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Process Trailers"
		  Dim TrailerDict as Dictionary = MovieCore.MovieTrailers( ID )
		  
		  
		  // ## Write NFO
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Write NFO"
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kMetadata + ":", Loc.kWritingNFO ) Else dlgProgress.Debug( Loc.kWritingNFO ) // 17
		  MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		  
		  
		  
		  // Download trailer
		  App.ErrorMessage = "Update: " + Str( Update ) + " - Download Trailer"
		  If Preferences.Prefs.boolForKey("AutoDownloadTrailer") And TrailerDict <> Nil And FindTrailerItem( MovieAttr.FolderParent ) = Nil Then
		    
		    Dim FirstTrailerURL as String
		    Dim TrailerURLs(), TrailerQualities() as String
		    
		    For each Key as Variant in TrailerDict.Keys
		      'If FirstTrailerURL = "" Then FirstTrailerURL = Key
		      
		      TrailerURLs.Append Key
		      TrailerQualities.Append TrailerDict.Value( Key )
		    Next
		    
		    Dim pQuality as String = Preferences.Prefs.stringForKey("TrailerQuality")
		    Dim rQuality as String
		    If pQuality = "1080p" Then rQuality = "Large"
		    If pQuality = "720p" Then rQuality = "Medium"
		    If pQuality = "480p" Then rQuality = "Small"
		    
		    If Preferences.Prefs.stringForKey("TrailerSource") <> "" And pQuality <> "" Then
		      Dim SelTrailerURLs(), SelTrailerQualities() as String
		      
		      // Filter on trailer source
		      For i as Integer = 0 to TrailerURLs.Ubound
		        If TrailerURLs(i).Contains( Preferences.Prefs.stringForKey("TrailerSource") ) Then
		          If FirstTrailerURL = "" Then FirstTrailerURL = TrailerURLs(i)
		          
		          SelTrailerURLs.Append TrailerURLs(i)
		          SelTrailerQualities.Append TrailerQualities(i)
		        End If
		      Next
		      
		      // Filter on trailer qualities
		      For i as Integer = SelTrailerURLs.Ubound DownTo 0
		        If NOT SelTrailerQualities(i).Contains( pQuality ) And NOT SelTrailerQualities(i).Contains( rQuality ) Then
		          SelTrailerURLs.Remove(i)
		          SelTrailerQualities.Remove(i)
		        End If
		      Next
		      
		      // Set most suitable trailer
		      If SelTrailerURLs.Ubound >= 0 Then FirstTrailerURL = SelTrailerURLs(0)
		      
		      If FirstTrailerURL = "" And TrailerURLs.Ubound >= 0 Then
		        // Trailer source not found, try remaining trailer's qualities.
		        SelTrailerURLs = TrailerURLs
		        SelTrailerQualities = TrailerQualities
		        
		        For i as Integer = SelTrailerURLs.Ubound DownTo 0
		          If NOT SelTrailerQualities(i).Contains( pQuality ) And NOT SelTrailerQualities(i).Contains( rQuality ) Then
		            SelTrailerURLs.Remove(i)
		            SelTrailerQualities.Remove(i)
		          End If
		        Next
		        
		        If SelTrailerURLs.Ubound >= 0 Then FirstTrailerURL = SelTrailerURLs(0)
		        
		      End If
		      
		    End If // @END TrailerSource & TrailerQuality
		    
		    // Fallback
		    If FirstTrailerURL = "" And TrailerURLs.Ubound >= 0 Then FirstTrailerURL = TrailerURLs(0)
		    
		    
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Update( Loc.kDownloading + ":", MovieAttr.Title + " " + Loc.kTrailer.Lowercase + "...", 64, 100 )
		    Else
		      dlgProgress.Debug( Loc.kDownloading + " " + MovieAttr.Title + " " + Loc.kTrailer.Lowercase + "..." )
		    End If
		    
		    
		    Dim ScktTrailer as New TrailerSckt' = dlgProgress.ScktTrailer
		    ScktTrailer.Yield = True
		    
		    IP = Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) )
		    ScktTrailer.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		    ScktTrailer.SetRequestHeader( "User-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Safari/8536.25" ) // For Apple trailers
		    
		    Dim TmpTrailerFile as FolderItem = SpecialFolder.Temporary.Child( App.Identifier ).Child("Trailer.part")
		    
		    // Download trailer
		    If FirstTrailerURL <> "" And ScktTrailer.Get( FirstTrailerURL, TmpTrailerFile, 600 ) Then
		      
		      // Verify trailer file
		      If TmpTrailerFile.Length > 1024 Then
		        // Success!
		        If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then
		          TmpTrailerFile.MoveFileTo( MovieAttr.DestinationTrailer( MovieAttr.FolderParent, TmpTrailerFile ) )
		        End If
		        
		      Else
		        // Failure...
		        // Failure, try once more if possible.
		        FirstTrailerURL = ""
		        ScktTrailer.Close
		        Dim Content as String
		        If TmpTrailerFile IsA FolderItem Then Content = ReadTextFile( TmpTrailerFile )
		        If Content.InStr( 0, "The document has moved" ) > 0 Then FirstTrailerURL = Content.MyMid( "<A HREF=""", """>" ).ReplaceAll("&amp;", "&")
		        
		        If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.Delete
		        
		        If FirstTrailerURL <> "" And ScktTrailer.Get( FirstTrailerURL, TmpTrailerFile, 600 ) Then
		          If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.MoveFileTo( MovieAttr.DestinationTrailer( MovieAttr.FolderParent, TmpTrailerFile ) )
		        Else
		          If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.Delete
		        End If
		        
		      End If
		      
		    End If // @END TmpTrailerFile.length
		    
		    // Clean-up
		    ScktTrailer.Close
		    If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.Delete
		    
		  End If // @END TrailerSckt.Get
		  
		  'If Preferences.Prefs.boolForKey("AutoDownloadTrailer") And MovieAttr.TrailerURLs.Ubound >= 0 And NOT FindTrailerItem( MovieAttr.FolderParent ) IsA FolderItem Then
		  '
		  'Dim FirstTrailerURL as String' = MovieAttr.TrailerURLs(0)
		  'Dim TrailerSelection(), TrailerQualities() as String
		  '
		  'If Preferences.Prefs.stringForKey("TrailerSource") <> "" And Preferences.Prefs.stringForKey("TrailerQuality") <> "" Then 'And Preferences.Prefs.stringForKey("TrailerSource") <> "youtube.com" Then
		  '
		  '// Get all trailers from selected source
		  'For i as Integer = 0 to MovieAttr.TrailerURLs.Ubound
		  'If MovieAttr.TrailerURLs(i).InStr( 0, Preferences.Prefs.stringForKey("TrailerSource") ) > 0 Then
		  'TrailerSelection.Append MovieAttr.TrailerURLs(i)
		  'TrailerQualities.Append MovieAttr.TrailerQuality(i)
		  'End If
		  'Next
		  ''If TrailerSelection.Ubound >= 0 Then FirstTrailerURL = TrailerSelection(0) // Set first likely trailer to be downloaded.
		  '
		  'If TrailerSelection.Ubound = -1 Then
		  'For i as Integer = 0 to MovieAttr.TrailerURLs.Ubound
		  'TrailerSelection.Append MovieAttr.TrailerURLs(i)
		  'TrailerQualities.Append MovieAttr.TrailerQuality(i)
		  'Next
		  'End If
		  ''If TrailerSelection.Ubound >= 0 Then FirstTrailerURL = TrailerSelection(0) // Set first likely trailer to be downloaded.
		  '
		  '// Remove all trailers that don't have the wanted quality.
		  'For i as Integer = TrailerSelection.Ubound DownTo 0
		  'If TrailerQualities(i) <> Preferences.Prefs.stringForKey("TrailerQuality") And TrailerSelection(i).InStr( 0, "youtube" ) = 0 Then
		  'TrailerSelection.Remove(i)
		  'TrailerQualities.Remove(i)
		  'End If
		  'Next
		  '
		  '// Set most suitable trailer to be downloaded
		  'For i as Integer = 0 to TrailerSelection.Ubound
		  'If TrailerSelection(i).InStr( 0, "youtube" ) > 0 Then
		  'Continue
		  'Else
		  'FirstTrailerURL = TrailerSelection(i)
		  'Exit
		  'End If
		  'Next
		  'If FirstTrailerURL = "" And TrailerSelection.Ubound >= 0 Then FirstTrailerURL = TrailerSelection(0)
		  ''If TrailerSelection.Ubound >= 0 Then FirstTrailerURL = TrailerSelection(0)
		  'End If
		  '
		  '
		  'If NOT CommonCore.MassSearch Then
		  'dlgProgress.Update( Loc.kDownloading + ":", MovieAttr.Title + " " + Loc.kTrailer.Lowercase + "...", 64, 100 )
		  'Else
		  'dlgProgress.Debug( Loc.kDownloading + " " + MovieAttr.Title + " " + Loc.kTrailer.Lowercase + "..." )
		  'End If
		  '
		  'Dim ScktTrailer as New TrailerSckt
		  'ScktTrailer.Yield = False
		  '
		  'IP = Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) )
		  'ScktTrailer.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  'ScktTrailer.SetRequestHeader( "User-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Safari/8536.25" )
		  '
		  '
		  'If FirstTrailerURL.InStr( 0, "youtube" ) > 0 Then
		  'Dim YTContent as String = ScktTrailer.Get( MovieAttr.TrailerURLs(0), Preferences.Prefs.integerForKey("TimeOut") )
		  '
		  ''Dim TrailerURL as String
		  'If YTContent <> "" Then FirstTrailerURL = ScktTrailer.YoutubeContent( YTContent, "", True )
		  'End If
		  '
		  '
		  'Dim TmpTrailerFile as FolderItem = SpecialFolder.Temporary.Child( App.Identifier ).Child("Trailer.part") 'MovieAttr.FolderParent.Child("Trailer.part")
		  '
		  'If FirstTrailerURL <> "" And ScktTrailer.Get( FirstTrailerURL, TmpTrailerFile, 600 ) Then
		  '
		  'If TmpTrailerFile.Length > 1024 Then
		  '// Success
		  'If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.MoveFileTo( MovieAttr.DestinationTrailer( MovieAttr.FolderParent, TmpTrailerFile ) )
		  '
		  '
		  'Else
		  '// Failure, try once more.
		  'FirstTrailerURL = ""
		  'ScktTrailer.Close
		  'Dim Content as String
		  'If TmpTrailerFile IsA FolderItem Then Content = ReadTextFile( TmpTrailerFile )
		  'If Content.InStr( 0, "The document has moved" ) > 0 Then FirstTrailerURL = Content.MyMid( "<A HREF=""", """>" ).ReplaceAll("&amp;", "&")
		  '
		  'If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.Delete
		  '
		  'If FirstTrailerURL <> "" And ScktTrailer.Get( FirstTrailerURL, TmpTrailerFile, 600 ) Then
		  'If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.MoveFileTo( MovieAttr.DestinationTrailer( MovieAttr.FolderParent, TmpTrailerFile ) )
		  'Else
		  'If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.Delete
		  'End If
		  '
		  'End If
		  '
		  'Else
		  ''If NOT CommonCore.MassSearch Then MessageBox "Trailer download failed!"
		  'End If
		  '
		  'ScktTrailer.Close
		  'If TmpTrailerFile <> Nil And TmpTrailerFile.Exists Then TmpTrailerFile.Delete
		  'End If
		  
		  
		  // ## AutoManage Media
		  App.ErrorMessage = "Update: " + Str( Update ) + " - AutoManage Media"
		  If MovieAttr.RipSource = "" Then MovieAttr.RipSource = FindRipSource( MovieAttr.FolderParent )
		  If NOT CommonCore.MassSearch And Preferences.Prefs.boolForKey("AutoManageMedia") Then
		    SingleRenamer MovieAttr.FolderParent, -1, True // 18
		  End If
		  
		  
		  Exception err as KeyNotFoundException
		    'Dim w as New wndBugReporter
		    'w.Init( err, App.ErrorMessage )
		    if AppSettings.HandleError( err, "KeyNotFoundException (caught at GetMovieNFO( " + ID + " )) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URL(Method As String, Parameter As String, Lang As String = "All", Page As Integer = 1, Opt As String = "") As String
		  Dim ext as String
		  Dim Base as String = URLbase
		  Dim ApiKey as String = MovieCore.ApiKey_TMDB
		  
		  If Lang = "All" Then
		    Lang = ""
		  ElseIf Lang = "" Then
		    Lang = Preferences.Prefs.stringForKey("DBLanguage").NthField( "-", 1 )
		  Else
		    Lang = Lang
		  End If
		  
		  Select Case Method
		    
		  Case "MovieInfo"
		    ext = URLmovie_info
		    Lang = "&language=" + Lang
		    
		  Case "MovieAlternativeTitles"
		    ext = URLmovie_alternative_titles
		    If Lang <> "" Then Lang = "&language=" + Lang
		    
		  Case "MovieCast"
		    ext = URLMovie_casts
		    
		  Case "MovieImages"
		    ext = URLmovie_images
		    Lang = ""
		    
		  Case "MovieReleases"
		    ext = URLmovie_releases
		    If Lang <> "" Then Lang = "&language=" + Lang
		    
		  Case "MovieTrailers"
		    ext = URLmovie_trailers
		    If Lang <> "" Then Lang = "&language=" + Lang
		    
		  Case "SearchMovie"
		    ext = URLsearch_movie
		    If Lang <> "" Then Lang = "&language=" + Lang
		    
		    if opt = "" then
		      dim year as string
		      year = match( "\([0-9][0-9][0-9][0-9]\)", Parameter )
		      if year = "" then
		        year = match( "\[[0-9][0-9][0-9][0-9]\]", Parameter )
		        if year <> "" then
		          Parameter = Parameter.ReplaceAll(year, "")
		          opt = year.ReplaceAll("[","").ReplaceAll("]","")
		        end if
		      else
		        Parameter = Parameter.ReplaceAll(year,"")
		        opt = year.ReplaceAll("(","").ReplaceAll(")","")
		      end if
		      
		    end if
		    
		    If Opt <> "" Then Opt = "&year=" + opt
		    Parameter = String2Entities( Parameter )
		    
		  Case "MovieRecommendations"
		    ext = URLmovie_similar
		    If Lang <> "" Then Lang = "&language=" + Lang
		    
		    
		    // ---- RottenTomatoes
		  Case "TomatoesSearch"
		    ext = URLtomatoes_search
		    Lang = "&country=" + Lang
		    Opt = "&page_limit=" + Opt
		    
		  Case "TomatoesMovieInfo"
		    ext = URLtomatoes_movie
		    Lang = ""
		    
		  Case "TomatoesMovieAlias"
		    ext = URLtomatoes_movie_alias
		    
		    
		  Case "TomatoesMovieReviews"
		    ext = URLtomatoes_movie_reviews
		    Lang = ""
		    Opt = "&page_limit=50&review_type=" + Opt
		    // Review Types: "all", "top_critic" and "dvd". Default: "top_critic"
		    
		  Case "TomatoesMovieCast"
		    Base = ""
		    ext = URLtomatoes_movie_cast
		    Lang = ""
		    'Lang = "&country=" + Lang
		    
		  Case "TomatoesMovieSimiliar"
		    ext = URLtomatoes_movie_similiar
		    Lang = ""
		    Opt = "&limit=5"
		    
		  Case "TomatoesMovieClips"
		    ext = URLtomatoes_movie_clips
		    Lang = ""
		    
		  Case "TomatoesBoxOffice"
		    ext = URLtomatoes_lists_box_office
		    Lang = "&country=" + Lang
		    Opt = "&limit=10"
		    
		  End Select
		  
		  Return Base + ext.ReplaceAll("{0}", Parameter ) + ApiKey + "&page=" + Str(Page) + Lang + Opt + "&include_adult=true"
		End Function
	#tag EndMethod


	#tag Note, Name = Image Sizes
		"images": {
		  "backdrop_sizes": ["w300", "w780", "w1280", "original"],
		  "base_url": "http://cf2.imgobject.com/t/p/",
		  "poster_sizes": ["w92", "w154", "w185", "w342", "w500", "original"],
		  "profile_sizes": ["w45", "w185", "h632", "original"]
		}
		
		Construction:
		  URLbase_image + "{size}" + "image.jpg"
	#tag EndNote

	#tag Note, Name = Untitled
		
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage")
		  If Lang.InStr(0,"-") = 0 Then Lang = Lang + "-" + Lang
		  If Lang = "en-en" Then Lang = "en"
		  
		  Dim test as JSONItem
		  
		  Dim Base as String = "http://api.themoviedb.org/3"
		  Dim Extension as String
		  
		  Select Case url
		    
		  Case "misc_upcoming"
		    Extension = "/movie/upcoming?page={0}&api_key="
		    
		  End Select
		  
		  Return Base + Extension.ReplaceAll("{0}", prm) + ApiKey
		  
		  
		  If ID.Left(2) = "tt" then
		    // IMDB Lookup
		    Return "http://api.themoviedb.org/2.1/Movie.imdbLookup/" + Lang + "/xml/" + ApiKey + "/" + ID
		  Else
		    // TMDB Lookup
		    Return "http://api.themoviedb.org/2.1/Movie.getInfo/" + Lang + "/xml/" + ApiKey + "/" + ID
		  End If
	#tag EndNote

	#tag Note, Name = URL Construction
		
		Return URLbase + URL*.ReplaceAll("{0}", "ID or Query") + ApiKey + "&page=" + "1+" + "&language="
		
		URL search_* all have multi pages.
		URL top_rated/popular/upcoming all have (5) multi-pages.
	#tag EndNote


	#tag Property, Flags = &h0
		ShowProgress As Boolean = False
	#tag EndProperty


	#tag Constant, Name = URLbase, Type = String, Dynamic = False, Default = \"http://api.themoviedb.org/3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = URLbase_image, Type = String, Dynamic = False, Default = \"http://image.tmdb.org/t/p/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = URLcompany_info, Type = String, Dynamic = False, Default = \"/company/{0}\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLcompany_movies, Type = String, Dynamic = False, Default = \"/company/{0}/movies\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLconfiguration, Type = String, Dynamic = False, Default = \"/configuration\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLgenre_list, Type = String, Dynamic = False, Default = \"/genre/list\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLgenre_movies, Type = String, Dynamic = False, Default = \"/genre/{0}/movies\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmisc_popular, Type = String, Dynamic = False, Default = \"/movie/popular\?page\x3D{0}&api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmisc_top_rated, Type = String, Dynamic = False, Default = \"/movie/top-rated\?page\x3D{0}&api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmisc_upcoming, Type = String, Dynamic = False, Default = \"/movie/upcoming\?page\x3D{0}&api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_alternative_titles, Type = String, Dynamic = False, Default = \"/movie/{0}/alternative_titles\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_casts, Type = String, Dynamic = False, Default = \"/movie/{0}/casts\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_images, Type = String, Dynamic = False, Default = \"/movie/{0}/images\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_info, Type = String, Dynamic = False, Default = \"/movie/{0}\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_keywords, Type = String, Dynamic = False, Default = \"/movie/{0}/keywords\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_releases, Type = String, Dynamic = False, Default = \"/movie/{0}/releases\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_similar, Type = String, Dynamic = False, Default = \"/movie/{0}/similar_movies\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_trailers, Type = String, Dynamic = False, Default = \"/movie/{0}/trailers\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLmovie_translations, Type = String, Dynamic = False, Default = \"/movie/{0}/translations\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLperson_credits, Type = String, Dynamic = False, Default = \"/person/{0}/credits\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLperson_images, Type = String, Dynamic = False, Default = \"/person/{0}/images\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLperson_info, Type = String, Dynamic = False, Default = \"/person/{0}\?api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLsearch_companies, Type = String, Dynamic = False, Default = \"/search/company\?query\x3D{0}&api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLsearch_movie, Type = String, Dynamic = False, Default = \"/search/movie\?query\x3D{0}&api_key\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLsearch_person, Type = String, Dynamic = False, Default = \"/search/person\?query\x3D{0}&api_key", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLtomatoes_lists_box_office, Type = String, Dynamic = False, Default = \"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json\?apikey\x3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URLtomatoes_movie, Type = String, Dynamic = False, Default = \"http://api.rottentomatoes.com/api/public/v1.0/movies/{0}.json\?apikey\x3D", Scope = Private
	#tag EndConstant

	#tag Constant, Name = URLtomatoes_movie_alias, Type = String, Dynamic = False, Default = \"http://api.rottentomatoes.com/api/public/v1.0/movie_alias.json\?type\x3Dimdb&id\x3D{0}&apikey\x3D", Scope = Private
	#tag EndConstant

	#tag Constant, Name = URLtomatoes_movie_cast, Type = String, Dynamic = False, Default = \"http://api.rottentomatoes.com/api/public/v1.0/movies/{0}/cast.json\?apikey\x3D", Scope = Private
	#tag EndConstant

	#tag Constant, Name = URLtomatoes_movie_clips, Type = String, Dynamic = False, Default = \"http://api.rottentomatoes.com/api/public/v1.0/movies/{0}/clips.json\?apikey\x3D", Scope = Private
	#tag EndConstant

	#tag Constant, Name = URLtomatoes_movie_reviews, Type = String, Dynamic = False, Default = \"http://api.rottentomatoes.com/api/public/v1.0/movies/{0}/reviews.json\?apikey\x3D", Scope = Private
	#tag EndConstant

	#tag Constant, Name = URLtomatoes_movie_similiar, Type = String, Dynamic = False, Default = \"http://api.rottentomatoes.com/api/public/v1.0/movies/{0}/similar.json\?apikey\x3D", Scope = Private
	#tag EndConstant

	#tag Constant, Name = URLtomatoes_search, Type = String, Dynamic = False, Default = \"http://api.rottentomatoes.com/api/public/v1.0/movies.json\?q\x3D{0}&apikey\x3D", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesAvailable"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesLeftToSend"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyAddress"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyPort"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LocalAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowProgress"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yield"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

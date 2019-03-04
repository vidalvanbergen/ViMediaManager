#tag Class
Protected Class TVDBSckt
Inherits HTTPSocket
	#tag Event
		Sub Error(code as integer)
		  
		  If CommonCore.MassSearch Then
		    CommonCore.UnfoundPaths.Append  TVAttr.FolderParent
		    CommonCore.UnfoundTitles.Append "HTTP Error: " + str(code) + " occured."
		  End If
		  
		  SocketError( code, Me )
		  
		  Exception err as NilObjectException
		    Me.Close
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GetArt(TVDBArt as JSONItem, FanartTVJSON as JSONItem)
		  
		  Dim Info as String = "GetArt( TVDBArt : " + Str( TVDBArt <> Nil ) + ", FanartTVJSON : " + Str( FanartTVJSON <> Nil ) + " ) - "
		  App.ErrorMessage = Info + "Start"
		  
		  Dim Sckt as New TVDBSckt
		  Sckt.Yield = True
		  
		  Dim TimeOut as Integer = Preferences.Prefs.integerForKey("TimeOut")
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage")
		  If Lang = "gb" Then Lang = "en"
		  
		  App.ErrorMessage = Info + "Process TVDB Art"
		  // ## TVDB Art
		  // :9
		  Dim LastValue as Integer = dlgProgress.ProgressValue
		  Dim LastMax as Integer = dlgProgress.ProgressMax
		  
		  If NOT CommonCore.MassSearch Then dlgProgress.Reset
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kProcessing + ":", "TVDB " + Loc.kImages + " " + Loc.mTabInfo + "..." ) Else dlgProgress.debug( "TVDB " + Loc.kImages + " " + Loc.mTabInfo + "..." )
		  
		  If TVDBArt <> Nil And NOT TVDBArt.IsArray Then
		    Dim jT as New JSONItem
		    jT.Append( TVDBArt )
		    TVDBArt = jT
		  End If
		  
		  Dim FirstPoster, FirstFanart, FirstBanner, SeasonLanguage(), SeasonPosterURLs(), SeasonPosterNrs(), SeasonBannerURLs(), SeasonBannerNrs(), SeasonFanartURLs(), SeasonFanartNrs() as String
		  If TVDBArt <> Nil And TVDBArt.IsArray Then
		    For i as Integer = 0 to TVDBArt.Count - 1
		      Dim jItem as New JSONItem
		      jItem = TVDBArt.Child(i)
		      
		      If NOT jItem.HasName("BannerType") Then Continue
		      
		      App.ErrorMessage = Info + "Process TVDB Art / jItem : " + Str( jItem <> Nil ) + " " + Str( i ) + " of " + Str( TVDBArt.Count - 1 )
		      
		      Select Case jItem.Value("BannerType")
		        
		      case "poster" // Posters
		        App.ErrorMessage = App.ErrorMessage + " * Posters"
		        TVAttr.ART_PosterURLs.Append TVCore.GraphicsPath + jItem.Value("BannerPath")
		        
		        If FirstPoster = "" And jItem.HasName("Language") And ( jItem.Value("Language") = Lang Or jItem.Value("Language") = "" ) Then
		          FirstPoster = TVCore.GraphicsPath + jItem.Value("BannerPath")
		        End If
		        
		        
		      case "fanart" // Backdrops
		        App.ErrorMessage = App.ErrorMessage + " * Fanarts"
		        TVAttr.ART_FanartURLs.Append       TVCore.GraphicsPath + jItem.Value("BannerPath")
		        TVAttr.ART_FanartThumbURLs.Append  TVCore.GraphicsPath + jItem.Value("ThumbnailPath")
		        TVAttr.ART_FanartDimensions.Append jItem.Value("BannerType2")
		        
		        If FirstFanart = "" And jItem.HasName("Language") And ( jItem.Value("Language") = Lang OR jItem.Value("Language") = "" ) Then
		          FirstFanart = TVCore.GraphicsPath + jItem.Value("BannerPath")
		        End If
		        
		        
		      case "season" // Posters OR Banners (season OR seasonwide)
		        App.ErrorMessage = App.ErrorMessage + " * Season"
		        TVAttr.ART_SeasonURLs.Append    TVCore.GraphicsPath + jItem.Value("BannerPath")
		        TVAttr.ART_SeasonNumbers.Append jItem.Value("Season")
		        SeasonLanguage.Append           jItem.Value("Language")
		        'End If
		        If jItem.Value("BannerType2") = "season" Then
		          SeasonPosterURLs.Append TVCore.GraphicsPath + jItem.Value("BannerPath")
		          SeasonPosterNrs.Append  jItem.Value("Season")
		        ElseIf jItem.Value("BannerType2") = "seasonwide" Then
		          SeasonBannerURLs.Append TVCore.GraphicsPath + jItem.Value("BannerPath")
		          SeasonBannerNrs.Append  jItem.Value("Season")
		        End If
		        
		      case "series" // Banners
		        App.ErrorMessage = App.ErrorMessage + " * Banners"
		        TVAttr.ART_BannerURLs.Append TVCore.GraphicsPath + jItem.Value("BannerPath")
		        
		        If FirstBanner = "" And jItem.HasName("Language") And ( jItem.Value("Language") = Lang OR jItem.Value("Language") = "" ) Then
		          FirstBanner = TVCore.GraphicsPath + jItem.Value("BannerPath")
		        End If
		        
		      End Select
		      
		    Next
		  End If
		  
		  
		  // Fanart.TV
		  Dim LogoHDURLs(), LogoURLs(), ClearArtHDURLs(), ClearArtURLs(), TVThumbURLs(), CharacterArtURLs() as String
		  Dim SeasonThumbURLs(), SeasonThumbNrs() as String
		  
		  If Preferences.Prefs.boolForKey("FanartTVEnabled") Then
		    App.ErrorMessage = Info + "Process Fanart.TV"
		    // Fanart.TV
		    // :10
		    If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kProcessing + ":", "Fanart.tv " + Loc.kImages + " " + Loc.mTabInfo + "..." ) Else dlgProgress.debug( "Fanart.tv " + Loc.kImages + " " + Loc.mTabInfo + "..." )
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: Banners"
		    // -- Banner
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("tvbanner") And FanartTVJSON.Child("tvbanner").IsArray Then
		      For i as Integer = 0 to FanartTVJSON.Child("tvbanner").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("tvbanner").Child(i)
		        TVAttr.ART_BannerURLs.Append jItem.Value("url")
		      Next
		    End If
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: Fanart"
		    // -- Fanart
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("showbackground") And FanartTVJSON.Child("showbackground").IsArray Then
		      
		      For i as Integer = 0 to FanartTVJSON.Child("showbackground").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("showbackground").Child(i)
		        
		        TVAttr.ART_FanartURLs.Append       jItem.Value("url")
		        TVAttr.ART_FanartDimensions.Append "1920x1080"
		        TVAttr.ART_FanartThumbURLs.Append  jItem.Value("url") + "/preview"
		        
		        
		        // Season fanart
		        If jItem.Value("season") <> "" Then
		          SeasonFanartURLs.Append jItem.Value("url")
		          SeasonFanartNrs.Append  jItem.Value("season")
		        End If
		        
		      Next
		    End If
		    
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: HD ClearArt"
		    // -- HD ClearArt
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("hdclearart") And FanartTVJSON.Child("hdclearart").IsArray Then
		      For i as Integer = 0 to FanartTVJSON.Child("hdclearart").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("hdclearart").Child(i)
		        If jItem.Value("lang") = Lang OR jItem.Value("lang") = "" Then ClearArtHDURLs.Append jItem.Value("url")
		      Next
		      If ClearArtHDURLs.Ubound = -1 And FanartTVJSON.Child("hdclearart").Count > 0 Then ClearArtHDURLs.Append( FanartTVJSON.Child("hdclearart").Child(0).Value("url") )
		    End If
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: ClearArt"
		    // -- ClearArt
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("clearart") And FanartTVJSON.Child("clearart").IsArray Then
		      For i as Integer = 0 to FanartTVJSON.Child("clearart").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("clearart").Child(i)
		        If jItem.Value("lang") = Lang OR jItem.Value("lang") = ""  Then ClearArtURLs.Append jItem.Value("url")
		      Next
		      If ClearArtURLs.Ubound = -1 And FanartTVJSON.Child("clearart").Count > 0 Then ClearArtURLs.Append( FanartTVJSON.Child("clearart").Child(0).Value("url") )
		      
		    End If
		    
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: HD Logo"
		    // -- HD Logo
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("hdtvlogo") And FanartTVJSON.Child("hdtvlogo").IsArray Then
		      For i as Integer = 0 to FanartTVJSON.Child("hdtvlogo").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("hdtvlogo").Child(i)
		        If jItem.Value("lang") = Lang OR jItem.Value("lang") = "" Then LogoHDURLs.Append jItem.Value("url")
		      Next
		      If LogoHDURLs.Ubound = -1 And FanartTVJSON.Child("hdtvlogo").Count > 0 Then LogoHDURLs.Append( FanartTVJSON.Child("hdtvlogo").Child(0).Value("url") )
		    End If
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: Logo"
		    // -- Logo
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("clearlogo") Then
		      For i as Integer = 0 to FanartTVJSON.Child("clearlogo").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("clearlogo").Child(i)
		        If jItem.Value("lang") = Lang OR jItem.Value("lang") = ""  Then LogoURLs.Append jItem.Value("url")
		      Next
		      If LogoURLs.Ubound = -1 And FanartTVJSON.Child("clearlogo").Count > 0 Then LogoURLs.Append( FanartTVJSON.Child("clearlogo").Child(0).Value("url") )
		    End If
		    
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: Thumb"
		    // -- Thumb
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("tvthumb") And FanartTVJSON.Child("tvthumb").IsArray Then
		      For i as Integer = 0 to FanartTVJSON.Child("tvthumb").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("tvthumb").Child(i)
		        TVThumbURLs.Append jItem.Value("url")
		      Next
		      If TVThumbURLs.Ubound = -1 And FanartTVJSON.Child("tvthumb").Count > 0 Then TVThumbURLs.Append( FanartTVJSON.Child("tvthumb").Child(0).Value("url") )
		    End If
		    
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: CharacterArt"
		    // -- CharacterArt
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("characterart") And FanartTVJSON.Child("characterart").IsArray Then
		      For i as Integer = 0 to FanartTVJSON.Child("characterart").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("characterart").Child(i)
		        CharacterArtURLs.Append jItem.Value("url")
		      Next
		      If CharacterArtURLs.Ubound = -1 And FanartTVJSON.Child("characterart").Count > 0 Then CharacterArtURLs.Append( FanartTVJSON.Child("characterart").Child(0).Value("url") )
		    End If
		    
		    
		    
		    App.ErrorMessage = Info + "Process Fanart.TV: SeasonThumb"
		    // -- SeasonThumb
		    
		    If FanartTVJSON <> Nil And FanartTVJSON.HasName("seasonthumb") Then
		      For i as Integer = 0 to FanartTVJSON.Child("seasonthumb").Count -1
		        Dim jItem as New JSONItem
		        jItem = FanartTVJSON.Child("seasonthumb").Child(i)
		        
		        If jItem.Value("lang") = Lang OR jItem.Value("lang") = ""  Then
		          SeasonThumbURLs.Append   jItem.Value("url")
		          SeasonThumbNrs.Append    jItem.Value("season")
		        End If
		      Next
		    End If
		    
		  End If // @END Fanart.tv enabled
		  
		  // --
		  
		  App.ErrorMessage = Info + "Set FirstArt Download list"
		  // Set download list
		  If FirstPoster = "" And TVAttr.ART_PosterURLs.Ubound > -1 Then FirstPoster = TVAttr.ART_PosterURLs(0)
		  If FirstFanart = "" And TVAttr.ART_FanartURLs.Ubound > -1 Then FirstFanart = TVAttr.ART_FanartURLs(0)
		  If FirstBanner = "" And TVAttr.ART_BannerURLs.Ubound > -1 Then FirstBanner = TVAttr.ART_BannerURLs(0)
		  
		  Dim HighestSeason as Integer = -1
		  For i as Integer = 0 to TVAttr.ART_SeasonNumbers.Ubound
		    If Val( TVAttr.ART_SeasonNumbers(i) ) > HighestSeason Then HighestSeason = Val( TVAttr.ART_SeasonNumbers(i) )
		  Next
		  
		  
		  App.ErrorMessage = Info + "Match up all available aseasons from local episodes"
		  // Match up all available seasons from local episodes
		  Dim EpisodeFiles() as FolderItem = FindEpisodeFiles( TVAttr.FolderParent )
		  Dim AllSeasons() as String
		  AllSeasons.Append "-1" // Season-All art
		  
		  For each episode as FolderItem in EpisodeFiles
		    Dim s as String = RegExEpisode( Episode )
		    If s <> "" Then AllSeasons.Append s.NthField("x",1)
		  Next
		  
		  App.ErrorMessage = Info + "Make sure that there are no duplicates"
		  // Make sure that there are no duplicates.
		  AllSeasons.Sort
		  AllSeasons = RemoveDuplicatesFromArray( AllSeasons )
		  AllSeasons = RemoveDuplicatesFromArray( AllSeasons )
		  
		  If False Then
		    ReDim AllSeasons(-1)
		    
		    For i as Integer = -1 to HighestSeason
		      AllSeasons.Append str( i )
		    Next
		  End If
		  
		  App.ErrorMessage = Info + "Get SeasonArt URLs"
		  // Get season art urls
		  Dim tmpSeasonPosterURLs(), tmpSeasonPosterNrs() as String
		  Dim tmpSeasonFanartURLs(), tmpSeasonFanartNrs() as String
		  Dim tmpSeasonBannerURLs(), tmpSeasonBannerNrs() as String
		  Dim tmpSeasonThumbsURLs(), tmpSeasonThumbsNrs() as String
		  
		  'For i as Integer = -1 to HighestSeason
		  For each Season as String in AllSeasons
		    Dim i as Integer = Val( Season )
		    
		    App.ErrorMessage = Info + "Season " + Str( i ) + " Posters"
		    // Order Season Posters
		    For n as Integer = 0 to SeasonPosterNrs.Ubound
		      If Val( SeasonPosterNrs(n) ) = i Then
		        tmpSeasonPosterURLs.Append SeasonPosterURLs(n)
		        tmpSeasonPosterNrs.Append  SeasonPosterNrs(n)
		        Exit
		      End If
		    Next
		    
		    App.ErrorMessage = Info + "Season " + Str( i ) + " Fanarts"
		    // Order Season Fanart
		    For n as Integer = 0 to SeasonFanartNrs.Ubound
		      If Val( SeasonFanartNrs(n) ) = i And SeasonFanartNrs(n) <> "all" Then
		        tmpSeasonFanartURLs.Append SeasonFanartURLs(n)
		        tmpSeasonFanartNrs.Append  SeasonFanartNrs(n)
		        Exit
		      ElseIf i = -1 And SeasonFanartNrs(n) = "All" Then
		        tmpSeasonFanartURLs.Append SeasonFanartURLs(n)
		        tmpSeasonFanartNrs.Append  SeasonFanartNrs(n)
		        Exit
		      End If
		    Next
		    
		    App.ErrorMessage = Info + "Season " + Str( i ) + " Banners"
		    // Order Season Banners
		    For n as Integer = 0 to SeasonBannerNrs.Ubound
		      If Val( SeasonBannerNrs(n) ) = i Then
		        tmpSeasonBannerURLs.Append SeasonBannerURLs(n)
		        tmpSeasonBannerNrs.Append  SeasonBannerNrs(n)
		        Exit
		      End If
		    Next
		    
		    App.ErrorMessage = Info + "Season " + Str( i ) + " Thumbs"
		    // Order Season Thumbs
		    For n as Integer = 0 to SeasonThumbNrs.Ubound
		      If Val( SeasonThumbNrs(n) ) = i And SeasonThumbNrs(n) <> "all" Then
		        tmpSeasonThumbsURLs.Append SeasonThumbURLs(n)
		        tmpSeasonThumbsNrs.Append  SeasonThumbNrs(n)
		        Exit
		      ElseIf i = -1 And SeasonThumbNrs(n) = "All" Then
		        tmpSeasonThumbsURLs.Append SeasonThumbURLs(n)
		        tmpSeasonThumbsNrs.Append  SeasonThumbNrs(n)
		        Exit
		      End If
		    Next
		    
		  Next
		  SeasonPosterURLs = tmpSeasonPosterURLs
		  SeasonPosterNrs  = tmpSeasonPosterNrs
		  
		  SeasonFanartURLs = tmpSeasonFanartURLs
		  SeasonFanartNrs  = tmpSeasonFanartNrs
		  
		  SeasonBannerURLs = tmpSeasonBannerURLs
		  SeasonBannerNrs  = tmpSeasonBannerNrs
		  
		  SeasonThumbURLs = tmpSeasonThumbsURLs
		  SeasonThumbNrs  = tmpSeasonThumbsNrs
		  
		  Dim DBID as String = TVAttr.ID_IMDb
		  If DBID = "" Then DBID = TVAttr.ID_TVDB
		  
		  
		  App.ErrorMessage = Info + "Downloading Poster"
		  // :11 Downloading Poster
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kPoster + " " + Loc.kImage.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kPoster.Lowercase + " " + Loc.kImage.Lowercase + "..." )
		  Dim PosterName as String = "poster.jpg"
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PosterName = "Set_" + TVAttr.FolderParent.Name + "_1.jpg"
		  Dim PosterFile as FolderItem = TVAttr.FolderParent.Child( PosterName )
		  
		  If Preferences.Prefs.boolForKey("AutoDownloadPoster") And FirstPoster <> "" And ( PosterFile = Nil OR NOT PosterFile.Exists ) Then
		    If Preferences.Prefs.stringForKey( "PosterSize" ) = "original" Then
		      TVAttr.ART_Poster = URL2Picture( FirstPoster, TVAttr.FolderParent, PosterName )
		    Else
		      TVAttr.ART_Poster = Nil
		      TVAttr.ART_Poster = Picture.FromData( CURLGet( FirstPoster ) ) ', TimeOut ) )
		      Sckt.Close
		      
		      If TVAttr.ART_Poster <> Nil Then
		        Dim Width as Integer = Val( Preferences.Prefs.stringForKey( "PosterSize" ).ReplaceAll("w","") )
		        Dim Height as Integer = TVAttr.ART_Poster.Height * ( Width / TVAttr.ART_Poster.Width )
		        
		        If ScaleImage( TVAttr.ART_Poster, Width, Height ) <> Nil Then SaveImage( ScaleImage( TVAttr.ART_Poster, Width, Height ), TVAttr.FolderParent.Child( PosterName ), FileTypes.ImageJpeg )
		      End If
		      
		    End If
		  End If
		  CacheImageSet( TVAttr.ART_Poster, DBID + ".television.poster.jpg" )
		  
		  
		  App.ErrorMessage = Info + "Downloading Fanart"
		  // :12 Downloading Fanart
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kFanart + " " + Loc.kImage.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kFanart.Lowercase + " " + Loc.kImage.Lowercase + "..." )
		  Dim FanartName as String = "fanart.jpg"
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then FanartName = "Set_" + TVAttr.FolderParent.Name + "_1.fanart.jpg"
		  Dim FanartFile as FolderItem = TVAttr.FolderParent.Child( FanartName )
		  
		  If Preferences.Prefs.boolForKey("AutoDownloadBackdrop") And FirstFanart <> "" And ( FanartFile = Nil OR NOT FanartFile.Exists ) Then
		    If Preferences.Prefs.stringForKey( "FanartSize" ) = "original" Then
		      TVAttr.ART_Fanart = URL2Picture( FirstFanart, TVAttr.FolderParent, FanartName )
		    Else
		      TVAttr.ART_Fanart = Nil
		      TVAttr.ART_Fanart = Picture.FromData( CURLGet( FirstFanart ) ) ', TimeOut * 2 ) )
		      Sckt.Close
		      
		      If TVAttr.ART_Fanart <> Nil Then
		        Dim Width as Integer = Val( Preferences.Prefs.stringForKey( "FanartSize" ).ReplaceAll("w","") )
		        Dim Height as Integer = TVAttr.ART_Fanart.Height * ( Width / TVAttr.ART_Fanart.Width )
		        
		        If ScaleImage( TVAttr.ART_Fanart, Width, Height ) <> Nil Then SaveImage( ScaleImage( TVAttr.ART_Fanart, Width, Height ), TVAttr.FolderParent.Child( FanartName ), FileTypes.ImageJpeg )
		      End If
		      
		    End If
		  End If
		  CacheImageSet( TVAttr.ART_Fanart, TVAttr.ID_IMDb + ".television.fanart.jpg" )
		  
		  
		  App.ErrorMessage = Info + "Downloading Banner"
		  // :13 Downloading Banner
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kBanner + " " + Loc.kImage.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kBanner.Lowercase + " " + Loc.kImage.Lowercase + "..." )
		  Dim BannerName as String = "banner.jpg"
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then BannerName = "Set_" + TVAttr.FolderParent.Name + "_1.banner.jpg"
		  Dim BannerFile as FolderItem = TVAttr.FolderParent.Child( BannerName )
		  
		  If Preferences.Prefs.boolForKey("AutoDownloadBanner") And FirstBanner <> "" And ( BannerFile = Nil OR NOT BannerFile.Exists ) Then URL2Picture( FirstBanner, TVAttr.FolderParent, BannerName )
		  
		  
		  App.ErrorMessage = Info + "Downloading Logo"
		  // :14 Downloading Logo
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kLogo + " " + Loc.kImage.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kLogo.Lowercase + " " + Loc.kImage.Lowercase + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadLogo") And NOT TVAttr.FolderParent.Child("logo.png").Exists Then
		    Dim FirstLogo as String
		    
		    If LogoHDURLs <> Nil And LogoHDURLs.Ubound > -1 Then
		      FirstLogo = LogoHDURLs(0)
		    ElseIf LogoURLs <> Nil And LogoURLs.Ubound > -1 Then
		      FirstLogo = LogoURLs(0)
		    End If
		    
		    If FirstLogo <> "" And TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then URL2Picture( FirstLogo, TVAttr.FolderParent, "logo.png" )
		  End If
		  
		  
		  App.ErrorMessage = Info + "Downloading ClearArt"
		  // :15 Downloading ClearArt
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kClearArt + " " + Loc.kImage.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kClearArt.Lowercase + " " + Loc.kImage.Lowercase + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadClearArt") And NOT TVAttr.FolderParent.Child("clearart.png").Exists Then
		    Dim FirstClearArt as String
		    
		    If ClearArtHDURLs.Ubound > -1 Then
		      FirstClearArt = ClearArtHDURLs(0)
		    ElseIf ClearArtURLs.Ubound > -1 Then
		      FirstClearArt = ClearArtURLs(0)
		    End If
		    
		    If FirstClearArt <> "" Then URL2Picture( FirstClearArt, TVAttr.FolderParent, "clearart.png" )
		  End If
		  
		  
		  App.ErrorMessage = Info + "Downloading Landscape"
		  // :16 Downloading Landscape
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kTVThumb + " " + Loc.kImage.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kTVThumb.Lowercase + " " + Loc.kImage.Lowercase + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadThumb") And NOT TVAttr.FolderParent.Child("landscape.jpg").Exists And TVThumbURLs.Ubound > -1 Then URL2Picture( TVThumbURLs(0), TVAttr.FolderParent, "landscape.jpg" )
		  
		  
		  App.ErrorMessage = Info + "Downloading CharacterArt"
		  // :17 Downloading CharacterArt
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kCharacterArt + " " + Loc.kImage.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kCharacterArt.Lowercase + " " + Loc.kImage.Lowercase + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadCharacterArt") And NOT TVAttr.FolderParent.Child("character.png").Exists And CharacterArtURLs.Ubound > -1 Then URL2Picture( CharacterArtURLs(0), TVAttr.FolderParent, "character.png" )
		  
		  
		  App.ErrorMessage = Info + "Downloading Season Posters"
		  // :18 Downloading Season Posters
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kSeason + " " + Loc.kPoster + " " + Loc.kImages.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kSeason + " " + Loc.kPoster.Lowercase + " " + Loc.kImages.Lowercase + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadSeasonArt") Then
		    
		    For i as Integer = 0 to SeasonPosterURLs.Ubound
		      dlgProgress.debug( Str(i+1) + Loc.k1of2 + Str( SeasonPosterURLs.Ubound + 1 ) + " " + Loc.kSeason + " " + Loc.kPoster + " " + Loc.kImages.Lowercase )
		      
		      Dim Parent as FolderItem = TVAttr.FolderParent
		      Dim SeasonPosterFile as FolderItem
		      
		      If SeasonPosterNrs(i) = "0" Then
		        'If Parent.Child( "Specials" ).Exists Then Parent = Parent.Child( "Specials" )
		        SeasonPosterFile = Parent.Child( "season-specials-poster.jpg" )
		        
		      ElseIf SeasonPosterNrs(i) = "-1" Then
		        SeasonPosterFile = Parent.Child( "season-all-poster.jpg" )
		        
		      Else
		        Dim SeasonDisplay as String = SeasonPosterNrs(i)
		        If SeasonDisplay.Len = 1 Then SeasonDisplay = " 0" + SeasonDisplay Else SeasonDisplay = " " + SeasonDisplay
		        
		        'If Parent.Child( "Season" + SeasonDisplay ).Exists Then Parent = Parent.Child( "Season" + SeasonDisplay )
		        
		        SeasonPosterFile = Parent.Child( "season" + Trim( SeasonDisplay ) + "-poster.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonPosterFile = Parent.Child( "season " + SeasonPosterNrs(i) + ".jpg" )
		        
		      End If
		      
		      // Download
		      If NOT SeasonPosterFile.Exists Then URL2Picture( SeasonPosterURLs(i), Parent, SeasonPosterFile.Name )
		    Next
		    
		  End If
		  
		  
		  App.ErrorMessage = Info + "Downloading Season Banners"
		  // ## Season Banners
		  If Preferences.Prefs.boolForKey("AutoDownloadSeasonArt") Then
		    Dim Pic as Picture
		    
		    For i as Integer = 0 to SeasonBannerURLs.Ubound
		      dlgProgress.debug( Str(i+1) + Loc.k1of2 + Str( SeasonBannerURLs.Ubound + 1 ) + " " + Loc.kSeason + " " + Loc.kBanner.Lowercase + " " + Loc.kImages.Lowercase )
		      
		      Dim Parent as FolderItem = TVAttr.FolderParent
		      Dim SeasonBannerFile as FolderItem
		      
		      If SeasonBannerNrs(i) = "0" Then
		        'If Parent.Child( "specials" ).Exists Then Parent = Parent.Child( "specials" )
		        
		        SeasonBannerFile = Parent.Child( "season-specials-banner.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonBannerFile = Parent.Child( "specials.banner.jpg" )
		        
		      ElseIf SeasonBannerNrs(i) = "-1" OR SeasonBannerNrs(i) = "All"Then
		        SeasonBannerFile = Parent.Child( "season-all-banner.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonBannerFile = Parent.Child( "seasonall.banner.jpg" )
		        
		      Else
		        Dim SeasonDisplay as String = SeasonBannerNrs(i)
		        If SeasonDisplay.Len = 1 Then SeasonDisplay = " 0" + SeasonDisplay Else SeasonDisplay = " " + SeasonDisplay
		        
		        'If Parent.Child( "season" + SeasonDisplay ).Exists Then Parent = Parent.Child( "season" + SeasonDisplay )
		        
		        SeasonBannerFile = Parent.Child( "season" + Trim( SeasonDisplay ) + "-banner.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonBannerFile = Parent.Child( "season " + Str( SeasonBannerNrs(i) ) + ".banner.jpg" )
		        
		      End If
		      
		      // Download
		      If NOT SeasonBannerFile.Exists Then URL2Picture( SeasonBannerURLs(i), Parent, SeasonBannerFile.Name )
		    Next
		    
		  End If
		  
		  
		  App.ErrorMessage = Info + "Downloading Season Thumbs"
		  // :20 Downloading Season Thumbs
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kSeason + " " + Loc.kThumb.Lowercase + " " + Loc.kImages.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kSeason + " " + Loc.kThumb.Lowercase + " " + Loc.kImages.Lowercase + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadSeasonArt") Then
		    
		    For i as Integer = 0 to SeasonThumbURLs.Ubound
		      dlgProgress.debug( Str(i+1) + Loc.k1of2 + Str( SeasonThumbURLs.Ubound + 1 ) + " " + Loc.kSeason + " " + Loc.kImages.Lowercase )
		      
		      Dim Parent as FolderItem = TVAttr.FolderParent
		      Dim SeasonLandscapeFile as FolderItem
		      
		      If SeasonThumbNrs(i) = "0" Then
		        'If Parent.Child( "specials" ).Exists Then Parent = Parent.Child( "specials" )
		        
		        SeasonLandscapeFile = Parent.Child("season-specials-landscape.jpg")
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonLandscapeFile = Parent.Child( "specials.landscape.jpg" )
		        
		      ElseIf SeasonThumbNrs(i) = "-1" OR SeasonThumbNrs(i) = "All" Then
		        SeasonLandscapeFile = Parent.Child( "season-all-landscape.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonLandscapeFile = Parent.Child( "seasonall.landscape.jpg" )
		        
		      Else
		        Dim SeasonDisplay as String = SeasonThumbNrs(i)
		        If SeasonDisplay.Len = 1 Then SeasonDisplay = " 0" + SeasonDisplay Else SeasonDisplay = " " + SeasonDisplay
		        
		        'If Parent.Child( "season" + SeasonDisplay ).Exists Then Parent = Parent.Child( "season" + SeasonDisplay )
		        
		        SeasonLandscapeFile = Parent.Child( "season" + Trim( SeasonDisplay ) + "-landscape.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonLandscapeFile = Parent.Child( "season " + Str( SeasonThumbNrs(i) ) + ".landscape.jpg" )
		        
		      End If
		      
		      // Download
		      If NOT SeasonLandscapeFile.Exists Then URL2Picture( SeasonThumbURLs(i), Parent, SeasonLandscapeFile.Name )
		    Next
		    
		  End If
		  
		  
		  App.ErrorMessage = Info + "Downloading Season Fanarts"
		  // :21 Downloading Season Fanarts
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kSeason + " " + Loc.kFanart.Lowercase + " " + Loc.kImages.Lowercase + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kFanart.Lowercase + " " + Loc.kBanner.Lowercase + " " + Loc.kImages.Lowercase + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadSeasonArt") Then
		    
		    'If NOT CommonCore.MassSearch Then dlgProgress.Reset
		    For i as Integer = 0 to SeasonFanartURLs.Ubound
		      dlgProgress.debug( Str(i+1) + Loc.k1of2 + Str( SeasonFanartURLs.Ubound + 1 ) + " " + Loc.kSeason + " " + Loc.kFanart + " " + Loc.kImages.Lowercase )
		      
		      Dim Parent as FolderItem = TVAttr.FolderParent
		      Dim SeasonFanartFile as FolderItem
		      
		      If SeasonFanartNrs(i) = "0" Then
		        'If Parent.Child( "specials" ).Exists Then Parent = Parent.Child( "specials" )
		        
		        SeasonFanartFile = Parent.Child( "season-specials-fanart.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonFanartFile = Parent.Child( "specials.fanart.jpg" )
		        
		        
		      ElseIf SeasonFanartNrs(i) = "-1" OR SeasonFanartNrs(i) = "All" Then
		        SeasonFanartFile = Parent.Child( "season-all-fanart.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonFanartFile = Parent.Child( "seasonall.fanart.jpg" )
		        
		      Else
		        Dim SeasonDisplay as String = SeasonFanartNrs(i)
		        If SeasonDisplay.Len = 1 Then SeasonDisplay = " 0" + SeasonDisplay Else SeasonDisplay = " " + SeasonDisplay
		        
		        'If Parent.Child( "season" + SeasonDisplay ).Exists Then Parent = Parent.Child( "season" + SeasonDisplay )
		        
		        SeasonFanartFile = Parent.Child( "season" + Trim( SeasonDisplay ) + "-fanart.jpg" )
		        If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then SeasonFanartFile = Parent.Child( "season " + Str( SeasonFanartNrs(i) ) + ".fanart.jpg" )
		        
		      End If
		      
		      // Download
		      If NOT SeasonFanartFile.Exists Then URL2Picture( SeasonFanartURLs(i), Parent, SeasonFanartFile.Name )
		    Next
		    
		  End If
		  
		  
		  App.ErrorMessage = Info + "Downloading Extra Fanarts"
		  // :22 Downloading extra fanart
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kExtraFanarts + "..." ) Else dlgProgress.debug( Loc.kDownloading + " " + Loc.kExtraFanarts + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadExtraFanart") Then
		    
		    For i as Integer = 0 to TVAttr.ART_FanartURLs.Ubound
		      If Preferences.Prefs.integerForKey( "MaxBackdrops" ) > 0 And i = Preferences.Prefs.integerForKey( "MaxBackdrops" ) Then Exit
		      
		      Dim Max as Integer = TVAttr.ART_FanartURLs.Ubound + 1
		      If Preferences.Prefs.integerForKey( "MaxBackdrops" ) > 0 And Preferences.Prefs.integerForKey( "MaxBackdrops" ) < Max Then Max = Preferences.Prefs.integerForKey( "MaxBackdrops" )
		      
		      dlgProgress.Debug( Str( i+1 ) + Loc.k1of2 + Str( Max ) + " " + Loc.kExtraFanarts + " " + Loc.kImages.Lowercase )
		      
		      
		      Dim Destination as FolderItem = TVAttr.FolderParent.Child("extrafanart")
		      If Destination <> Nil And NOT Destination.Exists Then Destination.CreateAsFolder
		      
		      Dim Name() as String = TVAttr.ART_FanartURLs(i).Split("/")
		      Dim FileName as String = Name( Name.Ubound )
		      If Destination.Child( FileName ).Exists Then Continue
		      
		      Dim Width as Integer = Val( Preferences.Prefs.stringForKey( "FanartSize" ).ReplaceAll( "w", "" ) )
		      If Width = 0 Then
		        URL2Picture( TVAttr.ART_FanartURLs(i), Destination, FileName )
		      Else
		        Dim CurFanart as Picture = Picture.FromData( CURLGet( TVAttr.ART_FanartURLs(i) ) ) ', TimeOut * 2 ) )
		        Sckt.Close
		        Dim Factor as Double = CurFanart.Height / CurFanart.Width
		        
		        Dim ScaledImage as Picture = ScaleImage( CurFanart, Width, Width * Factor )
		        SaveImage( ScaledImage, Destination.Child( FileName ), FileTypes.ImageJpeg )
		      End If
		      
		    Next
		    
		  End If
		  
		  
		  
		  If NOT CommonCore.MassSearch Then
		    dlgProgress.ProgressMax = LastMax
		    dlgProgress.ProgressValue = LastValue
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetShowNFO(ID as String, Update as Boolean = False)
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    '#pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  Dim JSONString, TVInfo as String
		  Dim sckt as New TVDBSckt
		  sckt.Yield = True
		  
		  TVInfo = " " + TVAttr.FolderParent.Name + " " + Loc.mTabInfo.Lowercase + "..."
		  
		  // Play undercover spy.
		  Dim rand as New Random
		  Dim IP as String = Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) )
		  Sckt.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  Sckt.SetRequestHeader( "User-agent", "Mozilla/" + Str( rand.InRange(3,5) ) + "." + Str( rand.InRange(0,3) ) + " (Windows NT " + Str( rand.InRange(3,5) ) + "." + Str( rand.InRange(0,2) ) + "; rv:2.0.1) Gecko/20100101 Firefox/" + Str( rand.InRange(3,5) ) + ".0.1" )
		  'Anonymouse( sckt )
		  
		  // ## Temporary Save
		  Dim PrevTitle, PrevTitleSort, PrevTitleOriginal, PrevGenres(), PrevTagline, PrevTags() as String
		  If Update Then
		    PrevTitle = TVAttr.Title
		    PrevTitleSort = TVAttr.TitleSort
		    PrevTitleOriginal = TVAttr.TitleOriginal
		    
		    PrevTagline = TVAttr.DescriptionTagline
		    PrevGenres = TVAttr.Genres
		    
		    PrevTags = TVAttr.Tags
		  End If
		  
		  // ## Reset properties
		  TVAttr.ClearProperties
		  
		  // ## Reload (some) properties
		  If Update Then
		    TVAttr.Title = PrevTitle
		    TVAttr.TitleSort = PrevTitleSort
		    TVAttr.TitleOriginal = PrevTitleOriginal
		    
		    TVAttr.DescriptionTagline = PrevTagline
		    TVAttr.Genres = PrevGenres
		    
		    TVAttr.Tags = PrevTags
		  End If
		  
		  // ## Reset progress
		  If NOT CommonCore.MassSearch Then dlgProgress.Reset
		  
		  // ## Gather information
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage")
		  Dim TimeOut as Integer = Preferences.Prefs.integerForKey("TimeOut") / 2
		  If Lang = "gb" Then Lang = "en"
		  
		  // -- Try to get TVDB ID if only IMDb ID is available.
		  // :1
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TVDB Alias]" + TVInfo, 1, 30 ) Else dlgProgress.debug( "[TVDB Alias]" + TVInfo )
		  If ID.Left(2) = "tt" Then ID = IMDb2TVDB( ID )
		  
		  
		  // -- Get general TVDB Info
		  // :2
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TVDB Info]" + TVInfo ) Else dlgProgress.debug( "[TVDB Info]" + TVInfo )
		  Dim TVDB as New JSONItem
		  If ID.Left(2) <> "tt" Then
		    Dim XMLString as String = DefineEncoding( sckt.Get( TVCore.URL( "InfoShort", ID ), TimeOut ), Encodings.UTF8 )
		    if XMLString.Contains( "404 Not Found" ) then
		      XMLString = DefineEncoding( sckt.Get( TVCore.URL( "InfoShort", ID, "en" ), TimeOut ), Encodings.UTF8 )
		    End If
		    'XMLString = DecodingFromHTMLMBS( XMLString )
		    sckt.Close
		    
		    
		    'JSONString = XMLString.XML2JSON
		    'If JSONString.ValidJSON("TVDB Info") Then TVDB.Load JSONString
		    TVDB = XMLString.XML2JSON
		    If TVDB <> Nil And TVDB.HasName("Data") And TVDB.ToString.InStr( 0, "Series" ) > 0 And TVDB.Child("Data").HasName("Series") Then TVDB = TVDB.Child("Data").Child("Series")
		    
		    'ProcessEpisodes XMLString
		    
		    XMLString = ""
		    JSONString = ""
		  End If
		  
		  // -- Get Actors info
		  // :3
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TVDB Actors]" + TVInfo ) Else dlgProgress.debug( "[TVDB Actors]" + TVInfo )
		  Dim TVDBActors as New JSONItem
		  If ID.Left(2) <> "tt" Then
		    JSONString = DefineEncoding( sckt.Get( TVCore.URL( "Actors", ID ), TimeOut ), Encodings.UTF8 )
		    sckt.Close
		    
		    'JSONString = JSONString.XML2JSON
		    'If JSONString.ValidJSON("TVDB Actors") Then TVDBActors.Load JSONString
		    TVDBActors = JSONString.XML2JSON
		    If TVDBActors <> Nil And TVDBActors.HasName("Actors") And TVDBActors.ToString.InStr( 0, """Actor""") > 0 Then TVDBActors = TVDBActors.Child("Actors") 'and TVDBActors.Child("Actors").HasName("Actor") And TVDBActors.Child("Actors").Child("Actor").IsArray Then TVDBActors = TVDBActors.Child("Actors")
		    JSONString = ""
		  End If
		  
		  
		  // -- Get TVDB Art
		  // :4
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TVDB Art]" + TVInfo ) Else dlgProgress.debug( "[TVDB Art]" + TVInfo )
		  Dim TVDBArt as New JSONItem
		  If ID.Left(2) <> "tt" Then
		    JSONString = DefineEncoding( sckt.Get( TVCore.URL( "Art", ID ), TimeOut ), Encodings.UTF8 )
		    sckt.Close
		    
		    'JSONString = JSONString.XML2JSON
		    'If JSONString.ValidJSON( "TVDB Art" ) Then TVDBArt.Load JSONString
		    TVDBArt = JSONString.XML2JSON
		    'If TVDBArt.HasName("Banners") And TVDBArt.ToString.InStr("\""Banner\""") > 0 Then TVDBArt = TVDBArt.Child("Banners") 'And TVDBArt.Child("Banners").HasName("Banner") And TVDBArt.Child("Banners").Child("Banner").IsArray Then TVDBArt = TVDBArt.Child("Banners")
		    If TVDBArt <> Nil And TVDBArt.HasName("Banners") And TVDBArt.ToString.InStr("""Banner""") > 0 And TVDBArt.Child("Banners").HasName("Banner") Then TVDBArt = TVDBArt.Child("Banners").Child("Banner")
		    JSONString = ""
		  End If
		  
		  
		  // -- Get IMDb Info
		  // :5
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[IMDb]" + TVInfo ) Else dlgProgress.debug( "[IMDb]" + TVInfo )
		  Dim IMDbID as String = ID
		  If IMDbID.Left(2) <> "tt" Then
		    IMDbID = ""
		    If TVDB <> Nil And TVDB.HasName("IMDB_ID") And TVDB.Value("IMDB_ID") <> "" Then IMDbID = TVDB.Value("IMDB_ID")
		  End If
		  
		  Dim IMDb as New JSONItem
		  If IMDbID.Left(2) = "tt" Then IMDb = GetIMDbJSON( IMDbID )
		  
		  
		  // -- Get FanartTV Info
		  // :6
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[Fanart.TV Art]" + TVInfo ) Else dlgProgress.debug( "[Fanart.TV]" + TVInfo )
		  JSONString = Trim( DefineEncoding( sckt.Get( URLCore.FanartTV( ID ), TimeOut ), Encodings.UTF8 ) )
		  
		  'Dim FirstBracketLoc as Integer = JSONString.InStr(2, "{" )
		  'JSONString = Trim( JSONString.Right( JSONString.Len - FirstBracketLoc + 1) )
		  
		  Dim FanartTVJSON as New JSONItem
		  If JSONString.ValidJSON("Fanart.TV") Then FanartTVJSON.Load JSONString
		  JSONString = ""
		  
		  
		  // -- TVRage
		  // :7
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TVRage]" + TVInfo ) Else dlgProgress.debug( "[TVRage]" + TVInfo )
		  Dim Title as String
		  if IMDb <> nil and IMDb.HasName("ORIGINAL_TITLE") then Title = IMDb.Value("ORIGINAL_TITLE")
		  If title = "" and TVDB <> Nil And TVDB.HasName("SeriesName") Then Title = TVDB.Value("SeriesName")
		  If Title = "" And IMDb <> Nil and IMDb.HasName("TITLE") Then Title = IMDb.Value("TITLE")
		  
		  dim year as String
		  if IMDb <> Nil and IMDb.HasName("YEAR") then year = IMDb.Value("YEAR")
		  
		  if Title <> "" then
		    ShowStatus( Title, ID )
		  end if
		  
		  
		  // -- TV Tunes
		  // :8
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TVTunes]" + TVInfo ) Else dlgProgress.debug( "[TVTunes]" + TVInfo )
		  If Preferences.Prefs.boolForKey("AutoDownloadThemesong") And Title <> "" Then GetThemeSong( Title )
		  
		  
		  // ## ---------- Process Information ---------- ##
		  // :8
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kProcessing + ":", Trim( TVInfo ) ) Else dlgProgress.debug( Loc.kProcessing + TVInfo )
		  
		  // ## IDs
		  TVAttr.ID_TVDB   = ID
		  TVAttr.ID_IMDb   = IMDbID
		  'TVAttr.ID_TVRage = TVRageID
		  
		  If TVDB <> Nil And TVDB.HasName("IMDB_ID") And TVDB.Value("IMDB_ID") <> "" Then
		    TVAttr.ID_IMDb = TVDB.Value("IMDB_ID")
		  ElseIf IMDb <> Nil And IMDb.HasName("TITLE_ID") And IMDb.Value("TITLE_ID") <> "" Then
		    TVAttr.ID_IMDb = IMDb.Value("TITLE_ID")
		  End If
		  
		  If TVDB <> Nil And TVDB <> Nil And TVDB.HasName("id") And TVDB.Value("id") <> "" Then TVAttr.ID_TVDB = TVDB.Value("id")
		  'If TVRage <> Nil And TVRage.HasName("showid") And TVRage.Value("showid") <> "" Then TVAttr.ID_TVRage = TVRage.Value("showid")
		  
		  
		  // ## Title
		  If Update Then TVAttr.Title = PrevTitle
		  'If TVAttr.Title = "" And IMDb.HasName("USA_TITLE") And Lang = "en" Then TVAttr.Title = IMDb.Value("USA_TITLE")
		  If TVAttr.Title = "" And IMDb <> Nil And IMDb.HasName("TITLE") And Lang <> "en" Then TVAttr.Title = IMDb.Value("TITLE")
		  If TVAttr.Title = "" And TVDB <> Nil And TVDB.HasName("SeriesName") Then TVAttr.Title = TVDB.Value("SeriesName")
		  TVAttr.Title = ReplaceAll( TVAttr.Title, "&amp;", "&" )
		  
		  // ## Title Original
		  If Update Then TVAttr.TitleOriginal = PrevTitleOriginal
		  If TVAttr.TitleOriginal = "" And IMDb <> Nil And IMDb.HasName("ORIGINAL_TITLE") And IMDb.Value("ORIGINAL_TITLE") <> "" Then TVAttr.TitleOriginal = IMDb.Value("ORIGINAL_TITLE")
		  If TVAttr.TitleOriginal = "" And IMDb <> Nil And IMDb.HasName("TITLE")          And IMDb.Value("TITLE")          <> "" Then TVAttr.TitleOriginal = IMDb.Value("TITLE")
		  If TVAttr.TitleOriginal = "" And TVAttr.Title <> "" Then TVAttr.TitleOriginal = TVAttr.Title
		  If TVAttr.TitleOriginal <> "" And TVAttr.Title = "" Then TVAttr.Title = TVAttr.TitleOriginal
		  TVAttr.TitleOriginal = ReplaceAll( TVAttr.TitleOriginal, "&amp;", "&" )
		  
		  // ## Sort Title
		  If PrevTitleSort = "" Then TVAttr.TitleSort = Articulator( TVAttr.Title ) Else TVAttr.TitleSort = PrevTitleSort
		  
		  // ## Tagline
		  If IMDb <> Nil and IMDb.HasName("TAGLINE") And IMDb <> Nil And IMDb.Value("TAGLINE") <> "" Then TVAttr.DescriptionTagline = IMDb.Value("TAGLINE")
		  TVAttr.DescriptionTagline = Trim( RegExThis( TVAttr.DescriptionTagline, "\(Season.*\)|\(Series.*\)", "" ) )
		  If TVAttr.DescriptionTagline <> "" Then TVAttr.DescriptionTaglines.Append TVAttr.DescriptionTagline
		  TVAttr.DescriptionTagline = ReplaceAll( TVAttr.DescriptionTagline, "&amp;", "&" )
		  
		  // Extra Taglines
		  If IMDb <> Nil And IMDb.HasName("TAGLINES") Then
		    For i as Integer = 0 to IMDb.Child("TAGLINES").Count - 1
		      TVAttr.DescriptionTaglines.Append Trim( RegExThis( IMDb.Child("TAGLINES").Value(i), "\(Season.*\)|\(Series.*\)", "" ) )
		    Next
		    TVAttr.DescriptionTaglines = RemoveDuplicatesFromArray( TVAttr.DescriptionTaglines )
		    If TVAttr.DescriptionTagline = "" And TVAttr.DescriptionTaglines.Ubound > -1 Then TVAttr.DescriptionTagline = TVAttr.DescriptionTaglines(0)
		  End If
		  
		  
		  
		  // ## Plot
		  If TVDB <> Nil And TVDB.HasName("Overview") And TVDB.Value("Overview") <> "" Then TVAttr.DescriptionPlot = DecodeHTML( TVDB.Value("Overview") )
		  // Partial storyline
		  If ( Lang = "en" OR Lang = "gb" OR TVAttr.DescriptionPlot = "" ) And IMDb <> Nil And IMDb.HasName("STORYLINE")  And IMDb.Value("STORYLINE") <> "" And IMDb.Value("STORYLINE").StringValue.Len > TVAttr.DescriptionPlot.Len Then
		    TVAttr.DescriptionPlot = IMDb.Value("STORYLINE")
		  End If
		  
		  // Full Storyline
		  If ( Lang = "en" OR Lang = "gb" OR TVAttr.DescriptionPlot = "" ) And IMDb <> Nil And IMDb.HasName("STORYLINES") And IMDb.Child("STORYLINES").Count > 0 Then
		    Dim Plot as String = IMDb.Child("STORYLINES").Value( IMDb.Child("STORYLINES").Count -1 )
		    
		    If Plot.InStr( 0, EndOfLine.UNIX + EndOfLine.UNIX + EndOfLine.UNIX + EndOfLine.UNIX + EndOfLine.UNIX ) > 0 Then
		      
		      Dim sx1 as Integer = Plot.InStr( 0, EndOfLine.UNIX + EndOfLine.UNIX + EndOfLine.UNIX + EndOfLine.UNIX + EndOfLine.UNIX )
		      Plot = Plot.Left( sx1 )
		      'If Len( Plot )  > Len( TVAttr.DescriptionPlot ) Then
		      TVAttr.DescriptionPlot = TVAttr.DescriptionPlot.Left( sx1 )
		    End If
		    
		  End If
		  
		  
		  // ## Outline
		  If IMDb <> Nil And IMDb.HasName("PLOT") And IMDb.Value("PLOT") <> "" Then TVAttr.DescriptionOutline = DecodeHTML( IMDb.Value("PLOT") )
		  
		  If ( TVAttr.DescriptionPlot = "" And TVAttr.DescriptionPlot <> "" ) OR ( Lang <> "en" And Lang <> "gb" And TVAttr.DescriptionPlot <> "" ) Then
		    Dim sx1 as Integer = TVAttr.DescriptionPlot.InStr( 0, "." ) + 1
		    If sx1 > 0 Then TVAttr.DescriptionOutline = TVAttr.DescriptionPlot.Left( sx1 )
		  End If
		  
		  
		  // ## Premieré
		  If TVDB <> Nil And TVDB.HasName("FirstAired") And TVDB.Value("FirstAired") <> "" Then TVAttr.DatePremiered = TVDB.Value("FirstAired") // Date
		  If Val( TVAttr.DatePremiered.left(4) ) > 1000 Then TVAttr.DateYear = Val( TVAttr.DatePremiered.Left(4) ) // Year
		  if TVAttr.DateYear = -1 and IMDb <> Nil and IMDb.HasName("YEAR") then TVAttr.DateYear = IMDb.Value("YEAR")
		  
		  
		  // ## MPAA
		  'If TVDB.HasName("ContentRating") And TVDB.Value("ContentRating") <> "" Then TVAttr.RatingMPAA = TVDB.Value("ContentRating")
		  'If IMDb.HasName("MPAA_RATING") And Trim( IMDb.Value("MPAA_RATING") ) <> "" Then TVAttr.RatingMPAA = IMDb.Value("MPAA_RATING")
		  
		  If IMDb <> Nil And IMDb.HasName("CERTIFICATIONS") Then
		    For i as Integer = 0 to IMDb.Child("CERTIFICATIONS").Count -1
		      TVAttr.RatingCertification.Append IMDb.Child("CERTIFICATIONS").Value(i)
		    Next
		  End If
		  TVAttr.RatingCertification = RemoveDuplicatesFromArray( TVAttr.RatingCertification )
		  
		  
		  Dim USAMPAA as String
		  For i as Integer = 0 to TVAttr.RatingCertification.Ubound
		    If USAMPAA = "" And FlagCountry( TVAttr.RatingCertification(i).NthField(":", 1) ) = "en" Then USAMPAA = TVAttr.RatingCertification(i).NthField( ":", 2 )
		    If FlagCountry( TVAttr.RatingCertification(i).NthField(":", 1) )  = Preferences.Prefs.stringForKey("DBLanguage") Then
		      TVAttr.RatingMPAA = TVAttr.RatingCertification(i).NthField(":", 2)
		      'If TVAttr.ART_MPAARating <> Nil Then Exit
		    End If
		  Next
		  If TVAttr.RatingMPAA = "" Then TVAttr.RatingMPAA = USAMPAA
		  
		  If Trim( TVAttr.RatingMPAA ) = "" And TVDB <> Nil And TVDB.HasName("ContentRating") Then TVAttr.RatingMPAA = TVDB.Value("ContentRating")
		  
		  
		  // ## Rating
		  If TVDB <> Nil And TVDB.HasName("Rating") And TVDB.Value("Rating") <> "" Then TVAttr.Rating = Val( TVDB.Value("Rating") )
		  If TVDB <> Nil And TVDB.HasName("RatingCount") And TVDB.Value("RatingCount") <> "" Then TVAttr.RatingVotes = Val( TVDB.Value("RatingCount") )
		  
		  If IMDb <> Nil And IMDb.HasName("RATING") And IMDb.Value("RATING") <> "" Then TVAttr.Rating = Val( IMDb.Value("RATING") )
		  If IMDb <> Nil And IMDb.HasName("VOTES")  And IMDb.Value("VOTES")  <> "" Then TVAttr.RatingVotes = Val( IMDb.Value("VOTES").StringValue.ReplaceAll(",","") )
		  
		  
		  // ## Genres
		  ReDim TVAttr.Genres(-1)
		  TVAttr.Genres = PrevGenres
		  Dim tmpArray() as String
		  
		  // TVDB
		  If TVDB <> Nil And TVDB.HasName("Genre") Then tmpArray = Split( TVDB.Value("Genre").StringValue.ReplaceAll("Science-Fiction","Science Fiction").ReplaceAll(" and ", " & "), "|" )
		  
		  // IMDB
		  If ( Lang = "en" or Lang = "gb" ) And IMDb <> Nil And IMDb.HasName("GENRES") Then
		    Dim Arry() as String = JSONArray( IMDb.Child("GENRES") )
		    For i as Integer = 0 to Arry.Ubound
		      tmpArray.Append Arry(i).ReplaceAll("Sci-Fi", "Science Fiction").ReplaceAll(" and ", " & ")
		    Next
		  End If
		  
		  // Remove empties, and add to genres
		  For i as Integer = 0 to tmpArray.Ubound
		    If Trim( tmpArray(i) ) <> "" Then TVAttr.Genres.Append tmpArray(i)
		  Next
		  
		  TVAttr.Genres = RemoveDuplicatesFromArray( TVAttr.Genres )
		  
		  // Apparantly, boxee only supports uppercase genres?
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then
		    For i as Integer = 0 to TVAttr.Genres.Ubound
		      TVAttr.Genres(i) = TVAttr.Genres(i).Uppercase
		    Next
		  End If
		  
		  
		  // ## Studios
		  If TVDB <> Nil And TVDB.HasName("Network") And TVDB.Value("Network") <> "" Then TVAttr.TVNetwork = TVDB.Value("Network")
		  If IMDb <> Nil And IMDb.HasName("STUDIOS") Then
		    For i as Integer = 0 to IMDb.Child("STUDIOS").Count - 1
		      TVAttr.Studios.Append IMDb.Child("STUDIOS").Value(i)
		    Next
		  End If
		  
		  // ## Country
		  If IMDb <> Nil And IMDb.HasName("COUNTRY") Then
		    For i as Integer = 0 to IMDb.Child("COUNTRY").Count - 1
		      TVAttr.Countries.Append IMDb.Child("COUNTRY").Value(i)
		    Next
		  End If
		  
		  TVAttr.Countries = RemoveDuplicatesFromArray( TVAttr.Countries )
		  
		  // ## Language
		  If IMDb <> Nil And IMDb.HasName("LANGUAGE") Then
		    For i as Integer = 0 to IMDb.Child("LANGUAGE").Count - 1
		      TVAttr.Languages.Append IMDb.Child("LANGUAGE").Value(i)
		    Next
		  End If
		  
		  // ## Recommendations
		  If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" And Preferences.Prefs.boolForKey("GetRecommendations") Then
		    If IMDb <> Nil And IMDb.HasName("RECOMMENDATIONS") And IMDb.Child("RECOMMENDATIONS").IsArray And IMDb.Child("RECOMMENDATIONS").Count > 0 Then
		      For i as Integer = 0 to IMDb.Child("RECOMMENDATIONS").Count - 1
		        Dim RecTitle as String = Trim( RegExThis( IMDb.Child("RECOMMENDATIONS").Value(i), "\[.*\]", "" ) )
		        Dim RecID as String    = Trim( RegExThis( IMDb.Child("RECOMMENDATIONS").Value(i), ".*\[", "" ) ).ReplaceAll("]","")
		        If RecTitle = "" Then RecTitle = Loc.kNotAvailable
		        
		        TVAttr.RecShows.Append    RecTitle
		        TVAttr.RecShow_IDs.Append RecID
		      Next
		    End If
		  End If
		  
		  // ## Director(s)
		  If IMDb <> Nil And IMDb.HasName("DIRECTORS") Then
		    For i as Integer = 0 to IMDb.Child("DIRECTORS").Count - 1
		      If TVAttr.CreditDirector = "" Then
		        TVAttr.CreditDirector = IMDb.Child("DIRECTORS").Value(i)
		      Else
		        TVAttr.CreditDirector = TVAttr.CreditDirector + ", " + IMDb.Child("DIRECTORS").Value(i)
		      End If
		    Next
		  End If
		  
		  // ## Writer(s)
		  If IMDb <> Nil And IMDb.HasName("WRITERS") Then
		    For i as Integer = 0 to IMDb.Child("WRITERS").Count - 1
		      If TVAttr.CreditWriter = "" Then
		        TVAttr.CreditWriter = IMDb.Child("WRITERS").Value(i)
		      Else
		        TVAttr.CreditWriter = TVAttr.CreditWriter + ", " + IMDb.Child("WRITERS").Value(i)
		      End If
		    Next
		  End If
		  
		  // ## Actors Starring
		  If IMDb <> Nil And IMDb.HasName("STARS") Then
		    For i as Integer = 0 to IMDb.Child("STARS").Count - 1
		      TVAttr.ActorStars.Append IMDb.Child("STARS").Value(i)
		    Next
		  End If
		  
		  // ## Actors
		  // -- Prefer IMDb over TVDB
		  If IMDb <> Nil And IMDb.HasName("CAST") And IMDb.HasName("ROLES") ANd IMDb.HasName("CASTTHUMBS") Then
		    
		    For i as Integer = 0 to IMDb.Child("CAST").Count -1
		      
		      // If only one item, arrayify it.
		      If TVDBActors <> Nil And TVDBActors.HasName("Actor") And NOT TVDBActors.Child("Actor").IsArray Then
		        Dim jItem as New JSONItem
		        jItem = TVDBActors.Child("Actor")
		        TVDBActors.Value("Actor") = New JSONItem
		        TVDBActors.Child("Actor").Value(0) = jItem
		      End If
		      
		      // Match names with TVDB ID's
		      If TVDBActors <> Nil And TVDBActors.HasName("Actor") Then
		        Dim b as Boolean = False
		        For n as Integer = 0 to TVDBActors.Child("Actor").Count -1
		          If TVDBActors.Child("Actor").Child(n).Value("Name") = IMDb.Child("CAST").Value(i) Then
		            TVAttr.Actor_ID.Append TVDBActors.Child("Actor").Child(n).Value("id")
		            b = True
		            Exit
		          End If
		        Next
		        If NOT b Then TVAttr.Actor_ID.Append ""
		      Else
		        TVAttr.Actor_ID.Append ""
		      End If
		      
		      TVAttr.Actor_Name.Append      trim( IMDb.Child("CAST").Value(i) )
		      TVAttr.Actor_Role.Append      Trim( IMDb.Child("ROLES").Value(i) )
		      TVAttr.Actor_ThumbURL.Append  IMDb.Child("CASTTHUMBS").Value(i)
		    Next
		    
		  ElseIf TVDBActors <> Nil And TVDBActors.HasName("Actor") And TVDBActors.Child("Actor").IsArray Then
		    For i as Integer = 0 To TVDBActors.Child("Actor").Count - 1
		      Dim jItem as New JSONItem
		      jItem = TVDBActors.Child("Actor").Child(i)
		      
		      If jItem.HasName("id")    Then TVAttr.Actor_ID.Append       jItem.Value("id")   Else TVAttr.Actor_ID.Append   ""
		      If jItem.HasName("Name")  Then TVAttr.Actor_Name.Append     jItem.Value("Name") Else TVAttr.Actor_Name.Append ""
		      If jItem.HasName("Role")  Then TVAttr.Actor_Role.Append     jItem.Value("Role") Else TVAttr.Actor_Role.Append ""
		      If jItem.HasName("Image") And jItem.Value("Image") <> "" Then TVAttr.Actor_ThumbURL.Append TVCore.GraphicsPath + jItem.Value("Image") Else TVAttr.Actor_ThumbURL.Append ""
		    Next
		  End If
		  
		  // Write NFO
		  TVAttr.NFOWrite( TVAttr.FolderParent )
		  
		  // 18: Get Episode Info
		  TVCore.EpisodeUpdate( TVAttr.ID_TVDB )
		  
		  // 19: Auto Manage TV Shows Folder
		  If NOT CommonCore.MassSearch And Preferences.Prefs.boolForKey("AutoManageMedia") Then SingleRenamer( TVAttr.FolderParent, -1, True )
		  
		  // 20: Download ExtraArt
		  GetArt( TVDBArt, FanartTVJSON )
		  
		  
		  // 20: Write NFO file.
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kMetadata + ":", Loc.kWritingNFO ) Else dlgProgress.debug( Loc.kWritingNFO )
		  TVAttr.NFOWrite( TVAttr.FolderParent )
		  
		  
		  // Copy file to "folder.jpg".
		  Dim FolderIMG as FolderItem
		  Select Case Preferences.Prefs.stringForKey( "FolderJPGForFileTV" )
		    
		  Case Loc.kPoster
		    FolderIMG = TVAttr.FolderParent.Child("poster.jpg")
		  Case Loc.kBanner
		    FolderIMG = TVAttr.FolderParent.Child("banner.jpg")
		  Case Loc.kLogo
		    FolderIMG = TVAttr.FolderParent.Child("logo.png")
		  Case Loc.kClearArt
		    FolderIMG = TVAttr.FolderParent.Child("clearart.png")
		  Case Loc.kCharacterArt
		    FolderIMG = TVAttr.FolderParent.Child("character.png")
		  Case Loc.kThumb
		    FolderIMG = TVAttr.FolderParent.Child("landscape.jpg")
		    
		  End Select
		  
		  If FolderIMG <> Nil And FolderIMG.Exists Then FolderIMG.CopyFileTo( TVAttr.FolderParent.Child( "folder" + "." + FolderIMG.Extension ) )
		  
		  
		  // Download actor images.
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Loc.kActorThumbs + "..." ) Else dlgProgress.Debug( Loc.kDownloading + " " + Loc.kActorThumbs + "..." )
		  If Preferences.Prefs.boolForKey("AutoDownloadActorThumbs") Then
		    If NOT TVAttr.FolderParent.Child(".actors").Exists Then TVAttr.FolderParent.Child(".actors").CreateAsFolder
		    If SymLink( TVAttr.FolderParent.Child( ".actors" ), TVAttr.FolderParent.Child( "actors" ) ) Then
		      // Created symlink
		    End If
		    
		    Dim ActorFolder as FolderItem = TVAttr.FolderParent.Child(".actors")
		    If ActorFolder = Nil OR NOT ActorFolder.Exists Then ActorFolder = TVAttr.FolderParent.Child("actors")
		    
		    Dim Max as Integer = TVAttr.Actor_ThumbURL.Ubound
		    If Preferences.Prefs.integerForKey( "MaxActors" ) > 0 And Preferences.Prefs.integerForKey("MaxActors") <= Max Then Max = Preferences.Prefs.integerForKey("MaxActors")
		    
		    If ActorFolder <> Nil And ActorFolder.Exists Then
		      For i as Integer = 0 to Max
		        Dim ActorFile as FolderItem = ActorFolder.Child( TVAttr.Actor_Name(i).ReplaceAll(":", "_").ReplaceAll(" ", "_") + ".jpg" )
		        
		        If TVAttr.Actor_ThumbURL(i) <> "" And TVAttr.Actor_Name(i) <> "" And NOT ActorFile.Exists Then
		          dlgProgress.Debug( Loc.kDownloading + " " + Str( i + 1 ) + Loc.k1of2 + Str( Max + 1 )  + " " + TVAttr.Actor_Name(i) + " " + Loc.kThumb.Lowercase + "..." )
		          
		          
		          dim data as string = sckt.Get( TVAttr.Actor_ThumbURL(i), TimeOut )
		          if data.Contains("<H1>ERROR</H1>") then
		            'Break
		            
		          elseif data <> "" then
		            'If Sckt.Get( TVAttr.Actor_ThumbURL(i), ActorFile, TimeOut ) Then
		            'TVAttr.Actor_ThumbURL(i) = ActorFile.ShellPath.ReplaceAll( "\", "" )
		            'Else
		            'Sckt.Close
		            'If ActorFile IsA FolderItem Then ActorFile.Delete
		            'End If
		            'Sckt.Close
		            URL2Picture( TVAttr.Actor_ThumbURL(i), ActorFile.Parent, ActorFile.Name )
		            if ActorFile <> Nil and ActorFile.Exists then
		              TVAttr.Actor_ThumbURL(i) = ActorFile.ShellPath.ReplaceAll("\", "")
		            end if
		          end if // @END data.Contains("<H1>ERROR</H1>")
		          
		        ElseIf ActorFile.Exists Then
		          TVAttr.Actor_ThumbURL(i) = ActorFile.ShellPath.ReplaceAll( "\", "" )
		        End If
		        
		      Next
		    End If
		    
		    dlgProgress.Debug ""
		  End If
		  
		  TVAttr.NFOWrite( TVAttr.FolderParent )
		  
		  dlgProgress.Debug( "" )
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IMDb2TVDB(IMDbID as String) As String
		  Dim Sckt as New TVDBSckt
		  
		  If IMDbID.Left(2) = "tt" Then
		    Dim XMLString as String = DefineEncoding( sckt.Get( TVCore.URL( "InfoAlias", IMDbID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    sckt.Close
		    
		    'JSONString = JSONString.XML2JSON
		    
		    Dim TVDBAlias as New JSONItem
		    'If JSONString.ValidJSON("TVDB Alias") Then TVDBAlias.Load JSONString
		    TVDBAlias = XMLString.XML2JSON
		    
		    If TVDBAlias = Nil Then Return ""
		    
		    If TVDBAlias.HasName("Data") And TVDBAlias.ToString.InStr( 0, "Series" ) > 0 And TVDBAlias.Child("Data").HasName("Series") And TVDBAlias.Child("Data").Child("Series").HasName("id") Then
		      Return TVDBAlias.Child("Data").Child("Series").Value("id")
		    Else
		      Return IMDbID
		    End If
		    
		    
		  Else
		    Return IMDbID
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProcessEpGuide(XMLString as String, SeriesID as String) As JSONItem
		  
		  Dim Info as String = "ProcessEpGuide( XMLString, " + SeriesID + " ) - "
		  
		  App.ErrorMessage = Info + XMLString
		  
		  If XMLString.InStr( 0, "<!DOCTYPE HTML" ) > 0 Then Return Nil
		  
		  App.ErrorMessage = Info + "Create destination"
		  XMLString = XMLString.ReplaceAll( XMLString.MyMid( "<series>", "</series>" ), "" ).ReplaceAll( "<Series></Series>", "" )
		  Dim Destination as FolderItem = Preferences.fAppSupport.Child( "EpisodeGuides" )
		  If Destination <> Nil And NOT Destination.Exists Then Destination.CreateAsFolder
		  'Dim JSONString as String = XMLString.XML2JSON
		  
		  If Destination <> Nil Then
		    If Destination.Child( SeriesID + ".json" ).Exists Then Destination.Child( SeriesID + ".json" ).MoveFileTo( TVAttr.FolderParent.Child( "EpisodeGuide.json" ) )
		  Else
		    Return Nil
		  End If
		  Destination = TVAttr.FolderParent
		  
		  App.ErrorMessage = Info + "Load the old guide"
		  // ## Load the old guide.
		  dlgProgress.Debug ( Loc.kReadingInfo + ": " + Loc.kEpisodeGuide.Lowercase )
		  Dim OldGuide as New JSONItem
		  Dim JSONString as String = ReadTextFile( Destination.Child(  "EpisodeGuide.json" ) )
		  If JSONString <> "" Then OldGuide.Load( JSONString )
		  If OldGuide <> Nil And OldGuide.HasName("episodes") Then OldGuide = OldGuide.Child("episodes")
		  
		  
		  If OldGuide <> Nil And NOT OldGuide.IsArray Then
		    App.ErrorMessage = Info + "Turn the old guide into an array"
		    Dim Daddy as New JSONItem
		    Daddy.Child(0) = OldGuide
		    OldGuide = Daddy
		  End If
		  
		  
		  App.ErrorMessage = Info + "Set the new guide"
		  // ## Set the New Guide.
		  Dim NewGuide as New JSONItem
		  'NewGuide.Load( XMLString.ReplaceAll("\","").XML2JSON )
		  If XMLString <> "" Then NewGuide = XMLString.XML2JSON
		  If NewGuide = Nil OR Len( NewGuide.ToString ) < 100 Then Return Nil
		  If NewGuide <> Nil And NewGuide.HasName("Data") And NewGuide.ToString.InStr( 0, """Episode""" ) > 0 And NewGuide.Child("Data").HasName("Episode") Then NewGuide = NewGuide.Child("Data").Child("Episode")
		  
		  
		  // If only a single episode was available, re-convert guide to Array.
		  If NOT NewGuide.IsArray Then
		    App.ErrorMessage = Info + "Turn new guide into array"
		    Dim Daddy as New JSONItem
		    Daddy.Child(0) = NewGuide
		    NewGuide = Daddy
		  End If
		  
		  
		  
		  
		  App.ErrorMessage = Info + "Create Update-Guide"
		  Dim UpdatedGuide as New JSONItem
		  UpdatedGuide.Value( "episodes" ) = New JSONItem
		  
		  If NOT CommonCore.MassSearch Then dlgProgress.Reset
		  For i as Integer = 0 to NewGuide.Count -1
		    App.ErrorMessage = Info + "UpdateGuide JSONItem( " + Str( i ) + " of " + Str( NewGuide.Count -1 ) + " )"
		    dlgProgress.Debug( Loc.kProcessing + " " + Str( i + 1 ) + Loc.k1of2 + Str( NewGuide.Count ) + " " + Loc.kEpisodes.Lowercase )
		    
		    Dim OldEpisodeData as New JSONItem, NewEpisodeData as New JSONItem, UpdateEpisodeData as New JSONItem
		    NewEpisodeData = NewGuide.Child(i)
		    
		    // Match OldEpisde to New Episode
		    If NewEpisodeData.HasName("SeasonNumber") And NewEpisodeData.HasName("EpisodeNumber") Then
		      For n as Integer = 0 to OldGuide.Count -1
		        OldEpisodeData = OldGuide.Child(n)
		        
		        If OldEpisodeData.HasName("SeasonNumber") And OldEpisodeData.Value("SeasonNumber") = NewEpisodeData.Value("SeasonNumber") And _
		          OldEpisodeData.HasName("EpisodeNumber") And OldEpisodeData.Value("EpisodeNumber") = NewEpisodeData.Value("EpisodeNumber") Then
		          Exit
		        End If
		        OldEpisodeData = Nil
		      Next
		      'If OldEpisodeData = Nil Then OldEpisodeData.Load( "" )
		    End If
		    
		    Dim dSeason, dEpisode as String
		    If NewEpisodeData.HasName("SeasonNumber") Then dSeason = NewEpisodeData.Value("SeasonNumber")
		    If NewEpisodeData.HasName("EpisodeNumber") Then dEpisode = NewEpisodeData.Value("EpisodeNumber")
		    
		    If dSeason.len  = 1 Then dSeason = "0" + dSeason
		    If dEpisode.len = 1 Then dEpisode = "0" + dEpisode
		    
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Add( Loc.kEpisodeGuide + ":", "S" + dSeason + "E" + dEpisode + " - " + ReplaceAll( NewEpisodeData.Value("EpisodeName"), "&amp;", "&" ), 1, NewGuide.Count )
		    Else
		      dlgProgress.Debug( Loc.kEpisodeGuide + ": " + "S" + dSeason + "E" + dEpisode + " - " + ReplaceAll( NewEpisodeData.Value("EpisodeName"), "&amp;", "&" ) )
		    End If
		    
		    UpdateEpisodeData.Value("id")          = NewEpisodeData.Value("id")
		    UpdateEpisodeData.Value("IMDB_ID")     = NewEpisodeData.Value("IMDB_ID")
		    UpdateEpisodeData.Value("seasonid")    = NewEpisodeData.Value("seasonid")
		    UpdateEpisodeData.Value("EpisodeName") = ReplaceAll( NewEpisodeData.Value("EpisodeName"), "&amp;", "&" )
		    UpdateEpisodeData.Value("SeasonNumber") = NewEpisodeData.Value("SeasonNumber")
		    UpdateEpisodeData.Value("EpisodeNumber") = NewEpisodeData.Value("EpisodeNumber")
		    UpdateEpisodeData.Value("DVDSeason")   = NewEpisodeData.Value("DVD_season")
		    UpdateEpisodeData.Value("DVDEpisode")  = NewEpisodeData.Value("DVD_episodenumber")
		    UpdateEpisodeData.Value("AbsoluteNumber") = NewEpisodeData.Value("absolute_number")
		    
		    // Get episode IMDB data if possible, and episode hasn't been watched yet.
		    Dim IMDbEpisode as New JSONItem
		    If UpdateEpisodeData.Value("IMDB_ID") <> "" Then
		      If ( OldEpisodeData <> Nil And OldEpisodeData.HasName("IMDB_ID") And OldEpisodeData.Value("IMDB_ID") = "" ) OR _
		        UpdateEpisodeData.HasName("Runtime") And UpdateEpisodeData.Value("Runtime") = True OR _
		        OldEpisodeData = Nil OR _
		        ( OldEpisodeData <> Nil And OldEpisodeData.HasName("Cast") And OldEpisodeData.Child("Cast").Count = 0 ) OR _
		        ( OldEpisodeData <> Nil And OldEpisodeData.HasName("plot") And OldEpisodeData.Value("plot") = "" ) Then
		        'IMDbEpisode = GetIMDbJSON( UpdateEpisodeData.Value("IMDB_ID"), True )
		      End If
		    End If
		    
		    
		    // Special deliveries
		    If NewEpisodeData.HasName("airsbefore_season") Then
		      UpdateEpisodeData.Value("airsafter_season") = NewEpisodeData.Value("airsafter_season")
		      'If NewEpisodeData.Value("airsafter_season") = "" And NewEpisodeData.Value("airsbefore_season") > 0 Then UpdateEpisodeData.Value("airsafter_season") = NewEpisodeData.Value("airsbefore_season") - 1
		      UpdateEpisodeData.Value("airsbefore_season") = NewEpisodeData.Value("airsbefore_season")
		      'If NewEpisodeData.Value("airsbefore_season") = "" And NewEpisodeData.Value("airsafter_season") > 0 Then UpdateEpisodeData.Value("airsbefore_season") = NewEpisodeData.Value("airsafter_season") + 1
		      If NewEpisodeData.HasName("airsbefore_episode") And NewEpisodeData.Value("airsbefore_episode") <> "" Then
		        UpdateEpisodeData.Value("airsbefore_episode") = NewEpisodeData.Value("airsbefore_episode")
		      Else
		        UpdateEpisodeData.Value("airsbefore_episode") = "4096"
		      End If
		    End If
		    
		    If OldEpisodeData <> Nil And OldEpisodeData.HasName("airsafterseason") Then
		      UpdateEpisodeData.Value("airsafterseason")   = OldEpisodeData.Value("airsafterseason")
		      UpdateEpisodeData.Value("airsbeforeseason")  = OldEpisodeData.Value("airsbeforeseason")
		      UpdateEpisodeData.Value("airsbeforeepisode") = OldEpisodeData.Value("airsbeforeepisode")
		    End If
		    
		    // AirDate
		    UpdateEpisodeData.Value("FirstAired") = NewEpisodeData.Value("FirstAired")
		    
		    // Runtime
		    If OldEpisodeData <> Nil And OldEpisodeData.HasName("Runtime") Then UpdateEpisodeData.Value("Runtime") = OldEpisodeData.Value("Runtime")
		    If IMDbEpisode <> Nil And IMDbEpisode.HasName("RUNTIME") Then UpdateEpisodeData.Value("Runtime") = IMDbEpisode.Value("RUNTIME")
		    
		    // Fix a bug I made
		    If UpdateEpisodeData.HasName("Runtime") And UpdateEpisodeData.Value("Runtime") = True Then UpdateEpisodeData.Remove("Runtime")
		    
		    // Rating
		    UpdateEpisodeData.Value("Rating") = NewEpisodeData.Value("Rating")
		    If OldEpisodeData <> Nil And OldEpisodeData.HasName("Rating") And OldEpisodeData.Value("Rating") <> "" Then UpdateEpisodeData.Value("Rating") = OldEpisodeData.Value("Rating")
		    If IMDbEpisode <> Nil And IMDbEpisode.HasName("RATING") Then UpdateEpisodeData.Value("Rating") = IMDbEpisode.Value("RATING")
		    
		    UpdateEpisodeData.Value("Votes") = NewEpisodeData.Value("RatingCount")
		    If IMDbEpisode <> Nil And IMDbEpisode.HasName("VOTES") Then UpdateEpisodeData.Value("Votes") = IMDbEpisode.Value("VOTES")
		    
		    
		    
		    // Watched status
		    If OldEpisodeData <> Nil And OldEpisodeData.HasName("watched") And OldEpisodeData.Value("watched") <> "" Then
		      UpdateEpisodeData.Value("watched") = OldEpisodeData.Value("watched")
		    Else
		      UpdateEpisodeData.Value("watched") = False
		    End If
		    
		    // Description
		    // -- Outline
		    'UpdateEpisodeData.Value("outline") = ""
		    'If IMDbEpisode <> Nil And IMDbEpisode.HasName("PLOT") Then UpdateEpisodeData.Value("outline") = IMDbEpisode.Value("PLOT")
		    // -- Plot
		    UpdateEpisodeData.Value("plot") = ""
		    'If NewEpisodeData.Child("Overview").IsArray Then MessageBox "Array"
		    If NewEpisodeData.HasName("Overview") And NOT NewEpisodeData.Value("Overview").IsArray Then UpdateEpisodeData.Value("plot") = Trim( NewEpisodeData.Value("Overview") )
		    If UpdateEpisodeData.Value("plot") = "" And IMDbEpisode <> Nil And IMDbEpisode.HasName("STORYLINE") And Trim( IMDbEpisode.Value("STORYLINE") ) <> "" Then
		      // IMDb Backup
		      UpdateEpisodeData.Value("plot") = Trim( IMDbEpisode.Value("STORYLINE").StringValue.ReplaceAll("»", "") )
		    End If
		    
		    'If IMDbEpisode <> Nil And IMDbEpisode.HasName("STORYLINE") And Trim( IMDbEpisode.Value("STORYLINE") ) <> "" And _ ' IMDbEpisode.Value("STORYLINE").InStr( 0, "»" ) = 0 And _
		    '( NOT UpdateEpisodeData.HasName("Plot") OR UpdateEpisodeData.Value("Plot") = "" ) Then
		    'If Trim( IMDbEpisode.Value("STORYLINE").ReplaceAll("»", "") ) <> "" Then UpdateEpisodeData.Value("plot") = Trim( IMDbEpisode.Value("STORYLINE").ReplaceAll("»", "") )
		    'End If
		    
		    // Thumb
		    UpdateEpisodeData.Value("filename") = ""
		    If NewEpisodeData.HasName("filename") And NewEpisodeData.Value("filename") <> "" Then UpdateEpisodeData.Value("filename") = TVCore.GraphicsPath + NewEpisodeData.Value("filename")
		    // Doesn't give good results:
		    'If IMDbEpisode <> Nil And IMDbEpisode.HasName("POSTER_FULL") And IMDbEpisode.Value("POSTER_FULL") <> "" Then
		    'UpdateEpisodeData.Value("filename") = IMDbEpisode.Value("POSTER_FULL").ReplaceAll("_V1._SY0.", "_V1._SY750.")
		    'End If
		    
		    UpdateEpisodeData.Value("poster") = ""
		    If IMDbEpisode <> Nil And IMDbEpisode.HasName( "POSTER_LARGE" ) Then UpdateEpisodeData.Value("poster") = IMDbEpisode.Value("POSTER_LARGE")
		    
		    // #Credits
		    // - Directors
		    Dim Directors as String = NewEpisodeData.Value("Director")
		    If Directors.Left(1)  = "|" Then Directors = Directors.Right( Directors.Len - 1 )
		    If Directors.Right(1) = "|" Then Directors = Directors.Left(  Directors.Len - 1 )
		    Directors = Directors.ReplaceAll("|", ", ")
		    UpdateEpisodeData.Value( "director" ) = Trim( Directors )
		    
		    // - Writers
		    Dim Writers as String = NewEpisodeData.Value("Writer")
		    If Writers.Left(1)  = "|" Then Writers = Writers.Right( Writers.Len - 1 )
		    If Writers.Right(1) = "|" Then Writers = Writers.Left(  Writers.Len - 1 )
		    Writers = Writers.ReplaceAll("|", ", ")
		    UpdateEpisodeData.Value( "credits" ) = Trim( Writers )
		    
		    // - Guest Stars
		    Dim GuestStars as String = NewEpisodeData.Value("GuestStars")
		    If GuestStars.Left(1)  = "|" Then GuestStars = GuestStars.Right( GuestStars.Len - 1 )
		    If GuestStars.Right(1) = "|" Then GuestStars = GuestStars.Left(  GuestStars.Len - 1 )
		    GuestStars = GuestStars.ReplaceAll("|", ", ")
		    UpdateEpisodeData.Value( "guests" ) = Trim( GuestStars )
		    
		    // - Actors
		    'UpdateEpisodeData.Value("Cast")       = New JSONItem
		    'UpdateEpisodeData.Value("Roles")      = New JSONItem
		    'UpdateEpisodeData.Value("CastThumbs") = New JSONItem
		    
		    // Download IMDB data.
		    'If IMDbEpisode <> Nil And IMDbEpisode.HasName("CAST") Then
		    'For n as Integer = 0 to IMDbEpisode.Child("CAST").Count -1
		    'UpdateEpisodeData.Child("Cast").Value(n) = IMDbEpisode.Child("CAST").Value(n)
		    'UpdateEpisodeData.Child("Roles").Value(n) = IMDbEpisode.Child("ROLES").Value(n)
		    'UpdateEpisodeData.Child("CastThumbs").Value(n) = IMDbEpisode.Child("CASTTHUMBS").Value(n)
		    'Next
		    '
		    'ElseIf OldEpisodeData <> Nil And OldEpisodeData.HasName("Cast") Then
		    'UpdateEpisodeData.Child("Cast") = OldEpisodeData.Child("Cast")
		    'UpdateEpisodeData.Child("Roles") = OldEpisodeData.Child("Roles")
		    'UpdateEpisodeData.Child("CastThumbs") = OldEpisodeData.Child("CastThumbs")
		    'Else
		    'For n as Integer = 0 to TVAttr.Actor_Name.Ubound
		    'UpdateEpisodeData.Child("Cast").Value(n) = TVAttr.Actor_Name(n)
		    'UpdateEpisodeData.Child("Roles").Value(n) = TVAttr.Actor_Role(n)
		    'UpdateEpisodeData.Child("CastThumbs").Value(n) = TVAttr.Actor_ThumbURL(n)
		    'Next
		    'End If
		    
		    
		    // Download actor thumbnails
		    'If Preferences.Prefs.boolForKey("AutoDownloadActorThumbs") Then
		    'If NOT TVAttr.FolderParent.Child("actors").Exists Then TVAttr.FolderParent.Child("actors").CreateAsFolder
		    'For n as Integer = 0 to UpdateEpisodeData.Child("CastThumbs").Count -1
		    'Dim URL as String = Trim( UpdateEpisodeData.Child("CastThumbs").Value(n) )
		    'Dim Name as String = Trim( UpdateEpisodeData.Child("Cast").Value(n) )
		    '
		    'If URL = "" OR URL.Left(4) <> "http" OR Name = "" OR TVAttr.FolderParent.Child("actors").Child( Name + ".jpg" ).Exists Then Continue
		    '
		    'Dim sckt as New TVDBSckt
		    'If sckt.Get( URL, TVAttr.FolderParent.Child("actors").Child( Name + ".jpg" ), Preferences.Prefs.integerForKey("TimeOut") ) Then
		    'UpdateEpisodeData.Child("CastThumbs").Value(n) = TVAttr.FolderParent.Child("actors").Child( Name + ".jpg" ).ShellPath.ReplaceAll("\","")
		    'End If
		    'sckt.Close
		    '
		    'Next
		    'End If
		    
		    
		    UpdatedGuide.Child("episodes").Append UpdateEpisodeData
		    UpdatedGuide.Compact = False
		  Next
		  dlgProgress.Debug ""
		  
		  'UpdatedGuide.Compact = True
		  
		  // ## Write EpGuide to Disk.
		  WriteTextFile( UpdatedGuide.ToString, Destination.Child( "EpisodeGuide.json" ) )
		  
		  If UpdatedGuide.HasName("episodes") Then
		    Return UpdatedGuide.Child("episodes")
		  Else
		    Return UpdatedGuide
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessEpisodes(XMLString as String)
		  'If XMLString.InStr( "Website is currently unreachable" ) > 0 Then
		  'MessageBox MovieCore.kServiceUnavailable + chr(13) + chr(13) + Loc.kPleaseTryAgainLater
		  'Return
		  'End If
		  If XMLString.ValidJSON( "TVDB EpGuide", true ) Then Return
		  
		  If XMLString = "" OR XMLString.InStr( "<!DOCTYPE HTML>" ) > 0 Then Return
		  
		  App.ErrorMessage = "Let's start!"
		  
		  Dim ID as String = XMLString.MyMid( "<series>", "</series>" )
		  ID = ID.MyMid( "<id>","</id>" )
		  Dim SeriesName as String = XMLString.MyMid( "<SeriesName>", "</SeriesName>" )
		  
		  Dim EpisodeGuide as New JSONItem
		  If XMLString <> "" And ID <> "" Then EpisodeGuide = ProcessEpGuide( XMLString, ID ) Else Return
		  XMLString = ""
		  
		  'If Preferences.Prefs.boolForKey("SkipEpisodeFiles") Then Return // The user has chosen not to manage episode files.
		  
		  Dim EpisodeFiles() as FolderItem = FindEpisodeFiles( TVAttr.FolderParent )
		  Dim CurrentEpisode as FolderItem
		  
		  If NOT CommonCore.MassSearch Then dlgProgress.Reset
		  If EpisodeFiles = Nil Then Return
		  
		  Dim CurrentItem as FolderItem
		  'dlgProgress.Reset
		  dlgProgress.Add( Loc.kSearching + ":", Loc.kEpisodeFiles )
		  For i as Integer = 0 to EpisodeFiles.Ubound
		    App.ErrorMessage = "EpisodeFiles(" + Str( i ) + ") of (" + Str( EpisodeFiles.Ubound ) + ")"
		    'dlgProgress.Add( Loc.kProcessing + ":", EpisodeFiles(i).NameNoExtension, 1, EpisodeFiles.Ubound )
		    
		    If EpisodeFiles(i) = Nil OR NOT EpisodeFiles(i).Exists Then Continue
		    CurrentItem = EpisodeFiles(i)
		    Dim Parent as FolderItem = CurrentItem.Parent
		    
		    // Read previous NFO file.
		    Dim NFOFile as FolderItem = Parent.Child( CurrentItem.NameNoExtension + ".nfo" )
		    
		    // Continue if there's already an .nfo and thumbnail file.
		    Dim ImageFile as FolderItem
		    If ( Parent.Child( CurrentItem.NameNoExtension + ".jpg" ).Exists OR _
		      Parent.Child( CurrentItem.NameNoExtension + ".tbn" ).Exists OR _
		      Parent.Child( CurrentItem.NameNoExtension + "-thumb.jpg" ).Exists OR _
		      Parent.Child( CurrentItem.NameNoExtension + "-videoimage.jpg" ).Exists ) And _
		      NFOFile <> Nil And NFOFile.Exists Then
		      Continue
		    End If
		    
		    
		    Dim ExistingNFO as New JSONItem
		    If NFOFile <> Nil And NFOFile.Exists Then
		      CurrentEpisode = EpisodeFiles(i)
		      Dim s as String = ReadTextFile( NFOFile )
		      
		      'Dim JSONString as String = ReadTextFile( NFOFile ).XML2JSON
		      'If JSONString <> "" Then ExistingNFO.Load JSONString
		      If Trim( s ).InStr( 0, "<?xml" ) > 0 Then ExistingNFO = ReadTextFile( NFOFile ).XML2JSON
		      'If Trim( s ).Contains("<?xml") And s.MyMid("<plot>","</plot>") <> "" Then Continue
		      If ExistingNFO <> Nil And ExistingNFO.HasName("episodedetails") Then ExistingNFO = ExistingNFO.Child("episodedetails")
		    End If
		    
		    
		    // Check the EpisodeGuide and match it with the current episode.
		    Dim OOxOO as String = RegExEpisode( EpisodeFiles(i) )
		    If OOxOO.InStr( "-" ) > 0 Then Continue // Negative values are no good.
		    Dim SeasonNr, Season as Integer = Val( OOxOO.NthField( "x", 1 ) )
		    Dim EpisodeNr as Integer = Val( OOxOO.NthField( "x", 2 ) )
		    
		    // Multi part episodes
		    Dim Episodes() as String = OOxOO.Split("x")
		    Dim MultiEpisode() as JSONItem
		    If Episodes.Ubound >= 2 Then
		      
		      For n as Integer = 1 to Episodes.Ubound
		        App.ErrorMessage = App.ErrorMessage + chr(13) + "MultiEpisodes(" + Str( n ) + ") of (" + Str( Episodes.Ubound ) + ") " + OOxOO
		        
		        'EpisodeNrs.Append Episodes(i)
		        Dim CurrentEpisodeNr as String = Str( Val( Episodes(n) ) )
		        Dim EpisodeName as String = Loc.kNotAvailable
		        
		        If EpisodeGuide <> Nil And EpisodeGuide.Count > 0 Then
		          For t as Integer = 0 to EpisodeGuide.Count -1
		            Dim ThisEpisode as New JSONItem
		            ThisEpisode = EpisodeGuide.Child(t)
		            
		            If ThisEpisode.HasName("SeasonNumber") And Str( ThisEpisode.Value("SeasonNumber") ) = Str( SeasonNr ) Then
		              
		              If ThisEpisode.HasName("EpisodeNumber") And Str( ThisEpisode.Value("EpisodeNumber") ) = CurrentEpisodeNr Then
		                MultiEpisode.Append ThisEpisode
		                If ThisEpisode.HasName("EpisodeName") Then EpisodeName = ReplaceAll( ThisEpisode.Value("EpisodeName"), "&amp;", "&" )
		                Exit
		              End If
		              
		            End If
		            
		            ThisEpisode = Nil
		          Next
		        End If
		        
		        
		        'For t as Integer = 0 to EpisodeGuide.Count -1
		        ''App.ErrorMessage = App.ErrorMessage + chr(13) + "EpisodeGuide(" + Str( t ) + ") of (" + Str( EpisodeGuide.Count - 1 ) + ")"
		        'Dim ThisEpisode as New JSONItem
		        'ThisEpisode = EpisodeGuide.Child(t)
		        '
		        ''If TRUE Then // Absolute order
		        '
		        'If ThisEpisode.HasName("SeasonNumber") And Val( ThisEpisode.Value("SeasonNumber") ) = SeasonNr And _
		        'ThisEpisode.HasName("EpisodeNumber") And Val( ThisEpisode.Value("EpisodeNumber") ) = Val( EpisodeNrs ) Then
		        'MultiEpisode.Append ThisEpisode
		        'If ThisEpisode.HasName("EpisodeName") Then EpisodeName = ThisEpisode.Value("EpisodeName")
		        'Exit
		        'End If
		        '
		        ''Else // DVD order
		        ''
		        ''Dim DVDSeason, DVDEpisode as Integer
		        ''If ThisEpisode.HasName("DVD_season") And ThisEpisode.Value("DVD_season") <> "" Then
		        ''DVDSeason = ThisEpisode.Value("DVD_season")
		        ''ElseIf ThisEpisode.HasName("SeasonNumber") Then
		        ''DVDSeason = ThisEpisode.Value("SeasonNumber")
		        ''End If
		        ''
		        ''If ThisEpisode.HasName("DVD_episodenumber") And ThisEpisode.Value("DVD_episodenumber") <> "" Then
		        ''DVDEpisode = ThisEpisode.Value("DVD_episodenumber")
		        ''ElseIf ThisEpisode.HasName("EpisodeNumber") Then
		        ''DVDEpisode = ThisEpisode.Value("EpisodeNumber")
		        ''End If
		        ''
		        ''If DVDSeason = SeasonNr And DVDEpisode = Val( EpisodeNrs ) Then
		        ''MultiEpisode.Append ThisEpisode
		        ''Exit
		        ''End If
		        ''
		        ''End If
		        '
		        'ThisEpisode = Nil
		        'Next
		        
		        // Display progress information.
		        'Dim SeasonDisplay as String = Str( SeasonNr )
		        'If SeasonDisplay.Len = 1 Then SeasonDisplay = "0" + SeasonDisplay
		        
		        'Dim EpisodeDisplay as String = Str( Episodes(n) )
		        'If EpisodeDisplay.Len = 1 Then EpisodeDisplay = "0" + EpisodeDisplay
		        
		        App.ErrorMessage = App.ErrorMessage + chr(13) + "Show drogress dialog"
		        If NOT CommonCore.MassSearch Then
		          dlgProgress.Add( Loc.kEpisodes + ":", "S" + LeadingZero( SeasonNr ) + "E" + LeadingZero( Val( Episodes(n) ) ) + " - " + EpisodeName, 1, EpisodeGuide.Count )
		        Else
		          dlgProgress.Debug( "S" + LeadingZero( SeasonNr ) + "E" + LeadingZero( Val( Episodes(n) ) ) + " - " + EpisodeName )
		        End If
		        
		        
		      Next
		      
		      
		      App.ErrorMessage = "Multi-Episode Fault writing NFO"
		      If MultiEpisode.Ubound > -1 Then
		        EpisodeFiles(i) = TVAttr.EpisodeNFO( Nil, EpisodeFiles(i), MultiEpisode )
		      End If
		      
		    Else
		      'If EpisodeNrs.Ubound = 3
		      
		      If SeasonNr = -1 Then SeasonNr = 1
		      
		      If ExistingNFO <> Nil And ExistingNFO.HasName("season") And ExistingNFO.Value("season") <> "" Then SeasonNr = ExistingNFO.Value("season")
		      If ExistingNFO <> Nil And ExistingNFO.HasName("episode") And ExistingNFO.Value("episode") <> "" Then EpisodeNr = ExistingNFO.Value("episode")
		      
		      
		      // Match episode to episodeguide NFO.
		      Dim ThisEpisode as New JSONItem
		      If EpisodeGuide = Nil Then Continue
		      For n as Integer = 0 to EpisodeGuide.Count -1
		        App.ErrorMessage = App.ErrorMessage + chr(13) + "EpisodeGuide(" + Str( n ) + ") of (" + Str( EpisodeGuide.Count - 1 ) + ")"
		        ThisEpisode = EpisodeGuide.Child(n)
		        
		        If ThisEpisode.HasName("SeasonNumber") And Val( ThisEpisode.Value("SeasonNumber") ) = SeasonNr And _
		        ThisEpisode.HasName("EpisodeNumber") And Val( ThisEpisode.Value("EpisodeNumber") ) = EpisodeNr Then Exit
		        ThisEpisode = Nil
		      Next
		      If ThisEpisode = Nil Then Continue
		      
		      
		      // Display progress information.
		      Dim SeasonDisplay as String = Str( SeasonNr )
		      'If SeasonDisplay.Len = 1 Then SeasonDisplay = "0" + SeasonDisplay
		      
		      Dim EpisodeDisplay as String = Str( EpisodeNr )
		      'If EpisodeDisplay.Len = 1 Then EpisodeDisplay = "0" + EpisodeDisplay
		      
		      If NOT CommonCore.MassSearch Then
		        dlgProgress.Add( Loc.kEpisodes + ":", "S" + LeadingZero( SeasonNr ) + "E" + LeadingZero( EpisodeNr ) + " - " + ThisEpisode.Value("EpisodeName"), 1, EpisodeGuide.Count )
		      Else
		        dlgProgress.Debug( "S" + LeadingZero( SeasonNr ) + "E" + LeadingZero( EpisodeNr ) + " - " + ThisEpisode.Value("EpisodeName") )
		      End If
		      
		      App.ErrorMessage = "Single-Episode fault writing NFO"
		      EpisodeFiles(i) = TVAttr.EpisodeNFO( ThisEpisode, EpisodeFiles(i) )
		      
		    End If
		    
		    If MultiEpisode.Ubound <= -1 Then Continue
		  Next
		  
		  
		  dlgProgress.Debug ""
		  App.ErrorMessage = ""
		  
		  Exception err as XmlException
		    'Dim w as New wndBugReporter
		    If CurrentEpisode <> Nil Then
		      'w.Init( err, CurrentEpisode.Parent.ShellPath.ReplaceAll("\","") + "/" + CurrentEpisode.NameNoExtension + ".nfo" + chr( 13 ) + App.ErrorMessage )
		      if AppSettings.HandleError( err, "XmlException (caught at ProcessEpisodes()) " + chr(13) + CurrentEpisode.Parent.ShellPath.ReplaceAll("\","") + "/" + CurrentEpisode.NameNoExtension + ".nfo" + chr( 13 ) + App.ErrorMessage ) then
		        
		      end if
		    ElseIf CurrentItem <> Nil Then
		      'w.Init( err, CurrentItem.Name + chr( 13 ) + App.ErrorMessage)
		      if AppSettings.HandleError( err, "XmlException (caught at ProcessEpisodes()) " + chr(13) + CurrentItem.Name + chr( 13 ) + App.ErrorMessage ) then
		        
		      end if
		    Else
		      'w.Init( err,  chr( 13 ) + App.ErrorMessage )
		      if AppSettings.HandleError( err, "OutOfBoundsException (caught at NFOWrite) " + chr(13) + App.ErrorMessage ) then
		        
		      end if
		    End If
		    Return
		    
		  Exception err as OutOfBoundsException
		    'Dim w as New wndBugReporterOLD
		    If CurrentEpisode <> Nil Then
		      'w.Init( err, CurrentEpisode.Parent.ShellPath.ReplaceAll("\","") + "/" + CurrentEpisode.NameNoExtension + ".nfo" + chr( 13 ) + App.ErrorMessage )
		      if AppSettings.HandleError( err, "OutOfBoundsException (caught at ProcessEpisodes()) " + chr(13) + CurrentEpisode.Parent.ShellPath.ReplaceAll("\","") + "/" + CurrentEpisode.NameNoExtension + ".nfo" + chr( 13 ) + App.ErrorMessage ) then
		        
		      end if
		    ElseIf CurrentItem <> Nil Then
		      'w.Init( err, TVAttr.Title + Chr(13) + CurrentItem.Name + chr( 13 ) + App.ErrorMessage )
		      if AppSettings.HandleError( err, "OutOfBoundsException (caught at ProcessEpisodes()) " + chr(13) + TVAttr.Title + Chr(13) + CurrentItem.Name + chr( 13 ) + App.ErrorMessage ) then
		        
		      end if
		    ELse
		      'w.Init( err, chr( 13 ) + App.ErrorMessage )
		      if AppSettings.HandleError( err, "OutOfBoundsException (caught at ProcessEpisodes()) " + chr(13) + App.ErrorMessage ) then
		        
		      end if
		    End If
		    
		    Return
		    
		    
		    'MessageBox "Xml Exception ERROR " + Str( err.ErrorNumber ) + EndOfLine _
		    '+ err.Message + EndOfLine + _
		    'EndOfLine + _
		    'CurrentEpisode.Parent.ShellPath.ReplaceAll("\","") + "/" + CurrentEpisode.NameNoExtension + ".nfo"
		    'Return
		    
		    'Exception err as OutOfBoundsException
		    'MessageBox "
		    'Return
		End Sub
	#tag EndMethod


	#tag Note, Name = TVDB Api Docs
		
		http://thetvdb.com/wiki/index.php?title=Programmers_API
	#tag EndNote


	#tag Constant, Name = MirrorPath, Type = String, Dynamic = False, Default = \"https://www.thetvdb.com", Scope = Public
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

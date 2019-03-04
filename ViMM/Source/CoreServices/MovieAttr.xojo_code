#tag Module
Protected Module MovieAttr
	#tag Method, Flags = &h1
		Protected Sub ClearProperties()
		  ReDim ActorID(-1)
		  ReDim ActorName(-1)
		  ReDim ActorRole(-1)
		  ReDim ActorThumbURL(-1)
		  ReDim ActorStar(-1)
		  
		  ART_Poster     = Nil
		  ART_Fanart     = Nil
		  ART_Studio     = Nil
		  ART_MPAARating = Nil
		  
		  ReDim ART_FanartDimensions(-1)
		  ReDim ART_PosterDimensions(-1)
		  
		  ART_ClearArt   = Nil
		  ART_Logo       = Nil
		  ART_Disc       = Nil
		  ART_Banner     = Nil
		  ART_Thumb      = Nil
		  
		  ReDim ART_PosterURLs(-1)
		  ReDim ART_PosterThumbURLs(-1)
		  ReDim ART_FanartURLs(-1)
		  ReDim ART_FanartThumbURLs(-1)
		  
		  ReDim InfoAudioChannels(-1)
		  ReDim InfoAudioCodec(-1)
		  ReDim InfoAudioLanguage(-1)
		  ReDim InfoAudioBitRate(-1)
		  ReDim InfoAudioBitRateMode(-1)
		  
		  InfoVideoAspect   = ""
		  InfoVideoCodec    = ""
		  InfoVideoScantype = ""
		  InfoVideoHeight   = -1
		  InfoVideoWidth    = -1
		  InfoVideoRuntime  = ""
		  
		  ReDim InfoSubtitleFormat(-1)
		  ReDim InfoSubtitleLanguage(-1)
		  
		  ReDim Genres(-1)
		  ReDim Studios(-1)
		  ReDim Countries(-1)
		  ReDim LanguagesSpoken(-1)
		  ReDim LanguagesSpokenCode(-1)
		  ReDim InfoSubtitleLanguage(-1)
		  
		  ID_TMDB        = ""
		  ID_IMDB        = ""
		  ID_RottenTomatoes = ""
		  
		  CreditDirector = ""
		  CreditWriter   = ""
		  CreditMusic    = ""
		  CreditCamera   = ""
		  
		  DatePremiered     = ""
		  DateYear          = -1
		  DateReleasedOnDVD = ""
		  
		  ReDim DescriptionTaglines(-1)
		  DescriptionTagline = ""
		  DescriptionOutline = ""
		  DescriptionPlot    = ""
		  
		  Title          = ""
		  TitleSort      = ""
		  TitleOriginal  = ""
		  
		  RatingTop250        = -1
		  Rating              = -1
		  RatingVotes         = -1
		  RatingMPAA          = ""
		  ReDim RatingCertification(-1)
		  
		  Set            = ""
		  SetOrder       = -1
		  SetPosterURL   = ""
		  SetFanartURL   = ""
		  StatusWatched  = False
		  
		  ReDim TrailerURLs(-1)
		  ReDim TrailerNames(-1)
		  ReDim TrailerQuality(-1)
		  
		  TomatoConcensus = ""
		  TomatoCriticsRating = ""
		  TomatoCriticsScore = -1
		  TomatoAudienceRating = ""
		  TomatoAudienceScore = -1
		  
		  ReDim RecMovies(-1)
		  ReDim RecMoviesIDs(-1)
		  ReDim RecMoviesSources(-1)
		  
		  RipSource = ""
		  InfoRuntime = -1
		  ReDim Tags(-1)
		  
		  Locked = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DestinationBanner(MovieParent as FolderItem) As FolderItem
		  Dim MovieFile as FolderItem = FindMovieItem( MovieParent )
		  Dim BannerDestination as FolderItem
		  'If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then BannerDestination = FindImageBanner( MovieParent )
		  
		  Dim BannerName as String = Preferences.Prefs.stringForKey( "FileNameBanner" )
		  If BannerName = "" Then BannerName = "banner.jpg"
		  Dim BannerExtension() as String = BannerName.Split( "." )
		  Dim Ext as String = BannerExtension( BannerExtension.Ubound )
		  
		  
		  If MovieFile <> Nil And MovieFile.Exists Then
		    If BannerDestination = Nil OR NOT BannerDestination.Exists Then
		      
		      If MovieFile.Name.Uppercase <> "VIDEO_TS" And MovieFile.Name.Uppercase <> "BDMV" and NOT MovieFile.Name.Contains(".dvdmedia") Then
		        BannerDestination = MovieParent.Child( BannerName.ReplaceAll( "<movie>", UnPart( MovieFile.NameNoExtension ) ) )
		      ElseIf Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		        BannerDestination = MovieParent.Child( BannerName.ReplaceAll( "<movie>", MovieParent.Name ) )
		      End If
		      
		    End If
		  End If
		  
		  If BannerDestination = Nil Then BannerDestination = MovieParent.Child( "banner." + Ext )
		  
		  'If MovieFile <> Nil and MovieFile.Exists and ( MovieFile.Name <> "VIDEO_TS" And MovieFile.Name <> "BDMV" ) Then
		  'If BannerDestination = Nil or NOT BannerDestination.Exists Then BannerDestination = MovieParent.Child( BannerName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) )
		  ''ElseIf MovieFile <> Nil And MovieFile.Exists Then 'And MovieFile.Name = "BDMV" Then
		  ''If BannerDestination = Nil Or NOT BannerDestination.Exists Then BannerDestination = MovieParent.Child( "banner.jpg" )
		  'Else
		  'If BannerDestination = Nil or NOT BannerDestination.Exists Then BannerDestination = MovieParent.Child( "banner.jpg" )
		  'End If
		  
		  Return BannerDestination
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DestinationFanart(MovieParent as FolderItem) As FolderItem
		  Dim MovieFile as FolderItem = FindMovieItem( MovieParent )
		  Dim FanartDestination as FolderItem
		  'If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then FanartDestination = FindImageFanart( MovieParent )
		  
		  Dim FanartName as String = Preferences.Prefs.stringForKey( "FileNameFanart" )
		  
		  Dim FanartExtension() as String = FanartName.Split(".")
		  Dim Ext as String = FanartExtension( FanartExtension.Ubound )
		  
		  
		  If MovieFile <> Nil And MovieFile.Exists Then
		    If FanartDestination = Nil OR NOT FanartDestination.Exists Then
		      
		      If MovieFile.Name.Uppercase <> "VIDEO_TS" And MovieFile.Name.Uppercase <> "BDMV" and NOT MovieFile.Name.Contains(".dvdmedia") Then
		        FanartDestination = MovieParent.Child( FanartName.ReplaceAll( "<movie>", UnPart( MovieFile.NameNoExtension ) ) )
		      ElseIf Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		        FanartDestination = MovieParent.Child( FanartName.ReplaceAll( "<movie>", MovieParent.Name ) )
		      End If
		      
		    End If
		  End If
		  
		  If FanartDestination = Nil Then FanartDestination = MovieParent.Child( "fanart." + Ext )
		  
		  'If MovieFile <> Nil and MovieFile.Exists and ( MovieFile.Name <> "VIDEO_TS" And MovieFile.Name <> "BDMV" ) Then
		  'If FanartDestination = Nil or NOT FanartDestination.Exists then FanartDestination = MovieParent.Child( FanartName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) )
		  ''ElseIf MovieFile <> Nil And MovieFile.Exists Then 'And MovieFile.Name = "BDMV" Then
		  ''If FanartDestination = Nil Or NOT FanartDestination.Exists Then FanartDestination = MovieParent.Child( "fanart.jpg" )
		  'Else
		  'If FanartDestination = Nil or NOT FanartDestination.Exists Then FanartDestination = MovieParent.Child( "fanart." + Ext )
		  'End If
		  
		  Return FanartDestination
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DestinationNFO(MovieParent as FolderItem) As FolderItem
		  
		  if MovieParent = Nil then return Nil
		  
		  // Save NFO
		  Dim MovieFile      as FolderItem = FindMovieItem( MovieParent )
		  Dim NfoDestination as FolderItem
		  'If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then NfoDestination = FindNFOFile(   MovieParent )
		  
		  Dim NFOName as String = Preferences.Prefs.stringForKey( "FileNameNFO" )
		  
		  If MovieFile <> Nil And MovieFile.Exists Then
		    If NfoDestination = Nil OR NOT NfoDestination.Exists Then
		      
		      If NOT MovieFile.Name.Uppercase.Contains( "VIDEO_TS" ) And MovieFile.Name.Uppercase <> "BDMV" and NOT MovieFile.Name.Contains(".dvdmedia") Then
		        NfoDestination = MovieParent.Child( NFOName.ReplaceAll( "<movie>", UnPart( MovieFile.NameNoExtension ) ) )
		        
		      ElseIf MovieFile.Directory And MovieFile.Name = "BDMV" Then
		        
		        If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then
		          NfoDestination = MovieFile.Child("index.nfo")
		        Else
		          NfoDestination = MovieParent.Child( CleanName( MovieParent.Name ) + ".nfo" )
		        End If
		        
		      ElseIf MovieFile.Directory And ( MovieFile.Name.Uppercase.Contains( "VIDEO_TS" ) or MovieFile.Name.Contains(".dvdmedia") ) Then
		        
		        If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then
		          NfoDestination = MovieFile.Child("VIDEO_TS.nfo")
		        Else
		          NfoDestination = MovieParent.Child( CleanName( MovieParent.Name ) + ".nfo" )
		        End If
		        
		      End If
		      
		    End If
		  End If
		  
		  
		  If NfoDestination = Nil Then NfoDestination = MovieParent.Child( "movie.nfo" )
		  
		  
		  'If MovieFile <> Nil and MovieFile.Exists and ( MovieFile.Name <> "VIDEO_TS" And MovieFile.Name <> "BDMV" ) Then
		  'If NfoDestination = Nil or NOT NfoDestination.Exists then NfoDestination = MovieParent.Child( Preferences.Prefs.stringForKey("FileNameNFO").ReplaceAll( "<movie>", MovieFile.NameNoExtension ) )
		  'ElseIf MovieFile <> Nil and MovieFile.Exists And MovieFile.Name = "VIDEO_TS" Then
		  'If NfoDestination = Nil or NOT NfoDestination.Exists then NfoDestination = MovieFile.Child( "VIDEO_TS.nfo" )
		  'ElseIf MovieFile <> Nil and MovieFile.Exists And MovieFile.Name = "BDMV" Then
		  'If NfoDestination = Nil or NOT NfoDestination.Exists then NfoDestination = MovieFile.Child( "index.nfo" )
		  'End If
		  
		  Return NfoDestination
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DestinationPoster(MovieParent as FolderItem) As FolderItem
		  Dim MovieFile as FolderItem = FindMovieItem( MovieParent )
		  Dim PosterDestination as FolderItem
		  'If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then PosterDestination = FindImagePoster( MovieParent )
		  
		  Dim PosterName as String = Preferences.Prefs.stringForKey( "FileNamePoster" )
		  
		  Dim PosterExtension() as String = PosterName.Split(".")
		  Dim Ext as String = PosterExtension( PosterExtension.Ubound )
		  
		  
		  If MovieFile <> Nil And MovieFile.Exists Then
		    If PosterDestination = Nil OR NOT PosterDestination.Exists Then
		      
		      If MovieFile.Name.Uppercase <> "VIDEO_TS" And MovieFile.Name.Uppercase <> "BDMV" and NOT MovieFile.Name.Contains(".dvdmedia") Then
		        PosterDestination = MovieParent.Child( PosterName.ReplaceAll( "<movie>", UnPart( MovieFile.NameNoExtension ) ) )
		      ElseIf Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		        PosterDestination = MovieParent.Child( PosterName.ReplaceAll( "<movie>", MovieParent.Name ) )
		      End If
		      
		    End If
		  End If
		  
		  If PosterDestination = Nil Then PosterDestination = MovieParent.Child( "poster." + Ext )
		  
		  'If MovieFile <> Nil and MovieFile.Exists and ( MovieFile.Name <> "VIDEO_TS" And MovieFile.Name <> "BDMV" ) Then
		  'If PosterDestination = Nil Or NOT PosterDestination.Exists Then PosterDestination = MovieParent.Child( PosterName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) )
		  ''ElseIf MovieFile <> Nil And MovieFile.Exists Then 'And MovieFile.Name = "BDMV" Then
		  ''If PosterDestination = Nil Or NOT PosterDestination.Exists Then PosterDestination = MovieParent.Child("poster." + Ext )
		  'Else
		  'If PosterDestination = Nil Or NOT PosterDestination.Exists Then PosterDestination = MovieParent.Child( "poster." + Ext )
		  'End If
		  
		  Return PosterDestination
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DestinationTrailer(MovieParent as FolderItem, TrailerFile as FolderItem) As FolderItem
		  Dim MovieFile as FolderItem = FindMovieItem( MovieParent )
		  Dim TrailerDestination as FolderItem
		  'If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then TrailerDestination = FindTrailerItem( MovieParent )
		  
		  Dim TrailerName as String = Preferences.Prefs.stringForKey( "FileNameTrailer" )
		  Dim Ext as String = TrailerFile.VideoFileExtension
		  
		  If MovieFile <> Nil And MovieFile.Exists And Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then
		    
		    If TrailerDestination = Nil OR NOT TrailerDestination.Exists Then
		      
		      If MovieFile.Name.Uppercase.Contains( "VIDEO_TS" ) Then
		        
		        If MovieFile.Directory And MovieFile.Name.Uppercase = "VIDEO_TS" Then
		          TrailerDestination = MovieFile.Child( "VIDEO_TS-trailer" + Ext )
		        ElseIf MovieFile.Directory And MovieFile.Name.Uppercase = "VIDEO_TS.IFO" Then
		          TrailerDestination = MovieParent.Child( "VIDEO_TS-trailer" + Ext )
		        End If
		        
		      ElseIf MovieFile.Name.Uppercase = "BDMV" Then
		        TrailerDestination = MovieFile.Child( "index-trailer" + Ext )
		      Else
		        TrailerDestination = MovieParent.Child( TrailerName.ReplaceAll( "<movie>", UnPart( MovieFile.NameNoExtension ) ) + Ext )
		      End If
		      
		    End If
		    
		  Else
		    TrailerDestination = MovieParent.Child( TrailerName.ReplaceAll( "<movie>", MovieParent.Name ) + Ext )
		  End If
		  
		  // Fallback
		  If MovieFile <> Nil And TrailerDestination = Nil Then TrailerDestination = MovieParent.Child( TrailerName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) + Ext )
		  
		  
		  If TrailerDestination = Nil Then TrailerDestination = MovieParent.Child( "trailer" + Ext )
		  
		  'If MovieFile <> Nil and MovieFile.Exists and ( MovieFile.Name <> "VIDEO_TS" And MovieFile.Name <> "BDMV" ) Then
		  'If TrailerDestination = Nil Or NOT TrailerDestination.Exists Then TrailerDestination = MovieParent.Child( TrailerName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) + Ext )
		  'ElseIf MovieFile <> Nil And MovieFile.Exists And MovieFile.Name = "BDMV" Then
		  'If TrailerDestination = Nil OR NOT TrailerDestination.Exists Then
		  'TrailerDestination = MovieFile.Child( "index-trailer." + Ext )
		  'If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" And MovieAttr.Title <> "" Then TrailerDestination = MovieParent.Child( TrailerName.ReplaceAll( "<movie>", MovieAttr.Title ) )
		  'End If
		  'Else
		  'If TrailerDestination = Nil Or NOT TrailerDestination.Exists Then TrailerDestination = MovieParent.Child( "trailer." + Ext )
		  'End If
		  
		  Return TrailerDestination
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadImages(MovieParent as FolderItem)
		  // MovieParent exists
		  If app.DebugMode Then Return
		  If MovieParent = Nil or NOT MovieParent.Exists Then Return
		  Dim ArtFile as FolderItem
		  MovieAttr.ART_Poster = Nil
		  MovieAttr.ART_Fanart = Nil
		  MovieAttr.ART_MPAARating = Nil
		  
		  Dim MoviePoster as String = MovieAttr.ID_IMDB + ".movie.poster.jpg"
		  Dim MovieFanart as String = MovieAttr.ID_IMDB + ".movie.fanart.jpg"
		  
		  
		  If MovieAttr.ART_Poster = Nil Then
		    MovieAttr.ART_Poster = CacheImageLoad( MoviePoster )
		    If MovieAttr.ART_Poster = Nil Then
		      ArtFile = FindImagePoster( MovieParent )
		      If ArtFile <> Nil and ArtFile.Exists And ArtFile.IsReadable Then
		        CacheImageSet( Picture.Open( ArtFile ), MoviePoster )
		        MovieAttr.ART_Poster = CacheImageLoad( MoviePoster )
		        If MovieAttr.ART_Poster = Nil Then MovieAttr.ART_Poster = Picture.Open( ArtFile ) // Last resort
		      End If
		    End If
		  End If
		  
		  If MovieAttr.ART_Fanart = Nil Then
		    MovieAttr.ART_Fanart = CacheImageLoad( MovieFanart )
		    If MovieAttr.ART_Fanart = Nil Then
		      ArtFile = FindImageFanart( MovieParent )
		      If ArtFile <> Nil and ArtFile.Exists And ArtFile.IsReadable Then
		        CacheImageSet( Picture.Open( ArtFile ), MovieFanart )
		        MovieAttr.ART_Fanart = CacheImageLoad( MovieFanart )
		        If MovieAttr.ART_Fanart = Nil Then MovieAttr.ART_Fanart = Picture.Open( ArtFile ) // Last resort
		      End If
		    End If
		  End If
		  
		  'ArtFile = FindImagePoster( MovieParent )
		  'If ArtFile <> Nil and ArtFile.Exists then MovieAttr.ART_Poster = ScaleImage( Picture.Open( ArtFile ), 480, 480 * 1.5 )
		  'ArtFile = Nil
		  
		  'ArtFile = FindImageFanart( MovieParent )
		  'If ArtFile <> Nil and ArtFile.Exists then MovieAttr.ART_Fanart = ScaleImage( Picture.Open( ArtFile ), 480 * 1.5, 480 )
		  'ArtFile = Nil
		  
		  If MovieAttr.ART_ClearArt = Nil Then
		    ArtFile = MovieParent.Child("clearart.png")
		    If ArtFile <> Nil And ArtFile.Exists And ArtFile.IsReadable Then MovieAttr.ART_ClearArt = Picture.Open( ArtFile )
		  End If
		  
		  If MovieAttr.ART_Logo = Nil Then
		    ArtFile = MovieParent.Child("logo.png")
		    If ArtFile <> Nil And ArtFile.Exists And ArtFile.IsReadable Then MovieAttr.ART_Logo     = Picture.Open( ArtFile )
		  End If
		  
		  'If MovieAttr.ART_Disc = Nil Then
		  'ArtFile = MovieParent.Child("disc.png")
		  'If ArtFile.Exists Then MovieAttr.ART_Disc     = Picture.Open( ArtFile )
		  'End If
		  
		  If MovieAttr.ART_Banner = Nil Then
		    ArtFile = FindImageBanner( MovieParent ) 'MovieParent.Child("banner.jpg")
		    If ArtFile <> Nil And ArtFile.Exists And ArtFile.IsReadable Then MovieAttr.ART_Banner   = Picture.Open( ArtFile )
		  End If
		  
		  // Disc (Unused)
		  'MovieAttr.ART_Disc = CacheImageLoad( MovieAttr.ID_IMDB + ".movie.disc.png" )
		  'If MovieAttr.ART_Disc = Nil Then
		  'ArtFile = MovieParent.Child("disc.png")
		  'If ArtFile <> Nil And ArtFile.Exists Then
		  'CacheImageSet( Picture.Open( ArtFile ), MovieAttr.ID_IMDB + ".movie.disc.png" )
		  'MovieAttr.ART_Disc = CacheImageLoad( MovieAttr.ID_IMDB + ".movie.disc.png" )
		  'If MovieAttr.ART_Disc = Nil Then MovieAttr.ART_Disc = Picture.Open( ArtFile )
		  'End If
		  'End If
		  
		  // Thumb
		  'MovieAttr.ART_Thumb = CacheImageLoad( MovieAttr.ID_IMDB + ".movie.thumb.jpg" )
		  'If MovieAttr.ART_Thumb = Nil Then
		  'ArtFile = MovieParent.Child("landscape.jpg")
		  'If ArtFile <> Nil and ArtFile.Exists Then
		  'CacheImageSet( Picture.Open( ArtFile ), MovieAttr.ID_IMDB + ".movie.thumb.jpg" )
		  'MovieAttr.ART_Thumb = CacheImageLoad( MovieAttr.ID_IMDB + ".movie.thumb.jpg" )
		  'If MovieAttr.ART_Thumb = Nil Then MovieAttr.ART_Thumb = Picture.Open( ArtFile )
		  'End If
		  'End If
		  
		  // ----
		  
		  // MPAA Art
		  For i as Integer = 0 to MovieAttr.RatingCertification.Ubound
		    If FlagCountry( MovieAttr.RatingCertification(i).NthField(":", 1) )  = Preferences.Prefs.stringForKey("DBLanguage") Then
		      MovieAttr.ART_MPAARating = MPAA2Logo( MovieAttr.RatingCertification(i).NthField(":", 2) )
		    End If
		  Next
		  Dim sx1 as Integer = MovieAttr.RatingMPAA.InStr(0, " for ")
		  Dim Rating as String
		  If sx1 = 0 Then Rating = MovieAttr.RatingMPAA Else Rating = Trim( MovieAttr.RatingMPAA.Left( sx1 ) )
		  If MovieAttr.ART_MPAARating = Nil And MovieAttr.RatingMPAA <> "" Then MovieAttr.ART_MPAARating = MPAA2Logo( Rating )
		  
		  
		  // Studio
		  Dim StudioArt as FolderItem = GetFolderItem( "Studios" )
		  If StudioArt = Nil OR NOT StudioArt.Exists Then StudioArt = Preferences.fAppSupport.Child("Studios")
		  If MovieAttr.Studios <> Nil And MovieAttr.Studios.Ubound > -1 Then
		    StudioArt = StudioArt.Child( MovieAttr.Studios(0).ReplaceAll(":", "-") + ".png" )
		    If StudioArt <> Nil And StudioArt.Exists And StudioArt.IsReadable Then MovieAttr.ART_Studio = Picture.Open( StudioArt )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NFORead(NFOParent as FolderItem)
		  MovieAttr.ClearProperties
		  
		  If NFOParent = Nil OR NOT NFOParent.Exists OR NOT NFOParent.IsReadable Then Return
		  
		  
		  Dim Xml As New XmlDocument
		  Dim xRoot, xNode, xItem as XmlNode
		  xml.PreserveWhitespace = false
		  
		  Dim NFOLocation as FolderItem = FindNFOFile( NFOParent )
		  If NFOParent.LastErrorCode > 0 Then
		    MessageBox Str( NFOParent.LastErrorCode )
		    Return
		  End If
		  
		  Dim Content as String
		  if NFOLocation <> Nil and NFOLocation.Exists and NFOLocation.IsReadable then
		    Content = ReadTextFile( NFOLocation )
		  end if
		  
		  'If NFOLocation <> Nil And NFOLocation.Exists And NFOLocation.IsReadable And ( NFOLocation.Extension.Lowercase = "nfo" OR NFOLocation.Extension.Lowercase = "xml" ) Then
		  'Content = ReadTextFile( NFOLocation )
		  'Else
		  'Return
		  'End If
		  
		  'Try
		  Content = Trim( RemoveLinks( Content ) )'.ReplaceAll("&", "&amp;")
		  If Content.Left(10).Contains( "<?xml" ) Then // Load XML
		    Xml.LoadXml( Content )
		  ElseIf Content.Left(5) = "http:" And Content.Contains( "imdb.com" ) Then // Return IMDb ID from URL
		    Dim s() as String = Content.Split("/")
		    
		    If s <> Nil And s.Ubound > -1 Then
		      For i as Integer = 0 to s.Ubound
		        If s(i).Left(2) = "tt" Then
		          MovieAttr.ID_IMDB = s(i)
		          Return
		        End If
		      Next
		    End If
		    
		  ElseIf content.left(5) = "http:" and content.Contains("themoviedb.org") then //return tmdb ID from url
		    dim s() as string = content.Split("/")
		    
		    if s <> nil and s.Ubound > -1 then
		      for i as Integer = 0 to s.Ubound
		        if match( "[0-9]", s(i).Left(1) ) <> "" then
		          MovieAttr.ID_TMDB = s(i).NthField("-",1)
		          return
		        end if
		      next
		    end if
		    
		  Else
		    Return // just return
		  End If
		  
		  'Catch err as NilObjectException
		  'Return
		  'End Try
		  
		  // Get RipSource
		  MovieAttr.RipSource = FindRipSource( NFOParent )
		  
		  If Xml = Nil OR Xml.ChildCount <= 0 Then Return
		  For i as Integer = 0 to Xml.ChildCount -1
		    If Xml.Child(i).Name = "movie" Then xRoot = Xml.Child(i)
		  Next
		  
		  If xRoot = Nil OR xRoot.ChildCount <= 0 Then Return
		  For i as Integer = 0 to xRoot.ChildCount -1
		    If xRoot.Child(i) = Nil OR xRoot.Child(i).FirstChild = Nil Then Continue
		    xNode = xRoot.Child(i)
		    'If xNode.FirstChild = Nil Then Continue
		    
		    Dim Value as Variant
		    If xNode.FirstChild <> Nil Then
		      Value = xNode.FirstChild.Value
		    Else
		      Continue
		    End If
		    
		    if value = Nil then Continue
		    
		    App.ErrorMessage = NFOParent.Name + chr(13) + "xNode.Name = " + xNode.Name
		    
		    Select Case xNode.Name.Lowercase
		      
		      // ID
		    Case "id"
		      If Value.StringValue.Left(2) = "tt" Then
		        MovieAttr.ID_IMDB = Value
		      Else
		        If MovieAttr.ID_TMDB = "" Then MovieAttr.ID_TMDB = Value
		      End If
		      
		      If xNode.AttributeCount > 0 Then
		        Select Case xNode.GetAttribute("moviedb").Uppercase
		          
		        Case "TMDB"
		          MovieAttr.ID_TMDB = Value
		        Case "IMDB"
		          MovieAttr.ID_IMDB = Value
		        Case "ROTTENTOMATOES"
		          MovieAttr.ID_RottenTomatoes = Value
		          
		        End Select
		      End If
		      
		      // Boxee ID
		    Case "boxeeimdb"
		      MovieAttr.ID_IMDB = Value
		    case "boxeetmdb"
		      MovieAttr.ID_TMDB = Value
		    case "boxeerottentomatoes"
		      MovieAttr.ID_RottenTomatoes = Value
		      
		      // Titles
		    case "title"
		      MovieAttr.Title = Value
		    case "sorttitle"
		      MovieAttr.TitleSort = Value
		    case "originaltitle"
		      MovieAttr.TitleOriginal = Value
		      
		      // Dates
		    case "year"
		      MovieAttr.DateYear = Value
		    case "releasedate"
		      MovieAttr.DatePremiered = Value
		      If MovieAttr.DatePremiered <> "" And MovieAttr.DatePremiered.Contains("/") Then
		        Dim s() as String = MovieAttr.DatePremiered.Split("/")
		        If Len( s(0) ) > 2 Then MovieAttr.DatePremiered = s(0) + "-" + s(1) + "-" + s(2) // Year is first in line
		        If Len( s(2) ) > 2 Then MovieAttr.DatePremiered = s(2) + "-" + s(0) + "-" + s(1) // Year is last in line
		      End If
		      
		    case "dvddate"
		      MovieAttr.DateReleasedOnDVD = Value
		      
		      // Rating
		    case "rating"
		      MovieAttr.Rating = Value
		    case "votes"
		      MovieAttr.RatingVotes = Value
		    case "top250"
		      MovieAttr.RatingTop250 = Value
		      
		      // Rotten Tomatoes
		    case "rottentomatoes"
		      If xNode.ChildCount <= 0 Then Continue
		      
		      For n as Integer = 0 to xNode.ChildCount -1
		        If xNode.Child(n) = Nil Then Continue' OR xNode.Child(n).FirstChild = Nil Then Continue
		        xItem = xNode.Child(n)
		        Value = xItem.FirstChild.Value
		        
		        Select Case xItem.Name.Lowercase
		        case "tomatoconcensus"
		          MovieAttr.TomatoConcensus = Value
		          
		        case "tomatocriticsrating"
		          MovieAttr.TomatoCriticsRating = Value
		        case "tomatocriticsscore"
		          MovieAttr.TomatoCriticsScore = Value
		          
		        case "tomatoaudiencerating"
		          MovieAttr.TomatoAudienceRating = Value
		        case "tomatoaudiencescore"
		          MovieAttr.TomatoAudienceScore = Value
		          
		        End Select
		        
		      Next
		      
		      // Certification
		    case "certification"
		      MovieAttr.RatingCertification.Append Value
		    case "mpaa"
		      MovieAttr.RatingMPAA = Value
		      
		      // Status
		    case "locked"
		      MovieAttr.Locked = Value
		    case "watched"
		      MovieAttr.StatusWatched = Value
		    case "playcount"
		      MovieAttr.StatusWatched = ( Value > 0 )
		      
		      // Studios
		    case "studios"
		      If xNode.ChildCount <= 0 Then Continue
		      
		      For n as Integer = 0 to xNode.ChildCount -1
		        If xNode.Child(n) = Nil OR xNode.Child(n).FirstChild = Nil Then Continue
		        Value = xNode.Child(n).FirstChild.Value
		        
		        MovieAttr.Studios.Append Value
		      Next
		      
		      // -- Sort out duplicates
		      MovieAttr.Studios = RemoveDuplicatesFromArray( MovieAttr.Studios )
		      
		    case "studio", "company"
		      MovieAttr.Studios.Append Value
		      // -- Sort out duplicates
		      MovieAttr.Studios = RemoveDuplicatesFromArray( MovieAttr.Studios )
		      
		      // Location
		    case "country"
		      MovieAttr.Countries.Append Value
		      MovieAttr.Countries = RemoveDuplicatesFromArray( MovieAttr.Countries )
		      
		    case "language"
		      If Value.StringValue.Contains("/") Then // -- Ember support
		        Dim s() as String = Value.StringValue.Split("/")
		        If s.Ubound >= 0 Then
		          For n as Integer = 0 to s.Ubound
		            MovieAttr.LanguagesSpoken.Append s(n)
		            MovieAttr.LanguagesSpokenCode.Append ""
		          Next
		        End If
		        
		      Else
		        MovieAttr.LanguagesSpoken.Append Value
		        If xNode.AttributeCount > 0 And xNode.GetAttribute("code") <> "" Then MovieAttr.LanguagesSpokenCode.Append xNode.GetAttribute("code") Else MovieAttr.LanguagesSpokenCode.Append ""
		        
		      End If
		      
		      // Tagging
		    case "genre"
		      If Value.StringValue.Contains("/") Then // -- Ember support
		        Dim s() as String = Value.StringValue.Split("/")
		        If s.Ubound >= 0 Then
		          For n as Integer = 0 to s.Ubound
		            MovieAttr.Genres.Append s(n)
		          Next
		        End If
		        
		      Else
		        MovieAttr.Genres.Append Value
		      End If
		      
		      MovieAttr.Genres = RemoveDuplicatesFromArray( MovieAttr.Genres )
		      
		    case "tag"
		      MovieAttr.Tags.Append Value
		      
		    case "set"
		      MovieAttr.Set = Value
		      MovieAttr.SetOrder = Val( xNode.GetAttribute("order") )
		      MovieAttr.SetPosterURL = xNode.GetAttribute("posterurl")
		      MovieAttr.SetFanartURL = xNode.GetAttribute("fanarturl")
		      
		      // Cast & Crew
		    case "director"
		      MovieAttr.CreditDirector = Value
		      
		    case "credits"
		      If xNode.FirstChild.FirstChild <> Nil Then // -- Ember support
		        MovieAttr.CreditWriter = xNode.FirstChild.FirstChild.Value
		      Else
		        MovieAttr.CreditWriter = Value
		      End If
		      
		    case "camera"
		      MovieAttr.CreditCamera = Value
		    case "sound"
		      MovieAttr.CreditMusic = Value
		      
		    case "starring"
		      If xNode.ChildCount <= 0 Then Continue
		      
		      For n as Integer = 0 to xNode.ChildCount -1
		        MovieAttr.ActorStar.Append xNode.Child(n).FirstChild.Value
		      Next
		      
		    case "actor"
		      If xNode.ChildCount <= 0 Then Continue
		      
		      ActorID.Append xNode.GetAttribute("id")
		      For n as Integer = 0 to xNode.ChildCount - 1
		        xItem = xNode.Child(n)
		        
		        If xNode.ChildCount > 2 then
		          
		          Select case xItem.Name
		          case "name"
		            If xItem.FirstChild <> Nil then MovieAttr.ActorName.Append xItem.FirstChild.Value else MovieAttr.ActorName.Append ""
		          case "role"
		            If xItem.FirstChild <> Nil then MovieAttr.ActorRole.Append xItem.FirstChild.Value else MovieAttr.ActorRole.Append ""
		          case "thumb"
		            If xItem.FirstChild <> Nil then MovieAttr.ActorThumbURL.Append xItem.FirstChild.Value else MovieAttr.ActorThumbURL.Append ""
		          End Select
		          
		        ElseIf xNode.ChildCount = 2 then
		          
		          Select case xItem.Name
		          case "name"
		            If xItem.FirstChild <> Nil then MovieAttr.ActorName.Append xItem.FirstChild.Value else MovieAttr.ActorName.Append ""
		          case "role"
		            If xItem.FirstChild <> Nil then MovieAttr.ActorRole.Append xItem.FirstChild.Value else MovieAttr.ActorRole.Append ""
		          End Select
		          
		          MovieAttr.ActorThumbURL.Append ""
		          
		        ElseIf xNode.ChildCount = 1 then
		          
		          Select case xItem.Name
		          case "name"
		            If xItem.FirstChild <> Nil then MovieAttr.ActorName.Append xItem.FirstChild.Value else MovieAttr.ActorName.Append ""
		          End Select
		          
		          MovieAttr.ActorRole.Append     ""
		          MovieAttr.ActorThumbURL.Append ""
		          
		        End If // @END xNode.ChildCount
		      Next
		      
		      
		      // Taglines & Descriptions
		    case "taglines"
		      If xNode.ChildCount <= 0 Then Continue
		      
		      For n as Integer = 0 to xNode.ChildCount
		        If xNode.Child(n) = Nil OR xNode.Child(n).FirstChild = Nil Then Continue
		        MovieAttr.DescriptionTaglines.Append xNode.Child(n).FirstChild.Value
		      Next
		      
		    case "tagline"
		      MovieAttr.DescriptionTagline = Value
		      
		    case "outline"
		      MovieAttr.DescriptionOutline = Value
		    case "plot"
		      MovieAttr.DescriptionPlot = Value
		      
		      // Duration
		    case "runtime"
		      MovieAttr.InfoRuntime = Value
		      
		      // Extra files
		    case "trailer"
		      'MovieAttr.TrailerURLs.Append xNode.FirstChild.Value
		      'MovieAttr.TrailerNames.Append xNode.GetAttribute("name")
		      'MovieAttr.TrailerQuality.Append xNode.GetAttribute("quality")
		      
		    case "trailers"
		      If xNode.ChildCount <= 0 Then Continue
		      
		      For n as Integer = 0 to xNode.ChildCount -1
		        If xNode.Child(n) = Nil OR xNode.Child(n).FirstChild = Nil Then Continue
		        xItem = xNode.Child(n)
		        
		        MovieAttr.TrailerURLs.Append xItem.FirstChild.Value
		        MovieAttr.TrailerNames.Append xItem.GetAttribute("name")
		        MovieAttr.TrailerQuality.Append xItem.GetAttribute("quality")
		      Next
		      
		    case "thumb"
		      If Value.StringValue.Left(4) = "http" Then
		        MovieAttr.ART_PosterURLs.Append Value
		        
		        MovieAttr.ART_PosterDimensions.Append xNode.GetAttribute("dim") // -- Dimensions
		        MovieAttr.ART_PosterThumbURLs.Append xNode.GetAttribute("preview") // -- previews
		      End If
		      
		    case "fanart"
		      If xNode.ChildCount <= 0 Then Continue
		      
		      For n as Integer = 0 to xNode.ChildCount -1
		        If xNode.Child(n) = Nil OR xNode.Child(n).FirstChild = Nil Then Continue
		        xItem = xNode.Child(n)
		        
		        MovieAttr.ART_FanartURLs.Append xItem.FirstChild.Value
		        MovieAttr.ART_FanartDimensions.Append xItem.GetAttribute("dim")
		        MovieAttr.ART_FanartThumbURLs.Append xItem.GetAttribute("preview")
		      Next
		      
		      // Recommendations
		    case "recommendations", "recommended_movies"
		      If xNode.ChildCount <= 0 Then Continue
		      
		      For n as Integer = 0 to xNode.ChildCount -1
		        If xNode.Child(n) = Nil OR xNode.Child(n).FirstChild = Nil Then Continue
		        xItem = xNode.Child(n)
		        
		        MovieAttr.RecMovies.Append xItem.FirstChild.Value
		        MovieAttr.RecMoviesIDs.Append xItem.GetAttribute("id")
		        MovieAttr.RecMoviesSources.Append xItem.GetAttribute("source")
		      Next
		      
		      
		      // File information
		    case "ripsource", "videosource"
		      MovieAttr.RipSource = Value
		      
		    case "fileinfo"
		      xItem = xNode.FirstChild
		      If xItem = Nil Then Continue
		      
		      For n as Integer = 0 to xItem.ChildCount -1
		        Dim xLeaf as XmlNode = xItem.Child(n)
		        
		        Select Case xLeaf.Name.Lowercase
		          
		        case "video"
		          App.ErrorMessage = "xleaf.video"
		          If xLeaf.ChildCount > 0 Then
		            For t as Integer = 0 to xLeaf.ChildCount -1
		              If xLeaf.Child(t).FirstChild = Nil Then Continue
		              Value = xLeaf.Child(t).FirstChild.Value
		              app.ErrorMessage = "xleaf.video." + xLeaf.Child(t).Name.Lowercase
		              
		              Select case xLeaf.Child(t).name.Lowercase
		                
		              case "aspect"
		                MovieAttr.InfoVideoAspect = Value
		              case "codec"
		                MovieAttr.InfoVideoCodec = Value
		              case "duration"
		                MovieAttr.InfoVideoRuntime = Value
		                MovieAttr.InfoVideoRuntime = Trim( MovieAttr.InfoVideoRuntime.ReplaceAll( "mins", "" ).ReplaceAll( "min", "" ).ReplaceAll( "minutes", "" ) )
		              case "scantype"
		                MovieAttr.InfoVideoScantype = Value
		              case "width"
		                MovieAttr.InfoVideoWidth = Value
		              case "height"
		                MovieAttr.InfoVideoHeight = Value
		                
		              End Select
		              
		              
		            Next // @END xLeaf.ChildCount
		          End If
		          
		        case "audio"
		          app.ErrorMessage = "xleaf.audio"
		          For t as Integer = 0 to xLeaf.ChildCount -1
		            If xLeaf.Child(t).FirstChild = Nil Then Continue
		            Value = xLeaf.Child(t).FirstChild.Value
		            
		            app.ErrorMessage = "xleaf.audio." + xLeaf.Child(t).Name.Lowercase
		            
		            Select case xLeaf.Child(t).Name.Lowercase
		              
		            case "channels"
		              MovieAttr.InfoAudioChannels.Append Value
		            case "codec"
		              MovieAttr.InfoAudioCodec.Append Value
		            case "language"
		              MovieAttr.InfoAudioLanguage.Append Value
		            case "bitrate"
		              MovieAttr.InfoAudioBitRate.Append Value
		            case "bitratemode"
		              MovieAttr.InfoAudioBitRateMode.Append Value
		            End Select
		            
		          Next
		          
		        case "subtitle"
		          app.ErrorMessage = "xleaf.subtitle"
		          For t as Integer = 0 to xLeaf.ChildCount -1
		            If xLeaf.Child(t).FirstChild = Nil Then Continue
		            app.ErrorMessage = "xleaf.subtitle." + xLeaf.Child(t).Name.Lowercase
		            
		            MovieAttr.InfoSubtitleLanguage.Append xLeaf.Child(t).FirstChild.Value
		            MovieAttr.InfoSubtitleFormat.Append   xLeaf.Child(t).GetAttribute("format")
		          Next
		          
		          
		        End Select
		        
		      Next
		      
		    End Select // @END xNode.Name
		    
		    App.ErrorMessage = ""
		  Next
		  
		  
		  
		  Exception err as NilObjectException
		    'Dim w as New wndBugReporter
		    'If NFOParent <> Nil Then
		    'w.Init( err, "NFORead( " + NFOParent.ShellPath.ReplaceAll("\","") + " )" + EndOfLine + App.ErrorMessage )
		    'else
		    'w.Init( err, "NFORead( Nil )" + EndOfLine + App.ErrorMessage )
		    'End If
		    dim NFOParentName as String
		    if NFOParent <> Nil then
		      NFOParentName = NFOParent.Name
		    end if
		    if AppSettings.HandleError( err, "NilObjectException (caught at NFORead( " + NFOParentName + " )" ) then
		      Return
		    end if
		    
		  Exception err as OutOfBoundsException
		    MessageBox "Something went wrong while reading the movie " + MovieAttr.FolderParent.Name + "'s NFO file..." + chr(13) + chr(13) + "Please let the author know about this as soon as possible."
		    Return
		    
		  Exception err as XmlException
		    MessageBox "Invalid or not well-formed XML NFO file found for movie " + MovieAttr.FolderParent.Name + chr(13) + chr(13) + "You should consider removing the NFO file for said movie item before continuing."
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
		Protected Sub NFOWrite(NFOFileLocation as FolderItem)
		  'If NFOFileLocation = Nil Then Return
		  
		  Dim Xml as new XmlDocument
		  Dim xRoot, xNode, xItem as XmlNode
		  Xml.PreserveWhitespace = True
		  
		  xRoot = Xml.AppendChild( Xml.CreateElement( "movie" ) )
		  
		  If MovieAttr.Title <> ""         then xRoot.AppendSimpleChild( "title",         Trim( MovieAttr.Title ) )
		  If MovieAttr.TitleSort <> ""     then xRoot.AppendSimpleChild( "sorttitle",     Trim( MovieAttr.TitleSort ) )
		  If MovieAttr.TitleOriginal <> "" then xRoot.AppendSimpleChild( "originaltitle", Trim( MovieAttr.TitleOriginal ) )
		  
		  If Preferences.Prefs.stringForKey("MediaPlayer") <> "Boxee" Then
		    If MovieAttr.ID_IMDB <> "" then
		      xNode = xRoot.AppendNewChild("id")
		      xNode.SetAttribute("moviedb", "IMDb")
		      xNode.SetValue( MovieAttr.ID_IMDB )
		    End If
		    
		    If MovieAttr.ID_TMDB <> "" then
		      xNode = xRoot.AppendNewChild("id")
		      xNode.SetAttribute("moviedb", "TMDB")
		      xNode.SetValue( MovieAttr.ID_TMDB )
		    End If
		    
		    If MovieAttr.ID_RottenTomatoes <> "" Then
		      xNode = xRoot.AppendNewChild("id")
		      xNode.SetAttribute("moviedb", "RottenTomatoes")
		      xNode.SetValue( MovieAttr.ID_RottenTomatoes )
		    End If
		  End If
		  
		  If MovieAttr.DateYear > 0            then
		    xRoot.AppendSimpleChild( "year",          MovieAttr.DateYear )
		  End If
		  If MovieAttr.DatePremiered <> ""     then xRoot.AppendSimpleChild( "releasedate",   Trim( MovieAttr.DatePremiered ) )
		  If MovieAttr.DateReleasedOnDVD <> "" then xRoot.AppendSimpleChild( "dvddate",       Trim( MovieAttr.DateReleasedOnDVD ) )
		  
		  If MovieAttr.set <> "" then
		    xNode = xRoot.AppendNewChild("set")
		    xNode.SetValue( MovieAttr.Set )
		    If MovieAttr.SetOrder <> -1 then xNode.SetAttribute( "order", str( MovieAttr.SetOrder ) )
		    If MovieAttr.SetPosterURL <> "" Then xNode.SetAttribute("posterurl", Trim( MovieAttr.SetPosterURL ) )
		    If MovieAttr.SetFanartURL <> "" Then xNode.SetAttribute("fanarturl", Trim( MovieAttr.SetFanartURL ) )
		  End If
		  
		  If MovieAttr.RatingTop250 > 0               then xRoot.AppendSimpleChild( "top250",        str( RatingTop250 ) )
		  If MovieAttr.Rating > 0                     then xRoot.AppendSimpleChild( "rating",        str( Floor( MovieAttr.Rating * 10 ) / 10 ) )
		  If MovieAttr.RatingVotes > 0                then xRoot.AppendSimpleChild( "votes",         MovieAttr.RatingVotes )
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then
		    If MovieAttr.RatingMPAA <> ""               then xRoot.AppendSimpleChild( "mpaa",          Trim( MovieAttr.RatingMPAA.ReplaceAll("Rated", "") ) )
		  Else
		    If MovieAttr.RatingMPAA <> ""               then xRoot.AppendSimpleChild( "mpaa",          Trim( MovieAttr.RatingMPAA ) )
		  End If
		  
		  If MovieAttr.TomatoConcensus <> "" OR _
		    MovieAttr.TomatoCriticsRating <> "" OR _
		    MovieAttr.TomatoCriticsScore > 0 OR _
		    MovieAttr.TomatoAudienceRating <>  "" OR _
		    MovieAttr.TomatoAudienceScore > 0 Then
		    
		    xNode = xRoot.AppendNewChild("rottentomatoes")
		    
		    If MovieAttr.TomatoConcensus <> ""     then xNode.AppendSimpleChild( "tomatoconcensus", Trim( MovieAttr.TomatoConcensus ) )
		    
		    If MovieAttr.TomatoCriticsRating <> "" then xNode.AppendSimpleChild( "tomatocriticsrating", Trim( MovieAttr.TomatoCriticsRating ) )
		    If MovieAttr.TomatoCriticsScore > 0   then xNode.AppendSimpleChild( "tomatocriticsscore",   Str( MovieAttr.TomatoCriticsScore ) )
		    
		    If MovieAttr.TomatoAudienceRating <> "" then xNode.AppendSimpleChild( "tomatoaudiencerating", Trim( MovieAttr.TomatoAudienceRating ) )
		    If MovieAttr.TomatoAudienceScore > 0   then xNode.AppendSimpleChild( "tomatoaudiencescore",   Str( MovieAttr.TomatoAudienceScore ) )
		    
		  End If
		  
		  App.ErrorMessage = "Rating Certification"
		  If MovieAttr.RatingCertification.Ubound > -1 Then
		    For i as Integer = 0 to MovieAttr.RatingCertification.Ubound
		      App.ErrorMessage = "Rating Certification: " + Str( i ) + " of " + Str( MovieAttr.RatingCertification.Ubound )
		      If MovieAttr.RatingCertification(i) <> "" Then xRoot.AppendSimpleChild( "certification", Trim( MovieAttr.RatingCertification(i) ) )
		    Next
		  End If
		  
		  App.ErrorMessage = "Taglines"
		  If MovieAttr.DescriptionTagline <> "" then xRoot.AppendSimpleChild( "tagline", Trim( MovieAttr.DescriptionTagline ) )
		  If MovieAttr.DescriptionTaglines <> Nil and MovieAttr.DescriptionTaglines.Ubound > -1 Then
		    xNode = xRoot.AppendNewChild("taglines")
		    For i as Integer = 0 to MovieAttr.DescriptionTaglines.Ubound
		      App.ErrorMessage = "Taglines: " + Str( i ) + " of " + Str( MovieAttr.DescriptionTaglines.Ubound )
		      xNode.AppendSimpleChild "tagline", MovieAttr.DescriptionTaglines(i)
		    Next
		  End If
		  
		  app.ErrorMessage = "Description"
		  If MovieAttr.DescriptionOutline <> "" then xRoot.AppendSimpleChild( "outline", Trim( MovieAttr.DescriptionOutline ) )
		  If MovieAttr.DescriptionPlot    <> "" then xRoot.AppendSimpleChild( "plot",    Trim( MovieAttr.DescriptionPlot    ) )
		  
		  app.ErrorMessage = "InfoRuntime"
		  If MovieAttr.InfoRuntime > 0 then xRoot.AppendSimpleChild( "runtime", MovieAttr.InfoRuntime )
		  
		  app.ErrorMessage = "Watched Stutus"
		  If MovieAttr.StatusWatched          then
		    xRoot.AppendSimpleChild( "playcount", "1" ) // Needed for XBMC because they don't read the 'watched' tag.
		    xRoot.AppendSimpleChild( "watched", MovieAttr.StatusWatched ) // Maybe someone else still uses this?
		  End If
		  
		  app.ErrorMessage = "Locked"
		  If Locked Then
		    xRoot.AppendSimpleChild( "locked", Str( MovieAttr.Locked ) )
		  End If
		  
		  App.ErrorMessage = "Genres"
		  If MovieAttr.Genres.Ubound > -1 then
		    For i as Integer = 0 to MovieAttr.Genres.Ubound
		      App.ErrorMessage = "Genres: " + Str( i ) + " of " + Str( MovieAttr.Genres.Ubound )
		      
		      Dim s as String = MovieAttr.Genres(i)
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then
		        s = s.Uppercase // Uppercase genres for boxee
		        if s = "SCIENCE-FICTION" or s = "SCIENCE FICTION" or s = "SciFy" or s = "Sifi" then
		          s = "SCI_FI"
		        end if
		        s = s.ReplaceAll( " ", "_" )
		      End If
		      
		      xRoot.AppendSimpleChild( "genre", Trim( s ) )
		    Next
		  End If
		  
		  App.ErrorMessage = "Tags"
		  If MovieAttr.Tags.Ubound > -1 Then
		    For i as Integer = 0 to MovieAttr.Tags.Ubound
		      App.ErrorMessage = "Tags: " + Str( i ) + " of " + Str( MovieAttr.Tags.Ubound )
		      If Trim( MovieAttr.Tags(i) ) <> "" Then xRoot.AppendSimpleChild( "tag", Trim( MovieAttr.Tags(i) ) )
		    Next
		  End If
		  
		  
		  App.ErrorMessage = "Languages Spoken"
		  If MovieAttr.LanguagesSpoken.Ubound > -1 Then
		    'xNode = xRoot.AppendNewChild("languages_spoken")
		    For i as Integer = 0 to MovieAttr.LanguagesSpoken.Ubound
		      App.ErrorMessage = "Languages Spoken: " + Str( i ) + " of " + Str( MovieAttr.LanguagesSpoken.Ubound )
		      xNode = xRoot.AppendNewChild("language")
		      xNode.SetValue( Trim( MovieAttr.LanguagesSpoken(i) ) )
		      If MovieAttr.LanguagesSpokenCode.Ubound >= MovieAttr.LanguagesSpoken.Ubound Then xNode.SetAttribute("code", Trim( MovieAttr.LanguagesSpokenCode(i) ) )
		    Next
		  End If
		  
		  // Write the first studio into the root.
		  App.ErrorMessage = "Studios"
		  If MovieAttr.Studios.Ubound > -1 Then
		    MovieAttr.Studios = RemoveDuplicatesFromArray( MovieAttr.Studios )
		    
		    xRoot.AppendSimpleChild( "studio", Trim( MovieAttr.Studios(0) ) )
		    
		    // Write the other studios into an array.
		    If MovieAttr.Studios.Ubound > -1 Then
		      xNode = xRoot.AppendNewChild("studios")
		      For n as Integer = 0 to MovieAttr.Studios.Ubound
		        App.ErrorMessage = "Studios: " + Str( n ) + " of " + Str( MovieAttr.Studios.Ubound )
		        xNode.AppendSimpleChild( "studio", Trim( MovieAttr.Studios(n) ) )
		      Next
		    End If
		    
		  End If
		  
		  App.ErrorMessage = "Countries"
		  If MovieAttr.Countries.Ubound > -1 then
		    For t as Integer = 0 to MovieAttr.Countries.Ubound
		      App.ErrorMessage = "Countries: " + Str( t ) + " of " + Str( MovieAttr.Countries.Ubound )
		      xRoot.AppendSimpleChild( "country", Trim( MovieAttr.Countries(t) ) )
		    Next
		  End If
		  
		  If MovieAttr.CreditDirector <> "" Then
		    xNode = xRoot.AppendNewChild( "director" )
		    xNode.SetValue( Trim( MovieAttr.CreditDirector ) )
		  End If
		  
		  If MovieAttr.CreditWriter   <> "" then
		    xNode = xRoot.AppendNewChild( "credits" )
		    xNode.SetValue( Trim( MovieAttr.CreditWriter ) )
		  End If
		  
		  If MovieAttr.CreditCamera <> "" Then
		    xNode = xRoot.AppendNewChild( "camera" )
		    xNode.SetValue( Trim( MovieAttr.CreditCamera ) )
		  End If
		  
		  If MovieAttr.CreditMusic    <> "" then
		    xNode = xRoot.AppendNewChild( "sound" )
		    xNode.SetValue( Trim( MovieAttr.CreditMusic ) )
		  End If
		  
		  App.ErrorMessage = "ActorStars"
		  If MovieAttr.ActorStar.Ubound > -1 Then
		    xNode = xRoot.AppendNewChild("starring")
		    For i as Integer = 0 to MovieAttr.ActorStar.Ubound
		      App.ErrorMessage = "Rating Certification: " + Str( i ) + " of " + Str( MovieAttr.ActorStar.Ubound )
		      xNode.AppendSimpleChild( "star", Trim( MovieAttr.ActorStar(i) ) )
		    Next
		  End If
		  
		  App.ErrorMessage = "Actors"
		  If MovieAttr.ActorName.Ubound > -1 then
		    For e as Integer = 0 to MovieAttr.ActorName.Ubound
		      App.ErrorMessage = "Actors: " + Str( e ) + " of " + Str( MovieAttr.ActorName.Ubound )
		      xNode = xRoot.AppendNewChild( "actor" )
		      If MovieAttr.ActorID.Ubound >= e       Then xNode.SetAttribute( "id", MovieAttr.ActorID(e) ) Else xNode.SetAttribute( "id", "" )
		      If MovieAttr.ActorName.Ubound >= e     Then xNode.AppendSimpleChild( "name",  Trim( MovieAttr.ActorName(e)     ) ) Else xNode.AppendSimpleChild( "name", "" )
		      If MovieAttr.ActorRole.Ubound >= e     Then xNode.AppendSimpleChild( "role",  Trim( MovieAttr.ActorRole(e)     ) ) Else xNode.AppendSimpleChild( "role", "" )
		      If MovieAttr.ActorThumbURL.Ubound >= e Then xNode.AppendSimpleChild( "thumb", Trim( MovieAttr.ActorThumbURL(e) ) ) Else xNode.AppendSimpleChild( "thumb", "" )
		    Next
		  End If
		  
		  App.ErrorMessage = "Trailer URLs"
		  If MovieAttr.TrailerURLs.Ubound > -1 Then
		    xNode = xRoot.AppendNewChild( "trailers" )
		    For i as Integer = 0 to MovieAttr.TrailerURLs.Ubound
		      App.ErrorMessage = "Trailer URLs: " + Str( i ) + " of " + Str( MovieAttr.TrailerURLs.Ubound )
		      
		      if MovieAttr.TrailerURLs(i).Contains( "youtube" ) and Preferences.Prefs.stringForKey("MediaPlayer") = "XBMC" then
		        // Support XBMC's youtube plugin
		        MovieAttr.TrailerURLs(i) = MovieAttr.TrailerURLs(i).Replace( "http://www.youtube.com/watch?v=", "plugin://plugin.video.youtube/?action=play_video&videoid=" )
		      end if
		      
		      xItem = xNode.AppendNewChild( "trailer" )
		      xItem.SetValue Trim( MovieAttr.TrailerURLs(i) )
		      
		      If MovieAttr.TrailerNames.Ubound   >= i Then xItem.SetAttribute( "name",    MovieAttr.TrailerNames(i) )
		      If MovieAttr.TrailerQuality.Ubound >= i Then xItem.SetAttribute( "quality", MovieAttr.TrailerQuality(i) )
		      If MovieAttr.TrailerURLs(i).Contains("youtube") Then
		        xRoot.AppendSimpleChild( "trailer", MovieAttr.TrailerURLs(i) )
		      End If
		    Next
		  End If
		  
		  
		  If FindImagePoster( MovieAttr.FolderParent ) <> Nil Then
		    If Preferences.Prefs.stringForKey("MediaPlayer") <> "Boxee" Then
		      
		      Dim f as FolderItem = FindMovieItem( MovieAttr.FolderParent )
		      Dim PrePath as String
		      If f <> Nil And f.Name = "VIDEO_TS" Then PrePath = "../"
		      
		      xRoot.AppendSimpleChild( "thumb", PrePath + FindImagePoster( MovieAttr.FolderParent ).Name )
		      
		    ElseIf Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Or Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then
		      xRoot.AppendSimpleChild( "thumb", FindImagePoster( MovieAttr.FolderParent ).ShellPath.ReplaceAll("\","") )
		    End If
		  End If
		  
		  
		  App.ErrorMessage = "Poster URLs"
		  If MovieAttr.ART_PosterURLs.Ubound > -1 then
		    For g as Integer = 0 to MovieAttr.ART_PosterURLs.Ubound
		      App.ErrorMessage = "Poster URLs: " + Str( g ) + " of " + Str( MovieAttr.ART_PosterURLs.Ubound )
		      'xRoot.AppendSimpleChild( "thumb", Trim( MovieAttr.ART_PosterURLs(g) ) )
		      xNode = xRoot.AppendNewChild( "thumb" )
		      xNode.SetValue Trim( MovieAttr.ART_PosterURLs(g) )
		      If MovieAttr.ART_PosterDimensions.Ubound >= g And MovieAttr.ART_PosterDimensions(g) <> "" Then xNode.SetAttribute( "dim", MovieAttr.ART_PosterDimensions(g) )
		      If MovieAttr.ART_PosterThumbURLs.Ubound  >= g And MovieAttr.ART_PosterThumbURLs(g)  <> "" Then xNode.SetAttribute( "preview", MovieAttr.ART_PosterThumbURLs(g) )
		    Next
		  End If
		  
		  App.ErrorMessage = "Fanart URLs"
		  If MovieAttr.ART_FanartURLs.Ubound > -1 then
		    xNode = xRoot.AppendNewChild( "fanart" )
		    For r as Integer = 0 to MovieAttr.ART_FanartURLs.Ubound
		      App.ErrorMessage = "Fanart URLs: " + Str( r ) + " of " + Str( MovieAttr.ART_FanartURLs.Ubound )
		      xItem = xNode.AppendNewChild( "thumb" )
		      xItem.SetValue( Trim( MovieAttr.ART_FanartURLs(r) ) )
		      
		      If MovieAttr.ART_FanartDimensions.Ubound = MovieAttr.ART_FanartURLs.Ubound Then
		        xItem.SetAttribute( "dim", Trim( MovieAttr.ART_FanartDimensions(r) ) )
		      End If
		      
		      If MovieAttr.ART_FanartThumbURLs.Ubound = MovieAttr.ART_FanartURLs.Ubound Then
		        xItem.SetAttribute( "preview", Trim( MovieAttr.Art_FanartThumbURLs(r) ) )
		      End If
		      
		    Next
		  End If
		  
		  If Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then
		    App.ErrorMessage = "Recommended Movies"
		    
		    'Try
		    
		    If MovieAttr.RecMovies <> Nil And MovieAttr.RecMovies.Ubound > -1 And _
		      MovieAttr.RecMoviesSources <> Nil And MovieAttr.RecMoviesSources <> Nil Then
		      
		      xNode = xRoot.AppendNewChild("recommendations")
		      For i as Integer = 0 to MovieAttr.RecMovies.Ubound
		        App.ErrorMessage = "Recommendations: " + Str( i ) + " of " + Str( MovieAttr.RecMovies.Ubound )
		        xItem = xNode.AppendNewChild("movie")', MovieAttr.RecMovies(i))
		        xItem.SetValue( Trim( MovieAttr.RecMovies(i) ) )
		        If xItem <> Nil Then
		          If MovieAttr.RecMoviesIDs.Ubound >= i And MovieAttr.RecMoviesIDs(i) <> "" Then xItem.SetAttribute("id", MovieAttr.RecMoviesIDs(i))
		          If MovieAttr.RecMoviesSources.Ubound >= i And MovieAttr.RecMoviesSources(i) <> "" Then xItem.SetAttribute("source", MovieAttr.RecMoviesSources(i))
		        End If
		      Next
		      
		    End If
		    
		    'Catch err as NilObjectException
		    'App.ErrorMessage = "Haven't written recommended movies"
		    'End Try
		    
		  End If
		  
		  
		  // Rip Source
		  App.ErrorMessage = "Rip source"
		  If MovieAttr.RipSource <> "" Then
		    'xRoot.AppendSimpleChild( "videosource", Trim( MovieAttr.RipSource ) )
		    xNode = xRoot.AppendNewChild("videosource")
		    xNode.SetValue( MovieAttr.RipSource )
		  End If
		  
		  // File Information
		  App.ErrorMessage = "FileInfo"
		  FileInfo( xRoot )
		  
		  
		  If Preferences.Prefs.stringForKey("MediaPlayer") = "Boxee" Then
		    App.ErrorMessage = "Boxee ID's"
		    If MovieAttr.ID_IMDB <> "" then
		      xNode = xRoot.AppendNewChild("boxeeIMDb")
		      'xNode.SetAttribute("moviedb", "IMDb")
		      xNode.SetValue( MovieAttr.ID_IMDB )
		    End If
		    
		    If MovieAttr.ID_TMDB <> "" then
		      xNode = xRoot.AppendNewChild("boxeeTVDB")
		      'xNode.SetAttribute("moviedb", "TMDB")
		      xNode.SetValue( MovieAttr.ID_TMDB )
		    End If
		    
		    If MovieAttr.ID_RottenTomatoes <> "" Then
		      xNode = xRoot.AppendNewChild("boxeeRottenTomatoes")
		      'xNode.SetAttribute("moviedb", "RottenTomatoes")
		      xNode.SetValue( MovieAttr.ID_RottenTomatoes )
		    End If
		  End If
		  
		  
		  App.ErrorMessage = "Indenting XML root"
		  xRoot.Indent(0)
		  'Xml.LoadXml( Xml.ToString.IndentRoot("movie") )
		  
		  
		  App.ErrorMessage = "Finding NFOFileLocation"
		  If NFOFileLocation <> Nil And NFOFileLocation.Directory Then
		    NFOFileLocation = FindNFOFile( NFOFileLocation )
		    If NFOFileLocation = Nil Then Return
		  ElseIf NFOFileLocation = Nil Then
		    Return
		  End If
		  
		  'Xml.SaveXml( NFOFileLocation )
		  App.ErrorMessage = "Writing NFO to text file"
		  If NFOFileLocation <> Nil Then
		    WriteTextFile( Xml.ToString.ReplaceAll( "encoding=""UTF-8""?>", "encoding=""UTF-8""?>" + Chr(13) ), NFOFileLocation )
		  Else
		    
		  End If
		  
		  App.ErrorMessage = ""
		  
		  
		  Exception err as OutOfBoundsException
		    'Dim w as New wndBugReporter
		    'w.Init( err, "MovieAttr.NFOWrite( " + NFOFileLocation.ShellPath.ReplaceAll("\","") + " )" + Chr(13) + App.ErrorMessage )
		    if AppSettings.HandleError( err, "OutOfBoundsException (caught at NFOWrite) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UnPart(MovieName as String, returnPart as Boolean = False) As String
		  dim OriginalName as String = MovieName
		  
		  If MovieName.Contains( ".cd" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, ".cd" ) - 1 )
		  ElseIf MovieName.Contains( ".part" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, ".part" ) - 1 )
		  ElseIf MovieName.Contains( ".pt" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, ".pt" ) - 1 )
		  ElseIf MovieName.Contains( ".disc" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, ".disc" ) - 1 )
		    
		  ElseIf MovieName.Contains( "[cd" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "[cd" ) - 1 )
		  ElseIf MovieName.Contains( "[part" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "[part" ) - 1 )
		  ElseIf MovieName.Contains( "[pt" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "[pt" ) - 1 )
		  ElseIf MovieName.Contains( "[disc" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "[disc" ) - 1 )
		    
		  ElseIf MovieName.Contains( "(cd" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "(cd" ) - 1 )
		  ElseIf MovieName.Contains( "(part" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "(part" ) - 1 )
		  ElseIf MovieName.Contains( "(pt" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "(pt" ) - 1 )
		  ElseIf MovieName.Contains( "(disc" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "(disc" ) - 1 )
		    
		  ElseIf MovieName.Contains( "-cd" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "-cd" ) - 1 )
		  ElseIf MovieName.Contains( "-part" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "-part" ) - 1 )
		  ElseIf MovieName.Contains( "-pt" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "-pt" ) - 1 )
		  ElseIf MovieName.Contains( "-disc" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "-disc" ) - 1 )
		    
		  ElseIf MovieName.Contains( "_cd" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "_cd" ) - 1 )
		  ElseIf MovieName.Contains( "_part" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "_part" ) - 1 )
		  ElseIf MovieName.Contains( "_pt" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "_pt" ) - 1 )
		  ElseIf MovieName.Contains( "_disc" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, "_disc" ) - 1 )
		    
		  ElseIf MovieName.Contains( " (1)" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, " (1)" ) - 1 )
		  ElseIf MovieName.Contains( " (2)" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, " (2)" ) - 1 )
		  ElseIf MovieName.Contains( " (3)" ) Then
		    MovieName = MovieName.Left( MovieName.InStr( 0, " (3)" ) - 1 )
		    
		  End If
		  
		  if returnPart then
		    return OriginalName.ReplaceAll( MovieName, "" )
		  else
		    Return MovieName
		  end if
		End Function
	#tag EndMethod


	#tag Note, Name = Movie.NFO
		
		Movies
		movie.nfo will override all and any nfo files in the same folder as the media files if you use the "Use foldernames for lookups" setting.
		If you don`t, then moviename.nfo is used. If there is only one nfo file in a folder, The scraper will use it for all media files in that folder.
		If there are multiple media files in a folder, the *.nfo should be named exactly the same as the video file it is representing (ie. moviename.avi and moviename.nfo).
		In the case of multi-part (stacked) video stacking, name the file either moviename.nfo or moviename-CD1.nfo where the first filename is moviename-CD1.avi.
		Note, if your movie is ripped as VOB`s and stored in a `VIDEO_TS` folder, you will have to name the file `VIDEO_TS.nfo` and place it in the same directory with the VIDEO_TS.ifo file.
		Additionally the `set` tag can be used to help sort movies that are part of a series or collection (ie Harry Potter, James Bond films).
		This sort of collection tagging must be done in the .NFO file before the movie is scanned into the library.
		
		    <movie>
		        <title>Who knows</title>
		        <originaltitle>Who knows for real</originaltitle>
		        <sorttitle>Who knows 1</sorttitle>
		        <set>Who knows trilogy</set>
		        <rating>6.100000</rating>
		        <year>2008</year>
		        <top250>0</top250>
		        <votes>50</votes>
		        <outline>A look at the role of the Buckeye State in the 2004 Presidential Election.</outline>
		        <plot>A look at the role of the Buckeye State in the 2004 Presidential Election.</plot>
		        <tagline></tagline>
		        <runtime>90 min</runtime>
		        <thumb>http://ia.ec.imdb.com/media/imdb/01/I/25/65/31/10f.jpg</thumb>
		        <mpaa>Not available</mpaa>
		        <playcount>0</playcount>
		        <watched>false</watched>
		        <id>tt0432337</id>
		        <filenameandpath>c:\Dummy_Movie_Files\Movies\...So Goes The Nation.avi</filenameandpath>
		        <trailer></trailer>
		        <genre></genre>
		        <credits></credits>
		        <fileinfo>
		            <streamdetails>
		                <video>
		                    <codec>h264</codec>
		                    <aspect>2.35</aspect>
		                    <width>1920</width>
		                    <height>816</height>
		                </video>
		                <audio>
		                    <codec>ac3</codec>
		                    <language>eng</language>
		                    <channels>6</channels>
		                </audio>
		                <audio>
		                    <codec>ac3</codec>
		                    <language>spa</language>
		                   <channels>2</channels>
		                </audio>
		                <subtitle>
		                    <language>spa</language>
		                </subtitle>
		            </streamdetails>
		        </fileinfo>
		        <director>Adam Del Deo</director>
		        <actor>
		            <name>Paul Begala</name>
		            <role>Himself</role>
		        </actor>
		        <actor>
		            <name>George W. Bush</name>
		            <role>Himself</role>
		        </actor>
		        <actor>
		            <name>Mary Beth Cahill</name>
		            <role>Herself</role>
		        </actor>
		        <actor>
		            <name>Ed Gillespie</name>
		            <role>Himself</role>
		        </actor>
		        <actor>
		            <name>John Kerry</name>
		            <role>Himself</role>
		        </actor>
		    </movie>
	#tag EndNote

	#tag Note, Name = Naming Conventions
		
		ai = Audio Information
		vi = Video Information
		
		FileInfo Format:
		
		        <fileinfo>
		            <streamdetails>
		                <video>
		                    <codec>xvid</codec>
		                    <aspect>2.388060</aspect>
		                    <width>1280</width>
		                    <height>536</height>
		                    <durationinseconds>5165</durationinseconds>
		                </video>
		                <audio>
		                    <codec>ac3</codec>
		                    <language></language>
		                    <channels>6</channels>
		                </audio>
		            </streamdetails>
		        </fileinfo>
		
		Actor Format:
		
		        <actor>
		            <name>Rutger Hauer</name>
		            <role>Hobo</role>
		            <thumb>http://ia.media-imdb.com/images/M/MV5BMTI5MjE4MTg3MV5BMl5BanBnXkFtZTYwMjk0Mzgy._V1._SY275_SX400_.jpg</thumb>
		        </actor>
	#tag EndNote

	#tag Note, Name = NFO Files
		
		XBMC NFO movie XML
		Utilizes the XBMC movie layout as specified here http://xbmc.org/wiki/?title=Import_-_Export_Library#Video_nfo_Files The episodedetails, & musicvideo layouts are not currently implemented, and will require additional internet database scanning features to be implemented first.
		
		Some fields map directly to YAMJ, and others do not currently have a YAMJ counterpart. These fields are commented on below.
		
		Any fields may be populated or left blank as the user sees fit. If a field is populated, then it will take precedence over anything retrieved from the Internet. However, if a field is left blank in the NFO, then that field will still be loaded as before.
		
		On fields where multiple may exist, like <genre> or <actor>, if even one is present in the NFO, then YAMJ will not attempt to scrape any additional information.
		
		Turn Off Internet Scraping
		If you want only the information from the NFO file to be used and not have MovieJukebox search the internet for information you should use an ID value of 0 (Zero) or -1
		
		Example
		
		<movie>
		  <id>-1</id>
		</movie>
		Format
		<movie>
		    <title></title>
		    <originaltitle></originaltitle>
		    <sorttitle></sorttitle>
		    <rating></rating>               <!-- 0 - 10 rating, can be decimal -->
		    <year></year>
		    <top250></top250>               <!-- the IMDB top 250 ranking, integer 1 - 250 or empty -->
		    <votes></votes>                 <!-- currently unused in YAMJ -->
		    <outline></outline>             <!-- a short plot description -->
		    <plot></plot>                   <!-- a longer plot description -->
		    <tagline></tagline>             <!-- The tagline for the movie -->
		    <runtime></runtime>
		    <premiered></premiered>         <!-- the release date of the movie -->
		    <thumb></thumb>                 <!-- url of poster image. use URL formatting, such as http:// for internet resources or file:// for local resources -->
		    <fanart></fanart>               <!-- url of fanart image. use URL formatting, such as http:// for internet resources or file:// for local resources -->
		    <mpaa></mpaa>
		    <certification></certification> <!-- Used for all certification that isn`t MPAA and only used if imdb.getCertificationFromMPAA=false -->
		    <playcount></playcount>         <!-- currently unused in YAMJ -->
		    <watched></watched>             <!-- This will mark the movie watched or unwatched -->
		    <id></id>                       <!-- the IMDB id of the movie. includes the leading "tt". Use an id of 0 or -1 to disable further internet plugin scraping. -->
		    <id moviedb="allocine"></id>    <!-- the allocine id of the movie. This should work for other plugins using their PLUGIN_ID as "moviedb" value -->
		    <id moviedb="filmweb"></id>     <!-- the filmweb id of the movie. This should work for other plugins using their PLUGIN_ID as "moviedb" value -->
		    <filenameandpath></filenameandpath> <!-- currently unused since YAMJ determines path from searching the configured libraries -->
		    <trailer></trailer>             <!-- multiple trailer records may exist -->
		    <genre></genre>                 <!-- multiple genre records may exist, including any custom ones -->
		    <credits>
		        <writer></writer>           <!-- Writer name, one per entry -->
		    </credits>
		    <director></director>
		    <company></company>             <!-- The studio company that produced the movie -->
		    <studio></studio>               <!-- Synonym for company tag -->
		    <country></country>             <!-- Country the video was produced in -->
		    <actor>                         <!-- Multiple actor records may exist -->
		        <name></name>
		        <role></role>               <!-- Currently unused in YAMJ -->
		    </actor>
		    <sets>
		      <set>First Set Name</set>
		      <set order="?">Another Set With An Order</set>
		    </sets>
		<!-- NOTE: All of the following tags will OVERWRITE the derived data -->
		    <videosource></videosource>     <!-- The video source of the file -->
		    <videooutput></videooutput>     <!-- The video output of the file -->
		    <fps></fps>                     <!-- The Frames Per Second value for the movie. NOTE: This should be a valid float value (with a ".") -->
		    <fileinfo>
		        <streamdetails>
		            <video>
		                <codec></codec>
		                <aspect></aspect>
		                <width></width>     <!-- Width of the video file -->
		                <height></height>   <!-- Height of the video file -->
		            </video>
		            <audio>
		                <codec></codec>
		                <language></language>
		                <channels></channels>
		            </audio>
		            <subtitle>
		                <language></language>    <!-- currently unused in YAMJ -->
		            </subtitle>
		        </streamdetails>
		    </fileinfo>
		</movie>
		XML Encoding
		XML must be either provided in UTF-8 charset or the encoding must be explicitly specified in the xml header
		
		Example:
		
		<?xml version="1.0" encoding="windows-1252"?>
		<movie>
		...
		If existing(old) NFO files do not have the described header and you do not want to re-encode or add the header to all the files, there is a parameter in the moviejukebox.properties which can be used to force the XML parser to read all the NFO files using the specified encoding.
		
		mjb.forceNFOEncoding=YOUR-ENCODING
	#tag EndNote


	#tag Property, Flags = &h1
		Protected ActorID() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ActorName() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ActorRole() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ActorStar() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ActorThumbURL() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Banner As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_ClearArt As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Disc As Picture
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
		Protected ART_MPAARating As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Poster As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_PosterDimensions() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_PosterThumbURLs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_PosterURLs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Studio As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ART_Thumb As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Countries() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CreditCamera As String
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
		Protected DatePremiered As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DateReleasedOnDVD As String
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
		Protected FolderParent As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Genres() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ID_IMDB As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ID_RottenTomatoes As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ID_TMDB As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoAudioBitRate() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoAudioBitRateMode() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoAudioChannels() As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoAudioCodec() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoAudioLanguage() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoRuntime As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoSubtitleFormat() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoSubtitleLanguage() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoVideoAspect As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoVideoCodec As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoVideoHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoVideoRuntime As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoVideoScantype As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InfoVideoWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LanguagesSpoken() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LanguagesSpokenCode() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Locked As Boolean
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
		Protected RatingTop250 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RatingVotes As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RecMovies() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RecMoviesIDs() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RecMoviesSources() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RipSource As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Set As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SetFanartURL As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SetOrder As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SetPosterURL As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StatusWatched As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Studios() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Tags() As String
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
		Protected TomatoAudienceRating As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TomatoAudienceScore As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TomatoConcensus As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TomatoCriticsRating As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TomatoCriticsScore As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TrailerNames() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TrailerQuality() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TrailerURLs() As String
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

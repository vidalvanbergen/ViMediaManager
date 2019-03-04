#tag Module
Protected Module HTMLTemplate
	#tag Method, Flags = &h21
		Private Function Image2RelativePath(Template as String, Image as FolderItem, Destination as FolderItem, Unique as String, Mode as String) As String
		  If Image = Nil OR NOT image.Exists Then Return ""
		  If Destination = Nil Then Return ""
		  If NOT Destination.Exists Then Destination.CreateAsFolder
		  
		  Dim ReplacementStr as String
		  
		  Select Case Mode
		    
		  Case "Poster"
		    ReplacementStr = "%posterpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("posters")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".jpg" )
		    
		  Case "PosterThumb"
		    ReplacementStr = "%posterthumbpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("posters")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".jpg" )
		    
		  Case "Fanart"
		    ReplacementStr = "%fanartpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("fanarts")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".jpg" )
		    
		  Case "FanartThumb"
		    ReplacementStr = "%fanartthumbpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("fanarts")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".jpg" )
		    
		  Case "Banner"
		    ReplacementStr = "%bannerpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("banners")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".jpg" )
		    
		  Case "Logo"
		    ReplacementStr = "%logopath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("logos")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".png" )
		    
		  Case "ClearArt"
		    ReplacementStr = "clearartpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("cleararts")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".png" )
		    
		  Case "Thumb"
		    ReplacementStr = "%thumbpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("thumbs")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".jpg" )
		    
		  Case "DiscArt"
		    ReplacementStr = "%discpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("discs")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".png" )
		    
		  Case "CharacterArt"
		    ReplacementStr = "%characterpath%"
		    If Template.InStr( 0, ReplacementStr ) = 0 Then Return ""
		    
		    Destination = Destination.Child("characters")
		    If NOT Destination.Exists Then Destination.CreateAsFolder
		    Destination = Destination.Child( Unique + ".png" )
		    
		  End Select
		  
		  
		  If Mode = "PosterThumb" Then
		    SaveImage( ScaleImage( Picture.Open( Image ), 256, 999 ), Destination, FileTypes.ImageJpeg )
		  ElseIf Mode = "FanartThumb" Then
		    SaveImage( ScaleImage( Picture.Open( Image ), 999, 256 ), Destination, FileTypes.ImageJpeg )
		  Else
		    Image.CopyFileTo( Destination )
		  End If
		  
		  If NOT Destination.Exists Then Return ""
		  
		  Dim ImagePath as String = Destination.ShellPath.ReplaceAll("\","")
		  Dim sx1 as Integer = ImagePath.InStr( 0, PathImages )
		  ImagePath = ImagePath.Right( ImagePath.Len - sx1 +1 )
		  
		  Return ImagePath
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessMovies(Template as String, TemplateFolder as FolderItem) As String
		  
		  Dim FullTemplateList as String
		  
		  // Image destinations
		  Dim Destination as FolderItem
		  If ImageFolder IsA FolderItem Then Destination = ImageFolder Else Destination = TemplateFolder.Child("img")
		  If NOT Destination.Exists Then Destination.CreateAsFolder
		  
		  Dim Count as Integer = 0
		  
		  For i as Integer = 0 to wndMain.lstMovies.ListCount -1
		    If wndMain.lstMovies.Cell( i, 2 ) = "" Then Continue // Make sure it's scraped
		    
		    wndHTMLExporter.lblDebug.Text = "Processing: " + wndMain.lstMovies.Cell( i, 0 )
		    wndHTMLExporter.lblDebug.Refresh
		    
		    wndHTMLExporter.prgBar.Value = wndHTMLExporter.prgBar.Value + 1
		    wndHTMLExporter.prgBar.Refresh
		    
		    // Read NFO
		    MovieAttr.FolderParent = GetFolderItem( wndMain.lstMovies.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If MovieAttr.FolderParent = Nil OR NOT MovieAttr.FolderParent.Exists Then Continue
		    
		    MovieAttr.NFORead( MovieAttr.FolderParent )
		    
		    // ## Process Template
		    Dim tmpTemplate as String = RegExThis( Template, "<!--(.*?)-->", "" )
		    
		    // -- Paths
		    
		    // Posters
		    tmpTemplate = tmpTemplate.ReplaceAll( "%posterpath%", Image2RelativePath( tmpTemplate, FindImagePoster( MovieAttr.FolderParent ), Destination, MovieAttr.ID_IMDB, "Poster" ) )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%posterthumbpath%", Image2RelativePath( tmpTemplate, FindImagePoster( MovieAttr.FolderParent ), Destination, MovieAttr.ID_IMDB + "_tn", "PosterThumb" ) )
		    
		    // Fanart
		    tmpTemplate = tmpTemplate.ReplaceAll( "%fanartpath%", Image2RelativePath( tmpTemplate, FindImageFanart( MovieAttr.FolderParent ), Destination, MovieAttr.ID_IMDB, "Fanart" ) )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%fanartthumbpath%", Image2RelativePath( tmpTemplate, FindImageFanart( MovieAttr.FolderParent ), Destination, MovieAttr.ID_IMDB + "_tn", "FanartThumb" ) )
		    
		    // Banner
		    tmpTemplate = tmpTemplate.ReplaceAll( "%bannerpath%", Image2RelativePath( tmpTemplate, FindImageBanner( MovieAttr.FolderParent ), Destination, MovieAttr.ID_IMDB, "Banner" ) )
		    
		    // Logo
		    tmpTemplate = tmpTemplate.ReplaceAll( "%logopath%", Image2RelativePath( tmpTemplate, MovieAttr.FolderParent.Child("logo.png"), Destination, MovieAttr.ID_IMDB, "Logo" ) )
		    
		    // ClearArt
		    tmpTemplate = tmpTemplate.ReplaceAll( "%clearartpath%", Image2RelativePath( tmpTemplate, MovieAttr.FolderParent.Child("clearart.png"), Destination, MovieAttr.ID_IMDB, "ClearArt" ) )
		    
		    // Thumb
		    tmpTemplate = tmpTemplate.ReplaceAll( "%thumbpath%", Image2RelativePath( tmpTemplate, MovieAttr.FolderParent.Child("landscape.jpg"), Destination, MovieAttr.ID_IMDB, "Thumb" ) )
		    
		    // Disc
		    tmpTemplate = tmpTemplate.ReplaceAll( "%discpath%", Image2RelativePath( tmpTemplate, MovieAttr.FolderParent.Child("disc.png"), Destination, MovieAttr.ID_IMDB, "DiscArt" ) )
		    
		    // CharacterArt
		    tmpTemplate = tmpTemplate.ReplaceAll( "%characterpath%", "" )
		    
		    
		    // -- Tags
		    tmpTemplate = tmpTemplate.ReplaceAll( "%media%", SectionName )
		    'tmpTemplate = tmpTemplate.ReplaceAll( "%username%", SystemInformationMBS.UserName )
		    
		    // IDs
		    tmpTemplate = tmpTemplate.ReplaceAll( "%imdbid%", MovieAttr.ID_IMDB )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%tmdbid%", MovieAttr.ID_TMDB )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%tvdbid%", "" )
		    
		    // Count
		    Count = Count + 1
		    tmpTemplate = tmpTemplate.ReplaceAll( "%count%", Str( Count ) )
		    
		    tmpTemplate = tmpTemplate.ReplaceAll( "%title%", MovieAttr.Title )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%titlesort%", MovieAttr.TitleSort )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%titleoriginal%", MovieAttr.TitleOriginal )
		    
		    Dim Year as String = ""
		    If MovieAttr.DateYear > 0 Then year = Str( MovieAttr.DateYear )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%year%", Year )
		    
		    // Premiere Date
		    tmpTemplate = tmpTemplate.ReplaceAll( "%premiere%", MovieAttr.DatePremiered )
		    
		    If Val( MovieAttr.DatePremiered.NthField("-",3) ) > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premiereday%", Str( Val( MovieAttr.DatePremiered.NthField("-",3) ) ) )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieredayleadingzero%", MovieAttr.DatePremiered.NthField("-",3) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premiereday%", "" )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieredayleadingzero%", "" )
		    End If
		    
		    If Val( MovieAttr.DatePremiered.NthField("-",2) ) > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonth%", Str( Val( MovieAttr.DatePremiered.NthField("-",2) ) ) )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonthleadingzero%", MovieAttr.DatePremiered.NthField("-",2) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonth%", "" )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonthleadingzero%", "" )
		    End If
		    
		    
		    tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonthfull%", Int2Month( Val( MovieAttr.DatePremiered.NthField("-",2) ), True ) )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonthshort%", Int2Month( Val( MovieAttr.DatePremiered.NthField("-",2) ), False ) )
		    
		    
		    // Rating
		    Dim Rating as String = Str( MovieAttr.Rating )
		    If Rating.Len = 1 Then Rating = Rating + ".0"
		    If MovieAttr.Rating > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%rating%", Rating )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%rating%", "" )
		    End If
		    
		    If MovieAttr.RatingVotes > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%votes%", Str( MovieAttr.RatingVotes ) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%votes%", "" )
		    End If
		    
		    tmpTemplate = tmpTemplate.ReplaceAll( "%mpaafull%", MovieAttr.RatingMPAA )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%mpaa%", Trim( MovieAttr.RatingMPAA.NthField( " for ", 1 ) ) )
		    
		    If MovieAttr.RatingTop250 > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%top250%", Str( MovieAttr.RatingTop250 ) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%top250%", "" )
		    End If
		    
		    // Description
		    tmpTemplate = tmpTemplate.ReplaceAll( "%tagline%", MovieAttr.DescriptionTagline )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%outline%", MovieAttr.DescriptionOutline )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%plot%",    MovieAttr.DescriptionPlot    )
		    
		    // Studios
		    If MovieAttr.Studios.Ubound > -1 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%studio%", MovieAttr.Studios(0) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%studio%", "" )
		    End If
		    
		    // Genres
		    Dim Genres as String = "<ul class=""genres"">"
		    For n as Integer = 0 to MovieAttr.Genres.Ubound
		      Genres = Genres + "<li>" + MovieAttr.Genres(n) + "</li>"
		    Next
		    Genres = Genres + "</ul>"
		    If MovieAttr.Genres.Ubound > -1 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%genres%", Genres )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%genres%", "" )
		    End If
		    
		    // Nth first genres.
		    While tmpTemplate.InStr( 0, "-genres%" ) > 0
		      Dim GenreCount as String = match( "%#(.*?)-genres%", tmpTemplate, 1 )
		      
		      Dim TmpGenres as String = "<ul class=""genres"">"
		      For n as Integer = 0 to MovieAttr.Genres.Ubound
		        If n >= Val( GenreCount ) Then Exit
		        TmpGenres = TmpGenres + "<li>" + MovieAttr.Genres(n) + "</li>"
		      Next
		      TmpGenres = TmpGenres + "</ul>"
		      
		      tmpTemplate = RegExThis( tmpTemplate, "%#(.*?)-genres%", TmpGenres )
		    Wend
		    
		    // Cast
		    Dim Cast as String = "<ul class=""cast"">"
		    For n as Integer = 0 to MovieAttr.ActorName.Ubound
		      Cast = Cast + "<li>" + MovieAttr.ActorName(n) + "</li>"
		    Next
		    Cast = Cast + "</ul>"
		    
		    If MovieAttr.ActorName.Ubound > -1 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%cast%", Cast )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%cast%", "" )
		    End If
		    
		    // Trailers
		    If MovieAttr.TrailerURLs.Ubound > -1 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%trailerurl%", MovieAttr.TrailerURLs(0) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%trailerurl%", "" )
		    End If
		    
		    tmpTemplate = tmpTemplate.ReplaceAll( "%status%", Str( MovieAttr.StatusWatched ) )
		    
		    // ## File information
		    
		    // Runtime
		    If Val( MovieAttr.InfoVideoRuntime ) > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%runtime%", Str( Round( Val( MovieAttr.InfoVideoRuntime ) ) ) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%runtime%", "" )
		    End If
		    
		    
		    // Languages
		    If MovieAttr.InfoAudioLanguage.Ubound > -1 Then
		      Dim tmpLang as String = "<ul>"
		      For n as Integer = 0 to MovieAttr.InfoAudioLanguage.Ubound
		        tmpLang = tmpLang + "<li>" + MovieAttr.InfoAudioLanguage(n) + "</li>"
		      Next
		      tmpLang = tmpLang + "</ul>"
		      tmpTemplate = tmpTemplate.ReplaceAll( "%language%", tmpLang )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%language%", "" )
		    End If
		    
		    // Video Codec
		    If MovieAttr.InfoVideoCodec <> "" Then
		      Dim Codec as String = MovieAttr.InfoVideoCodec.ReplaceAll("h264", "H.264")
		      Codec = Trim( Codec.ReplaceAll("AVC", "H.264") )
		      Codec = Trim( Codec.ReplaceAll("-","") )
		      Codec = Trim( Codec.ReplaceAll("Visual","") )
		      Codec = Trim( Codec.ReplaceAll("Video","") )
		      
		      tmpTemplate = tmpTemplate.ReplaceAll( "%videocodec%", Codec )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%videocodec%", "videonone" )
		    End If
		    
		    // Resolution
		    Dim MovieResolution As String
		    If MovieAttr.InfoVideoHeight >= 1080 or MovieAttr.InfoVideoWidth >= 1920 then
		      MovieResolution = "1080p"
		    ElseIf ( MovieAttr.InfoVideoHeight < 1080 and MovieAttr.InfoVideoHeight >=  720 ) or _
		      ( MovieAttr.InfoVideoWidth  < 1920 and MovieAttr.InfoVideoWidth  >= 1280 ) then
		      MovieResolution = "720p"
		    ElseIf ( MovieAttr.InfoVideoHeight < 720 And MovieAttr.InfoVideoHeight > 0 ) and _
		      ( MovieAttr.InfoVideoWidth < 1280 And MovieAttr.InfoVideoWidth > 0 ) then
		      MovieResolution = "SD"
		    Else
		      MovieResolution = ""
		    End If
		    
		    If MovieResolution <> "" Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%resolution%", MovieResolution )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%resolution%", "resolutionnone" )
		    End If
		    
		    
		    // Audio Codec
		    If MovieAttr.InfoAudioCodec.Ubound > -1 Then
		      Dim Codec as String = Trim( MovieAttr.InfoAudioCodec(0).ReplaceAll("audio", "") )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%audiocodec%", Codec )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%audiocodec%", "audionone" )
		    End If
		    
		    // Channels
		    If MovieAttr.InfoAudioChannels.Ubound > -1 Then
		      Dim Channels as Double = MovieAttr.InfoAudioChannels(0)
		      If Channels > 2 Then Channels = Channels - 0.9
		      
		      Dim Chan as String = Str( Channels )
		      If Chan.Len = 1 Then Chan = Chan + ".0"
		      If Chan = "11.1" Then Chan = "10.2"
		      If Chan = "23.1" Then Chan = "22.2"
		      tmpTemplate = tmpTemplate.ReplaceAll( "%channels%", Chan )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%channels%", "0" )
		    End If
		    
		    
		    // ## Stitch it all together.
		    If FullTemplateList = "" Then
		      FullTemplateList = tmpTemplate
		    Else
		      FullTemplateList = FullTemplateList + EndOfLine + EndOfLine + tmpTemplate
		    End If
		  Next
		  
		  FullTemplateList = FullTemplateList.ReplaceAll( "%totalcount%", Str( Count ) )
		  
		  Return FullTemplateList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessTelevision(Template as String, TemplateFolder as FolderItem) As String
		  Dim FullTemplateList as String
		  
		  Dim Destination as FolderItem
		  If ImageFolder IsA FolderItem Then Destination = ImageFolder Else Destination = TemplateFolder.Child("img")
		  If NOT Destination.Exists Then Destination.CreateAsFolder
		  
		  
		  Dim Count as Integer = 0
		  For i as Integer = 0 to wndMain.lstTVShadow.ListCount -1
		    If wndMain.lstTVShadow.Cell( i, 2 ) = "" Then Continue // Make sure it's been scraped before.
		    
		    wndHTMLExporter.lblDebug.Text = "Processing: " + wndMain.lstTVShadow.Cell( i, 0 )
		    wndHTMLExporter.lblDebug.Refresh
		    
		    wndHTMLExporter.prgBar.Value = wndHTMLExporter.prgBar.Value + 1
		    wndHTMLExporter.prgBar.Refresh
		    
		    // Read NFO
		    TVAttr.FolderParent = GetFolderItem( wndMain.lstTVShadow.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Continue
		    TVAttr.NFORead( TVAttr.FolderParent )
		    
		    // ## Process Template
		    Dim tmpTemplate as String = RegExThis( Template, "<!--(.*?)-->", "" )
		    
		    // -- Paths
		    
		    // Posters
		    tmpTemplate = tmpTemplate.ReplaceAll( "%posterpath%", Image2RelativePath( tmpTemplate, FindImagePoster( TVAttr.FolderParent ), Destination, TVAttr.ID_IMDB, "Poster" ) )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%posterthumbpath%", Image2RelativePath( tmpTemplate, FindImagePoster( TVAttr.FolderParent ), Destination, TVAttr.ID_IMDB + "_tn", "PosterThumb" ) )
		    
		    
		    // Fanart
		    tmpTemplate = tmpTemplate.ReplaceAll( "%fanartpath%", Image2RelativePath( tmpTemplate, FindImageFanart( TVAttr.FolderParent ), Destination, TVAttr.ID_IMDB, "Fanart" ) )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%fanartthumbpath%", Image2RelativePath( tmpTemplate, FindImageFanart( TVAttr.FolderParent ), Destination, TVAttr.ID_IMDB + "_tn", "FanartThumb" ) )
		    
		    // Banner
		    tmpTemplate = tmpTemplate.ReplaceAll( "%bannerpath%", Image2RelativePath( tmpTemplate, FindImageBanner( TVAttr.FolderParent ), Destination, TVAttr.ID_IMDB, "Banner" ) )
		    
		    // Logo
		    tmpTemplate = tmpTemplate.ReplaceAll( "%logopath%", Image2RelativePath( tmpTemplate, TVAttr.FolderParent.Child("logo.png"), Destination, TVAttr.ID_IMDB, "Logo" ) )
		    
		    // ClearArt
		    tmpTemplate = tmpTemplate.ReplaceAll( "%clearartpath%", Image2RelativePath( tmpTemplate, TVAttr.FolderParent.Child("clearart.png"), Destination, TVAttr.ID_IMDB, "ClearArt" ) )
		    
		    // Thumb
		    tmpTemplate = tmpTemplate.ReplaceAll( "%thumbpath%", Image2RelativePath( tmpTemplate, TVAttr.FolderParent.Child("landscape.jpg"), Destination, TVAttr.ID_IMDB, "Thumb" ) )
		    
		    // DiscArt
		    tmpTemplate = tmpTemplate.ReplaceAll( "%discpath%", "" )
		    
		    // Character
		    tmpTemplate = tmpTemplate.ReplaceAll( "%characterpath%", Image2RelativePath( tmpTemplate, TVAttr.FolderParent.Child("character.png"), Destination, TVAttr.ID_IMDb, "CharacterArt" ) )
		    
		    
		    
		    // -- Tags
		    tmpTemplate = tmpTemplate.ReplaceAll( "%media%", SectionName )
		    'tmpTemplate = tmpTemplate.ReplaceAll( "%username%", SystemInformationMBS.UserName )
		    
		    tmpTemplate = tmpTemplate.ReplaceAll( "%imdbid%", TVAttr.ID_IMDB )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%tvdbid%", TVAttr.ID_TVDB )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%tmdbid%", "" )
		    
		    // Count
		    Count = Count + 1
		    tmpTemplate = tmpTemplate.ReplaceAll( "%count%", Str( Count ) )
		    
		    // Titles
		    tmpTemplate = tmpTemplate.ReplaceAll( "%title%", TVAttr.Title )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%titlesort%", TVAttr.TitleSort )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%titleoriginal%", TVAttr.TitleOriginal )
		    
		    Dim Year as String = ""
		    If TVAttr.DateYear > 0 Then year = Str( TVAttr.DateYear )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%year%", Year )
		    
		    // Premiere Date
		    tmpTemplate = tmpTemplate.ReplaceAll( "%premiere%", TVAttr.DatePremiered )
		    
		    If Val( TVAttr.DatePremiered.NthField("-",3) ) > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premiereday%", Str( Val( TVAttr.DatePremiered.NthField("-",3) ) ) )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieredayleadingzero%", TVAttr.DatePremiered.NthField("-",3) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premiereday%", "" )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieredayleadingzero%", "" )
		    End If
		    
		    If Val( TVAttr.DatePremiered.NthField("-",2) ) > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonth%", Str( Val( TVAttr.DatePremiered.NthField("-",2) ) ) )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonthleadingzero%", TVAttr.DatePremiered.NthField("-",2) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonth%", "" )
		      tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonthleadingzero%", "" )
		    End If
		    
		    
		    tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonthfull%", Int2Month( Val( TVAttr.DatePremiered.NthField("-",2) ), True ) )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%premieremonthshort%", Int2Month( Val( TVAttr.DatePremiered.NthField("-",2) ), False ) )
		    
		    // Rating
		    Dim Rating as String = Str( TVAttr.Rating )
		    If Rating.Len = 1 Then Rating = Rating + ".0"
		    If TVAttr.Rating > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%rating%", Rating )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%rating%", "" )
		    End If
		    
		    If TVAttr.RatingVotes > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%votes%", Str( TVAttr.RatingVotes ) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%votes%", "" )
		    End If
		    
		    tmpTemplate = tmpTemplate.ReplaceAll( "%mpaafull%", TVAttr.RatingMPAA )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%mpaa%", Trim( TVAttr.RatingMPAA.NthField( " for ", 1 ) ) )
		    
		    
		    // Description
		    tmpTemplate = tmpTemplate.ReplaceAll( "%tagline%", TVAttr.DescriptionTagline )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%outline%", TVAttr.DescriptionOutline )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%plot%",    TVAttr.DescriptionPlot    )
		    
		    // Genres
		    Dim Genres as String = "<ul>"
		    For n as Integer = 0 to TVAttr.Genres.Ubound
		      Genres = Genres + "<li>" + TVAttr.Genres(n) + "</li>"
		    Next
		    Genres = Genres + "</ul>"
		    If TVAttr.Genres.Ubound > -1 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%genres%", Genres )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%genres%", "" )
		    End If
		    
		    
		    While tmpTemplate.InStr( 0, "-genres%" ) > 0
		      Dim GenreCount as String = match( "%#(.*?)-genres%", tmpTemplate, 1 )
		      
		      Dim TmpGenres as String = "<ul>"
		      For n as Integer = 0 to TVAttr.Genres.Ubound
		        If n >= Val( GenreCount ) Then Exit
		        TmpGenres = TmpGenres + "<li>" + TVAttr.Genres(n) + "</li>"
		      Next
		      TmpGenres = TmpGenres + "</ul>"
		      
		      tmpTemplate = RegExThis( tmpTemplate, "%#(.*?)-genres%", TmpGenres )
		    Wend
		    
		    // Cast
		    Dim Cast as String = "<ul class=""cast"">"
		    For n as Integer = 0 to TVAttr.Actor_Name.Ubound
		      Cast = Cast + "<li>" + TVAttr.Actor_Name(n) + "</li>"
		    Next
		    Cast = Cast + "</ul>"
		    
		    If TVAttr.Actor_Name.Ubound > -1 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%cast%", Cast )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%cast%", "" )
		    End If
		    
		    
		    tmpTemplate = tmpTemplate.ReplaceAll( "%status%", TVAttr.Status )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%studio%", TVAttr.TVNetwork )
		    
		    
		    // Unused
		    tmpTemplate = tmpTemplate.ReplaceAll( "%trailerurl%", "" )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%resolution%", "" )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%language%", "" )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%videocodec%", "" )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%audiocodec%", "" )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%channels%", "" )
		    tmpTemplate = tmpTemplate.ReplaceAll( "%top250%", "" )
		    
		    
		    // ## File information
		    
		    // Runtime
		    If TVAttr.DurationRuntime > 0 Then
		      tmpTemplate = tmpTemplate.ReplaceAll( "%runtime%", Str( TVAttr.DurationRuntime ) )
		    Else
		      tmpTemplate = tmpTemplate.ReplaceAll( "%runtime%", "" )
		    End If
		    
		    
		    // ## Stitch it all together.
		    If FullTemplateList = "" Then
		      FullTemplateList = tmpTemplate
		    Else
		      FullTemplateList = FullTemplateList + EndOfLine + EndOfLine + tmpTemplate
		    End If
		    
		  Next
		  
		  FullTemplateList = FullTemplateList.ReplaceAll( "%totalcount%", Str( Count ) )
		  
		  Return FullTemplateList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessTemplate(TemplateFolder as FolderItem, Destination as FolderItem)
		  If TemplateFolder = Nil OR NOT TemplateFolder.Exists Then Return
		  
		  Destination = Destination.Child( TemplateFolder.Name )
		  If Destination.Exists Then
		    If MsgDlg( Nil, 1,  "Existing files found, do you want to continue?", "If you continue, the existing files will be moved to the trash.", Loc.dlgOK, Loc.dlgCancel ) = 2 Then Return
		    If Destination.IsNetworkVolume Then Destination.Delete Else Destination.MoveToTrash()
		  End If
		  
		  TemplateFolder.CopyFileTo( Destination )
		  TemplateFolder = Destination
		  
		  ScanForHTMLFiles( TemplateFolder )
		  ReadTemplateInfo( TemplateFolder )
		  
		  
		  SectionName = Loc.Movie
		  If ActiveSection = 1 Then SectionName = Loc.TVShow
		  If ActiveSection = 2 Then SectionName = Loc.Anime
		  
		  For i as Integer = 0 to HTMLFiles.Ubound
		    If HTMLFiles(i) = Nil OR NOT HTMLFiles(i).Exists Then Continue
		    wndHTMLExporter.lblDebug.Text = "Reading: " + "../" + HTMLFiles(i).Parent.Parent.Name + "/" + HTMLFiles(i).Parent.Name + "/" + HTMLFiles(i).Name
		    wndHTMLExporter.lblDebug.Refresh
		    
		    Dim HTMLContent as String = ReadTextFile( HTMLFiles(i) )
		    Dim Template as String = HTMLContent.MyMid( "<template>", "</template>" )
		    HTMLContent = RegExThis( HTMLContent, "<template>(.*?)</template>", "%inserthere%" )
		    
		    wndHTMLExporter.lblDebug.Text = "Processing: " + SectionName
		    wndHTMLExporter.lblDebug.Refresh
		    
		    HTMLContent = HTMLContent.ReplaceAll( "%media%", SectionName )
		    'HTMLContent = HTMLContent.ReplaceAll( "%username%", SystemInformationMBS.UserName )
		    
		    If ActiveSection = 0 Then Template = ProcessMovies( Template, TemplateFolder )
		    If ActiveSection = 1 Then Template = ProcessTelevision( Template, TemplateFolder )
		    
		    
		    wndHTMLExporter.lblDebug.Text = "Writing: " + "../" + HTMLFiles(i).Parent.Parent.Name + "/" + HTMLFiles(i).Parent.Name + "/" + HTMLFiles(i).Name
		    wndHTMLExporter.lblDebug.Refresh
		    WriteTextFile( HTMLContent.ReplaceAll("%inserthere%", Template ), HTMLFiles(i) )
		  Next
		  
		  Destination.RevealInFinder
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReadTemplateInfo(TemplateFolder as FolderItem)
		  If NOT TemplateFolder IsA FolderItem Then Return
		  If NOT TemplateFolder.Child( "settings.info" ) IsA FolderItem Then Return
		  
		  Dim InfoContent as String = ReadTextFile( TemplateFolder.Child( "settings.info" ) )
		  
		  // Normalize
		  While InfoContent.InStr( 0, " =" ) > 0
		    InfoContent = InfoContent.ReplaceAll(" =", "=")
		  Wend
		  InfoContent = InfoContent.ReplaceAll("= ", "=" )
		  
		  InfoContent = RegExThis( InfoContent, "//(.*?)\n", "\n" ) // Filter // comments
		  InfoContent = RegExThis( InfoContent, "#(.*?)\n", "\n" )  // Filter # comments
		  InfoContent = RegExThis( InfoContent, "/*(.*?)*/", "" )   // Filter /* */ comments
		  
		  // Reset
		  TemplateName = ""
		  TemplateDescription = ""
		  TemplateAuthor = ""
		  Screenshot = Nil
		  
		  PathImages = ""
		  ImageFolder = Nil
		  
		  // Fill
		  TemplateName        = Trim( InfoContent.MyMid( "name=", chr(10) ) )
		  TemplateDescription = Trim( InfoContent.MyMid( "description=", chr(10) ) )
		  TemplateAuthor      = Trim( InfoContent.MyMid( "author=", chr(10) ) )
		  Dim ScreenshotPath as String = Trim( InfoContent.MyMid( "screenshot=", chr(10) ) )
		  If ScreenshotPath <> "" Then
		    Dim f as FolderItem = GetFolderItem( TemplateFolder.ShellPath.ReplaceAll("\","") + "/" + ScreenshotPath, FolderItem.PathTypeShell )
		    If f IsA FolderItem And f.Type = "image/png" OR f.Type = "image/jpg" Then Screenshot = Picture.Open( f )
		  End If
		  
		  
		  PathImages = Trim( InfoContent.MyMid( "imagepath=", chr(10) ) )
		  If PathImages = "" Then
		    Dim sx1 as Integer = InfoContent.InStr( 0, "imagepath=" )
		    If sx1 > 0 Then PathImages = InfoContent.Mid( sx1 + 10 )
		  End If
		  If PathImages = "" Then PathImages = "img"
		  
		  If PathImages <> "" Then
		    ImageFolder = GetFolderItem( TemplateFolder.ShellPath.ReplaceAll("\","") + "/" + PathImages, FolderItem.PathTypeShell )
		  End If
		  
		  
		  
		  dim s as string
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ScanForHTMLFiles(HTMLParent as FolderItem)
		  #pragma DisableBackgroundTasks
		  
		  If HTMLParent = Nil OR NOT HTMLParent.Exists Then Return
		  
		  If HTMLParent.Visible And HTMLParent.Directory Then
		    For i as Integer = 1 to HTMLParent.Count
		      If HTMLParent.Item(i) = Nil OR NOT HTMLParent.Item(i).Exists Then Continue
		      
		      If HTMLParent.Item(i).Extension.InStr( 0, "htm" ) > 0 OR HTMLParent.Item(i).Extension.InStr( 0, "php" ) > 0 Then HTMLFiles.Append HTMLParent.Item(i)
		      If HTMLParent.Item(i).Directory Then ScanForHTMLFiles( HTMLParent.Item(i) )
		    Next
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private HTMLFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ImageFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PathImages As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Screenshot As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SectionName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TemplateAuthor As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TemplateDescription As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TemplateName As String
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

#tag Module
Protected Module ViMMCore
	#tag Method, Flags = &h0
		Function Articulator(ItemName as String, ItemYear as String = "") As String
		  Dim b as Boolean = ItemYear <> ""
		  
		  // Filter out year
		  If ItemName.Right(7) = " (" + ItemYear + ")" Then
		    ItemName = ItemName.Left( ItemName.Len - 7 )
		  ElseIf ItemName.Right(5) = " " + ItemYear Then
		    ItemName = ItemName.Left( ItemName.Len - 5 )
		  End If
		  
		  // English
		  If ItemName.Left(4) = "The " Then ItemName = ItemName.Right( ItemName.Len - 4 ) + ", The "
		  If ItemName.Left(2) = "A "   Then ItemName = ItemName.Right( ItemName.Len - 2 ) + ", A "
		  If ItemName.Left(3) = "An "  Then ItemName = ItemName.Right( ItemName.Len - 3 ) + ", An "
		  
		  // Nederlands
		  If ItemName.Left(4) = "Het " Then ItemName = ItemName.Right( ItemName.Len - 4 ) + ", Het "
		  If ItemName.Left(3) = "De "  Then ItemName = ItemName.Right( ItemName.Len - 3 ) + ", De "
		  If ItemName.Left(4) = "Een " Then ItemName = ItemName.Right( ItemName.Len - 4 ) + ", Een "
		  
		  // German
		  If Preferences.Prefs.stringForKey("DBLanguage") = "DE" Then
		    If ItemName.Left(3) = "Die "  Then ItemName = ItemName.Right( ItemName.Len - 3 ) + ", Die "
		  End If
		  
		  If b Then
		    Return Trim( ItemName + " (" + ItemYear + ")" )
		  Else
		    Return Trim( ItemName )
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CacheImageDelete(ID as String)
		  Dim poster, fanart, thumb as FolderItem = Preferences.fAppSupport.Child("Cache")
		  If poster <> Nil and poster.Exists Then
		    If ActiveSection = 0 Then
		      poster = poster.Child( ID + ".movie.poster.jpg" )
		      fanart = fanart.Child( ID + ".movie.fanart.jpg" )
		    ElseIf ActiveSection = 1 Then
		      poster = poster.Child( ID + ".television.poster.jpg" )
		      fanart = fanart.Child( ID + ".television.fanart.jpg" )
		    End If
		    
		    If poster.Exists Then poster.Delete
		    If fanart.Exists Then fanart.Delete
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CacheImageLoad(Name as String) As Picture
		  Dim f as FolderItem = Preferences.fAppSupport.Child("Cache").Child( Name )
		  If f <> Nil and f.Exists Then Return Picture.Open( f )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CacheImageSet(pic as Picture, Name as String)
		  If Pic = Nil OR Name = "" Then Return
		  
		  If NOT Preferences.fAppSupport.Child("Cache").Exists Then Preferences.fAppSupport.Child("Cache").CreateAsFolder
		  
		  Dim TheFile as FolderItem = Preferences.fAppSupport.Child("Cache").Child( Name )
		  If TheFile <> Nil and TheFile.Exists Then TheFile.Delete
		  'If TheFile = Nil Then Return
		  
		  Dim fType as FileType = FileTypes.ImageJpeg
		  If Name.right(3) = "png" Then fType = FileTypes.ImagePng
		  
		  If TheFile <> Nil And pic <> Nil and Name <> "" and Name.Left( 1 ) <> "." Then Globals.SaveImage( ScaleImage( pic, 640, 410 ), TheFile, fType )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CacheImageUpdate(OldName as String, NewName as String)
		  Dim TheFile as FolderItem = Preferences.fAppSupport.Child( "Cache" ).Child( OldName )
		  Dim TheDestination as FolderItem = Preferences.fAppSupport.Child( "Cache" ).Child( NewName )
		  
		  If TheFile <> Nil and TheFile.Exists and OldName <> "" and NewName <> "" Then TheFile.MoveFileTo( TheDestination )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckMenuItems()
		  // Panel Selection
		  MenuViewMovies.Checked  = False
		  MenuViewTVShows.Checked = False
		  MenuViewAnime.Checked   = False
		  
		  MenuViewMovies.Checked = ( ActiveSection = 0 )
		  MenuViewTVShows.Checked = ( ActiveListbox = wndMain.lstTVShows )
		  
		  
		  // Sort Ascending & Descending
		  SortListAscending(0).Checked = Preferences.Prefs.boolForKey("SortMovieAscending")
		  SortListDescending(0).Checked = NOT Preferences.Prefs.boolForKey("SortMovieAscending")
		  
		  SortListAscending(1).Checked = Preferences.Prefs.boolForKey("SortTVAscending")
		  SortListDescending(1).Checked = NOT Preferences.Prefs.boolForKey("SortTVAscending")
		  
		  
		  // Deselect All Sort Options
		  ViewSortByMovieTitle.Checked      = False
		  ViewSortByMovieSortTitle.Checked  = False
		  
		  ViewSortByPath(0).Checked         = False
		  ViewSortByWatchedStatus.Checked   = False
		  ViewSortByPremiereDate(0).Checked = False
		  ViewSortByQuality.Checked         = False
		  ViewSortByRating(0).Checked       = False
		  ViewSortBySize.Checked            = False
		  ViewSortByRuntime(0).Checked      = False
		  
		  ViewSortByTVShowTitle.Checked     = False
		  ViewSortByTVShowSortTitle.Checked = False
		  
		  ViewSortByPath(1).Checked         = False
		  ViewSortByPremiereDate(1).Checked = False
		  ViewSortByRating(1).Checked       = False
		  ViewSortByRuntime(1).Checked      = False
		  ViewSortByNextAired.Checked       = False
		  ViewSortByTVShowStatus.Checked    = False
		  ViewSortByTVShowEpisodeFiles.Checked = False
		  
		  // Movie Extras
		  ViewSortByArtPoster(0).Checked         = False
		  ViewSortByArtBackdrop(0).Checked       = False
		  
		  ViewSortByArtLogo(0).Checked           = False
		  ViewSortByArtBanner(0).Checked         = False
		  ViewSortByArtClearArt(0).Checked       = False
		  ViewSortByArtThumb(0).Checked          = False
		  
		  ViewSortByArtDisc.Checked              = False
		  
		  ViewSortByArtExtraThumbs(0).Checked    = False
		  ViewSortByArtExtraBackdrops(0).Checked = False
		  
		  ViewSortByTrailer.Checked              = False
		  
		  // TV Extras
		  ViewSortByArtPoster(1).Checked         = False
		  ViewSortByArtBackdrop(1).Checked       = False
		  
		  ViewSortByArtLogo(1).Checked           = False
		  ViewSortByArtBanner(1).Checked         = False
		  ViewSortByArtClearArt(1).Checked       = False
		  ViewSortByArtThumb(1).Checked          = False
		  
		  ViewSortByArtCharacterArt.Checked      = False
		  ViewSortByArtExtraBackdrops(1).Checked = False
		  
		  ViewSortByThemeSong.Checked            = False
		  
		  // Select Movie Sort Option
		  If ActiveSection = 0 Then
		    Select Case Preferences.Prefs.integerForKey("SortByMovie")
		    Case 0 // Col  0: Movie Title
		      ViewSortByMovieTitle.Checked      = True
		    Case 1 // Col  3: Movie Sort Title
		      ViewSortByMovieSortTitle.Checked  = True
		    Case 2 // Col  1: Path
		      ViewSortByPath(0).Checked         = True
		    Case 3 // Col  4: Watched Status
		      ViewSortByWatchedStatus.Checked   = True
		    Case 4 // Col  5: Premiere Date
		      ViewSortByPremiereDate(0).Checked = True
		    Case 5 // Col  6: Quality
		      ViewSortByQuality.Checked         = True
		    Case 6 // Col  7: Rating
		      ViewSortByRating(0).Checked       = True
		    Case 7 // Col 11: File size
		      ViewSortBySize.Checked            = True
		    Case 8 // Col 12: Runtime
		      ViewSortByRuntime(0).Checked      = True
		      
		      
		      // ## Sort By Art
		    Case 10 // Poster
		      ViewSortByArtPoster(0).Checked = True
		    Case 11 // Fanart
		      ViewSortByArtBackdrop(0).Checked = True
		    Case 12 // Banner
		      ViewSortByArtBanner(0).Checked = True
		    Case 13 // Logo
		      ViewSortByArtLogo(0).Checked = True
		    Case 14 // ClearArt
		      ViewSortByArtClearArt(0).Checked = True
		    Case 15 // Landscape
		      ViewSortByArtThumb(0).Checked = True
		    Case 16 // DiscArt
		      ViewSortByArtDisc.Checked = True
		    case 17 // ExtraThumbs
		      ViewSortByArtExtraThumbs(0).Checked = True
		    Case 18 // ExtraFanart
		      ViewSortByArtExtraBackdrops(0).Checked = True
		    Case 19 // Trailer
		      ViewSortByTrailer.Checked = True
		    Case 20 // Subtitles
		      ViewSortBySubtitles.Checked = True
		      
		    End Select
		  End If
		  
		  // ## TV Show Sort
		  If ActiveSection = 1 Then
		    Select Case Preferences.Prefs.integerForKey("SortByTV")
		      
		    Case 0 // Col 0: Show Title
		      ViewSortByTVShowTitle.Checked = True
		    Case 1 // Col 3: Show Sort Title
		      ViewSortByTVShowSortTitle.Checked = True
		    Case 2 // Col 1: Path
		      ViewSortByPath(1).Checked = True
		    Case 3 // Col 8: Next Aired Date
		      ViewSortByNextAired.Checked = True
		    Case 4 // Col 7: Rating
		      ViewSortByRating(1).Checked = True
		    Case 5 // Col 6: Status
		      ViewSortByTVShowStatus.Checked = True
		    Case 6 // Col 21: Runtime
		      ViewSortByRuntime(1).Checked   = True
		    Case 7 // Col 5: Premiere Date
		      ViewSortByPremiereDate(1).Checked = True
		    Case 8 // Col 24: Local Episode Count
		      ViewSortByTVShowEpisodeFiles.Checked = True
		      
		      
		    Case 10
		      ViewSortByArtPoster(1).Checked = True
		    Case 11
		      ViewSortByArtBackdrop(1).Checked = True
		    Case 12
		      ViewSortByArtBanner(1).Checked = True
		    Case 13
		      ViewSortByArtClearArt(1).Checked = True
		    Case 14
		      ViewSortByArtLogo(1).Checked = True
		      'Case 15
		      'ViewSortByArtDisc(1).Checked = True
		    Case 16
		      ViewSortByArtThumb(1).Checked = True
		    Case 17
		      ViewSortByArtCharacterArt.Checked = True
		      'Case 18
		      'ViewSortByArtSeason.Checked = True
		    Case 19
		      ViewSortByArtExtraBackdrops(1).Checked = True
		    Case 20
		      ViewSortByThemeSong.Checked = True
		      
		    End Select
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CleanName(NewName as String) As String
		  
		  'While NewName.InStr( 0, "  " ) > 0
		  'NewName = NewName.ReplaceAll( "  ", " " )
		  'Wend
		  
		  // Check proper signage.
		  If NewName.Left(1) = "." Then NewName = " ." + NewName.Right( NewName.Len - 1 )
		  NewName = Trim( NewName.ReplaceAll( ",.", "."  ) )
		  NewName = Trim( NewName.ReplaceAll( ":" , " - " ) )
		  
		  NewName = Trim( NewName.ReplaceAll( "()", ""   ) )
		  NewName = Trim( NewName.ReplaceAll( "[]", ""   ) )
		  NewName = Trim( NewName.ReplaceAll( "{}", ""   ) )
		  NewName = Trim( NewName.ReplaceAll( "||", ""   ) )
		  
		  NewName = Trim( NewName.ReplaceAll( "( )", ""   ) )
		  NewName = Trim( NewName.ReplaceAll( "[ ]", ""   ) )
		  NewName = Trim( NewName.ReplaceAll( "{ }", ""   ) )
		  NewName = Trim( NewName.ReplaceAll( "| |", ""   ) )
		  
		  If Trim( NewName ).Right(1) = "-" OR _
		    Trim( NewName ).Right(1) = "/" Then
		    NewName = Trim( NewName.Left( NewName.Len - 1 ) )
		  End If
		  While NewName.Left(1) = "."
		    NewName = NewName.Right( NewName.Len - 1 )
		  Wend
		  
		  While Trim( NewName ).Left(1) = "-"
		    NewName = NewName.Right( NewName.Len - 1 )
		  Wend
		  
		  NewName = Trim( NewName.ReplaceAll( "≈", "$" ) )
		  
		  // Not supported on Windows
		  If NOT TargetMacOS Or Preferences.Prefs.boolForKey("TargetNOTMacOS") Then
		    NewName = NewName.ReplaceAll( "\", " - " )
		    NewName = NewName.ReplaceAll( "/", " - " )
		    NewName = NewName.ReplaceAll( "*", "-"   )
		    NewName = NewName.ReplaceAll( "?", ""    )
		    NewName = NewName.ReplaceAll( """", "'"  )
		    NewName = NewName.ReplaceAll( "<", "{"   )
		    NewName = NewName.ReplaceAll( ">", "}"   )
		    NewName = NewName.ReplaceAll( "|", " "   )
		    
		    // Unsupported on 'ext4'. (Linux Filesystem Format)
		    'NewName = NewName.ReplaceAll( "½", " 1-2" )
		    'NewName = NewName.ReplaceAll( "⅓", " 1-3" )
		    'NewName = NewName.ReplaceAll( "⅔", " 2-3" )
		    'NewName = NewName.ReplaceAll( "¼", " 1-4" )
		    
		    // Dunno.
		    'NewName = NewName.ReplaceAll( "²", "^2" )
		    'NewName = NewName.ReplaceAll( "³", "^3" )
		    
		    // Convert to plain ASCII
		    'NewName = ConvertEncoding( NewName, Encodings.ASCII )
		  End If
		  
		  While NewName.InStr( 0, "  " ) > 0
		    NewName = NewName.ReplaceAll( "  ", " " )
		  Wend
		  
		  Return Trim( NewName )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountHours(Date as String, Relative as Boolean = False, Runtime as Double = 60) As String
		  If Date = "" Then Return ""
		  
		  Dim Today as New Date, ShowDate as New Date
		  Dim LocalGMT as Integer = Today.GMTOffset
		  
		  Dim SplitDate() as String = Split( Date.NthField( "T", 1 ), "-" )
		  If SplitDate.Ubound = 0 Then Return "" // Not enough data available.
		  
		  ShowDate.GMTOffset = Val( Date.NthField( "G", 2 ) )
		  
		  ShowDate.Year  = Val( SplitDate(0) )
		  ShowDate.Month = Val( SplitDate(1) )
		  If SplitDate.Ubound >= 2 Then ShowDate.Day = Val( SplitDate(2) ) Else ShowDate.Day = 1
		  
		  ShowDate.Hour      = Val( Date.NthField( "T", 2 ).NthField( ":", 1 ) )
		  ShowDate.Minute    = Val( Date.NthField( "T", 2 ).NthField( ":", 2 ).NthField( "G", 1 ) )
		  
		  ShowDate.GMTOffset = 0
		  Today.GMTOffset    = 0
		  
		  
		  Dim AirTime as Double = ( ShowDate.TotalSeconds - Today.TotalSeconds ) / 60' + LocalGMT * 60
		  
		  Dim Minutes as Double = Round( AirTime )
		  'If NOT Relative Then Return Str( Minutes ) // Debug
		  If Relative And Minutes < 60 And Minutes > -60 Then
		    If Minutes <= 0 And Minutes >= Minutes - Runtime Then Return Loc.time_Now + ", " + Str( Minutes + Runtime ) + Loc.kMinutes + " " + Loc.t_TimeLeftOver
		    
		    If Minutes = 0 Then Return Loc.time_Now
		    If Minutes < 0 Then Return Str( Minutes ) + " " + Loc.time_MinutesAgo
		    If Minutes > 0 Then Return Str( Minutes ) + " " + Loc.time_MinutesFuture
		    
		  End If
		  'If NOT Relative Then Return Str( Minutes ) // Debug
		  
		  Dim Hours as Double = Round( AirTime / 60 )
		  If AirTime < 0 Then Hours = Round( AirTime / 60 )' - LocalGMT
		  'If NOT Relative Then Return Str( AirTime ) // Debug
		  If NOT Relative Then Return Str( Hours )
		  'Return Str( Hours )
		  
		  
		  If AirTime > 0 Then Hours = Round( AirTime / 60 )' - LocalGMT
		  
		  If Hours > 24 Then
		    Return Str( Round( AirTime / 60 / 24 ) ) + " " + Loc.DateDays
		    
		  ElseIf Hours <= -24 And Hours > -48 Then
		    Return Loc.t_Yesterday
		    
		  ElseIf Hours < -48  Then
		    Return Str( Round( Hours / 24 ) ).ReplaceAll("-","") + " " + Loc.time_DaysAgo
		    
		  ElseIf Hours < 0 Then
		    If Hours = -1 Then
		      Return Str( Hours ).ReplaceAll("-","") + " " + Loc.time_HourAgo
		    Else
		      Return Str( Hours ).ReplaceAll("-","") + " " + Loc.time_HoursAgo
		    End If
		    
		  ElseIf Hours < 12 Then
		    If Hours = 1 Then
		      Return Str( Hours ).ReplaceAll("-","") + " " + Loc.time_Hour
		    Else
		      Return Str( Hours ).ReplaceAll("-","") + " " + Loc.time_Hours
		    End If
		    
		  End If
		  
		  'Return Str( Round( AirTime / 60 ) )
		  Dim CurrentDate as New Date
		  Dim TimeLeftInDay as Double = 24 - CurrentDate.Hour
		  
		  
		  
		  Select Case Round( AirTime / 60 / 24 )
		    
		  case 0
		    
		    If Round( AirTime / 60 ) > TimeLeftInDay Then
		      Return Loc.t_Tomorrow
		    Else
		      Return Loc.t_Today
		    End If
		    
		  case 1
		    Return Loc.t_Tomorrow
		    
		  Else
		    Return Str( Round( AirTime / 60 / 24 ) ) + " " + Loc.DateDays
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeArticulator(Extends ItemName as String) As String
		  
		  // English
		  ItemName = ItemName.ReplaceAll( "The ", "" )
		  ItemName = ItemName.ReplaceAll( "A "  , "" )
		  ItemName = ItemName.ReplaceAll( "An " , "" )
		  
		  // Nederlands
		  ItemName = ItemName.ReplaceAll( "Het ", "" )
		  ItemName = ItemName.ReplaceAll( "De " , "" )
		  ItemName = ItemName.ReplaceAll( "Een ", "" )
		  
		  Return ItemName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteCache()
		  Dim Actors, General as FolderItem = Preferences.fAppSupport
		  
		  Actors  = Actors.Child( "Actors" )
		  General = General.Child( "Cache" )
		  
		  If Actors  <> Nil And Actors.Exists  Then
		    If Actors.IsNetworkVolume Then Actors.Delete Else Actors.MoveToTrash()
		  End If
		  If General <> Nil And General.Exists Then
		    If General.IsNetworkVolume Then General.Delete Else General.MoveToTrash()
		  End If
		  
		  MessageBox Loc.kCacheCleared
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EpisodesToTVShows(DoUpdate as Boolean = False)
		  
		  // Get TV downloads folder
		  Dim DownloadsFolder as FolderItem = Preferences.Prefs.fileForKey( "TVDownloads" )
		  If DownloadsFolder = Nil OR NOT DownloadsFolder.Exists Then Return
		  
		  // Get Episode files
		  Dim AllEpisodes() as FolderItem = FindEpisodeFiles( DownloadsFolder )
		  
		  // Get Television show folders.
		  Dim Dict as Dictionary = Preferences.Prefs.dictionaryForKey("TVShowPaths")
		  Dim TVShowsRoots() as FolderItem
		  Dim UpdatedShows() as FolderItem
		  
		  For Each Key as Variant in Dict.Keys
		    If Key.StringValue.InStr( 0, ":" ) > 0 Then
		      TVShowsRoots.Append GetFolderItem( Key )
		    Else
		      TVShowsRoots.Append GetFolderItem( Key, FolderItem.PathTypeShell )
		    End If
		  Next
		  
		  
		  Dim TVShows() as FolderItem
		  For i as Integer = 0 to TVShowsRoots.Ubound
		    If TVShowsRoots(i) = Nil OR NOT TVShowsRoots(i).Exists Then Continue
		    
		    For n as Integer = 1 to TVShowsRoots(i).Count
		      Dim Item as FolderItem = TVShowsRoots(i).Item(n)
		      If Item = Nil OR NOT Item.Exists Then Continue
		      
		      TVShows.Append Item
		      
		    Next
		  Next
		  
		  
		  dlgProgress.Reset
		  Dim n as Integer = 0
		  For each Episode as FolderItem in AllEpisodes
		    If Episode = Nil OR NOT Episode.Exists Then Return
		    n = n + 1
		    dlgProgress.Add( Loc.kProcessing +":", Loc.kMovedEpisodeFiles.ReplaceAll("%@", Str(n) + Loc.k1of2 + Str( AllEpisodes.Ubound + 1 ) ) )
		    
		    // Clean episode name
		    Dim EpisodeName as String = Trim( Episode.NameNoExtension )'.Lowercase
		    EpisodeName = RegExThis( EpisodeName, "\[.*?\]" )
		    EpisodeName = EpisodeName.ReplaceAll( ".US.", "." )
		    EpisodeName = EpisodeName.ReplaceAll(".", " ")
		    EpisodeName = EpisodeName.ReplaceAll("_", " ")
		    
		    Dim sx1 as Integer = EpisodeName.InStr( "480p" )
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( "720p" )
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( "1080p" )
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( "2160p" ) // 4k
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( "2880p" ) // 5k
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( "4320p" ) // 8k
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( "HDTV" )
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( "PDTV" )
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( "WEB-DL" )
		    If sx1 <= 0 Then sx1 = EpisodeName.InStr( ".PROPER." )
		    If sx1 > 0 Then EpisodeName = EpisodeName.left( sx1 - 1 )
		    sx1 = 0
		    
		    Dim Order as String = match( "(s(eason[\W_]*)?(?<season>[0-9]+))([\W_]*(\.?(-|(e(pisode[\W_]*)?))[0-9]+)+)?", EpisodeName.Lowercase )
		    sx1 = EpisodeName.Lowercase.InStr( Order )
		    If sx1 = 0 Then
		      Order = match( "[0-9]x[0-9][0-9]", EpisodeName.Lowercase )
		      sx1 = EpisodeName.Lowercase.InStr( Order )
		    End If
		    
		    If sx1 > 0 Then EpisodeName = Trim( EpisodeName.left( sx1 - 1 ) )
		    EpisodeName = CleanName( EpisodeName )
		    
		    Dim NiceName as String = CleanName( RegExThis( Episode.NameNoExtension, "\[.*?\]" ) )
		    EpisodeName = EpisodeName.lowercase
		    
		    if EpisodeName.Mid( EpisodeName.Len-3 ) = " us" then
		      EpisodeName = EpisodeName.left( EpisodeName.Len-3 )
		    end if
		    EpisodeName = EpisodeName.ReplaceAll("The "," ")
		    EpisodeName = EpisodeName.ReplaceAll(", The"," ")
		    EpisodeName = EpisodeName.ReplaceAll(" And "," ")
		    EpisodeName = EpisodeName.ReplaceAll(" & "," ")
		    EpisodeName = EpisodeName.ReplaceAll("'","")
		    EpisodeName = EpisodeName.ReplaceAll("-","")
		    EpisodeName = EpisodeName.ReplaceAll("_", " ")
		    EpisodeName = RegExThis( EpisodeName, "\([0-9][0-9][0-9][0-9]\)" )
		    EpisodeName = RegExThis( EpisodeName, "[1-2][0-9][0-9][0-9]" )
		    EpisodeName = Trim( EpisodeName.ReplaceAll(" a "," ") )
		    
		    While EpisodeName.InStr( "  " ) > 0
		      EpisodeName = EpisodeName.ReplaceAll( "  ", " " )
		    Wend
		    
		    Dim EpisodeNameParts() as String = EpisodeName.split(" ")
		    
		    
		    // Put episodes into tv show folders
		    
		    For each Show as FolderItem in TVShows
		      If Show = Nil OR NOT Show.Exists OR NOT Show.Directory Then Continue
		      
		      // Clean show name.
		      Dim ShowName as String = Show.Name.Lowercase
		      if ShowName.Mid( ShowName.Len-3 ) = " us" then
		        ShowName = ShowName.left( EpisodeName.Len-3 )
		      end if
		      ShowName = ShowName.ReplaceAll("The "," ")
		      ShowName = ShowName.ReplaceAll(", The"," ")
		      ShowName = ShowName.ReplaceAll(" And "," ")
		      ShowName = ShowName.ReplaceAll(" & ", " ")
		      ShowName = ShowName.ReplaceAll(" a "," ")
		      ShowName = ShowName.ReplaceAll("'","")
		      ShowName = ShowName.ReplaceAll("-","")
		      ShowName = ShowName.ReplaceAll("_", " ")
		      ShowName = RegExThis( ShowName, "\([0-9][0-9][0-9][0-9]\)" )
		      ShowName = CleanName( ShowName )
		      ShowName = Trim( ShowName )
		      Dim ShowNameParts() as String = ShowName.Split( " " )
		      
		      Dim b as Boolean = False
		      For each part as String in EpisodeNameParts
		        'If ShowNameParts.Ubound <> EpisodeNameParts.Ubound Then Continue
		        
		        If True And ShowName.Contains( part ) Then
		          b = True
		        Else
		          b = False
		          Exit
		        End If
		        
		      Next
		      
		      If NOT b Then Continue
		      
		      If b And NOT Show.Child( Episode.Name ).Exists Then
		        
		        // Gather other files
		        Dim ExtraFiles() as FolderItem
		        For i as Integer = 1 to Episode.Parent.Count
		          Dim Item as FolderItem = Episode.Parent.Item(i)
		          If Item.NameNoExtension = Episode.NameNoExtension And match( "r[0-9][0-9]", Item.NameExtension ) <> "" Then ExtraFiles.Append Item
		        Next
		        
		        Episode.MoveFileTo( Show )
		        For each item as FolderItem in ExtraFiles
		          item.MoveFileTo( Show )
		        Next
		        
		        UpdatedShows.Append Show
		        If Episode.Parent.ShellPath <> DownloadsFolder.ShellPath Then
		          If NOT episode.Parent.IsNetworkVolume Then Episode.Parent.MoveToTrash()
		        End If
		        
		        CommonCore.UnfoundTitles.Append "Moved: " + NiceName + "." + Episode.NameExtension + chr(13) + "To: " + Show.Name
		        CommonCore.UnfoundPaths.Append Show
		        Exit
		      Else
		        Continue
		      End If
		      
		    Next
		    
		  Next
		  
		  CommonCore.ShowUnfoundTitles( Loc.kMovedEpisodeFiles )
		  
		  If DoUpdate And UpdatedShows.Ubound > -1 Then CommonCore.UpdateAllEpisodes( True )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileIcon(Extends f as FolderItem, size as Integer) As Picture
		  Dim pic as Picture
		  If f <> nil and f.Exists then
		    pic      = f.icon( size )
		    'If pic <> Nil Then pic.Mask = f.IconMaskMBS ( size )
		    Return pic
		  Else
		    Return Nil
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FileInfo(xRoot as XmlNode, VideoFile as FolderItem = Nil)
		  'If NOT MovieAttr.FolderParent IsA FolderItem Then Return
		  
		  // http://wiki.xbmc.org/index.php?title=InfoLabels
		  
		  Dim VidTmp as FolderItem = VideoFile
		  Dim Movies() as FolderItem
		  
		  If NOT VideoFile IsA FolderItem Then
		    If ActiveSection = 0 And MovieAttr.FolderParent IsA FolderItem Then
		      'VideoFile = FindMovieItem( MovieAttr.FolderParent )
		      Movies = FindMovieItems( MovieAttr.FolderParent )
		      If Movies <> Nil And Movies.Ubound > -1 Then VideoFile = Movies(0)
		    End If
		    If ActiveSection = 1 Then Return
		  End If
		  
		  If NOT VideoFile IsA FolderItem OR VideoFile.Extension = "iso" Then Return
		  Dim ErrorStr as String = VideoFile.Name + " does not exist?" + EndOfLine + EndOfLine + VideoFile.ShellPath.ReplaceAll("\","")
		  
		  // Scan BDMV/VIDEO_TS for biggest file.
		  If VideoFile.Directory And ( VideoFile.Name = "BDMV" OR VideoFile.Name = "VIDEO_TS" or VideoFile.Name.Contains(".dvdmedia") ) Then
		    Dim BiggestLength as Double
		    Dim BiggestFile as FolderItem
		    
		    Dim Parent as FolderItem = VideoFile
		    If Parent.Name = "BDMV" Then Parent = Parent.Child("STREAM")
		    
		    For i as Integer = 1 to Parent.Count
		      Dim Item as FolderItem = Parent.Item(i)
		      If Item = Nil OR NOT Item.Exists OR Item.Directory Then Continue
		      
		      Dim ItemLength as Double = Item.Length
		      
		      If BiggestLength < ItemLength And Item <> Nil And NOT Item.Directory Then
		        BiggestLength = ItemLength
		        BiggestFile = Item
		      End If
		      
		    Next
		    
		    If BiggestFile IsA FolderItem Then VideoFile = BiggestFile
		  End If
		  
		  
		  If VideoFile = Nil OR VideoFile.Name = "BDMV" OR VideoFile.Name = "VIDEO_TS" OR VideoFile.Name.Contains(".dvdmedia") Then Return
		  ErrorStr = VideoFile.Name + " does not exist?" + EndOfLine + EndOfLine + VideoFile.ShellPath.ReplaceAll("\","")
		  
		  
		  // Get XML from MediaInfo
		  Dim XMlContent as String = DefineEncoding( MediaInfo( VideoFile, True ), Encodings.UTF8 )
		  If XMlContent = "" OR XMlContent.InStr( 0, "File read error" ) > 0 OR NOT ( Trim( XmlContent ).Left(5) = "<?xml" ) Then Return
		  ErrorStr = "XMLContent Invalid?"
		  
		  Dim VideoInfo as String = Trim( XMlContent.MyMid( "type=""Video"">", "</track" ) )
		  
		  Dim AudioInfo() as String
		  Dim sx as Integer = 0
		  While sx < XMlContent.Len
		    sx = XMlContent.InStr( sx, "type=""Audio""" )
		    If sx = 0 Then
		      sx = XMlContent.Len
		      Exit
		    End If
		    
		    Dim TmpContent as String = XMlContent.Mid( sx -1 )
		    AudioInfo.Append      Trim( TmpContent.MyMid( "type=""Audio""", "</track" ) )
		    sx = sx + 5
		  Wend
		  
		  
		  Dim SubtitleInfo() as String
		  sx = 0
		  While sx < XMlContent.Len
		    sx = XMlContent.InStr( sx, "type=""Text""" )
		    If sx = 0 Then
		      sx = XMlContent.Len
		      Exit
		    End If
		    
		    Dim TmpContent as String = XMlContent.Mid( sx -1 )
		    SubtitleInfo.Append Trim( TmpContent.MyMid( "type=""Text""", "</track" ) )
		    sx = sx + 5
		  Wend
		  
		  // Is BluRay OR DVD
		  If VidTmp <> Nil Then VideoFile = VidTmp Else VideoFile = FindMovieItem( MovieAttr.FolderParent )
		  Dim Special as Boolean = ( VideoFile.Name = "BDMV" OR VideoFile.Name = "VIDEO_TS" OR VideoFile.Name.Contains(".dvdmedia") )
		  
		  // ## Video Info
		  Dim VideoFormat   as String  =      VideoInfo.MyMid( "<Format>", "</Format>" )
		  Dim VideoProfile  as String  =      VideoInfo.MyMid( "<Profile>", "</Profile>" )
		  Dim VideoCodec    as String  =      VideoInfo.MyMid( "<Commercial_name>", "</Commercial_name>" )
		  Dim VideoCodecHint as String =      VideoInfo.MyMid( "<Codec_ID_Hint>", "</Codec_ID_Hint>" )
		  Dim VideoDuration as Double  = Val( VideoInfo.MyMid( "<Duration>", "</Duration>" ) ) / 1000
		  Dim VideoWidth    as Integer = Val( Trim( VideoInfo.MyMid("<Width>", "</Width>" ).ReplaceAll("pixels","") ) )
		  Dim VideoHeight   as Integer = Val( Trim( VideoInfo.MyMid( "<Height>", "</Height>" ).ReplaceAll("pixels","") ) )
		  Dim VideoAspect() as String = match_all( "<Display_aspect_ratio>(.*?)<\/", VideoInfo )
		  Dim VideoBitDepth as String =        VideoInfo.MyMid( "<Bit_depth>", "</Bit_depth>" )
		  Dim VideoScanType as String =        VideoInfo.MyMid( "<Scan_type>", "</Scan_Type>" )
		  Dim VideoLanguage as String
		  Dim VideoLangCode as String
		  
		  If TRUE Then
		    Dim vLanguages() as String = match_all( "<Language>(.*?)<\/", VideoInfo )
		    Dim vLangFull, vLangCode as String
		    For n as Integer = 0 To vLanguages.Ubound
		      If vLanguages(n).Len = 2 Then vLangCode = vLanguages(n)
		      If vLanguages(n).Len > vLangFull.Len Then vLangFull = vLanguages(n)
		    Next
		    VideoLanguage = vLangFull
		    VideoLangCode = vLangCode
		  End If
		  If Special And VideoDuration < 1 Then VideoDuration = 0
		  
		  // ## Audio Info
		  Dim AudioFormats()   as String
		  Dim AudioProfiles()  as String
		  Dim AudioCodecs()    as String
		  Dim AudioCodecHints() as String
		  Dim AudioBitRates()  as Integer
		  Dim AudioBitRateModes()  as String
		  Dim AudioChannels()  as Integer
		  Dim AudioLanguages() as String
		  Dim AudioLangCodes() as String
		  Dim AudioSizes()      as String
		  
		  For i as Integer = 0 to AudioInfo.Ubound
		    AudioFormats.Append   AudioInfo(i).MyMid( "<Format>", "</Format>" )
		    AudioProfiles.Append  AudioInfo(i).MyMid( "<Format_profile>", "</Format_profile>" )
		    AudioCodecs.Append    AudioInfo(i).MyMid( "<Commercial_name>", "</Commercial_name>" )
		    AudioCodecHints.Append AudioInfo(i).MyMid( "<Codec_ID_Hint>", "</Codec_ID_Hint>" )
		    If VideoDuration <= 0 Then VideoDuration = Val( AudioInfo(i).MyMid( "<Duration>", "</Duration>" ) ) / 1000
		    AudioBitRates.Append      Round( Val( AudioInfo(i).MyMid( "<Bit_rate>", "</Bit_rate>" ) ) / 1000 )
		    AudioBitRateModes.Append  AudioInfo(i).MyMid( "<Bit_rate_mode>", "</Bit_rate_mode>" )
		    AudioChannels.Append  Val( Trim( AudioInfo(i).MyMid( "<Channel_s_>", "</Channel_s_>" ).ReplaceAll("Channels", "") ) )
		    Dim Languages() as String = match_all( "<Language>(.*?)<\/", AudioInfo(i) )
		    Dim LangFull, LangCode as String
		    For n as Integer = 0 To Languages.Ubound
		      If Languages(n).Len = 2 Then LangCode = Languages(n)
		      If Languages(n).Len > LangFull.Len Then LangFull = Languages(n)
		    Next
		    AudioLanguages.Append LangFull
		    AudioLangCodes.Append LangCode
		    AudioSizes.Append  AudioInfo(i).MyMid( "<Stream_size>", "</Stream_size>" )
		  Next
		  
		  
		  // Multi-movie parts
		  If Movies <> Nil ANd Movies.Ubound > -1 Then
		    Dim d as Double = VideoDuration
		    Dim e as Double
		    
		    For i as Integer = 0 to AudioSizes.Ubound
		      e = e + val( AudioSizes(i) )
		    Next
		    
		    For i as Integer = 1 to Movies.Ubound
		      // Get multi-fileinfo
		      Dim s as String = DefineEncoding( MediaInfo( VideoFile, True ), Encodings.UTF8 )
		      
		      // Get duration
		      d = d + ( Val( VideoInfo.MyMid( "<Duration>", "</Duration>" ) ) / 1000 )
		      
		      // Get other audio tracks
		      Dim multiAudioInfo() as String
		      sx = 0
		      While sx < s.Len
		        sx = s.InStr( sx, "type=""Audio""" )
		        If sx = 0 Then
		          sx = s.Len
		          Exit
		        End If
		        
		        Dim TmpContent as String = s.Mid( sx -1 )
		        multiAudioInfo.Append      Trim( TmpContent.MyMid( "type=""Audio""", "</track" ) )
		        sx = sx + 5
		      Wend
		      
		      For n as Integer = 0 To multiAudioInfo.Ubound
		        If AudioSizes.Ubound >= n Then
		          AudioSizes(n) = Str( Val( AudioSizes(n) ) + Val( multiAudioInfo(n).MyMid( "<Stream_size>", "</Stream_size>" ) ) )
		        End If
		      Next
		      
		      
		    Next
		    VideoDuration = d
		    
		  End If
		  
		  
		  // ## Subtitle Info
		  Dim SubFormats()   as String
		  Dim SubLanguages() as String
		  Dim SubLangCodes() as String
		  
		  For i as Integer = 0 to SubtitleInfo.Ubound
		    SubFormats.Append SubtitleInfo(i).MyMid( "<Format>", "</Format>" )
		    Dim Languages() as String = match_all( "<Language>(.*?)<\/", SubtitleInfo(i) )
		    Dim LangFull, LangCode as String
		    For n as Integer = 0 To Languages.Ubound
		      If Languages(n).Len = 2 Then LangCode = Languages(n)
		      If Languages(n).Len > LangFull.Len Then LangFull = Languages(n)
		    Next
		    SubLanguages.Append LangFull
		    SubLangCodes.Append LangCode
		  Next
		  
		  // ## Set XML data.
		  Dim xNode, xVideo, xAudio, xSubtitle, xItem as XmlNode
		  xNode = xRoot.AppendNewChild( "fileinfo" ).AppendNewChild("streamdetails")
		  
		  // Video
		  If VideoWidth > 0 And VideoHeight > 0 Then
		    xVideo = xNode.AppendNewChild( "video" )
		    If VideoFormat       <> "" Then xVideo.AppendSimpleChild( "codec",  VideoFormat.ReplaceAll("AVC1","H264").ReplaceAll("AVC", "H264") ) // Codec
		    'If VideoAspect.Ubound > -1 Then xVideo.AppendSimpleChild( "aspect", VideoAspect( VideoAspect.Ubound ) ) // Aspect
		    If VideoWidth          > 0 Then xVideo.AppendSimpleChild( "width",  Str( VideoWidth  ) ) // Width
		    If VideoHeight         > 0 Then xVideo.AppendSimpleChild( "height", Str( VideoHeight ) ) // Height
		    If VideoWidth > 0 And VideoHeight > 0 Then xVideo.AppendSimpleChild( "aspect", Format( VideoWidth / VideoHeight, "0.##" ) )
		    If VideoDuration       > 0 Then
		      xVideo.AppendSimpleChild( "duration",          Str( Round( VideoDuration / 60 ) ) ) // Duration in Minutes
		      xVideo.AppendSimpleChild( "durationinseconds", Str( Round( VideoDuration ) ) ) // Duration in Seconds
		    End If
		    If VideoScanType <> "" Then xVideo.AppendSimpleChild( "scantype", VideoScanType ) // Scantype
		    If VideoBitDepth <> "" Then xVideo.AppendSimpleChild( "bitdepth", VideoBitDepth ) // Bit Depth
		    If VideoLanguage <> "" Then // Language
		      xItem = xVideo.AppendNewChild( "language" )
		      xItem.SetValue( VideoLanguage )
		      xItem.SetAttribute( "code", VideoLangCode )
		    End If
		  End If
		  
		  // Audio
		  If AudioInfo.Ubound > -1 Then
		    For i as Integer = 0 to AudioInfo.Ubound
		      xAudio = xNode.AppendNewChild( "audio" )
		      
		      if AudioCodecHints.Ubound >= i and AudioCodecHints(i) <> "" then
		        xAudio.AppendSimpleChild( "codec", AudioCodecHints(i) )
		        
		      elseif AudioFormats.Ubound >= i and AudioFormats(i) <> "" then
		        if AudioFormats(i).Contains("TrueHD") then
		          xAudio.AppendSimpleChild( "codec", "TrueHD" )
		        elseif AudioProfiles(i).Contains( "MA" ) and AudioCodecs(i).Contains( "DTS" ) then
		          if AudioProfiles(i).Contains("hd") then
		            xAudio.AppendSimpleChild( "codec", "dtshd_ma" )
		          else
		            xAudio.AppendSimpleChild( "codec", "dtshd_ma" ) 'was: dts_ma
		          end if
		        elseif AudioProfiles(i).Contains("Layer 3") and AudioCodecs(i).Contains( "MPEG Audio" ) then
		          xAudio.AppendSimpleChild( "codec", "MP3" )
		        else
		          xAudio.AppendSimpleChild( "codec", AudioCodecs(i).ReplaceAll( "AC-3", "AC3" ) ) // Codec
		        end if
		        
		      end if
		      
		      'If AudioFormats.Ubound    >= i And AudioFormats(i)   <> "" And AudioFormats(i).InStr(0, "TrueHD") > 0 Then
		      'xAudio.AppendSimpleChild( "codec", "TrueHD" ) // Codec: TrueHD
		      ''ElseIf
		      'ElseIf AudioCodecs.Ubound    >= i And AudioCodecs(i)    <> "" Then
		      'If AudioProfiles.Ubound >= i ANd AudioProfiles(i) <> "" And AudioProfiles(i).InStr( 0, "MA" ) > 0 And AudioCodecs(i).InStr( 0, "DTS" ) > 0 Then
		      'xAudio.AppendSimpleChild( "codec", "dtshd_ma" ) // Codec: DTS HD
		      'Else
		      'xAudio.AppendSimpleChild( "codec", AudioCodecs(i).ReplaceAll( "AC-3", "AC3" ) ) // Codec
		      'End If
		      'End If
		      
		      If AudioChannels.Ubound  >= i And AudioChannels(i)   > 0 Then xAudio.AppendSimpleChild( "channels", AudioChannels(i) ) // Channels
		      If AudioLanguages.Ubound >= i And AudioLanguages(i) <> "" Then // Language
		        xItem = xAudio.AppendNewChild( "language" )
		        xItem.SetValue( AudioLanguages(i) )
		        If AudioLangCodes.Ubound >= i And AudioLangCodes(i) <> "" Then xItem.SetAttribute( "code", AudioLangCodes(i) )
		      End If
		      If AudioBitRates.Ubound     >= i And AudioBitRates(i)      > 0 Then xAudio.AppendSimpleChild( "bitrate", AudioBitRates(i) )
		      If AudioBitRateModes.Ubound >= i And AudioBitRateModes(i) <> "" Then xAudio.AppendSimpleChild( "bitratemode", AudioBitRateModes(i) )
		      If AudioSizes.Ubound >= i And AudioSizes(i) <> "" Then xAudio.AppendSimpleChild( "size", AudioSizes(i) )
		    Next
		  End If
		  
		  // Subtitle
		  If SubtitleInfo.Ubound > -1 Then
		    For i as Integer = 0 to SubtitleInfo.Ubound
		      xSubtitle = xNode.AppendNewChild( "subtitle" )
		      xItem = xSubtitle.AppendNewChild( "language" )
		      xItem.SetValue( SubLanguages(i) )
		      If SubFormats.Ubound   >= i And SubFormats(i)   <> "" Then xItem.SetAttribute( "format", SubFormats(i) )
		      If SubLangCodes.Ubound >= i And SubLangCodes(i) <> "" Then xItem.SetAttribute( "code", SubLangCodes(i) )
		    Next
		  End If
		  
		  
		  
		  If AudioInfo.Ubound < 0 And VideoWidth <= 0 And VideoHeight <= 0 Then
		    xRoot.RemoveChild( xRoot.Child( xRoot.ChildCount -1 ) )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindEpisodeFiles(Dir as FolderItem, Episodes() as FolderItem = Nil) As FolderItem()
		  #pragma DisableBackgroundTasks
		  
		  If Dir = Nil OR NOT Dir.Exists Then Return Nil
		  Dim FoundEpisodes() as FolderItem
		  
		  If Dir.Visible And Dir.Directory Then
		    For i as Integer = 1 to Dir.Count
		      Try
		        If Dir.Item(i) = Nil OR NOT Dir.Item(i).Exists OR NOT Dir.Item(i).IsReadable OR Dir.Item(i).Directory Or Dir.Item(i).Visible = False Or Dir.Item(i).Name.Left(1) = "." Then Continue
		      Catch err as NilObjectException
		        #If DebugBuild Then Log( "Dir.item 1( " + Str( i ) + " )" )
		        Continue
		      End Try
		      
		      Try
		        If Dir.Item(i).Type = "video/any" And Dir.Item(i).Name.InStr( 0, "Sample" ) = 0 And Dir.Item(i).Name.InStr( 0, "sample" ) = 0 Then
		          FoundEpisodes.Append Dir.Item(i)
		          Continue
		        End If
		      Catch err as NilObjectException
		        #If DebugBuild Then Log( "FoundEpisodes.Append 1 - Dir.item( " + Str( i ) + " ) = Nil" )
		        Continue
		      End Try
		      
		      Try
		        If Dir.Item(i).Type = "archive/any" And Dir.Item(i).Name.InStr( 0, "Sample" ) = 0 And Dir.Item(i).Name.InStr( 0, "sample" ) = 0 Then
		          FoundEpisodes.Append Dir.Item(i)
		          Continue
		        End If
		      Catch err as NilObjectException
		        #If DebugBuild Then Log( "FoundEpisodes.Append 2 - Dir.item( " + Str( i ) + " ) = Nil" )
		        Continue
		      End Try
		      
		    Next
		    
		    
		    For i as Integer = 1 to Dir.Count
		      Try
		        If Dir.Item(i) = Nil OR NOT Dir.Item(i).Exists Or Dir.Item(i).Visible = False Or Dir.Item(i).Name.Left(1) = "." Then Continue // i dunno.
		      Catch err as NilObjectException
		        #If DebugBuild Then Log( "Dir.item 2( " + Str( i ) + " )" )
		        Continue
		      End Try
		      
		      Try
		        If Dir.Directory And Dir.Item(i).Name <> "BDMV" And Dir.Item(i).Name <> "VIDEO_TS" and NOT Dir.Item(i).Name.Contains(".dvdmedia") Then
		          Dim tmp() as FolderItem = FindEpisodeFiles( Dir.Item(i), FoundEpisodes )
		          If tmp = Nil Then Continue
		          
		          For n as Integer = 0 to tmp.Ubound
		            FoundEpisodes.Append tmp(n)
		          Next
		        End If
		      Catch err as NilObjectException
		        #If DebugBuild Then Log( "FoundEpisodes.append 3 - Dir.item( " + Str( i ) + " )" )
		        Continue
		      End Try
		      
		    Next
		  End If
		  
		  
		  Return FoundEpisodes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindImageBanner(BannerParent as FolderItem) As FolderItem
		  Dim Item as FolderItem
		  For i as Integer = 1 to BannerParent.Count
		    Item = BannerParent.Item(i)
		    If Item = Nil Or Item.Directory Then Continue
		    Dim Name as String = Item.Name.Lowercase // In case of case sensitive drives.
		    
		    If ( Item.Type = "image/png" Or _
		      Item.Type = "image/jpg"  Or _
		      Item.Type = "image/tbn" ) And _
		      Name.InStr( 0, "banner" ) > 0 And _
		      Name.InStr( 0, "season" ) = 0 Then
		      Return Item
		    End If
		    
		  Next
		  
		  Return Nil
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find banner" + chr(13) + chr(13) + Item.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindImageFanart(FanartParent as FolderItem) As FolderItem
		  Dim Item as FolderItem
		  For i as Integer = 1 to FanartParent.Count
		    Item = FanartParent.Item(i)
		    If Item = Nil Or Item.Directory Then Continue
		    Dim Name as String = Item.Name.Lowercase // In case of case sensitive drives.
		    
		    If NOT ( Item.Type = "image/png" Or _
		      Item.Type = "image/jpg"  Or _
		      Item.Type = "image/tbn" ) Then
		      Continue
		    End If
		    
		    If Name.InStr( 0, "fanart" ) > 0 then 'And _
		      if wndMain.ppMain.Value = 0 then
		        Return Item
		      elseif FanartParent.Name.InStr( "season" ) = 0 and Name.InStr( 0, "season" ) = 0 Then
		        Return Item
		      else
		        Return Item
		      end if
		      
		    End If
		    
		  Next
		  
		  Return Nil
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find fanart" + chr(13) + chr(13) + Item.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindImagePoster(PosterParent as FolderItem) As FolderItem
		  If PosterParent = Nil OR NOT PosterParent.Exists Then Return Nil
		  
		  Dim MovieName as String
		  Dim MovieItem as FolderItem
		  If ActiveSection = 0 Then MovieItem = FindMovieItem( PosterParent )
		  Dim Item as FolderItem
		  
		  If ActiveSection = 0 Then
		    If MovieItem <> Nil then MovieName = MovieItem.NameNoExtension.Lowercase
		    If MovieName ="VIDEO_TS" Or MovieName = "BDMV" Or MovieName.Contains(".dvdmedia") Then MovieName = PosterParent.Name.Lowercase
		    
		    If MovieItem IsA FolderItem And MovieItem.Parent.Child( MovieItem.NameNoExtension + "-poster.jpg" ).Exists Then
		      Return MovieItem.Parent.Child( MovieItem.NameNoExtension + "-poster.jpg" )
		    End If
		    
		    
		    If MovieItem IsA FolderItem And MovieItem.Parent.Child( MovieItem.NameNoExtension + ".jpg" ).Exists Then
		      Return MovieItem.Parent.Child( MovieItem.NameNoExtension + ".jpg" )
		    End If
		    
		    If MovieItem IsA FolderItem And MovieItem.Parent.Child( MovieAttr.UnPart( MovieItem.NameNoExtension ) + ".jpg" ).Exists Then
		      Return MovieItem.Parent.Child( MovieAttr.UnPart( MovieItem.NameNoExtension ) + ".jpg" )
		    End If
		    
		  End If
		  
		  
		  If PosterParent IsA FolderItem And PosterParent.Child( PosterParent.Name + ".jpg" ).Exists Then
		    Return PosterParent.Child( PosterParent.Name + ".jpg" )
		  End If
		  
		  
		  If PosterParent IsA FolderItem And PosterParent.Child( "Set_" + PosterParent.Name + "_1.jpg" ).Exists Then
		    Return PosterParent.Child( "Set_" + PosterParent.Name + "_1.jpg" )
		  End If
		  
		  
		  Dim FolderIMG as FolderItem
		  For i as Integer = 1 to PosterParent.Count
		    Item = PosterParent.Item(i)
		    If Item = Nil Or Item.Directory Then Continue
		    Dim Name as String = Item.Name.Lowercase // In case of case sensitive drives.
		    
		    If NOT ( Item.Type = "image/png" Or _
		      Item.Type = "image/jpg"  Or _
		      Item.Type = "image/tbn" ) Then
		      Continue
		    End If
		    
		    If Name.InStr( 0, "season" ) > 0 Then Continue
		    
		    If Name = "folder.jpg" Then FolderIMG = Item
		    
		    If ActiveSection = 0 Then
		      If Name.InStr( 0, "poster" ) > 0 or _
		        Name.Left(5) = "movie" or _
		        _'Name.Left(6) = "folder" or _
		        Name = "index.jpg" or _
		        Name = "index.tbn" or _
		        Item.NameNoExtension.Lowercase = MovieName Then
		        Return Item
		      End If
		    End If
		    
		    
		    If ActiveSection = 1 And Name.InStr( 0, "poster" ) > 0 Then Return Item
		    
		    
		    Item = Nil
		  Next
		  
		  If FolderIMG <> Nil And FolderIMG.Exists Then Return FolderIMG
		  
		  Return Nil
		  
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find poster" + chr(13) + chr(13) + Item.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindImageSeasonArt(FolderParent as FolderItem) As FolderItem()
		  Dim SeasonArt() as FolderItem
		  
		  For i as Integer = 1 to FolderParent.Count
		    Dim Item as FolderItem = FolderParent.Item(i)
		    If Item = Nil Or Item.Directory Or NOT Item.Exists Then Continue
		    Dim Name as String = Item.Name.Lowercase // In case of case sensitive drives.
		    
		    If ( Item.Type = "image/png" Or _
		      Item.Type = "image/jpg"  Or _
		      Item.Type = "image/tbn" ) And _
		      Name.InStr( 0, "season" ) > 0 Then
		      SeasonArt.Append Item
		    End If
		    
		  Next
		  
		  If SeasonArt.Ubound > -1 Then Return SeasonArt Else Return Nil
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find season art"' + chr(13) + chr(13) + Item.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindMovieItem(MovieParent as FolderItem) As FolderItem
		  Dim MovieFile as FolderItem
		  
		  If MovieParent = Nil OR NOT MovieParent.Exists Then Return Nil
		  
		  For i as Integer = 1 to MovieParent.Count
		    MovieFile = MovieParent.Item(i)
		    If MovieFile = Nil Or NOT MovieFile.Exists Then Continue
		    Dim Name as String = MovieFile.Name.Lowercase // In case of case sensitive drives.
		    
		    If MovieFile.Type = "video/any" or MovieFile.Type = "archive/any" then
		      
		      If MovieFile <> Nil And MovieFile.Visible = True And NOT MovieFile.Directory And _
		        NOT Name.Contains( "trailer" + "." + MovieFile.NameExtension.Lowercase )  And _
		        NOT Name.Contains( "sample" ) And _
		        NOT Name.Contains( "-extra-" ) And _
		        NOT Name.Contains( "[bonus" ) And _
		        NOT MovieFile.Parent.Name.Contains("Themes") and NOT MovieFile.Parent.Name.Contains("Sample") then
		        Return MovieFile
		      End If
		      
		    ElseIf MovieFile <> Nil And ( Name.Contains( "video_ts" ) Or Name = "bdmv" or Name.Contains(".dvdmedia") ) And MovieFile.Directory Then
		      Return MovieFile
		    End If
		    
		  Next
		  
		  Return Nil
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find movie" + chr(13) + chr(13) + MovieFile.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindMovieItems(MovieParent as FolderItem) As FolderItem()
		  Dim MovieFile, MovieFiles() as FolderItem
		  
		  If MovieParent = Nil Then Return Nil
		  
		  For i as Integer = 1 to MovieParent.Count
		    MovieFile = MovieParent.Item(i)
		    If MovieFile = Nil OR NOT MovieFile.Exists Then Continue
		    Dim Name as String = MovieFile.Name.Lowercase // In case of case sensitive drives.
		    
		    If MovieFile.Type = "video/any" then
		      
		      If MovieFile <> Nil And MovieFile.Visible = True And NOT MovieFile.Directory And _
		        Name.InStr( -1, "trailer" ) = 0 And _
		        Name.InStr( -1, "sample" )  = 0 And _
		        Name.InStr( -1, "-extra-" ) = 0 And _
		        Name.InStr( -1, "[bonus" )  = 0 And _
		        NOT ( MovieFile.Parent.Name = "Themes" ) and NOT ( MovieFile.Parent.Name = "Sample" ) then
		        MovieFiles.Append MovieFile
		      End If
		      
		    ElseIf Name.Contains( "video_ts" ) Or Name = "bdmv" Or Name.Contains( ".dvdmedia" ) Then
		      MovieFiles.Append MovieFile
		    End If
		    
		  Next
		  
		  Return MovieFiles
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find movie files"' + chr(13) + chr(13) + Item.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindMovieName(MovieParent as FolderItem, Filter as Boolean = False, UseFileName as Boolean = False) As String
		  
		  Dim MovieName as String
		  
		  If UseFileName then
		    Dim MovieFile as FolderItem = FindMovieItem( MovieParent )
		    if MovieFile = Nil then MovieFile = MovieParent
		    if MovieFile = Nil or NOT MovieFile.Exists then Return ""
		    
		    If MovieFile.Name = "VIDEO_TS" Or MovieFile.Name = "BDMV" or MovieFile.Name.Contains(".dvdmedia") Then
		      MovieName = MovieParent.name
		    Else
		      MovieName = MovieFile.NameNoExtension
		    end if
		    
		  Else
		    if MovieParent.Directory then
		      MovieName = MovieParent.Name'NoExtension
		    else
		      MovieName = MovieParent.NameNoExtension
		    end if
		  End If
		  
		  If Filter then
		    Dim i as Integer = -1
		    
		    i = MovieName.InStr( -1, "720p" )
		    If i <= 0 then i = MovieName.InStr( -1, "1080p" )
		    If i <= 0 then i = MovieName.InStr( -1, "2160p" )
		    If i <= 0 then i = MovieName.InStr( -1, "2880p" )
		    If i <= 0 then i = MovieName.InStr( -1, "4320p" )
		    If i <= 0 then i = MovieName.InStr( -1, "4K" )
		    If i <= 0 then i = MovieName.InStr( -1, "5K" )
		    If i <= 0 then i = MovieName.InStr( -1, "8K" )
		    If i <= 0 then i = MovieName.InStr( -1, "xvid"  )
		    If i <= 0 then i = MovieName.InStr( -1, "divx"  )
		    If i <= 0 then i = MovieName.InStr( -1, "x264"  )
		    If i <= 0 then i = MovieName.InStr( -1, "AC3"   )
		    If i <= 0 then i = MovieName.InStr( -1, "DTS"   )
		    If i <= 0 then i = MovieName.InStr( -1, "BRRip" )
		    If i <= 0 then i = MovieName.InStr( -1, "WEB-DL" )
		    If i <= 0 then i = MovieName.InStr( -1, "WEB DL" )
		    If i  > 0 then MovieName = MovieName.Left( i - 1 )
		    
		    MovieName = MovieName.ReplaceAll( ".", " " )
		    
		    'MovieName = MovieName.ReplaceAll(" - ", " " )
		    MovieName = MovieName.ReplaceAll( " - ", "  " )
		    MovieName = MovieName.ReplaceAll( "- ",  ": "  )
		    MovieName = MovieName.ReplaceAll( "-",   " "    )
		    MovieName = MovieName.ReplaceAll( "  ", " "   )
		    
		    MovieName = MovieName.ReplaceAll( "x264", "" )
		    MovieName = MovieName.ReplaceAll( "AC3",  "" )
		    MovieName = MovieName.ReplaceAll( "DTS",  "" )
		    
		    MovieName = MovieName.ReplaceAll( "xvid", "" )
		    MovieName = MovieName.ReplaceAll( "divx", "" )
		    MovieName = MovieName.ReplaceAll( "dvdmedia", "" )
		    
		    MovieName = MovieName.ReplaceAll( "DVD-Rip",    "" )
		    MovieName = MovieName.ReplaceAll( "BR-Rip",     "" )
		    MovieName = MovieName.ReplaceAll( "BluRay-Rip", "" )
		    MovieName = MovieName.ReplaceAll( "-Rip",       "" )
		    
		    MovieName = MovieName.ReplaceAll( "DVDrip",  "" )
		    MovieName = MovieName.ReplaceAll( "DVD rip", "" )
		    MovieName = MovieName.ReplaceAll( "DVD",     "" )
		    MovieName = MovieName.ReplaceAll( "BluRay",  "" )
		    MovieName = MovieName.ReplaceAll( "brrip",   "" )
		    MovieName = MovieName.ReplaceAll( "bdrip",   "" )
		    MovieName = MovieName.ReplaceAll( "460p",    "" )
		    MovieName = MovieName.ReplaceAll( "720p",    "" )
		    MovieName = MovieName.ReplaceAll( "1080p",   "" )
		    MovieName = MovieName.ReplaceAll( "2160p",   "" )
		    MovieName = MovieName.ReplaceAll( "2880p",   "" )
		    MovieName = MovieName.ReplaceAll( "4320p",   "" )
		    
		    MovieName = MovieName.ReplaceAll( "unrated",        "" )
		    MovieName = MovieName.ReplaceAll( "uncut",          "" )
		    MovieName = MovieName.ReplaceAll( "Directors Cut",  "" )
		    MovieName = MovieName.ReplaceAll( "Director's Cut", "" )
		    MovieName = MovieName.ReplaceAll( "Extended Cut",   "" )
		    
		    MovieName = MovieName.ReplaceAll( "()", "" )
		    
		    Dim Year as String = match( "\(([0-9][0-9][0-9][0=9])\)", MovieName )
		    If Year = "" Then Year = match( "\[([0-9][0-9][0-9][0-9])\]", MovieName )
		    'if Year = "" Then Year = match( "[0-9][0-9][0-9][0-9]", MovieName )
		    
		    MovieName = RegExThis( MovieName, "\[(.*?)\]" )
		    
		    If Year <> "" Then
		      MovieName = Trim( MovieName.ReplaceAll( Year, "" ) )
		      MovieName = MovieName + " " + Year.ReplaceAll( "[", "(" ).ReplaceAll( "]", ")" )
		    End If
		    
		    'If MovieName.Left(1)  = "[" then MovieName = MovieName.Right( MovieName.Len - MovieName.InStr( -1, "]") - 1 )
		    'If MovieName.Right(1) = "]" then MovieName = MovieName.Left(  MovieName.Len - MovieName.InStr( -1, "[") - 1 )
		    
		    If MovieName.InStr( 0, "[" ) > 5 Then MovieName = MovieName.Left( MovieName.InStr( 0, "[" ) - 1 )
		    'If MovieName.InStr( 0, "(" ) > 5 Then MovieName = MovieName.Left( MovieName.InStr( 0, "(" ) - 1 )
		    
		    While MovieName.InStr( -1, "  " ) > 0
		      MovieName = MovieName.ReplaceAll( "  ", " " )
		    Wend
		    
		    'MovieName = Titlecase( MovieName )
		  End If
		  
		  Return Trim( MovieName )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindNFOFile(NFOParent as FolderItem) As FolderItem
		  If NFOParent = Nil OR NOT NFOParent.Exists Then Return Nil
		  
		  Dim MovieName as String
		  Dim MovieItem as FolderItem
		  If ActiveSection = 0 Then
		    MovieItem = FindMovieItem( NFOParent )
		    
		    If MovieItem <> Nil and MovieItem.Exists Then MovieName = MovieItem.NameNoExtension
		    If MovieItem <> Nil and ( MovieItem.Name = "VIDEO_TS" or MovieItem.Name = "BDMV" or MovieItem.Name.Contains(".dvdmedia") ) And Preferences.Prefs.stringForKey("MediaPlayer") <> "YAMJ" Then NFOParent = MovieItem
		    
		    If MovieItem IsA FolderItem And MovieItem.Parent.Child( MovieItem.NameNoExtension + ".nfo" ).Exists Then
		      Return MovieItem.Parent.Child( MovieItem.NameNoExtension + ".nfo" )
		    End If
		  End If
		  
		  
		  If ActiveSection = 1 Then
		    If NFOParent.Child("tvshow.nfo").Exists Then Return NFOParent.Child("tvshow.nfo")
		    If NFOParent.Child( NFOParent.Name + ".nfo" ).Exists Then Return NFOParent.Child( NFOParent.Name + ".nfo" )
		  End If
		  
		  
		  If NFOParent.Child( "Set_" + NFOParent.Name + "_1.nfo" ).Exists Then Return NFOParent.Child( "Set_" + NFOParent.Name + "_1.nfo" )
		  
		  
		  For i as integer = 1 to NFOParent.Count
		    Dim Item as FolderItem = NFOParent.Item(i)
		    If Item = Nil OR NOT Item.Exists Then Continue
		    Dim Name as String = Item.Name.Lowercase // In case of case sensitive drives.
		    
		    If Name = "mymovies.xml" OR Name = ".nfo" Then Continue // Ignore http://www.mediabrowser.tv files.
		    
		    Dim Content as String
		    
		    // TV section
		    If ActiveSection = 1 And Item <> Nil And Item.Type = "special/nfo" And ( Name = "tvshow.nfo" OR Name.Contains("set_") OR Name.Right(4) = ".nfo" ) Then
		      Content = Trim( ReadTextFile( Item ) )
		    End If
		    
		    // Movie Section
		    If ActiveSection = 0 And Item <> Nil And Item.Type = "special/nfo" Then Content = Trim( ReadTextFile( Item ) )
		    
		    // If valid XML then 'Return Item'.
		    If Content.Left(10).InStr( 0, "<?xml" ) > 0 Then Return Item
		    
		  Next
		  
		  Return Nil
		  
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find .nfo files"' + chr(13) + chr(13) + Item.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindRipSource(TheFile as FolderItem) As String
		  If TheFile = Nil OR NOT TheFile.Exists Then Return ""
		  If ActiveSection = 0 And TheFile.Directory And FindMovieItem( TheFile ) <> Nil Then TheFile = FindMovieItem( TheFile )
		  
		  
		  Dim s as String = Trim( TheFile.NameNoExtension.Uppercase )
		  
		  // VHS
		  If s.InStr( "VHS" ) > 0 Then Return "VHS"
		  
		  // SDTV
		  if s.InStr( "SDTV" ) > 0 then Return "SDTV"
		  
		  // HDTV
		  If s.InStr( "HDTV" ) > 0 or s.InStr( "PDTV" ) > 0 or s.InStr( "DSR" ) > 0 Then Return "HDTV"
		  
		  // HD-DVD
		  If s.InStr( "HDDVD" ) > 0 OR s.InStr( "HD-DVD" ) > 0 Then Return "HDDVD"
		  
		  // DVD
		  If s.InStr( "DVDRIP" ) > 0 OR s.InStr( "DVD-RIP" ) > 0 OR s.InStr( "DVD" ) > 0 OR s = "VIDEO_TS" or s.Contains(".dvdmedia") Then Return "DVD"
		  
		  // BluRay
		  If s.InStr( "BRRIP" )      > 0 OR _
		    s.InStr( "BR-RIP" )   > 0 OR _
		    s.InStr( "BD-RIP" )   > 0 OR _
		    s.InStr( "BDRIP" )    > 0 OR _
		    s.InStr( "BLURAY" )   > 0 OR _
		    s.InStr( "BLU-RAY" )  > 0 OR _
		    s.InStr( "BLUERAY" )  > 0 OR _
		    s.InStr( "BLUE-RAY" ) > 0 OR _
		    s.InStr( "BD25" ) > 0 OR _
		    s.InStr( "BD50" ) > 0 OR _
		    s = "BDMV" Then
		    
		    Return "BluRay"
		  End If
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindSubtitles(SubtitleParent as FolderItem) As FolderItem()
		  If SubtitleParent = Nil OR NOT SubtitleParent.Exists Then Return Nil
		  
		  Dim Subtitles() as FolderItem
		  
		  Dim Item as FolderItem
		  For i as Integer = 1 to SubtitleParent.Count
		    Item = SubtitleParent.Item(i)
		    If Item = Nil OR NOT Item.Exists Then Continue
		    If Item.Type = "special/subtitle" OR ( Item.Name = "Subs" And Item.Directory ) Then Subtitles.Append Item
		  Next
		  If Subtitles.Ubound > -1 Then Return Subtitles Else Return Nil
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find Subtitle" + chr(13) + chr(13) + Item.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindTrailerItem(TrailerParent as FolderItem) As FolderItem
		  If TrailerParent = Nil or NOT TrailerParent.Exists then Return Nil
		  If NOT TrailerParent IsA FolderItem Then Return Nil
		  
		  Dim Item as FolderItem
		  For i as Integer = 1 to TrailerParent.Count
		    Item = TrailerParent.Item(i)
		    If Item = Nil OR NOT Item.Exists Then Continue
		    Dim Name as String = Item.NameNoExtension.Lowercase // In case of case sensitive drives.
		    
		    if FileTypes.ImageAny.Name.Contains( Item.Type.NthField("/", 1) ) then Continue
		    
		    If NOT item.Directory and Name.InStr( 0, "trailer" ) > 0 and Name.Right(7) = "trailer" Then Return Item
		    
		    
		    If Name.Contains("video_ts") OR Name.Contains("bdmv") or name.Contains(".dvdmedia") Then
		      
		      For n as Integer = 1 to Item.Count
		        Dim SubItem as FolderItem = Item.Item(n)
		        If SubItem = Nil OR NOT SubItem.Exists Then Continue
		        Dim SubName as String = SubItem.Name.Lowercase
		        
		        If SubName.Contains( "trailer" ) Then Return SubItem
		      Next
		      
		    End If
		    
		  Next
		  
		  Return Nil
		  
		  
		  Exception err as NilObjectException
		    If DebugBuild Then
		      MessageBox "Couldn't find trailer?" + chr(13) + chr(13) + Item.ShellPath.ReplaceAll("\","")
		    End If
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FlagCountry(ISO as String) As String
		  Select Case ISO.Lowercase
		    
		  case "en"
		    Return "USA"
		  case "us"
		    Return "USA"
		  case "gb"
		    Return "UK"
		  case "nl"
		    Return "Netherlands"
		  case "da"
		    Return "Denmark"
		  case "dk"
		    Return "Denmark"
		  case "pt"
		    Return "Brazil"
		  case "fi"
		    Return "Finland"
		  case "de"
		    Return "Germany"
		  case "it"
		    Return "Italy"
		  case "es"
		    Return "Spain"
		  case "fr"
		    Return "France"
		  case "pl"
		    Return "Portugal"
		  case "hu"
		    Return "Hungaria"
		  case "el" // Greece
		    Return "Greece"
		  case "tr" // Turkish
		    Return "Turkey"
		  case "ru" // Russian
		    Return "Russia"
		  case "he" // Hebrew
		    Return "Hebrew"
		  case "ja" // Japanese
		    Return "Japan"
		  case "pt"
		    Return "Portugal"
		  case "zh" // Chinese / Mandarin
		    Return "China"
		  case "cz" // Czech
		    Return "Czech"
		  case "sl"
		    Return "Slovenia"
		  case "hr"
		    Return "Croatia"
		  case "ko" // Korean
		    Return "Korea"
		  case "no"
		    Return "Norwegia"
		    
		  End Select
		  
		  'Return ISO
		  
		  Select Case ISO.Uppercase
		    
		  case "USA"
		    Return "en"
		  case "UK"
		    Return "en-gb"
		  case "Netherlands"
		    Return "NL"
		  case "Denmark"
		    Return "da"
		  case "Brazil"
		    Return "pt"
		  case "Finland"
		    Return "fi"
		  case "Germany"
		    Return "de"
		  case "Italy"
		    Return "it"
		  case "Spain"
		    Return "es"
		  case "France"
		    Return "fr"
		  case "Portugal"
		    Return "pl"
		  Case "Brazil"
		    Return "pt"
		  case "Hungaria"
		    Return "hu"
		  case "Greece" // Greece
		    Return "el"
		  case "Turkey" // Turkish
		    Return "tr"
		  case "Russia" // Russian
		    Return "ru"
		  case "Hebrew" // Hebrew
		    Return "he"
		  case "Japan" // Japanese
		    Return "ja"
		  case "Portugal"
		    Return "pt"
		  case "China" // Chinese / Mandarin
		    Return "zh"
		  case "Czech" // Czech
		    Return "cz"
		  case "Slovenia"
		    Return "sl"
		  case "Croatia"
		    Return "hr"
		  case "Korea" // Korean
		    Return "ko"
		  case "Norwegia"
		    Return "no"
		    
		  End Select
		  
		  Return ISO
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FlagLanguage(Language As String) As String
		  select case language
		    
		    // Full length language name to abbriviation
		  case "American English"
		    Return "en"
		  case "USA English"
		    Return "en"
		  case "UK English"
		    Return "gb"
		  case "English"
		    Return "en"
		  case "Nederlands"
		    Return "nl"
		  case "Svenska"
		    Return "sv"
		  case "Dansk"
		    Return "da"
		  case "Suomeksi"
		    Return "fi"
		  case "Deutsch"
		    Return "de"
		  case "Italiano"
		    Return "it"
		  case "Español"
		    Return "es"
		  case "Français"
		    Return "fr"
		  case "Polski"
		    Return "pl"
		  case "Magyar"
		    Return "hu"
		  case "Ελληνικά" // Greece
		    Return "el"
		  case "Türkçe" // Turkish
		    Return "tr"
		  case "русский язык" // Russian
		    Return "ru"
		  case "עברית" // Hebrew
		    Return "he"
		  case "日本語" // Japanese
		    Return "ja"
		  case "Português"
		    Return "pt"
		  Case "Brasil"
		    Return "br"
		  case "中文" // Chinese / Mandarin
		    Return "zh"
		  case "čeština"
		    Return "cs"
		  case "Slovenski"
		    Return "sl"
		  case "Hrvatski"
		    Return "hr"
		  case "한국어" // Korean
		    Return "ko"
		  case "Norsk"
		    Return "no"
		    
		    // And in reverse!
		  case "en"
		    Return "American English"
		  case "gb"
		    Return "UK English"
		  case "nl"
		    Return "Nederlands"
		  case "da"
		    Return "Dansk"
		  case "sv"
		    Return "Svenska"
		  case "fi"
		    Return "Suomeksi"
		  case "de"
		    Return "Deutsch"
		  case "it"
		    Return "Italiano"
		  case "es"
		    Return "Español"
		  case "fr"
		    Return "Français"
		  case "pl"
		    Return "Polski"
		  case "hu"
		    Return "Magyar"
		  case "el" // Greece
		    Return "Ελληνικά"
		  case "tr" // Turkish
		    Return "Türkçe"
		  case "ru" // Russian
		    Return "русский язык"
		  case "he" // Hebrew
		    Return "עברית"
		  case "ja" // Japanese
		    Return "日本語"
		  case "pt"
		    Return "Português"
		  case "br"
		    Return "Brasil"
		  case "zh" // Chinese / Mandarin
		    Return "中文"
		  case "cs" // Czech
		    Return "čeština"
		  case "sl"
		    Return "Slovenski"
		  case "hr"
		    Return "Hrvatski"
		  case "ko" // Korean
		    Return "한국어"
		  case "no"
		    Return "Norsk"
		    
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GatherRecommendations()
		  If wndMain.ccSearchBoxMovies.srchField.StringValue <> "" Then
		    wndMain.ccSearchBoxMovies.srchField.StringValue = ""
		  End If
		  If wndMain.ccSearchBoxTVShows.srchField.StringValue <> "" Then
		    wndMain.ccSearchBoxTVShows.srchField.StringValue = ""
		  End If
		  
		  Dim Recs(), IDs(), RecBy() as String
		  Dim Count() as Integer
		  
		  Dim LstBox as Listbox = wndMain.lstMovies
		  If ActiveSection = 1 Then LstBox = wndMain.lstTVShadow
		  For i as Integer = 0 to LstBox.ListCount - 1
		    Dim Parent as FolderItem = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If Parent = Nil OR NOT Parent.Exists Then Continue
		    
		    Dim NFOFile as FolderItem = FindNFOFile( Parent )
		    If NFOFile = Nil OR NOT NFOFile.Exists OR NOT NFOFile.IsReadable Then Continue
		    
		    If ActiveSection = 0 Then
		      MovieAttr.NFORead( Parent )
		      
		      For n as Integer = 0 to MovieAttr.RecMoviesIDs.Ubound
		        
		        Dim b as Boolean = False
		        For t as Integer = 0 to Recs.Ubound
		          If MovieAttr.RecMoviesIDs(n) = IDs(t) Then
		            Count(t) = Count(t) + 1
		            If MovieAttr.RecMoviesIDs(n).Left(2) = "tt" Then IDs(t) = MovieAttr.RecMoviesIDs(n)
		            If MovieAttr.RecMovies(n) <> Loc.kNotAvailable Or Recs(t) <> MovieAttr.RecMovies(n) Then Recs(t) = MovieAttr.RecMovies(n)
		            
		            If RecBy(t) = "" Then
		              RecBy(t) = LstBox.Cell( i, 1 ) 'MovieAttr.Title
		            Else
		              RecBy(t) = RecBy(t) + "|" + LstBox.Cell( i, 1 ) 'MovieAttr.Title
		            End If
		            
		            b = True
		            Exit
		          End If
		        Next
		        
		        
		        If NOT b Then
		          Recs.Append MovieAttr.RecMovies(n)
		          IDs.Append  MovieAttr.RecMoviesIDs(n)
		          Count.Append 1
		          RecBy.Append MovieAttr.Title
		        End If
		        
		      Next
		      
		    End If
		    
		    If ActiveSection = 1 Then
		      
		      TVAttr.NFORead( Parent )
		      
		      For n as Integer = 0 to TVAttr.RecShow_IDs.Ubound
		        
		        Dim b as Boolean = False
		        For t as Integer = 0 to Recs.Ubound
		          If IDs(t) = TVAttr.RecShow_IDs(n) Then 'TVAttr.RecShows(n) = Recs(t) Then
		            Count(t) = Count(t) + 1
		            If TVAttr.RecShow_IDs(n).Left(2) = "tt" Then IDs(t) = TVAttr.RecShow_IDs(n)
		            If TVAttr.RecShows(n) <> Loc.kNotAvailable Then 'OR Recs(t) <> TVAttr.RecShows(n) Then
		              Recs(t) = TVAttr.RecShows(n)
		            End If
		            
		            If RecBy(t) = "" Then
		              RecBy(t) = TVAttr.Title
		            Else
		              RecBy(t) = RecBy(t) + "|" + TVAttr.Title
		            End If
		            
		            b = True
		            Exit
		          End If
		        Next
		        
		        If NOT b Then
		          Recs.Append TVAttr.RecShows(n)
		          IDs.Append TVAttr.RecShow_IDs(n)
		          Count.Append 1
		          RecBy.Append TVAttr.Title
		        End If
		        
		      Next
		      
		    End If
		    
		  Next
		  
		  
		  
		  For i as Integer = 0 to LstBox.ListCount -1
		    Dim ID as String = LstBox.Cell( i, 2 )
		    Dim Title as String = Trim( LstBox.Cell(i, 0) ) ', "\([0-9][0-9][0-9][0-9]\)" ) )
		    
		    For n as Integer = 0 to IDs.Ubound
		      If ID = IDs(n) OR Title = Trim( Recs(n) ) Then
		        Recs.Remove(n)
		        IDs.Remove(n)
		        Count.Remove(n)
		        RecBy.Remove(n)
		        Exit
		      End If
		    Next
		  Next
		  
		  
		  wndRecommendations.Show
		  LstBox = wndRecommendations.lstRecs
		  For i as Integer = 0 to Recs.Ubound
		    LstBox.AddRow( Recs(i), Trim( IDs(i).ReplaceAll("RottenTomatoes", "") ), Str( Format( Count(i), "000" ) ), RecBy(i) )
		  Next
		  LstBox.SortedColumn = 0
		  LstBox.ColumnSortDirection(0) = 1
		  LstBox.Sort
		  
		  LstBox.SortedColumn = 2
		  LstBox.ColumnSortDirection(2) = -1
		  LstBox.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenreList() As String()
		  
		  If Genre.Action <> "" Then
		    
		    Dim Genres() as String
		    
		    Genres.Append Genre.ThreeD
		    Genres.Append Genre.Action
		    Genres.Append Genre.Adventure
		    Genres.Append Genre.Animation
		    Genres.Append Genre.Children
		    Genres.Append Genre.Comedy
		    Genres.Append Genre.Crime
		    Genres.Append Genre.Documentary
		    Genres.Append Genre.Drama
		    Genres.Append Genre.Eastern
		    Genres.Append Genre.Erotic
		    Genres.Append Genre.Family
		    If ActiveSection = 0 Then Genres.Append Genre.FanFilm
		    Genres.Append Genre.Fantasy
		    If ActiveSection = 0 Then Genres.Append Genre.FilmNoir
		    Genres.Append Genre.Foreign
		    If ActiveSection = 1 Then Genres.Append Genre.GameShow
		    Genres.Append Genre.History
		    Genres.Append Genre.Holiday
		    Genres.Append Genre.Horror
		    Genres.Append Genre.Indie
		    If ActiveSection = 1 Then Genres.Append Genre.MiniSeries
		    Genres.Append Genre.Music
		    Genres.Append Genre.Musical
		    Genres.Append Genre.Mystery
		    Genres.Append Genre.Neonoir
		    If ActiveSection = 1 Then Genres.Append Genre.News
		    If ActiveSection = 0 Then Genres.Append Genre.RoadMovie
		    Genres.Append Genre.Romance
		    Genres.Append Genre.ScienceFiction
		    Genres.Append Genre.Shorty
		    If ActiveSection = 1 Then Genres.Append Genre.Soap
		    If ActiveSection = 1 Then Genres.Append Genre.SpecialInterest
		    Genres.Append Genre.Sport
		    Genres.Append Genre.SportingEvent
		    If ActiveSection = 0 Then Genres.Append Genre.SportsFilm
		    Genres.Append Genre.Suspense
		    If ActiveSection = 1 Then Genres.Append Genre.TalkShow
		    Genres.Append Genre.Thriller
		    Genres.Append Genre.TVmovie
		    Genres.Append Genre.War
		    Genres.Append Genre.Western
		    
		    Genres = RemoveDuplicatesFromArray( Genres )
		    Genres.Sort
		    Return Genres
		    
		  Else
		    
		    Dim Genres as String = "Action/Adventure/Animation/Comedy/Crime/Disaster/Documentary/Drama/Eastern/Erotic/Family/Fan Film/Fantasy/Film Noir/Foreign/History/Holiday/Horror/Indie/Music/Musical/Mystery/Neo-noir/Road Movie/Romance/Science Fiction/Short/Sport/Sporting Event/Sports Film/Suspense/TV movie/Thriller/War/Western"
		    Return Genres.Split("/")
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HollidaysPainter(extends g as Graphics)
		  Dim d as New Date
		  
		  // Christmas
		  If d.Month = 12 And d.Day >= 20 And d.Day <= 30 Then
		    g.DrawPicture Snowman, ( g.Width / 2 ) - ( 384 / 2 ), 0,  384, 384,   0, 0, Snowman.Width, Snowman.Height
		    g.TextSize = 64
		    g.TextFont = "Apple Chancery"
		    
		    g.ForeColor = &cFFFFFF
		    g.DrawString "Happy Hollidays!", ( g.Width / 2 ) - ( g.StringWidth( "Happy Hollidays!" ) / 2 ), 384 + g.TextSize + 1
		    
		    g.ForeColor = rgb(71, 168, 226)
		    g.DrawString "Happy Hollidays!", ( g.Width / 2 ) - ( g.StringWidth( "Happy Hollidays!" ) / 2 ), 384 + g.TextSize
		    
		    // Halloween
		  ElseIf d.Month = 10 And d.Day = 31 Then
		    g.DrawPicture JackOLantern, ( g.Width / 2 ) - ( 384 / 2 ), 50, 384, 384,  0, 0, JackOLantern.Width, JackOLantern.Height
		    g.TextSize = 64
		    g.TextFont = "Baskerville"
		    
		    g.ForeColor = &cFFFFFF
		    g.DrawString "Happy Halloween!", ( g.Width / 2 ) - ( g.StringWidth( "Happy Halloween!" ) / 2 ), 384 + g.TextSize + 50 + 1
		    
		    g.ForeColor = rgb(220, 117, 15)
		    g.DrawString "Happy Halloween!", ( g.Width / 2 ) - ( g.StringWidth( "Happy Halloween!" ) / 2 ), 384 + g.TextSize + 50
		    
		    // Valentine's Day
		  ElseIf d.Month = 2 And d.Day = 14 Then
		    
		  End If
		  
		  g.TextFont = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function iconImage(Extends f as FolderItem, size as Integer) As Picture
		  'Dim pic as Picture
		  'If f <> nil and f.Exists then
		  'pic      = f.IconImageMBS ( size )
		  'If pic <> Nil Then pic.Mask = f.IconMaskMBS ( size )
		  'Return pic
		  'Else
		  'Return Nil
		  'End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Int2Month(Month as Integer, LongMonth as Boolean = False) As String
		  If LongMonth Then
		    
		    Select case Month
		      
		    case 1
		      Return Loc.kLongMonth01January
		    case 2
		      Return Loc.kLongMonth02February
		    case 3
		      Return Loc.kLongMonth03March
		    case 4
		      Return Loc.kLongMonth04April
		    case 5
		      Return Loc.kLongMonth05May
		    case 6
		      Return Loc.kLongMonth06June
		    case 7
		      Return Loc.kLongMonth07July
		    case 8
		      Return Loc.kLongMonth08August
		    case 9
		      Return Loc.kLongMonth09September
		    case 10
		      Return Loc.kLongMonth10October
		    case 11
		      Return Loc.kLongMonth11November
		    case 12
		      Return Loc.kLongMonth12December
		      
		    end select
		    
		  Else
		    
		    Select case Month
		      
		    case 1
		      Return Loc.kShortMonth01January
		    case 2
		      Return Loc.kShortMonth02February
		    case 3
		      Return Loc.kShortMonth03March
		    case 4
		      Return Loc.kShortMonth04April
		    case 5
		      Return Loc.kShortMonth05May
		    case 6
		      Return Loc.kShortMonth06June
		    case 7
		      Return Loc.kShortMonth07July
		    case 8
		      Return Loc.kShortMonth08August
		    case 9
		      Return Loc.kShortMonth09September
		    case 10
		      Return Loc.kShortMonth10October
		    case 11
		      Return Loc.kShortMonth11November
		    case 12
		      Return Loc.kShortMonth12December
		      
		    end select
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JSONArray(JSON as JSONItem, Key as String = "") As String()
		  Dim Arry() as String
		  
		  If Key = "" Then
		    
		    For i as Integer = 0 to JSON.Count - 1
		      Arry.Append JSON.Value(i)
		    Next
		    
		  Else
		    
		    For i as Integer = 0 to JSON.Count - 1
		      Arry.Append JSON.Child(i).Value(Key)
		    Next
		    
		  End If
		  
		  Return Arry
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MassClean(LstBox as Listbox, Mode as String)
		  If LstBox = Nil Then Return
		  CommonCore.MassSearch = True
		  
		  
		  For i as Integer = 0 to LstBox.ListCount - 1
		    wndClean.pgCleaned.Maximum = LstBox.ListCount
		    wndClean.pgCleaned.Value  = i + 1
		    
		    Dim FolderParent as FolderItem = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    Dim IMDBID       as String     = LstBox.Cell( i, 2 )
		    
		    If FolderParent <> Nil And FolderParent.Exists Then
		      wndClean.lblDebug.Text = LstBox.Cell( i, 0 )
		      SingleCleaner( FolderParent, IMDBID, Mode )
		      If ActiveSection = 1 Then wndMain.lstTVShows.UpdateRow i, Nil, True
		    End If
		    
		  Next
		  
		  // Update movie list.
		  If ActiveSection = 0 Then
		    Dim Path as String = wndMain.lstMovies.Cell( wndMain.lstMovies.ListIndex, 1 )
		    Dim Lindex as Integer = 0
		    
		    wndClean.pgCleaned.Value = 0
		    
		    wndMain.ccSearchBoxMovies.srchField.StringValue = ""
		    For i as Integer = 0 to wndMain.lstMovies.ListCount -1
		      wndClean.pgCleaned.Value = wndClean.pgCleaned.Value + 1
		      wndClean.lblDebug.Text = Loc.kUpdating + " " + wndMain.lstMovies.Cell( i, 0 )
		      
		      wndMain.lstMovies.UpdateRow i
		      If Path = wndMain.lstMovies.Cell( i, 1 ) Then Lindex = i
		    Next
		    
		    wndMain.lstMovies.ListIndex = Lindex
		  End If
		  
		  CommonCore.MassSearch = False
		  
		  If ActiveSection = 0 And wndMain.ccSearchBoxMovies.srchField.StringValue = "" Then
		    wndMain.lstMovies.SortList()
		    wndMain.lstSearch.CopyFrom( wndMain.lstMovies )
		  ElseIf ActiveSection = 1 And wndMain.ccSearchBoxTVShows.srchField.StringValue = "" THen
		    wndMain.lstTVShows.SortList()
		    wndMain.lstSearch.CopyFrom( wndMain.lstTVShadow )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MassMovies2Folders(LstBox as Listbox, Reload as Boolean = True)
		  
		  Dim Dict as Dictionary
		  If LstBox.Name = "lstMovies" Then
		    Dict = Preferences.Prefs.dictionaryForKey("MoviePaths")
		  ElseIf LstBox.Name = "lstTVShows" Then
		    Dict = Preferences.Prefs.dictionaryForKey("TVShowPaths")
		  ElseIf LstBox.Name = "lstAnime" Then
		    Dict = Preferences.Prefs.dictionaryForKey("AnimePaths")
		  Else
		    Return
		  End If
		  
		  If Dict = Nil Or Dict.Count = 0 Then Return
		  
		  Dim Roots() as FolderItem
		  For Each Key as Variant in Dict.Keys
		    If Key = Nil Then Continue
		    
		    If Key.StringValue.InStr( 0, ":" ) > 0 Then
		      Roots.Append GetFolderItem( Key )
		    Else
		      Roots.Append GetFolderItem( Key, FolderItem.PathTypeShell )
		    End If
		  Next
		  If Roots = Nil OR Roots.Ubound < 0 Then Return
		  
		  
		  Dim MovieFiles(), ExtraFiles() as FolderItem
		  For i as Integer = 0 to Roots.Ubound
		    
		    // Make sure the root item exists
		    If Roots(i) = Nil Or NOT Roots(i).Exists Then Continue
		    
		    
		    For n as Integer = 1 to Roots(i).Count
		      Dim TheFile as FolderItem = Roots(i).Item(n)
		      
		      
		      // Make sure the item exists and isn't a folder and isn't an image or icky file.
		      If TheFile = Nil OR NOT TheFile.Exists Then Continue
		      If TheFile.Directory OR NOT TheFile.Visible OR TheFile.Name.Left(1) = "." Then Continue
		      
		      // Append movie or extra files
		      If TheFile.Type = "video/any" And NOT TheFile.Name.Lowercase.Contains( "trailer" + "." + TheFile.NameExtension ) Then
		        MovieFiles.Append TheFile
		      Else
		        ExtraFiles.Append TheFile
		      End If
		      
		    Next
		    
		  Next
		  
		  If MovieFiles = Nil OR MovieFiles.Ubound < 0 Then Return
		  
		  // Move files to their destination.
		  If MovieFiles <> Nil Then
		    For i as Integer = 0 to MovieFiles.Ubound
		      
		      Try
		        If MovieFiles(i) = Nil And NOT MovieFiles(i).Exists Then Continue
		        
		        Dim FolderName as String = MovieFiles(i).NameNoExtension
		        FolderName = FindMovieName( MovieFiles(i), True, False )
		        
		        FolderName = RegExThis( FolderName, "cd[0-9]" )
		        FolderName = RegExThis( FolderName, "part[0-9]" )
		        FolderName = RegExThis( FolderName, "disc[0-9]" )
		        FolderName = RegExThis( FolderName, "\([0-9]\)" )
		        
		        FolderName = Trim( FolderName.ReplaceAll( ".", " " ) )
		        FolderName = Trim( FolderName.ReplaceAll( "_", " " ) )
		        FolderName = Trim( FolderName.ReplaceAll( "-", " " ) )
		        If FolderName = "" Then FolderName = MovieFiles(i).NameNoExtension
		        If FolderName = "" Then Continue
		        
		        // Create movie folder.
		        Dim Destination as FolderItem = MovieFiles(i).Parent
		        Destination = Destination.Child( FolderName )
		        
		        // Move files to destination
		        If Destination <> Nil And NOT Destination.Parent.Locked And Destination.Parent.IsWriteable Then
		          If NOT Destination.Exists Then Destination.CreateAsFolder
		          If Destination.Child( MovieFiles(i).Name ).Exists Then Continue // Don't overwrite existing stuff
		          MovieFiles(i).MoveFileTo Destination
		          
		          // Move extra files to destination
		          If ExtraFiles <> Nil And ExtraFiles.Ubound > -1 Then
		            For n as Integer = 0 to ExtraFiles.Ubound
		              
		              If ExtraFiles(n) = Nil OR NOT ExtraFiles(n).Exists Then Continue
		              
		              // Extra File Name
		              Dim ExtraName as String = ExtraFiles(n).Name
		              ExtraName = ExtraName.Lowercase
		              
		              // Current Movie File Name
		              Dim CurrentName as String = MovieFiles(i).NameNoExtension
		              CurrentName = CurrentName.Lowercase
		              
		              // Move Extra File
		              If ExtraName.InStr( 0, CurrentName ) > 0 Then ExtraFiles(n).MoveFileTo Destination
		              
		              
		            Next // @END ExtraFiles.Ubound
		            
		          End If
		          
		        End If // @END Destination <> Nil
		        
		      Catch err as NilObjectException
		        Log( "Failed to folderize movie files" )
		        Continue
		      End Try
		      
		    Next
		  End If
		  
		  If Reload Then CommonCore.ReloadList
		  
		  Exception err as NilObjectException
		    Log "MassMovies2Folders( " + LstBox.Name + ", " + Str( Reload ) + " ) = NilObjectException"
		    Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MediaInfo(VideoFile as FolderItem, Full as Boolean = False, Type as String = "XML") As String
		  // Download latest version:
		  // http://mediainfo.sourceforge.net/en/Download/Mac_OS
		  
		  #If TargetMacOS then
		    Dim MediaInfo As FolderItem = app.ExecutableFile.Parent.Parent.Child("Resources").Child("mediainfo")
		    If MediaInfo <> Nil and MediaInfo.Exists and _
		      VideoFile <> Nil And VideoFile.Exists then
		      'Dim i as integer = Ticks
		      Dim sh As New Shell
		      If Full then
		        sh.Execute( MediaInfo.ShellPath + " --output=" + Type + " --Full " + VideoFile.ShellPath )
		      Else
		        sh.Execute( MediaInfo.ShellPath + " --output=" + Type + " " + VideoFile.ShellPath )
		      End If
		      if App.DebugMode then
		        
		      end if
		      Return sh.Result
		    End If
		  #EndIf
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MessageBox(Message as String)
		  
		  'If TargetCocoa Then
		  msgMessage = ""
		  msgMessage = Message
		  
		  wndMessage.ShowModal
		  'Else
		  'MsgBox Message
		  '
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Minutes2Hours(Extends TotalMinutes as Double) As String
		  Dim Hours   as Integer = Floor( TotalMinutes / 60 )
		  Dim Minutes as Integer =        TotalMinutes - ( Hours * 60 )
		  
		  Dim strRuntime as String
		  
		  If TotalMinutes >= 60 and TotalMinutes < 120 then
		    strRuntime = str( Hours ) + Loc.kHourAnd  + str( Minutes ) + Loc.kMinutes
		  ElseIf TotalMinutes >= 120 then
		    strRuntime = str( Hours ) + Loc.kHoursAnd + str( Minutes ) + Loc.kMinutes
		  Else
		    strRuntime = str( TotalMinutes ) + Loc.kMinutes
		  End If
		  
		  Return strRuntime
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Month2Int(Month as String) As String
		  Select case Month
		    
		  case "Jan"
		    Return "01"
		  case "Feb"
		    Return "02"
		  case "Mar"
		    Return "03"
		  case "Apr"
		    Return "04"
		  case "May"
		    Return "05"
		  case "Jun"
		    Return "06"
		  case "Jul"
		    Return "07"
		  case "Aug"
		    Return "08"
		  case "Sep"
		    Return "09"
		  case "Okt"
		    Return "10"
		  Case "Oct"
		    Return "10"
		  case "Nov"
		    Return "11"
		  case "Dec"
		    Return "12"
		    
		  case "January"
		    Return "01"
		  case "February"
		    Return "02"
		  case "March"
		    Return "03"
		  case "April"
		    Return "04"
		  case "May"
		    Return "05"
		  case "June"
		    Return "06"
		  case "July"
		    Return "07"
		  case "August"
		    Return "08"
		  Case "September"
		    Return "09"
		  Case "October"
		    Return "10"
		  Case "November"
		    Return "11"
		  Case "December"
		    Return "12"
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MPAA2Logo(MPAA As String) As Picture
		  // American English
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage")
		  
		  If Lang = "en" Then
		    select case MPAA
		      
		    case "Rated G"
		      Return Rating_G
		    case "Rated PG"
		      If NOT StrComp(Lang, "en-gb", 1) = 0 Then Return Rating_PG
		    case "Rated PG-13"
		      Return Rating_PG13
		    case "Rated NC-17"
		      Return Rating_NC17
		    case "Rated R"
		      Return Rating_R
		      
		    case "G"
		      Return Rating_G
		    case "PG"
		      Return Rating_PG
		    case "PG-13"
		      Return Rating_PG13
		    case "NC-17"
		      Return Rating_NC17
		    case "R"
		      Return Rating_R
		      
		    end select
		    
		  End If
		  
		  If Lang = "en-gb" OR Lang = "gb" Then
		    // UK English
		    Select case MPAA
		      
		    case "Rated Uc"
		      Return Rating_UKUc
		    case "Rated U"
		      Return Rating_UKU
		    case "Rated PG"
		      Return Rating_UKPG
		    case "Rated 12A"
		      Return Rating_UK12A
		    case "Rated 12"
		      Return Rating_UK12
		    case "Rated 15"
		      Return Rating_UK15
		    case "Rated 18"
		      Return Rating_UK18
		    case "Rated R18"
		      Return Rating_UKR18
		      
		    case "Uc"
		      Return Rating_UKUc
		    case "U"
		      Return Rating_UKU
		    case "PG"
		      Return Rating_UKPG
		    case "12A"
		      Return Rating_UK12A
		    case "12"
		      Return Rating_UK12
		    case "15"
		      Return Rating_UK15
		    case "18"
		      Return Rating_UK18
		    case "R18"
		      Return Rating_UKR18
		      
		    End Select
		    
		  End If
		  
		  If Lang = "nl" Then
		    // Dutch
		    Select case MPAA
		      
		    case "Kijkwijzer: AL"
		      Return Rating_NLAL
		    case "Kijkwijzer: 6"
		      Return Rating_NL6
		    case "Kijkwijzer: 9"
		      Return Rating_NL9
		    case "Kijkwijzer: 12"
		      Return Rating_NL12
		    case "Kijkwijzer: 16"
		      Return Rating_NL16
		      
		    case "AL"
		      Return Rating_NLAL
		    case "6"
		      Return Rating_NL6
		    case "9"
		      Return Rating_NL9
		    case "12"
		      Return Rating_NL12
		    case "16"
		      Return Rating_NL16
		      
		    case "AL"
		      Return Rating_NLAL
		    case "MG6"
		      Return Rating_NL6
		    case "9"
		      Return Rating_NL9
		    case "12"
		      Return Rating_NL12
		    case "16"
		      Return Rating_NL16
		      
		    End Select
		    
		  End If
		  
		  If Lang = "de" Then
		    // German
		    Select case MPAA
		      
		    case "FSK 0"
		      Return Rating_FSK0
		    case "FSK 6"
		      Return Rating_FSK6
		    case "FSK 12"
		      Return Rating_FSK12
		    case "FSK 16"
		      Return Rating_FSK16
		    case "FSK 18"
		      Return Rating_FSK18
		      
		    case "0"
		      Return Rating_FSK0
		    case "6"
		      Return Rating_FSK6
		    case "12"
		      Return Rating_FSK12
		    case "16"
		      Return Rating_FSK16
		    case "18"
		      Return Rating_FSK18
		      
		    End Select
		    
		  End If
		  
		  If Lang = "fr" Then
		    // French
		    Select case MPAA
		      
		    Case "Classement: U"
		      Return Rating_FRU
		    Case "Classement: 10"
		      Return Rating_FR10
		    Case "Classement: 12"
		      Return Rating_FR12
		    Case "Classement: 16"
		      Return Rating_FR16
		    Case "Classement: 18"
		      Return Rating_FR18
		      
		    Case "U"
		      Return Rating_FRU
		    Case "10"
		      Return Rating_FR10
		    Case "12"
		      Return Rating_FR12
		    Case "16"
		      Return Rating_FR16
		    Case "18"
		      Return Rating_FR18
		      
		    End Select
		    
		  End If
		  
		  
		  If Lang = "fi" Then
		    // Finland
		    Select case MPAA
		      
		    Case "Nimellisteho: S"
		      Return Rating_FIS
		    Case "Nimellisteho: K-7"
		      Return Rating_FIK7
		    Case "Nimellisteho: K-11"
		      Return Rating_FIK11
		    Case "Nimellisteho: K-12"
		      Return Rating_FIK12
		    Case "Nimellisteho: K-16"
		      Return Rating_FIK16
		    Case "Nimellisteho: K-18"
		      Return Rating_FIK18
		    Case "Nimellisteho: K-E"
		      Return Rating_FIKE
		      
		    Case "S"
		      Return Rating_FIS
		    Case "K-7"
		      Return Rating_FIK7
		    Case "K-11"
		      Return Rating_FIK11
		    Case "K-12"
		      Return Rating_FIK12
		    Case "K-16"
		      Return Rating_FIK16
		    Case "K-18"
		      Return Rating_FIK18
		    Case "K-E"
		      Return Rating_FIKE
		      
		    End Select
		    
		  End If
		  
		  
		  Select Case MPAA
		    
		    // TV
		  case "TV-G"
		    Return Rating_TVG
		  case "TV-PG"
		    Return Rating_TVPG
		  case "TV-14"
		    Return Rating_TV14
		  case "TV-MA"
		    Return Rating_TVMA
		    
		  case "TV-Y7"
		    Return Rating_TVY7
		  case "TV-Y"
		    Return Rating_TVY
		  case "TV-Y7FV"
		    Return Rating_TVY7FV
		    
		    // General Movie
		  case "Rated G"
		    Return Rating_G
		  case "Rated PG"
		    Return Rating_PG
		  case "Rated PG-13"
		    Return Rating_PG13
		  case "Rated NC-17"
		    Return Rating_NC17
		  case "Rated R"
		    Return Rating_R
		    
		  Case "U"
		    Return Rating_U
		  case "G"
		    Return Rating_G
		  case "PG"
		    Return Rating_PG
		  case "PG-12"
		    Return Rating_PG12
		  case "PG-13"
		    Return Rating_PG13
		  case "NC-17"
		    Return Rating_NC17
		  case "R"
		    Return Rating_R
		    
		  Case "10"
		    Return Rating_10
		  Case "11"
		    Return Rating_11
		  Case "12"
		    Return Rating_12
		  Case "13"
		    Return Rating_13
		  Case "14"
		    Return Rating_14
		  Case "15"
		    Return Rating_15
		  Case "16"
		    Return Rating_16
		  Case "17"
		    Return Rating_17
		  Case "18"
		    Return Rating_18
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MPAA2Ratings(MPAA as String) As String
		  select case MPAA
		    
		  case "Rated G"
		    Return "General Audiences. All ages admitted"
		    
		  case "Rated PG"
		    Return "Parental Guidance Suggested. Some material may not be suitable for children"
		    
		  case "Rated PG-13"
		    Return "Parents Strongly Cautioned. Some material may not be appropriate for children under 13"
		    
		  case "Rated R"
		    Return "Restricted. Under 17 requires accompanying parent or adult guardian"
		    
		  case "Rated NC-17"
		    Return "No One 17 and under admitted"
		    
		  case "NR"
		    Return "Unrated"
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MPAA2Themes(MPAA as String) As Picture()
		  Dim Pic() as Picture
		  
		  If ( MPAA.InStr(0, "language") > 0 And MPAA.InStr(0, "mild language") = 0 ) Or MPAA.InStr(0, "reference") > 0 OR MPAA.InStr(0, "rude") > 0 Then Pic.Append kw_language
		  
		  If MPAA.InStr(0, "drug") > 0 Then Pic.Append kw_drugs
		  
		  If MPAA.InStr(0, "discrimination") > 0 Then Pic.Append kw_discrimination
		  
		  If MPAA.InStr(0, "sex") > 0 OR MPAA.InStr(0, "nudity") > 0 OR MPAA.InStr(0, "nude") > 0 OR ( MPAA.InStr(0, "sensuality") > 0 And MPAA.InStr(0, "mild sensuality") = 0 ) Then Pic.Append kw_sex
		  
		  If MPAA.InStr(0, "scary") > 0 OR ( MPAA.InStr(0, "blood") > 0 And MPAA.InStr(0, "bloody violence") = 0 ) OR MPAA.InStr(0, "fear") > 0 OR MPAA.InStr(0, "gore") > 0 OR MPAA.InStr(0, "horror") > 0 OR MPAA.InStr(0, "terror") > 0 OR MPAA.InStr(0, "frightening") > 0 OR MPAA.InStr(0, "disturbing") > 0 Then Pic.Append kw_fear
		  
		  If MPAA.InStr(0, "violence") > 0 OR MPAA.InStr(0, "violent") > 0 OR MPAA.InStr(0, "geweld") > 0 OR MPAA.InStr(0, "battle") > 0 Then Pic.Append kw_violence
		  
		  'If NOT Preferences.Prefs.boolForKey("DarkUI") Then
		  Return Pic
		  'Else
		  'Dim InvertedPic() as Picture
		  'For i as Integer = 0 to Pic.Ubound
		  'InvertedPic.Append ImagePlayEffectsLibrary.Invert( Pic(i) ) 'InvertMBS
		  'InvertedPic(i).Mask = Pic(i).Mask
		  'Next
		  '
		  'Return InvertedPic()
		  'End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MPAAFromCountry(MPAA as String, ISO as String) As String
		  If MPAA = "" Then Return ""
		  
		  Dim RatStr as String
		  
		  Select Case ISO.Lowercase
		    
		  Case "us"
		    RatStr = "Rated"
		    
		  Case "en"
		    RatStr = "Rated"
		    
		  Case "en-gb"
		    RatStr = "Rated"
		    
		  Case "nl"
		    RatStr = "Kijkwijzer:"
		    
		  Case "de"
		    'RatStr = "FSK"
		    RatStr = ""
		    
		  Case "fr"
		    RatStr = "Nominale:"
		    
		  Case "fi"
		    RatStr = "Luokitus:"
		    
		  Case "da"
		    RatStr = "Klassificering:"
		    
		  Case "es"
		    RatStr = "Clasificación:"
		    
		    // TODO: MPAAFromCountry - Add More Languages support.
		  End Select
		  
		  'If RatStr = "" Then RatStr = "Rated"
		  
		  Return  Trim( RatStr + " " + MPAA )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopUpWebMenu(IMDbID as String, DBID as String, Title as String, TitleOriginal as String, ReleaseDate as String, HomePageURL as String)
		  
		  Dim base as New MenuItem
		  Dim SearchTitle as String = Title
		  If Preferences.Prefs.stringForKey("DBLanguage").InStr(0, "en") = 0 Then SearchTitle = TitleOriginal
		  
		  If HomePageURL <> "" Then
		    base.Append New MenuItem("Homepage", HomePageURL)
		    base.Append New MenuItem("-")
		  End If
		  
		  Dim Pic as New Picture( 16, 16, 32 )
		  
		  // Information
		  If IMDbID.Left(2)     = "tt" Then base.Append new MenuItem( "IMDb", "IMDb" )
		  If base.Child("IMDb") <> Nil Then base.Child("IMDb").Icon = ScaleImage( icoimdb, 16, 16 )
		  If DBID <> "" And ( ActiveSection = 0 OR DBID.InStr( 0, "TMDB") > 0 ) Then base.Append new MenuItem( "TMDB", "TMDB" )
		  If base.Child("TMDB") <> Nil Then base.Child("TMDB").Icon = ScaleImage( icotmdb, 16, 16 )
		  
		  If DBID <> "" And ActiveSection = 1 And DBID.InStr( 0, "TMDB" ) = 0 Then base.Append new MenuItem( "TVDB", "TVDB" )
		  If base.Child("TVDB") <> Nil Then base.Child("TVDB").Icon = ScaleImage( icotvdb, 16, 16 )
		  
		  If SearchTitle        <> ""   Then
		    If ActiveSection = 0 Then base.Append new MenuItem( "RottenTomatoes", "RT" )
		    base.Append new MenuItem( "Wikipedia", "wiki")
		    If ActiveSection = 0 Then base.Append new MenuItem( "YouTube",   "YouTube" )
		    If ActiveSection = 0 Then base.Append new MenuItem( "NetFlix",   "NetFlix" )
		    
		    If base.Child("RottenTomatoes") <> Nil Then base.Child("RottenTomatoes").Icon = ScaleImage( icorottentomatoes, 16, 16 )
		    If base.Child("Wikipedia")      <> Nil Then base.Child("Wikipedia").Icon      = ScaleImage( icowikipedia, 16, 16 )
		    If base.Child("YouTube")        <> Nil Then base.Child("YouTube").Icon        = ScaleImage( icoyoutube, 16, 16 )
		    If base.Child("NetFlix")        <> Nil Then base.Child("NetFlix").Icon        = ScaleImage( iconetflix, 16, 16 )
		  End If
		  
		  // Torrentz
		  If Keyboard.AsyncAltKey And SearchTitle <> "" Then
		    base.Append New MenuItem("-")
		    
		    base.Append new MenuItem( "The PirateBay",   "TPB Download" )
		    base.Append new MenuItem( "Torrentz",        "Torrentz Download" )
		    base.Append new MenuItem( "KickAssTorrents", "KAT Download" )
		    base.Append new MenuItem( "movies.io",       "movies.io" )
		    base.Append new MenuItem( "YIFY Torrents",   "YIFY" )
		    
		    If base.Child("The PirateBay")   <> Nil Then base.Child("The PirateBay").Icon   = ScaleImage( icotpb, 16, 16 )
		    If base.Child("Torrentz")        <> Nil Then base.Child("Torrentz").Icon        = ScaleImage( icotorrentz, 16, 16 )
		    If base.Child("KickAssTorrents") <> Nil Then base.Child("KickAssTorrents").Icon = ScaleImage( icokat, 16, 16 )
		    If base.Child("movies.io")       <> Nil Then base.Child("movies.io").Icon       = ScaleImage( icomoviesio, 16, 16 )
		    If base.Child("YIFY Torrents")   <> Nil Then base.Child("YIFY Torrents").Icon   = ScaleImage( icoyify, 16, 16 )
		  End If
		  
		  // Buy Legally
		  If SearchTitle <> "" Then
		    base.Append New MenuItem("-")
		    
		    base.Append new MenuItem("Amazon.com", "Amazon.com")
		    base.Append new MenuItem("Amazon.co.uk", "Amazon.co.uk")
		    base.Append new MenuItem("eBay", "eBay")
		    
		    If base.Child("Amazon.com") <> Nil Then base.Child("Amazon.com").Icon = ScaleImage( icoamazon, 16, 16 )
		    If base.Child("Amazon.co.uk") <> Nil Then base.Child("Amazon.co.uk").Icon = ScaleImage( icoamazon, 16, 16 )
		    If base.Child("eBay") <> Nil Then base.Child("eBay").Icon = ScaleImage( icoebay, 16, 16 )
		  End If
		  
		  Dim hitItem as MenuItem = base.PopUp
		  If hitItem = Nil Then Return
		  
		  If hitItem.Tag.StringValue.InStr(0, "Download") > 0 Then SearchTitle = SearchTitle.ReplaceAll("'","").ReplaceAll("& ","").ReplaceAll(":","")
		  
		  Dim SearchWithYear as String
		  If Val( ReleaseDate.Left(4)  ) > 1000 Then SearchWithYear = SearchTitle + " " + ReleaseDate.Left(4)
		  If Val( ReleaseDate.Right(4) ) > 1000 Then SearchWithYear = SearchTitle + " " + ReleaseDate.Right(4)
		  If Trim( SearchWithYear ) = "" Then SearchWithYear = SearchTitle
		  
		  DBID = Trim( DBID.ReplaceAll("TMDB", "") )
		  
		  If hitItem.text = "Homepage" Then ShowURL hititem.tag
		  
		  Select Case hitItem.Tag
		    
		  Case "IMDb"
		    ShowURL "http://www.imdb.com/title/" + Trim( IMDbID.ReplaceAll("TMDB", "") )
		  case "TMDB"
		    ShowURL "http://www.themoviedb.org/movie/" + DBID
		  case "TVDB"
		    ShowURL "http://thetvdb.com/?tab=series&id=" + DBID
		  case "RT"
		    ShowURL "http://www.rottentomatoes.com/search/?search=" + EncodeURLComponent( SearchTitle )
		  case "wiki"
		    ShowURL "http://en.wikipedia.org/wiki/Special:Search?search=" + EncodeURLComponent( SearchTitle )
		  case "YouTube"
		    ShowURL "http://www.youtube.com/results?search_query=" + EncodeURLComponent( SearchWithYear + " Trailer" )
		  case "NetFlix"
		    ShowURL "http://www.netflix.com/Search?v1=" + EncodeURLComponent( SearchTitle )
		    
		  case "TPB Download"
		    ShowURL "http://pirateproxy.net/search/" + EncodeURLComponent( SearchWithYear ) + "/0/99/0"
		  case "Torrentz Download"
		    ShowURL "http://torrentz.eu/search?q=" + EncodeURLComponent( SearchWithYear )
		  case "KAT Download"
		    ShowURL "http://kickass.to/usearch/" + EncodeURLComponent( SearchWithYear ) + "/"
		  case "YIFY"
		    ShowURL "http://yify-torrents.com/browse-movie/" + EncodeURLComponent( SearchTitle ) + "/All/All/0/latest"
		  case "movies.io"
		    ShowURL "http://movies.io/m/search?utf8=✓&q=" + SearchTitle
		    
		    
		  case "Amazon.com"
		    ShowURL "http://www.amazon.com/s/vime03-20/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=" + EncodeURLComponent( SearchWithYear ) + "&x=0&y=0"
		  case "Amazon.co.uk"
		    ShowURL "http://www.amazon.co.uk/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=" + EncodeURLComponent( SearchWithYear ) + "&x=0&y=0"
		  case "eBay"
		    ShowURL "http://shop.ebay.com/?_from=R40&_trksid=p5197.m570.l1313&_nkw=" + EncodeURLComponent( SearchWithYear ) + "&_sacat=See-All-Categories"
		    
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrettyDate(BoringDate as String, Longdate as Boolean = False) As String
		  
		  Dim DDate() as String = split( BoringDate, "-" )
		  Select Case DDate.Ubound
		    
		  case 2
		    Return Str( Val( DDate(2) ) ) + " " + Int2Month( Val( DDate(1) ), Longdate ) + ", " + DDate(0)
		    
		  case 1
		    Return Int2Month( Val( DDate(1) ), Longdate ) + ", " + DDate(0)
		    
		  case 0
		    Return DDate(0)
		    
		  Else
		    Return ""
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrettyTime(Duration as Integer, Full as Boolean = False) As String
		  If Duration <= 0 Then Return ""
		  
		  
		  Dim h as Integer = Floor( Duration / 60 )
		  Dim m as Integer = Duration - ( h * 60 )
		  
		  Dim hDenom as String = Loc.kHoursAnd
		  If NOT Full Then hDenom = Trim( Loc.kHourAnd ).Left(1).Lowercase + " "
		  
		  Dim mDenom as String = Loc.kMinutes
		  If NOT Full Then mDenom = Trim( Loc.kMinutes ).Left(1).Lowercase
		  
		  Dim Hours, Minutes as String = ""
		  If h > 0 Then Hours   = Str(h) + hDenom
		  If (h > 0 And m > -1) OR m > 0 Then Minutes = Str(m) + mDenom
		  
		  Return Hours + Minutes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PriorArtDelete(FolderParent as FolderItem)
		  Dim Poster, Fanart, Banner, Disc, ClearArt, CharacterArt, Logo, TVThumb, ExtraFanart, ExtraThumbs as FolderItem
		  
		  // Find & Delete!
		  Poster = FindImagePoster( FolderParent )
		  Fanart = FindImageFanart( FolderParent )
		  Banner = FindImageBanner( FolderParent )
		  
		  If Poster <> Nil Then
		    If Poster.IsNetworkVolume Then Poster.Delete Else Poster = Poster.MoveToTrash()
		  End If
		  
		  If Fanart <> Nil Then
		    If Fanart.IsNetworkVolume Then Fanart.Delete Else Fanart = Fanart.MoveToTrash()
		  End If
		  If Banner <> Nil Then
		    If Banner.IsNetworkVolume Then Banner.Delete Else Banner.MoveToTrash()
		  End If
		  
		  If FolderParent.IsNetworkVolume Then
		    FolderParent.Child("extrathumbs").Delete
		    FolderParent.Child("extrafanart").Delete
		    
		    FolderParent.Child( "disc.png" ).Delete
		    FolderParent.Child( "clearart.png" ).Delete
		    FolderParent.Child( "character.png" ).Delete
		    FolderParent.Child( "logo.png" ).Delete
		    FolderParent.Child( "landscape.jpg" ).Delete
		  Else
		    If FolderParent.Child("extrathumbs").IsWriteable And NOT FolderParent.Child("extrathumbs").Locked Then FolderParent.Child("extrathumbs").MoveToTrash()
		    If FolderParent.Child("extrafanart").IsWriteable And NOT FolderParent.Child("extrafanart").Locked Then FolderParent.Child("extrafanart").MoveToTrash()
		    
		    If FolderParent.Child("disc.png").IsWriteable And NOT FolderParent.Child("disc.png").Locked Then FolderParent.Child( "disc.png" ).MoveToTrash()
		    If FolderParent.Child("clearart.png").IsWriteable And NOT FolderParent.Child("clearart.png").Locked Then FolderParent.Child( "clearart.png" ).MoveToTrash()
		    If FolderParent.Child("character.png").IsWriteable And NOT FolderParent.Child("character.png").Locked Then FolderParent.Child( "character.png" ).MoveToTrash()
		    If FolderParent.Child("logo.png").IsWriteable And NOT FolderParent.Child("logo.png").Locked Then FolderParent.Child( "logo.png" ).MoveToTrash()
		    If FolderParent.Child("landscape.jpg").IsWriteable And NOT FolderParent.Child("landscape.jpg").Locked Then FolderParent.Child( "landscape.jpg" ).MoveToTrash()
		  End If
		  
		  
		  // Cache
		  Dim ID as String
		  Select Case ActiveSection
		    
		  Case 0
		    ID = MovieAttr.ID_IMDB
		    
		  Case 1
		    ID = TVAttr.ID_IMDB
		    
		  Case 2
		    // Case wndMain.lstAnime
		    
		  End Select
		  
		  CacheImageDelete( ID )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PriorArtFound(FolderParent as FolderItem) As Boolean
		  If FolderParent = Nil OR NOT FolderParent.Exists Then Return False
		  
		  Dim Poster, Fanart, Banner, Disc, ClearArt, CharacterArt, Logo, TVThumb, ExtraFanart, ExtraThumbs as Boolean
		  
		  Poster = FindImagePoster( FolderParent ) IsA FolderItem
		  Fanart = FindImageFanart( FolderParent ) IsA FolderItem
		  Banner = FindImageBanner( FolderParent ) IsA FolderItem
		  
		  ExtraFanart  = FolderParent.Child("extrafanart").Exists
		  ExtraThumbs  = FolderParent.Child("extrathumbs").Exists
		  
		  Disc         = FolderParent.Child( "disc.png" ).Exists
		  ClearArt     = FolderParent.Child( "clearart.png" ).Exists
		  CharacterArt = FolderParent.Child( "character.png" ).Exists
		  Logo         = FolderParent.Child( "logo.png" ).Exists
		  TVThumb      = FolderParent.Child( "landscape.jpg" ).Exists
		  
		  If Poster or Fanart or Banner or Disc or ClearArt or CharacterArt or Logo or TVThumb then
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RegExEpisode(Episode as FolderItem) As String
		  If Episode = Nil OR NOT Episode.Exists Then Return ""
		  
		  Dim Source as String = Episode.NameNoExtension'.ReplaceAll( ".", " " )
		  Source = Source.Lowercase
		  'Source = Source.ReplaceAll( TVAttr.Title.Lowercase, "" ).ReplaceAll( TVAttr.TitleSort.Lowercase, "" ).ReplaceAll( TVAttr.TitleOriginal.Lowercase, "" )
		  Source = Trim( Source )
		  
		  // Cleanup
		  If Source.InStr( 0, "480p" ) > 0 Then Source = Source.Left( Source.InStr( 0, "480p" ) - 1 )
		  If Source.InStr( 0, "720p" ) > 0 Then Source = Source.Left( Source.InStr( 0, "720p" ) - 1 )
		  If Source.InStr( 0, "1080p" ) > 0 Then Source = Source.Left( Source.InStr( 0, "1080p" ) - 1 )
		  If Source.InStr( 0, "1080p" ) > 0 Then Source = Source.Left( Source.InStr( 0, "2160" ) - 1 )
		  If Source.InStr( 0, "1080p" ) > 0 Then Source = Source.Left( Source.InStr( 0, "2880p" ) - 1 )
		  If Source.InStr( 0, "1080p" ) > 0 Then Source = Source.Left( Source.InStr( 0, "4320p" ) - 1 )
		  
		  If Source.InStr( 0, "PDTV" ) > 0 Then Source = Source.Left( Source.InStr( 0, "PDTV" ) - 1 )
		  If Source.InStr( 0, "HDTV" ) > 0 Then Source = Source.Left( Source.InStr( 0, "HDTV" ) - 1 )
		  If Source.InStr( 0, "SDTV" ) > 0 Then Source = Source.Left( Source.InStr( 0, "SDTV" ) - 1 )
		  If Source.InStr( 0, "WEB-DL" ) > 0 Then Source = Source.Left( Source.InStr( 0, "WEB-DL" ) - 1 )
		  
		  
		  Dim SeasonNr, EpisodeNr, EpisodeNrs() as String
		  
		  // Anime
		  'If EpisodeNr = "" Then EpisodeNr = RegExResult( Source, "(?i)[/\\]season[^\w]?(\d{1,2})[^\d]*[/\\]\[.+?\].*?(?:-[\. _]*|ep[\. _]*)(\d{1,3})(?:v\d+)?[\. _]*(?:-.*?)?(?:[[({].+?[])}][\. _]*)+" )
		  'If EpisodeNr = "" Then EpisodeNr = RegExResult( Source, "(?i)[/\\]\[.+?\].*?(?:-[\. _]*|ep[\. _]*)(\d{1,3})(?:v\d+)?[\. _]*(?:-.*?)?(?:[[({].+?[])}][\. _]*)+" )
		  'If EpisodeNr = "" Then EpisodeNr = RegExResult( Source, "[\._ \-]([0-9]{2,3})[v\._ \-\[\(].*[\[\(][0-9A-F]{8}[\)\]][/\._ \-\[\(]" )
		  'If EpisodeNr = "" Then EpisodeNr = Trim( RegExResult( Source, "[\._ \-]([0-9]{2,3})[v/\._ \-\[\(].*[\[\(].*[0-9]{3,4}x[0-9]{3,4}.*[\)\]][/\._ \-\[]" ).NthField( "v", 1 ).ReplaceAll("_","") )
		  
		  // Needs a 'CRC' code.
		  If ActiveSection = 2 Then
		    If Source.InStr(0, "horriblesubs") > 0 Then Source = RegExThis( Source, "\[.*\]", "" ) + " [12345678]"
		    If EpisodeNr = "" Then EpisodeNr = Trim( RegExResult( Source, "(?i)()(?:[\. _-]|ep)(\d{1,3})[\. _-v].*[[({][\da-f]{8}[])}]" ).NthField( "v", 1 ).ReplaceAll("_","") )
		    
		    If EpisodeNr <> "" Then EpisodeNr = Trim( RegExThis( EpisodeNr, "\[.*\]", "" ) ) // Filter CRC code
		    If EpisodeNr <> "" Then EpisodeNr = Trim( RegExThis( EpisodeNr, "\(.*\)", "" ) ) // Filter flags
		    
		    If EpisodeNr <> "" And Episode.Parent.Name.InStr( 0, "Season" ) > 0 Then
		      SeasonNr = Trim( Episode.Parent.Name.ReplaceAll( "Season", "" ) )
		      Return SeasonNr + "x" + EpisodeNr
		    ElseIf EpisodeNr <> "" Then
		      Return "-1x" + EpisodeNr
		    End If
		  End If
		  
		  // S01E01
		  Dim SE as String  = match( "s[0-9]*e[0-9]*", Source )
		  If SE.Lowercase = "se" OR SE = "" Then se = match( "s[0-9][0-9]e[0-9][0-9]", Source )
		  If SE <> "" And SE.Lowercase.Left(2) <> "se" Then
		    Dim Result as String =       Source.Right( Source.Len - Source.instr( SE ) + 1 )
		    If Result.contains(" ") Then Result = Result.Left( Result.InStr( " " ) - 1 )
		    If Result.contains(".") Then Result = Result.Left( Result.InStr( "." ) - 1 )
		    If Result.contains("_") Then Result = Result.Left( Result.InStr( "_" ) - 1 )
		    
		    SeasonNr  = Result.NthField( "e", 1 ).ReplaceAll("s", "")
		    Dim Episodes() as String = Result.Split("e")
		    
		    For i as Integer = 1 to Episodes.Ubound
		      If EpisodeNr = "" Then EpisodeNr = Episodes(i) Else EpisodeNr = EpisodeNr + "x" + Episodes(i)
		    Next
		    
		    'Dim s as String
		    Return SeasonNr + "x" + EpisodeNr
		  End If
		  SE = ""
		  
		  
		  // 1x01
		  SE = match( "[0-9]*?x[0-9]*?", Source )
		  If SE <> "" Then
		    Dim Result as String =       Source.Right( Source.Len - Source.instr( SE ) + 1 )
		    If Result.contains(" ") Then Result = Result.Left( Result.InStr( " " ) - 1 )
		    If Result.contains(".") Then Result = Result.Left( Result.InStr( "." ) - 1 )
		    If Result.contains("_") Then Result = Result.Left( Result.InStr( "_" ) - 1 )
		    
		    Return Result
		  End If
		  SE = ""
		  
		  
		  // 1.01
		  SE = match( "[0-9]*?\.[0-9]*?", Source )
		  If SE <> "" Then
		    Dim Result as String =       Source.Right( Source.Len - Source.instr( SE ) + 1 )
		    If Result.contains(" ") Then Result = Result.Left( Result.InStr( " " ) - 1 )
		    'If Result.contains(".") Then Result = Result.Left( Result.InStr( "." ) - 1 )
		    If Result.contains("_") Then Result = Result.Left( Result.InStr( "_" ) - 1 )
		    
		    Return Result.ReplaceAll(".","x")
		  End If
		  SE = ""
		  
		  // 101
		  SE = match( "[0-9][0-9][0-9]", Source )
		  If SE <> "" Then
		    Dim Result as String =       Source.Right( Source.Len - Source.instr( SE ) + 1 )
		    If Result.contains(" ") Then Result = Result.Left( Result.InStr( " " ) - 1 )
		    If Result.contains(".") Then Result = Result.Left( Result.InStr( "." ) - 1 )
		    If Result.contains("_") Then Result = Result.Left( Result.InStr( "_" ) - 1 )
		    
		    SeasonNr = Result.Left(1)
		    EpisodeNr = Result.Right(2)
		    
		    Return SeasonNr + "x" + EpisodeNr
		  End If
		  SE = ""
		  
		  // Season 1 Episode 1
		  SE = match( "(s(eason[\W_]*)?(?<season>[0-9]+))([\W_]*(\.?(-|(e(pisode[\W_]*)?))[0-9]+)+)?", Source )
		  If SE <> "" Then
		    Dim Result as String
		    SeasonNr = Trim( SE.NthField("episode", 1).ReplaceAll("season","") )
		    EpisodeNr = Trim( SE.NthField("episode", 2).ReplaceAll("episode","") )
		    
		    Return SeasonNr + "x" + EpisodeNr
		  End If
		  
		  
		  Return ""
		  
		  // ------
		  
		  // S01E01
		  If EpisodeNr = "" Then
		    SeasonNr  = Trim( RegExResult( Source, "(s(eason[\W_]*)?(?<season>[0-9]+))" ).ReplaceAll("season","").ReplaceAll("s","") )
		    'EpisodeNr = Trim( RegExResult( Source, "(-|(e(pisode[\W_]*)?))(?<episode>[0-9]+)" ).ReplaceAll("episode","").ReplaceAll("e","x") )
		    EpisodeNrs = match_all( "(-|(e(pisode[\W_]*)?))(?<episode>[0-9]+)", Source, 0 )
		    For i as Integer = 0 to EpisodeNrs.Ubound
		      Dim e as String = Str( Val( Trim( EpisodeNrs(i).ReplaceAll("episode", "").ReplaceAll("e","").ReplaceAll(" ","") ) ) )
		      If "x" + e <> EpisodeNr And Val( e ) >= 0 Then EpisodeNr = EpisodeNr + "x" + e
		    Next
		    
		    If SeasonNr <> "" And EpisodeNr <> "" Then Return SeasonNr + EpisodeNr
		    EpisodeNr = ""
		    ReDim EpisodeNrs(-1)
		  End If
		  
		  // Give it a couple of tries.
		  
		  // 01x02
		  If EpisodeNr = "" Then
		    SeasonNr  = RegExResult( Source, "(([0-9]{4}-[0-9]{2}(-[0-9]{2})?)|([0-9]{2}-[0-9]{2}-[0-9]{4})|((?<season>[0-9]+)([x-][0-9]+)+))" ).NthField("x",1)
		    EpisodeNr = RegExResult( Source, "[x-](?<episode>[0-9]+)" ).ReplaceAll("x","")
		    If SeasonNr <> "" And EpisodeNr <> "" Then Return SeasonNr + "x" + EpisodeNr
		  End If
		  
		  SeasonNr = ""
		  EpisodeNr = ""
		  
		  // 01.02
		  If EpisodeNr = "" Then
		    SeasonNr  = RegExResult( Source, "(([0-9]{4}-[0-9]{2}(-[0-9]{2})?)|([0-9]{2}-[0-9]{2}-[0-9]{4})|((?<season>[0-9]+)([\.-][0-9]+)+))" ).NthField(".",1)
		    EpisodeNr = RegExResult( Source, "[\.-](?<episode>[0-9]+)" ).ReplaceAll(".","")
		    If SeasonNr <> "" And EpisodeNr <> "" Then Return SeasonNr + "x" + EpisodeNr
		  End If
		  
		  SeasonNr = ""
		  EpisodeNr = ""
		  
		  // 103
		  If EpisodeNr = "" Then
		    SeasonNr  = RegExResult( Source, "(([0-9]{4}-[0-9]{2}(-[0-9]{2})?)|([0-9]{2}-[0-9]{2}-[0-9]{4})|((?<season>[0-9]+)(-?[0-9]{2,})+(?![0-9])))" )
		    EpisodeNr = RegExResult( Source, "(\([0-9]{4}\))|((([0-9]+|-)(?<episode>[0-9]{2,})))" )
		  End If
		  
		  If SeasonNr.Len = 3 Then
		    EpisodeNr = SeasonNr.Right(2)
		    SeasonNr = SeasonNr.Left(1)
		  ElseIf EpisodeNr.Len = 3 Then
		    SeasonNr = EpisodeNr.Left(1)
		    EpisodeNr = EpisodeNr.Right(2)
		  End If
		  
		  'If SeasonNr  = "" Then SeasonNr  = RegExResult( Source, "" )
		  'If EpisodeNr = "" Then EpisodeNr = RegExResult( Source, "" )
		  
		  If SeasonNr = "" Then
		    If Episode.Parent.Name.InStr( 0, "Season" ) > 0 Then
		      SeasonNr = Trim( Episode.Parent.Name.ReplaceAll( "Season", "" ) )
		    ElseIf Episode.Parent.Name.InStr( 0, "Special" ) > 0 Then
		      SeasonNr = "00"
		    Else
		      SeasonNr = "-1"
		    End If
		  End If
		  
		  
		  If EpisodeNr <> "" Then Return SeasonNr + "x" + EpisodeNr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RenameEpisodes(ShowFolder as FolderItem)
		  
		  Dim EpisodeFiles() as FolderItem
		  EpisodeFiles = FindEpisodeFiles( ShowFolder )
		  
		  For each EpFile as FolderItem in EpisodeFiles
		    if EpFile = Nil OR not EpFile.Exists then Continue
		    
		    // Get the renaming pattern
		    Dim Pattern as String = Preferences.Prefs.stringForKey("RenameStringEpisodes")
		    If Trim( Pattern ) = "" then Return
		    
		    // Find Thumb file
		    Dim ThumbNailFile as FolderItem = EpFile.Parent.Child( EpFile.NameNoExtension + ".jpg" )
		    if ThumbNailFile = Nil OR NOT ThumbNailFile.Exists then ThumbNailFile = EpFile.Parent.Child( EpFile.NameNoExtension + "-thumb.jpg" )
		    if ThumbNailFile = Nil OR NOT ThumbNailFile.Exists then ThumbNailFile = EpFile.Parent.Child( EpFile.NameNoExtension + ".videoimage.jpg" )
		    
		    // Find NFO file
		    Dim NFOFile as FolderItem = EpFile.Parent.Child( EpFile.NameNoExtension + ".nfo" )
		    if NFOFile = Nil OR NOT NFOFile.Exists then Continue
		    
		    // Read NFO file
		    Dim NFO as String = ReadTextFile( NFOFile )
		    if NFO = "" OR NFO.Left(5) <> "<?xml" then Continue
		    
		    
		    Dim Episodes() as String = match_all( "\<episodedetails\>(.*?)\<\/episodedetails\>", NFO, 1 )
		    
		    if Episodes.Ubound > 0 then
		      dim s as string
		    end if
		    
		    Dim EpisodeNrs() as Integer
		    For each episode as string in Episodes
		      EpisodeNrs.Append val( episode.MyMid("<episode>", "</episode>") )
		    Next
		    
		    Dim Newname as String = Pattern
		    // Series name
		    Newname = Newname.ReplaceAll( "$N", TVAttr.Title )
		    
		    // Season number
		    Dim SeasonNr as Integer = Val( NFO.MyMid( "<season>", "</season>" ) )
		    Newname = Newname.ReplaceAll( "$S", Format( SeasonNr, "#0" ) )
		    Newname = Newname.ReplaceAll( "$0S", Format( SeasonNr, "#00" ) )
		    
		    // Episode number(s)
		    Dim PreEp as String
		    Dim i as Integer = Newname.InStr( "$E" )
		    if i <= 0 then i = Newname.InStr( "$0E" )
		    If i > 0 then
		      PreEp = Newname.Mid( i - 1, 1 )
		    End If
		    
		    Dim episodeString as String
		    Dim Formatting as String = "#0"
		    if Newname.InStr( "$0E" ) > 0 then Formatting = "#00"
		    
		    If EpisodeNrs.Ubound > 0 then
		      For each number as Integer in EpisodeNrs
		        if episodeString = "" then episodeString = Format( number, Formatting ) else episodeString = episodeString + PreEp + Format( number, Formatting )
		      Next
		    else
		      episodeString = Format( EpisodeNrs(0), Formatting )
		    End If
		    
		    Newname = Newname.ReplaceAll( "$E", episodeString )
		    Newname = Newname.ReplaceAll( "$0E", episodeString )
		    
		    //
		    Newname = Newname.ReplaceAll( "$T", ReplaceAll( NFO.MyMid( "<title>", "</title>" ), "&amp;", "&" ) )
		    Newname = Newname.ReplaceAll( "$#", NFO.MyMid( "<rating>", "</rating>" ) )
		    Newname = Newname.ReplaceAll( "$R", NFO.MyMid( "<height>", "</height>" ) + "p" )
		    
		    Dim DateString as String = NFO.MyMid( "<aired>", "</aired>" )
		    dim d as New Date
		    d.Year =  Val( DateString.Left(4) )
		    d.Month = Val( DateString.MyMid( "-", "-" ) )
		    d.Day =   Val( DateString.Right(2) )
		    
		    Newname = Newname.ReplaceAll( "$Y", Format( d.Year, "0000" ) )
		    Newname = Newname.ReplaceAll( "$M", Format( d.Month, "00" ) )
		    Newname = Newname.ReplaceAll( "$D", Format( d.Day, "00" ) )
		    
		    Newname = Newname.ReplaceAll( "$LD", d.LongDate )
		    Newname = Newname.ReplaceAll( "$SQL", d.SQLDate )
		    
		    If Pattern.InStr( "." ) > 0 then Newname = Newname.ReplaceAll( " ", "." )
		    Newname = CleanName( Newname )
		    Newname = Newname.ReplaceAll( "&amp;", "&" )
		    
		    Dim Destination as FolderItem = EpFile.Parent.Child( Newname + "." + EpFile.NameExtension )
		    If Newname <> "" and Destination <> Nil And NOT Destination.Exists then
		      
		      Dim ExtraFiles() as FolderItem
		      For n as Integer = 1 to EpFile.Parent.Count
		        dim item as FolderItem
		        item = EpFile.Parent.Item(n)
		        
		        if item = nil Or NOT item.Exists then Continue
		        'if item.AbsolutePath = ThumbNailFile.AbsolutePath then Continue
		        'if item.AbsolutePath = NFOFile.AbsolutePath then Continue
		        'if item.AbsolutePath = EpFile.AbsolutePath then Continue
		        
		        if item.NameNoExtension.Contains( EpFile.NameNoExtension ) then
		          ExtraFiles.Append item
		        end if
		      Next
		      
		      If ExtraFiles.Ubound > -1 then
		        for each item as FolderItem in ExtraFiles
		          if item = nil or NOT item.Exists then Continue
		          
		          dim oldname as string = item.Name.ReplaceAll( EpFile.NameNoExtension, "" )
		          item.MoveFileTo( Destination.Parent.Child( Newname + oldname ) )
		        next
		      End If
		      
		      'EpFile.MoveFileTo( Destination )
		      'NFOFile.MoveFileTo( Destination.Parent.Child( Newname + ".nfo" ) )
		      '
		      'If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" then
		      'ThumbNailFile.MoveFileTo( Destination.Parent.Child( Newname + ".videoimage." + ThumbNailFile.NameExtension ) )
		      'ElseIf Preferences.Prefs.stringForKey("MediaPlayer") = "XBMC" then
		      'ThumbNailFile.MoveFileTo( Destination.Parent.Child( Newname + "-thumb." + ThumbNailFile.NameExtension ) )
		      'Else
		      'ThumbNailFile.MoveFileTo( Destination.Parent.Child( Newname + "." + ThumbNailFile.NameExtension ) )
		      'End If
		    End If
		    
		    dim t as string
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SetDVDIcon(Poster as Picture, Folder as FolderItem) As Integer
		  'Dim ics as IconFamilyMBS
		  'Dim pic, icn as Picture
		  'Dim Iconfile as FolderItem = Folder.Child( "Icon" + chr(13) )
		  '
		  'if Poster = nil then
		  'MsgBox "Can't create a folder icon without a poster image."
		  'Return -1
		  'ElseIf Folder = nil then
		  'MsgBox "Can't create a folder icon without a folder."
		  'Return -1
		  'end if
		  '
		  'ics = NewIconFamilyMBS
		  'pic = Poster
		  '
		  '
		  '
		  '// 1024
		  'icn = new Picture( 1024, 1024, 32 )
		  'icn.Graphics.DrawPicture( pic, 0, 0, 1024, 1024,  0, 0, Pic.Width, Pic.Height )
		  'icn.Mask.Graphics.FillRect( 0, 0, 1024, 1024 )
		  ''icn.Graphics.DrawPicture( DVD1024, 0, 0, 1024, 1024 )
		  ''icn.Mask = DVD1024Mask
		  'call ics.SetIconImage( icn, icn.Mask )
		  '
		  '// 512
		  'icn = new Picture( 512, 512, 32 )
		  'icn.Graphics.DrawPicture( pic, 106, 46, 280, 415,  0, 0, pic.Width, pic.Height )
		  'icn.Mask.Graphics.FillRect( 106, 46, 280, 415 )
		  ''icn.Graphics.DrawPicture( DVD512, 0, 0, 512, 512 )
		  ''icn.Mask = DVD512Mask
		  'call ics.SetIconImage( icn, icn.Mask )
		  '
		  '// 256
		  'icn = new Picture( 256, 256, 32 )
		  'icn.Graphics.DrawPicture( pic, 53, 23, 140, 208,  0, 0, pic.Width, pic.Height )
		  'icn.Mask.Graphics.FillRect( 53, 23, 140, 208 )
		  ''icn.Graphics.DrawPicture( DVD256, 0, 0, 256, 256 )
		  ''icn.Mask = DVD256Mask
		  'call ics.SetIconImage( icn, icn.Mask )
		  '
		  '// 128
		  'icn = new Picture( 128, 128, 32 )
		  'icn.Graphics.DrawPicture( pic, 26, 12, 70, 101,  0, 0, pic.Width, pic.Height )
		  'icn.Mask.Graphics.FillRect( 26, 12, 70, 101 )
		  ''icn.Graphics.DrawPicture( DVD128, 0, 0, 128, 128 )
		  ''icn.Mask = DVD128Mask
		  'call ics.SetIconImage( icn, icn.Mask )
		  '
		  '// 48
		  'icn = new Picture( 48, 48, 32 )
		  'icn.Graphics.DrawPicture( pic, 10, 4, 26, 38,  0, 0, pic.Width, pic.Height )
		  'icn.Mask.Graphics.FillRect( 10, 4, 26, 38 )
		  ''icn.Graphics.DrawPicture( DVD48, 0, 0, 48, 48 )
		  ''icn.Mask = DVD48Mask
		  'call ics.SetIconImage( icn, icn.Mask )
		  '
		  '// 32
		  'icn = new Picture( 32, 32, 32 )
		  'icn.Graphics.DrawPicture( pic, 6, 2, 19, 27,  0, 0, pic.Width, pic.Height )
		  'icn.Mask.Graphics.FillRect( 6, 2, 19, 27 )
		  ''icn.Graphics.DrawPicture( DVD32, 0, 0, 32, 32 )
		  ''icn.Mask = DVD32Mask
		  'call ics.SetIconImage( icn, icn.Mask )
		  '
		  '// 16
		  'icn = new Picture( 16, 16, 32 )
		  'icn.Graphics.DrawPicture( pic, 3, 0, 10, 15,  0, 0, pic.Width, pic.Height )
		  'icn.Mask.Graphics.FillRect( 3, 0, 10, 15 )
		  ''icn.Graphics.DrawPicture( DVD16, 0, 0, 16, 16 )
		  ''icn.Mask = DVD16Mask
		  'call ics.SetIconImage( icn, icn.Mask )
		  '
		  '// Save to Folder
		  'ics.WriteFile( Iconfile )
		  'Iconfile.Visible = False
		  'Return Iconfile.AddCustomIconMBS( ics, False )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SingleCleaner(FolderParent as FolderItem, ID as String, Mode as String)
		  // Modes:
		  //   "All"
		  //   "Metadata"
		  //   "Images"
		  //   "Media"
		  
		  If FolderParent = Nil OR NOT FolderParent.Exists Then Return
		  
		  Dim TrashFiles() as FolderItem
		  
		  Dim NFOFile as FolderItem = FindNFOFile( FolderParent )
		  
		  // NFO File
		  If Mode = "All" OR Mode = "Metadata" Then
		    'If NFOFile <> Nil And NFOFile.Exists Then NFOFile.MoveFileToTrash
		    If NFOFile <> Nil And NFOFile.Exists Then TrashFiles.Append NFOFile
		  End If
		  
		  // Images
		  If Mode = "All" OR Mode = "Images" Then
		    
		    For i as Integer = 1 to FolderParent.Count
		      If FolderParent.Item(i).Type = "image/png" OR _
		        FolderParent.Item(i).Type = "image/jpg" OR _
		        FolderParent.Item(i).Type = "image/tbn" Then
		        'FolderParent.Item(i).MoveFileToTrash
		        If FolderParent.Item(i) <> Nil And FolderParent.Item(i).Exists Then TrashFiles.Append FolderParent.Item(i)
		      End If
		    Next
		    
		    If FolderParent.Child( "extrafanart" ).Exists Then TrashFiles.Append FolderParent.Child( "extrafanart" )
		    If FolderParent.Child( "extrathumbs" ).Exists Then TrashFiles.Append FolderParent.Child( "extrathumbs" )
		    If FolderParent.Child( "actors" ).Exists Then TrashFiles.Append FolderParent.Child( "actors" )
		    If FolderParent.Child( ".actors" ).Exists Then TrashFiles.Append FolderParent.Child( ".actors" )
		    
		    'If FolderParent.Child( "extrafanart" ).Exists Then FolderParent.Child( "extrafanart" ).MoveFileToTrash
		    'If FolderParent.Child( "extrathumbs" ).Exists Then FolderParent.Child( "extrathumbs" ).MoveFileToTrash
		    'If FolderParent.Child( "actors" ).Exists Then FolderParent.Child( "actors" ).MoveFileToTrash
		    
		    CacheImageDelete( ID )
		  End If
		  
		  // Trailer / MP3
		  If Mode = "All" OR Mode = "Media" Then
		    Dim TrailerFile as FolderItem = FindTrailerItem( FolderParent )
		    If TrailerFile <> Nil ANd TrailerFile.Exists Then TrashFiles.Append TrailerFile
		    If FolderParent.Child( "theme.mp3" ).Exists Then TrashFiles.Append FolderParent.Child( "theme.mp3" )
		    If FolderParent.Child("Themes").Exists and FolderParent.Child("Themes").Directory then TrashFiles.Append FolderParent.Child("Themes")
		    
		    'Dim f as FolderItem = FindTrailerItem( FolderParent )
		    'If f <> Nil And f.Exists Then f.MoveFileToTrash
		    '
		    'f = FolderParent.Child("theme.mp3")
		    'If f <> Nil And f.Exists Then f.MoveFileToTrash
		  End If
		  
		  // Other Misc. files
		  If Mode = "All" OR Mode = "Other" Then
		    
		    For i as Integer = 1 to FolderParent.Count
		      Dim Item as FolderItem = FolderParent.Item(i)
		      If Item = Nil OR NOT Item.Exists Then Continue
		      
		      If Item.Extension = "md5" OR _
		        Item.Extension = "crc" OR _
		        Item.Extension = "fxd" OR _
		        Item.Extension = "sfv" OR _
		        Item.Extension = "pdf" OR _
		        Item.Extension = "xls" OR _
		        Item.Extension = "url" OR _
		        Item.Extension = "txt" OR _
		        Item.Extension = "xml" OR _
		        Item.Extension = "mxml" OR _
		        Item.Name.InStr( 0, "WWW.YIFY-TORRENTS.COM" ) > 0 OR _
		        Item.Name.InStr( 0, "readme" ) > 0 OR _
		        Item.Name.InStr( 0, "read me" ) > 0 OR _
		        Item.Name.InStr( 0, "please read" ) > 0 OR _
		        ( Item.Directory And Item.Name = "Proof" ) OR _
		        ( Item.Directory And Item.Name = "Sample" ) OR _
		        Item.NameNoExtension = "Sample" Then
		        '( NOT item.Directory And Item.Length = 0 ) Then // Filesize: 0
		        'Item.MoveFileToTrash
		        TrashFiles.Append Item
		      End If
		    Next
		    
		  End If
		  
		  // Delete all those stubborn files.
		  For n as Integer = 0 to 10
		    If TrashFiles <> Nil And TrashFiles.Ubound > -1 Then
		      For i as Integer = TrashFiles.Ubound DownTo 0
		        If TrashFiles(i) <> Nil And TrashFiles(i).Exists Then
		          If TrashFiles(i).IsNetworkVolume Then TrashFiles(i).Delete Else TrashFiles(i).MoveToTrash()
		        End If
		      Next
		    End If
		  Next
		  
		  If NOT CommonCore.MassSearch Then
		    If ActiveSection = 0 Then wndMain.lstMovies.UpdateRow
		    If ActiveSection = 1 Then wndMain.lstTVShows.UpdateRow
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SingleRenamer(Location as FolderItem, Lindex as Integer = - 1, Force as Boolean = False)
		  
		  if Location = Nil or NOT Location.Exists or NOT Location.IsReadable or NOT Location.IsWriteable then Return
		  
		  dim nfofile as FolderItem = FindNFOFile( Location )
		  if nfofile = Nil or NOT nfofile.Exists or NOT nfofile.IsReadable or NOT nfofile.IsWriteable then Return
		  Dim NFOText as String = ReadTextFile( NFOFile )
		  
		  // Is forced?
		  If NOT force then
		    dim name as string = Location.Name
		    
		    If Preferences.Prefs.integerForKey("BatchRename") = 0 And MsgDlg( wndMain, 1, Loc.msgRenameFolder.ReplaceAll( "%F", Name ), Loc.kCantBeUndone, Loc.dlgRename, Loc.dlgCancel ) = 2 Then Return
		    If Preferences.Prefs.integerForKey("BatchRename") = 1 And MsgDlg( wndMain, 1, Loc.msgRenameFilesAndFolders.ReplaceAll( "%F", Name ), Loc.kCantBeUndone, Loc.dlgRename, Loc.dlgCancel ) = 2 Then Return
		  End If
		  
		  Dim Destination as FolderItem = Location.Parent
		  
		  Dim NewName, FileName as String
		  Dim Title, TitleSort, TitleOriginal, Year, Studio, MPAA, Rating, Resolution, VideoCodec, AudioCodec, AudioChannel, AudioChannels(), Languages, RipSource, Director as String
		  Dim DottedFolderName, DottedFileName as Boolean
		  
		  
		  select case ActiveSection
		  case 0
		    // Movie Section
		    MovieAttr.NFORead( Location )
		    MovieAttr.FolderParent = Location
		    Dim MovieFile as FolderItem = FindMovieItem( Location )
		    
		    // Gather information
		    Dim sx1 as Integer = MovieAttr.RatingMPAA.InStr( 0, " for " )
		    If sx1 > 0 Then MPAA = Trim( MovieAttr.RatingMPAA.Left( sx1 ) ) Else MPAA = Trim( MovieAttr.RatingMPAA )
		    
		    If MovieAttr.Title         <> "" Then Title         = MovieAttr.Title         Else Title         = MovieFile.Parent.Name
		    If MovieAttr.TitleSort     <> "" Then TitleSort     = MovieAttr.TitleSort     Else TitleSort     = Articulator( Title )
		    If MovieAttr.TitleOriginal <> "" Then TitleOriginal = MovieAttr.TitleOriginal Else TitleOriginal = Title
		    If MovieAttr.DateYear       >  0 Then Year = str( MovieAttr.DateYear )
		    
		    If MovieAttr.Studios.Ubound > -1 Then Studio = MovieAttr.Studios(0)
		    If MovieAttr.Rating         >  0 Then Rating = Str( MovieAttr.Rating )
		    If MovieAttr.RipSource     <> "" Then RipSource = MovieAttr.RipSource
		    if MovieAttr.CreditDirector <> "" then Director = MovieAttr.CreditDirector
		    
		    Dim vHeight, vWidth as Integer
		    vWidth  = Val( NFOText.MyMid( "<width>", "</width>" ) )
		    vHeight = Val( NFOText.MyMid( "<height>", "</height>" ) )
		    AudioChannel = NFOText.MyMid( "<channels>", "</channels>" )
		    AudioChannels = match_all( "\<channels\>(.*?)\<\/channels\>", NFOText )
		    
		    For i as Integer = 0 to MovieAttr.InfoAudioLanguage.Ubound
		      If Languages = "" Then
		        Languages = MovieAttr.InfoAudioLanguage(i)
		      Else
		        Languages = Languages.Titlecase + ", " + MovieAttr.InfoAudioLanguage(i).Titlecase
		      End If
		    Next
		    
		    If MovieFile <> Nil And ( MovieFile.Name.Uppercase.Contains( "VIDEO_TS" ) or MovieFile.Name.Contains(".dvdmedia") ) Then
		      Resolution = "720p"
		    ElseIf MovieFile <> Nil And MovieFile.Name.Uppercase = "BDMV" Then
		      Resolution = "1080p"
		    ElseIf vHeight >= 4320 Or vWidth >= 7680 Then
		      Resolution = "8K"
		    ElseIf vHeight >= 2880 Or vWidth >= 5120  Or ( vHeight < 4320 And vWidth >= 7680 ) Then
		      Resolution = "5K"
		    ElseIf vHeight >= 2160 Or vWidth >= 3840  Or ( vHeight < 2880 And vWidth >= 5120 ) Then
		      Resolution = "4K"
		    ElseIf vHeight >= 1080 Or vWidth >= 1920  Or ( vHeight < 2160 And vWidth >= 3840 ) Then
		      Resolution = "1080p"
		    ElseIf ( vHeight < 1000 And vHeight >= 720 ) Or ( vHeight < 1800 And vWidth >= 1280 ) Then
		      Resolution = "720p"
		    ElseIf ( vHeight < 720 And vHeight > 0 ) And ( vWidth < 1280 And vWidth > 0 ) Then
		      //Resolution = "SD"
		      Resolution = Str( vHeight ) + "p"
		    ElseIf vHeight > 0 Then
		      Resolution = Str( vHeight ) + "p"
		    Else
		      Resolution = ""
		      
		    End If
		    
		    If MovieAttr.InfoVideoCodec <> "N/A" Then VideoCodec = MovieAttr.InfoVideoCodec
		    If MovieAttr.InfoAudioCodec.Ubound > -1 And MovieAttr.InfoAudioCodec(0) <> "N/A" Then AudioCodec = MovieAttr.InfoAudioCodec(0)
		    
		    If Rating.Len = 1 Then Rating = Rating + ".0"
		    MPAA = Trim( MPAA.ReplaceAll( "Rated", "" ).ReplaceAll("Kijkwijzer:","") )
		    
		    NewName  = Preferences.Prefs.stringForKey("RenameStringMovies")
		    FileName = Preferences.Prefs.stringForKey("RenameStringMovieFiles")
		    DottedFolderName = ( NewName.InStr(  0, "." ) > 0 )
		    DottedFileName   = ( FileName.InStr( 0, "." ) > 0 )
		    
		    
		    // Set name based on attributes.
		    NewName = NewName.ReplaceAll( "$Y", Year )
		    NewName = NewName.ReplaceAll( "$C", Studio )
		    NewName = NewName.ReplaceAll( "$M", MPAA )
		    NewName = NewName.ReplaceAll( "$#", Rating )
		    
		    NewName = NewName.ReplaceAll( "$R", Resolution )
		    NewName = NewName.ReplaceAll( "$V", VideoCodec )
		    NewName = NewName.ReplaceAll( "$A", AudioCodec )
		    NewName = NewName.ReplaceAll( "$F", AudioChannel )
		    NewName = NewName.ReplaceAll( "$L", Languages )
		    NewName = NewName.ReplaceAll( "$D", RipSource  )
		    NewName = NewName.ReplaceAll( "$P", Director )
		    
		    NewName = NewName.ReplaceAll( "$T", Title.ReplaceAll( "$", "≈" ) )
		    NewName = NewName.ReplaceAll( "$S", TitleSort.ReplaceAll( "$", "≈" ) )
		    NewName = NewName.ReplaceAll( "$O", TitleOriginal.ReplaceAll( "$", "≈" ) )
		    NewName = NewName.ReplaceAll( "≈", "$" )
		    
		    
		    // Set filename based on attributes.
		    FileName = FileName.ReplaceAll( "$Y", Year )
		    FileName = FileName.ReplaceAll( "$C", Studio )
		    FileName = FileName.ReplaceAll( "$M", MPAA )
		    FileName = FileName.ReplaceAll( "$#", Rating )
		    
		    FileName = FileName.ReplaceAll( "$R", Resolution )
		    FileName = FileName.ReplaceAll( "$V", VideoCodec )
		    FileName = FileName.ReplaceAll( "$A", AudioCodec )
		    FileName = FileName.ReplaceAll( "$F", AudioChannel )
		    FileName = FileName.ReplaceAll( "$L", Languages )
		    FileName = FileName.ReplaceAll( "$D", RipSource  )
		    FileName = FileName.ReplaceAll( "$P", Director )
		    
		    FileName = FileName.ReplaceAll( "$T", Title.ReplaceAll("$", "≈" ) )
		    FileName = FileName.ReplaceAll( "$S", TitleSort.ReplaceAll("$", "≈" ) )
		    FileName = FileName.ReplaceAll( "$O", TitleOriginal.ReplaceAll("$", "≈" ) )
		    FileName = FileName.ReplaceAll( "≈", "$" )
		    
		    
		    NewName = CleanName( NewName )
		    FileName = CleanName( FileName )
		    
		    If DottedFileName Then FileName = FileName.ReplaceAll( " ", "." )
		    If DottedFolderName Then NewName = NewName.ReplaceAll( " ", "." )
		    
		    if NewName.Left(1) = "." then NewName = " " + NewName
		    if FileName.Left(1) = "." then FileName = " " + FileName
		    
		    If Force And NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kRenaming + ":", Location.Name + " -> " + NewName )
		    
		    // rename files
		    
		    // # Poster
		    dim posterFile as FolderItem
		    posterFile = FindImagePoster( Location )
		    if posterFile <> Nil and posterFile.Exists then
		      posterFile.MoveFileTo( MovieAttr.DestinationPoster( Location ) )
		    end if
		    
		    // # Fanart
		    dim fanartFile as FolderItem
		    fanartFile = FindImageFanart( Location )
		    if fanartFile <> Nil and fanartFile.Exists then
		      fanartFile.MoveFileTo( MovieAttr.DestinationFanart( Location ) )
		    end if
		    
		    // # Banner
		    dim bannerFile as FolderItem
		    bannerFile = FindImageBanner( Location )
		    if bannerFile <> Nil and bannerFile.Exists then
		      bannerFile.MoveFileTo( MovieAttr.DestinationBanner( Location ) )
		    end if
		    
		    // # Trailer
		    dim trailerFile as FolderItem
		    trailerFile = FindTrailerItem( Location )
		    if trailerFile <> Nil and trailerFile.Exists then
		      trailerFile.MoveFileTo( MovieAttr.DestinationTrailer( Location, trailerFile ) )
		    end if
		    
		    
		    // Do any extra necesairy renaming:
		    if MovieFile.Name <> "BDMV" and MovieFile.Name <> "VIDEO_TS" and NOT MovieFile.Name.Contains(".dvdmedia") then
		      dim SameNameFiles() as FolderItem
		      dim unpartedMoviefileName as string = MovieAttr.UnPart( moviefile.NameNoExtension )
		      
		      // gather other files
		      for i as Integer = 1 to Location.Count
		        dim file as FolderItem = Location.Item(i)
		        
		        if file <> nil and file.Exists and file.Name.Contains(unpartedMoviefileName) then
		          SameNameFiles.Append file
		        end if
		      next
		      
		      // rename other files
		      if FileName <> "" then
		        for each file as FolderItem in SameNameFiles
		          
		          dim dest as FolderItem = Location.Child( file.name.ReplaceAll( unpartedMoviefileName, FileName ) )
		          if dest <> Nil and NOT dest.Exists and file.Name <> dest.Name then
		            file.MoveFileTo( dest )
		          end if
		          
		        next
		      end if
		      
		    end if
		    
		    // NFO
		    'nfofile.MoveFileTo( MovieAttr.DestinationNFO( location ) )
		    MovieAttr.NFORead( Location )
		    MovieAttr.NFOWrite( Location )
		    
		    // move movie folder
		    if NewName <> "" and NOT Destination.Child( NewName ).Exists then
		      Location.MoveFileTo( Destination.Child( NewName ) )
		      MovieAttr.FolderParent = Destination.Child( NewName )
		    end if
		    
		    // Update list
		    if NewName <> "" and Destination.Child( NewName ).Exists then
		      wndMain.lstMovies.UpdateRow( Lindex, Destination.Child( NewName ) )
		    else
		      wndMain.lstMovies.UpdateRow( Lindex, Location )
		    end if
		    
		  case 1
		    // TV Section
		    TVAttr.NFORead( Location )
		    TVAttr.FolderParent = Location
		    
		    Dim sx1 as Integer = TVAttr.RatingMPAA.InStr( 0, " for " )
		    If sx1 > 0 Then MPAA = Trim( TVAttr.RatingMPAA.Left( sx1 ) ) Else MPAA = Trim( TVAttr.RatingMPAA )
		    
		    If TVAttr.Title         <> "" Then Title = TVAttr.Title                 Else Title = TVAttr.FolderParent.Name
		    If TVAttr.TitleSort     <> "" Then TitleSort = TVAttr.TitleSort         Else TitleSort = Articulator( Title )
		    If TVAttr.TitleOriginal <> "" Then TitleOriginal = TVAttr.TitleOriginal Else TitleOriginal = Title
		    If TVAttr.DateYear       > 0  Then Year = Str( TVAttr.DateYear )        Else Year = ""
		    If TVAttr.TVNetwork     <> "" Then Studio = TVAttr.TVNetwork            Else Studio = ""
		    If TVAttr.Rating         > 0  Then Rating = Str( TVAttr.Rating )        Else Rating = ""
		    if TVAttr.CreditDirector <> "" then Director = TVAttr.CreditDirector else Director = ""
		    DottedFolderName = ( NewName.InStr( 0, "." ) > 0 )
		    
		    If Rating.Len = 1 Then Rating = Rating + ".0"
		    MPAA = Trim( MPAA.ReplaceAll( "Rated", "" ).ReplaceAll("Kijkwijzer:","") )
		    
		    
		    NewName = Preferences.Prefs.stringForKey("RenameStringTVShows")
		    
		    // Filter year from title
		    If NewName.InStr("$Y") > 0 Then
		      Title = RegExThis( Title, "\([0-9][0-9][0-9][0-9]\)" )
		      TitleSort = RegExThis( TitleSort, "\([0-9][0-9][0-9][0-9]\)" )
		    End If
		    
		    // Set name based on attributes.
		    NewName = NewName.ReplaceAll( "$Y", Year )
		    NewName = NewName.ReplaceAll( "$C", Studio )
		    NewName = NewName.ReplaceAll( "$M", MPAA )
		    NewName = NewName.ReplaceAll( "$#", Rating )
		    
		    NewName = NewName.ReplaceAll( "$R", Resolution )
		    NewName = NewName.ReplaceAll( "$V", VideoCodec )
		    NewName = NewName.ReplaceAll( "$A", AudioCodec )
		    NewName = NewName.ReplaceAll( "$F", AudioChannel )
		    NewName = NewName.ReplaceAll( "$L", Languages )
		    NewName = NewName.ReplaceAll( "$D", RipSource  )
		    NewName = NewName.ReplaceAll( "$P", Director )
		    
		    NewName = NewName.ReplaceAll( "$T", Title.ReplaceAll("$", "≈" ) )
		    NewName = NewName.ReplaceAll( "$S", TitleSort.ReplaceAll("$", "≈" ) )
		    NewName = NewName.ReplaceAll( "$O", TitleOriginal.ReplaceAll( "$", "≈" ) )
		    NewName = NewName.ReplaceAll( "≈", "$" )
		    
		    NewName = CleanName( NewName )
		    If DottedFolderName Then NewName = NewName.ReplaceAll( " ", "." )
		    
		    if NewName.Left(1) = "." then NewName = " " + NewName
		    
		    If Force And NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kRenaming + ":", Location.Name + " -> " + NewName )
		    
		    // Rename episodes
		    RenameEpisodes(Location)
		    
		    // Rename show folder
		    if NewName <> "" And NOT Destination.Child( NewName ).Exists then
		      Location.MoveFileTo( Destination.Child( NewName ) )
		      
		      TVAttr.FolderParent = Destination.Child( NewName )
		      'TVAttr.NFOWrite( TVAttr.FolderParent )
		      
		      wndMain.lstTVShows.UpdateRow( Lindex, Destination.child(NewName), NOT CommonCore.MassSearch )
		    else
		      wndMain.lstTVShows.UpdateRow( Lindex, Location, NOT CommonCore.MassSearch )
		    End if
		    
		    
		    dim s as string
		    
		    
		  case 2
		    //#TODO Anime section
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TVRageDate2Date(NextAiredDate as String) As String
		  Dim AirDate() as String = NextAiredDate.Split("/")
		  
		  Select Case AirDate.Ubound
		    
		  Case 0
		    Return AirDate(0)
		  case 1
		    Return AirDate(1) + "-" + Month2Int( AirDate(0) )
		  case 2
		    Return AirDate(2) + "-" + Month2Int( AirDate(0) ) + "-" + AirDate(1)
		  else
		    Return ""
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValidJSON(Extends JSONString as String, Database as String = "", Silent as Boolean = False) As Boolean
		  Dim b as Boolean
		  Dim Message as String
		  
		  'JSONString = "+" + JSONString
		  JSONString = Trim( JSONString )
		  
		  // TMDB Responses
		  If JSONString.InStr(0, "503 Service Unavailable") > 0 Then
		    Message = "[" + Database + "] " + Loc.kError + " 503: " + MovieCore.kServiceUnavailable + chr(13) + chr(13) + Loc.kPleaseTryAgainLater
		    b = False
		    
		  ElseIf JSONString.InStr(0, "404 not found") > 0 Then // Generic 404 error
		    Message = "[" + Database + "] " + "404 Not found error."
		    b = False
		    
		  ElseIf JSONString.InStr( 0, "Database Error" ) > 0 Or JSONString.InStr( 0, "Website is currently unreachable" ) > 0 Then
		    Message = "[" + Database + "] " + MovieCore.msgDatabaseError + chr(13) + chr(13) + MovieCore.kConnectionError
		    b = False
		    
		    // IMDB Responses
		  ElseIf JSONString.InStr( 0, "Error getting data" ) > 0 OR _
		    JSONString.InStr( 0, "Incorrect IMDB ID" ) > 0 OR _
		    JSONString.InStr( 0, "The remote server returned an error: (404) Not Found." ) > 0 Then
		    Message = "[" + Database + "] " + MovieCore.msgIMDBApiError
		    b = False
		    
		  ElseIf JSONString.InStr( 0, "String or binary data would be truncated." ) > 0 Then
		    If ( DebugBuild Or App.Experimental ) Or App.DebugMode Then Message = "[Debug - " + Database + "] String or binary data would be truncated." + chr(13) + chr(13) + JSONString
		    b = False
		    
		  ElseIf JSONString.InStr(0, "Unable to connect to the remote server" ) > 0 Then
		    If ( DebugBuild Or App.Experimental ) Or App.DebugMode Then Message = "[Debug - " + Database + "] " + MovieCore.msgDatabaseError + chr(13) + chr(13) + MovieCore.kConnectionError
		    b = False
		    
		    // Fanart.TV Responses
		  ElseIf JSONString.Left(1) = "{" Or JSONString.Left(1) = "[" Then
		    b = True
		    
		  elseif JSONString.InStr(0, "520: Web server is returning an unknown error") > 0 then
		    Message = "[" + Database + "] " + Loc.kError + " 520: " + "Web server is returning an unknown error" + chr(13) + chr(13) + Loc.kPleaseTryAgainLater
		    b = False
		    
		  elseif JSONString.InStr(0, "502: Bad gateway") > 0 then
		    b = True
		    
		  ElseIf JSONString = "" Then
		    Message = MovieCore.msgTMDBConnectionError.ReplaceAll("<database>", Database)' + chr(13) + chr(13) + Loc.kCheckInternetConnection
		    If Database = "IMDb Top250" Then Message = ""
		    b = False
		    
		  ElseIf JSONString.InStr(0, "null") > 0 And NOT ( JSONString.Left(1) = "{" Or JSONString.Left(1) = "[" ) Then
		    b = False
		    
		    // TraktTV Responses
		  ElseIf JSONString.InStr( 0, "The page you were looking for doesn't exist" ) > 0 then
		    b = False
		    
		    // Rotten Tomatoes Responses
		  ElseIf JSONString.InStr( 0, "Developer Inactive" ) > 0 then
		    b = False
		    
		  Else
		    Message = "[" + Database + "] " + MovieCore.msgInvalidContent + ":" + chr(13) + chr(13) + JSONString
		    b = False
		  End If
		  
		  
		  // Present the result to the user and return.
		  If Silent Then
		    Return b
		    
		  elseIf NOT CommonCore.MassSearch And Message <> "" Then
		    MessageBox Message
		    
		  ElseIf CommonCore.MassSearch And Message <> "" And NOT b Then
		    
		    Dim Title as String
		    If ActiveSection = 0 Then
		      Title = MovieAttr.Title
		      If Title = "" Then Title = FindMovieName( MovieAttr.FolderParent, True, NOT Preferences.Prefs.boolForKey("UseFolderNameForLookUp") )
		      CommonCore.UnfoundTitles.Append Title + Chr(13) + Message' + chr(13) + MovieAttr.FolderParent.ShellPath.ReplaceAll("\","")
		      CommonCore.UnfoundPaths.Append MovieAttr.FolderParent
		    ElseIf ActiveSection = 1 Then
		      Title = TVAttr.Title
		      CommonCore.UnfoundTitles.Append Title + Chr(13) + Message' + chr(13) + TVAttr.FolderParent.ShellPath.ReplaceAll("\","")
		      CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		    End If
		    
		    'If NOT nc.Available then
		    'if NOT Growl.Notify( Title, Message ) Then
		    // NOT Growling!
		    '#if DebugBuild then
		    'MessageBox Title + chr(13) + chr(13) + Message
		    '#endif
		    'end if
		    'else
		    nc.Notify(Title, "", Message)' Message Title + chr(13) + Message
		    'End If
		    '
		    'End If
		    
		  End If
		  
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoFileExtension(Extends VideoFile as FolderItem) As String
		  If VideoFile = Nil then Return ""
		  
		  Dim XMLContent as String = DefineEncoding( MediaInfo( VideoFile, True ), Encodings.UTF8 ).ReplaceAll("E: File read error","")
		  
		  // MediaInfo has not been set to be an executable file.
		  If XmlContent.InStr( 0, "Permission denied" ) > 0 Then Return ".flv"
		  
		  Dim Extensions() as String = XMLContent.MyMid( "<Codec_Extensions_usually_used>", "</Codec_Extensions_usually_used>" ).Split( " " )
		  If Extensions.Ubound > -1 Then Return "." + Extensions(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XML2JSON(Extends XMLString as String) As JSONItem
		  XMLString = DefineEncoding( XMLString, Encodings.UTF8 )
		  
		  If XMLString = "" OR Trim( XMLString ).Left(5) <> "<?xml" Then Return Nil
		  
		  If XMLString.InStr( 0, "Query failed" ) > 0 Then
		    If DebugBuild Then MessageBox "Query failed"
		    Return Nil
		  End If
		  
		  'XMLString = DecodingFromHTMLMBS( XMLString )
		  If XMLString.InStr( 0, "DOCTYPE" ) > 0 Then Return Nil
		  
		  Dim jXml as New XmlDocument
		  jXml.PreserveWhitespace = False
		  If XMLString.InStr( 100, "<episodedetails>" ) > 0 Then
		    XMLString = XMLString.MyMid( "<episodedetails>", "</episodedetails>" )
		    XMLString = "<?xml version=""1.0"" encoding=""UTF-8""?><episodedetails>" + XMLString + "</episodedetails>"
		    'XMLString = "<?xml version=""1.0"" encoding=""UTF-8""?><episodedetails>" + XMLString.MyMid( "<episodedetails>", "</episodedetails>" + "</episodedetails>" ) // In case of multi-episodes.
		  End If
		  
		  XMLString = XMLString.ReplaceAll("&", ";amp;" ).ReplaceAll("<font>","").ReplaceAll("<3 ", ";lt;3 ").ReplaceAll( "< i>", "" ).ReplaceAll(" << ", "«").ReplaceAll("<br>",Chr(10)) // Doctor Who (Original) & a few others
		  if XMLString.Contains( "<tms_priority>" ) then
		    XMLString = RegExThis( XMLString, "<tms_priority>.*?</tms_priority>" ) // NUL character??
		  end if
		  XMLString = XMLString.Replace( XMLString.MyMid( "<akas>", "</akas>" ), "" )
		  
		  XMLString = RemoveLinks( XMLString )
		  'if XMLString.Contains("<Data>") then
		  'WriteTextFile( XMLString, SpecialFolder.Desktop.Child("Test.xml") )
		  'end if
		  
		  if XMLString.Contains("<?xml") then 'and Trim( XMLString ).Right( 7 ).Lowercase = "</data>" then
		    jXml.LoadXml( XMLString )
		  else
		    Log "Failed to load XML"
		  end if
		  
		  Dim xRoot, xNode, xItem as XmlNode
		  if jXml <> Nil and jXml.ChildCount > 0 then
		    xRoot = jXml.FirstChild
		  end if
		  
		  Dim NewJSON as New JSONItem
		  if xRoot <> Nil then
		    NewJSON.Value( xRoot.Name ) = New JSONItem
		  end if
		  
		  if xRoot <> Nil then
		    For i as Integer = 0 to xRoot.ChildCount -1
		      xNode = xRoot.Child(i)
		      
		      If xNode.ChildCount > 1 Then
		        Dim jItem as New JSONItem
		        
		        For n as Integer = 0 to xNode.ChildCount -1
		          xItem = xNode.Child(n)
		          
		          If xItem.FirstChild <> Nil Then
		            If xItem.FirstChild.Value = "True" Then
		              jItem.Value( xItem.Name ) = True
		            ElseIf xItem.FirstChild.Value = "False" Then
		              jItem.Value( xItem.Name ) = False
		              'ElseIf Val( xItem.FirstChild.Value ) > 0 Then
		              'jItem.Value( xItem.Name ) = Val( xItem.FirstChild.Value )
		            Else
		              jItem.Value( xItem.Name ) = RegExThis( xItem.ToString, "<.*?>", "" ).ReplaceAll(";amp;", "&").ReplaceAll(";lt;", "<") '.ReplaceAll("<", "&lt;").ReplaceAll(">","&gt;")
		            End If
		            
		          Else
		            jItem.Value( xItem.Name ) = ""
		          End If
		          
		        Next
		        
		        
		        If xRoot.ChildCount > 1 Then
		          If NOT NewJSON.Child( xRoot.Name ).HasName( xNode.Name ) Then NewJSON.Child( xRoot.Name ).Value( xNode.Name ) = New JSONItem
		          NewJSON.Child( xRoot.Name ).Child( xNode.Name ).Append( jItem )
		        ElseIf xRoot.ChildCount = 1 Then
		          NewJSON.Child( xRoot.Name ).Value( xNode.Name ) = jItem
		        End If
		        
		      Else
		        
		        If xNode.FirstChild = Nil Then
		          NewJSON.Child( xRoot.Name ).Value( xNode.Name ) = ""
		        Else
		          NewJSON.Child( xRoot.Name ).Value( xNode.Name ) = RegExThis( xNode.ToString, "<.*?>", "" ).ReplaceAll(";amp;", "&") 'xNode.FirstChild.Value
		        End If
		        
		      End If
		      
		      
		    Next
		  end if
		  
		  If NOT NewJSON.ToString.ValidJSON Then
		    Return Nil
		  End If
		  
		  Return NewJSON '.ToString
		  
		  
		  
		  #If TargetLinux Then
		    'Dim sx1 as Integer = 0
		    'sx1 = XMLString.InStr( 0, "?>" ) + 2
		    'Dim xmlHead as String = XMLString.Left( sx1 )
		    'Dim xmlBody as String = XMLString.Right( XMLString.Len - sx1 )
		    
		    Dim xmlHead as String = "<?" + XMLString.MyMid( "<?", "?>" ) + "?>"
		    If xmlHead = "<??>" Then xmlHead = ""
		    
		    Dim xmlBody as String = XMLString.ReplaceAll( xmlHead, "" )
		    xmlBody = xmlBody.ReplaceAll( "<episodedetails xsd=""http://www.w3.org/2001/XMLSchema"" xsi=""http://www.w3.org/2001/XMLSchema-instance"">", "<episodedetails>" )
		    
		    xmlBody = xmlBody.ReplaceAll( "&quot;", "\""" )
		    'xmlBody = RegExThis( xmlBody, " .*=\""(.*?)\""" )
		    xmlBody = RegExThis( xmlBody, "country=""(.*?)""" )
		    xmlBody = RegExThis( xmlBody, "code=""(.*?)""" )
		    xmlBody = RegExThis( xmlBody, "id=""(.*?)""" )
		    xmlBody = RegExThis( xmlBody, "source=""(.*?)""" )
		    xmlBody = RegExThis( xmlBody, "attr=""(.*?)""" )
		    xmlBody = RegExThis( xmlBody, "dim=""(.*?)""" )
		    xmlBody = RegExThis( xmlBody, "preview=""(.*?)""")
		    xmlBody = RegExThis( xmlBody, "format=""(.*?)""" )
		    xmlBody = RegExThis( xmlBody, "moviedb=""(.*?)""" )
		    xmlBody = RegExThis( xmlBody, "db=""(.*?)""" )
		    xmlBody = xmlBody.ReplaceAll( """", "\""" )
		    xmlBody = xmlBody.ReplaceAll( "&", ";amp;" )
		    xmlBody = RegExThis( xmlBody, "<streamdetails>(.*?)</streamdetails>", "" )
		    
		    // remove common html tags.
		    xmlBody = xmlBody.ReplaceAll( "<em>", "" ).ReplaceAll( "</em>", "" )
		    xmlBody = xmlBody.ReplaceAll( "<i>", "" ).ReplaceAll( "</i>", "")
		    xmlBody = xmlBody.ReplaceAll( "<b>", "" ).ReplaceAll( "</b>", "" )
		    xmlBody = xmlBody.ReplaceAll("< i>", "" ) // Doctor Who.
		    
		    // Bypass multi-episode NFO's.
		    If xmlBody.InStr( 100, "<episodedetails>" ) > 0 Then
		      'Return ""
		      xmlBody = "<episodes>" + xmlBody + "</episodes>"
		    End If
		    
		    'xmlBody = xmlBody.ReplaceAll( "=\""", "=""" )
		    'xmlBody = xmlBody.ReplaceAll( "\"">", """>" )
		    'xmlBody = RegExThis( xmlBody, " .*?=""(.*?)"".*?>" )
		    
		    Dim Xml as new XMLDocument
		    Xml.LoadXml( xmlHead + xmlBody )
		    
		    Return Xml.Transform( XSLT_XML2JSON ).ReplaceAll(";amp;", "&").ReplaceAll("\'", "'")
		  #endif
		  
		  Exception err as XmlException
		    'Dim w as New wndBugReporter
		    'w.Init( err, "Failed to transform XML file to JSON" + chr(13) + chr(13) + XMLString )
		    if AppSettings.HandleError( err, "XmlException (caught at XML2JSON) " + chr(13) + chr(13) + XMLString ) then
		      Return Nil
		    end if
		    
		    'MessageBox "Failed to transform XML file to JSON"
		    'wndResults.Init( "Original XML:", XMLString )
		    Return Nil
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		msgMessage As String
	#tag EndProperty


	#tag Constant, Name = MediaInfo2JSON, Type = String, Dynamic = False, Default = \"Page;\rPage_Begin;{\"Media\": [\rPage_Middle;\rPage_End; \"ENDPAGE\" ]}\r\rFile;\rFile_Begin;\\n{ \"File\": [\\n\rFile_Middle;\rFile_End;  \"ENDFILE\" ]}\x2C\\n\r\rGeneral;      \"CompleteFileName\":\"%CompleteName%\"\x2C\\n      \"Path\":\"%FolderName%\"\x2C\\n      \"FileName\":\"%FileName%\"\x2C\\n      \"Album\":\"%Album%\"\x2C\\n      \"Performer\":\"%Performer%\"\x2C\\n      \"Genre\":\"%Genre%\"\x2C\\n      \"Extention\":\"%FileExtension%\"\x2C\\n      \"FileSize\": \"%FileSize%\"\x2C\\n      \"StreamCount\":\"%StreamCount%\"\x2C\\n      \"StreamID\": {\\n        \"%StreamKindID%\": {\\n          \"Format\":\"%Format%\"\x2C\\n          \"Duration\":\"%Duration%\"\x2C\\n          \"OverallBitRate\":\"%OverallBitRate/String%\"\\n        }\\n      }\\n\rGeneral_Begin;    { \"General\": {\\n\rGeneral_Middle;\rGeneral_End;    }}\x2C\\n\r\rVideo;      \"StreamID\": {\\n        \"%StreamKindID%\": {\\n          \"Codec\":\"%Format%\"\x2C\\n          \"BitRate_Mode\":\"%BitRate_Mode/String%\"\x2C\\n          \"BitRate\":\"%BitRate/String%\"\x2C\\n          \"StreamSize\":\"%StreamSize%\"\x2C\\n          \"FrameRate\":\"%FrameRate/String%\"\x2C\\n          \"Width\":\"%Width%\"\x2C\\n          \"Height\":\"%Height%\"\x2C\\n          \"AspectRate\":\"%DisplayAspectRatio/String%\"\\n        }\\n      }\\n\rVideo_Begin;    { \"Video\": {\\n\rVideo_Middle;\rVideo_End;    }}\x2C\\n\r\rAudio;      {       \"%StreamKindID%\": {\\n          \"Codec\":\"%Format%\"\x2C\\n          \"Duration\":\"%Duration%\"\x2C\\n          \"BitRate_Mode\":\"%BitRate_Mode/String%\"\x2C\\n          \"BitRate\":\"%BitRate/String%\"\x2C\\n          \"StreamSize\":\"%StreamSize%\"\x2C\\n          \"SamplingRate\":\"%SamplingRate%\"\x2C\\n          \"Chanals\":\"%Channel(s)%\"\\n        }\\n      }\x2C\\n\rAudio_Begin;    { \"Audio\": [\\n\rAudio_Middle;\rAudio_End;   \"ENDAUDIO\" ]}\x2C\\n\r\rText;\rText_Begin;\rText_Middle;\rText_End;\r\rChapters;\rChapters_Begin;\rChapters_Middle;\rChapters_End;\r\rImage;      \"StreamID\": {\\n        \"%StreamKindID%\": {\\n          \"Format\":\"%Format%\"\x2C\\n          \"BitDepth\":\"%BitDepth/String%\"\x2C\\n          \"Width\":\"%Width%\"\x2C\\n          \"Height\":\"%Height%\"\\n        }\\n      }\\n\rImage_Begin;    { \"Image\": {\\n\rImage_Middle;\rImage_End;    }}\x2C\\n\r\rMenu;\rMenu_Begin;\rMenu_Middle;\rMenu_End;\r", Scope = Public
	#tag EndConstant

	#tag Constant, Name = XSLT_XML2JSON, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\"\?>\r<xsl:stylesheet version\x3D\"1.0\" xmlns:xsl\x3D\"http://www.w3.org/1999/XSL/Transform\">\r    <xsl:output method\x3D\"text\"/>\r\r    <xsl:template match\x3D\"/\">{\r        <xsl:apply-templates select\x3D\"*\"/>}\r    </xsl:template>\r\r    <!-- Object or Element Property-->\r    <xsl:template match\x3D\"*\">\r        \"<xsl:value-of select\x3D\"name()\"/>\" : <xsl:call-template name\x3D\"Properties\"/>\r    </xsl:template>\r\r    <!-- Array Element -->\r    <xsl:template match\x3D\"*\" mode\x3D\"ArrayElement\">\r        <xsl:call-template name\x3D\"Properties\"/>\r    </xsl:template>\r\r    <!-- Object Properties -->\r    <xsl:template name\x3D\"Properties\">\r        <xsl:variable name\x3D\"childName\" select\x3D\"name(*[1])\"/>\r        <xsl:choose>\r            <xsl:when test\x3D\"not(*|@*)\">\"<xsl:value-of select\x3D\".\"/>\"</xsl:when>\r            <xsl:when test\x3D\"count(*[name()\x3D$childName]) > 1\">{ \"<xsl:value-of select\x3D\"$childName\"/>\" :[<xsl:apply-templates select\x3D\"*\" mode\x3D\"ArrayElement\"/>] }</xsl:when>\r            <xsl:otherwise>{\r                <xsl:apply-templates select\x3D\"@*\"/>\r                <xsl:apply-templates select\x3D\"*\"/>\r    }</xsl:otherwise>\r        </xsl:choose>\r        <xsl:if test\x3D\"following-sibling::*\">\x2C</xsl:if>\r    </xsl:template>\r\r    <!-- Attribute Property -->\r    <xsl:template match\x3D\"@*\">\"<xsl:value-of select\x3D\"name()\"/>\" : \"<xsl:value-of select\x3D\".\"/>\"\x2C\r    </xsl:template>\r</xsl:stylesheet>", Scope = Public
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
			Name="msgMessage"
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

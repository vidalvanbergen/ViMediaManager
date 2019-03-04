#tag Module
Protected Module CommonCore
	#tag Method, Flags = &h0
		Function ActiveListbox() As Listbox
		  Select Case ActiveSection
		    
		  Case 0
		    Return wndMain.lstMovies
		  Case 1
		    Return wndMain.lstTVShows
		  Case 2
		    #pragma Warning "Build the Anime section first"
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ActiveSection() As Integer
		  Return wndMain.ppMain.Value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddNewShow()
		  If TVAttr.FolderParent = Nil Then Return
		  
		  Dim w as New dlgInput
		  Dim s as String = "Show name"
		  
		  If w.Ask(s, "Add new televsion show:", "Write down the show name below, it will be created in the same folder as the currently selected show") Then
		    If Trim( s ) <> "" And s.Left(1) <> "." Then
		      TVAttr.FolderParent.Parent.Child( s ).CreateAsFolder
		      CommonCore.ReloadList
		    End If
		  Else
		    'MessageBox "False"
		  End If
		  w.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Clean()
		  If wndMain.ProgressRunning Then Return
		  wndClean.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentItemName() As String
		  If ActiveSection = 0 Then
		    If NOT MovieAttr.FolderParent IsA FolderItem Then Return ""
		    Return FindMovieName( MovieAttr.FolderParent, True, NOT Preferences.Prefs.boolForKey("UseFolderNameForLookUp") )
		  ElseIf ActiveSection = 1 Then
		    If TVAttr.Title <> "" Then Return TVAttr.Title
		    If NOT TVAttr.FolderParent IsA FolderItem Then Return ""
		    Return TVAttr.FolderParent.Name
		  End If
		  
		  Exception err as NilObjectException
		    #If DebugBuild Then
		      MessageBox "Nil Object exception"
		    #endif
		    Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DeleteItem()
		  
		  If ActiveListbox.ListIndex = -1 Then
		    MsgBox Loc.kNothingToDelete
		    Return
		  End If
		  
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  
		  'Dim Path as String = ActiveListbox.Cell( ActiveListbox.ListIndex, 1 )
		  
		  If ActiveSection = 0 Then wndMain.lstMovies.DeleteItem
		  If ActiveSection = 1 Then wndMain.lstTVShows.DeleteItem
		  
		  Dim LstBox as Listbox = ActiveListbox
		  If ActiveSection = 1 Then LstBox = wndMain.lstTVShadow
		  wndMain.ActBar( ActiveSection ).TextValue( Str( LstBox.ListCount ) + " " + SectionName )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub EditInfo()
		  If wndMain.ProgressRunning Then Return
		  
		  If ActiveSection = 0 And ActiveListbox.ListIndex > -1 Then wndMovieMetadata.Show
		  If ActiveSection = 1 And ActiveListbox.ListIndex > -1 And ActiveListbox.RowTag( ActiveListbox.ListIndex ) <> "Folder" Then wndShowMetadata.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FetchMetadata()
		  // Movie
		  If ActiveSection = 0 And ActiveListbox.ListIndex > -1 Then
		    
		    If PriorArtFound( MovieAttr.FolderParent ) Then 'And _
		      If Preferences.Prefs.integerForKey("KeepImages") = 0 Then // Ask First
		        Dim i as Integer = MsgDlg( Nil, 1, MovieCore.msgPriorMovieArtFound.ReplaceAll( "<movie>", CurrentItemName ), MovieCore.msgPriorArtDeletion, MovieCore.btnReplaceExistingArtwork, Loc.dlgCancel, MovieCore.btnDownloadMissingArtwork )
		        If i = 1 Then PriorArtDelete( MovieAttr.FolderParent )
		        If i = 2 Then Return
		        
		      ElseIf Preferences.Prefs.integerForKey("KeepImages") = 1 Then // Always Delete
		        PriorArtDelete( MovieAttr.FolderParent )
		      End If
		      
		    End If
		    
		    dlgProgress.Start( Loc.kSearching + ":", CurrentItemName, 0, "SearchMovie" )
		    
		    // TV
		  ElseIf ActiveSection = 1 And ActiveListbox.ListIndex > -1 And ActiveListbox.RowTag( ActiveListbox.ListIndex ) <> "Folder" Then
		    
		    If PriorArtFound( TVAttr.FolderParent ) Then
		      If Preferences.Prefs.integerForKey("KeepImages") = 0 Then // Ask First
		        Dim i as Integer = MsgDlg( Nil, 1, MovieCore.msgPriorMovieArtFound.ReplaceAll( "<movie>", CurrentItemName ), MovieCore.msgPriorArtDeletion, MovieCore.btnReplaceExistingArtwork, Loc.dlgCancel, MovieCore.btnDownloadMissingArtwork )
		        If i = 1 Then PriorArtDelete( TVAttr.FolderParent )
		        If i = 2 Then Return
		        
		      ElseIf Preferences.Prefs.integerForKey("KeepImages") = 1 Then // Always Delete
		        PriorArtDelete( TVAttr.FolderParent )
		      End If
		    End If
		    
		    dlgProgress.Start( Loc.kSearching + ":", CurrentItemName, 0, "SearchTVShow" )
		    
		  End If // @END PriorArtFound
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FetchMissingMetadata()
		  Dim UnScrapedItems as Integer = 0
		  For i as Integer = 0 to ActiveListbox.ListCount - 1
		    If ActiveListbox.Cell(i, 2) = "" Then UnScrapedItems = UnScrapedItems + 1
		  Next
		  
		  If UnScrapedItems = 0 Then
		    MessageBox Loc.kNothingLeft
		    Return
		  End If
		  
		  UnScrapedItems = UnScrapedItems + 1 // Just for good measure, and to not show the ever spinning progress bar.
		  
		  If ActiveListbox.ListCount > 0 Then
		    If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", Loc.Movies + "...", UnScrapedItems, "FetchMissingMovies" )
		    If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", Loc.TVShows + "...", UnScrapedItems, "FetchMissingTVShows" )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImageBackdrop()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kFanart, 2, "GetMovieFanart" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kFanart, 2, "GetTVShowFanart" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImageBanner()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kBanner + "...", 0, "GetMovieBanner" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kBanner + "...", 0, "GetTVShowBanner" )
		  If ActiveSection = 2 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kBanner + "...", 0, "GetAnimeBanner" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImageCharacterArt()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kCharacterArt + "...", 0, "GetTVShowCharacterArt" )
		  If ActiveSection = 2 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kCharacterArt + "...", 0, "GetAnimeCharacterArt" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImageClearArt()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kClearArt + "...", 0, "GetMovieClearArt" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kClearArt + "...", 0, "GetTVShowClearArt" )
		  If ActiveSection = 2 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kClearArt + "...", 0, "GetAnimeBanner" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImageDiscArt()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kDiscArt + "...", 0, "GetMovieDisc" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImageLogo()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kLogo + "...", 0, "GetMovieLogo" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kLogo + "...", 0, "GetTVShowLogo" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImagePoster()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kPoster, 2, "GetMoviePoster" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kPoster, 2, "GetTVShowPoster" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImageSeason(Mode as String = "Poster", Season as Integer = - 1)
		  
		  Select Case Mode
		    
		  Case "Poster"
		    dlgProgress.SpecialSeason( TVAttr.ID_TVDB, TVAttr.Title, Season, "SeasonPoster" )
		    
		  Case "Fanart"
		    dlgProgress.SpecialSeason( TVAttr.ID_TVDB, TVAttr.Title, Season, "SeasonFanart" )
		    
		  Case "Banner"
		    dlgProgress.SpecialSeason( TVAttr.ID_TVDB, TVAttr.Title, Season, "SeasonBanner" )
		    
		  Case "Thumb"
		    dlgProgress.SpecialSeason( TVAttr.ID_TVDB, TVAttr.Title, Season, "SeasonThumb" )
		    
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImagesExtraBackdrops()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kExtraFanarts, 0, "GetMovieExtraFanart" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kExtraFanarts, 0, "GetTVShowExtraFanart" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImagesExtraThumbs()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kExtraThumbs, 0, "GetMovieExtraThumbs" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kExtraThumbs, 0, "GetTVShowExtraThumbs" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetImageThumb()
		  If ActiveListbox.RowTag( ActiveListbox.ListIndex ) = "Folder" Then Return
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kThumb + "...", 0, "GetMovieThumb" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kThumb + "...", 0, "GetTVShowThumb" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetLatestEpisode(ShowTitle as String, Episode as String, Mode as String)
		  Dim URL as String
		  ShowTitle = ShowTitle.ReplaceAll("&","")
		  ShowTitle = ShowTitle.ReplaceAll("(","")
		  ShowTitle = ShowTitle.ReplaceAll(")","")
		  
		  Select Case Mode
		    
		  Case "TPB"
		    URL = "https://thepiratebay.org/search/" + ShowTitle + " " + Episode + " " + "720p" + "/0/99/0"
		    
		  Case "KAT"
		    URL = "http://kat.cr/search/" + ShowTitle + " " + Episode + " 720p" + "/"
		    
		  Case "META"
		    URL = "http://metasearch.torrentproject.com/" + chr( 35 ) + "!search=" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p"
		    
		  Case "TOR"
		    URL = "http://torrentz.eu/search?f=" + ShowTitle + " " + Episode + " 720p"
		    
		  Case "LIME"
		    URL = "https://www.limetorrents.cc/search/all/" + ShowTitle.ReplaceAll(" ", "-") + "-" + Episode + "-720p" + "/"
		    
		  Case "REACTOR"
		    URL = "https://torrentreactor.com/torrents-search/" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p"
		    
		  Case "LEETX"
		    URL = "http://www.1337x.to/search" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p" + "/1/"
		    
		  Case "EXTRAT"
		    URL = "http://extratorrent.cc/search/?search=" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p" + "&new=1&x=0&y=0"
		    
		  Case "RARBG"
		    URL = "https://rarbg.to/torrents.php?search=" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p"
		    
		  case "EZTV"
		    URL = "https://eztv.ag/search/" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p"
		    
		  case "HOUND"
		    URL = "http://www.torrenthound.com/search/" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p"
		    
		  case "TORDL"
		    URL = "https://www.torrentdownloads.me/search/?search=" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p"
		    
		  Case "SNOOP"
		    URL = "https://bitsnoop.com/search/all/" + ShowTitle.ReplaceAll( " ", "+" ) + "+" + Episode + "+720p" + "/c/d/1/"
		    
		  Case "LOCK"
		    URL = "https://www.torlock.com/all/torrents/" + ShowTitle.ReplaceAll( " ", "-" ) + "-" + Episode + "-720p" + ".html"
		    
		  End Select
		  
		  ShowURL URL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetMovieTrailer()
		  Dim ID as String = MovieAttr.ID_IMDB
		  If ID = "" Then ID = MovieAttr.ID_TMDB
		  
		  'If FindTrailerItem( MovieAttr.FolderParent ) <> Nil And _
		  'MsgDlg( Nil, 1, Loc.msgTrailerExists, Loc.kCantBeUndone, Loc.dlgCancel, Loc.dlgReplace ) = 1 Then
		  ''DownloadInterupted( URL )
		  ''MessageBox "No way hosey"
		  'Return
		  'End If
		  
		  If ActiveSection = 0 And ID <> "" Then
		    dlgProgress.Start( Loc.kDownloading + ":", Loc.kTrailer + "...", 0, "GetTrailer" )
		  Else
		    MessageBox Loc.msgNoTrailer
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetThemeSong()
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", Loc.kThemeSongs + "...", 0, "GetTVThemeSongs" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ManualSearch()
		  If ActiveListbox.ListIndex > -1 And ActiveListbox.RowTag( ActiveListbox.ListIndex ) <> "Folder" Then
		    wndSearch.Show
		    'wndSearch.ccSearchBox.srchField.StringValue = CurrentItemName
		    'wndSearch.ccSearchBox.edtSearch.SelectAll
		    wndSearch.ccSearchBox.srchField.StringValue = CurrentItemName
		    wndSearch.ccSearchBox.srchField.SelectAll
		    'wndSearch.ccSearchBox.Search
		    Return
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MarkAsFavorite()
		  If ActiveSection = 0 Then
		    
		    If MovieAttr.Tags <> Nil Then
		      For i as Integer = 0 to MovieAttr.Tags.Ubound
		        If MovieAttr.Tags(i) = Loc.kFavorite Then
		          MovieAttr.Tags.Remove(i)
		          If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		          Return
		        End If
		      Next
		    End If
		    
		    MovieAttr.Tags.Append Loc.kFavorite
		    If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		    wndMain.lstMovies.UpdateRow
		    wndMain.lstMovies.SortList
		    
		    
		  ElseIf ActiveSection = 1 Then
		    
		    If TVAttr.Tags <> Nil Then
		      For i as Integer = 0 to TVAttr.Tags.Ubound
		        If TVAttr.Tags(i) = Loc.kFavorite Then
		          TVAttr.Tags.Remove(i)
		          If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then TVAttr.NFOWrite( TVAttr.FolderParent )
		          Return
		        End If
		      Next
		    End If
		    
		    TVAttr.Tags.Append Loc.kFavorite
		    If TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then TVAttr.NFOWrite( TVAttr.FolderParent )
		    wndMain.lstTVShows.UpdateRow
		    wndMain.lstTVShows.SortList
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MarkAsLocked()
		  If ActiveSection = 0 Then
		    If MovieAttr.FolderParent = Nil OR FindNFOFile( MovieAttr.FolderParent ) = Nil Then Return
		    MovieAttr.Locked = NOT MovieAttr.Locked
		    MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		    wndMain.lstMovies.UpdateRow
		    
		  ElseIf ActiveSection = 1 Then
		    If TVAttr.FolderParent = Nil OR FindNFOFile( TVAttr.FolderParent ) = Nil Then Return
		    TVAttr.Locked = NOT TVAttr.Locked
		    TVAttr.NFOWrite( TVAttr.FolderParent )
		    wndMain.lstTVShows.UpdateRow
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MarkAsWatched()
		  If ActiveSection = 0 Then
		    MovieAttr.StatusWatched = NOT MovieAttr.StatusWatched
		    If MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then MovieAttr.NFOWrite( MovieAttr.DestinationNFO( MovieAttr.FolderParent ) )
		    wndMain.lstMovies.UpdateRow
		    wndMain.lstMovies.SortList
		    
		    If MovieAttr.StatusWatched Then
		      TraktTV.MarkMovieAsSeen()
		    Else
		      TraktTV.MarkMovieAsUnseen()
		    End If
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReloadList(Update as Boolean = True)
		  ReloadUpdate = Update
		  
		  If ActiveSection = 0 Then
		    If wndMain.ccSearchBoxMovies.srchField.StringValue <> "" Then wndMain.ccSearchBoxMovies.Reset
		    
		    // Check for movie files in the root directories.
		    Dim Dict as Dictionary = Preferences.Prefs.dictionaryForKey("MoviePaths")
		    Dim Paths() as FolderItem
		    
		    If Dict <> Nil Then
		      For Each Key as Variant in Dict.Keys
		        If Key.StringValue.InStr( 0, ":" ) > 0 Then
		          Paths.Append GetFolderItem( Key )
		        Else
		          If Key <> "" Then Paths.Append GetFolderItem( Key, FolderItem.PathTypeShell )
		        End If
		      Next
		      
		      'Dim CurPath, CurItem as FolderItem
		      For i as Integer = 0 to Paths.Ubound
		        If Paths(i) = Nil OR NOT Paths(i).Exists OR NOT Paths(i).Directory Then Continue
		        
		        For n as Integer = 1 to Paths(i).Count
		          Dim Item as Folderitem = Paths(i).Item(n)
		          If Item = Nil OR NOT Item.Exists OR Item.Directory OR NOT Item.Visible OR Item.Name.Left(1) = "." Then Continue
		          
		          If Item <> Nil And Item.Exists And Item.Type = "video/any" Then
		            
		            Select Case MsgDlg( nil, 1, Loc.msgPutMoviesIntoFoldersTitle, Loc.msgPutMoviesIntoFolders, Loc.dlgYes, Loc.dlgNo, Loc.dlgCancel )
		            Case 1
		              MassMovies2Folders( wndMain.lstMovies, False )
		            Case 3
		              Return
		            End Select
		            
		            Exit
		          End If
		        Next
		        
		      Next
		    End If
		    
		    // Actually reload the movies
		    dlgProgress.Start( Loc.Refresh, "", 0, "ReloadMovies" )
		    
		    wndMain.ActBar( ActiveSection ).TextValue( Str( wndMain.lstMovies.ListCount ) + " " + SectionName )
		  ElseIf ActiveListbox = wndMain.lstTVShows Then
		    If wndMain.ccSearchBoxTVShows.srchField.StringValue <> "" Then wndMain.ccSearchBoxTVShows.Reset
		    dlgProgress.Start( Loc.Refresh, "", 0, "ReloadTVShows" )
		    
		    wndMain.ActBar( ActiveSection ).TextValue( Str( wndMain.lstTVShadow.ListCount ) + " " + SectionName )
		  End If
		  
		  Exception err as NilObjectException
		    if AppSettings.HandleError( err, "NilObjectException (caught at ReloadList)" ) then
		      
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RenameAll()
		  Dim FoldersOrFiles as String = Loc.kFolders.Lowercase
		  If Preferences.Prefs.integerForKey("BatchRename") = 1 Then FoldersOrFiles = Loc.kFoldersandFiles.Lowercase
		  // Check to see weather the user will go trough with this.
		  If MsgDlg( wndMain, 1, Loc.msgMassRename.ReplaceAll( "%F", FoldersOrFiles ), Loc.kCantBeUndone, Loc.dlgRename, Loc.dlgCancel ) = 2 Then Return
		  
		  
		  Dim ScrapedItems as Integer = 0
		  dim lstbox as listbox = ActiveListbox
		  if lstbox = wndMain.lstTVShows then lstbox = wndMain.lstTVShadow
		  For i as Integer = 0 to lstbox.ListCount - 1
		    If lstbox.Cell(i, 2) <> "" Then ScrapedItems = ScrapedItems + 1
		  Next
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Menu.ToolsBatchRenaming + ":", SectionName, ScrapedItems, "BatchRenameMovies" )
		  If ActiveSection = 1 Then dlgProgress.Start( Menu.ToolsBatchRenaming + ":", SectionName, ScrapedItems, "BatchRenameTVShows" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RenameSelection()
		  If ActiveSection = 0 Then SingleRenamer( MovieAttr.FolderParent )
		  If ActiveSection = 1 Then SingleRenamer( TVAttr.FolderParent )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShareOn(Service as String = "Facebook")
		  Dim URL, Message as String
		  
		  If ActiveSection = 0 Then
		    
		    If MovieAttr.ID_TMDB <> "" Then
		      URL = "http://www.themoviedb.org/movie/" + MovieAttr.ID_TMDB
		    ElseIf MovieAttr.ID_IMDB <> "" Then
		      URL = "http://imdb.com/title/" + MovieAttr.ID_IMDB
		    End If
		    
		    If MovieAttr.Title <> "" Then
		      If MovieAttr.DateYear > -1 Then Message = MovieAttr.Title + " (" + Str( MovieAttr.DateYear ) + ")" Else Message = MovieAttr.Title
		    End If
		    
		  ElseIf ActiveSection = 1 Then
		    
		    If TVAttr.ID_TVDB <> "" Then
		      URL = "http://thetvdb.com/?tab=series%26id=" + TVAttr.ID_TVDB
		    ElseIf TVAttr.ID_IMDb <> "" Then
		      URL = "http://www.imdb.com/title/" + TVAttr.ID_IMDb
		    End If
		    
		    If TVAttr.Title <> "" Then
		      Message = TVAttr.Title
		    End If
		    
		  End If
		  
		  
		  If Message <> "" And URL <> "" Then
		    If Service = "Facebook" Then ShareFaceBookLink URL, Message + " #ViMediaManager"
		    If Service = "Twitter"  Then ShareTweet Message + " " + URL + " #ViMediaManager"
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowInFinder()
		  If ActiveSection = 0 And MovieAttr.FolderParent <> Nil And MovieAttr.FolderParent.Exists Then MovieAttr.FolderParent.RevealInFinder()
		  If ActiveSection = 1 And TVAttr.FolderParent <> Nil And TVAttr.FolderParent.Exists Then TVAttr.FolderParent.RevealInFinder()
		  'wndMain.lstTVShadow.ListIndex > -1 And wndMain.lstTVShows.RowTag( wndMain.lstTVShows.ListIndex ) <> "Folder" And TVAttr.FolderParent <> Nil ANd TVAttr.FolderParent.Exists Then TVAttr.FolderParent.RevealInFinder()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowListingGoogle()
		  If ActiveSection = 0 Then
		    
		    If MovieAttr.Title <> "" And MovieAttr.DateYear > -1 Then
		      ShowURL "http://www.google.com/search?q=" + MovieAttr.Title + " (" + Str( MovieAttr.DateYear ) + ")"
		    ElseIf MovieAttr.Title <> "" Then
		      ShowURL "http://www.google.com/search?q=" + MovieAttr.Title
		    End If
		    
		  ElseIf ActiveSection = 1 Then
		    
		    If TVAttr.Title <> "" And TVAttr.DateYear > -1 Then
		      ShowURL "http://www.google.com/search?q=" + TVAttr.Title + " (" + Str( TVAttr.DateYear ) + ")"
		    ElseIf TVAttr.Title <> "" Then
		      ShowURL "http://www.google.com/search?q=" + TVAttr.Title
		    End If
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowListingIMDb()
		  If ActiveSection = 0 And MovieAttr.ID_IMDB <> "" Then ShowURL "http://www.imdb.com/title/" + MovieAttr.ID_IMDB
		  If ActiveSection = 1 And TVAttr.ID_IMDb    <> "" Then ShowURL "http://www.imdb.com/title/" + TVAttr.ID_IMDB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowListingTMDB()
		  If MovieAttr.ID_TMDB <> "" Then ShowURL "http://www.themoviedb.org/movie/" + MovieAttr.ID_TMDB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowListingTVDB()
		  If TVAttr.ID_TVDB <> "" Then ShowURL "http://thetvdb.com/?tab=series&id=" + TVAttr.ID_TVDB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowListingWiki()
		  
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage").NthField("-",1)
		  if lang = "" then lang = "en"
		  
		  Dim Title as String
		  If ActiveSection = 0 Then
		    Title = MovieAttr.TitleOriginal
		    'If Lang <> "en" Then Title = MovieAttr.TitleOriginal
		  ElseIf ActiveSection = 1 Then
		    Title = TVAttr.TitleOriginal
		  End If
		  
		  'ShowURL "http://wikipedia.org/wiki/Special:Search?search=" + Title.ReplaceAll(" ", "_")', encodings.ASCII ) 'String2Entities( Title )
		  'dim s as string = "http://wikipedia.org/search-redirect.php?family=wikipedia&search=" + ConvertEncoding( Title.ReplaceAll(" ", "+"), encodings.ASCII ) + "&language=" + lang + "&go=Go"
		  ShowURL "http://wikipedia.org/search-redirect.php?family=wikipedia&search=" + ConvertEncoding( Title.ReplaceAll(" ", "+"), encodings.ASCII ) + "&language=" + lang + "&go=Go"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowSearchResult(ID as String, DBID as String, Title as String, ReleaseDate as String, PosterURL as String, FanartURL as String, BannerURL as String)
		  
		  wndSearch.Show
		  wndSearch.lstResults.DeleteAllRows
		  
		  
		  Dim DisplayTitle as String = Title
		  If ActiveSection = 0 And ReleaseDate <> "" And ReleaseDate <> "False" Then DisplayTitle = Title + " (" + ReleaseDate.Right(4) + ")"
		  
		  // :0 Display Title / :1 IMDb / :2 Database ID / :3 Original Title / :4 ReleaseDate / :5 PosterURL / :6 FanartURL / :7 BannerURL
		  wndSearch.lstResults.AddRow DisplayTitle, ID, DBID, Title, ReleaseDate, PosterURL, FanartURL, BannerURL
		  
		  
		  'wndSearch.ccSearchBox.srchField.StringValue = CurrentItemName
		  'wndSearch.ccSearchBox.edtSearch.SelectAll
		  wndSearch.lstResults.ListIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowSearchResults(ID() as String, DBID() as String, Title() as String, ReleaseDate() as String, PosterURL() as String = Nil, FanartURL() as String = Nil, BannerURL() as String = Nil)
		  
		  wndSearch.Show
		  wndSearch.lstResults.DeleteAllRows
		  
		  'wndSearch.ccSearchBox.srchField.StringValue = CurrentItemName
		  'wndSearch.ccSearchBox.edtSearch.SelectAll
		  
		  
		  For i as Integer = 0 to ID.Ubound
		    Dim DisplayTitle as String = Title(i)
		    If ActiveSection = 0 And ReleaseDate(i) <> "" And ReleaseDate(i) <> "False" Then DisplayTitle = Title(i) + " (" + ReleaseDate(i).Left(4) + ")"
		    
		    Dim tmpPosterURL, tmpFanartURL, tmpBannerURL, tmpDBID as String = ""
		    If DBID      <> Nil And DBID.Ubound      >= i Then tmpDBID = DBID(i)
		    If PosterURL <> Nil And PosterURL.Ubound >= i Then tmpPosterURL = PosterURL(i)
		    If FanartURL <> Nil And FanartURL.Ubound >= i Then tmpFanartURL = FanartURL(i)
		    If BannerURL <> Nil And BannerURL.Ubound >= i Then tmpBannerURL = BannerURL(i)
		    
		    // :0 Display Title / :1 IMDb / :2 Database ID / :3 Original Title / :4 ReleaseDate / :5 PosterURL / :6 FanartURL / :7 BannerURL
		    wndSearch.lstResults.AddRow DisplayTitle, ID(i), tmpDBID, Title(i), ReleaseDate(i), tmpPosterURL, tmpFanartURL, tmpBannerURL
		  Next
		  
		  wndSearch.lstResults.ListIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowUnfoundTitles(ActionDescription as String)
		  If UnfoundTitles.Ubound < 0 Then Return
		  
		  Dim w as New wndStatus
		  w.Show
		  w.lstResults.DeleteAllRows
		  'wndStatus.Show
		  'wndStatus.lstResults.DeleteAllRows
		  
		  For i as Integer = 0 to UnfoundTitles.Ubound
		    If UnfoundPaths.Ubound >= i Then
		      w.lstResults.AddRow UnfoundTitles(i)', UnfoundPaths(i).AbsolutePath
		      w.lstResults.RowTag( w.lstResults.LastIndex ) = UnfoundPaths(i)
		    Else
		      w.lstResults.AddRow UnfoundTitles(i)
		    End If
		  Next
		  
		  w.lstResults.Invalidate
		  w.Title = Str( w.lstResults.ListCount ) + " "
		  If ActionDescription <> "" Then
		    
		    If ActionDescription.Contains( "%@" ) Then
		      w.Title = ActionDescription.ReplaceAll( "%@", Str( UnfoundPaths.Ubound + 1 ) ) 'w.lstResults.ListCount ) )
		    Else
		      w.Title = w.Title + ActionDescription
		    End If
		    
		  Else
		    If ActiveSection = 0 Then
		      w.Title = w.Title + Loc.Movies
		    ElseIf ActiveSection = 1 Then
		      w.Title = w.Title + Loc.TVShows
		    End If
		  End If
		  
		  ReDim UnfoundPaths(-1)
		  ReDim UnfoundTitles(-1)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortAscending()
		  
		  If ActiveSection = 0 Then
		    Preferences.Prefs.boolForKey("SortMovieAscending") = True
		  ElseIf ActiveSection = 1 Then
		    Preferences.Prefs.boolForKey("SortTVAscending") = True
		  End If
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByEpisodes()
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 8
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByExtras(Mode as String)
		  
		  
		  Select Case Mode
		    
		  Case "Poster"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 10
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 10
		  Case "Fanart"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 11
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 11
		    
		  Case "Banner"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 12
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 12
		  Case "Logo"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 13
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 14
		  Case "ClearArt"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 14
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 13
		  Case "Landscape"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 15
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 16
		  Case "DiscArt"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 16
		  Case "CharacterArt"
		    'If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") =
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 17
		    
		  Case "ExtraThumbs"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 17
		  Case "ExtraFanart"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 18
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 19
		    
		    
		  Case "Trailer"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 19
		    
		  Case "Subtitle"
		    If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 20
		    
		  Case "Themesong"
		    If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 20
		    
		  End Select
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByNextAired()
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 3
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByPath()
		  If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 2
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV" )   = 2
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByPremiereDate()
		  If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 4
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 7
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByQuality()
		  If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 5
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByRating()
		  If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 6
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV")    = 4
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByRuntime()
		  If ActiveSection = 0  Then Preferences.Prefs.integerForKey("SortByMovie") = 8
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV") = 6
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortBySize()
		  If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 7
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV")    = 5
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByStatus()
		  If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 3
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV")    = 5
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByTitle()
		  If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 0
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV" )   = 0
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortByTitleSort()
		  If ActiveSection = 0 Then Preferences.Prefs.integerForKey("SortByMovie") = 1
		  If ActiveSection = 1 Then Preferences.Prefs.integerForKey("SortByTV" )   = 1
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortDescending()
		  
		  If ActiveSection = 0 Then
		    Preferences.Prefs.boolForKey("SortMovieAscending") = False
		  ElseIf ActiveListbox = wndMain.lstTVShows Then
		    Preferences.Prefs.boolForKey("SortTVAscending") = False
		  End If
		  
		  CheckMenuItems()
		  SortList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SortList()
		  If ActiveSection = 0 Then wndMain.lstMovies.SortList
		  If ActiveSection = 1 Then wndMain.lstTVShows.SortList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateAllEpisodes(OnlyLocalFiles as Boolean = False)
		  Dim ScrapedCount as Integer = 1
		  For i as Integer = 0 to wndMain.lstTVShadow.ListCount - 1
		    If wndMain.lstTVShadow.Cell( i, 2 ) <> "" Then ScrapedCount = ScrapedCount + 1
		  Next
		  
		  Dim Mode as String = "UpdateAllEpisodes"
		  If OnlyLocalFiles Then Mode = "UpdateLocalEpisodes"
		  
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kEpisodes + " " + Loc.mTabInfo.Lowercase + "...", ScrapedCount, Mode )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateAllImages()
		  Dim Scrapeditems as Integer = 1
		  For i as Integer = 0 to ActiveListbox.ListCount - 1
		    If ActiveListbox.Cell(i, 2) <> "" Then Scrapeditems = Scrapeditems + 1
		  Next
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kImages.Titlecase + "...", Scrapeditems, "UpdateAllMovieImages" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kImages.Titlecase + "...", Scrapeditems, "UpdateAllTVShowImages" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateAllRatings()
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", Loc.mRating.ReplaceAll( ":", "" ) + "...", 0, "UpdateAllMovieRatings" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", Loc.mRating.ReplaceAll( ":", "" ) + "...", 0, "UpdateAllTVShowRatings" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateAllShowStatus()
		  Dim ScrapedCount as Integer = 1
		  For i as Integer = 0 to wndMain.lstTVShadow.ListCount - 1
		    If wndMain.lstTVShadow.Cell( i, 2 ) <> "" Then ScrapedCount = ScrapedCount + 1
		  Next
		  
		  dlgProgress.Start( Loc.kDownloading + ":", Loc.kStatus.ReplaceAll( ":", "" ) + "...", ScrapedCount, "UpdateAllTVShowStatus" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateEpisodes()
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", TVAttr.Title + " " + Loc.kEpisodes.Lowercase + " " + Loc.mTabInfo.Lowercase + "...", 2, "UpdateEpisodes" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateMetadata()
		  If MsgDlg( wndMain, 1, _
		  Loc.msgUpdate.ReplaceAll( "%F", SectionName.Lowercase ), _
		  Loc.msgWhatWillBeUpdated.ReplaceAll( "%F", SectionName.Lowercase ), _
		  Loc.dlgOK, Loc.dlgCancel ) = 2 Then Return
		  
		  Dim ScrapedItems as Integer = 1
		  For i as Integer = 0 to ActiveListbox.ListCount - 1
		    If ActiveListbox.Cell(i, 2) <> "" Then ScrapedItems = ScrapedItems + 1
		  Next
		  
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.mTabInfo + "...", ScrapedItems, "UpdateAllMovies" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.mTabInfo + "...", ScrapedItems, "UpdateAllTVShows" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateSingleImages()
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kImages.Titlecase + "...", 11, "UpdateSingleMovieImages" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", Loc.kImages.Titlecase + "...", 11, "UpdateSingleTVShowImages" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateSingleItem()
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kUpdating + ":", CurrentItemName + "...", 4, "UpdateSingleMovie" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kUpdating + ":", CurrentItemName + "...", 4, "UpdateSingleTVShow" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateSingleRating()
		  If ActiveSection = 0 Then dlgProgress.Start( Loc.kSearching + ":", CurrentItemName + " " + Loc.mRating.ReplaceAll(":", "..."), 4, "UpdateSingleMovieRating" )
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kSearching + ":", CurrentItemName + " " + Loc.mRating.ReplaceAll(":", "..."), 4, "UpdateSingleTVShowRating" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateSingleTVShowStatus()
		  If ActiveSection = 1 Then dlgProgress.Start( Loc.kDownloading + ":", CurrentItemName + " " + Loc.kStatus.ReplaceAll( ":", "" ).Lowercase + "...", 2, "UpdateSingleTVShowStatus" )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WatchMovie()
		  Dim MovieFile as FolderItem = FindMovieItem( MovieAttr.FolderParent )
		  If MovieFile <> Nil And MovieFile.Exists Then MovieFile.Launch
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WatchTrailer()
		  If ActiveSection = 0 Then
		    Dim TrailerItem as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		    If TrailerItem <> Nil And TrailerItem.Exists Then TrailerItem.Launch Else MsgBox Loc.msgNoTrailer
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected MassSearch As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ReloadUpdate As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ReturnInput As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SectionName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UnfoundPaths() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UnfoundTitles() As String
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

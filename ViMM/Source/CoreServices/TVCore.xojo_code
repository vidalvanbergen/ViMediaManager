#tag Module
Protected Module TVCore
	#tag Method, Flags = &h0
		Sub EpisodeUpdate(ID as String)
		  
		  If TVAttr.Locked Then
		    MessageBox Loc.kIsLocked.ReplaceAll("%@", TVAttr.Title)
		    Return
		  End If
		  
		  
		  Dim sckt as New TVDBSckt
		  If ID.Left(2) = "tt" Then
		    ID = sckt.IMDb2TVDB( ID )
		  End If
		  
		  Dim ShowName as String = TVAttr.Title
		  If ShowName = "" Then ShowName = TVAttr.FolderParent.Name
		  
		  If ID = "" Then
		    MessageBox loc.msgNoIDTV.ReplaceAll( "%S", ShowName )
		    Return
		  End If
		  
		  Dim TVInfo as String = TVAttr.Title + " " + Loc.kEpisodes + "..."
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TVDB Info] " + TVInfo ) Else dlgProgress.debug( "[TVDB Info] " + TVInfo )
		  
		  
		  If ID.Left(2) <> "tt" Then
		    Dim XMLString as String = DefineEncoding( sckt.Get( TVCore.URL( "Info", ID ), 60 ), Encodings.UTF8 )
		    'XMLString = DecodingFromHTMLMBS( XMLString )
		    sckt.Close
		    
		    if XMLString.Contains("<?xml") and Trim( XMLString ).Right(7).Lowercase = "</data>" then
		      sckt.ProcessEpisodes XMLString
		    else
		      log "Invalid XML File for " + ID
		    end if
		    
		    XMLString = ""
		  End If
		  
		  If NOT CommonCore.MassSearch Then wndMain.lstTVShows.UpdateRow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetThemeSong(Title as String, GetFirst as Boolean = True)
		  If Trim( Title ) = "" Then Return
		  Dim Sckt as New TVDBSckt
		  
		  // Normalize Title
		  Title = Trim( RegExThis( Title, "\(.*?\)" ) )
		  Title = Title.ReplaceAll("'", "")
		  If Title.Left(4) = "The " Then Title = Title.Replace( "The ","")
		  If Title.Left(2) = "A "   Then Title = Title.Replace( "A ", "" )
		  Title = Title.ReplaceAll( "&", " and " )
		  
		  // Set starting positions
		  Dim Page as Integer = 1
		  Dim URLs(), Rejects() as String
		  Dim HTML as String = "<b>Next</b>"
		  
		  // Go through the pages.
		  While HTML.InStr( 0, "<b>Next</b>" ) > 0
		    If DebugBuild Then dlgProgress.Debug( Loc.kProcessing + " TV Tunes page " + Str( Page ) )
		    HTML = sckt.Get( "http://www.televisiontunes.com/search.php?searWords=%22" + Title.ReplaceAll( " ", "+" ) + "%22&Send=Search&page=" + Str( Page ), Preferences.Prefs.integerForKey("TimeOut") )
		    Sckt.Close
		    HTML = HTML.MyMid( "<div id=""main"">", "<td colspan=""2"" valign=""top"">" ) '"</table>" )
		    HTML = HTML.ReplaceAll("<a href=""http://www.televisiontunes.com/index.php""><img src=""images/TVGuy-small.png"" alt=""Television Tunes"" border=""0"" /></a>", "" )
		    
		    
		    Dim tmpURLs() as String = match_all( "<a href=""(.*?)"">", HTML )
		    For i as Integer = 0 to tmpURLs.Ubound
		      If tmpURLs(i).InStr( 0, "search.php" ) > 0 Then Continue
		      
		      Dim Split() as String = tmpURLs(i).Split("/")
		      Dim Name as String
		      If Split.Ubound > 0 Then Name = Split( Split.Ubound ).ReplaceAll( "_", " " )
		      If Name.InStr( 0, " (The)" ) > 0 Then Name = "The " + Name.ReplaceAll( " (The)", "" )
		      
		      Rejects.Append "http://www.televisiontunes.com/themesongs/" + Name.ReplaceAll(".html",".mp3").ReplaceAll(" ","%20")
		      'If Name.NthField( " - ", 1 ).InStr( 0, Title ) = 0 Then Continue
		      
		      // Don't pass Start, go directly to MP3.
		      URLs.Append "http://www.televisiontunes.com/themesongs/" + Name.ReplaceAll(".html",".mp3").ReplaceAll(" ","%20")
		    Next
		    
		    If HTML.InStr( 0, "<b>Next</b>" ) > 0 Then
		      Page = Page + 1
		    Else
		      Exit
		    End If
		    
		  Wend
		  'URLs.SortWith
		  
		  'If DebugBuild Then dlgProgress.Debug ""
		  
		  // Download first theme.
		  If URLs.Ubound > -1 And GetFirst Then
		    TVAttr.ThemeSongs = URLs
		    
		    Dim tmpTheme as FolderItem = SpecialFolder.Temporary.Child( App.Identifier ).Child("theme.mp3")
		    
		    If sckt.Get( URLs(0), tmpTheme, 800 ) Then
		      If tmpTheme <> Nil And tmpTheme.Exists Then tmpTheme.MoveFileTo( TVAttr.FolderParent.Child("theme.mp3") )
		    Else
		      'MessageBox "Theme download failed!"
		    End If
		    
		    Return
		    
		  ElseIf URLs.Ubound > -1 And NOT GetFirst Then
		    
		    wndItemChooser.Show
		    If TVAttr.FolderParent.Child("theme.mp3").Exists Then
		      wndItemChooser.lstResults.AddRow( "Local " + Loc.kThemeSong.Lowercase )
		      wndItemChooser.lstResults.RowTag( 0 ) = TVAttr.FolderParent.Child( "theme.mp3" )
		    End If
		    
		    For i as Integer = 0 to URLs.Ubound
		      Dim Split() as String = URLs(i).Split("/")
		      Dim Name as String = Trim( Split( Split.Ubound ).ReplaceAll(".mp3","").ReplaceAll("%20"," ") )
		      
		      If Name.NthField( "-", 2 ) <> "" Then
		        Name = Name.ReplaceAll( " - ", " / " )
		        Name = Name.ReplaceAll( "- ", " / " )
		        
		        If Name.Left( Title.Len + 3 ) = Title + " / " Then Name = Name.Replace( Title + " / ", "" )
		        wndItemChooser.lstResults.AddRow( Trim( Name ) )
		      Else
		        wndItemChooser.lstResults.AddRow( Trim( Name ) )
		      End If
		      wndItemChooser.lstResults.RowTag( wndItemChooser.lstResults.ListCount -1 ) = URLs(i)
		    Next
		    
		    If wndItemChooser.lstResults.ListCount > 0 Then wndItemChooser.lstResults.ListIndex = 0
		    
		  ElseIf NOT GetFirst Then
		    MessageBox Loc.kCouldNotBeFound.ReplaceAll( "%S", Loc.kThemeSongs )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MissingShows()
		  Dim sckt as New TVDBSckt
		  sckt.Yield = True
		  CommonCore.MassSearch = True
		  ReDim CommonCore.UnFoundTitles(-1)
		  ReDim CommonCore.UnfoundPaths(-1)
		  
		  Dim LstBox as Listbox = wndMain.lstTVShadow
		  
		  For i as Integer = 0 to LstBox.ListCount - 1
		    
		    // If scraped before, skip it!
		    If LstBox.Cell( i, 2 ) <> "" Then Continue
		    
		    // If TVAttr.FolderParent does not exist, Skip it!
		    TVAttr.FolderParent = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Continue
		    
		    Dim ShowTitle as String = TVAttr.FolderParent.Name
		    
		    // Search for show
		    dlgProgress.Add( Loc.kSearching + ":", ShowTitle + "..." )
		    Dim XMLString as String = DefineEncoding( Sckt.Get( URL( "Search", ShowTitle.ReplaceAll( " - ", " " ) ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    Sckt.Close
		    Dim SearchResults as New JSONItem
		    SearchResults = XMLString.XML2JSON
		    'JSONString = JSONString.XML2JSON.ToString
		    
		    // If Invalid JSON, Skip it!
		    If SearchResults = Nil Then 'NOT JSONString.ValidJSON( "TVDB" ) Then
		      
		      'If NOT nc.Available Then
		      'If NOT Growl.Notify( Loc.FetchAllMetadata + ":", Loc.kCouldNotBeFound.ReplaceAll( "%s", ShowTitle ) ) Then
		      '// NOT Growling!
		      'End If
		      'Else
		      nc.Message Loc.kCouldNotBeFound.ReplaceAll( "%s", ShowTitle )
		      'End If
		      
		      CommonCore.UnFoundTitles.Append ShowTitle + chr(13) + "Invalid JSON returned from Server."' + chr(13) + TVAttr.FolderParent.ShellPath.ReplaceAll("\","") + JSONString
		      CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		      Continue
		    End If
		    
		    
		    // Get ID if available.
		    Dim ID as String
		    'SearchResults.Load( JSONString )
		    
		    Dim MultipleResults as Boolean
		    
		    If SearchResults <> Nil And SearchResults.HasName("Data") And SearchResults.ToString.InStr( 0, "Series" ) > 0 And SearchResults.Child("Data").HasName("Series") Then
		      
		      If SearchResults.Child("Data").Child("Series").IsArray And SearchResults.Child("Data").Child("Series").Count >= 1 Then
		        
		        // Should I allow scrape if there's more then one result? TVDB is a bit unreliable.
		        Dim IDs() as String
		        For n as Integer = 0 to SearchResults.Child("Data").Child("Series").Count -1
		          Dim CurrentID as String = SearchResults.Child("Data").Child("Series").Child(n).Value("seriesid")
		          
		          If IDs = Nil OR IDs.Ubound < 0 Then
		            IDs.Append CurrentID
		          Else
		            Dim b as Boolean = False
		            For t as Integer = 0 to IDs.Ubound
		              If IDs(t) = CurrentID Then
		                b = True
		                Exit
		              End If
		            Next
		            
		            If NOT b Then IDs.Append CurrentID
		            
		          End If
		        Next
		        MultipleResults = ( IDs.Ubound >= 1 )
		        
		        If SearchResults.Child("Data").Child("Series").Child(0).HasName("seriesid") Then ID = SearchResults.Child("Data").Child("Series").Child(0).Value("seriesid")
		      Else
		        If SearchResults.Child("Data").Child("Series").HasName("seriesid") Then ID = SearchResults.Child("Data").Child("Series").Value("seriesid")
		      End If
		      
		    End If
		    
		    // If there's no ID available, Skip it!
		    If ID = "" Then
		      'If Not nc.Available Then
		      'If NOT Growl.Notify( Loc.FetchAllMetadata + ":", Loc.kCouldNotBeFound.ReplaceAll( "%s", ShowTitle ) ) Then
		      '
		      'End If
		      'Else
		      nc.Message Loc.kCouldNotBeFound.ReplaceAll( "%s", ShowTitle )
		      'End If
		      
		      CommonCore.UnfoundTitles.Append Loc.kCouldNotBeFound.ReplaceAll( "%s", ShowTitle )
		      CommonCore.UnfoundPaths.Append  TVAttr.FolderParent
		      Continue
		    End If
		    
		    If NOT MultipleResults Then ShowByID( ID )
		    
		    If Preferences.Prefs.boolForKey("AutoManageMedia") Then
		      SingleRenamer TVAttr.FolderParent, i, True
		    Else
		      wndMain.lstTVShows.UpdateRow i, Nil, True
		    End If
		    
		    If MultipleResults And SearchResults <> Nil And SearchResults.HasName("Data") And SearchResults.Child("Data").HasName("Series") And SearchResults.Child("Data").Child("Series").IsArray Then 'And SearchResults <> Nil And SearchResults.Child("Data").Child("Series").HasName("SeriesName") Then
		      Dim jItem as New JSONItem
		      jItem = SearchResults.Child("Data").Child("Series").Child(0)
		      
		      If jItem.HasName("SeriesName") Then
		        If jItem.HasName("FirstAired") Then
		          CommonCore.UnfoundTitles.Append TVAttr.FolderParent.Name + chr(13) + Loc.kMultipleResultsFoundTV
		        Else
		          CommonCore.UnfoundTitles.Append TVAttr.FolderParent.Name + chr(13) + Loc.kMultipleResultsFoundTV
		        End If
		      End If
		      CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		    End If
		    
		  Next
		  
		  CommonCore.MassSearch = False
		  wndMain.lstTVShows.SortList
		  wndMain.lstTVShows.ResetFolderStatus
		  
		  MessageBox Loc.kDownloadComplete
		  
		  CommonCore.ShowUnfoundTitles( Loc.kCouldNotBeFoundFollowing.ReplaceAll( "%S", Loc.TVShows.Lowercase ) )
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowArt(ID as String, Mode as String, Season as Integer = - 1)
		  If ID = "" Then Return
		  
		  Dim SeasonStr as String = "All"
		  If Season > -1 Then
		    SeasonStr = Str( Season )
		  End If
		  
		  Dim Sckt as New TVDBSckt
		  Dim JSONString as String
		  
		  Dim bTVDB as Boolean = False
		  bTVDB = ( Mode = "Banners" OR Mode = "Posters" OR Mode = "Backdrops" OR Mode = "SeasonPoster" OR Mode = "SeasonBanner" )
		  
		  Dim bFanartTV as Boolean = False
		  bFanartTV = ( Mode = "Banners" OR Mode = "Posters" OR Mode = "Backdrops" OR Mode = "ClearArt" OR Mode = "Logos" OR Mode = "CharacterArt" OR Mode = "Thumbs" OR Mode = "SeasonThumb" OR Mode = "SeasonFanart" )
		  
		  // ## TVDB Alias
		  dlgProgress.Add( Loc.kDownloading + ":", Loc.kImages + " " + Loc.mTabInfo + "..." )
		  If bTVDB And ID.Left(2) = "tt" Then ID = Sckt.IMDb2TVDB( ID )
		  
		  Dim Type as String // User friendly type
		  
		  // ## TVDBArt
		  Dim TVDBArt as New JSONItem
		  If bTVDB And ID.Left(2) <> "tt" Then
		    dlgProgress.Add( Loc.kDownloading + ":", "TVDB" + " " + Loc.kImages + " " + Loc.mTabInfo + "..." )
		    JSONString = DefineEncoding( Sckt.Get( TVCore.URL( "Art", ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    Sckt.Close
		    
		    TVDBArt = JSONString.XML2JSON
		    if TVDBArt = Nil then
		      Break
		    elseIf TVDBArt.HasName("Banners") And TVDBArt.ToString.InStr("""Banner""") > 0 And TVDBArt.Child("Banners").HasName("Banner") Then
		      TVDBArt = TVDBArt.Child("Banners").Child("Banner")
		    End If
		    JSONString = ""
		  End If
		  
		  
		  // ## FanartTV
		  Dim FanartTV as New JSONItem
		  If bFanartTV Then
		    dlgProgress.Add( Loc.kDownloading + ":", "Fanart.TV" + " " + Loc.kImages + " " + Loc.mTabInfo + "..." )
		    JSONString = Trim( DefineEncoding( Sckt.Get( URLCore.FanartTV( ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		    Sckt.Close
		    
		    'Dim FirstBracketLoc as Integer' = JSONString.InStr(2, "{" )
		    'JSONString = Trim( JSONString.Right( JSONString.Len - FirstBracketLoc + 1) )
		    If JSONString.ValidJSON("Fanart.TV") Then FanartTV.Load JSONString
		    JSONString = ""
		  End If
		  
		  Dim IMGArray() as Picture, Dimensions(), URLs(), ThumbURLs() as String
		  Dim jItem as New JSONItem
		  
		  
		  // Get URLs and dimensions
		  
		  If TVDBArt <> Nil And NOT TVDBArt.IsArray Then
		    Dim jt as New JSONItem
		    jt.Append( TVDBArt )
		    TVDBArt = jt
		  End If
		  
		  // TVDB
		  If TVDBArt <> Nil And TVDBArt.IsArray Then
		    For i as Integer = 0 to TVDBArt.Count -1
		      jItem = TVDBArt.Child(i)
		      
		      If NOT jItem.HasName("BannerPath") OR jItem.Value("BannerPath") = "" Then Continue
		      
		      If ( jItem.Value( "BannerType" ) = "poster" And Mode = "Posters" ) OR _
		        jItem.Value( "BannerType" ) = "fanart" And Mode = "Backdrops" OR _ '( Mode = "TV-Backdrops" OR Mode = "SeasonFanart" ) OR _
		        ( jItem.Value( "BannerType" ) = "series" And Mode = "Banners" ) OR _
		        ( jItem.Value( "BannerType" ) = "season" And jItem.Value("BannerType2") = "season" And Mode = "SeasonPoster" ) OR _
		        ( jItem.Value( "BannerType" ) = "season" and jItem.Value("BannerType2") = "seasonwide" And Mode = "SeasonBanner" ) _
		        Then
		        
		        Dim Cache as String = ""
		        If Mode.InStr( 0, "backdrop" ) > 0 OR Mode.InStr( 0, "poster" ) > 0 Then Cache = "_cache/"
		        
		        If Mode.InStr( 0, "Season" ) > 0 Then 'And Mode.InStr( 0, "SeasonFanart" ) = 0 Then
		          If jItem.HasName("Season") And jItem.Value("Season") = SeasonStr Then
		            ThumbURLs.Append   TVCore.GraphicsPath + Cache + jItem.Value("BannerPath")
		            Dimensions.Append  jItem.Value("BannerType2")
		            URLs.Append        TVCore.GraphicsPath + jItem.Value("BannerPath")
		          End If
		        Else
		          ThumbURLs.Append   TVCore.GraphicsPath + Cache + jItem.Value("BannerPath")
		          Dimensions.Append  jItem.Value("BannerType2")
		          URLs.Append        TVCore.GraphicsPath + jItem.Value("BannerPath")
		        End If
		        
		      End If
		      
		    Next
		    
		  End If
		  
		  
		  Dim SeasonName as String
		  jItem = Nil
		  
		  Select Case Mode
		    
		  Case "Posters"
		    Type = Loc.kPoster
		    
		    if FanartTV <> Nil and FanartTV.HasName("tvposter") then
		      jItem = FanartTV.Child("tvposter")
		      
		      for i as Integer = 0 to jItem.Count -1
		        if jItem.Child(i).Lookup("url", "" ) <> "" then
		          URLs.Append jItem.Child(i).Value("url")
		          Dimensions.Append "1000x1426"
		          ThumbURLs.Append Replace( jItem.Child(i).Value("url"), "/fanart/", "/preview/" )
		        end if
		      next
		    end if
		    
		    // If only one is available, and no locals exist.
		    If URLs.Ubound = 0 And NOT TVAttr.FolderParent.Child("poster.jpg").Exists Then
		      TVAttr.ART_Poster = URL2Picture( URLs(0), TVAttr.FolderParent, "poster.jpg" ) 'URL2Picture( URLs(0), "poster", "jpg", TVAttr.FolderParent )
		      CacheImageSet( TVAttr.ART_Poster, TVAttr.ID_IMDb + ".television.poster.jpg" )
		      wndMain.cvsTVShowDetails.Reload
		      Return
		    End If
		    
		  Case "Backdrops"
		    Type = Loc.kFanart
		    
		    // fanarttv
		    if FanartTV <> Nil and FanartTV.HasName("showbackground") Then
		      jItem = FanartTV.Child("showbackground")
		      
		      for i as Integer = 0 to jItem.Count -1
		        if jItem.Child(i).Lookup("url", "") <> "" then
		          urls.Append jItem.Child(i).Value("url")
		          Dimensions.Append "1920x1080"
		          ThumbURLs.Append Replace( jItem.Child(i).Value("url"), "/fanart/", "/preview/" )
		        end if // @END if jItem.Child(i).Value("url") <> ""
		      next // @END each jItem.Child
		      
		    end if // @END FanartTV <> Nil
		    
		    
		    // If only one is available, and no locals exist.
		    If URLs.Ubound = 0 And NOT TVAttr.FolderParent.Child("fanart.jpg").Exists Then
		      TVAttr.ART_Fanart = URL2Picture( URLs(0), TVAttr.FolderParent, "fanart.jpg" ) 'URL2Picture( URLs(0), "fanart", "jpg", TVAttr.FolderParent )
		      CacheImageSet( TVAttr.ART_Fanart, TVAttr.ID_IMDb + ".television.fanart.jpg" )
		      wndMain.cvsTVShowDetails.Reload
		      Return
		    End If
		    
		  Case "Banners"
		    Type = Loc.kBanner
		    
		    If FanartTV <> Nil ANd FanartTV.HasName("tvbanner") Then
		      jItem = FanartTV.Child("tvbanner")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" Then
		          URLs.Append jItem.Child(i).Value("url")
		          Dimensions.Append "1000x185"
		          ThumbURLs.Append   jItem.Child(i).Value("url")
		          'ThumbURLs.Append Replace( jItem.Child(i).Value("url"), "/fanart/", "/preview/" )
		        End If
		      Next
		      
		    End If
		    
		    // If only one is available, and no locals exist.
		    If URLs.Ubound = 0 And NOT TVAttr.FolderParent.Child("banner.jpg").Exists Then
		      TVAttr.ART_Banner = URL2Picture( URLs(0), TVAttr.FolderParent, "banner.jpg" ) 'URL2Picture( URLs(0), "banner", "jpg", TVAttr.FolderParent )
		      wndMain.cvsTVShowDetails.Reload
		      Return
		    End If
		    
		  Case "Logos"
		    Type = Loc.kLogo
		    
		    
		    // HDTV Logo URLs
		    If FanartTV <> Nil ANd FanartTV.HasName("hdtvlogo") Then
		      jItem = FanartTV.Child("hdtvlogo")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" Then
		          URLs.Append        jItem.Child(i).Value("url")
		          Dimensions.Append  "800x310"
		          ThumbURLs.Append   jItem.Child(i).Value("url")' + "/preview"
		        End If
		      Next
		      
		    End If
		    
		    // Logo URLs
		    If FanartTV <> Nil ANd FanartTV.HasName("clearlogo") Then
		      jItem = FanartTV.Child("clearlogo")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" Then
		          URLs.Append        jItem.Child(i).Value("url")
		          Dimensions.Append  "400x155"
		          ThumbURLs.Append   jItem.Child(i).Value("url")' + "/preview"
		        End If
		      Next
		      
		    End If
		    
		    
		    
		    // If only one is available, and no locals exist.
		    If URLs.Ubound = 0 And NOT TVAttr.FolderParent.Child("logo.png").Exists Then
		      TVAttr.ART_Logo = URL2Picture( URLs(0), TVAttr.FolderParent, "logo.png" ) 'URL2Picture( URLs(0), "logo", "png", TVAttr.FolderParent )
		      wndMain.cvsTVShowDetails.Reload
		      Return
		    End If
		    
		  Case "ClearArt"
		    Type = Loc.kClearArt
		    
		    // HD ClearArt URLs
		    If FanartTV <> Nil ANd FanartTV.HasName("hdclearart") Then
		      jItem = FanartTV.Child("hdclearart")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" Then
		          URLs.Append        jItem.Child(i).Value("url")
		          Dimensions.Append  "1000x562"
		          ThumbURLs.Append   jItem.Child(i).Value("url")' + "/preview"
		        End If
		      Next
		      
		    End If
		    
		    
		    // ClearArt URLs
		    If FanartTV <> Nil ANd FanartTV.HasName("clearart") Then
		      jItem = FanartTV.Child("clearart")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" Then
		          URLs.Append        jItem.Child(i).Value("url")
		          Dimensions.Append  "500x281"
		          ThumbURLs.Append   jItem.Child(i).Value("url")' + "/preview"
		        End If
		      Next
		      
		    End If
		    
		    
		    // If only one is available, and no locals exist.
		    If URLs.Ubound = 0 And NOT TVAttr.FolderParent.Child("clearart.png").Exists Then
		      TVAttr.ART_ClearArt = URL2Picture( URLs(0), TVAttr.FolderParent, "clearart.png" ) 'URL2Picture( URLs(0), "clearart", "png", TVAttr.FolderParent )
		      wndMain.cvsTVShowDetails.Reload
		      Return
		    End If
		    
		  Case "CharacterArt"
		    Type = Loc.kCharacterArt
		    
		    // CharacterArt URLs
		    If FanartTV <> Nil ANd FanartTV.HasName("characterart") Then
		      jItem = FanartTV.Child("characterart")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" Then
		          URLs.Append        jItem.Child(i).Value("url")
		          Dimensions.Append  "512x512"
		          ThumbURLs.Append   jItem.Child(i).Value("url")' + "/preview"
		        End If
		      Next
		      
		    End If
		    
		    // If only one is available, and no locals exist.
		    If URLs.Ubound = 0 And NOT TVAttr.FolderParent.Child("character.png").Exists Then
		      TVAttr.ART_ClearArt = URL2Picture( URLs(0), TVAttr.FolderParent, "character.png" ) 'URL2Picture( URLs(0), "character", "png", TVAttr.FolderParent )
		      wndMain.cvsTVShowDetails.Reload
		      Return
		    End If
		    
		  Case "Thumbs"
		    Type = Loc.kTVThumb
		    
		    // CharacterArt URLs
		    If FanartTV <> Nil ANd FanartTV.HasName("tvthumb") Then
		      jItem = FanartTV.Child("tvthumb")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" Then
		          URLs.Append        jItem.Child(i).Value("url")
		          Dimensions.Append  "500x281"
		          ThumbURLs.Append   jItem.Child(i).Value("url")' + "/preview"
		        End If
		      Next
		      
		    End If
		    
		    
		    If URLs.Ubound = 0 And NOT TVAttr.FolderParent.Child("landscape.jpg").Exists Then
		      TVAttr.ART_TVThumb = URL2Picture( URLs(0), TVAttr.FolderParent, "landscape.jpg" ) 'URL2Picture( URLs(0), "landscape", "jpg", TVAttr.FolderParent )
		      wndMain.cvsTVShowDetails.Reload
		      Return
		    End If
		    
		    
		    
		  Case "SeasonPoster"
		    Type = Loc.kSeason + " " + Loc.kPoster
		    SeasonName = "season%S-poster.jpg"
		    If Season = 0 Then SeasonName = "season-specials-poster.jpg"
		    If Season < 0 Then SeasonName = "season-all-posters.jpg"
		    
		  Case "SeasonBanner"
		    Type = Loc.kSeason + " " + Loc.kBanner
		    SeasonName = "season%S-banner.jpg"
		    If Season = 0 Then SeasonName = "season-specials-banner.jpg"
		    If Season < 0 Then SeasonName = "season-all-banner.jpg"
		    
		  Case "SeasonThumb"
		    Type = Loc.kSeason + " " + Loc.kTVThumb
		    SeasonName = "season%S-landscape.jpg"
		    If Season = 0 Then SeasonName = "season-specials-landscape.jpg"
		    If Season < 0 Then SeasonName = "season-all-landscape.jpg"
		    
		    // SeasonThumb URLs
		    If FanartTV <> Nil ANd FanartTV.HasName("seasonthumb") Then
		      jItem = FanartTV.Child("seasonthumb")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" And jItem.Child(i).Value("season") = SeasonStr Then
		          URLs.Append        jItem.Child(i).Value("url")
		          Dimensions.Append  "500x281"
		          ThumbURLs.Append   jItem.Child(i).Value("url")' + "/preview"
		        End If
		      Next
		      
		    End If
		    
		    
		  Case "SeasonFanart"
		    Type = Loc.kSeason + " " + Loc.kFanart
		    SeasonName = "season%S-fanart.jpg"
		    If Season = 0 Then SeasonName = "season-specials-fanart.jpg"
		    If Season < 0 Then SeasonName = "season-all-fanart.jpg"
		    
		    // Season Fanart URLs
		    If FanartTV <> Nil And FanartTV.HasName("showbackground") Then
		      jItem = FanartTV.Child("showbackground")
		      
		      For i as Integer = 0 to jItem.Count -1
		        If jItem.Child(i).Value("url") <> "" And jItem.Child(i).Value("season") = SeasonStr Then
		          URLs.Append        jItem.Child(i).Value("url")
		          Dimensions.Append  "1920x1080"
		          ThumbURLs.Append   jItem.Child(i).Value("url") + "/preview"
		        End If
		      Next
		      
		    End If
		    
		    
		  End Select
		  
		  // Season Location
		  If URLs.Ubound = 0 And Mode.InStr( 0, "Season" ) > 0 Then
		    'If Season = -1 Then Season = 1
		    Dim DisplaySeason as String = Str( Season )
		    If DisplaySeason.Len = 1 Then DisplaySeason = "0" + DisplaySeason
		    
		    Dim Parent as FolderItem = TVAttr.FolderParent
		    'If Season = 0 And Parent.Child( "Specials" ).Exists Then
		    'Parent = Parent.Child("Specials")
		    'ElseIf Season > 0 And Parent.Child( "Season " + DisplaySeason ).Exists Then
		    'Parent = Parent.Child( "Season " + DisplaySeason )
		    'ElseIf Season = -1 And Parent.Child( TVAttr.Title ).Exists Then
		    'Parent = Parent.Child( TVAttr.Title )
		    'End If
		    
		    If NOT Parent.Child( SeasonName.ReplaceAll("%S", DisplaySeason ) ).Exists Then
		      URL2Picture( URLs(0), Parent, SeasonName.ReplaceAll( "%S", DisplaySeason ) )
		      Return
		    End If
		  End If
		  
		  // Download image thumbs.
		  dlgProgress.Reset
		  For i as Integer = 0 to ThumbURLs.Ubound
		    dlgProgress.Add( Loc.kDownloading + ":", Str( i + 1 ) + Loc.k1of2 + Str( ThumbURLs.Ubound + 1 ) + " " + Type + " " + Loc.kImages + "...", 1, ThumbURLs.Ubound + 1)
		    'IMGArray.Append Picture.FromData( Sckt.Get( ThumbURLs(i), Preferences.Prefs.integerForKey("TimeOut") ) )
		    IMGArray.Append Picture.FromData( CURLGet( ThumbURLs(i) ) )
		    Sckt.Close
		    If IMGArray(i) <> Nil And val( Dimensions(i).ReplaceAll("x","") ) <= 0 Then Dimensions(i) = Str( IMGArray(i).Width ) + "x" + Str( IMGArray(i).Height )
		  Next
		  
		  
		  
		  If IMGArray = Nil Or IMGArray.Ubound <= -1 Then
		    MessageBox MovieCore.kNoImagesFound.ReplaceAll( "%S", Type )
		    wndMain.cvsTVShowDetails.Reload
		    Return
		  End If
		  
		  wndPreviewThumbs.Init IMGArray, Dimensions, URLs, Mode, Season
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowByID(ID as String, Update as Boolean = False)
		  If TVAttr.Locked Then
		    MessageBox Loc.kIsLocked.ReplaceAll("%@", TVAttr.Title)
		    Return
		  End If
		  
		  Dim sckt as New TVDBSckt
		  sckt.Yield = True
		  
		  
		  Dim ShowName as String = TVAttr.FolderParent.Name
		  
		  If ID = "" Then
		    MessageBox loc.msgNoIDTV.ReplaceAll( "%S", ShowName )
		    Return
		  End If
		  
		  // Reset current search.
		  If NOT CommonCore.MassSearch Then wndMain.ccSearchBoxTVShows.srchField.StringValue = ""
		  
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kSearching + ":", ShowName, 1, 5 ) // 1
		  
		  'MessageBox ID
		  sckt.getShowNFO( ID, Update )
		  
		  If NOT CommonCore.MassSearch Then
		    wndMain.lstTVShows.UpdateRow
		    TVAttr.NFORead( TVAttr.FolderParent )
		    TVAttr.LoadImages( TVAttr.FolderParent )
		    
		    'wndMain.lstTVShows.SortList()
		    wndMain.cvsTVShowDetails.Reload()
		  End If
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowSearch(ShowName as String, ManualSearch as Boolean = False)
		  
		  Dim sckt as New TVDBSckt
		  Dim JSONString as String
		  
		  dlgProgress.Add( Loc.kSearching + ":", ShowName )
		  
		  JSONString = DefineEncoding( sckt.Get( URL( "Search", ShowName.ReplaceAll( " - ", " " ) ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  sckt.Close
		  
		  Dim jTVDB as New JSONItem
		  jTVDB = JSONString.ConvertEncoding( Encodings.UTF8 ).XML2JSON
		  
		  Dim Results as New JSONItem
		  If jTVDB <> Nil ANd jTVDB.HasName("Data") And jTVDB.ToString.InStr( "Series" ) > 0 And jTVDB.Child("Data").HasName("Series") And jTVDB.Child("Data").Child("Series").Count > 0 Then
		    
		    Dim IDs() as String
		    Dim TVShows() as JSONItem
		    
		    
		    If jTVDB.Child("Data").Child("Series").IsArray Then
		      For i as Integer = 0 to jTVDB.Child("Data").Child("Series").Count -1
		        TVShows.Append jTVDB.Child("Data").Child("Series").Child(i)
		      Next
		    Else
		      TVShows.Append jTVDB.Child("Data").Child("Series")
		    End If
		    
		    For each jItem as JSONItem in TVShows
		      'If jItem.HasName("language") And jItem.Value("language") <> Preferences.Prefs.stringForKey("DBLanguage") Then Continue
		      
		      'For i as Integer = 0 to jTVDB.Child("Data").Child("Series").Count -1
		      'Dim jItem as New JSONItem
		      'If jTVDB.Child("Data").Child("Series").IsArray Then
		      'jItem = jTVDB.Child("Data").Child("Series").Child(i)
		      'Else
		      'jItem = jItem.Child("Data").Child("Series")
		      'End If
		      
		      // Skip duplicates with different IDs
		      If jItem.HasName("SeriesName") And jItem.Value("SeriesName").StringValue.InStr( "* duplicate of" ) > 0 Then Continue
		      
		      // Skip Duplicats with same IDs
		      Dim b as Boolean = False
		      For n as Integer = 0 to IDs.Ubound
		        If jItem.HasName("id") and jItem.Value("id") = IDs(n) Then
		          b = True
		          Exit
		        End If
		      Next
		      If b Then Continue
		      
		      // Find duplicate entries in my language.
		      Dim EnglishItem as New JSONItem
		      Dim LocalizedItem as New JSONItem
		      Dim BackUpItem as New JSONItem
		      
		      For n as Integer = 0 to TVShows.Ubound 'jTVDB.Child("Data").Child("Series").Count -1
		        Dim ThisItem as New JSONItem
		        ThisItem = TVShows(n) 'jTVDB.Child("Data").Child("Series").Child(n)
		        
		        If ThisItem.HasName("id") And ThisItem.Value("id") = jItem.Value("id") Then
		          If NOT BackUpItem.HasName("id") And ThisItem.HasName("id") Then BackUpItem = ThisItem
		          If ThisItem.Value("language") = "en" Then EnglishItem = ThisItem
		          If ThisItem.Value("language") = Preferences.Prefs.stringForKey("DBLanguage") Then
		            LocalizedItem = ThisItem
		            Exit
		          End If
		        End If
		      Next
		      
		      IDs.Append BackUpItem.Value("id")
		      'b = False
		      'For n as Integer = 0 to Results.Count -1
		      'If BackUpItem <> Nil And BackUpItem.HasName("id") And BackUpItem.Value("id") = jItem.Value("id") Then
		      'b = True
		      'Exit
		      'End If
		      'Next
		      'If b Then Continue
		      
		      // Append result
		      If LocalizedItem <> Nil And LocalizedItem.HasName("id") Then
		        Results.Append LocalizedItem
		      ElseIf EnglishItem <> Nil And EnglishItem.HasName("id") Then
		        Results.Append EnglishItem
		      ElseIf BackUpItem <> Nil And BackUpItem.HasName("id") Then
		        Results.Append BackUpItem
		      End If
		      
		    Next
		    
		  Else
		    // No results found
		    
		    If JSONString.InStr( "Website is currently unreachable" ) > 0 Then
		      MessageBox "TVDB is currently unreachable"
		    Else
		      MessageBox kNoShowsFoundTryAgain
		    End If
		    
		    If NOT ManualSearch Then
		      wndSearch.Show
		      wndSearch.ccSearchBox.srchField.StringValue = ShowName.ReplaceAll(" - ", " ")
		    End If
		    Return
		    
		  End If
		  
		  
		  Dim TotalResults as Integer = Results.Count
		  
		  
		  If TotalResults > 1 Then
		    
		    Dim ID(), DBID(), Title(), ReleaseDate(), PosterURL(), FanartURL(), BannerURL() as String
		    
		    For i as Integer = 0 to Results.Count -1
		      Dim jItem as New JSONItem
		      jItem = Results.Child(i)
		      
		      If jItem.HasName("IMDB_ID")    Then ID.Append          jItem.Value("IMDB_ID")    Else ID.Append ""
		      If jItem.HasName("id")         Then DBID.Append        jItem.Value("id")         Else DBID.Append ""
		      If jItem.HasName("SeriesName") Then
		        Title.Append ReplaceAll( jItem.Value("SeriesName"), "&amp;", "&" )
		      ElseIf jItem.HasName("AliasNames") And jItem.Value("AliasNames") <> "" Then
		        Title.Append ReplaceAll( jItem.Value("AliasNames"), "&amp;", "&" )
		      Else
		        Title.Append ""
		      End If
		      
		      If jItem.HasName("FirstAired") Then ReleaseDate.Append jItem.Value("FirstAired") Else ReleaseDate.Append ""
		      PosterURL.Append ""
		      FanartURL.Append ""
		      If jItem.HasName("banner")     Then BannerURL.Append GraphicsPath + jItem.Value("banner") else BannerURL.Append ""
		      
		    Next
		    
		    CommonCore.ShowSearchResults ID, DBID, Title, ReleaseDate, PosterURL, FanartURL, BannerURL
		    
		    
		  ElseIf TotalResults = 1 And ManualSearch Then
		    Dim jItem as New JSONItem
		    jItem = Results.Child( 0 )
		    
		    Dim ID, DBID, Title, ReleaseDate, PosterURL, FanartURL, BannerURL as String
		    
		    If jItem.HasName("IMDB_ID")    Then ID =          jItem.Value("IMDB_ID")
		    If jItem.HasName("id")         Then DBID =        jItem.Value("id")
		    If jItem.HasName("AliasNames") And jItem.Value("AliasNames") <> "" Then
		      Title = jItem.Value("AliasNames") // Nice name
		    ElseIf jItem.HasName("SeriesName") Then
		      Title = jItem.Value("SeriesName") // Nice name
		    Else
		      Title = ""
		    End If
		    
		    If jItem.HasName("FirstAired") Then ReleaseDate = jItem.Value("FirstAired")
		    If jItem.HasName("banner")     Then BannerURL =   GraphicsPath + jItem.Value("banner")
		    
		    CommonCore.ShowSearchResult ID, DBID, Title, ReleaseDate, "", "", BannerURL
		    
		  ElseIf TotalResults = 1 Then
		    ShowByID Results.Child(0).Value("id")
		    
		    
		  ElseIf TotalResults = 0 Then
		    
		    Dim IMDbItem as new JSONItem
		    IMDbItem = GetIMDbJSON( ShowName, True )
		    
		    If IMDbItem <> Nil And IMDbItem.HasName("TITLE_ID") Then
		      TotalResults = 1
		      
		      If ManualSearch Then
		        
		        Dim FanartURL as String
		        If IMDbItem.HasName("MEDIA_IMAGES") And IMDbItem.Child("MEDIA_IMAGES").Count > 0 Then FanartURL = IMDbItem.Child("MEDIA_IMAGES").Value(0)
		        
		        CommonCore.ShowSearchResult( IMDbItem.Value("TITLE_ID"), "", IMDbItem.Value("TITLE"), IMDbItem.Value("RELEASE_DATE"), IMDbItem.Value("POSTER"), FanartURL, "" )
		        
		      Else
		        ShowByID( IMDbItem.Value("TITLE_ID") )
		      End If
		    End If
		    
		  End If
		  
		  dlgProgress.Close
		  Return
		  
		  #If TargetLinux Then
		    
		    
		    Dim Sckt as New TVDBSckt
		    Dim JSONString as String
		    
		    dlgProgress.Add( Loc.kSearching + ":", ShowName )
		    
		    JSONString = DefineEncoding( Sckt.Get( URL( "Search", ShowName.ReplaceAll( " - ", " " ) ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		    Sckt.Close
		    
		    Dim jTVDB as New JSONItem
		    jTVDB = JSONString.ConvertEncoding( Encodings.UTF8 ).XML2JSON
		    
		    Dim TotalResults as Integer = 0
		    If jTVDB <> Nil And jTVDB.HasName("Data") And _
		      jTVDB.ToString.InStr( 0, "Series" ) <> 0 And _
		      jTVDB.Child("Data").HasName("Series") And _
		      jTVDB.Child("Data").Child("Series").Count > 0 Then
		      
		      If jTVDB.Child("Data").Child("Series").IsArray Then
		        
		        Dim IDs() as String
		        For i as Integer = 0 to jTVDB.Child("Data").Child("Series").Count - 1
		          Dim jItem as New JSONItem
		          jItem = jTVDB.Child("Data").Child("Series").Child(i)
		          
		          If jItem.HasName("SeriesName") And jItem.Value("SeriesName").Instr( "* duplicate of" ) > 0 Then Continue
		          
		          
		          Dim b as Boolean = False
		          For n as Integer = 0 to IDs.Ubound
		            If jItem.HasName("id") And jItem.Value("id") = IDs(n) Then
		              b = True
		              Exit
		            End If
		          Next
		          If b Then Continue
		          
		          IDs.Append jItem.Value("id")
		          
		          TotalResults = TotalResults + 1
		        Next
		        Dim s as String
		        
		        'TotalResults = jTVDB.Child("Data").Child("Series").Count
		        
		        
		      Else
		        TotalResults = 1
		      End If
		      
		    Else
		      
		      If JSONString.InStr( "Website is currently unreachable" ) > 0 Then
		        MessageBox "TVDB is currently unreachable"
		      Else
		        MessageBox kNoShowsFoundTryAgain
		      End If
		      
		      If NOT ManualSearch Then
		        wndSearch.Show
		        wndSearch.ccSearchBox.srchField.StringValue = ShowName.ReplaceAll(" - ", " ")
		      End If
		      Return
		    End If
		    
		    // If too many or too little results, try IMDB Search.
		    If ( TotalResults <= 0 And ManualSearch ) Or TotalResults > 99 Then
		      'Dim jsonIMDb as String = IMDBjson( ShowName )
		      Dim IMDbItem as New JSONItem
		      IMDbItem = GetIMDbJSON( ShowName, True )
		      
		      'If jsonIMDb.ValidJSON( "IMDb Search" ) Then IMDbItem.Load( jsonIMDb )
		      If IMDbItem.HasName("TITLE_ID") Then
		        TotalResults = 1
		        
		        If ManualSearch Then
		          Dim FanartURL as String
		          If IMDbItem.HasName("MEDIA_IMAGES") And IMDbItem.Child("MEDIA_IMAGES").Count > 0 Then FanartURL = IMDbItem.Child("MEDIA_IMAGES").Value(0)
		          
		          CommonCore.ShowSearchResult( IMDbItem.Value("TITLE_ID"), "", IMDbItem.Value("TITLE"), IMDbItem.Value("RELEASE_DATE"), IMDbItem.Value("POSTER"), FanartURL, "" )
		          
		          dlgProgress.Close
		          Return
		        Else
		          ShowByID IMDbItem.Value("TITLE_ID")
		        End If
		        
		      End If
		      
		      Return
		    End If
		    
		    
		    If jTVDB.Child("Data").Child("Series").IsArray And TotalResults > 1 Then
		      
		      Dim ID(), DBID(), Title(), ReleaseDate(), PosterURL(), FanartURL(), BannerURL() as String
		      
		      For i as Integer = 0 to TotalResults - 1
		        Dim jItem as New JSONItem
		        jItem = jTVDB.Child("Data").Child("Series").Child(i)
		        
		        // Detect duplicate entries
		        Dim b as Boolean = False
		        For n as Integer = 0 to ID.Ubound
		          
		          // Ignore duplicates entries with different IDs
		          If jItem.HasName("SeriesName") And jItem.Value("SeriesName").Instr( "** duplicate of" ) > 0 Then
		            b = True
		            Exit
		          End If
		          
		          // Ignore duplicate entires with same IDs
		          If jItem.HasName("id") And jItem.Value("id") = DBID(n) Then
		            If jItem.HasName("SeriesName") And Len( jItem.Value("SeriesName") ) > Len( Title(n) ) Then Title(n) = jItem.Value("SeriesName")
		            b = True
		            Exit
		          End If
		          
		        Next
		        If b Then Continue
		        
		        
		        If jItem.HasName("IMDB_ID")    Then ID.Append          jItem.Value("IMDB_ID")    Else ID.Append ""
		        If jItem.HasName("id")         Then DBID.Append        jItem.Value("id")         Else DBID.Append ""
		        If jItem.HasName("SeriesName") Then Title.Append       jItem.Value("SeriesName") Else Title.Append ""
		        If jItem.HasName("FirstAired") Then ReleaseDate.Append jItem.Value("FirstAired") Else ReleaseDate.Append ""
		        PosterURL.Append ""
		        FanartURL.Append ""
		        If jItem.HasName("banner")     Then BannerURL.Append GraphicsPath + jItem.Value("banner") else BannerURL.Append ""
		        
		      Next
		      
		      CommonCore.ShowSearchResults ID, DBID, Title, ReleaseDate, PosterURL, FanartURL, BannerURL
		      
		    ElseIf TotalResults = 1 And ManualSearch Then
		      Dim jItem as New JSONItem
		      jItem = jTVDB.Child("Data").Child("Series")
		      
		      Dim ID, DBID, Title, ReleaseDate, PosterURL, FanartURL, BannerURL as String
		      
		      If jItem.HasName("IMDB_ID")    Then ID =          jItem.Value("IMDB_ID")
		      If jItem.HasName("id")         Then DBID =        jItem.Value("id")
		      If jItem.HasName("SeriesName") Then Title =       jItem.Value("SeriesName")
		      If jItem.HasName("FirstAired") Then ReleaseDate = jItem.Value("FirstAired")
		      If jItem.HasName("banner")     Then BannerURL =   GraphicsPath + jItem.Value("banner")
		      
		      
		      CommonCore.ShowSearchResult ID, DBID, Title, ReleaseDate, "", "", BannerURL
		    ElseIf TotalResults = 1 Then
		      Dim jItem as New JSONItem
		      jItem = jTVDB.Child("Data").Child("Series")
		      
		      ShowByID jItem.Value("id")
		      
		    ElseIf TotalResults = 0 Then
		      
		      Dim IMDbItem as new JSONItem
		      IMDbItem = GetIMDbJSON( ShowName, True )
		      
		      If IMDbItem <> Nil And IMDbItem.HasName("TITLE_ID") Then
		        TotalResults = 1
		        
		        If ManualSearch Then
		          
		          Dim FanartURL as String
		          If IMDbItem.HasName("MEDIA_IMAGES") And IMDbItem.Child("MEDIA_IMAGES").Count > 0 Then FanartURL = IMDbItem.Child("MEDIA_IMAGES").Value(0)
		          
		          CommonCore.ShowSearchResult( IMDbItem.Value("TITLE_ID"), "", IMDbItem.Value("TITLE"), IMDbItem.Value("RELEASE_DATE"), IMDbItem.Value("POSTER"), FanartURL, "" )
		          
		        Else
		          ShowByID( IMDbItem.Value("TITLE_ID") )
		        End If
		      End If
		      
		    End If
		    
		    dlgProgress.Close
		    Return
		    
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowStatus(ShowName as String, TVDBID as String = "")
		  ShowStatusTVMaze( ShowName, TVDBID )
		  'ShowStatusTVRage( ShowName )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowStatusAll()
		  Dim LstBox as Listbox = wndMain.lstTVShadow
		  CommonCore.MassSearch = True
		  ReDim CommonCore.UnFoundTitles(-1)
		  ReDim CommonCore.UnfoundPaths(-1)
		  
		  For i as Integer = 0 to LstBox.ListCount - 1
		    If LstBox.Cell( i, 2 ) = "" Then Continue // Only update scraped shows.
		    
		    
		    TVAttr.FolderParent = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Continue // Only update if exists
		    
		    TVAttr.ClearProperties // Also gets done in NFORead, but just for sure.
		    TVAttr.NFORead( TVAttr.FolderParent )
		    'If TVAttr.Locked Then Continue
		    Dim Title as String = TVAttr.Title 'Original
		    'Dim Year as Integer = TVAttr.DateYear
		    
		    Dim PreviousStatus as String = TVAttr.Status
		    Dim PreviousAired as String = TVAttr.NextAired_Date' + " - " + TVAttr.NextAired_Episode
		    If PreviousAired = "" Then PreviousAired = TVAttr.LastAired_Date
		    
		    dlgProgress.Add( Loc.kDownloading + ":", Title.ReplaceAll("&", "&&") + " " + Loc.kStatus.ReplaceAll(":","...").Lowercase )
		    
		    // Do your thing!
		    ShowStatus( Title, TVAttr.ID_TVDB )
		    
		    
		    'If JSON = Nil Then
		    'If NOT Growl.Notify( Title + " " + Loc.kStatus.ReplaceAll(":",""), Loc.msg404TV ) Then
		    '// NOT Growling?
		    'End If
		    'CommonCore.UnfoundTitles.Append Title + EndOfLine + "No TVRage ID found"
		    'CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		    'End If
		    
		    If TVAttr.Status <> PreviousStatus Then
		      If TVAttr.Status.InStr( 0, "Ended" ) > 0 OR TVAttr.Status = TVStatus_Ended Then
		        CommonCore.UnfoundTitles.Append Title + " " + kStatusChangedCanceled
		      ElseIf Trim( PreviousStatus ) = "" Then
		        CommonCore.UnfoundTitles.Append Title + " " + kStatusHasChanged + " " + TVAttr.Status.Lowercase + "."
		      Else
		        CommonCore.UnfoundTitles.Append Title + " " + kStatusChangedFrom + " " + PreviousStatus.Lowercase + " " + Loc.kTo + " " + TVAttr.Status.Lowercase + "."
		      End If
		      CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		    End If
		    
		    If PreviousAired = "" And TVAttr.NextAired_Date <> "" Then
		      CommonCore.UnfoundTitles.Append Title + " " + kStatusChangedToAired + " " + CountHours( TVAttr.NextAired_Date, True ).Lowercase
		      CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		    End If
		    
		    'If TVAttr.NextAired_Date + " - " + TVAttr.NextAired_Episode <> PreviousAired Then
		    'CommonCore.UnfoundTitles.Append "Airing information changed:" + EndOfLine +  "[Prev] " + PreviousAired + EndOfLine + "[New] " + TVAttr.NextAired_Date + " - " + TVAttr.NextAired_Episode
		    'CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		    'End If
		    
		    TVAttr.NFOWrite( TVAttr.FolderParent )
		    wndMain.lstTVShows.UpdateRow( i, Nil, True )
		  Next
		  
		  If CommonCore.UnfoundTitles.Ubound > -1 Then CommonCore.ShowUnfoundTitles( kStatusChanges )
		  ReDim CommonCore.UnfoundTitles(-1)
		  ReDim CommonCore.UnfoundPaths(-1)
		  
		  CommonCore.MassSearch = False
		  wndMain.lstSearch.CopyFrom( wndMain.lstTVShadow )
		  wndMain.lstTVShows.ResetFolderStatus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowStatusTVMaze(ShowName as String, TVDBID as String = "")
		  
		  If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Return
		  
		  App.ErrorMessage = "Just Starting"
		  
		  dim sckt as new TVMaze
		  sckt.Yield = True
		  
		  dim content as string
		  if TVDBID <> "" then
		    content = trim( DefineEncoding( sckt.Get( URLCore.TVMaze( TVDBID, "LookUp" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		  else
		    content = trim( DefineEncoding( sckt.Get( URLCore.TVMaze( ShowName, "Search" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		  end if
		  
		  // Redirected
		  if sckt <> Nil and sckt.HTTPStatusCode = 301 and sckt.PageHeaders <> Nil then
		    dim redirectURL as string = sckt.PageHeaders.Value( "Location" )
		    content = trim( DefineEncoding( sckt.Get( redirectURL, Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		  end if
		  
		  
		  // Just in case, try try again?
		  if TVDBID <> "" and content = "" then
		    content = trim( DefineEncoding( sckt.Get( URLCore.TVMaze( ShowName, "Search" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		    
		    // Redirected
		    if sckt <> Nil and sckt.HTTPStatusCode = 301 and sckt.PageHeaders <> Nil then
		      dim redirectURL as string = sckt.PageHeaders.Value( "Location" )
		      content = trim( DefineEncoding( sckt.Get( redirectURL, Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		    end if
		  end if
		  
		  
		  dim ShowInfo as JSONItem
		  if content <> ""  and content.Left( 1 ) = "{" then
		    ShowInfo = New JSONItem( content )
		  end if
		  
		  if ShowInfo <> Nil then
		    
		    // Reset previous
		    TVAttr.NextAired_Date = ""
		    TVAttr.NextAired_Episode = ""
		    TVAttr.LastAired_Date = ""
		    TVAttr.LastAired_Episode = ""
		    
		    // Show Status
		    dim status as string = ShowInfo.Lookup( "status", "" )
		    Select case status
		      
		    case "Running"
		      TVAttr.Status = TVStatus_ReturningSeries
		    case "Ended"
		      TVAttr.Status = TVStatus_Ended
		    case "To Be Determined"
		      TVAttr.Status = TVStatus_Bubble
		    case "In Development"
		      TVAttr.Status = TVStatus_Development
		      
		    else
		      TVAttr.Status = ""
		      
		    End Select
		    
		    
		    // Get Next/Previous episode URLs
		    dim NextEpisodeURL as string
		    dim PreviousEpisodeURL as String
		    
		    if ShowInfo.HasName( "_links" ) then
		      dim links as JSONItem = ShowInfo.Value( "_links" )
		      
		      if links <> Nil and links.HasName( "nextepisode" ) then
		        dim nextep as JSONItem = links.Value( "nextepisode" )
		        
		        if nextep <> Nil and nextep.HasName( "href" ) then
		          NextEpisodeURL = nextep.Value( "href" )
		        end if
		      end if
		      
		      if links <> Nil and links.HasName( "previousepisode" ) then
		        dim prevep as JSONItem = links.Value( "previousepisode" )
		        
		        if prevep <> Nil and prevep.HasName( "href" ) then
		          PreviousEpisodeURL = prevep.Value( "href" )
		        end if
		      end if
		      
		    end if
		    
		    
		    // Get Next Episode information
		    dim NextEpisodeInfo as JSONItem
		    if NextEpisodeURL <> "" then
		      dim NextEpInfo as string = trim( DefineEncoding( sckt.Get( NextEpisodeURL, Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		      
		      if NextEpInfo <> "" and NextEpInfo.Left(1) = "{" then
		        NextEpisodeInfo = New JSONItem( NextEpInfo )
		      end if
		    end if
		    
		    // Format next episode information
		    if NextEpisodeInfo <> Nil and NextEpisodeInfo.Count > 0 then
		      
		      
		      // Season/Episode - Name
		      dim season as string = NextEpisodeInfo.Lookup( "season", "" )
		      if season.Len = 1 then
		        season = "0" + season
		      end if
		      dim episode as string = NextEpisodeInfo.Lookup( "number", "" )
		      if episode.Len = 1 then
		        episode = "0" + episode
		      end if
		      dim name as string = NextEpisodeInfo.Lookup( "name", "" )
		      if name <> "" then
		        name = " - " + name
		      end if
		      
		      TVAttr.NextAired_Episode = "S" + season + "E" + episode + name
		      
		      // Airdate
		      // Because i did something silly with date formatting:
		      dim NextAiredDate as new NativeSubclass.DateExtended
		      dim date as string = NextEpisodeInfo.Lookup("airstamp","")
		      if date <> "" then
		        NextAiredDate.ISO8601 = date
		      end if
		      dim SillyDate as string = NextAiredDate.ISO8601.Replace(":00-", ":00G-").Replace(":00+", ":00G+").Replace(":00Z",":00G+")
		      
		      'TVAttr.NextAired_Date = SillyDate
		      
		      'dim date as string = NextEpisodeInfo.Lookup( "airdate", "" )
		      'dim time as string = NextEpisodeInfo.Lookup( "airtime", "" )
		      'dim combo as string = date + "T" + time + ":00"
		      '
		      'dim gmt as string = NextEpisodeInfo.Lookup( "airstamp", "" )
		      'if gmt <> "" then
		      'gmt = gmt.ReplaceAll( combo, "" )
		      'end if
		      '
		      'dim sillydate as string =  date + "T" + time + "G" + gmt
		      
		      TVAttr.NextAired_Date = sillydate
		      
		    end if
		    
		    
		    // Get Previous Episode information
		    dim PreviousEpisodeInfo as JSONItem
		    if PreviousEpisodeURL <> "" then
		      dim PrevEpInfo as string = trim( DefineEncoding( sckt.Get( PreviousEpisodeURL, Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		      
		      if PrevEpInfo <> "" and PrevEpInfo.Left(1) = "{" then
		        PreviousEpisodeInfo = New JSONItem( PrevEpInfo )
		      end if
		    end if
		    
		    // Format previous episode information
		    if PreviousEpisodeInfo <> Nil and PreviousEpisodeInfo.Count > 0 then
		      
		      
		      // Season/Episode - Name
		      dim season as string = PreviousEpisodeInfo.Lookup( "season", "" )
		      if season.Len = 1 then
		        season = "0" + season
		      end if
		      dim episode as string = PreviousEpisodeInfo.Lookup( "number", "" )
		      if episode.Len = 1 then
		        episode = "0" + episode
		      end if
		      dim name as string = PreviousEpisodeInfo.Lookup( "name", "" )
		      if name <> "" then
		        name = " - " + name
		      end if
		      
		      TVAttr.LastAired_Episode = "S" + season + "E" + episode + name
		      
		      // Airdate
		      // Because i did something silly with date formatting:
		      dim LastAiredDate as new NativeSubclass.DateExtended
		      dim date as string = PreviousEpisodeInfo.Lookup("airstamp","")
		      if date <> "" then
		        LastAiredDate.ISO8601 = date
		      end if
		      dim SillyDate as string = LastAiredDate.ISO8601.Replace(":00-", ":00G-").Replace(":00+", ":00G+").Replace(":00Z",":00G+")
		      
		      TVAttr.LastAired_Date = SillyDate
		      
		      'dim date as string = PreviousEpisodeInfo.Lookup( "airdate", "" )
		      'dim time as string = PreviousEpisodeInfo.Lookup( "airtime", "" )
		      'dim combo as string = date + "T" + time + ":00"
		      '
		      'dim gmt as string = PreviousEpisodeInfo.Lookup( "airstamp", "" )
		      'if gmt <> "" then
		      'gmt = gmt.ReplaceAll( combo, "" )
		      'end if
		      '
		      'TVAttr.LastAired_Date = date + "T" + time + "G" + gmt
		      
		    end if
		    
		    
		    // Set folder label colors
		    If Preferences.Prefs.boolForKey("MatchFinderLabelsToTVStatus") Then
		      
		      Dim Clock as String = CountHours( TVAttr.NextAired_Date )
		      Dim Hours as Integer = Val( Clock )
		      
		      If Clock <> "" Then
		        App.ErrorMessage = "Clock <> """""
		        // Today & This week
		        If Hours > -24 And Round( Hours / 24 ) <= 7 Then LabelIndexSet( TVAttr.FolderParent, 6 )
		        
		        // Later then this week, but within a Month (30 days)
		        If Round( Hours / 24 ) > 7 And Round( Hours / 24 ) <= 30 Then LabelIndexSet( TVAttr.FolderParent, 3 )
		        
		        // Upcoming / Hiatus
		        If Round( Hours / 24 ) > 30 Then LabelIndexSet( TVAttr.FolderParent, 1 )
		        
		      Else
		        App.ErrorMessage = "Clock = """""
		        // To be announced
		        LabelIndexSet( TVAttr.FolderParent, 4 )
		      End If
		      
		      App.ErrorMessage = "Other Label Colors"
		      If Status.InStr( 0, "In Development" ) > 0 Then LabelIndexSet( TVAttr.FolderParent, 5 ) // Future
		      If Status.Contains( "Ended" ) OR Status.Contains("rejected") OR Status.Contains("Cancel") Then LabelIndexSet( TVAttr.FolderParent, 2 ) // Ended
		      If TVAttr.Status = TVStatus_PilotRejected OR TVAttr.Status = TVStatus_Ended Then LabelIndexSet( TVAttr.FolderParent, 2 ) // Ended
		      
		    End If // @END MatchFinderLabelsToTVStatus
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowStatusTVRage(Title as String)
		  // TVRage Status':
		  //   'In Development'    / Future
		  //   'Pilot Ordered'     / Future
		  //   'Pilot Rejected'    / Ended?
		  //   'Final Season'      / Continuing
		  //   'Returning Series'  / Continuing
		  //   'On Hiatus'         / Hiatus
		  //   'TBD/On The Bubble' / Hiatus
		  //   'Canceled/Ended'    / Ended
		  //   'New Series'        / Continuing
		  
		  'Return // TVRAGE DOWN
		  
		  If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Return
		  
		  App.ErrorMessage = "Just Starting"
		  
		  
		  Title = Title.ReplaceAll(":","").ReplaceAll(" & "," and ")
		  
		  Dim sckt as New TVDBSckt
		  sckt.Yield = True
		  
		  // Get QuickInfo
		  Dim QuickInfo as String = DefineEncoding( sckt.Get( URLCore.TVRage( String2Entities( Title ), "InfoQuick" ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 )
		  sckt.Close
		  
		  'dim TVRageTitle, SimplifiedTitle as String
		  'SimplifiedTitle = Trim( RegExThis( Title, "\([0-9][0-9][0-9][0-9]\)" ) )
		  'TVRageTitle = QuickInfo.Mid( QuickInfo.InStr("Show Name@"), QuickInfo.InStr( EndOfLine ) )
		  '
		  'if NOT QuickInfo.Contains( Title ) then
		  'QuickInfo = DefineEncoding( sckt.Get( URLCore.TVRage( String2Entities( Title ), "InfoQuick" ), Preferences.Prefs.integerForKey("TimeOut") / 2 ), Encodings.UTF8 )
		  'sckt.Close
		  'end if
		  
		  App.ErrorMessage = "QuickInfo 1"
		  If QuickInfo.Left(7) = "No Show" Then
		    App.ErrorMessage = "Growling/NotificationCenter"
		    'If NOT nc.Available Then
		    'If NOT Growl.Notify( "[TVRage] " + Title + " " + Loc.kStatus.ReplaceAll(":",""), Loc.kCouldNotBeFound.ReplaceAll("%s", Title) ) Then
		    '// NOT Growling?
		    ''If DebugBuild Then MessageBox "TV Rage cannot find the show: " + Title
		    'End If
		    'Else
		    nc.Message "[TVRage] " + Loc.kCouldNotBeFound.ReplaceAll("%s", Title)
		    'End If
		    
		    If CommonCore.MassSearch Then
		      CommonCore.UnfoundTitles.Append Title + EndOfLine + "No TVRage show found"
		      CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		    End If
		    
		    Return
		  End If
		  
		  App.ErrorMessage = "QuickInfo 2"
		  If QuickInfo.InStr( 0, "Service currently unavailable due to maintenance" ) > 0 Then
		    MessageBox "TVRage Service currently unavailable due to maintenance."
		    Return
		  End If
		  
		  App.ErrorMessage = "QuickInfo 3"
		  If QuickInfo.MyMid( "Show ID@", EndOfLine.UNIX ) = "" Then
		    
		    // Try again
		    App.ErrorMessage = "QuickInfo Try Again"
		    QuickInfo = DefineEncoding( sckt.Get( URLCore.TVRage( String2Entities( Title ), "InfoQuick" ), Preferences.Prefs.integerForKey("TimeOut") / 2 ), Encodings.UTF8 )
		    
		    If QuickInfo.MyMid( "Show ID@", EndOfLine.UNIX ) = "" Then
		      'If NOT nc.Available Then
		      'If NOT Growl.Notify( "[TVRage] " + Title + " " + Loc.kStatus.ReplaceAll(":",""), Loc.kCouldNotBeFound.ReplaceAll("%s", Title) ) Then
		      '// NOT Growling?
		      ''If DebugBuild Then MessageBox Loc.kCouldNotBeFound.ReplaceAll("%s", Title)
		      'End If
		      'Else
		      nc.Message "[TVRage] " + Loc.kCouldNotBeFound.ReplaceAll("%s", Title)
		      'End If
		      
		      If CommonCore.MassSearch Then
		        CommonCore.UnfoundTitles.Append Title + EndOfLine + kNoTVRageIDFound
		        CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		      End If
		      
		      'If DebugBuild Then MessageBox "Quickinfo:" + EndOfLine + EndOfLine + QuickInfo
		      Return
		    End If
		    
		  End If
		  
		  TVAttr.ID_TVRage = QuickInfo.MyMid( "Show ID@", EndOfLine.UNIX )
		  
		  // Get XML/JSON
		  Dim JSONString as String
		  Dim TVRage as New JSONItem
		  
		  If QuickInfo.InStr( 0, "RFC3339@" ) = 0 And QuickInfo.InStr( 0, "Show ID@" ) > 0 Then
		    App.ErrorMessage = "JSON String Processing"
		    JSONString = DefineEncoding( sckt.Get( URLCore.TVRage( TVAttr.ID_TVRage, "InfoFull" ), Preferences.Prefs.integerForKey("TimeOut") / 2 ), Encodings.UTF8 )
		    'JSONString = RegExThis( JSONString, "<akas>.*?</akas>", "" )
		    'JSONString = RegExThis( JSONString, " country=""(.*?)""", "" )
		    'JSONString = JSONString.XML2JSON
		    
		    'If JSONString.ValidJSON("TVRage JSON") Then TVRage.Load JSONString
		    TVRage = JSONString.XML2JSON
		    If TVRage <> Nil And TVRage.HasName("Showinfo") And TVRage.Child("Showinfo").HasName("showid") Then TVRage = TVRage.Child("Showinfo")
		  End If
		  
		  
		  Dim EpisodeNr, EpisodeTitle, EpisodeAirDate as String
		  
		  App.ErrorMessage = "Next/last episode"
		  // ## Latest/last episode
		  Dim NextAiredInfo as String = QuickInfo.MyMid( "RFC3339@", EndOfLine.UNIX )
		  Dim Date as String = NextAiredInfo.NthField( "T", 1 )
		  Dim Time as String = NextAiredInfo.NthField( "T", 2 ).NthField( ":", 1 ) + ":" + NextAiredInfo.NthField( "T", 2 ).NthField( ":", 2 )
		  Dim GMT as String  = NextAiredInfo.ReplaceAll( Date + "T" + Time, "" ).ReplaceAll( ":00", "" )
		  
		  If QuickInfo.InStr( 0, "RFC3339@" ) = 0 Then
		    GMT = Trim( QuickInfo.MyMid( "GMT", EndOfLine.UNIX ).ReplaceAll("NODST","").ReplaceAll("DST", "").ReplaceAll("@","") )
		    Time = Trim( match( ".* at (.*?) ", QuickInfo.MyMid( "Airtime@", EndOfLine.UNIX ), 1 ) )
		    If QuickInfo.MyMid( "Airtime@", EndOfLine.UNIX ).InStr( 0, "pm" ) > 0 Then
		      Time = Str( Val( Time.NthField(":",1) ) + 12 ) + ":" + Time.NthField(":",2)
		    End If
		  End If
		  If QuickInfo.InStr( 0, "GMT" ) = 0 Then GMT = "0"
		  
		  If TVRage <> Nil And TVRage.HasName("timezone") And TVRage.Value("timezone") <> "" Then
		    GMT = Str( Val( TVRage.Value("timezone").StringValue.ReplaceAll( "GMT", "" ).ReplaceAll( "DST", "" ) ) )
		  End If
		  
		  
		  App.ErrorMessage = "Latest episode"
		  // Latest episode
		  Dim LatestEpisode() as String = Split( QuickInfo.MyMid( "Latest Episode@", EndOfLine.UNIX ), "^" )
		  If QuickInfo.InStr(0, "Latest Episode@") > 0 And LatestEpisode.Ubound > -1 Then
		    TVAttr.LastAired_Episode = "S"+ LatestEpisode(0).ReplaceAll( "x", "E" ) + " - " + LatestEpisode(1)
		    TVAttr.LastAired_Date    = TVRageDate2Date( LatestEpisode(2) ) + "T" + Time + "G" + GMT
		    
		    'If TVRage.HasName("airtime") And TVRage.Value("airtime") <> "" Then
		    'TVAttr.LastAired_Date = TVAttr.LastAired_Date + "T" + TVRage.Value("airtime")
		    'End If
		    '
		    'If TVRage.HasName("timezone") And TVRage.Value("timezone") <> "" Then
		    'TVAttr.LastAired_Date = TVAttr.LastAired_Date + "G" + TVRage.Value("timezone").ReplaceAll("GMT","").ReplaceAll("-DST","")
		    'End If
		  Else
		    TVAttr.LastAired_Date = ""
		    TVAttr.LastAired_Episode = ""
		  End If
		  // Debug
		  Dim LastAiredE as String = TVAttr.LastAired_Episode
		  Dim LastAiredD as String = TVAttr.LastAired_Date
		  
		  
		  App.ErrorMessage = "Next Episode"
		  // ## Next episode
		  Dim NextEpisode() as String = Split( QuickInfo.MyMid( "Next Episode@", EndOfLine.UNIX ), "^" )
		  If QuickInfo.InStr(0, "Next Episode@") > 0 And NextEpisode.Ubound > -1 Then
		    TVAttr.NextAired_Episode = "S" + NextEpisode(0).ReplaceAll( "x", "E" ) + " - " + NextEpisode(1)
		    TVAttr.NextAired_Date    = TVRageDate2Date( NextEpisode(2) ) + "T" + Time + "G" + GMT
		    
		    'If TVRage.HasName("airtime") And TVRage.Value("airtime") <> "" Then
		    'TVAttr.NextAired_Date = TVAttr.NextAired_Date + "T" + TVRage.Value("airtime")
		    'End If
		    '
		    'If TVRage.HasName("timezone") And TVRage.Value("timezone") <> "" Then
		    'TVAttr.NextAired_Date = TVAttr.NextAired_Date + "G" + TVRage.Value("timezone").ReplaceAll("GMT","").ReplaceAll("-DST","")
		    'End If
		  Else
		    TVAttr.NextAired_Date = ""
		    TVAttr.NextAired_Episode = ""
		  End If
		  
		  
		  // ## Date Premiered
		  'If QuickInfo.InStr( 0, "Started@" ) > 0 Then TVAttr.DatePremiered = TVRageDate2Date( QuickInfo.MyMid( "Started@", EndOfLine.UNIX ) )
		  
		  
		  // ## Date Ended
		  App.ErrorMessage = "Date Ended"
		  If QuickInfo.InStr( 0, "Ended@" ) > 0 Then TVAttr.DateEnded = TVRageDate2Date( QuickInfo.MyMid( "Ended@", EndOfLine.UNIX ) )
		  
		  
		  // ## Status
		  App.ErrorMessage = "Status"
		  Dim Status as String
		  If QuickInfo.InStr( 0, "Status@" ) > 0 Then Status = QuickInfo.MyMid( "Status@", EndOfLine.UNIX )
		  If Status = "" Then Status = "Hiatus"
		  TVAttr.Status = Status
		  
		  
		  Select Case Status
		    
		  Case "In Development"
		    TVAttr.Status = TVStatus_Development
		  Case "Pilot Ordered"
		    TVAttr.Status = TVStatus_PilotOrdered
		  Case "Final Season"
		    TVAttr.Status = TVStatus_FinalSeason
		  Case "Returning Series"
		    TVAttr.Status = TVStatus_ReturningSeries
		  Case "On Hiatus"
		    TVAttr.Status = TVStatus_Hiatus
		  Case "TBD/On The Bubble"
		    TVAttr.Status = TVStatus_Bubble
		  Case "Canceled/Ended"
		    TVAttr.Status = TVStatus_Ended
		  Case "New Series"
		    TVAttr.Status = TVStatus_NewSeries
		  Case "Pilot Rejected"
		    TVAttr.Status = TVStatus_PilotRejected
		  Case "Never Aired"
		    //' TODO
		  Else
		    TVAttr.Status = Status
		  End Select
		  
		  
		  
		  // ## Runtime
		  App.ErrorMessage = "Runtime"
		  If QuickInfo.InStr( 0, "Runtime@" ) > 0 Then TVAttr.DurationRuntime = Val( QuickInfo.MyMid( "Runtime@", EndOfLine.UNIX ) )
		  
		  
		  // ## Country
		  App.ErrorMessage = "Country"
		  If QuickInfo.InStr( 0, "Country@" ) > 0 Then TVAttr.Countries.Append QuickInfo.MyMid( "Country@", EndOfLine.UNIX )
		  
		  
		  // ## Classification
		  App.ErrorMessage = "Classification"
		  If QuickInfo.InStr( 0, "Classification@" ) > 0 Then TVAttr.Classification = QuickInfo.MyMid( "Classification@", EndOfLine.UNIX )
		  
		  
		  App.ErrorMessage = "Set folder label colors"
		  // Set folder label colors
		  If Preferences.Prefs.boolForKey("MatchFinderLabelsToTVStatus") Then
		    
		    Dim Clock as String = CountHours( TVAttr.NextAired_Date )
		    Dim Hours as Integer = Val( Clock )
		    
		    If Clock <> "" Then
		      App.ErrorMessage = "Clock <> """""
		      // Today & This week
		      If Hours > -24 And Round( Hours / 24 ) <= 7 Then LabelIndexSet( TVAttr.FolderParent, 6 )
		      
		      // Later then this week, but within a Month (30 days)
		      If Round( Hours / 24 ) > 7 And Round( Hours / 24 ) <= 30 Then LabelIndexSet( TVAttr.FolderParent, 3 )
		      
		      // Upcoming / Hiatus
		      If Round( Hours / 24 ) > 30 Then LabelIndexSet( TVAttr.FolderParent, 1 )
		      
		    Else
		      App.ErrorMessage = "Clock = """""
		      // To be announced
		      LabelIndexSet( TVAttr.FolderParent, 4 )
		    End If
		    
		    App.ErrorMessage = "Other Label Colors"
		    If Status.InStr( 0, "In Development" ) > 0 Then LabelIndexSet( TVAttr.FolderParent, 5 ) // Future
		    If Status.Contains( "Ended" ) OR Status.Contains("rejected") OR Status.Contains("Cancel") Then LabelIndexSet( TVAttr.FolderParent, 2 ) // Ended
		    If TVAttr.Status = TVStatus_PilotRejected OR TVAttr.Status = TVStatus_Ended Then LabelIndexSet( TVAttr.FolderParent, 2 ) // Ended
		    
		  End If
		  
		  App.ErrorMessage = ""
		  
		  Exception err as NilObjectException
		    'Dim w as New wndBugReporter
		    'w.Init( err, App.ErrorMessage )
		    if AppSettings.HandleError( err, "NilObjectException (caught at ShowStatusTVRage( " + Title + " )) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowUpdate(ID as String)
		  If TVAttr.Locked Then
		    If NOT CommonCore.MassSearch Then MessageBox Loc.kIsLocked.ReplaceAll("%@", TVAttr.Title)
		    Return
		  End If
		  
		  Dim LstBox as Listbox = wndMain.lstTVShadow
		  'CommonCore.MassSearch = False
		  
		  If ID = "" Then
		    MessageBox Loc.msgNoIDTV.ReplaceAll( "%S", TVAttr.FolderParent.Name )
		    Return
		  End If
		  
		  // Reset current search.
		  If NOT CommonCore.MassSearch Then wndMain.ccSearchBoxTVShows.srchField.StringValue = ""
		  
		  If wndMain.lstTVShows.SelCount > 1 Then
		    
		    CommonCore.MassSearch = True
		    dlgProgress.Reset
		    For i as Integer = 0 to wndMain.lstTVShows.ListCount -1
		      dlgProgress.Add( Loc.kDownloading +":", wndMain.lstTVShows.Cell( i, 0 ), 1, wndMain.lstTVShows.ListCount )
		      If NOT wndMain.lstTVShows.Selected(i) OR wndMain.lstTVShows.RowTag( i ) = "Folder" Then Continue
		      
		      If wndMain.lstTVShows.Cell( i, 1 ) <> "" Then TVAttr.FolderParent = GetFolderItem( wndMain.lstTVShows.Cell( i, 1 ), FolderItem.PathTypeShell )
		      If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Continue
		      If wndMain.lstTVShows.Cell( i, 2 ) = "" Then Continue
		      
		      TVAttr.NFORead( TVAttr.FolderParent )
		      If TVAttr.ID_TVDB <> "" Then
		        ShowByID( TVAttr.ID_TVDB )
		      ElseIf TVAttr.ID_IMDb <> "" Then
		        ShowByID( TVAttr.ID_IMDb )
		      Else
		        Continue
		      End If
		      wndMain.lstTVShows.UpdateRow( i )
		      
		    Next
		    CommonCore.MassSearch = False
		    
		  Else
		    If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", TVAttr.FolderParent.Name )
		    ShowByID ID, True
		  End If
		  
		  If NOT CommonCore.MassSearch Then
		    wndMain.lstTVShows.UpdateRow( LstBox.ListIndex )
		    wndMain.lstTVShows.Sort()
		    TVAttr.LoadImages( TVAttr.FolderParent )
		    wndMain.cvsTVShowDetails.Reload()
		  End If
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowUpdateAll()
		  Dim LstBox as Listbox = wndMain.lstTVShadow
		  CommonCore.MassSearch = True
		  ReDim CommonCore.UnFoundTitles(-1)
		  ReDim CommonCore.UnfoundPaths(-1)
		  
		  For i as Integer = 0 to LstBox.ListCount - 1
		    If LstBox.Cell( i, 2 ) = "" Then Continue // Only update scraped shows.
		    
		    TVAttr.FolderParent = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Continue // Only update if exists
		    
		    TVAttr.ClearProperties // Also gets done in NFORead, but just for sure.
		    TVAttr.NFORead( TVAttr.FolderParent )
		    If TVAttr.Locked Then Continue
		    
		    Dim Title as String = TVAttr.Title
		    Dim ID as String = TVAttr.ID_TVDB
		    If ID = "" Then ID = TVAttr.ID_IMDb
		    
		    dlgProgress.Add( Loc.kUpdating + ":", Title.ReplaceAll("&", "&&") + " " + Loc.mTabInfo.Lowercase + "..." )
		    ShowUpdate( ID )
		    
		    TVAttr.NFOWrite( TVAttr.FolderParent )
		    wndMain.lstTVShows.UpdateRow( i, Nil, True )
		    
		  Next
		  
		  If CommonCore.UnfoundTitles.Ubound > -1 Then CommonCore.ShowUnfoundTitles( "TV Show Status changes" )
		  
		  CommonCore.MassSearch = False
		  wndMain.lstSearch.CopyFrom( wndMain.lstTVShadow )
		  'wndMain.lstTVShows.ResetFolderStatus
		  wndMain.lstTVShows.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowUpdateArt(ID as String)
		  Dim Sckt as New TVDBSckt
		  
		  Dim LstBox as Listbox = wndMain.lstTVShadow
		  
		  // ## If item has not been scraped before, (No ID is available) then continue to the next item.
		  If ID = "" Then Return
		  
		  App.ErrorMessage = "Get Title"
		  Dim Title as String = TVAttr.Title 'LstBox.Cell( Lindex, 0 )
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", Title + " " + Loc.kImages.Lowercase + "..." )
		  
		  If ID.Left(2) = "tt" Then ID = Sckt.IMDb2TVDB( ID )
		  
		  
		  // ## TVDB JSON
		  App.ErrorMessage = "Download TVDB JSON"
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[TVDB] " + Title + "..." ) Else dlgProgress.debug( Loc.kDownloading + " [TVDB] " + Title )
		  Dim JSONString as String = Sckt.Get( TVCore.URL( "Art", ID ), Preferences.Prefs.integerForKey("TimeOut") )
		  Sckt.Close
		  
		  'JSONString = JSONString.XML2JSON
		  Dim TVDBArt as New JSONItem
		  'If JSONString.ValidJSON("TVDB Art") Then TVDBArt.Load( JSONString )
		  TVDBArt = JSONString.XML2JSON
		  
		  App.ErrorMessage = "Set TVDBArt JSON"
		  If TVDBArt <> Nil And TVDBArt.HasName("Banners") And TVDBArt.ToString.InStr("""Banner""") > 0 And TVDBArt.Child("Banners").HasName("Banner") Then TVDBArt = TVDBArt.Child("Banners").Child("Banner")
		  JSONString = ""
		  
		  
		  // ## FanartTV
		  App.ErrorMessage = "Download FanartTV JSON"
		  If NOT CommonCore.MassSearch Then dlgProgress.Add( Loc.kDownloading + ":", "[FanartTV] " + Title + "..." ) Else dlgProgress.debug( Loc.kDownloading + " [FanartTV] " + Title )
		  if DebugBuild or False then
		    dim fanartTVurl as string = URLCore.FanartTV(ID)
		    dim fanartTVJSONString as string' = Sckt.Get( fanartTVurl, 60 )
		    
		    
		    if fanartTVurl.Contains("https:") then
		      dim secureSckt as new HTTPSecureSocket
		      fanartTVJSONString = secureSckt.Get(fanartTVurl, 60)
		    else
		      fanartTVJSONString = Sckt.Get(fanartTVurl, 60)
		    end if
		    fanartTVJSONString = DefineEncoding( fanartTVJSONString, Encodings.UTF8 )
		    JSONString = Trim( fanartTVJSONString )
		  end if
		  
		  JSONString = Trim( DefineEncoding( Sckt.Get( URLCore.FanartTV( ID ), Preferences.Prefs.integerForKey("TimeOut") ), Encodings.UTF8 ) )
		  
		  App.ErrorMessage = "Set FanartTV JSON"
		  
		  Dim FanartTVJSON as New JSONItem
		  If JSONString.ValidJSON("Fanart.TV") Then FanartTVJSON.Load( JSONString )
		  JSONString = ""
		  
		  
		  // ## And... ACTION!
		  App.ErrorMessage = "Sckt.GetArt( TVDBArt, FanartTVJSON )"
		  Sckt.GetArt( TVDBArt, FanartTVJSON )
		  
		  
		  // Write NFO
		  App.ErrorMessage = "Write NFO"
		  If NOT CommonCore.MassSearch Then
		    TVAttr.NFOWrite( TVAttr.FolderParent )
		    wndMain.lstTVShows.UpdateRow
		    
		    TVAttr.LoadImages( TVAttr.FolderParent )
		    wndMain.cvsTVShowDetails.Reload
		  End If
		  
		  App.ErrorMessage = ""
		  
		  Exception err as NilObjectException
		    'Dim w as New wndBugReporter
		    'w.Init( err, "ShowUpdateArt( " + ID + " )" + Chr(13) + App.ErrorMessage )
		    
		    if AppSettings.HandleError( err, "NilObjectException (caught at ShowUpdateArt( " + ID + " )) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowUpdateArtAll()
		  Dim LstBox as Listbox = wndMain.lstTVShadow
		  CommonCore.MassSearch = True
		  
		  For i as Integer = 0 to LstBox.ListCount -1
		    Dim ID as String = LstBox.Cell( i, 2 )
		    If ID = "" Then Continue
		    
		    TVAttr.FolderParent = GetFolderItem( LstBox.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If TVAttr.FolderParent = Nil OR NOT TVAttr.FolderParent.Exists Then Continue
		    
		    TVAttr.NFORead( TVAttr.FolderParent )
		    If TVAttr.Locked Then Continue
		    dlgProgress.Add( Loc.kDownloading + ":", TVAttr.Title + " " + Loc.kImages.Lowercase + "..." )
		    
		    If TVAttr.ID_TVDB <> "" Then
		      ShowUpdateArt( TVAttr.ID_TVDB )
		    Else
		      ShowUpdateArt( TVAttr.ID_IMDb )
		    End If
		    
		    TVAttr.NFOWrite( TVAttr.FolderParent )
		    wndMain.lstTVShows.UpdateRow( i, Nil, True )
		  Next
		  
		  If CommonCore.UnfoundTitles.Ubound > -1 Then CommonCore.ShowUnfoundTitles( "TV Art changes" )
		  
		  CommonCore.MassSearch = False
		  wndMain.lstSearch.CopyFrom( wndMain.lstTVShadow )
		  wndMain.lstTVShows.ResetFolderStatus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowUpdateRating(ID as String)
		  If ID = "" Then Return
		  
		  Dim Sckt as New TVDBSckt
		  Dim JSONString as String
		  Dim IMDbID as String
		  
		  // :1 TVDB Alias
		  
		  If ID.Left(2) = "tt" Then
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Add( Loc.kUpdating + ":", "[TVDB Alias] " + TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "..." )
		    Else
		      dlgProgress.Debug( "[TVDB Alias] " + TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "..." )
		    End If
		    
		    IMDbID = ID
		    
		    JSONString = DefineEncoding( sckt.Get( TVCore.URL( "InfoAlias", ID ), Preferences.Prefs.integerForKey("TimeOut") / 2 ), Encodings.UTF8 )
		    sckt.Close
		    
		    'JSONString = JSONString.XML2JSON
		    
		    Dim TVDBAlias as New JSONItem
		    'If JSONString.ValidJSON("TVDB Alias") Then TVDBAlias.Load JSONString
		    TVDBAlias = JSONString.XML2JSON
		    
		    If TVDBAlias.HasName("Data") And TVDBAlias.ToString.InStr( 0, "Series" ) > 0 And TVDBAlias.Child("Data").HasName("Series") And TVDBAlias.Child("Data").Child("Series").HasName("id") Then
		      ID = TVDBAlias.Child("Data").Child("Series").Value("id")
		    End If
		    JSONString = ""
		  End If
		  
		  
		  // :2 TVDB
		  Dim TVDB as New JSONItem
		  If ID.Left(2) <> "tt" Then
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Add( Loc.kUpdating + ":", "[TVDB] " + TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "..." )
		    Else
		      dlgProgress.Debug( "[TVDB] " + TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "..." )
		    End If
		    
		    Dim XMLString as String = DefineEncoding( sckt.Get( TVCore.URL( "InfoShort", ID ), Preferences.Prefs.integerForKey("TimeOut") / 2 ), Encodings.UTF8 )
		    sckt.Close
		    'XMLString = DecodingFromHTMLMBS( XMLString )
		    
		    
		    'JSONString = XMLString.XML2JSON
		    'If JSONString.ValidJSON("TVDB Local") Then TVDB.Load JSONString
		    TVDB = XMLString.XML2JSON
		    If TVDB.HasName("Data") And TVDB.ToString.InStr( 0, "Series" ) > 0 And TVDB.Child("Data").HasName("Series") Then TVDB = TVDB.Child("Data").Child("Series")
		    
		    XMLString = ""
		    JSONString = ""
		  End If
		  
		  
		  // IMDb
		  'Dim IMDbID as String = ID
		  If IMDbID.Left(2) <> "tt" Then
		    If TVDB.HasName("IMDB_ID") And TVDB.Value("IMDB_ID") <> "" Then IMDbID = TVDB.Value("IMDB_ID")
		  End If
		  
		  Dim IMDb as New JSONItem
		  If IMDbID.Left(2) = "tt" Then
		    If NOT CommonCore.MassSearch Then
		      dlgProgress.Add( Loc.kUpdating + ":", "[IMDb] " + TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "..." )
		    Else
		      dlgProgress.Debug( "[IMDb] " + TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "..." )
		    End If
		    
		    IMDb = GetIMDbJSON( IMDbID, True )
		    'JSONString = IMDBjson( IMDbID, True )
		    'JSONString = JSONString
		    
		    'If JSONString.ValidJSON("IMDb") Then IMDb.Load JSONString
		    'JSONString = ""
		  End If
		  
		  
		  // -- Process Data
		  If NOT CommonCore.MassSearch Then
		    dlgProgress.Add( Loc.kProcessing + ":", TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "..." )
		  Else
		    dlgProgress.Debug( Loc.kProcessing + " " + TVAttr.Title + " " + Loc.mRating.ReplaceAll(":","").Lowercase + "..." )
		  End If
		  
		  // TVDB
		  If TVDB.HasName("Rating")        And TVDB.Value("Rating")        <> "" Then TVAttr.Rating      = TVDB.Value("Rating")
		  If TVDB.HasName("RatingCount")   And TVDB.Value("RatingCount")   <> "" Then TVAttr.RatingVotes = TVDB.Value("RatingCount")
		  If TVDB.HasName("ContentRating") And TVDB.Value("ContentRating") <> "" Then TVAttr.RatingMPAA   = TVDB.Value("ContentRating")
		  
		  If TVDB.HasName("Network") And TVDB.Value("Network") <> "" Then TVAttr.TVNetwork = TVDB.Value("Network")
		  
		  
		  // IMDB
		  If IMDb.HasName("RATING")      And IMDb.Value("RATING")      <> "" Then TVAttr.Rating      = IMDb.Value("RATING")
		  If IMDb.HasName("VOTES")       And IMDb.Value("VOTES")       <> "" Then TVAttr.RatingVotes = IMDb.Value("VOTES")
		  If IMDb.HasName("MPAA_RATING") And IMDb.Value("MPAA_RATING") <> "" Then TVAttr.RatingMPAA  = IMDb.Value("MPAA_RATING")
		  
		  If IMDb.HasName("RECOMMENDED_TITLES") And IMDb.Child("RECOMMENDED_TITLES").IsArray And IMDb.Child("RECOMMENDED_TITLES").Count > 0 Then
		    ReDim TVAttr.RecShows(-1)
		    ReDim TVAttr.RecShow_IDs(-1)
		    
		    For i as Integer = 0 to IMDb.Child("RECOMMENDED_TITLES").Count -1
		      Dim RecTitle as String = Trim( RegExThis( IMDb.Child("RECOMMENDED_TITLES").Value(i), "\[.*\]", "" ) )
		      Dim RecID as String    = Trim( RegExThis( IMDb.Child("RECOMMENDED_TITLES").Value(i), ".*\[", "" ) ).ReplaceAll("]","")
		      If RecTitle = "" Then RecTitle = Loc.kNotAvailable
		      
		      TVAttr.RecShows.Append    RecTitle
		      TVAttr.RecShow_IDs.Append RecID
		    Next
		    
		  End If
		  
		  
		  TVAttr.NFOWrite( TVAttr.FolderParent )
		  If NOT CommonCore.MassSearch Then
		    wndMain.lstTVShows.UpdateRow
		    TVAttr.LoadImages( TVAttr.FolderParent )
		    wndMain.cvsTVShowDetails.Reload
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URL(sMethod as String, sProperty as String, Lang as String = "", SeasonNr as String = "", EpisodeNr as String = "") As String
		  
		  If Lang = "" Then Lang = Preferences.Prefs.stringForKey("DBLanguage").NthField( "-", 1 )
		  If Lang = "gb" Then Lang = "en"
		  
		  Select Case sMethod
		    
		  case "Search"
		    Return MirrorPath + "/api/GetSeries.php?seriesname=" + EncodeURLComponent( sProperty ) + "&language=all" + "&alllang=1"
		    
		    
		  case "InfoAlias"
		    Return "http://thetvdb.com/api/GetSeriesByRemoteID.php?imdbid=" + sProperty' + "&language=" + Lang
		    
		  case "Info"
		    Return MirrorPath + "/api/" + ApiKey + "/series/" + sProperty + "/all/" + Lang + ".xml"
		    
		  case "InfoShort"
		    Return MirrorPath + "/api/" + ApiKey + "/series/" + sProperty + "/" + Lang + ".xml"
		    
		    
		  case "EpisodeInfo"
		    Return MirrorPath + "/api/" + ApiKey + "/series/" + sProperty + "/default/" + SeasonNr + "/" + EpisodeNr + "/ " + Lang + ".xml"
		    
		  case "Episode"
		    Return MirrorPath + "/api/" + ApiKey + "/episodes/" + sProperty + "/" + Lang + ".xml"
		    
		    
		  Case "Actors"
		    Return MirrorPath + "/api/" + ApiKey + "/series/" + sProperty + "/actors.xml"
		    
		  Case "Art"
		    Return MirrorPath + "/api/" + ApiKey + "/series/" + sProperty + "/banners.xml"
		    
		    
		  case "EpisodeGuide"
		    Return MirrorPath + "/api/" + ApiKey + "/series/" + sProperty + "/all/" + Lang + ".zip"
		    
		  End Select
		End Function
	#tag EndMethod


	#tag Constant, Name = ApiKey, Type = String, Dynamic = False, Default = \"47B3269189813ECF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = GraphicsPath, Type = String, Dynamic = False, Default = \"https://www.thetvdb.com/banners/", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNoShowsFoundTryAgain, Type = String, Dynamic = True, Default = \"No television series were found\x2C try again with fewer keywords or an alternative title.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No television series were found\x2C try again with fewer keywords or an alternative title."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen televisie series gevonden\x2C probeer opnieuw met minder sleutel woorden of een alternatieve titel."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Keine Serie gefunden. Versuche es mit weniger Suchw\xC3\xB6rtern oder mit einem anderen Titel."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ingen TV-serie hittades. F\xC3\xB6rs\xC3\xB6k igen med f\xC3\xA4rre nyckelord eller annan titel."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aucune S\xC3\xA9rie TV trouv\xC3\xA9e\x2C veuillez modifier vos mots cl\xC3\xA9s ou essayer un titre alternatif."
	#tag EndConstant

	#tag Constant, Name = kNoTVRageIDFound, Type = String, Dynamic = True, Default = \"No TVRage ID found\x2C airing status has not been updated.", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No TVRage ID found\x2C airing status has not been updated."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen TVRage ID gevonden\x2C uitzend status is niet veranderd."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kein TVRage ID gefunden hat\x2C Broadcast-Status nicht ge\xC3\xA4ndert."
	#tag EndConstant

	#tag Constant, Name = kStatusChangedCanceled, Type = String, Dynamic = True, Default = \"has been canceled.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"has been canceled."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"is geannuleerd."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"wurde abgesetzt."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"a \xC3\xA9t\xC3\xA9 annul\xC3\xA9."
	#tag EndConstant

	#tag Constant, Name = kStatusChangedFrom, Type = String, Dynamic = True, Default = \"changed status from", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"changed status from"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"veranderde status van"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Status \xC3\xA4ndern von"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"statut modifi\xC3\xA9 depuis"
	#tag EndConstant

	#tag Constant, Name = kStatusChangedToAired, Type = String, Dynamic = True, Default = \"has been announced to air in", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"has been announced to air in"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"is aangekondigt om weer te beginnen in"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ausstrahlung angek\xC3\xBCndigt in"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"a \xC3\xA9t\xC3\xA9 annonc\xC3\xA9 pour \xC3\xAAtre diffus\xC3\xA9 en"
	#tag EndConstant

	#tag Constant, Name = kStatusChanges, Type = String, Dynamic = True, Default = \"TV show status changes", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"TV show status changes"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Televisie series status veranderingen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Serien Status ge\xC3\xA4ndert"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Le statut de cette S\xC3\xA9rie TV change"
	#tag EndConstant

	#tag Constant, Name = kStatusHasChanged, Type = String, Dynamic = True, Default = \"has been changed to", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"has been changed to"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"is gewijzigd naar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"wurde ge\xC3\xA4ndert in"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"a \xC3\xA9t\xC3\xA9 modifi\xC3\xA9 vers"
	#tag EndConstant

	#tag Constant, Name = MirrorPath, Type = String, Dynamic = False, Default = \"https://www.thetvdb.com", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TVStatus_Bubble, Type = String, Dynamic = True, Default = \"TBD/On The Bubble", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"TBD/On The Bubble"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Onaangekondigd/Op het randje"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"TBD/On The Bubble"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"TBD/On The Bubble"
	#tag EndConstant

	#tag Constant, Name = TVStatus_Development, Type = String, Dynamic = True, Default = \"In Development", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"In Development"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"In ontwikkeling"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"In Entwicklung"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Under produktion"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"En d\xC3\xA9veloppement"
	#tag EndConstant

	#tag Constant, Name = TVStatus_Ended, Type = String, Dynamic = True, Default = \"Canceled/Ended", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Canceled/Ended"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geannuleerd/Be\xC3\xABindigd"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Abgebrochen/Beendet"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Avslutad"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Annul\xC3\xA9/Termin\xC3\xA9"
	#tag EndConstant

	#tag Constant, Name = TVStatus_FinalSeason, Type = String, Dynamic = True, Default = \"Final Season", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Final Season"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Laatste seizoen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Letzte Staffel"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Sista s\xC3\xA4song"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Saison finale"
	#tag EndConstant

	#tag Constant, Name = TVStatus_Hiatus, Type = String, Dynamic = True, Default = \"On Hiatus", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"On Hiatus"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"In hiatus"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"On Hiatus"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Interrompu"
	#tag EndConstant

	#tag Constant, Name = TVStatus_NewSeries, Type = String, Dynamic = True, Default = \"New Series", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"New Series"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Nieuwe Serie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Neue Serie"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ny serie"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouvelles S\xC3\xA9ries"
	#tag EndConstant

	#tag Constant, Name = TVStatus_PilotOrdered, Type = String, Dynamic = True, Default = \"Pilot Ordered", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Pilot Ordered"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Piloot besteld"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Pilot bestellt"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\"Pilote\" programm\xC3\xA9"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Pilot \xC3\xA4r best\xC3\xA4lld"
	#tag EndConstant

	#tag Constant, Name = TVStatus_PilotRejected, Type = String, Dynamic = True, Default = \"Pilot Rejected", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Pilot Rejected"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Piloot afgekeurd"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\"Pilote\" non programm\xC3\xA9"
	#tag EndConstant

	#tag Constant, Name = TVStatus_ReturningSeries, Type = String, Dynamic = True, Default = \"Returning Series", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Returning Series"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Terugkerende serie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Reaktivierte Serie"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"\xC3\x85terkommande avsnitt"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"S\xC3\xA9ries r\xC3\xA9currentes"
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

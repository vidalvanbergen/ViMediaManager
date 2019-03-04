#tag Module
Protected Module IMDb
	#tag Method, Flags = &h0
		Function FindOnAnidDB(Name as String) As String
		  Dim sckt as New HTTPSocket
		  
		  Dim HTML as String = Sckt.Get( "http://www.google.com/search?q=site:anidb.net+" + EncodeURLComponent( Trim( Name ) ) + "&filter=0", 60 )
		  Dim ID as String = match( "anidb.net\/.*?aid=(.*?)<\/", HTML, 1 )
		  
		  If Trim( ID ) <> "" Then
		    Return ID
		  Else
		    MessageBox "No title found on google!" + chr(13) + chr(13) + Name
		    Return ""
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIMDbJSON(TitleID as String, Short as Boolean = False) As JSONItem
		  If TitleID = "" Then Return Nil
		  
		  Dim Info as String = "GetIMDbJSON( " + TitleID +", " + Str( Short ) + " )"
		  App.ErrorMessage = Info
		  
		  Dim Sckt as New HTTPSocket
		  Sckt.Yield = True
		  Dim IMDbJSON as New JSONItem
		  Dim HTML as String
		  
		  Dim rand as New Random
		  Dim IP as String = Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) )
		  Sckt.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  Sckt.SetRequestHeader( "User-agent", "Mozilla/" + Str( rand.InRange(3,5) ) + "." + Str( rand.InRange(0,3) ) + " (Windows NT " + Str( rand.InRange(3,5) ) + "." + Str( rand.InRange(0,2) ) + "; rv:2.0.1) Gecko/20100101 Firefox/" + Str( rand.InRange(3,5) ) + ".0.1" )
		  
		  
		  If TitleID.Left(2) = "tt" Then
		    HTML = DefineEncoding( CURLGet( "https://www.imdb.com/title/" +Trim(TitleID)+ "/"), Encodings.UTF8 ).ReplaceAll("\n", EndOfLine)
		    'HTML = Trim( DefineEncoding( Sckt.Get( "https://www.imdb.com/title/" + Trim( TitleID ) + "/", 60 ), Encodings.UTF8 ) ).ReplaceAll("\n", EndOfLine)
		    'Sckt.Close
		    
		    
		    If HTML.InStr( 0, "The document has moved" ) > 0 Then
		      Dim NewID as String = match( "The document has moved <A HREF=""(.*?)""", HTML, 1 )
		      Dim NewHTML as String = Trim( DefineEncoding( Sckt.Get( NewID, 60 ), Encodings.UTF8 ) ).ReplaceAll("\n", EndOfLine)
		      
		      If NewHTML <> "" Then HTML = NewHTML
		    End If
		    
		    
		    'If HTML.InStr( 0, "<meta name=""application-name"" content=""IMDb"" />" ) = 0 Then
		    If HTML.InStr( 0, "404 Error" ) > 0 and HTML.InStr(0, "When 404 Error Page Happens" ) = 0 Then
		      
		      'If NOT nc.Available Then
		      '// Use growl fallback.
		      'If NOT Growl.Notify( "IMDb Search", kNoTitleFoundOnIMDb.ReplaceAll( "%ID", TitleID ) ) Then
		      '#If DebugBuild Then MessageBox "No title found on IMDb!" + chr(13) + chr(13) + TitleID
		      'End If
		      'Else
		      nc.Message kNoTitleFoundOnIMDb.ReplaceAll( "%ID", TitleID )
		      'End If
		      
		      If CommonCore.MassSearch Then
		        CommonCore.UnfoundTitles.Append "IMDb Search" + chr(13) + kNoTitleFoundOnIMDb.ReplaceAll( "%ID", TitleID )
		        If ActiveSection = 0 Then
		          CommonCore.UnfoundPaths.Append MovieAttr.FolderParent
		        ElseIf ActiveSection = 1 Then
		          CommonCore.UnfoundPaths.Append TVAttr.FolderParent
		        End If
		        
		      End If
		      
		      Return Nil
		    End If
		    
		    
		  Else
		    HTML = Sckt.Get( "http://www.google.com/search?q=imdb+" + EncodeURLComponent( Trim( TitleID ) ), 60 )
		    Dim ID as String = match( "https:\/\/www.imdb.com\/title\/(tt\d+).*?"".*?>.*?<\/a>", HTML, 1 )
		    
		    If ID.Left(2) = "tt" Then
		      Return GetIMDbJSON( ID )
		    Else
		      'If NOT nc.Available Then
		      'If NOT Growl.Notify( kNotFoundOnGoogle.ReplaceAll("%title", TitleID), "" ) And NOT CommonCore.MassSearch Then
		      'MessageBox kNotFoundOnGoogle + chr(13) + chr(13) + TitleID
		      'End If
		      'Else
		      nc.Message kNotFoundOnGoogle.ReplaceAll("%title", TitleID)
		      'End If
		      
		      Return Nil
		    End If
		    
		  End If
		  
		  IMDbJSON.Compact = False
		  IMDbJSON.IndentSpacing = 2
		  Dim EmptyArray() as String
		  Info = Info + " HTML: " + Str( Trim( HTML ) <> "" )
		  
		  App.ErrorMessage = Info + " - Processing basics"
		  IMDbJSON.Value("TITLE_ID")        = Trim( match( "<link rel=""canonical"" href=""https:\/\/www.imdb.com\/title\/(tt\d+)\/"" \/>", HTML, 1 ).ReplaceAll("<i>(original title)", "" ) )
		  IMDbJSON.Value("TITLE")           = Trim( match( "<title>(IMDb \- )*(.*?) \(.*?<\/title>", HTML, 2 ).ReplaceAll("<i>(original title)", "" ) )
		  IMDbJSON.Value("ORIGINAL_TITLE")  = Trim( match( "class=""title-extra"".*?>(.*?)</", HTML, 1 ).ReplaceAll("<i>(original title)", "" ).ReplaceAll("""","") )
		  if IMDbJSON.Value("ORIGINAL_TITLE") = "" Then IMDbJSON.Value("ORIGINAL_TITLE") = IMDbJSON.Value("TITLE")
		  IMDbJSON.Value("USA_TITLE")       = ""
		  IMDbJSON.Value("AKA")             = Trim( match( "Also Known As.?:<\/h4>(.*?)(<span|<\/div)", HTML, 1 ) )
		  IMDbJSON.Value("ALSO_KNOWN_AS")   = ValueArray( EmptyArray )
		  
		  IMDbJSON.Value("YEAR")            = Trim( match( "<title>.*?\(.*?(\d{4}).*?\).*?<\/title>", HTML, 1 ) )
		  IMDbJSON.Value("RELEASE_DATE")    = match( "Release Date:<\/h4>.*?([0-9][0-9]? (January|February|March|April|May|June|July|August|September|October|November|December) (19|20)[0-9][0-9]).*?(\(|<span)", HTML, 1 )
		  IMDbJSON.Value("RELEASE_DATES")   = ValueArray( EmptyArray )
		  
		  HTML = HTML.ReplaceAll( HTML.MyMid("<head>", "</head>"), "" ).ReplaceAll("<head></head>", "")
		  IMDbJSON.Value("RUNTIME")         = match( "Runtime:<\/h4>.*?(\d+) min.*?<\/div>", HTML, 1 )
		  If IMDbJSON.Value("RUNTIME")      = "" Then IMDbJSON.Value("RUNTIME") = Trim( match( "infobar.*?(\d+) min.*?<\/div>", HTML, 1 ) )
		  
		  IMDbJSON.Value("TOP_250")         = match( "Top Rated Movies #(\d+)", HTML, 1 )
		  IMDbJSON.Value("RATING")          = Trim( match("class=""ratingValue"">.*?(\d\.\d).*?</span>", HTML, 1 ) )
		  IMDbJSON.Value("VOTES")           = match("based on (.*?) user ratings", HTML, 1 ) 'match("ratingCount"">(\d+,?\d*)<\/span>", HTML, 1 )
		  IMDbJSON.Value("MPAA_RATING")     = Trim( match( "Motion Picture Rating(.*?)<\/span>", HTML, 1 ) ).RemoveTags  'Trim( match( "<span itemprop=""contentRating"">(.*?)(<\/span>|<a)", HTML, 1 ) )
		  IMDbJSON.Value("CERTIFICATIONS")  = ValueArray( EmptyArray )
		  IMDbJSON.Value("OSCARS")          = match( "Nominated for.*?(\d+).*?Oscar(s|).", HTML, 1 )
		  IMDbJSON.Value("AWARDS")          = match("(\d+) wins", HTML, 1 )
		  IMDbJSON.Value("NOMINATIONS")     = match("(\d+) nominations", HTML, 1 )
		  
		  IMDbJSON.Value("GENRES")          = ValueArray( match_all( "<a.*?>(.*?)<\/a>", match( "Genre.?:(.*?)(<\/div>|See more)",   HTML, 1 ) ) )
		  
		  IMDbJSON.Value("TAGLINE")         = match( "Tagline.?:<\/h4>(.*?)(<span|<\/div)", HTML, 1 )
		  IMDbJSON.Value("TAGLINES")        = ValueArray( EmptyArray )
		  Dim Source as String = HTML.MyMid( "id=""title-overview-widget-layout"">", "</table>" )
		  IMDbJSON.Value("PLOT")            = Trim( RemoveTags( match( "class=""summary_text"">(.*?)(<\/div>|<a)", Source, 1 ) ) )
		  'IMDbJSON.Value("PLOT")            = Trim( RemoveTags( match( "id=""overview-top"">.*?<p itemprop=""description"">(.*?)(<\/p>|<a|<\/td)", HTML, 1 ) ) )
		  IMDbJSON.Value("STORYLINE")       = Trim( RemoveTags( match("Storyline<\/h2>(.*?)(<em|<\/p>|<\/span)", HTML, 1 ).ReplaceAll( "<p>", "" ).ReplaceAll("<div class=""inline canwrap"">", "").ReplaceAll("<span itemprop=""description"">", "").ReplaceAll("<span>","") ) )
		  IMDbJSON.Value("STORYLINES")      = ValueArray( EmptyArray )
		  
		  IMDbJSON.Value("DIRECTORS")       = ValueArray( match_all( "<a.*?>(.*?)<\/a>", match( "Director.?:(.*?)(<\/div>|>.?and )", HTML, 1 ) ) )
		  IMDbJSON.Value("WRITERS")         = ValueArray( match_all( "<a.*?>(.*?)<\/a>", match( "Writer.?:(.*?)(<\/div>|>.?and )",   HTML, 1 ) ) )
		  IMDbJSON.Value("STARS")           = ValueArray( match_all( "<a.*?>(.*?)<\/a>", match( "Stars:(.*?)(<\/div>|See full cast & crew|<span>\|)",     HTML, 1 ) ) )
		  IMDbJSON.Value("CAST")            = ValueArray( MatchArray( match_all( "<td class=""primary_photo"">(.*?)</td>", HTML ), "title=""(.*?)""" ) )
		  'ValueArray( MatchArray( match_all( "<td.*?itemprop=""actor"".*?>(.*?)<\/td>", HTML ), "<a.*?>.*?<span.*?>(.*?)<\/span>" ) ) 'ValueArray( MatchArray( match_all( "<td class=""name"">(.*?)<\/td>", HTML ), "<a.*?>(.*?)<\/a>" ) )
		  
		  IMDbJSON.Value("ROLES")           = ValueArray( match_all( "<td class=""character"">(.*?)<\/td>", HTML ) ) 'ValueArray( MatchArray( match_all( "<td class=""character"">(.*?)<\/td>", HTML ), "<a.*?>(.*?)<\/a>" ) )
		  For i as Integer = 0 to IMDbJSON.Child("ROLES").Count -1
		    If IMDbJSON.Child("ROLES").Value(i).StringValue.Instr( 0, "<a" ) > 0 and IMDbJSON.Child("ROLES").Value(i).StringValue.InStr(0, "/characters/") > 0 Then
		      IMDbJSON.Child("ROLES").Value(i) = match( "<a.*?>(.*?)<\/a>", IMDbJSON.Child("ROLES").Value(i), 1 )
		    End If
		    
		    If IMDbJSON.Child("ROLES").Value(i).StringValue.InStr( 0, "<div" ) > 0 Then
		      'IMDbJSON.Child("ROLES").Value(i) = Trim( match( "<div>(.*?)<\/", IMDbJSON.Child("ROLES").Value(i) ) )
		      
		      Dim s as String = IMDbJSON.Child("ROLES").Value(i).StringValue
		      s = s.ReplaceAll( "<div>", "" )
		      s = s.ReplaceAll( "</div>", "" )
		      s = s.ReplaceAll( "\n", "" )
		      s = s.ReplaceAllRegEx("<a.*?>(.*?)<\/a>")
		      s = Trim( s )
		      
		      IMDbJSON.Child("ROLES").Value(i) = s 'Trim( IMDbJSON.Child("ROLES").Value(i).ReplaceAll("<div>", "").ReplaceAll("<\/div>", "").ReplaceAll("\n", "") )
		    End If
		    
		    IMDbJSON.Child("ROLES").Value(i) = ReplaceAll( IMDbJSON.Child("ROLES").Value(i), "&nbsp;", "" )
		    IMDbJSON.Child("ROLES").Value(i) = ReplaceAll( IMDbJSON.Child("ROLES").Value(i), "...", "" )
		    IMDbJSON.Child("ROLES").Value(i) = trim( IMDbJSON.Child("ROLES").Value(i) )
		    if IMDbJSON.Child("ROLES").Value(i).StringValue.right(1) = "/" then
		      IMDbJSON.Child("ROLES").Value(i) = Trim( IMDbJSON.Child("ROLES").Value(i).StringValue.left( IMDbJSON.Child("ROLES").Value(i).StringValue.len -1 ) )
		    end if
		    if IMDbJSON.Child("ROLES").Value(i).StringValue.Contains("\n") then
		      IMDbJSON.Child("ROLES").Value(i) = Trim( IMDbJSON.Child("ROLES").Value(i).StringValue.Left( IMDbJSON.Child("ROLES").Value(i).StringValue.InStr("\n") ) )
		    end if
		    
		    'IMDbJSON.Child("ROLES").Value(i) = IMDbJSON.Child("ROLES").Value(i).left( IMDbJSON.Child("ROLES").Value(i).instr( "\n" ) + 1 )
		    
		    IMDbJSON.Child("ROLES").Value(i) = Trim( RegExThis( IMDbJSON.Child("ROLES").Value(i), "\(.*\)" ) )
		  Next
		  
		  IMDbJSON.Value("CASTTHUMBS")      = ValueArray( MatchArray( match_all( "<td class=""primary_photo"">(.*?)<\/td>", HTML ), "<img.*loadlate=""(.*?)"".*\/>" ) )
		  App.ErrorMessage = Info + " - " + "CastThumbs"
		  For i as Integer = 0 to IMDbJSON.Child("CASTTHUMBS").Count -1
		    IMDbJSON.Child("CASTTHUMBS").Value(i) = RegExThis( IMDbJSON.Child("CASTTHUMBS").Value(i), "_V1.*?.jpg", "_V1_SY750.jpg" )
		  Next
		  
		  IMDbJSON.Value("LANGUAGE")        = ValueArray( match_all( "<a.*?>(.*?)<\/a>", match( "Language.?:(.*?)(<\/div>|>.?and )", HTML, 1 ) ) )
		  IMDbJSON.Value("COUNTRY")         = ValueArray( match_all( "<a.*?>(.*?)<\/a>", match( "Country:(.*?)(<\/div>|>.?and )", HTML, 1 ) ) )
		  IMDbJSON.Value("STUDIOS")         = ValueArray( match_all( "<a.*?>(.*?)<\/a>", match( "Production Co:(.*?)(<\/div>|See more)", HTML, 1 ) ) )
		  
		  IMDbJSON.Value("RECOMMENDATIONS") = ValueArray( EmptyArray )
		  
		  IMDbJSON.Value("POSTER")          = match("<div class=""poster"">.*?src=""(.*?)""", Source, 1 ) 'match("img_primary"">.*?<img.*?src=""(.*?)"".*?<\/td>", Source, 1 )
		  IMDbJSON.Value("POSTER_LARGE")    = ""
		  IMDbJSON.Value("POSTER_SMALL")    = ""
		  IMDbJSON.Value("POSTER_FULL")     = ""
		  If IMDbJSON.Value("POSTER").StringValue <> "" Then
		    IMDbJSON.Value("POSTER_LARGE")  = IMDbJSON.Value("POSTER").StringValue.ReplaceAll("_V1_UX182_CR0,0,182,268_AL_.jpg", "_V1_SY500.jpg") 'RegExThis( IMDbJSON.Value("POSTER"), "_V1_.*?.jpg", "_V1_SY500.jpg" )
		    IMDbJSON.Value("POSTER_SMALL")  = IMDbJSON.Value("POSTER").StringValue.ReplaceAll("_V1_UX182_CR0,0,182,268_AL_.jpg", "_V1_SY150.jpg") 'RegExThis( IMDbJSON.Value("POSTER"), "_V1_.*?.jpg", "_V1_SY150.jpg" )
		    IMDbJSON.Value("POSTER_FULL")   = IMDbJSON.Value("POSTER").StringValue.ReplaceAll("_V1_UX182_CR0,0,182,268_AL_.jpg", "_V1_SY0.jpg") 'RegExThis( IMDbJSON.Value("POSTER"), "_V1_.*?.jpg", "_V1_SY0.jpg" )
		  End If
		  
		  IMDbJSON.Value("MEDIA_IMAGES")    = ValueArray( EmptyArray )
		  
		  
		  
		  If NOT Short Then
		    
		    // Also Known as & Release INFO
		    Dim ReleaseInfoHTML as String = DefineEncoding( CURLGet( "https://www.imdb.com/title/" + TitleID + "/releaseinfo" ), Encodings.UTF8 )
		    Sckt.Close
		    
		    Dim AKATableRows() as String = match_all( "<tr(.*?)<\/tr>", match( "id=""akas""(.*?)<\/table>", ReleaseInfoHTML, 1 ) )
		    Dim AKAS() as String
		    Dim USATitle as String
		    App.ErrorMessage = Info + " - " + "AKA/USA Titles"
		    For i as Integer = 0 to AKATableRows.Ubound
		      Dim NameCountry() as String = match_all( "<td>(.*?)<\/td", AKATableRows(i) )
		      If NameCountry.Ubound >= 1 then' And NameCountry(1).InStr( 0, "USA" ) > 0 Then
		        if NameCountry(0).Contains("USA") then USATitle = NameCountry(1)
		        AKAS.Append NameCountry(0) + " = " + NameCountry(1)
		      End If
		    Next
		    IMDbJSON.Value("ALSO_KNOWN_AS") = ValueArray( AKAS )
		    IMDbJSON.Value("USA_TITLE") = USATitle
		    
		    Dim DateTableRows() as String = match_all( "<tr(.*?)<\/tr>", match( "id=""release_dates""(.*?)<\/table>", ReleaseInfoHTML ) )
		    Dim Dates() as String
		    App.ErrorMessage = Info + " - " + "All country titles"
		    For i as Integer = 0 to DateTableRows.Ubound
		      Dim Country as String = match( "<a .*?>(.*?)<\/a>", DateTableRows(i), 1 )
		      Dim Date as String = match( "<td class=\""release_date\"">(.*?)</td>", DateTableRows(i), 1 )
		      date = Trim( RegExThis( Date, " <a href=\"".*?\"" >", ", " ).ReplaceAll("</a>","") )
		      
		      if Country <> "" then
		        Dates.Append Date + " = " + Country
		      end if
		    Next
		    IMDbJSON.Value("RELEASE_DATES") = ValueArray( Dates )
		    
		    // Storylines
		    App.ErrorMessage = Info + " - " + "Storylines"
		    Dim StoryLinesHTML as String = DefineEncoding( CURLGet( "https://www.imdb.com/title/" + TitleID + "/plotsummary" ), Encodings.UTF8 )
		    Sckt.Close
		    
		    dim storylist as String = match("id=""plot-summaries-content""(.*?)</ul>", StoryLinesHTML, 0)
		    dim plots() as String = match_all("<li.*?>(.*?)<\/li>", storylist, 1)
		    
		    if plots <> Nil and plots.Ubound > -1 then
		      
		      for index as Integer = 0 to plots.Ubound
		        plots(index) = RegExThis( plots(index), "(<div class=""author-container"">.*?</div>)", "" )
		        plots(index) = plots(index).RemoveTags
		        plots(index) = DecodeHTML(plots(index))
		        plots(index) = Trim( plots(index) )
		      next
		      
		      IMDbJSON.Value("STORYLINES") = ValueArray( plots )
		    else
		      IMDbJSON.Value("STORYLINES") = ValueArray(EmptyArray)
		    end if
		    
		    'IMDbJSON.Value("STORYLINES") = ValueArray( match_all( "<p class=""plotpar"">(.*?)(<i>|<a|<\/p)", StoryLinesHTML ) )
		    If IMDbJSON.Child("STORYLINES").Count >= 1 Then IMDbJSON.Value("STORYLINE") = IMDbJSON.Child("STORYLINES").Value(0)
		    
		    // Taglines
		    App.ErrorMessage = Info + " - " + "Taglines"
		    Dim TagLinesHTML as String = DefineEncoding( CURLGet( "https://www.imdb.com/title/" + TitleID + "/taglines" ), Encodings.UTF8 )
		    Sckt.Close
		    IMDbJSON.Value("TAGLINES")  = ValueArray( match_all( "<div class=\""soda.*?\"">(.*?)<\/div>", TagLinesHTML ) )
		    If IMDbJSON.Child("TAGLINES").Count >= 1 Then 'IMDbJSON.Child("TAGLINES").Remove(0)
		      For i as Integer = 0 to IMDbJSON.Child("TAGLINES").Count -1
		        if IMDbJSON.Child("TAGLINES").Value(i) = IMDbJSON.Value("TAGLINE") then
		          IMDbJSON.Child("TAGLINES").Remove(i)
		          Continue
		        end if
		        
		        if Str( IMDbJSON.Child("TAGLINES").Value(i) ).Contains("It looks like we don't have any Taglines for this title yet") then
		          IMDbJSON.Child("TAGLINES").Remove(i)
		          Continue
		        end if
		      Next
		    End If
		    
		    
		    // Recommended Titles
		    dim recommendations() as String = match_all("<div class=""rec_item(.*?)</a>", Source, 0 )
		    dim recommendedTitles() as String
		    
		    if recommendations <> Nil and recommendations.Ubound > -1 then
		      
		      for each RecItem as String in recommendations
		        dim rec_title, rec_id as String
		        rec_title = RecItem.Match("title=""(.*?)""", 1)
		        rec_id = RecItem.Match("<a href=""/title/(tt\d+).*?""", 1)
		        
		        recommendedTitles.Append rec_title + " [" + rec_id + "]"
		      next
		    end if
		    IMDbJSON.Value("RECOMMENDATIONS") = ValueArray(recommendedTitles)
		    
		    
		    'App.ErrorMessage = Info + " - " + "Recommended Titles"
		    'Dim JSONString as String = DefineEncoding( Sckt.Get( "https://www.imdb.com/widget/recommendations/_ajax/get_more_recs?specs=p13nsims%3A" + TitleID, 60 ), Encodings.UTF8 )
		    'Sckt.Close
		    'App.ErrorMessage = Info + " - " + "Decoding from HTML"
		    'JSONString = Trim( JSONString )
		    'Dim Recommendations as New JSONItem
		    'App.ErrorMessage = Info + " - " + "Loading recommendations"
		    'If JSONString <> "" And JSONString.Left(1) = "{" OR JSONString.Left(1) = "[" Then Recommendations.Load Trim( JSONString )
		    'App.ErrorMessage = Info + " - " + "Setting recomendations child"
		    'If Recommendations <> Nil And Recommendations.HasName("recommendations") Then Recommendations = Recommendations.Child("recommendations")
		    '
		    'Dim RecIDs(), RecTitles(), Recs() as String
		    'App.ErrorMessage = Info + " - " + "Recommendations"
		    'For i as Integer = 0 to Recommendations.Count -1
		    'RecIDs.Append    Recommendations.Child(i).Value("tconst")
		    'RecTitles.Append match( "title=""(.*?)""", Recommendations.Child(i).Value("content"), 1 )
		    'Next
		    '
		    'For i as Integer = 0 to RecTitles.Ubound
		    'If RecIDs.Ubound >= i Then Recs.Append RecTitles(i) + " [" + RecIDs(i) + "]" Else Recs.Append RecTitles(i)
		    'Next
		    'If Recs.Ubound > -1 Then IMDbJSON.Value("RECOMMENDATIONS") = ValueArray( Recs )
		    
		    
		    // Media Images
		    Dim MediaImagesHTML as String = DefineEncoding( CURLGet( "https://www.imdb.com/title/"  + TitleID + "/mediaindex" ), Encodings.UTF8 )
		    Sckt.Close
		    Dim links as String = match( "<div class=""thumb_list"" style=""font-size: 0px;"">(.*?)<\/div>", MediaImagesHTML, 1 )
		    Dim images() as String = match_all( "src=""(.*?)""", links )
		    IMDbJSON.Value("MEDIA_IMAGES") = ValueArray( images )
		    
		    App.ErrorMessage = Info + " - " + "Media Images"
		    For i as Integer = 0 to IMDbJSON.Child("MEDIA_IMAGES").Count -1
		      IMDbJSON.Child("MEDIA_IMAGES").Value(i) = RegExThis( IMDbJSON.Child("MEDIA_IMAGES").Value(i), "_V1\..*?.jpg", "_V1._SY0.jpg" )
		    Next
		    
		    // Certification
		    Dim CertificationHTML as String = DefineEncoding( CURLGet( "https://www.imdb.com/title/" + TitleID + "/parentalguide" ), Encodings.UTF8 )
		    IMDbJSON.Value("CERTIFICATIONS") = ValueArray( match_all( "<a.*?>(.*?)<\/a>", match( "id=""certifications-list""(.*?)<\/table>", CertificationHTML, 1 ) ) )
		    IMDbJSON.Value("MPAA_RATING") = match("MPAA</td>(.*?)</td>", CertificationHTML, 1 ).removeTags
		    
		    
		    // Full Cast
		    If Preferences.Prefs.boolForKey("IMDbFullCast") Then
		      Dim FullCastHTML as String = DefineEncoding( CURLGet( "https://www.imdb.com/title/" + TitleID + "/fullcredits" ), Encodings.utf8 )
		      'Sckt.Close
		      'IMDbJSON.Value("CAST")            = ValueArray( MatchArray( match_all( "<td class=""nm"">(.*?)<\/td>", FullCastHTML ), "<a.*?>(.*?)<\/a>" ) )
		      'IMDbJSON.Value("ROLES")           = ValueArray( match_all( "<td class=""char"">(.*?)<\/td>", FullCastHTML ) )'<a.*?>(.*?)<\/a>" ) )
		      'IMDbJSON.Value("CASTTHUMBS")      = ValueArray( MatchArray( match_all( "<td class=""hs"">(.*?)<\/td>", FullCastHTML ), "<img.*src=""(.*?)"".*><\/a" ) )
		      
		      IMDbJSON.Value("CAST")            = ValueArray( MatchArray( match_all( "<td class=""primary_photo"">(.*?)<\/td>", FullCastHTML ), "title=""(.*?)""" ) )
		      'ValueArray( match_all( "<span class=""itemprop"" itemprop=""name"".*?>(.*?)<\/span>", FullCastHTML ) )
		      IMDbJSON.Value("ROLES")           = ValueArray( match_all( "<td class=""character"">(.*?)<\/td>", FullCastHTML ) )
		      IMDbJSON.Value("CASTTHUMBS")      = ValueArray( MatchArray( match_all( "<td class=""primary_photo"">(.*?)<\/td>", FullCastHTML ), "<img.*?loadlate=""(.*?)"".*><\/a" ) )
		      
		      App.ErrorMessage = Info + " - " + "Actor ROLES"
		      For i as Integer = 0 to IMDbJSON.Child("ROLES").Count -1
		        If IMDbJSON.Child("ROLES").Value(i).StringValue.Instr( 0, "<a" ) > 0 and IMDbJSON.Child("ROLES").Value(i).StringValue.InStr(0, "/characters/") > 0 Then
		          IMDbJSON.Child("ROLES").Value(i) = match( "<a.*?>(.*?)<\/a>", IMDbJSON.Child("ROLES").Value(i), 1 )
		        End If
		        
		        If IMDbJSON.Child("ROLES").Value(i).StringValue.Contains( "<div>" ) Then
		          'IMDbJSON.Child("ROLES").Value(i) = Trim( match( "<div>(.*?)<\/", IMDbJSON.Child("ROLES").Value(i) ) )
		          
		          Dim s as String = IMDbJSON.Child("ROLES").Value(i).StringValue
		          s = s.ReplaceAll( "<div>", "" )
		          s = s.ReplaceAll( "</div>", "" )
		          s = s.ReplaceAll( "\n", "" )
		          s = s.ReplaceAllRegEx("<a.*?>(.*?)<\/a>")
		          s = s.ReplaceAll( Chr(13), "" )
		          s = Trim( s )
		          
		          while s.Contains("  ")
		            s = s.ReplaceAll("  ", " ")
		          wend
		          
		          IMDbJSON.Child("ROLES").Value(i) = s 'Trim( IMDbJSON.Child("ROLES").Value(i).ReplaceAll("<div>", "").ReplaceAll("<\/div>", "").ReplaceAll("\n", "") )
		        End If
		        
		        'if IMDbJSON.Child("ROLES").Value(i).Contains( "<div>" ) then
		        'IMDbJSON.Child("ROLES").Value(i) = Trim( match( "<div>(.*?)<\/div>", IMDbJSON.Child("ROLES").Value(i), 1 ) )
		        'end if
		        
		        IMDbJSON.Child("ROLES").Value(i) = ReplaceAll( IMDbJSON.Child("ROLES").Value(i), "&nbsp;", "" )
		        IMDbJSON.Child("ROLES").Value(i) = ReplaceAll( IMDbJSON.Child("ROLES").Value(i), "...", "" )
		        IMDbJSON.Child("ROLES").Value(i) = trim( IMDbJSON.Child("ROLES").Value(i) )
		        if IMDbJSON.Child("ROLES").Value(i).StringValue.right(1) = "/" then
		          IMDbJSON.Child("ROLES").Value(i) = Trim( IMDbJSON.Child("ROLES").Value(i).StringValue.left( IMDbJSON.Child("ROLES").Value(i).StringValue.len -1 ) )
		        end if
		        
		        IMDbJSON.Child("ROLES").Value(i) = Trim( RegExThis( IMDbJSON.Child("ROLES").Value(i).StringValue, "\(.*\)" ) )
		      Next
		      
		      App.ErrorMessage = Info + " - " + "Cast Thumbs"
		      For i as Integer = 0 to IMDbJSON.Child("CASTTHUMBS").Count -1
		        IMDbJSON.Child("CASTTHUMBS").Value(i) = RegExThis( IMDbJSON.Child("CASTTHUMBS").Value(i).StringValue, "_V1.*?.jpg", "_V1_SY512.jpg" )
		      Next
		      
		      dim s as string
		    End If
		    
		  End If
		  
		  
		  App.ErrorMessage = ""
		  
		  Return IMDbJSON
		  
		  
		  Exception err as OutOfBoundsException
		    'Dim w as New wndBugReporter
		    'w.Init( err, "GetIMDBJSON( " + TitleID + ", " + Str( Short ) + " )" + chr(13) + App.ErrorMessage )
		    
		    if AppSettings.HandleError( err, "OutOfBoundsException (caught at GetIMDbJSON( " + TitleID + " )) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		    App.ErrorMessage = ""
		    Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MatchArray(Arry() as String, SrchPattern as String, i as Integer = 1) As String()
		  Dim Arr() as String
		  For each value as Variant in Arry
		    Arr.Append Trim( match( SrchPattern, value, i ) )
		  Next
		  Return Arr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RemoveTags(Text as String) As String
		  'Dim s as string = RegExThis( Text, "<\/span> »", "" )
		  
		  // Don't be too agressive with links
		  Text = RegExThis( Text, "<a.*?>", "" )
		  Text = ReplaceAll( Text, "</a>", "" )
		  
		  Return RegExThis( Text, "<.*?<\/.*?>", "" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ValueArray(Values() as String) As JSONItem
		  If Values <> Nil Then
		    Dim Daddy as New JSONItem
		    For i as Integer = 0 to Values.Ubound
		      Daddy.Value(i) = Values(i)
		    Next
		    
		    Return Daddy
		  End If
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kNotFoundOnGoogle, Type = String, Dynamic = True, Default = \"IMDb Search didn\'t find %title on google!", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"IMDb Search didn\'t find %title on Google!"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"IMDb heeft %titel niet gevonden via Google!"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"La recherche IMDB n\'a pas trouv\xC3\xA9 %title sur google !"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Die IMDb-Suche kann %title bei Google nicht finden!"
	#tag EndConstant

	#tag Constant, Name = kNoTitleFoundOnIMDb, Type = String, Dynamic = True, Default = \"No title found on IMDb! %ID", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No title found on IMDb! %ID"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen title gevonden op IMDb! %ID"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kein Titel IMDb gefunden! %ID"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aucun titre trouv\xC3\xA9 sur IMDb! %ID"
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

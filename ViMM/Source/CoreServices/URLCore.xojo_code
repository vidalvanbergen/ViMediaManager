#tag Module
Protected Module URLCore
	#tag Method, Flags = &h1
		Protected Function FanartTV(ID as String) As String
		  // http://fanart.tv/webservice/movie/apikey/imdb-tmdb_id[|id2|id3]/format/type/sort/limit/
		  // http://fanart.tv/webservice/series/apikey/tvdb_id[|id2|id3]/format/type/sort/limit/
		  
		  Dim Section as String = "movies"
		  If ActiveSection = 1 Then Section = "tv" // "series"
		  
		  // Return "http://176.31.123.148/webservice/" + Section + "/" + ApiKey_FanartTV + "/" + ID + "/json/all/1/2/"
		  // Return "http://api.fanart.tv/webservice/" + Section + "/" + ApiKey_FanartTV + "/" + ID + "/json/all/1/2/" // v2
		  Return "https://webservice.fanart.tv/v3/" + Section + "/" + ID + "?api_key=" + ApiKey_FanartTV + "&client_key=" + ClientKey_FanarartTV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RottenTomatoes(ID as String, Method as String, Option as String = "") As String
		  Dim URL as String
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage").NthField("-",1)
		  
		  Select Case Method
		    
		  Case "Search"
		    URL = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?q={0}&apikey=" + ApiKey_RottenTomatoes + "&country=" + Lang ' + "&page_limit="
		  Case "Info"
		    
		  Case "Alias"
		    URL = "http://api.rottentomatoes.com/api/public/v1.0/movie_alias.json?type=imdb&id={0}&apikey=" + ApiKey_RottenTomatoes
		    
		  case "Recommendations"
		    URL = "http://api.rottentomatoes.com/api/public/v1.0/movies/{0}/similar.json?apikey=" + ApiKey_RottenTomatoes
		    
		  End Select
		  
		  URL = URL.ReplaceAll("{0}", ID)
		  Return URL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TraktTV(Method as String, sProperty as String = "") As String
		  
		  'if Preferences.Prefs.stringForKey("Trakttv_Password") <> "" And Preferences.Prefs.stringForKey("Trakttv_UserName") <> "" And Preferences.Prefs.boolForKey("TraktTVEnabled") then
		  
		  Select Case Method
		    
		  Case "Test"
		    Return "http://api.trakt.tv/account/test/" + ApiKey_TraktTV
		    
		  Case "MovieSeen" // Mark as watched
		    Return "http://api.trakt.tv/movie/seen/" + ApiKey_TraktTV
		  Case "MovieUnseen" // Mark as unwatched
		    Return "http://api.trakt.tv/movie/unseen/" + ApiKey_TraktTV
		    
		  Case "MovieRelated"
		    Return "http://api.trakt.tv/movie/related.json/" + ApiKey_TraktTV + "/" + sProperty // Title or ID
		  Case "MovieSummary"
		    Return "http://api.trakt.tv/movie/summary.json/" + ApiKey_TraktTV + "/" + sProperty // Title or ID
		    
		    
		  End Select
		  
		  'end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TVMaze(sProperty as String = "", Method as String = "Search", CountryCode as String = "") As String
		  
		  Select Case Method
		    
		  case "Search"
		    Return "http://api.tvmaze.com/singlesearch/shows?q=" + String2Entities( sProperty ) + "&embed=episodes" // Title
		    
		  case "LookUp"
		    Return "http://api.tvmaze.com/lookup/shows?thetvdb=" + sProperty // TVDB ID
		    
		  case "show"
		    Return "http://api.tvmaze.com/shows/" + sProperty // tvmaze ID
		    
		  case "episodes"
		    Return "http://api.tvmaze.com/shows/" + sProperty + "/episodes?specials=1" // tvmaze ID
		    
		  case "schedule"
		    if CountryCode <> "" then
		      CountryCode = "&country=" + CountryCode
		    else
		      CountryCode = "" '"&country=US"
		    end if
		    Return "http://api.tvmaze.com/schedule?date=" + sProperty + CountryCode // Date 2015-09-13 (YYYY-MM-DD)
		    
		  End Select
		  
		  
		  // http://www.tvmaze.com/api
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TVRage(sProperty as String = "", Method as String = "Info", seasonXepisode as string = "") As String
		  
		  Select Case Method
		    
		  case "InfoQuick"
		    Return "http://services.tvrage.com/tools/quickinfo.php?show=" + String2Entities( sProperty ) // Title
		    
		  case "InfoFull"
		    Return "http://services.tvrage.com/myfeeds/showinfo.php?key=" + ApiKey_TVRage + "&sid=" + sProperty // TVRage ID
		    
		  case "InfoEpisode"
		    Return "http://services.tvrage.com/tools/quickinfo.php?show=" + sProperty + "&ep=" + seasonXepisode // ID - 1x2
		    
		    
		  case "Countdown"
		    // ? New seaons and "new shows"! ( episode 1's of new season or first season )
		    Return "http://services.tvrage.com/myfeeds/countdown.php?key=" + ApiKey_TVRage
		    
		    
		  End Select
		  
		  
		  // http://services.tvrage.com/myfeeds/showinfo.php?key=HDeBGd0RITrO3fPOTBr2&sid=31744
		End Function
	#tag EndMethod


	#tag Constant, Name = ApiKey_FanartTV, Type = String, Dynamic = False, Default = \"79220e0c14eab8f46eedbb611288572e", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ApiKey_RottenTomatoes, Type = String, Dynamic = False, Default = \"4kqwjrydumjyz9b8bc9bkert", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ApiKey_TraktTV, Type = String, Dynamic = False, Default = \"cee7adf6211b45e9e43656287f9d52cc", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ApiKey_TVRage, Type = String, Dynamic = False, Default = \"HDeBGd0RITrO3fPOTBr2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ClientKey_FanarartTV, Type = String, Dynamic = False, Default = \"f254ee077bfddcb5be513baa58c98776", Scope = Protected
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

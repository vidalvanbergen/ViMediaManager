#tag Class
Protected Class TrailerSckt
Inherits HTTPSocket
	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  Dim TheFile as FolderItem = file
		  Dim TrailerFile as FolderItem = FindTrailerItem( MovieAttr.FolderParent )
		  Dim MovieFile   as FolderItem = FindMovieItem(   MovieAttr.FolderParent )
		  Dim Destination as FolderItem
		  
		  If TrailerFile <> Nil And TrailerFile.Exists Then
		    If TrailerFile.IsNetworkVolume Then TrailerFile.Delete Else TrailerFile.MoveToTrash()
		  End If
		  
		  // If file seems trailer like.
		  If TheFile <> Nil And TheFile.Exists And TheFile.Length > 1024 Then
		    
		    // Trailer Destination
		    Destination = MovieAttr.DestinationTrailer( MovieAttr.FolderParent, File )
		    
		    If Destination <> Nil Then
		      File.MoveFileTo Destination
		      MessageBox Loc.kDownloadComplete
		    Else
		      MessageBox "Invalid Destination"
		    End If
		    
		  Else
		    SocketError( Me.LastErrorCode, Me )
		  End If
		  
		  DownloadComplete( url, httpStatus, Headers, file )
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(code as integer)
		  SocketError( code, Me )
		  
		  Exception err as NilObjectException
		    Me.Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  Dim Progress as String = BytesToString( bytesReceived ) + Loc.k1of2 + BytesToString( totalBytes )
		  
		  ReceiveProgress bytesReceived, totalBytes, newData, Progress
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Download(URL as String = "", Size as String = "")
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  Dim Lang as String = Preferences.Prefs.stringForKey("DBLanguage").NthField("-", 1)
		  Dim ytContent as String
		  Dim sckt as New MovieSckt
		  
		  
		  
		  'sckt.Anonymouse( True )
		  
		  // Apple.com trailer download workaround, set user-agent to Safari.Dim rand as New Random
		  Dim rand as New Random
		  Dim IP as String = Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) )
		  Sckt.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  
		  Me.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  Me.SetRequestHeader( "User-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Safari/8536.25" )
		  
		  
		  If URL.InStr( 0, "yahoo" ) > 0 Then
		    Dim s as String = sckt.Get( URL, Preferences.Prefs.integerForKey("TimeOut") )
		    URL = match( "<A HREF=""(.*?)"">", s, 1 ).ReplaceAll("&amp;", "&")
		  End If
		  
		  // If not youtube URL Then download.
		  If NOT URL.InStr( 0, "youtube" ) > 0 Then
		    
		    If URL.Trim.Right(4) = ".mp4" Or _
		      URL.Trim.Right(4) = ".avi" Or _
		      URL.Trim.Right(4) = ".flv" Or _
		      URL.Trim.Right(4) = ".mov" Then
		      Me.Get URL, SpecialFolder.Temporary.Child( App.Identifier ).Child( "trailer.downloading" )
		      'URL = "Downloading..." // Make sure that even if progressing while trailer is downloading, it won't try anything else.
		      Return
		    End If
		    
		    
		    // If no URL available, then try to find a youtube URL on TMDB.
		  ElseIf URL = "" And MovieAttr.ID_TMDB <> "" Then
		    
		    Dim JSONString as String = Me.Get( sckt.URL( "MovieTrailers", MovieAttr.ID_TMDB, Lang ), Preferences.Prefs.integerForKey( "TimeOut" ) )
		    Me.Close
		    
		    Dim Trailers as New JSONItem
		    If JSONString.ValidJSON( "TMDb" ) Then Trailers.Load( JSONString )
		    
		    If Trailers.HasName( "youtube" ) And Trailers.Child( "youtube" ).Count > 0 Then
		      URL = "http://www.youtube.com/watch?v=" + Trailers.Child("youtube").Child(0).Value("source") + "&hd=1"
		    End If
		    
		    
		    // If URL is from youtube, make sure it's HD.
		    'ElseIf URL.InStr( 0, "youtube" ) > 0 And URL.InStr( 0, "&h=1" ) <= 0 Then
		    'URL = URL + "&hd=1"
		    
		  End If
		  
		  // If there's still no URL, return
		  If URL = "" Then
		    MessageBox Loc.msgNoTrailer
		    DownloadInterupted( URL )
		    Return
		    
		    // If Youtube URL is available, process it before downloading it.
		    'ElseIf URL.InStr( 0, "youtube" ) > 0 Then
		    'ytContent = Me.get( URL, Preferences.Prefs.integerForKey( "TimeOut" ) )
		    'Me.Close
		    
		    // If URL is valid. (HTTP)
		  ElseIf URL.Trim.Left(4) = "http" Then
		    
		    Me.Get( URL, SpecialFolder.Temporary.Child( App.Identifier ).Child("trailer.downloading") )
		    'Me.Close
		    Return
		    
		  End If
		  
		  Me.Close
		  
		  If ytContent.InStr(0, "<!DOCTYPE html>" ) > 0 Then
		    Dim s as String = YoutubeContent( ytContent, Size )
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoLinks(YouTubeURL as String) As Variant
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  Dim sckt as New HTTPSocket
		  sckt.Yield = True
		  
		  
		  Dim rand as New Random
		  Dim IP as String = Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) )
		  Sckt.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  
		  sckt.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  sckt.SetRequestHeader( "User-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Safari/8536.25" )
		  
		  // Youtube Content
		  Dim ytContent as String = sckt.Get( YouTubeURL, Preferences.Prefs.integerForKey("TimeOut") )
		  If ytContent.Contains( "The YouTube account associated with this video has been terminated due to multiple third-party notifications of copyright infringement." ) OR _
		    ytContent.Contains( "This video has been removed by the user." ) Then
		    Return Nil
		  End If
		  
		  // ytplayer configuration
		  Dim JSONString as String = ytContent.MyMid( "{};ytplayer.config = ", ";</script>" )
		  Dim ytplayer as New JSONItem
		  If JSONString <> "" And Trim( JSONString ).Left(1) = "{" Then ytplayer.Load JSONString
		  
		  If ytplayer = Nil Then Return Nil
		  
		  Dim MediaLinks, fmtstream as String
		  If ytplayer <> Nil And ytplayer.HasName("args") Then fmtstream = ytplayer.Child("args").Lookup( "url_encoded_fmt_stream_map", "" )
		  
		  
		  Dim URLs() as String = match_all( "url=(.*?)(&|\Z)", fmtstream )
		  Dim Signatures() as String = match_all("%26signature%3D(.*?)(&|%26|\Z)", fmtstream ) 'match_all( "sig=(.*?)(&|\Z)", fmtstream )
		  Dim Qualities() as String = match_all(  "quality=(.*?)(%3B|,|;|&|\Z)", fmtstream )
		  Dim Types() as String = match_all( "type=video%2F(.*?)(%3B|,|;|&|\Z)", fmtstream )
		  
		  
		  For i as Integer = 0 to URLs.Ubound
		    If NOT DebugBuild And Signatures.Ubound < i Then Continue
		    URLs(i) = URLDecode( URLs(i) ) + "&signature=" + Signatures(i)
		    
		    Qualities(i) = Qualities(i).Titlecase
		    If Qualities(i).Contains( "hd" ) Then Qualities(i) = Qualities(i).ReplaceAll("hd","") + "p"
		    
		    Types(i) = Types(i).ReplaceAll( "x-", "" )
		  Next
		  
		  
		  Dim Dict as New Dictionary
		  
		  // First get MP4's:
		  For i as Integer = 0 to URLs.Ubound
		    If NOT Types(i).Contains( "mp4" ) Then Continue
		    Dict.Value( URLs(i) ) = Qualities(i) + " " + Types(i)
		  Next
		  
		  // Next set FLV's:
		  For i as Integer = 0 to URLs.Ubound
		    If NOT Types(i).Contains( "flv" ) Then Continue
		    Dict.Value( URLs(i) ) = Qualities(i) + " " + Types(i)
		  Next
		  
		  // Set 'webm' format last, these generally error with a 102 code.
		  'For i as Integer = 0 to URLs.Ubound
		  'If NOT Types(i).Contains( "webm" ) Then Continue
		  'Dict.Value( URLs(i) ) = Qualities(i) + " " + Types(i)
		  'Next
		  
		  // 3gpp?
		  For i as Integer = 0 to URLs.Ubound
		    If NOT Types(i).Contains( "3gpp" ) Then Continue
		    Dict.Value( URLs(i) ) = Qualities(i) + " " + Types(i)
		  Next
		  
		  // Any riff-raff
		  'For i as Integer = 0 to URLs.Ubound
		  'If Types(i).Contains( "3gpp" ) OR Types(i).Contains( "mp4" ) OR Types(i).Contains( "flv" ) OR Types(i).Contains( "webm" ) Then Continue
		  'Dict.Value( URLs(i) ) = Qualities(i) + " " + Types(i)
		  'Next
		  
		  Return Dict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YoutubeContent(tmpContent as String, Definition as String, ReturnURL as Boolean = False) As String
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  'If URL.InStr( 0, "youtube" ) > 0 Then
		  
		  'Dim StartStr as String = "http:\/\/s.ytimg.com\/yts\/swfbin\/" '"ytdns.ping("
		  'Dim EndStr as String = ""'"</script>"
		  
		  'Dim idx1, idx2 as Integer
		  'If tmpContent.InStr( StartStr ) = 0 Then
		  'MessageBox kYouTubeChanged
		  'If NOT DebugBuild Then Return ""
		  'End If
		  
		  'Dim s as String = tmpContent.MyMid( StartStr, EndStr )
		  
		  'If s.InStr("crossdomain" ) > 0 Then
		  's = s.MyMid( StartStr, """, 3);" )
		  'End If
		  
		  's = s.ReplaceAll("\/", "/")     // unencode these characters
		  's = s.ReplaceAll("\u0026", "&")
		  
		  's = s.ReplaceAll("generate_204", "videoplayback") // Switch generate to video
		  's = s.ReplaceAll("pmbypass&", "")
		  's = s.ReplaceAll("pmbypass=yes&", "")
		  's = s.ReplaceAll( """", "" )
		  
		  // Get Video links
		  Dim JSONString as String = tmpContent.MyMid( "{};ytplayer.config = ", ";</script>" )
		  Dim ytplayer as New JSONItem
		  If JSONString <> "" Then ytplayer.Load JSONString
		  
		  Dim MediaLinks as String
		  If ytplayer <> Nil Then MediaLinks = ytplayer.Child("args").Lookup("dashmpd", "")
		  MediaLinks = Me.Get( MediaLinks, 60 )
		  
		  Dim VideoLinks() as String = match_all( "<BaseURL>(.*?)</BaseURL>", MediaLinks.MyMid( "<AdaptationSet mimeType=""video/mp4""", "</AdaptationSet" ) )
		  Dim Heights() as String = match_all( "height=""(.*?)""", MediaLinks )
		  Dim Representations() as String = match_all( "<Representation(.*?)>", MediaLinks )
		  
		  
		  Dim BackupURL, s as String
		  For i as Integer = 0 to Heights.Ubound
		    If Heights(i) = "360" Then BackupURL = VideoLinks(i)
		    If Heights(i) = Definition Then s = VideoLinks(i)
		  Next
		  If s = "" Then s = BackupURL
		  
		  If s <> "" Then
		    If ReturnURL Then Return s
		    Me.Get s, SpecialFolder.Temporary.Child( App.Identifier ).Child( "trailer.downloading" )
		  Else
		    MessageBox Loc.msgNoTrailer
		    Return ""
		  End If
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DownloadComplete(url as String, httpStatus as Integer, Headers as internetHeaders, file as FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadInterupted(URL as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReceiveProgress(bytesReceived as Integer, totalBytes as Integer, newData as String, Progress as String)
	#tag EndHook


	#tag Constant, Name = kYouTubeChanged, Type = String, Dynamic = True, Default = \"YouTube may have changed their layout\r\rViMediaManager could not find the video URL in the YouTube page.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"YouTube may have changed their layout\r\rViMediaManager could not find the video URL in the YouTube page."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"YouTube heeft misschien hun layout verandered\r\rViMediaManager kan de video URL in de YouTube pagina niet vinden."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"YouTube kann ihr Layout ge\xC3\xA4ndert haben\r\rViMediaManager konnte das Video URL nicht finden in der YouTube-Seite."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"YouTube a surement chang\xC3\xA9 son format\r\rViMediaManager ne peut pas trouver la vid\xC3\xA9o sur le site YouTube."
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

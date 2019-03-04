#tag Module
Protected Module TraktTV
	#tag Method, Flags = &h1
		Protected Sub MarkMovieAsSeen()
		  If Trim( Preferences.Prefs.stringForKey("Trakttv_UserName") ) = "" OR Trim( Preferences.Prefs.stringForKey("Trakttv_Password") ) = "" Then Return
		  
		  Dim sckt as New HTTPSocket
		  sckt.Yield = True
		  Dim JSONString as String
		  
		  If ActiveSection = 0 Then
		    Dim ID as String = MovieAttr.ID_IMDB
		    If ID = "" Then ID = MovieAttr.ID_TMDB
		    If ID <> "" Then
		      sckt.SetRequestContent( "{ ""username"": """ + Preferences.Prefs.stringForKey("Trakttv_UserName") + """, ""password"": """ + Preferences.Prefs.stringForKey("Trakttv_Password") + """, ""movies"": [ { ""imdb_id"": """ + ID + """, ""title"": """ + MovieAttr.Title + """, ""year"": " + Str( MovieAttr.DateYear ) + " } ] }", "" )
		      Dim jItem as New JSONItem
		      Try
		        JSONString = sckt.Post( URLCore.TraktTV( "MovieSeen" ), 30 )
		        If JSONString <> "" Then jItem.Load JSONString else Return
		      Catch err as NilObjectException
		        // break
		      End Try
		      
		      If jItem <> Nil And jItem.ToString.Contains("Succes") Then
		        
		        If jItem.HasName("already_exist") ANd jItem.Value("already_exist") > 0 Then
		          
		          'If nc.Available Then
		          'nc.Message( MovieAttr.Title + " is already marked as seen" )
		          nc.Notify( "", "Trakt.tv - " + MovieAttr.Title,  "Already marked as seen" )
		          'Else
		          'MsgBox "Trakt.tv" + chr(13) + chr(13) + MovieAttr.Title + " is already marked as seen"
		          'End If
		          
		        Else
		          
		          'If nc.Available Then
		          'nc.Message( MovieAttr.Title + " has been marked as seen" )
		          nc.Notify( "", "Trakt.tv - " + MovieAttr.Title, "Marked as seen" )
		          'Else
		          'MsgBox "Trakt.tv" + chr(13) + chr(13) + MovieAttr.Title + " has been marked as seen"
		          'End If
		          
		        End If
		        
		      ElseIf JSONString.Contains("failed authentication") Then
		        MsgBox "Trakt.tv failed to autenticate" + chr(13) + chr(13) + "Please check if your username and password are correct"
		        
		      Else
		        MsgBox "Failed to connect to Trakt.tv"
		      End If
		      
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MarkMovieAsUnseen()
		  If Trim( Preferences.Prefs.stringForKey("Trakttv_UserName") ) = "" OR Trim( Preferences.Prefs.stringForKey("Trakttv_Password") ) = "" Then Return
		  
		  Dim sckt as New HTTPSocket
		  sckt.Yield = True
		  
		  If ActiveSection = 0 Then
		    Dim ID as String = MovieAttr.ID_IMDB
		    If ID = "" Then ID = MovieAttr.ID_TMDB
		    If ID <> "" Then
		      sckt.SetRequestContent( "{ ""username"": """ + Preferences.Prefs.stringForKey("Trakttv_UserName") + """, ""password"": """ + Preferences.Prefs.stringForKey("Trakttv_Password") + """, ""movies"": [ { ""imdb_id"": """ + ID + """, ""title"": """ + MovieAttr.Title + """, ""year"": " + Str( MovieAttr.DateYear ) + " } ] }", "" )
		      Dim jItem as New JSONItem
		      Try
		        jItem.Load sckt.Post( URLCore.TraktTV( "MovieUnseen" ), 30 )
		      Catch err as NilObjectException
		        break
		      End Try
		      
		      If jItem <> Nil Then
		        If jItem.ToString.Contains("Succes") Then
		          
		          'If nc.Available Then
		          // nc.Message( MovieAttr.Title + " has been removed as seen" )
		          nc.Notify( "", "Trakt.tv - " + MovieAttr.Title, "Removed as seen" )
		          'Else
		          'MsgBox "Trakt.tv" + chr(13) + chr(13) + MovieAttr.Title + " has been removed as seen"
		          'End If
		          
		        Else
		          MsgBox "Fail?"
		        End If
		      End If
		      
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod


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

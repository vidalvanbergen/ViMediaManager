#tag Class
Protected Class ExtraArtCanvas
Inherits Canvas
	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  'Dim g as Graphics = Me.Graphics
		  'dim g as Graphics' = picture.Graphics
		  
		  If obj <> Nil then
		    self.obj = obj
		    me.Invalidate
		    
		    MouseCursor = System.Cursors.Copy
		    
		    'Dim Pic as Picture
		    '
		    'g.ForeColor = &c626262
		    'g.FillRect 0, 0, Width, Height
		    ''g.DrawGradient( &c929292, &c626262, 0, 0, Width, Height )
		    '
		    'g.ForeColor = &c000000
		    'g.DrawRect 0, 0, Width, Height
		    '
		    'Pic = Picture.Open( obj.FolderItem )
		    'Dim PicDimensions as String = Str( Pic.Width ) + "x" + Str( Pic.Height )
		    'Dim ScaledWidth, ScaledHeight as Integer
		    'ScaledWidth = ScaledDim( Pic, Width, Height, True )
		    'ScaledHeight = ScaledDim( Pic, Width, Height, False )
		    '
		    '// Draw scaled image
		    'g.ScaleImage( Pic, Width, Height, ( Width / 2 ) - ( ScaledWidth / 2 ), ( Height / 2 ) - ( ScaledHeight / 2 ) )
		    '
		    '
		    '// Draw dimension label
		    'g.TextSize = 10
		    '
		    'g.ForeColor = &cEEEEEE
		    'g.FillRect 5, 5, g.StringWidth(PicDimensions) + 6, g.TextHeight + 4
		    '
		    'g.ForeColor = &c000000
		    'g.DrawRect 5, 5, g.StringWidth(PicDimensions) + 6, g.TextHeight + 4
		    '
		    'g.DrawString PicDimensions, 8, 7 + g.TextSize
		    
		  End If
		  
		  'g.ForeColor = &c000000
		  'g.DrawRect 0, 0, Width, Height
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  self.obj = Nil
		  Invalidate( False )
		End Sub
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  If obj.FolderItemAvailable and obj.FolderItem <> Nil then
		    AddImage obj.FolderItem
		    ObjectDropped()
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If ScaledPic = Nil Then Return
		  
		  Dim SmallX, BigX, SmallY, BigY as Integer
		  
		  SmallX = ( Width / 2 ) - ( ScaledPic.Width / 2 )
		  BigX   = SmallX + ScaledPic.Width
		  
		  SmallY = ( Height / 2 ) - ( ScaledPic.Height / 2 )
		  BigY   = SmallY + ScaledPic.Height
		  
		  If X > SmallX And X < BigX And _
		    Y > SmallY And Y < BigY _
		    Then
		    MouseCursor = System.Cursors.FingerPointer
		  Else
		    MouseCursor = System.Cursors.StandardPointer
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  AcceptFileDrop( "image/png" )
		  AcceptFileDrop( "image/jpg" )
		  
		  Open()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  g.ForeColor = &c929292
		  g.FillRect 0, 0, Width, Height
		  
		  if obj <> Nil then
		    
		    'MouseCursor = System.Cursors.Copy
		    
		    Dim Pic as Picture
		    
		    g.ForeColor = &c626262
		    g.FillRect 0, 0, Width, Height
		    'g.DrawGradient( &c929292, &c626262, 0, 0, Width, Height )
		    
		    g.ForeColor = &c000000
		    g.DrawRect 0, 0, Width, Height
		    
		    Pic = Picture.Open( obj.FolderItem )
		    Dim PicDimensions as String = Str( Pic.Width ) + "x" + Str( Pic.Height )
		    Dim ScaledWidth, ScaledHeight as Integer
		    ScaledWidth = ScaledDim( Pic, Width, Height, True )
		    ScaledHeight = ScaledDim( Pic, Width, Height, False )
		    
		    // Draw scaled image
		    g.ScaleImage( Pic, Width, Height, ( Width / 2 ) - ( ScaledWidth / 2 ), ( Height / 2 ) - ( ScaledHeight / 2 ) )
		    
		    
		    // Draw dimension label
		    g.TextSize = 10
		    
		    g.ForeColor = &cEEEEEE
		    g.FillRect 5, 5, g.StringWidth(PicDimensions) + 6, g.TextHeight + 4
		    
		    g.ForeColor = &c000000
		    g.DrawRect 5, 5, g.StringWidth(PicDimensions) + 6, g.TextHeight + 4
		    
		    g.DrawString PicDimensions, 8, 7 + g.TextSize
		    
		  elseIf PreviewArt <> Nil Then
		    
		    Dim ScaleWidth, ScaleHeight as Integer
		    ScaleWidth = ScaledDim( PreviewArt, Width, Height, True )
		    ScaleHeight = ScaledDim( PreviewArt, Width, Height, False )
		    
		    // Draw Preview
		    g.ScaleImage PreviewArt, Width, Height, ( Width / 2 ) - ( ScaleWidth / 2 ), ( Height / 2 ) - ( ScaleHeight / 2 )
		    
		    
		    // Dimensions Label
		    Dim PicDimensions as String = Str( PreviewArt.Width ) + "x" + Str( PreviewArt.Height )
		    g.TextSize = 10
		    
		    g.ForeColor = &cEEEEEE
		    g.FillRect 5, 5, g.StringWidth(PicDimensions) + 6, g.TextHeight + 4
		    
		    g.ForeColor = &c000000
		    g.DrawRect 5, 5, g.StringWidth(PicDimensions) + 6, g.TextHeight + 4
		    
		    g.DrawString PicDimensions, 8, 7 + g.TextSize
		    
		  End If
		  
		  g.ForeColor = &c000000
		  g.DrawRect 0, 0, Width, Height
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddImage(AddItem as FolderItem)
		  If AddItem = Nil or NOT AddItem.Exists then Return
		  
		  Dim FileName as String
		  Dim PathParent, PathDestination, MovieFile, FinalDestination as FolderItem
		  Dim MovieMode as Boolean = False
		  
		  Dim DisplaySeason as String = Str( Season )
		  If DisplaySeason.Len = 1 Then DisplaySeason = "0" + DisplaySeason
		  
		  // Folder Parent
		  Select Case ActiveSection
		  case 0
		    PathParent = MovieAttr.FolderParent
		    MovieFile = FindMovieItem( PathParent )
		    MovieMode  = True
		  case 1
		    PathParent = TVAttr.FolderParent
		    MovieMode = False
		    'If PathParent.Child( "Season " + DisplaySeason ).Exists Then PathParent = PathParent.Child( "Season " + DisplaySeason )
		    'If Season = 0 Then PathParent = PathParent.Child( "Specials" )
		    
		  case 2
		    // PathParent = AnimeAttr.FolderParent
		  End Select
		  
		  // Set Destination
		  Select Case Mode
		    
		  Case "Poster"
		    PathDestination = FindImagePoster( PathParent )
		    If PathDestination = Nil Then
		      If ActiveSection = 0 Then PathDestination = MovieAttr.DestinationPoster( PathParent )
		      If ActiveSection = 1 Then PathDestination = PathParent.Child("poster.jpg")
		    End If
		    
		  Case "Fanart"
		    PathDestination = FindImageFanart( PathParent )
		    If PathDestination = Nil Then
		      If ActiveSection = 0 Then PathDestination = MovieAttr.DestinationFanart( PathParent )
		      If ActiveSection = 1 Then PathDestination = PathParent.Child("fanart.jpg")
		    End If
		    
		  Case "Banner"
		    PathDestination = FindImageBanner( PathParent )
		    If PathDestination = Nil Then
		      If ActiveSection = 0 Then PathDestination = MovieAttr.DestinationBanner( PathParent )
		      If ActiveSection = 1 Then PathDestination = PathParent.Child("banner.jpg")
		    End If
		  Case "ClearArt"
		    PathDestination = PathParent.Child( "clearart.png" )
		  Case "CharacterArt"
		    PathDestination = PathParent.Child( "character.png" )
		  Case "Logo"
		    PathDestination = PathParent.Child( "logo.png" )
		  Case "Thumb"
		    PathDestination = PathParent.Child( "landscape.jpg" )
		  Case "DiscArt"
		    PathDestination = PathParent.Child( "disc.png" )
		    
		  Case "SeasonPoster"
		    If Season = -1 Then
		      PathDestination = PathParent.Child( "season-all-poster.jpg" )
		    ElseIf Season = 0 Then
		      PathDestination = PathParent.Child( "season-specials-poster.jpg" )
		    Else
		      PathDestination = PathParent.Child( "season" + Trim( DisplaySeason ) + "-poster.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "season " + Str( Season ) + ".jpg" )
		    End If
		    
		  Case "SeasonFanart"
		    If Season = -1 Then
		      PathDestination = PathParent.Child( "season-all-fanart.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "seasonall.fanart.jpg" )
		    ElseIf Season = 0 Then
		      PathDestination = PathParent.Child( "season-specials-fanart.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "specials.fanart.jpg" )
		    Else
		      PathDestination = PathParent.Child( "season" + Trim( DisplaySeason ) + "-fanart.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "season " + Str( Season ) + ".fanart.jpg" )
		    End If
		    
		  Case "SeasonBanner"
		    If Season = -1 Then
		      PathDestination = PathParent.Child( "season-all-banner.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "seasonall.banner.jpg" )
		    ElseIf Season = 0 Then
		      PathDestination = PathParent.Child( "season-specials-banner.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "specials.banner.jpg" )
		    Else
		      PathDestination = PathParent.Child( "season" + Trim( DisplaySeason ) + "-banner.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "season " + Str( Season ) + ".banner.jpg" )
		    End If
		    
		  Case "SeasonThumb"
		    If Season = -1 Then
		      PathDestination = PathParent.Child( "season-all-landscape.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "seasonall.landscape.jpg" )
		    ElseIf Season = 0 Then
		      PathDestination = PathParent.Child( "season-specials-landscape.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "specials.landscape.jpg" )
		    Else
		      PathDestination = PathParent.Child( "season" + Trim( DisplaySeason ) + "-landscape.jpg" )
		      If Preferences.Prefs.stringForKey("MediaPlayer") = "YAMJ" Then PathDestination = PathParent.Child( "season " + Str( Season ) + ".landscape.jpg" )
		    End If
		    
		  End Select
		  
		  If PathDestination = Nil Then Return
		  
		  If PathParent = Nil Then PathParent = PathDestination.Parent
		  Dim PosterFileName, FanartFileName as String
		  PosterFileName = Preferences.Prefs.stringForKey( "FileNamePoster" )
		  FanartFileName = Preferences.Prefs.stringForKey( "FileNameFanart" )
		  
		  If PosterFileName = "" Then PosterFileName = "poster.jpg"
		  If FanartFileName = "" Then FanartFileName = "fanart.jpg"
		  
		  
		  // Process image
		  If PathDestination <> Nil and PathDestination.Exists and _
		    MsgDlg( Parent.Window, 1, Mode + msgMessage, msgExplanation, Loc.dlgReplace, Loc.dlgCancel ) = 1 Then
		    
		    FileName = PathDestination.NameNoExtension
		    
		    If PathDestination.IsNetworkVolume Then PathDestination.Delete Else PathDestination.MoveToTrash()
		    
		    If PathParent.Child( FileName + "." + AddItem.Extension ) <> Nil Then AddItem.CopyFileTo( PathParent.Child( FileName + "." + AddItem.Extension ) )
		    
		  ElseIf PathDestination = Nil or NOT PathDestination.Exists And PathParent <> Nil  Then
		    
		    If MovieMode and MovieFile <> Nil and MovieFile.Exists Then
		      
		      If Mode = "Poster" And PathParent.Child( PosterFileName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) ) <> Nil Then
		        AddItem.CopyFileTo( PathParent.Child( PosterFileName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) ) )
		      End If
		      
		      If Mode = "Fanart" And PathParent.Child( FanartFileName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) ) <> Nil Then
		        AddItem.CopyFileTo( PathParent.Child( FanartFileName.ReplaceAll( "<movie>", MovieFile.NameNoExtension ) ) )
		      End If
		      
		      
		    ElseIf MovieMode and ( MovieFile = Nil OR NOT MovieFile.Exists ) Then
		      
		      If Mode = "Poster" And PathParent.Child( Preferences.Prefs.stringForKey( PosterFileName.ReplaceAll( "<movie>", "poster" ) ) ) <> Nil Then
		        AddItem.CopyFileTo( PathParent.Child( Preferences.Prefs.stringForKey( PosterFileName.ReplaceAll( "<movie>", "poster" ) ) ) )
		      End If
		      
		      If Mode = "Fanart" And PathParent.Child( Preferences.Prefs.stringForKey( FanartFileName.ReplaceAll( "<movie>", "fanart" ) ) ) <> Nil Then
		        AddItem.CopyFileTo( PathParent.Child( Preferences.Prefs.stringForKey( FanartFileName.ReplaceAll( "<movie>", "fanart" ) ) ) )
		      End If
		      
		    ElseIf NOT MovieMode Then
		      
		      If AddItem.Type = "image/png" And PathParent.Child( PathDestination.NameNoExtension + ".png" ) <> Nil Then
		        AddItem.CopyFileTo PathParent.Child( PathDestination.NameNoExtension + ".png" )
		      End If
		      
		      If AddItem.Type = "image/jpg" And PathParent.Child( PathDestination.NameNoExtension + ".jpg" ) <> Nil Then
		        AddItem.CopyFileTo PathParent.Child( PathDestination.NameNoExtension + ".jpg" )
		      End If
		      
		      If AddItem.Type <> "image/png" And AddItem.Type <> "image/jpg" And PathParent.Child( PathDestination.NameNoExtension + ".jpg" ) <> Nil Then
		        AddItem.CopyFileTo PathParent.Child( PathDestination.NameNoExtension + ".jpg" )
		      End If
		      
		    End If
		    
		  End If
		  
		  If ActiveSection = 0 then
		    Dim f as FolderItem, s as String
		    If Mode = "Poster" Then
		      f = FindImagePoster( PathParent )
		      s = MovieAttr.ID_IMDB + ".movie.poster.jpg"
		    ElseIf Mode = "Fanart" Then
		      f = FindImageFanart( PathParent )
		      s = MovieAttr.ID_IMDB + ".movie.fanart.jpg"
		    End If
		    
		    If f <> Nil and f.Exists Then CacheImageSet( Picture.Open( f ), s )
		    If PathParent <> Nil And PathParent.Exists Then MovieAttr.LoadImages PathParent
		  ElseIf ActiveSection = 1 Then
		    Dim f as FolderItem, s as String
		    If Mode = "Poster" Then
		      f = FindImagePoster( PathParent )
		      s = TVAttr.ID_IMDb + ".television.poster.jpg"
		    ElseIf Mode = "Fanart" Then
		      f = FindImageFanart( PathParent )
		      s = TVAttr.ID_IMDb + ".television.fanart.jpg"
		    End If
		    
		    If f <> Nil And f.Exists Then CacheImageSet( Picture.Open( f ), s )
		    TVAttr.LoadImages( PathParent )
		  End If
		  
		  // Reload
		  Dim NewArt as FolderItem = PathDestination
		  Select Case Mode
		  Case "Poster"
		    NewArt = FindImagePoster( PathParent )
		  Case "Fanart"
		    NewArt = FindImageFanart( PathParent )
		  Case "Banner"
		    NewArt = FindImageBanner( PathParent )
		  Case "ClearArt"
		    NewArt = PathParent.Child( "clearart.png" )
		  Case "CharacterArt"
		    NewArt = PathParent.Child( "character.png" )
		  Case "Logo"
		    NewArt = PathParent.Child( "logo.png" )
		  Case "TVThumb"
		    NewArt = PathParent.Child( "landscape.jpg" )
		  Case "DiscArt"
		    NewArt = PathParent.Child( "Disc.png" )
		    
		  End Select
		  If NewArt <> Nil and NewArt.Exists then PreviewArt = Picture.Open( NewArt )
		  
		  Invalidate False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload(Pic as Picture)
		  PreviewArt = Pic
		  'Invalidate False
		  Refresh
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ObjectDropped()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h0
		Mode As String = "Poster"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private obj As DragItem
	#tag EndProperty

	#tag Property, Flags = &h0
		PreviewArt As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		ScaledPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Season As Integer = -1
	#tag EndProperty


	#tag Constant, Name = msgExplanation, Type = String, Dynamic = True, Default = \"If you choose \'OK\'\x2C the existing image will be replaced with the new image.", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"If you choose \'OK\'\x2C the existing image will be replaced with the new image."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Als je \'OK\' kiest\x2C dan wordt het bestaande afbeelding vervangen met het nieuwe plaatje."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Om du v\xC3\xA4ljer \'OK\' kommer existerande bilder att ers\xC3\xA4ttas med nya bilder."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wenn \'OK\' gew\xC3\xA4hlt wird werden die existierenden Extras durch neue ersetzt."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Si vous s\xC3\xA9lectionnez \'OK\'\x2C l\'image actuelle sera remplac\xC3\xA9e par la nouvelle."
	#tag EndConstant

	#tag Constant, Name = msgMessage, Type = String, Dynamic = True, Default = \" image already exists\x2C do you want to replace the existing image\?", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \" image already exists\x2C do you want to replace the existing image\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \" afbeelding bestaat al\x2C wil je het bestaande plaatje vervangen\?"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \" bilden finns redan\x2C vill du ers\xC3\xA4tta den\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Extras existieren bereits. Sollen diese ersetzt werden\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \" l\'image existe d\xC3\xA9j\xC3\xA0\x2C voulez-vous la remplacer \?"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Group="Behavior"
			InitialValue="Poster"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreviewArt"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScaledPic"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Season"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

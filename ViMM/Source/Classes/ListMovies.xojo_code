#tag Class
Protected Class ListMovies
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  
		  // Alternating Row colors
		  'if AlternatingRowColors then
		  if row < me.ListCount and NOT me.Selected( row ) then
		    
		    #if TargetMacOS then
		      
		      #if XojoVersion <= 2017.030 then
		        if globals.IsDarkMode and row > -1 then
		          g.ForeColor = rgb(46, 43, 42)
		          g.FillRect 0, 0, g.Width, g.Height
		        end if
		      #endif
		      
		      dim AlternatingRowBackgroundColors() as NSColor = NSColor.ControlAlternatingRowBackgroundColors
		      
		      g.ForeColor = AlternatingRowBackgroundColors(row mod 2)
		    #else
		      if row mod 2 = 0 then
		        g.ForeColor = HSL( 0, 0, 0, 5 )
		      else
		        g.ForeColor = HSL( 0, 0, 100 )
		      end if
		    #endif
		    
		    g.FillRect 0, 0, g.Width, g.Height
		    Return True
		  end if
		  
		  'end if
		  
		  'Return CellBackgroundPaint( g, row, column ) or AlternatingRowColors
		  
		  
		  
		  #if TargetLinux then
		    
		    'If NOT me.Enabled OR NOT Me.Active Then Return False
		    
		    Dim Ratio, EndRatio as Double
		    Dim StartColor, EndColor, TopColor, BorderTopColor, BorderBottomColor as Color
		    
		    
		    // Colors
		    If NOT self.Active or NOT me.Enabled then
		      g.ForeColor = RGB(247, 247, 247)
		      If row <= ( ListCount - 1 ) and _
		        Cell( row, 4 ) = "True" Then
		        g.ForeColor = RGB(277, 237, 237)
		      End If
		      
		      StartColor        = RGB(186, 197, 222)
		      EndColor          = RGB(153, 168, 200)
		      TopColor          = RGB(193, 203, 225)
		      BorderTopColor    = RGB(185, 196, 216)
		      BorderBottomColor = RGB(144, 158, 188)
		      
		    ElseIf row <= ( ListCount - 1 ) And Cell( row, 4 ) = "True" Then
		      g.ForeColor = RGB(257, 217, 217)
		      
		      StartColor        = RGB(206, 177, 202)
		      EndColor          = RGB(173, 148, 180)
		      TopColor          = RGB(213, 183, 205)
		      BorderTopColor    = RGB(205, 176, 196)
		      BorderBottomColor = RGB(164, 138, 168)
		      
		    Else
		      'g.ForeColor = RGB(222, 228, 234) // Mine
		      g.ForeColor = rgb(232, 232, 232) // Screeny
		      
		      StartColor        = RGB(115, 176, 227)
		      EndColor          = RGB( 71, 131, 208)
		      TopColor          = RGB(123, 184, 233)
		      BorderTopColor    = RGB(104, 162, 221)
		      BorderBottomColor = RGB( 66, 119, 193)
		    End If
		    TopColor          = RGBa( 100, 100, 100, .25 )
		    BorderTopColor    = RGBa(   0,   0,   0, .05 )
		    BorderBottomColor = RGBa(   0,   0,   0, .10 )
		    
		    g.FillRect 0, 0, g.Width, g.Height
		    
		    If row < Me.ListCount Then
		      If row mod 2 = 0 then
		        g.ForeColor = HSL( 213, 43, 96 ) 'HSL(210, 43, 95) 'RGB( 255, 255, 255 )
		        If Me.Active And Me.Enabled Then
		          If Cell( row, 4 ) = "True" Then g.ForeColor = hsl(0, 100, 96) Else g.ForeColor = HSL( 213, 43, 96 )
		        Else
		          If Cell( row, 4 ) = "True" Then g.ForeColor = hsl(0, 100, 97) Else g.ForeColor = HSL( 213, 43, 98 )
		        End If
		        
		      Else
		        If Me.Active And Me.Enabled Then
		          If Cell( row, 4 ) = "True" Then g.ForeColor = hsl(0, 100, 98) Else g.ForeColor = HSL(  0, 100, 100 ) 'HSL(215, 29, 87) 'RGB( 237, 243, 254 )
		        Else
		          If Cell( row, 4 ) = "True" Then g.ForeColor = hsl(0, 100, 99) Else g.ForeColor = HSL(  0, 100, 100 ) 'HSL(215, 29, 87) 'RGB( 237, 243, 254 )
		        End If
		        
		      End If
		      
		      
		      If row < Me.ListCount And Me.RowTag( row ) = "Folder" Then
		        g.DrawGradient( rgb(255, 255, 255), rgb(230, 230, 230), 0, 0, g.Width, g.Height )
		      Else
		        g.FillRect 0, 0, g.Width, g.Height
		      End If
		    End If
		    
		    'If Row * g.Height < Me.LastIndex * g.Height Then
		    '
		    'g.ForeColor = RGB(255, 255, 255)
		    'g.DrawLine 0, 0, g.Width, 0
		    '
		    'If Self.Active Then g.ForeColor = RGB(200, 200, 200) Else g.ForeColor = RGB( 220, 220, 220 )
		    'g.DrawLine 0, g.Height - 1, g.Width, g.Height - 1
		    'ElseIf Row * g.Height = Me.LastIndex * g.Height Then
		    '
		    'g.ForeColor = RGB(255, 255, 255)
		    'g.DrawLine 0, 0, g.Width, 0
		    'g.DrawLine 0, g.Height - 1, g.Width, g.Height - 1
		    '
		    'If Self.Active Then g.ForeColor = RGB(200, 200, 200) Else g.ForeColor = RGB( 220, 220, 220 )
		    'g.DrawLine 0, g.Height - 2, g.Width, g.Height - 2
		    'End If
		    
		    // Selection
		    If NOT Me.Selected(row) Then Return False
		    
		    g.DrawGradient StartColor, EndColor, 0, 0, g.Width, g.Height
		    
		    g.ForeColor = TopColor
		    g.DrawLine 0, 1, g.Width, 1
		    
		    g.ForeColor = BorderTopColor
		    g.DrawLine 0, 0, g.Width, 0
		    
		    g.ForeColor = BorderBottomColor
		    g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		    
		    Return True
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  'Me.DefaultRowHeight = 22
		  'If True Then Me.DefaultRowHeight = Me.DefaultRowHeight + 22
		  'If True Then Me.DefaultRowHeight = Me.DefaultRowHeight + 22
		  
		  'If NOT me.Enabled Then Return False
		  Dim PosterSize as Integer = DefaultRowHeight - 10
		  Dim TitleTop as Integer = 4
		  Dim TextLeft as Integer = PosterSize + 2
		  
		  // g.Bold = True
		  // ## Movie Title
		  If DefaultRowHeight >= 22 * 2 Then g.TextSize = 12 Else g.TextSize = 11
		  If DefaultRowHeight >= 22 * 3 Then TextLeft = PosterSize - 5
		  'If DefaultRowHeight <= 22 Then TitleTop = 5
		  
		  
		  
		  // ## Left Poster icon
		  'Dim posteritem as FolderItem
		  Dim PosterPic as Picture = CellTag( row, 15 )
		  If Cell( Row, 2 ) <> "" And Preferences.Prefs.boolForKey("ShowPostersInList") And PosterPic <> Nil Then
		    Dim i as Integer = 0
		    If DefaultRowHeight <= 22 Then i = 3
		    
		    'posteritem = Preferences.fAppSupport.Child( "Cache" ).Child( Cell( row, 2 ) + ".movie.poster.jpg" )
		    'If posteritem <> Nil And posteritem.Exists Then
		    
		    'Dim PosterPic as Picture = CellTag( row, 15 ) 'Picture.Open( posteritem )
		    If PosterPic <> Nil Then
		      Dim Factor as Double = PosterSize / PosterPic.Height
		      g.DrawPicture PosterPic, 5 - i, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ),       PosterPic.Width * Factor,         PosterPic.Height * Factor,      0, 0, PosterPic.Width, PosterPic.Height
		      g.DrawRect               4 - i, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ) - 1, ( PosterPic.Width * Factor ) + 2, ( PosterPic.Height * Factor ) + 2
		      
		      // Dark overlay
		      If Cell( row, 4 ) = "True" Then
		        g.ForeColor = HSLa( 0, 100, 20, 60 )
		        g.FillRect 5 - i, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ),       PosterPic.Width * Factor,         PosterPic.Height * Factor
		      End If
		      
		    End If
		    
		    
		    
		    'End If
		  End If
		  
		  
		  // ## Left Status Icon
		  If PosterPic = Nil OR NOT Preferences.Prefs.boolForKey("ShowPostersInList") or Cell( row, 2 ) = "" Then
		    Dim i as Integer = 0
		    If DefaultRowHeight <= 22 Then i = 3
		    
		    Dim PosterInfo as Picture = videoclean
		    
		    // Retina
		    If App.ScalingFactor = 2 Then
		      
		      If Cell( row, 4 ) = "False" And Cell( Row, 2 ) <> "" Then
		        If DefaultRowHeight <= 22 Then PosterInfo = videounwatchedsmall Else PosterInfo = videounwatched2x
		      ElseIf Cell( row, 4 ) = "True" And Cell( Row, 2 ) <> "" Then
		        If DefaultRowHeight <= 22 Then PosterInfo = videowatchedsmall Else PosterInfo = videowatched2x
		      Else
		        If DefaultRowHeight <= 22 Then PosterInfo = videocleansmall Else PosterInfo = videoclean2x
		      End If
		      
		      // SD
		    Else'If App.ScalingFactor = 1 Then
		      
		      If Cell( row, 4 ) = "False" And Cell( Row, 2 ) <> "" Then
		        If DefaultRowHeight >= 64 Then PosterInfo = videounwatched Else PosterInfo = videounwatchedsmall
		      ElseIf Cell( row, 4 ) = "True" And Cell( Row, 2 ) <> "" Then
		        If DefaultRowHeight >= 64 Then PosterInfo = videowatched Else PosterInfo = videowatchedsmall
		      Else
		        If DefaultRowHeight >= 64 Then PosterInfo = videoclean Else PosterInfo = videocleansmall
		      End If
		      
		    End If
		    
		    g.DrawPicture PosterInfo, 5 - i, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ), PosterSize / 1.5, PosterSize,  0, 0, PosterInfo.Width, PosterInfo.Height
		    
		  End If
		  
		  
		  
		  // ## Title
		  'If me.ListIndex = row then
		  '
		  'If NOT me.Active or NOT me.Enabled then
		  'g.ForeColor = RGB(114, 114, 114)
		  'Else
		  'g.ForeColor = RGB( 51,  84, 133)
		  'End If
		  'g.Bold = True
		  'g.DrawString cell( row, 0 ), TextLeft, TitleTop + g.TextSize + 1, me.Width - PosterSize - 55, True
		  '
		  'g.ForeColor = RGB(255, 255, 255)
		  'Else
		  'g.ForeColor = RGB(255, 255, 255)
		  'g.DrawString cell( row, 0 ), TextLeft, TitleTop + g.TextSize + 1, me.Width - PosterSize - 55, True
		  '
		  'g.ForeColor = RGB(0, 0, 0)
		  'End If
		  if me.Selected(row) then
		    g.Bold = True
		  end if
		  g.DrawString cell( row, 0 ),   TextLeft, TitleTop + g.TextSize, me.Width - PosterSize - 55, True
		  
		  // ## Movie Data
		  'Dim TextLeft as Integer = PosterSize
		  If DefaultRowHeight >= 22 * 3 Then
		    Dim DataLine as String
		    
		    // Duration
		    Dim Runtime as Integer = Val( Cell( Row, 12 ) )
		    If Runtime > 0 Then DataLine = PrettyTime( Runtime ).Lowercase + "    "
		    
		    // Movie File Size
		    Dim size as Double = Val( Cell( row, 11 ) )
		    If Size > 0 Then DataLine = DataLine + BytesToString( Size ) + "    "
		    
		    // Codec Info
		    If Cell( row, 13 ) <> "" Then DataLine = DataLine + Cell( row, 13 ) // Video Codec
		    If Cell( row, 13 ) <> "" And Cell( row, 14 ) <> "" Then DataLine = DataLine + " / " // Seperator
		    If Cell( row, 14 ) <> "" Then DataLine = DataLine + Cell( row, 14 ) // Audio Codec
		    
		    
		    // Write Movie Data
		    g.TextSize = 10
		    'If Me.ListIndex = Row Then
		    '
		    'If NOT me.Active or NOT me.Enabled then
		    'g.ForeColor = RGB(114, 114, 114)
		    'Else
		    'g.ForeColor = RGB( 51,  84, 133)
		    'End If
		    'g.Bold = True
		    'g.DrawString DataLine, TextLeft, g.Height - 5, Me.Width - 100, True
		    '
		    'g.ForeColor = RGB(255, 255, 255)
		    'Else
		    'g.ForeColor = RGB(255, 255, 255)
		    'g.DrawString DataLine, TextLeft, g.Height - 5, Me.Width - 100, True
		    '
		    'g.ForeColor = RGB(0, 0, 0)
		    'End If
		    if me.Selected(row) then
		      g.Bold = True
		    End If
		    g.DrawString DataLine, TextLeft, g.Height - 6, Me.Width - 100, True
		  End If
		  g.Bold = False
		  
		  g.TextSize = 11
		  
		  // Left Status Icon
		  'If ( posteritem = Nil Or NOT posteritem.Exists ) Or NOT Preferences.Prefs.boolForKey("ShowPostersInList") Then
		  'Dim InfoLeft as Integer = 0
		  'If DefaultRowHeight >= 64 Then InfoLeft = -4
		  'If Cell( row, 4 ) = "False" then
		  'g.DrawPicture videounwatched, InfoLeft, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ), PosterSize, PosterSize,   0, 0, videounwatched.Width, videounwatched.Height
		  'ElseIf Cell( row, 4 ) = "True" then
		  'g.DrawPicture videowatched,   InfoLeft, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ), PosterSize, PosterSize,   0, 0, videowatched.Width, videowatched.Height
		  'Else // No Status i.e. no NFO available.
		  'g.DrawPicture videoclean,     InfoLeft, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ), PosterSize, PosterSize,   0, 0, videoclean.Width, videoclean.Height
		  'End If
		  'End If
		  
		  
		  
		  
		  
		  // ## Right Rating
		  If Cell( row, 7 ) <> "" and Val( Cell( row, 7 ) ) > 0 then
		    If me.Selected(row) then
		      g.ForeColor = &cFFFFFF
		      'ElseIf NOT me.selected(row) and NOT me.Active then
		      'if Globals.IsDarkMode then
		      'g.ForeColor = &c8d8d8d
		      'else
		      'g.ForeColor = &cA5A5A5
		      'end if
		    Else
		      if Globals.IsDarkMode then
		        g.ForeColor = &c6c7680
		      else
		        g.ForeColor = &c98A5B3
		      End If
		    End If
		    
		    Dim Rate as String = Cell( row, 7 )
		    If Rate.left(1) = "0" Then Rate = Rate.Right( Rate.Len - 1 )
		    
		    g.FillRoundRect g.Width - g.StringWidth( Rate ) - 15, 4, g.StringWidth( Rate ) + 10, g.TextSize + 3, 15, 15
		    
		    If ListIndex = Row then
		      if Globals.IsDarkMode then
		        g.ForeColor = &c6c7680
		      else
		        g.ForeColor = &c98A5B3
		      End If
		    Else
		      g.ForeColor = &cFFFFFF
		    End If
		    g.Bold = True
		    g.DrawString Rate, g.Width - g.StringWidth( Rate ) - 9, 4 + g.TextSize
		  End If
		  
		  
		  // ## Minicons
		  If DefaultRowHeight >= 22 * 2 Then
		    Dim i, IcoTop, IcoLeft as Integer = 0
		    Dim pic as Picture
		    
		    IcoTop = 21 'DefaultRowHeight - 5 - 36 '16
		    If DefaultRowHeight >= 22 * 3 Then IcoTop = 25 '( DefaultRowHeight / 2 ) - ( posterinactive.Height / 2 ) '25
		    
		    IcoLeft = TextLeft' + 2
		    
		    // Poster
		    If Preferences.Prefs.boolForKey("AutoDownloadPoster") And Preferences.Prefs.boolForKey("ShowMiniIcon-Poster") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = posteractive2x
		        else
		          pic = posteractive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = posteractive2x
		          else
		            pic = posteractive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = posterinactive2x
		          else
		            pic = posterinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = posterinactive2x Else Pic = posterinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = posteractive2x Else Pic = posteractive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "Poster" ) = 0 OR Cell( row, 15 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // Fanart
		    If Preferences.Prefs.boolForKey("AutoDownloadBackdrop") And Preferences.Prefs.boolForKey("ShowMiniIcon-Backdrop") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = fanartactive2x
		        else
		          pic = fanartactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = fanartactive2x
		          else
		            pic = fanartactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = fanartinactive2x
		          else
		            pic = fanartinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = fanartinactive2x Else Pic = fanartinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = fanartactive2x Else Pic = fanartactive
		      'End If
		      '// Missing
		      If Cell( row, 8 ).InStr( 0, "Fanart" ) = 0 OR Cell( row, 16 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // Extra Fanart
		    If Preferences.Prefs.boolForKey("AutoDownloadExtraFanart") And Preferences.Prefs.boolForKey("ShowMiniIcon-ExtraFanart") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = extrafanartactive2x
		        else
		          pic = extrafanartactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = extrafanartactive2x
		          else
		            pic = extrafanartactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = extrafanartinactive2x
		          else
		            pic = extrafanartinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = extrafanartinactive2x Else Pic = extrafanartinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = extrafanartactive2x Else Pic = extrafanartactive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "extraf" ) = 0 OR Cell( row, 25 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // Extra Thumbs
		    If Preferences.Prefs.boolForKey("AutoDownloadExtraThumbs") And Preferences.Prefs.boolForKey("ShowMiniIcon-ExtraThumbs") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = extrathumbsactive2x
		        else
		          pic = extrathumbsactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = extrathumbsactive2x
		          else
		            pic = extrathumbsactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = extrathumbsinactive2x
		          else
		            pic = extrathumbsinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = extrathumbsinactive2x Else Pic = extrathumbsinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = extrathumbsactive2x Else Pic = extrathumbsactive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "extrat" ) = 0 OR Cell( row, 24 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // DiscArt
		    If Preferences.Prefs.boolForKey("AutoDownloadDiscArt") And Preferences.Prefs.boolForKey("ShowMiniIcon-DiscArt") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = discartactive2x
		        else
		          pic = discartactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = discartactive2x
		          else
		            pic = discartactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = discartinactive2x
		          else
		            pic = discartinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = discartinactive2x Else Pic = discartinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = discartactive2x Else Pic = discartactive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "disc" ) = 0 OR Cell( row, 21 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // Logo
		    If Preferences.Prefs.boolForKey("AutoDownloadLogo") And Preferences.Prefs.boolForKey("ShowMiniIcon-Logo") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = logoactive2x
		        else
		          pic = logoactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = logoactive2x
		          else
		            pic = logoactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = logoinactive2x
		          else
		            pic = logoinactive
		          End If
		        End If
		      End If
		      
		      // Unselected
		      'If App.ScalingFactor = 2 Then Pic = logoinactive2x Else Pic = logoinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = logoactive2x Else Pic = logoactive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "Logo" ) = 0 OR Cell( row, 22 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // ClearArt
		    If Preferences.Prefs.boolForKey("AutoDownloadClearArt") And Preferences.Prefs.boolForKey("ShowMiniIcon-ClearArt") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = clearartactive2x
		        else
		          pic = clearartactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = clearartactive2x
		          else
		            pic = clearartactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = clearartinactive2x
		          else
		            pic = clearartinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = clearartinactive2x Else Pic = clearartinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = clearartactive2x Else Pic = clearartactive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "ClearArt" ) = 0 OR Cell( row, 20 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // Banner
		    If Preferences.Prefs.boolForKey("AutoDownloadBanner") And Preferences.Prefs.boolForKey("ShowMiniIcon-Banner") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = banneractive2x
		        else
		          pic = banneractive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = banneractive2x
		          else
		            pic = banneractive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = bannerinactive2x
		          else
		            pic = bannerinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = bannerinactive2x Else Pic = bannerinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = banneractive2x Else Pic = banneractive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "Banner" ) = 0 OR Cell( row, 19 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // Landscape
		    If Preferences.Prefs.boolForKey("AutoDownloadThumb") And Preferences.Prefs.boolForKey("ShowMiniIcon-Thumb") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = landscapeactive2x
		        else
		          pic = landscapeactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = landscapeactive2x
		          else
		            pic = landscapeactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = landscapeinactive2x
		          else
		            pic = landscapeinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = landscapeinactive2x Else Pic = landscapeinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = landscapeactive2x Else Pic = landscapeactive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "Landscape" ) = 0 OR Cell( row, 23 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // Trailer
		    If Preferences.Prefs.boolForKey("ShowMiniIcon-Trailer") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = traileractive2x
		        else
		          pic = traileractive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = traileractive2x
		          else
		            pic = traileractive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = trailerinactive2x
		          else
		            pic = trailerinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = trailerinactive2x Else Pic = trailerinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = traileractive2x Else Pic = traileractive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "Trailer" ) = 0 OR Cell( row, 17 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, pic.Width, pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // Subtitles
		    If Preferences.Prefs.boolForKey("ShowMiniIcon-Subtitles") Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = subtitlesactive2x
		        else
		          pic = subtitlesactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = subtitlesactive2x
		          else
		            pic = subtitlesactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = subtitlesinactive2x
		          else
		            pic = subtitlesinactive
		          End If
		        End If
		      End If
		      
		      '// Unselected
		      'If App.ScalingFactor = 2 Then Pic = subtitlesinactive2x Else Pic = subtitlesinactive
		      '// Selected
		      'If ListIndex = Row Then
		      'If App.ScalingFactor = 2 Then Pic = subtitlesactive2x Else Pic = subtitlesactive
		      'End If
		      // Missing
		      If Cell( row, 8 ).InStr( 0, "Subtitle" ) = 0 OR Cell( row, 18 ) = "-" Then g.transparency = 75
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // Resolution
		    // DVD
		    If NOT Preferences.Prefs.boolForKey("ShowMiniIcon-Resolution") Then Return True
		    
		    If Cell( row, 6 ) = "DVD" Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = DVDactive2x
		        else
		          pic = DVDactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = DVDactive2x
		          else
		            pic = DVDactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = DVDinactive2x
		          else
		            pic = DVDinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = DVDactive2x else pic = DVDinactive2x
		      'Else
		      'If ListIndex = row then pic = DVDactive else pic = DVDinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // BluRay
		    If Cell( row, 6 ) = "Bluray" Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = bluactive2x
		        else
		          pic = bluactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = bluactive2x
		          else
		            pic = bluactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = bluinactive2x
		          else
		            pic = bluinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = bluactive2x else pic = bluinactive2x
		      'Else
		      'If ListIndex = row then pic = bluactive else pic = bluinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // Def 720p
		    If Cell( row, 6 ) = "720p" then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = def720pactive2x
		        else
		          pic = def720pactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = def720pactive2x
		          else
		            pic = def720pactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = def720pinactive2x
		          else
		            pic = def720pinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = def720pactive2x else pic = def720pinactive2x
		      'Else
		      'If ListIndex = row then pic = def720pactive else pic = def720pinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // Def 1080p
		    If Cell( row, 6 ) = "1080p" then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = def1080pactive2x
		        else
		          pic = def1080pactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = def1080pactive2x
		          else
		            pic = def1080pactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = def1080pinactive2x
		          else
		            pic = def1080pinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = def1080pactive2x else pic = def1080pinactive2x
		      'Else
		      'If ListIndex = row then pic = def1080pactive else pic = def1080pinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // Def 4k
		    If Cell( row, 6 ) = "4k" then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = def4kactive2x
		        else
		          pic = def4kactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = def4kactive2x
		          else
		            pic = def4kactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = def4kinactive2x
		          else
		            pic = def4kinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = def4kactive2x else pic = def4kinactive2x
		      'Else
		      'If ListIndex = row then pic = def4kactive else pic = def4kinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // Def 5k
		    If Cell( row, 6 ) = "5k" then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = def5kactive2x
		        else
		          pic = def5kactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = def5kactive2x
		          else
		            pic = def5kactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = def5kinactive2x
		          else
		            pic = def5kinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = def5kactive2x else pic = def5kinactive2x
		      'Else
		      'If ListIndex = row then pic = def5kactive else pic = def5kinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // Def 6k
		    If Cell( row, 6 ) = "8k" then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = def8kactive2x
		        else
		          pic = def8kactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = def8kactive2x
		          else
		            pic = def8kactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = def8kinactive2x
		          else
		            pic = def8kinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = def8kactive2x else pic = def8kinactive2x
		      'Else
		      'If ListIndex = row then pic = def8kactive else pic = def8kinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // Def HD
		    If Cell( row, 6 ) = "HD" then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = defHDactive2x
		        else
		          pic = defHDactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = defHDactive2x
		          else
		            pic = defHDactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = defHDinactive2x
		          else
		            pic = defHDinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = defHDactive2x else pic = defHDinactive2x
		      'Else
		      'If ListIndex = row then pic = defHDactive else pic = defHDinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // Def SD
		    If Cell( row, 6 ) = "SD" then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = defSDactive2x
		        else
		          pic = defSDactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = defSDactive2x
		          else
		            pic = defSDactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = defSDinactive2x
		          else
		            pic = defSDinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row then pic = defSDactive2x else pic = defSDinactive2x
		      'Else
		      'If ListIndex = row then pic = defSDactive else pic = defSDinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		    // Locked Status
		    If Cell( row, 26 ) = "True" Then
		      
		      if Globals.IsDarkMode then
		        if app.ScalingFactor = 2 then
		          pic = lockedactive2x
		        else
		          pic = lockedactive
		        End If
		        
		      else
		        if me.Selected(row) then
		          if app.ScalingFactor = 2 then
		            pic = lockedactive2x
		          else
		            pic = lockedactive
		          End If
		        else
		          if app.ScalingFactor = 2 then
		            pic = lockedinactive2x
		          else
		            pic = lockedinactive
		          End If
		        End If
		      End If
		      
		      'If App.ScalingFactor = 2 Then
		      'If ListIndex = row Then Pic = lockedactive2x Else Pic = lockedinactive2x
		      'Else
		      'If ListIndex = row Then Pic = lockedactive Else Pic = lockedinactive
		      'End If
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      i = i + 1
		    End If
		    
		  End If
		  
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  If Trim( wndMain.ccSearchBoxMovies.srchField.StringValue ) <> "" Then
		    wndMain.ccSearchBoxMovies.srchField.StringValue = " "
		    wndMain.ccSearchBoxMovies.srchField.StringValue = ""
		    SaveToDB
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  // Let the listbox handle up/down arrows and tab keys
		  If Keyboard.AsyncKeyDown(&h7D) Or Keyboard.AsyncKeyDown(&h7E) Or Keyboard.AsyncKeyDown(&h30) Then Return False
		  
		  // Cmd + Del:
		  If Keyboard.CommandKey and Keyboard.AsyncKeyDown(&h33) Then
		    DeleteItem
		    Return True
		  End If
		  
		  // Cmd + Enter
		  If Keyboard.CommandKey And Keyboard.AsyncKeyDown( 36 ) Then
		    If Cell( ListIndex, 2 ) <> "" Then CommonCore.EditInfo Else CommonCore.FetchMetadata
		    Return True
		  End If
		  
		  If ( Ticks - LastKeyPressedAt < 30 ) then LastKeyPressed = LastKeyPressed + Key else LastKeyPressed = Key
		  LastKeyPressedAt = Ticks
		  For i as Integer = 0 to ListCount - 1
		    If Lowercase( Left( List(i).DeArticulator, Len( LastKeyPressed ) ) ) = Lowercase( LastKeyPressed ) then
		      ListIndex = i
		      Return True
		      Exit
		    End If
		  Next
		  
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  LoadList()
		  Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddItem(f as FolderItem)
		  #pragma DisableBackgroundTasks
		  
		  // Reset progress at the first folder.
		  If f = Nil or NOT f.Exists then Return
		  If MovieFolders(0).Name = f.Name Then dlgProgress.Reset
		  
		  AddRow f.Name, f.ShellPath 'AbsolutePath
		  
		  // Dim MovieName as String = FindMovieName( f, True, False )
		  // If MovieName = "" then MovieName = f.Name
		  // AddRow MovieName, f.AbsolutePath
		  
		  // Found Progress
		  If MovieFolders.Ubound > -1 Then dlgProgress.Add( Loc.kReadingInfo + ":", f.Name, 1, MovieFolders.Ubound )
		  
		  'If NOT app.DebugMode then
		  If f = Nil Then Return Else MovieAttr.NFORead f
		  
		  // 0. Movie Title
		  Dim MovieTitle as String
		  If MovieAttr.Title <> "" then
		    MovieTitle = MovieAttr.Title
		    If MovieAttr.DateYear > 0 then MovieTitle = MovieAttr.Title + " (" + str( MovieAttr.DateYear ) + ")"
		    Cell( LastIndex, 0 ) = MovieTitle
		  End If
		  
		  // 1. Absolute Path
		  // Already there.
		  
		  
		  // 2. MovieDB ID
		  If MovieAttr.ID_IMDB <> "" then
		    Cell( LastIndex, 2 ) = MovieAttr.ID_IMDB
		  ElseIf MovieAttr.ID_TMDB <> "" then
		    Cell( LastIndex, 2 ) = MovieAttr.ID_TMDB
		  End If
		  
		  // Set cache images
		  Dim PosterLoc as FolderItem = MovieAttr.DestinationPoster( f )
		  Dim ID as String = Cell( LastIndex, 2 )
		  
		  If Preferences.Prefs.boolForKey("ShowPostersInList") And ID <> "" And NOT Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ).Exists Then
		    If PosterLoc <> Nil And PosterLoc.Exists Then CacheImageSet( Picture.Open( PosterLoc ), ID + ".movie.poster.jpg" )
		  End If
		  
		  // Set row image.
		  If Preferences.Prefs.boolForKey("ShowPostersInList") Then
		    If Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ) <> Nil And NOT Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ).Exists Then
		      If PosterLoc IsA FolderItem Then CellTag( LastIndex, 15 ) = ScaleImage( Picture.Open( PosterLoc ), 128, 128 )
		    ElseIf Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ) <> Nil Then
		      CellTag( LastIndex, 15 ) = ScaleImage( Picture.Open( Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ) ), 128, 128 )
		    End If
		  End If
		  
		  // 3. Sort Title
		  If MovieAttr.TitleSort <> "" then
		    Cell( LastIndex, 3 ) = MovieAttr.TitleSort
		  ElseIf MovieAttr.Title <> "" then
		    Cell( LastIndex, 3 ) = Articulator( MovieAttr.Title )
		    If MovieAttr.DateYear > 0 then Cell( LastIndex, 3 ) = Cell( LastIndex, 3 ) + " (" + str( MovieAttr.DateYear ) + ")"
		  Else
		    Cell( LastIndex, 3 ) = Articulator( Cell( LastIndex, 0 ) )
		  End If
		  
		  // 4. Status Watched
		  Dim NFOFile as FolderItem = FindNFOFile( f )
		  If NFOFile <> Nil And NFOFile.Exists Then Cell( LastIndex, 4 ) = str( MovieAttr.StatusWatched ) Else Cell( LastIndex, 4 ) = ""
		  
		  // 5. Date Premiered
		  If MovieAttr.DatePremiered <> "" Then
		    Cell( LastIndex, 5 ) = MovieAttr.DatePremiered
		  ElseIf ( MovieAttr.DatePremiered = "N/A" Or MovieAttr.DatePremiered = "" ) and MovieAttr.DateYear > 0 Then
		    Cell( LastIndex, 5 ) = str(MovieAttr.DateYear)
		  End If
		  
		  // 6. Definition/Quality
		  Dim MovieFile as FolderItem = FindMovieItem( f )
		  If MovieAttr.InfoVideoHeight > -1 Or MovieFile <> Nil Then
		    
		    If MovieFile.Name = "VIDEO_TS" OR MovieFile.Name.Contains(".dvdmedia") OR MovieAttr.RipSource.Contains("DVD") Then
		      Cell( LastIndex, 6 ) = "DVD"
		    ElseIf MovieFile.Name = "BDMV" OR MovieAttr.RipSource.Contains("Blu") OR MovieAttr.RipSource.Contains("BD") Then
		      Cell( LastIndex, 6 ) = "BluRay"
		    ElseIf MovieAttr.InfoVideoHeight >= 4320 Or MovieAttr.InfoVideoWidth >= 7680 Then
		      Cell( LastIndex, 6 ) = "8K"
		    ElseIf MovieAttr.InfoVideoHeight >= 2880 Or MovieAttr.InfoVideoWidth >= 5120  Or ( MovieAttr.InfoVideoHeight < 4320 And MovieAttr.InfoVideoWidth >= 7680 ) Then
		      Cell( LastIndex, 6 ) = "5K"
		    ElseIf MovieAttr.InfoVideoHeight >= 2160 Or MovieAttr.InfoVideoWidth >= 3840  Or ( MovieAttr.InfoVideoHeight < 2880 And MovieAttr.InfoVideoWidth >= 5120 ) Then
		      Cell( LastIndex, 6 ) = "4K"
		    ElseIf MovieAttr.InfoVideoHeight >= 1080 Or MovieAttr.InfoVideoWidth >= 1920 Then
		      Cell( LastIndex, 6 ) = "1080p"
		    ElseIf ( MovieAttr.InfoVideoHeight < 1080 And MovieAttr.InfoVideoHeight >= 720 ) Or ( MovieAttr.InfoVideoWidth < 1920 And MovieAttr.InfoVideoWidth >= 1280 ) Then
		      Cell( LastIndex, 6 ) = "720p"
		    ElseIf ( MovieAttr.InfoVideoHeight < 720 And MovieAttr.InfoVideoHeight > 0 ) And ( MovieAttr.InfoVideoWidth < 1280 And MovieAttr.InfoVideoWidth > 0 ) Then
		      Cell( LastIndex, 6 ) = "SD"
		    ElseIf MovieFile.NameExtension = "ISO" OR MovieFile.NameExtension = "RAR" OR MovieFile.NameExtension = "ZIP" then
		      Cell( LastIndex, 6 ) = "Package " + MovieFile.NameExtension
		    Else
		      Cell( LastIndex, 6 ) = "N/A"
		      
		    End If
		    
		  End If
		  
		  // 7. Rating
		  If MovieAttr.Rating > -1 then
		    Dim rate as String = Str( MovieAttr.Rating )
		    If rate.Len = 1 Then rate = rate + ".0"
		    If rate.Len = 3 Then rate = "0" + rate
		    
		    Cell( LastIndex, 7 ) = rate
		  End If
		  
		  // 8. FilesAvailable
		  If FindImagePoster( f ) <> Nil Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "Poster|"
		  If FindImageFanart( f ) <> Nil Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "Fanart|"
		  If FindTrailerItem( f ) <> Nil Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "Trailer|"
		  If FindSubtitles( f )   <> Nil Or MovieAttr.InfoSubtitleLanguage.Ubound > -1 Then _
		  Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "Subtitle|"
		  
		  If FindImageBanner( f ) <> Nil       Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "Banner|"
		  If f.Child( "clearart.png" ).Exists  Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "ClearArt|"
		  If f.Child( "disc.png" ).Exists      Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "DiscArt|"
		  If f.Child( "logo.png" ).Exists      Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "Logo|"
		  If f.Child( "landscape.jpg" ).Exists Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "Landscape|"
		  If f.Child( "extrathumbs" ).Exists   Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "ExtraT|"
		  If f.Child( "extrafanart" ).Exists   Then Cell( LastIndex, 8 ) = Cell( LastIndex, 8 ) + "ExtraF|"
		  
		  // 9. Set
		  If MovieAttr.SetOrder > -1 Then Cell( LastIndex, 9 ) = MovieAttr.Set + "" + str(MovieAttr.SetOrder) Else Cell( LastIndex, 9 ) = MovieAttr.Set
		  
		  // 10. Studio
		  If MovieAttr.Studios.Ubound > -1 Then Cell( LastIndex, 10 ) = MovieAttr.Studios(0)
		  
		  // 11. Size
		  Dim s() as FolderItem = FindMovieItems( f )
		  If s.Ubound > -1 Then
		    Dim TotalSize as String
		    For i as Integer = 0 to s.Ubound
		      If s(i).Name = "VIDEO_TS" or s(i).Name.contains(".dvdmedia") Then
		        TotalSize = "4630" + "000" + "000"
		      ElseIf s(i).Name = "BDMV" Then
		        TotalSize = "25000" + "000" + "000"
		      Else
		        TotalSize = Str( Val( TotalSize ) + ( s(i).Length ) )' / 1000 / 1000 ) )
		      End If
		    Next
		    
		    'If TotalSize.NthField(".",1).Len = 2 Then TotalSize = "000" + TotalSize
		    'If TotalSize.NthField(".",1).Len = 3 Then TotalSize = "00"  + TotalSize
		    'If TotalSize.NthField(".",1).Len = 4 Then TotalSize = "0"   + TotalSize
		    
		    Cell( LastIndex, 11 ) = Str( TotalSize )
		  End If
		  
		  // 12. Duration
		  If MovieAttr.InfoVideoRuntime <> "" Then
		    Dim t as String = Format( MovieAttr.InfoVideoRuntime.Val, "0000" )
		    Cell( LastIndex, 12 ) = t
		  End If
		  
		  // 13. VideoCodec
		  If MovieAttr.InfoVideoCodec <> "" Then
		    Dim Codec as String = MovieAttr.InfoVideoCodec
		    Codec = Trim( Codec.ReplaceAll("-","") )
		    Codec = Trim( Codec.ReplaceAll("Visual","") )
		    Codec = Trim( Codec.ReplaceAll("Video","") )
		    If Codec.InStr(0, "ISO") > 0 Then Codec = "ISO"
		    
		    Select Case Codec
		      
		    Case "MPEG4"
		      Codec = "DivX"
		    Case "AVC"
		      Codec = "H.264"
		    Case "h264"
		      Codec = "H.264"
		      
		    End Select
		    
		    If Codec.Len > 6 Then Codec = Trim( Codec.Left(6) )
		    Cell( LastIndex, 13 ) = Codec
		  End If
		  
		  // 14. AudioCodec
		  If MovieAttr.InfoAudioCodec.Ubound > -1 Then
		    Dim Codec as String = MovieAttr.InfoAudioCodec(0).ReplaceAll("AC3", "AC-3")
		    Codec = Trim( Codec.ReplaceAll("Audio","") )
		    
		    Cell( LastIndex, 14 ) = Codec
		  End If
		  
		  // 15 - 25. Extra files
		  If FindImagePoster( f ) <> Nil Then Cell( LastIndex, 15 ) = "Poster"  Else Cell( LastIndex, 15 ) = "-"
		  If FindImageFanart( f ) <> Nil Then Cell( LastIndex, 16 ) = "Fanart"  Else Cell( LastIndex, 16 ) = "-"
		  If FindTrailerItem( f ) <> Nil Then Cell( LastIndex, 17 ) = "Trailer" Else Cell( LastIndex, 17 ) = "-"
		  If FindSubtitles( f )   <> Nil Or MovieAttr.InfoSubtitleLanguage.Ubound > -1 Then _
		  Cell( LastIndex, 18 ) = "Subtitle" Else Cell( LastIndex, 18 ) = "-"
		  
		  If FindImageBanner( f ) <> Nil       Then Cell( LastIndex, 19 ) = "Banner"      Else Cell( LastIndex, 19 ) = "-"
		  If f.Child( "clearart.png" ).Exists  Then Cell( LastIndex, 20 ) = "ClearArt"    Else Cell( LastIndex, 20 ) = "-"
		  If f.Child( "disc.png" ).Exists      Then Cell( LastIndex, 21 ) = "DiscArt"     Else Cell( LastIndex, 21 ) = "-"
		  If f.Child( "logo.png" ).Exists      Then Cell( LastIndex, 22 ) = "Logo"        Else Cell( LastIndex, 22 ) = "-"
		  If f.Child( "landscape.jpg" ).Exists Then Cell( LastIndex, 23 ) = "Landscape"   Else Cell( LastIndex, 23 ) = "-"
		  If f.Child( "extrathumbs" ).Exists   Then Cell( LastIndex, 24 ) = "ExtraThumbs" Else Cell( LastIndex, 24 ) = "-"
		  If f.Child( "extrafanart" ).Exists   Then Cell( LastIndex, 25 ) = "ExtraFanart" Else Cell( LastIndex, 25 ) = "-"
		  
		  If MovieAttr.Locked Then Cell( LastIndex, 26 ) = Str( MovieAttr.Locked ) Else Cell( LastIndex, 26 ) = ""
		  
		  Exception err as OutOfBoundsException
		    App.ErrorMessage = "Went out of bounds somewhere while adding items"
		    'Dim w as new wndBugReporter
		    'w.Init( err, "LstMovie.AddItem( " + f.ShellPath + " )" )
		    
		    if AppSettings.HandleError( err, "OutOfBoundsException (caught at AddItem( " + f.ShellPath + " )) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ConstructMountMenu() As MenuItem
		  Dim base as new MenuItem ( "Filter Shares" )
		  
		  
		  Dim miAll as New MenuItem ( "All" )
		  Dim miSeperator as New MenuItem ( "-" )
		  
		  miAll.Name = "Share:All"
		  'miAll.Checked = ( FilterSelection = "All" )
		  
		  base.Append miAll
		  base.Append miSeperator
		  
		  Dim Dict as Dictionary = Preferences.Prefs.dictionaryForKey("MoviePaths")
		  If Dict.Count <= 1 Then Return Nil
		  
		  For Each Key as Variant in Dict.Keys
		    Dim ShareName as String = Trim( Dict.Value( Key ) )
		    Dim SharePath as String = Key
		    Dim tpm as New MenuItem ( ShareName )
		    tpm.Name = "Share:" + SharePath
		    'tpm.Checked = ( FilterSelection = "Share:" + SharePath )
		    base.Append tpm
		  Next
		  
		  If Dict.Count > 1 Then Return base Else Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateList(Update as Boolean = True)
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  Dim ErrMessage as String = "Starting the creationg of the list"
		  
		  Dim f as FolderItem = SpecialFolder.ApplicationData.Child("ViMediaManager")
		  If f <> Nil And f.Exists And f.Directory And f.Child("MovieDB.xml").Exists Then f.Child("MovieDB.xml").Delete
		  
		  Dim Dict as Dictionary = Preferences.Prefs.dictionaryForKey("MoviePaths")
		  Dim Paths() as FolderItem
		  
		  ErrMessage = "Loading all root paths"
		  If Dict = Nil Then
		    Me.DeleteAllRows
		    Return
		  End If
		  
		  For Each Key as Variant in Dict.Keys
		    If Key.StringValue.InStr( 0, ":" ) > 0 Then
		      Paths.Append GetFolderItem( Key )
		    Else
		      
		      Try
		        If Key <> "" Then Paths.Append GetFolderItem( Key, FolderItem.PathTypeShell )
		      Catch err as UnsupportedFormatException
		        Log "Unsupported format exception: " + Key
		        Continue
		      End Try
		      
		    End If
		  Next
		  
		  ErrMessage = "Remembering the list selection, then deleting everything"
		  ReDim MovieFolders(-1)
		  lindex = ListIndex
		  ListIndex = -1
		  If NOT Update Then Me.DeleteAllRows
		  If Paths.Ubound = -1 then
		    Me.DeleteAllRows
		    Return
		  End If
		  
		  
		  // Scan available directories for movie files.
		  For i as Integer = 0 to Paths.Ubound
		    If Paths(i) <> Nil and Paths(i).Exists then
		      For n as Integer = 1 to Paths(i).Count
		        If Paths(i).Item(n) <> Nil And Paths(i).Item(n).Exists And Paths(i).Item(n).Directory Then
		          ScanDirCount = 0
		          ScanDir Paths(i).Item(n)
		        End If
		      Next
		    End If
		  Next
		  
		  // If update, remove folders that no longer exist.
		  If Update Then
		    
		    For i as Integer = ListCount - 1 DownTo 0
		      
		      Dim listfolder as FolderItem
		      If Cell( i, 1 ).InStr( 0, ":" ) > 0 Then
		        listfolder = GetFolderItem( Cell( i, 1 ) )
		      Else
		        Try
		          If Cell( i, 1 ) <> "" Then listfolder = GetFolderItem( Cell( i, 1 ), FolderItem.PathTypeShell )
		        Catch err as UnsupportedFormatException
		          Log "Unsupported format exception 2: " + Cell(i,1)
		          RemoveRow(i)
		          Continue
		        End Try
		      End If
		      
		      If listfolder = Nil OR NOT listfolder.Exists Then
		        RemoveRow i
		        Continue
		      End If
		      
		      // Remove folders who's root folder no longer exists.
		      Dim b as Boolean = False
		      For n as Integer = 0 to Paths.Ubound
		        If Paths(n) = Nil Then Continue
		        b = ( listfolder.ShellPath.InStr( 0, Paths(n).ShellPath ) > 0 )
		        If b Then Exit
		      Next
		      If NOT b Then RemoveRow i
		      
		    Next
		    
		  End If
		  
		  // If update, add folders that aren't in the list yet, otherwise add every folder.
		  For i as Integer = 0 to MovieFolders.Ubound
		    If MovieFolders(i) = Nil OR NOT MovieFolders(i).Exists Then Continue
		    
		    If Update Then
		      Dim b as Boolean = False
		      For n as Integer = 0 to ListCount - 1
		        If cell( n, 1 ) = MovieFolders(i).ShellPath Then
		          b = True
		          Exit
		        End If
		      Next
		      
		      If NOT b Then AddItem MovieFolders(i)
		      
		    Else
		      AddItem MovieFolders(i)
		    End If
		    
		  Next
		  
		  SaveToDB
		  ReDim MovieFolders(-1)
		  SortList
		  wndMain.lstSearch.CopyFrom Me
		  
		  wndMain.ActBar( ActiveSection ).TextValue( Str( Me.ListCount ) + " " + Loc.Movies )
		  'Return
		  
		  'Listindex
		  If lindex > -1 and lindex > ListCount - 1 then
		    ListIndex = ListCount - 1
		  ElseIf lindex > -1 then
		    ListIndex = lindex
		  Else
		    ListIndex = 0
		  End If
		  lindex = -1
		  
		  
		  Dict = Nil
		  ReDim MovieFolders(-1)
		  
		  Return
		  
		  'Exception err as NilObjectException
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItem()
		  If ListIndex = -1 then Return
		  
		  Dim LastIndex as Integer = ListIndex
		  Dim Path as String = Cell( ListIndex, 1 )
		  Dim f as FolderItem = GetFolderItem( Path, FolderItem.PathTypeShell )
		  
		  If f <> Nil And f.Exists Then
		    
		    Dim strRemoveItem   as String = Loc.msgRemoveItem.ReplaceAll( "%S", Cell( ListIndex, 0 ) ).ReplaceAll( "%F", f.Parent.Name )
		    Dim strMovedToTrash as String = Loc.msgWillBeMovedToTrash.ReplaceAll( "%F", f.Parent.Name )
		    
		    If MsgDlg( Parent.Window, 1, strRemoveItem, strMovedToTrash, Loc.btnMoveToTrash, Loc.btnKeepIt ) = 2 Then Return
		    
		    // Update the 'search listbox'.
		    'For i as Integer = 0 to wndMain.lstSearchMovies.ListCount - 1
		    'If wndMain.lstSearchMovies.Cell( i, 1 ) = Path Then wndMain.lstSearchMovies.RemoveRow(i)
		    'Next
		    
		    If f.IsNetworkVolume Then f.Delete Else f.MoveToTrash()
		    CacheImageDelete( MovieAttr.ID_IMDB )
		    RemoveItem
		    
		    wndMain.lstSearch.CopyFrom( Me ) // Update the 'search listbox'.
		  End If
		  
		  If LastIndex >= ListCount Then ListIndex = ListCount - 1 Else ListIndex = LastIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FilterShares(SharePath as String)
		  
		  // UNUSED
		  
		  #If TargetLinux Then
		    
		    Dim LstBox as Listbox = wndMain.lstSearch
		    
		    // 0, 2, 5, 9, 10
		    Me.DeleteAllRows
		    'FilterSelection = "Share:" + SharePath
		    
		    If SharePath <> "" and SharePath <> "All" Then
		      
		      Me.ListIndex = -1
		      
		      For i as Integer = 0 to LstBox.ListCount - 1
		        Dim s as String = LstBox.Cell(i,1)
		        If s.InStr( 0, SharePath ) > 0 Then
		          'If s.Left( SharePath.Len ) = SharePath Then
		          Me.AddRow LstBox.Cell(i,0), LstBox.Cell(i,1), LstBox.Cell(i,2), LstBox.Cell(i,3), LstBox.Cell(i,4), LstBox.Cell(i,5), LstBox.Cell(i,6), LstBox.Cell(i,7), LstBox.Cell(i,8), LstBox.Cell(i,9), LstBox.Cell(i,10), LstBox.Cell(i,11)
		          'End If
		        End If
		      Next
		      
		    Else
		      
		      For i as Integer = 0 to LstBox.ListCount - 1
		        Me.AddRow LstBox.Cell(i,0), LstBox.Cell(i,1), LstBox.Cell(i,2), LstBox.Cell(i,3), LstBox.Cell(i,4), LstBox.Cell(i,5), LstBox.Cell(i,6), LstBox.Cell(i,7), LstBox.Cell(i,8), LstBox.Cell(i,9), LstBox.Cell(i,10), LstBox.Cell(i,11)
		      Next
		      
		      me.ListIndex = 0
		      
		    End If
		    
		    wndMain.ActBar( ActiveSection ).Text = Str( wndMain.lstMovies.ListCount ) + " " + Loc.Movies
		    wndMain.ActBar( ActiveSection ).Reload
		    
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadList()
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #endif
		  
		  Dim AppSupport as FolderItem = SpecialFolder.ApplicationData.Child("ViMediaManager")
		  If AppSupport.Child("MovieDB.xml") <> Nil and AppSupport.Child("MovieDB.xml").Exists then
		    
		    Dim Xml as new XmlDocument
		    Dim xRoot, xNode, xItem as XmlNode
		    Dim fi as FolderItem
		    Xml.PreserveWhitespace = False
		    
		    'Dim TextIn as TextInputStream
		    'TextIn = TextIn.Open( SpecialFolder.ApplicationData.Child("ViMediaManager").Child("MovieDB.xml") )
		    Dim Content as String = ReadTextFile( AppSupport.Child( "MovieDB.xml" ) ) 'TextIn.ReadAll
		    'TextIn.Close
		    
		    If Content.Left(5) = "<?xml" Then Xml.LoadXml( content ) Else Return
		    xRoot = Xml.Child(0)
		    
		    DeleteAllRows
		    
		    For i as Integer = 0 to xRoot.ChildCount - 1
		      xNode = xRoot.Child(i)
		      Dim ID as String
		      
		      If xNode.FirstChild <> Nil Then
		        
		        AddRow " "
		        
		        For n as Integer = 0 to xNode.ChildCount - 1
		          xItem = xNode.Child(n)
		          
		          If xItem.FirstChild <> Nil then
		            
		            Select case xItem.Name
		              
		            case "Title"
		              Cell( LastIndex, 0 ) = xItem.FirstChild.Value
		            case "Path"
		              If xItem.FirstChild.Value.InStr( 0, ":" ) > 0 Then
		                Dim f as FolderItem = GetFolderItem( xItem.FirstChild.Value )
		                If f IsA FolderItem Then
		                  Cell( LastIndex, 1 ) = f.ShellPath
		                Else
		                  'RemoveRow( LastIndex )
		                  'Exit
		                End If
		              Else
		                Cell( LastIndex, 1 ) = xItem.FirstChild.Value
		              End If
		              
		            case "DBID"
		              Cell( LastIndex, 2 ) = xItem.FirstChild.Value
		              ID = Cell( LastIndex, 2 )
		            case "SortTitle"
		              Cell( LastIndex, 3 ) = xItem.FirstChild.Value
		            case "Status"
		              Cell( LastIndex, 4 ) = xItem.FirstChild.Value
		            case "Premiere"
		              Cell( LastIndex, 5 ) = xItem.FirstChild.Value
		            case "Quality"
		              Cell( LastIndex, 6 ) = xItem.FirstChild.Value
		            case "Rating"
		              Cell( LastIndex, 7 ) = xItem.FirstChild.Value
		            case "FilesAvailable"
		              Cell( LastIndex, 8 ) = xItem.FirstChild.Value
		            case "Set"
		              Cell( LastIndex, 9 ) = xItem.FirstChild.Value
		            case "Studio"
		              Cell( LastIndex, 10 ) = xItem.FirstChild.Value
		            case "Size"
		              Cell( LastIndex, 11 ) = xItem.FirstChild.Value
		            case "Runtime"
		              Cell( LastIndex, 12 ) = xItem.FirstChild.Value
		            case "VideoCodec"
		              Cell( LastIndex, 13 ) = xItem.FirstChild.Value
		            case "AudioCodec"
		              Cell( LastIndex, 14 ) = xItem.FirstChild.Value
		              
		              
		            case "ArtPoster"
		              Cell( LastIndex, 15 ) = xItem.FirstChild.Value
		            case "ArtFanart"
		              Cell( LastIndex, 16 ) = xItem.FirstChild.Value
		            case "Trailer"
		              Cell( LastIndex, 17 ) = xItem.FirstChild.Value
		            case "Subtitle"
		              Cell( LastIndex, 18 ) = xItem.FirstChild.Value
		            case "ArtBanner"
		              Cell( LastIndex, 19 ) = xItem.FirstChild.Value
		            case "ArtClearArt"
		              Cell( LastIndex, 20 ) = xItem.FirstChild.Value
		            case "ArtDisc"
		              Cell( LastIndex, 21 ) = xItem.FirstChild.Value
		            case "ArtLogo"
		              Cell( LastIndex, 22 ) = xItem.FirstChild.Value
		            case "ArtLandscape"
		              Cell( LastIndex, 23 ) = xItem.FirstChild.Value
		            case "ArtExtraThumbs"
		              Cell( LastIndex, 24 ) = xItem.FirstChild.Value
		            case "ArtExtraFanart"
		              Cell( LastIndex, 25 ) = xItem.FirstChild.Value
		              
		            case "Locked"
		              Cell( LastIndex, 26 ) = xItem.FirstChild.Value
		              
		            end Select
		            
		          End If
		          
		        Next
		        
		      End If
		      
		      // Remove row if the folder is not available.
		      Dim f as FolderItem
		      If Cell( LastIndex, 1 ) = "" Then
		        RemoveRow( LastIndex )
		        Continue
		      Else
		        If Cell( LastIndex, 1 ).InStr( 0, ":" ) > 0 Then
		          f = GetFolderItem( Cell( LastIndex, 1 ) )
		        Else
		          f = GetFolderItem( Cell( LastIndex, 1 ), FolderItem.PathTypeShell )
		        End If
		        If f = Nil or NOT f.Exists Then
		          RemoveRow( LastIndex )
		          Continue
		        End If
		      End If
		      
		      // Load poster into list for a speed boost.
		      'If True And Preferences.Prefs.boolForKey("ShowPostersInList") Then
		      'Dim Poster as FolderItem
		      'If f IsA FolderItem Then Poster = FindImagePoster( f )
		      '
		      'If ID <> "" And NOT Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ).Exists Then
		      'If Poster <> Nil And Poster.Exists Then CacheImageSet( Picture.Open( Poster ), ID + ".movie.poster.jpg" )
		      'End If
		      '
		      'If ID <> "" And Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ).Exists Then
		      'Poster = Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" )
		      'End If
		      '
		      'If Poster <> Nil And Poster.Exists Then
		      'CellTag( LastIndex, 15 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		      'End If
		      '
		      'End If
		      
		    Next
		    
		    'SortList
		  Else
		    CreateList
		  End If
		  
		  // Load poster into list for speed boost.
		  'For i as Integer = 0 to ListCount -1
		  'If Cell( i, 1 ) = "" Then Continue
		  'Dim ID as String = Cell( i, 2 )
		  'If ID = "" Then Continue
		  '
		  'Dim f as FolderItem = GetFolderItem( Cell( i, 1 ), FolderItem.PathTypeShell )
		  'If f = Nil OR NOT f.Exists Then Continue
		  '
		  'Dim Poster as FolderItem = FindImagePoster( f )
		  'If Preferences.fAppSupport.Child( "Cache" ).Child( ID + ".movie.poster.jpg" ).Exists Then
		  'Poster = Preferences.fAppSupport.Child( "Cache" ).Child( ID + ".movie.poster.jpg" )
		  'End If
		  'If Poster <> Nil And Poster.Exists Then CellTag( i, 15 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		  'Next
		  
		  wndMain.ActBar( 0 ).Text = str( ListCount ) + " " + Loc.Movies
		  SortList
		  If ActiveSection = 0 Then wndMain.lstSearch.CopyFrom Me
		  If ListIndex <> 0 then ListIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveItem()
		  RemoveRow( ListIndex )
		  SaveToDB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveToDB()
		  #pragma DisableBackgroundTasks
		  
		  Dim Xml as new XmlDocument
		  Dim xRoot, xNode as XmlNode
		  Xml.PreserveWhitespace = True
		  
		  'SortList(0)
		  
		  xRoot = Xml.AppendChild( Xml.CreateElement( "list" ) )
		  
		  For i as Integer = 0 to me.ListCount - 1
		    xNode = xRoot.AppendNewChild("movie")
		    xNode.AppendSimpleChild "Title",          Cell( i, 0 )
		    xNode.AppendSimpleChild "Path",           Cell( i, 1 )
		    xNode.AppendSimpleChild "DBID",           Cell( i, 2 )
		    xNode.AppendSimpleChild "SortTitle",      Cell( i, 3 )
		    xNode.AppendSimpleChild "Status",         Cell( i, 4 )
		    xNode.AppendSimpleChild "Premiere",       Cell( i, 5 )
		    xNode.AppendSimpleChild "Quality",        Cell( i, 6 )
		    xNode.AppendSimpleChild "Rating",         Cell( i, 7 )
		    xNode.AppendSimpleChild "FilesAvailable", Cell( i, 8 )
		    xNode.AppendSimpleChild "Set",            Cell( i, 9 )
		    xNode.AppendSimpleChild "Studio",         Cell( i, 10 )
		    xNode.AppendSimpleChild "Size",           Cell( i, 11 )
		    xNode.AppendSimpleChild "Runtime",        Cell( i, 12 )
		    xNode.AppendSimpleChild "VideoCodec",     Cell( i, 13 )
		    xNode.AppendSimpleChild "AudioCodec",     Cell( i, 14 )
		    
		    // Extra Files
		    xNode.AppendSimpleChild "ArtPoster",      Cell( i, 15 )
		    xNode.AppendSimpleChild "ArtFanart",      Cell( i, 16 )
		    xNode.AppendSimpleChild "Trailer",        Cell( i, 17 )
		    xNode.AppendSimpleChild "Subtitle",       Cell( i, 18 )
		    xNode.AppendSimpleChild "ArtBanner",      Cell( i, 19 )
		    xNode.AppendSimpleChild "ArtClearArt",    Cell( i, 20 )
		    xNode.AppendSimpleChild "ArtDisc",        Cell( i, 21 )
		    xNode.AppendSimpleChild "ArtLogo",        Cell( i, 22 )
		    xNode.AppendSimpleChild "ArtLandscape",   Cell( i, 23 )
		    xNode.AppendSimpleChild "ArtExtraThumbs", Cell( i, 24 )
		    xNode.AppendSimpleChild "ArtExtraFanart", Cell( i, 25 )
		    
		    xNode.AppendSimpleChild "Locked",         Cell( i, 26 )
		  Next
		  
		  xRoot.Indent(0)
		  'Xml.LoadXml( Xml.ToString )'.IndentRoot("list") )
		  
		  If Preferences.fAppSupport.Exists Then Xml.SaveXml( Preferences.fAppSupport.Child("MovieDB.xml") )
		  
		  'SortList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ScanDir(Dir as FolderItem)
		  #pragma DisableBackgroundTasks
		  
		  ScanDirCount = ScanDirCount + 1
		  
		  App.ErrorMessage = "Is Dir Nil?"
		  If Dir = Nil or NOT Dir.Exists then Return // Saveguarding
		  Dim MovieFile as FolderItem
		  
		  App.ErrorMessage = "Is Dir a Visible Directory?"
		  If Dir <> Nil and Dir.Visible and Dir.Directory then
		    
		    App.ErrorMessage = "Is there a moviefile inside Dir"
		    MovieFile = FindMovieItem( Dir )
		    If MovieFile <> Nil And MovieFile.Exists Then
		      dlgProgress.Add( Loc.kScanning + ":", dir.Name )
		      MovieFolders.Append MovieFile.Parent
		    End If
		    MovieFile = Nil
		    
		    
		    App.ErrorMessage = "Scanning directory items"
		    For i as Integer = 1 to Dir.Count
		      
		      Try
		        If Dir.Item(i) = Nil OR NOT Dir.Item(i).Exists Then Continue
		        
		        If  Dir.Item(i).Name <> "BDMV" And Dir.Item(i).Name <> "VIDEO_TS" and NOT Dir.Item(i).Name.Contains(".dvdmedia") And _
		          Dir.Item(i).Name <> "Deleted Scenes" And Dir.Item(i).Name <> "Extras" And _ // TODO: Edge case 'ignore folder name', should make a proper option for this.
		          Dir.Item(i).Name <> "Subs" And Dir.Item(i).Name <> "Subtitles" And Dir.Item(i).Name <> "Sample" and Dir.Item(i).Name <> "Themes" And _
		          Dir.Item(i).Name <> "extrathumbs" And Dir.Item(i).Name <> "extrafanart" And Dir.Item(i).Name <> "actors" And _
		          Dir.Item(i).Name.Left(1) <> "." And Dir.Item(i).Name.Left(1) <> "_" Then
		          ScanDir Dir.Item(i)
		        End If
		      Catch err as NilObjectException
		        Log "Couldn't scan directory " + Dir.Name + " item " + Str( i )
		        Continue
		      End Try
		      
		    Next
		  End If
		  
		  Exception err as NilObjectException
		    'Dim w as wndBugReporter
		    'w.Init( err, App.ErrorMessage + EndOfLine + "ScanDirCount: " + Str( ScanDirCount ) )
		    if AppSettings.HandleError( err, "NilObectException (caught at ScanDir( " + dir.Name + " )" + chr( 13 ) + App.ErrorMessage + chr(13) + "ScanDirCount: " + Str(ScanDirCount) ) then
		      
		    end if
		    Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchList(SearchTerm as String)
		  wndMain.lstSearch.Search( SearchTerm, Me )
		  
		  'Dim LstBox as Listbox = wndMain.lstSearch
		  '
		  '// 0, 2, 5, 9, 10
		  'Me.DeleteAllRows
		  '
		  'If SearchTerm <> "" Then
		  '
		  'Me.ListIndex = -1
		  '
		  'For i as Integer = 0 to LstBox.ListCount - 1
		  'Dim s as String = LstBox.Cell(i,0) + " " + LstBox.Cell(i,2) + " " + LstBox.Cell(i,5) + " " + LstBox.Cell(i, 9) + " " + LstBox.Cell(i, 10)
		  'If s.InStr( 0, SearchTerm ) > 0 Then
		  'Me.AddRow LstBox.Cell(i,0), LstBox.Cell(i,1), LstBox.Cell(i,2), LstBox.Cell(i,3), LstBox.Cell(i,4), LstBox.Cell(i,5), LstBox.Cell(i,6), LstBox.Cell(i,7), LstBox.Cell(i,8), LstBox.Cell(i,9), LstBox.Cell(i,10), LstBox.Cell(i,11), LstBox.Cell(i,12)
		  'End If
		  'Next
		  '
		  'me.ListIndex = 0
		  '
		  'Else
		  '
		  'Dim Path as String = Me.Cell( Me.ListIndex, 1 )
		  '
		  'For i as Integer = 0 to LstBox.ListCount - 1
		  'Me.AddRow LstBox.Cell(i,0), LstBox.Cell(i,1), LstBox.Cell(i,2), LstBox.Cell(i,3), LstBox.Cell(i,4), LstBox.Cell(i,5), LstBox.Cell(i,6), LstBox.Cell(i,7), LstBox.Cell(i,8), LstBox.Cell(i,9), LstBox.Cell(i,10), LstBox.Cell(i,11), LstBox.Cell(i,12)
		  'Next
		  '
		  'For i as Integer = 0 to Me.ListCount - 1
		  'If Me.Cell(i, 1) = Path Then Me.ListIndex = i
		  'Return
		  'Next
		  '
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortList(SortColumn as Integer = - 1)
		  #pragma DisableBackgroundTasks
		  If wndMain.ccSearchBoxMovies.srchField.StringValue <> "" Then Return
		  // Title
		  'SortedColumn = 0
		  'ColumnSortDirection(0) = 1
		  'Sort
		  
		  // Sort Title
		  'SortedColumn = 3
		  'ColumnSortDirection(3) = 1
		  'Sort
		  
		  'Dim lstBox as Listbox = wndMain.lstSearchMovies
		  
		  If SortColumn = -1 then SortColumn = Preferences.Prefs.integerForKey("SortByMovie")
		  
		  Dim SortDir as Integer = 1
		  If Preferences.Prefs.boolForKey("SortMovieAscending") Then SortDir = -1
		  
		  Dim Zort as Integer
		  Select Case SortColumn
		    
		  Case 0 // Movie Title
		    Zort = 0
		    
		  Case 1 // Movie Sort Title
		    Zort = 3
		    
		  Case 2 // Path
		    Zort = 1
		    
		  Case 3 // Watched Status
		    Zort = 4
		    
		  Case 4 // Premiere Date
		    If SortDir = -1 Then SortDir = 1 Else SortDir = -1 // Reverse for numeric
		    Zort = 5
		    
		  Case 5 // Quality
		    Zort = 6
		    
		  Case 6 // Rating
		    If SortDir = -1 Then SortDir = 1 Else SortDir = -1 // Reverse for numeric
		    Zort = 7
		    
		  Case 7 // Size
		    If SortDir = -1 Then SortDir = 1 Else SortDir = -1 // Reverse for numeric
		    Zort = 11
		    
		  Case 8 // Duration
		    If SortDir = -1 Then SortDir = 1 Else SortDir = -1 // Reverse for numeric
		    Zort = 12
		    
		  End Select
		  
		  SortedColumn = Zort
		  ColumnSortDirection( Zort ) = SortDir
		  
		  
		  // Image availability
		  Select Case SortColumn
		    
		  Case 10 // Poster
		    SortedColumn = 15
		    ColumnSortDirection(15) = SortDir
		  Case 11 // Fanart
		    SortedColumn = 16
		    ColumnSortDirection(16) = SortDir
		  Case 12 // Banner
		    SortedColumn = 19
		    ColumnSortDirection(19) = SortDir
		  Case 13 // Logo
		    SortedColumn = 22
		    ColumnSortDirection(22) = SortDir
		  Case 14 // ClearArt
		    SortedColumn = 20
		    ColumnSortDirection(20) = SortDir
		  Case 15 // Landscape
		    SortedColumn = 23
		    ColumnSortDirection(23) = SortDir
		  Case 16 // DiscArt
		    SortedColumn = 21
		    ColumnSortDirection(21) = SortDir
		  case 17 // ExtraThumbs
		    SortedColumn = 24
		    ColumnSortDirection(24) = SortDir
		  Case 18 // ExtraFanart
		    SortedColumn = 25
		    ColumnSortDirection(25) = SortDir
		  Case 19 // Trailer
		    SortedColumn = 17
		    ColumnSortDirection(17) = SortDir
		  Case 20 // Subtitles
		    SortedColumn = 20
		    ColumnSortDirection(20) = SortDir
		    
		  End Select
		  
		  
		  If SortColumn > -1 Then
		    Sort
		    'wndMain.lstSearch.CopyFrom( Me )
		    'lstBox.Sort
		  End If
		  
		  If Trim( wndMain.ccSearchBoxMovies.srchField.StringValue ) = "" Then
		    'wndMain.lstSearchMovies.DeleteAllRows
		    'For i as Integer = 0 to ListCount - 1
		    'wndMain.lstSearchMovies.AddRow Cell(i, 0), Cell(i, 1), Cell(i, 2), Cell(i, 3), Cell(i, 4), Cell(i, 5), Cell(i, 6), Cell(i, 7), Cell(i, 8), Cell(i, 9), Cell(i, 10), Cell(i, 11), Cell(i, 12)
		    'Next
		    wndMain.lstSearch.CopyFrom( Me )
		    SaveToDB
		  Else
		    SaveToDB
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRow(Lindex as Integer = - 1, NewLocation as FolderItem = Nil)
		  '#pragma DisableBackgroundTasks
		  
		  If Lindex = -1 Then Lindex = ListIndex
		  Dim f as FolderItem
		  If NewLocation = Nil Then
		    f = GetFolderItem( Cell( Lindex, 1 ), FolderItem.PathTypeShell )
		  Else
		    f = NewLocation
		  End If
		  
		  
		  If f = Nil or NOT f.Exists or NOT f.IsReadable then Return
		  
		  If CommonCore.MassSearch Then MovieAttr.NFORead f
		  
		  // 0. Movie Title
		  Dim MovieTitle as String
		  If MovieAttr.Title <> "" then
		    MovieTitle = MovieAttr.Title
		    If MovieAttr.DateYear > 0 then MovieTitle = MovieAttr.Title + " (" + str( MovieAttr.DateYear ) + ")"
		    Cell( Lindex, 0 ) = MovieTitle
		  End If
		  
		  // 1. Absolute Path
		  If NewLocation <> Nil And f <> Nil and f.Exists Then Cell( Lindex, 1 ) = f.ShellPath 'AbsolutePath
		  
		  
		  // 2. MovieDB ID
		  If MovieAttr.ID_IMDB <> "" Then
		    Cell( Lindex, 2 ) = MovieAttr.ID_IMDB
		  ElseIf MovieAttr.ID_TMDB <> "" Then
		    Cell( Lindex, 2 ) = MovieAttr.ID_TMDB
		  End If
		  
		  'Try
		  // Set cache images
		  Dim ID as String = Cell( Lindex, 2 )
		  Dim PosterLoc as FolderItem = MovieAttr.DestinationPoster( f )
		  If Preferences.Prefs.boolForKey("ShowPostersInList") And ID <> "" And NOT Preferences.fAppSupport.Child("Cache").Child( Cell( Lindex, 2 ) + ".movie.poster.jpg" ).Exists Then
		    If PosterLoc <> Nil And PosterLoc.Exists Then CacheImageSet( Picture.Open( PosterLoc ), ID + ".movie.poster.jpg" )
		  End If
		  
		  // Set row image.
		  If Preferences.Prefs.boolForKey("ShowPostersInList") Then
		    If NOT Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ) IsA FolderItem Then
		      If PosterLoc <> Nil And PosterLoc.Exists Then CellTag( Lindex, 15 ) = ScaleImage( Picture.Open( PosterLoc ), 128, 128 )
		    Else
		      CellTag( Lindex, 15 ) = ScaleImage( Picture.Open( Preferences.fAppSupport.Child("Cache").Child( ID + ".movie.poster.jpg" ) ), 128, 128 )
		    End If
		  End If
		  'Catch err as NilObjectException
		  'Log( "No poster image found" )
		  'End Try
		  
		  
		  // 3. Sort Title
		  If MovieAttr.TitleSort <> "" then
		    Cell( Lindex, 3 ) = MovieAttr.TitleSort
		  ElseIf MovieAttr.Title <> "" then
		    Cell( Lindex, 3 ) = Articulator( MovieAttr.Title )
		    If MovieAttr.DateYear > 0 then Cell( Lindex, 3 ) = Cell( Lindex, 3 ) + " (" + str( MovieAttr.DateYear ) + ")"
		  Else
		    Cell( Lindex, 3 ) = Articulator( Cell( Lindex, 0 ) )
		  End If
		  
		  // 4. Status Watched
		  Dim NFOFile as FolderItem = FindNFOFile( f )
		  If f <> Nil And f.Exists Then Cell( Lindex, 4 ) = str( MovieAttr.StatusWatched ) Else Cell( Lindex, 4 ) = ""
		  
		  // 5. Date Premiered
		  If MovieAttr.DatePremiered <> "" then
		    Cell( Lindex, 5 ) = MovieAttr.DatePremiered
		  ElseIf ( MovieAttr.DatePremiered = "N/A" Or MovieAttr.DatePremiered = "" ) and MovieAttr.DateYear > 0 Then
		    Cell( Lindex, 5 ) = str(MovieAttr.DateYear)
		  End If
		  
		  // 6. Definition/Quality
		  If MovieAttr.InfoVideoHeight > -1 then
		    
		    If MovieAttr.InfoVideoHeight >= 4320 Or MovieAttr.InfoVideoWidth >= 7680 Then
		      Cell( Lindex, 6 ) = "8K"
		    ElseIf MovieAttr.InfoVideoHeight >= 2880 Or MovieAttr.InfoVideoWidth >= 5120  Or ( MovieAttr.InfoVideoHeight < 4320 And MovieAttr.InfoVideoWidth >= 7680 ) Then
		      Cell( Lindex, 6 ) = "5K"
		    ElseIf MovieAttr.InfoVideoHeight >= 2160 Or MovieAttr.InfoVideoWidth >= 3840  Or ( MovieAttr.InfoVideoHeight < 2880 And MovieAttr.InfoVideoWidth >= 5120 ) Then
		      Cell( Lindex, 6 ) = "4K"
		    elseIf MovieAttr.InfoVideoHeight >= 1080 or MovieAttr.InfoVideoWidth >= 1920 then
		      Cell( Lindex, 6 ) = "1080p"
		    ElseIf ( MovieAttr.InfoVideoHeight < 1080 and MovieAttr.InfoVideoHeight >=  720 ) or _
		      ( MovieAttr.InfoVideoWidth  < 1920 and MovieAttr.InfoVideoWidth  >= 1280 ) then
		      Cell( Lindex, 6 ) = "720p"
		    ElseIf MovieAttr.InfoVideoHeight < 720 and MovieAttr.InfoVideoWidth < 1280 then
		      Cell( Lindex, 6 ) = "SD"
		    Else
		      Cell( Lindex, 6 ) = "N/A"
		    End If
		  End If
		  
		  If MovieAttr.FolderParent <> Nil Then
		    Dim MovieFile as FolderItem = FindMovieItem( MovieAttr.FolderParent )
		    If MovieAttr.FolderParent.Child( "VIDEO_TS" ).Exists OR MovieAttr.RipSource.Contains("DVD") then
		      Cell( Lindex, 6 ) = "DVD"
		    ElseIf MovieAttr.FolderParent.Child( "BDMV" ).Exists OR MovieAttr.RipSource.Contains("Blu") OR MovieAttr.RipSource.Contains("BD") Then
		      Cell( Lindex, 6 ) = "BluRay"
		    ElseIf MovieFile <> Nil and MovieFile.NameExtension = "ISO" OR MovieFile.NameExtension = "RAR" OR MovieFile.NameExtension = "ZIP" then
		      Cell( LastIndex, 6 ) = "Package " + MovieFile.NameExtension
		    End If
		  End If
		  
		  
		  // 7. Rating
		  If MovieAttr.Rating > -1 Then
		    Dim Rate as String = Str( MovieAttr.Rating )
		    If Rate.Len = 1 Then Rate = Rate + ".0"
		    If Rate.Len = 3 Then Rate = "0" + Rate
		    Cell( Lindex, 7 ) = Rate
		  End If
		  
		  // 8. FilesAvailable
		  If f <> Nil And f.Exists Then
		    Cell( Lindex, 8 ) = ""
		    If FindImagePoster( f ) <> Nil Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "Poster|"
		    If FindImageFanart( f ) <> Nil Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "Fanart|"
		    If FindTrailerItem( f ) <> Nil Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "Trailer|"
		    If FindSubtitles( f )   <> Nil Or MovieAttr.InfoSubtitleLanguage.Ubound > -1 Then _
		    Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "Subtitle|"
		    
		    If FindImageBanner( f ) <> Nil       Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "Banner|"
		    If f.Child( "clearart.png" ).Exists  Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "ClearArt|"
		    If f.Child( "disc.png" ).Exists      Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "DiscArt|"
		    If f.Child( "logo.png" ).Exists      Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "Logo|"
		    If f.Child( "landscape.jpg" ).Exists Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "Landscape|"
		    If f.Child( "extrathumbs" ).Exists   Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "ExtraT|"
		    If f.Child( "extrafanart" ).Exists   Then Cell( Lindex, 8 ) = Cell( Lindex, 8 ) + "ExtraF|"
		  End If
		  
		  // 9. Set
		  If MovieAttr.SetOrder > -1 Then Cell( Lindex, 9 ) = MovieAttr.Set + "" + str( MovieAttr.SetOrder ) Else Cell( Lindex, 9 ) = MovieAttr.Set
		  
		  // 10. Studio
		  If MovieAttr.Studios.Ubound > -1 Then Cell( Lindex, 10 ) = MovieAttr.Studios(0)
		  
		  // 11. Size
		  Dim s() as FolderItem = FindMovieItems( f )
		  If s.Ubound > -1 Then
		    Dim TotalSize as String
		    For i as Integer = 0 to s.Ubound
		      If s(i) = Nil OR NOT s(i).Exists Then Continue
		      
		      If s(i).Name = "VIDEO_TS" or s(i).name.contains(".dvdmedia") Then
		        TotalSize = "4630" + "000" + "000"
		      ElseIf s(i).Name = "BDMV" Then
		        TotalSize = "25000" + "000" + "000"
		      Else
		        TotalSize = Str( Val( TotalSize ) + ( s(i).Length ) )' / 1000 / 1000 ) )
		      End If
		      
		    Next
		    
		    'If TotalSize.NthField(".",1).Len = 2 Then TotalSize = "000" + TotalSize
		    'If TotalSize.NthField(".",1).Len = 3 Then TotalSize = "00"  + TotalSize
		    'If TotalSize.NthField(".",1).Len = 4 Then TotalSize = "0"   + TotalSize
		    
		    Cell( Lindex, 11 ) = Str( TotalSize )
		  End If
		  
		  // 12. Duration
		  If MovieAttr.InfoVideoRuntime <> "" Then
		    Dim t as String = Format( MovieAttr.InfoVideoRuntime.Val, "0000" )
		    Cell( Lindex, 12 ) = t
		  End If
		  
		  // 13. VideoCodec
		  If MovieAttr.InfoVideoCodec <> "" Then
		    Dim Codec as String = MovieAttr.InfoVideoCodec
		    Codec = Trim( Codec.ReplaceAll("-","") )
		    Codec = Trim( Codec.ReplaceAll("Visual","") )
		    Codec = Trim( Codec.ReplaceAll("Video","") )
		    If Codec.InStr(0, "ISO") > 0 Then Codec = "ISO"
		    
		    Select Case Codec
		      
		    Case "MPEG4 Visual"
		      Codec = "DivX"
		    Case "AVC"
		      Codec = "H.264"
		    Case "h264"
		      Codec = "H.264"
		      
		    End Select
		    
		    If Codec.Len > 6 Then Codec = Trim( Codec.Left(6) )
		    Cell( Lindex, 13 ) = Codec
		  End If
		  
		  // 14. AudioCodec
		  If MovieAttr.InfoAudioCodec.Ubound > -1 Then
		    Dim Codec as String = MovieAttr.InfoAudioCodec(0).ReplaceAll("AC3", "AC-3")
		    Codec = Trim( Codec.ReplaceAll("Audio","") )
		    
		    Cell( Lindex, 14 ) = Codec
		  End If
		  
		  // 15 - 25. Extra files
		  If f <> Nil And f.Exists Then
		    If FindImagePoster( f ) <> Nil Then Cell( Lindex, 15 ) = "Poster"  Else Cell( Lindex, 15 ) = "-"
		    If FindImageFanart( f ) <> Nil Then Cell( Lindex, 16 ) = "Fanart"  Else Cell( Lindex, 16 ) = "-"
		    If FindTrailerItem( f ) <> Nil Then Cell( Lindex, 17 ) = "Trailer" Else Cell( Lindex, 17 ) = "-"
		    If FindSubtitles( f )   <> Nil Or MovieAttr.InfoSubtitleLanguage.Ubound > -1 Then _
		    Cell( Lindex, 18 ) = "Subtitle" Else Cell( Lindex, 18 ) = "-"
		    
		    If FindImageBanner( f ) <> Nil       Then Cell( Lindex, 19 ) = "Banner"      Else Cell( Lindex, 19 ) = "-"
		    If f.Child( "clearart.png" ).Exists  Then Cell( Lindex, 20 ) = "ClearArt"    Else Cell( Lindex, 20 ) = "-"
		    If f.Child( "disc.png" ).Exists      Then Cell( Lindex, 21 ) = "DiscArt"     Else Cell( Lindex, 21 ) = "-"
		    If f.Child( "logo.png" ).Exists      Then Cell( Lindex, 22 ) = "Logo"        Else Cell( Lindex, 22 ) = "-"
		    If f.Child( "landscape.jpg" ).Exists Then Cell( Lindex, 23 ) = "Landscape"   Else Cell( Lindex, 23 ) = "-"
		    If f.Child( "extrathumbs" ).Exists   Then Cell( Lindex, 24 ) = "ExtraThumbs" Else Cell( Lindex, 24 ) = "-"
		    If f.Child( "extrafanart" ).Exists   Then Cell( Lindex, 25 ) = "ExtraFanart" Else Cell( Lindex, 25 ) = "-"
		  End If
		  
		  If MovieAttr.Locked Then Cell( Lindex, 26 ) = Str( MovieAttr.Locked ) Else Cell( Lindex, 26 ) = ""
		  
		  If NOT CommonCore.MassSearch And wndMain.ccSearchBoxMovies.srchField.StringValue = "" Then
		    wndMain.lstSearch.CopyFrom( Me )
		  End If
		  SaveToDB
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h0
		LastKeyPressed As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastKeyPressedAt As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lindex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MovieFolders() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScanDirCount As Integer = 0
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="36"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
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
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
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
			Group="Initial State"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastKeyPressed"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastKeyPressedAt"
			Group="Behavior"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowDropIndicator"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
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
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="11"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
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
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

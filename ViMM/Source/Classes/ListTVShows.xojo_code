#tag Class
Protected Class ListTVShows
Inherits HierListBox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  dim defaultColor as Color = g.ForeColor
		  
		  'If Me.Active AND Me.Enabled Then
		  'g.ForeColor = RGB( 232, 232, 232 )
		  'Else
		  'g.ForeColor = RGB( 245, 245, 245 )
		  'End If
		  #if XojoVersion <= 2017.030 then
		    if globals.IsDarkMode and row > -1 then
		      g.ForeColor = rgb(46, 43, 42)
		      g.FillRect 0, 0, g.Width, g.Height
		    end if
		  #endif
		  
		  If row < Me.ListCount Then
		    
		    #if XojoVersion <= 2017.030 then
		      if globals.IsDarkMode and row > -1 then
		        g.ForeColor = rgb(46, 43, 42)
		        g.FillRect 0, 0, g.Width, g.Height
		      end if
		    #endif
		    
		    // Alternating Row colors
		    if row < me.ListCount and NOT me.Selected( row ) then
		      
		      #if TargetMacOS then
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
		    end if
		    
		    
		    If row < Me.ListCount And Me.RowTag( row ) = "Folder" Then
		      if Globals.IsDarkMode then
		        g.DrawGradient( rgb(77, 77, 77), rgb(62, 62, 62), 0, 0, g.Width, g.Height )
		      else
		        g.DrawGradient( rgb(255, 255, 255), rgb(230, 230, 230), 0, 0, g.Width, g.Height )
		      end if
		    Else
		      g.FillRect 0, 0, g.Width, g.Height
		    End If
		  End If
		  
		  
		  // Folder Shadow
		  If Row < Me.ListCount - 1 And row > 0 And Me.RowTag( row - 1 ) = "Folder" And Me.Expanded( row - 1 ) And Me.RowTag( row ) <> "Folder" Then 'And NOT Me.Selected( row ) Then
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .25 ) Else g.ForeColor = RGBa( 0, 0, 0, .35 )
		    g.DrawLine 0, 0, g.Width, 0
		    
		    g.ForeColor = RGBa( 0, 0, 0, .15 )
		    g.DrawLine 0, 1, g.Width, 1
		    
		    g.ForeColor = RGBa( 0, 0, 0, .05 )
		    g.DrawLine 0, 2, g.Width, 2
		    
		  End If
		  
		  
		  'If row < Me.ListCount Then
		  ''g.ForeColor = RGB( 214, 214, 214 )
		  'g.ForeColor = RGBa(   0,   0,   0, .10 )
		  ''g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		  '
		  'g.ForeColor = HSLa( 0, 100, 100, 50 ) 'RGB( 255, 255, 255 )
		  ''g.DrawLine 0, 0, g.Width, 0
		  'End If
		  
		  // Selection Gradient
		  If Row > -1 And Me.Selected( row ) Then
		    If Me.RowTag( row ) <> "Folder" Then
		      
		      // Colors
		      'Dim StartColor, EndColor, TopColor, BorderTopColor, BorderBottomColor as Color
		      'If NOT Me.Active OR NOT me.Enabled then
		      'StartColor        = RGBa( 73, 77, 87 )
		      'EndColor          = RGBa( 60, 66, 78 )
		      'Else
		      'StartColor        = RGBa( 45, 69, 89 )
		      'EndColor          = RGBa( 28, 51, 82 )
		      'End If
		      'TopColor          = RGBa( 100, 100, 100, .25 )
		      'BorderTopColor    = RGBa(   0,   0,   0,  .05 )
		      'BorderBottomColor = RGBa(   0,   0,   0, .10 )
		      '
		      'g.DrawGradient( StartColor, EndColor, 0, 0, g.Width, g.Height )
		      '
		      'g.ForeColor = TopColor
		      'g.DrawLine 0, 1, g.Width, 1
		      '
		      'g.ForeColor = BorderTopColor
		      'g.DrawLine 0, 0, g.Width, 0
		      '
		      'g.ForeColor = BorderBottomColor
		      'g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		      Return False
		    Else
		      if Globals.IsDarkMode then
		        g.DrawGradient( rgb(62, 62, 62), rgb(50, 50, 50), 0, 0, g.Width, g.Height )
		      else
		        g.DrawGradient( RGBa( 80, 80, 80), RGBa( 70, 70, 70 ), 0, 0, g.Width, g.Height )
		      End If
		      
		      // Transparent white top border
		      g.ForeColor = RGBa( 100, 100, 100, .70 )
		      g.DrawLine( 0, 0, g.Width, 0 )
		      'Return True
		    End If
		  End If
		  
		  
		  // Show/Hide Button
		  If Row < Me.ListCount And Me.RowTag( row ) = "Folder" Then
		    g.TextFont = "Arial Narrow Bold"
		    g.TextSize = 13
		    
		    Dim btnText as String = loc.kShow '"Show"
		    If Me.Expanded( row ) Then btnText = loc.kHide '"Hide"
		    btnText = btnText.Uppercase
		    
		    // Draw button bg
		    g.ForeColor = RGBa( 100, 100, 100 )
		    g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 7,   50, 18,   10, 10
		    
		    g.ForeColor = RGBa( 65, 65, 65 )
		    g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 9,   50, 18,   10, 10
		    
		    If Me.selected( row ) Then g.ForeColor = RGBa( 85, 85, 85 ) Else g.ForeColor = RGBa( 75, 75, 75 )
		    g.FillRoundRect g.Width - 10 - 50, ( g.Height / 2 ) - 8,   50, 18,   10, 10
		    
		    // Draw button text
		    g.ForeColor = RGBa( 100, 100, 100 )
		    g.DrawString btnText, ( ( g.Width - 10 - 50 ) + 25 ) - ( g.StringWidth( btnText ) / 2 ), g.TextSize + 1 + ( g.Height / 2 ) - ( g.StringHeight( btnText, Me.Width ) / 2 )
		    
		    g.ForeColor = RGBa( 35, 35, 35)
		    g.DrawString btnText, ( ( g.Width - 10 - 50 ) + 25 ) - ( g.StringWidth( btnText ) / 2 ), g.TextSize + ( g.Height / 2 ) - ( g.StringHeight( btnText, Me.Width ) / 2 )
		  End If
		  
		  
		  // Midline
		  'If Row < Me.ListCount Then
		  'g.Transparency = 80
		  'g.ForeColor = RGB( 255, 0, 0 )
		  'g.DrawLine 0, g.Height / 2, g.Width, g.Height / 2
		  'End If
		  
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
		  Dim iLeft as Integer = 0
		  If ( Me.ListCount - 1 ) * DefaultRowHeight > Me.Height Then iLeft = 16
		  
		  If Me.RowTag( row ) = "Folder" And _
		    y > ( DefaultRowHeight / 2 ) - 8 And y < ( ( DefaultRowHeight / 2 ) - 8 ) + 18 And _
		    x > Me.Width - 10 - 50 - iLeft And x < Me.Width - 10 - iLeft Then
		    
		    Me.Expanded( row ) = NOT Me.Expanded( row )
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  Dim TextLeft as Integer = 16
		  g.TextSize = 13
		  If Me.RowTag( row ) = "Folder" Then
		    g.TextSize = 22
		    g.TextFont = "Arial Narrow Bold"
		    TextLeft = 48 + 4 + 8
		  End If
		  Dim TextTop as Integer = g.TextSize + ( g.Height / 2 ) - ( g.TextSize / 2 ) - 2
		  
		  
		  
		  If Me.RowTag( row ) = "Folder" Then
		    
		    // Shadow / HiLite
		    'If me.Selected( row ) Then
		    'g.ForeColor = &c00000099
		    'Else
		    'g.ForeColor = &cFFFFFF
		    'End If
		    'g.DrawString Me.Cell( row, column ), TextLeft, TextTop + 1, g.Width - TextLeft, True
		    
		    If NOT Globals.IsDarkMode and NOT me.Selected( row ) Then
		      g.ForeColor = &c000000
		      
		      // Color Folder Names
		      // Continuing
		      'If Me.Cell( row, 0 ) = Loc.t_Today     Then g.ForeColor = &c186D0C
		      'If Me.Cell( row, 0 ) = Loc.t_Week      Then g.ForeColor = &c186D0C
		      
		      'If Me.Cell( row, 0 ) = Loc.t_Month     Then g.ForeColor = &cC4983C
		      
		      // Hiatus
		      'If Me.Cell( row, 0 ) = Loc.t_Upcoming  Then g.ForeColor = &cDD6B17
		      'If Me.Cell( row, 0 ) = Loc.t_Announced Then g.ForeColor = &c3E70A4
		      
		      'If Me.Cell( row, 0 ) = Loc.t_Ended     Then g.ForeColor = &cb00200 '9F113D
		      'If Me.Cell( row, 0 ) = Loc.t_Unknown   Then g.ForeColor = &c818181
		      
		      
		      // Status
		      Select Case Me.Cell( row, 0 )
		        
		      Case TVCore.TVStatus_PilotRejected, TVCore.TVStatus_FinalSeason, TVCore.TVStatus_Ended, Loc.t_Ended
		        g.ForeColor = &cb00200
		        
		      Case Loc.t_Yesterday, Loc.t_Today, Loc.t_Week
		        g.ForeColor = &c186D0C
		        
		      Case Loc.t_Month, TVCore.TVStatus_Hiatus
		        g.ForeColor = &cC4983C
		        
		      Case Loc.t_Upcoming, TVCore.TVStatus_Bubble
		        g.ForeColor = &cDD6B17
		        
		      Case Loc.t_Announced, TVCore.TVStatus_NewSeries
		        g.ForeColor = &c3E70A4
		        
		      Case TVCore.TVStatus_PilotOrdered, TVCore.TVStatus_Development
		        g.ForeColor = &c53006d
		        
		      Case TVCore.TVStatus_ReturningSeries
		        g.ForeColor = &c186D0C
		        
		      Case Loc.t_Unknown
		        g.ForeColor = &c818181
		        
		        
		      End Select
		      
		      'if Globals.IsDarkMode then
		      'g.ForeColor = _saturate( _lighten( g.ForeColor, 20 ), 20 )
		      'End If
		      
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_PilotRejected   Then g.ForeColor = &cb00200
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_PilotOrdered    Then g.ForeColor = &c53006d
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_Development     Then g.ForeColor = &c53006d
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_NewSeries       Then g.ForeColor = &c3E70A4 '&c186D0C
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_ReturningSeries Then g.ForeColor = &c186D0C
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_Hiatus          Then g.ForeColor = &cC4983C
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_Bubble          Then g.ForeColor = &cDD6B17
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_FinalSeason     Then g.ForeColor = &cb00200
		      'If Me.Cell( row, 0 ) = TVCore.TVStatus_Ended           Then g.ForeColor = &cb00200
		    End If
		    
		    // Draw folder pictures
		    If Me.Cell( row, 0 ) = Loc.t_Yesterday  Then g.DrawPicture status_today2x,     4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_today2x.Width,     status_today2x.Height
		    If Me.Cell( row, 0 ) = Loc.t_Today      Then g.DrawPicture status_today2x,     4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_today2x.Width,     status_today2x.Height
		    If Me.Cell( row, 0 ) = Loc.t_Week       Then g.DrawPicture status_week2x,      4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_week2x.Width,      status_week2x.Height
		    If Me.Cell( row, 0 ) = Loc.t_Month      Then g.DrawPicture status_month2x,     4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_month2x.Width,     status_month2x.Height
		    If Me.Cell( row, 0 ) = Loc.t_Upcoming   Then g.DrawPicture status_upcoming2x,  4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_upcoming2x.Width,  status_upcoming2x.Height
		    If Me.Cell( row, 0 ) = Loc.t_Announced  Then g.DrawPicture status_announced2x, 4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_announced2x.Width, status_announced2x.Height
		    If Me.Cell( row, 0 ) = Loc.t_Ended      Then g.DrawPicture status_ended2x,     4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_ended2x.Width,     status_ended2x.Height
		    If Me.Cell( row, 0 ) = Loc.t_Unknown    Then g.DrawPicture status_unknown2x,   4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_unknown2x.Width,   status_unknown2x.Height
		    
		    // Status folder Pictures
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_PilotRejected     Then g.DrawPicture status_rejected2x,        4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_rejected2x.Width,    status_rejected2x.Height
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_PilotOrdered      Then g.DrawPicture status_pilot2x,           4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_pilot2x.Width,       status_pilot2x.Height
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_Development       Then g.DrawPicture status_development2x,     4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_development2x.Width, status_development2x.Height
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_NewSeries         Then g.DrawPicture status_newseries2x,       4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_newseries2x.Width,   status_newseries2x.Height
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_ReturningSeries   Then g.DrawPicture status_today2x,           4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_today2x.Width,       status_today2x.Height
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_Hiatus            Then g.DrawPicture status_hiatus2x,          4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_hiatus2x.Width,      status_hiatus2x.Height
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_Bubble            Then g.DrawPicture status_bubble2x,          4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_bubble2x.Width,      status_bubble2x.Height
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_FinalSeason       Then g.DrawPicture status_final2x,           4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_final2x.Width,       status_final2x.Height
		    If Me.Cell( row, 0 ) = TVCore.TVStatus_Ended             Then g.DrawPicture status_ended2x,           4, (g.Height / 2) - ( 48 / 2 ), 48, 48,   0, 0, status_ended2x.Width,       status_ended2x.Height
		    
		    // Text
		    'If me.Selected( row ) Then
		    'g.ForeColor = &cFFFFFF' Else g.ForeColor = &c333333
		    'End If
		    g.DrawString Me.Cell( row, column ), TextLeft, TextTop, g.Width - TextLeft, True
		  End If
		  
		  
		  If Me.RowTag( row ) = "Folder" Then
		    Return True
		  else
		    // ## NOT Folder
		    
		    Dim PosterSize as Integer = DefaultRowHeight - 10
		    TextTop = 4 + g.TextSize
		    TextLeft = PosterSize - 2
		    
		    // -- Banner --
		    'Dim BannerItem as FolderItem = GetFolderItem( Me.Cell( row, 1 ) )
		    'BannerItem = BannerItem.Child( "banner.jpg" )
		    'If BannerItem <> Nil And BannerItem.Exists Then
		    'Dim Banner as Picture = Picture.Open( BannerItem )
		    ''g.Transparency = 80
		    'g.DrawPicture Banner, 0, 0, g.Width, g.Height,  0, 0, Banner.Width, Banner.Height
		    'g.Transparency = 0
		    'End If
		    
		    // -- Poster --
		    // ## Left Poster icon
		    'Dim posteritem as FolderItem
		    Dim PosterPic as Picture = CellTag( row, 10 )
		    If Cell( Row, 2 ) <> "" And Preferences.Prefs.boolForKey("ShowPostersInList") And PosterPic <> Nil Then
		      Dim i as Integer = 0
		      If DefaultRowHeight <= 22 Then i = 3
		      
		      'posteritem = Preferences.fAppSupport.Child( "Cache" ).Child( Cell( row, 2 ) + ".television.poster.jpg" )
		      'If posteritem <> Nil And posteritem.Exists Then
		      
		      'Dim PosterPic as Picture = Picture.Open( posteritem )
		      If PosterPic <> Nil Then
		        Dim Factor as Double = PosterSize / PosterPic.Height
		        g.DrawPicture PosterPic, 5 - i, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ),       PosterPic.Width * Factor,         PosterPic.Height * Factor,      0, 0, PosterPic.Width, PosterPic.Height
		        g.DrawRect               4 - i, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ) - 1, ( PosterPic.Width * Factor ) + 2, ( PosterPic.Height * Factor ) + 2
		      End If
		      
		      'End If
		    End If
		    
		    
		    // ## Left Status Icon
		    If PosterPic = Nil OR NOT Preferences.Prefs.boolForKey("ShowPostersInList") Then
		      Dim i as Integer = 0
		      If DefaultRowHeight <= 22 Then i = 3
		      
		      Dim PosterInfo as Picture = videoclean
		      
		      // Retina
		      If App.ScalingFactor = 2 Then
		        
		        If Cell( row, 2 ) <> "" Then
		          If DefaultRowHeight <= 22 Then PosterInfo = videounwatchedsmall Else PosterInfo = videounwatched2x
		        Else
		          If DefaultRowHeight <= 22 Then PosterInfo = videocleansmall Else PosterInfo = videoclean2x
		        End If
		        
		        // SD
		      Else'If App.ScalingFactor = 1 Then
		        
		        If Cell( row, 2 ) <> "" Then
		          If DefaultRowHeight >= 64 Then PosterInfo = videounwatched Else PosterInfo = videounwatchedsmall
		        Else
		          If DefaultRowHeight >= 64 Then PosterInfo = videoclean Else PosterInfo = videocleansmall
		        End If
		        
		      End If
		      
		      g.DrawPicture PosterInfo, 5 - i, ( DefaultRowHeight / 2 ) - ( PosterSize / 2 ), PosterSize / 1.5, PosterSize,  0, 0, PosterInfo.Width, PosterInfo.Height
		      
		    End If
		    
		    
		    // 1: -- Title
		    If me.Selected( row ) Then g.Bold = True Else g.Bold = False
		    
		    
		    // Hi-light/Shadow
		    if NOT globals.IsDarkMode then
		      If me.Selected( row ) Then
		        g.ForeColor = &c00000099
		      Else
		        g.ForeColor = &cFFFFFF
		      End If
		      g.DrawString Me.Cell( row, column ), TextLeft, TextTop +1, g.Width - TextLeft - 32 - 5, True
		      
		      If me.Selected( row ) Then
		        g.ForeColor = &cFFFFFF
		      Else
		        g.ForeColor = &c333333
		      End If
		    End If
		    g.DrawString Me.Cell( row, column ), TextLeft, TextTop, g.Width - TextLeft - 32 - 5, True
		    
		    'g.Bold = False
		    
		    If Me.RowHeight <= 22 Then // Single line height
		      Return True
		    End If
		    
		    // 2: -- Mini Icons
		    Dim i, IcoTop, IcoLeft as Integer = 0
		    Dim Pic as Picture
		    
		    IcoTop = 22
		    If Me.RowHeight >= 22 * 3 Then IcoTop = 25
		    IcoLeft = TextLeft
		    
		    dim PicTransparency as double = 75
		    
		    // ## Poster
		    If Preferences.Prefs.boolForKey("AutoDownloadPoster") And Preferences.Prefs.boolForKey("ShowMiniIcon-Poster") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = posteractive2x Else Pic = posteractive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = posterinactive2x Else Pic = posterinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = posteractive2x Else Pic = posteractive
		        End If
		      End If
		      // Missing
		      If Cell( row, 10 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // ## Fanart
		    If Preferences.Prefs.boolForKey("AutoDownloadBackdrop") And Preferences.Prefs.boolForKey("ShowMiniIcon-Backdrop") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = fanartactive2x Else Pic = fanartactive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = fanartinactive2x Else Pic = fanartinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = fanartactive2x Else Pic = fanartactive
		        End If
		      End If
		      // Missing
		      If Cell( row, 11 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // ## Banner
		    If Preferences.Prefs.boolForKey("AutoDownloadBanner") And Preferences.Prefs.boolForKey("ShowMiniIcon-Banner") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = banneractive2x Else Pic = banneractive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = bannerinactive2x Else Pic = bannerinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = banneractive2x Else Pic = banneractive
		        End If
		      End If
		      // Missing
		      If Cell( row, 12 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // ## Extra Fanart
		    If Preferences.Prefs.boolForKey("AutoDownloadExtraFanart") And Preferences.Prefs.boolForKey("ShowMiniIcon-ExtraFanart") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = extrafanartactive2x Else Pic = extrafanartactive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = extrafanartinactive2x Else Pic = extrafanartinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = extrafanartactive2x Else Pic = extrafanartactive
		        End If
		      End If
		      // Missing
		      If Cell( row, 19 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // ## Season Art
		    If Preferences.Prefs.boolForKey("AutoDownloadSeasonArt") And Preferences.Prefs.boolForKey("ShowMiniIcon-SeasonArt") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = extrathumbsactive2x Else Pic = extrathumbsactive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = extrathumbsinactive2x Else Pic = extrathumbsinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = extrathumbsactive2x Else Pic = extrathumbsactive
		        End If
		      End If
		      // Missing
		      If Cell( row, 18 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // ## Logo
		    If Preferences.Prefs.boolForKey("AutoDownloadLogo") And Preferences.Prefs.boolForKey("ShowMiniIcon-Logo") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = logoactive2x Else Pic = logoactive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = logoinactive2x Else Pic = logoinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = logoactive2x Else Pic = logoactive
		        End If
		      End If
		      // Missing
		      If Cell( row, 14 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // ## ClearArt
		    If Preferences.Prefs.boolForKey("AutoDownloadClearArt") And Preferences.Prefs.boolForKey("ShowMiniIcon-ClearArt") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = clearartactive2x Else Pic = clearartactive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = clearartinactive2x Else Pic = clearartinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = clearartactive2x Else Pic = clearartactive
		        End If
		      End If
		      // Missing
		      If Cell( row, 13 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // ## Landscape
		    If Preferences.Prefs.boolForKey("AutoDownloadThumb") And Preferences.Prefs.boolForKey("ShowMiniIcon-Thumb") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = landscapeactive2x Else Pic = landscapeactive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = landscapeinactive2x Else Pic = landscapeinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = landscapeactive2x Else Pic = landscapeactive
		        End If
		      End If
		      // Missing
		      If Cell( row, 16 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // ## CharacterArt
		    If Preferences.Prefs.boolForKey("AutoDownloadCharacterArt") And Preferences.Prefs.boolForKey("ShowMiniIcon-CharacterArt") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = characteractive2x Else Pic = characteractive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = characterinactive2x Else Pic = characterinactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = characteractive2x Else Pic = characteractive
		        End If
		      End If
		      // Missing
		      If Cell( row, 17 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    
		    // ## Themesong
		    If Preferences.Prefs.boolForKey("AutoDownloadThemesong") And Preferences.Prefs.boolForKey("ShowMiniIcon-Themesong") Then
		      
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = themesongactive2x Else Pic = themesongactive
		      else
		        // Unselected
		        If App.ScalingFactor = 2 Then Pic = themesonginactive2x Else Pic = themesonginactive
		        // Selected
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = themesongactive2x Else Pic = themesongactive
		        End If
		      End If
		      // Missing
		      If Cell( row, 20 ) = "-" Then g.Transparency = PicTransparency
		      
		      g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		      g.Transparency = 0
		      i = i + 1
		    End If
		    
		    // ## Locked
		    If true Then
		      if Globals.IsDarkMode then
		        If App.ScalingFactor = 2 Then Pic = lockedactive2x Else Pic = lockedactive
		      else
		        If App.ScalingFactor = 2 Then Pic = lockedinactive2x Else Pic = lockedinactive
		        If ListIndex = Row Then
		          If App.ScalingFactor = 2 Then Pic = lockedactive2x Else Pic = lockedactive
		        End If
		      End If
		      
		      If Cell( row, 22 ) <> "" Then' g.Transparency = 100
		        g.DrawPicture pic, IcoLeft + ( i * 19 ) + ( 4 * i ) - 4, IcoTop, 20, 20, 0, 0, Pic.Width, Pic.Height
		        g.Transparency = 0
		        i = i + 1
		      End If
		      
		    End If
		    
		    
		    Dim UnrelativeDays as String = CountHours( Me.Cell( row, 8 ), False, Val( Me.Cell( row, 20 ) ) )
		    // ## Next Episode - Title
		    TextTop = 22 * 2 + g.TextSize
		    If me.Selected( row ) Then g.Bold = True Else g.Bold = False
		    Dim PreFix as String = "Next:"
		    If Val( UnrelativeDays ) <= 0 Then PreFix = "Last:"
		    If Trim( Me.Cell( row, 9 ) ) = "" Then PreFix = ""
		    
		    // Highlight/Shadow  
		    if NOT globals.IsDarkMode then
		      If Me.Selected( row ) Then
		        g.ForeColor = &c00000099
		      Else
		        g.ForeColor = &cFFFFFF
		      End If
		      g.DrawString Trim( PreFix + " " + Cell( row, 9 ) ), TextLeft, TextTop + 1, g.Width - TextLeft - 32 - 5, True
		      
		      If Me.Selected( row ) Then
		        g.ForeColor = &cFFFFFF
		      Elseif NOT me.Selected(row) then
		        g.ForeColor = &c333333
		      End If
		    End If
		    g.DrawString Trim( Prefix + " " + Cell( row, 9 ) ), TextLeft, TextTop,     g.Width - TextLeft - 32 - 5, True
		    
		    'g.Bold = False
		    
		    // ## Right Rating
		    If Preferences.Prefs.integerForKey("SortByTV") <> 3 And Preferences.Prefs.integerForKey("SortByTV") <> 8 Then
		      If Cell( row, 7 ) <> "" and Val( Cell( row, 7 ) ) > 0 then
		        If me.Selected(row) then
		          g.ForeColor = &cFFFFFF
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
		        
		        If me.selected(Row) then
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
		    End If // @END "SortByTV" <> 3
		    
		    
		    // ## Countdown Days
		    If Preferences.Prefs.integerForKey("SortByTV") = 3 Then
		      Dim Days as String = CountHours( Me.Cell( row, 8 ), True, Val( Me.Cell( row, 21 ) ) )
		      If Days <> "" Then
		        If Days.InStr( 0, Loc.DateDay ) > 0 And Days.InStr( 0, " " ) > 0 ANd Days.InStr( 0, "ago" ) = 0 Then
		          'Days = Days.ReplaceAll( " ", EndOfLine )
		          g.DrawPicture bookmark, g.Width - bookmark.Width / 2 - 5, 0, bookmark.Width / 2, bookmark.Height / 2,   0, 0, bookmark.Width, bookmark.Height
		          
		          Dim Day as String = Days.NthField( " ", 1 )
		          Dim DayExt as String = Days.NthField( " ", 2 )
		          
		          g.TextFont = "Arial Narrow Bold"
		          g.Bold = True
		          Dim Left as Integer
		          If Day.Len = 1 Then
		            g.TextSize = 32
		            Left = 1
		          ElseIf Day.Len = 2 Then
		            g.TextSize = 21
		            Left = 1
		          ElseIf Day.Len = 3 Then
		            g.TextSize = 13
		            Left = 0
		          End If
		          
		          
		          g.ForeColor = &c33333333
		          g.DrawString Day,     g.Width - 5 + Left - ( ( 32 / 2 ) + ( g.StringWidth ( Day ) / 2 ) ), g.TextSize + ( ( 38 / 2 ) - ( g.StringHeight( Day, 99 ) / 2 ) ) + 1 'g.TextSize + 4 + 1
		          
		          g.ForeColor = &cFFFFFF
		          g.DrawString Day,     g.Width - 5 + Left - ( ( 32 / 2 ) + ( g.StringWidth ( Day ) / 2 ) ), g.TextSize + ( ( 38 / 2 ) - ( g.StringHeight( Day, 99 ) / 2 ) ) 'g.TextSize + 4 + 1
		          
		        Else
		          g.Bold = True
		          g.TextFont = "Arial Narrow Bold"
		          
		          if NOT Globals.IsDarkMode then
		            If Me.Selected( row ) Then g.ForeColor = &c00000099 Else g.ForeColor = &cFFFFFF
		            g.DrawString Days, g.Width - g.StringWidth( Days ) - 10, g.TextSize + 4 + 1
		            
		            If Me.Selected( row ) Then g.ForeColor = &cFFFFFF Else g.ForeColor = &c333333
		          End If
		          g.DrawString Days, g.Width - g.StringWidth( Days ) - 10, g.TextSize + 4
		        End If
		      End If
		    End If // @END "SortByTV" = 3
		    
		    // Sort by local episodes.
		    If Preferences.Prefs.integerForKey("SortByTV") = 8 And Val( Me.Cell( row, 24 ) ) > 0 Then
		      Dim LocalEps as String = Str( Val( Me.Cell( row, 24 ) ) )
		      
		      If me.Selected(row) then
		        g.ForeColor = &cFFFFFF
		      Else
		        if Globals.IsDarkMode then
		          g.ForeColor = &c6c7680
		        else
		          g.ForeColor = &c98A5B3
		        End If
		      End If
		      
		      g.Bold = True
		      
		      g.FillRoundRect g.Width - g.StringWidth( LocalEps ) - 15, 4, g.StringWidth( LocalEps ) + 10, g.TextSize + 3, 15, 15
		      
		      If me.selected(Row) then
		        if Globals.IsDarkMode then
		          g.ForeColor = &c6c7680
		        else
		          g.ForeColor = &c98A5B3
		        End If
		      Else
		        g.ForeColor = &cFFFFFF
		      End If
		      g.DrawString LocalEps, g.Width - g.StringWidth( LocalEps ) - 10, 4 + g.TextSize
		      
		      'g.TextFont = "Arial Narrow Bold"
		      'g.Bold = True
		      'Dim Left as Integer
		      'If LocalEps.Len = 1 Then
		      'g.TextSize = 32
		      'Left = 1
		      'ElseIf LocalEps.Len = 2 Then
		      'g.TextSize = 21
		      'Left = 1
		      'ElseIf LocalEps.Len = 3 Then
		      'g.TextSize = 13
		      'Left = 0
		      'End If
		      
		      'g.DrawPicture bookmark, g.Width - bookmark.Width / 2 - 5, 0, bookmark.Width / 2, bookmark.Height / 2, 0, 0, bookmark.Width, bookmark.Height
		      
		      'g.ForeColor = &c33333333
		      'g.DrawString LocalEps,     g.Width - 5 + Left - ( ( 32 / 2 ) + ( g.StringWidth ( LocalEps ) / 2 ) ), g.TextSize + ( ( 38 / 2 ) - ( g.StringHeight( LocalEps, 99 ) / 2 ) ) + 1 'g.TextSize + 4 + 1
		      
		      'g.ForeColor = &cFFFFFF
		      'g.DrawString LocalEps,     g.Width - 5 + Left - ( ( 32 / 2 ) + ( g.StringWidth ( LocalEps ) / 2 ) ), g.TextSize + ( ( 38 / 2 ) - ( g.StringHeight( LocalEps, 99 ) / 2 ) ) 'g.TextSize + 4 + 1
		      
		    End If
		    
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  
		  // Save folder states
		  Dim s() as String
		  For i as Integer = Me.ListCount - 1 DownTo 0
		    If Me.RowTag(i) <> "Folder" Then Continue
		    s.Append Str( Me.Expanded(i) )
		  Next
		  Preferences.Prefs.setStringArrayValue( "TVShows Folders CollapseState", s )
		  
		  If Trim( wndMain.ccSearchBoxMovies.srchField.StringValue ) <> "" Then
		    wndMain.ccSearchBoxTVShows.srchField.StringValue = " "
		    wndMain.ccSearchBoxTVShows.srchField.StringValue = ""
		    SaveToDB
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub CollapseRow(row As Integer)
		  While Me.ListCount > row + 1 And Me.RowTag( row + 1 ) <> "Folder"
		    Me.RemoveRow row + 1
		  Wend
		  
		  If Me.ListCount * Me.RowHeight < Me.Height Then Me.ScrollPosition = 0
		  
		  // Save folder states
		  Dim s() as String
		  For i as Integer = Me.ListCount - 1 DownTo 0
		    If Me.RowTag(i) <> "Folder" Then Continue
		    s.Append Str( Me.Expanded(i) )
		  Next
		  Preferences.Prefs.setStringArrayValue( "TVShows Folders CollapseState", s )
		  
		  wndMain.cvsTVShowDetails.Reload
		End Sub
	#tag EndEvent

	#tag Event
		Sub ExpandRow(row As Integer)
		  
		  Dim Shadow as Listbox = wndMain.lstTVShadow
		  
		  For i as Integer = 0 to Shadow.ListCount -1
		    
		    Dim Clock as String = CountHours( Shadow.Cell( i, 8 ) )
		    Dim Hours as Integer = Val( Clock )
		    Dim d as New Date
		    Dim TimeLeftInDay as Double = 24 - d.Hour
		    
		    
		    Select Case Me.Cell( row, 0 )
		      
		    Case Loc.t_Yesterday
		      If Clock = "" Then Continue
		      If Hours > -20 OR Hours < -48 Then Continue
		      
		    Case Loc.t_Today
		      If Clock = "" Then Continue
		      If Hours > TimeLeftInDay OR Hours < -20 Then Continue 'Hours > 4 OR Hours < -20 Then Continue
		      'Continue
		      
		    Case Loc.t_Week
		      If Clock = "" Then Continue
		      If Hours <= TimeLeftInDay OR Round( Hours / 24 ) > 7 Then Continue
		      'Continue
		      
		    Case Loc.t_Month
		      If Clock = "" Then Continue
		      If Round( Hours / 24  ) <= 7 OR Round( Hours / 24 ) > 30 Then Continue
		      'Continue
		      
		    Case Loc.t_Upcoming
		      If Clock = "" Then Continue
		      If Round( Hours / 24 ) <= 30 Then Continue
		      'Continue
		      
		    Case Loc.t_Announced
		      'If Clock <> "" Then Continue
		      If ( Clock <> "" And Hours > 0 ) Then Continue
		      'If Clock <> "" And Hours * 60 - Val( Me.Cell( row, 20 ) ) < 0 Then Continue
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_Ended ) > 0 OR Shadow.Cell( i, 4 ).InStr( 0, "Ended" ) > 0 OR Shadow.Cell( i, 4 ).InStr( 0, "Cancel" ) > 0 Then Continue // NOT Ended
		      If Shadow.Cell( i, 2 ) = "" Then Continue // NOT scraped
		      'Continue
		      
		    Case Loc.t_Ended
		      If Clock <> "" Then Continue
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_Ended ) = 0 And Shadow.Cell( i, 4 ).InStr( 0, "Ended" ) = 0 And Shadow.Cell( i, 4 ).InStr( 0, "Cancel" ) = 0 Then Continue
		      'Continue
		      
		    Case Loc.t_Unknown
		      If Shadow.Cell( i, 2 ) <> "" Then Continue
		      'Continue
		      
		      
		      
		      // Status'
		    Case TVCore.TVStatus_Bubble // On the Bubble
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_Bubble ) = 0 Then Continue
		    Case TVCore.TVStatus_Development
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_Development ) = 0 Then Continue
		    Case TVCore.TVStatus_Ended
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_Ended ) = 0 _
		      And Shadow.Cell( i, 4 ).InStr( 0, "Ended" ) = 0 And Shadow.Cell( i, 4 ).InStr( 0, "Canceled" ) = 0 Then Continue
		    Case TVCore.TVStatus_FinalSeason
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_FinalSeason ) = 0 Then Continue
		    Case TVCore.TVStatus_Hiatus
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_Hiatus ) = 0 Then Continue
		    Case TVCore.TVStatus_NewSeries
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_NewSeries ) = 0 Then Continue
		    Case TVCore.TVStatus_PilotOrdered
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_PilotOrdered ) = 0 Then Continue
		    Case TVCore.TVStatus_ReturningSeries
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_ReturningSeries ) = 0 Then Continue
		    Case TVCore.TVStatus_PilotRejected
		      If Shadow.Cell( i, 4 ).InStr( 0, TVCore.TVStatus_PilotRejected ) = 0 Then Continue
		      
		    Else
		      Continue
		      
		    End Select
		    
		    Me.AddRow
		    For n as Integer = 0 to Shadow.ColumnCount - 1
		      Me.Cell( Me.LastIndex, n ) = Shadow.Cell( i, n )
		      Me.CellTag( Me.LastIndex, n ) = Shadow.CellTag( i, n )
		    Next
		    
		  Next
		  
		  
		  // Save folder states
		  Dim s() as String
		  For i as Integer = Me.ListCount - 1 DownTo 0
		    If Me.RowTag(i) <> "Folder" Then Continue
		    s.Append Str( Me.Expanded(i) )
		  Next
		  Preferences.Prefs.setStringArrayValue( "TVShows Folders CollapseState", s )
		  
		  Exception err as OutOfBoundsException
		    Return
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key as String) As Boolean
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
		  Shadow = wndMain.lstTVShadow
		  Shadow.ColumnCount = Me.ColumnCount
		  
		  LoadList
		  
		  // Select the first non-folder item.
		  If Me.ListCount > 0 Then
		    For i as Integer = 0 to Me.ListCount -1
		      If Me.RowTag( i ) <> "Folder" Then
		        Me.ListIndex = i
		        Exit
		      End If
		    Next
		  End If
		  
		  Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddFolders()
		  Me.DeleteAllRows
		  
		  If Preferences.Prefs.integerForKey("SortByTV") = 3 Then // Airdate
		    
		    Dim b as Boolean = False
		    For i as Integer = 0 to wndMain.lstTVShadow.LastIndex
		      Dim Clock as String = CountHours( wndMain.lstTVShadow.Cell( i, 8 ) )
		      Dim Hours as Integer = Val( Clock )
		      
		      If Hours > -20 OR Hours < -48 Then Continue
		      b = True
		      Exit
		    Next
		    
		    If b Then
		      Me.AddFolder Loc.t_Yesterday.Uppercase
		      Me.RowTag( LastIndex ) = "Folder"
		    End If
		    
		    Me.AddFolder Loc.t_Today.Uppercase
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder Loc.t_Week.Uppercase
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder Loc.t_Month.Uppercase
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder Loc.t_Upcoming.Uppercase
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder Loc.t_Announced.Uppercase
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder Loc.t_Ended.Uppercase
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder Loc.t_Unknown.Uppercase
		    Me.RowTag( LastIndex ) = "Folder"
		    
		    // Alternative labels:
		    //   Today
		    //   Tomorrow
		    //   This Week
		    //   Next Week
		    //   Upcoming
		    //   To Be Announced
		    //   Ended
		    
		  ElseIf Preferences.Prefs.integerForKey("SortByTV") = 5 Then // Status
		    
		    Me.AddFolder TVCore.TVStatus_PilotOrdered
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder TVCore.TVStatus_Development
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder TVCore.TVStatus_NewSeries
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder TVCore.TVStatus_ReturningSeries
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder TVCore.TVStatus_Hiatus
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder TVCore.TVStatus_Bubble
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder TVCore.TVStatus_FinalSeason
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder TVCore.TVStatus_Ended
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder TVCore.TVStatus_PilotRejected
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder Loc.t_Unknown.Uppercase
		    Me.RowTag( LastIndex ) = "Folder"
		    
		  ElseIf Preferences.Prefs.integerForKey("SortByTV") = 9 Then // Genre?
		    
		    Me.AddFolder Genre.Action
		    Me.RowTag( LastIndex ) = "Folder"
		    Me.AddFolder Genre.Adventure
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddItem(f as FolderItem)
		  #pragma DisableBackgroundTasks
		  
		  'Dim Shadow as Listbox = wndMain.lstTVShadow
		  
		  If f = Nil Or NOT f.Exists Or NOT f.Directory Then Return
		  If TVFolders(0).Name = f.Name Then dlgProgress.Reset
		  
		  Shadow.AddRow f.Name, f.ShellPath
		  
		  // Found progress
		  dlgProgress.Add( Loc.kReadingInfo + ":", f.Name, 1, TVFolders.ubound )
		  
		  'If NOT App.DebugMode Then
		  TVAttr.NFORead( f )
		  
		  // 0. Movie Title
		  Dim TVTitle as String
		  If TVAttr.Title <> "" Then
		    TVTitle = TVAttr.Title
		    'If TVAttr.DateYear > 0 Then TVTitle = TVAttr.Title + " (" + Str( TVAttr.DateYear ) + ")"
		    Shadow.Cell( Shadow.LastIndex, 0 ) = TVTitle
		  End If
		  
		  // 1. Absolute Path
		  // Already there.
		  
		  // 2. TV ID
		  If TVAttr.ID_IMDb <> "" Then
		    Shadow.Cell( Shadow.LastIndex, 2 ) = TVAttr.ID_IMDb
		  ElseIf TVAttr.ID_TVDB <> "" Then
		    Shadow.Cell( Shadow.LastIndex, 2 ) = TVAttr.ID_TVDB
		  End If
		  
		  
		  // Set cache images
		  Dim PosterLoc as FolderItem = FindImagePoster( f ) 'f.Child( "poster.jpg" )
		  Dim CacheLoc as FolderItem
		  If Shadow.Cell( Shadow.LastIndex, 2 ) <> "" Then
		    dim FileName as String = Shadow.Cell( Shadow.LastIndex, 2 ) + ".television.poster.jpg"
		    CacheLoc = Preferences.fAppSupport.Child("Cache").Child( FileName )
		  End If
		  
		  If Preferences.Prefs.boolForKey("ShowPostersInList") And Shadow.Cell( Shadow.LastIndex, 2 ) <> "" And ( CacheLoc = Nil OR NOT CacheLoc.Exists ) Then
		    If PosterLoc <> Nil And PosterLoc.Exists Then
		      dim FileName as String = Shadow.Cell( Shadow.LastIndex, 2 ) + ".television.poster.jpg"
		      CacheImageSet( Picture.Open( PosterLoc ), FileName )
		    End If
		  End If
		  
		  If Shadow.Cell( Shadow.LastIndex, 2 ) <> "" Then
		    dim FileName as String = Shadow.Cell( Shadow.LastIndex, 2 ) + ".television.poster.jpg"
		    if NOT FileName.StartsWith("http") then
		      CacheLoc = Preferences.fAppSupport.Child("Cache").Child( FileName )
		    else
		      Break
		    End If
		  End If
		  
		  // Set row image.
		  If Preferences.Prefs.boolForKey("ShowPostersInList") Then
		    If ( CacheLoc = Nil OR NOT CacheLoc.Exists ) And PosterLoc <> Nil And PosterLoc.Exists Then
		      
		      Try
		        Shadow.CellTag( Shadow.LastIndex, 10 ) = ScaleImage( Picture.Open( PosterLoc ), 128, 128 )
		      Catch err as NilObjectException
		        Log( "Poster doesn't exist?" )
		      End Try
		      
		    ElseIf CacheLoc <> Nil And CacheLoc.Exists Then
		      Shadow.CellTag( Shadow.LastIndex, 10 ) = ScaleImage( Picture.Open( CacheLoc ), 128, 128 )
		    Else
		      'Shadow.CellTag( Shadow.LastIndex, 10 ) = Nil
		    End If
		  End If
		  
		  
		  
		  // 3. Sort Title
		  If TVAttr.TitleSort <> "" Then
		    Shadow.Cell( Shadow.LastIndex, 3 ) = TVAttr.TitleSort
		  ElseIf TVAttr.Title <> "" Then
		    Shadow.Cell( Shadow.LastIndex, 3 ) = Articulator( TVAttr.Title )
		    If TVAttr.DateYear > 0 Then Shadow.Cell( Shadow.LastIndex, 3 ) = Shadow.Cell( Shadow.LastIndex, 3 ) + " (" + Str( TVAttr.DateYear ) + ")"
		  Else
		    Shadow.Cell( Shadow.LastIndex, 3 ) = Articulator( Shadow.Cell( Shadow.LastIndex, 0 ) )
		  End If
		  
		  // 4. Status
		  Shadow.Cell( Shadow.LastIndex, 4 ) = Str( TVAttr.Status )
		  
		  // 5. Date Premiered
		  If TVAttr.DatePremiered <> "" And TVAttr.DatePremiered <> "N/A" Then
		    Shadow.Cell( Shadow.LastIndex, 5 ) = TVAttr.DatePremiered
		  ElseIf ( TVAttr.DatePremiered = "N/A" Or TVAttr.DatePremiered = "" ) And TVAttr.DateYear > 0 Then
		    Shadow.Cell( Shadow.LastIndex, 5 ) = Str( TVAttr.DateYear )
		  End If
		  
		  // 6. Studio
		  Shadow.Cell( Shadow.LastIndex, 6 ) = TVAttr.TVNetwork
		  
		  // 7. Rating
		  If TVAttr.Rating > 0 Then
		    Dim Rate as String = Str( TVAttr.Rating )
		    If Rate.Len = 1 Then Rate = Rate + ".0"
		    If Rate.Len = 3 Then Rate = "0" + Rate
		    
		    Shadow.Cell( Shadow.LastIndex, 7 ) = Rate
		  End If
		  
		  // 8 - 9. Next Aired Episode
		  Shadow.Cell( Shadow.LastIndex, 8 ) = TVAttr.NextAired_Date
		  If TVAttr.NextAired_Episode <> "" Then
		    Shadow.Cell( Shadow.LastIndex, 9 ) = TVAttr.NextAired_Episode
		  ElseIf TVAttr.LastAired_Episode <> "" Then
		    Shadow.Cell( Shadow.LastIndex, 9 ) = TVAttr.LastAired_Episode
		  End If
		  
		  Dim Clock as String = CountHours( TVAttr.LastAired_Date )
		  Dim Hours as Integer = Val( Clock )
		  If Clock <> "" And Hours > -24 And Hours < 0 Then
		    Shadow.Cell( Shadow.LastIndex, 8 ) = TVAttr.LastAired_Date
		    If TVAttr.LastAired_Episode <> "" Then Shadow.Cell( Shadow.LastIndex, 9 ) = TVAttr.LastAired_Episode
		  End If
		  
		  Dim t as String = Shadow.Cell( Shadow.LastIndex, 8 )
		  
		  If t <> "" Then
		    Dim d as New Date
		    d.GMTOffset = Val( t.NthField("G",2) )
		    
		    Dim Date() as String = t.NthField( "T", 1 ).Split("-")
		    Dim Time() as String = t.NthField( "T", 2 ).NthField("G",1).Split(":")
		    
		    If Date.Ubound >= 0 Then d.Year  = Val( Date(0) )
		    If Date.Ubound >= 1 Then d.Month = Val( Date(1) ) Else d.Month = 1
		    If Date.Ubound >= 2 Then d.Day   = Val( Date(2) ) Else d.Day = 1
		    
		    If Time.Ubound >= 0 Then d.Hour = Val( Time(0) )
		    If Time.Ubound >= 1 Then d.Minute = Val( Time(1) )
		    
		    Dim Today as New Date
		    d.GMTOffset = Today.GMTOffset
		    
		    Shadow.Cell( Shadow.LastIndex, 8 ) = Str( d.Year ) + "-" + LeadingZero( d.Month ) + "-" + LeadingZero( d.Day ) + "T" + LeadingZero( d.Hour ) + ":" + LeadingZero( d.Minute ) + "G" + Str( Today.GMTOffset )' + t.NthField("G",2)
		  End If
		  
		  // 10 t/m 19. Art files
		  If FindImagePoster( f ) <> Nil Then Shadow.Cell( Shadow.LastIndex, 10 ) = "Poster"   Else Shadow.Cell( Shadow.LastIndex, 10 ) = "-"
		  If FindImageFanart( f ) <> Nil Then Shadow.Cell( Shadow.LastIndex, 11 ) = "Backdrop" Else Shadow.Cell( Shadow.LastIndex, 11 ) = "-"
		  If FindImageBanner( f ) <> Nil Then Shadow.Cell( Shadow.LastIndex, 12 ) = "Banner"   Else Shadow.Cell( Shadow.LastIndex, 12 ) = "-"
		  
		  If f.Child( "clearart.png" ).Exists  Then Shadow.Cell( Shadow.LastIndex, 13 ) = "ClearArt"     Else Shadow.Cell( Shadow.LastIndex, 13 ) = "-"
		  If f.Child( "logo.png" ).Exists      Then Shadow.Cell( Shadow.LastIndex, 14 ) = "Logo"         Else Shadow.Cell( Shadow.LastIndex, 14 ) = "-"
		  'If f.Child( "disc.png").Exists       Then Shadow.Cell( Shadow.LastIndex, 15 ) = "DiscArt"      Else Shadow.Cell( Shadow.LastIndex, 15 ) = "-"
		  If f.Child( "landscape.jpg" ).Exists Then Shadow.Cell( Shadow.LastIndex, 16 ) = "Thumb"        Else Shadow.Cell( Shadow.LastIndex, 16 ) = "-"
		  If f.Child( "character.png" ).Exists Then Shadow.Cell( Shadow.LastIndex, 17 ) = "CharacterArt" Else Shadow.Cell( Shadow.LastIndex, 17 ) = "-"
		  If FindImageSeasonArt( f ) <> Nil    Then Shadow.Cell( Shadow.LastIndex, 18 ) = "seasonart"    Else Shadow.Cell( Shadow.LastIndex, 18 ) = "-"
		  If f.Child( "extrafanart" ).Exists   Then Shadow.Cell( Shadow.LastIndex, 19 ) = "extrafanart"  Else Shadow.Cell( Shadow.LastIndex, 19 ) = "-"
		  If f.Child( "theme.mp3" ).Exists     Then Shadow.Cell( Shadow.LastIndex, 20 ) = "themesong"    Else Shadow.Cell( Shadow.LastIndex, 20 ) = "-"
		  'If FindImageSeason( f ) <> Nil       Then Cell( LastIndex, 20 ) = "seasonart"    Else Cell( LastIndex, 20 ) = "-"
		  
		  
		  // 21. Runtime/Duration
		  Shadow.Cell( Shadow.LastIndex, 21 ) = Str( TVAttr.DurationRuntime )
		  If Str( TVAttr.DurationRuntime ).Len = 2 Then Shadow.Cell( Shadow.LastIndex, 21 ) = "0" + Str( TVAttr.DurationRuntime )
		  
		  // 22. Locked
		  If TVAttr.Locked Then Shadow.Cell( Shadow.LastIndex, 22 ) = Str( TVAttr.Locked ) Else Shadow.Cell( Shadow.LastIndex, 22 ) = ""
		  
		  // Episode Guide
		  'Dim EpGuide as FolderItem = Preferences.fAppSupport.Child( "EpisodeGuides" ).Child( TVAttr.ID_TVDB + ".json" )
		  'Dim Episodes as New JSONItem
		  'Dim Content as String
		  'If EpGuide <> Nil And EpGuide.Exists Then Content = ReadTextFile( EpGuide )
		  
		  'Dim MyMatch() as String = match_all( "\""id\""", Content, 0 )
		  'Shadow.Cell( Shadow.LastIndex, 22 ) = Str( MyMatch.Ubound + 1 )
		  '
		  'MyMatch = match_all( "\""watched\""\:true", Content, 0 )
		  'Shadow.Cell( Shadow.LastIndex, 23 ) = Str( MyMatch.Ubound + 1 )
		  
		  'If Content <> "" Then Episodes.Load( Content )
		  
		  // 22. EpisodeCount
		  'If Episodes <> Nil And Episodes.HasName("episodes") Then Shadow.Cell( Shadow.LastIndex, 22 ) = Str( Episodes.Child("episodes").Count ) Else Shadow.Cell( Shadow.LastIndex, 22 ) = "-1"
		  '
		  'Dim Watched as Integer = 0
		  'If Episodes <> Nil And Episodes.HasName("episodes") Then
		  'For i as Integer = 0 to Episodes.Child("episodes").Count -1
		  'Dim jItem as New JSONItem
		  'jItem = Episodes.Child("episodes").Child(i)
		  '
		  'If jItem.HasName("watched") And jItem.Value("watched") = True Then Watched = Watched + 1
		  'Next
		  'End If
		  // 23. Watched EpisodeCount
		  'Shadow.Cell( Shadow.LastIndex, 23 ) = Str( Watched )
		  
		  // 24. Local episodes
		  Dim EpisodeFiles() as FolderItem = FindEpisodeFiles( f )
		  if EpisodeFiles <> Nil and EpisodeFiles.Ubound > -1 then
		    Shadow.Cell( Shadow.LastIndex, 24 ) = LeadingZero( EpisodeFiles.Ubound + 1, 5 )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateList(Update as Boolean = True)
		  #pragma DisableBackgroundTasks
		  
		  'Dim Shadow as Listbox = wndMain.lstTVShadow
		  
		  Dim f as FolderItem = Preferences.fAppSupport
		  If f.Child("TVShowsDB.xml").Exists Then f.Child("TVShowsDB.xml").Delete
		  
		  Dim Dict as Dictionary = Preferences.Prefs.dictionaryForKey("TVShowPaths")
		  Dim Paths() as FolderItem
		  
		  If Dict = Nil Then
		    Shadow.DeleteAllRows
		    Me.DeleteAllRows
		    Return
		  End If
		  
		  For Each Key as Variant in Dict.Keys
		    If Key.StringValue.InStr( 0, ":" ) > 0 Then
		      Paths.Append GetFolderItem( Key )
		    Else
		      Paths.Append GetFolderItem( Key, FolderItem.PathTypeShell )
		    End If
		  Next
		  
		  ReDim TVFolders(-1)
		  Dim Lindex as Integer = ListIndex
		  ListIndex = -1
		  'If NOT Update Then Me.DeleteAllRows
		  If NOT Update Then Shadow.DeleteAllRows
		  If Paths.Ubound = -1 Then
		    Shadow.DeleteAllRows
		    Me.DeleteAllRows
		    Return
		  End If
		  
		  
		  // Scan available directories for tv shows
		  For i as Integer = 0 to Paths.Ubound
		    If Paths(i) = Nil OR NOT Paths(i).Exists Then Continue
		    
		    For n as Integer = 1 to Paths(i).Count
		      
		      If Paths(i).Item(n).Directory And Paths(i).Item(n).Visible Then
		        dlgProgress.Add( Loc.kScanning + ":", Paths(i).Item(n).Name, 0, 0 )
		        TVFolders.Append Paths(i).Item(n)
		      End If
		      
		    Next
		  Next
		  
		  // Remove folders that no longer exists.
		  'CommonCore.MassSearch = True
		  For i as Integer = Shadow.ListCount - 1 DownTo 0
		    Dim listfolder as FolderItem
		    
		    listfolder = GetFolderItem( Shadow.Cell( i, 1 ), FolderItem.PathTypeShell )
		    If listfolder = Nil OR NOT listfolder.Exists Then
		      Shadow.RemoveRow i
		      Continue
		    End If
		    
		    Dim b as Boolean = False
		    For n as Integer = 0 to Paths.Ubound
		      If Paths(n) = Nil OR NOT Paths(n).Exists Then Continue
		      b = ( listfolder.ShellPath.InStr( 0, Paths(n).ShellPath ) > 0 )
		      If b Then Exit
		    Next
		    If NOT b Then Shadow.RemoveRow i
		    
		  Next
		  'CommonCore.MassSearch = False
		  
		  // If update, add folders that aren't in the list yet, otherwise add every folder.
		  For i as Integer = 0 to TVFolders.Ubound
		    
		    If Update Then
		      Dim b as Boolean = False
		      For n as Integer = 0 to Shadow.ListCount - 1
		        If Shadow.Cell( n, 1 ) = TVFolders(i).ShellPath Then
		          b = True
		          Exit
		        End If
		      Next
		      
		      If NOT b Then AddItem TVFolders(i)
		      
		    Else
		      AddItem TVFolders(i)
		    End If
		    
		  Next
		  
		  
		  If Update Then
		    dlgProgress.Reset
		    For i as Integer = 0 to Shadow.ListCount -1
		      // Update episode files.
		      dlgProgress.add( Loc.kScanning + ":", Shadow.Cell( i, 0 ) + " updating episodes.", 1, Shadow.ListCount -1 )
		      Dim EpisodeFiles() as FolderItem = FindEpisodeFiles( GetFolderItem( Shadow.Cell( i, 1 ), FolderItem.PathTypeShell ) )
		      If EpisodeFiles = Nil OR EpisodeFiles.Ubound < 0 Then Continue
		      
		      Shadow.Cell( i, 24 ) = LeadingZero( EpisodeFiles.Ubound + 1, 5 )
		    Next
		  End If
		  
		  SaveToDB
		  ReDim TVFolders(-1)
		  SortList
		  wndMain.lstSearch.CopyFrom Shadow
		  
		  wndMain.ActBar( ActiveSection ).TextValue( Str( Shadow.ListCount ) + " " + Loc.TVShows )
		  
		  
		  If Preferences.Prefs.integerForKey("SortByTV") = 3 OR Preferences.Prefs.integerForKey("SortByTV") = 5 Then
		    Me.DeleteAllRows
		    AddFolders()
		    
		    // Restore folder states
		    Dim s() as String = Preferences.Prefs.stringArrayForKey( "TVShows Folders CollapseState" )
		    Dim t as Integer = s.Ubound
		    For i as Integer = 0 to Me.ListCount - 1
		      If Me.RowTag(i) <> "Folder" Then Continue
		      If t > -1 Then
		        Me.Expanded(i) = ( s(t) = "True" )
		        t = t - 1
		      End If
		    Next
		    
		  Else
		    wndMain.lstSearch.CopyTo( wndMain.lstTVShows )
		  End If
		  
		  
		  
		  If Lindex > -1 And Lindex > ListCount -1 Then
		    ListIndex = ListCount -1
		  ElseIf Lindex > -1 Then
		    ListIndex = Lindex
		  Else
		    ListIndex = 0
		  End If
		  Lindex = -1
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItem()
		  If ListIndex = -1 OR RowTag( ListIndex ) = "Folder" then Return
		  
		  Dim LastIndex as Integer = ListIndex
		  Dim f as FolderItem = GetFolderItem( Cell( ListIndex, 1 ), FolderItem.PathTypeShell )
		  
		  
		  Dim ID as String = TVAttr.ID_TVDB
		  If ID = "" Then ID = TVAttr.ID_IMDb
		  Dim EpGuide as FolderItem = Preferences.fAppSupport.Child("EpisodeGuides").Child( ID + ".nfo" )
		  
		  
		  If f = Nil OR NOT f.Exists Then Return
		  
		  Dim strRemoveItem   as String = Loc.msgRemoveItem.ReplaceAll( "%S", Cell( ListIndex, 0 ) ).ReplaceAll( "%F", f.Parent.Name )
		  Dim strMovedToTrash as String = Loc.msgWillBeMovedToTrash.ReplaceAll( "%F", f.Parent.Name )
		  
		  If MsgDlg( Parent.Window, 1, strRemoveItem, strMovedToTrash, Loc.btnMoveToTrash, Loc.btnKeepIt ) = 2 Then Return
		  
		  If EpGuide <> Nil And EpGuide.Exists Then
		    If EpGuide.IsNetworkVolume Then EpGuide.Delete Else EpGuide.MoveToTrash()
		  End If
		  If f <> Nil And f.Exists Then
		    If f.IsNetworkVolume Then f.Delete Else f.MoveToTrash()
		  End If
		  
		  CacheImageDelete( TVAttr.ID_IMDB )
		  RemoveItem
		  
		  wndMain.lstSearch.CopyFrom( Me ) // Update the 'search listbox'.
		  
		  If LastIndex > -1 Then
		    If LastIndex >= ListCount Then ListIndex = ListCount - 1 Else ListIndex = LastIndex
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadList()
		  #pragma DisableBackgroundTasks
		  
		  'Dim Shadow as Listbox = wndMain.lstTVShadow
		  Shadow.DeleteAllRows
		  
		  // Add category folders
		  AddFolders
		  
		  // Load existing XML TV List if it exists.
		  If NOT Preferences.fAppSupport.Child("TVShowsDB.xml").Exists Then
		    CreateList
		    
		    if wndMain.ActBar(ActiveSection) <> Nil and Shadow <> Nil then
		      wndMain.ActBar( ActiveSection ).Text = str( Shadow.ListCount ) + " " + Loc.TVShows
		    End If
		    SortList
		    If Shadow.ListIndex <> 0 then Shadow.ListIndex = 0
		    Return
		  End If
		  
		  Dim Xml as New XmlDocument
		  Dim xRoot, xNode, xItem as XmlNode
		  Dim fi as FolderItem
		  Xml.PreserveWhitespace = False
		  
		  Dim TextIn as TextInputStream
		  TextIn = TextIn.Open( Preferences.fAppSupport.Child("TVShowsDB.xml") )
		  Dim Content as String = Trim( TextIn.ReadAll )
		  TextIn.Close
		  
		  If Content.Left(5) = "<?xml" Then Xml.LoadXml( Content ) Else Return
		  xRoot = Xml.Child(0)
		  
		  
		  
		  For i as Integer = 0 to xRoot.ChildCount - 1
		    xNode = xRoot.Child(i)
		    If xNode.FirstChild = Nil Then Continue
		    
		    Shadow.AddRow "Row"
		    
		    For n as Integer = 0 to xNode.ChildCount - 1
		      xItem = xNode.Child(n)
		      
		      If xItem.FirstChild = Nil Then Continue
		      
		      Select Case xItem.Name
		        
		      Case "Title"
		        Shadow.Cell( Shadow.LastIndex, 0 ) = xItem.FirstChild.Value
		      Case "Path"
		        If xItem.FirstChild.Value.InStr( 0, ":" ) > 0 Then
		          Dim f as FolderItem = GetFolderItem( xItem.FirstChild.Value )
		          If f IsA FolderItem Then
		            Shadow.Cell( Shadow.LastIndex, 1 ) = f.ShellPath
		          Else
		            Shadow.RemoveRow( Shadow.LastIndex )
		            Exit
		          End If
		        Else
		          Shadow.Cell( Shadow.LastIndex, 1 ) =  xItem.FirstChild.Value
		        End If
		        
		      Case "ID"
		        Shadow.Cell( Shadow.LastIndex, 2 ) = xItem.FirstChild.Value
		      Case "SortTitle"
		        Shadow.Cell( Shadow.LastIndex, 3 ) = xItem.FirstChild.Value
		      Case "Status"
		        Shadow.Cell( Shadow.LastIndex, 4 ) = xItem.FirstChild.Value
		      Case "Premiere"
		        Shadow.Cell( Shadow.LastIndex, 5 ) = xItem.FirstChild.Value
		      Case "Studio"
		        Shadow.Cell( Shadow.LastIndex, 6 ) = xItem.FirstChild.Value
		      Case "Rating"
		        Shadow.Cell( Shadow.LastIndex, 7 ) = xItem.FirstChild.Value
		        
		      Case "NextAiredDate"
		        Shadow.Cell( Shadow.LastIndex, 8 ) = xItem.FirstChild.Value
		      Case "NextAiredEpisode"
		        Shadow.Cell( Shadow.LastIndex, 9 ) = xItem.FirstChild.Value
		        
		      Case "ArtPoster"
		        Shadow.Cell( Shadow.LastIndex, 10 ) = xItem.FirstChild.Value
		      Case "ArtBackdrop"
		        Shadow.Cell( Shadow.LastIndex, 11 ) = xItem.FirstChild.Value
		      Case "ArtBanner"
		        Shadow.Cell( Shadow.LastIndex, 12 ) = xItem.FirstChild.Value
		      Case "ArtClearArt"
		        Shadow.Cell( Shadow.LastIndex, 13 ) = xItem.FirstChild.Value
		      Case "ArtLogo"
		        Shadow.Cell( Shadow.LastIndex, 14 ) = xItem.FirstChild.Value
		      Case "ArtDisc"
		        Shadow.Cell( Shadow.LastIndex, 15 ) = xItem.FirstChild.Value
		      Case "ArtThumb"
		        Shadow.Cell( Shadow.LastIndex, 16 ) = xItem.FirstChild.Value
		      Case "ArtCharacter"
		        Shadow.Cell( Shadow.LastIndex, 17 ) = xItem.FirstChild.Value
		      Case "ArtSeasons"
		        Shadow.Cell( Shadow.LastIndex, 18 ) = xItem.FirstChild.Value
		      Case "ArtExtraBackdrops"
		        Shadow.Cell( Shadow.LastIndex, 19 ) = xItem.FirstChild.Value
		      Case "ThemeSong"
		        Shadow.Cell( Shadow.LastIndex, 20 ) = xItem.FirstChild.Value
		        
		      Case "Runtime"
		        Shadow.Cell( Shadow.LastIndex, 21 ) = xItem.FirstChild.Value
		        
		      Case "EpisodeCount"
		        Shadow.Cell( Shadow.LastIndex, 22 ) = xItem.FirstChild.Value
		      Case "WatchedCount"
		        Shadow.Cell( Shadow.LastIndex, 23 ) = xItem.FirstChild.Value
		      Case "LocalEpisodeCount"
		        Shadow.Cell( Shadow.LastIndex, 24 ) = xItem.FirstChild.Value
		        
		      End Select
		      
		    Next
		    
		    // Remove row if the folder is not available.
		    If Shadow.Cell( Shadow.LastIndex, 1 ) <> "" Then
		      Dim f as FolderItem
		      If Shadow.Cell( Shadow.LastIndex, 1 ).InStr( 0, ":" ) > 0 Then
		        f = GetFolderItem( Shadow.Cell( Shadow.LastIndex, 1 ) )
		      Else
		        f = GetFolderItem( Shadow.Cell( Shadow.LastIndex, 1 ), FolderItem.PathTypeShell )
		      End If
		      If f = Nil OR not f.Exists Then
		        Shadow.RemoveRow( Shadow.LastIndex )
		        Continue
		      End If
		      
		      // Load poster into list for a speed boost.
		      'If True And Preferences.Prefs.boolForKey("ShowPostersInList") Then
		      'Dim Poster as FolderItem
		      'If f IsA FolderItem Then Poster = FindImagePoster( f )
		      'Dim ID as String = Shadow.Cell( Shadow.LastIndex, 2 )
		      '
		      'If ID <> "" And NOT Preferences.fAppSupport.Child("Cache").Child( ID + ".television.poster.jpg" ).Exists Then
		      'If Poster <> Nil And Poster.Exists Then CacheImageSet( Picture.Open( Poster ), ID + ".television.poster.jpg" )
		      'End If
		      '
		      'If ID <> "" And Preferences.fAppSupport.Child("Cache").Child( ID + ".television.poster.jpg" ).Exists Then
		      'Poster = Preferences.fAppSupport.Child("Cache").Child( ID + ".television.poster.jpg" )
		      'End If
		      '
		      'If Poster <> Nil And Poster.Exists Then Shadow.CellTag( Shadow.LastIndex, 10 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		      'End If
		      
		    End If
		    
		  Next
		  
		  // Load poster into list for speed boost.
		  'For i as Integer = 0 to Shadow.ListCount -1
		  'If Shadow.Cell( i, 1 ) = "" Then Continue
		  'Dim ID as String = Shadow.Cell( i, 2 )
		  'If ID = "" Then Continue
		  '
		  'Dim f as FolderItem = GetFolderItem( Shadow.Cell( i, 1 ), FolderItem.PathTypeShell )
		  'If f = Nil OR NOT f.Exists Then Continue
		  '
		  'Dim Poster as FolderItem = FindImagePoster( f )
		  'If Preferences.fAppSupport.Child( "Cache" ).Child( ID + ".movie.poster.jpg" ).Exists Then
		  'Poster = Preferences.fAppSupport.Child( "Cache" ).Child( ID + ".movie.poster.jpg" )
		  'End If
		  'If Poster <> Nil And Poster.Exists Then Shadow.CellTag( i, 10 ) = ScaleImage( Picture.Open( Poster ), 128, 128 )
		  'Next
		  
		  wndMain.ActBar( 1 ).Text = str( Shadow.ListCount ) + " " + Loc.TVShows
		  SortList
		  If ActiveSection = 1 Then wndMain.lstSearch.CopyFrom Shadow
		  If Me.ListIndex <> 0 Then Me.ListIndex = 0
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveItem()
		  Dim LstBox as Listbox = wndMain.lstTVShadow
		  
		  For i as Integer = 0 to LstBox.ListCount - 1
		    If LstBox.Cell( i, 1 ) = Me.Cell( Me.ListIndex, 1 ) Then
		      LstBox.RemoveRow( i )
		    End If
		  Next
		  
		  Me.RemoveRow( Me.ListIndex )
		  
		  SaveToDB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetFolderStatus()
		  
		  // Save Status
		  Dim ScrollPos as Integer = Me.ScrollPosition
		  Dim s() as String
		  For i as Integer = Me.ListCount - 1 DownTo 0
		    If Me.RowTag(i) <> "Folder" Then Continue
		    s.Append Str( Me.Expanded(i) )
		  Next
		  
		  // Close All
		  Me.AllExpanded( False )
		  wndMain.lstTVShadow.SortedColumn = 8
		  wndMain.lstTVShadow.Sort
		  
		  // Reopen All saved
		  Dim t as Integer = s.Ubound
		  For i as Integer = 0 to Me.ListCount - 1
		    If Me.RowTag(i) <> "Folder" Then Continue
		    If t > -1 Then
		      Me.Expanded(i) = ( s(t) = "True" )
		      t = t - 1
		    End If
		  Next
		  Me.ScrollPosition = ScrollPos
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveToDB()
		  #pragma DisableBackgroundTasks
		  
		  'Dim Shadow as Listbox = wndMain.lstTVShadow
		  
		  Dim Xml as New XmlDocument
		  Dim xRoot, xNode as XmlNode
		  Xml.PreserveWhitespace = True
		  
		  xRoot = Xml.AppendChild( Xml.CreateElement( "list" ) )
		  
		  For i as Integer = 0 to Shadow.ListCount - 1
		    xNode = xRoot.AppendNewChild("tvshow")
		    
		    xNode.AppendSimpleChild "Title",      Shadow.Cell( i, 0 )
		    xNode.AppendSimpleChild "Path",       Shadow.Cell( i, 1 )
		    xNode.AppendSimpleChild "ID",         Shadow.Cell( i, 2 )
		    xNode.AppendSimpleChild "SortTitle",  Shadow.Cell( i, 3 )
		    xNode.AppendSimpleChild "Status",     Shadow.Cell( i, 4 )
		    xNode.AppendSimpleChild "Premiere",   Shadow.Cell( i, 5 )
		    xNode.AppendSimpleChild "Studio",     Shadow.Cell( i, 6 )
		    xNode.AppendSimpleChild "Rating",     Shadow.Cell( i, 7 )
		    
		    xNode.AppendSimpleChild "NextAiredDate",     Shadow.Cell( i, 8 )
		    xNode.AppendSimpleChild "NextAiredEpisode",  Shadow.Cell( i, 9 )
		    
		    xNode.AppendSimpleChild "ArtPoster",          Shadow.Cell( i, 10 )
		    xNode.AppendSimpleChild "ArtBackdrop",        Shadow.Cell( i, 11 )
		    xNode.AppendSimpleChild "ArtBanner",          Shadow.Cell( i, 12 )
		    xNode.AppendSimpleChild "ArtClearArt",        Shadow.Cell( i, 13 )
		    xNode.AppendSimpleChild "ArtLogo",            Shadow.Cell( i, 14 )
		    xNode.AppendSimpleChild "ArtDisc",            Shadow.Cell( i, 15 )
		    xNode.AppendSimpleChild "ArtThumb",           Shadow.Cell( i, 16 )
		    xNode.AppendSimpleChild "ArtCharacter",       Shadow.Cell( i, 17 )
		    xNode.AppendSimpleChild "ArtSeasons",         Shadow.Cell( i, 18 )
		    xNode.AppendSimpleChild "ArtExtraBackdrops",  Shadow.Cell( i, 19 )
		    xNode.AppendSimpleChild "ThemeSong",          Shadow.Cell( i, 20 )
		    
		    xNode.AppendSimpleChild "Runtime",            Shadow.Cell( i, 21 )
		    
		    xNode.AppendSimpleChild "EpisodeCount",       Shadow.Cell( i, 22 )
		    xNode.AppendSimpleChild "WatchedCount",       Shadow.Cell( i, 23 )
		    xNode.AppendSimpleChild "LocalEpisodeCount",  Shadow.Cell( i, 24 )
		  Next
		  
		  xRoot.Indent(0)
		  'Xml.LoadXml( Xml.ToString )
		  
		  If Preferences.fAppSupport.Exists Then Xml.SaveXml( Preferences.fAppSupport.Child("TVShowsDB.xml") )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchList(SearchTerm as String)
		  wndMain.lstSearch.Search( SearchTerm, Me )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortList(SortColumn as Integer = - 1)
		  #pragma DisableBackgroundTasks
		  
		  Dim Shadow as Listbox = wndMain.lstTVShadow
		  
		  'Case 0 // Col 0: Show Title
		  'Case 1 // Col 3: Show Sort Title
		  'Case 2 // Col 1: Path
		  'Case 3 // Col 8: Next Aired Date
		  'Case 4 // Col 7: Rating
		  'Case 5 // Col 6: Status
		  'Case 6 // Col 5: Network?
		  
		  'Shadow.SortedColumn = 8
		  'Shadow.Sort
		  
		  
		  If SortColumn = -1 then SortColumn = Preferences.Prefs.integerForKey("SortByTV")
		  
		  Dim SortDir as Integer = 1
		  If Preferences.Prefs.boolForKey("SortTVAscending") Then SortDir = -1
		  
		  // Always sort by title sort first?
		  Shadow.SortedColumn = 3
		  Shadow.ColumnSortDirection(3) = SortDir
		  Shadow.Sort
		  
		  Dim Zort as Integer
		  Select Case Preferences.Prefs.integerForKey("SortByTV")
		    
		  Case 0 // Title
		    Zort = 0
		  Case 1 // Title Sort
		    Zort = 3
		  Case 2 // Path
		    Zort = 1
		  Case 3 // Next Aired
		    Zort = 8
		  Case 4 // Rating
		    If SortDir = -1 Then SortDir = 1 Else SortDir = -1 // Reverse for numeric
		    Zort = 7
		  Case 5 // Show Status
		    Zort = 6
		  case 6 // Runtime
		    If SortDir = -1 Then SortDir = 1 Else SortDir = -1 // Reverse for numeric
		    Zort = 21
		  Case 7 // Premiere
		    If SortDir = -1 Then SortDir = 1 Else SortDir = -1 // Reverse for numeric
		    Zort = 5
		  Case 8 // Local episode files
		    If SortDir = -1 Then SortDir = 1 Else SortDir = -1 // Reverse for numeric
		    Zort = 24
		    
		  Case 10 // Poster
		    Zort = 10
		  Case 11 // Fanart
		    Zort = 11
		  Case 12 // Banner
		    Zort = 12
		    
		  Case 13 // ClearArt
		    Zort = 13
		  Case 14 // Logo
		    Zort = 14
		    'Case 15 // DiscArt
		    'Zort = 15
		  Case 16 // Thumb
		    Zort = 16
		  Case 17 // CharacterArt
		    Zort = 17
		  Case 18 // SeasonArt
		    Zort = 18
		  Case 19 // ExtraFanart
		    Zort = 19
		  Case 20 // Themesong
		    Zort = 20
		    
		    
		  End Select
		  
		  Shadow.SortedColumn = Zort
		  Shadow.ColumnSortDirection( Zort ) = SortDir
		  
		  
		  // Do the sorting
		  If SortColumn > -1 Then
		    Shadow.Sort
		    If ActiveSection = 1 Then wndMain.lstSearch.CopyFrom( wndMain.lstTVShadow )
		  End If
		  
		  Dim Lindex as Integer = Me.ListIndex
		  If Preferences.Prefs.integerForKey("SortByTV") = 3 OR Preferences.Prefs.integerForKey("SortByTV") = 5 Then
		    AddFolders()
		    
		    // Restore folder states
		    Dim s() as String = Preferences.Prefs.stringArrayForKey( "TVShows Folders CollapseState" )
		    Dim t as Integer = s.Ubound
		    For i as Integer = 0 to Me.ListCount - 1
		      If Me.RowTag(i) <> "Folder" Then Continue
		      If t > -1 Then
		        Me.Expanded(i) = ( s(t) = "True" )
		        t = t - 1
		      End If
		    Next
		    
		    'ElseIf ActiveSection = 1 Then
		    'wndMain.lstSearch.CopyTo( wndMain.lstTVShows )
		  Else
		    
		    Me.DeleteAllRows
		    For i as Integer = 0 to Shadow.ListCount - 1
		      Me.AddRow
		      
		      For n as Integer = 0 to Shadow.ColumnCount - 1
		        Me.Cell( Me.LastIndex, n ) = Shadow.Cell( i, n )
		        Me.CellTag( Me.LastIndex, n ) = Shadow.CellTag( i, n )
		      Next
		      
		    Next
		    
		  End If
		  Me.ListIndex = Lindex
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRow(Lindex as Integer = - 1, NewLocation as FolderItem = Nil, Shadow as Boolean = False)
		  Dim LstBox as Listbox = Me
		  If Shadow Then LstBox = wndMain.lstTVShadow
		  
		  If Lindex = -1 Then Lindex = ListIndex
		  If Lindex = -1 or Lindex > LstBox.LastIndex Then Return
		  
		  
		  Dim f as FolderItem
		  'If LstBox.ListIndex = -1 Then Return
		  Dim OldLocation as String = LstBox.Cell( Lindex, 1 )
		  
		  If NewLocation = Nil Then
		    Dim s as String = LstBox.Cell( Lindex, 1 )
		    If LstBox.Cell( Lindex, 1 ) <> "" Then f = GetFolderItem( LstBox.Cell( Lindex, 1 ), FolderItem.PathTypeShell ) Else Return
		  Else
		    f = NewLocation
		  End If
		  
		  'Dim OldLocation as FolderItem = GetFolderItem( Cell( Lindex, 1 ) )
		  
		  If f = Nil or NOT f.Exists Then Return
		  
		  If CommonCore.MassSearch Then TVAttr.NFORead f
		  If NOT CommonCore.MassSearch Then
		    'TVAttr.NFORead f
		    'TVAttr.LoadImages( f )
		  End If
		  
		  // 0. TV Title
		  Dim TVTitle as String
		  If TVAttr.Title <> "" Then
		    TVTitle = TVAttr.Title
		    LstBox.Cell( Lindex, 0 ) = TVTitle
		  End If
		  
		  // 1. Absolute Path
		  If NewLocation <> Nil And f <> Nil And f.Exists Then LstBox.Cell( Lindex, 1 ) = f.ShellPath
		  
		  // 2. TV ID
		  If TVAttr.ID_IMDb <> "" Then
		    LstBox.Cell( Lindex, 2 ) = TVAttr.ID_IMDb
		  ElseIf TVAttr.ID_TVDB <> "" Then
		    LstBox.Cell( Lindex, 2 ) = TVAttr.ID_TVDB
		  End If
		  
		  
		  // Set cache images
		  Dim PosterLoc as FolderItem = FindImagePoster( f ) 'f.Child( "poster.jpg" )
		  Dim CacheLoc as FolderItem
		  If LstBox.Cell( Lindex, 2 ) <> "" Then
		    dim FileName as String = LstBox.Cell( Lindex, 2 ) + ".television.poster.jpg"
		    CacheLoc = Preferences.fAppSupport.Child("Cache").Child( FileName )
		  End If
		  
		  If Preferences.Prefs.boolForKey("ShowPostersInList") And LstBox.Cell( Lindex, 2 ) <> "" And ( CacheLoc = Nil OR NOT CacheLoc.Exists ) Then
		    If PosterLoc <> Nil And PosterLoc.Exists Then
		      CacheImageSet( Picture.Open( PosterLoc ), LstBox.Cell( Lindex, 2 ) + ".television.poster.jpg" )
		    End If
		  End If
		  
		  If LstBox.Cell( Lindex, 2 ) <> "" Then
		    CacheLoc = Preferences.fAppSupport.Child("Cache").Child( LstBox.Cell( Lindex, 2 ) + ".television.poster.jpg" )
		  End If
		  
		  // Set row image.
		  If Preferences.Prefs.boolForKey("ShowPostersInList") Then
		    If ( CacheLoc = Nil OR NOT CacheLoc.Exists ) And PosterLoc <> Nil And PosterLoc.Exists Then
		      LstBox.CellTag( Lindex, 10 ) = ScaleImage( Picture.Open( PosterLoc ), 128, 128 )
		    ElseIf CacheLoc <> Nil And CacheLoc.Exists Then
		      LstBox.CellTag( Lindex, 10 ) = ScaleImage( Picture.Open( CacheLoc ), 128, 128 )
		    Else
		      'LstBox.CellTag( Lindex, 10 ) = Nil
		    End If
		  End If
		  
		  
		  // 3. Sort Title
		  If TVAttr.TitleSort <> "" Then
		    LstBox.Cell( Lindex, 3 ) = TVAttr.TitleSort
		  ElseIf TVAttr.Title <> "" Then
		    LstBox.Cell( Lindex, 3 ) = Articulator( TVAttr.Title )
		    If TVAttr.DateYear > 0 Then LstBox.Cell( Lindex, 3 ) = LstBox.Cell( Lindex, 3 ) + " (" + Str( TVAttr.DateYear ) + ")"
		  Else
		    LstBox.Cell( Lindex, 3 ) = Articulator( LstBox.Cell( Lindex, 0 ) )
		  End If
		  
		  // 4. Status
		  LstBox.Cell( Lindex, 4 ) = Str( TVAttr.Status )
		  
		  // 5. Date Premiered
		  If TVAttr.DatePremiered <> "" And TVAttr.DatePremiered <> "N/A" Then
		    LstBox.Cell( Lindex, 5 ) = TVAttr.DatePremiered
		  ElseIf ( TVAttr.DatePremiered = "N/A" Or TVAttr.DatePremiered = "" ) And TVAttr.DateYear > 0 Then
		    LstBox.Cell( Lindex, 5 ) = Str( TVAttr.DateYear )
		  End If
		  
		  // 6. Studio
		  LstBox.Cell( Lindex, 6 ) = TVAttr.TVNetwork
		  
		  // 7. Rating
		  If TVAttr.Rating > 0 Then
		    Dim Rate as String = Str( TVAttr.Rating )
		    If Rate.Len = 1 Then Rate = Rate + ".0"
		    If Rate.Len = 3 Then Rate = "0" + Rate
		    
		    LstBox.Cell( Lindex, 7 ) = Rate
		  End If
		  
		  // 8 - 9. Next Aired Episode
		  LstBox.Cell( Lindex, 8 ) = TVAttr.NextAired_Date
		  If TVAttr.NextAired_Episode <> "" Then
		    LstBox.Cell( Lindex, 9 ) = TVAttr.NextAired_Episode
		  ElseIf TVAttr.LastAired_Episode <> "" Then
		    LstBox.Cell( Lindex, 9 ) = TVAttr.LastAired_Episode
		  End If
		  
		  Dim Clock as String = CountHours( TVAttr.LastAired_Date )
		  Dim Hours as Integer = Val( Clock )
		  If Clock <> "" And Hours > -24 And Hours < 0 Then
		    LstBox.Cell( Lindex, 8 ) = TVAttr.LastAired_Date
		    If TVAttr.LastAired_Episode <> "" Then LstBox.Cell( Lindex, 9 ) = TVAttr.LastAired_Episode
		  End If
		  
		  Dim t as String = LstBox.Cell( Lindex, 8 )
		  
		  If t <> "" Then
		    Dim d as New Date
		    d.GMTOffset = Val( t.NthField("G",2) )
		    
		    Dim Date() as String = t.NthField( "T", 1 ).Split("-")
		    Dim Time() as String = t.NthField( "T", 2 ).NthField("G",1).Split(":")
		    
		    If Date.Ubound >= 0 Then d.Year  = Val( Date(0) )
		    If Date.Ubound >= 1 Then d.Month = Val( Date(1) ) Else d.Month = 1
		    If Date.Ubound >= 2 Then d.Day   = Val( Date(2) ) Else d.Day = 1
		    
		    If Time.Ubound >= 0 Then d.Hour = Val( Time(0) )
		    If Time.Ubound >= 1 Then d.Minute = Val( Time(1) )
		    
		    Dim Today as New Date
		    d.GMTOffset = Today.GMTOffset
		    
		    LstBox.Cell( Lindex, 8 ) = Str( d.Year ) + "-" + LeadingZero( d.Month ) + "-" + LeadingZero( d.Day ) + "T" + LeadingZero( d.Hour ) + ":" + LeadingZero( d.Minute ) + "G" + Str( Today.GMTOffset )' + t.NthField("G",2)
		  End If
		  
		  // 10 t/m 19. Art files
		  If FindImagePoster( f ) <> Nil Then LstBox.Cell( Lindex, 10 ) = "Poster"   Else LstBox.Cell( Lindex, 10 ) = "-"
		  If FindImageFanart( f ) <> Nil Then LstBox.Cell( Lindex, 11 ) = "Backdrop" Else LstBox.Cell( Lindex, 11 ) = "-"
		  If FindImageBanner( f ) <> Nil Then LstBox.Cell( Lindex, 12 ) = "Banner"   Else LstBox.Cell( Lindex, 12 ) = "-"
		  
		  If f.Child( "clearart.png" ).Exists  Then LstBox.Cell( Lindex, 13 ) = "ClearArt"     Else LstBox.Cell( Lindex, 13 ) = "-"
		  If f.Child( "logo.png" ).Exists      Then LstBox.Cell( Lindex, 14 ) = "Logo"         Else LstBox.Cell( Lindex, 14 ) = "-"
		  'If f.Child( "disc.png").Exists       Then LstBox.Cell( Lindex, 15 ) = "DiscArt"      Else LstBox.Cell( Lindex, 15 ) = "-"
		  If f.Child( "landscape.jpg" ).Exists Then LstBox.Cell( Lindex, 16 ) = "Thumb"        Else LstBox.Cell( Lindex, 16 ) = "-"
		  If f.Child( "character.png" ).Exists Then LstBox.Cell( Lindex, 17 ) = "CharacterArt" Else LstBox.Cell( Lindex, 17 ) = "-"
		  If FindImageSeasonArt( f ) <> Nil    Then LstBox.Cell( Lindex, 18 ) = "SeasonArt"    Else LstBox.Cell( Lindex, 18 ) = "-"
		  If f.Child( "extrafanart" ).Exists   Then LstBox.Cell( Lindex, 19 ) = "extrafanart"  Else LstBox.Cell( Lindex, 19 ) = "-"
		  If f.Child( "theme.mp3" ).Exists     Then LstBox.Cell( Lindex, 20 ) = "themesong"    Else LstBox.Cell( Lindex, 20 ) = "-"
		  
		  // 21. Runtime/Duration
		  LstBox.Cell( Lindex, 21 ) = Str( TVAttr.DurationRuntime )
		  If Str( TVAttr.DurationRuntime ).Len = 2 Then LstBox.Cell( Lindex, 21 ) = "0" + Str( TVAttr.DurationRuntime )
		  
		  // 22. Locked
		  If TVAttr.Locked Then LstBox.Cell( Lindex, 22 ) = Str( TVAttr.Locked ) Else LstBox.Cell( Lindex, 22 ) = ""
		  
		  // Episode Guide
		  'Dim EpGuide as FolderItem = Preferences.fAppSupport.Child( "EpisodeGuides" ).Child( TVAttr.ID_TVDB + ".json" )
		  'Dim Episodes as New JSONItem
		  
		  'Dim Content as String
		  'If EpGuide <> Nil And EpGuide.Exists Then Content = ReadTextFile( EpGuide ) 'Episodes.Load( ReadTextFile( EpGuide ) )
		  
		  'Dim MyMatch() as String = match_all( "\""id\""", Content, 0 )
		  'LstBox.Cell( Lindex, 22 ) = Str( MyMatch.Ubound + 1 )
		  '
		  'MyMatch = match_all( "\""watched\""\:true", Content, 0 )
		  'LstBox.Cell( Lindex, 23 ) = Str( MyMatch.Ubound + 1 )
		  
		  // 22. EpisodeCount
		  'If Episodes <> Nil And Episodes.HasName("episodes") Then LstBox.Cell( Lindex, 22 ) = Str( Episodes.Child("episodes").Count ) Else LstBox.Cell( Lindex, 22 ) = "-1"
		  '
		  'Dim Watched as Integer = 0
		  'If Episodes <> Nil And Episodes.HasName("episodes") Then
		  'For i as Integer = 0 to Episodes.Child("episodes").Count -1
		  'Dim jItem as New JSONItem
		  'jItem = Episodes.Child("episodes").Child(i)
		  '
		  'If jItem.HasName("watched") And jItem.Value("watched") = True Then Watched = Watched + 1
		  'Next
		  'End If
		  // 23. Watched EpisodeCount
		  'LstBox.Cell( Lindex, 23 ) = Str( Watched )
		  
		  // 24. Local episodes
		  Dim EpisodeFiles() as FolderItem = FindEpisodeFiles( f )
		  LstBox.Cell( Lindex, 24 ) = LeadingZero( EpisodeFiles.Ubound + 1, 5 )
		  
		  
		  If NOT Shadow Then
		    // Update Shadow row.
		    LstBox = wndMain.lstTVShadow
		    For i as Integer = 0 to LstBox.ListCount - 1
		      If LstBox.Cell( i, 1 ) = OldLocation Then
		        
		        For n as Integer = 0 to LstBox.ColumnCount - 1
		          LstBox.Cell( i, n ) = Me.Cell( Lindex, n )
		        Next
		        
		      End If
		    Next
		    
		  End If
		  
		  'If NOT CommonCore.MassSearch And NOT Shadow Then Me.ResetFolderStatus
		  'If NOT CommonCore.MassSearch And NOT Shadow Then Me.ListIndex = Lindex
		  
		  // Save to DB
		  If wndMain.ccSearchBoxTVShows.srchField.StringValue = "" Then
		    If NOT CommonCore.MassSearch Then wndMain.lstSearch.CopyFrom( wndMain.lstTVShadow )
		    SaveToDB
		  End If
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

	#tag Property, Flags = &h21
		Private Shadow As Listbox
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TVFolders() As Folderitem
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
			InitialValue="-1"
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
			InitialValue="0"
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

#tag Window
Begin ContainerControl ccThumbView
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   300
   Begin Canvas cvsPreview
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   285
   End
   Begin ScrollBar scrBar
      AcceptFocus     =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   284
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0
      Minimum         =   0
      PageStep        =   128
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   16
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  // Up Arrow
		  If Keyboard.AsyncKeyDown( &h7E ) Then
		    If Selection < MaxCols Then
		      'Selection = 0
		    Else
		      Selection = Selection - MaxCols
		    End If
		  End If
		  
		  // Down Arrow
		  If Keyboard.AsyncKeyDown( &h7D ) Then
		    If Selection > Thumbs.Ubound - MaxCols Then
		      'Selection = Thumbs.Ubound
		    Else
		      Selection = Selection + MaxCols
		    End If
		  End If
		  
		  // Right Arrow
		  If Keyboard.AsyncKeyDown( &h7C ) And Selection < Thumbs.Ubound Then Selection = Selection + 1
		  
		  // Left Arrow
		  If Keyboard.AsyncKeyDown( &h7B ) And Selection > 0 Then Selection = Selection - 1
		  
		  AdjustScrollBar()
		  
		  SelectionChanged Selection
		  Refresh
		  If   Keyboard.AsyncKeyDown( &h7E ) OR _
		    Keyboard.AsyncKeyDown( &h7D ) OR _
		    Keyboard.AsyncKeyDown( &h7C ) OR _
		    Keyboard.AsyncKeyDown( &h7B ) Then
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AdjustScrollBar()
		  
		  If scrBar.Value + ( ( MaxRowsOnScreen - 1 ) * ( ThumbSize + 15 ) ) < ( Floor( Selection / MaxCols ) * ( ThumbSize + 15 ) ) Then
		    // Down
		    scrBar.Value = ( Floor( Selection / MaxCols ) * ( ThumbSize + 15 ) ) - Me.Height + ThumbSize + 20
		    'scrBar.Value = scrBar.Value - Me.Height + ( ThumbSize + 15 )
		  ElseIf scrBar.Value > Floor( Selection / MaxCols ) * ( ThumbSize + 15 ) Then
		    // Up
		    scrBar.Value =  Floor( Selection / MaxCols ) * ( ThumbSize + 15 )
		  End If
		  
		  
		  Return
		  
		  // Adjust ScrollBar
		  If scrBar.Value + ( MaxRowsOnScreen * ( ThumbSize + 15 ) ) < ( ( Selection + 1 ) / MaxCols ) * ( ThumbSize + 15 ) Then
		    // Down
		    scrBar.Value = scrBar.Value + ( ThumbSize + 15 )
		    'scrBar.Value = ( Selection / MaxCols ) * ( ThumbSize - 10 )
		  ElseIf scrBar.Value > ( ( Selection ) / MaxCols ) * ( ThumbSize + 15 ) Then
		    // Up
		    scrBar.Value = scrBar.Value - ( ThumbSize + 15 )
		    'scrBar.Value = ( Selection / MaxCols ) * ( ThumbSize + 20 )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetSelection(X as Integer, Y as Integer)
		  Dim ColumnSize as Integer = Width / ( MaxCols * ( ThumbSize + 15 ) )
		  Dim Column as Integer = (x-5) / ( ThumbSize + 15 )
		  Dim Row as Integer = ((Y-5) + scrBar.Value) / ( ThumbSize + 15 )
		  
		  Selection = ( Row * MaxCols )  + Column
		  'MsgBox Str( Column ) + " >= " + Str( MaxCols )
		  'If Selection > Thumbs.Ubound or Column > (MaxCols +1) Then Selection = -1
		  If Selection > Thumbs.Ubound Then Selection = -1
		  If Row > (MaxRows-1) Then Selection = -1
		  
		  SelectionChanged( Selection )
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DoubleClick(X as Integer, Y as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionChanged(Selection as Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		Dimensions() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Locations() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxCols As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxRows As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxRowsOnScreen As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Selection As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		Thumbs() As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		ThumbSize As Integer = 32
	#tag EndProperty


#tag EndWindowCode

#tag Events cvsPreview
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Background
		  g.ForeColor = &c929292
		  g.FillRect 0, 0, Width, Height
		  
		  If Thumbs.Ubound = -1 Then Return
		  
		  Dim ThumbLeft, ThumbTop, CurrentRow, ThumbPadding, CountMaxCols as Integer = 0
		  Dim CurrentColumn as Integer = -1
		  ThumbPadding = ThumbSize + 10
		  
		  'MaxCols = ( width - 5 ) / ( ThumbPadding + 10 ) - 1
		  'MaxRows = ( Thumbs.Ubound + 1 ) / MaxCols
		  
		  'scrBar.Maximum = ( MaxRows - 1 ) * ThumbPadding ' ( ( MaxRows - 1 ) * ( ThumbPadding + 10 ) ) + 10
		  
		  For i as Integer = 0 To Thumbs.Ubound
		    
		    'Dim Pic as Picture = ScaleImage( Thumbs(i), ThumbSize, ThumbSize, True )
		    
		    'Dim ScaledImage as Picture = ScaleImage( Thumbs(i), ThumbSize, ThumbSize, True )
		    'Dim Pic as New Picture( ScaledImage.Width, ScaledImage.Height, 32 )
		    'Pic.Graphics.DrawPicture Thumbs(i), 0, 0, Pic.Width, Pic.Height, 0, 0, Thumbs(i).Width, Thumbs(i).Height
		    
		    'Dim Factor as Double = Min( ThumbSize / Thumbs(i).Width, ThumbSize / Thumbs(i).Height ) // Scale both
		    'Dim Pic as New Picture(ThumbSize * Factor, ThumbSize * Factor, 32)
		    'Pic.Graphics.DrawPicture Thumbs(i), 0, 0, Pic.Width, Pic.Height, 0, 0, Thumbs(i).Width, Thumbs(i).Height
		    
		    CurrentColumn = CurrentColumn + 1
		    
		    If Thumbleft + ( 2 * ( 5 + ThumbPadding ) ) + 15 >= Width And i > 0 Then
		      'If CurrentColumn > MaxCols Then
		      If CurrentColumn > CountMaxCols Then CountMaxCols = CurrentColumn
		      CurrentColumn = 0
		      CurrentRow = CurrentRow + 1
		    End If
		    
		    ThumbLeft = 5 + ( ( 5 + ThumbPadding ) * CurrentColumn )
		    ThumbTop = 5 + ( ( 5 + ThumbPadding ) * CurrentRow )
		    
		    If i <> Selection Then
		      // Draw Thumb BG + Padding
		      g.ForeColor = &cA2A2A2
		      g.FillRect ThumbLeft, ThumbTop - scrBar.Value, ThumbPadding, ThumbPadding
		      
		      g.ForeColor = &c303030
		      g.DrawRect ThumbLeft, ThumbTop - scrBar.Value, ThumbPadding, ThumbPadding
		      
		    ElseIf i = Selection Then
		      // Draw Selection BG
		      g.DrawGradient( &c3E3E3E, &c6E6E6E, ThumbLeft, ThumbTop - scrBar.Value, ThumbPadding, ThumbPadding - 1 )
		      
		      g.ForeColor = &cFFFFFF
		      g.DrawRect ThumbLeft, ThumbTop - scrBar.Value, ThumbPadding, ThumbPadding
		    End If
		    
		    'Dim ScaledImage as Picture = ScaleImage( Thumbs(i), ThumbSize, ThumbSize, True )
		    Dim ScaleWidth, ScaleHeight as Double
		    ScaleWidth = ScaledDim( Thumbs(i), ThumbSize, ThumbSize, True, True )
		    ScaleHeight = ScaledDim(  Thumbs(i), ThumbSize, ThumbSize, False, True )
		    
		    g.ScaleImage Thumbs(i), ScaleWidth, ScaleHeight, _
		    ThumbLeft + ( ThumbPadding / 2 ) - ( ScaleWidth / 2 ), _
		    ThumbTop + ( ThumbPadding  / 2 ) - ( ScaleHeight / 2 ) - scrBar.Value, _
		    False, True, True
		    
		    'g.DrawPicture Thumbs(i), _
		    'ThumbLeft + ( ThumbPadding / 2 ) - ( ScaledImage.Width / 2 ), _
		    'ThumbTop + ( ThumbPadding / 2 ) - ( ScaledImage.Height / 2 ) - scrBar.Value, _
		    'ScaledImage.Width, ScaledImage.Height, 0, 0, Thumbs(i).Width, Thumbs(i).Height
		    'ScaledImage = Nil
		    
		    'g.DrawPicture Pic, _
		    'ThumbLeft + (ThumbPadding / 2 ) - ( Pic.Width / 2 ), _
		    'ThumbTop + ( ThumbPadding / 2 ) - ( Pic.Height / 2 ) - scrBar.Value
		    
		    // Draw Dimensions
		    If Dimensions.Ubound = Thumbs.Ubound And ThumbSize >= 128 Then'And i <> Selection Then
		      g.TextSize = 10
		      
		      g.ForeColor = &cEEEEEE
		      g.FillRect ThumbLeft + 3, ThumbTop +4 - scrBar.Value, g.StringWidth( Dimensions(i) ) + 6, 12
		      
		      g.ForeColor = &c000000
		      g.DrawRect ThumbLeft + 3, ThumbTop +3 - scrBar.Value, g.StringWidth( Dimensions(i) ) + 6, 14
		      
		      g.DrawString Dimensions(i), ThumbLeft + 6, g.TextSize + ThumbTop + 4 - scrBar.Value, 96, True
		    End If
		    
		  Next
		  
		  MaxRowsOnScreen = (Height - 5) / ( ThumbPadding + 5 )
		  
		  MaxCols = CountMaxCols
		  MaxRows = Ceil( ( Thumbs.Ubound + 1 ) / MaxCols )
		  
		  Dim s as Integer = ( 5 + ( ( 5 + ThumbPadding ) * ( MaxRows - MaxRowsOnScreen ) ) )
		  If s > 0 And Thumbs.Ubound > MaxCols And MaxRows > 0 Then scrBar.Maximum = s Else scrBar.Maximum = 0
		  'scrBar.Maximum = ( 5 + ( ( 5 + ThumbPadding ) * ( MaxRows - MaxRowsOnScreen ) ) )'( MaxRows - 1 ) * ( ThumbPadding + 5 )
		  
		  g.ForeColor = RGB( 194, 194, 194 )
		  g.DrawLine 0, Me.Height - 1, Me.Width, Me.Height - 1
		  
		  'Window.Title = Str( MaxRowsOnScreen ) + " MROS - " + Str( MaxCols ) + " MaxCols - " + Str( MaxRows ) + " MaxRows - " +
		  'Window.Title = Str( Selection ) + " / " + Str( MaxCols ) + " = " + Str( Floor( Selection / MaxCols ) )
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If X < Width - 5 And X > 5 And _
		  Y < Height - 5 And Y > 5 Then _
		  GetSelection( X, Y ) Else Selection = -1
		  
		  AdjustScrollBar()
		  
		  Refresh
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If X < Width - 5 And X > 5 And _
		  Y < Height - 5 And Y > 5 Then _
		  GetSelection( X, Y ) Else Selection = -1
		  
		  AdjustScrollBar()
		  
		  Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  scrBar.Value = scrBar.Value + ( deltaY * 10 )
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  DoubleClick( X, Y )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scrBar
	#tag Event
		Sub ValueChanged()
		  cvsPreview.Reload
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
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
		Name="MaxCols"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxRows"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxRowsOnScreen"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Selection"
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
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ThumbSize"
		Group="Behavior"
		InitialValue="32"
		Type="Integer"
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
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior

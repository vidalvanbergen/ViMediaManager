#tag Class
Protected Class ActionBar
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If me.Enabled and me.Visible then
		    
		    If x > 0 and y > 0 and _
		      x < 24 and y < me.Height then
		      MinusPressed = True
		      me.Reload
		      Return True
		    End If
		    
		    If x > 25 and Y > 0 and _
		      x < 25 + 30 and y < me.Height then
		      ActionPressed = True
		      me.Reload
		      Return True
		    End If
		    
		    If x > me.Width - 20 and x < me.Width and _
		      y > 0 and y < me.Height then
		      mXAnchor = X
		      Return True
		    End If
		    
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If MinusPressed and _
		    x < 0 or x > 24 or _
		    y < 0 or y > me.Height then
		    MinusPressed = False
		    me.Reload
		  End If
		  
		  If ActionPressed and _
		    x < 25 or x > 30 + 25 or _
		    y < 0 or y > me.Height then
		    ActionPressed = False
		    me.Reload
		  End If
		  
		  if mXAnchor > -1 then Drag x - mXAnchor
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  MyWidth = me.Width
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If x < me.Width and x > ( me.Width - 20 ) and _
		    y < me.Height and y > 0 then
		    MouseCursor = System.Cursors.SplitterEastWest
		  Else
		    MouseCursor = System.Cursors.StandardPointer
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If MinusPressed and _
		    x > 0 and y > 0 and _
		    x < 24 and x < me.Height then
		    ActionMinus
		  End If
		  
		  If ActionPressed and _
		    x > 25 and Y > 0 and _
		    x < 25 + 30 and y < me.Height then
		    ActionMenu
		  End If
		  
		  ActionPressed = False
		  MinusPressed = False
		  
		  MyWidth = me.Width
		  
		  mXAnchor = -1
		  me.Reload
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Open()
		  
		  MyWidth = me.Width
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Top WhiteBG
		  g.ForeColor = &cFFFFFF
		  g.FillRect 0, 0, me.Width, (me.Height / 2)+1
		  
		  // Bottom SilverBG
		  g.ForeColor = &cF1F1F1
		  g.FillRect 0, me.Height / 2, me.Width, me.Height
		  
		  // Growth Slider
		  g.ForeColor = &c626262
		  g.DrawLine me.Width - 7, me.Height / 4, me.Width - 7, me.Height - ( me.Height / 4 )
		  g.DrawLine me.Width - 10, me.Height / 4, me.Width - 10, me.Height - ( me.Height / 4 )
		  g.DrawLine me.Width - 13, me.Height / 4, me.Width - 13, me.Height - ( me.Height / 4 )
		  
		  g.ForeColor = &cFFFFFF
		  g.DrawLine me.Width - 6, ( me.Height / 4 ) + 1, me.Width - 6, ( me.Height - ( me.Height / 4 ) ) + 1
		  g.DrawLine me.Width - 9, ( me.Height / 4 ) + 1, me.Width - 9, ( me.Height - ( me.Height / 4 ) ) + 1
		  g.DrawLine me.Width - 12, ( me.Height / 4 ) + 1, me.Width - 12, ( me.Height - ( me.Height / 4 ) ) + 1
		  
		  // Caption
		  If Text <> "" then
		    g.TextSize = 11
		    g.ForeColor = &cFFFFFF
		    g.DrawString Text, ( me.Width / 2 ) - ( g.StringWidth( Text ) / 2 ) + ( 45 / 2 ), ( me.height / 2 ) + 5
		    g.ForeColor = &c000000
		    g.DrawString Text, ( me.Width / 2 ) - ( g.StringWidth( Text ) / 2 ) + ( 45 / 2 ), ( me.height / 2 ) + 4
		  End If
		  
		  DrawMinusButton g
		  DrawActionButton g
		  
		  // Border
		  g.ForeColor = &cCACACA
		  g.DrawRect 0, 0, me.Width, me.Height
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AttachLeft(ctrl as RectControl)
		  mAttachedLeft.Append ctrl
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttachRight(ctrl as RectControl)
		  mAttachedRight.Append ctrl
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAttachments()
		  ReDim mAttachedLeft(-1)
		  ReDim mAttachedRight(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Drag(Distance as Integer)
		  If Distance + MyWidth > MinLeft and _'MyWidth + Distance > MinLeft and _
		    Distance + MinRight < me.Window.Width - ( me.Left + MyWidth ) then
		    
		    me.Width = MyWidth + Distance
		    
		    Dim i as integer
		    For i = 0 to mAttachedLeft.Ubound
		      mAttachedLeft(i).Width = MyWidth + Distance
		    Next
		    
		    For i = 0 to mAttachedRight.Ubound
		      mAttachedRight(i).Left = -1 + MyWidth + Distance
		      mAttachedRight(i).Width = 1 + me.Window.Width - ( MyWidth + Distance )
		    Next
		    
		    Moved( Distance )
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawActionButton(g as Graphics)
		  If ActionPressed then
		    // Top Half
		    g.ForeColor = &ca2a2a2
		    g.FillRect 25, 0, 30, me.Height / 2
		    
		    // Bottom Half
		    g.ForeColor = &c979797
		    g.FillRect 25, 24 / 2, 30, me.Height
		  Else
		    // Top WhiteBG
		    g.ForeColor = &cFFFFFF
		    g.FillRect 25, 0, 30, me.Height / 2
		    
		    // Bottom SilverBG
		    g.ForeColor = &cF1F1F1
		    g.FillRect 25, 24 / 2, 30, me.Height
		  End If
		  
		  g.DrawPicture ActionWidget, 30, 2
		  
		  g.ForeColor = &cCACACA
		  g.DrawLine 5 + 25 + 24, 0, 5 + 25 + 24, me.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawMinusButton(g as Graphics)
		  If MinusPressed then
		    // Top Half
		    g.ForeColor = &ca2a2a2
		    g.FillRect 0, 0, 24, me.Height / 2
		    
		    // Bottom Half
		    g.ForeColor = &c979797
		    g.FillRect 0, 24 / 2, 24, me.Height
		  Else
		    // Top WhiteBG
		    g.ForeColor = &cFFFFFF
		    g.FillRect 0, 0, 24, me.Height / 2
		    
		    // Bottom SilverBG
		    g.ForeColor = &cF1F1F1
		    g.FillRect 0, 24 / 2, 24, me.Height
		  End If
		  
		  g.ForeColor = &c484848
		  g.DrawLine 24 / 3.4, ( me.Height / 2 ) - 1, 24 - ( 24 / 3.4 ), ( me.Height / 2 ) - 1
		  g.DrawLine 24 / 3.4, ( me.Height / 2 ),     24 - ( 24 / 3.4 ), ( me.Height / 2 )
		  
		  If MinusPressed then g.ForeColor = &cA2A2A2 else g.ForeColor = &cFFFFFF
		  g.DrawLine 24 / 3.4, ( me.Height / 2 ) + 1,     24 - ( 24 / 3.4 ), ( me.Height / 2 ) + 1
		  
		  g.ForeColor = &cCACACA
		  g.DrawLine 24, 0, 24, me.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextValue(TextStr as String)
		  Text = TextStr
		  Refresh
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ActionMenu()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ActionMinus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Moved(Distance as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h21
		Private ActionPressed As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAttachedLeft() As RectControl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAttachedRight() As RectControl
	#tag EndProperty

	#tag Property, Flags = &h0
		MinLeft As Integer = 175
	#tag EndProperty

	#tag Property, Flags = &h0
		MinRight As Integer = 50
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MinusPressed As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mXAnchor As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MyWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Text As String = "## Items"
	#tag EndProperty


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
			InitialValue="25"
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
			Group="Initial State"
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
			Name="MinLeft"
			Visible=true
			Group="Behavior"
			InitialValue="150"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinRight"
			Visible=true
			Group="Behavior"
			InitialValue="50"
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
			Name="Text"
			Group="Behavior"
			InitialValue="## Items"
			Type="String"
			EditorType="MultiLineEditor"
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
			InitialValue="175"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

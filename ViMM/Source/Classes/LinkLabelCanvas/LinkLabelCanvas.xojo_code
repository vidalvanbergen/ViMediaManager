#tag Class
Protected Class LinkLabelCanvas
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If IsContextualClick then
		    Dim base as new MenuItem
		    base.Append new MenuItem ( Menu.CMMCopyLink )
		    Dim HitItem as MenuItem = base.PopUp
		    If HitItem <> Nil and HitItem.Text = Menu.CMMCopyLink then
		      Dim c as new Clipboard
		      c.Text = URL
		    end if
		  Else
		    MyState = 2
		    me.Reload
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If x < 0 or x > me.Width or _
		    y < 0 or y > me.Height then
		    MyState = 0
		    me.Reload
		  ElseIf x > 0 or x < me.Width or y > 0 or y < me.Height then
		    MyState = 2
		    me.Reload
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  MyState = 1
		  me.Reload
		  MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  MyState = 0
		  me.Reload
		  MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If X > 0 and Y > 0 and X < StringWidth + 5 and Y < 20 then
		    MyState = 1
		    me.Reload
		    
		    ShowURL URL
		  Else
		    MyState = 0
		    me.Reload
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'Width = 20 + 5 + Graphics.StringWidth( Text ) + 10
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if StringWidth  <= 0 then StringWidth = 20 + 5 + g.StringWidth( Text ) + 5
		  if StringHeight <= 0 then StringHeight = g.StringHeight( Text, StringWidth )
		  
		  g.AntiAlias = True
		  
		  Select case MyState
		    // Normal
		  case 0
		    g.Bold = False
		    g.DrawPicture HelpInactiveArrow, 2, 2
		    
		    if globals.IsDarkMode then
		      g.ForeColor = &cFFFFFF
		    else
		      g.ForeColor = &c000000
		    end if
		    g.DrawString Text, 25, StringHeight - 1
		    
		    
		    // Hover
		  case 1
		    g.Bold = True
		    g.ForeColor = &cA9A9A9
		    g.FillRoundRect 0, 0, 20 + 5 + g.StringWidth( Text ) + 10, 20, 20, 20
		    g.DrawPicture HelpActiveArrow, 2, 2
		    
		    g.ForeColor = &c000000
		    g.DrawString Text, 25, StringHeight
		    g.ForeColor = &cFFFFFF
		    g.DrawString Text, 25, StringHeight - 1
		    
		    // Pressed
		  case 2
		    g.Bold = True
		    g.ForeColor = &c858585
		    g.FillRoundRect 0, 0, 20 + 5 + g.StringWidth( Text ) + 10, 20, 20, 20
		    g.DrawPicture HelpActiveArrow, 2, 2
		    
		    g.ForeColor = &c000000
		    g.DrawString Text, 25, StringHeight
		    g.ForeColor = &cFFFFFF
		    g.DrawString Text, 25, StringHeight - 1
		  End Select
		  
		  Self.Width = 20 + 5 + g.StringWidth( Text ) + 10
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h0
		MyState As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StringHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StringWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Text As String
	#tag EndProperty

	#tag Property, Flags = &h0
		URL As String = "http://"
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
			InitialValue="20"
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
			Name="MyState"
			Group="Link"
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
			Name="StringHeight"
			Group="Link"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringWidth"
			Group="Link"
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
			Name="Text"
			Visible=true
			Group="Link"
			InitialValue="Link"
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
			Name="URL"
			Visible=true
			Group="Link"
			InitialValue="http://"
			Type="String"
			EditorType="MultiLineEditor"
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
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

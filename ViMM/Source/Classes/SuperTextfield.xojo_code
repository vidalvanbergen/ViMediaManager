#tag Class
Protected Class SuperTextfield
Inherits Textfield
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  If obj.TextAvailable Then SelText = obj.Text
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Supress = (Chr(8) = Key)
		  
		  Return KeyDown( Key )
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If NOT TargetCocoa And ( IsContextualClick Or ( TargetMacOS And Keyboard.AsyncControlKey ) ) then
		    ContextualMenu
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  AcceptTextDrop
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub TextChange()
		  TextChange()
		  
		  // Don't try to AutoComplete if there's no text or if we're trying to suppress AutoComplete
		  If NOT AutoComplete OR Text.Len = 0 OR Supress then Return
		  
		  // See if the current text matches part of a word in 'Words' array
		  Dim Word, Low as String
		  Dim Lenght as Integer = Text.Len
		  
		  For Each Word In Words
		    Low = Word.Lowercase
		    
		    // Check every word in our list to see if it matches
		    If Left( Low, Lenght ) = Text.Lowercase Then
		      Text = Word // Set the word
		      
		      // Select the part that hasn't been typed yet
		      SelStart = Lenght
		      SelLength = ( Text.Len - Lenght )
		      Return
		    End If
		    
		  Next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ContextualMenu()
		  Dim base as new MenuItem
		  
		  // Create menu
		  base.Append New MenuItem(menu.EditCut)
		  base.Append New MenuItem(menu.EditCopy)
		  base.Append New MenuItem(menu.EditPaste)
		  base.Append New MenuItem(menu.EditDelete)
		  base.Append New MenuItem("-")
		  base.Append New MenuItem(menu.EditSelectAll)
		  
		  // Set menu item names
		  base.Item(0).Name = "Cut"
		  base.Item(1).Name = "Copy"
		  base.Item(2).Name = "Paste"
		  base.Item(3).Name = "Delete"
		  base.Item(5).Name = "SelectAll"
		  
		  // Cut enabler
		  base.Item(0).Enabled = SelLength > 0 And ReadOnly = False
		  // Copy enabler
		  base.Item(1).Enabled = SelLength > 0
		  // Paste enabler
		  base.Item(2).Enabled = ReadOnly = False
		  // Delete enabler
		  base.Item(3).Enabled = base.Item(0).Enabled
		  // Select all enabler
		  base.Item(5).Enabled = len( Text ) > 0
		  
		  
		  // Show menu
		  Dim hitItem as MenuItem
		  hitItem = base.PopUp
		  
		  If hitItem = Nil then Return
		  
		  // Actions
		  Dim item as String = hitItem.Name
		  
		  Select case item
		    
		  Case "Cut"
		    Copy
		    SelText = ""
		  Case "Copy"
		    Copy
		  Case "Paste"
		    Paste
		  Case "Delete"
		    SelText = ""
		  Case "SelectAll"
		    SelectAll
		    
		  End Select
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event KeyDown(Key as String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChange()
	#tag EndHook


	#tag Property, Flags = &h0
		AutoComplete As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Supress As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Words(-1) As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoComplete"
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
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
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
			Name="CueText"
			Visible=true
			Group="Initial State"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
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
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LimitText"
			Visible=true
			Group="Behavior"
			InitialValue="0"
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
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
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
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
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
			InitialValue="80"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

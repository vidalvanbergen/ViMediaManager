#tag Class
Protected Class MyHierListBox
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  
		  If Me.Active AND Me.Enabled Then
		    g.ForeColor = RGB( 232, 232, 232 )
		  Else
		    g.ForeColor = RGB( 255, 255, 255 )
		  End If
		  
		  If row < Me.ListCount And Me.RowTag( row ) = "Folder" Then
		    g.DrawGradient( rgb(255, 255, 255), rgb(230, 230, 230), 0, 0, g.Width, g.Height )
		  Else
		    g.FillRect 0, 0, g.Width, g.Height
		  End If
		  
		  If row < Me.ListCount Then
		    g.ForeColor = RGB( 214, 214, 214 )
		    g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		    
		    g.ForeColor = RGB( 255, 255, 255 )
		    g.DrawLine 0, 0, g.Width, 0
		  End If
		  
		  // Selection Gradient
		  If Row > -1 And Me.Selected( row ) Then g.DrawGradient( RGB(115, 176, 227), RGB( 71, 131, 208), 0, 0, g.Width, g.Height )
		  
		  
		  // Folder Shadow
		  If Row < Me.ListCount - 1 And row > 0 And Me.RowTag( row - 1 ) = "Folder" And Me.Expanded( row - 1 ) And Me.RowTag( row ) <> "Folder" Then 'And NOT Me.Selected( row ) Then
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .25 ) Else g.ForeColor = RGBa( 0, 0, 0, .35 )
		    g.DrawLine 0, 0, g.Width, 0
		    
		    g.ForeColor = RGBa( 0, 0, 0, .15 )
		    g.DrawLine 0, 1, g.Width, 1
		    
		    g.ForeColor = RGBa( 0, 0, 0, .05 )
		    g.DrawLine 0, 2, g.Width, 2
		  End If
		  
		  
		  // Movie Icon
		  If row < Me.ListCount And Me.RowTag( row ) <> "Folder" Then
		    
		    If App.ScalingFactor = 2 Then
		      g.DrawPicture miniconmovieII2x, 10, ( g.Height / 2 ) - ( 17 / 2 ) + 1, 14, 17,   0, 0, miniconmovieII2x.Width, miniconmovieII2x.Height
		    Else
		      g.DrawPicture miniconmovieII,   10, ( g.Height / 2 ) - ( 17 / 2 ) + 1
		    End If
		  End If
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  g.Transparency = 60
		  If Me.Selected( row ) Then g.ForeColor = &c000000 Else  g.ForeColor = &cFFFFFF
		  g.DrawString Me.Cell( row, column ), 0, ( g.Height / 2 ) + ( g.TextSize / 2 ), g.Width, True
		  
		  
		  g.Transparency = 0
		  If Me.Selected( row ) Then g.ForeColor = &cFFFFFF Else g.ForeColor = &c333333
		  g.DrawString Me.Cell( row, column ), 0, ( g.Height / 2 ) + ( g.TextSize / 2 ) - 1, g.Width, True
		  
		  Return True
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddParent(Text As String)
		  Dim Title as String = Trim( Text )
		  If Title = "" Then Return
		  
		  // Don't add if another folder with the same name exists.
		  'Dim AlreadyExists as Boolean = False
		  'For i as Integer = 0 to ListCount - 1
		  'If RowTag(i) = "Folder" and Cell( i, 0 ) = Trim( Text ) Then AlreadyExists = True
		  'Next
		  'If AlreadyExists Then Return
		  
		  // Add Folder
		  AddFolder( Trim( Text ) )
		  RowTag( LastIndex )      = "Folder"
		  RowPicture( LastIndex )  = FolderIcon
		  CellBold( LastIndex, 0 ) = True
		  'Expanded( LastIndex )    = True
		  'lstSets.CellType(  lstSets.LastIndex, 0) = lstSets.TypeEditable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AllExpanded(Value as Boolean)
		  For i as Integer = Me.ListCount - 1 DownTo 0
		    If Me.RowTag( i ) = "Folder" Then Me.Expanded( i ) = Value
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextParentIndex(CurrentIndex as Integer) As Integer
		  Dim NextParent as Integer
		  For i as Integer = Me.ListCount - 1 DownTo CurrentIndex + 1
		    If Me.RowTag(i) = "Folder" Then NextParent = i
		  Next
		  
		  If NextParent < CurrentIndex Then NextParent = Me.ListCount
		  Return NextParent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentIndex(CurrentIndex as Integer) As Integer
		  For i as Integer = CurrentIndex DownTo 0
		    If Me.RowTag( i ) = "Folder" Then Return i
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFolder(ParentFolderIndex as Integer)
		  Dim NextFolderIndex as Integer
		  
		  For i as Integer = Me.ListCount - 1 DownTo ParentFolderIndex + 1
		    If Me.RowTag(i) = "Folder" Then NextFolderIndex = i
		  Next
		  
		  If NextFolderIndex <= 0 Then NextFolderIndex = Me.ListCount
		  
		  For i as Integer = NextFolderIndex - 1 DownTo ParentFolderIndex
		    Me.RemoveRow(i)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowHeight() As Integer
		  If DefaultRowHeight > 0 Then
		    Return DefaultRowHeight
		  ElseIf TextSize = 12 or TextSize = 13 Then
		    Return 18
		  Else
		    Return TextSize * 1.5
		  End If
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CellTextChanged(NewText as String, Row as Integer, Column as Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		FolderIcon As Picture
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
			Name="FolderIcon"
			Group="Behavior"
			Type="Picture"
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

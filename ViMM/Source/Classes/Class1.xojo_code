#tag Class
Protected Class Class1
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  PaintBG_Striped( g, row )
		  
		  If Me.selected( row ) Then
		    'g.ForeColor = RGBa( 85, 85, 95 )
		    'g.FillRect( 0, 0, g.Width, g.Height )
		    g.DrawGradient( RGBa( 85, 85, 95 ), RGBa( 90, 90, 100 ), 0, 0, g.Width, g.Height )
		    
		  End If
		  
		  Return True
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub PaintBG_Folder(g as Graphics, row as Integer)
		  'If row >= Me.ListCount Then Return
		  'If Me.RowTag( row ) <> "Folder" Then Return
		  
		  
		  // Folder BG
		  If row < Me.ListCount And Me.RowTag( row ) = "Folder" Then
		    
		    Dim StartColor, StopColor as Color
		    
		    If Me.Selected( row ) Then
		      StartColor = RGBa( 80, 80, 80 )
		      StopColor  = RGBa( 70, 70, 70 )
		    Else
		      StartColor = RGBa( 100, 100, 100 )
		      If Me.Active Then StopColor  = RGBa(  90,  90,  90 ) Else StopColor = RGBa( 96, 96, 96 )
		    End If
		    
		    g.DrawGradient( StartColor, StopColor, 0, 0, g.Width, g.Height )
		    
		    // Transparent white top border
		    If Me.Selected( row ) Then
		      g.ForeColor = RGBa( 100, 100, 100, .70 )
		      g.DrawLine( 0, 0, g.Width, 0 )
		    End If
		    
		  End If
		  
		  
		  // Folder shadow
		  If Row < Me.ListCount - 1 And row > 0 And _
		    Me.RowTag( row - 1 ) = "Folder" And Me.Expanded( row - 1 ) And Me.RowTag( row ) <> "Folder" Then
		    If Me.Selected( row ) Then g.ForeColor = RGBa( 0, 0, 0, .25 ) Else g.ForeColor = RGBa( 0, 0, 0, .35 )
		    g.DrawLine 0, 0, g.Width, 0
		    
		    g.ForeColor = RGBa( 0, 0, 0, .15 )
		    g.DrawLine 0, 1, g.Width, 1
		    
		    g.ForeColor = RGBa( 0, 0, 0, .05 )
		    g.DrawLine 0, 2, g.Width, 2
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PaintBG_Item(g as Graphics, row as Integer)
		  If row >= Me.ListCount Then Return
		  
		  If Me.Active AND Me.Enabled Then
		    g.ForeColor = RGBa( 91, 91, 91 )
		  Else
		    g.ForeColor = RGBa( 96, 96, 96 )
		  End If
		  
		  g.FillRect 0, 0, g.Width, g.Height
		  
		  // Border top
		  g.ForeColor = RGBa( 100, 100, 100 )
		  g.DrawLine 0, 0, g.Width, 0
		  
		  // Border bottom
		  g.ForeColor = RGB( 84, 84, 84 )
		  g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PaintBG_Selection(g as Graphics, row as Integer)
		  'If Me.ListIndex < 0 And row >= Me.ListCount Then Return
		  If Me.ListIndex = -1 Then Return
		  
		  Dim StartColor, StopColor as Color
		  
		  // Draw Selection
		  If NOT Me.Active OR NOT me.Enabled then
		    StartColor        = RGBa( 73, 77, 87 )
		    StopColor         = RGBa( 60, 66, 78 )
		  Else
		    StartColor        = RGBa( 45, 69, 89 )
		    StopColor         = RGBa( 28, 51, 82 )
		  End If
		  
		  g.DrawGradient( StartColor, StopColor, 0, 0, g.Width, g.Height )
		  
		  // Top HiLite Color
		  g.ForeColor = RGBa( 100, 100, 100, .25 )
		  g.DrawLine 0, 1, g.Width, 1
		  
		  // Top Border Color
		  g.ForeColor = RGBa(   0,   0,   0,  .05 )
		  g.DrawLine 0, 0, g.Width, 0
		  
		  // Bottom Border Color
		  g.ForeColor = RGBa(   0,   0,   0, .10 )
		  g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PaintBG_Striped(g as Graphics, row as Integer)
		  If row >= Me.ListCount Then Return
		  If Me.Selected( row ) Then Return
		  
		  // Draw Alternating
		  If row mod 2 = 0 then
		    g.ForeColor = RGB( 255, 255, 255 )
		  Else
		    g.ForeColor = RGB( 237, 243, 254 )
		  End If
		  
		  g.FillRect( 0, 0, g.Width, g.Height )
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AlternatingRows As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemRows As Boolean = False
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlternatingRows"
			Group="Behavior"
			InitialValue="False"
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
			Name="ItemRows"
			Group="Behavior"
			InitialValue="False"
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

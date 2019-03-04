#tag Class
Protected Class AddRemoveButton
Inherits SegmentedControl
	#tag Event
		Sub Action(itemIndex as integer)
		  if itemIndex = 0 then
		    RaiseEvent ActionAdd
		  elseif itemIndex = 1 then
		    RaiseEvent ActionRemove
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused base
		  #pragma Unused x
		  #pragma Unused y
		  
		  '
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  #pragma Unused hitItem
		  
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  'self.SegmentStyle = SegmentedControlExtension.NSSegmentStyle.SmallSquare
		  
		  #if TargetMacOS then
		    self.ImageForSegment(0) = NSImage.AddTemplate
		    self.ImageForSegment(0).Template = True
		    self.LabelForSegment(0) = ""
		    
		    self.ImageForSegment(1) = NSImage.RemoveTemplate
		    self.ImageForSegment(1).Template = True
		    self.LabelForSegment(1) = ""
		    
		    self.RemoveEnabled = False
		  #endif
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event ActionAdd()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ActionRemove()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.EnabledForSegment(0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  self.EnabledForSegment(0) = Value
			End Set
		#tag EndSetter
		AddEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.EnabledForSegment(1)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  self.EnabledForSegment(1) = Value
			End Set
		#tag EndSetter
		RemoveEnabled As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AddEnabled"
			Group="Behavior"
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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="24"
			Type="Integer"
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
			Name="MacControlStyle"
			Visible=true
			Group="Appearance"
			InitialValue="6"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Automatic"
				"1 - Capsule"
				"2 - Round Rect"
				"3 - Rounded"
				"4 - Textured Rounded"
				"5 - Textured Square"
				"6 - Small Square"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoveEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Segments"
			Visible=true
			Group="Appearance"
			InitialValue="\r"
			Type="String"
			EditorType="SegmentEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Appearance"
			InitialValue="2"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
				"2 - None"
			#tag EndEnumValues
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
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
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
			InitialValue="48"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

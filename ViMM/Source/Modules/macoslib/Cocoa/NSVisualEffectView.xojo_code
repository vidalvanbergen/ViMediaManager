#tag Class
Class NSVisualEffectView
Inherits NSView
	#tag Method, Flags = &h0
		Sub Constructor(frameRect as Cocoa.NSRect)
		  
		  #if TargetCocoa then
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as Cocoa.NSRect) as Ptr
		    
		    super.Constructor( initWithFrame( Initialize(Allocate(Cocoa.NSClassFromString("NSVisualEffectView"))), frameRect ), not hasOwnership )
		  #else
		    #pragma Unused frameRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(x as integer, y as integer, width as integer, height as integer)
		  
		  #if TargetCocoa then
		    dim frameRect as Cocoa.NSRect
		    frameRect.x = x
		    frameRect.y = y
		    frameRect.w = width
		    frameRect.h = height
		    
		    self.Constructor( frameRect )
		  #else
		    #pragma unused x
		    #pragma unused y
		    #pragma unused width
		    #pragma unused height
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As ptr
		  Return self.id
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  #if TargetCocoa then
			    declare sub setBlendingMode lib CocoaLib selector "setBlendingMode:" (id as ptr, mode as NSBlendingMode)
			    setBlendingMode(self,value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		blendingMode As NSBlendingMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  #if TargetCocoa then
			    declare sub setMaterial lib CocoaLib selector "setMaterial:" (id as ptr, mode as NSMaterial)
			    setMaterial(self,value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		material As NSMaterial
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  #if TargetCocoa then
			    declare sub setState lib CocoaLib selector "setState:" (id as ptr, mode as NSState)
			    setState(self,value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		state As NSState
	#tag EndComputedProperty


	#tag Enum, Name = NSBlendingMode, Type = Integer, Flags = &h0
		BehindWindow = 0
		WithinWindow = 1
	#tag EndEnum

	#tag Enum, Name = NSMaterial, Type = Integer, Flags = &h0
		AppearanceBased = 0
		  Light = 1
		  Dark = 2
		Titlebar = 3
	#tag EndEnum

	#tag Enum, Name = NSState, Type = Integer, Flags = &h0
		FollowsWindowActiveState = 0
		  Active = 1
		Inactive = 2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoresizingMask"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="blendingMode"
			Group="Behavior"
			Type="NSBlendingMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - BehindWindow"
				"1 - WithinWindow"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BoundsRotation"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeKeyView"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDraw"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDrawConcurrently"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FocusRingType"
			Group="Behavior"
			Type="NSFocusRingType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - Exterior"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrameRotation"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hidden"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HiddenOrHasHiddenAncestor"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InLiveResize"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsInFullScreenMode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsOpague"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRotatedFromBase"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRotatedOrScaledFromBase"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="material"
			Group="Behavior"
			Type="NSMaterial"
			EditorType="Enum"
			#tag EnumValues
				"0 - AppearanceBased"
				"1 - Light"
				"2 - Dark"
				"3 - Titlebar"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NeedsDisplay"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PostsBoundsChangedNotifications"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PostsFrameChangedNotifications"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreservesContentDuringLiveResize"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShouldDrawColor"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="state"
			Group="Behavior"
			Type="NSState"
			EditorType="Enum"
			#tag EnumValues
				"0 - FollowsWindowActiveState"
				"1 - Active"
				"2 - Inactive"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tag"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WantsDefaultClipping"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WantsLayer"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

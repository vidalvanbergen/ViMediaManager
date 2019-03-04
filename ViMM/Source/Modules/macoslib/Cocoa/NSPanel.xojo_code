#tag Class
Class NSPanel
Inherits NSWindow
	#tag Method, Flags = &h1000
		Sub Constructor(contentRect as Cocoa.NSRect, windowStyle as UInt32, bufferingType as NSBackingStoreType, deferCreation as Boolean)
		  
		  #if TargetCocoa
		    declare function initWithContentRect lib CocoaLib selector "initWithContentRect:styleMask:backing:defer:" _
		    (obj_id as Ptr, contentRect as Cocoa.NSRect, windowStyle as UInt32, bufferingType as NSBackingStoreType, deferCreation as Boolean) as Ptr
		    
		    super.Constructor(initWithContentRect(Allocate("NSPanel"), contentRect, windowStyle, bufferingType, deferCreation), NSWindow.hasOwnership)
		    
		  #else
		    #pragma unused contentRect
		    #pragma unused windowStyle
		    #pragma unused bufferingType
		    #pragma unused deferCreation
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(contentRect as Cocoa.NSRect, windowStyle as UInt32, bufferingType as NSBackingStoreType, deferCreation as Boolean, aScreen as NSScreen)
		  
		  #if TargetCocoa
		    declare function initWithContentRect lib CocoaLib selector "initWithContentRect:styleMask:backing:defer:screen:" _
		    (obj_id as Ptr, contentRect as Cocoa.NSRect, windowStyle as UInt32, bufferingType as NSBackingStoreType, deferCreation as Boolean, aScreen as Ptr) as Ptr
		    
		    dim screenRef as Ptr
		    if aScreen <> nil then
		      screenRef = aScreen
		    end if
		    
		    super.Constructor(initWithContentRect(Allocate("NSPanel"), contentRect, windowStyle, bufferingType, deferCreation, screenRef), NSWindow.hasOwnership)
		    
		  #else
		    #pragma unused contentRect
		    #pragma unused windowStyle
		    #pragma unused bufferingType
		    #pragma unused deferCreation
		    #pragma unused aScreen
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getBecomesKeyOnlyIfNeeded lib CocoaLib selector "becomesKeyOnlyIfNeeded" (obj_id as Ptr) as Boolean
			    
			    return getBecomesKeyOnlyIfNeeded( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setBecomesKeyOnlyIfNeeded lib CocoaLib selector "setBecomesKeyOnlyIfNeeded:" (obj_id as Ptr, value as Boolean)
			    
			    setBecomesKeyOnlyIfNeeded self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		BecomesKeyOnlyIfNeeded As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getIsFloatingPanel lib CocoaLib selector "isFloatingPanel" (obj_id as Ptr) as Boolean
			    
			    return getIsFloatingPanel( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setFloatingPanel lib CocoaLib selector "setFloatingPanel:" (obj_id as Ptr, value as Boolean)
			    
			    setFloatingPanel self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		FloatingPanel As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getWorksWhenModal lib CocoaLib selector "worksWhenModal" (obj_id as Ptr) as Boolean
			    
			    return getWorksWhenModal( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setWorksWhenModal lib CocoaLib selector "setWorksWhenModal:" (obj_id as Ptr, value as Boolean)
			    
			    setWorksWhenModal self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		WorksWhenModal As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptsMouseMovedEvents"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsConcurrentViewDrawing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsToolTipsWhenApplicationIsInactive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlphaValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AnimationBehavior"
			Group="Behavior"
			Type="NSWindowAnimationBehavior"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSWindowAnimationBehaviorDefault"
				"2 - NSWindowAnimationBehaviorNone"
				"3 - NSWindowAnimationBehaviorDocumentWindow"
				"4 - NSWindowAnimationBehaviorUtilityWindow"
				"5 - NSWindowAnimationBehaviorAlertPanel"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AreCursorRectsEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Autodisplay"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutorecalculatesKeyViewLoop"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackingLocation"
			Group="Behavior"
			Type="NSWindowBackingLocation"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSWindowBackingLocationDefault"
				"1 - NSWindowBackingLocationVideoMemory"
				"2 - NSWindowBackingLocationMainMemory"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackingScaleFactor"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackingType"
			Group="Behavior"
			Type="NSBackingStoreType"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSBackingStoreRetained"
				"1 - NSBackingStoreNonretained"
				"2 - NSBackingStoreBuffered"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BecomesKeyOnlyIfNeeded"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeKeyWindow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeMainWindow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeVisibleWithoutLogin"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanHide"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanJoinAllSpaces"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanStoreColor"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CollectionBehavior"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DepthLimit"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplaysWhenScreenProfileChanges"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DocumentEdited"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DynamicDepthLimit"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FloatingPanel"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrameAutosaveName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrameString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullscreenAllowed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullscreenAllowedAuxiliary"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullSizeContentView"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GState"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasShadow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HidesOnDeactivate"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoresCycle"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoresMouseEvents"
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
			Name="IsDocumentEdited"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsExcludedFromWindowsMenu"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlushWindowDisabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFullscreen"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsKeyWindow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsMainWindow"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsMiniaturized"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsMovable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsOnActiveSpace"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsOpaque"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsReleasedWhenClosed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRestorable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsSheet"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsVisible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsZoomed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyViewSelectionDirection"
			Group="Behavior"
			Type="NSSelectionDirection"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSDirectSelection"
				"1 - NSSelectingNext"
				"2 - NSSelectingPrevious"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Managed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MiniwindowTitle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MovableByBackground"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MoveToActiveSpace"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OneShot"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ParticipatesInCycle"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferredBackingLocation"
			Group="Behavior"
			Type="NSWindowBackingLocation"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSWindowBackingLocationDefault"
				"1 - NSWindowBackingLocationVideoMemory"
				"2 - NSWindowBackingLocationMainMemory"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreservesContentDuringLiveResize"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreventsAppTerminationWhenModal"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RepresentedFilename"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SharingType"
			Group="Behavior"
			Type="NSWindowSharingType"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSWindowSharingNone"
				"1 - NSWindowSharingReadOnly"
				"2 - NSWindowSharingReadWrite"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsResizeIndicator"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsToolbarButton"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Stationary"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StyleMask"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TitlebarAppearsTransparent"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transient"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ViewsNeedDisplay"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowLevel"
			Group="Behavior"
			Type="NSWindowLevel"
			EditorType="Enum"
			#tag EnumValues
				"4 - NSNormalWindowLevel"
				"5 - NSFloatingWindowLevel"
				"6 - NSSubmenuWindowLevel"
				"6 - NSTornOffMenuWindowLevel"
				"8 - NSMainMenuWindowLevel"
				"9 - NSStatusWindowLevel"
				"10 - NSModalPanelWindowLevel"
				"11 - NSPopUpMenuWindowLevel"
				"13 - NSScreenSaverWindowLevel"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowTitleVisibility"
			Group="Behavior"
			Type="NSWindowTitleVisibility"
			EditorType="Enum"
			#tag EnumValues
				"0 - Visible"
				"1 - Hidden"
				"2 - HiddenWhenActive"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="WorksWhenModal"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

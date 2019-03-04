#tag Class
Class NSWindowController
Inherits NSResponder
	#tag Method, Flags = &h0
		Sub Close()
		  
		  #if TargetCocoa then
		    declare sub close lib CocoaLib selector "close" (obj_id as Ptr)
		    
		    close self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(w as NSWindow)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(obj_id as Ptr, hasOwnership as Boolean = false) -- From NSObject
		  
		  #if TargetCocoa then
		    declare function initWithWindow lib CocoaLib selector "initWithWindow:" (obj_id as Ptr, aWindow as Ptr) as Ptr
		    
		    Super.Constructor( initWithWindow( Initialize(Allocate(Cocoa.NSClassFromString("NSWindowController"))), w ), not self.hasOwnership )
		    
		  #else
		    #pragma unused w
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DocumentEdited(Assigns value as Boolean)
		  
		  #if TargetCocoa then
		    declare sub setDocumentEdited lib CocoaLib selector "setDocumentEdited:" (obj_id as Ptr, value as Boolean)
		    
		    setDocumentEdited self, value
		  #else
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowWindow()
		  
		  #if TargetCocoa then
		    declare sub showWindow lib cocoalib selector "showWindow:" (obj_id as Ptr)
		    
		    showWindow self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SynchronizeWindowTitleWithDocumentName()
		  
		  #if TargetCocoa then
		    declare sub synchronizeWindowTitleWithDocumentName lib CocoaLib selector "synchronizeWindowTitleWithDocumentName" (obj_id as Ptr)
		    
		    synchronizeWindowTitleWithDocumentName self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WindowTitleForDocumentDisplayName(displayName as NSString) As NSString
		  
		  #if TargetCocoa then
		    declare function windowTitleForDocumentDisplayName lib CocoaLib selector "windowTitleForDocumentDisplayName:" (obj_id as Ptr, displayName as CFStringRef) as CFStringRef
		    
		    return windowTitleForDocumentDisplayName( self, displayName )
		  #else
		    #pragma Unused displayName
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getDocument lib CocoaLib selector "document" (obj_id as Ptr) as Ptr
			    
			    return New NSDocument( getDocument( self ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setDocument lib CocoaLib selector "setDocument:" (obj_id as Ptr, value as Ptr)
			    
			    dim valueRef as Ptr
			    if value <> nil then
			      valueRef = value
			    end if
			    
			    setDocument self, valueRef
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Document As NSDocument
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getIsWindowLoaded lib CocoaLib selector "isWindowLoaded" (obj_id as Ptr) as Boolean
			    
			    return getIsWindowLoaded( self )
			  #endif
			End Get
		#tag EndGetter
		IsWindowLoaded As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getShouldCascadeWindows lib CocoaLib selector "shouldCascadeWindows" (obj_id as Ptr) as Boolean
			    
			    return getShouldCascadeWindows( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setShouldCascadeWindows lib CocoaLib selector "setShouldCascadeWindows:" (obj_id as Ptr, value as Boolean)
			    
			    setShouldCascadeWindows self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		ShouldCascadeWindows As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getShouldCloseDocument lib CocoaLib selector "shouldCloseDocument" (obj_id as Ptr) as Boolean
			    
			    return getShouldCloseDocument( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setShouldCloseDocument lib CocoaLib selector "setShouldCloseDocument:" (obj_id as Ptr, value as Boolean)
			    
			    setShouldCloseDocument self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		ShouldCloseDocument As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getWindow lib CocoaLib selector "window" (obj_id as Ptr) as Ptr
			    
			    return New NSWindow( getWindow( self ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setWindow lib CocoaLib selector "setWindow:" (obj_id as Ptr, value as Ptr)
			    
			    dim valueRef as Ptr
			    if value <> nil then
			      valueRef = value
			    end if
			    
			    setWindow self, valueRef
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Window As NSWindow
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getWindowFrameAutosaveName lib CocoaLib selector "windowFrameAutosaveName" (obj_id as Ptr) as Ptr
			    
			    return New NSString( getWindowFrameAutosaveName( self ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setWindowFrameAutosaveName lib CocoaLib selector "setWindowFrameAutosaveName:" (obj_id as Ptr, value as Ptr)
			    
			    dim valueRef as Ptr
			    if value <> nil then
			      valueRef = value
			    end if
			    
			    setWindowFrameAutosaveName self, valueRef
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		WindowFrameAutosaveName As NSString
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsWindowLoaded"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShouldCascadeWindows"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShouldCloseDocument"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

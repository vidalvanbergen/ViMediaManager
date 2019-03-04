#tag Class
Class NSViewController
Inherits NSResponder
	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    super.Constructor(Initialize(Allocate(Cocoa.NSClassFromString("NSViewController"))))
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS then
			    declare function getRepresentedObject lib CocoaLib selector "representedObject" (obj_id as Ptr) as Ptr
			    
			    return getRepresentedObject( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS then
			    declare sub setRepresentedObject lib CocoaLib selector "setRepresentedObject:" (obj_id as Ptr, value as Ptr)
			    
			    setRepresentedObject self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		RepresentedObject As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function title lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			    
			    return title(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, value as CFStringRef)
			    
			    setTitle(self, value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getView lib CocoaLib selector "view" (obj_id as Ptr) as Ptr
			    
			    return New NSView( getView( self ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setView lib CocoaLib selector "setView:" (obj_id as Ptr, value as Ptr)
			    
			    dim valueRef as Ptr
			    if value <> Nil then
			      valueRef = value
			    end if
			    
			    setView self, valueRef
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		View As NSView
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

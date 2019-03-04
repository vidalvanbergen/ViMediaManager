#tag Class
Class NSSharingServicePicker
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(items as NSArray)
		  
		  #if TargetMacOS then
		    declare function initWithItems lib CocoaLib selector "initWithItems:" (obj_id as Ptr, items as Ptr) as Ptr
		    
		    super.Constructor( initWithItems( Initialize(Allocate(Cocoa.NSClassFromString("NSSharingServicePicker"))), items ), not hasOwnership )
		  #else
		    #pragma Unused items
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(item as NSObject)
		  
		  #if TargetMacOS then
		    self.Constructor( New NSArray( Array( item ) ) )
		  #else
		    #pragma Unused item
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show(c as NSControl)
		  
		  #if TargetMacOS then
		    declare sub showRelativeToRect lib CocoaLib selector "showRelativeToRect:ofView:preferredEdge:" (obj_id as Ptr, rect as Cocoa.NSRect, View as Ptr, RectEdge as Cocoa.NSRectEdge)
		    
		    showRelativeToRect( self, c.Bounds, c.View, Cocoa.NSRectEdge.NSMinYEdge )
		  #else
		    #pragma Unused c
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowRelativeToRect(Rect as Cocoa.NSRect, View as NSView, RectEdge as Cocoa.NSRectEdge)
		  
		  #if TargetMacOS then
		    declare sub showRelativeToRect lib CocoaLib selector "showRelativeToRect:ofView:preferredEdge:" (obj_id as Ptr, rect as Cocoa.NSRect, View as Ptr, RectEdge as Cocoa.NSRectEdge)
		    
		    showRelativeToRect( self, Rect, View, RectEdge )
		  #else
		    #pragma Unused Rect
		    #pragma Unused View
		    #pragma Unused RectEdge
		  #endif
		End Sub
	#tag EndMethod


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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

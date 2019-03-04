#tag Class
Protected Class IKImageBrowserCell
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(obj_id as Ptr, hasOwnership as Boolean = false) -- From NSObject
		  
		  #if TargetMacOS
		    dim p as Ptr = Initialize( Allocate( Cocoa.NSClassFromString( me.NSClassName )))
		    
		    Super.Constructor( p, not hasOwnership )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Frame() As Cocoa.NSRect
		  #if TargetMacOS
		    declare function frame_ lib IKLib selector "frame" (id as Ptr) as Cocoa.NSRect
		    
		    dim r as Cocoa.NSRect = frame_( self )
		    
		    return r
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageContainerFrame() As Cocoa.NSRect
		  #if TargetMacOS
		    declare function imageContainerFrame_ lib IKLib selector "imageContainerFrame" (id as Ptr) as Cocoa.NSRect
		    
		    dim r as Cocoa.NSRect = imageContainerFrame_( self )
		    
		    return r
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageFrame() As Cocoa.NSRect
		  #if TargetMacOS
		    declare function imageFrame_ lib IKLib selector "imageFrame" (id as Ptr) as Cocoa.NSRect
		    
		    dim r as Cocoa.NSRect = imageFrame_( self )
		    
		    return r
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubtitleFrame() As Cocoa.NSRect
		  #if TargetMacOS
		    declare function subtitleFrame_ lib IKLib selector "subtitleFrame" (id as Ptr) as Cocoa.NSRect
		    
		    dim r as Cocoa.NSRect = subtitleFrame_( self )
		    
		    return r
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TitleFrame() As Cocoa.NSRect
		  #if TargetMacOS
		    declare function titleFrame_ lib IKLib selector "titleFrame" (id as Ptr) as Cocoa.NSRect
		    
		    dim r as Cocoa.NSRect = titleFrame_( self )
		    
		    return r
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"IKImageBrowserCell", Scope = Private
	#tag EndConstant


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

#tag Module
Protected Module CheckBoxExtension
	#tag Method, Flags = &h0
		Function ControlSize(Extends c as CheckBox) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Integer) as NSControlSize
		    
		    return controlSize(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends c as CheckBox, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Integer, value as NSControlSize)
		    
		    setControlSize(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImagePosition(extends c as CheckBox) As NSImagePosition
		  //# Returns the position of the receiver’s image relative to its title, in case of CheckBox or RadioButton returns the position of the CheckBox or RadioButton relative to its label.
		  
		  #if TargetCocoa then
		    declare function imagePosition lib CocoaLib selector "imagePosition" (obj_id as Integer) as NSImagePosition
		    
		    return imagePosition(c.Handle)
		  #else
		    #pragma Unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImagePosition(extends c as CheckBox, assigns value as NSImagePosition)
		  //# Sets the position of the button's image relative to its title, in case of CheckBox or RadioButton sets the position of the CheckBox or RadioButton relative to its label.
		  
		  #if TargetCocoa then
		    declare sub setImagePosition lib CocoaLib selector "setImagePosition:" (obj_id as Integer, inFlag as NSImagePosition)
		    
		    setImagePosition(c.Handle, value)
		  #else
		    #pragma Unused c
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transparent(extends c as CheckBox) As Boolean
		  //# Returns a Boolean value indicating whether the receiver is transparent.
		  
		  #if TargetCocoa then
		    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Integer) as Boolean
		    
		    return isTransparent(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transparent(extends c as CheckBox, Assigns value as Boolean)
		  //# Sets whether the receiver is transparent and redraws the receiver if necessary.
		  
		  #if TargetCocoa then
		    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Integer, value as Boolean)
		    
		    setTransparent(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule

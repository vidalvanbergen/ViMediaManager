#tag Module
Protected Module GroupBoxExtensions
	#tag Method, Flags = &h0
		Function BorderColor(Extends g as GroupBox) As Color
		  //# Returns the color of the groupbox’s border when the groupbox is a custom box with a simple line border.
		  
		  #if TargetCocoa then
		    declare function borderColor lib CocoaLib selector "borderColor" (obj_id as Integer) as Ptr
		    
		    return new NSColor(borderColor(g.handle))
		  #else
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BorderColor(Extends g as GroupBox, Assigns value as Color)
		  //# Specifies the groupbox’s border color.
		  
		  #if TargetCocoa then
		    declare sub setBorderColor lib CocoaLib selector "setBorderColor:" (obj_id as Integer, value as Ptr)
		    
		    setBorderColor(g.handle, new NSColor(value))
		  #else
		    #pragma unused g
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BorderType(Extends g as GroupBox) As NSBorderType
		  //# Returns the groupbox’s border type.
		  
		  #if TargetCocoa then
		    declare function borderType lib CocoaLib selector "borderType" (obj_id as Integer) as NSBorderType
		    
		    return borderType(g.handle)
		  #else
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BorderType(Extends g as GroupBox, Assigns aType as NSBorderType)
		  //# Sets the border type to aType, which must be a valid border type.
		  
		  #if TargetCocoa then
		    declare sub setBorderType lib CocoaLib selector "setBorderType:" (obj_id as Integer, aType as NSBorderType)
		    
		    setBorderType(g.handle, aType)
		  #else
		    #pragma unused g
		    #pragma unused aType
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BorderWidth(Extends g as GroupBox) As Double
		  //# Returns the width of the groupbox’s border when the groupbox is a custom box with a simple line border.
		  
		  #if TargetCocoa then
		    declare function borderWidth lib CocoaLib selector "borderWidth" (obj_id as Integer) as Double
		    
		    return borderWidth(g.handle)
		  #else
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BorderWidth(Extends g as GroupBox, Assigns value as Double)
		  //# Specifies the groupbox’s border width.
		  
		  #if TargetCocoa then
		    declare sub setBorderWidth lib CocoaLib selector "setBorderWidth:" (obj_id as Integer, value as Double)
		    
		    setBorderWidth(g.handle, value)
		  #else
		    #pragma unused g
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BoxType(Extends g as GroupBox) As NSBoxType
		  //# Returns the groupbox’s box type.
		  
		  #if TargetCocoa then
		    declare function boxType lib CocoaLib selector "boxType" (obj_id as Integer) as NSBoxType
		    
		    return boxType(g.handle)
		  #else
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BoxType(Extends g as GroupBox, Assigns value as NSBoxType)
		  //# Sets the groupbox type.
		  
		  #if TargetCocoa then
		    declare sub setBoxType lib CocoaLib selector "setBoxType:" (obj_id as Integer, value as NSBoxType)
		    
		    setBoxType(g.handle, value)
		  #else
		    #pragma unused g
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CornerRadius(Extends g as GroupBox) As Double
		  //# Returns the radius of the groupbox’s corners when the groupbox is a custom box with a simple line border.
		  
		  //@return The groupbox’s corner radius. It must be a custom box—that is, it has a type of NSBoxCustom—and it must have a border style of NSLineBorder.
		  
		  #if TargetCocoa then
		    declare function cornerRadius lib CocoaLib selector "cornerRadius" (obj_id as Integer) as Double
		    
		    return cornerRadius(g.handle)
		  #else
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CornerRadius(Extends g as GroupBox, Assigns value as Double)
		  //# Specifies the groupbox’s corner radius.
		  
		  //@considerations: Functional only when the groupbox’s box type (boxType) is NSBoxCustom and its border type (borderType) is NSLineBorder.
		  
		  #if TargetCocoa then
		    declare sub setCornerRadius lib CocoaLib selector "setCornerRadius:" (obj_id as Integer, value as Double)
		    
		    setCornerRadius(g.handle, value)
		  #else
		    #pragma unused g
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillColor(Extends g as GroupBox) As Color
		  //# Returns the color of the groupbox’s background when the groupbox is a custom box with a simple line border.
		  
		  #if TargetCocoa then
		    declare function fillColor lib CocoaLib selector "fillColor" (obj_id as Integer) as Ptr
		    
		    return new NSColor(fillColor(g.handle))
		  #else
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillColor(Extends g as GroupBox, Assigns value as Color)
		  //# Specifies the groupbox’s fill color.
		  
		  #if TargetCocoa then
		    declare sub setFillColor lib CocoaLib selector "setFillColor:" (obj_id as Integer, value as Ptr)
		    
		    setFillColor(g.handle, new NSColor(value))
		  #else
		    #pragma unused g
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TitlePosition(Extends g as GroupBox) As NSTitlePosition
		  //# Returns a constant representing the title position.
		  
		  #if TargetCocoa then
		    declare function titlePosition lib CocoaLib selector "titlePosition" (obj_id as Integer) as NSTitlePosition
		    
		    return titlePosition(g.handle)
		  #else
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TitlePosition(Extends g as GroupBox, Assigns value as NSTitlePosition)
		  //# Sets the position of the groupbox's title.
		  
		  #if TargetCocoa then
		    declare sub setTitlePosition lib CocoaLib selector "setTitlePosition:" (obj_id as Integer, value as NSTitlePosition)
		    
		    setTitlePosition(g.handle, value)
		  #else
		    #pragma unused g
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transparent(Extends g as GroupBox) As Boolean
		  //# Indicates whether the groupbox is transparent.
		  
		  #if TargetCocoa then
		    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Integer) as Boolean
		    
		    return isTransparent(g.handle)
		  #else
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transparent(Extends g as GroupBox, Assigns value as Boolean)
		  //# Specifies whether the groupbox is transparent.
		  
		  #if TargetCocoa then
		    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Integer, value as Boolean)
		    
		    setTransparent(g.handle, value)
		  #else
		    #pragma unused g
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


	#tag Enum, Name = NSBorderType, Type = Integer, Flags = &h0
		NSNoBorder
		  NSLineBorder
		  NSBezelBorder
		NSGrooveBorder
	#tag EndEnum

	#tag Enum, Name = NSBoxType, Type = Integer, Flags = &h0
		NSBoxPrimary
		  NSBoxSecondary
		  NSBoxSeparator
		  NSBoxOldStyle
		NSBoxCustom
	#tag EndEnum

	#tag Enum, Name = NSTitlePosition, Type = Integer, Flags = &h0
		NSNoTitle
		  NSAboveTop
		  NSAtTop
		  NSBelowTop
		  NSAboveBottom
		  NSAtBottom
		NSBelowBottom
	#tag EndEnum


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

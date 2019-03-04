#tag Module
Protected Module ComboBoxExtension
	#tag Method, Flags = &h0
		Function Bordered(Extends c as ComboBox) As Boolean
		  //# Returns a Boolean value indicating whether the combo box has a border.
		  
		  #if TargetCocoa then
		    declare function isBordered lib CocoaLib selector "isBordered" (obj_id as Integer) as Boolean
		    
		    return isBordered(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bordered(Extends c as ComboBox, Assigns value as Boolean)
		  //# Places or removes a border on the combo box and redraws the combo box.
		  
		  #if TargetCocoa then
		    declare sub setBordered lib CocoaLib selector "setBordered:" (obj_id as Integer, flag as Boolean)
		    
		    setBordered(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ButtonBordered(Extends c as ComboBox) As Boolean
		  //# Returns whether the combo box button is set to display a border.
		  
		  #if TargetCocoa then
		    declare function isButtonBordered lib CocoaLib selector "isButtonBordered" (obj_id as Integer) as Boolean
		    
		    return isButtonBordered(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ButtonBordered(Extends c as ComboBox, Assigns value as Boolean)
		  //# Determines whether the button in the combo box is displayed with a border.
		  
		  #if TargetCocoa then
		    declare sub setButtonBordered lib CocoaLib selector "setButtonBordered:" (obj_id as Integer, value as Boolean)
		    
		    setButtonBordered(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlSize(Extends c as ComboBox) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Integer) as NSControlSize
		    
		    return controlSize(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends c as ComboBox, Assigns value as NSControlSize)
		  
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
		Function DoubleValue(Extends c as ComboBox) As Double
		  //# Returns the value of the combo box’s cell as a double-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare function doubleValue lib CocoaLib selector "doubleValue" (obj_id as Integer) as Double
		    
		    return doubleValue(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleValue(Extends c as ComboBox, Assigns value as Double)
		  //# Sets the value of the combo box’s cell using a double-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare sub setDoubleValue lib CocoaLib selector "setDoubleValue:" (obj_id as Integer, value as Double)
		    
		    setDoubleValue(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Editable(Extends c as ComboBox) As Boolean
		  //# A Boolean value indicating whether the combo box is editable.
		  
		  #if TargetCocoa then
		    declare function isEditable lib CocoaLib selector "isEditable" (obj_id as Integer) as Boolean
		    
		    return isEditable(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Editable(Extends c as ComboBox, Assigns value as Boolean)
		  //# Sets whether the combo box is editable.
		  
		  #if TargetCocoa then
		    declare sub setEditable lib CocoaLib selector "setEditable:" (obj_id as Integer, flag as Boolean)
		    
		    setEditable(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasVerticalScroller(Extends c as ComboBox) As Boolean
		  //# Returns a Boolean value indicating whether the combo box will display a vertical scroller.
		  
		  #if TargetCocoa then
		    declare function hasVerticalScroller lib CocoaLib selector "hasVerticalScroller" (obj_id as Integer) as Boolean
		    
		    return hasVerticalScroller(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HasVerticalScroller(Extends c as ComboBox, Assigns value as Boolean)
		  //# Determines whether the combo box displays a vertical scroller.
		  
		  #if TargetCocoa then
		    declare sub setHasVerticalScroller lib CocoaLib selector "setHasVerticalScroller:" (obj_id as Integer, value as Boolean)
		    
		    setHasVerticalScroller(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(Extends c as ComboBox) As Integer
		  //# Returns the value of the combo box’s cell as an NSInteger value.
		  
		  #if TargetCocoa then
		    declare function integerValue lib CocoaLib selector "integerValue" (obj_id as Integer) as Integer
		    
		    return integerValue(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntegerValue(Extends c as ComboBox, Assigns value as Integer)
		  //# Sets the value of the combo box’s cell using an NSInteger value.
		  
		  #if TargetCocoa then
		    declare sub setIntegerValue lib CocoaLib selector "setIntegerValue:" (obj_id as Integer, value as Integer)
		    
		    setIntegerValue(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntercellSpacing(Extends c as ComboBox) As Cocoa.NSSize
		  //# Returns the spacing between cells in the combo box’s pop-up list.
		  
		  #if TargetCocoa then
		    declare function intercellSpacing lib CocoaLib selector "intercellSpacing" (obj_id as Integer) as Cocoa.NSSize
		    
		    return intercellSpacing(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntercellSpacing(Extends c as ComboBox, Assigns value as Cocoa.NSSize)
		  //# Sets the spacing between pop-up list items.
		  
		  #if TargetCocoa then
		    declare sub setIntercellSpacing lib CocoaLib selector "setIntercellSpacing:" (obj_id as Integer, value as Cocoa.NSSize)
		    
		    setIntercellSpacing(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntercellSpacing(extends c as ComboBox, width as Integer, height as Integer)
		  //# Sets the spacing between pop-up list items.
		  
		  #if TargetCocoa then
		    declare sub setIntercellSpacing lib CocoaLib selector "setIntercellSpacing:" (obj_id as Integer, value as Cocoa.NSSize)
		    
		    dim value as Cocoa.NSSize
		    value.width = width
		    value.height = height
		    
		    setIntercellSpacing(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused width
		    #pragma unused height
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemHeight(Extends c as ComboBox) As Double
		  //# Returns the height of each item in the combo box’s pop-up list.
		  
		  #if TargetCocoa then
		    declare function itemHeight lib CocoaLib selector "itemHeight" (obj_id as Integer) as Double
		    
		    return itemHeight(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ItemHeight(Extends c as ComboBox, Assigns value as Double)
		  //# Sets the height for items.
		  
		  #if TargetCocoa then
		    declare sub setItemHeight lib CocoaLib selector "setItemHeight:" (obj_id as Integer, value as Double)
		    
		    setItemHeight(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfVisibleItems(Extends c as ComboBox) As Integer
		  //# Returns the maximum number of items visible in the pop-up list.
		  
		  #if TargetCocoa then
		    declare function numberOfVisibleItems lib CocoaLib selector "numberOfVisibleItems" (obj_id as Integer) as Integer
		    
		    return numberOfVisibleItems(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NumberOfVisibleItems(Extends c as ComboBox, Assigns value as Integer)
		  //# Sets the maximum number of items that are visible in the pop-up list.
		  
		  #if TargetCocoa then
		    declare sub setNumberOfVisibleItems lib CocoaLib selector "setNumberOfVisibleItems:" (obj_id as Integer, value as Integer)
		    
		    setNumberOfVisibleItems(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SingleValue(Extends c as ComboBox) As Double
		  //# Returns the value of the combo box’s cell as a single-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare function floatValue lib CocoaLib selector "floatValue" (obj_id as Integer) as Double
		    
		    return floatValue(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SingleValue(Extends c as ComboBox, Assigns value as Double)
		  //# Sets the value of the combo box's cell using a single-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare sub setFloatValue lib CocoaLib selector "setFloatValue:" (obj_id as Integer, value as Double)
		    
		    setFloatValue(c.handle, value)
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

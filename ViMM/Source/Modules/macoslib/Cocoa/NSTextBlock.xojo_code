#tag Class
Class NSTextBlock
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub BorderColor(assigns colour as NSColor)
		  
		  #if targetMacOS
		    declare sub setBorderColor lib CocoaLib selector "setBorderColor:" (obj_id as Ptr, colour as Ptr)
		    
		    dim colorRef as Ptr
		    if colour <> nil then
		      colorRef = colour
		    end if
		    
		    setBorderColor self, colorRef
		    
		  #else
		    #pragma unused colour
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BorderColor(edge as Cocoa.NSRectEdge) As NSColor
		  
		  #if targetMacOS
		    declare function borderColorForEdge lib CocoaLib selector "borderColorForEdge:" (obj_id as Ptr, edge as Cocoa.NSRectEdge) as Ptr
		    
		    dim colorRef as Ptr = borderColorForEdge(self, edge)
		    if colorRef <> nil then
		      return new NSColor(colorRef)
		    end if
		    
		  #else
		    #pragma unused edge
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub BorderColor(edge as Cocoa.NSRectEdge, assigns colour as NSColor)
		  
		  #if targetMacOS
		    declare sub setBorderColor lib CocoaLib selector "setBorderColor:forEdge:" (obj_id as Ptr, colour as Ptr, edge as Cocoa.NSRectEdge)
		    
		    dim colorRef as Ptr
		    if colour <> nil then
		      colorRef = colour
		    end if
		    
		    setBorderColor self, colorRef, edge
		    
		  #else
		    #pragma unused edge
		    #pragma unused colour
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Bounds(contentRect as Cocoa.NSRect, inRect as Cocoa.NSRect, textContainer as NSTextContainer, charRange as Cocoa.NSRange) As Cocoa.NSRect
		  
		  #if targetMacOS
		    declare function boundsRectForContentRect lib CocoaLib selector "boundsRectForContentRect:inRect:textContainer:characterRange:" _
		    (obj_id as Ptr, contentRect as Cocoa.NSRect, inRect as Cocoa.NSRect, textContainer as Ptr, charRange as Cocoa.NSRange) as Cocoa.NSRect
		    
		    dim containerRef as Ptr
		    if textContainer <> nil then
		      containerRef = textContainer
		    end if
		    
		    return boundsRectForContentRect(self, contentRect, inRect, containerRef, charRange)
		    
		  #else
		    #pragma unused contentRect
		    #pragma unused inRect
		    #pragma unused textContainer
		    #pragma unused charRange
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize(Allocate("NSTextBlock")), NSTextBlock.hasOwnership)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ContentWidth() As Double
		  
		  #if targetMacOS
		    declare function contentWidth lib CocoaLib selector "contentWidth" (obj_id as Ptr) as Double
		    
		    return contentWidth(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ContentWidth(type as NSTextBlockValueType, assigns value as Double)
		  
		  #if targetMacOS
		    declare sub setContentWidth lib CocoaLib selector "setContentWidth:type:" (obj_id as Ptr, value as Double, type as NSTextBlockValueType)
		    
		    setContentWidth self, value, type
		    
		  #else
		    #pragma unused type
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ContentWidthValueType() As NSTextBlockValueType
		  
		  #if targetMacOS
		    declare function contentWidthValueType lib CocoaLib selector "contentWidthValueType" (obj_id as Ptr) as NSTextBlockValueType
		    
		    return contentWidthValueType(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub DrawBackground(frameRect as Cocoa.NSRect, controlView as Ptr, charRange as Cocoa.NSRange, layoutManager as NSLayoutManager)
		  
		  #if targetMacOS
		    declare sub drawBackgroundWithFrame lib CocoaLib selector "drawBackgroundWithFrame:inView:characterRange:layoutManager:" _
		    (obj_id as Ptr, frameRect as Cocoa.NSRect, controlView as Ptr, charRange as Cocoa.NSRange, layoutManager as Ptr)
		    
		    dim layoutManagerRef as Ptr
		    if layoutManager <> nil then
		      layoutManagerRef = layoutManager
		    end if
		    
		    drawBackgroundWithFrame self, frameRect, controlView, charRange, layoutManagerRef
		    
		  #else
		    #pragma unused frameRect
		    #pragma unused controlView
		    #pragma unused charRange
		    #pragma unused layoutManager
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Rect(startingPoint as Cocoa.NSPoint, inRect as Cocoa.NSRect, textContainer as NSTextContainer, charRange as Cocoa.NSRange) As Cocoa.NSRect
		  
		  #if targetMacOS
		    declare function rectForLayoutAtPoint lib CocoaLib selector "rectForLayoutAtPoint:inRect:textContainer:characterRange:" _
		    (obj_id as Ptr, startingPoint as Cocoa.NSPoint, inRect as Cocoa.NSRect, textContainer as Ptr, charRange as Cocoa.NSRange) as Cocoa.NSRect
		    
		    dim containerRef as Ptr
		    if textContainer <> nil then
		      containerRef = textContainer
		    end if
		    
		    return rectForLayoutAtPoint(self, startingPoint, inRect, containerRef, charRange)
		    
		  #else
		    #pragma unused startingPoint
		    #pragma unused inRect
		    #pragma unused textContainer
		    #pragma unused charRange
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Value(dimension as NSTextBlockDimension) As Double
		  
		  #if targetMacOS
		    declare function valueForDimension lib CocoaLib selector "valueForDimension:" (obj_id as Ptr, dimension as NSTextBlockDimension) as Double
		    
		    return valueForDimension(self, dimension)
		    
		  #else
		    #pragma unused dimension
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Value(type as NSTextBlockValueType, dimension as NSTextBlockDimension, assigns value as Double)
		  
		  #if targetMacOS
		    declare sub setValue lib CocoaLib selector "setValue:type:forDimension:" _
		    (obj_id as Ptr, value as Double, type as NSTextBlockValueType, dimension as NSTextBlockDimension)
		    
		    setValue self, value, type, dimension
		    
		  #else
		    #pragma unused type
		    #pragma unused dimension
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ValueType(dimension as NSTextBlockDimension) As NSTextBlockValueType
		  
		  #if targetMacOS
		    declare function valueTypeForDimension lib CocoaLib selector "valueTypeForDimension:" _
		    (obj_id as Ptr, dimension as NSTextBlockDimension) as NSTextBlockValueType
		    
		    return valueTypeForDimension(self, dimension)
		    
		  #else
		    #pragma unused dimension
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Width(layer as NSTextBlockLayer, edge as Cocoa.NSRectEdge) As Double
		  
		  #if targetMacOS
		    declare function widthForLayer lib CocoaLib selector "widthForLayer:edge:" _
		    (obj_id as Ptr, layer as NSTextBlockLayer, edge as Cocoa.NSRectEdge) as Double
		    
		    return widthForLayer(self, layer, edge)
		    
		  #else
		    #pragma unused layer
		    #pragma unused edge
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Width(type as NSTextBlockValueType, layer as NSTextBlockLayer, edge as Cocoa.NSRectEdge, assigns value as Double)
		  
		  #if targetMacOS
		    declare sub setWidth lib CocoaLib selector "setWidth:type:forLayer:edge:" _
		    (obj_id as Ptr, value as Double, type as NSTextBlockValueType, layer as NSTextBlockLayer, edge as Cocoa.NSRectEdge)
		    
		    setWidth self, value, type, layer, edge
		    
		  #else
		    #pragma unused type
		    #pragma unused layer
		    #pragma unused edge
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Width(type as NSTextBlockValueType, layer as NSTextBlockLayer, assigns value as Double)
		  
		  #if targetMacOS
		    declare sub setWidth lib CocoaLib selector "setWidth:type:forLayer:" _
		    (obj_id as Ptr, value as Double, type as NSTextBlockValueType, layer as NSTextBlockLayer)
		    
		    setWidth self, value, type, layer
		    
		  #else
		    #pragma unused type
		    #pragma unused layer
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function WidthValueType(layer as NSTextBlockLayer, edge as Cocoa.NSRectEdge) As NSTextBlockValueType
		  
		  #if targetMacOS
		    declare function widthValueTypeForLayer lib CocoaLib selector "widthValueTypeForLayer:edge:" _
		    (obj_id as Ptr, layer as NSTextBlockLayer, edge as Cocoa.NSRectEdge) as NSTextBlockValueType
		    
		    return widthValueTypeForLayer(self, layer, edge)
		    
		  #else
		    #pragma unused layer
		    #pragma unused edge
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function backgroundColor lib CocoaLib selector "backgroundColor" (obj_id as Ptr) as Ptr
			    
			    dim colorRef as Ptr = backgroundColor(self)
			    if colorRef <> nil then
			      return new NSColor(colorRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" (obj_id as Ptr, colour as Ptr)
			    
			    dim colorRef as Ptr
			    if value <> nil then
			      colorRef = value
			    end if
			    
			    setBackgroundColor self, colorRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		BackgroundColor As NSColor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function verticalAlignment lib CocoaLib selector "verticalAlignment" (obj_id as Ptr) as NSTextBlockVerticalAlignment
			    
			    return verticalAlignment(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setVerticalAlignment lib CocoaLib selector "setVerticalAlignment:" (obj_id as Ptr, alignment as NSTextBlockVerticalAlignment)
			    
			    setVerticalAlignment self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		VerticalAlignment As NSTextBlockVerticalAlignment
	#tag EndComputedProperty


	#tag Enum, Name = NSTextBlockDimension, Type = UInt32, Flags = &h0
		NSTextBlockWidth = 0
		  NSTextBlockMinimumWidth = 1
		  NSTextBlockMaximumWidth = 2
		  NSTextBlockHeight = 4
		  NSTextBlockMinimumHeight = 5
		NSTextBlockMaximumHeight = 6
	#tag EndEnum

	#tag Enum, Name = NSTextBlockLayer, Type = Integer, Flags = &h0
		NSTextBlockPadding = -1
		  NSTextBlockBorder = 0
		NSTextBlockMargin = 1
	#tag EndEnum

	#tag Enum, Name = NSTextBlockValueType, Type = UInt32, Flags = &h0
		NSTextBlockAbsoluteValueType
		NSTextBlockPercentageValueType
	#tag EndEnum

	#tag Enum, Name = NSTextBlockVerticalAlignment, Type = UInt32, Flags = &h0
		NSTextBlockTopAlignment
		  NSTextBlockMiddleAlignment
		  NSTextBlockBottomAlignment
		NSTextBlockBaselineAlignment
	#tag EndEnum


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
		#tag ViewProperty
			Name="VerticalAlignment"
			Group="Behavior"
			Type="NSTextBlockVerticalAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSTextBlockTopAlignment"
				"1 - NSTextBlockMiddleAlignment"
				"2 - NSTextBlockBottomAlignment"
				"3 - NSTextBlockBaselineAlignment"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

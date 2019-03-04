#tag Class
Class NSTextTable
Inherits NSTextBlock
	#tag Method, Flags = &h1000
		Function BlockBounds(block as NSTextTableBlock, contentRect as Cocoa.NSRect, inRect as Cocoa.NSRect, textContainer as NSTextContainer, charRange as Cocoa.NSRange) As Cocoa.NSRect
		  
		  #if targetMacOS
		    declare function boundsRectForBlock lib CocoaLib selector "boundsRectForBlock:contentRect:inRect:textContainer:characterRange:" _
		    (obj_id as Ptr, block as Ptr, contentRect as Cocoa.NSRect, inRect as Cocoa.NSRect, textContainer as Ptr, charRange as Cocoa.NSRange) as Cocoa.NSRect
		    
		    dim blockRef as Ptr
		    if block <> nil then
		      blockRef = block
		    end if
		    
		    dim containerRef as Ptr
		    if textContainer <> nil then
		      containerRef = textContainer
		    end if
		    
		    return boundsRectForBlock(self, blockRef, contentRect, inRect, containerRef, charRange)
		    
		  #else
		    #pragma unused block
		    #pragma unused contentRect
		    #pragma unused inRect
		    #pragma unused textContainer
		    #pragma unused charRange
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BlockRect(block as NSTextTableBlock, startingPoint as Cocoa.NSPoint, inRect as Cocoa.NSRect, textContainer as NSTextContainer, charRange as Cocoa.NSRange) As Cocoa.NSRect
		  
		  #if targetMacOS
		    declare function rectForBlock lib CocoaLib selector "rectForBlock:layoutAtPoint:inRect:textContainer:characterRange:" _
		    (obj_id as Ptr, block as Ptr, startingPoint as Cocoa.NSPoint, inRect as Cocoa.NSRect, textContainer as Ptr, charRange as Cocoa.NSRange) as Cocoa.NSRect
		    
		    dim blockRef as Ptr
		    if block <> nil then
		      blockRef = block
		    end if
		    
		    dim containerRef as Ptr
		    if textContainer <> nil then
		      containerRef = textContainer
		    end if
		    
		    return rectForBlock(self, blockRef, startingPoint, inRect, containerRef, charRange)
		    
		  #else
		    #pragma unused block
		    #pragma unused startingPoint
		    #pragma unused inRect
		    #pragma unused textContainer
		    #pragma unused charRange
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize(Allocate("NSTextTable")), NSTextTable.hasOwnership)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub DrawBlockBackground(block as NSTextTableBlock, frameRect as Cocoa.NSRect, controlView as Ptr, charRange as Cocoa.NSRange, layoutManager as NSLayoutManager)
		  
		  #if targetMacOS
		    declare sub drawBackgroundForBlock lib CocoaLib selector "drawBackgroundForBlock:withFrame:inView:characterRange:layoutManager:" _
		    (obj_id as Ptr, block as Ptr, frameRect as Cocoa.NSRect, controlView as Ptr, charRange as Cocoa.NSRange, layoutManager as Ptr)
		    
		    dim blockRef as Ptr
		    if block <> nil then
		      blockRef = block
		    end if
		    
		    dim layoutManagerRef as Ptr
		    if layoutManager <> nil then
		      layoutManagerRef = layoutManager
		    end if
		    
		    drawBackgroundForBlock self, blockRef, frameRect, controlView, charRange, layoutManagerRef
		    
		  #else
		    #pragma unused block
		    #pragma unused frameRect
		    #pragma unused controlView
		    #pragma unused charRange
		    #pragma unused layoutManager
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function collapsesBorders lib CocoaLib selector "collapsesBorders" (obj_id as Ptr) as Boolean
			    
			    return collapsesBorders(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setCollapsesBorders lib CocoaLib selector "setCollapsesBorders:" (obj_id as Ptr, flag as Boolean)
			    
			    setCollapsesBorders self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		CollapsesBorders As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function hidesEmptyCells lib CocoaLib selector "hidesEmptyCells" (obj_id as Ptr) as Boolean
			    
			    return hidesEmptyCells(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setHidesEmptyCells lib CocoaLib selector "setHidesEmptyCells:" (obj_id as Ptr, flag as Boolean)
			    
			    setHidesEmptyCells self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		HidesEmptyCells As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function layoutAlgorithm lib CocoaLib selector "layoutAlgorithm" (obj_id as Ptr) as NSTextTableLayoutAlgorithm
			    
			    return layoutAlgorithm(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setLayoutAlgorithm lib CocoaLib selector "setLayoutAlgorithm:" (obj_id as Ptr, algorithm as NSTextTable.NSTextTableLayoutAlgorithm)
			    
			    setLayoutAlgorithm self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		LayoutAlgorithm As NSTextTableLayoutAlgorithm
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function numberOfColumns lib CocoaLib selector "numberOfColumns" (obj_id as Ptr) as UInt32
			    
			    return numberOfColumns(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setNumberOfColumns lib CocoaLib selector "setNumberOfColumns:" (obj_id as Ptr, numCols as UInt32)
			    
			    setNumberOfColumns self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		NumberOfColumns As UInt32
	#tag EndComputedProperty


	#tag Enum, Name = NSTextTableLayoutAlgorithm, Type = UInt32, Flags = &h0
		NSTextTableAutomaticLayoutAlgorithm
		NSTextTableFixedLayoutAlgorithm
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="CollapsesBorders"
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
			Name="HidesEmptyCells"
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
			Name="LayoutAlgorithm"
			Group="Behavior"
			Type="NSTextTableLayoutAlgorithm"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSTextTableAutomaticLayoutAlgorithm"
				"1 - NSTextTableFixedLayoutAlgorithm"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumberOfColumns"
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

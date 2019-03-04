#tag Class
Class NSTextContainer
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(aSize as Cocoa.NSSize)
		  
		  #if targetMacOS
		    declare function initWithContainerSize lib CocoaLib selector "initWithContainerSize:" (obj_id as Ptr, aSize as Cocoa.NSSize) as Ptr
		    
		    super.Constructor(initWithContainerSize(Allocate("NSTextContainer"), aSize), NSTextContainer.hasOwnership)
		    
		  #else
		    #pragma unused aSize
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ContainsPoint(aPoint as Cocoa.NSPoint) As Boolean
		  
		  #if targetMacOS
		    declare function containsPoint lib CocoaLib selector "containsPoint:" (obj_id as Ptr, aPoint as Cocoa.NSPoint) as Boolean
		    
		    return containsPoint(self, aPoint)
		    
		  #else
		    #pragma unused aPoint
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsSimpleRectangularTextContainer() As Boolean
		  
		  #if targetMacOS
		    declare function isSimpleRectangularTextContainer lib CocoaLib selector "isSimpleRectangularTextContainer" (obj_id as Ptr) as Boolean
		    
		    return isSimpleRectangularTextContainer(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function LineFragmentRect(proposedRect as Cocoa.NSRect, sweepDirection as NSLineSweepDirection, movementDirection as NSLineMovementDirection, byRef remainingRect as Cocoa.NSRect) As Cocoa.NSRect
		  
		  #if targetMacOS
		    declare function lineFragmentRectForProposedRect lib CocoaLib selector "lineFragmentRectForProposedRect:sweepDirection:movementDirection:remainingRect:" _
		    (obj_id as Ptr, proposedRect as Cocoa.NSRect, sweepDirection as NSLineSweepDirection, movementDirection as NSLineMovementDirection, byRef remainingRect as Cocoa.NSRect) as Cocoa.NSRect
		    
		    return lineFragmentRectForProposedRect(self, proposedRect, sweepDirection, movementDirection, remainingRect)
		    
		  #else
		    #pragma unused proposedRect
		    #pragma unused sweepDirection
		    #pragma unused movementDirection
		    #pragma unused remainingRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ReplaceLayoutManager(aLayoutManager as NSLayoutManager)
		  
		  #if targetMacOS
		    declare sub replaceLayoutManager lib CocoaLib selector "replaceLayoutManager:" (obj_id as Ptr, LayoutManager as Ptr)
		    
		    dim managerRef as Ptr
		    if aLayoutManager <> nil then
		      managerRef = aLayoutManager
		    end if
		    
		    replaceLayoutManager self, managerRef
		    
		  #else
		    #pragma unused aLayoutManager
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function containerSize lib CocoaLib selector "containerSize" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return containerSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setContainerSize lib CocoaLib selector "setContainerSize:" (obj_id as Ptr, aSize as Cocoa.NSSize)
			    
			    setContainerSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ContainerSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function heightTracksTextView lib CocoaLib selector "heightTracksTextView" (obj_id as Ptr) as Boolean
			    
			    return heightTracksTextView(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setHeightTracksTextView lib CocoaLib selector "setHeightTracksTextView:" (obj_id as Ptr, flag as Boolean)
			    
			    setHeightTracksTextView self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		HeightTracksTextView As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function layoutManager lib CocoaLib selector "layoutManager" (obj_id as Ptr) as Ptr
			    
			    dim managerRef as Ptr = layoutManager(self)
			    if managerRef <> nil then
			      return new NSLayoutManager(managerRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setLayoutManager lib CocoaLib selector "setLayoutManager:" (obj_id as Ptr, aLayoutManager as Ptr)
			    
			    dim managerRef as Ptr
			    if value <> nil then
			      managerRef = value
			    end if
			    
			    setLayoutManager self, managerRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		LayoutManager As NSLayoutManager
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function lineFragmentPadding lib CocoaLib selector "lineFragmentPadding" (obj_id as Ptr) as Double
			    
			    return lineFragmentPadding(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setLineFragmentPadding lib CocoaLib selector "setLineFragmentPadding:" (obj_id as Ptr, aFloat as Double)
			    
			    setLineFragmentPadding self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		LineFragmentPadding As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim tv as NSTextView
			  
			  #if TargetMacOS
			    
			    declare function textView lib CocoaLib selector "textView" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr = textView(self)
			    if p <> nil then
			      tv = new NSTextView( p, not hasOwnership )
			    end if
			    
			  #endif
			  
			  return tv
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setTextView lib CocoaLib selector "setTextView:" (obj_id as Ptr, aTextView as Ptr)
			    
			    setTextView self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		TextView As NSTextView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function widthTracksTextView lib CocoaLib selector "widthTracksTextView" (obj_id as Ptr) as Boolean
			    
			    return widthTracksTextView(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setWidthTracksTextView lib CocoaLib selector "setWidthTracksTextView:" (obj_id as Ptr, flag as Boolean)
			    
			    setWidthTracksTextView self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		WidthTracksTextView As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = NSLineMovementDirection, Type = UInt32, Flags = &h0
		NSLineDoesntMove
		  NSLineMovesLeft
		  NSLineMovesRight
		  NSLineMovesDown
		NSLineMovesUp
	#tag EndEnum

	#tag Enum, Name = NSLineSweepDirection, Type = UInt32, Flags = &h0
		NSLineSweepLeft
		  NSLineSweepRight
		  NSLineSweepDown
		NSLineSweepUp
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeightTracksTextView"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineFragmentPadding"
			Group="Behavior"
			Type="Double"
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
			Name="WidthTracksTextView"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

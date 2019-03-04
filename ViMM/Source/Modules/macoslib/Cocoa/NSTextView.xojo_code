#tag Class
Class NSTextView
Inherits NSText
	#tag Method, Flags = &h0
		Sub BreakUndoCoalescing()
		  #if TargetCocoa
		    
		    declare sub breakUndoCoalescing lib CocoaLib selector "breakUndoCoalescing" ( obj_id as Ptr )
		    // Introduced in MacOS X 10.4.
		    
		    breakUndoCoalescing( self )
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Complete()
		  #if TargetCocoa
		    
		    declare sub complete lib CocoaLib selector "complete:" (obj_id as Ptr, sender as Ptr)
		    // Introduced in MacOS X 10.3.
		    
		    complete( self, nil )
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ta As TextArea)
		  #if TargetCocoa
		    
		    declare function documentView lib CocoaLib selector "documentView" (obj_id as Integer) as Ptr
		    
		    dim ref as Ptr = documentView( ta.Handle )
		    me.Constructor( ref, not hasOwnership ) // The system has ownership, we just want to get access to its properties
		    
		  #else
		    
		    #pragma unused ta
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartSpeaking()
		  #if TargetMacOS
		    
		    declare sub startSpeaking lib CarbonLib selector "startSpeaking:" ( obj_id As Ptr, sender As Ptr )
		    // Introduced in MacOS X 10.1.
		    
		    startSpeaking( self, nil )
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSpeaking()
		  #if TargetMacOS
		    
		    declare sub stopSpeaking lib CarbonLib selector "stopSpeaking:" ( obj_id As Ptr, sender As Ptr )
		    // Introduced in MacOS X 10.1.
		    
		    stopSpeaking( self, nil )
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function instanceBackgroundColor lib CocoaLib selector "backgroundColor" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.0.
			    
			    dim clr as NSColor
			    dim p as Ptr = instanceBackgroundColor( self )
			    if p <> nil then
			      clr = new NSColor( p, not hasOwnership )
			    end if
			    return clr
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" ( obj_id As Ptr, clr As Ptr )
			    // Introduced in MacOS X 10.0.
			    
			    setBackgroundColor( self, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		BacgroundColor As NSColor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim arr as NSArray
			  
			  #if TargetCocoa
			    
			    declare function selectedRanges lib CocoaLib selector "selectedRanges" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.4.
			    
			    dim p as Ptr = selectedRanges( self )
			    if p <> nil then
			      arr = new NSArray( p, not hasOwnership )
			    end if
			    
			  #endif
			  
			  return arr
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub setSelectedRanges lib CocoaLib selector "setSelectedRanges:" ( obj_id As Ptr, ranges As Ptr )
			    // Introduced in MacOS X 10.4.
			    
			    setSelectedRanges( self, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		SelectedRanges As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function selectionGranularity lib CarbonLib selector "selectionGranularity" ( obj_id As Ptr ) As Integer
			    // Introduced in MacOS X 10.0.
			    
			    dim v as integer = selectionGranularity( self )
			    return NSSelectionGranularity( v )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare sub setSelectionGranularity lib CarbonLib selector "setSelectionGranularity:" ( obj_id As Ptr, value As Integer )
			    // Introduced in MacOS X 10.0.
			    
			    dim n as integer = CType( value, Integer )
			    setSelectionGranularity( self, n )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		SelectionGranularity As NSSelectionGranularity
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function string_ lib CocoaLib selector "string" (obj_id as Ptr) as Ptr
			    declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
			    
			    return CFRetain(string_(self))
			  #endif
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim tc as NSTextContainer
			  
			  #if TargetCocoa
			    
			    declare function textContainer lib CocoaLib selector "textContainer" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.0.
			    
			    dim p as Ptr = textContainer( self )
			    
			    if p <> nil then
			      tc = new NSTextContainer( p, not hasOwnership )
			    end if
			    
			  #endif
			  
			  return tc
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub setTextContainer lib CocoaLib selector "setTextContainer:" ( obj_id As Ptr, value As Ptr )
			    // Introduced in MacOS X 10.0.
			    
			    if value = nil then
			      setTextContainer( self, nil )
			    else
			      setTextContainer( self, value )
			    end if
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		TextContainer As NSTextContainer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim st as NSTextStorage
			  
			  #if TargetCocoa
			    
			    declare function instanceTextStorage lib CocoaLib selector "textStorage" ( obj_id As Ptr ) As Ptr
			    
			    dim p as Ptr = instanceTextStorage( self )
			    if p <> nil then
			      st = new NSTextStorage( p, not hasOwnership )
			    end if
			    
			  #endif
			  
			  return st
			  
			End Get
		#tag EndGetter
		TextStorage As NSTextStorage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function instanceTypingAttributes lib CocoaLib selector "typingAttributes" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.0.
			    
			    dim dict as NSDictionary
			    dim p as Ptr = instanceTypingAttributes( self )
			    if p <> nil then
			      dict = new NSDictionary( p, not hasOwnership )
			    end if
			    return dict
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub setTypingAttributes lib CocoaLib selector "setTypingAttributes:" ( obj_id As Ptr, dict As Ptr )
			    // Introduced in MacOS X 10.0.
			    
			    setTypingAttributes( self, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			End Set
		#tag EndSetter
		TypingAttributes As NSDictionary
	#tag EndComputedProperty


	#tag Enum, Name = NSSelectionGranularity, Type = Integer, Flags = &h0
		NSSelectByCharacter
		  NSSelectByWord
		NSSelectByParagraph
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alignment"
			Group="Behavior"
			Type="NSTextAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSLeftTextAlignment"
				"1 - NSRightTextAlignment"
				"2 - NSCenterTextAlignment"
				"3 - NSJustifiedTextAlignment"
				"4 - NSNaturalTextAlignment"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BaseWritingDirection"
			Group="Behavior"
			Type="NSWritingDirection"
			EditorType="Enum"
			#tag EnumValues
				"-1 - NSWritingDirectionNatural"
				"0 - NSWritingDirectionLeftToRight"
				"1 - NSWritingDirectionRightToLeft"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DrawsBackground"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Editable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FieldEditor"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontallyResizable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImportsGraphics"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RichText"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RulerVisible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selectable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionGranularity"
			Group="Behavior"
			Type="NSSelectionGranularity"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSSelectByCharacter"
				"1 - NSSelectByWord"
				"2 - NSSelectByParagraph"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="UsesFontPanel"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticallyResizable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

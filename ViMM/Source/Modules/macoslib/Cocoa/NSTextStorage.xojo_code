#tag Class
Class NSTextStorage
Inherits NSMutableAttributedString
	#tag Method, Flags = &h0
		Sub AddLayoutManager(aLayoutManager As NSLayoutManager)
		  #if TargetCocoa
		    
		    declare sub addLayoutManager lib CocoaLib selector "addLayoutManager:" ( obj_id As Ptr, aLayoutManager As Ptr )
		    // Introduced in MacOS X 10.0.
		    
		    addLayoutManager( self, aLayoutManager )
		    
		  #else
		    
		    #pragma unused aLayoutManager
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnsureAttributesAreFixedInRange(rng As Cocoa.NSRange)
		  #if TargetCocoa
		    
		    declare sub ensureAttributesAreFixedInRange lib CocoaLib selector "ensureAttributesAreFixedInRange:" ( obj_id As Ptr, rng As Cocoa.NSRange )
		    // Introduced in MacOS X 10.0.
		    
		    ensureAttributesAreFixedInRange( self, rng )
		    
		  #else
		    
		    #pragma unused rng
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveLayoutManager(aLayoutManager As NSLayoutManager)
		  #if TargetCocoa
		    
		    declare sub removeLayoutManager lib CocoaLib selector "removeLayoutManager:" ( obj_id As Ptr, aLayoutManager As Ptr )
		    // Introduced in MacOS X 10.0.
		    
		    removeLayoutManager( self, aLayoutManager )
		    
		  #else
		    
		    #pragma unused aLayoutManager
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function editedRange lib CocoaLib selector "editedRange" ( obj_id As Ptr ) As Cocoa.NSRange
			    // Introduced in MacOS X 10.0.
			    
			    dim rng as Cocoa.NSRange = editedRange( self )
			    return rng
			    
			  #endif
			  
			End Get
		#tag EndGetter
		EditedRange As Cocoa.NSRange
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as Boolean
			  
			  #if TargetCocoa
			    
			    declare function fixesAttributesLazily lib CocoaLib selector "fixesAttributesLazily" ( obj_id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.0.
			    
			    r = fixesAttributesLazily( self )
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		FixesAttributesLazily As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim arr as NSArray
			  
			  #if TargetCocoa
			    
			    declare function layoutManagers lib CocoaLib selector "layoutManagers" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.0.
			    
			    dim p as Ptr = layoutManagers( self )
			    if p <> nil then
			      arr = new NSArray( p, not hasOwnership )
			    end if
			    
			  #endif
			  
			  return arr
			  
			End Get
		#tag EndGetter
		LayoutManagers As NSArray
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FixesAttributesLazily"
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
			Name="IsEditing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Length"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
	#tag EndViewBehavior
End Class
#tag EndClass

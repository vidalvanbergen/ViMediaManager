#tag Class
Class NSLayoutManager
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddTextContainer(container As NSTextContainer)
		  #if TargetCocoa
		    
		    declare sub addTextContainer lib CocoaLib selector "addTextContainer:" ( obj_id As Ptr, aTextContainer As Ptr )
		    // Introduced in MacOS X 10.0.
		    
		    addTextContainer( self, container )
		    
		  #else
		    
		    #pragma unused container
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  me.Constructor( NSObject.Initialize( NSObject.Allocate( "NSLayoutManager" ) ), false )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertTextContainer(container As NSTextContainer, atIndex As Integer)
		  #if TargetCocoa
		    
		    declare sub insertTextContainer lib CocoaLib selector "insertTextContainer:atIndex:" ( obj_id As Ptr, aTextContainer As Ptr, atIndex As Integer )
		    // Introduced in MacOS X 10.0.
		    
		    insertTextContainer( self, container, atIndex )
		    
		  #else
		    
		    #pragma unused container
		    #pragma unused atIndex
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveTextContainer(atIndex As Integer)
		  #if TargetCocoa
		    
		    declare sub removeTextContainer lib CocoaLib selector "removeTextContainerAtIndex:" ( obj_id As Ptr, atIndex As Integer )
		    // Introduced in MacOS X 10.0.
		    
		    removeTextContainer( self, atIndex )
		    
		  #else
		    
		    #pragma unused atIndex
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceTextStorage(newTextStorage As NSTextStorage)
		  #if TargetCocoa
		    
		    declare sub replaceTextStorage lib CocoaLib selector "replaceTextStorage:" ( obj_id As Ptr, newTextStorage As Ptr )
		    // Introduced in MacOS X 10.0.
		    
		    replaceTextStorage( self, newTextStorage )
		    
		  #else
		    
		    #pragma unused newTextStorage
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Setting TextStorage
		
		
		Setting TextStorage was not implemented on purpose. From the developer's guide:
		
		This method is invoked automatically when you add an NSLayoutManager to an NSTextStorage object; 
		you should never need to invoke it directly, but you might want to override it. If you want to replace the 
		NSTextStorage object for an established group of text-system objects containing the receiver, 
		use replaceTextStorage:.
	#tag EndNote

	#tag Note, Name = To be implemented
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function showsControlCharacters lib CocoaLib selector "showsControlCharacters" ( obj_id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.0.
			    
			    return showsControlCharacters( self )
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub setShowsControlCharacters lib CocoaLib selector "setShowsControlCharacters:" ( obj_id As Ptr, flag As Boolean )
			    // Introduced in MacOS X 10.0.
			    
			    setShowsControlCharacters( self, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		ShowsControlCharacters As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function showsInvisibleCharacters lib CocoaLib selector "showsInvisibleCharacters" ( obj_id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.0.
			    
			    return showsInvisibleCharacters( self )
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub setShowsInvisibleCharacters lib CocoaLib selector "setShowsInvisibleCharacters:" ( obj_id As Ptr, flag As Boolean )
			    // Introduced in MacOS X 10.0.
			    
			    setShowsInvisibleCharacters( self, value )
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		ShowsInvisibleCharacters As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim arr as NSArray
			  
			  #if TargetCocoa
			    
			    declare function textContainers lib CocoaLib selector "textContainers" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.0.
			    
			    dim p as Ptr = textContainers( self )
			    if p <> nil then
			      arr = new NSArray( p, not hasOwnership )
			    end if
			    
			  #endif
			  
			  return arr
			  
			  // Use InsertTextContainer, AddTextContainer, or RemoveTextContainer to manipulate.
			  
			End Get
		#tag EndGetter
		TextContainers As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim ts as NSTextStorage
			  
			  #if TargetCocoa
			    
			    declare function textStorage lib CocoaLib selector "textStorage" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.0.
			    
			    dim p as Ptr = textStorage( self )
			    if p <> nil then
			      ts = new NSTextStorage( p, not hasOwnership )
			    end if
			    
			  #endif
			  
			  return ts
			  
			End Get
		#tag EndGetter
		TextStorage As NSTextStorage
	#tag EndComputedProperty


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
			Name="ShowsControlCharacters"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsControlCharacters"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsInvisibleCharacters"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsInvisibleCharacters"
			Group="Behavior"
			Type="Boolean"
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

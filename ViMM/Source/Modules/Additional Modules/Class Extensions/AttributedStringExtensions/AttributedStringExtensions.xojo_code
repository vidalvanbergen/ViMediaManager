#tag Module
Protected Module AttributedStringExtensions
	#tag Method, Flags = &h0
		Function AttributedString(extends TA as TextArea) As AttributedString
		  //# Get the AttributedString corresponding to the TextArea's contents
		  
		  //@ Every change to the returned AttributedString will be echoed to the TextArea contents (AttributedString must have its "mutable" property set to true, which is the default)
		  
		  #if TargetMacOS
		    declare function documentView lib CocoaLib selector "documentView" (id as Ptr ) as Ptr
		    declare function attributedString lib CocoaLib selector "attributedString" (id as Ptr) as Ptr
		    
		    dim NSMAS as NSMutableAttributedString
		    dim p as Ptr
		    
		    p = documentView( Ptr( TA.Handle )) //Document contents
		    p = attributedString( p ) //Document's AttributedString
		    
		    NSMAS = new NSMutableAttributedString( p, false )  //Actually a NSConcreteTextStorage
		    
		    return  new AttributedString( NSMAS )
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Documentation
		AttributedStrings are roughly equivalent to StyledText but they are much more powerful. Actually, AttributedStrings can even handle full word processing documents with tables,
		links, images and so on, if the backing storage allows it.
		
		
		The purpose of this module is to keep you away from the uneasy stuff of the native NSAttributedString objects.
	#tag EndNote


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

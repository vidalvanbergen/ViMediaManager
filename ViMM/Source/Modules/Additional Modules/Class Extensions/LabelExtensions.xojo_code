#tag Module
Protected Module LabelExtensions
	#tag Method, Flags = &h0
		Function Editable(Extends LBL as Label) As Boolean
		  //# Returns a Boolean value indicating whether the user is allowed to select and edit the label's text.
		  
		  #if TargetCocoa then
		    declare function isEditable lib CocoaLib selector "isEditable" (obj_id as Integer) as Boolean
		    
		    return isEditable(LBL.handle)
		  #else
		    #pragma unused LBL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Editable(Extends LBL as Label, Assigns value as Boolean)
		  //# Controls whether the user can edit the label’s text.
		  
		  #if TargetCocoa then
		    declare sub setEditable lib CocoaLib selector "setEditable:" (obj_id as Integer, value as Boolean)
		    
		    setEditable(LBL.handle, value)
		  #else
		    #pragma unused LBL
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LineBreak(extends TF as Label, assigns mode as integer)
		  //# Set the paragraph LineBreak option for a Label
		  
		  //@ Use the kNSLineBreak... options
		  //@ It will work only if you set the Multiline option for the Label
		  
		  #if TargetMacOS
		    declare function attributedStringValue lib CocoaLib selector "attributedStringValue" (id as Ptr) as Ptr
		    declare sub setAttributes lib CocoaLib selector "setAttributes:range:" (id as Ptr, attrs as Ptr, range as Cocoa.NSRange)
		    
		    dim ctrl as NSTextField = new NSTextField( Ptr( TF.Handle ), false )
		    dim p as Ptr
		    p = attributedStringValue( ctrl )
		    
		    dim CurrentString as NSAttributedString
		    dim nsas as NSMutableAttributedString
		    
		    if p<>nil then
		      dim currentNSP as NSParagraphStyle
		      dim range as Cocoa.NSRange
		      dim newNSP as NSMutableParagraphStyle
		      
		      //The AttributedString is immutable, so we need a mutable copy of it
		      CurrentString = new NSAttributedString( p )
		      nsas = new NSMutableAttributedString( CurrentString.MutableCopy )
		      //Also, modifying a ParagraphStyle which is already in an AttributedString can crash the app. So we need to work on a copy.
		      currentNSP = new NSParagraphStyle( nsas.AttributeAtIndex( nsas.kNSParagraphStyleAttributeName, 0, range ))
		      newNSP = new NSMutableParagraphStyle( currentNSP.MutableCopy )
		      newNSP.LineBreakMode = mode
		      
		      dim dict as new NSMutableDictionary
		      dict.Value(new NSString(Cocoa.StringConstant( nsas.kNSParagraphStyleAttributeName ))) = newNSP
		      
		      setAttributes( nsas.id, dict.id, range )
		      ctrl.AttributedStringValue = nsas
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttributedString(extends LBL as Label, theString as AttributedString)
		  //# Set the text of the Label to the passed AttributedString
		  
		  //@ The AttributedString can contain URL links
		  
		  #if TargetMacOS
		    dim nstf as NSTextField = new NSTextField( LBL )
		    
		    //Those two are needed for the links to be clickable
		    nstf.Selectable = true
		    nstf.EditableAttributes = true
		    
		    nstf.AttributedStringValue = Cocoa.NSObjectFromNSPtr( theString.id )
		  #endif
		End Sub
	#tag EndMethod


	#tag Constant, Name = kNSLineBreakByCharWrapping, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByClipping, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByTruncatingHead, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByTruncatingMiddle, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByTruncatingTail, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByWordWrapping, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


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

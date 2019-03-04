#tag Class
Class NSMutableAttributedString
Inherits NSAttributedString
	#tag Method, Flags = &h0
		Function AddAttribute(attributeName as string, value as variant, optional forRange as NSRange) As boolean
		  //@ Simple values like string, numbers, colors can be set in 'value', otherwise, only NSObjects can be used.
		  
		  #if TargetMacOS
		    declare sub addAttribute lib CocoaLib selector "addAttribute:value:range:" (id as Ptr, name as CFStringRef, value as Ptr, aRange as NSRange)
		    
		    dim nsf as NSFont
		    dim range, realrange as NSRange
		    dim realvalue as NSObject
		    
		    if forRange.length=0 then
		      realrange = Cocoa.NSMakeRange( 0, me.Length )
		    else
		      realrange = forRange
		    end if
		    
		    if NOT value IsA NSObject then
		      realvalue = Cocoa.NSObjectFromVariant( value )
		    else
		      realvalue = value
		    end if
		    
		    if attributeName.Left( 2 )="NS" AND attributeName.Right( 13 )="AttributeName" then //Cocoa constant
		      addAttribute( me.id, Cocoa.StringConstant( attributeName ), realvalue.id, realrange )
		      
		    else
		      select case attributeName //Add some convenience methods
		      case me.kAttributeBold //Bold
		        nsf = me.AttributeAtIndex( "NSFontAttributeName", realrange.location, range )
		        if nsf=nil then
		          return  false
		        end if
		        nsf = NSFontManager.SharedManager.ConvertFontToHaveTrait( nsf, NSFontManager.kNSBoldFontMask )
		        if nsf=nil then
		          return  false
		        end if
		        addAttribute( me.id, Cocoa.StringConstant( "NSFontAttributeName" ), nsf.id, realrange )
		        
		      case me.kAttributeItalic //Italic
		        nsf = me.AttributeAtIndex( "NSFontAttributeName", realrange.location, range )
		        if nsf=nil then
		          return  false
		        end if
		        nsf = NSFontManager.SharedManager.ConvertFontToHaveTrait( nsf, NSFontManager.kNSItalicFontMask )
		        if nsf=nil then
		          return  false
		        end if
		        addAttribute( me.id, Cocoa.StringConstant( "NSFontAttributeName" ), nsf.id, realrange )
		        
		      else  //Other attribute
		        addAttribute( me.id, attributeName, realvalue.id, realrange )
		        
		      end select
		    end if
		    
		    return  true
		  #endif
		  
		  'NSString *NSFontAttributeName;
		  'NSString *NSParagraphStyleAttributeName;
		  'NSString *NSForegroundColorAttributeName;
		  'NSString *NSUnderlineStyleAttributeName;
		  'NSString *NSSuperscriptAttributeName;
		  'NSString *NSBackgroundColorAttributeName;
		  'NSString *NSAttachmentAttributeName;
		  'NSString *NSLigatureAttributeName;
		  'NSString *NSBaselineOffsetAttributeName;
		  'NSString *NSKernAttributeName;
		  'NSString *NSLinkAttributeName;
		  'NSString *NSStrokeWidthAttributeName;
		  'NSString *NSStrokeColorAttributeName;
		  'NSString *NSUnderlineColorAttributeName;
		  'NSString *NSStrikethroughStyleAttributeName;
		  'NSString *NSStrikethroughColorAttributeName;
		  'NSString *NSShadowAttributeName;
		  'NSString *NSObliquenessAttributeName;
		  'NSString *NSExpansionAttributeName;
		  'NSString *NSCursorAttributeName;
		  'NSString *NSToolTipAttributeName;
		  'NSString *NSMarkedClauseSegmentAttributeName;
		  'NSString *NSWritingDirectionAttributeName;
		  'NSString *NSVerticalGlyphFormAttributeName;
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendAttributedString(attrString as NSAttributedString)
		  #if TargetMacOS
		    declare sub appendAttributedString lib CocoaLib selector "appendAttributedString:" (id as Ptr, attrS as Ptr)
		    
		    appendAttributedString( me.id, attrString.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginEditing()
		  #if TargetMacOS
		    declare sub beginEditing lib CocoaLib selector "beginEditing" (id as Ptr)
		    
		    if IsEditing then  RETURN
		    
		    beginEditing   me.id
		    IsEditing_ = true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  Super.Constructor( Initialize( Allocate( "NSMutableAttributedString" )), hasOwnership )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteCharactersInRange(range As NSRange)
		  #if TargetMacOS
		    
		    declare sub deleteCharactersInRange lib CocoaLib selector "deleteCharactersInRange:" ( id as Ptr, range As NSRange )
		    
		    deleteCharactersInRange( me.id, range )
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndEditing()
		  #if TargetMacOS
		    declare sub endEditing lib CocoaLib selector "endEditing" (id as Ptr)
		    
		    endEditing   me.id
		    IsEditing_ = false
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FixAttributes(optional inRange as NSRange)
		  #if TargetMacOS
		    declare sub fixAttributesInRange lib CocoaLib selector "fixAttributesInRange:" (id as Ptr, aRange as NSRange)
		    
		    dim realRange as NSRange
		    if inRange.length=0 then //Use full string
		      realRange = Cocoa.NSMakeRange( 0, me.Length )
		    else
		      realRange = inRange
		    end if
		    
		    if IsEditing then
		      fixAttributesInRange( me.id, realRange )
		    else
		      BeginEditing
		      fixAttributesInRange( me.id, realRange )
		      EndEditing
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertAttributedString(attrString As NSAttributedString, index As Integer)
		  #if TargetMacOS
		    
		    declare sub insertAttributedString lib CarbonLib selector "insertAttributedString:atIndex:" ( obj_id As Ptr, attributedString As Ptr, atIndex As Integer )
		    // Introduced in MacOS X 10.0.
		    
		    insertAttributedString( self, attrString, index )
		    
		  #else
		    
		    #pragma unused index
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveAttribute(attributeName as string, optional forRange as NSRange) As Boolean
		  //@ Simple values like string, numbers, colors can be set in 'value', otherwise, only NSObjects can be used.
		  
		  #if TargetMacOS
		    declare sub removeAttribute lib CocoaLib selector "removeAttribute:range:" (id as Ptr, name as CFStringRef, aRange as NSRange)
		    
		    'dim mgr as NSFontManager = NSFontManager.SharedManager
		    dim realrange as NSRange
		    
		    if forRange.length=0 then
		      realrange = Cocoa.NSMakeRange( 0, me.Length )
		    else
		      realrange = forRange
		    end if
		    
		    removeAttribute( self, Cocoa.StringConstant( attributeName ), realrange )
		    
		    return  true
		  #endif
		  
		  'NSString *NSFontAttributeName;
		  'NSString *NSParagraphStyleAttributeName;
		  'NSString *NSForegroundColorAttributeName;
		  'NSString *NSUnderlineStyleAttributeName;
		  'NSString *NSSuperscriptAttributeName;
		  'NSString *NSBackgroundColorAttributeName;
		  'NSString *NSAttachmentAttributeName;
		  'NSString *NSLigatureAttributeName;
		  'NSString *NSBaselineOffsetAttributeName;
		  'NSString *NSKernAttributeName;
		  'NSString *NSLinkAttributeName;
		  'NSString *NSStrokeWidthAttributeName;
		  'NSString *NSStrokeColorAttributeName;
		  'NSString *NSUnderlineColorAttributeName;
		  'NSString *NSStrikethroughStyleAttributeName;
		  'NSString *NSStrikethroughColorAttributeName;
		  'NSString *NSShadowAttributeName;
		  'NSString *NSObliquenessAttributeName;
		  'NSString *NSExpansionAttributeName;
		  'NSString *NSCursorAttributeName;
		  'NSString *NSToolTipAttributeName;
		  'NSString *NSMarkedClauseSegmentAttributeName;
		  'NSString *NSWritingDirectionAttributeName;
		  'NSString *NSVerticalGlyphFormAttributeName;
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceCharactersInRange(aRange As Cocoa.NSRange, attrString As NSAttributedString)
		  #if TargetMacOS
		    
		    declare sub replaceCharactersInRange lib CarbonLib selector "replaceCharactersInRange:withAttributedString:" ( obj_id As Ptr, aRange As Cocoa.NSRange, attrString As Ptr )
		    // Introduced in MacOS X 10.0.
		    
		    replaceCharactersInRange( self, aRange, attrString )
		    
		  #else
		    
		    #pragma unused aRange
		    #pragma unused attrString
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceCharactersInRange(aRange As Cocoa.NSRange, s As NSString)
		  #if TargetMacOS
		    
		    declare sub replaceCharactersInRange lib CarbonLib selector "replaceCharactersInRange:withString:" ( obj_id As Ptr, aRange As Cocoa.NSRange, s As Ptr )
		    // Introduced in MacOS X 10.0.
		    
		    replaceCharactersInRange( self, aRange, s )
		    
		  #else
		    
		    #pragma unused aRange
		    #pragma unused s
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttributedString(attrString as NSAttributedString)
		  #if TargetMacOS
		    declare sub setAttributedString lib CocoaLib selector "setAttributedString:" (id as Ptr, attrS as Ptr)
		    
		    setAttributedString( me, attrString )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttributes(attribs as NSDictionary, range as NSRange)
		  #if TargetMacOS
		    declare sub setAttributes lib CocoaLib selector "setAttributes:range:" (id as Ptr, attr as Ptr, aRange as NSRange)
		    
		    setAttributes me, attribs, range
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Subscript(optional inRange as NSRange)
		  #if TargetMacOS
		    declare sub subscriptRange lib CocoaLib selector "subscriptRange:" (id as Ptr, aRange as NSRange)
		    
		    dim realRange as NSRange
		    if inRange.length=0 then //Use full string
		      realRange = Cocoa.NSMakeRange( 0, me.Length )
		    else
		      realRange = inRange
		    end if
		    
		    if IsEditing then
		      subscriptRange( me.id, realRange )
		      FixAttributes   realRange
		    else
		      BeginEditing
		      subscriptRange( me.id, realRange )
		      FixAttributes   realRange
		      EndEditing
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Superscript(optional inRange as NSRange)
		  #if TargetMacOS
		    declare sub superscriptRange lib CocoaLib selector "superscriptRange:" (id as Ptr, aRange as NSRange)
		    
		    dim realRange as NSRange
		    if inRange.length=0 then //Use full string
		      realRange = Cocoa.NSMakeRange( 0, me.Length )
		    else
		      realRange = inRange
		    end if
		    
		    if IsEditing then
		      superscriptRange( me.id, realRange )
		      FixAttributes   realRange
		    else
		      BeginEditing
		      superscriptRange( me.id, realRange )
		      FixAttributes   realRange
		      EndEditing
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unscript(optional inRange as NSRange)
		  #if TargetMacOS
		    declare sub unscriptRange lib CocoaLib selector "unscriptRange:" (id as Ptr, aRange as NSRange)
		    
		    dim realRange as NSRange
		    if inRange.length=0 then //Use full string
		      realRange = Cocoa.NSMakeRange( 0, me.Length )
		    else
		      realRange = inRange
		    end if
		    
		    if IsEditing then
		      unscriptRange( me.id, realRange )
		      FixAttributes   realRange
		    else
		      BeginEditing
		      unscriptRange( me.id, realRange )
		      FixAttributes   realRange
		      EndEditing
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return   IsEditing_
			End Get
		#tag EndGetter
		IsEditing As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private IsEditing_ As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim s as NSMutableString
			  
			  #if TargetMacOS
			    
			    declare Function mutableString lib CocoaLib selector "mutableString" (id as Ptr) as Ptr
			    // Introduced in MacOS X 10.0.
			    
			    dim p as Ptr = mutableString( self )
			    if p <> nil then
			      s = new NSMutableString( p, not hasOwnership )
			    end if
			    
			  #endif
			  
			  return s
			  
			End Get
		#tag EndGetter
		MutableString As NSMutableString
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

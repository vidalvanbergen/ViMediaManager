#tag Module
Protected Module TextFieldExtension
	#tag Method, Flags = &h0
		Function AttributedStringValue(extends TF as TextField) As AttributedString
		  //# Returns the value of the text field’s cell as an attributed string.
		  
		  #if TargetMacOS then
		    declare function attributedStringValue lib CocoaLib selector "attributedStringValue:" (id as Ptr) as Ptr
		    
		    dim ctrl as Ptr = TF.TextViewRef //Ptr( TF.Handle )
		    dim p as Ptr
		    p = attributedStringValue( ctrl )
		    
		    if p<>nil then
		      return   new AttributedString( new NSAttributedString( p ))
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bezeled(Extends t as TextField) As Boolean
		  //# Returns whether the text field has a bezeled border.
		  
		  #if TargetCocoa then
		    declare function isBezeled lib CocoaLib selector "isBezeled" (obj_id as Integer) as Boolean
		    
		    return isBezeled(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bezeled(Extends t as TextField, Assigns value as Boolean)
		  //# Specifies whether the text field draws a bezeled border.
		  
		  #if TargetCocoa then
		    declare sub setBezeled lib CocoaLib selector "setBezeled:" (obj_id as Integer, flag as Boolean)
		    
		    setBezeled(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BezelStyle(Extends t as TextField) As NSTextFieldBezelStyle
		  //# Returns the text field’s bezel style.
		  
		  #if TargetCocoa then
		    declare function bezelStyle lib CocoaLib selector "bezelStyle" (obj_id as Integer) as NSTextFieldBezelStyle
		    
		    return bezelStyle(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BezelStyle(Extends t as TextField, Assigns style as NSTextFieldBezelStyle)
		  //# Sets the text field’s bezel style.
		  
		  #if TargetCocoa then
		    declare sub setBezelStyle lib CocoaLib selector "setBezelStyle:" (obj_id as Integer, style as NSTextFieldBezelStyle)
		    
		    setBezelStyle(t.handle, style)
		  #else
		    #pragma unused t
		    #pragma unused style
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bordered(Extends t as TextField) As Boolean
		  //# Returns a Boolean value indicating whether the text field draws a black border around its contents.
		  
		  #if TargetCocoa then
		    declare function isBordered lib CocoaLib selector "isBordered" (obj_id as Integer) as Boolean
		    
		    return isBordered(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bordered(Extends t as TextField, Assigns value as Boolean)
		  //# Controls whether the text field draws a solid black border around its contents.
		  
		  #if TargetCocoa then
		    declare sub setBordered lib CocoaLib selector "setBordered:" (obj_id as Integer, flag as Boolean)
		    
		    setBordered(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue(Extends t as TextField) As Double
		  //# Returns the value of the text field’s cell as a double-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare function doubleValue lib CocoaLib selector "doubleValue" (obj_id as Integer) as Double
		    
		    return doubleValue(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleValue(Extends t as TextField, Assigns value as Double)
		  //# Sets the value of the text field’s cell using a double-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare sub setDoubleValue lib CocoaLib selector "setDoubleValue:" (obj_id as Integer, value as Double)
		    
		    setDoubleValue(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Editable(Extends t as TextField) As Boolean
		  //# Returns a Boolean value indicating whether the user is allowed to select and edit the text field's text.
		  
		  #if TargetCocoa then
		    declare function isEditable lib CocoaLib selector "isEditable" (obj_id as Integer) as Boolean
		    
		    return isEditable(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Editable(Extends t as TextField, Assigns value as Boolean)
		  //# Controls whether the user can edit the text field’s text.
		  
		  #if TargetCocoa then
		    declare sub setEditable lib CocoaLib selector "setEditable:" (obj_id as Integer, flag as Boolean)
		    
		    setEditable(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(Extends t as TextField) As Integer
		  //# Returns the value of the text field’s cell as an NSInteger value.
		  
		  #if TargetCocoa then
		    declare function integerValue lib CocoaLib selector "integerValue" (obj_id as Integer) as Integer
		    
		    return integerValue(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntegerValue(Extends t as TextField, Assigns value as Integer)
		  //# Sets the value of the text field’s cell using an NSInteger value.
		  
		  #if TargetCocoa then
		    declare sub setIntegerValue lib CocoaLib selector "setIntegerValue:" (obj_id as Integer, value as Integer)
		    
		    setIntegerValue(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlaceholderString(extends t as TextField) As String
		  //# Returns the cell’s plain text placeholder string.
		  
		  #if TargetMacOS then
		    declare function cell lib CocoaLib selector "cell" (obj_id as Ptr) as Ptr
		    declare function placeholderString lib CocoaLib selector "placeholderString" (obj_id as Ptr) as Ptr
		    
		    return RetainedStringValue(placeholderString(cell(Ptr(t.Handle))))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PlaceholderString(extends t as TextField, assigns value as String)
		  //# Sets the placeholder of the cell as a plain text string.
		  
		  #if TargetMacOS then
		    declare function cell lib CocoaLib selector "cell" (obj_id as Ptr) as Ptr
		    declare sub setPlaceholderString lib CocoaLib selector "setPlaceholderString:" (obj_id as Ptr, s as CFStringRef)
		    
		    setPlaceholderString(cell(Ptr(t.Handle)), value)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Selectable(Extends t as TextField) As Boolean
		  //# Returns a Boolean value indicating whether the user is allowed to select the text field’s text.
		  
		  #if TargetCocoa then
		    declare function isSelectable lib CocoaLib selector "isSelectable" (obj_id as Integer) as Boolean
		    
		    return isSelectable(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Selectable(Extends t as TextField, Assigns value as Boolean)
		  //# Sets whether the text field is selectable (but not editable).
		  
		  #if TargetCocoa then
		    declare sub setSelectable lib CocoaLib selector "setSelectable:" (obj_id as Integer, flag as Boolean)
		    
		    setSelectable(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLineBreak(extends TF as TextField, assigns mode as integer)
		  
		  #if TargetMacOS then
		    declare function attributedStringValue lib CocoaLib selector "attributedStringValue" (id as Ptr) as Ptr
		    declare sub setAttributes lib CocoaLib selector "setAttributes:range:" (id as Ptr, attrs as Ptr, range as Cocoa.NSRange)
		    
		    dim ctrl as Ptr = Ptr( TF.Handle )
		    dim p as Ptr
		    p = attributedStringValue( ctrl )
		    dim s() as string = Cocoa.ClassNameTreeForObjectPointer( p )
		    #pragma unused s
		    
		    dim nsas as NSMutableAttributedString
		    
		    if p<>nil then
		      dim currentNSP as NSParagraphStyle
		      dim range as Cocoa.NSRange
		      dim newNSP as NSMutableParagraphStyle
		      
		      nsas = new NSMutableAttributedString( p )
		      currentNSP = new NSParagraphStyle( nsas.AttributeAtIndex( nsas.kNSParagraphStyleAttributeName, 0, range ))
		      newNSP = new NSMutableParagraphStyle( currentNSP.MutableCopy )
		      
		      newNSP.LineBreakMode = mode
		      
		      'call   nsas.AddAttribute( nsas.kNSParagraphStyleAttributeName, newNSP, Cocoa.NSMakeRange( 0, nsas.Length ))
		      dim dict as new NSMutableDictionary
		      dict.Value(new NSString( Cocoa.StringConstant( nsas.kNSParagraphStyleAttributeName ))) = newNSP
		      'call   nsas.AddAttribute( nsas.kNSParagraphStyleAttributeName, newNSP, range )
		      
		      setAttributes( nsas.id, dict.id, range )
		      
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SingleValue(Extends t as TextField) As Double
		  //# Returns the value of the text field’s cell as a single-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare function floatValue lib CocoaLib selector "floatValue" (obj_id as Integer) as Double
		    
		    return floatValue(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SingleValue(Extends t as TextField, Assigns value as Double)
		  //# Sets the value of the text field’s cell using a single-precision floating-point number.
		  
		  #if TargetCocoa then
		    declare sub setFloatValue lib CocoaLib selector "setFloatValue:" (obj_id as Integer, value as Double)
		    
		    setFloatValue(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextViewRef(extends t as TextField) As Ptr
		  #if TargetCocoa then
		    declare function documentView lib CocoaLib selector "documentView" (obj_id as Integer) as Ptr
		    
		    return documentView(t.Handle)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod


	#tag Enum, Name = NSTextFieldBezelStyle, Flags = &h0
		NSTextFieldSquareBezel
		NSTextFieldRoundedBezel
	#tag EndEnum


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

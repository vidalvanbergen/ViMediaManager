#tag Class
Class NSAttributedString
Inherits NSObject
	#tag Method, Flags = &h0
		Function AttributeAtIndex(attributeName as string, atIndex as integer, Byref range as NSRange) As variant
		  //# Returns the value for an attribute with a given name of the character at a given index, and by reference the range over which the attribute applies.
		  
		  #if TargetMacOS
		    declare function m_attribute lib CocoaLib selector "attribute:atIndex:effectiveRange:" (id as Ptr, attr as CFStringRef, idx as integer, byref range as NSRange) as Ptr
		    
		    dim p as Ptr
		    if attributeName.Left( 2 )="NS" AND attributeName.Right( 13 )="AttributeName" then //Cocoa constant
		      p = m_attribute( me.id, Cocoa.StringConstant( attributeName ), atIndex, range )
		    else
		      p = m_attribute( me.id, attributeName, atIndex, range )
		    end if
		    
		    if p = nil then
		      return nil
		    else
		      return Cocoa.NSObjectFromNSPtr( p )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributedSubstringFromRange(range as NSRange) As NSAttributedString
		  //# Returns the attributed string for the provided range of text. (required)
		  
		  #if TargetMacOS
		    declare function attributedSubstringFromRange lib CocoaLib selector "attributedSubstringFromRange:" ( id as Ptr, range as NSRange ) as Ptr
		    
		    return new NSAttributedString( attributedSubstringFromRange( self, range ) )
		  #else
		    #pragma Unused range
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributesAtIndex_LongestEffectiveRange(atIndex as integer, byref effectiveRange as NSRange, maxRange as NSRange) As NSDictionary
		  //# Returns the attributes for the character at a given index, and by reference the range over which the attributes apply.
		  
		  #if TargetMacOS
		    declare function attributesAtIndex lib CocoaLib selector "attributesAtIndex:longestEffectiveRange:inRange:" (id as Ptr, idx as integer, byref range as NSRange, maxRange as NSRange) as Ptr
		    
		    dim p as Ptr = attributesAtIndex( self, atIndex, effectiveRange, maxRange )
		    return new NSDictionary( p )
		  #else
		    #pragma Unused atIndex
		    #pragma Unused effectiveRange
		    #pragma Unused maxRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BlockRange(block as NSTextBlock, location as UInt32) As Cocoa.NSRange
		  //# Returns the range of the individual text block that contains the given location.
		  
		  #if targetMacOS
		    declare function rangeOfTextBlock lib CocoaLib selector "rangeOfTextBlock:atIndex:" (obj_id as Ptr, block as Ptr, location as UInt32) as Cocoa.NSRange
		    
		    dim blockRef as Ptr
		    if block <> nil then
		      blockRef = block
		    end if
		    
		    return rangeOfTextBlock(self, blockRef, location)
		    
		  #else
		    #pragma unused block
		    #pragma unused location
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BoundingRect(size as Cocoa.NSSize, options as Integer) As Cocoa.NSRect
		  //# Calculates and returns bounding rectangle for the NSAttributedString drawn using the options specified, within the given rectangle in the current graphics context.
		  
		  #if targetMacOS
		    declare function boundingRectWithSize lib CocoaLib selector "boundingRectWithSize:options:" (obj_id as Ptr, size as Cocoa.NSSize, options as Integer) as Cocoa.NSRect
		    
		    return boundingRectWithSize(self, size, options)
		    
		  #else
		    #pragma unused size
		    #pragma unused options
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSAttributedString")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(cfa as CFAttributedString)
		  // Adopts a CFAttributedString
		  
		  super.Constructor (cfa, not hasOwnership)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aString as NSAttributedString)
		  //# Returns an NSAttributedString object initialized with the characters and attributes of another given attributed string.
		  
		  #if targetMacOS
		    declare function initWithAttributedString lib CocoaLib selector "initWithAttributedString:" (obj_id as Ptr, aString as Ptr) as Ptr
		    
		    dim stringRef as Ptr
		    if aString <> nil then
		      stringRef = aString
		    end if
		    
		    super.Constructor(initWithAttributedString(Allocate("NSAttributedString"), stringRef), NSAttributedString.hasOwnership)
		  #else
		    #pragma unused aString
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(data as NSData, options as NSDictionary, byRef docAttributes as NSDictionary, byRef error as NSError)
		  //# Initializes and returns a new attributed string object from the data contained in the given data object.
		  
		  #if targetMacOS
		    declare function initWithData lib CocoaLib selector "initWithData:options:documentAttributes:error:" (obj_id as Ptr, data as Ptr, options as Ptr, byRef docAttributes as Ptr, byRef error as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim optionsRef as Ptr
		    if options <> nil then
		      optionsRef = options
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim errorRef as Ptr
		    
		    super.Constructor(initWithData(Allocate("NSAttributedString"), dataRef, optionsRef, docAttributesRef, errorRef), NSAttributedString.hasOwnership)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused options
		    #pragma unused docAttributes
		    #pragma unused error
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(text as String)
		  //# Returns an NSAttributedString object initialized with the characters of a given string and no attribute information.
		  
		  #if TargetMacOS
		    declare function initWithString lib CocoaLib selector "initWithString:" (id as Ptr, theString as CFStringRef) as Ptr
		    
		    super.Constructor(initWithString(Allocate("NSAttributedString"), text), hasOwnership)
		  #else
		    #pragma unused text
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(text as String, attr as NSDictionary)
		  //# Returns an NSAttributedString object initialized with a given string and attributes.
		  
		  #if TargetMacOS
		    declare function initWithString lib CocoaLib selector "initWithString:attributes:" (id as Ptr, theString as CFStringRef, attr as Ptr) as Ptr
		    
		    dim p as Ptr = initWithString (Allocate ("NSAttributedString"), text, attr)
		    super.Constructor (p, hasOwnership)
		  #else
		    #pragma unused text
		    #pragma unused attr
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ContainsAttachments() As Boolean
		  //# Returns whether the attribute string contains any attachment attributes.
		  
		  #if targetMacOS
		    declare function containsAttachments lib CocoaLib selector "containsAttachments" (obj_id as Ptr) as Boolean
		    
		    return containsAttachments(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromAttachment(attachment as NSTextAttachment) As NSAttributedString
		  //# Creates an attributed string with an attachment.
		  
		  #if TargetMacOS
		    declare function attributedStringWithAttachment lib CocoaLib selector "attributedStringWithAttachment:" (class_id as Ptr, attachment as Ptr) as Ptr
		    
		    dim attachmentRef as Ptr
		    if attachment <> nil then
		      attachmentRef = attachment
		    end if
		    
		    dim stringRef as Ptr = attributedStringWithAttachment(ClassRef, attachmentRef)
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef)
		    end if
		    
		  #else
		    #pragma unused attachment
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromDocFormat(data as NSData, byRef docAttributes as NSDictionary) As NSAttributedString
		  //# Initializes and returns a new NSAttributedString object from Microsoft Word format data contained in the given NSData object.
		  
		  #if targetMacOS
		    declare function initWithDocFormat lib CocoaLib selector "initWithDocFormat:documentAttributes:" (obj_id as Ptr, data as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithDocFormat(Allocate("NSAttributedString"), dataRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromFile(file as FolderItem, byRef docAttributes as NSDictionary) As NSAttributedString
		  //# Initializes a new attribute string object from RTF or RTFD data contained in the file at the given path.
		  
		  #if targetMacOS
		    declare function initWithPath lib CocoaLib selector "initWithPath:documentAttributes:" (obj_id as Ptr, path as CFStringRef, byRef docAttributes as Ptr) as Ptr
		    
		    if file <> nil then
		      dim docAttributesRef as Ptr
		      if docAttributes <> nil then
		        docAttributesRef = docAttributes
		      end if
		      
		      dim stringRef as Ptr = initWithPath(Allocate("NSAttributedString"), file.POSIXPath, docAttributesRef)
		      
		      if docAttributesRef <> nil then
		        docAttributes = new NSDictionary(docAttributesRef)
		      end if
		      
		      if stringRef <> nil then
		        return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromHTML(data as NSData, byRef docAttributes as NSDictionary) As NSAttributedString
		  //# Initializes and returns a new NSAttributedString object from HTML contained in the given data object.
		  
		  #if targetMacOS
		    declare function initWithHTML lib CocoaLib selector "initWithHTML:documentAttributes:" (obj_id as Ptr, data as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithHTML(Allocate("NSAttributedString"), dataRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromHTML(data as NSData, options as NSDictionary, byRef docAttributes as NSDictionary) As NSAttributedString
		  
		  #if targetMacOS
		    declare function initWithHTML lib CocoaLib selector "initWithHTML:options:documentAttributes:" _
		    (obj_id as Ptr, data as Ptr, options as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim optionsRef as Ptr
		    if options <> nil then
		      optionsRef = options
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithHTML(Allocate("NSAttributedString"), dataRef, optionsRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused options
		    #pragma unused docAttributes
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromHTML(HTMLdata as NSData, baseURL as NSURL = nil) As NSAttributedString
		  
		  #if TargetMacOS
		    declare function initWithHTML lib CocoaLib selector "initWithHTML:documentAttributes:" ( id as Ptr, data as Ptr, docAttr as Ptr) as Ptr
		    declare function initWithHTMLandBase lib CocoaLib selector "initWithHTML:baseURL:documentAttributes:" ( id as Ptr, data as Ptr, baseURL as Ptr, docAttr as Ptr) as Ptr
		    
		    dim p as Ptr = Allocate( "NSAttributedString" )
		    if baseURL = nil then
		      p = initWithHTML( p, HTMLData, nil )
		    else
		      p = initWithHTMLandBase( p, HTMLData, baseURL, nil )
		    end if
		    if p <> nil then
		      return new NSAttributedString( p )
		    end if
		    
		  #else
		    #pragma unused HTMLData
		    #pragma unused baseURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromHTML(data as NSData, baseURL as NSURL, byRef docAttributes as NSDictionary) As NSAttributedString
		  
		  #if targetMacOS
		    declare function initWithHTML lib CocoaLib selector "initWithHTML:baseURL:documentAttributes:" _
		    (obj_id as Ptr, data as Ptr, baseURL as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim urlRef as Ptr
		    if baseURL <> nil then
		      urlRef = baseURL
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithHTML(Allocate("NSAttributedString"), dataRef, urlRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused baseURL
		    #pragma unused docAttributes
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromRTF(RTFdata as NSData) As NSAttributedString
		  #if TargetMacOS
		    declare function initWithRTF lib CocoaLib selector "initWithRTF:documentAttributes:" ( id as Ptr, data as Ptr, docAttr as Ptr) as Ptr
		    
		    dim p as Ptr = Allocate( "NSAttributedString" )
		    p = initWithRTF( p, RTFData, nil )
		    if p <> nil then
		      return  new NSAttributedString( p )
		    end if
		    
		  #else
		    #pragma unused RTFdata
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromRTF(data as NSData, byRef docAttributes as NSDictionary) As NSAttributedString
		  //# Initializes a new attributed string object by decoding the stream of RTF commands and data contained in the given data object.
		  
		  #if targetMacOS
		    declare function initWithRTF lib CocoaLib selector "initWithRTF:documentAttributes:" (obj_id as Ptr, data as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithRTF(Allocate("NSAttributedString"), dataRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromRTFD(RTFDdata as NSData) As NSAttributedString
		  //# Initializes a new attributed string object by decoding the stream of RTFD commands and data contained in the given data object.
		  
		  #if TargetMacOS
		    declare function initWithRTFD lib CocoaLib selector "initWithRTFD:documentAttributes:" ( id as Ptr, data as Ptr, docAttr as Ptr) as Ptr
		    
		    dim p as Ptr = Allocate( "NSAttributedString" )
		    p = initWithRTFD( p, RTFDdata, nil )
		    if p <> nil then
		      return  new NSAttributedString( p )
		    end if
		    
		  #else
		    #pragma unused RTFDdata
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromRTFD(data as NSData, byRef docAttributes as NSDictionary) As NSAttributedString
		  //# Initializes a new attributed string object by decoding the stream of RTFD commands and data contained in the given data object.
		  
		  #if targetMacOS
		    declare function initWithRTFD lib CocoaLib selector "initWithRTFD:documentAttributes:" (obj_id as Ptr, data as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if data <> nil then
		      dataRef = data
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithRTFD(Allocate("NSAttributedString"), dataRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromRTFD(wrapper as NSFileWrapper, byRef docAttributes as NSDictionary) As NSAttributedString
		  //# Initializes a new attributed string object from the specified file wrapper containing an RTFD document.
		  
		  #if targetMacOS
		    declare function initWithRTFDFileWrapper lib CocoaLib selector "initWithRTFDFileWrapper:documentAttributes:" (obj_id as Ptr, wrapper as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim wrapperRef as Ptr
		    if wrapper <> nil then
		      wrapperRef = wrapper
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithRTFDFileWrapper(Allocate("NSAttributedString"), wrapperRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused wrapper
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromString_NoAttributes(text as String) As NSAttributedString
		  return new NSAttributedString (text)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromString_WithAttributes(text as String, attr as NSDictionary) As NSAttributedString
		  return new NSAttributedString (text, attr)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromURL(aURL as NSURL, byRef docAttributes as NSDictionary) As NSAttributedString
		  //# Initializes a new attributed string object from the data at the given URL.
		  
		  #if targetMacOS
		    declare function initWithURL lib CocoaLib selector "initWithURL:documentAttributes:" (obj_id as Ptr, aURL as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithURL(Allocate("NSAttributedString"), urlRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused aURL
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromURL(aURL as NSURL, options as NSDictionary, byRef docAttributes as NSDictionary) As NSAttributedString
		  //# Initializes a new NSAttributedString object from the contents of the given URL.
		  
		  #if targetMacOS
		    declare function initWithURL lib CocoaLib selector "initWithURL:options:documentAttributes:error:" (obj_id as Ptr, aURL as Ptr, options as Ptr, byRef docAttributes as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim optionsRef as Ptr
		    if options <> nil then
		      optionsRef = options
		    end if
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim stringRef as Ptr = initWithURL(Allocate("NSAttributedString"), urlRef, optionsRef, docAttributesRef)
		    
		    if docAttributesRef <> nil then
		      docAttributes = new NSDictionary(docAttributesRef)
		    end if
		    
		    if stringRef <> nil then
		      return new NSAttributedString(stringRef, NSAttributedString.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused aURL
		    #pragma unused options
		    #pragma unused docAttributes
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Data(aRange as Cocoa.NSRange, docAttributes as NSDictionary, byRef error as NSError) As NSData
		  //# Returns an data object that contains a text stream corresponding to the characters and attributes within the given range.
		  
		  #if targetMacOS
		    declare function dataFromRange lib CocoaLib selector "dataFromRange:documentAttributes:error:" (obj_id as Ptr, aRange as Cocoa.NSRange, docAttributes as Ptr, byRef error as Ptr) as Ptr
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim errorRef as Ptr
		    
		    dim dataRef as Ptr = dataFromRange(self, aRange, docAttributesRef, errorRef)
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		    #pragma unused docAttributes
		    #pragma unused error
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function DocFormat(aRange as Cocoa.NSRange, docAttributes as NSDictionary) As NSData
		  //# Returns a data object that contains a Microsoft Word–format stream corresponding to the characters and attributes within the specified range.
		  
		  #if targetMacOS
		    declare function docFormatFromRange lib CocoaLib selector "docFormatFromRange:documentAttributes:" (obj_id as Ptr, aRange as Cocoa.NSRange, docAttributes as Ptr) as Ptr
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim dataRef as Ptr = docFormatFromRange(self, aRange, docAttributesRef)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function DoubleClickRange(index as UInt32) As Cocoa.NSRange
		  //# Returns the range of characters that form a word (or other linguistic unit) surrounding the given index, taking language characteristics into account.
		  
		  #if targetMacOS
		    declare function doubleClickAtIndex lib CocoaLib selector "doubleClickAtIndex:" (obj_id as Ptr, index as UInt32) as Cocoa.NSRange
		    
		    return doubleClickAtIndex(self, index)
		  #else
		    #pragma unused index
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(point as Cocoa.NSPoint)
		  //# Draws the attributed string starting at the specified point in the current graphics context.
		  
		  #if targetMacOS
		    declare sub drawAtPoint lib CocoaLib selector "drawAtPoint:" (obj_id as Ptr, point as Cocoa.NSPoint)
		    
		    drawAtPoint self, point
		  #else
		    #pragma unused point
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(rect as Cocoa.NSRect)
		  //# Draws the attributed string inside the specified bounding rectangle in the current graphics context.
		  
		  #if targetMacOS
		    declare sub drawInRect lib CocoaLib selector "drawInRect:" (obj_id as Ptr, rect as Cocoa.NSRect)
		    
		    drawInRect self, rect
		  #else
		    #pragma unused rect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(rect as Cocoa.NSRect, options as Integer)
		  //# Draws the NSAttributedString with the specified options, within the given rectangle in the current graphics context.
		  
		  #if targetMacOS
		    declare sub drawWithRect lib CocoaLib selector "drawWithRect:options:" (obj_id as Ptr, rect as Cocoa.NSRect, options as Integer)
		    
		    drawWithRect self, rect, options
		  #else
		    #pragma unused rect
		    #pragma unused options
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileWrapper(aRange as Cocoa.NSRange, docAttributes as NSDictionary, byRef error as NSError) As NSFileWrapper
		  //# Returns an NSFileWrapper object that contains a text stream corresponding to the characters and attributes within the given range.
		  
		  #if targetMacOS
		    declare function fileWrapperFromRange lib CocoaLib selector "fileWrapperFromRange:documentAttributes:error:" (obj_id as Ptr, aRange as Cocoa.NSRange, docAttributes as Ptr, byRef error as Ptr) as Ptr
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim errorRef as Ptr
		    
		    dim wrapperRef as Ptr = fileWrapperFromRange(self, aRange, docAttributesRef, errorRef)
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		    if wrapperRef <> nil then
		      return new NSFileWrapper(wrapperRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		    #pragma unused docAttributes
		    #pragma unused error
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FontAttributes(aRange as Cocoa.NSRange) As NSDictionary
		  //# Returns the font attributes in effect for the character at the given location.
		  
		  #if targetMacOS
		    declare function fontAttributesInRange lib CocoaLib selector "fontAttributesInRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		    
		    dim dictRef as Ptr = fontAttributesInRange(self, aRange)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function GetURL(location as UInt32, byRef effectiveRange as Cocoa.NSRange) As NSURL
		  //# Returns a URL, either from a link attribute or from text at the given location that appears to be a URL string, for use in automatic link detection.
		  
		  #if targetMacOS
		    declare function URLAtIndex lib CocoaLib selector "URLAtIndex:effectiveRange:" (obj_id as Ptr, location as UInt32, byRef aRangePointer as Cocoa.NSRange) as Ptr
		    
		    dim urlRef as Ptr = URLAtIndex(self, location, effectiveRange)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused location
		    #pragma unused effectiveRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(otherString as NSAttributedString) As Boolean
		  //# Returns a Boolean value that indicates whether the NSAttributedString is equal to another given attributed string.
		  
		  #if targetMacOS
		    declare function isEqualToAttributedString lib CocoaLib selector "isEqualToAttributedString:" (obj_id as Ptr, otherString as Ptr) as Boolean
		    
		    dim otherStringRef as Ptr
		    if otherString <> nil then
		      otherStringRef = otherString
		    end if
		    
		    return isEqualToAttributedString(self, otherStringRef)
		  #else
		    #pragma unused otherString
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ListIndex(aList as NSTextList, location as UInt32) As Integer
		  //# Returns the index of the item at the given location within the list.
		  
		  #if targetMacOS
		    declare function itemNumberInTextList lib CocoaLib selector "itemNumberInTextList:atIndex:" (obj_id as Ptr, aList as Ptr, location as UInt32) as Integer
		    
		    dim listRef as Ptr
		    if aList <> nil then
		      listRef = aList
		    end if
		    
		    return itemNumberInTextList(self, listRef, location)
		  #else
		    #pragma unused aList
		    #pragma unused location
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function NextWord(index as UInt32, forward as Boolean) As UInt32
		  //# Returns the index of the first character of the word after or before the given index.
		  
		  #if targetMacOS
		    declare function nextWordFromIndex lib CocoaLib selector "nextWordFromIndex:forward:" (obj_id as Ptr, index as UInt32, forward as Boolean) as UInt32
		    
		    return nextWordFromIndex(self, index, forward)
		  #else
		    #pragma unused index
		    #pragma unused forward
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSAttachmentAttributeName() As Ptr
		  return ResolveSymbol("NSAttachmentAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSAuthorDocumentAttribute() As Ptr
		  return ResolveSymbol("NSAuthorDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSBackgroundColorAttributeName() As Ptr
		  return ResolveSymbol("NSBackgroundColorAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSBackgroundColorDocumentAttribute() As Ptr
		  return ResolveSymbol("NSBackgroundColorDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSBaselineOffsetAttributeName() As Ptr
		  return ResolveSymbol("NSBaselineOffsetAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSBaseURLDocumentOption() As Ptr
		  return ResolveSymbol("NSBaseURLDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSBottomMarginDocumentAttribute() As Ptr
		  return ResolveSymbol("NSBottomMarginDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCategoryDocumentAttribute() As Ptr
		  return ResolveSymbol("NSCategoryDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCharacterEncodingDocumentAttribute() As Ptr
		  return ResolveSymbol("NSCharacterEncodingDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCharacterEncodingDocumentOption() As Ptr
		  return ResolveSymbol("NSCharacterEncodingDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCharacterShapeAttributeName() As Ptr
		  return ResolveSymbol("NSCharacterShapeAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCocoaVersionDocumentAttribute() As Ptr
		  return ResolveSymbol("NSCocoaVersionDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCommentDocumentAttribute() As Ptr
		  return ResolveSymbol("NSCommentDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCompanyDocumentAttribute() As Ptr
		  return ResolveSymbol("NSCompanyDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSConvertedDocumentAttribute() As Ptr
		  return ResolveSymbol("NSConvertedDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCopyrightDocumentAttribute() As Ptr
		  return ResolveSymbol("NSCopyrightDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCreationTimeDocumentAttribute() As Ptr
		  return ResolveSymbol("NSCreationTimeDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSCursorAttributeName() As Ptr
		  return ResolveSymbol("NSCursorAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDefaultAttributesDocumentOption() As Ptr
		  return ResolveSymbol("NSDefaultAttributesDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDefaultTabIntervalDocumentAttribute() As Ptr
		  return ResolveSymbol("NSDefaultTabIntervalDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDocFormatTextDocumentType() As Ptr
		  return ResolveSymbol("NSDocFormatTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDocumentTypeDocumentAttribute() As Ptr
		  return ResolveSymbol("NSDocumentTypeDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDocumentTypeDocumentOption() As Ptr
		  return ResolveSymbol("NSDocumentTypeDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSEditorDocumentAttribute() As Ptr
		  return ResolveSymbol("NSEditorDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSExcludedElementsDocumentAttribute() As Ptr
		  return ResolveSymbol("NSExcludedElementsDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSExpansionAttributeName() As Ptr
		  return ResolveSymbol("NSExpansionAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFileTypeDocumentAttribute() As Ptr
		  return ResolveSymbol("NSFileTypeDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFileTypeDocumentOption() As Ptr
		  return ResolveSymbol("NSFileTypeDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontAttributeName() As Ptr
		  return ResolveSymbol("NSFontAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSForegroundColorAttributeName() As Ptr
		  return ResolveSymbol("NSForegroundColorAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSGlyphInfoAttributeName() As Ptr
		  return ResolveSymbol("NSGlyphInfoAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSHTMLTextDocumentType() As Ptr
		  return ResolveSymbol("NSHTMLTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSHyphenationFactorDocumentAttribute() As Ptr
		  return ResolveSymbol("NSHyphenationFactorDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSKernAttributeName() As Ptr
		  return ResolveSymbol("NSKernAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSKeywordsDocumentAttribute() As Ptr
		  return ResolveSymbol("NSKeywordsDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLeftMarginDocumentAttribute() As Ptr
		  return ResolveSymbol("NSLeftMarginDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLigatureAttributeName() As Ptr
		  return ResolveSymbol("NSLigatureAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLinkAttributeName() As Ptr
		  return ResolveSymbol("NSLinkAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSMacSimpleTextDocumentType() As Ptr
		  return ResolveSymbol("NSMacSimpleTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSManagerDocumentAttribute() As Ptr
		  return ResolveSymbol("NSManagerDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSMarkedClauseSegmentAttributeName() As Ptr
		  return ResolveSymbol("NSMarkedClauseSegmentAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSModificationTimeDocumentAttribute() As Ptr
		  return ResolveSymbol("NSModificationTimeDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSObliquenessAttributeName() As Ptr
		  return ResolveSymbol("NSObliquenessAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSOfficeOpenXMLTextDocumentType() As Ptr
		  return ResolveSymbol("NSOfficeOpenXMLTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSOpenDocumentTextDocumentType() As Ptr
		  return ResolveSymbol("NSOpenDocumentTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPaperSizeDocumentAttribute() As Ptr
		  return ResolveSymbol("NSPaperSizeDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSParagraphStyleAttributeName() As Ptr
		  return ResolveSymbol("NSParagraphStyleAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPlainTextDocumentType() As Ptr
		  return ResolveSymbol("NSPlainTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPrefixSpacesDocumentAttribute() As Ptr
		  return ResolveSymbol("NSPrefixSpacesDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSReadOnlyDocumentAttribute() As Ptr
		  return ResolveSymbol("NSReadOnlyDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSRightMarginDocumentAttribute() As Ptr
		  return ResolveSymbol("NSRightMarginDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSRTFDTextDocumentType() As Ptr
		  return ResolveSymbol("NSRTFDTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSRTFTextDocumentType() As Ptr
		  return ResolveSymbol("NSRTFTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSShadowAttributeName() As Ptr
		  return ResolveSymbol("NSShadowAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSSpellingStateAttributeName() As Ptr
		  return ResolveSymbol("NSSpellingStateAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSStrikethroughColorAttributeName() As Ptr
		  return ResolveSymbol("NSStrikethroughColorAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSStrikethroughStyleAttributeName() As Ptr
		  return ResolveSymbol("NSStrikethroughStyleAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSStrokeColorAttributeName() As Ptr
		  return ResolveSymbol("NSStrokeColorAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSStrokeWidthAttributeName() As Ptr
		  return ResolveSymbol("NSStrokeWidthAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSSubjectDocumentAttribute() As Ptr
		  return ResolveSymbol("NSSubjectDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSSuperscriptAttributeName() As Ptr
		  return ResolveSymbol("NSSuperscriptAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTextEncodingNameDocumentAttribute() As Ptr
		  return ResolveSymbol("NSTextEncodingNameDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTextEncodingNameDocumentOption() As Ptr
		  return ResolveSymbol("NSTextEncodingNameDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTextLayoutSectionOrientation() As Ptr
		  return ResolveSymbol("NSTextLayoutSectionOrientation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTextLayoutSectionRange() As Ptr
		  return ResolveSymbol("NSTextLayoutSectionRange")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTextLayoutSectionsAttribute() As Ptr
		  return ResolveSymbol("NSTextLayoutSectionsAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTextSizeMultiplierDocumentOption() As Ptr
		  return ResolveSymbol("NSTextSizeMultiplierDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTimeoutDocumentOption() As Ptr
		  return ResolveSymbol("NSTimeoutDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTitleDocumentAttribute() As Ptr
		  return ResolveSymbol("NSTitleDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSToolTipAttributeName() As Ptr
		  return ResolveSymbol("NSToolTipAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSTopMarginDocumentAttribute() As Ptr
		  return ResolveSymbol("NSTopMarginDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlineColorAttributeName() As Ptr
		  return ResolveSymbol("NSUnderlineColorAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlinePatternDash() As Ptr
		  return ResolveSymbol("NSUnderlinePatternDash")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlinePatternDashDot() As Ptr
		  return ResolveSymbol("NSUnderlinePatternDashDot")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlinePatternDashDotDot() As Ptr
		  return ResolveSymbol("NSUnderlinePatternDashDotDot")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlinePatternDot() As Ptr
		  return ResolveSymbol("NSUnderlinePatternDot")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlinePatternSolid() As Ptr
		  return ResolveSymbol("NSUnderlinePatternSolid")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlineStyleAttributeName() As Ptr
		  return ResolveSymbol("NSUnderlineStyleAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlineStyleDouble() As Ptr
		  return ResolveSymbol("NSUnderlineStyleDouble")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlineStyleNone() As Ptr
		  return ResolveSymbol("NSUnderlineStyleNone")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlineStyleSingle() As Ptr
		  return ResolveSymbol("NSUnderlineStyleSingle")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSUnderlineStyleThick() As Ptr
		  return ResolveSymbol("NSUnderlineStyleThick")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSVerticalGlyphFormAttributeName() As Ptr
		  return ResolveSymbol("NSVerticalGlyphFormAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSViewModeDocumentAttribute() As Ptr
		  return ResolveSymbol("NSViewModeDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSViewSizeDocumentAttribute() As Ptr
		  return ResolveSymbol("NSViewSizeDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSViewZoomDocumentAttribute() As Ptr
		  return ResolveSymbol("NSViewZoomDocumentAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWebArchiveTextDocumentType() As Ptr
		  return ResolveSymbol("NSWebArchiveTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWebPreferencesDocumentOption() As Ptr
		  return ResolveSymbol("NSWebPreferencesDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWebResourceLoadDelegateDocumentOption() As Ptr
		  return ResolveSymbol("NSWebResourceLoadDelegateDocumentOption")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWordMLTextDocumentType() As Ptr
		  return ResolveSymbol("NSWordMLTextDocumentType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWritingDirectionAttributeName() As Ptr
		  return ResolveSymbol("NSWritingDirectionAttributeName")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(aString as NSAttributedString) As NSAttributedString
		  //Concatenate 2 NSAttributedStrings
		  
		  #if TargetMacOS
		    dim base as NSMutableAttributedString
		    
		    base = new NSMutableAttributedString( self.MutableCopy, hasOwnership )
		    
		    base.BeginEditing
		    base.AppendAttributedString  aString
		    base.FixAttributes
		    base.EndEditing
		    
		    return   base //Return a NSMutableAttributedString
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function PreviousHyphenation(index as UInt32, withinRange as Cocoa.NSRange) As UInt32
		  //# Returns the index of the closest character before the given index, and within the given range, that can be placed on a new line by hyphenating.
		  
		  #if targetMacOS
		    declare function lineBreakByHyphenatingBeforeIndex lib CocoaLib selector "lineBreakByHyphenatingBeforeIndex:withinRange:" (obj_id as Ptr, index as UInt32, aRange as Cocoa.NSRange) as UInt32
		    
		    return lineBreakByHyphenatingBeforeIndex(self, index, withinRange)
		  #else
		    #pragma unused index
		    #pragma unused withinRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function PreviousLineBreak(index as UInt32, withinRange as Cocoa.NSRange) As UInt32
		  //# Returns the appropriate line break when the character at the index won’t fit on the same line as the character at the beginning of the range.
		  
		  #if targetMacOS
		    declare function lineBreakBeforeIndex lib CocoaLib selector "lineBreakBeforeIndex:withinRange:" (obj_id as Ptr, index as UInt32, aRange as Cocoa.NSRange) as UInt32
		    
		    return lineBreakBeforeIndex(self, index, withinRange)
		  #else
		    #pragma unused index
		    #pragma unused withinRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ResolveSymbol(name as String) As Ptr
		  dim b as CFBundle = CFBundle.NewCFBundleFromID("com.apple.Cocoa")
		  return b.DataPointerNotRetained(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RTF(aRange as Cocoa.NSRange, docAttributes as NSDictionary) As NSData
		  //# Returns an NSData object that contains an RTF stream corresponding to the characters and attributes within the given range, omitting all attachment attributes.
		  
		  #if targetMacOS
		    declare function RTFFromRange lib CocoaLib selector "RTFFromRange:documentAttributes:" (obj_id as Ptr, aRange as Cocoa.NSRange, docAttributes as Ptr) as Ptr
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim dataRef as Ptr = RTFFromRange(self, aRange, docAttributesRef)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RTFD(aRange as Cocoa.NSRange, docAttributes as NSDictionary) As NSData
		  //# Returns an data object that contains an RTFD stream corresponding to the characters and attributes within the range.
		  
		  #if targetMacOS
		    declare function RTFDFromRange lib CocoaLib selector "RTFDFromRange:documentAttributes:" (obj_id as Ptr, aRange as Cocoa.NSRange, docAttributes as Ptr) as Ptr
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim dataRef as Ptr = RTFDFromRange(self, aRange, docAttributesRef)
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RTFDFileWrapper(aRange as Cocoa.NSRange, docAttributes as NSDictionary) As NSFileWrapper
		  //# Returns an NSFileWrapper object that contains an RTFD document corresponding to the characters and attributes within the given range.
		  
		  #if targetMacOS
		    declare function RTFDFileWrapperFromRange lib CocoaLib selector "RTFDFileWrapperFromRange:documentAttributes:" (obj_id as Ptr, aRange as Cocoa.NSRange, docAttributes as Ptr) as Ptr
		    
		    dim docAttributesRef as Ptr
		    if docAttributes <> nil then
		      docAttributesRef = docAttributes
		    end if
		    
		    dim wrapperRef as Ptr = RTFDFileWrapperFromRange(self, aRange, docAttributesRef)
		    
		    if wrapperRef <> nil then
		      return new NSFileWrapper(wrapperRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		    #pragma unused docAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RulerAttributes(aRange as Cocoa.NSRange) As NSDictionary
		  //# Returns the ruler (paragraph) attributes in effect for the characters within the given range.
		  
		  #if targetMacOS
		    declare function rulerAttributesInRange lib CocoaLib selector "rulerAttributesInRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		    
		    dim dictRef as Ptr = rulerAttributesInRange(self, aRange)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Size() As Cocoa.NSSize
		  //# Returns the bounding box of the marks that the NSAttributedString draws.
		  
		  #if targetMacOS
		    declare function size lib CocoaLib selector "size" (obj_id as Ptr) as Cocoa.NSSize
		    
		    return size(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StringAttribute(attributeName as String, index as UInt32, byRef effectiveRange as Cocoa.NSRange) As Ptr
		  //# Returns the value for an attribute with a given name of the character at a given index, and by reference the range over which the attribute applies.
		  
		  #if targetMacOS
		    declare function attribute_ lib CocoaLib selector "attribute:atIndex:effectiveRange:" (obj_id as Ptr, attributeName as CFStringRef, index as UInt32, byRef aRange as Cocoa.NSRange) as Ptr
		    
		    return attribute_(self, attributeName, index, effectiveRange)
		  #else
		    #pragma unused attributeName
		    #pragma unused index
		    #pragma unused effectiveRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StringAttribute(attributeName as String, index as UInt32, byRef longestEffectiveRange as Cocoa.NSRange, rangeLimit as Cocoa.NSRange) As Ptr
		  //# Returns the value for the attribute with a given name of the character at a given index, and by reference the range over which the attribute applies.
		  
		  #if targetMacOS
		    declare function attribute_ lib CocoaLib selector "attribute:atIndex:longestEffectiveRange:inRange:" (obj_id as Ptr, attributeName as CFStringRef, index as UInt32, byRef aRange as Cocoa.NSRange, rangeLimit as Cocoa.NSRange) as Ptr
		    
		    return attribute_(self, attributeName, index, longestEffectiveRange, rangeLimit)
		  #else
		    #pragma unused attributeName
		    #pragma unused index
		    #pragma unused longestEffectiveRange
		    #pragma unused rangeLimit
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StringAttributes(index as UInt32, byRef effectiveRange as Cocoa.NSRange) As NSDictionary
		  //# Returns the attributes for the character at a given index.
		  
		  #if targetMacOS
		    declare function attributesAtIndex lib CocoaLib selector "attributesAtIndex:effectiveRange:" (obj_id as Ptr, index as UInt32, byRef aRange as Cocoa.NSRange) as Ptr
		    
		    dim dictRef as Ptr = attributesAtIndex(self, index, effectiveRange)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused index
		    #pragma unused effectiveRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StringAttributes(index as UInt32, byRef longestEffectiveRange as Cocoa.NSRange, rangeLimit as Cocoa.NSRange) As NSDictionary
		  //# Returns the attributes for the character at a given index, and by reference the range over which the attributes apply.
		  
		  #if targetMacOS
		    declare function attributesAtIndex lib CocoaLib selector "attributesAtIndex:longestEffectiveRange:inRange:" (obj_id as Ptr, index as UInt32, byRef aRange as Cocoa.NSRange, rangeLimit as Cocoa.NSRange) as Ptr
		    
		    dim dictRef as Ptr = attributesAtIndex(self, index, longestEffectiveRange, rangeLimit)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused index
		    #pragma unused longestEffectiveRange
		    #pragma unused rangeLimit
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Substring(aRange as NSRange) As NSAttributedString
		  //# Returns the attributed string for the provided range of text.
		  
		  #if targetMacOS
		    if IsLeopard then
		      declare function attributedSubstringFromRange lib CocoaLib selector "attributedSubstringFromRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		      
		      dim stringRef as Ptr = attributedSubstringFromRange(self, aRange)
		      if stringRef <> nil then
		        return new NSAttributedString(stringRef)
		      end if
		      
		    end if
		  #else
		    #pragma unused aRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function TableRange(aTable as NSTextTable, location as UInt32) As Cocoa.NSRange
		  //# Returns the range of the given text table that contains the given location
		  
		  #if targetMacOS
		    declare function rangeOfTextTable lib CocoaLib selector "rangeOfTextTable:atIndex:" (obj_id as Ptr, aTable as Ptr, location as UInt32) as Cocoa.NSRange
		    
		    dim tableRef as Ptr
		    if aTable <> nil then
		      tableRef = aTable
		    end if
		    
		    return rangeOfTextTable(self, tableRef, location)
		  #else
		    #pragma unused aTable
		    #pragma unused location
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function TextTypes() As String()
		  //# Returns an array of UTI strings identifying the file types supported by the NSAttributedString, either directly or through a user-installed filter service.
		  
		  #if TargetMacOS
		    declare function textTypes lib CocoaLib selector "textTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = textTypes(ClassRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function TextUnfilteredTypes() As String()
		  //# Returns an array of UTI strings identifying the file types supported directly by the NSAttributedString.
		  
		  #if TargetMacOS
		    declare function textUnfilteredTypes lib CocoaLib selector "textUnfilteredTypes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = textUnfilteredTypes(ClassRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the length of the NSAttributedString’s string object.
			  
			  #if TargetMacOS
			    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as UInt32
			    
			    return length(self)
			  #endif
			End Get
		#tag EndGetter
		Length As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the character contents of the NSAttributedString as an NSString object.
			  
			  #if TargetMacOS
			    declare function m_string lib CocoaLib selector "string" (obj_id as Ptr) as CFStringRef
			    
			    return m_string(self)
			  #endif
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty


	#tag Constant, Name = kAttributeBold, Type = String, Dynamic = False, Default = \"macoslib_Bold", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAttributeItalic, Type = String, Dynamic = False, Default = \"macoslib_Italic", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSAttachmentAttributeName, Type = String, Dynamic = False, Default = \"NSAttachmentAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSBackgroundColorAttributeName, Type = String, Dynamic = False, Default = \"NSBackgroundColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSBaselineOffsetAttributeName, Type = String, Dynamic = False, Default = \"NSBaselineOffsetAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSCursorAttributeName, Type = String, Dynamic = False, Default = \"NSCursorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSExpansionAttributeName, Type = String, Dynamic = False, Default = \"NSExpansionAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSFontAttributeName, Type = String, Dynamic = False, Default = \"NSFontAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSForegroundColorAttributeName, Type = String, Dynamic = False, Default = \"NSForegroundColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSKernAttributeName, Type = String, Dynamic = False, Default = \"NSKernAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLigatureAttributeName, Type = String, Dynamic = False, Default = \"NSLigatureAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLinkAttributeName, Type = String, Dynamic = False, Default = \"NSLinkAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSMarkedClauseSegmentAttributeName, Type = String, Dynamic = False, Default = \"NSMarkedClauseSegmentAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSObliquenessAttributeName, Type = String, Dynamic = False, Default = \"NSObliquenessAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSParagraphStyleAttributeName, Type = String, Dynamic = False, Default = \"NSParagraphStyleAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSShadowAttributeName, Type = String, Dynamic = False, Default = \"NSShadowAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSStrikethroughColorAttributeName, Type = String, Dynamic = False, Default = \"NSStrikethroughColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSStrikethroughStyleAttributeName, Type = String, Dynamic = False, Default = \"NSStrikethroughStyleAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSStrokeColorAttributeName, Type = String, Dynamic = False, Default = \"NSStrokeColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSStrokeWidthAttributeName, Type = String, Dynamic = False, Default = \"NSStrokeWidthAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSuperscriptAttributeName, Type = String, Dynamic = False, Default = \"NSSuperscriptAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSToolTipAttributeName, Type = String, Dynamic = False, Default = \"NSToolTipAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnderlineColorAttributeName, Type = String, Dynamic = False, Default = \"NSUnderlineColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnderlineStyleAttributeName, Type = String, Dynamic = False, Default = \"NSUnderlineStyleAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSVerticalGlyphFormAttributeName, Type = String, Dynamic = False, Default = \"NSVerticalGlyphFormAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSWritingDirectionAttributeName, Type = String, Dynamic = False, Default = \"NSWritingDirectionAttributeName", Scope = Public
	#tag EndConstant


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

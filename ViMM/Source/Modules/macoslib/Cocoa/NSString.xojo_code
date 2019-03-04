#tag Class
Class NSString
Inherits NSObject
	#tag Method, Flags = &h0
		Function AbbreviatedPath() As String
		  
		  #if targetMacOS
		    declare function stringByAbbreviatingWithTildeInPath lib CocoaLib selector "stringByAbbreviatingWithTildeInPath" (obj_id as Ptr) as CFStringRef
		    
		    return stringByAbbreviatingWithTildeInPath(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AppendPathComponent(aString as String) As String
		  
		  #if targetMacOS
		    declare function stringByAppendingPathComponent lib CocoaLib selector "stringByAppendingPathComponent:" _
		    (obj_id as Ptr, aString as CFStringRef) as CFStringRef
		    
		    return stringByAppendingPathComponent(self, aString)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AppendPathExtension(ext as String) As String
		  
		  #if targetMacOS
		    declare function stringByAppendingPathExtension lib CocoaLib selector "stringByAppendingPathExtension:" _
		    (obj_id as Ptr, ext as CFStringRef) as CFStringRef
		    
		    return stringByAppendingPathExtension(self, ext)
		    
		  #else
		    #pragma unused ext
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function AvailableStringEncodings() As NSStringEncoding()
		  
		  #if TargetMacOS
		    declare function availableStringEncodings lib CocoaLib selector "availableStringEncodings" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as NSStringEncoding
		    
		    dim m as MemoryBlock = availableStringEncodings(ClassRef)
		    
		    dim offset as UInt64 = 0
		    while m.UInt64Value(offset) <> 0
		      rb_array.append NSStringEncoding(m.UInt64Value(offset))
		      offset = offset + SizeOfInteger
		    wend
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BooleanValue() As Boolean
		  
		  #if targetMacOS
		    declare function boolValue lib CocoaLib selector "boolValue" (obj_id as Ptr) as Boolean
		    
		    return boolValue(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BoundingRect(size as Cocoa.NSSize, options as Integer, attribs as NSDictionary) As Cocoa.NSRect
		  
		  #if targetMacOS
		    declare function boundingRectWithSize lib CocoaLib selector "boundingRectWithSize:options:attributes:" _
		    (obj_id as Ptr, size as Cocoa.NSSize, options as Integer, attribs as Ptr) as Cocoa.NSRect
		    
		    dim dictRef as Ptr
		    if attribs <> nil then
		      dictRef = attribs
		    end if
		    
		    return boundingRectWithSize(self, size, options, dictRef)
		    
		  #else
		    #pragma unused size
		    #pragma unused options
		    #pragma unused attribs
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BoundingSize(attribs as NSDictionary) As Cocoa.NSSize
		  
		  #if targetMacOS
		    declare function sizeWithAttributes lib CocoaLib selector "sizeWithAttributes:" (obj_id as Ptr, attribs as Ptr) as Cocoa.NSSize
		    
		    dim dictRef as Ptr
		    if attribs <> nil then
		      dictRef = attribs
		    end if
		    
		    return sizeWithAttributes(self, dictRef)
		    
		  #else
		    #pragma unused attribs
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanBeConverted(anEncoding as NSStringEncoding) As Boolean
		  
		  #if targetMacOS
		    declare function canBeConvertedToEncoding lib CocoaLib selector "canBeConvertedToEncoding:" _
		    (obj_id as Ptr, anEncoding as NSStringEncoding) as Boolean
		    
		    return canBeConvertedToEncoding(self, anEncoding)
		    
		  #else
		    #pragma unused anEncoding
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Char(index as UInt32) As String
		  
		  #if targetMacOS
		    declare function characterAtIndex lib CocoaLib selector "characterAtIndex:" (obj_id as Ptr, index as UInt32) as UInt16
		    
		    dim unichar as UInt16 = characterAtIndex(self, index)
		    
		    return Encodings.UTF16.Chr(unichar)
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Chars(range as Cocoa.NSRange) As String
		  
		  #if targetMacOS
		    declare sub getCharacters lib CocoaLib selector "getCharacters:range:" (obj_id as Ptr, buffer as Ptr, range as Cocoa.NSRange)
		    
		    const sizeOfUnichar = 2
		    
		    dim m as new MemoryBlock(sizeOfUnichar*range.length)
		    getCharacters self, m, range
		    
		    return DefineEncoding(m.Stringvalue(0, m.size), Encodings.UTF16)
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSString")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(aString as NSString) As Cocoa.NSComparisonResult
		  
		  #if targetMacOS
		    declare function compare lib CocoaLib selector "compare:" (obj_id as Ptr, aString as Ptr) as Cocoa.NSComparisonResult
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return compare(self, aStringRef)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(aString as NSString, options as UInt32) As Cocoa.NSComparisonResult
		  
		  #if targetMacOS
		    declare function compare lib CocoaLib selector "compare:options:" (obj_id as Ptr, aString as Ptr, options as UInt32) as Cocoa.NSComparisonResult
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return compare(self, aStringRef, options)
		    
		  #else
		    #pragma unused aString
		    #pragma unused options
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(aString as NSString, options as UInt32, range as Cocoa.NSRange, locale as NSLocale) As Cocoa.NSComparisonResult
		  
		  #if targetMacOS
		    declare function compare lib CocoaLib selector "compare:options:range:locale:" _
		    (obj_id as Ptr, aString as Ptr, options as UInt32, range as Cocoa.NSRange, locale as Ptr) as Cocoa.NSComparisonResult
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    dim localeRef as Ptr
		    if locale <> nil then
		      localeRef = locale
		    end if
		    
		    return compare(self, aStringRef, options, range, localeRef)
		    
		  #else
		    #pragma unused aString
		    #pragma unused options
		    #pragma unused range
		    #pragma unused locale
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareCaseInsensitive(aString as NSString) As Cocoa.NSComparisonResult
		  
		  #if targetMacOS
		    declare function caseInsensitiveCompare lib CocoaLib selector "caseInsensitiveCompare:" (obj_id as Ptr, aString as Ptr) as Cocoa.NSComparisonResult
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return caseInsensitiveCompare(self, aStringRef)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareLocalized(aString as NSString) As Cocoa.NSComparisonResult
		  
		  #if targetMacOS
		    declare function localizedCompare lib CocoaLib selector "localizedCompare:" (obj_id as Ptr, aString as Ptr) as Cocoa.NSComparisonResult
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return localizedCompare(self, aStringRef)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareLocalizedCaseInsensitive(aString as NSString) As Cocoa.NSComparisonResult
		  
		  #if targetMacOS
		    declare function localizedCaseInsensitiveCompare lib CocoaLib selector "localizedCaseInsensitiveCompare:" (obj_id as Ptr, aString as Ptr) as Cocoa.NSComparisonResult
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return localizedCaseInsensitiveCompare(self, aStringRef)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareLocalizedStandard(aString as NSString) As Cocoa.NSComparisonResult
		  
		  #if targetMacOS
		    declare function localizedStandardCompare lib CocoaLib selector "localizedStandardCompare:" (obj_id as Ptr, aString as Ptr) as Cocoa.NSComparisonResult
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return localizedStandardCompare(self, aStringRef)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize(Allocate("NSString")), NSObject.hasOwnership)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aString as NSString)
		  
		  #if targetMacOS
		    declare function initWithString lib CocoaLib selector "initWithString:" (obj_id as Ptr, aString as Ptr) as Ptr
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    super.Constructor(initWithString(Allocate("NSString"), aStringRef), NSObject.hasOwnership)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(s as String)
		  if s.Encoding = nil then
		    dim e as new UnsupportedFormatException
		    e.Message = "Unable to convert string with nil encoding."
		    raise e
		  end if
		  
		  #if TargetMacOS
		    declare function stringWithString lib CocoaLib selector "stringWithString:" ( cls as Ptr, value as CFStringRef ) as Ptr
		    
		    //note that this stringWithString expects the caller to take ownership of the returned NSString.
		    Super.Constructor(stringWithString( Cocoa.NSClassFromString("NSString" ), s))
		    
		  #else
		    #pragma unused s
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(bytes as String, anEncoding as NSStringEncoding)
		  
		  #if targetMacOS
		    declare function initWithBytes lib CocoaLib selector "initWithBytes:length:encoding:" _
		    (obj_id as Ptr, bytes as Ptr, length as UInt32, anEncoding as NSStringEncoding) as Ptr
		    
		    dim m as MemoryBlock = bytes
		    
		    super.Constructor(initWithBytes(Allocate("NSString"), m, m.size, anEncoding), NSObject.hasOwnership)
		    
		  #else
		    #pragma unused bytes
		    #pragma unused anEncoding
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSString
		  
		  #if TargetMacOS
		    declare function string_ lib CocoaLib selector "string" (class_id as Ptr) as Ptr
		    
		    dim stringRef as Ptr = string_(ClassRef)
		    if stringRef <> nil then
		      return new NSString(stringRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithString(aString as NSString) As NSString
		  
		  #if TargetMacOS
		    declare function stringWithString lib CocoaLib selector "stringWithString:" (class_id as Ptr, aString as Ptr) as Ptr
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    dim stringRef as Ptr = stringWithString(ClassRef, aStringRef)
		    if stringRef <> nil then
		      return new NSString(stringRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithString(aString as String) As NSString
		  
		  #if TargetMacOS
		    declare function stringWithString lib CocoaLib selector "stringWithString:" (class_id as Ptr, aString as CFStringRef) as Ptr
		    
		    dim stringRef as Ptr = stringWithString(ClassRef, aString)
		    if stringRef <> nil then
		      return new NSString(stringRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decomposedStringWithCanonicalMapping() As NSString
		  #if TargetMacOS
		    declare function decomposedStringWithCanonicalMapping lib CocoaLib selector "decomposedStringWithCanonicalMapping" (id as Ptr) as Ptr
		    
		    return new NSString(decomposedStringWithCanonicalMapping(self))
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decomposedStringWithCompatibilityMapping() As NSString
		  
		  #if TargetMacOS
		    declare function decomposedStringWithCompatibilityMapping lib CocoaLib selector "decomposedStringWithCompatibilityMapping" (id as Ptr) as Ptr
		    
		    return new NSString(decomposedStringWithCompatibilityMapping(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(point as Cocoa.NSPoint, attribs as NSDictionary)
		  
		  #if targetMacOS
		    declare sub drawAtPoint lib CocoaLib selector "drawAtPoint:withAttributes:" (obj_id as Ptr, point as Cocoa.NSPoint, attribs as Ptr)
		    
		    dim dictRef as Ptr
		    if attribs <> nil then
		      dictRef = attribs
		    end if
		    
		    drawAtPoint self, point, dictRef
		    
		  #else
		    #pragma unused point
		    #pragma unused attribs
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(rect as Cocoa.NSRect, options as Integer, attribs as NSDictionary)
		  
		  #if targetMacOS
		    declare sub drawInRect lib CocoaLib selector "drawWithRect:options:attributes:" (obj_id as Ptr, rect as Cocoa.NSRect, options as Integer, attribs as Ptr)
		    
		    dim dictRef as Ptr
		    if attribs <> nil then
		      dictRef = attribs
		    end if
		    
		    drawInRect self, rect, options, dictRef
		    
		  #else
		    #pragma unused rect
		    #pragma unused options
		    #pragma unused attribs
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(rect as Cocoa.NSRect, attribs as NSDictionary)
		  
		  #if targetMacOS
		    declare sub drawInRect lib CocoaLib selector "drawInRect:withAttributes:" (obj_id as Ptr, rect as Cocoa.NSRect, attribs as Ptr)
		    
		    dim dictRef as Ptr
		    if attribs <> nil then
		      dictRef = attribs
		    end if
		    
		    drawInRect self, rect, dictRef
		    
		  #else
		    #pragma unused rect
		    #pragma unused attribs
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EscapedURL(anEncoding as NSStringEncoding = NSStringEncoding.NSUTF8StringEncoding) As String
		  
		  #if targetMacOS
		    declare function stringByAddingPercentEscapesUsingEncoding lib CocoaLib selector "stringByAddingPercentEscapesUsingEncoding:" _
		    (obj_id as Ptr, anEncoding as NSStringEncoding) as CFStringRef
		    
		    return stringByAddingPercentEscapesUsingEncoding(self, anEncoding)
		    
		  #else
		    #pragma unused anEncoding
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExpandedPath() As String
		  
		  #if targetMacOS
		    declare function stringByExpandingTildeInPath lib CocoaLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		    
		    return stringByExpandingTildeInPath(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FastestEncoding() As NSStringEncoding
		  
		  #if targetMacOS
		    declare function fastestEncoding lib CocoaLib selector "fastestEncoding" (obj_id as Ptr) as NSStringEncoding
		    
		    return fastestEncoding(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileSystemRepresentation() As String
		  
		  #if targetMacOS
		    declare function fileSystemRepresentation lib CocoaLib selector "fileSystemRepresentation" (obj_id as Ptr) as CString
		    
		    return fileSystemRepresentation(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hash() As UInt32
		  
		  #if targetMacOS
		    declare function hash lib CocoaLib selector "hash" (obj_id as Ptr) as UInt32
		    
		    return hash(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasPrefix(aString as NSString) As Boolean
		  
		  #if targetMacOS
		    declare function hasPrefix lib CocoaLib selector "hasPrefix:" (obj_id as Ptr, aString as Ptr) as Boolean
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return hasPrefix(self, aStringRef)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasSuffix(aString as NSString) As Boolean
		  
		  #if targetMacOS
		    declare function hasSuffix lib CocoaLib selector "hasSuffix:" (obj_id as Ptr, aString as Ptr) as Boolean
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return hasSuffix(self, aStringRef)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Instr(aSet as NSCharacterSet) As Cocoa.NSRange
		  
		  #if targetMacOS
		    declare function rangeOfCharacterFromSet lib CocoaLib selector "rangeOfCharacterFromSet:" (obj_id as Ptr, aSet as Ptr) as Cocoa.NSRange
		    
		    dim setRef as Ptr
		    if aSet <> nil then
		      setRef = aSet
		    end if
		    
		    return rangeOfCharacterFromSet(self, setRef)
		    
		  #else
		    #pragma unused aSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Instr(aSet as NSCharacterSet, optionsMask as UInt32) As Cocoa.NSRange
		  
		  #if targetMacOS
		    declare function rangeOfCharacterFromSet lib CocoaLib selector "rangeOfCharacterFromSet:options:" _
		    (obj_id as Ptr, aSet as Ptr, optionsMask as UInt32) as Cocoa.NSRange
		    
		    dim setRef as Ptr
		    if aSet <> nil then
		      setRef = aSet
		    end if
		    
		    return rangeOfCharacterFromSet(self, setRef, optionsMask)
		    
		  #else
		    #pragma unused aSet
		    #pragma unused optionsMask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Instr(aString as String) As UInt32
		  
		  #if targetMacOS
		    declare function rangeOfString lib CocoaLib selector "rangeOfString:" (obj_id as Ptr, aString as CFStringRef) as Cocoa.NSRange
		    
		    dim range as Cocoa.NSRange = rangeOfString(self, aString)
		    
		    return range.location
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Instr(aString as String, optionsMask as UInt32) As UInt32
		  
		  #if targetMacOS
		    declare function rangeOfString lib CocoaLib selector "rangeOfString:options:" _
		    (obj_id as Ptr, aString as CFStringRef, optionsMask as UInt32) as Cocoa.NSRange
		    
		    dim range as Cocoa.NSRange = rangeOfString(self, aString, optionsMask)
		    
		    return range.location
		    
		  #else
		    #pragma unused aString
		    #pragma unused optionsMask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEqual(aString as NSString) As Boolean
		  
		  #if targetMacOS
		    declare function isEqualToString lib CocoaLib selector "isEqualToString:" (obj_id as Ptr, aString as Ptr) as Boolean
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    return isEqualToString(self, aStringRef)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastPathComponent() As String
		  
		  #if targetMacOS
		    declare function lastPathComponent lib CocoaLib selector "lastPathComponent" (obj_id as Ptr) as CFStringRef
		    
		    return lastPathComponent(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Left(numberOfChars as UInt32) As NSString
		  
		  #if targetMacOS
		    declare function substringToIndex lib CocoaLib selector "substringToIndex:" (obj_id as Ptr, index as UInt32) as Ptr
		    
		    dim stringRef as Ptr = substringToIndex(self, numberOfChars)
		    if stringRef <> nil then
		      return new NSString(stringRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused numberOfChars
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Len() As UInt32
		  
		  #if targetMacOS
		    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as UInt32
		    
		    return length(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function LenB(anEncoding as NSStringEncoding) As UInt32
		  
		  #if targetMacOS
		    declare function lengthOfBytesUsingEncoding lib CocoaLib selector "lengthOfBytesUsingEncoding:" (obj_id as Ptr, enc as NSStringEncoding) as UInt32
		    
		    return lengthOfBytesUsingEncoding(self, anEncoding)
		    
		  #else
		    #pragma unused anEncoding
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function LocalizedNameOfStringEncoding(anEncoding as NSStringEncoding) As String
		  
		  #if TargetMacOS
		    declare function localizedNameOfStringEncoding lib CocoaLib selector "localizedNameOfStringEncoding:" _
		    (class_id as Ptr, enc as NSStringEncoding) as CFStringRef
		    
		    return localizedNameOfStringEncoding(ClassRef, anEncoding)
		    
		  #else
		    #pragma unused anEncoding
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function MaxLenB(anEncoding as NSStringEncoding) As UInt32
		  
		  #if targetMacOS
		    declare function maximumLengthOfBytesUsingEncoding lib CocoaLib selector "maximumLengthOfBytesUsingEncoding:" _
		    (obj_id as Ptr, enc as NSStringEncoding) as UInt32
		    
		    return maximumLengthOfBytesUsingEncoding(self, anEncoding)
		    
		  #else
		    #pragma unused anEncoding
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Mid(range as Cocoa.NSRange) As NSString
		  
		  #if targetMacOS
		    declare function substringWithRange lib CocoaLib selector "substringWithRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Ptr
		    
		    dim stringRef as Ptr = substringWithRange(self, range)
		    if stringRef <> nil then
		      return new NSString(stringRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Mid(index as UInt32) As NSString
		  
		  #if targetMacOS
		    declare function substringFromIndex lib CocoaLib selector "substringFromIndex:" (obj_id as Ptr, index as UInt32) as Ptr
		    
		    dim stringRef as Ptr = substringFromIndex(self, index)
		    if stringRef <> nil then
		      return new NSString(stringRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(aString as NSString) As NSString
		  
		  #if targetMacOS
		    declare function stringByAppendingString lib CocoaLib selector "stringByAppendingString:" (obj_id as Ptr, aString as Ptr) as Ptr
		    
		    if aString <> nil then
		      dim aStringRef as Ptr = stringByAppendingString(self, aString)
		      return new NSString(aStringRef)
		    else
		      return self
		    end if
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(aString as NSString) As Integer
		  
		  return Integer(self.Compare(aString))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  return self.StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(s as String)
		  self.Constructor(s)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathComponents() As String()
		  
		  #if targetMacOS
		    declare function pathComponents lib CocoaLib selector "pathComponents" (obj_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = pathComponents(self)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pathExtension() As NSString
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    declare function pathExtension lib CocoaLib selector "pathExtension" (id as Ptr) as Ptr
		    
		    return new NSString(pathExtension(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function precomposedStringWithCanonicalMapping() As NSString
		  #if TargetMacOS
		    declare function precomposedStringWithCanonicalMapping lib CocoaLib selector "precomposedStringWithCanonicalMapping" (id as Ptr) as Ptr
		    
		    return new NSString(precomposedStringWithCanonicalMapping(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function precomposedStringWithCompatibilityMapping() As NSString
		  #if TargetMacOS
		    declare function precomposedStringWithCompatibilityMapping lib CocoaLib selector "precomposedStringWithCompatibilityMapping" (id as Ptr) as Ptr
		    
		    return new NSString(precomposedStringWithCompatibilityMapping(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function PropertyList() As Ptr
		  
		  #if targetMacOS
		    declare function propertyList lib CocoaLib selector "propertyList" (obj_id as Ptr) as Ptr
		    
		    return propertyList(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveExtension() As String
		  
		  #if targetMacOS
		    declare function stringByDeletingPathExtension lib CocoaLib selector "stringByDeletingPathExtension" (obj_id as Ptr) as CFStringRef
		    
		    return stringByDeletingPathExtension(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ReplaceAll(searchString as String, replacement as String) As String
		  
		  #if targetMacOS
		    declare function stringByReplacingOccurrencesOfString lib CocoaLib selector "stringByReplacingOccurrencesOfString:withString:" _
		    (obj_id as Ptr, target as CFStringRef, replacement as CFStringRef) as CFStringRef
		    
		    return stringByReplacingOccurrencesOfString(self, searchString, replacement)
		    
		  #else
		    #pragma unused searchString
		    #pragma unused replacement
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ReplaceAll(searchString as String, replacement as String, options as UInt32, range as Cocoa.NSRange) As String
		  
		  #if targetMacOS
		    declare function stringByReplacingOccurrencesOfString lib CocoaLib selector "stringByReplacingOccurrencesOfString:withString:options:range:" _
		    (obj_id as Ptr, target as CFStringRef, replacement as CFStringRef, options as UInt32, range as Cocoa.NSRange) as CFStringRef
		    
		    return stringByReplacingOccurrencesOfString(self, searchString, replacement, options, range)
		    
		  #else
		    #pragma unused searchString
		    #pragma unused replacement
		    #pragma unused options
		    #pragma unused range
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResolvePath() As String
		  
		  #if targetMacOS
		    declare function stringByResolvingSymlinksInPath lib CocoaLib selector "stringByResolvingSymlinksInPath" (obj_id as Ptr) as CFStringRef
		    
		    return stringByResolvingSymlinksInPath(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SmallestEncoding() As NSStringEncoding
		  
		  #if targetMacOS
		    declare function smallestEncoding lib CocoaLib selector "smallestEncoding" (obj_id as Ptr) as NSStringEncoding
		    
		    return smallestEncoding(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Split(separator as NSCharacterSet) As String()
		  
		  #if targetMacOS
		    declare function componentsSeparatedByCharactersInSet lib CocoaLib selector "componentsSeparatedByCharactersInSet:" _
		    (obj_id as Ptr, separator as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    if separator <> nil then
		      dim arrayRef as Ptr = componentsSeparatedByCharactersInSet(self, separator)
		      if arrayRef <> nil then
		        rb_array = new NSArray(arrayRef)
		      end if
		    end if
		    
		    return rb_array
		    
		  #else
		    #pragma unused separator
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Split(separator as String) As String()
		  
		  #if targetMacOS
		    declare function componentsSeparatedByString lib CocoaLib selector "componentsSeparatedByString:" _
		    (obj_id as Ptr, separator as CFStringRef) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = componentsSeparatedByString(self, separator)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #else
		    #pragma unused separator
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StandardizePath() As String
		  
		  #if targetMacOS
		    declare function stringByStandardizingPath lib CocoaLib selector "stringByStandardizingPath" (obj_id as Ptr) as CFStringRef
		    
		    return stringByStandardizingPath(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Trim(set as NSCharacterSet) As NSString
		  
		  #if targetMacOS
		    declare function stringByTrimmingCharactersInSet lib CocoaLib selector "stringByTrimmingCharactersInSet:" _
		    (obj_id as Ptr, set as Ptr) as Ptr
		    
		    if set <> nil then
		      dim stringRef as Ptr = stringByTrimmingCharactersInSet(self, set)
		      if stringRef <> nil then
		        return new NSString(stringRef)
		      else
		        return nil
		      end if
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused set
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnescapedURL(anEncoding as NSStringEncoding = NSStringEncoding.NSUTF8StringEncoding) As String
		  
		  #if targetMacOS
		    declare function stringByReplacingPercentEscapesUsingEncoding lib CocoaLib selector "stringByReplacingPercentEscapesUsingEncoding:" _
		    (obj_id as Ptr, anEncoding as NSStringEncoding) as CFStringRef
		    
		    return stringByReplacingPercentEscapesUsingEncoding(self, anEncoding)
		    
		  #else
		    #pragma unused anEncoding
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return self.StringValue
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isAbsolutePath lib CocoaLib selector "isAbsolutePath" (obj_id as Ptr) as Boolean
			    
			    return isAbsolutePath(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		AbsolutePath As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function doubleValue lib CocoaLib selector "doubleValue" (obj_id as Ptr) as Double
			    
			    return doubleValue(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		DoubleValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function longLongValue lib CocoaLib selector "longLongValue" (obj_id as Ptr) as Int64
			    
			    return longLongValue(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Int64Value As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function integerValue lib CocoaLib selector "integerValue" (obj_id as Ptr) as Integer
			    
			    return integerValue(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IntegerValue As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Integer
			    
			    return length(self)
			  #endif
			End Get
		#tag EndGetter
		Length As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function floatValue lib CocoaLib selector "floatValue" (obj_id as Ptr) as Double
			    
			    return floatValue(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		SingleValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    //I'd prefer not to use CFStringRef, but to use any of the NSString methods that
			    //require a buffer means that we copy data twice.  UTF8String or other CString
			    //methods aren't suitable because they don't handle text containing null characters.
			    
			    declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
			    dim x as CFStringRef = CFRetain(self.id)
			    return x
			  #endif
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty


	#tag Constant, Name = NSAnchoredSearch, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSBackwardsSearch, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSCaseInsensitiveSearch, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSDiacriticInsensitiveSearch, Type = Double, Dynamic = False, Default = \"128", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSForcedOrderingSearch, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLiteralSearch, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSNumericSearch, Type = Double, Dynamic = False, Default = \"64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionSearch, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingDisableScreenFontSubstitution, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingOneShot, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingTruncatesLastVisibleLine, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingUsesDeviceMetrics, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingUsesFontLeading, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingUsesLineFragmentOrigin, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWidthInsensitiveSearch, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSStringEncoding, Flags = &h0
		NSASCIIStringEncoding = 1
		  NSNEXTSTEPStringEncoding = 2
		  NSJapaneseEUCStringEncoding = 3
		  NSUTF8StringEncoding = 4
		  NSISOLatin1StringEncoding = 5
		  NSSymbolStringEncoding = 6
		  NSNonLossyASCIIStringEncoding = 7
		  NSShiftJISStringEncoding = 8
		  NSISOLatin2StringEncoding = 9
		  NSUnicodeStringEncoding = 10
		  NSWindowsCP1251StringEncoding = 11
		  NSWindowsCP1252StringEncoding = 12
		  NSWindowsCP1253StringEncoding = 13
		  NSWindowsCP1254StringEncoding = 14
		  NSWindowsCP1250StringEncoding = 15
		  NSISO2022JPStringEncoding = 21
		  NSMacOSRomanStringEncoding = 30
		  NSUTF16StringEncoding = 10
		  NSUTF16BigEndianStringEncoding = &h90000100
		  NSUTF16LittleEndianStringEncoding = &h94000100
		  NSUTF32StringEncoding = &h8c000100
		  NSUTF32BigEndianStringEncoding = &h98000100
		  NSUTF32LittleEndianStringEncoding = &h9c000100
		NSProprietaryStringEncoding = 65536
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AbsolutePath"
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
			Name="DoubleValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Int64Value"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Group="Behavior"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SingleValue"
			Group="Behavior"
			Type="Double"
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

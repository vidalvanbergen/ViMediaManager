#tag Class
Class NSMutableString
Inherits NSString
	#tag Method, Flags = &h0
		Sub Append(s as NSString)
		  if s = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    //aString must not be nil.
		    declare sub appendString lib CocoaLib selector "appendString:" (id as Ptr, aString as Ptr )
		    
		    appendString(self, s)
		    
		  #else
		    #pragma unused s
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Append(s as String)
		  #if targetMacOS
		    declare sub appendString lib CocoaLib selector "appendString:" (obj_id as Ptr, aString as CFStringRef)
		    
		    appendString(self, s)
		  #else
		    #pragma unused s
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSMutableString")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  '#if targetMacOS
		  'declare function initWithCapacity lib CocoaLib selector "initWithCapacity:" (id as Ptr, capacity as UInt32) as Ptr
		  '
		  'super.Constructor(initWithCapacity(NSObject.Allocate("NSMutableString" ), 0), hasOwnership)
		  '#endif
		  
		  super.Constructor(Initialize(Allocate("NSMutableString")), NSMutableString.hasOwnership)
		  
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
		    
		    super.Constructor(initWithString(Allocate("NSMutableString"), aStringRef), NSMutableString.hasOwnership)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(characters as String)
		  'self.Constructor()
		  'self.Append(s)
		  
		  
		  #if targetMacOS
		    declare function initWithCharacters lib CocoaLib selector "initWithCharacters:length:" (obj_id as Ptr, characters as Ptr, length as UInt32) as Ptr
		    
		    dim utf16String as String = ConvertEncoding(characters, Encodings.UTF16)
		    dim m as MemoryBlock = utf16String
		    
		    super.Constructor(initWithCharacters(Allocate("NSMutableString"), m, len(characters)), NSMutableString.hasOwnership)
		    
		  #else
		    #pragma unused characters
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(bytes as String, anEncoding as NSStringEncoding)
		  
		  #if targetMacOS
		    declare function initWithBytes lib CocoaLib selector "initWithBytes:length:encoding:" _
		    (obj_id as Ptr, bytes as Ptr, length as UInt32, anEncoding as NSStringEncoding) as Ptr
		    
		    dim m as MemoryBlock = bytes
		    
		    super.Constructor(initWithBytes(Allocate("NSMutableString"), m, m.size, anEncoding), NSMutableString.hasOwnership)
		    
		  #else
		    #pragma unused bytes
		    #pragma unused anEncoding
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(capacity as UInt32)
		  
		  #if targetMacOS
		    declare function initWithCapacity lib CocoaLib selector "initWithCapacity:" (obj_id as Ptr, capacity as UInt32) as Ptr
		    
		    super.Constructor(initWithCapacity(Allocate("NSMutableString"), capacity), NSMutableString.hasOwnership)
		    
		  #else
		    #pragma unused capacity
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSMutableString
		  
		  #if TargetMacOS
		    declare function string_ lib CocoaLib selector "string" (class_id as Ptr) as Ptr
		    
		    dim stringRef as Ptr = string_(ClassRef)
		    if stringRef <> nil then
		      return new NSMutableString(stringRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithCapacity(capacity as UInt32) As NSMutableString
		  
		  #if TargetMacOS
		    declare function stringWithCapacity lib CocoaLib selector "stringWithCapacity" (class_id as Ptr, capacity as UInt32) as Ptr
		    
		    dim stringRef as Ptr = stringWithCapacity(ClassRef, capacity)
		    if stringRef <> nil then
		      return new NSMutableString(stringRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused capacity
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithString(aString as NSString) As NSMutableString
		  
		  #if TargetMacOS
		    declare function stringWithString lib CocoaLib selector "stringWithString:" (class_id as Ptr, aString as Ptr) as Ptr
		    
		    dim aStringRef as Ptr
		    if aString <> nil then
		      aStringRef = aString
		    end if
		    
		    dim stringRef as Ptr = stringWithString(ClassRef, aStringRef)
		    if stringRef <> nil then
		      return new NSMutableString(stringRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithString(characters as String) As NSMutableString
		  
		  #if TargetMacOS
		    declare function stringWithCharacters lib CocoaLib selector "stringWithCharacters:length:" (class_id as Ptr, chars as Ptr, length as UInt32) as Ptr
		    
		    dim m as MemoryBlock = characters
		    
		    dim stringRef as Ptr = stringWithCharacters(ClassRef, m, m.size)
		    if stringRef <> nil then
		      return new NSMutableString(stringRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused characters
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Delete(range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare sub deleteCharactersInRange lib CocoaLib selector "deleteCharactersInRange:" (obj_id as Ptr, range as Cocoa.NSRange)
		    
		    deleteCharactersInRange self, range
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Insert(aString as String, index as UInt32)
		  
		  #if targetMacOS
		    declare sub insertString lib CocoaLib selector "insertString:atIndex:" (obj_id as Ptr, aString as CFStringRef, anIndex as UInt32)
		    
		    insertString self, aString, index
		    
		  #else
		    #pragma unused aString
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(aString as NSString) As NSMutableString
		  
		  self.Append aString
		  
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(aString as String)
		  
		  self.Constructor(aString)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(range as Cocoa.NSRange, replacementString as String)
		  
		  #if targetMacOS
		    declare sub replaceCharactersInRange lib CocoaLib selector "replaceCharactersInRange:withString:" _
		    (obj_id as Ptr, range as Cocoa.NSRange, aString as CFStringRef)
		    
		    replaceCharactersInRange self, range, replacementString
		    
		  #else
		    #pragma unused range
		    #pragma unused replacementString
		  #endif
		  
		End Sub
	#tag EndMethod


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

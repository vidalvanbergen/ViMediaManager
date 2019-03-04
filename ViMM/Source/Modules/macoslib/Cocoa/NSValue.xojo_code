#tag Class
Class NSValue
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSValue")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(data as Ptr, objc_type as String)
		  #if targetMacOS
		    declare function valueWithBytes lib CocoaLib selector "valueWithBytes:objCType:" (class_id as Ptr, value as Ptr, type as CString) as Ptr
		    
		    self.Constructor(valueWithBytes(Cocoa.NSClassFromString("NSValue"), data, objc_type))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyInto(buffer as MemoryBlock)
		  //copies the value into buffer. It's the caller's job to get the buffer size correct.
		  
		  #if targetMacOS
		    declare sub getValue lib CocoaLib selector "getValue:" (obj_id as Ptr, buffer as Ptr)
		    
		    if buffer is nil then
		      dim e as new NilObjectException
		      e.Message = "Argument 'buffer' cannot be nil."
		      raise e
		    end if
		    
		    getValue(self, buffer)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithBytes(data as MemoryBlock, objc_type as String) As NSValue
		  
		  #if targetMacOS
		    declare function valueWithBytes lib CocoaLib selector "valueWithBytes:objCType:" (class_id as Ptr, value as Ptr, type as CString) as Ptr
		    
		    if data <> nil then
		      return new NSValue(valueWithBytes(ClassRef, data, objc_type))
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused objc_type
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithPoint(aPoint as Cocoa.NSPoint) As NSValue
		  
		  #if targetMacOS
		    declare function valueWithPoint lib CocoaLib selector "valueWithPoint:" (class_id as Ptr, aPoint as Cocoa.NSPoint) as Ptr
		    
		    dim valueRef as Ptr = valueWithPoint(ClassRef, aPoint)
		    if valueRef <> nil then
		      return new NSValue(valueRef)
		    end if
		    
		  #else
		    #pragma unused aPoint
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithRange(aRange as Cocoa.NSRange) As NSValue
		  
		  #if targetMacOS
		    declare function valueWithRange lib CocoaLib selector "valueWithRange:" (class_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		    
		    dim valueRef as Ptr = valueWithRange(ClassRef, aRange)
		    if valueRef <> nil then
		      return new NSValue(valueRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithRect(aRect as Cocoa.NSRect) As NSValue
		  
		  #if targetMacOS
		    declare function valueWithRect lib CocoaLib selector "valueWithRect:" (class_id as Ptr, aRect as Cocoa.NSRect) as Ptr
		    
		    dim valueRef as Ptr = valueWithRect(ClassRef, aRect)
		    if valueRef <> nil then
		      return new NSValue(valueRef)
		    end if
		    
		  #else
		    #pragma unused aRect
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithSize(aSize as Cocoa.NSSize) As NSValue
		  
		  #if targetMacOS
		    declare function valueWithSize lib CocoaLib selector "valueWithSize:" (class_id as Ptr, aSize as Cocoa.NSSize) as Ptr
		    
		    dim valueRef as Ptr = valueWithSize(ClassRef, aSize)
		    if valueRef <> nil then
		      return new NSValue(valueRef)
		    end if
		    
		  #else
		    #pragma unused aSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(value as NSValue) As Boolean
		  #if targetMacOS
		    declare function isEqualToValue lib CocoaLib selector "isEqualToValue:" (obj_id as Ptr, value as Ptr) as Boolean
		    
		    return ((value is nil) and (self.id = nil)) or isEqualToValue(self, value)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSPointValue() As NSPoint
		  #if targetMacOS
		    declare function pointValue lib CocoaLib selector "pointValue" (obj_id as Ptr) as NSPoint
		    
		    return pointValue(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSRangeValue() As NSRange
		  #if targetMacOS
		    declare function rangeValue lib CocoaLib selector "rangeValue" (obj_id as Ptr) as NSRange
		    
		    return rangeValue(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSRectValue() As NSRect
		  #if targetMacOS
		    declare function rectValue lib CocoaLib selector "rectValue" (obj_id as Ptr) as NSRect
		    
		    return rectValue(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSSizeValue() As NSSize
		  #if targetMacOS
		    declare function sizeValue lib CocoaLib selector "sizeValue" (obj_id as Ptr) as NSSize
		    
		    return sizeValue(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PtrValue() As Ptr
		  #if targetMacOS
		    declare function pointerValue lib CocoaLib selector "pointValue" (obj_id as Ptr) as Ptr
		    
		    return pointerValue(self)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function objCType lib CocoaLib selector "objCType" (obj_id as Ptr) as CString
			    
			    return objCType(self)
			  #endif
			End Get
		#tag EndGetter
		objCType As String
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
			Name="objCType"
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

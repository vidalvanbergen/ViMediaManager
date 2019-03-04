#tag Class
Class NSNumber
Inherits NSValue
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  #if targetMacOS
		    static p as Ptr = Cocoa.NSClassFromString("NSNumber")
		    return p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(aNumber as NSNumber) As NSComparisonResult
		  
		  #if targetMacOS
		    declare function compare lib CocoaLib selector "compare:" (obj_id as Ptr, aNumber as Ptr) as NSComparisonResult
		    
		    dim numberRef as Ptr
		    if aNumber <> nil then
		      numberRef = aNumber
		    end if
		    
		    return compare(self, numberRef)
		    
		  #else
		    #pragma unused aNumber
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Boolean)
		  #if targetMacOS
		    declare function numberWithBool lib CocoaLib selector "numberWithBool:" (class_id as Ptr, value as Boolean) as Ptr
		    
		    self.Constructor(numberWithBool(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Double)
		  #if targetMacOS
		    declare function numberWithDouble lib CocoaLib selector "numberWithDouble:" (class_id as Ptr, value as Double) as Ptr
		    
		    self.Constructor(numberWithDouble(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Int16)
		  #if targetMacOS
		    declare function numberWithShort lib CocoaLib selector "numberWithShort:" (class_id as Ptr, value as Int16) as Ptr
		    
		    self.Constructor(numberWithShort(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Int32)
		  #if targetMacOS
		    declare function numberWithLong lib CocoaLib selector "numberWithLong:" (class_id as Ptr, value as Int32) as Ptr
		    
		    self.Constructor(numberWithLong(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Int64)
		  #if targetMacOS
		    declare function numberWithLongLong lib CocoaLib selector "numberWithLongLong:" (class_id as Ptr, value as Int64) as Ptr
		    
		    self.Constructor(numberWithLongLong(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Int8)
		  #if targetMacOS
		    declare function numberWithChar lib CocoaLib selector "numberWithChar:" (class_id as Ptr, value as Int8) as Ptr
		    
		    self.Constructor(numberWithChar(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(data as MemoryBlock, objc_type as String)
		  
		  #if targetMacOS
		    declare function initWithBytes lib CocoaLib selector "initWithBytes:objCType:" (obj_id as Ptr, value as Ptr, type as CString) as Ptr
		    
		    self.Constructor(initWithBytes(Allocate("NSNumber"), data, objc_type), NSNumber.hasOwnership)
		    
		  #else
		    #pragma unused data
		    #pragma unused objc_type
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as UInt16)
		  #if targetMacOS
		    declare function numberWithUnsignedShort lib CocoaLib selector "numberWithUnsignedShort:" (class_id as Ptr, value as UInt16) as Ptr
		    
		    self.Constructor(numberWithUnsignedShort(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as UInt32)
		  #if targetMacOS
		    declare function numberWithUnsignedLong lib CocoaLib selector "numberWithUnsignedLong:" (class_id as Ptr, value as UInt32) as Ptr
		    
		    self.Constructor(numberWithUnsignedLong(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as UInt64)
		  #if targetMacOS
		    declare function numberWithUnsignedLongLong lib CocoaLib selector "numberWithUnsignedLongLong:" (class_id as Ptr, value as UInt64) as Ptr
		    
		    self.Constructor(numberWithUnsignedLongLong(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as UInt8)
		  #if targetMacOS
		    declare function numberWithUnsignedChar lib CocoaLib selector "numberWithUnsignedChar:" (class_id as Ptr, value as UInt8) as Ptr
		    
		    self.Constructor(numberWithUnsignedChar(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithBoolean(value as Boolean) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithBool lib CocoaLib selector "numberWithBool:" (class_id as Ptr, value as Boolean) as Ptr
		    
		    dim numRef as Ptr = numberWithBool(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithBytes(data as MemoryBlock, objc_type as String) As NSNumber
		  
		  #if targetMacOS
		    declare function valueWithBytes lib CocoaLib selector "valueWithBytes:objCType:" (class_id as Ptr, value as Ptr, type as CString) as Ptr
		    
		    if data <> nil then
		      return new NSNumber(valueWithBytes(ClassRef, data, objc_type))
		    end if
		    
		  #else
		    #pragma unused data
		    #pragma unused objc_type
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithDouble(value as Double) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithDouble lib CocoaLib selector "numberWithDouble:" (class_id as Ptr, value as Double) as Ptr
		    
		    dim numRef as Ptr = numberWithDouble(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithInt16(value as Int16) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithShort lib CocoaLib selector "numberWithShort:" (class_id as Ptr, value as Int16) as Ptr
		    
		    dim numRef as Ptr = numberWithShort(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithInt32(value as Int32) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithLong lib CocoaLib selector "numberWithLong:" (class_id as Ptr, value as Int32) as Ptr
		    
		    dim numRef as Ptr = numberWithLong(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithInt64(value as Int64) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithLongLong lib CocoaLib selector "numberWithLongLong:" (class_id as Ptr, value as Int64) as Ptr
		    
		    dim numRef as Ptr = numberWithLongLong(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithInt8(value as Int8) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithChar lib CocoaLib selector "numberWithChar:" (class_id as Ptr, value as Int8) as Ptr
		    
		    dim numRef as Ptr = numberWithChar(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithInteger(value as Integer) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithInt lib CocoaLib selector "numberWithInt:" (class_id as Ptr, value as Integer) as Ptr
		    
		    dim numRef as Ptr = numberWithInt(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithUInt16(value as UInt16) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithUnsignedShort lib CocoaLib selector "numberWithUnsignedShort:" (class_id as Ptr, value as UInt16) as Ptr
		    
		    dim numRef as Ptr = numberWithUnsignedShort(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithUInt32(value as UInt32) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithUnsignedLong lib CocoaLib selector "numberWithUnsignedLong:" (class_id as Ptr, value as UInt32) as Ptr
		    
		    dim numRef as Ptr = numberWithUnsignedLong(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithUInt64(value as UInt64) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithUnsignedLongLong lib CocoaLib selector "numberWithUnsignedLongLong:" (class_id as Ptr, value as UInt64) as Ptr
		    
		    dim numRef as Ptr = numberWithUnsignedLongLong(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithUInt8(value as UInt8) As NSNumber
		  
		  #if targetMacOS
		    declare function numberWithUnsignedChar lib CocoaLib selector "numberWithUnsignedChar:" (class_id as Ptr, value as UInt8) as Ptr
		    
		    dim numRef as Ptr = numberWithUnsignedChar(ClassRef, value)
		    if numRef <> nil then
		      return new NSNumber(numRef)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Description1(aLocale as NSLocale) As String
		  
		  #if targetMacOS
		    declare function descriptionWithLocale lib CocoaLib selector "descriptionWithLocale:" (obj_id as Ptr, aLocale as Ptr) as CFStringRef
		    
		    dim localeRef as Ptr
		    if aLocale <> nil then
		      localeRef = aLocale
		    end if
		    
		    return descriptionWithLocale(self, localeRef)
		    
		  #else
		    #pragma unused aLocale
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetObjcType() As String
		  #if TargetMacOS
		    
		    declare function m_objCType lib CocoaLib selector "objCType" (id as Ptr) as Ptr
		    
		    dim mb as MemoryBlock
		    
		    mb = m_objCType( me.id )
		    
		    return   mb.CString( 0 )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(aNumber as NSNumber) As Integer
		  
		  return Integer(self.Compare(aNumber))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  
		  dim type as string = GetObjcType
		  
		  select case type
		  case "f" //Float (single)
		    return  SingleValue
		    
		  case "d" //Double
		    return  DoubleValue
		    
		  case "c" //Char, Int8 or boolean
		    return  Int8Value
		    
		  case "i" //Int32, UInt16
		    return  Int32Value
		    
		  case "q" //Int64, UInt32, UInt64
		    return  Int64Value
		    
		  case "s" //Int16 or UInt8
		    return  Int16Value
		    
		  else
		    return  0
		  end select
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function boolValue lib CocoaLib selector "boolValue" (obj_id as Ptr) as Boolean
			    
			    return boolValue(self)
			  #endif
			End Get
		#tag EndGetter
		BooleanValue As Boolean
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
			    declare function shortValue lib CocoaLib selector "shortValue" (obj_id as Ptr) as Int16
			    
			    return shortValue(self)
			  #endif
			End Get
		#tag EndGetter
		Int16Value As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function longValue lib CocoaLib selector "longValue" (obj_id as Ptr) as Int32
			    
			    return longValue(self)
			  #endif
			End Get
		#tag EndGetter
		Int32Value As Int32
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
			    declare function charValue lib CocoaLib selector "charValue" (obj_id as Ptr) as Int8
			    
			    return charValue(self)
			  #endif
			End Get
		#tag EndGetter
		Int8Value As Int8
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
			    declare function stringValue lib CocoaLib selector "stringValue" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(stringValue(self))
			  #endif
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function unsignedShortValue lib CocoaLib selector "unsignedShortValue" (obj_id as Ptr) as Int16
			    
			    return unsignedShortValue(self)
			  #endif
			End Get
		#tag EndGetter
		UInt16Value As UInt16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function unsignedLongValue lib CocoaLib selector "unsignedLongValue" (obj_id as Ptr) as UInt32
			    
			    return unsignedLongValue(self)
			  #endif
			End Get
		#tag EndGetter
		UInt32Value As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function unsignedLongLongValue lib CocoaLib selector "unsignedLongLongValue" (obj_id as Ptr) as UInt64
			    
			    return unsignedLongLongValue(self)
			  #endif
			End Get
		#tag EndGetter
		UInt64Value As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function unsignedCharValue lib CocoaLib selector "unsignedCharValue" (obj_id as Ptr) as UInt8
			    
			    return unsignedCharValue(self)
			  #endif
			End Get
		#tag EndGetter
		UInt8Value As UInt8
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BooleanValue"
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
			Name="Int16Value"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Int32Value"
			Group="Behavior"
			Type="Int32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Int64Value"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Int8Value"
			Group="Behavior"
			Type="Int8"
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
		#tag ViewProperty
			Name="UInt16Value"
			Group="Behavior"
			Type="UInt16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UInt32Value"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UInt64Value"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UInt8Value"
			Group="Behavior"
			Type="UInt8"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

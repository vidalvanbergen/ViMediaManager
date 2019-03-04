#tag Class
Class CFDictionary
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  // Uses Operator_Convert
		  
		  dim r as NativeSubclass.DictionaryCaseSensitive = me.Operator_Convert
		  return r
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AsDictionary() As NativeSubclass.DictionaryCaseSensitive
		  // Added by Kem Tekinay.
		  // Converts the CFDictionary to a native Dictionary.
		  // Returns the NativeSubclass.DictionaryCaseSensitive subclass.
		  
		  dim d as NativeSubclass.DictionaryCaseSensitive
		  
		  #if TargetMacOS
		    
		    d = me // Uses Operator_Convert
		    
		  #endif
		  
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFDictionaryGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theDictionary as CFDictionary)
		  // The Copy Constructor
		  
		  #if TargetMacOS
		    declare function CFDictionaryCreateCopy lib CarbonLib (allocator as Ptr, theDict as Ptr) as Ptr
		    
		    if not (theDictionary is nil) then
		      super.Constructor CFDictionaryCreateCopy(nil, theDictionary.Reference), true
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theKeys() as CFType, theValues() as CFType)
		  if UBound(theKeys) <> UBound(theValues) then
		    // this is a programming error on behalf of the caller
		    raise new OutOfBoundsException
		  end if
		  
		  #if targetMacOS
		    static keyCallbacks as Ptr = me.DefaultCallbacks("kCFTypeDictionaryKeyCallBacks")
		    static valueCallbacks as Ptr = me.DefaultCallbacks("kCFTypeDictionaryValueCallBacks")
		    
		    declare function CFDictionaryCreate lib CarbonLib (allocator as Ptr, keys as Ptr, values as Ptr, numValues as Integer, keyCallBacks as Ptr, valueCallBacks as Ptr) as Ptr
		    
		    if UBound(theKeys) >= 0 then
		      dim keyBlock as new MemoryBlock(SizeOfPointer*(1 + UBound(theKeys)))
		      dim valueBlock as new MemoryBlock(SizeOfPointer*(1 + UBound(theValues)))
		      dim offset as Integer = 0
		      for i as Integer = 0 to UBound(theKeys)
		        keyBlock.Ptr(offset) = theKeys(i).Reference
		        valueBlock.Ptr(offset) = theValues(i).Reference
		        offset = offset + SizeOfPointer
		      next
		      // create with presets
		      super.Constructor CFDictionaryCreate(nil, keyBlock, valueBlock, 1 + UBound(theKeys), keyCallbacks, valueCallbacks), true
		    else
		      // create empty dictionary
		      super.Constructor CFDictionaryCreate(nil, nil, nil, 0, keyCallbacks, valueCallbacks), true
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromDictionary(dict as Dictionary) As CFDictionary
		  #if TargetMacOS
		    dim md as new CFMutableDictionary
		    
		    if dict=nil then
		      return   nil
		    end if
		    
		    // Switched from For Each to ensure that order is preserved.
		    // Should be faster this way too.
		    dim k() as Variant = dict.Keys
		    dim v() as Variant = dict.Values
		    dim key, value as Variant
		    for i as integer = 0 to k.Ubound
		      key = k( i )
		      value = v( i )
		      md.Value( CFTypeFromVariant( key ) ) = CFTYpeFromVariant( value )
		    next
		    
		    return   md
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(file as FolderItem) As CFDictionary
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListFile( file, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFDictionary = CFDictionary( plist )
		    return r
		    
		  #else
		    
		    #pragma unused file
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(plistString as String) As CFDictionary
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListString( plistString, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFDictionary = CFDictionary( plist )
		    return r
		    
		  #else
		    
		    #pragma unused plistString
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function DefaultCallbacks(name as String) As Ptr
		  return Carbon.Bundle.DataPointerNotRetained(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(key as CFType) As Boolean
		  #if TargetMacOS
		    declare function CFDictionaryContainsKey lib CarbonLib (theDict as Ptr, key as Ptr) as Boolean
		    
		    if not ( self = nil ) and not (key is nil) then
		      return CFDictionaryContainsKey(me.Reference, key.Reference)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasValue(value as CFType) As Boolean
		  #if TargetMacOS
		    declare function CFDictionaryContainsValue lib CarbonLib (theDict as Ptr, value as Ptr) as Boolean
		    
		    if not ( self = nil ) and not (value is nil) then
		      return CFDictionaryContainsValue(me.Reference, value.Reference)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys() As CFType()
		  dim theList() as CFType
		  #if TargetMacOS
		    if not ( self = nil ) then
		      dim dictCount as Integer = me.Count
		      if dictCount > 0 then
		        declare sub CFDictionaryGetKeysAndValues lib CarbonLib (theDict as Ptr, keys as Ptr, values as Ptr)
		        
		        dim keyList as new MemoryBlock(CFTypeRef.Size*dictCount)
		        CFDictionaryGetKeysAndValues me.Reference, keyList, nil
		        
		        dim offset as Integer = 0
		        for i as Integer = 1 to dictCount
		          theList.Append CFType.NewObject(keyList.Ptr(offset), false, kCFPropertyListImmutable)
		          offset = offset + CFTypeRef.Size
		        next
		      end if
		    end if
		  #endif
		  // we always returns a non-nil list, even if it's empty!
		  return theList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key as CFType, fallbackValue as CFType) As CFType
		  #if TargetMacOS
		    declare function CFDictionaryGetValueIfPresent lib CarbonLib (theDict as Ptr, key as Ptr, ByRef value as Ptr) as Boolean
		    
		    if not ( self = nil ) and not (key is nil) then
		      dim theValue as Ptr
		      if CFDictionaryGetValueIfPresent(me.Reference, key.Reference, theValue) then
		        return CFType.NewObject(theValue, false, kCFPropertyListImmutable)
		      end if
		    end if
		  #endif
		  
		  return fallbackValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As NativeSubclass.DictionaryCaseSensitive
		  // Convert to a NativeSubclass.DictionaryCaseSensitive.
		  // This is a Dictionary subclass that can be assigned to a variable defined
		  // as a Dictionary. Preserves the case-sensitivity of the CFDictionary.
		  
		  #if TargetMacOS
		    
		    dim outDict as new NativeSubclass.DictionaryCaseSensitive
		    
		    dim k() as CFType = me.Keys
		    dim key as CFType
		    for i as integer = 0 to k.Ubound // Switched from For Each to ensure that order is preserved
		      key = k( i )
		      outDict.Value(key.VariantValue) = me.Value(key).VariantValue
		    next
		    
		    return outDict
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as CFType) As CFType
		  // Note: this function may actually return nil - that's if the key does not exist in the dictionary
		  
		  #if TargetMacOS
		    declare function CFDictionaryGetValueIfPresent lib CarbonLib (theDict as Ptr, key as Ptr, ByRef value as Ptr) as Boolean
		    
		    if not ( self = nil ) and not (key is nil) then
		      dim theValue as Ptr
		      if CFDictionaryGetValueIfPresent(me.Reference, key.Reference, theValue) then
		        return CFType.NewObject(theValue, false, kCFPropertyListImmutable)
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function CFDictionaryGetCount lib CarbonLib (theDict as Ptr) as Integer
			    
			    if not ( self = nil ) then
			      return CFDictionaryGetCount(me.Reference)
			    end if
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
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

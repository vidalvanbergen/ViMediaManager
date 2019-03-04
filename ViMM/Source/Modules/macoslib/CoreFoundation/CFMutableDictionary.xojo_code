#tag Class
Class CFMutableDictionary
Inherits CFDictionary
	#tag Method, Flags = &h0
		Sub Clear()
		  #if targetMacOS
		    declare sub CFDictionaryRemoveAllValues lib CarbonLib (theDict as Ptr)
		    
		    if not ( self = nil ) then
		      CFDictionaryRemoveAllValues me.Reference
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  #if targetMacOS
		    declare function CFDictionaryCreateMutable lib CarbonLib (allocator as Ptr, capacity as Integer, keyCallbacks as Ptr, valueCallbacks as Ptr) as Ptr
		    
		    static keyCallbacks as Ptr = super.DefaultCallbacks("kCFTypeDictionaryKeyCallBacks")
		    static valueCallbacks as Ptr = super.DefaultCallbacks("kCFTypeDictionaryValueCallBacks")
		    
		    super.Constructor CFDictionaryCreateMutable(nil, 0, keyCallbacks, valueCallbacks), true '
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theDictionary as CFDictionary)
		  // Creates a mutable version of the given CFDictionary
		  
		  #if TargetMacOS
		    declare function CFDictionaryCreateMutableCopy lib CarbonLib (allocator as Ptr, capacity as Integer, theDict as Ptr) as Ptr
		    
		    if not (theDictionary is nil) then
		      super.Constructor CFDictionaryCreateMutableCopy(nil, 0, theDictionary.Reference), true
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(dict As Dictionary)
		  #if TargetMacOS
		    Constructor()
		    
		    if dict is nil then return
		    
		    for i as integer=0 to dict.Count - 1
		      self.Value( CFTypeFromVariant( dict.Key( i ))) = CFTypeFromVariant( dict.value( dict.key( i )))
		    next
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(file as FolderItem) As CFMutableDictionary
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListFile( file, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		    dim r as CFMutableDictionary = CFMutableDictionary( plist )
		    return r
		    
		  #else
		    
		    #pragma unused file
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(plistString as String) As CFMutableDictionary
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListString( plistString, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		    dim r as CFMutableDictionary = CFMutableDictionary( plist )
		    return r
		    
		  #else
		    
		    #pragma unused plistString
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(dict As Dictionary)
		  #if TargetMacOS
		    self.Constructor
		    
		    if dict is nil then return
		    
		    dim k() as variant = dict.Keys
		    dim v() as Variant = dict.Values
		    dim key, value as Variant
		    for i as integer = 0 to k.Ubound
		      key = k( i )
		      value = v( i )
		      self.Value( CFTypeFromVariant( key ) ) = CFTypeFromVariant( value )
		    next
		  #else
		    #pragma unused dict
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key as CFType)
		  #if targetMacOS
		    //this function would be more accurately named "RemoveIfPresent"; if the key is not found, it just returns
		    declare sub CFDictionaryRemoveValue lib CarbonLib (theDict as ptr, key as Ptr)
		    
		    if not ( self = nil ) and not (key is nil) then
		      CFDictionaryRemoveValue me.Reference, key.Reference
		    end if
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as CFType, assigns value as CFType)
		  #if targetMacOS
		    declare sub CFDictionarySetValue lib CarbonLib (theDict as Ptr, key as Ptr, value as Ptr)
		    
		    if not ( self = nil ) and not (key is nil) and not (value is nil) then
		      CFDictionarySetValue me.Reference, key.Reference, value.Reference
		    end if
		  #endif
		  
		  
		End Sub
	#tag EndMethod


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

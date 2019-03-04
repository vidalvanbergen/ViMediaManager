#tag Class
Class CFMutableArray
Inherits CFArray
	#tag Method, Flags = &h0
		Sub Append(theItem as CFType)
		  #if TargetMacOS
		    declare Sub CFArrayAppendValue lib CarbonLib (theArray as CFTypeRef, theValue as CFTypeRef)
		    
		    if self = nil then
		      return
		    end if
		    if theItem = nil then
		      return
		    end if
		    
		    CFArrayAppendValue(self, theItem)
		  #else
		    
		    #pragma unused theItem
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(capacity as Integer = 0)
		  // capacity=0 means unlimited capacity
		  
		  #if TargetMacOS
		    
		    declare function CFArrayCreateMutable lib CarbonLib (allocator as Ptr, capacity as Integer, callbacks as Ptr) as CFTypeRef
		    
		    self.Constructor(CFArrayCreateMutable(nil, capacity, DefaultCallbacks), hasOwnership)
		    
		  #else
		    
		    #pragma unused capacity
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(file as FolderItem) As CFMutableArray
		  #if TargetMacOS
		    return MakeFromPList(CFType.CreateFromPListFile(file, CoreFoundation.kCFPropertyListMutableContainersAndLeaves))
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(plistString as String) As CFMutableArray
		  #if TargetMacOS
		    return MakeFromPList(CFType.CreateFromPListString(plistString, CoreFoundation.kCFPropertyListMutableContainersAndLeaves))
		  #else
		    #pragma unused plistString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeFromPList(plist as CFPropertyList) As CFArray
		  if plist isA CFMutableArray then
		    return CFMutableArray(plist)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(arr() As Variant)
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    
		    self.Constructor
		    
		    for i as integer = 0 to arr.Ubound
		      self.Append( CFTypeFromVariant( arr( i ) ) )
		    next
		    
		  #else
		    
		    #pragma unused arr
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(index as Integer, Assigns theValue as CFType)
		  #if TargetMacOS
		    declare Sub CFArraySetValueAtIndex lib CarbonLib (theArray as CFTypeRef, idx as Integer, theVal as Ptr)
		    
		    if index < 0 or index >= self.Count() then
		      raise new OutOfBoundsException
		    end if
		    
		    if self = nil then
		      return
		    end if
		    if theValue = nil then
		      return
		    end if
		    
		    CFArraySetValueAtIndex(self, index, theValue)
		    
		  #else
		    
		    #pragma unused index
		    #pragma unused theValue
		    
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

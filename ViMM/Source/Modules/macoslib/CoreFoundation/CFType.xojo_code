#tag Class
Class CFType
	#tag Method, Flags = &h21
		Private Sub AdoptNoVerify(ref as CFTypeRef, hasOwnership as Boolean)
		  #if targetMacOS
		    // This method must remain private so that only NewObject may call it,
		    // in order to create a direct CFType object (not subclassed) that doesn't
		    // call VerifyType.
		    // No outside function or subclass should be able to skip the verification,
		    // so don't mess with this.
		    
		    self.mRef = ref
		    
		    if not hasOwnership then
		      self.Retain()
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // This is private to make sure no one creates an empty CF... instance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ref as CFTypeRef, hasOwnership as Boolean)
		  #if targetMacOS
		    // This is the mandatory constructor for all CFType subclasses.
		    //
		    // Use it when you have declared a CF function from the Carbon framework
		    // (CarbonCore) and retrieved any CF... type. Pass the retrieved CF object
		    // as the 'ref' parameter.
		    //
		    // If the object ref was retrieved by a CF...Copy... or CF...Create... function,
		    // pass 'true' to the 'hasOwnership' parameter. Otherwise, pass 'false'.
		    //
		    // The 'hasOwnership' parameter tells this object whether to balance the
		    // release call in its destructor with a retain call.
		    
		    
		    
		    self.AdoptNoVerify(VerifyType(ref), hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated = true )  Sub Constructor(p as Ptr, hasOwnership as Boolean)
		  #if targetMacOS
		    dim ref as CFTypeRef
		    ref.value = p
		    self.Constructor(ref, hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(file As FolderItem, mutability As Integer) As CFPropertyList
		  // Added by Kem Tekinay.
		  // Convenience method to return a property list from a PList file.
		  // Classes that are CFPropertyList should override this to return their type.
		  
		  #if targetMacOS
		    
		    dim bs as BinaryStream = BinaryStream.Open( file, false )
		    dim s as string = bs.Read( bs.Length )
		    bs = nil
		    
		    dim plist as CFPropertyList = CreateFromPListString( s, mutability )
		    return plist
		    
		  #else
		    
		    #pragma unused file
		    #pragma unused mutability
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(plistString as String, mutability As Integer) As CFPropertyList
		  // Added by Kem Tekinay.
		  // Convenience method to return a property list from a PList string.
		  // Classes that are CFPropertyList should override this to return their type.
		  
		  #if targetMacOS
		    
		    dim errMsg as string
		    dim plist as CFPropertyList = NewCFPropertyList( plistString, mutability, errMsg )
		    
		    return  plist
		    
		  #else
		    
		    #pragma unused plistString
		    #pragma unused mutability
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  self.Release
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(theObj as CFType) As Boolean
		  #if TargetMacOS
		    soft declare function CFEqual lib CarbonLib (cf1 as CFTypeRef, cf2 as CFTypeRef) as Boolean
		    
		    if self = nil then
		      return theObj = nil
		    else
		      return (theObj <> nil) and CFEqual(self, theObj)
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromHandle(handle as Integer) As CFType
		  // This is an alternative constructor for "foreign" CFType objects.
		  //
		  // It can be used to access existing CFType objects, e.g. those from MBS plugins,
		  // by passing their Handle property to this constructor
		  
		  dim ref as CFTypeRef
		  ref.value = Ptr(handle)
		  return NewObject(ref, not hasOwnership)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As CFTypeRef
		  return self.mRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hash() As UInteger
		  #if TargetMacOS
		    soft declare function CFHash lib CarbonLib (cf as CFTypeRef) as UInteger
		    
		    if self.mRef.value <> nil then
		      return CFHash(self.mRef)
		    else
		      return 0
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Deprecated = "=nil" )  Function IsNULL() As Boolean
		  return (self = nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewObject(ref as CFTypeRef, hasOwnership as Boolean, mutability as Integer = kCFPropertyListImmutable) As CFType
		  // This function never returns nil on Mac OS X (but always nil on other platforms)
		  //
		  // hasOwnership: pass true if ref comes from a OS's CF... call and has just been retained. The constructor will release it then.
		  
		  // Note: This function is effectively the same as using "new CF...(ref)" if the type is known in advance.
		  //  This means that this function is to be used where the type of "ref" is not known, otherwise the
		  //  explicit class constructors are to be preferred as they're faster.
		  
		  #if TargetMacOS
		    
		    if ref.value = nil then
		      return new CFType() // this gives a CFType object whose "IsNULL()" function returns true
		    end if
		    
		    
		    dim theTypeID as UInteger = CFGetTypeID(ref)
		    
		    select case theTypeID
		      
		    case CFArray.ClassID
		      if mutability <> kCFPropertyListImmutable then
		        return new CFMutableArray(ref, hasOwnership)
		      else
		        return new CFArray(ref, hasOwnership)
		      end
		      
		    case CFBoolean.ClassID
		      return CFBoolean.Get(ref)
		      
		    case CFBundle.ClassID
		      dim b as new CFBundle(ref, hasOwnership)
		      return b
		      
		    case CFData.ClassID
		      if mutability = kCFPropertyListMutableContainersAndLeaves then
		        return new CFMutableData(ref, hasOwnership)
		      else
		        return new CFData(ref, hasOwnership)
		      end
		      
		    case CFDate.ClassID
		      dim b as new CFDate(ref, hasOwnership)
		      return b
		      
		    case CFDictionary.ClassID
		      if mutability <> kCFPropertyListImmutable then
		        return new CFMutableDictionary(ref, hasOwnership)
		      else
		        return new CFDictionary(ref, hasOwnership)
		      end
		      
		    case CFNumber.ClassID
		      dim b as new CFNumber(ref, hasOwnership)
		      return b
		      
		    case CFString.ClassID
		      if mutability = kCFPropertyListMutableContainersAndLeaves then
		        return new CFMutableString(ref, hasOwnership)
		      else
		        return new CFString(ref, hasOwnership)
		      end
		      
		    case CFURL.ClassID
		      dim url as new CFURL(ref, hasOwnership)
		      return url
		      
		    case CFNull.ClassID
		      dim null as new CFNull(ref, hasOwnership)
		      return null
		      
		    case CFUUID.ClassID
		      return  new CFUUID(ref, hasOwnership)
		      
		    else
		      // It's an unknown CF type. Let's return a generic CFType so that at least
		      // this class' operations (Show, Equals, etc.) can be applied to it.
		      
		      dim cft as new CFType()
		      cft.AdoptNoVerify(ref, hasOwnership) // this avoids the type verification
		      return cft
		      
		      #if false
		        // this is not needed but remains in here in case someone wants it back:
		        #if DebugBuild
		          soft declare function CFCopyTypeIDDescription lib CarbonLib (cfid as UInt32) as CFStringRef
		          soft declare function CFCopyDescription lib CarbonLib (cf as Ptr) as CFStringRef
		          soft declare sub CFShow lib CarbonLib ( obj as Ptr )
		          
		          dim cfs as CFStringRef = CFCopyTypeIDDescription ( theTypeID )
		          dim cfd as CFStringRef = CFCopyDescription ( p )
		          System.DebugLog( "type id = " + str(theTypeID) )
		          System.DebugLog( cfs )
		          System.DebugLog( cfd )
		          CFShow(p)
		        #endif
		      #endif
		      
		    end select
		    
		    // we should never arrive here
		    
		  #else
		    
		    #pragma unused ref
		    #pragma unused hasOwnership
		    #pragma unused mutability
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated = true )  Shared Function NewObject(p as Ptr, hasOwnership as Boolean, mutability as Integer = kCFPropertyListImmutable) As CFType
		  #if TargetMacOS
		    dim ref as CFTypeRef
		    ref.value = p
		    return NewObject(ref, hasOwnership, mutability)
		  #else
		    
		    #pragma unused p
		    #pragma unused hasOwnership
		    #pragma unused mutability
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(t as CFType) As Integer
		  // Tells whether the two CF objects are the same CF instance but not necessarily the
		  //   same value (for equality check, use the Equals() function)
		  
		  //A CFType object with mRef = nil is treated as a nil object.
		  
		  //This method should be overloaded in classes for which comparison makes sense.
		  
		  
		  if t is nil then
		    if self.Handle.value = nil then
		      return 0
		    else
		      return 1
		    end if
		    
		  else
		    return Integer(self.Handle.value) - Integer(t.Handle.value)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As CFTypeRef
		  // This is a convenience function to get the reference to the OS object,
		  // for passing to CoreFoundation functions.
		  
		  return self.Handle // Call this function (not return mRef directly) because it might be overridden
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated = true )  Function Operator_Convert() As Ptr
		  // This is a convenience function to get the reference to the OS object,
		  // for passing to CoreFoundation functions.
		  
		  return self.Handle().value // Call this function (not return mRef directly) because it might be overridden
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefCount() As Integer
		  #if targetMacOS
		    soft declare function CFGetRetainCount lib CoreFoundation.framework (cf as CFTypeRef) as Integer
		    
		    if self.mRef.value <> nil then
		      return CFGetRetainCount(self.mRef)
		    else
		      return 0
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated = "CFType.Handle" )  Function Reference() As Ptr
		  return self.mRef.value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  #if targetMacOS
		    soft declare sub CFRelease lib CoreFoundation.framework (cf as CFTypeRef)
		    
		    dim ref as CFTypeRef = self.Handle
		    if ref.value <> nil then
		      CFRelease(ref)
		    end if
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Retain()
		  #if targetMacOS
		    soft declare function CFRetain lib CoreFoundation.framework (cf as CFTypeRef) as CFTypeRef
		    
		    dim ref as CFTypeRef = self.Handle
		    if ref.value <> nil then
		      //CFRetain returns the input value on success.  I chose to write the return value to ref
		      //instead of using Call.  CCY 2013-11-24.
		      ref = CFRetain(ref)
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show()
		  #if TargetMacOS
		    soft declare sub CFShow lib CoreFoundation.framework (obj as CFTypeRef)
		    
		    if self.mRef.value <> nil then
		      CFShow self.mRef
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TypeDescription(id as UInt32) As String
		  #if TargetMacOS
		    declare function CFCopyTypeIDDescription lib CarbonLib (id as UInt32) as CFStringRef
		    
		    if id <> 0 then
		      return CFCopyTypeIDDescription(id)
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TypeID() As UInteger
		  #if TargetMacOS
		    if self.mRef.value <> nil then
		      return CFGetTypeID(self.mRef)
		    else
		      return 0
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As Variant
		  // This method is intended for use in dumping the contents of a CFDictionary.
		  // Objects that can reasonably be converted to a REALbasic datatype
		  // should do so in their VariantValue event handler.
		  // Other objects (like CFBundle) that have no analogue should do nothing, or simply return nil.
		  
		  return raiseEvent VariantValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function VerifyType(ref as CFTypeRef) As CFTypeRef
		  #if targetMacOS
		    if ref.value = nil then
		      return ref
		    else
		      dim expectedTypeID as UInteger = RaiseEvent ClassID()
		      dim actualTypeID as UInteger = CFGetTypeID(ref)
		      if (expectedTypeID = actualTypeID) then
		        return ref
		      else
		        declare function CFCopyTypeIDDescription lib CarbonLib (id as Integer) as CFStringRef
		        dim e as new TypeMismatchException
		        e.Message = "CFTypeRef &h" + Hex(ref.value) + " has ID " + CFCopyTypeIDDescription(actualTypeID) + " but " + CFCopyTypeIDDescription(expectedTypeID) + " was expected."
		        raise e
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WriteToFile(file as FolderItem, asXML as Boolean = true) As Boolean
		  // Added by Kem Tekinay.
		  //This method is declared by CFPropertyList; CFType subclasses that implement CFPropertyList
		  //invoke this method.
		  
		  #if targetMacOS
		    dim plist as CFPropertyList = CFPropertyList( me )
		    dim url as new CFURL( file )
		    dim stream as new CFWriteStream( url, false ) //Replace file
		    dim errMsg as string
		    dim OK as Boolean
		    
		    dim format as Integer
		    if asXML then
		      format = CoreFoundation.kCFPropertyListXMLFormat_v1_0
		    else
		      format = CoreFoundation.kCFPropertyListBinaryFormat_v1_0
		    end if
		    
		    if stream.Open then
		      try
		        OK = plist.Write( stream, format, errMsg )
		      finally
		        stream.Close
		      end try
		    end if
		    
		    
		    
		    return  OK
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ClassID() As UInteger
	#tag EndHook

	#tag Hook, Flags = &h0
		Event VariantValue() As Variant
	#tag EndHook


	#tag Note, Name = Memory Management
		CFType follows the same memory management scheme used by CFStringRef. A CFType object is
		created with whatever reference count the CFTypeRef has, and the CFTypeRef is always released
		by the destructor.
		
		This means that CFType objects created from a Core Foundation Get* function may need to have
		their reference counts incremented by hand -- This is what the "hasOwnership" parameter is for - if you
		only use the Adopt and the CFType.Constructor(Ptr,Boolean) methods, you should not have to worry
		about reference counting.
	#tag EndNote


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return self.RefCount
			End Get
		#tag EndGetter
		Private debugRefCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			This is mainly useful to see the value in the debugger.
			Warning: Do not use this in your code for other purposes as the value might change
			even between different Mac OS versions!
		#tag EndNote
		#tag Getter
			Get
			  #if TargetMacOS
			    soft declare function CFCopyDescription lib CoreFoundation.framework (cf as CFTypeRef) as CFTypeRef
			    // Caution: If this would return a CFStringRef, we'd have to Retain its value!
			    // Instead, "new CFString()" takes care of that below
			    
			    if not ( self = nil ) then
			      return new CFString(CFCopyDescription(self), hasOwnership)
			    end if
			  #endif
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mRef As CFTypeRef
	#tag EndProperty


	#tag Constant, Name = ClassName, Type = String, Dynamic = False, Default = \"CFType", Scope = Private
	#tag EndConstant

	#tag Constant, Name = hasOwnership, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
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

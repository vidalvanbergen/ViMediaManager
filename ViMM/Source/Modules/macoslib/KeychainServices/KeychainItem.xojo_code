#tag Class
Protected Class KeychainItem
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Attribute(attrTag as UInt32) As String
		  #if targetMacOS
		    declare sub CFRelease lib CarbonLib (cf as Ptr)
		    declare function SecKeychainItemCopyAttributesAndData lib KeychainServices.framework (itemRef as Ptr, info as Ptr, itemClassPtr as Ptr, attrListPtr as Ptr, length as Ptr, data as Ptr) as Integer
		    declare function SecKeychainItemFreeAttributesAndData lib KeychainServices.framework (attrList as Ptr, data as Ptr) as Integer
		    declare function SecKeychainFreeAttributeInfo lib KeychainServices.framework (info as Ptr) as Integer
		    declare function SecKeychainAttributeInfoForItemID lib KeychainServices.framework (itemRef as Ptr, id as UInt32, ByRef infoOut as Ptr) as Integer
		    declare function SecKeychainItemCopyKeychain lib KeychainServices.framework (itemRef as Ptr, ByRef kcRef as Ptr) as Integer
		    
		    dim err as Integer
		    
		    dim itemClass as UInt32, itemClassPtr as new MemoryBlock(8)
		    err = SecKeychainItemCopyAttributesAndData(self, nil, itemClassPtr, nil, nil, nil)
		    if err <> 0 then break
		    itemClass = itemClassPtr.UInt32Value(0)
		    
		    dim keychainRef as Ptr
		    err = SecKeychainItemCopyKeychain(self, keychainRef)
		    if err <> 0 then break
		    
		    const CSSM_DL_DB_RECORD_GENERIC_PASSWORD = &h80000000
		    const CSSM_DL_DB_RECORD_INTERNET_PASSWORD = &h80000001
		    const CSSM_DL_DB_RECORD_APPLESHARE_PASSWORD = &h80000002
		    if itemClass = kSecInternetPasswordItemClass then
		      itemClass = CSSM_DL_DB_RECORD_INTERNET_PASSWORD
		    elseif itemClass = kSecGenericPasswordItemClass then
		      itemClass = CSSM_DL_DB_RECORD_GENERIC_PASSWORD
		    elseif itemClass = kSecAppleSharePasswordItemClass then
		      itemClass = CSSM_DL_DB_RECORD_APPLESHARE_PASSWORD
		    end
		    dim info as Ptr
		    err = SecKeychainAttributeInfoForItemID (keychainRef, itemClass, info)
		    CFRelease (keychainRef)
		    if err <> 0 then break
		    
		    dim attrListPtr as new MemoryBlock(8)
		    err = SecKeychainItemCopyAttributesAndData(self, info, nil, attrListPtr, nil, nil)
		    call SecKeychainFreeAttributeInfo (info)
		    
		    if err = Error.Success then
		      dim data as String
		      dim m as MemoryBlock = attrListPtr.Ptr(0)
		      dim attrs as MemoryBlock = m.Ptr(4)
		      for i as Integer = 0 to m.UInt32Value(0)-1
		        dim tag as UInt32 = attrs.UInt32Value(i*12)
		        if tag = attrTag then
		          dim dlen as UInt32 = attrs.UInt32Value(i*12+4)
		          dim dptr as MemoryBlock = attrs.Ptr(i*12+8)
		          data = dptr.StringValue(0, dlen)
		        end
		      next
		      err = SecKeychainItemFreeAttributesAndData(attrListPtr.Ptr(0), nil)
		      if err <> 0 then break
		      return data
		    else
		      raise new Error(err)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib KeychainServices.framework alias "SecKeychainItemGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Data() As String
		  #if targetMacOS
		    declare function SecKeychainItemCopyAttributesAndData lib KeychainServices.framework (itemRef as Ptr, info as Ptr, itemClass as Ptr, attrList as Ptr, ByRef length as UInt32, ByRef data as Ptr) as Integer
		    declare function SecKeychainItemFreeAttributesAndData lib KeychainServices.framework (attrList as Ptr, data as Ptr) as Integer
		    
		    dim length as UInt32
		    dim outData as Ptr
		    dim err as Integer = SecKeychainItemCopyAttributesAndData(self, nil, nil, nil, length, outData)
		    if err = Error.Success then
		      dim m as MemoryBlock = outData
		      dim data as String = m.StringValue(0, length)
		      err = SecKeychainItemFreeAttributesAndData(nil, outData)
		      if err = Error.Success then
		        return data
		      else
		        raise new Error(err)
		      end if
		    else
		      raise new Error(err)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Data(assigns value as String)
		  #if targetMacOS
		    declare function SecKeychainItemModifyAttributesAndData lib KeychainServices.framework (itemRef as Ptr, attrList as Ptr, length as UInt32, data as CString) as Integer
		    
		    dim err as Integer = SecKeychainItemModifyAttributesAndData(self, nil, LenB(value), value)
		    if err <> Error.Success then
		      raise new Error(err)
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Constant, Name = kSecAppleSharePasswordItemClass, Type = Double, Dynamic = False, Default = \"\'ashp\'", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecGenericPasswordItemClass, Type = Double, Dynamic = False, Default = \"\'genp\'", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecInternetPasswordItemClass, Type = Double, Dynamic = False, Default = \"\'inet\'", Scope = Private
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

#tag Class
Protected Class Keychain
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddGenericPassword(serviceName as String, accountName as String, password as String)
		  #if targetMacOS
		    declare function SecKeychainAddGenericPassword lib KeychainServices.framework (keychain as Ptr, serviceNameLength as UInt32, serviceName as CString, accountNameLength as UInt32, accountName as CString, passwordLength as UInt32, passwordData as CString, itemRef as Ptr) as Integer
		    
		    dim err as Integer = SecKeychainAddGenericPassword(self, LenB(serviceName), serviceName, LenB(accountName), accountName, LenB(password), password, nil)
		    if err <> Error.Success then
		      raise new Error(err)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib KeychainServices.framework alias "SecKeychainGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    declare function SecKeychainCopyDefault lib KeychainServices.framework (ByRef keychain as Ptr) as Integer
		    
		    dim newRef as Ptr
		    dim err as Integer = SecKeychainCopyDefault(newRef)
		    if err = noErr then
		      self.Constructor(newRef, CFType.hasOwnership)
		    else
		      raise new KeychainServices.Error(err)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindGenericPassword(serviceName as String, accountName as String) As String
		  #if targetMacOS
		    declare function SecKeychainFindGenericPassword lib KeychainServices.framework (keychainOrArray as Ptr, serviceNameLength as UInt32, serviceName as CString, accountNameLength as UInt32, accountName as CString, ByRef passwordLength as UInt32, ByRef passwordData as Ptr, itemRef as Ptr) as Integer
		    
		    dim passwordLength as UInt32
		    dim passwordData as Ptr
		    dim err as Integer = SecKeychainFindGenericPassword(self, CType(LenB(serviceName), UInt32), serviceName, CType(LenB(accountName), UInt32), accountName, passwordLength, passwordData, nil)
		    if err = Error.Success then
		      dim m as MemoryBlock = passwordData
		      dim password as String = m.StringValue(0, passwordLength)
		      self.FreeContent(nil, passwordData)
		      return password
		    else
		      raise new Error(err)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindGenericPasswordItem(serviceName as String, accountName as String) As KeychainServices.KeychainItem
		  #if targetMacOS
		    declare function SecKeychainFindGenericPassword lib KeychainServices.framework (keychainOrArray as Ptr, serviceNameLength as UInt32, serviceName as CString, accountNameLength as UInt32, accountName as CString, passwordLength as Ptr, passwordData as Ptr, ByRef itemRef as Ptr) as Integer
		    
		    dim itemRef as Ptr
		    dim err as Integer = SecKeychainFindGenericPassword(self, CType(LenB(serviceName), UInt32), serviceName, CType(LenB(accountName), UInt32), accountName, nil, nil, itemRef)
		    if err = Error.Success then
		      return new KeychainServices.KeychainItem(itemRef, not CFType.hasOwnership)
		    elseIf err = Error.ItemNotFound then
		      return nil
		    else
		      raise new Error(err)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindInternetPassword(serverName as String, accountName as String, securityDomain as String = "", path as String = "", port as UInt16 = 0, protocol as FourCharCode = "", authenticationType as FourCharCode = "") As String
		  #pragma unused securityDomain
		  
		  #if targetMacOS
		    declare function SecKeychainFindInternetPassword lib KeychainServices.framework (_
		    keychainOrArray as Ptr, _
		    serverNameLength as UInt32,_
		    serverName as CString, _
		    securityDomainLength as Ptr, _
		    securityDomain as Ptr, _
		    accountNameLength as UInt32, _
		    accountName as CString, _
		    pathLength as UInt32, _
		    path as CString, _
		    port as UInt16, _
		    protocol as UInt32, _
		    authenticationType as UInt32, _
		    ByRef passwordLength as UInt32, _
		    ByRef password as Ptr, _
		    itemRef as Ptr) _
		    as Integer
		    
		    dim passwordLength as UInt32
		    dim pwd as Ptr
		    dim err as Integer = SecKeychainFindInternetPassword(_
		    self, _
		    LenB(serverName), _
		    serverName, _
		    nil, _
		    nil, _
		    LenB(accountName), _
		    accountName, _
		    LenB(path), _
		    path, _
		    port, _
		    protocol, _
		    authenticationType, _
		    passwordLength, _
		    pwd, _
		    nil)
		    
		    if err = Error.Success then
		      dim m as MemoryBlock = pwd
		      dim password as String = m.StringValue(0, passwordLength)
		      self.FreeContent(nil, pwd)
		      return password
		    else
		      raise new Error(err)
		    end if
		  #endif
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FreeContent(attrList as Ptr, data as Ptr)
		  #if targetMacOS
		    declare function SecKeychainItemFreeContent lib KeychainServices.framework (attrList as Ptr, data as Ptr) as Integer
		    
		    dim err as Integer = SecKeychainItemFreeContent(attrList, data)
		    if err <> Error.Success then
		      raise new Error(err)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path() As String
		  #if targetMacOS
		    declare function SecKeychainGetPath lib KeychainServices.framework (kc as Ptr, ByRef ioPathLength as UInt32, pathName as Ptr) as Integer
		    
		    dim buffer as new MemoryBlock(1024)
		    dim ioPathLength as UInt32 = buffer.Size
		    dim err as Integer = SecKeychainGetPath(self, ioPathLength, buffer)
		    if err = noErr then
		      return DefineEncoding(buffer.StringValue(0, ioPathLength), Encodings.UTF8)
		    else
		      raise new KeychainServices.Error(err)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Status() As UInt32
		  #if targetMacOS
		    declare function SecKeychainGetStatus lib KeychainServices.framework (kc as Ptr, ByRef keychainStatus as UInt32) as Integer
		    
		    dim keychainStatus as UInt32
		    dim err as Integer = SecKeychainGetStatus(self, keychainStatus)
		    if err = noErr then
		      return keychainStatus
		    else
		      raise new KeychainServices.Error(err)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function UInt32Value(type as OSType) As UInt32
		  dim v as Variant = type
		  return v.UInt32Value
		End Function
	#tag EndMethod


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

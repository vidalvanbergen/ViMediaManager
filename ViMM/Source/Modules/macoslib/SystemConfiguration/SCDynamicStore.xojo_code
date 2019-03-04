#tag Class
Class SCDynamicStore
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return SCDynamicStore.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib SystemConfiguration.framework alias "SCDynamicStoreGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  #if targetMacOS
		    declare function SCDynamicStoreCreate lib SystemConfiguration.Framework (allocator as Ptr, name as CFStringRef, callout as Ptr, ByRef context as SCDynamicStoreContext) as Ptr
		    
		    
		    dim b as new CFBundle
		    
		    dim context as SCDynamicStoreContext
		    dim p as Ptr = SCDynamicStoreCreate(nil, b.Identifier, nil, context)
		    if p <> nil then
		      super.Constructor(p, hasOwnership)
		    else
		      dim errorCode as Integer = SystemConfiguration.ErrorCode
		      raise new MacOSError(errorCode, SystemConfiguration.ErrorMessage(errorCode))
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateComputerName() As String
		  #if targetMacOS
		    declare function SCDynamicStoreKeyCreateComputerName lib SystemConfiguration.framework (allocator as Ptr) as Ptr
		    
		    return RetainedStringValue(SCDynamicStoreKeyCreateComputerName(nil))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateConsoleUser() As String
		  #if targetMacOS
		    declare function SCDynamicStoreKeyCreateConsoleUser lib SystemConfiguration.framework (allocator as Ptr) as Ptr
		    
		    return RetainedStringValue(SCDynamicStoreKeyCreateConsoleUser(nil))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateHostNames() As String
		  #if targetMacOS
		    declare function SCDynamicStoreKeyCreateHostNames lib SystemConfiguration.framework (allocator as Ptr) as Ptr
		    
		    return RetainedStringValue(SCDynamicStoreKeyCreateHostNames(nil))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateLocation() As String
		  #if targetMacOS
		    declare function SCDynamicStoreKeyCreateLocation lib SystemConfiguration.framework (allocator as Ptr) as Ptr
		    
		    return RetainedStringValue(SCDynamicStoreKeyCreateLocation(nil))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateNetworkGlobalEntity(domain as String, entity as String) As String
		  #if targetMacOS
		    soft declare function SCDynamicStoreKeyCreateNetworkGlobalEntity lib SystemConfiguration.Framework (allocator as Ptr, domain as Ptr, entity as Ptr) as CFStringRef
		    
		    return SCDynamicStoreKeyCreateNetworkGlobalEntity(nil, ResolveSymbol(domain), ResolveSymbol(entity))
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateNetworkInterface(domain as String) As String
		  #if targetMacOS
		    soft declare function SCDynamicStoreKeyCreateNetworkInterface lib SystemConfiguration.Framework (allocator as Ptr, domain as Ptr) as CFStringRef
		    
		    return SCDynamicStoreKeyCreateNetworkInterface(nil, ResolveSymbol(domain))
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateNetworkInterfaceEntity(domain as String, ifname as String, entity as String) As String
		  #if targetMacOS
		    soft declare function SCDynamicStoreKeyCreateNetworkInterfaceEntity lib SystemConfiguration.Framework (allocator as Ptr, domain as Ptr, ifname as CFStringRef, entity as Ptr) as CFStringRef
		    
		    return SCDynamicStoreKeyCreateNetworkInterfaceEntity(nil, ResolveSymbol(domain), ifname, ResolveSymbol(entity))
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateNetworkServiceEntity(domain as String, serviceID as String, entity as String) As String
		  #if targetMacOS
		    soft declare function SCDynamicStoreKeyCreateNetworkServiceEntity lib SystemConfiguration.Framework (allocator as Ptr, domain as Ptr, serviceID as Ptr, entity as Ptr) as CFStringRef
		    
		    return SCDynamicStoreKeyCreateNetworkServiceEntity(nil, ResolveSymbol(domain), ResolveSymbol(serviceID), ResolveSymbol(entity))
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KeyCreateProxies() As String
		  #if targetMacOS
		    declare function SCDynamicStoreKeyCreateProxies lib SystemConfiguration.framework (allocator as Ptr) as Ptr
		    
		    return RetainedStringValue(SCDynamicStoreKeyCreateProxies(nil))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys(pattern as String) As CFArray
		  #if targetMacOS
		    declare function SCDynamicStoreCopyKeyList lib SystemConfiguration.framework (store as Ptr, pattern as CFStringRef) as Ptr
		    
		    return new CFArray(SCDynamicStoreCopyKeyList(self, pattern), CFArray.hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Proxies() As CFDictionary
		  #if targetMacOS
		    declare function SCDynamicStoreCopyProxies lib SystemConfiguration.framework (store as Ptr) as Ptr
		    
		    return new CFDictionary(SCDynamicStoreCopyProxies(self), hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ResolveSymbol(symbolName as String) As Ptr
		  #if targetMacOS
		    dim bundle as CFBundle = CFBundle.NewCFBundleFromID(SystemConfiguration.BundleID)
		    dim p as Ptr = bundle.DataPointerNotRetained(symbolName)
		    if p <> nil then
		      return p.Ptr(0)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as String) As CFPropertyList
		  #if targetMacOS
		    declare function SCDynamicStoreCopyValue lib SystemConfiguration.framework (store as Ptr, key as CFStringRef) as Ptr
		    dim p as Ptr = SCDynamicStoreCopyValue(self, key)
		    if p <> nil then
		      soft declare function CFGetTypeID lib CarbonLib (cf as Ptr) as UInteger
		      select case CFGetTypeID(p)
		      case CFArray.ClassID
		        return new CFArray(p, hasOwnership)
		      case CFBoolean.ClassID
		        return new CFBoolean(p, hasOwnership)
		      case CFData.ClassID
		        return new CFData(p, hasOwnership)
		      case CFDate.ClassID
		        return new CFDate(p, hasOwnership)
		      case CFDictionary.ClassID
		        return new CFDictionary(p, hasOwnership)
		      case CFNumber.ClassID
		        return new CFNumber(p, hasOwnership)
		      case CFString.ClassID
		        return new CFString(p, hasOwnership)
		      else
		        //this case should never happen unless Apple changes the list of CFTypes that can be in a CFPropertyList.
		      end select
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as String, assigns value as CFPropertyList)
		  #if targetMacOS
		    declare function SCDynamicStoreSetValue lib SystemConfiguration.framework (store as Ptr, key as CFStringRef, value as Ptr) as Boolean
		    
		    if not SCDynamicStoreSetValue(self, key, value) then
		      dim errorCode as Integer = SystemConfiguration.ErrorCode
		      raise new MacOSError(errorCode, SystemConfiguration.ErrorMessage(errorCode))
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function SCDynamicStoreCopyComputerName lib SystemConfiguration.framework (store as Ptr, nameEncoding as Ptr) as Ptr
			    
			    
			    return RetainedStringValue(SCDynamicStoreCopyComputerName(self, nil))
			  #endif
			End Get
		#tag EndGetter
		ComputerName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function SCDynamicStoreCopyLocalHostName lib SystemConfiguration.framework (store as Ptr) as Ptr
			    
			    return RetainedStringValue(SCDynamicStoreCopyLocalHostName(self))
			  #endif
			End Get
		#tag EndGetter
		LocalHostName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function SCDynamicStoreCopyLocation lib SystemConfiguration.framework (store as Ptr) as Ptr
			    
			    return RetainedStringValue(SCDynamicStoreCopyLocation(self))
			  #endif
			End Get
		#tag EndGetter
		Location As String
	#tag EndComputedProperty


	#tag Constant, Name = DomainFile, Type = String, Dynamic = False, Default = \"kSCDynamicStoreDomainFile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DomainPlugin, Type = String, Dynamic = False, Default = \"kSCDynamicStoreDomainPlugin", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DomainPrefs, Type = String, Dynamic = False, Default = \"kSCDynamicStoreDomainPrefs", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DomainSetup, Type = String, Dynamic = False, Default = \"kSCDynamicStoreDomainSetup", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DomainState, Type = String, Dynamic = False, Default = \"kSCDynamicStoreDomainState", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EntNetAirPort, Type = String, Dynamic = False, Default = \"kSCEntNetAirPort", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EntNetDNS, Type = String, Dynamic = False, Default = \"kSCEntNetDNS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EntNetEthernet, Type = String, Dynamic = False, Default = \"kSCEntNetEthernet", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EntNetIPv4, Type = String, Dynamic = False, Default = \"kSCEntNetIPv4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EntNetLink, Type = String, Dynamic = False, Default = \"kSCEntNetLink", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EntNetProxies, Type = String, Dynamic = False, Default = \"kSCEntNetProxies", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PropInterfaceName, Type = String, Dynamic = False, Default = \"kSCPropInterfaceName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PropMACAddress, Type = String, Dynamic = False, Default = \"kSCPropMACAddress", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PropNetAirPortJoinMode, Type = String, Dynamic = False, Default = \"kSCPropNetAirPortJoinMode", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PropNetInterfaces, Type = String, Dynamic = False, Default = \"kSCPropNetInterfaces", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PropUserDefinedName, Type = String, Dynamic = False, Default = \"kSCPropUserDefinedName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PropVersion, Type = String, Dynamic = False, Default = \"kSCPropVersion", Scope = Public
	#tag EndConstant


	#tag Structure, Name = SCDynamicStoreContext, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		version as Integer
		  info as Ptr
		  retain as Ptr
		  release as Ptr
		copyDescription as Ptr
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="ComputerName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="LocalHostName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Location"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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

#tag Class
Class SCNetworkInterface
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return SCNetworkInterface.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib SystemConfiguration.framework alias "SCNetworkInterfaceGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List() As SCNetworkInterface()
		  #if targetMacOS
		    declare function SCNetworkInterfaceCopyAll lib SystemConfiguration.framework () as Ptr
		    dim cfList as new CFArray(SCNetworkInterfaceCopyAll, hasOwnership)
		    dim ifList() as SCNetworkInterface
		    for i as Integer = 0 to cfList.Count - 1
		      ifList.Append new SCNetworkInterface(cfList.Value(i), not hasOwnership)
		    next
		    return ifList
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MediaOptions()
		  #if TargetMacOS
		    
		    soft declare Function SCNetworkInterfaceCopyMediaOptions lib SystemConfiguration.framework (intf as Ptr, Byref current as Ptr, byref active as Ptr, byref available as Ptr, filter as Boolean) as boolean
		    
		    dim current, active, available as Ptr
		    dim OK as Boolean
		    
		    OK = SCNetworkInterfaceCopyMediaOptions( self, current, active, available, false )
		    
		    'if OK then
		    if current<>nil then
		      dim currentDict as NSDictionary = new NSDictionary( current, false )
		      #pragma unused currentDict
		    end if
		    if active<>nil then
		      dim activeDict as NSDictionary = new NSDictionary( active, false )
		      #pragma unused activeDict
		    end if
		    if available<>nil then
		      dim availableArray as NSArray = new NSArray( available, false )
		      #pragma unused availableArray
		    end if
		    
		    
		    'Boolean SCNetworkInterfaceCopyMediaOptions (
		    'SCNetworkInterfaceRef interface,
		    'CFDictionaryRef *current,
		    'CFDictionaryRef *active,
		    'CFArrayRef *available,
		    'Boolean filter
		    ');
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function SCNetworkInterfaceGetBSDName lib SystemConfiguration.framework (obj as ptr) as Ptr
			    return RetainedStringValue(SCNetworkInterfaceGetBSDName(self))
			  #endif
			End Get
		#tag EndGetter
		BSDName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function SCNetworkInterfaceGetConfiguration lib SystemConfiguration.framework (obj as ptr) as Ptr
			    
			    dim nsd as NSDictionary
			    dim p as Ptr = SCNetworkInterfaceGetConfiguration( self )
			    if p=nil then
			      return  nil
			    else
			      nsd = new NSDictionary( p, false )
			      return   nsd.VariantValue
			    end if
			  #endif
			End Get
		#tag EndGetter
		Configuration As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function SCNetworkInterfaceGetLocalizedDisplayName lib SystemConfiguration.framework (obj as ptr) as Ptr
			    return RetainedStringValue(SCNetworkInterfaceGetLocalizedDisplayName(self))
			  #endif
			End Get
		#tag EndGetter
		DisplayName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function SCNetworkInterfaceGetHardwareAddressString lib SystemConfiguration.framework (obj as ptr) as Ptr
			    return RetainedStringValue(SCNetworkInterfaceGetHardwareAddressString(self))
			  #endif
			End Get
		#tag EndGetter
		HardwareAddress As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function SCNetworkInterfaceGetInterfaceType lib SystemConfiguration.framework (obj as ptr) as Ptr
			    return RetainedStringValue(SCNetworkInterfaceGetInterfaceType(self))
			  #endif
			End Get
		#tag EndGetter
		Type As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BSDName"
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
			Name="DisplayName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HardwareAddress"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

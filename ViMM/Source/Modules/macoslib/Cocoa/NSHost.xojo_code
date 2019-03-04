#tag Class
Class NSHost
Inherits NSObject
	#tag Method, Flags = &h0
		Function Addresses() As String()
		  // Deprecated in favor of NSArray Property.
		  #if targetMacOS
		    declare function addresses lib CocoaLib selector "addresses" (obj_id as Ptr) as Ptr
		    
		    if self <> nil then
		      dim p as Ptr = addresses(self)
		      dim theArray as new CFArray(p, not CFType.hasOwnership)
		      return theArray.StringValues
		    else
		      dim L(-1) as String
		      return L
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSHost")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithAddress(address as String) As NSHost
		  
		  #if targetMacOS
		    declare function hostWithAddress lib CocoaLib selector "hostWithAddress:" (class_id as Ptr, address as CFStringRef) as Ptr
		    
		    dim hostRef as Ptr = hostWithAddress(ClassRef, address)
		    if hostRef <> nil then
		      return new NSHost(hostRef)
		    end if
		    
		  #else
		    #pragma unused address
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithName(name as String) As NSHost
		  
		  #if targetMacOS
		    declare function hostWithName lib CocoaLib selector "hostWithName:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim hostRef as Ptr = hostWithName(ClassRef, name)
		    if hostRef <> nil then
		      return new NSHost(hostRef)
		    end if
		    
		  #else
		    #pragma unused name
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CurrentHost() As NSHost
		  #if targetMacOS
		    declare function currentHost lib CocoaLib selector "currentHost" (class_id as Ptr) as Ptr
		    
		    dim p as Ptr = currentHost(ClassRef)
		    return new NSHost(p)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetByAddress(address as String) As NSHost
		  #if targetMacOS
		    declare function hostWithAddress lib CocoaLib selector "hostWithAddress:" (class_id as Ptr, address as CFStringRef) as Ptr
		    
		    dim p as Ptr = hostWithAddress(ClassRef, address)
		    if p <> nil then
		      return new NSHost(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetByName(name as String) As NSHost
		  #if targetMacOS
		    declare function hostWithName lib CocoaLib selector "hostWithName:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim p as Ptr = hostWithName(ClassRef, name)
		    if p <> nil then
		      return new NSHost(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Names() As String()
		  // Deprecated in favor of NSArray Property.
		  #if targetMacOS
		    declare function names lib CocoaLib selector "names" (obj_id as Ptr) as Ptr
		    
		    if self <> nil then
		      dim p as Ptr = names(self)
		      dim theArray as new CFArray(p, not CFType.hasOwnership)
		      return theArray.StringValues
		    else
		      dim L(-1) as String
		      return L
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(host as NSHost) As Integer
		  #if targetMacOS
		    declare function isEqualToHost lib CocoaLib selector "isEqualToHost:" (obj_id as Ptr, host as Ptr) as Boolean
		    
		    if (host <> nil ) and isEqualToHost(self, host) then
		      return 0
		    else
		      return 1
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  
		  return self.Address
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As Variant
		  
		  return self.Address
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function address lib CocoaLib selector "address" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(address(self))
			  #endif
			End Get
		#tag EndGetter
		Address As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function addresses lib CocoaLib selector "addresses" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = addresses(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Addresses As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //only returns a value for current host.
			  
			  #if targetMacOS
			    declare function localizedName lib CocoaLib selector "localizedName" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(localizedName(self))
			  #endif
			End Get
		#tag EndGetter
		LocalizedName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as Ptr
			    
			    if self <> nil then
			      return RetainedStringValue(name(self))
			      
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function names lib CocoaLib selector "names" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = names(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Names As NSArray
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
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
			Name="LocalizedName"
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

#tag Class
Class NSNotification
Inherits NSObject
	#tag Method, Flags = &h21
		Private Function AssociatedObject2() As Ptr
		  #if targetMacOS
		    declare function object_ lib CocoaLib selector "object" (obj_id as Ptr) as Ptr
		    
		    return object_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSNotification")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create(aName as String, anObject as NSObject, anUserInfo as NSDictionary = nil) As NSNotification
		  //# Returns a new notification object with a specified name and object.
		  
		  #if TargetMacOS
		    declare function notificationWithNameObj lib CocoaLib selector "notificationWithName:object:" _
		    (class_id as Ptr, aName as CFStringRef, anObject as Ptr) as Ptr
		    
		    declare function notificationWithNameObjInfo lib CocoaLib selector "notificationWithName:object:userInfo:" _
		    (class_id as Ptr, aName as CFStringRef, anObject as Ptr, anUserInfo as Ptr) as Ptr
		    
		    dim objRef as Ptr
		    if anObject <> nil then
		      objRef = anObject
		    end if
		    
		    dim notificationRef as Ptr
		    
		    if anUserInfo = nil then
		      notificationRef = notificationWithNameObj(ClassRef, aName, objRef)
		    else
		      notificationRef = notificationWithNameObjInfo(ClassRef, aName, objRef, anUserInfo)
		    end if
		    
		    if notificationRef <> nil then
		      return new NSNotification(notificationRef)
		    end if
		    
		  #else
		    #pragma unused aName
		    #pragma unused anObject
		    #pragma unused anUserInfo
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Dictionary
		  //# Converts the NSNotification into a RS Dictionary object. Used for Convenience Methods
		  
		  dim dict as new Dictionary
		  
		  dict.Value( "Name" ) = me.Name
		  dict.Value( "AssociatedObject" ) = me.AssociatedObject
		  if me.UserInfo<>nil then
		    dict.Value( "UserInfo" ) = me.UserInfo.VariantValue
		  end if
		  
		  return   dict
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UserInfo2() As CFDictionary
		  #if targetMacOS
		    declare function userInfo lib CocoaLib selector "userInfo" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = userInfo(self)
		    if p <> nil then
		      return new CFDictionary(p, not CFType.hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As Variant
		  
		  return self.Operator_Convert
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the object associated with the notification.
			  
			  #if targetMacOS
			    declare function object_ lib CocoaLib selector "object" (obj_id as Ptr) as Ptr
			    
			    dim objRef as Ptr = object_(self)
			    if objRef <> nil then
			      return new NSObject(objRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		AssociatedObject As NSObject
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as CFStringRef
			    
			    return name(self)
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function userInfo lib CocoaLib selector "userInfo" (obj_id as Ptr) as Ptr
			    
			    dim dictRef as Ptr = userInfo(self)
			    if dictRef <> nil then
			      return new NSDictionary(dictRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		UserInfo As NSDictionary
	#tag EndComputedProperty


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

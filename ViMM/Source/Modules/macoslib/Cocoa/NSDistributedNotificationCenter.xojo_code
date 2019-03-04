#tag Class
Class NSDistributedNotificationCenter
Inherits NSNotificationCenter
	#tag Method, Flags = &h0
		Sub AddObserver(notObserver as NSObject, notSelector as String, notName as String, notSender as NSObject, deliveryBehavior as NSNotificationSuspensionBehavior)
		  //# Adds an entry to the NSDistributedNotificationCenter’s dispatch table with a specific observer and suspended-notifications behavior, and optional notification name and sender.
		  
		  #if TargetMacOS
		    declare sub addObserver lib CocoaLib selector "addObserver:selector:name:object:suspensionBehavior:" _
		    (obj_id as Ptr, notObserver as Ptr, notSelector as Ptr, notName as CFStringRef, notSender as Ptr, deliveryBehavior as NSNotificationSuspensionBehavior)
		    
		    dim observerRef as Ptr
		    if notObserver <> nil then
		      observerRef = notObserver
		    end if
		    
		    dim senderRef as Ptr
		    if notSender <> nil then
		      senderRef = notSender
		    end if
		    
		    dim nameRef as CFStringRef
		    if notName <> "" then
		      nameRef = notName
		    end if
		    
		    addObserver self, observerRef, Cocoa.NSSelectorFromString(notSelector), nameRef, senderRef, deliveryBehavior
		  #else
		    #pragma unused notObserver
		    #pragma unused notSelector
		    #pragma unused notName
		    #pragma unused notSender
		    #pragma unused deliveryBehavior
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CenterForType(centerType as String) As NSDistributedNotificationCenter
		  //# Returns the distributed notification center for a particular notification center type.
		  
		  #if TargetMacOS
		    declare function notificationCenterForType lib CocoaLib selector "notificationCenterForType:" (class_id as Ptr, centerType as CFStringRef) as Ptr
		    
		    static c as new NSDistributedNotificationCenter(notificationCenterForType(Cocoa.NSClassFromString("NSDistributedNotificationCenter"), centerType))
		    return c
		  #else
		    #pragma unused centerType
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultCenter() As NSDistributedNotificationCenter
		  //# Returns the default distributed notification center, representing the local notification center for the computer.
		  
		  #if TargetMacOS
		    declare function defaultCenter lib CocoaLib selector "defaultCenter" (class_id as Ptr) as Ptr
		    
		    static c as new NSDistributedNotificationCenter(defaultCenter(Cocoa.NSClassFromString("NSDistributedNotificationCenter")))
		    return c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocalNotificationCenterType() As String
		  
		  static name as String = Cocoa.StringConstant ("NSLocalNotificationCenterType")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostNotification(notName as String, notSender as NSObject, userInfo as NSDictionary, deliverImmediately as Boolean)
		  //# Creates a notification with information and an immediate-delivery specifier, and posts it to the NSDistributedNotificationCenter.
		  
		  #if TargetMacOS
		    declare sub postNotificationName lib CocoaLib selector "postNotificationName:object:userInfo:deliverImmediately:" _
		    (obj_id as Ptr, notificationName as CFStringRef, notSender as Ptr, userInfo as Ptr, deliverImmediately as Boolean)
		    
		    dim senderRef as Ptr
		    if notSender <> nil then
		      senderRef = notSender
		    end if
		    
		    dim dictRef as Ptr
		    if userInfo <> nil then
		      dictRef = userInfo
		    end if
		    
		    postNotificationName self, notName, senderRef, dictRef, deliverImmediately
		  #else
		    #pragma unused notName
		    #pragma unused notSender
		    #pragma unused userInfo
		    #pragma unused deliverImmediately
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostNotification(notName as String, notSender as NSObject, userInfo as NSDictionary, options as Integer)
		  //# Creates a notification with information, and posts it to the NSDistributedNotificationCenter.
		  
		  #if TargetMacOS
		    declare sub postNotificationName lib CocoaLib selector "postNotificationName:object:userInfo:options:" _
		    (obj_id as Ptr, notificationName as CFStringRef, notSender as Ptr, userInfo as Ptr, options as Integer)
		    
		    dim senderRef as Ptr
		    if notSender <> nil then
		      senderRef = notSender
		    end if
		    
		    dim dictRef as Ptr
		    if userInfo <> nil then
		      dictRef = userInfo
		    end if
		    
		    postNotificationName self, notName, senderRef, dictRef, options
		    
		  #else
		    #pragma unused notName
		    #pragma unused notSender
		    #pragma unused userInfo
		    #pragma unused options
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Boolean value that indicates whether notification delivery is suspended.
			  
			  #if TargetMacOS
			    declare function suspended lib CocoaLib selector "suspended" (class_id as Ptr) as Boolean
			    
			    return suspended(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Suspends or resumes notification delivery.
			  
			  #if TargetMacOS
			    declare sub setSuspended lib CocoaLib selector "setSuspended:" (obj_id as Ptr, flag as Boolean)
			    
			    setSuspended self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Suspended As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = NSNotificationDeliverImmediately, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSNotificationPostToAllSessions, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSNotificationSuspensionBehavior, Type = Integer, Flags = &h0
		NSNotificationSuspensionBehaviorDrop = 1
		  NSNotificationSuspensionBehaviorCoalesce = 2
		  NSNotificationSuspensionBehaviorHold = 3
		NSNotificationSuspensionBehaviorDeliverImmediately = 4
	#tag EndEnum


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
			InitialValue="2147483648"
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
			Name="Suspended"
			Group="Behavior"
			Type="Boolean"
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

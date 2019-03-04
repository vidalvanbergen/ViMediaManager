#tag Class
Class NSUserNotificationCenter
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = NSClassFromString("NSUserNotificationCenter")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS then
		    declare function defaultUserNotificationCenter lib CocoaLib selector "defaultUserNotificationCenter" (obj_id as Ptr) as Ptr
		    
		    super.Constructor( defaultUserNotificationCenter( NSClassFromString("NSUserNotificationCenter") ), not hasOwnership )
		    SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_DidActivateNotification(id as Ptr, sel as Ptr, cntl as Ptr, notification as Ptr) As Boolean
		  #pragma unused sel
		  #pragma Unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSUserNotificationCenter = NSUserNotificationCenter(w.Value)
		    if obj <> nil then
		      obj.HandleDidActivateNotification(new NSUserNotification(notification))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_DidDeliverNotification(id as Ptr, sel as Ptr, cntl as Ptr, notification as Ptr) As Boolean
		  #pragma unused sel
		  #pragma Unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSUserNotificationCenter = NSUserNotificationCenter(w.Value)
		    if obj <> nil then
		      obj.HandleDidDeliverNotification(new NSUserNotification(notification))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_ShouldPresentNotification(id as Ptr, sel as Ptr, cntl as Ptr, notification as Ptr) As Boolean
		  #pragma unused sel
		  #pragma Unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSUserNotificationCenter = NSUserNotificationCenter(w.Value)
		    if obj <> nil then
		      return obj.HandleShouldPresentNotification(new NSUserNotification(notification))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeliveredNotifications() As NSUserNotification()
		  
		  #if TargetMacOS then
		    declare function deliveredNotifications lib CocoaLib selector "deliveredNotifications" (obj_id as Ptr) as Ptr
		    
		    dim n() as NSUserNotification
		    
		    dim ar as New NSArray( deliveredNotifications(self) )
		    
		    for i as Integer = 0 to ar.Count -1
		      n.Append New NSUserNotification( ar.Value(i) )
		    next
		    
		    return n
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeliverNotification(UserNotification as NSUserNotification)
		  
		  #if TargetMacOS then
		    declare sub deliverNotification lib CocoaLib selector "deliverNotification:" (obj_id as Ptr, UserNotification as Ptr)
		    
		    dim notificationRef as Ptr
		    if UserNotification <> nil then
		      notificationRef = UserNotification
		    end if
		    
		    deliverNotification self, notificationRef
		  #else
		    #pragma Unused UserNotification
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDelegate() As Ptr
		  
		  #if TargetMacOS then
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidActivateNotification(UserNotification as NSUserNotification)
		  RaiseEvent DidActivateNotification( UserNotification )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidDeliverNotification(UserNotification as NSUserNotification)
		  RaiseEvent DidDeliverNotification( UserNotification )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleShouldPresentNotification(UserNotification as NSUserNotification) As Boolean
		  return RaiseEvent ShouldPresentNotificationInForeground( UserNotification )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append "userNotificationCenter:didDeliverNotification:" : CType( AddressOf delegate_DidDeliverNotification, Ptr ) : "v@:@@"
		    methodList.Append "userNotificationCenter:didActivateNotification:" : CType( AddressOf delegate_DidActivateNotification, Ptr ) : "v@:@@"
		    methodList.Append "userNotificationCenter:shouldPresentNotification:" : CType( AddressOf delegate_ShouldPresentNotification, Ptr ) : "B@:@@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList)
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllDeliveredNotifications()
		  
		  #if TargetMacOS then
		    declare sub removeAllDeliveredNotifications lib CocoaLib selector "removeAllDeliveredNotifications" (obj_id as Ptr)
		    
		    removeAllDeliveredNotifications(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveDeliveredNotification(UserNotification as NSUserNotification)
		  
		  #if TargetMacOS then
		    declare sub removeDeliveredNotification lib CocoaLib selector "removeDeliveredNotification:" (obj_id as Ptr, UserNotification as Ptr)
		    
		    dim UserNotificationRef as Ptr
		    if UserNotification <> nil then
		      UserNotificationRef = UserNotification
		    end if
		    
		    removeDeliveredNotification(self, UserNotificationRef)
		  #else
		    #pragma Unused UserNotification
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveScheduledNotification(UserNotification as NSUserNotification)
		  
		  #if TargetMacOS then
		    declare sub removeScheduledNotification lib CocoaLib selector "removeScheduledNotification:" (obj_id as Ptr, UserNotification as Ptr)
		    
		    dim UserNotificationRef as Ptr
		    if UserNotification <> nil then
		      UserNotificationRef = UserNotification
		    end if
		    
		    removeScheduledNotification(self, UserNotificationRef)
		  #else
		    #pragma Unused UserNotification
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScheduledNotifications() As NSUserNotification()
		  
		  #if TargetMacOS then
		    declare function scheduledNotifications lib CocoaLib selector "scheduledNotifications" (obj_id as Ptr) as Ptr
		    
		    dim n() as NSUserNotification
		    
		    dim ar as New NSArray( scheduledNotifications(self) )
		    
		    for i as Integer = 0 to ar.Count -1
		      n.Append New NSUserNotification( ar.Value(i) )
		    next
		    
		    return n
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScheduleNotification(UserNotification as NSUserNotification)
		  
		  #if TargetMacOS then
		    declare sub scheduleNotification lib CocoaLib selector "scheduleNotification:" (obj_id as Ptr, UserNotification as Ptr)
		    
		    dim UserNotificationRef as Ptr
		    if UserNotification <> Nil then
		      UserNotificationRef = UserNotification
		    end if
		    
		    scheduleNotification self, UserNotificationRef
		  #else
		    #pragma Unused UserNotification
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  
		  #if TargetMacOS then
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidActivateNotification(notification as NSUserNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidDeliverNotification(notification as NSUserNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShouldPresentNotificationInForeground(notification as NSUserNotification) As Boolean
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function deliveredNotifications lib CocoaLib selector "deliveredNotifications" (obj_id as Ptr) as Ptr
			    
			    return New NSArray( deliveredNotifications(self) )
			  #endif
			End Get
		#tag EndGetter
		DeliveredNotifications As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function scheduledNotifications lib CocoaLib selector "scheduledNotifications" (obj_id as Ptr) as Ptr
			    
			    return New NSArray( scheduledNotifications(self) )
			  #endif
			End Get
		#tag EndGetter
		ScheduledNotifications As NSArray
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSUserNotificationCenterDelegate", Scope = Private
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

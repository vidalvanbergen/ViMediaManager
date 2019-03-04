#tag Class
Class NSNotificationCenter
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddObserver()
		  'declare sub objc_msgSend lib CocoaLib alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL, _
		  'obs as id, sel as SEL, name as CFStringRef, sender as id)
		  '
		  'static sel as SEL = Cocoa.Selector ("addObserver:selector:name:object:")
		  '
		  ''objc_msgSend (
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString("NSNotificationCenter")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultCenter() As NSNotificationCenter
		  #if targetCocoa
		    declare function defaultCenter lib CocoaLib selector "defaultCenter" (class_id as Ptr) as Ptr
		    
		    static c as new NSNotificationCenter(defaultCenter(ClassRef))
		    return c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostNotification(notification as NSNotification)
		  
		  #if TargetMacOS
		    declare sub postNotification lib CocoaLib selector "postNotification:" (obj_id as Ptr, notification as Ptr)
		    
		    dim notificationRef as Ptr
		    if notification <> nil then
		      notificationRef = notification
		      postNotification self, notificationRef
		    end if
		    
		  #else
		    #pragma unused notification
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostNotification(notName as String, notSender as NSObject)
		  
		  #if TargetMacOS
		    declare sub postNotificationName lib CocoaLib selector "postNotificationName:object:" (obj_id as Ptr, notificationName as CFStringRef, notSender as Ptr)
		    
		    dim senderRef as Ptr
		    if notSender <> nil then
		      senderRef = notSender
		    end if
		    
		    postNotificationName self, notName, senderRef
		    
		  #else
		    #pragma unused notName
		    #pragma unused notSender
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostNotification(notName as String, notSender as NSObject, userInfo as NSDictionary)
		  
		  #if TargetMacOS
		    declare sub postNotificationName lib CocoaLib selector "postNotificationName:object:userInfo:" _
		    (obj_id as Ptr, notificationName as CFStringRef, notSender as Ptr, userInfo as Ptr)
		    
		    dim senderRef as Ptr
		    if notSender <> nil then
		      senderRef = notSender
		    end if
		    
		    dim dictRef as Ptr
		    if userInfo <> nil then
		      dictRef = userInfo
		    end if
		    
		    postNotificationName self, notName, senderRef, dictRef
		    
		  #else
		    #pragma unused notName
		    #pragma unused notSender
		    #pragma unused userInfo
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveObserver(notObserver as NSObject)
		  
		  #if TargetMacOS
		    declare sub removeObserver lib CocoaLib selector "removeObserver:" (obj_id as Ptr, notObserver as Ptr)
		    
		    dim observerRef as Ptr
		    if notObserver <> nil then
		      observerRef = notObserver
		    end if
		    
		    removeObserver self, observerRef
		    
		  #else
		    #pragma unused notObserver
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveObserver(notObserver as NSObject, notName as String, notSender as NSObject)
		  
		  #if TargetMacOS
		    declare sub removeObserver lib CocoaLib selector "removeObserver:name:object:" _
		    (obj_id as Ptr, notObserver as Ptr, notName as CFStringRef, notSender as Ptr)
		    
		    dim observerRef as Ptr
		    if notObserver <> nil then
		      observerRef = notObserver
		    end if
		    
		    dim senderRef as Ptr
		    if notSender <> nil then
		      senderRef = notSender
		    end if
		    
		    removeObserver self, observerRef, notName, senderRef
		    
		  #else
		    #pragma unused notObserver
		    #pragma unused notName
		    #pragma unused notSender
		  #endif
		  
		End Sub
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

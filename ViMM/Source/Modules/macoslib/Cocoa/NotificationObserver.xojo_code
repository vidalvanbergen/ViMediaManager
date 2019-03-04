#tag Class
Class NotificationObserver
	#tag Method, Flags = &h21
		Private Shared Function AddInstanceMethod(class_id as Ptr, name as String, impl as Ptr, types as String) As Boolean
		  #if targetMacOS
		    soft declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    
		    return class_addMethod(class_id, Cocoa.NSSelectorFromString(name), impl, types)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static class_id as Ptr = MakeClass(NSClassName)
		  return class_id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Creates from [NSNotificationCenter defaultCenter]
		  
		  #if targetMacOS
		    declare function alloc lib CocoaLIb selector "alloc" (classRef as Ptr) as Ptr
		    declare function init lib CocoaLIb selector "init" (id as Ptr) as Ptr
		    declare function retain lib CocoaLib selector "retain" (id as Ptr) as Ptr
		    declare function defaultCenter lib CocoaLib selector "defaultCenter" (class_id as Ptr) as Ptr
		    
		    self.Observer = init(alloc(ClassRef))
		    ObjectMap.Value(self.Observer) = new WeakRef(self)
		    
		    mNotificationCenter = retain (defaultCenter(Cocoa.NSClassFromString("NSNotificationCenter")))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(forCenter as Ptr)
		  // Creates from passed notification center
		  
		  #if targetMacOS
		    declare function alloc lib CocoaLIb selector "alloc" (classRef as Ptr) as Ptr
		    declare function init lib CocoaLIb selector "init" (id as Ptr) as Ptr
		    declare function retain lib CocoaLib selector "retain" (id as Ptr) as Ptr
		    declare function defaultCenter lib CocoaLib selector "defaultCenter" (class_id as Ptr) as Ptr
		    
		    self.Observer = init(alloc(ClassRef))
		    ObjectMap.Value(self.Observer) = new WeakRef(self)
		    
		    mNotificationCenter = retain (forCenter)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(notificationName as String, notificationSender as Ptr = nil)
		  // Creates from [NSNotificationCenter defaultCenter]
		  
		  #if targetMacOS
		    self.Constructor()
		    self.Register notificationName, notificationSender
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DefaultCenter() As Ptr
		  #if targetMacOS
		    declare function defaultCenter lib CocoaLib selector "defaultCenter" (class_id as Ptr) as Ptr
		    
		    return defaultCenter(Cocoa.NSClassFromString("NSNotificationCenter"))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if TargetMacOS
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    self.Unregister
		    
		    if mNotificationCenter <> nil then
		      release (mNotificationCenter)
		      mNotificationCenter = nil
		    end if
		    
		    if ObjectMap.HasKey(self.Observer) then
		      ObjectMap.Remove self.Observer
		    end if
		    
		    if self.Observer <> nil then
		      release(self.Observer)
		      self.Observer = nil
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchNotification(id as Ptr, sel as Ptr, notification as Ptr)
		  #pragma unused sel
		  //although I could check the name of the notification.
		  
		  #if TargetMacOS
		    
		    #pragma stackOverflowChecking false
		    
		    
		    dim ref as WeakRef = ObjectMap.Lookup(id, new WeakRef(nil))
		    if ref.Value isA NotificationObserver then
		      dim observer as NotificationObserver = NotificationObserver(ref.Value)
		      observer.HandleNotification new NSNotification(notification)
		    else
		      break
		      //something might be wrong.
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleNotification(notification as NSNotification)
		  #pragma stackOverflowChecking false
		  
		  raiseEvent HandleNotification notification
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeClass(className as String, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  
		  #if TargetMacOS
		    soft declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    soft declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    
		    objc_registerClassPair newClassId
		    const MethodTypeEncoding = "v@:@"
		    
		    if AddInstanceMethod(newClassId, NotificationSelector, AddressOf DispatchNotification, MethodTypeEncoding) then
		      return newClassId
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superclassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ObjectMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Register(notificationName as String, notificationSender as Ptr = nil)
		  //Register a notification. Pass empty string to register all notifications
		  
		  #if targetMacOS
		    declare sub addObserver lib CocoaLib selector "addObserver:selector:name:object:" (obj_id as Ptr, notificationObserver as Ptr, notificationSelector as Ptr, notificationName as CFStringRef, notificationSender as Ptr)
		    
		    dim s as String = Cocoa.StringConstant(notificationName)
		    if s <> "" then
		      notificationName = s
		    end if
		    
		    if notificationName<>"" then
		      addObserver(mNotificationCenter, self.Observer, Cocoa.NSSelectorFromString(NotificationSelector), notificationName, notificationSender)
		    else
		      addObserver(mNotificationCenter, self.Observer, Cocoa.NSSelectorFromString(NotificationSelector), nil, notificationSender)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unregister()
		  #if targetMacOS
		    declare sub removeObserver lib CocoaLib selector "removeObserver:" (obj_id as Ptr, notificationObserver as Ptr)
		    
		    if mNotificationCenter <> nil then
		      removeObserver (mNotificationCenter, self.Observer)
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event HandleNotification(notification as NSNotification)
	#tag EndHook


	#tag Note, Name = Read Me
		To use this class, you should implement HandleNotification in a subclass or by using AddHandler, or drop onto a window.
		The notifications sent by Cocoa classes are described in the Apple documentation for the classes.  See NSTimeZoneWindow
		for an example.
	#tag EndNote


	#tag Property, Flags = &h21
		Private mNotificationCenter As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Observer As Ptr
	#tag EndProperty


	#tag Constant, Name = NotificationSelector, Type = String, Dynamic = False, Default = \"macoslibDispatchNotification:", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"macoslibNotificationObserver", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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

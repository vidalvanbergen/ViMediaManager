#tag Class
Class NSRunLoop
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AcceptInput(mode as String, limitDate as NSDate)
		  
		  #if TargetMacOS
		    declare sub acceptInputForMode lib CocoaLib selector "acceptInputForMode:beforeDate:" (obj_id as Ptr, mode as CFStringRef, limitDate as Ptr)
		    
		    dim dateRef as Ptr
		    if limitDate <> nil then
		      dateRef = limitDate
		    end if
		    
		    acceptInputForMode(self, mode, dateRef)
		    
		  #else
		    #pragma unused mode
		    #pragma unused limitDate
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPort(aPort as NSPort, mode as String)
		  
		  #if TargetMacOS
		    declare sub addPort lib CocoaLib selector "addPort:forMode:" (obj_id as Ptr, aPort as Ptr, mode as CFStringRef)
		    
		    dim portRef as Ptr
		    if aPort <> nil then
		      portRef = aPort
		    end if
		    
		    addPort self, portRef, mode
		    
		  #else
		    #pragma unused aPort
		    #pragma unused mode
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTimer(aTimer as NSTimer, mode as String)
		  
		  #if TargetMacOS
		    declare sub addTimer lib CocoaLib selector "addTimer:forMode:" (obj_id as Ptr, aTimer as Ptr, mode as CFStringRef)
		    
		    dim timerRef as Ptr
		    if aTimer <> nil then
		      timerRef = aTimer
		    end if
		    
		    addTimer self, timerRef, mode
		    
		  #else
		    #pragma unused aTimer
		    #pragma unused mode
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelPerformSelector(aSelector as String, target as NSObject, argument as NSObject)
		  
		  #if TargetMacOS
		    declare sub cancelPerformSelector lib CocoaLib selector "cancelPerformSelector:target:argument:" (obj_id as Ptr, aSelector as Ptr, target as Ptr, argument as Ptr)
		    
		    dim targetRef as Ptr
		    if target <> nil then
		      targetRef = target
		    end if
		    
		    dim argumentRef as Ptr
		    if argument <> nil then
		      argumentRef = argument
		    end if
		    
		    cancelPerformSelector self, Cocoa.NSSelectorFromString(aSelector), targetRef, argumentRef
		    
		  #else
		    #pragma unused aSelector
		    #pragma unused target
		    #pragma unused argument
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelPerformSelectors(target as NSObject)
		  
		  #if TargetMacOS
		    declare sub cancelPerformSelectorsWithTarget lib CocoaLib selector "cancelPerformSelectorsWithTarget:" (obj_id as Ptr, target as Ptr)
		    
		    dim targetRef as Ptr
		    if target <> nil then
		      targetRef = target
		    end if
		    
		    cancelPerformSelectorsWithTarget self, targetRef
		    
		  #else
		    #pragma unused target
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFRunLoop() As CFRunLoop
		  #if targetCocoa
		    declare function getCFRunLoop lib CocoaLib selector "getCFRunLoop" (obj_id as Ptr) as Ptr
		    
		    return new CFRunLoop(getCFRunLoop(self), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSRunLoop")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Current() As NSRunLoop
		  #if targetCocoa
		    declare function currentRunLoop lib CocoaLib selector "currentRunLoop" (class_id as Ptr) as Ptr
		    
		    return new NSRunLoop(currentRunLoop(ClassRef), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentMode() As String
		  
		  #if TargetMacOS
		    declare function currentMode lib CocoaLib selector "currentMode" (obj_id as Ptr) as CFStringRef
		    
		    return currentMode(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LimitDate(mode as String) As NSDate
		  
		  #if TargetMacOS
		    declare function limitDateForMode lib CocoaLib selector "limitDateForMode:" (obj_id as Ptr, mode as CFStringRef) as Ptr
		    
		    dim dateRef as Ptr = limitDateForMode(self, mode)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #else
		    #pragma unused mode
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Main() As NSRunLoop
		  #if targetCocoa
		    declare function mainRunLoop lib CocoaLib selector "mainRunLoop" (class_id as Ptr) as Ptr
		    
		    return new NSRunLoop(mainRunLoop(ClassRef), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDefaultRunLoopMode() As String
		  
		  return Cocoa.StringConstant("NSDefaultRunLoopMode")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSRunLoopCommonModes() As String
		  
		  return Cocoa.StringConstant("NSRunLoopCommonModes")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformSelector(aSelector as String, target as NSObject, argument as NSObject, order as UInt32, modes() as String)
		  
		  #if TargetMacOS
		    declare sub performSelector lib CocoaLib selector "performSelector:target:argument:order:modes:" _
		    (obj_id as Ptr, aSelector as Ptr, target as Ptr, argument as Ptr, order as UInt32, modes as Ptr)
		    
		    dim targetRef as Ptr
		    if target <> nil then
		      targetRef = target
		    end if
		    
		    dim argumentRef as Ptr
		    if argument <> nil then
		      argumentRef = argument
		    end if
		    
		    dim modesArray as NSArray
		    dim modesArrayRef as Ptr
		    if modes.ubound > -1 then
		      modesArray = new NSArray(modes)
		      modesArrayRef = modesArray
		    end if
		    
		    performSelector self, Cocoa.NSSelectorFromString(aSelector), targetRef, argumentRef, order, modesArrayRef
		    
		  #else
		    #pragma unused aSelector
		    #pragma unused target
		    #pragma unused argument
		    #pragma unused order
		    #pragma unused modes
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePort(aPort as NSPort, mode as String)
		  
		  #if TargetMacOS
		    declare sub removePort lib CocoaLib selector "removePort:forMode:" (obj_id as Ptr, aPort as Ptr, mode as CFStringRef)
		    
		    dim portRef as Ptr
		    if aPort <> nil then
		      portRef = aPort
		    end if
		    
		    removePort self, portRef, mode
		    
		  #else
		    #pragma unused aPort
		    #pragma unused mode
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  
		  #if TargetMacOS
		    declare sub run lib CocoaLib selector "run" (obj_id as Ptr)
		    
		    run self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(limitDate as NSDate)
		  
		  #if TargetMacOS
		    declare sub runUntilDate lib CocoaLib selector "runUntilDate:" (obj_id as Ptr, limitDate as Ptr)
		    
		    dim dateRef as Ptr
		    if limitDate <> nil then
		      dateRef = limitDate
		    end if
		    
		    runUntilDate(self, dateRef)
		    
		  #else
		    #pragma unused limitDate
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(mode as String, limitDate as NSDate) As Boolean
		  
		  #if TargetMacOS
		    declare function runMode lib CocoaLib selector "runMode:beforeDate:" (obj_id as Ptr, mode as CFStringRef, limitDate as Ptr) as Boolean
		    
		    dim dateRef as Ptr
		    if limitDate <> nil then
		      dateRef = limitDate
		    end if
		    
		    return runMode(self, mode, dateRef)
		    
		  #else
		    #pragma unused mode
		    #pragma unused limitDate
		  #endif
		  
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

#tag Class
Class NSUserNotification
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    super.Constructor(Initialize(Allocate(Cocoa.NSClassFromString("NSUserNotification"))))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Print()
		  System.Log System.LogLevelError, self.Description
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getActionButtonTitle lib CocoaLib selector "actionButtonTitle" (obj_id as Ptr) as CFStringRef
			    
			    return getActionButtonTitle(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setActionButtonTitle lib CocoaLib selector "setActionButtonTitle:" (obj_id as Ptr, value as CFStringRef)
			    
			    setActionButtonTitle self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		ActionButtonTitle As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function GetActivationType lib CocoaLib selector "activationType" (obj_id as Ptr) as NSUserNotificationActivationType
			    
			    return GetActivationType(self)
			  #endif
			End Get
		#tag EndGetter
		ActivationType As NSUserNotificationActivationType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getActualDeliveryDate lib CocoaLib selector "actualDeliveryDate" (obj_id as Ptr) as Ptr
			    
			    return New NSDate( getActualDeliveryDate(self) )
			  #endif
			End Get
		#tag EndGetter
		ActualDeliveryDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return IsMountainLion
			End Get
		#tag EndGetter
		Shared Available As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    if (RespondsToSelector("contentImage")) then
			      Declare Function contentImage Lib "Cocoa" Selector "contentImage" (instanceRef As Ptr) As Ptr
			      Return NEW NSImage(contentImage(me))
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    if (RespondsToSelector("setContentImage:")) then
			      Declare Sub setContentImage Lib "Cocoa" Selector "setContentImage:" (instanceRef As Ptr, aNSImage As Ptr)
			      
			      if (value <> Nil) then
			        setContentImage me, value
			      end if
			    end if
			    
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		ContentImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getDeliveryDate lib CocoaLib selector "deliveryDate" (obj_id as Ptr) as Ptr
			    
			    return New NSDate( getDeliveryDate(self) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setDeliveryDate lib CocoaLib selector "setDeliveryDate:" (obj_id as Ptr, value as Ptr)
			    
			    setDeliveryDate self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		DeliveryDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getDeliveryRepeatInterval lib CocoaLib selector "deliveryRepeatInterval" (obj_id as Ptr) as Ptr
			    
			    return New NSDateComponents( getDeliveryRepeatInterval(self) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setDeliveryRepeatInterval lib CocoaLib selector "setDeliveryRepeatInterval:" (obj_id as Ptr, value as Ptr)
			    
			    setDeliveryRepeatInterval self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		DeliveryRepeatInterval As NSDateComponents
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getDeliveryTimeZone lib CocoaLib selector "deliveryTimeZone" (obj_id as Ptr) as Ptr
			    
			    return New NSTimeZone( getDeliveryTimeZone(self) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setDeliveryTimeZone lib CocoaLib selector "setDeliveryTimeZone:" (obj_id as Ptr, value as Ptr)
			    
			    setDeliveryTimeZone self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		DeliveryTimeZone As NSTimeZone
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getHasActionButton lib CocoaLib selector "hasActionButton" (obj_id as Ptr) as Boolean
			    
			    return getHasActionButton(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setHasActionButton lib CocoaLib selector "setHasActionButton:" (obj_id as Ptr, value as Boolean)
			    
			    setHasActionButton self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		HasActionButton As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getInformativeText lib CocoaLib selector "informativeText" (obj_id as Ptr) as CFStringRef
			    
			    return getInformativeText(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setInformativeText lib CocoaLib selector "setInformativeText:" (obj_id as Ptr, value as CFStringRef)
			    
			    setInformativeText self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		InformativeText As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIsPresented lib CocoaLib selector "isPresented" (obj_id as Ptr) as Boolean
			    
			    return getIsPresented(self)
			  #endif
			End Get
		#tag EndGetter
		IsPresented As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIsRemote lib CocoaLib selector "isRemote" (obj_id as Ptr) as Boolean
			    
			    return getIsRemote(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setRemote lib CocoaLib selector "setRemote:" (obj_id as Ptr, value as Boolean)
			    
			    setRemote self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		IsRemote As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getOtherButtonTitle lib CocoaLib selector "otherButtonTitle" (obj_id as Ptr) as CFStringRef
			    
			    return getOtherButtonTitle(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setOtherButtonTitle lib CocoaLib selector "setOtherButtonTitle:" (obj_id as Ptr, value as CFStringRef)
			    
			    setOtherButtonTitle self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		otherButtonTitle As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function soundName lib CocoaLib selector "soundName" (obj_id as Ptr) as CFStringRef
			    
			    dim buffer as string
			    buffer = SoundName(self)
			    return buffer
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setSoundName lib CocoaLib selector "setSoundName:" (obj_id as Ptr, value as CFStringRef)
			    
			    if value = NIL then
			      setSoundName self, NIL
			    else
			      dim buffer as string
			      buffer = cstr(value)
			      setSoundName self, buffer
			    end if
			    
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		SoundName As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getSubtitle lib CocoaLib selector "subtitle" (obj_id as Ptr) as CFStringRef
			    
			    return getSubtitle(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setSubtitle lib CocoaLib selector "setSubtitle:" (obj_id as Ptr, value as CFStringRef)
			    
			    setSubtitle self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Subtitle As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getTitle lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			    
			    return getTitle(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, value as CFStringRef)
			    
			    setTitle self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getUserInfo lib CocoaLib selector "userInfo" (obj_id as Ptr) as Ptr
			    
			    return New NSDictionary(getUserInfo(self))
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setUserInfo lib CocoaLib selector "setUserInfo:" (obj_id as Ptr, value as Ptr)
			    
			    setUserInfo self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		UserInfo As NSDictionary
	#tag EndComputedProperty


	#tag Enum, Name = NSUserNotificationActivationType, Type = Integer, Flags = &h0
		None = 0
		  ContentsClicked = 1
		ActionButtonClicked = 2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActionButtonTitle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActivationType"
			Group="Behavior"
			Type="NSUserNotificationActivationType"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - ContentsClicked"
				"2 - ActionButtonClicked"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasActionButton"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InformativeText"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsPresented"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRemote"
			Group="Behavior"
			Type="Boolean"
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
			Name="otherButtonTitle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Subtitle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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

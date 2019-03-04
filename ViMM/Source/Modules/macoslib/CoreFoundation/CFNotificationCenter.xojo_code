#tag Class
Class CFNotificationCenter
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddObserver()
		  'void CFNotificationCenterAddObserver (
		  'CFNotificationCenterRef center,
		  'const void *observer,
		  'CFNotificationCallback callBack,
		  'CFStringRef name,
		  'const void *object,
		  'CFNotificationSuspensionBehavior suspensionBehavior
		  ');
		  
		  
		  'enum CFNotificationSuspensionBehavior {
		  'CFNotificationSuspensionBehaviorDrop = 1,
		  'CFNotificationSuspensionBehaviorCoalesce = 2,
		  'CFNotificationSuspensionBehaviorHold = 3,
		  'CFNotificationSuspensionBehaviorDeliverImmediately = 4
		  '};
		  'typedef enum CFNotificationSuspensionBehavior CFNotificationSuspensionBehavior;
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    
		    declare function TypeID lib CarbonLib alias "CFNotificationCenterGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LocalCenter() As CFNotificationCenter
		  #if targetMacOS
		    soft declare function CFNotificationCenterGetLocalCenter lib CarbonLib () as Ptr
		    try
		      dim theCenter as new CFNotificationCenter(CFNotificationCenterGetLocalCenter, false)
		      return theCenter
		    catch FunctionNotFoundException
		      // function requires 10.4 or later
		      return nil
		    end try
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

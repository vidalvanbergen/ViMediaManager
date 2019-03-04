#tag Class
Class QTCaptureDeviceInput
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(device as QTCaptureDevice)
		  #if targetMacOS
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function initWithDevice lib CocoaLib selector "initWithDevice:" (obj_id as Ptr, device as Ptr) as Ptr
		    
		    dim p as Ptr = initWithDevice(alloc(Cocoa.NSClassFromString("QTCaptureDeviceInput")), device)
		    if p <> nil then
		      super.Constructor(p, NSObject.hasOwnership)
		    end if
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

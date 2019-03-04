#tag Class
Class QTCaptureSession
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddInput(qtInput as QTCaptureDeviceInput)
		  #if targetMacOS
		    declare function addInput lib QTKit.framework selector "addInput:error:" (obj_id as Ptr, input_ as Ptr, ByRef errorPtr as Ptr) as Boolean
		    
		    dim errorPtr as Ptr
		    if addInput(self, qtInput, errorPtr) then
		      //
		    else
		      raise new NSException(errorPtr)
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = init(alloc(Cocoa.NSClassFromString("QTCaptureSession")))
		    if p <> nil then
		      super.Constructor(p, NSObject.hasOwnership)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartRunning()
		  #if targetMacOS
		    declare sub startRunning lib QTKit.framework selector "startRunning" (obj_id as Ptr)
		    
		    startRunning(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopRunning()
		  #if targetMacOS
		    declare sub stopRunning lib QTKit.framework selector "stopRunning" (obj_id as Ptr)
		    
		    stopRunning(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isRunning lib QTKit.framework selector "isRunning" (obj_id as Ptr) as Boolean
			    
			    return isRunning(self)
			  #endif
			End Get
		#tag EndGetter
		IsRunning As Boolean
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
			Name="IsRunning"
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

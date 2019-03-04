#tag Class
Class QTCaptureDevice
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Close()
		  #if targetMacOS
		    declare sub close lib QTKit.framework selector "close" (obj_id as Ptr)
		    
		    if self.IsOpen then
		      close(self)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  self.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasMediaType(mediaType as String) As Boolean
		  #if targetMacOS
		    declare function hasMediaType lib QTKit.framework selector "hasMediaType:" (obj_id as Ptr, mediaType as CFStringRef) as Boolean
		    
		    return hasMediaType(self, mediaType)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function InputDevices() As QTCaptureDevice()
		  #if targetMacOS
		    declare function inputDevices lib QTKit.framework selector "inputDevices" (class_id as Ptr) as Ptr
		    
		    dim theArray as new CFArray(inputDevices(Cocoa.NSClassFromString("QTCaptureDevice")), not CFArray.hasOwnership)
		    dim deviceList() as QTCaptureDevice
		    for i as Integer = 0 to theArray.Count - 1
		      deviceList.Append new QTCaptureDevice(theArray.Value(i))
		    next
		    
		    return deviceList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Open()
		  #if targetMacOS
		    declare function open lib QTKit.framework selector "open:" (obj_id as Ptr, ByRef errorPtr as Ptr) as Boolean
		    
		    dim errorPtr as Ptr
		    if open(self, errorPtr) then
		      //
		    else
		      raise new NSException(errorPtr)
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function localizedDisplayName lib QTKit.framework selector "localizedDisplayName" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(localizedDisplayName(self))
			  #endif
			End Get
		#tag EndGetter
		DisplayName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isConnected lib QTKit.framework selector "isConnected" (obj_id as Ptr) as Boolean
			    
			    return isConnected(self)
			  #endif
			End Get
		#tag EndGetter
		IsConnected As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isInUseByAnotherApplication lib QTKit.framework selector "isInUseByAnotherApplication" (obj_id as Ptr) as Boolean
			    
			    return isInUseByAnotherApplication(self)
			  #endif
			End Get
		#tag EndGetter
		IsInUseByAnotherApplication As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isOpen lib QTKit.framework selector "isOpen" (obj_id as Ptr) as Boolean
			    
			    return isOpen(self)
			  #endif
			End Get
		#tag EndGetter
		IsOpen As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function uniqueID lib QTKit.framework selector "uniqueID" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(uniqueID(self))
			  #endif
			End Get
		#tag EndGetter
		UniqueID As String
	#tag EndComputedProperty


	#tag Constant, Name = QTMediaTypeVideo, Type = String, Dynamic = False, Default = \"QTMediaTypeVideo", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
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
			Name="IsConnected"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsInUseByAnotherApplication"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsOpen"
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
		#tag ViewProperty
			Name="UniqueID"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

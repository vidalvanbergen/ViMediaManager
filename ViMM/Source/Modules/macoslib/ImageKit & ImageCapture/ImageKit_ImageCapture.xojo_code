#tag Module
Protected Module ImageKit_ImageCapture
	#tag Method, Flags = &h1
		Protected Function ICCameraItemFromPtr(fromPtr as Ptr) As ICCameraItem
		  #if TargetMacOS
		    if Cocoa.InheritsFromClass( fromPtr, "ICCameraFile" ) then
		      return   new ICCameraFile( fromPtr, false )
		    elseif Cocoa.InheritsFromClass( fromPtr, "ICCameraFolder" ) then
		      return  new ICCameraFolder( fromPtr, false )
		    elseif Cocoa.InheritsFromClass( fromPtr, "ICCameraItem" ) then
		      return  new ICCameraItem( fromPtr, false )
		    else
		      raise   new TypeMismatchException
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ICDeviceFromPtr(fromPtr as Ptr) As ICDevice
		  #if TargetMacOS
		    if Cocoa.InheritsFromClass( fromPtr, "ICScannerDevice" ) then
		      return   new ICScannerDevice( fromPtr, false )
		    elseif Cocoa.InheritsFromClass( fromPtr, "ICCameraDevice" ) then
		      return  new ICCameraDevice( fromPtr, false )
		    elseif Cocoa.InheritsFromClass( fromPtr, "ICDevice" ) then
		      return  new ICDevice( fromPtr, false )
		    else
		      raise   new TypeMismatchException
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = ICLib, Type = String, Dynamic = False, Default = \"ImageCaptureCore.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKLib, Type = String, Dynamic = False, Default = \"Quartz.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kImageCaptureVersion, Type = Double, Dynamic = False, Default = \"100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kImageKitVersion, Type = Double, Dynamic = False, Default = \"100", Scope = Protected
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
End Module
#tag EndModule

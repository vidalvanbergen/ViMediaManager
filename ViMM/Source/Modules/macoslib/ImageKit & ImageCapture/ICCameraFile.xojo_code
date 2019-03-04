#tag Class
Protected Class ICCameraFile
Inherits ICCameraItem
	#tag Method, Flags = &h0
		Function Duration() As double
		  #if TargetMacOS
		    declare function duration lib ICLib selector "duration" (id as Ptr) as double
		    
		    return  duration( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileSize() As integer
		  #if TargetMacOS
		    declare function fileSize lib ICLib selector "fileSize" (id as Ptr) as integer
		    
		    return   fileSize( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Orientation() As integer
		  #if TargetMacOS
		    declare function orientation lib ICLib selector "orientation" (id as Ptr) as integer
		    
		    return  orientation( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SidecarFiles() As NSArray
		  #if TargetMacOS
		    declare function sidecarFiles lib ICLib selector "sidecarFiles" (id as Ptr) as Ptr
		    
		    dim p as Ptr = sidecarFiles( me.id )
		    if p<>nil then
		      return  new NSArray( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = ICEXIFOrientationFlippedHorizontally, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ICEXIFOrientationFlippedVertically, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ICEXIFOrientationNormal, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ICEXIFOrientationRotated180, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ICEXIFOrientationRotated90CCW, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ICEXIFOrientationRotated90CCW_FlippedVertically, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ICEXIFOrientationRotated90CW, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ICEXIFOrientationRotated90CW_FlippedVertically, Type = Double, Dynamic = False, Default = \"7", Scope = Public
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

#tag Module
Protected Module QTKit
	#tag Method, Flags = &h1
		Protected Function Load() As Boolean
		  dim b as NSBundle = NSBundle.LoadFromPath("/System/Library/Frameworks/QTKit.framework")
		  if b <> nil then
		    return b.Load
		  end if
		End Function
	#tag EndMethod


	#tag Constant, Name = BundleID, Type = String, Dynamic = False, Default = \"com.apple.QTKit", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Framework, Type = String, Dynamic = False, Default = \"QTKit.framework", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kQTTimeIsIndefinite, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = QTTime, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		timeValue as Int64
		  timeScale as Int32
		flags as Int32
	#tag EndStructure

	#tag Structure, Name = QTTimeRange, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		time as QTTime
		duration as QTTime
	#tag EndStructure


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

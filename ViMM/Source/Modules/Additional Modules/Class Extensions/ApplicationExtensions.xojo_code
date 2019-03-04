#tag Module
Protected Module ApplicationExtensions
	#tag Method, Flags = &h0
		Function ApplicationBundle(extends appl as Application) As FolderItem
		  //# Returns the application bundle as FolderItem
		  
		  #pragma unused appl
		  
		  #if TargetMacOS
		    dim cfb as CFBundle = CFBundle.Application
		    
		    return   cfb.FolderItemValue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HideOthers(extends appl as Application)
		  //# Hide all other applications
		  
		  #pragma unused appl
		  
		  #if TargetMacOS
		    NSWorkspace.HideOtherApplications
		  #endif
		End Sub
	#tag EndMethod


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

#tag Interface
Protected Interface DebugReportFormatter
	#tag Method, Flags = &h0
		Function DebugReportRepresentation(formatSpec as string = "") As variant
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Documentation
		The DebugReportFormatter interface implements a single method "DebugReportStringRepresentation( formatSpec as string = "" ) as string"
		
		This allows you to add a specific object textual representation for debugging purpose. The parameter "formatSpec" is not used yet.
	#tag EndNote


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
End Interface
#tag EndInterface

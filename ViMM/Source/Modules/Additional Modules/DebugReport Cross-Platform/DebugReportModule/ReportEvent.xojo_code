#tag Class
Protected Class ReportEvent
	#tag Method, Flags = &h0
		Sub Constructor(type as integer, sr1 as StyleRun, sr2 as StyleRun)
		  
		  me.Type = type
		  me.sr1 = sr1
		  me.sr2 = sr2
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		sr1 As StyleRun
	#tag EndProperty

	#tag Property, Flags = &h0
		sr2 As StyleRun
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As Integer
	#tag EndProperty


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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

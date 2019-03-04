#tag Class
Protected Class ResourceChainSaver
	#tag Method, Flags = &h0
		Sub Constructor()
		  mPrevResFile = CurResFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CurResFile() As Integer
		  #if TargetMacOS
		    
		    declare function CurResFile lib CarbonLib () as Integer
		    
		    return CurResFile()
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  #if TargetMacOS
		    
		    declare sub UseResFile lib CarbonLib (refNum as Integer)
		    
		    UseResFile mPrevResFile
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mPrevResFile As Integer
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
	#tag EndViewBehavior
End Class
#tag EndClass

#tag Class
Protected Class ResourceAccessor
Inherits ResourceForkReplacement.ResourceChainSaver
	#tag Method, Flags = &h0
		Sub Constructor(resFileRef as Integer)
		  #if TargetMacOS
		    
		    declare sub UseResFile lib CarbonLib (refNum as Integer)
		    
		    super.Constructor // saves the current res file
		    
		    if resFileRef = 0 then
		      return
		    end
		    
		    UseResFile resFileRef
		    
		  #else
		    
		    #pragma unused resFileRef
		    
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
End Class
#tag EndClass

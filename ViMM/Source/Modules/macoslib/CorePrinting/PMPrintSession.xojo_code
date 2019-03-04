#tag Class
Class PMPrintSession
Inherits PMObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // This particular class is self-initilizing through PMCreateSession
		  
		  declare function PMCreateSession lib framework ( ByRef printSession As PMTypeRef ) As Integer
		  
		  dim ref as PMTypeRef
		  dim errNum as integer = PMCreateSession( ref )
		  if errNum <> 0 or ref.value = nil then
		    dim err as new OSError
		    err.ErrorNumber = errNum
		    err.Message = "Could not create print session."
		    raise err
		  else
		    self.Constructor( ref, hasOwnership )
		  end if
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function PMSessionGetCurrentPrinter lib framework _
			    ( printSession As PMTypeRef, ByRef currentPrinter As PMTypeRef ) As Integer
			    
			    dim printerRef as PMTypeRef
			    dim errNum as integer = PMSessionGetCurrentPrinter( self, printerRef )
			    if errNum <> 0 or printerRef.value = nil then
			      return nil
			    else
			      return new PMPrinter( printerRef, not hasOwnership )
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare function SetCurrentPrinter lib framework alias "PMSessionSetCurrentPMPrinter" ( session As PMTypeRef, printer As PMTypeRef ) As Integer
			    
			    dim errNum as integer
			    if value = nil then
			      dim noPrinter as PMTypeRef
			      errNum = SetCurrentPrinter( self, noPrinter )
			    else
			      errNum = SetCurrentPrinter( self, value )
			    end if
			    
			    if errNum <> 0 then
			      dim err as new OSError
			      err.ErrorNumber = errNum
			      err.Message = "Could not set current printer."
			      raise err
			    end if
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			End Set
		#tag EndSetter
		CurrentPrinter As PMPrinter
	#tag EndComputedProperty


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

#tag Class
Class ODSession
Inherits NSObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultSession() As ODSession
		  
		  #if TargetMacOS
		    declare function defaultSession lib "OpenDirectory" selector "defaultSession" (Cls as Ptr) as Ptr
		    
		    RequireFramework  "OpenDirectory"
		    
		    return   new ODSession( defaultSession( Cocoa.NSClassFromString( "ODSession" )), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NodeNames() As string()
		  
		  #if TargetMacOS
		    declare function nodeNamesAndReturnError lib "OpenDirectory" selector "nodeNamesAndReturnError:" (id as Ptr, byref err as Ptr) as Ptr
		    
		    dim perr as Ptr
		    dim nserr as NSException
		    dim nsa as NSArray
		    dim results() as string
		    
		    dim p as Ptr = nodeNamesAndReturnError( me.id, perr )
		    
		    if perr<>nil then
		      nsErr = new NSException( perr )
		      raise  nsErr
		    end if
		    if p<>nil then
		      nsa = new NSArray(p)
		      results = nsa.StringValues
		    end if
		    
		    return  results
		  #endif
		End Function
	#tag EndMethod


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

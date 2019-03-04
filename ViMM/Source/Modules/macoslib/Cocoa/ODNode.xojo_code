#tag Class
Class ODNode
Inherits NSObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromSessionAndName(session as ODSession, nodeName as String) As ODNode
		  
		  #if TargetMacOS
		    declare function nodeWithSession lib "OpenDirectory" selector "nodeWithSession:name:error:" (Cls as Ptr, session as Ptr, name as CFStringRef, byref err as Ptr) as Ptr
		    
		    dim perr as Ptr
		    dim nserr as NSException
		    dim p as Ptr
		    
		    p = nodeWithSession( Cocoa.NSClassFromString( "ODNode" ), session.id, nodeName, perr )
		    
		    if perr<>nil then //Error occurred
		      nserr = new NSException( perr )
		      raise  nserr
		      
		    else
		      return  new ODNode( p, false )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromSessionAndType(session as ODSession, kODNodeType_constant as integer) As ODNode
		  
		  #if TargetMacOS
		    declare function nodeWithSession lib "OpenDirectory" selector "nodeWithSession:type:error:" (Cls as Ptr, session as Ptr, type as integer, byref err as Ptr) as Ptr
		    
		    dim perr as Ptr
		    dim nserr as NSException
		    dim p as Ptr
		    
		    p = nodeWithSession( Cocoa.NSClassFromString( "ODNode" ), session.id, kODNodeType_constant, perr )
		    
		    if perr<>nil then //Error occurred
		      nserr = new NSException( perr )
		      raise  nserr
		      
		    else
		      return  new ODNode( p, false )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubnodeNames() As string()
		  
		  #if TargetMacOS
		    declare function subnodeNamesAndReturnError lib "OpenDirectory" selector "subnodeNamesAndReturnError:" (id as Ptr, byref err as Ptr) as Ptr
		    
		    dim perr as Ptr
		    dim p as Ptr = subnodeNamesAndReturnError(self, perr)
		    
		    if perr<>nil then
		      raise new NSException(perr)
		    end if
		    
		    dim results() as string
		    if p<>nil then
		      dim nsa as new NSArray(p)
		      results = nsa.StringValues
		    end if
		    return  results
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = kODNodeTypeAuthentication, Type = Double, Dynamic = False, Default = \"&h2201", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kODNodeTypeConfigure, Type = Double, Dynamic = False, Default = \"&h2202", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kODNodeTypeContacts, Type = Double, Dynamic = False, Default = \"&h2204", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kODNodeTypeLocalNodes, Type = Double, Dynamic = False, Default = \"&h2200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kODNodeTypeNetwork, Type = Double, Dynamic = False, Default = \"&h2205", Scope = Public
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

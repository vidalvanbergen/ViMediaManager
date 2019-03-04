#tag Class
Protected Class HTTPSSocket
Inherits HTTPSecureSocket
	#tag Event
		Function AuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  if RaiseEvent AuthenticationRequired( Realm, Headers, Name, Password ) then
		    return true
		  end if
		  
		  if Username <> "" then
		    Name = Username
		    Password = self.Password
		    return true
		  else
		    return false
		  end if
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Get(url As String)
		  SetSecure( url )
		  super.Get( url )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get(url As String, file As FolderItem)
		  SetSecure( url )
		  super.Get( url, file )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(url As String, file As FolderItem, timeout As Integer) As Boolean
		  SetSecure( url )
		  return super.Get( url, file, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(url As String, timeout As Integer) As String
		  SetSecure( url )
		  return super.Get( url, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetHeaders(url As String)
		  SetSecure( url )
		  super.GetHeaders( url )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeaders(url As String, timeout As Integer) As InternetHeaders
		  SetSecure( url )
		  return super.GetHeaders( url, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRedirectAddress(url As String, timeout As Integer, maximumIterations As Integer = kDefaultMaximumIterations) As String
		  // Gets the redirect address for a url
		  // Will give up after maximumIterations interations.
		  // Put a 0 (or less) in there for infinite
		  
		  if url = "" then
		    return url
		  end if
		  
		  dim isFinite as boolean = true
		  if maximumIterations < 1 then
		    isFinite = false
		  end if
		  
		  do
		    dim headers as InternetHeaders = GetHeaders( url, timeout )
		    if headers is nil then
		      exit
		    elseif headers.Value( "Location" ) <> "" then
		      url = headers.Value( "Location" )
		    else
		      exit
		    end if
		    if isFinite then
		      maximumIterations = maximumIterations - 1
		    end if
		  loop until isFinite and maximumIterations = 0 // Will never end if maxiumIterations < 0 to start
		  
		  return url.Trim
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendRequest(method As String, url As String)
		  SetSecure( url )
		  super.SendRequest( method, url )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendRequest(method As String, url As String, file As FolderItem)
		  SetSecure( url )
		  super.SendRequest( method, url, file )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(method As String, url As String, file As FolderItem, timeout As Integer) As Boolean
		  SetSecure( url )
		  return super.SendRequest( method, url, file, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(method As String, url As String, timeout As Integer) As String
		  SetSecure( url )
		  return super.SendRequest( method, url, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetSecure(ByRef url As String)
		  if ForceSecure or url.Trim.Left( 8 ) = "https://" then
		    self.Secure = true
		    self.Port = 443
		  else
		    self.Secure = false
		    self.Port = 80
		  end if
		  
		  SetRequestHeader "Cache-Control", "private, no-cache, max-age=0"
		  SetRequestHeader "Pragma", "no-cache"
		  
		  //
		  // See if the username and password has been specified
		  //
		  dim rx as new RegEx
		  rx.SearchPattern = "^(https?://)([^:/\x20@]+):([^:/\x20@]*)@(.*)"
		  
		  dim match as RegExMatch = rx.Search( url )
		  if match is nil then
		    Username = ""
		    Password = ""
		  else
		    Username = DecodeURLComponent( match.SubExpressionString( 2 ) )
		    Password = DecodeURLComponent( match.SubExpressionString( 3 ) )
		    url = match.SubExpressionString( 1 ) + match.SubExpressionString( 4 )
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
	#tag EndHook


	#tag Property, Flags = &h0
		ForceSecure As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Password As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Username As String
	#tag EndProperty


	#tag Constant, Name = kDefaultMaximumIterations, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CertificateFile"
			Visible=true
			Group="Behavior"
			Type="FolderItem"
			EditorType="File"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificatePassword"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificateRejectionFile"
			Visible=true
			Group="Behavior"
			Type="FolderItem"
			EditorType="File"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConnectionType"
			Visible=true
			Group="Behavior"
			InitialValue="3"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"1 - SSLv23"
				"3 - TLSv1"
				"4 - TLSv11"
				"5 - TLSv12"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ForceSecure"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Secure"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

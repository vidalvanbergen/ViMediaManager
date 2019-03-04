#tag Class
Protected Class HTTPSocketAsync
Inherits Xojo.Net.HTTPSocket
	#tag Event
		Function AuthenticationRequired(Realm as Text, ByRef Name as Text, ByRef Password as Text) As Boolean
		  if RaiseEvent AuthenticationRequired( Realm, Name, Password ) then
		    return true
		  end if
		  
		  if Username <> "" then
		    Name = Username.ToText
		    Password = self.Password.ToText
		    return true
		  else
		    return false
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub FileReceived(URL as Text, HTTPStatus as Integer, File as xojo.IO.FolderItem)
		  dim f as new FolderItem( file.Path, FolderItem.PathTypeNative )
		  RaiseEvent FileReceived( url, httpStatus, f )
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  dim mb as MemoryBlock = content.Data
		  dim contentString as string = mb.StringValue( 0, content.Size )
		  
		  if Encodings.UTF8.IsValidData( contentString ) then
		    contentString = contentString.DefineEncoding( Encodings.UTF8 )
		  end if
		  
		  RaiseEvent PageReceived( url, httpStatus, contentString )
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Get(url As String)
		  Disconnect
		  
		  SetSecure url
		  super.Send "GET", url.ToText
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get(url As String, file As FolderItem)
		  Disconnect
		  
		  SetSecure url
		  
		  dim path as string = file.NativePath.DefineEncoding( Encodings.UTF8 )
		  dim f as new Xojo.IO.FolderItem( path.ToText )
		  super.Send "GET", url.ToText, f
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Send(method as Text, url as Text)
		  super.Send method, url
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Send(Method as Text, URL as Text, File as xojo.IO.FolderItem)
		  super.Send Method, URL, File
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetSecure(ByRef url As String)
		  ValidateCertificates = true
		  Username = ""
		  Password = ""
		  ClearRequestHeaders
		  
		  RequestHeader( "Cache-Control" ) = "private, no-cache, max-age=0"
		  RequestHeader( "Pragma" ) = "no-cache"
		  
		  url = url.ConvertEncoding( Encodings.UTF8 )
		  
		  #if not TargetMacOS then
		    
		    //
		    // See if the username and password has been specified
		    //
		    dim rx as new RegEx
		    rx.SearchPattern = "^(https?://)([^:/\x20@]+):([^:/\x20@]*)@(.*)"
		    
		    dim match as RegExMatch = rx.Search( url )
		    if match isa RegExMatch then
		      Username = DecodeURLComponent( match.SubExpressionString( 2 ) ).DefineEncoding( Encodings.UTF8 )
		      Password = DecodeURLComponent( match.SubExpressionString( 3 ) ).DefineEncoding( Encodings.UTF8 )
		      url = match.SubExpressionString( 1 ) + match.SubExpressionString( 4 )
		      url = url.DefineEncoding( Encodings.UTF8 )
		      
		      //
		      // Set the request header manually
		      //
		      dim encoded as string = EncodeBase64( Username + ":" + Password ).DefineEncoding( Encodings.UTF8 )
		      RequestHeader( "Authorization" ) = "Basic " + encoded.ToText
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AuthenticationRequired(Realm as Text, ByRef Name as Text, ByRef Password as Text) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FileReceived(url As String, httpStatus As Integer, file As FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PageReceived(url As String, httpStatus As Integer, content As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Password As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Username As String
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
			Name="ValidateCertificates"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

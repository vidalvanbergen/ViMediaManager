#tag Class
Protected Class Error
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(errno as Integer)
		  self.ErrorNumber = errno
		  self.Message = ErrorMessage(errno)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ErrorMessage(errorCode as Integer) As String
		  #if TargetMacOS
		    
		    declare function strerror lib libc (errcode as Integer)  as Ptr
		    
		    dim errorMsg as MemoryBlock = strerror(errorCode)
		    if errorMsg <> nil then
		      return DefineEncoding(errorMsg.CString(0), Encodings.SystemDefault)
		    else
		      //something bad has happened
		      return ""
		    end if
		    
		  #else
		    
		    #pragma unused errorCode
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Reason"
			Group="Behavior"
			Type="Text"
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

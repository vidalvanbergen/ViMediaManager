#tag Class
Protected Class libcError
Inherits OSError
	#tag Method, Flags = &h1000
		Sub Constructor(errorCode as Integer)
		  self.ErrorNumber = errorCode
		  self.Message = ErrorMessage(errorCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ErrorMessage(code as Integer) As String
		  #if targetLinux
		    soft declare function strerror Lib libc.libc (errcode as Integer)  as Ptr
		    
		    dim errorMsg as MemoryBlock = strerror(code)
		    if errorMsg <> nil then
		      return DefineEncoding(errorMsg.CString(0), Encodings.SystemDefault)
		    else
		      //something bad has happened
		      return ""
		    end if
		    
		  #else
		    #pragma unused code
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetErrorCode() As Integer
		  #if TargetLinux
		    soft declare function libcErrorCode lib libc.libc alias "__errno_location" () as Ptr
		    
		    dim m as MemoryBlock = libcErrorCode()
		    if m is nil then
		      //something bad has happened
		      return -1
		    end if
		    return m.Long(0)
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

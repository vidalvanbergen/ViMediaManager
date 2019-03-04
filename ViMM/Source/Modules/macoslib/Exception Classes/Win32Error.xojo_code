#tag Class
Protected Class Win32Error
Inherits OSError
	#tag Method, Flags = &h1000
		Sub Constructor(errorCode as Integer)
		  self.ErrorNumber = errorCode
		  self.Message = FormatErrorMessage(errorCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FormatErrorMessage(errorcode as Integer) As String
		  #if targetWin32
		    
		    const FORMAT_MESSAGE_FROM_SYSTEM = &h1000
		    
		    static functionsNeedCheck as boolean = true
		    static newFunctionIsAvailable as boolean
		    static oldFunctionIsAvailable as boolean
		    if functionsNeedCheck then
		      newFunctionIsAvailable = System.IsFunctionAvailable( "FormatMessageW", Win32.Kernel32 )
		      oldFunctionIsAvailable = System.IsFunctionAvailable( "FormatMessageA", Win32.Kernel32 )
		      functionsNeedCheck = false
		    end if
		    
		    if newFunctionIsAvailable then
		      soft declare function FormatMessageW lib win32.Kernel32 (dwFlags As integer, lpSource As integer, dwMessageId As integer, dwLanguageId As integer, lpBuffer As ptr, nSize As integer, Arguments As integer) As integer
		      
		      dim buffer as new MemoryBlock(2048)
		      dim result as Integer = FormatMessageW( FORMAT_MESSAGE_FROM_SYSTEM, 0, errorcode, 0 , buffer, buffer.Size, 0 )
		      if result <> 0 then
		        return buffer.WString(0)
		      else
		        return ""
		      end if
		    elseif oldFunctionIsAvailable then
		      soft declare function FormatMessageA lib win32.Kernel32 (dwFlags As integer, lpSource As integer, dwMessageId As integer, dwLanguageId As integer, lpBuffer As ptr, nSize As integer, Arguments As integer) As integer
		      
		      dim buffer as new MemoryBlock(1024)
		      dim result as Integer = FormatMessageA( FORMAT_MESSAGE_FROM_SYSTEM, 0, errorcode, 0 , buffer, buffer.Size, 0 )
		      if result <> 0 then
		        return buffer.CString(0)
		      else
		        return ""
		      end if
		    end if
		    
		  #else
		    #pragma unused errorcode
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetError() As Integer
		  #if targetWin32
		    soft declare function GetLastError lib win32.Kernel32 () as Integer
		    
		    return GetLastError()
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = ERROR_FILE_NOT_FOUND, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ERROR_INSUFFICIENT_BUFFER, Type = Double, Dynamic = False, Default = \"122", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ERROR_INVALID_PARAMETER, Type = Double, Dynamic = False, Default = \"87", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ERROR_NO_MORE_FILES, Type = Double, Dynamic = False, Default = \"18", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ERROR_NO_UNICODE_TRANSLATION, Type = Double, Dynamic = False, Default = \"1113", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ERROR_SUCCESS, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RPC_S_INVALID_STRING_UUID, Type = Double, Dynamic = False, Default = \"1705", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RPC_S_OK, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


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

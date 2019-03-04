#tag Module
Protected Module Helpers
	#tag Method, Flags = &h1
		Protected Function CleanMangledFunction(item as string) As string
		  'This method was written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  #If rbVersion >= 2005.5
		    
		    Static blacklist() As String
		    If UBound(blacklist) <= -1 Then
		      blacklist = Array(_
		      "REALbasic._RuntimeRegisterAppObject%%o<Application>", _    
		      "Xojo._RuntimeRegisterAppObject%%o<Application>", _
		      "_NewAppInstance", _'
		      "_Main", _
		      "% main", _
		      "REALbasic._RuntimeRun", _
		      "Xojo._RuntimeRun" _
		      )
		    End If
		    
		    If blacklist.indexOf( item ) >= 0 Then _
		    Exit Function
		    
		    Dim parts() As String = item.Split( "%" )
		    If ubound( parts ) < 2 Then _
		    Exit Function
		    
		    Dim func As String = parts( 0 )
		    Dim returnType As String
		    If  parts( 1 ) <> "" and UBound( ParseParams( parts( 1 ) ) ) > -1 Then
		      returnType = parseParams( parts( 1 ) ).pop
		    else
		      
		    End If
		    Dim args() As String = parseParams( parts( 2 ) )
		    
		    If func.InStr( "$" ) > 0 Then
		      args( 0 ) = "Extends " + args( 0 )
		      func = func.ReplaceAll( "$", "" )
		      
		    Elseif ubound( args ) >= 0 And func.NthField( ".", 1 ) = args( 0 ) Then
		      args.remove( 0 )
		      
		    End If
		    
		    If func.InStr( "=" ) > 0 Then
		      Dim index As Integer = ubound( args )
		      
		      args( index ) = "Assigns " + args( index )
		      func = func.ReplaceAll( "=", "" )
		    End If
		    
		    If func.InStr( "*" ) > 0 Then
		      Dim index As Integer = ubound( args )
		      
		      args( index ) = "ParamArray " + args( index )
		      func = func.ReplaceAll( "*", "" )
		    End If
		    
		    Dim sig As String
		    If func.InStr( "#" ) > 0 Then
		      if returnType = "" Then
		        sig = "Event Sub"
		      Else
		        sig = "Event Function"
		      end if
		      func = func.ReplaceAll( "#", "" )
		      
		    ElseIf func.InStr( "!" ) > 0 Then
		      if returnType = "" Then
		        sig = "Shared Sub"
		      Else
		        sig = "Shared Function"
		      end if
		      func = func.ReplaceAll( "!", "" )
		      
		    Elseif returnType = "" Then
		      sig = "Sub"
		      
		    Else
		      sig = "Function"
		      
		    End If
		    
		    If ubound( args ) >= 0 Then
		      sig = sig + " " + func + "(" + Join( args, ", " ) + ")"
		      
		    Else
		      sig = sig + " " + func + "()"
		      
		    End If
		    
		    
		    If returnType <> "" Then
		      sig = sig + " As " + returnType
		    End If
		    
		    Return sig
		    
		  #Else
		    Return ""
		    
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CleanStack(error as RuntimeException) As string()
		  'This method was written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  Dim result() As String
		  
		  #If rbVersion >= 2005.5
		    if error <> Nil then
		      For Each s As String In error.stack
		        Dim tmp As String = cleanMangledFunction( s )
		        
		        If tmp <> "" Then _
		        result.append( tmp )
		      Next
		    end if
		    
		  #Else
		    // leave result empty
		    
		  #EndIf
		  
		  // we must return some sort of array (even if empty), otherwise REALbasic will return a "nil" array, causing a crash when trying to use the array.
		  // see http://realsoftware.com/feedback/viewreport.php?reportid=urvbevct
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(Message as String, Type as Integer = 0)
		  Dim d as New NativeSubclass.DateExtended
		  dim PreFix as String
		  
		  select case Type
		  case 0 // Debug
		    PreFix = "<debug>   [" + d.ISO8601 + "] "
		  case 1 // Notice
		    PreFix = "<notice>   [" + d.ISO8601 + "] "
		  case 2 // Error
		    PreFix = "<error>   [" + d.ISO8601 + "] "
		  case 3 // Runtime
		    PreFix = "<runtime>   [" + d.ISO8601 + "] "
		  else
		    PreFix = "<unknown>   [" + d.ISO8601 + "] "
		  end select
		  
		  
		  if App.DebugMode then
		    // DReport
		    Select case Type
		    case 0 // Debug
		      DReportDebug PreFix + Message
		    case 1 // Notice
		      DReportNotification PreFix + Message
		    case 2 // Error
		      DReportError PreFix + Message
		    case 3 // Runtime
		      DReportError PreFix + Message
		    else
		      DReport PreFix + Message
		    end Select
		    
		  else
		    System.DebugLog PreFix + Message
		  end if
		  
		  
		  // Store last 50 messages for debug purposes.
		  if LogMessages.Ubound > 50 then
		    LogMessages.Remove( 0 )
		  end if
		  LogMessages.Append PreFix + Message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(Message as String, err as RuntimeException, Type as Integer = 0)
		  Log "(" + Str( err.ErrorNumber ) + ") " + err.Message + " ::: " + Message, Type
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OSVersion() As String
		  Dim noerror As Boolean
		  Dim result, OS_CODE As Integer
		  Dim sver As String
		  Dim sversion As String
		  Dim os As String
		  #If TargetMacOS
		    
		    'noerror=System.Gestalt("sysv",result)
		    ''result = SystemVersionAsInt
		    'If noerror Then
		    'sver=Hex(result)
		    'sversion=sver.Left(2) + "." + sver.Mid(3,1) + "." + sver.Right(1)
		    'OS_CODE=Val(sver.Mid(3,1))
		    
		    if IsSierra then // 10.12
		      os = "Sierra"
		    elseif IsElCapitan then // 10.11
		      os = "El Capitan"
		    elseif IsYosemite then // 10.10
		      os = "Yosemite"
		    elseif IsMavericks then
		      os = "Mavericks"
		    elseif IsMountainLion then
		      os = "Mountain Lion"
		    elseif IsLion then
		      os = "Lion"
		    elseif IsSnowLeopard then
		      os = "Snow Leopard"
		    elseif IsLeopard then
		      os = "Leopard"
		    elseif IsTiger then
		      os = "Tiger"
		    elseif IsPanther then
		      os = "Panther"
		    else
		      os = "Unknown"
		    end if
		    
		    Return "Mac OS X "+os+" "+ SystemVersionAsString 'sversion
		    'Else
		    'Return ""
		    'End If
		  #ElseIf TargetWindows '32
		    
		    OS = "Windows"
		    
		    //try to be more specific of windows version
		    Soft Declare Sub GetVersionExA Lib "Kernel32" ( info As Ptr )
		    Soft Declare Sub GetVersionExW Lib "Kernel32" ( info As Ptr )
		    
		    Dim info As MemoryBlock
		    
		    If System.IsFunctionAvailable( "GetVersionExW", "Kernel32" ) Then
		      info =  New MemoryBlock( 20 + (2 * 128) )
		      info.Long( 0 ) = info.Size
		      GetVersionExW( info )
		    Else
		      info =  New MemoryBlock( 148 )
		      info.Long( 0 ) = info.Size
		      GetVersionExA( info )
		    End If
		    
		    Dim Str As String
		    OS_CODE=info.Long(4)*100+info.long(8)
		    Select Case OS_CODE
		    Case 400
		      os = "Windows 95/NT 4.0"
		    Case 410
		      os = "Windows 98"
		    Case 490
		      os = "Windows Me"
		    Case 300 To 399
		      os = "Windows NT 3.51"
		      OS_CODE=30
		    Case 500
		      os = "Windows 2000"
		    Case 501
		      os = "Windows XP"
		    Case 502
		      os = "Windows Server 2003"
		    Case 600
		      os = "Windows Vista"
		    Case 601
		      os = "Windows 7"
		    Case 602
		      'os = "Windows 8" or "Windows 10"
		      
		      dim s as new shell
		      s.execute("ver")
		      dim res as string = s.Result
		      if val(mid(res,30,2)) = 10 then
		        os = "Windows 10"
		        dim build as double = val(mid(res,33,10))*100000
		        Str = " Build "+format(build,"00000")
		      else
		        os = "Windows 8/8.1"
		      end if
		      
		    else
		      Return Str( OS_CODE )
		    End Select
		    Str = " Build " + Str( info.Long( 12 ) )
		    
		    If System.IsFunctionAvailable( "GetVersionExW", "Kernel32" ) Then
		      Str = Str + " " + Trim( info.WString( 20 ) )
		    Else
		      Str = Str + " " + Trim( info.CString( 20 ) )
		    End If
		    
		    os = os + Str
		    Return os
		  #elseif TargetLinux then
		    dim sh as new Shell
		    sh.Execute "uname"
		    dim name as string = sh.Result
		    sh.Execute "uname -r"
		    dim version as string = sh.Result
		    
		    Return name + " " + version
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseParams(input as string) As string()
		  'This method was written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  
		  Const kParamMode = 0
		  Const kObjectMode = 1
		  Const kIntMode = 2
		  Const kUIntMode = 3
		  Const kFloatingMode = 4
		  Const kArrayMode = 5
		  
		  Dim chars() As String = Input.Split( "" )
		  Dim funcTypes(), buffer As String
		  Dim arrays(), arrayDims(), byrefs(), mode As Integer
		  
		  For Each char As String In chars
		    Select Case mode
		    Case kParamMode
		      Select Case char
		      Case "i"
		        mode = kIntMode
		        
		      Case "u"
		        mode = kUIntMode
		        
		      Case "o"
		        mode = kObjectMode
		        
		      Case "b"
		        funcTypes.append( "Boolean" )
		        
		      Case "s"
		        funcTypes.append( "String" )
		        
		      Case "f"
		        mode = kFloatingMode
		        
		      Case "c"
		        funcTypes.append( "Color" )
		        
		      Case "A"
		        mode = kArrayMode
		        
		      Case "&"
		        byrefs.append( ubound( funcTypes ) + 1 )
		        
		      End Select
		      
		      
		    Case kObjectMode
		      If char = "<" Then _
		      Continue
		      
		      If char = ">" Then
		        funcTypes.append( buffer )
		        buffer = ""
		        mode = kParamMode
		        
		        Continue
		      End If
		      
		      buffer = buffer + char
		      
		      
		    Case kIntMode, kUIntMode
		      Dim intType As String = "Int"
		      
		      If mode = kUIntMode Then _
		      intType = "UInt"
		      
		      funcTypes.append( intType + Str( Val( char ) * 8 ) )
		      mode = kParamMode
		      
		      
		    Case kFloatingMode
		      If char = "4" Then
		        funcTypes.append( "Single" )
		        
		      Elseif char = "8" Then
		        funcTypes.append( "Double" )
		        
		      End If
		      
		      mode = kParamMode
		      
		    Case kArrayMode
		      arrays.append( ubound( funcTypes ) + 1 )
		      arrayDims.append( Val( char ) )
		      mode = kParamMode
		      
		    End Select
		  Next
		  
		  For i As Integer = 0 To ubound( arrays )
		    Dim arr As Integer = arrays( i )
		    Dim s As String = funcTypes( arr ) + "("
		    
		    For i2 As Integer = 2 To arrayDims( i )
		      s = s + ","
		    Next
		    
		    funcTypes( arr ) = s + ")"
		  Next
		  
		  For Each b As Integer In byrefs
		    funcTypes( b ) = "ByRef " + funcTypes( b )
		  Next
		  
		  Return funcTypes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SocketError(Code as Integer) As String
		  
		  dim ErrorString as String = "HTTP Error: " + Str( Code ) + " Occurred." + chr(13) + chr(13)
		  
		  select case Code
		    
		  case 100
		    ErrorString = ErrorString + "Driver error"
		  case 102
		    ErrorString = ErrorString + "Connection Lost"
		  case 103
		    ErrorString = ErrorString + "Unresolved Host"
		  case 105
		    ErrorString = ErrorString + "Port Bind Error"
		  case 106
		    ErrorString = ErrorString + "Invalid Socket State"
		  case 107
		    ErrorString = ErrorString + "Invalid Port"
		  case 108
		    ErrorString = ErrorString + "Out Of Memory"
		  case 400
		    ErrorString = ErrorString + "Bad Request"
		  case 401
		    ErrorString = ErrorString + "Unauthorized"
		  case 404
		    ErrorString = ErrorString + "Page not found"
		  case 414
		    ErrorString = ErrorString + "Request-URI Too Long"
		  case 500
		    ErrorString = ErrorString + "Internal Server Error"
		  case 505
		    ErrorString = ErrorString + "HTTP Version Not Supported"
		  case 509
		    ErrorString = ErrorString + "Bandwidth Limit Exceeded"
		  else
		    ErrorString = ErrorString + "Unknown or Undefined error code"
		    
		  end select
		  
		  log ErrorString
		  
		  Return ErrorString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TypeOfException(Err as RuntimeException) As String
		  // Returns a text string indicating the type of RuntimeException passed in.
		  Dim result as String
		  
		  If err isA IllegalCastException then
		    result = "Illegal Cast Exception"
		  ElseIf err isA KeyNotFoundException then
		    result = "Key Not Found Exception"
		  ElseIf err isA OutOfBoundsException then
		    result = "Out Of Bounds Exception"
		  ElseIf err isA OutOfMemoryException then
		    result = "Out Of Memory Exception"
		    
		    // Script not supported in 64 bit
		    'ElseIf err isA RbScriptAlreadyRunningException then
		    'result = "RB Script Already Running Exception"
		    'ElseIf err isA RbScriptException then
		    'result = "RB Script Exception"
		    
		  ElseIf err isA RegExException then
		    result = "RegEx Exception"
		  ElseIf err isA ShellNotAvailableException then
		    result = "Shell Not Available Exception"
		  ElseIf err isA ShellNotRunningException then
		    result = "Shell Not Running Exception"
		  ElseIf err isA StackOverflowException then
		    result = "Stack Overflow Exception"
		  ElseIf err isA TypeMismatchException then
		    result = "Type Mismatch Exception"
		  ElseIf err isA UnsupportedFormatException then
		    result = "Unsupported Format Exception"
		    'ElseIf err isA NoOpenTransportException then
		    'result = "No Open Transport Exception"
		  ElseIf err isA InvalidParentException then
		    result = "Invalid Parent Exception"
		  ElseIf err isA EndException then
		    result = "End Exception"
		  ElseIf err isA NilObjectException then
		    result = "Nil Object Exception"
		    
		    ' uncomment these lines if you are using the Office Automation plug-ins
		    ' elseif err isA WordException then
		    ' result = "WordException"
		    ' elseif err isA ExcelException then
		    ' result = "ExcelException"
		    ' elseif err isA PowerPointException then
		    ' result = "PowerPointException"
		    
		  End If
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected LogMessages() As String
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
End Module
#tag EndModule

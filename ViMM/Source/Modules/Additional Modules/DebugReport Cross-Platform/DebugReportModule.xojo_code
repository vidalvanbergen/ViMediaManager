#tag Module
Protected Module DebugReportModule
	#tag Method, Flags = &h21
		Private Sub AppendToWindow(level as integer, sr1 as StyleRun, sr2 as StyleRun = nil)
		  #pragma DisableBackgroundTasks
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    'if Keyboard.AsyncKeyDown( 80 ) then
		    'DebugLogWND.ImmediateReportCB.Value = false
		    'DebugLogWND.ImmediateReportCB.Refresh
		    'end if
		    '
		    #if TargetHasGUI
		      if DebugLogWND.AllowReportCB.Value then
		        select case level
		        case kLevelNotice
		          ReportCnt = ReportCnt + 1
		          
		        case kLevelError
		          ErrorCnt = ErrorCnt + 1
		          ErrorPos.Append   LogText.Len
		          
		        case kLevelWarning
		          WarningCnt = WarningCnt + 1
		          WarningPos.Append   LogText.Len
		        end select
		        
		        DebugLogWND.LogTA.StyledText.AppendStyleRun   sr1
		        
		        if sr2<>nil then
		          DebugLogWND.LogTA.StyledText.AppendStyleRun   sr2
		          LogText = LogText + sr2.Text
		        end if
		      end if
		    #else
		      Print   sr1.Text
		      if sr2<>nil then
		        print  sr2.Text
		      end if
		    #endif
		    
		    LogText = LogText + sr1.Text
		    if sr2<>nil then
		      LogText = LogText + sr2.Text
		    end if
		    
		    //Should we log to the system ?
		    #if TargetHasGUI
		      if DebugLogWND.SyslogCB.Value then
		    #endif
		    select case level
		    case kLevelNotice, kLevelTitled //Normal
		      System.Log   System.LogLevelNotice, sr1.Text
		    case kLevelWarning //Warning
		      System.Log   System.LogLevelWarning, IFTE( sr2=nil, sr1.Text, sr1.Text + EndOfLine + sr2.Text )
		    case kLevelError //Error
		      System.Log   System.LogLevelError, IFTE( sr2=nil, sr1.Text, sr1.Text + EndOfLine + sr2.Text )
		    case kLevelDebug //Debug
		      System.DebugLog   IFTE( sr2=nil, sr1.Text, sr1.Text + EndOfLine + sr2.Text )
		    end select
		    #if TargetHasGUI
		      end if
		    #endif
		    
		    'if not Dequeueing then
		    'if DebugLogWND.ImmediateReportCB.Value AND NOT (Keyboard.AsyncKeyDown( 79 )) then
		    'DebugLogWND.LogTA.ScrollPosition = 1e+6
		    'DebugLogWND.LogTA.Refresh
		    'end if
		    'end if
		    'end if
		    
		    exception exc
		      return
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DecomposeFormatString(text as String) As string()
		  //Detect format indicators (either style of format specs)
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    dim data as string
		    dim a, b as integer
		    dim result() as string
		    
		    //Get rid of escaped chars
		    result.Append   text.ReplaceAll( "\" + DebugReportOptions.FormatSpecCharacter, DebugReportOptions.FormatSpecCharacter )
		    
		    data = text.ReplaceAll( "\" + DebugReportOptions.FormatSpecCharacter, &u29FA )
		    
		    while data.Len > 0
		      a = Instr( data, DebugReportOptions.FormatSpecCharacter )
		      if a=0 then
		        result.Append   data
		        data = ""
		        
		      else
		        result.Append   data.Left( a - 1 )
		        if data.Mid( a + 1, 1 )="(" then
		          b = Instr( a + 2, data, ")" )
		          result.Append   data.Mid( a, b - a + 1 )
		          data = data.Mid( b + 1 )
		        else
		          result.Append   data.Mid( a, 2 )
		          data = data.Mid( a + 2 )
		        end if
		        
		      end if
		    wend
		    
		    for i as integer=0 to result.Ubound
		      result( i ) = result( i ).ReplaceAll( &u29FA, DebugReportOptions.FormatSpecCharacter )
		    next
		    
		    return   result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DetectFormatIndicator(text as String) As string
		  //Detect format indicators (either style of format specs)
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    dim s as string
		    dim a as integer
		    
		    //Get rid of escaped chars
		    s = text.ReplaceAll( "\" + DebugReportOptions.FormatSpecCharacter, &u29FA )
		    
		    a = Instr( s, DebugReportOptions.FormatSpecCharacter )
		    
		    if a=0 then
		      return ""
		      
		    else
		      if s.Mid( a + 1, 1 )="(" then
		        return   s.Mid( a ).StringBefore( ")" ) + ")"
		      else
		        return   s.Mid( a, 2 )
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReport(ParamArray values() as variant)
		  //# Make a Debug Report as a notice
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelNotice, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportDebug(ParamArray values() as variant)
		  //# Make a Debug Report as a debug note
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelDebug, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportError(ParamArray values() as variant)
		  //# Make a Debug Report as an error
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelError, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportNotification(ParamArray values() as variant)
		  //# Make a Debug Report as a warning
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelNotification, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportTitled(ParamArray values() as variant)
		  //# Make a Debug Report as a notice, the first item being displayed in boldface
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelTitled, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportWarning(ParamArray values() as variant)
		  //# Make a Debug Report as a warning
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelWarning, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatObjCType(type as String) As string
		  //Format ObjC-Type Encodings into a C-like notation
		  
		  dim affix as string
		  
		  if LenB( type )>1 then //Composite type
		    dim L as string = type.LeftB( 1 )
		    
		    if L="^" then
		      dim s as string
		      
		      if MidB( type, 2, 1 )="^" then //Double pointer. Avoid another recurrence.
		        affix = " **"
		        s = FormatObjCType( type.MidB( 3 ))
		      else
		        affix = " *"
		        s = FormatObjCType( type.MidB( 2 ))
		      end if
		      if s="BOOL" then //We usually consider 'char' to be a 'BOOL', but it is not usually the case with a (char *)
		        return   "char *"
		      else
		        return   s + affix
		      end if
		      
		    elseif L="@" then  //Class name
		      return  type.MidB( 3, type.lenB - 3 )
		      
		    elseif StrComp( L, "{", 0 )=0 then //Structure
		      return   "struct " + type.MidB( 2 ).StringBefore( "=" )
		      
		    elseif StrComp( L, "[", 0 )=0 then //Array
		      return  FormatObjCType( type.MidB( 2 )) + "[ ]"
		      
		    elseif StrComp( L, "(", 0 )=0 then //Union
		      return   "union " + type.MidB( 2 ).StringBefore( "=" )
		      
		    elseif StrComp( L, "V", 0 )=0 then //Oneway
		      return  FormatObjCType( type.MidB( 2 ))
		      
		    elseif StrComp( L, "r", 0 )=0 then //const
		      return  "const " + FormatObjCType( type.MidB( 2 ))
		      
		    elseif StrComp( L, "R", 0 )=0 then //Byref
		      return  "byref " + FormatObjCType( type.MidB( 2 ))
		      
		    elseif StrComp( L, "n", 0 )=0 then //in
		      return  "in " + FormatObjCType( type.MidB( 2 ))
		      
		    elseif StrComp( L, "N", 0 )=0 then //in/out
		      return  "inout " + FormatObjCType( type.MidB( 2 ))
		      
		    elseif StrComp( L, "o", 0 )=0 then //out
		      return  "out " + FormatObjCType( type.MidB( 2 ))
		      
		    elseif StrComp( L, "O", 0 )=0 then //By copy
		      return  "bycopy " + FormatObjCType( type.MidB( 2 ))
		      
		    elseif StrComp( L, "b", 0 )=0 then //Bitfield
		      return  "bitfield " + type.MidB( 2 )
		      
		    end if
		  end if
		  
		  select case type
		  case "v"  //Void
		    return  "void"
		    
		  case "@"
		    return  "id"
		    
		  case "c", "B" //"c" is not strictly a boolean but mostly used as such
		    return  "BOOL"
		    
		  case "i", "s", "c", "l", "q"
		    if StrComp( type, Uppercase( type ), 0 )=0 then //Uppercase value, i.e. unsigned
		      affix = "unsigned "
		    end if
		    
		    select case type
		    case "i"
		      return  affix + "int"
		      
		    case "s"
		      return  affix + "int16"
		      
		    case "c"
		      return  affix + "char"
		      
		    case "l"
		      return  affix + "int32"
		      
		    case "q"
		      return  affix + "int64"
		      
		    end select
		    
		  case "f"
		    return  "float"
		    
		  case "d"
		    return  "double"
		    
		  case "*"
		    return  "char *"
		    
		  case ":"
		    return  "SEL"
		    
		  case "#"
		    return  "Class"
		    
		  case "?"
		    return  "void *"
		    
		  case "" //Shouldn't happen... but still...
		    return   ""
		    
		  else
		    'QReportWarning   "macoslib: Couldn't convert type", type, "in", CurrentMethodName
		    return   type
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatVariant(v as Variant, formatSpec as string = "", quoteString as Boolean = false) As string
		  
		  #pragma DisableBackgroundTasks
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    dim results() as string
		    dim obj as Object
		    dim drfResult as variant
		    
		    if v.IsNull then
		      return  "nil"
		      
		      #if DebugReportOptions.UseMacoslib
		    elseif v isa NSObject then
		      dim nso as NSObject
		      nso = v
		      return   nso.Description
		      
		    elseif v isa CFType then
		      dim cft as CFType
		      cft = v
		      return   cft.Description
		  #endif
		  
		  else
		    if v.IsArray then  //Arrays
		      select case v.ArrayElementType
		      case Variant.TypeString
		        dim ars() as string = v
		        results.Append   "Array of strings: ("
		        for i as integer = 0 to ars.Ubound
		          results.Append  Str( i ) + ": “" + ars( i ) + "”"
		        next
		        results.Append ")"
		        
		      case Variant.TypeInteger
		        dim ari() as integer = v
		        results.Append   "Array of integers: ("
		        for i as integer = 0 to ari.Ubound
		          results.Append  Str( i ) + ": " + Str( ari( i ))
		        next
		        results.Append ")"
		        
		      case Variant.TypeDouble
		        dim ard() as integer = v
		        results.Append   "Array of doubles: ("
		        for i as integer = 0 to ard.Ubound
		          results.Append  Str( i ) + ": " + Str( ard( i ))
		        next
		        results.Append ")"
		        
		      case Variant.TypeBoolean
		        dim arb() as boolean = v
		        results.Append   "Array of booleans: ("
		        for i as integer = 0 to arb.Ubound
		          results.Append  Str( i ) + ": " + IFTE( arb( i ), "true", "false" )
		        next
		        results.Append ")"
		        
		      case 9
		        dim arv() as variant = v
		        if formatSpec<>"-" then
		          results.Append   "Array of variants: ("
		          for i as integer = 0 to arv.Ubound
		            results.Append  Str( i ) + ": " + FormatVariant( arv( i ))
		          next
		          results.Append ")"
		        else
		          for i as integer = 0 to arv.Ubound
		            results.Append  FormatVariant( arv( i ))
		          next
		        end if
		        
		      else
		        
		      end Select
		      
		      return   Join( Results, EndOfLine )
		      
		    else  //Single values
		      if v isa DebugReportFormatter then //Object has a formatter method
		        drfResult = DebugReportFormatter( v ).DebugReportRepresentation
		        
		        if VarType( drfResult ) = Variant.TypeString then
		          return   drfResult.StringValue
		        else
		          return   "<" + v.ObjectValue.ClassName + EndOfLine + FormatVariant( drfResult, "-" ) + " >"
		        end if
		      end if
		      
		      select case VarType( v )
		      case  variant.TypeObject
		        if v isa FolderItem then //FolderItem
		          dim f as FolderItem = v
		          return   "<FolderItem: POSIX path:" + f.POSIXPath + " >"
		          
		        elseif v isa MemoryBlock then //MemoryBlock
		          dim mb as MemoryBlock = v
		          dim maxsize as integer
		          if mb.Size=-1 OR mb.Size > 32767 then
		            maxsize = 32768
		            return   "<MemoryBlock of size " + Str(mb.Size) + " bytes. Only the first 32k displayed:" + EndOfLine + EncodeHex( mb.StringValue( 0, MAX( mb.Size, maxsize )), true ) + ">"
		          else
		            return   "<MemoryBlock of size " + Str(mb.Size) + " bytes. Contents:" + EndOfLine + EncodeHex( mb.StringValue( 0, MAX( mb.Size, maxsize )), true ) + ">"
		          end if
		          
		        elseif v isa Pair then //Pair
		          dim p as Pair = v
		          return  "<Pair: " + FormatVariant( p.Left, formatSpec, true ) + " : " + FormatVariant( p.Right, formatSpec, true ) + ">"
		          
		        elseif v isa EndOfLine then //EndOfLine
		          return   v.StringValue
		          
		        elseif v isa Dictionary then //Dictionary
		          dim dict as Dictionary = v
		          
		          for each key as variant in dict.Keys
		            results.Append  FormatVariant( key, formatSpec, true ) + " = " + FormatVariant( dict.Value( key ), formatSpec, true )
		          next
		          
		          return  "<Dictionary: " + Join( results, "," + EndOfLine ) + " >"
		          
		        else //We have no special code to format the Object. Let's use Introspection.
		          
		          //Object can have a DebugReportRepresentation method. Try to call it
		          obj = v
		          dim meths() as Introspection.MethodInfo = Introspection.GetType( obj ).GetMethods
		          
		          for each meth as Introspection.MethodInfo in meths
		            if meth.Name="DebugReportRepresentation" then
		              dim vs() as variant
		              vs.Append   formatSpec
		              v = meth.Invoke( obj, vs )
		              return   v.StringValue
		            end if
		          next
		          
		          //else, return the minimum
		          return  "<" + obj.ClassName + " >"
		        end if
		        
		      case Variant.TypeString //System debugging usually puts quotes around string values inside complex structures
		        if quoteString then
		          return  "“" + v.StringValue + "”"
		        else
		          return  v.StringValue
		        end if
		        
		      else
		        obj = v
		        
		        return   v.StringValue
		        
		      end select
		    end if
		  end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HandleReceivedNotification(obs as NotificationObserver, theNotification as NSNotification)
		  //# Processes received notification
		  
		  #pragma unused obs
		  
		  DReportNotification  theNotification, "Associated object:", theNotification.AssociatedObject, "UserInfo dictionary:", theNotification.UserInfo
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Init()
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    if inited then return
		    
		    LogTimer = new Timer
		    LogTimer.Period = 0
		    LogTimer.Mode = 0
		    
		    AddHandler   LogTimer.Action, AddressOf  TimerAction
		    
		    #pragma BreakOnExceptions false
		    Try
		      Prefs = new PropertyList( GetFolderItem( "DebugReport.Preferences.Prefs.plist" ))
		    catch exc
		      Prefs = new PropertyList
		      'Prefs.file = GetFolderItem( "DebugReport.Preferences.Prefs.plist" )
		    end try
		    #pragma BreakOnExceptions default
		    
		    myObserver = new NotificationObserver
		    AddHandler  myObserver.HandleNotification, AddressOf  HandleReceivedNotification
		    'myObserver.Register   "IKAnimationsDidFinish"
		    'myObserver.Register   "NSWindowDidResizeNotification"
		    
		    inited = true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReport(ParamArray values() as variant)
		  //# Make a Debug Report as a notice
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelNotice, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReportDebug(ParamArray values() as variant)
		  //# Make a Debug Report as a debug note
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelDebug, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReportError(ParamArray values() as variant)
		  //# Make a Debug Report as an error
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelError, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReportTitled(ParamArray values() as variant)
		  //# Make a Debug Report as a notice, the first item being displayed with boldface
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelTitled, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReportWarning(ParamArray values() as variant)
		  //# Make a Debug Report as a warning
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelWarning, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterNotification(NotificationName as string, sender as Ptr = Nil)
		  //# Registers notifications to be automatically reported.
		  
		  //@abstract
		  //    At least one of ''NotificationName'' or ''sender'' must be specified. The corresponding notifications are displayed in the Debug Report window.
		  //@abstract/
		  
		  #if TargetMacOS
		    if not inited then
		      init
		    end if
		    
		    if NotificationName="" AND sender=nil then
		      dim e as new RuntimeException
		      e.Message = CurrentMethodName +  ": Cannot register all notifications (NotificationName="""") for all targets (sender=nil). Please specify NotificationName, sender object or both."
		      raise  e
		      return
		    end if
		    
		    myObserver.Register   NotificationName, sender
		    
		  #else
		    
		    #pragma unused NotificationName
		    #pragma unused sender
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReportObjCDetailsForClassPtr(aClass as Ptr)
		  //Report ObjC implementation details for a Cocoa class pointer and its parents
		  
		  // WARNING: passing an incorrect Ptr can crash your application !
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    #if TargetMacOS
		      declare function class_copyMethodList lib CocoaLib (Cls as Ptr, byref outcnt as integer) as Ptr
		      declare function class_copyPropertyList lib CocoaLib (Cls as Ptr, byref outcnt as integer) as Ptr
		      declare function class_copyIvarList lib CocoaLib (Cls as Ptr, byref outcnt as integer) as Ptr
		      declare function object_getClass lib CocoaLib (obj as Ptr) as Ptr
		      declare function class_copyProtocolList lib CocoaLib (Cls as Ptr, byref outcnt as integer) as Ptr
		      declare function method_getNumberOfArguments lib CocoaLib (meth as Ptr) as integer
		      declare sub method_getArgumentType lib CocoaLib (meth as Ptr, index as integer, buffer as Ptr, bufferSize as integer)
		      declare sub method_getReturnType lib CocoaLib (meth as Ptr, buffer as Ptr, bufferSize as integer)
		      
		      declare sub free lib "System" (p as Ptr)
		      
		      dim mb as MemoryBlock
		      dim cnt as integer
		      dim tree() as string = Cocoa.ClassNameTreeForClass( aClass )
		      dim forClass as Ptr
		      dim buffer as new MemoryBlock( 8 * 1024 )
		      dim params() as string
		      dim paramCnt as integer
		      dim s as string
		      
		      for j as integer=0 to tree.ubound
		        forClass = Cocoa.NSClassFromString( tree( j ))
		        QReportTitled   tree( j )
		        
		        mb = class_copyProtocolList( forClass, cnt )
		        if mb<>nil then
		          declare function protocol_getName lib CocoaLib ( proto as Ptr ) as CString
		          
		          for i as integer=0 to cnt - 1
		            QReport   "Conforms to:", protocol_getName( mb.Ptr( i*4 ))
		          next
		          
		          free( mb )
		        end if
		        
		        mb = class_copyMethodList( object_getClass( forClass ), cnt )
		        if mb<>nil then
		          declare function method_getName lib CocoaLib ( meth as Ptr ) as Ptr
		          declare Function sel_getName lib CocoaLib( SEL as Ptr ) as CString
		          
		          for i as integer = 0 to cnt - 1
		            redim params( -1 )
		            paramCnt = method_getNumberOfArguments( mb.Ptr( i*4 ))
		            for k as integer=0 to paramCnt - 1
		              method_getArgumentType( mb.Ptr( i*4 ), k, buffer, buffer.Size )
		              try
		                params.Append   FormatObjCType( buffer.CString( 0 )) //Value too long
		              catch exc
		                params.Append   buffer.StringValue( 0, buffer.Size )
		                continue
		              end try
		            next
		            
		            params.remove  0 //The 2 first are for NS messaging
		            params.Remove 0
		            
		            method_getReturnType( mb.Ptr( i*4 ), buffer, buffer.size )
		            QReport   "+", "(" + FormatObjCType( buffer.CString( 0 )) + ")", sel_getName( method_getName( mb.Ptr( i*4 ))), "(", Join( params, ", " ), ")"
		          next
		          
		          free( mb )
		        end if
		        
		        mb = class_copyMethodList( forClass, cnt )
		        if mb<>nil then
		          declare function method_getName lib CocoaLib ( meth as Ptr ) as Ptr
		          declare Function sel_getName lib CocoaLib( SEL as Ptr ) as CString
		          
		          for i as integer = 0 to cnt - 1
		            redim params( -1 )
		            paramCnt = method_getNumberOfArguments( mb.Ptr( i*4 ))
		            for k as integer=0 to paramCnt - 1
		              method_getArgumentType( mb.Ptr( i*4 ), k, buffer, buffer.Size )
		              params.Append   FormatObjCType( buffer.CString( 0 ))
		            next
		            
		            params.remove  0 //The 2 first are for NS messaging
		            params.Remove 0
		            
		            method_getReturnType( mb.Ptr( i*4 ), buffer, buffer.size )
		            QReport   "–", "(" + FormatObjCType( buffer.CString( 0 )) + ")", sel_getName( method_getName( mb.Ptr( i*4 ))), "(", Join( params, ", " ), ")"
		          next
		          
		          free( mb )
		        end if
		        
		        mb = class_copyPropertyList( forClass, cnt )
		        if mb<>nil then
		          declare function property_getName lib CocoaLib ( prop as Ptr ) as CString
		          declare function property_getAttributes lib CocoaLib ( prop as Ptr ) as CString
		          
		          for i as integer = 0 to cnt - 1
		            redim params( -1 )
		            
		            params = Split( property_getAttributes( mb.Ptr( i*4 )), "," )
		            for k as integer=0 to params.Ubound
		              select case params( k ).LeftB( 1 )
		              case "T"
		                params( k ) = FormatObjCType( params( k ).MidB( 2 ))
		              case "C"
		                params( k ) = "copy"
		              case "P"
		                params( k ) = "garb.coll."
		              case "R"
		                params( k ) = "readonly"
		              case "&"
		                params( k ) = "retain"
		              case "N"
		                params( k ) = "nonatomic"
		              case "G"
		                params( k ) = "getter=" + params( k ).MidB( 2 )
		              case "S"
		                params( k ) = "setter=" + params( k ).MidB( 2 )
		              case "D"
		                params( k ) = "@dynamic"
		              case "W"
		                params( k ) = "__weak"
		              case "V"
		                params( k ) = "ivar " + params( k ).MidB( 2 )
		              end select
		            next
		            
		            s = params( 0 )
		            params.Remove  0
		            
		            QReport   "@property", "(", Join( params, ", " ), ")", s, property_getName( mb.Ptr( i*4 ))
		          next
		          
		          free( mb )
		        end if
		        
		        mb = class_copyIvarList( forClass, cnt )
		        if mb<>nil then
		          declare function ivar_getName lib CocoaLib ( ivar as Ptr ) as CString
		          declare function ivar_getTypeEncoding lib CocoaLib ( ivar as Ptr ) as CString
		          
		          for i as integer = 0 to cnt - 1
		            QReport   "ivar: (" + FormatObjCType( ivar_getTypeEncoding( mb.Ptr( i*4 ))) + ")", ivar_getName( mb.Ptr( i*4 ))
		          next
		          
		          free( mb )
		        end if
		      next
		      
		    #else
		      #pragma unused aClass
		    #endif
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReportObjCDetailsForNSObject(obj as NSObject)
		  //Report ObjC implementation details for a Cocoa object class and its parents
		  
		  #if TargetMacOS
		    
		    #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		      declare function getClass lib CocoaLib selector "class" (id as Ptr) as Ptr
		      
		      ReportObjCDetailsForClassPtr  getClass( obj.id )
		    #endif
		    
		  #else
		    
		    #pragma unused obj
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReportObjCDetailsForNSObjectPtr(pointer as Ptr)
		  //Report ObjC implementation details for a Cocoa object class and its parents
		  
		  #if TargetMacOS
		    
		    #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		      declare function getClass lib CocoaLib selector "class" (id as Ptr) as Ptr
		      
		      ReportObjCDetailsForClassPtr  getClass( pointer )
		    #endif
		    
		  #else
		    
		    #pragma unused pointer
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TimerAction(theTimer as Timer)
		  #pragma DisableBackgroundTasks
		  #pragma unused theTimer
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    if App.CurrentThread = nil then
		      if Queue.Ubound>-1 then
		        Dequeueing = true
		        for each re as DebugReportModule.ReportEvent in Queue
		          if re.sr2<>nil then
		            AppendToWindow  re.type, re.sr1, re.sr2
		          else
		            AppendToWindow   re.type, re.sr1
		          end if
		          
		        next
		        Dequeueing = false
		      end if
		      
		      redim  Queue( -1 )
		      
		      DebugLogWND.LogTA.ScrollPosition = 1e+6
		      DebugLogWND.LogTA.Refresh
		      LogTimer.mode = 0
		      
		    else //We have been called from a Thread ?
		      'DReportWarning   "Timer called from Thread. Go on." //Will queue
		      LogTimer.Reset
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub XReport(type as integer, immediate as boolean, FormatType as integer, values() as variant)
		  //General Report function
		  
		  #pragma unused immediate
		  #pragma unused FormatType
		  
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		      dim results1() as string
		      dim results2() as string
		      dim result1, result2 as string
		      dim sr1 as new StyleRun
		      dim sr2 as new StyleRun
		      'dim srs() as StyleRun
		      dim usesr2 as boolean
		      'dim pendingSpecs() as string
		      'dim spec as string
		      'dim sresult as StyledText
		      'dim formats() as string
		      
		      declare sub setNeedsDisplay lib CocoaLib selector "setNeedsDisplay:" (id as Ptr, flags as Boolean)
		      
		      if not inited then   init
		      
		      //Format according to parameters
		      select case Abs( type )
		      case kLevelDebug //Debug
		        for each v as variant in values
		          results1.Append  FormatVariant( v )
		        next
		        sr1.Font = "SmallSystem"
		        
		      case kLevelNotice //Normal text
		        sr1.Font = "SmallSystem"
		        
		        'Formats = DecomposeFormatString( FormatVariant( values( 0 ))
		        '
		        'if UBound( Formats )>0 then //There is a format spec
		        '
		        '
		        'if Values.Ubound>0 then
		        'result1 = FormatVariant( v )
		        'end if
		        'for i as integer=0 to Ubound( values )
		        'if i=0 then
		        'if VarType( values( 0 )) = Variant.TypeString then //There may be some format specs
		        'spec = DetectFormatIndicator( values( 0 ))
		        'if spec<>"" then
		        'next
		        
		        
		        for each v as variant in values
		          results1.Append  FormatVariant( v )
		        next
		        'sr1.Font = "SmallSystem"
		        
		      case kLevelTitled //Titled
		        sr1.Font = "SmallSystem"
		        sr1.Bold = true
		        results1.Append  FormatVariant( values( 0 ))
		        
		        sr2.Font = "SmallSystem"
		        for i as integer = 1 to values.Ubound
		          results2.Append   FormatVariant( values( i ))
		        next
		        
		      case kLevelWarning //Warning
		        sr1.Font = "SmallSystem"
		        sr1.Text = "WARNING: "
		        sr1.TextColor = &c0000FF
		        sr1.Bold = true
		        
		        for each v as variant in values
		          results2.Append  FormatVariant( v )
		        next
		        sr2.Font = "SmallSystem"
		        
		      case kLevelError //Error
		        sr1.Font = "SmallSystem"
		        sr1.Text = "ERROR: "
		        sr1.TextColor = &c9C3120
		        sr1.Bold = true
		        
		        for each v as variant in values
		          results2.Append  FormatVariant( v )
		        next
		        sr2.Font = "SmallSystem"
		        
		      case kLevelNotification //Notification
		        sr1.Font = "SmallSystem"
		        sr1.Text = "NOTIFICATION: "
		        sr1.TextColor = &cFFCC6600
		        sr1.Bold = true
		        
		        for each v as variant in values
		          results2.Append  FormatVariant( v )
		        next
		        sr2.Font = "SmallSystem"
		        
		      end select
		      
		      if results1.Ubound>-1 then
		        result1 = Join( results1, " " )
		        if result1<>"" then
		          sr1.Text = result1 + EndOfLine
		        end if
		      end if
		      
		      if results2.Ubound>-1 then
		        result2 = Join( results2, " " )
		        if result2<>"" then
		          sr2.Text = result2 + EndOfLine
		          usesr2 = true
		        end if
		      end if
		      
		      
		      //Enqueue reports if we are not in the main thread or user wants to queue notification
		      if App.CurrentThread<>nil OR NOT immediate then
		        Queue.Append   new ReportEvent( type, sr1, IFTE( usesr2, sr2, nil ))
		        LogTimer.mode = 1
		        return
		        
		      else
		        //Else report immediately
		        
		        //If some reports are queued, we must display them first.
		        if Queue.Ubound>-1 then
		          TimerAction( nil )
		        end if
		        
		        if usesr2 then
		          AppendToWindow  type, sr1, sr2
		        else
		          AppendToWindow   type, sr1
		        end if
		        
		        DebugLogWND.LogTA.ScrollPosition = 1e+6
		        DebugLogWND.LogTA.Refresh
		      end if
		    #endif
		    
		  #else
		    
		    #pragma unused type
		    
		  #endif //  TargetMacOS
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		The DebugReportModule allows you to easily report any value in a dedicated window without the hassle of converting values to strings. You can specify any number of
		values. They will be automatically represented as strings, separated by a space.
		The Debug Log window controls all have a help tag.
		
		• DReportDebug: prints out gray text and does not log it to the system log.
		• DReport: just print out the formatted text as black text.
		• DReportTitled: prints the first item as bold title and the other values as normal text.
		• DReportWarning: a warning. The text will be prepended by a blue "WARNING" tag
		• DReportError: an error. The text will be prepended by a red "ERROR" tag
		• DReportWaitChoice: gives the user a choice and blocks execution until the user selected an option. (NOT IMPLEMENTED YET)
		
		The count of DReports is showed at the bottom of the window (notices, warnings and errors).
		Carbon and Cocoa objects: you can pass any native Carbon or Cocoa objects, for which the "description" function is used.
		If you want to read the Log text after your software broke into the debugger, go to Globals→DebugReportModule→LogText; you will get the whole unformatted text.
		
		• If you change "D" by "Q" at the beginning of the method name, the report will be Queued, i.e. it is added immediately but is displayed only when the DebugLogWindow
		     updates itself. This is much less time consuming than the "D" variant. Also, the data are available even if your software breaks before it has displayed a "Q" Report.
		
		THREADS note: as the UI cannot be modified from a Thread, reports will be queued and displayed ASAP from the main thread.
		
		WARNING: by default, the Log Window is forced to refresh each time a DReport is encountered. This is useful but also extremely time-consuming. For that reason,
		   you can use the different CheckBoxes but also press F18 (continuously) to reverse that behavior or F19 (once) to block that behavior from now on (DOES NOT WORK YET).
		
		
		EXTENDING the module: if you create a class and want it to be displayable in the Debug Log window, make it adopt the DebugReportFormatter interface which
		  implements the “DebugReportRepresentation( formatSpec as string = "" ) as variant” method. For the moment, you should return a string representing your
		  object from that method.
		
		
		FUTURE FEATURES: in the future, some methods will use a format specification which allows developers to choose some options for representing the contents of
		   a Real Studio type or of an Object.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Dequeueing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ErrorCnt As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ErrorPos() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private inited As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			The contents of the Debug Log window. It allows you to have the contents of the window even when the debugger broke on exception.
		#tag EndNote
		Protected LogText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LogTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myObserver As NotificationObserver
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Prefs As PropertyList
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Queue() As ReportEvent
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ReportCnt As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ST2Append() As StyleRun
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WarningCnt As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WarningPos() As Integer
	#tag EndProperty


	#tag Constant, Name = DRSeparation, Type = String, Dynamic = False, Default = \"_.$separation$._", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDebugReportModuleVersion, Type = Double, Dynamic = False, Default = \"103", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kLevelDebug, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelError, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelNotice, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelNotification, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelTitled, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelWarning, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant


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

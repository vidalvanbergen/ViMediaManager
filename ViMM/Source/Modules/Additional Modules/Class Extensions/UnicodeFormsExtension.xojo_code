#tag Module
Protected Module UnicodeFormsExtension
	#tag Method, Flags = &h0
		Function AppendUnicodeNormalized(extends s1 as string, s2 as String) As string
		  //# Normalizes string s2 to the same form as s1 then appends it to s1
		  
		  //@ If one of the two strings is not Unicode, result in undefined
		  
		  'dim form as integer
		  '
		  'form = s1.GuessUnicodeNormalization
		  '
		  'return   s1 + s2.NormalizeUnicode( form )
		  
		  #pragma unused s1
		  #pragma unused s2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckNormalization(s as string, mode as integer) As boolean
		  dim ut16 as string
		  dim enc as TextEncoding = s.Encoding
		  
		  if enc=nil OR enc.base<>256 then //Not Unicode
		    return false
		  end if
		  
		  if enc.format=0 OR enc.format=5 then //Encoding must be UTF16 or UTF16LE for ICU
		    ut16 = s
		  else
		    ut16 = s.ConvertEncoding( Encodings.UTF16 )
		  end if
		  
		  dim mb as MemoryBlock
		  
		  #if TargetMacOS OR TargetLinux
		    dim err as integer
		    dim OK as Boolean
		    
		    select case QuickCheckNormalization( ut16, mode )
		    case 0 //QuickCheck returned NO
		      return  false
		      
		    case 1 //QuickCheck returned YES
		      return  true
		      
		    case 2 //QuickCheck returned MAYBE. Use longer algorithm.
		      mb = ut16
		      
		      OK = unorm_isNormalized( mb, mb.Size \ 2, mode, err )
		      
		      if err=0 then
		        return  OK
		      end if
		      
		    end select
		  #endif
		  
		  #if TargetWin32
		    mb = ut16 + Chr( 0 )
		    
		    Win32.SetLastError   Win32Error.ERROR_SUCCESS  //IsNormalized does not do it. Sad but true.
		    dim OK as Boolean = Win32.IsNormalizedString( mode, mb, -1 )
		    dim err as integer = Win32.GetLastError
		    if err=Win32Error.ERROR_SUCCESS then
		      return  OK
		    else
		      raise  new Win32Error( err )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function find_symbol(functionName as String, libPath as String) As String
		  //find library name of unorm_normalize
		  dim s as new Shell
		  s.Execute("nm -o --dynamic " + libPath + " | grep -oE " + functionName + "[[:alnum:]_]*")
		  if s.ErrorCode = 0 then
		    return s.Result.Trim
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GuessUnicodeNormalization(extends s as String) As string
		  //# Determine the Normalization Form of the passed Unicode string. If the string is not in UTF16(LE) format, internal conversion will occur.
		  
		  //@ If you
		  //@ You should rarely see the compatibility normalizations (NFKC, NFKD) but rather canonical ones (NFC, NFD).
		  //@ NFC is usually referred to as "Composed" or "Precomposed" and NFD as "Decomposed"
		  
		  dim Result as boolean
		  dim enc as TextEncoding = s.Encoding
		  dim ut16 as string
		  
		  if enc=nil OR enc.base<>256 then //Not Unicode
		    return   ""
		  end if
		  
		  if enc.format=0 OR enc.format=5 then //Encoding must be UTF16 or UTF16LE for ICU
		    ut16 = s
		  else
		    ut16 = s.ConvertEncoding( Encodings.UTF16 )
		  end if
		  
		  Result = CheckNormalization( ut16, kUnicodeNFC )
		  if Result then   return  "NFC"
		  
		  Result = CheckNormalization( ut16, kUnicodeNFKC )
		  if Result then   return  "NFKC"
		  
		  Result = CheckNormalization( ut16, kUnicodeNFD )
		  if Result then   return  "NFD"
		  
		  Result = CheckNormalization( ut16, kUnicodeNFKD )
		  if Result then   return  "NFKD"
		  
		  //Still no identification
		  return   ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init()
		  '
		  ''#if TargetMacOS
		  ''LibICU = "libicucore.dylib"  //The "soft" declare will find it
		  ''
		  ''#elseif TargetLinux
		  ''#if Target64Bit
		  ''LibICU = "/usr/lib64/libicucore.so"
		  ''#else
		  ''LibICU = "/usr/lib/libicucore.so"
		  ''#endif
		  ''
		  ''#elseif TargetWin32
		  ''
		  ''
		  ''#endif
		  '
		  '
		  '#if not TargetWin32
		  'soft declare function unorm2_getInstance lib LibICU ( packageName as Ptr, name as CString, mode as integer, byref pError as integer ) as Ptr
		  '
		  'if inited then return
		  '
		  'if System.IsFunctionAvailable( "unorm2_getInstance", LibICU ) then
		  'ICU_UseVariant2 = true
		  'Inited = true
		  '
		  'dim err as integer
		  '
		  'Normalizers( 0 ) = unorm2_getInstance( nil, "nfkc", 1, err )  //NFKD
		  'Normalizers( 1 ) = unorm2_getInstance( nil, "nfkc", 0, err )  //NFKC
		  'Normalizers( 2 ) = unorm2_getInstance( nil, "nfc", 1, err )  //NFD
		  'Normalizers( 3 ) = unorm2_getInstance( nil, "nfc", 0, err )  //NFC
		  'end if
		  '
		  'inited = true
		  '#endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsUnicodeNFC(extends s as String) As Boolean
		  //# Determines whether the passed string is canonically-precomposed Unicode or not. If the string is not UTF16(LE), it is internally converted.
		  
		  //@ If this function returns true, IsUnicodeNFKC is usually true as well.
		  
		  return   CheckNormalization( s, kUnicodeNFC )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsUnicodeNFD(extends s as String) As Boolean
		  //# Determines whether the passed string is canonically-decomposed Unicode or not. If the string is not UTF16(LE), it is internally converted.
		  
		  //@ If this function returns true, IsUnicodeNFKD is usually true as well.
		  
		  return   CheckNormalization( s, kUnicodeNFD )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsUnicodeNFKC(extends s as String) As Boolean
		  //# Determines whether the passed string is compatibility-precomposed Unicode or not. If the string is not UTF16(LE), it is internally converted.
		  
		  //@ If this function returns true, IsUnicodeNFC is usually true as well.
		  
		  return   CheckNormalization( s, kUnicodeNFKC )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsUnicodeNFKD(extends s as String) As Boolean
		  //# Determines whether the passed string is compatibility-decomposed Unicode or not. If the string is not UTF16(LE), it is internally converted.
		  
		  //@ If this function returns true, IsUnicodeNFD is usually true as well.
		  
		  return   CheckNormalization( s, kUnicodeNFKD )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function libicuuc() As Ptr
		  #if TargetLinux
		    static handle as Ptr = open_lib(resolve_lib_name("libicuuc.so"))
		  #elseif TargetMacOS
		    static handle as Ptr = open_lib(resolve_lib_name("libicucore.dylib"))
		  #else
		    static handle as Ptr
		  #endif
		  return handle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function load(function_name as String, libHandle as Ptr) As Ptr
		  
		  #if TargetLinux
		    soft declare function dlopen lib "libc.so" alias "__libc_dlopen_mode" (path as CString, flags as Integer) as Ptr
		    soft declare function dlsym lib "libc.so" alias "__libc_dlsym" (handle as Ptr, symbol as CString) as Ptr
		    soft declare sub dlclose lib "libc.so" alias "__libc_dlclose" (h as Ptr)
		    soft declare function dlerror lib "libc.so" alias "__libc_dl_error_tsd" () as Ptr
		  #endif
		  #if TargetMacOS
		    soft declare function dlopen lib "System" alias "dlopen" (path as CString, flags as Integer) as Ptr
		    soft declare function dlsym lib "System" alias "dlsym" (handle as Ptr, symbol as CString) as Ptr
		    soft declare sub dlclose lib "System" alias "dlclose" (h as Ptr)
		    soft declare function dlerror lib "System" alias "dlerror" () as Ptr
		  #endif
		  
		  #if TargetMacOS or TargetLinux
		    dim f as Ptr = dlsym(libHandle, function_name)
		    dim err as Ptr = dlerror()
		    if err = nil then
		      return f
		    else
		      dlclose(libicuuc)
		      dim e as new FunctionNotFoundException
		      dim m as MemoryBlock = err
		      e.Message = m.CString(0)
		      raise e
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MacNormalizeUnicode(extends s as string, form as String) As string
		  //# Equivalent to NormalizeUnicode but uses CoreFoundation.
		  
		  #if TargetMacOS
		    static forms() as string = Array( "NFD", "NFKD", "NFC", "NFKC" )
		    
		    declare sub CFStringNormalize lib CarbonLib (strg as Ptr, form as integer)
		    
		    dim normidx as integer = forms.IndexOf( form )
		    dim myString as new CoreFoundation.CFMutableString( s )
		    
		    if normidx<>-1 then
		      CFStringNormalize( myString, normidx )
		      return  myString.VariantValue
		      
		    else
		      return  ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function m_unorm_isNormalized(source as Ptr, sourceLength as Integer, mode as Integer, ByRef status as Integer) As boolean
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function m_unorm_normalize(source as Ptr, sourceLength as Integer, mode as Integer, options as Integer, result as Ptr, resultLength as Integer, ByRef status as Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function m_unorm_quickCheck(source as Ptr, sourceLength as Integer, mode as Integer, ByRef status as Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function m_u_errorName(code as Integer) As CString
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function Normalize(s as string, mode as integer) As string
		  
		  dim err as integer
		  dim mb as MemoryBlock
		  dim result as MemoryBlock
		  dim resultLen as Int32
		  dim enc as TextEncoding
		  dim ut16 as string
		  
		  enc = Encoding( s )
		  
		  if enc=nil OR enc.base<>256 then //Not Unicode
		    return   s
		  end if
		  
		  if enc.format=0 OR enc.format=5 then //Encoding must be UTF16 or UTF16LE for ICU
		    ut16 = s
		  else
		    ut16 = s.ConvertEncoding( Encodings.UTF16 )
		  end if
		  
		  #if TargetWin32
		    mb = ut16 + Chr( 0 )
		  #else
		    mb = ut16
		  #endif
		  result = new MemoryBlock( mb.Size * 2 )
		  
		  
		  resultLen = unorm_normalize( mb, mb.Size \ 2, mode, 0, result, result.Size, err )
		  
		  if err=0 then
		    ut16 = DefineEncoding( result.StringValue( 0, resultLen * 2 ), Encodings.UTF16 )
		    if NOT ( enc.format=0 OR enc.format=5 ) then
		      return   ut16.ConvertEncoding( enc )
		    else
		      return   ut16
		    end if
		  else
		    return  ""
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NormalizedForm(s as String, form as Integer) As String
		  if s.Encoding = nil then
		    dim e as new UnsupportedFormatException
		    e.Message = "Cannot normalize a String with nil encoding."
		    raise e
		  end if
		  
		  if s = "" then
		    return s
		  end if
		  
		  #if targetMacOS
		    dim modes() as integer = Array( kUnicodeNFD, kUnicodeNFKD, kUnicodeNFC, kUnicodeNFKC )
		    dim mode as integer = modes.IndexOf( form )
		    soft declare function CFStringGetMaximumSizeForEncoding lib CarbonFramework (length as Integer, enc as Integer) as Integer
		    soft declare function CFStringGetCString lib CarbonFramework (theString as Ptr, buffer as Ptr, bufferSize as Integer, enc as Integer) as Boolean
		    
		    dim code as Integer = s.Encoding.code
		    dim p as Ptr = CoreFoundation.StringCreateMutable(nil, 0)
		    if p = nil then
		      return ""
		    end if
		    CoreFoundation.StringAppendCString(p, s, Encoding(s).code)
		    CoreFoundation.StringNormalize(p, mode)
		    
		    dim buffer as new MemoryBlock(1 + CFStringGetMaximumSizeForEncoding(CoreFoundation.StringGetLength(p), code))
		    dim normalizedString as String
		    if CFStringGetCString(p, buffer, buffer.Size, code) then
		      normalizedString = DefineEncoding(buffer.CString(0), s.Encoding)
		    else
		      normalizedString = ""
		    end if
		    CoreFoundation.Release(p)
		    return normalizedString
		  #endif
		  
		  
		  #if targetWin32
		    dim normalizedString as String
		    
		    Win32.SetLastError  Win32Error.ERROR_SUCCESS //NormalizeString does not set ERROR_SUCCESS before it starts
		    
		    dim estimatedBufferSize as Integer = Win32.NormalizeString(form, s, -1, nil, 0)
		    if estimatedBufferSize > 0 then
		      do
		        const sizeof_WCHAR = 2
		        dim buffer as new MemoryBlock(1 + estimatedBufferSize * sizeof_WCHAR)
		        const AssumeNullTerminatedInput = -1
		        Win32.SetLastError   Win32Error.ERROR_SUCCESS
		        dim newLength as Integer = Win32.NormalizeString(form, s, AssumeNullTerminatedInput, buffer, buffer.Size)
		        if newLength > 0 then
		          normalizedString = ConvertEncoding(buffer.WString(0), s.Encoding)
		          exit
		        else
		          //check for buffer size.
		          
		          dim err as Integer = Win32.GetLastError
		          if err = Win32Error.ERROR_INSUFFICIENT_BUFFER then
		            //try again with the proposed buffer size
		            estimatedBufferSize = -newLength
		          elseif err = Win32Error.ERROR_NO_UNICODE_TRANSLATION then //Invalid Unicode character
		            raise new Win32Error(err)
		          elseIf err = Win32Error.ERROR_SUCCESS then
		            //does this mean that no normalizing was needed?
		            exit
		          else
		            raise new Win32Error(err)
		          end if
		        end if
		      loop
		    else
		      raise new Win32Error(Win32Error.GetError)
		    end if
		    
		    return normalizedString
		  #endif
		  
		  #if targetLinux
		    dim source as MemoryBlock = ConvertEncoding(s, Encodings.UTF16)
		    dim buffer as new MemoryBlock(source.Size)
		    dim status as Integer
		    do
		      dim bufferLength as Integer = unorm_normalize(source, Len(s), form, 0, buffer, buffer.Size, status)
		      if status <= U_ZERO_ERROR then
		        return ConvertEncoding(DefineEncoding(buffer.StringValue(0, 2*bufferLength), Encodings.UTF16), s.Encoding)
		      elseif status = U_BUFFER_OVERFLOW_ERROR then
		        //buffer was too small, so we increase size and try again.
		        buffer = new MemoryBlock(buffer.Size * 2)
		        
		      else
		        //raise exception of some sort?
		      end if
		    loop
		    
		  #endif
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NormalizeUnicodeTo(extends s as string, kUnicodeNFconstant as integer) As string
		  //# Normalizes the passed Unicode string given the specified form (NFC, NFD, NFKC or NFKD)
		  
		  //@ On Mac OS X, you should use MacNormalizeUnicode instead.
		  //@ If the passed string is not UTF16(LE), a double encoding conversion will occur internally
		  
		  return   Normalize( s, kUnicodeNFconstant )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NormalizeUnicodeToNFC(extends s as String) As String
		  
		  return NormalizedForm(s, kUnicodeNFC )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NormalizeUnicodeToNFD(extends s as String) As String
		  
		  return NormalizedForm(s, kUnicodeNFD )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NormalizeUnicodeToNFKC(extends s as String) As String
		  
		  return NormalizedForm(s, kUnicodeNFKC )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NormalizeUnicodeToNFKD(extends s as String) As String
		  
		  return NormalizedForm(s, kUnicodeNFKD )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function open_lib(libpath as String) As Ptr
		  #if TargetLinux
		    soft declare function dlopen lib "libc.so" alias "__libc_dlopen_mode" (path as CString, flags as Integer) as Ptr
		    soft declare function dlerror lib "libc.so" alias "__libc_dl_error_tsd" () as Ptr
		  #endif
		  #if TargetMacOS
		    soft declare function dlopen lib "System" alias "dlopen" (path as CString, flags as Integer) as Ptr
		    soft declare function dlerror lib "System" alias "dlerror" () as Ptr
		  #endif
		  
		  #if TargetMacOS or TargetLinux
		    const RTLD_NOW = &h00002
		    dim handle as Ptr = dlopen(libpath, RTLD_NOW)
		    if handle <> nil then
		      return handle
		    else
		      dim e as new FunctionNotFoundException
		      dim p as Ptr = dlerror
		      if p <> nil then
		        dim m as MemoryBlock = p
		        e.Message = m.CString(0)
		      else
		        e.Message = "Unable to load '" + libpath + "'."
		      end if
		      raise e
		    end if
		    
		  #else
		    #pragma unused libpath
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function QuickCheckNormalization(s as string, mode as integer) As integer
		  
		  dim err as integer
		  dim mb as MemoryBlock = s  //s must be in UTF16LE
		  dim result as integer
		  
		  result = unorm_quickCheck( mb, mb.Size \ 2, mode, err )
		  
		  if err=0 then
		    return  result
		  else
		    return  -1
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function resolve_lib_name(name as String) As String
		  dim s as new Shell
		  s.Execute("find /usr/lib -name """ + name + "*"" -type l | sort | head -1")
		  if s.ErrorCode = 0 then
		    return Trim(s.Result)
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnicodeLength(extends s as string) As integer
		  //# Returns the number of characters for any Unicode string. If the string is not UTF16(LE) or is Decomposed Unicode, it will be converted.
		  
		  //@ For non-Unicode strings, this method just returns Len( s )
		  
		  #if TargetMacOS
		    
		    soft declare function u_strlen lib LibICU (str as CString) as int32
		    
		    dim t as MemoryBlock
		    dim ut16 as string
		    dim enc as TextEncoding = s.Encoding
		    
		    if enc=nil OR enc.base<>256 then //Not Unicode
		      return   len( s )
		    end if
		    
		    if enc.format=0 OR enc.format=5 then //Encoding must be UTF16 or UTF16LE for ICU
		      ut16 = s + Encodings.UTF16.Chr( 0 )
		    else
		      ut16 = ut16 + Chr( 0 ) + Chr( 0 )
		      ut16 = s.ConvertEncoding( Encodings.UTF16 )
		    end if
		    
		    if ut16.IsUnicodeNFD OR ut16.IsUnicodeNFKD then //Result will be incorrect for decomposed Unicode strings
		      t = ut16.NormalizeUnicodeToNFC
		    else
		      t = ut16
		    end if
		    
		    return  u_strlen( t )
		    
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function unorm_isNormalized(source as Ptr, sourceLength as Integer, mode as Integer, ByRef status as Integer) As Boolean
		  static f as new m_unorm_isNormalized( load( "unorm_isNormalized", libicuuc ))
		  return f.Invoke( source, sourceLength, mode, status)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function unorm_normalize(source as Ptr, sourceLength as Integer, mode as Integer, options as Integer, result as Ptr, resultLength as Integer, ByRef status as Integer) As Integer
		  static f as new m_unorm_normalize(load("unorm_normalize", libicuuc))
		  return f.Invoke(source, sourceLength, mode, options, result, resultLength, status)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function unorm_quickCheck(source as Ptr, sourceLength as Integer, mode as Integer, ByRef status as Integer) As integer
		  static f as new m_unorm_quickCheck( load( "unorm_quickCheck", libicuuc ))
		  return f.Invoke( source, sourceLength, mode, status)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function u_errorName(code as Integer) As CString
		  static f as new m_u_errorName(load("u_errorName", libicuuc))
		  return f.Invoke(code)
		End Function
	#tag EndMethod


	#tag Note, Name = Unicode Normalization Forms
		Unicode characters may be represented differently, i.e. by different sequences of characters. See Unicode Standard Annex #15 at http://unicode.org/reports/tr15/
		
		This module allows you to discriminate between the different Normalization Forms (precomposed/decomposed and canonical/compatibility)
		and convert between those forms.
		
		As most methods are based on the cross-platform ICU library (see http://site.icu-project.org/ ), you should be able to use those methods on any platform.
		
		ABOUT SPEED:
		ICU mostly uses UTF16(LE) strings while Real Studio natively uses UTF8. As a consequence, many calls will trigger internal TextEncoding conversion which will impair
		performance on large strings or on a large number of strings.
		
		On MAC OS X:
		Mac OS X mostly uses the decomposed form while Real Studio uses the precomposed form. For example, a file name copied from the Finder will be in decomposed
		form and you can get into trouble if you want to get its length or combine it with another string.
	#tag EndNote


	#tag Property, Flags = &h1
		#tag Note
			On Mac OS X, the current module tries to use high-level function for handling Unicode. If, for any reason, you prefer to use the ICU library which
			is present at the UNIX level (like on Linux), you can set this property to "true".
		#tag EndNote
		Protected OptionUseICUEvenOnMacOS As Boolean = false
	#tag EndProperty


	#tag Constant, Name = kUnicodeNFC, Type = Double, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"1"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"4"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"4"
	#tag EndConstant

	#tag Constant, Name = kUnicodeNFD, Type = Double, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"2"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"2"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"2"
	#tag EndConstant

	#tag Constant, Name = kUnicodeNFKC, Type = Double, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"5"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"5"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"5"
	#tag EndConstant

	#tag Constant, Name = kUnicodeNFKD, Type = Double, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"6"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"3"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"3"
	#tag EndConstant

	#tag Constant, Name = LibICU, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"libicucore.dylib"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \""
	#tag EndConstant

	#tag Constant, Name = U_BUFFER_OVERFLOW_ERROR, Type = Double, Dynamic = False, Default = \"15", Scope = Private
	#tag EndConstant

	#tag Constant, Name = U_ZERO_ERROR, Type = Double, Dynamic = False, Default = \"0", Scope = Private
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

#tag Module
Protected Module Carbon
	#tag Method, Flags = &h1
		Protected Function Bundle() As CFBundle
		  return CFBundle.NewCFBundleFromID(BundleID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Attributes( deprecated ) Protected Function GetSystemVersionFromGestalt() As String
		  // Attention: This is now deprecated because it's returning wrong
		  // results on OSX 10.10 (Yosemite) and also shows a warning
		  // in the Console log.
		  // Use the Is... functions or SystemVersionAsInt instead.
		  
		  #if TargetMacOS
		    dim sys1, sys2, sys3 as Integer
		    dim OK as Boolean = true
		    OK = OK AND System.Gestalt("sys1", sys1)
		    OK = OK AND System.Gestalt("sys2", sys2)
		    OK = OK AND System.Gestalt("sys3", sys3)
		    
		    if OK AND sys1 <> 0 then
		      return Format(sys1,"#")+"."+Format(sys2,"#")+"."+Format(sys3,"#")
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsElCapitan() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 101100
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsHighSierra() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 101300
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLeopard() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 100500
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLion() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 100700
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMavericks() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 100900
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMojave() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 101400
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMountainLion() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 100800
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPanther() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 100300
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSierra() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 101200
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSnowLeopard() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 100600
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTiger() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 100400
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsYosemite() As Boolean
		  // Tells you if this OS has features of this version
		  // This means that it returns true for later OS versions as well.
		  // If you want to test for a particular version, use SystemVersionAsInt
		  
		  return SystemVersionAsInt >= 101000
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Languages() As String()
		  dim languagelist as CFArray = CFArray(CFPreferences.Value("AppleLanguages"))
		  
		  dim theList() as String
		  for i as Integer = 0 to languagelist.Count - 1
		    theList.Append languagelist.CFStringRefValue(i)
		  next
		  
		  return theList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowAboutBox(name as String = "", version as String = "", copyright as String = "", description as String = "")
		  dim d as new CFMutableDictionary
		  
		  if name <> "" then
		    d.Value(CFString("HIAboutBoxName")) = CFString(name)
		  end if
		  if version <> "" then
		    d.Value(CFString("HIAboutBoxVersion")) = CFString(version)
		  end if
		  if copyright <> "" then
		    d.Value(CFString("HIAboutBoxCopyright")) = CFString(copyright)
		  end if
		  if description <> "" then
		    d.Value(CFString("HIAboutBoxDescription")) = CFString(description)
		  end if
		  
		  #if targetMacOS
		    soft declare function HIAboutBox lib CarbonLib (inOptions as Ptr) as Integer
		    
		    dim OSError as Integer = HIAboutBox(d)
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SpotlightSearch(searchTerm as String)
		  //opens a Spotlight search window and does the search using searchTerm
		  //if searchTerm = "", a search window is opened
		  
		  #if targetMacOS
		    soft declare function HISearchWindowShow lib "Carbon.framework" (inSearchString as CFStringRef, inOptions as UInt32) as Integer
		    
		    const kNilOptions = 0
		    dim OSError as Integer = HISearchWindowShow(searchTerm, kNilOptions)
		    return
		    
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemUIMode() As UIMode
		  #if targetMacOS
		    soft declare sub GetSystemUIMode lib CarbonLib (ByRef mode as UIMode, outOptions as Ptr)
		    
		    dim mode as UIMode
		    GetSystemUIMode mode, nil
		    return mode
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SystemUIMode(mode as UIMode, options as UIOptions)
		  #if targetCarbon
		    soft declare function SetSystemUIMode lib CarbonLib (inMode as UIMode, inOptions as UIOptions) as Integer
		    
		    dim OSError as Integer = SetSystemUIMode(mode, options)
		    
		    #pragma unused OSError
		  #else
		    #pragma unused mode
		    #pragma unused options
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemUIOptions() As UIOptions
		  #if targetMacOS
		    soft declare sub GetSystemUIMode lib CarbonLib (mode as Ptr, ByRef outOptions as UIOptions)
		    
		    dim options as UIOptions
		    GetSystemUIMode nil, options
		    return options
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemVersionAsInt() As Integer
		  // The value returned is scaled up, so that a version like 10.1.2 becomes 100102, i.e. two digits per part.
		  //
		  // This function avoids using floating point, so that a version such as 10.4 doesn't become 10.39999 or something alike, making a test for >=10.4 fail
		  
		  #if TargetMacOS
		    static version as Integer
		    
		    if version = 0 then
		      // Since OSX 10.10, we have to prefer NSProcessInfo's version over Gestalt
		      dim sys1, sys2, sys3 as Integer
		      dim v as NSProcessInfo.OSVersion
		      v = NSProcessInfo.ProcessInfo.OperatingSystemVersion
		      if v.major > 0 then
		        sys1 = v.major
		        sys2 = v.minor
		        sys3 = v.patch
		      else
		        // This OS is older (pre 10.9), so we'll fall back to using Gestalt
		        call System.Gestalt("sys1", sys1)
		        call System.Gestalt("sys2", sys2)
		        call System.Gestalt("sys3", sys3)
		      end if
		      version = 10000 * sys1 + 100 * sys2 + sys3
		    end if
		    
		    return version
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemVersionAsString() As String
		  // This returns the OS X system version as a String. Use this to display the
		  // system version.
		  //
		  // Careful!
		  //   Do not use the returned value to test for particular system versions!
		  //   Use SystemVersionAsInt for comparisons instead!
		  //
		  // If you do not obey this rule you will get wrong results if you test for
		  //   SystemVersionAsString >= "10.6"
		  // with the actual OS X version being 10.11: Then the string "10.6" will be
		  // greater than "10.11", which is the wrong result for your test.
		  //
		  // Also, this text may be localized in ways you cannot even parse!
		  
		  #if TargetMacOS
		    // Due to the fact that using Gestalt to get the version is not working in OSX 10.10
		    // any more, we need to use NSProcessInfo now instead:
		    static version as String = NSProcessInfo.ProcessInfo.operatingSystemVersionString
		    return version
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VersionAsInteger(versionString As String) As Integer
		  // The value returned is scaled up, so that a version like 10.1.2 becomes 100102, i.e. two digits per part.
		  //
		  // This function avoids using floating point, so that a version such as 10.4 doesn't become 10.39999 or something alike, making a test for >=10.4 fail
		  //
		  // CAUTION: This method will ignore anything past the third part of the version. So "1.2.3.4.5" will be treated the same as "1.2.3".
		  
		  dim version as Integer
		  
		  dim parts() as String = versionString.Split(".")
		  if parts.Ubound <> -1 then
		    version = 10000 * parts( 0 ).Val
		    if parts.Ubound > 0 then
		      version = version + 100 * parts( 1 ).Val
		      if parts.Ubound > 1 then
		        version = version + parts( 2 ).Val
		      end if
		    end if
		  end if
		  
		  return version
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Constant, Name = activeFlagBit, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = alphaLockBit, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = btnStateBit, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BundleID, Type = String, Dynamic = False, Default = \"com.apple.Carbon", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CarbonLib, Type = String, Dynamic = False, Default = \"Carbon.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdKeyBit, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = controlKeyBit, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInvalidID, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNilOptions, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUnknownType, Type = String, Dynamic = False, Default = \"\?\?\?\?", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVariableLengthArray, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = noErr, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = optionKeyBit, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = rightControlKeyBit, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = rightOptionKeyBit, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = rightShiftKeyBit, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = shiftKeyBit, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant


	#tag Structure, Name = LongDateRec, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		era as Int16
		  year as Int16
		  month as Int16
		  day as Int16
		  hour as Int16
		  minute as Int16
		  second as Int16
		  dayOfWeek as Int16
		  dayOfYear as Int16
		  weekOfYear as Int16
		  pm as Int16
		  res1 as Int16
		  res2 as Int16
		res3 as Int16
	#tag EndStructure

	#tag Structure, Name = MacPoint, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		v as Int16
		h as Int16
	#tag EndStructure

	#tag Structure, Name = MacRect, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		top as Int16
		  left as Int16
		  bottom as Int16
		right as Int16
	#tag EndStructure

	#tag Structure, Name = Str255, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		length as Uint8
		data as String*255
	#tag EndStructure


	#tag Enum, Name = UIMode, Flags = &h0
		Normal = 0
		  ContentSuppressed = 1
		  ContentHidden = 2
		  AllSuppressed = 4
		AllHidden = 3
	#tag EndEnum

	#tag Enum, Name = UIOptions, Flags = &h0
		AutoShowMenuBar = 1
		  DisableAppleMenu = 4
		  DisableProcessSwitch = 8
		  DisableForceQuit = 16
		  DisableSessionTerminate = 32
		DisableHide = 64
	#tag EndEnum


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

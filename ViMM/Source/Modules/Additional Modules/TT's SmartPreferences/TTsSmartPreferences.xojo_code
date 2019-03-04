#tag Class
Protected Class TTsSmartPreferences
	#tag Method, Flags = &h0
		Shared Function AppSupportFolder(appName as String, createIfMissing as Boolean = true) As FolderItem
		  // Return:
		  // nil -> app folder invalid or can't be created
		  // otherwise -> test for .Exists if createIfMissing=false was passed
		  
		  if appName = "" then
		    // App Name must be specified
		    raise new RuntimeException
		  end
		  
		  dim f as FolderItem = SpecialFolder.ApplicationData
		  if f = nil or not f.Exists then
		    break
		    System.DebugLog "Can't locate app data folder"
		    return nil
		  end if
		  
		  f = f.Child(appName)
		  if not f.Exists then
		    
		    if not createIfMissing then
		      return f
		    end
		    
		    f.CreateAsFolder
		    if not f.Exists then
		      break
		      System.DebugLog "Can't create App data folder at: "+f.AbsolutePath
		      return nil
		    end if
		  end if
		  
		  if not f.Directory then
		    break
		    System.DebugLog "App data folder not a dir at: "+f.AbsolutePath
		    return nil
		  end if
		  
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function arrayFromBoolean(a() as Boolean) As Variant()
		  dim var() as Variant
		  for each v as Variant in a
		    var.Append v
		  next
		  return var
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function arrayFromDate(a() as Date) As Variant()
		  dim var() as Variant
		  for each v as Variant in a
		    var.Append v
		  next
		  return var
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function arrayFromDouble(a() as Double) As Variant()
		  dim var() as Variant
		  for each v as Variant in a
		    var.Append v
		  next
		  return var
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function arrayFromInteger(a() as Integer) As Variant()
		  dim var() as Variant
		  for each v as Variant in a
		    var.Append v
		  next
		  return var
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function arrayFromLong(a() as Int64) As Variant()
		  dim var() as Variant
		  for each v as Variant in a
		    var.Append v
		  next
		  return var
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function arrayFromObject(a() as Object) As Variant()
		  dim var() as Variant
		  for each v as Variant in a
		    var.Append v
		  next
		  return var
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function arrayFromString(a() as String) As Variant()
		  dim var() as Variant
		  for each v as Variant in a
		    var.Append v
		  next
		  return var
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function boolForKey(Key as String) As Boolean
		  Return me.Value(key, false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub boolForKey(Key as String, assigns Value as Boolean)
		  me.Value(key) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // use the other one!
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(applicationName as String, alwaysUseAppSupportFolder as Boolean = false)
		  mUseAppSupportFolder = not TargetMacOS or alwaysUseAppSupportFolder
		  mAppName = applicationName
		  if mUseAppSupportFolder then
		    mPrefsDict = new Dictionary
		    syncPrefsFile()
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  if me.IsDirty then
		    me.Sync
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dictionaryForKey(Key as String) As Dictionary
		  Return me.Value(key, Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub dictionaryForKey(Key as String, assigns Value as Dictionary)
		  me.Value(key) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function fileForKey(Key as String) As FolderItem
		  dim TheFile as FolderItem
		  dim Path as String = Me.Value(key, "")
		  
		  if Path.StartsWith("~") then
		    Break
		    'TheFile = new FolderItem(Path, folderitem.PathTypeShell) ', FolderItem.PathTypeNative)
		  elseif Path <> "" then
		    TheFile = new FolderItem(Path, FolderItem.PathTypeShell)
		  else
		    'TheFile = Nil
		  end if
		  
		  Return TheFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub fileForKey(Key as String, assigns TheFile as FolderItem)
		  if TheFile <> Nil then
		    dim Path as String = TheFile.ShellPath
		    
		    if Path <> "" then
		      me.Value(key) = Path
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function integerForKey(Key as String) As Integer
		  Return Val( me.Value(key, -1) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub integerForKey(Key as String, assigns Value as Integer)
		  me.Value(key) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key as String)
		  if mUseAppSupportFolder then
		    if mPrefsDict.HasKey (key) then
		      mPrefsDict.Remove (key)
		      mIsDirty = true
		    end if
		  else
		    #if TargetMacOS
		      CFPreferences.Value(key) = nil
		    #endif
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setBoolValue(Key as String, Value as Boolean)
		  me.Value(key) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setDictionaryValue(Key as String, Value as Dictionary)
		  if value = Nil then
		    me.Value(Key) = New Dictionary
		  else
		    me.Value(key) = Value
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFileValue(Key as String, TheFile as FolderItem)
		  if TheFile <> Nil then
		    dim Path as String = TheFile.ShellPath
		    
		    if Path <> "" then
		      me.Value(key) = Path
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setIntegerValue(Key as String, Value as Integer)
		  me.Value(key) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setStringArrayValue(Key as String, Value() as String)
		  me.Value(key) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setStringValue(Key as String, Value as String)
		  me.Value(key) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function stringArrayForKey(name as String) As String()
		  dim result() as String
		  dim v as Variant = me.Value(name, nil)
		  if v = nil then
		    return result
		  elseif v.IsArray then
		    result = VariantArrayToStrings(v)
		    return result
		  else
		    break // wrong type - what now?
		    // let's return nil - the caller must check this!
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function stringForKey(Key as String) As String
		  Return me.Value(key, "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stringForKey(Key as String, assigns Value as String)
		  me.Value(key) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sync(forced as Boolean = false)
		  if forced or me.IsDirty then
		    if mUseAppSupportFolder then
		      syncPrefsFile()
		    else
		      #if TargetMacOS
		        call CFPreferences.Sync()
		      #endif
		    end if
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub syncPrefsFile()
		  // This gets used only when mUseAppSupportFolder=true
		  
		  dim f as FolderItem = AppSupportFolder(mAppName, me.IsDirty)
		  if f = nil or not f.Exists then return
		  
		  f = f.Child("Preferences.plist")
		  
		  if me.IsDirty then
		    // write changes to disk
		    if not mPrefsDict.SaveXML (f, true) then
		      break
		      System.DebugLog "Can't save prefs at: "+f.AbsolutePath
		      return
		    else
		      mIsDirty = false
		    end
		  else
		    // read latest state from disk
		    if f.Exists and not mPrefsDict.LoadXML (f) then
		      break
		      System.DebugLog "Can't read prefs at: "+f.AbsolutePath
		      return
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function toCFType(v as Variant) As CFType
		  // Throws an UnsupportedFormatException if it contains objects it can't convert
		  
		  dim newv as CFType
		  select case v.Type
		    
		  case v.TypeBoolean
		    newv = CFBoolean.Get(v.BooleanValue)
		  case v.TypeInteger, v.TypeInt64
		    newv = CFNumber(v.Int64Value)
		  case v.TypeDouble
		    newv = CFNumber(v.DoubleValue)
		  case v.TypeString, v.TypeCFStringRef
		    newv = CFString(v.StringValue)
		  case v.TypeDate
		    newv = CFDate(v.DateValue)
		  case v.TypeObject
		    if v.ObjectValue isA Dictionary then
		      dim d as Dictionary = v
		      dim cfd as new CFMutableDictionary
		      for each key as String in d.Keys
		        dim value as Variant = d.Value(key)
		        cfd.Value(CFString(key)) = toCFType(value)
		      next
		      newv = cfd
		    elseif v.ObjectValue isA CFType then
		      newv = CFType(v.ObjectValue)
		    else
		      raise new UnsupportedFormatException
		    end if
		  else
		    if v.IsArray then
		      
		      // this is ugly - we have to do an individual loop for each possible type of the elems in the array
		      dim ar() as Variant
		      select case v.ArrayElementType
		      case Variant.TypeBoolean
		        ar = arrayFromBoolean (v)
		      case Variant.TypeString
		        ar = arrayFromString (v)
		      case Variant.TypeDate
		        ar = arrayFromDate (v)
		      case Variant.TypeDouble
		        ar = arrayFromDouble (v)
		      case Variant.TypeInteger
		        ar = arrayFromInteger (v)
		      case Variant.TypeLong
		        ar = arrayFromLong (v)
		      case Variant.TypeObject
		        ar = arrayFromObject (v)
		      end select
		      
		      dim cfa as new CFMutableArray(ar.Ubound+1)
		      for each value as Variant in ar
		        cfa.Append toCFType (value)
		      next
		      newv = cfa
		      
		    else
		      // not supported yet
		      raise new UnsupportedFormatException
		    end if
		    
		  end select
		  
		  return newv
		  
		  Exception exc as RuntimeException
		    break
		    raise new UnsupportedFormatException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as String, assigns v as Variant)
		  if mUseAppSupportFolder then
		    if not mPrefsDict.HasKey (key) or mPrefsDict.Value (key) <> v then
		      mPrefsDict.Value (key) = v
		      mIsDirty = true
		    end if
		  else
		    #if TargetMacOS
		      dim oldv as CFType = CFType(CFPreferences.Value (key))
		      
		      dim newv as CFType
		      newv = toCFType (v)
		      
		      if oldv = nil then
		        // value not in prefs yet
		        CFPreferences.Value(key) = CFPropertyList(newv)
		      elseif not (newv.Equals(oldv)) then
		        CFPreferences.Value(key) = CFPropertyList(newv)
		      else
		        // not changed
		        return
		      end if
		    #endif
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as String, default as Variant) As Variant
		  if mUseAppSupportFolder then
		    return mPrefsDict.Lookup (key, default)
		  else
		    #if TargetMacOS
		      return CFPreferences.VariantValue (key, default)
		    #endif
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueAsArray(name as String) As Variant()
		  dim result() as Variant
		  dim v as Variant = me.Value(name, nil)
		  if v = nil then
		    return result
		  elseif v.IsArray then
		    return v
		  else
		    break // wrong type - what now?
		    // let's return nil - the caller must check this!
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueAsDict(name as String) As Dictionary
		  dim v as Variant = me.Value(name, nil)
		  if v = nil then
		    return new Dictionary
		  elseif v.Type = Variant.TypeObject and v.ObjectValue isA Dictionary then
		    return v
		  else
		    break // wrong type - what now?
		    // let's return nil - the caller must check this!
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantArrayToStrings(theObjects as Variant) As String()
		  
		  if theObjects <> Nil then
		    dim theStringArray() as string
		    
		    if theObjects.IsArray and theObjects.ArrayElementType = Variant.TypeString then
		      theStringArray = theObjects
		      
		    elseif theObjects.IsArray then
		      
		      Try
		        dim theVariantArray() as Variant = theObjects
		        for each obj as Variant in theVariantArray
		          theStringArray.Append obj.StringValue
		        next
		      catch e as TypeMismatchException
		        'MsgBox e.Message
		        Log "TypeMismatchException in VariantArrayToStrings(), theObjects were not made of strings."
		      End Try
		      
		    else
		      //
		    end if
		    
		    Return theStringArray
		  end if
		End Function
	#tag EndMethod


	#tag Note, Name = About
		App Preferences for OS X, Windows and Linux
		
		It's "smart" because it only writes to CFPreferences if the set value is
		actually different from the current prefs value, hence avoiding dirtying
		the prefs unnecessarily.
		
		Written by Thomas Tempelmann for the public domain.
		
		
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote

	#tag Note, Name = How to use
		Create one instance of this class and store it in a global variable or in a property of the App class.
		
		To create, pass the app's name to the Constructor. That name is used on Windows and Linux
		to locate the App specific folder in which the "Preferences.plist" file is then created.
		
		To access preference values, use the Value() functions.
		
		To set a preference:
		
		  Preferences.Prefs.Value ("EnableSomething") = true
		
		To read a preference, you must also pass a default value that's returned if the preference
		hasn't been set yet:
		
		  if Preferences.Prefs.Value ("EnableSomething", false) then
		    // the option "EnableSomething" is 'true'
		    ...
		
		To add a dictionary to the prefs, do something like this:
		
		  dim dictValues as new Dictionary
		  dictValues.Value ("a key") = "a value")
		  Preferences.Prefs.Value ("the dictionary") = dictValues
		
		You can get the Dictionary back using the Value function just the same:
		
		  dim dictValues as Dictionary = Preferences.Prefs.Value ("the dictionary")
		
		Same goes for Arrays of Strings, Booleans and Integers.
		
		
		Use the Sync function to read the latest values from disk, and write any changes to disk.
		Call this after you've made changes to preferences, to make sure the changes are saved
		right away. If you don't call Sync, they get written to disk when your program quits.
	#tag EndNote

	#tag Note, Name = Known Issues
		This class relies on the XMLDictionary module which, in turn, relies on the native Dictionary whose keys are
		not case-sensitive. As such, existing Preference keys that differ only in case will not be handled properly.
	#tag EndNote

	#tag Note, Name = Requirements
		For Mac OS, the entire "CoreFoundation" module with contained classes needs to be added, available here:
		https://github.com/macoslib/macoslib/
		
		Also, Keven Ballard's "XMLDictionary" is needed (should be included)
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mUseAppSupportFolder then
			    return mIsDirty
			  else
			    #if TargetMacOS
			      return CFPreferences.Dirty
			    #endif
			  end
			End Get
		#tag EndGetter
		IsDirty As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			This is unused on OSX when using CFPreferences, i.e. when mUseAppSupportFolder=false
		#tag EndNote
		Private mAppName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This is unused on OSX when using CFPreferences, i.e. when mUseAppSupportFolder=false
		#tag EndNote
		Private mIsDirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This is unused on OSX when using CFPreferences, i.e. when mUseAppSupportFolder=false
		#tag EndNote
		Private mPrefsDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUseAppSupportFolder As Boolean
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
			Name="IsDirty"
			Group="Behavior"
			Type="Boolean"
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

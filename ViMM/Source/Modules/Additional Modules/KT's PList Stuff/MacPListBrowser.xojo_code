#tag Class
Protected Class MacPListBrowser
	#tag Method, Flags = &h0
		Sub AppendChild(value As Variant)
		  // Appends a child to an array.
		  
		  pRaiseErrorIfNotArray( "AppendChild" )
		  
		  dim newIndex as integer = me.Count
		  dim v() as Variant = zValue
		  redim v( newIndex )
		  #if DebugBuild
		    redim zDebugArrayChildren( newIndex )
		  #endif
		  zValue = v
		  me.Child( newIndex ) = value // Do it this way so we don't have to recheck the value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFPropertyListValue() As CoreFoundation.CFPropertyList
		  #if TargetMacOS
		    
		    dim cf as CoreFoundation.CFType = CoreFoundation.CFTypeFromVariant( me.VariantValue )
		    return CoreFoundation.CFPropertyList( cf )
		    
		  #else
		    
		    return nil
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(childIndex As Integer) As MacPListBrowser
		  pRaiseErrorIfNotArray( "Child with index" )
		  
		  dim v() as Variant = zValue
		  return v( childIndex )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Child(childIndex As Integer, Assigns value As Variant)
		  if value = nil then raise new NilObjectException
		  pRaiseErrorIfNotArray( "Child with index" )
		  
		  dim v() as variant = zValue
		  if childIndex < 0 or childIndex > v.UBound then
		    raise new OutOfBoundsException
		  end if
		  
		  if value IsA MacPListBrowser then // Assign the given MacPListBrowser as my child
		    
		    dim plist as MacPListBrowser = value
		    if plist is me then pRaiseError( "Can't assign a MacPListBrowser as its own child." )
		    
		    dim itsParent as MacPListBrowser = plist.Parent
		    if itsParent is nil then
		      // Do nothing
		      
		    elseif itsParent is me then
		      dim oldIndex as integer = plist.Index
		      if oldIndex <> childIndex then
		        dim copy as new MacPListBrowser( plist.VariantValue, me, oldIndex, CaseSensitive ) // Make a copy
		        v( oldIndex ) = copy
		        #if DebugBuild
		          zDebugArrayChildren( oldIndex ) = copy
		        #endif
		      end if
		      
		    else // Its parent is not me so remove it from its parent
		      plist.Isolate
		      
		    end if
		    
		    plist.pSetParent( me, childIndex ) // Change the parent of the given MacPListBrowser
		    v( childIndex ) = plist
		    #if DebugBuild
		      zDebugArrayChildren( childIndex ) = plist
		    #endif
		    zValue = v
		    
		  else
		    
		    if not pIsValidValue( value ) then
		      pRaiseError "Only a valid type (FolderItem, CFType, dictionary, array, string, number, boolean, date, or data) can be assigned to an array."
		    end if
		    
		    dim plist as new MacPListBrowser( value, self, childIndex, CaseSensitive )
		    v( childIndex ) = plist
		    #if DebugBuild
		      zDebugArrayChildren( childIndex ) = plist
		    #endif
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(childKey As String) As MacPListBrowser
		  pRaiseErrorIfNotDictionary( "Child with key" )
		  
		  dim dict as Dictionary = zValue
		  return dict.Value( childKey )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Child(childKey As String, Assigns value As Variant)
		  if value = nil then raise new NilObjectException
		  pRaiseErrorIfNotDictionary( "Child with key" )
		  
		  if childKey = "" then pRaiseError( "Can't assign an empty key." )
		  childKey = childKey.ConvertEncoding( Encodings.UTF8 )
		  
		  dim dict as Dictionary = zValue
		  
		  if value IsA MacPListBrowser then // Assign the given MacPListBrowser as my child
		    
		    dim plist as MacPListBrowser = value
		    if plist is me then pRaiseError( "Can't assign a MacPListBrowser as its own child." )
		    
		    dim itsParent as MacPListBrowser = plist.Parent
		    if itsParent is nil then
		      // Do nothing
		      
		    elseif itsParent is me then
		      dim oldKey as string = plist.Key
		      if oldKey <> childKey and dict.HasKey( oldKey ) then dict.Remove oldKey
		      
		    else // Belongs to another MacPListBrowser so disconnect it
		      plist.Isolate
		      
		    end if
		    
		    plist.pSetParent( me, childKey ) // Change the parent of the given MacPListBrowser
		    dict.Value( childKey ) = plist
		    
		  else
		    
		    if not pIsValidValue( value ) then
		      pRaiseError "Only a valid type (FolderItem, CFType, dictionary, array, string, number, boolean, date, or data) can be assigned to a dictionary."
		    end if
		    
		    dict.Value( childKey ) = new MacPListBrowser( value, self, childKey, CaseSensitive )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildrenKeys() As String()
		  dim r() as string
		  
		  pRaiseErrorIfNotDictionary( "ChildrenKeys" )
		  
		  dim dict as Dictionary = zValue
		  dim keys() as variant = dict.Keys
		  redim r( keys.Ubound )
		  for i as integer = 0 to keys.Ubound
		    r( i ) = keys( i ).StringValue
		  next
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As MacPListBrowser
		  // Convenience method to clone me to another MacPListBrowser.
		  // Just calls new.
		  
		  return new MacPListBrowser( me )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rootType As ValueType = ValueType.IsDictionary, isCaseSensitive As Boolean = False)
		  #if TargetMacOS
		    
		    zCaseSensitive = isCaseSensitive
		    
		    dim v as Variant
		    
		    select case rootType
		    case ValueType.IsDictionary
		      v = pMakeNewDictionary( isCaseSensitive )
		      
		    case ValueType.IsArray
		      dim arr() as Variant
		      v = arr
		      
		    else
		      pRaiseError "If the root value is not an array or dictionary, specify the initial value to use instead."
		      
		    end
		    
		    me.Constructor( v, nil, nil, isCaseSensitive )
		    
		  #else
		    
		    pRaiseError "This class can only be used in the MacOS."
		    
		    #pragma unused rootType
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(myValue As Variant, isCaseSensitive As Boolean = False)
		  // Public interface for the constructor
		  
		  me.Constructor( myValue, nil, nil, isCaseSensitive )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(myValue As Variant, myParent As MacPListBrowser, myParentIndex As Variant, isCaseSensitive As Boolean)
		  // Private constuctor for children of a parent.
		  
		  #if TargetMacOS
		    
		    if myValue = nil then raise new NilObjectException
		    
		    zCaseSensitive = isCaseSensitive
		    
		    if myValue IsA MacPListBrowser then
		      myValue = MacPListBrowser( myValue ).VariantValue // Extract the value from it
		      
		    elseif not pIsValidValue( myValue ) then
		      pRaiseError( "You can only create a MacPListBrowser from another MacPListBrowser, CFType, FolderItem, " + _
		      "dictionary, array, string, number, date, boolean, or MemoryBlock." )
		      
		    end if
		    
		    me.VariantValue = myValue // Convert it to MacPListBrowser objects as needed
		    pSetParent( myParent, myParentIndex )
		    
		  #else
		    
		    pRaiseError "This class can only be used in the MacOS."
		    
		    #pragma unused myValue
		    #pragma unused myParent
		    #pragma unused myParentIndex
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  if zIsArray then
		    dim v() as variant = zValue
		    return v.UBound + 1
		  elseif zIsDictionary then
		    dim dict as Dictionary = zValue
		    return dict.Count
		  else
		    return -1 // Not an array or dictionary
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(f As FolderItem, isCaseSensitive As Boolean = False) As MacPListBrowser
		  // Note that passing a FolderItem to the Contructor will add that FolderItem as an alias
		  
		  dim r as MacPListBrowser
		  
		  #if TargetMacOS
		    
		    if f <> nil and f.Exists then
		      dim plist as CoreFoundation.CFPropertyList = CoreFoundation.CFType.CreateFromPListFile( f, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		      if plist <> nil then
		        r = new MacPListBrowser( plist, isCaseSensitive )
		      end if
		    end if
		    
		  #else
		    
		    #pragma unused f
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(s As String, isCaseSensitive As Boolean = False) As MacPListBrowser
		  // Returns a MacPListBrowser from a plist string.
		  // Could have put this into the constructor, but don't want to make assumptions about
		  // what the developer is trying to do.
		  // Will return nil if the string can't be converted, or just the original string if it's not a plist.
		  
		  dim r as MacPListBrowser
		  
		  #if TargetMacOS
		    
		    // Try to pick out the data
		    dim pos as integer = s.InStr( "<?xml version=" )
		    if pos > 1 then
		      s = s.Mid( pos )
		    end if
		    pos = s.InStr( "</plist>" )
		    if pos <> 0 then
		      s = s.Left( pos + 8 )
		    end if
		    
		    dim plist as CoreFoundation.CFPropertyList = CFType.CreateFromPListString( s, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		    if plist <> nil then
		      r = new MacPListBrowser( plist, isCaseSensitive )
		    end if
		    
		  #else
		    
		    #pragma unused s
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Difference(arr1() As MacPListBrowser, arr2() As MacPListBrowser) As MacPListBrowser()
		  // Returns an array of items that are present in one array or the other, but not both.
		  
		  dim r() as MacPListBrowser
		  
		  dim dict1 as new Dictionary
		  dim dict2 as new Dictionary
		  
		  pArraryToDictionary( arr1, dict1 )
		  pArraryToDictionary( arr2, dict2 )
		  
		  dim diffDict as new Dictionary
		  for i as integer = 0 to arr2.Ubound
		    dim checkVal as MacPListBrowser = arr2( i )
		    if not dict1.HasKey( checkVal ) then diffDict.Value( checkVal ) = nil
		  next i
		  
		  for i as integer = 0 to arr1.Ubound
		    dim checkVal as MacPListBrowser = arr1( i )
		    if not dict2.HasKey( checkVal ) then diffDict.Value( checkVal ) = nil
		  next i
		  
		  pDictionaryToArray( diffDict, r )
		  
		  // Note that we don't use "for each" above so we can preserve order
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByKey(findKey As String, keyMatchType As MatchType = MatchType.Exact, recursive As Boolean = True) As MacPListBrowser()
		  // This is only here to preserve the legacy implementation that did not include a switch for case-sensitivity
		  
		  return FindByKey( findKey, keyMatchType, CaseSensitivity.Default, recursive )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByKey(findKey As String, keyMatchType As MatchType, considerCase As CaseSensitivity, recursive As Boolean = True) As MacPListBrowser()
		  // Returns an array of children whose key matches the given string.
		  // If recursive, will examine every child dictionary too.
		  
		  // If this isn't an array or dictionary, this will return an empty array
		  
		  dim r() as MacPListBrowser
		  
		  if findKey <> "" then
		    
		    if zIsDictionary or ( recursive and zIsArray ) then // If it's not one of these, it won't match anything anyway
		      
		      // Figure out if this should be case-sensitive
		      dim cs as Boolean = false
		      select case considerCase
		      case CaseSensitivity.Default
		        cs = CaseSensitive
		      case CaseSensitivity.Sensitive
		        cs = true
		        // ELSE
		        // case CaseSensitivity.Insensitive
		        // cs = false
		      end
		      
		      if cs then
		        findKey = findKey.ConvertEncoding( Encodings.UTF8 ) // Make sure the encoding is right
		      end if
		      
		      dim rx as RegEx
		      if keyMatchType = MatchType.RegEx then
		        rx = new RegEx
		        rx.Options.CaseSensitive = cs
		        rx.SearchPattern = findKey
		      end if
		      
		      pFindByKey( findKey, keyMatchType, cs, recursive, rx, r )
		    end if
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByKeyAndValue(findKey As String, findValue As Variant, keyMatchType As MatchType = MatchType.Exact, considerKeyCase As CaseSensitivity = CaseSensitivity.Insensitive, onlySameValueType As Boolean = True, recursive As Boolean = True) As MacPListBrowser()
		  // Returns an array of children whose key matches the given string.
		  // If recursive, will examine every child dictionary too.
		  
		  // If this isn't an array or dictionary, this will return an empty array
		  
		  dim r() as MacPListBrowser
		  
		  if findKey <> "" and findValue <> nil then
		    
		    if zIsDictionary or ( recursive and zIsArray ) then // If it's not one of these, it won't match anything anyway
		      
		      dim valType as ValueType = pValueTypeOfVariant( findValue )
		      if valType <> ValueType.IsArray and valType <> ValueType.IsDictionary and valType <> ValueType.IsUnknown then
		        
		        // Figure out if this should be case-sensitive
		        dim cs as Boolean = false
		        select case considerKeyCase
		        case CaseSensitivity.Default
		          cs = CaseSensitive
		        case CaseSensitivity.Sensitive
		          cs = true
		          // ELSE
		          // case CaseSensitivity.Insensitive
		          // cs = false
		        end
		        
		        if cs then
		          findKey = findKey.ConvertEncoding( Encodings.UTF8 ) // Make sure the encoding is right
		        end if
		        
		        dim rx as RegEx
		        if keyMatchType = MatchType.RegEx then
		          rx = new RegEx
		          rx.Options.CaseSensitive = cs
		          rx.SearchPattern = findKey
		        end if
		        
		        pFindByKeyAndValue( findKey, findValue, keyMatchType, cs, onlySameValueType, recursive, rx, r )
		      end if
		      
		    end if
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByType(findType As ValueType, recursive As Boolean = True) As MacPListBrowser()
		  // Returns an array of MacPListBrowser whose value is of a certain type.
		  // If recursive, will examine every child too.
		  // Will return an empty array if nothing is found.
		  
		  dim r() as MacPListBrowser
		  
		  pFindByType( findType, recursive, r )
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByValue(value As Variant, onlySameType As Boolean = True, recursive As Boolean = True) As MacPListBrowser()
		  // Returns an array of MacPListBrowser whose value matches the given value.
		  // If recursive, will examine every child too.
		  // Tried to make this very tolerant of bad values so will return an empty array if the value
		  // can't be used for a search.
		  
		  dim r() as MacPListBrowser
		  
		  if value <> nil then
		    dim valType as ValueType = pValueTypeOfVariant( value )
		    if valType <> ValueType.IsArray and valType <> ValueType.IsDictionary and valType <> ValueType.IsUnknown then
		      
		      pFindByValue( value, onlySameType, recursive, r )
		      
		    end if
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(childKey As String) As Boolean
		  if zIsDictionary then
		    
		    dim dict as Dictionary = zValue
		    return dict.HasKey( childKey )
		    
		  else
		    
		    return false
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Index() As Integer
		  dim r as integer
		  
		  dim p as MacPListBrowser = me.Parent
		  if p <> nil and p.IsArray then
		    r = zParentIndex.IntegerValue
		    
		  else
		    r = -1 // Not part of an array
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Intersection(arr1() As MacPListBrowser, arr2() As MacPListBrowser) As MacPListBrowser()
		  // Returns an array of items that are present in both arrays
		  
		  dim r() As MacPListBrowser
		  
		  if arr1.Ubound <> -1 and arr2.Ubound <> -1 then // There is something in each of them
		    
		    dim arr1Dict as new Dictionary
		    pArraryToDictionary( arr1, arr1Dict )
		    
		    dim intersectDict as new Dictionary
		    for i as integer = 0 to arr2.Ubound
		      dim checkVal as MacPListBrowser = arr2( i )
		      if arr1Dict.HasKey( checkVal ) then intersectDict.Value( checkVal ) = nil
		    next i
		    
		    pDictionaryToArray( intersectDict, r )
		    
		    // Note that we don't use "for each" above so we can preserve order
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsArray() As Boolean
		  return zIsArray
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDictionary() As Boolean
		  return zIsDictionary
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFolderItem() As Boolean
		  #if TargetMacOS
		    
		    if not zCheckedForFolderItem then
		      zCheckedForFolderItem = true // Remember that we checked
		      
		      if zValueType <> ValueType.IsData then
		        zIsFolderItem = false // Just make sure this is set properly
		        
		      elseif not zIsFolderItem then
		        dim mb as MemoryBlock = zValue
		        if mb <> nil then
		          dim f as FolderItem = FileManager.GetFolderItemFromAliasData( mb )
		          if f IsA FolderItem then
		            zIsFolderItem = true // Remember for next time
		          end if
		        end if
		      end if
		      
		    end if
		    
		  #endif
		  
		  return zIsFolderItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Isolate()
		  // Turns this MacPListBrowser into its own root.
		  
		  dim myParent as MacPListBrowser = me.Parent
		  if myParent <> nil then
		    if myParent.IsDictionary then
		      dim k as string = zParentIndex.StringValue
		      myParent.RemoveChild( k )
		    else // isArray
		      dim i as integer = zParentIndex.IntegerValue
		      myParent.RemoveChild( i )
		    end if
		    
		    // RemoveChild will set the parent to nil
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValidIndex(i As Integer) As Boolean
		  // Like HasKey but for arrays
		  
		  pRaiseErrorIfNotArray( "IsValidIndex" )
		  
		  if i < 0 or i > me.UBound then
		    return false
		  else
		    return true
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub pArraryToDictionary(arr() As MacPListBrowser, dict As Dictionary)
		  for i as integer = 0 to arr.Ubound
		    dict.Value( arr( i ) ) = nil
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub pDictionaryToArray(dict As Dictionary, ByRef arr() As MacPListBrowser)
		  dim keys() as Variant = dict.Keys
		  redim arr( keys.Ubound )
		  for i as integer = 0 to keys.Ubound
		    arr( i ) = keys( i )
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pFindByKey(findKey As String, keyMatchType As MatchType, considerCase As Boolean, recursive As Boolean, rx As RegEx, appendTo() As MacPListBrowser)
		  // Recursive method used to fill in the appendTo array with children matching the given key.
		  // Assumes the findKey has already been encoded properly.
		  
		  if zIsDictionary then
		    
		    dim dict as Dictionary = zValue
		    dim k() as Variant = dict.Keys
		    for i as integer = 0 to k.Ubound
		      dim thisKey as Variant = k( i )
		      if pStringMatches( thisKey.StringValue, findKey, keyMatchType, considerCase, rx ) then appendTo.Append( dict.Value( thisKey ) )
		      if recursive then
		        dim thisChild as MacPListBrowser = dict.Value( thisKey )
		        thisChild.pFindByKey( findKey, keyMatchType, considerCase, recursive, rx, appendTo )
		      end if
		    next
		    
		  elseif recursive and zIsArray then
		    
		    dim v() as Variant = zValue
		    for i as integer = 0 to v.Ubound
		      dim thisChild as MacPListBrowser = v( i )
		      thisChild.pFindByKey( findKey, keyMatchType, considerCase, recursive, rx, appendTo )
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pFindByKeyAndValue(findKey As String, findValue As Variant, keyMatchType As MatchType, considerKeyCase As Boolean, onlySameValueType As Boolean, recursive As Boolean, rx As RegEx, appendTo() As MacPListBrowser)
		  // Recursive method used to fill in the appendTo array with children matching the given key.
		  // Assumes the findKey has already been encoded properly.
		  
		  if zIsDictionary then
		    
		    dim dict as Dictionary = zValue
		    dim k() as Variant = dict.Keys
		    dim thisChild as MacPListBrowser
		    for i as integer = 0 to k.Ubound
		      dim thisKey as Variant = k( i )
		      thisChild = nil
		      if pStringMatches( thisKey.StringValue, findKey, keyMatchType, considerKeyCase, rx ) then
		        thisChild = dict.Value( thisKey )
		        if not thisChild.zIsDictionary and not thisChild.zIsArray and ( not onlySameValueType or thisChild.zValue.Type = findValue.Type ) then
		          if thisChild.zValue = findValue then appendTo.Append thisChild
		        end if
		      end if
		      if recursive then
		        if thisChild is nil then thisChild = dict.Value( thisKey )
		        thisChild.pFindByKeyAndValue( findKey, findValue, keyMatchType, considerKeyCase, onlySameValueType, recursive, rx, appendTo )
		      end if
		    next
		    
		  elseif recursive and zIsArray then
		    
		    dim v() as Variant = zValue
		    for i as integer = 0 to v.Ubound
		      dim thisChild as MacPListBrowser = v( i )
		      thisChild.pFindByKeyAndValue( findKey, findValue, keyMatchType, considerKeyCase, onlySameValueType, recursive, rx, appendTo )
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pFindByType(findType As ValueType, recursive As Boolean, appendTo() As MacPListBrowser)
		  // Private method to recursively return the items matching the type.
		  
		  // First check this value
		  if zValueType = findType then
		    appendTo.Append me
		  end if
		  
		  // See if we need to recurse
		  if recursive then
		    
		    if zIsDictionary then
		      
		      dim dict as Dictionary = zValue
		      dim k() as Variant = dict.Keys
		      for i as integer = 0 to k.Ubound
		        dim thisKey as Variant = k( i )
		        dim thisChild As MacPListBrowser = dict.Value( thisKey )
		        thisChild.pFindByType( findType, recursive, appendTo )
		      next
		      
		    elseif zIsArray then
		      
		      dim v() as Variant = zValue
		      for i as integer = 0 to v.Ubound
		        dim thisChild as MacPListBrowser = v( i )
		        thisChild.pFindByType( findType, recursive, appendTo )
		      next
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pFindByValue(value As Variant, onlySameType As Boolean, recursive As Boolean, ByRef appendTo() As MacPListBrowser)
		  // Private method to recursively return the items matching the value.
		  
		  // First check this value, but only if this isn't an array or dictionary
		  if not zIsDictionary and not zIsArray then
		    if not onlySameType or zValue.Type = value.Type then
		      if zValue = value then appendTo.Append me
		    end
		  end if
		  
		  // See if we need to recurse
		  if recursive then
		    
		    if zIsDictionary then
		      
		      dim dict as Dictionary = zValue
		      dim k() as Variant = dict.Keys
		      for i as integer = 0 to k.Ubound
		        dim thisKey as Variant = k( i )
		        dim thisChild As MacPListBrowser = dict.Value( thisKey )
		        thisChild.pFindByValue( value, onlySameType, recursive, appendTo )
		      next
		      
		    elseif zIsArray then
		      
		      dim v() as Variant = zValue
		      for i as integer = 0 to v.Ubound
		        dim thisChild as MacPListBrowser = v( i )
		        thisChild.pFindByValue( value, onlySameType, recursive, appendTo )
		      next
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pIsValidValue(ByRef value As Variant) As Boolean
		  // Validates that the value given is acceptable.
		  
		  dim r as boolean
		  
		  if value IsA FolderItem then
		    
		    r = true
		    
		  elseif value IsA CoreFoundation.CFPropertyList then
		    
		    r = true
		    
		  else
		    
		    dim theType as ValueType = pValueTypeOfVariant( value )
		    if theType <> ValueType.IsUnknown then r = true
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PListStringValue() As String
		  dim r as string
		  
		  #if TargetMacOS
		    
		    try
		      dim plist as CoreFoundation.CFPropertyList = me.CFPropertyListValue
		      r = plist.XMLValue
		    catch // Really shouldn't happen
		      r = ""
		    end
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pMakeNewDictionary(isCaseSensitive As Boolean) As Dictionary
		  // Returns a regular or case-sensitive dictionary depending on the property value
		  
		  dim r as Dictionary
		  if isCaseSensitive then
		    'r = new DICT_CaseSensitiveDictionary
		    r = new NativeSubclass.DictionaryCaseSensitive
		  else
		    r = new Dictionary
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pPrettyText(appendTo() As String, level As Integer, parent As MacPListBrowser)
		  dim thisLine() as string
		  if level <> 0 then
		    for i as integer = 1 to level
		      thisLine.Append "| "
		    next i
		    'thisLine.Append " "
		  end if
		  
		  if parent <> nil and parent.IsDictionary and zParentIndex <> nil and zParentIndex <> "" then
		    thisLine.Append zParentIndex
		    thisLine.Append ": "
		  end if
		  
		  if zIsDictionary or zIsArray then
		    dim v() as Variant
		    if zIsDictionary then
		      thisLine.Append "<Dictionary>"
		      
		      dim dict as Dictionary = zValue
		      v = dict.Values
		      
		    elseif zIsArray then
		      thisLine.Append "<Array>"
		      v = zValue
		      
		    end if
		    appendTo.Append join( thisLine, "" )
		    
		    for i as integer = 0 to v.Ubound
		      dim plist as MacPListBrowser = v( i )
		      plist.pPrettyText( appendTo, level + 1, me )
		    next
		    
		    redim thisLine( -1 )
		    for i as integer = 1 to level
		      thisLine.Append "| "
		    next
		    thisLine.Append "-"
		    appendTo.Append join( thisLine, "" )
		    
		  elseif zIsFolderItem then
		    thisLine.Append "<folderitem>"
		    dim f as FolderItem = zValue
		    thisLine.Append f.AbsolutePath
		    appendTo.Append join( thisLine, "" )
		    
		  else
		    
		    select case zValueType
		    case ValueType.IsBoolean
		      thisLine.Append "<bool>"
		      thisLine.Append zValue.StringValue
		    case ValueType.IsData
		      thisLine.Append "<data>"
		      thisLine.Append zValue.StringValue
		    case ValueType.IsDate
		      dim d as date = zValue
		      thisLine.Append "<date>"
		      thisLine.Append d.SQLDateTime
		    case ValueType.IsNumber
		      thisLine.Append "<num>"
		      thisLine.Append zValue.StringValue
		    case ValueType.IsString
		      thisLine.Append "<str>"
		      thisLine.Append zValue.StringValue
		    case ValueType.IsUnknown
		      thisLine.Append "<unkown>"
		    end
		    appendTo.Append join( thisLine, "" )
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseError(msg As String)
		  dim err as new RuntimeException
		  err.Message = msg
		  raise err
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseErrorIfNotArray(msg As String)
		  if not zIsArray then
		    pRaiseError( msg + " can only be used with an array." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseErrorIfNotArrayOrDictionary(msg As String)
		  if not zIsArray and not zIsDictionary then
		    pRaiseError( msg + " can only be used with an array or dictionary." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseErrorIfNotDictionary(msg As String)
		  if not zIsDictionary then
		    pRaiseError( msg + " can only be used with a dictionary." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pResetFlags()
		  // Resets the boolean properties
		  
		  zIsDictionary = false
		  zIsArray = false
		  zIsFolderItem = false
		  zCheckedForFolderItem = false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pSetParent(myParent As MacPListBrowser, myParentIndex As Variant)
		  // Private method that lets one MacPListBrowser set the parent of another
		  
		  if myParent <> nil then
		    
		    dim w as new WeakRef( myParent )
		    zParent = w
		    zParentIndex = myParentIndex
		    
		  else
		    
		    zParent = nil
		    myParentIndex = nil
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetValueFromArray(sourceArr() As Variant)
		  dim cs as Boolean = CaseSensitive
		  dim newArr() as Variant
		  redim newArr( sourceArr.Ubound )
		  #if DebugBuild
		    redim zDebugArrayChildren( sourceArr.Ubound )
		  #endif
		  for i as integer = 0 to sourceArr.Ubound
		    dim thisValue as Variant = sourceArr( i )
		    dim plist as new MacPListBrowser( thisValue, self, i, cs )
		    newArr( i ) = plist
		    #if DebugBuild
		      zDebugArrayChildren( i ) = plist
		    #endif
		  next
		  
		  zValue = newArr
		  zValueType = ValueType.IsArray
		  pResetFlags()
		  zIsArray = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetValueFromCFArray(sourceArr As CoreFoundation.CFArray)
		  dim cs as boolean = CaseSensitive
		  dim newArr() as Variant
		  dim lastIndex as integer = sourceArr.Count - 1
		  redim newArr( lastIndex )
		  #if DebugBuild
		    redim zDebugArrayChildren( lastIndex )
		  #endif
		  for i as integer = 0 to lastIndex
		    dim thisValue as CFType = sourceArr.CFValue( i )
		    dim plist as new MacPListBrowser( thisValue, self, i, cs )
		    newArr( i ) = plist
		    #if DebugBuild
		      zDebugArrayChildren( i ) = plist
		    #endif
		  next
		  
		  zValue = newArr
		  zValueType = ValueType.IsArray
		  pResetFlags()
		  zIsArray = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetValueFromCFDictionary(sourceDict As CoreFoundation.CFDictionary)
		  dim k() as CoreFoundation.CFType = sourceDict.Keys
		  dim cs as boolean = CaseSensitive
		  dim newDict as Dictionary = pMakeNewDictionary( cs )
		  for i as integer = 0 to k.Ubound
		    dim thisKeyCF as CoreFoundation.CFType = k( i )
		    dim thisKeyString as string = thisKeyCF.VariantValue.StringValue.ConvertEncoding( Encodings.UTF8 )
		    dim thisValue as CFType = sourceDict.Value( thisKeyCF )
		    newDict.Value( thisKeyString ) = new MacPListBrowser( thisValue, self, thisKeyString, cs )
		  next
		  
		  zValue = newDict
		  zValueType = ValueType.IsDictionary
		  pResetFlags
		  zIsDictionary = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetValueFromDictionary(sourceDict As Dictionary)
		  dim k() as Variant = sourceDict.Keys
		  dim cs as boolean = CaseSensitive
		  dim newDict as Dictionary = pMakeNewDictionary( cs )
		  for i as integer = 0 to k.Ubound
		    dim thisKey as Variant = k( i )
		    dim thisKeyString as string = thisKey.StringValue.ConvertEncoding( Encodings.UTF8 )
		    dim thisValue as Variant = sourceDict.Value( thisKey )
		    newDict.Value( thisKeyString ) = new MacPListBrowser( thisValue, self, thisKeyString, cs )
		  next
		  
		  zValue = newDict
		  zValueType = ValueType.IsDictionary
		  pResetFlags
		  zIsDictionary = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetValueFromFolderItem(f As FolderItem)
		  #if TargetMacOS
		    
		    dim ar as new FSAliasRecord( f )
		    dim mb as MemoryBlock = ar.MemoryBlock
		    if mb <> nil then
		      zValue = mb
		      zValueType = ValueType.IsData
		      pResetFlags
		      zIsFolderItem = true
		      zCheckedForFolderItem = true
		      
		    else
		      
		      pRaiseError( "Could not convert this FolderItem to an alias record." )
		      
		    end if
		    
		  #else
		    
		    #pragma unused f
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pStringMatches(source As String, findStr As String, useMatchType As MatchType, considerCase As Boolean, rx As RegEx) As Boolean
		  // Helper method to determine a match between strings.
		  // If the match type is regex, the RegEx should already be populated.
		  
		  if source = "" then return false
		  if findStr = "" then return false
		  
		  dim seg as string
		  
		  select case useMatchType
		  case MatchType.Contains
		    if considerCase then
		      return source.InStrB( findStr ) <> 0
		    else
		      return source.InStr( findStr ) <> 0
		    end if
		  case MatchType.Exact // Will consider case if needed
		    if considerCase then
		      return StrComp( source, findStr, 0 ) = 0
		    else
		      return source = findStr
		    end if
		  case MatchType.StartsWith
		    if considerCase then
		      seg = source.LeftB( findStr.LenB )
		      return StrComp( seg, findStr, 0 ) = 0
		    else
		      seg = source.Left( findStr.Len )
		      return seg = findStr
		    end if
		  case MatchType.EndsWith
		    if considerCase then
		      seg = source.RightB( findStr.LenB )
		      return StrComp( seg, findStr, 0 ) = 0
		    else
		      seg = source.Right( findStr.Len )
		      return seg = findStr
		    end if
		  case MatchType.RegEx
		    if rx is nil then return false
		    dim match as RegExMatch = rx.Search( source )
		    return match <> nil and match.SubExpressionCount <> 0
		  end
		  
		  // Shouldn't ever get here
		  pRaiseError "Invalid match type."
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pValueTypeOfVariant(value As Variant) As ValueType
		  dim v as variant = value
		  
		  if v.IsArray then
		    return ValueType.IsArray
		  else
		    
		    select case v.Type
		    case Variant.TypeObject
		      if v IsA Dictionary then
		        return ValueType.IsDictionary
		      elseif v.IsArray then
		        return ValueType.IsArray
		      elseif v IsA MemoryBlock then
		        return ValueType.IsData
		      else
		        return ValueType.IsUnknown
		      end if
		    case Variant.TypeInteger, Variant.TypeDouble, Variant.TypeLong
		      return ValueType.IsNumber
		    case Variant.TypeString
		      return ValueType.IsString
		    case Variant.TypeDate
		      return ValueType.IsDate
		    case Variant.TypeBoolean
		      return ValueType.IsBoolean
		    else
		      return ValueType.IsUnknown // Really shouldn't get here, but just in case
		    end
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveChild(childIndex As Integer)
		  // Return a child with the given index.
		  
		  pRaiseErrorIfNotArray( "RemoveChild with index" )
		  
		  dim v() as variant = zValue
		  dim plist as MacPListBrowser = v( childIndex )
		  plist.pSetParent( nil, nil ) // Remove the parent in case there is a reference to it elsewhere
		  v.Remove childIndex
		  #if DebugBuild
		    zDebugArrayChildren.Remove childIndex
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveChild(childKey As String)
		  // Return a child with the given key.
		  
		  pRaiseErrorIfNotDictionary( "RemoveChild with key" )
		  
		  if childKey = "" then pRaiseError( "No key specified." )
		  
		  dim dict as Dictionary = zValue
		  dim plist as MacPListBrowser = dict.Value( childKey )
		  plist.pSetParent( nil, nil ) // Remove the parent in case there is a reference to it elsewhere
		  dict.Remove childKey
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveToFile(f As FolderItem, asBinary As Boolean = False) As Boolean
		  dim r as boolean
		  
		  #if TargetMacOS
		    
		    if f <> nil then
		      dim plist as CoreFoundation.CFPropertyList = me.CFPropertyListValue()
		      r = plist.WriteToFile( f, not asBinary )
		    end if
		    
		  #else
		    
		    #pragma unused f
		    #pragma unused asBinary
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ubound() As Integer
		  // Returns the Ubound if this is an array
		  
		  pRaiseErrorIfNotArray( "Ubound" )
		  
		  dim v() as Variant = zValue
		  return v.Ubound
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Union(arr1() As MacPListBrowser, arr2() As MacPListBrowser) As MacPListBrowser()
		  // Joins two arrays of type MacPListBrowser into one.
		  
		  dim r() as MacPListBrowser
		  dim combinedSize as integer = arr1.Ubound + arr2.Ubound + 2
		  if combinedSize <> 0 then
		    
		    dim dict as new Dictionary
		    pArraryToDictionary( arr1, dict )
		    pArraryToDictionary( arr2, dict )
		    
		    pDictionaryToArray( dict, r)
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Legal
		This class was created by Kem Tekinay, MacTechnologies Consulting (ktekinay@mactechnologies.com).
		It is copyright ©2013, all rights reserved.
		
		You may use this class AS IS at your own risk for any purpose. The author does not warrant its use
		for any particular purpose and disavows any responsibility for bad design, poor execution,
		or any other faults.
		
		The author does not actively support this class, although comments and recommendations
		are welcome.
		
		You may modify code in this class as long as those modifications are clearly indicated
		via comments in the source code.
		
		You may distribute this class, modified or unmodified, as long as any modifications
		are clearly indicated, as noted above, and this copyright notice is not disturbed or removed.
		
		This class is distributed as part of, and is dependent on, the MacOSLib project.
	#tag EndNote

	#tag Note, Name = Release Notes
		1.6:
		- Added StringValue property. Use this to extract the raw data that can be converted to string.
		
		1.5:
		- Changed XMLValue to a computed property to make debugging easier.
		- Added Try/Catch block to PLIstStringValue to prevent errors when looking at XMLValue in debugger. (Error really shouldn't happen anyway.)
		- Added FindByKeyAndValue method.
		- Added zDebugArrayChildren property to assist with debugging when MacPListBrowser holds an array.
		- Added zDebugXMLValue property to assist with debugging by making the XML readable.
		- Added PrettyText property.
		- Made CreateFromPListString more tolerant of junk data (like errors) preceding the plist.
		
		1.4:
		- As of MacOSLib v.118, CFDictionary is converted to a NativeSubclass.DictionaryCaseSensitive. Modified this code accordingly.
		- Changed calls to DICT_CaseSensitiveDictionary to the identical NativeSubclass.DictionaryCaseSensitive.
		
		1.3:
		- Added XMLValue as alias for PListStringValue.
		- Added optional parameter asBinary to SaveToFile.
		
		1.2 (started numbering releases):
		- Added features for case-sensitivity.
		- The DICT_CaseSensitiveDictionary class is now required.
		
		1.1:
		- Added FolderItem handling.
		
		1.0:
		- Initial release.
	#tag EndNote

	#tag Note, Name = Usage
		
		This class is in ongoing development and is meant to make working with plists easier.
		Create a new instance by assigning a valid value to it. Valid values are
		number, string, date, boolean, MemoryBlock (data), array, or dictionary.
		
		You can also assign a FolderItem. FolderItems will be stored as Mac aliases and, 
		when retrieved, will always point to the current location of the file/folder if it exists.
		If it doesn't exist, you will still get a FolderItem pointing to the original location.
		
		The are a few options for starting a MacPListBrowser:
		
		dim a() as variant
		dim p1 as new MacPListBrowser( a ) // An empty array
		
		You can also use:
		
		dim p2 as new MacPListBrowser() // Empty dictionary
		dim p3 as new MacPListBrowser( MacPListBrowser.ValueType.IsArray ) // Empty array
		dim p3 as new MacPListBrowser( MacPListBrowser.ValueType.IsDictionary ) // Empty dictionary
		
		You can create a new instance from an existing PropertyList string using the Shared Method CreateFromPListString,
		or from a FolderItem using CreateFromPListFile. If the FolderItem contains
		a plist, it will be interpreted. Otherwise, its contents will be added as a string.
		
		DO NOT LOSE A REFERENCE TO THE ROOT PLIST. Because WeakRefs are used to keep track of parents, you can 
		not get back the root plist if you lose a reference to it. For example:
		
		plist is a root MacPListBrowser
		plist = plist.Child( 1 )
		// Later
		plist = plist.Parent // Will be nil at this point
		
		You can extract the value of the plist by using VariantValue. If the value is an array or dictionary, you can use
		Child( childIndex ) or Child( key ) respectively to get or assign the value of an element. These values are returned
		as MacPListBrowser instances. If the value is data and it is a legitimate FolderItem the value will be returned as
		a FolderItem. You can use IsFolderItem to check.
		
		Note that the ValueType for a FolderItem is IsData.
		
		You can assign a value to a plist either as a value or as another MacPListBrowser. In the latter case,
		the value will be copied from the source MacPListBrowser. This is different than assigning a MacPListBrowser
		as a child. (See below.)
		
		You can remove a plist from another plist using Isolate.
		
		plist = root.Child( 0 )
		plist.Isolate
		
		At this point, root.Child( 0 ) will be deleted and plist will be a standalone plist.
		
		You can move children around by assigning one child to another, either within the same plist or between plists.
		Moving a plist from plist1 to plist2 will delete that plist from plist1. It's the same as calling plist.Isolate first.
		If you want to make a copy of a plist, use new MacPListBrowser( originalPList ) or the Clone method.
		
		Plists can be contain case-sensitive keys. By default, MacPListBrowser is case-INsensitive, but you 
		can use the optional parameters to make it case-sensitive. You can also change its case-sensitivity
		later through the CaseSensitive property. Changing a case-sensitive MacPListBrowser to case-insensitve
		might lead to loss of data where keys differ only in case.
	#tag EndNote

	#tag Note, Name = What happened to DICT_CaseSensitiveDictionary?
		
		DICT_CaseSensitiveDictionary has been incorporated into MacOSLib as
		NativeSubclass.DictionaryCaseSensitive. You should update your code accordingly.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // First update the property as needed
			  
			  if me.zIsDictionary and zValue IsA Dictionary then
			    'zCaseSensitive = ( zValue IsA DICT_CaseSensitiveDictionary )
			    zCaseSensitive = ( zValue IsA NativeSubclass.DictionaryCaseSensitive )
			  end if
			  
			  return zCaseSensitive
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if CaseSensitive <> value and zIsDictionary and zValue <> nil then // Have to convert
			    
			    if value then // Make is case-sensitve
			      dim d as Dictionary = zValue
			      'dim cs as new DICT_CaseSensitiveDictionary
			      dim cs as new NativeSubclass.DictionaryCaseSensitive
			      cs.AssignDictionary( d )
			      zValue = cs
			    else // Make is case-INsensitive
			      'dim d as DICT_CaseSensitiveDictionary = zValue
			      dim d as NativeSubclass.DictionaryCaseSensitive = zValue
			      zValue = d.CloneAsDictionary
			    end if
			    
			  end if
			  
			  zCaseSensitive = value
			  
			End Set
		#tag EndSetter
		CaseSensitive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  dim p as MacPListBrowser = me.Parent
			  if p <> nil and p.Type = ValueType.IsDictionary then
			    r = zParentIndex.StringValue
			    
			  else
			    r = "" // Return an empty string
			    
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value.LenB = 0 then pRaiseError( "Can't assign an empty key." )
			  
			  dim myParent as MacPListBrowser = me.Parent
			  if myParent <> nil and myParent.Type = ValueType.IsDictionary then
			    if myParent.HasKey( value ) then pRaiseError( "The key """ + value + """ already exists." )
			    
			    dim oldKey as string = zParentIndex.StringValue
			    myParent.RemoveChild( oldKey )
			    myParent.Child( value ) = me // Assign it new
			    
			  else // Not part of a dictionary
			    pRaiseError "This MacPListBrowser is not a value within a dictionary."
			  end if
			  
			End Set
		#tag EndSetter
		Key As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if zParent is nil then return nil
			  if zParent.value = nil then
			    zParent = nil
			    zParentIndex = nil
			    return nil
			  end if
			  
			  dim o as Object = zParent.Value
			  dim myParent as MacPListBrowser = MacPListBrowser( o )
			  
			  // Make sure this hasn't gotten unlinked already
			  dim c as MacPListBrowser
			  if myParent.Type = ValueType.IsDictionary then
			    dim k as string = zParentIndex.StringValue
			    if myParent.HasKey( k ) then c = myParent.Child( k )
			  elseif myParent.Type = ValueType.IsArray then
			    dim i as integer = zParentIndex.IntegerValue
			    if myParent.IsValidIndex( i ) then c = myParent.Child( i )
			  end if
			  
			  if not( c is me ) then // No match
			    zParent = nil // Set the parent to nil
			    zParentIndex = nil
			    myParent = nil
			  end if
			  
			  return myParent
			  
			End Get
		#tag EndGetter
		Parent As MacPlistBrowser
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r() as string
			  pPrettyText( r, 0, nil )
			  return join( r, EndOfLine )
			  
			End Get
		#tag EndGetter
		PrettyText As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the root MacPListBrowser
			  
			  dim root As MacPListBrowser = me
			  dim oneUp as MacPListBrowser = root.Parent
			  while oneUp <> nil
			    root = oneUp
			    oneUp = root.Parent
			  wend
			  
			  return root
			  
			End Get
		#tag EndGetter
		Root As MacPListBrowser
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  select case zValueType
			  case ValueType.IsArray, ValueType.IsDictionary, ValueType.IsUnknown
			    // Do nothing
			    
			  else
			    try
			      r = zValue.StringValue
			    catch
			      r = ""
			    end try
			    
			  end select
			  
			  return r
			  
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zValueType
			  
			End Get
		#tag EndGetter
		Type As ValueType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as Variant
			  
			  #if TargetMacOS
			    
			    if zValueType = ValueType.IsArray then
			      dim sourceArr() as Variant = zValue
			      dim returnArr() as Variant
			      redim returnArr( sourceArr.Ubound )
			      for i as integer = 0 to sourceArr.Ubound
			        dim thisPlist as MacPListBrowser = sourceArr( i )
			        returnArr( i ) = thisPlist.VariantValue
			      next i
			      r = returnArr
			      
			    elseif zValueType = ValueType.IsDictionary then
			      dim sourceDict as Dictionary = zValue
			      dim returnDict as Dictionary = pMakeNewDictionary( CaseSensitive )
			      dim k() as Variant = sourceDict.Keys
			      for each thisKey As Variant in k
			        dim thisPlist as MacPListBrowser = sourceDict.Value( thisKey )
			        returnDict.Value( thisKey ) = thisPlist.VariantValue
			      next
			      r = returnDict
			      
			    elseif IsFolderItem then // Does the checks necessary to confirm
			      r = FileManager.GetFolderItemFromAliasData( zValue )
			      
			    end if
			    
			    // Check to see if we have anything
			    if r is nil then
			      r = zValue
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value = nil then raise new NilObjectException
			  
			  if not pIsValidValue( value ) then
			    pRaiseError "This is not an acceptable type for a plist."
			  end if
			  
			  // We don't reset the flags first because there might be an error when assigning the value, so zValue may not change.
			  
			  // Convert it if it it's a CFType
			  if value IsA CoreFoundation.CFPropertyList then
			    
			    dim cf as CoreFoundation.CFType = value
			    if cf IsA CoreFoundation.CFDictionary then
			      dim cfd as CoreFoundation.CFDictionary = CoreFoundation.CFDictionary( cf )
			      pSetValueFromCFDictionary( cfd )
			      value = nil
			      
			    elseif cf IsA CoreFoundation.CFArray then
			      dim cfa as CoreFoundation.CFArray = CoreFoundation.CFArray( cf )
			      pSetValueFromCFArray( cfa )
			      value = nil
			      
			    else
			      value = cf.VariantValue // Handle it below
			    end if
			    
			  end if
			  
			  if value is nil then
			    // Do nothing
			    
			  elseif value IsA FolderItem then
			    pSetValueFromFolderItem( value )
			    
			  elseif value IsA Dictionary then
			    pSetValueFromDictionary( value )
			    
			  elseif value.IsArray then
			    dim v() as Variant = value
			    pSetValueFromArray( v )
			    
			  else
			    
			    pResetFlags()
			    zValue = value
			    zValueType = pValueTypeOfVariant( value )
			    
			  end if
			  
			End Set
		#tag EndSetter
		VariantValue As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Alias for...
			  return me.PListStringValue
			End Get
		#tag EndGetter
		XMLValue As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zCaseSensitive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zCheckedForFolderItem As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			No other way to get to the array children while debugging.
			Only maintained when running in the IDE.
		#tag EndNote
		Private zDebugArrayChildren() As MacPListBrowser
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  #if DebugBuild
			    
			    dim r as string = XMLValue
			    r = r.ReplaceAllB( ChrB( 9 ), " " )
			    return r
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Private zDebugXMLValue As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zIsArray As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zIsDictionary As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zIsFolderItem As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zParent As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zParentIndex As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zValue As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zValueType As ValueType
	#tag EndProperty


	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"1.5", Scope = Public
	#tag EndConstant


	#tag Enum, Name = CaseSensitivity, Type = Integer, Flags = &h0
		Default
		  Sensitive
		Insensitive
	#tag EndEnum

	#tag Enum, Name = MatchType, Type = Integer, Flags = &h0
		Contains
		  Exact
		  StartsWith
		  EndsWith
		RegEx
	#tag EndEnum

	#tag Enum, Name = ValueType, Type = Integer, Flags = &h0
		IsDictionary
		  IsArray
		  IsString
		  IsDate
		  IsBoolean
		  IsData
		  IsNumber
		IsUnknown
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="CaseSensitive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Key"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="PrettyText"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Type"
			Group="Behavior"
			Type="ValueType"
			EditorType="Enum"
			#tag EnumValues
				"0 - IsDictionary"
				"1 - IsArray"
				"2 - IsString"
				"3 - IsDate"
				"4 - IsBoolean"
				"5 - IsData"
				"6 - IsNumber"
				"7 - IsUnknown"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="XMLValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

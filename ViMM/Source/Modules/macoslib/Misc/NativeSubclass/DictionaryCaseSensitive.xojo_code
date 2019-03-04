#tag Class
Protected Class DictionaryCaseSensitive
Inherits Dictionary
	#tag Method, Flags = &h0
		Sub AssignArrays(keyArr() As String, valueArr() As Variant)
		  // Takes two arrays, one for keys, the other of values, and feeds them into this dictionary.
		  // Ubound of both must match or it's an error.
		  
		  dim lastIndex as integer = keyArr.Ubound
		  if valueArr.Ubound <> lastIndex then
		    dim err as new RuntimeException
		    err.Message = "The key and value arrays must be of the same size."
		    raise err
		  end if
		  
		  for i as integer = 0 to lastIndex
		    super.Value( pEncodeStringKey( keyArr( i ) ) ) = valueArr( i )
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssignArrays(keyArr() As Variant, valueArr() As Variant)
		  // Takes two arrays, one for keys, the other of values, and creates a dictionary.
		  // Ubound of both must match or it's an error.
		  
		  dim lastIndex as integer = keyArr.Ubound
		  if valueArr.Ubound <> lastIndex then
		    dim err as new RuntimeException
		    err.Message = "The key and value arrays must be of the same size."
		    raise err
		  end if
		  
		  for i as integer = 0 to lastIndex
		    super.Value( pEncodeKey( keyArr( i ) ) ) = valueArr( i )
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssignDictionary(dict As Dictionary)
		  // Merges another dictionary into this one, merging or overwriting keys in the process.
		  // Will convert a plain dictionary to a case-sensitive version.
		  
		  if dict IsA DictionaryCaseSensitive then
		    
		    pAssignCSDictionary( DictionaryCaseSensitive( dict ) )
		    
		  else
		    
		    AssignArrays( dict.Keys, dict.Values )
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssignPairs(entries() As Pair)
		  for each entry as Pair in entries
		    me.Value( entry.Left ) = entry.Right
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssignPairs(ParamArray entries As Pair)
		  me.AssignPairs( entries )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As DictionaryCaseSensitive
		  dim newDict as new DictionaryCaseSensitive( zEncoding )
		  
		  dim keyArr() as variant = super.Keys // Raw, hex-encoded keys
		  dim lastIndex as Integer = keyArr.Ubound
		  if lastIndex = -1 then return newDict
		  dim valArr() as variant = me.Values
		  
		  for i as integer = 0 to lastIndex
		    dim thisKey as variant = keyArr( i )
		    dim thisVal as variant = valArr( i )
		    newDict.RawValue( thisKey ) = thisVal
		  next i
		  
		  return newDict
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneAsDictionary() As Dictionary
		  // Creates a clone as a native dictionary.
		  // Since case-sensitivity is eliminated, only the last value of duplicate keys will be preserved.
		  
		  dim newDict as new Dictionary
		  
		  dim keyArr() as variant = me.Keys
		  dim lastIndex as Integer = keyArr.Ubound
		  if lastIndex = -1 then return newDict
		  dim valArr() as variant = me.Values
		  
		  for i as Integer = 0 to lastIndex
		    newDict.Value( keyArr( i ) ) = valArr( i )
		  next i
		  
		  return newDict
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(dict As Dictionary, enc As TextEncoding = nil)
		  me.Constructor( enc )
		  me.AssignDictionary( dict )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(enc as TextEncoding = nil)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  if enc is nil then
		    zEncoding = Encodings.UTF8
		  else
		    zEncoding = enc
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated = "Constructor( dict, enc ) or AssignDictionary" )  Shared Function FromDictionary(dict As Dictionary, enc As TextEncoding = nil) As DictionaryCaseSensitive
		  // Converts a plain dictionary to a case-sensitive version
		  // Convenience method (use the constructor or AssignDictionary instead).
		  
		  dim r as new DictionaryCaseSensitive( dict, enc )
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(theKey as Variant) As Boolean
		  return super.HasKey( pEncodeKey( theKey ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKeyStringKey(theKey As String) As Boolean
		  return super.HasKey( pEncodeStringKey( theKey ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemsNotIn(T As Dictionary) As DictionaryCaseSensitive
		  // Returns keys that are in me, but not in T.
		  // T can be either a regualr dictionary or case-sensitive dictionary.
		  
		  // We could use the raw keys here, but don't so we don't have to worry about encoding.
		  
		  dim diff as new DictionaryCaseSensitive( zEncoding )
		  
		  dim vKeys() as Variant = me.Keys
		  dim thisKey As Variant
		  for i as integer = 0 to vKeys.Ubound
		    thisKey = vKeys( i )
		    if not T.HasKey( thisKey ) then
		      diff.Value( thisKey ) = me.Value( thisKey )
		    end if
		  next
		  
		  return diff
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Key(index As Integer) As Variant
		  dim k as variant = super.Key( index )
		  return pDecodeKey( k )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys() As Variant()
		  dim k() as variant = super.Keys()
		  dim lastIndex as Integer = k.Ubound
		  
		  dim encodedKey as string
		  for i as Integer = 0 to lastIndex
		    encodedKey = k( i )
		    k( i ) = pDecodeKey( encodedKey )
		  next i
		  
		  return k
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysAsStringArray() As String()
		  // This originally contained all the code for the conversion.
		  // Later, I added the Shared Method VariantArrayToStringArray so this
		  // has become simply a convenience method.
		  
		  return VariantArrayToStringArray( me.Keys )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatContain(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  
		  dim matchIndex as integer = -1
		  
		  dim thisKey as Variant
		  dim sKey as string
		  dim pos as integer
		  for i as integer = 0 to lastIndex
		    thisKey = vKeys( i )
		    if thisKey.Type = Variant.TypeString then
		      sKey = thisKey.StringValue
		      pos = sKey.InStr( S )
		      if pos <> 0 then
		        matchIndex = matchIndex + 1
		        vKeys( matchIndex ) = thisKey
		      end if
		    end if
		  next
		  
		  redim vKeys( matchIndex )
		  return vKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatContainB(S As String) As Variant()
		  dim vKeys() as Variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  
		  dim matchIndex as integer = -1
		  
		  dim thisKey as Variant
		  dim sKey as string
		  dim pos as integer
		  for i as integer = 0 to lastIndex
		    thisKey = vKeys( i )
		    if thisKey.Type = Variant.TypeString then
		      sKey = thisKey.StringValue
		      pos = sKey.InStrB( S )
		      if pos <> 0 then
		        matchIndex = matchIndex + 1
		        vKeys( matchIndex ) = thisKey
		      end if
		    end if
		  next
		  
		  redim vKeys( matchIndex )
		  return vKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatEndWith(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLenB as integer = S.LenB
		  
		  dim matchIndex as integer = -1
		  
		  dim thisKey as Variant
		  dim sKey, part as string
		  for i as integer = 0  to lastIndex
		    thisKey = vKeys( i )
		    if thisKey.Type = Variant.TypeString then
		      sKey = thisKey.StringValue
		      part = sKey.RightB( sLenB )
		      if part = S then
		        matchIndex = matchIndex + 1
		        vKeys( matchIndex ) = thisKey
		      end if
		    end
		  next
		  
		  redim vKeys( matchIndex )
		  return vKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatEndWithB(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLenB as integer = S.LenB
		  
		  dim matchIndex as integer = -1
		  
		  dim thisKey as Variant
		  dim sKey, part as string
		  for i as integer = 0  to lastIndex
		    thisKey = vKeys( i )
		    if thisKey.Type = Variant.TypeString then
		      sKey = thisKey.StringValue
		      part = sKey.RightB( sLenB )
		      if StrComp( part, S, 0 ) = 0 then
		        matchIndex = matchIndex + 1
		        vKeys( matchIndex ) = thisKey
		      end if
		    end if
		  next
		  
		  redim vKeys( matchIndex )
		  return vKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatMatchRegEx(pattern As String, caseSensitive As Boolean = False, greedy As Boolean = True, matchEmpty As Boolean = True) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if pattern = "" or lastIndex = -1 then return vKeys
		  
		  pattern = pattern.ConvertEncoding( Encodings.UTF8 )
		  
		  dim rx as new RegEx
		  rx.SearchPattern = pattern
		  dim options as RegExOptions = rx.Options
		  options.CaseSensitive = caseSensitive
		  options.Greedy = greedy
		  options.MatchEmpty = matchEmpty
		  
		  dim matchKeys() as Variant
		  redim matchKeys( lastIndex )
		  dim matchIndex as integer = -1
		  
		  dim thisKey as Variant
		  dim sKey as string
		  dim match as RegExMatch
		  for i as integer = 0  to lastIndex
		    thisKey = vKeys( i )
		    if thisKey.Type = Variant.TypeString then
		      sKey = thisKey.StringValue.ConvertEncoding( Encodings.UTF8 )
		      match = rx.Search( sKey )
		      if match <> nil and match.SubExpressionCount <> 0 then
		        matchIndex = matchIndex + 1
		        matchKeys( matchIndex ) = thisKey
		      end if
		    end if
		  next
		  
		  redim matchKeys( matchIndex )
		  return matchKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatStartWith(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLenB as integer = S.LenB
		  
		  dim matchIndex as integer = -1
		  
		  dim thisKey as Variant
		  dim sKey, part as string
		  for i as integer = 0  to lastIndex
		    thisKey = vKeys( i )
		    if thisKey.Type = Variant.TypeString then
		      sKey = thisKey.StringValue
		      part = sKey.LeftB( sLenB )
		      if part = S then
		        matchIndex = matchIndex + 1
		        vKeys( matchIndex ) = thisKey
		      end if
		    end if
		  next
		  
		  redim vKeys( matchIndex )
		  return vKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatStartWithB(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLenB as integer = S.LenB
		  
		  dim matchIndex as integer = -1
		  
		  dim thisKey as Variant
		  dim sKey, part as string
		  for i as integer = 0  to lastIndex
		    thisKey = vKeys( i )
		    if thisKey.Type = Variant.TypeString then
		      sKey = thisKey.StringValue
		      part = sKey.LeftB( sLenB )
		      if StrComp( part, S, 0 ) = 0 then
		        matchIndex = matchIndex + 1
		        vKeys( matchIndex ) = thisKey
		      end if
		    end if
		  next
		  
		  redim vKeys( matchIndex )
		  return vKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(theKey As Variant, defaultValue as Variant) As Variant
		  return super.Lookup( pEncodeKey( theKey ), defaultValue )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LookupStringKey(theKey As String, defaultValue as variant) As Variant
		  return super.Lookup( pEncodeStringKey( theKey ), defaultValue )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pAssignCSDictionary(dict As DictionaryCaseSensitive)
		  // Clones another case-sensitive dictionary into this one
		  
		  dim k() as variant = dict.RawKeys
		  dim v() as variant = dict.Values
		  
		  for i as integer = 0 to k.Ubound
		    super.Value( k( i ) ) = v( i )
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pDecodeKey(theKey as Variant) As Variant
		  dim r as variant
		  
		  if theKey.Type = Variant.TypeString then
		    
		    r = DecodeHex( theKey.StringValue ).DefineEncoding( zEncoding )
		    
		  else
		    
		    r = theKey
		    
		  end if
		  
		  return r
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pEncodeKey(theKey as Variant) As Variant
		  dim r as variant
		  
		  if theKey.Type = Variant.TypeString then
		    
		    r = pEncodeStringKey( theKey )
		    
		  else
		    
		    r = theKey
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pEncodeStringKey(theKey as String) As String
		  dim k as string = theKey.ConvertEncoding( zEncoding )
		  dim r as string = EncodeHex( k )
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawKey(index As Integer) As Variant
		  return super.Key( index )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawKeys() As Variant()
		  return super.Keys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawValue(theKey as Variant) As Variant
		  return super.Value( theKey )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RawValue(theKey As Variant, Assigns v as Variant)
		  super.Value( theKey ) = v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(theKey as Variant)
		  super.Remove( pEncodeKey( theKey ) )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveStringKey(theKey as String)
		  super.Remove( pEncodeStringKey( theKey ) )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(theKey As Variant) As Variant
		  return super.Value( pEncodeKey( theKey ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(theKey as Variant, Assigns v as variant)
		  super.Value( pEncodeKey( theKey ) ) = v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueStringKey(theKey As String) As Variant
		  return super.Value( pEncodeStringKey( theKey ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValueStringKey(theKey as String, Assigns v as variant)
		  super.Value( pEncodeStringKey( theKey ) ) = v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function VariantArrayToStringArray(vArr() As Variant, valueForNonString As String = "") As String()
		  // Convenience method.
		  // Pulls the string values out of a Variant array.
		  // Where the variant <> TypeString, will use the valueForNonString value instead.
		  
		  dim r() as string
		  dim lastIndex as integer = vArr.Ubound
		  if lastIndex = -1 then return r
		  
		  redim r( lastIndex )
		  
		  dim useNonStringValue as boolean = valueForNonString <> ""
		  
		  dim thisKey as Variant
		  for i as integer = 0 to lastIndex
		    thisKey = vArr( i )
		    if thisKey.Type = Variant.TypeString then
		      r( i ) = thisKey.StringValue
		    elseif useNonStringValue then
		      r( i ) = valueForNonString
		    end if
		  next
		  
		  return r
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Usage
		
		This is a drop-in replacement for the dictionary with some modifications and additional functions:
		
		1. String keys are converted to and from hex on-the-fly for case-sensitivity.
		
		Because the type of key is tested, you can continue to use keys of other types (objects, integers, etc.)
		and will get the same results as with the built-in dictionary.
		
		2. String-specific methods are included.
		
		If you know your key is going to be a string, you can use the "StringKey" versions of the built-in
		methods for a bit of a performance boost. For example:
		
		  v = dict.LookupStringKey ( myStringKey, nil )
		
		Performance with string keys is roughly half of the built-in dictionary so, if you don't
		really need the keys to be case-sensitive and/or performance is an issue,
		use the native dictionary instead.
		
		3. You can specify the text encoding for the keys upon construction.
		
		If you create a dictionary as usual, keys will be converted to, and encoded as, UTF8.
		If you prefer a different type of encoding, you can specify it upon construction.
		For example:
		
		  dim d as new DictionaryCaseSensitive( Encodings.UTF16 )
		
		4. You can use the "Raw" methods to access the keys directly.
		
		However, be careful with this since by-passing the class methods for converting the string keys
		may lead to unintended consequences later. For example, if you store an already-hex-encoded
		key directly, but forgot to check the encoding before you encoded it, you will not be able to
		use that key with the ValueStringKey method later.
		
		5. There is an included Clone method that will make a copy of the dictionary quickly.
		
		You can do the same thing using the "Raw" methods described above, but I've saved you the trouble.
	#tag EndNote


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  // Since the keys are encoded, this will allow the developer to see them while debugging
			  
			  dim k() as string = me.KeysAsStringArray
			  for i as integer = 0 to k.Ubound
			    k( i ) = k( i ).ReplaceAll( EndOfLine.UNIX, "\n" )
			    k( i ) = k( i ).ReplaceAll( EndOfLine.Macintosh, "\r" )
			  next
			  dim r as string = join( k, EndOfLine )
			  return r
			  
			End Get
		#tag EndGetter
		Private DebugKeys As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected zEncoding As TextEncoding
	#tag EndProperty


	#tag Constant, Name = kVersion, Type = Double, Dynamic = False, Default = \"1.4", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BinCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
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

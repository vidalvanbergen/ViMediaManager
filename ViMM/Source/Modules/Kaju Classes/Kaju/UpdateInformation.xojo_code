#tag Class
Protected Class UpdateInformation
Inherits Kaju.Information
	#tag Event
		Function IsInvalid(ByRef reason As String) As Boolean
		  static rxVersion as RegEx
		  if rxVersion is nil then
		    rxVersion = new RegEx
		    rxVersion.SearchPattern = "(?mi-Us)\A\d+(\.\d+){0,2}(?:[dab]\d+|\x20\(\d+\))?\z"
		  end if
		  
		  dim r as boolean
		  
		  if not r and rxVersion.Search( Version ) is nil then
		    reason = KajuLocale.kVersionMustBeInFormReason + ": 1, 1.2, 1.2.3, 1.2d4, 1.2a4, 1.2b4, 1.2.4b4, 1.3.4 (232), etc."
		    r = true
		  end if
		  
		  if not r and AppName.Trim = "" then
		    reason = KajuLocale.kMissingAppNameReason
		    r = true
		  end if
		  
		  if not r then
		    dim pairs() as Pair 
		    for each binaryName as string in BinaryNames
		      dim platform as string
		      select case binaryName.Left( 3 )
		      case "Mac"
		        platform = "Mac"
		      case "Win"
		        platform = "Windows"
		      case "Lin"
		        platform = "Linux"
		      case else
		        raise new KajuException( "Unknown platform", CurrentMethodName )
		      end select
		      
		      dim p as new Pair( binaryName, platform )
		      pairs.Append p
		    next
		    
		    for each p as Pair in pairs
		      dim key as string = p.Left
		      dim platform as string = p.Right
		      
		      dim binary as Kaju.BinaryInformation = Binaries.Lookup( key, nil )
		      if binary isa Kaju.BinaryInformation and not binary.IsValid then
		        reason = platform + " " + KajuLocale.kBinaryInfoInvalidReason + ": " + binary.InvalidReason
		        r = true
		        exit for p
		      end if
		    next
		  end if
		  
		  return r
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Binaries() As Dictionary
		  if mBinaries is nil then
		    mBinaries = new Dictionary
		  end if
		  
		  return mBinaries
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function BinaryNames() As String()
		  return array( _
		  kMacBinaryName, _
		  kWindowsBinaryName, _
		  kLinuxBinaryName, _
		  kWindowsBinary64Name, _
		  kLinuxBinary64Name _
		  )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function BinaryNeedsExecutableName(binaryName As String) As Boolean
		  return binaryName.Left( 3 ) <> "Mac"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data As JSONItem)
		  self.Constructor()
		  
		  Kaju.JSONToProperties( data, self )
		  
		  for each binaryName as string in BinaryNames
		    if data.HasName( binaryName ) then
		      dim executableNameRequired as boolean = binaryName.Left( 3 ) <> "Mac"
		      
		      dim binary as new Kaju.BinaryInformation( executableNameRequired, data.Value( binaryName ) )
		      Binaries.Value( binaryName ) = binary
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToJSON() As JSONItem
		  dim j as JSONItem = super.ConvertToJSON
		  
		  for each binaryName as string in BinaryNames
		    dim b as Kaju.BinaryInformation = Binaries.Lookup( binaryName, nil )
		    if b isa Kaju.BinaryInformation then
		      j.Value( binaryName ) = b.ToJSON
		    end if
		  next
		  
		  return j
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  #if not TargetConsole then
		    if ImageSocket isa object then
		      ImageSocket.Disconnect
		      RemoveHandler ImageSocket.PageReceived, WeakAddressOf ImageSocket_PageReceived
		      ImageSocket = nil
		    end if
		    
		    if ReleaseNotesSocket isa object then
		      ReleaseNotesSocket.Disconnect
		      RemoveHandler ReleaseNotesSocket.PageReceived, WeakAddressOf ReleaseNotesSocket_PageReceived
		      ReleaseNotesSocket = nil
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchBinary(binaryName As String) As Kaju.BinaryInformation
		  dim binary as Kaju.BinaryInformation = Binaries.Lookup( binaryName, nil )
		  if binary is nil then
		    dim needsExecutableName as boolean = binaryName.Left( 3 ) <> "Mac"
		    
		    binary = new Kaju.BinaryInformation( needsExecutableName )
		    Binaries.Value( binaryName ) = binary
		  end if
		  
		  return binary
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetByName(propName As String) As Variant
		  dim prop as Introspection.PropertyInfo = PropInfoDictionary.Value( propName )
		  return prop.Value( self )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Private Sub ImageSocket_PageReceived(sender As Kaju.HTTPSocketAsync, url As String, httpStatus As Integer, content As String)
		  #pragma unused sender
		  #pragma unused url
		  
		  if httpStatus <> 404 and content <> "" then
		    dim p as Picture = Picture.FromData( content )
		    
		    if ImageScale > 1 then
		      p = new Picture( p.Width \ ImageScale, p.Height \ ImageScale, array( p ) )
		    end if
		    
		    mImage = p
		    RaiseEvent ImageReceived
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Private Sub ReleaseNotesSocket_PageReceived(sender As Kaju.HTTPSocketAsync, url As String, httpStatus As Integer, content As String)
		  #pragma unused sender
		  #pragma unused url
		  
		  dim raw as string = content
		  
		  if httpStatus = 404 or raw.Trim = "" then
		    //
		    // Do nothing
		    //
		    
		  else
		    //
		    // Adjust the encoding
		    //
		    
		    dim enc as TextEncoding
		    
		    //
		    // See if the html contains a charset
		    //
		    static rxCharSetFinder as RegEx
		    if rxCharSetFinder is nil then
		      rxCharSetFinder = new RegEx
		      rxCharSetFinder.SearchPattern = "<meta charset *= *[""']([^""']+)"
		    end if
		    
		    dim matchCharSet as RegExMatch = rxCharSetFinder.Search( raw )
		    if matchCharSet isa RegExMatch then
		      dim encString as string = matchCharSet.SubExpressionString( 1 ).Trim
		      try
		        enc = GetInternetTextEncoding( encString )
		      end try
		    end if
		    
		    if enc is nil then
		      enc = Encodings.UTF8
		    end if
		    raw = raw.DefineEncoding( enc )
		    
		    if raw.Trim <> "" then
		      mReleaseNotesFromURL = raw
		      RaiseEvent ReleaseNotesReceived()
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveBinary(binaryName As String)
		  if Binaries.HasKey( binaryName ) then
		    Binaries.Remove binaryName
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetByName(propName As String, Assigns value As Variant)
		  dim prop as Introspection.PropertyInfo = PropInfoDictionary.Value( propName )
		  
		  //
		  // Special case when the value is set to "yes"
		  //
		  if value.Type = Variant.TypeString and value.StringValue = "yes" and prop.PropertyType.Name = "Boolean" then
		    value = true
		  end if
		  
		  prop.Value( self ) = value
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ImageReceived()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReleaseNotesReceived()
	#tag EndHook


	#tag Property, Flags = &h0
		AppName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mReleaseNotesFromURL <> "" then
			    return mReleaseNotesFromURL
			  else
			    return mReleaseNotes
			  end if
			  
			End Get
		#tag EndGetter
		DisplayReleaseNotes As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, CompatibilityFlags = (TargetHasGUI)
		#tag Getter
			Get
			  if mImage <> nil then
			    return mImage
			  end if
			  
			  dim url as string = ImageURL.Trim
			  
			  if url = "" then
			    return nil
			  end if
			  
			  //
			  // Get the image
			  //
			  
			  if ImageSocket is nil then
			    ImageSocket = new Kaju.HTTPSocketAsync
			    AddHandler ImageSocket.PageReceived, WeakAddressOf ImageSocket_PageReceived
			  end if
			  
			  dim http as Kaju.HTTPSocketAsync = ImageSocket
			  
			  http.Get( url )
			  
			  Exception err as RuntimeException
			    mImage = nil
			    
			  Finally
			    return mImage
			    
			End Get
		#tag EndGetter
		Image As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ImageScale As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21, CompatibilityFlags = (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Private ImageSocket As Kaju.HTTPSocketAsync
	#tag EndProperty

	#tag Property, Flags = &h0
		ImageURL As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBinaries As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		MinimumRequiredVersion As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReleaseNotes As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReleaseNotesFromURL As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim binary as Kaju.BinaryInformation
			  
			  #if TargetMacOS
			    binary = Binaries.Lookup( kMacBinaryName, nil )
			    
			  #elseif TargetWindows
			    binary = Binaries.Lookup( kWindowsBinaryName, nil )
			    
			  #elseif TargetLinux
			    binary = Binaries.Lookup( kLinuxBinaryName, nil )
			    
			  #endif
			  
			  return binary
			  
			End Get
		#tag EndGetter
		PlatformBinary32bit As Kaju.BinaryInformation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim binary as Kaju.BinaryInformation
			  
			  #if TargetMacOS
			    binary = Binaries.Lookup( kMacBinaryName, nil )
			    
			  #elseif TargetWindows
			    binary = Binaries.Lookup( kWindowsBinary64Name, nil )
			    
			  #elseif TargetLinux
			    binary = Binaries.Lookup( kLinuxBinary64Name, nil )
			    
			  #endif
			  
			  return binary
			  
			End Get
		#tag EndGetter
		PlatformBinary64bit As Kaju.BinaryInformation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim b32 as Kaju.BinaryInformation = PlatformBinary32bit
			  dim b64 as Kaju.BinaryInformation = PlatformBinary64bit
			  
			  dim binary as Kaju.BinaryInformation
			  if b32 is nil and b64 is nil then
			    binary = nil
			  elseif b32 isa Kaju.BinaryInformation and b64 is nil then
			    binary = b32
			  elseif b64 isa Kaju.BinaryInformation and b32 is nil then
			    binary = b64
			  else
			    //
			    // Neither are nil so pick according to the current version
			    //
			    #if Target32Bit
			      binary = b32
			    #else
			      binary = b64
			    #endif
			  end if
			  
			  return binary
			End Get
		#tag EndGetter
		PlatformBinaryAny As Kaju.BinaryInformation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target32Bit
			    return PlatformBinary32bit
			  #elseif Target64Bit
			    return PlatformBinary64bit
			  #endif
			  
			End Get
		#tag EndGetter
		PlatformBinarySameBitness As Kaju.BinaryInformation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  static dict as Dictionary
			  if dict is nil then
			    dict = new Dictionary
			    dim ti as Introspection.TypeInfo = GetTypeInfo( Kaju.UpdateInformation )
			    dim props() as Introspection.PropertyInfo = ti.GetProperties
			    for each prop as Introspection.PropertyInfo in props
			      dict.Value( prop.Name ) = prop
			    next
			  end if
			  
			  return dict
			  
			End Get
		#tag EndGetter
		Private Shared PropInfoDictionary As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mReleaseNotes
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mReleaseNotes = value
			  
			  //
			  // The release notes might be straight HTML or them might be a URL.
			  // If the latter, the remainder will be alternate notes.
			  // This method will determine which it is and, if the latter, will
			  // attempt to fetch the notes. If it can't, it will return the alternate
			  // notes if any, or a message.
			  //
			  // The URL may start the first line followed by an EOL or may be in an
			  // HTML comment that starts the first line. The latter form will maintain
			  // better compatibility with previous versions of Kaju.
			  //
			  // Examples:
			  //
			  //  http://something.com/UpdateInformation.json
			  //
			  //  <!-- http://something.com/UpdateInformation.json -->
			  //
			  //  <!--
			  //  http://something.com/UpdateInformation.json
			  //  -->
			  //
			  
			  mReleaseNotesFromURL = ""
			  
			  static noInfoHTML as string = "<b>" + KajuLocale.kNoUpdateInfoMessage + "</b>"
			  
			  static rxURLSplitter as RegEx
			  if rxURLSplitter is nil then
			    rxURLSplitter = new RegEx
			    rxURLSplitter.SearchPattern = _
			    "(?mi-Us)\A\x20*(?|(?:(http[^\s]+)\x20*\R)|(?:<!--\s*(http[^\s]*)\s*-->))([\s\S]*)"
			  end if
			  
			  dim r as string = value
			  
			  #if not TargetConsole then
			    
			    dim matchURL as RegExMatch = rxURLSplitter.Search( value)
			    if matchURL isa RegExMatch then
			      dim url as string = matchURL.SubExpressionString( 1 ).Trim
			      dim alternateNotes as string = matchURL.SubExpressionString( 2 ).Trim
			      
			      if ReleaseNotesSocket is nil then
			        ReleaseNotesSocket = new Kaju.HTTPSocketAsync
			        AddHandler ReleaseNotesSocket.PageReceived, WeakAddressOf ReleaseNotesSocket_PageReceived
			      end if
			      
			      dim http as Kaju.HTTPSocketAsync = ReleaseNotesSocket
			      http.Get url
			      mReleaseNotes = alternateNotes
			    end if
			    
			  #endif
			  
			  if r.Trim = "" then
			    r = noInfoHTML
			  end if
			  
			  mReleaseNotes = r
			  
			End Set
		#tag EndSetter
		ReleaseNotes As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mReleaseNotesFromURL
			End Get
		#tag EndGetter
		ReleaseNotesFromURL As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21, CompatibilityFlags = (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Private ReleaseNotesSocket As Kaju.HTTPSocketAsync
	#tag EndProperty

	#tag Property, Flags = &h0
		RequiresPayment As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, CompatibilityFlags = (TargetHasGUI)
		#tag Getter
			Get
			  static rx as RegEx
			  if rx is nil then
			    rx = new RegEx
			    rx.SearchPattern = "[dab]"
			  end if
			  
			  dim match as RegExMatch = rx.Search( Version )
			  if match is nil then
			    
			    return App.Final
			    
			  else
			    
			    select case match.SubExpressionString( 0 )
			    case "d"
			      return App.Development
			    case "a"
			      return App.Alpha
			    case "b"
			      return App.Beta
			    end
			    
			  end if
			End Get
		#tag EndGetter
		StageCode As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ConvertToJSON
			End Get
		#tag EndGetter
		ToJSON As JSONItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		UseTransparency As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Version As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Kaju.VersionToDouble( Version )
			End Get
		#tag EndGetter
		VersionAsDouble As Double
	#tag EndComputedProperty


	#tag Constant, Name = kLinuxBinary64Name, Type = String, Dynamic = False, Default = \"LinuxBinary64bit", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLinuxBinaryName, Type = String, Dynamic = False, Default = \"LinuxBinary", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMacBinaryName, Type = String, Dynamic = False, Default = \"MacBinary", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowsBinary64Name, Type = String, Dynamic = False, Default = \"WindowsBinary64bit", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowsBinaryName, Type = String, Dynamic = False, Default = \"WindowsBinary", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AppName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayReleaseNotes"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Image"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageScale"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageURL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsValid"
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
			Name="MinimumRequiredVersion"
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
			Name="ReleaseNotes"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReleaseNotesFromURL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresPayment"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Group="Behavior"
			Type="Integer"
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
			Name="UseTransparency"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VersionAsDouble"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

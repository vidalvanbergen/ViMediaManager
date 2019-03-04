#tag Module
Protected Module Kaju
	#tag Method, Flags = &h1, CompatibilityFlags = (TargetHasGUI)
		Protected Function AppVersionString() As String
		  // Convenience method to return the app's version as a string
		  
		  return VersionStringFor( App.MajorVersion, App.MinorVersion, App.BugVersion, App.StageCode, App.NonReleaseVersion )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetHasGUI)
		Protected Sub CancelUpdate()
		  if AppSettings.UpdateInitiater <> nil then
		    AppSettings.UpdateInitiater.Cancel
		    AppSettings.UpdateInitiater = nil
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DeleteDSStoreRecursive(parent As FolderItem)
		  // Deletes the .DS_Store file wherever it occurs
		  
		  if parent is nil or not parent.Directory then
		    return
		  end if
		  
		  dim folderArr() as FolderItem
		  folderArr.Append parent
		  
		  dim deleteArr() as FolderItem
		  for i as integer = 0 to folderArr.Ubound
		    dim thisFolder as FolderItem = folderArr( i )
		    dim thisFolderCnt as integer = thisFolder.Count
		    for fileIndex as integer = 1 to thisFolderCnt
		      dim subFile as FolderItem = thisFolder.Item( fileIndex )
		      if subFile.Directory then
		        folderArr.Append subFile
		      elseif subFile.Name = ".DS_Store" then
		        deleteArr.Append subFile
		      end if
		    next
		  next
		  
		  for each f as FolderItem in deleteArr
		    f.Delete
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DeleteRecursive(f As FolderItem)
		  if f is nil or not f.Exists or not f.IsWriteable then
		    return
		  end if
		  
		  if f.Directory then
		    
		    dim files() as FolderItem
		    dim folders() as FolderItem
		    
		    dim cnt as integer = f.Count
		    for i as integer = 1 to cnt
		      dim thisItem as FolderItem = f.Item( i )
		      if thisItem.Directory then
		        folders.Append thisItem
		      else
		        files.Append thisItem
		      end if
		    next
		    
		    for each fldr as FolderItem in folders
		      DeleteRecursive( fldr )
		    next
		    
		    for each file as FolderItem in files
		      file.Delete
		    next
		    
		  end if
		  
		  f.Delete
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DidLastUpdateFail() As Boolean
		  dim marker as string = kSwitchUpdateFailed
		  dim args as string = System.CommandLine
		  dim pos as integer = args.InStrB( marker )
		  return pos <> 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DidLastUpdateSucceed(ByRef fromVersion As String, ByRef fromBits As Kaju.BitTypes) As Boolean
		  dim switchMarker as string = kSwitchUpdateSucceeded
		  dim args as string = System.CommandLine
		  
		  dim pos as integer = args.InStrB( switchMarker )
		  
		  if pos <> 0 then
		    fromVersion = args.MidB( pos + switchMarker.LenB + 1 )
		    fromVersion = fromVersion.Trim
		    
		    //
		    // Get the bits
		    //
		    dim bitMarkers() as string = array( kBitMarker32Bit, kBitMarker64Bit )
		    dim bitTypes() as Kaju.BitTypes = array( Kaju.BitTypes.Bits32, Kaju.BitTypes.Bits64 )
		    
		    fromBits = Kaju.BitTypes.Unknown // Assume this
		    for i as integer = 0 to bitMarkers.Ubound
		      dim bitMarker as string = bitMarkers( i )
		      if fromVersion.RightB( bitMarker.LenB ) = bitMarker then
		        fromBits = bitTypes( i )
		        fromVersion = fromVersion.LeftB( fromVersion.LenB - bitMarker.LenB )
		        exit for i
		      end if
		    next
		    
		    return true
		  else
		    return false
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetTemporaryFolder() As FolderItem
		  dim f as FolderItem = GetTemporaryFolderItem
		  f.Delete
		  f.CreateAsFolder
		  return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HashOfFile(f As FolderItem) As String
		  if f is nil or not f.IsReadable then
		    return ""
		  end if
		  
		  dim bs as BinaryStream = BinaryStream.Open( f )
		  
		  const kBlock = 1000000
		  
		  dim hasher as new MD5Digest
		  
		  while not bs.EOF
		    dim chunk as string = bs.Read( kBlock )
		    hasher.Process( chunk )
		  wend
		  
		  return EncodeHex( hasher.Value )
		  
		  Exception err as RuntimeException
		    return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsWriteableRecursive(parent As FolderItem) As Boolean
		  // Checks every file and folder to make sure it's writeable starting at parent
		  
		  if parent is nil then
		    return false
		  end if
		  
		  if not parent.Directory or not parent.IsWriteable then
		    return parent.IsWriteable
		  end if
		  
		  dim r as boolean = true // Assume it's all writeable
		  
		  dim folders() as FolderItem
		  folders.Append parent
		  
		  for folderIndex as integer = 0 to folders.Ubound
		    dim thisFolder as FolderItem = folders( folderIndex )
		    
		    dim folderCnt as integer = thisFolder.Count
		    for itemIndex as integer = 1 to folderCnt
		      dim f as FolderItem = thisFolder.Item( itemIndex )
		      if not f.IsWriteable then
		        r = false
		        exit for folderIndex
		      end if
		      
		      if f.Directory then
		        folders.Append f
		      end if
		    next itemIndex
		  next folderIndex
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub JSONToProperties(data As JSONItem, target As Object)
		  // Stores the values in the JSON object to the matching property in the object.
		  // Will only handle basic types, not objects.
		  
		  dim ti as Introspection.TypeInfo = Introspection.GetType( target )
		  dim props() as Introspection.PropertyInfo = ti.GetProperties()
		  
		  for each prop as Introspection.PropertyInfo in props
		    if prop.CanWrite then
		      dim name as string = prop.Name
		      if data.HasName( name ) then
		        dim v as variant = data.Value( name )
		        if not ( v IsA JSONItem ) then
		          prop.Value( target ) = v
		        end if
		      end if
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetHasGUI)
		Protected Sub StartUpdate(initiater As Kaju.UpdateInitiater)
		  AppSettings.UpdateInitiater = initiater
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TrueExecutableFile() As FolderItem
		  dim r as FolderItem = App.ExecutableFile
		  
		  #if TargetMacOS then
		    
		    r = r.Parent
		    while r.Name <> "Contents"
		      r = r.Parent
		    wend
		    
		    r = r.Parent
		    
		  #endif
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetHasGUI)
		Protected Function VersionStringFor(majorVersion As Integer, minorVersion As Integer, bugVersion As Integer) As String
		  return VersionStringFor( majorVersion, minorVersion, bugVersion, App.Final, 0 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetHasGUI)
		Protected Function VersionStringFor(majorVersion As Integer, minorVersion As Integer, bugVersion As Integer, stageCode As Integer, nonReleaseVersion As Integer) As String
		  dim parts() as string
		  parts.Append str( majorVersion )
		  parts.Append str( minorVersion )
		  if bugVersion > 0 then
		    parts.Append str( bugVersion )
		  end if
		  dim version as string = join( parts, "." )
		  
		  if stageCode = App.Final then
		    
		    if nonReleaseVersion > 0 then
		      version = version + " (" + str( nonReleaseVersion ) + ")"
		    end if
		    
		  else
		    
		    select case stageCode
		    case App.Development
		      version = version + "d"
		    case App.Alpha
		      version = version + "a"
		    case App.Beta
		      version = version + "b"
		    end
		    version = version + str( nonReleaseVersion )
		  end if
		  
		  return version
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VersionToDouble(version As String) As Double
		  // Takes a version and turns it into an double that can be compared.
		  // Assumes that the version will have no more than 3 parts
		  // (NN.NN.NN) and each part will max out at 999. The version
		  // may trail with a development, alpha, or beta suffix, and that
		  // part will max out at 999. If a final, it may trail with a build
		  // number.
		  //
		  // Examples:
		  //  1.2
		  //  1.1.1
		  //  1.2b4
		  //  1.3a16
		  //  1.3d343
		  //  1.99.9a101
		  //  1.1.0 (254)
		  
		  if version = "" then
		    return 0.0
		  end if
		  
		  static rx as RegEx
		  if rx is nil then
		    rx = new RegEx
		    rx.SearchPattern = "(?mi-Us)^([\d.]+)(?|([dab])(\d+)|( )\((\d+)\))?$"
		  end if
		  
		  dim match as RegExMatch = rx.Search( version )
		  if match is nil then // Something is wrong
		    raise new KajuException( "Version is not properly formatted: " + version, CurrentMethodName )
		  end if
		  
		  version = match.SubExpressionString( 1 ) // Everything except the non-release data
		  
		  dim nonReleaseType as string
		  dim nonRelease as string
		  if match.SubExpressionCount > 2 then
		    nonReleaseType = match.SubExpressionString( 2 )
		    nonRelease = match.SubExpressionString( 3 )
		  end if
		  
		  //
		  // Do the conversion
		  //
		  
		  dim parts() as string = version.Split( "." )
		  redim parts( 2 )
		  
		  dim r as double
		  for i as integer = 0 to parts.Ubound
		    dim thisPart as string = parts( i )
		    dim thisPartVal as double = thisPart.Val
		    r = ( r * 1000.0 ) + thisPartVal
		  next
		  
		  const kDivider = 10000.0
		  select case nonReleaseType
		  case "d"
		    r = r + ( nonRelease.Val / kDivider )
		  case "a"
		    r = r + 0.1 + ( nonRelease.Val / kDivider )
		  case "b"
		    r = r + 0.2 + ( nonRelease.Val / kDivider )
		  else // Release
		    r = r + 0.4 + ( nonRelease.Val / kDivider )
		  end
		  
		  return r
		  
		End Function
	#tag EndMethod


	#tag Note, Name = License
		
		The MIT License (MIT)
		
		Copyright (c) 2014 by Kem Tekinay. All rights reserved.
		
		Permission is hereby granted, free of charge, to any person obtaining a copy
		of this software and associated documentation files (the "Software"), to deal
		in the Software without restriction, including without limitation the rights
		to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
		copies of the Software, and to permit persons to whom the Software is
		furnished to do so, subject to the following conditions:
		
		The above copyright notice and this permission notice shall be included in all
		copies or substantial portions of the Software.
		
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
		AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
		LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
		OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
		SOFTWARE.
		
	#tag EndNote


	#tag Constant, Name = kBitMarker32Bit, Type = String, Dynamic = False, Default = \"_32-bit", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBitMarker64Bit, Type = String, Dynamic = False, Default = \"_64-bit", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kNameSecurityToken, Type = String, Dynamic = False, Default = \"Security Token", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSwitchUpdateFailed, Type = String, Dynamic = False, Default = \"--kaju-fail", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSwitchUpdateSucceeded, Type = String, Dynamic = False, Default = \"--kaju-success", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUpdatePacketMarker, Type = String, Dynamic = False, Default = \"KAJU ", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Version, Type = String, Dynamic = False, Default = \"2.1", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = BitTypes, Type = Integer, Flags = &h1
		Unknown=0
		  Bits32
		Bits64
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

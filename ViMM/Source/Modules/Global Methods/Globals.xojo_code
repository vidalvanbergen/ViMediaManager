#tag Module
Protected Module Globals
	#tag Method, Flags = &h0
		Sub Anonymouse(ByRef Sckt as HTTPSocket, Mac as Boolean = False)
		  
		  Dim rand as New Random
		  Dim IP as String = Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) ) + "." + Str( rand.InRange(0,255) )
		  Sckt.SetRequestHeader( "httpheader", "REMOTE_ADDR: " + IP )
		  If NOT Mac Then
		    Sckt.SetRequestHeader( "User-agent", "Mozilla/" + Str( rand.InRange(3,5) ) + "." + Str( rand.InRange(0,3) ) + " (Windows NT " + Str( rand.InRange(3,5) ) + "." + Str( rand.InRange(0,2) ) + "; rv:2.0.1) Gecko/20100101 Firefox/" + Str( rand.InRange(3,5) ) + ".0.1" )
		  Else
		    Sckt.SetRequestHeader( "User-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Safari/8536.25" )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BytesToString(Bytes As Variant, Format as String = "#.00") As String
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  Dim OneByte as Integer = 1024
		  #If TargetMacOS Then OneByte = 1000
		  
		  Dim Result as String
		  
		  Select Case Bytes
		    
		  Case Is >= Pow( OneByte, 4 )
		    Result = Format( Bytes/Pow( onebyte, 4 ), Format ) + " TB"
		  Case Is >= Pow( OneByte, 3 )
		    Result = Format( Bytes/Pow( onebyte, 3 ), Format ) + " GB"
		  Case Is >= OneByte * OneByte
		    Result = Format( Bytes/Pow( onebyte, 2 ), Format ) + " MB"
		  Case Is  >= OneByte
		    Result = Format( Bytes/onebyte, Format ) + " KB"
		  Else
		    Result = Format( Bytes, "###" ) + " Bytes"
		    
		  End Select
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Contains(Extends source As string, Find As string) As boolean
		  if source.InStr( Find ) > 0 Then Return True
		  
		  Return False
		  
		  ' no more need for integer check on InStr() but just a boolean if found more then 0 items
		  ' This function was made by: "relaht" (originally)
		  
		  
		  ' From original post...
		  //if header.Contains( ".gif") then
		  //is the same as if Instr( header, ".gif" ) > 0 then
		  
		  ' this inspired me to write the same for DutchTools
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CURLGet(URL as String) As String
		  dim sh as new Shell
		  sh.Execute "curl -s """ + URL + """"
		  
		  Return sh.Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeHTML(Extends HTMLString as String) As String
		  Return DecodeHTML(  HTMLString )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeHTML(HTMLString as String) As String
		  
		  // Simplify quotes
		  HTMLString = HTMLString.ReplaceAll( "“", """" )
		  HTMLString = HTMLString.ReplaceAll( "”", """" )
		  HTMLString = HTMLString.ReplaceAll( "‘", "'" )
		  HTMLString = HTMLString.ReplaceAll( "’", "'" )
		  HTMLString = HTMLString.ReplaceAll( "&#39;", "'" )
		  HTMLString = HTMLString.ReplaceAll( "&quot;", """" )
		  HTMLString = HTMLString.ReplaceAll( "â€™", "'" )
		  'HTMLString = HTMLString.ReplaceAll( "‚Äî", "—" )
		  'HTMLString = HTMLString.ReplaceAll("&mdash;", "—")
		  
		  HTMLString = HTMLString.ReplaceAll( "<br />", EndOfLine )
		  HTMLString = HTMLString.ReplaceAll( "<br/>", EndOfLine )
		  HTMLString = HTMLString.ReplaceAll( "<br /]", EndOfLine ) // I don't even...
		  
		  Return HTMLString.UnescapeHTML
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteWithAppleEvent(TheFile as FolderItem)
		  If TheFile = Nil OR NOT TheFile.Exists Then Return
		  
		  Dim Path as String = DefineEncoding( TheFile.AbsolutePath, Encodings.UTF8 )
		  Path = Path.ReplaceAll("'", "'\''")
		  'Path = Path.ReplaceAll("é", "\é")
		  
		  #If TargetMacOS Then
		    Dim ae as AppleEvent
		    Dim obj as AppleEventObjectSpecifier
		    ae = NewAppleEvent( "core", "delo", "MACS" )
		    obj = GetNamedObjectDescriptor( "cobj", nil, path )
		    ae.ObjectSpecifierParam("----") = obj
		    If Not ae.send() Then MessageBox "Couldn't delete file using apple event"
		  #EndIf
		  
		  TheFile = TheFile.Parent.Child( TheFile.Name )
		  'If DebugBuild And TheFile <> Nil And TheFile.Exists Then MessageBox "Couldn't delete file" + EndOfLine + EndOfLine + Path
		  
		  
		  // Back-up
		  'Dim f as FolderItem = GetFolderItem( Path.ReplaceAll("'\''", "'") )
		  If TheFile <> Nil And TheFile.Exists Then
		    If TheFile.ParentVolume = App.ExecutableFile.ParentVolume Then
		      TheFile.MoveFileTo SpecialFolder.Trash
		    Else
		      TheFile.Delete
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub echo(Message as String, f as FolderItem = Nil)
		  If NOT DebugBuild Then Return
		  
		  If f = Nil Then f = SpecialFolder.Desktop.Child( "debug.txt" )
		  
		  Dim s as New Shell
		  Dim exe as String = "echo """ + Message + """ >> " + f.ShellPath
		  
		  s.Execute exe
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileMD5(folderfile as FolderItem) As string
		  Dim f as FolderItem
		  Dim b as BinaryStream
		  Dim s as String
		  
		  Dim d as new MD5Digest
		  
		  f = folderfile
		  
		  If f = Nil Then Return "Nil"
		  
		  If f.IsReadable = false And f.IsWriteable = False Then
		    Return "Protected File"
		  Else
		    b=f.OpenAsBinaryFile(False)
		    
		    While NOT b.eof
		      s=b.Read(1000000)
		      d.Process s
		      app.DoEvents
		    Wend
		    Return EncodeHex(d.Value)
		  End if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FolderError(Extends TheItem as FolderItem) As Boolean
		  
		  Dim ItemName as String
		  If TheItem <> Nil Then ItemName = TheItem.Name
		  
		  If TheItem.LastErrorCode > 0 Then
		    Dim Error as String
		    
		    Select Case TheItem.LastErrorCode
		      
		    Case TheItem.DestDoesNotExistError
		      Error = "Destination does not exist." // You will get this error only on CopyFileTo and MoveFileTo.
		    Case TheItem.FileNotFound
		      Error = "The File was not found."
		    Case TheItem.AccessDenied
		      Error = "Access was denied."
		    Case TheItem.NotEnoughMemory
		      Error = "You ran out of memory."
		    Case TheItem.FileInUse
		      Error = "The file is in use."
		    Case TheItem.InvalidName
		      Error = "You used an Invalid name."
		      
		    Else
		      Error = Str( TheItem.LastErrorCode )
		    End Select
		    
		    Log( Trim( ItemName + " Error Code: " + Str( TheItem.LastErrorCode ) + EndOfLine + Error ) )
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hash(f as FolderItem, Routine as String = "Video") As String
		  // OpenSubtitles.org
		  // Hash code is based on  Media Player Classic. In natural language it calculates: size + 64bit chksum of the first and last 64k
		  // (even if they overlap because the file is smaller than 128k).
		  // On opensubtitles.org is movie file size limited to 9000000000 > $moviebytesize > 131072 bytes, if is there any reason to change these sizes, let us know.
		  // Licence of  hashing source codes is  GPL. Source codes was tested on Little Endian - DEC, Intel and compatible
		  
		  // http://trac.opensubtitles.org/projects/opensubtitles/wiki/HashSourceCodes
		  
		  dim b as BinaryStream
		  dim mb as MemoryBlock
		  
		  dim hash,bytesize as UINT64
		  dim i, x, chunksize, filelen, difference as integer
		  dim myhash as String
		  
		  hash = 0 //Reset Hash
		  difference = 0
		  
		  if f <> nil and f.Exists And f.Length > 0 then
		    b= f.OpenAsBinaryFile
		    hash = b.Length
		    bytesize = b.Length
		    Dim bytesizestr as String = str(bytesize)
		    
		    if bytesize >= 65536 and routine = "video" then
		      chunksize = 65536
		      mb = b.Read(65536)
		      mb.LittleEndian = True
		      
		      for i= 0 to chunksize -1 step 8
		        hash = hash+ mb.UINT64Value(i)
		      next
		      
		      b.Position = max(b.Length-chunksize, 0)
		      mb= b.Read(chunksize)
		      mb.LittleEndian = True
		      
		      for i= 0 to chunksize -1 step 8
		        hash = hash+ mb.UINT64Value(i)
		      next
		      
		      
		      myhash = Lowercase(str(hex(hash)))
		      
		    elseif routine = "subtitle" then
		      
		      dim c,result as string
		      mb = md5(b.Read(b.Length))
		      mb.LittleEndian = True
		      
		      for i = 0 to mb.size-1
		        x = mb.byte( i )
		        c = right( "00"+hex( x ), 2 )
		        result = result + c
		      next
		      result = lowercase( result )
		      myhash = result
		      
		    end If
		  End If
		  
		  Return MyHash
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTTPGet(URL as String, RandomIP as Boolean = False) As String
		  dim sckt as New HTTPSocket
		  sckt.Yield = True
		  
		  // Set header information IP/User-Agent
		  if RandomIP then
		    dim r as New Random
		    sckt.SetRequestHeader( "REMOTE_ADDR", Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) + "." + Str( r.InRange(0, 255) ) )
		  end if
		  
		  'sckt.SetRequestHeader("Accept-Encoding", "gzip, deflate, sdch")
		  sckt.SetRequestHeader("Accept-Language", "en-US,en;q=0.8,nl-NL;q=0.6,nl;q=0.4")
		  sckt.SetRequestHeader("X-Requested-With", "XMLHttpRequest")
		  sckt.SetRequestHeader("X-Prototype-Version", "1.7.1")
		  sckt.SetRequestHeader("DNT", "1")
		  sckt.SetRequestHeader("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.2 Safari/605.1.15")
		  sckt.SetRequestHeader("Connection", "keep-alive")
		  sckt.SetRequestHeader("Accept", "text/html,text/javascript,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		  
		  
		  // Get content
		  dim Content as String = sckt.Get( URL, 120 )  'Trim( DefineEncoding( sckt.Get( URL, 60 ), Encodings.UTF8 ) )
		  
		  // unzip GZIPped page
		  if sckt.PageHeaders <> Nil and sckt.PageHeaders.Source <> "" and sckt.PageHeaders.Source.Contains( "Content-Encoding: gzip" ) then
		    dim gzipstring as new _gzipstring
		    Content = gzipstring.Decompress( Content )
		  end if
		  
		  Content = DefineEncoding( Content, Encodings.UTF8 )
		  Content = Trim( Content )
		  
		  
		  // Redirected
		  if sckt <> Nil and sckt.HTTPStatusCode = 301 and sckt.PageHeaders <> Nil then
		    URL = sckt.PageHeaders.Value( "Location" )
		    Content = trim( DefineEncoding( sckt.Get( URL, 60 ), Encodings.UTF8 ) )
		  end if
		  
		  sckt.Close
		  sckt = Nil // Destroy socket
		  
		  Return Content
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTTPGetImage(URL as String) As Picture
		  dim memblock as string = HTTPGet( URL )
		  if memblock <> "" then
		    Return Picture.FromData( memblock )
		  else
		    log "HTTPGetImage( " + URL + ") :: Couldn't fetch image."
		    Return Nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InRange(Extends Value as Double, Min as Double = 1, Max as Double = 32767) As Boolean
		  
		  If Value > Min And Value < Max Then Return True
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsDarkMode() As Boolean
		  #if TargetMacOS
		    // See https://developer.apple.com/documentation/appkit/nsappearance
		    Declare Function NSClassFromString Lib "Foundation" (classname As CFStringRef) As Ptr
		    Declare Function NSAppearanceCurrentApperance Lib "Foundation" Selector "currentAppearance" (classname As Ptr) As Ptr
		    Declare Function NSAppearanceName Lib "Foundation" Selector "name" (obj As Ptr) As CFStringRef
		    dim nsa as Ptr = NSClassFromString("NSAppearance")
		    dim currentAppearance as Ptr = NSAppearanceCurrentApperance(nsa)
		    if currentAppearance <> nil then
		      dim name as string = NSAppearanceName(currentAppearance)
		      if name = "NSAppearanceNameDarkAqua" then
		        return true
		      end if
		    end if
		    return false
		  #else
		    return false
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFile(Extends f as FolderItem) As Boolean
		  Return ( f <> Nil And f.Exists And NOT f.Directory )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFolder(Extends f as FolderItem) As Boolean
		  Return ( f <> Nil And f.Exists And f.Directory )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFolderItem(Extends f as FolderItem) As Boolean
		  Return ( f <> Nil And f.Exists )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLowerCase(Extends s As string) As boolean
		  ' return a Boolean to the user.
		  if asc(s) >= 65 and asc(s) <= 90 then
		    ' we have no Lowercase string here, so return False
		    return false
		  elseif asc(s) >= 97 and asc(s) <= 122 then
		    ' we have a Lowercase string, so return True
		    return true
		  end if
		  
		  ' this function is made by: "serd83"
		  ' search for "IsLowerCase" on te forums to find original post
		  
		  ' updated to "Extends", with thanks to "Jason_Addams" for the suggestion.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LabelIndexGet(ForItem as FolderItem) As Integer
		  Dim ae As AppleEvent
		  
		  Dim file As AppleEventObjectSpecifier
		  Dim myPath as string
		  
		  
		  If ForItem = Nil then return 0
		  ae = NewAppleEvent( "core", "getd", "MACS" ) // The "Get" apple event
		  myPath = ForItem.AbsolutePath
		  
		  file = GetNamedObjectDescriptor( "alis", Nil, myPath ) //"Converts" a file to an AppleEvent object
		  
		  ae.ObjectSpecifierParam( "----" ) = GetPropertyObjectDescriptor( file, "labi" ) //This references the label index property of the "file" object.
		  
		  If NOT ae.Send then
		  End If
		  
		  Return ae.ReplyInteger
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LabelIndexSet(ForItem as Folderitem, LabelIndex as Integer)
		  // 0 = Clear
		  // 1 = Orange
		  // 2 = Red
		  // 3 = Yellow
		  // 4 = Blue
		  // 5 = Purple
		  // 6 = Green
		  // 7 = Gray
		  
		  Dim ae As AppleEvent
		  Dim f As FolderItem
		  Dim file As AppleEventObjectSpecifier
		  Dim myPath as string
		  Dim o As AppleEventObjectSpecifier
		  
		  If ForItem = Nil then Return
		  ae = NewAppleEvent( "core", "setd", "MACS" ) //The "Set" apple event
		  myPath = ForItem.AbsolutePath
		  
		  file = GetNamedObjectDescriptor( "alis", Nil, myPath ) //"Converts" a file to an AppleEvent object
		  
		  ae.ObjectSpecifierParam( "----" ) = GetPropertyObjectDescriptor( file, "labi" ) //This references the label index property of the "file" object.
		  
		  ae.IntegerParam("data") = LabelIndex //The label index
		  If Not ae.Send Then
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeadingZero(i as Integer, Len as Integer = 2) As String
		  Dim Lead as String = Str( i )
		  
		  While Lead.Len < Len
		    Lead = "0" + Lead
		  Wend
		  
		  Return Lead
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Log(Message as String, LogLevel as Integer = 1003)
		  System.Log LogLevel, Message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function match(SrchPattern as String, Source as String, i as Integer = 0) As String
		  Dim rg as New RegEx
		  Dim myMatch as RegExMatch
		  rg.Options.DotMatchAll = True
		  rg.SearchPattern = SrchPattern
		  myMatch = rg.search( Source )
		  
		  #if DebugBuild then
		    Dim Debug() as String
		    If myMatch <> Nil Then
		      For n as Integer = 0 to myMatch.SubExpressionCount -1
		        Debug.Append myMatch.SubExpressionString(n)
		      Next
		    End If
		    
		  #endif
		  
		  If myMatch <> Nil And myMatch.SubExpressionCount -1 >= i Then
		    Return Trim( myMatch.SubExpressionString(i) )
		  End if
		  
		  Exception err as RegExException
		    MsgBox err.message
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function match_all(SrchPattern as String, Source as String, i as Integer = 1) As String()
		  Dim myRegEx As new RegEx
		  Dim myMatch As RegExMatch
		  myRegEx.Options.TreatTargetAsOneLine = True
		  myRegEx.Options.DotMatchAll = True
		  myRegEx.SearchPattern = SrchPattern
		  myRegEx.ReplacementPattern = ""
		  
		  
		  Dim Results() as String
		  
		  Dim Debug() as String
		  
		  // Pop up all matches one by one
		  myMatch = myRegEx.Search( Source )
		  While myMatch <> Nil
		    
		    #if DebugBuild then
		      For n as Integer = 0 to myMatch.SubExpressionCount - 1
		        Debug.Append trim( myMatch.SubExpressionString(n) )
		      Next
		    #endif
		    
		    if myMatch.SubExpressionCount -1 >= i then
		      Results.Append Trim( myMatch.SubExpressionString(i) )
		    End If
		    
		    Source = myRegEx.Replace( Source )
		    myMatch = myRegEx.Search()
		  Wend
		  
		  Return Results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MsgDlg(w as Window, Type as Integer = 1, headerText as String, subText as String, okCaption as String, cancelCaption as String, otherCaption as String = "") As Integer
		  Dim Msg as New MessageDialog    // Declare the MessageDialog object
		  Dim dlgBtn as MessageDialogButton    // For handling the result
		  Msg.Icon = Type    // Display warning icon
		  
		  // OK Button
		  Msg.ActionButton.Caption = okCaption
		  
		  // Show the "Cancel" button if available
		  If cancelCaption <> "" Then
		    Msg.CancelButton.Caption = cancelCaption
		    Msg.CancelButton.Visible = True
		  End If
		  
		  // Show the "Alternate" button if available
		  If otherCaption <> "" Then
		    Msg.AlternateActionButton.Caption = otherCaption
		    Msg.AlternateActionButton.Visible = True
		  End If
		  
		  Msg.Message = headerText
		  Msg.Explanation = subText
		  
		  If w <> Nil Then dlgBtn = Msg.ShowModalWithin(w) Else dlgBtn = Msg.ShowModal
		  Select Case dlgBtn
		  Case Msg.ActionButton
		    Return 1
		  Case Msg.AlternateActionButton
		    Return 3
		  Case Msg.CancelButton
		    Return 2
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MyMid(Extends Source as String, StartStr as String, EndStr as String, Start as Integer = 0) As String
		  Dim sx1, sx2 as Integer
		  
		  sx1 = Source.InStr( Start, StartStr ) + StartStr.Len
		  sx2 = Source.InStr( sx1, EndStr )
		  
		  Return Source.Mid( sx1, sx2 - sx1 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NameExtension(Extends TheFile as FolderItem) As String
		  Dim FileName      as String = TheFile.Name
		  Dim FileSplit()   as String = FileName.Split(".")
		  Dim FileExtension as String = FileSplit( FileSplit.Ubound )
		  
		  Return FileExtension
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NameWithoutExtension(Extends TheFile as FolderItem) As String
		  Dim FileName      as String = TheFile.Name
		  Dim FileSplit()   as String = FileName.Split(".")
		  Dim FileExtension as String = FileSplit( FileSplit.Ubound )
		  
		  Return FileName.Left( FileName.Len - ( FileExtension.Len + 1 ) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Occurs(Extends cSearchWithin As String, cSearchFor As string) As integer
		  '---  FINDS THE NUMBER OF OCCURENCES OF A STRING WITHIN ANOTHER STRING
		  '---  USES THE NATIVE INSTR() FUNCTION
		  '---  CASE INSENSITIVE
		  '---
		  '---  Syntax:  if Occurs(cSearchFor As String,cSearchWithin As String) > 0 then
		  
		  dim x as Integer = 0
		  dim nStart As Integer = 1
		  dim nFound as Integer = 0
		  
		  while nStart < len(cSearchWithin)
		    x = instr(nStart,cSearchWithin, cSearchFor)
		    if x > 0 then
		      nFound = nFound + 1
		      nStart = x + 1
		    Else
		      Exit
		    end
		  wend
		  
		  Return nFound
		  
		  ' Gave it string extention functionallity:
		  
		  ' Use as function: Syntax:  if Occurs(cSearchFor As String,cSearchWithin As String) > 0 then
		  
		  ' Or use as extention of string:
		  ' Dim s as String
		  ' if s.Occours(cSearchFor As string) > 0 then
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentVolume(Extends TheFile as FolderItem) As FolderItem
		  Dim Path as String = TheFile.ShellPath.ReplaceAll("\","")
		  If Path.InStr( 0, "volume" ) > 0 Then
		    Dim Pathways() as String = Path.Split("/")
		    If Pathways.Ubound > 1 Then Return GetFolderItem( "/" + Pathways(1) + "/" +  Pathways(2), FolderItem.PathTypeShell )
		  Else
		    Return GetFolderItem( SpecialFolder.Mount.ShellPath + "/" + SpecialFolder.Mount.AbsolutePath.NthField(":",1), FolderItem.PathTypeShell )
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureToHTML(MyPic As Picture) As String
		  Dim s As String = MyPic.GetData(Picture.FormatPNG)
		  s = "<img src='data:image/png;base64," + EncodeBase64(s) + "' width=" + Str(MyPic.Width) + " height=" + Str(MyPic.Height) + " />"
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureToURL(MyPic As Picture) As String
		  Dim s As String = MyPic.GetData(Picture.FormatPNG)
		  s = "data:image/png;base64," + EncodeBase64(s)
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadTextFile(f as FolderItem) As String
		  If f = Nil OR NOT f.Exists Then Return ""
		  
		  Dim TextIn as TextInputStream
		  TextIn = TextIn.Open( f )
		  Dim Content as String = TextIn.ReadAll
		  TextIn.Close
		  
		  Return Content
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RegExResult(Source as String, SrchPattern as String) As String
		  Dim rg as New RegEx
		  Dim myMatch as RegExMatch
		  rg.Options.DotMatchAll = True
		  rg.SearchPattern = SrchPattern
		  myMatch = rg.search( Source )
		  
		  
		  
		  If myMatch <> Nil Then
		    Return myMatch.SubExpressionString(0)
		  Else
		    Return ""
		  End if
		  
		  Exception err as RegExException
		    MsgBox err.message
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RegExResults(Source as String, SrchPattern as String) As String()
		  Dim rg as New RegEx
		  Dim myMatch as RegExMatch
		  rg.Options.DotMatchAll = True
		  rg.SearchPattern = SrchPattern
		  myMatch = rg.search( Source )
		  
		  Dim Results() as String
		  
		  If myMatch <> Nil Then
		    For i as Integer = 0 to myMatch.SubExpressionCount - 1
		      Results.Append myMatch.SubExpressionString(i)
		    Next
		  End if
		  
		  Return Results
		  
		  
		  Exception err as RegExException
		    MsgBox err.message
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RegExThis(Source as String, SrchPattern as String, RplcPattern as String = "") As String
		  // RegEx
		  Dim myRegEx As new RegEx
		  Dim myMatch As RegExMatch
		  myRegEx.Options.TreatTargetAsOneLine = True
		  myRegEx.Options.DotMatchAll = True
		  myRegEx.SearchPattern = SrchPattern
		  myRegEx.ReplacementPattern = RplcPattern
		  
		  // Pop up all matches one by one
		  myMatch = myRegEx.Search( Source )
		  While myMatch <> Nil
		    Source = myRegEx.Replace( Source )
		    myMatch = myRegEx.Search()
		  Wend
		  
		  Return Source
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload(Extends cvs as Canvas, eraseBackground as Boolean = True)
		  
		  #If TargetCocoa Then
		    cvs.Invalidate( eraseBackground )
		    Return
		  #ElseIf TargetCarbon Then
		    cvs.Refresh( eraseBackground )
		    Return
		  #EndIf
		  
		  cvs.Invalidate( eraseBackground )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveDuplicatesFromArray(aList() as String) As String()
		  For i as Integer = 0 to aList.Ubound
		    For n as Integer = i + 1 to aList.Ubound
		      If aList(i) = aList(n) Then aList.Remove(n)
		    Next n
		  Next i
		  
		  For i as Integer = 0 to aList.Ubound
		    For n as Integer = i + 1 to aList.Ubound
		      If aList(i) = aList(n) Then aList.Remove(n)
		    Next n
		  Next i
		  
		  Return aList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveLinks(Content as String) As String
		  // RegEx
		  Dim myRegEx As new RegEx
		  Dim myMatch As RegExMatch
		  myRegEx.Options.TreatTargetAsOneLine = True
		  myRegEx.SearchPattern = "<a href=[\x21-\x7E]*\>"
		  myRegEx.ReplacementPattern = ""
		  
		  // Pop up all matches one by one
		  myMatch = myRegEx.Search( content )
		  While myMatch <> Nil
		    content = myRegEx.Replace( content )
		    myMatch = myRegEx.Search()
		  Wend
		  content = content.ReplaceAll( "</a>", "" )
		  
		  Return Content
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveImage(img As Picture, TheFile as FolderItem, Type as FileType, Quality as Integer = 65)
		  If img = Nil Then Return
		  
		  If Type = FileTypes.ImageJpeg Then
		    If TheFile <> Nil Then TheFile.Name = TheFile.NameNoExtension + ".jpg"
		    img.Save( TheFile, Picture.SaveAsJPEG, Quality )'Picture.QualityHigh )
		  ElseIf Type = FileTypes.ImagePng  Then
		    If TheFile <> Nil Then TheFile.Name = TheFile.NameNoExtension + ".png"
		    img.Save( TheFile, Picture.SaveAsPNG, Quality )'Picture.QualityMax )
		  End If
		  
		  If TheFile.LastErrorCode <> 0 Then Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveText(SaveLocation as FolderItem, Text as String)
		  If SaveLocation IsA object Then
		    Dim TextOut as TextOutputStream = TextOutputStream.Create( SaveLocation )
		    TextOut.Write Text
		    TextOut.Close
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScalingFactor(w as window) As Single
		  'Return 2
		  // The ScalingFactor is 2 for a retina MacBook Pro (or other HiDPI modes) and 1 for anything else.
		  If NOT IsMountainLion Then Return 1
		  
		  #If TargetCocoa Then
		    Declare Function BackingScaleFactor Lib "AppKit" Selector "backingScaleFactor" (target As WindowPtr) as Double
		    Return BackingScaleFactor(w)
		  #Else
		    Return 1
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelCol(Extends LstBox as Listbox, Collumn as Integer) As String
		  If LstBox.ListIndex = -1 Then Return ""
		  
		  Return LstBox.Cell( LstBox.ListIndex, Collumn )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShareFaceBookLink(URL as String, Title as String)
		  Dim s as string = "http://www.facebook.com/sharer.php?u=@URL&t=@Title"
		  s = s.ReplaceAll("@URL", URL)
		  s = s.ReplaceAll("@Title", Title)
		  
		  ShowURL s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShareTweet(Message as String, ScreenName as String = "")
		  'Dim s as String = "https://twitter.com/intent/tweet?original_referer=https%3A%2F%2Ftwitter.com%2Fabout%2Fresources%2Fbuttons&screen_name=@support&source=tweetbutton&text=$Message"
		  Dim s as String = "https://twitter.com/intent/tweet?source=ViMediaManager&screen_name=@support&text=$Message"
		  
		  s = s.ReplaceAll( "@Support", ScreenName )
		  s = s.ReplaceAll( "$Message", Message.ReplaceAll( " ", "%20" ) )
		  
		  ShowURL s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShellCommand(Command as String) As String
		  dim sh as New Shell
		  sh.Execute(Command)
		  
		  if sh.ErrorCode = 0 then
		    return sh.ReadAll
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowInFinder(Extends f as Folderitem)
		  
		  If f = Nil or NOT f.Exists Then Return
		  'If f.AbsolutePath = SpecialFolder.Desktop.AbsolutePath Then Return
		  
		  Dim MyShell as New Shell
		  Dim cmd as String
		  
		  #If TargetMacOS Then
		    cmd = "osascript -e 'Tell application ""Finder"" to reveal """ + f.AbsolutePath.ReplaceAll("'", "'\''") + """' -e 'Tell application ""Finder"" to activate'"
		    MyShell.Execute( cmd )
		    
		  #ElseIf TargetWin32 Then
		    cmd = "explorer.exe /select,"+ chr(34) + f.AbsolutePath + chr(34)
		    MyShell.Execute( cmd )
		    
		  #EndIf
		  
		  If DebugBuild And MyShell.Result <> "" Then MessageBox MyShell.Result
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SmoothResize(w as Window, Width as Integer, Height as Integer, align as Integer)
		  // Added 11/13/2001 by Jarvis Badgley
		  // Edited 12/05/2001 by Jarvis Badgley
		  // Modified 2/3/2002 by Kevin Ballard
		  // ---
		  // Rewritten 2/22/2002 by Kevin Ballard
		  // Based off of code by Jean-Francois Roy <bahamut@mac.com>
		  // ---
		  // Modified 8/23/02 by Kevin Ballard
		  // Modified 12/14/02 by Pedro fp <mail@pedro.net.au>
		  // Modified 12/14/02 by Kevin Ballard
		  //
		  // Align numbers:
		  //     0) Lock upper left
		  //     1) Lock upper right
		  //     2) Lock lower left
		  //     3) Lock lower right
		  //     4) Lock top center
		  //     5) Lock left center
		  //     6) Lock bottom center
		  //     7) Lock right center
		  
		  
		  #If targetmacos then
		    Dim err, t, l as Integer
		    Dim rect as MemoryBlock
		    
		    #If TargetCarbon then
		      Declare Function TransitionWindow Lib CarbonLib (window as WindowPtr, effect as Integer, action as Integer, rect as Ptr) as Integer
		      Declare Function GetWindowBounds  Lib CarbonLib (window As WindowPtr, regionCode As Integer, globalBounds As Ptr) as Integer
		    #ElseIf TargetCocoa then
		      Declare Function TransitionWindow Lib CocoaLib (window as WindowPtr, effect as Integer, action as Integer, rect as Ptr) as Integer
		      Declare Function GetWindowBounds  Lib CocoaLib (window As WindowPtr, regionCode As Integer, globalBounds As Ptr) as Integer
		      
		      // Vidal: Cheating using MBS plugin.
		      w.SmoothResize( Width, Height )
		      w.Width = Width
		      w.Height = Height
		      Return
		    #ElseIf TargetWin32
		      Declare Function TransitionWindow Lib "WindowsLib" (window as WindowPtr, effect as Integer, action as Integer, rect as Ptr) as Integer
		      Declare Function GetWindowBounds  Lib "WindowsLib" (window As WindowPtr, regionCode As Integer, globalBounds As Ptr) as Integer
		    #EndIf
		    
		    // we get the old window region
		    rect = New MemoryBlock(8)
		    err = GetWindowBounds(w, 32, rect)
		    
		    t = w.Top // Need to know where the top and left of the window go
		    l = w.Left
		    Select Case align // Use deltas in measurements, not absolutes
		    Case 0 // Lock upper left
		      rect.Short(4) = rect.Short(4) + (height - w.height)
		      rect.Short(6) = rect.Short(6) + (width - w.width)
		    Case 1 // Lock upper right
		      rect.Short(2) = rect.Short(2) - (width - w.width)
		      rect.Short(4) = rect.Short(4) + (height - w.height)
		      l = l - (width - w.width) // Left side moves
		    Case 2 // Lock lower left
		      rect.Short(0) = rect.Short(0) - (height - w.height)
		      rect.Short(6) = rect.Short(6) + (width - w.width)
		      t = t - (height - w.height) // Top side moves
		    Case 3 // Lock lower right
		      rect.Short(0) = rect.Short(0) - (height - w.height)
		      rect.Short(2) = rect.Short(2) - (width - w.width)
		      t = t - (height - w.height) // Top side moves
		      l = l - (width - w.width) // Left side moves
		    Case 4 // Lock top center
		      rect.Short(2) = rect.Short(2) - (width - w.width) / 2
		      rect.Short(4) = rect.Short(4) + (height - w.height)
		      rect.Short(6) = rect.Short(6) + (width - w.width) / 2
		      l = l - (width - w.width)/2 // Both sides move
		    Case 5 // Lock left center
		      rect.Short(0) = rect.Short(0) - (height - w.height) / 2
		      rect.Short(4) = rect.Short(4) + (height - w.height) / 2
		      rect.Short(6) = rect.Short(6) + (width - w.width)
		      t = t - (height - w.height) / 2 // Top moves
		    Case 6 // Lock bottom center
		      rect.Short(0) = rect.Short(0) - (height - w.height)
		      rect.Short(2) = rect.Short(2) - (width - w.width) / 2
		      rect.Short(6) = rect.Short(6) + (width - w.width) / 2
		      t = t - (height - w.height) // Top moves
		      l = l - (width - w.width) / 2 // Left moves
		    Case 7 // Lock right center
		      rect.Short(0) = rect.Short(0) - (height - w.height) / 2
		      rect.Short(2) = rect.Short(2) - (width - w.width)
		      rect.Short(4) = rect.Short(4) + (height - w.height) / 2
		      t = t - (height - w.height) / 2// Top moves
		      l = l - (width - w.width) // Left moves
		    End Select // If none of these, don't change
		    
		    // transition
		    err = TransitionWindow(w, 3, 4, rect)
		    
		    // have to manually set the window's new height after resizing the window
		    w.Top = t
		    w.Left = l
		    w.Width = width
		    w.Height = height
		    
		    w.Refresh
		  #endif
		  #if TargetWin32 then
		    w.width=width
		    w.height=height
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SocketError(Code as Integer, sckt as HTTPSocket)
		  //HTTPSocket error codes and user notification
		  Dim ErrorString As String
		  ErrorString = "HTTP Error: " + str(code) + " occured." + chr(13) + chr(13)
		  
		  Select case code
		  case 100
		    ErrorString = ErrorString + "Driver error"
		  case 102
		    ErrorString = ErrorString + "Connection Lost" + Loc.kDownloadFailed
		  case 103
		    ErrorString = ErrorString + "Unresolved Host, " + Loc.kCheckInternetConnection.Lowercase
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
		  case 414
		    ErrorString = ErrorString + "Request-URI Too Long"
		  case 500
		    ErrorString = ErrorString + "Internal Server Error"
		  case 505
		    ErrorString = ErrorString + "HTTP Version Not Supported"
		  case 509
		    ErrorString = ErrorString + "Bandwidth Limit Exceeded"
		  else
		    ErrorString = ErrorString + "Unknown or Undefined. Error Code"
		  end Select
		  
		  'wndProgress.Close
		  'If CommonCore.MassSearch Then
		  
		  'If NOT nc.Available then
		  'if NOT Growl.Notify( App.kAppName, ErrorString ) then
		  'if NOT CommonCore.MassSearch Then MessageBox ErrorString
		  'end if
		  'Else
		  nc.Message ErrorString
		  'End If
		  
		  
		  'Else
		  'MessageBox ErrorString
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function String2Entities(s as String) As String
		  's = s.ReplaceAll(" ", "+"  )
		  's = s.ReplaceAll("&", "%26")
		  
		  's = s.ReplaceAll("Ärk", "%C4")
		  's = s.ReplaceAll("Ërk", "%CB")
		  's = s.ReplaceAll("Ïrk", "%CF")
		  's = s.ReplaceAll("Ð", "E")
		  's = s.ReplaceAll("Örk", "%D6")
		  's = s.ReplaceAll("×", "")
		  's = s.ReplaceAll("Ürk", "%DC")
		  's = s.ReplaceAll("Þ", "")
		  's = s.ReplaceAll("Þ", "%DE")
		  's = s.ReplaceAll("ß", "")
		  's = s.ReplaceAll("ð", "%F0")
		  's = s.ReplaceAll("÷", "")
		  's = s.ReplaceAll("÷", "%F7")
		  's = s.ReplaceAll("þ", "")
		  's = s.ReplaceAll("þ", "%FE")
		  
		  // ----
		  
		  's = s.ReplaceAll("Ḁ", "A")
		  's = s.ReplaceAll("ḉ", "c")
		  's = s.ReplaceAll("Ḟ", "F")
		  's = s.ReplaceAll("Ḡ", "G")
		  's = s.ReplaceAll("Ḣ", "H")
		  's = s.ReplaceAll("Ḥ", "H")
		  's = s.ReplaceAll("Ḧ", "H")
		  's = s.ReplaceAll("Ṙ", "R")
		  's = s.ReplaceAll("Ṡ", "S")
		  's = s.ReplaceAll("Ṣ", "S")
		  's = s.ReplaceAll("Ṥ", "S")
		  's = s.ReplaceAll("Ṧ", "S")
		  's = s.ReplaceAll("Ṵ", "U")
		  's = s.ReplaceAll("Ṽ", "V")
		  's = s.ReplaceAll("Ẁ", "W")
		  's = s.ReplaceAll("Ẃ", "W")
		  's = s.ReplaceAll("Ẅ", "W")
		  's = s.ReplaceAll("Ẇ", "W")
		  's = s.ReplaceAll("Ẑ", "Z")
		  's = s.ReplaceAll("Ả", "A")
		  's = s.ReplaceAll("Ẻ", "E")
		  's = s.ReplaceAll("Ẽ", "E")
		  's = s.ReplaceAll("Ề", "E")
		  's = s.ReplaceAll("Ỉ", "I")
		  's = s.ReplaceAll("À", "A")
		  's = s.ReplaceAll("Á", "A")
		  's = s.ReplaceAll("Â", "A")
		  's = s.ReplaceAll("Ã", "A")
		  's = s.ReplaceAll("Ä", "A")
		  's = s.ReplaceAll("Å", "A")
		  's = s.ReplaceAll("Æ", "AE")
		  's = s.ReplaceAll("Ç", "C")
		  's = s.ReplaceAll("È", "E")
		  's = s.ReplaceAll("É", "E")
		  's = s.ReplaceAll("Ê", "E")
		  's = s.ReplaceAll("Ë", "E")
		  's = s.ReplaceAll("Ì", "I")
		  's = s.ReplaceAll("Í", "I")
		  's = s.ReplaceAll("Î", "I")
		  's = s.ReplaceAll("Ï", "I")
		  's = s.ReplaceAll("Ñ", "N")
		  's = s.ReplaceAll("Ò", "O")
		  's = s.ReplaceAll("Ó", "O")
		  's = s.ReplaceAll("Ô", "O")
		  's = s.ReplaceAll("Õ", "O")
		  's = s.ReplaceAll("Ö", "O")
		  's = s.ReplaceAll("Ø", "O")
		  's = s.ReplaceAll("Ù", "U")
		  's = s.ReplaceAll("Ú", "U")
		  's = s.ReplaceAll("Û", "U")
		  's = s.ReplaceAll("õ", "o")
		  's = s.ReplaceAll("Ü", "U")
		  's = s.ReplaceAll("Ý", "Y")
		  's = s.ReplaceAll("ßre", "s")
		  's = s.ReplaceAll("à", "a")
		  's = s.ReplaceAll("á", "a")
		  's = s.ReplaceAll("â", "a")
		  's = s.ReplaceAll("ã", "a")
		  's = s.ReplaceAll("ä", "a")
		  's = s.ReplaceAll("å", "a")
		  's = s.ReplaceAll("æ", "ae")
		  's = s.ReplaceAll("ç", "c")
		  's = s.ReplaceAll("è", "e")
		  's = s.ReplaceAll("é", "e")
		  's = s.ReplaceAll("ê", "e")
		  's = s.ReplaceAll("ë", "e")
		  's = s.ReplaceAll("ì", "i")
		  's = s.ReplaceAll("í", "i")
		  's = s.ReplaceAll("î", "i")
		  's = s.ReplaceAll("ï", "i")
		  's = s.ReplaceAll("ð", "d")
		  's = s.ReplaceAll("ñ", "n")
		  's = s.ReplaceAll("ò", "o")
		  's = s.ReplaceAll("ó", "o")
		  's = s.ReplaceAll("ô", "o")
		  's = s.ReplaceAll("ö", "o")
		  's = s.ReplaceAll("ø", "o")
		  's = s.ReplaceAll("ù", "u")
		  's = s.ReplaceAll("ú", "u")
		  's = s.ReplaceAll("û", "u")
		  's = s.ReplaceAll("ü", "u")
		  's = s.ReplaceAll("ý", "y")
		  's = s.ReplaceAll("ÿ", "y")
		  's = s.ReplaceAll("Ā", "A")
		  's = s.ReplaceAll("Ă", "A")
		  's = s.ReplaceAll("Ą", "A")
		  's = s.ReplaceAll("Ć", "C")
		  's = s.ReplaceAll("ć", "c")
		  's = s.ReplaceAll("ĉ", "c")
		  's = s.ReplaceAll("Č", "C")
		  's = s.ReplaceAll("Ē", "E")
		  's = s.ReplaceAll("Ĕ", "E")
		  's = s.ReplaceAll("Ė", "E")
		  's = s.ReplaceAll("Ě", "E")
		  's = s.ReplaceAll("Ĝ", "G")
		  's = s.ReplaceAll("Ğ", "G")
		  's = s.ReplaceAll("Ġ", "G")
		  's = s.ReplaceAll("Ĥ", "H")
		  's = s.ReplaceAll("Ĩ", "I")
		  's = s.ReplaceAll("Ŏ", "O")
		  's = s.ReplaceAll("Ő", "O")
		  's = s.ReplaceAll("Ŕ", "R")
		  's = s.ReplaceAll("Ř", "R")
		  's = s.ReplaceAll("Ś", "S")
		  's = s.ReplaceAll("Ŝ", "S")
		  's = s.ReplaceAll("Ş", "S")
		  's = s.ReplaceAll("Š", "S")
		  's = s.ReplaceAll("Ũ", "U")
		  's = s.ReplaceAll("Ů", "U")
		  's = s.ReplaceAll("ů", "u")
		  's = s.ReplaceAll("Ű", "U")
		  's = s.ReplaceAll("Ų", "U")
		  's = s.ReplaceAll("Ź", "Z")
		  's = s.ReplaceAll("Ż", "Z")
		  's = s.ReplaceAll("Ž", "Z")
		  's = s.ReplaceAll("Ɛ", "E")
		  's = s.ReplaceAll("Ǎ", "A")
		  's = s.ReplaceAll("Ǒ", "O")
		  's = s.ReplaceAll("Ǔ", "U")
		  's = s.ReplaceAll("Ǧ", "G")
		  's = s.ReplaceAll("Ǵ", "G")
		  's = s.ReplaceAll("ǽ", "ae")
		  's = s.ReplaceAll("Ȁ", "A")
		  's = s.ReplaceAll("Ȃ", "A")
		  's = s.ReplaceAll("Ȅ", "E")
		  's = s.ReplaceAll("Ȇ", "E")
		  's = s.ReplaceAll("Ȍ", "O")
		  's = s.ReplaceAll("Ȑ", "R")
		  's = s.ReplaceAll("Ȓ", "R")
		  's = s.ReplaceAll("Ȕ", "U")
		  's = s.ReplaceAll("Ș", "S")
		  's = s.ReplaceAll("Ȟ", "H")
		  's = s.ReplaceAll("Ȧ", "A")
		  's = s.ReplaceAll("Ȩ", "E")
		  
		  // ----
		  
		  's = s.ReplaceAll("%", "%25")
		  's = s.ReplaceAll("?", "%3F")
		  's = s.ReplaceAll("=", "%3D")
		  's = s.ReplaceAll("@", "%40")
		  
		  ''s = s.ReplaceAll("/", "%2F")
		  's = s.ReplaceAll("À", "%C0")
		  's = s.ReplaceAll("Á", "%C1")
		  's = s.ReplaceAll("Â", "%C2")
		  's = s.ReplaceAll("Ã", "%C3")
		  's = s.ReplaceAll("Ärk", "%C4")
		  's = s.ReplaceAll("Å", "%C5")
		  's = s.ReplaceAll("Æ", "%C6")
		  's = s.ReplaceAll("Ç", "%C7")
		  's = s.ReplaceAll("È", "%C8")
		  's = s.ReplaceAll("É", "%C9")
		  's = s.ReplaceAll("Ê", "%CA")
		  's = s.ReplaceAll("Ërk", "%CB")
		  's = s.ReplaceAll("Ì", "%CC")
		  's = s.ReplaceAll("Í", "%CD")
		  's = s.ReplaceAll("Î", "%CE")
		  's = s.ReplaceAll("Ïrk", "%CF")
		  's = s.ReplaceAll("Ð", "%D0")
		  's = s.ReplaceAll("Ñ", "%D1")
		  's = s.ReplaceAll("Ò", "%D2")
		  's = s.ReplaceAll("Ó", "%D3")
		  's = s.ReplaceAll("Ô", "%D4")
		  's = s.ReplaceAll("Õ", "%D5")
		  's = s.ReplaceAll("Örk", "%D6")
		  's = s.ReplaceAll("×", "%D7")
		  's = s.ReplaceAll("Ø", "%D8")
		  's = s.ReplaceAll("Ù", "%D9")
		  's = s.ReplaceAll("Ú", "%DA")
		  's = s.ReplaceAll("Û", "%DB")
		  's = s.ReplaceAll("Ürk", "%DC")
		  's = s.ReplaceAll("Ý", "%DD")
		  's = s.ReplaceAll("Þ", "%DE")
		  's = s.ReplaceAll("ßre", "%DF")
		  's = s.ReplaceAll("à", "%E0")
		  's = s.ReplaceAll("á", "%E1")
		  's = s.ReplaceAll("â", "%E2")
		  's = s.ReplaceAll("ã", "%E3")
		  's = s.ReplaceAll("ä", "%E4")
		  's = s.ReplaceAll("å", "%E5")
		  's = s.ReplaceAll("æ", "%E6")
		  's = s.ReplaceAll("ç", "%E7")
		  's = s.ReplaceAll("è", "%E8")
		  's = s.ReplaceAll("é", "%E9")
		  's = s.ReplaceAll("ê", "%EA")
		  's = s.ReplaceAll("ë", "%EB")
		  's = s.ReplaceAll("ì", "%EC")
		  's = s.ReplaceAll("í", "%ED")
		  's = s.ReplaceAll("î", "%EE")
		  's = s.ReplaceAll("ï", "%EF")
		  's = s.ReplaceAll("ð", "%F0")
		  's = s.ReplaceAll("ñ", "%F1")
		  's = s.ReplaceAll("ò", "%F2")
		  's = s.ReplaceAll("ó", "%F3")
		  's = s.ReplaceAll("ô", "%F4")
		  's = s.ReplaceAll("õ", "%F5")
		  's = s.ReplaceAll("ö", "%F6")
		  's = s.ReplaceAll("÷", "%F7")
		  's = s.ReplaceAll("ø", "%F8")
		  's = s.ReplaceAll("ù", "%F9")
		  's = s.ReplaceAll("ú", "%FA")
		  's = s.ReplaceAll("û", "%FB")
		  's = s.ReplaceAll("ü", "%FC")
		  's = s.ReplaceAll("ý", "%FD")
		  's = s.ReplaceAll("þ", "%FE")
		  's = s.ReplaceAll("ÿ", "%FF")
		  
		  s = ConvertEncoding( s, Encodings.ASCII )
		  // Unicode characters such as 'é' will be renamed to e%CC%81, etc.
		  's = EncodeURLComponent( s )
		  s = URLEncode( s )
		  'return s
		  
		  // Saving characters that shouldn't be filtered out.
		  s = s.ReplaceAll("%3A", ":")
		  s = s.ReplaceAll("%28", "(")
		  s = s.ReplaceAll("%29", ")")
		  's = s.ReplaceAll("%27", "'")
		  s = s.ReplaceAll("%26", "&")
		  s = s.ReplaceAll("%25", "")
		  s = s.ReplaceAll("%20", " ")
		  s = s.ReplaceAll("%2D", "-")
		  s = s.ReplaceAll("%2F", "/")
		  
		  
		  // Filter out the 'unicode' characters %CC, etc.
		  Dim Character() as String = s.Split("")
		  Dim Unicode() as String
		  For i as Integer = s.Len - 1 DownTo 0
		    If Character(i) = "%" Then Unicode.append s.Mid( i + 1, 3 )
		  Next
		  
		  For i as Integer = 0 to Unicode.Ubound
		    s = s.ReplaceAll( Unicode(i), "" )
		  Next
		  
		  // Re-placing characters back into the name.
		  s = s.ReplaceAll( "", "%")
		  s = s.ReplaceAll( " ", "%20"  )
		  s = s.ReplaceAll( "&", "%26" )
		  s = s.ReplaceAll( "/", "%2F" )
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringToHex(src as string, separator as string) As string
		  Dim n, L, v as integer
		  Dim s as string
		  
		  L = LenB(src)
		  
		  For n=1 to L
		    v = AscB(MidB(src, n, 1))
		    s = s + RightB("00"+Hex(v),2)+separator
		  Next
		  
		  Return LeftB(s, LenB(s)-LenB(separator))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SymLink(TheFile as FolderItem, Destination as FolderItem) As Boolean
		  If TheFile = Nil OR NOT TheFile.Exists Then Return False
		  If Destination = Nil OR Destination.Exists Then Return False
		  
		  Dim ExeStr as String = "ln -s " + TheFile.ShellPath + " " + Destination.ShellPath
		  
		  Dim sh as New Shell
		  sh.Execute ExeStr
		  
		  Return sh.ReadAll = ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub URL2Picture(URL as String, f as FolderItem = Nil, FileName as String = "")
		  dim TheFile as FolderItem
		  
		  if FileName = "" then
		    dim name() as String = URL.Split("/")
		    FileName = name( name.Ubound )
		  end if
		  
		  if f <> Nil then
		    TheFile = f.Child(FileName)
		  else
		    TheFile = SpecialFolder.Temporary.Child( app.Identifier ).Child(FileName)
		  end if
		  
		  if TheFile <> Nil and URL <> "" then
		    if f <> Nil and TheFile.Exists then
		      // Don't overwrite existing
		    elseif System.Network.IsConnected then
		      if TheFile.Exists then TheFile.Delete
		      
		      dim sh as new Shell
		      sh.Execute "curl -s " + URL + " > " + TheFile.ShellPath
		    end if
		    
		    'Return Picture.Open( TheFile )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URL2Picture(URL as String, f as FolderItem = Nil, FileName as String = "") As Picture
		  dim TheFile as FolderItem
		  
		  if FileName = "" then
		    dim name() as String = URL.Split("/")
		    FileName = name( name.Ubound )
		  end if
		  
		  if f <> Nil then
		    TheFile = f.Child(FileName)
		  else
		    TheFile = SpecialFolder.Temporary.Child( app.Identifier ).Child(FileName)
		  end if
		  
		  if TheFile <> Nil and URL <> "" then
		    if f <> Nil and TheFile.Exists then
		      // Don't overwrite existing
		    elseif System.Network.IsConnected then
		      if TheFile.Exists then TheFile.Delete
		      
		      dim sh as new Shell
		      sh.Execute "curl -s " + URL + " > " + TheFile.ShellPath
		    end if
		    
		    Return Picture.Open( TheFile )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub URL2PictureOLD(URL as String, f as FolderItem = Nil, FileName as String = "")
		  Dim sckt as new HTTPSocket
		  Dim TheFile as FolderItem
		  Dim FileSaved as Boolean
		  
		  sckt.Yield = True
		  // URL = String2Entities( URL )
		  
		  If FileName = "" Then
		    Dim Name() as String = URL.Split("/")
		    FileName = Name( Name.Ubound )
		  End If
		  
		  If f <> Nil then
		    TheFile = f.Child( FileName )
		  Else
		    TheFile = SpecialFolder.Temporary.Child( App.Identifier ).Child( FileName )
		  End If
		  
		  If TheFile <> Nil and URL <> "" then
		    
		    // Save file if one doesn't exist already.
		    If f <> Nil and TheFile.Exists then
		      FileSaved = True // Don't want to overwrite existing images.
		    ElseIf System.Network.IsConnected then
		      If TheFile.Exists then TheFile.Delete
		      FileSaved = sckt.Get( URL, TheFile, Preferences.Prefs.integerForKey("TimeOut") )
		      sckt.Close
		    End If
		    
		    If NOT FileSaved then
		      Dim FileSystemErrorCode as Integer = sckt.LastErrorCode
		      // sckt.Close // For extra measure
		      If TheFile.Exists then TheFile.Delete // Don't leave partially downloaded files.
		      
		      // Notify
		      'If nc.Available Then
		      nc.Notify( f.Parent.Name, "", Loc.kConnectionTimedOut )
		      'Else
		      
		      'If NOT Growl.Notify( f.Parent.Name + " Error: " + str( FileSystemErrorCode ), Loc.kConnectionTimedOut ) Then
		      'MessageBox f.Parent.Name + " Error: " + str( FileSystemErrorCode ) + chr(13) + chr(13) + Loc.kConnectionTimedOut
		      'End If
		      '
		      'End If
		      
		      Return
		    Else
		      // sckt.Close // For extra measure
		      'Return Picture.Open( TheFile )
		    End If
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URL2PictureOLD(URL as String, f as FolderItem = Nil, FileName as String = "") As Picture
		  Dim sckt as new HTTPSocket
		  Dim TheFile as FolderItem
		  Dim FileSaved as Boolean
		  
		  sckt.Yield = True
		  // URL = String2Entities( URL )
		  
		  If FileName = "" Then
		    Dim Name() as String = URL.Split("/")
		    FileName = Name( Name.Ubound )
		  End If
		  
		  If f <> Nil then
		    TheFile = f.Child( FileName )
		  Else
		    TheFile = SpecialFolder.Temporary.Child( App.Identifier ).Child( FileName )
		  End If
		  
		  If TheFile <> Nil and URL <> "" then
		    
		    // Save file if one doesn't exist already.
		    If f <> Nil and TheFile.Exists then
		      FileSaved = True // Don't want to overwrite existing images.
		    ElseIf System.Network.IsConnected then
		      If TheFile.Exists then TheFile.Delete
		      FileSaved = sckt.Get( URL, TheFile, Preferences.Prefs.integerForKey("TimeOut") )
		      sckt.Close
		    End If
		    
		    If NOT FileSaved then
		      Dim FileSystemErrorCode as Integer = sckt.LastErrorCode
		      // sckt.Close // For extra measure
		      If TheFile.Exists Then TheFile.Delete // Don't leave partially downloaded files.
		      
		      // Notify
		      'If nc.Available Then
		      nc.Notify( f.Parent.Name, "", Loc.kConnectionTimedOut )
		      'Else
		      '
		      'If NOT Growl.Notify( f.Parent.Name + " Error: " + str( FileSystemErrorCode ), Loc.kConnectionTimedOut ) Then
		      'MessageBox f.Parent.Name + " Error: " + str( FileSystemErrorCode ) + chr(13) + chr(13) + Loc.kConnectionTimedOut
		      'End If
		      '
		      'End If
		      
		      Return Nil
		    Else
		      // sckt.Close // For extra measure
		      Return Picture.Open( TheFile )
		    End If
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLDecode(s as String) As String
		  Dim TempAns As String
		  Dim CurChr As Integer
		  
		  CurChr = 1
		  
		  Do Until CurChr - 1 = Len(s)
		    
		    Select Case Mid(s, CurChr, 1)
		    Case "+"
		      TempAns = TempAns + " "
		    Case "%"
		      TempAns = TempAns + Chr(Val("&h" + Mid(s, CurChr + 1, 2)))
		      CurChr = CurChr + 2
		    Case Else
		      TempAns = TempAns + Mid(s, CurChr, 1)
		    End Select
		    
		    CurChr = CurChr + 1
		    
		  Loop
		  
		  Return  TempAns
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLEncode(s as String) As String
		  Dim TempAns As String
		  Dim CurChr As Integer
		  
		  CurChr = 1
		  
		  Do Until CurChr - 1 = Len(s)
		    
		    Select Case Asc(Mid(s, CurChr, 1))
		    Case 48 To 57, 65 To 90, 97 To 122
		      TempAns = TempAns + Mid(s, CurChr, 1)
		    Case 32
		      TempAns = TempAns + "%" + Hex(32)
		    Case Else
		      TempAns = TempAns +"%" + Right("0" + Hex(Asc(Mid(s, CurChr, 1))), 2)
		    End Select
		    
		    CurChr = CurChr + 1
		    
		  Loop
		  
		  Return TempAns
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteTextFile(Content as String, f as FolderItem)
		  If f = Nil OR f.Parent = Nil OR NOT f.Parent.Exists Then Return
		  
		  Dim TextOut as TextOutputStream
		  If f.Parent.IsWriteable Then
		    
		    Try
		      TextOut = TextOut.Create( f )
		      TextOut.Write( Content )
		      TextOut.Close
		    Catch err as IOException
		      MessageBox "I do not have permission to write to """ + f.Parent.Name + """."
		      Return
		    End Try
		    
		  Else
		    MessageBox "I Don't have permission to write to """ + f.Parent.Name + """."
		  End If
		  
		  
		  
		  exception err as IOException
		    App.ErrorMessage = "An IO exception occurred ERROR No: " + Str( err.ErrorNumber ) + chr(13) + chr(13) + _
		    "Couldn't write " + f.name + " to location " + f.Parent.Name + "." + chr(13) + _
		    "Do we have permission to write to this location?"
		    
		    'Dim w as New wndBugReporter
		    'w.Init( err, "WriteTextFile - " + chr(13) + App.ErrorMessage )
		    
		    if AppSettings.HandleError( err, "IOException (caught at WriteTextFile( " + f.Name + " )) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		    
		    App.ErrorMessage = ""
		    TextOut.Close
		    Return
		    
		    
		  Exception Err as NilObjectException
		    If f.Parent = Nil Then App.ErrorMessage = "I can't write to the specified location"
		    
		    'Dim w as New wndBugReporter
		    'w.Init( err, "WriteTextFile - " + f.ShellPath.ReplaceAll("\","") + Chr(13) + app.ErrorMessage )
		    
		    if AppSettings.HandleError( err, "NilObjectException (caught at WriteTextFile( " + f.Name + " )) " + chr(13) + App.ErrorMessage ) then
		      
		    end if
		    
		    App.ErrorMessage = ""
		    Return
		End Sub
	#tag EndMethod


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

#tag Module
Protected Module RegExExtensions
	#tag Method, Flags = &h0
		Function ContainsRegEx(extends source as String, start as Integer, pattern as String, caseSensitive as Boolean = True) As Boolean
		  Return ( InStrRegEx( start, source, pattern, caseSensitive ) > 0 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountRegEx(extends s As String, pattern As String) As Integer
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  // Count the number of occurrences of a RegEx pattern within a string.
		  
		  Return CountRegEx( s, pattern )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CountRegEx(s As String, pattern As String) As Integer
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  // Count the number of occurrences of a RegEx pattern within a string.
		  
		  dim out as Integer
		  
		  dim re as New RegEx
		  dim rm as RegExMatch
		  
		  re.SearchPattern = pattern
		  rm = re.Search( s )
		  while rm <> Nil
		    'System.DebugLog rm.SubExpressionString(0) + " at " + str(rm.SubExpressionStartB(0)) + " matches " + pattern + " in " + s
		    out = out + 1
		    rm = re.Search
		  wend
		  
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InStrRegEx(start as Integer, source as String, pattern as String, caseSensitive as Boolean = True) As Integer
		  dim rx as New RegEx
		  dim MyMatch as RegExMatch
		  
		  if pattern = "" or source = "" then
		    return 0
		  end if
		  
		  source = source.ConvertEncoding( Encodings.UTF8 )
		  pattern = pattern.ConvertEncoding( Encodings.UTF8 )
		  
		  // Adjust the startB
		  start = start - 1
		  if start < 0 then start = 0
		  
		  'rx.Options.Greedy = False
		  rx.Options.CaseSensitive = caseSensitive
		  
		  rx.SearchPattern = pattern
		  MyMatch = rx.Search( source, start )
		  
		  if MyMatch = nil or MyMatch.SubExpressionCount = 0 then
		    return 0
		  else
		    return ( MyMatch.SubExpressionStartB(0) + 1 )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InStrRegEx(source as String, pattern as String, caseSensitive as Boolean = True) As Integer
		  Return InStrRegEx( 0, source, pattern, caseSensitive )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Match(extends Source as String, Pattern as String, i as Integer = 0) As String
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  Return MyMatch( Source, Pattern, i )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatchAll(extends Source as String, Pattern as String, i as Integer = 0) As String()
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  Return MatchAll( Source, Pattern, i )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MatchAll(Source as String, Pattern as String, SubString as Integer = 0) As String()
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  dim rg as New RegEx
		  dim MyMatch as RegExMatch
		  
		  if pattern = "" or source = "" then
		    Return Nil
		  end if
		  
		  rg.Options.TreatTargetAsOneLine = True
		  rg.Options.DotMatchAll = True
		  
		  rg.SearchPattern = Pattern
		  rg.ReplacementPattern = ""
		  
		  Dim Results() as String
		  
		  // Pop up all matches one by one
		  'Try
		  MyMatch = rg.Search( Source )
		  'Catch Error as RegExException
		  '#If DebugBuild Then Log( Error.message )
		  'Return array("")
		  'End Try
		  
		  While MyMatch <> Nil
		    '#If DebugBuild Then
		    'Dim Debug() as String
		    '
		    'For n as Integer = 0 to MyMatch.SubExpressionCount -1
		    'Debug.Append MyMatch.SubExpressionString(n)
		    'Next
		    '
		    'Break
		    '#EndIf
		    
		    if MyMatch.SubExpressionCount-1 >= SubString then
		      Results.Append Trim( MyMatch.SubExpressionString( SubString ) )
		    else
		      Results.Append Trim( MyMatch.SubExpressionString( 0 ) )
		    end if
		    
		    Source = rg.Replace( Source )
		    MyMatch = rg.Search()
		  Wend
		  
		  rg = Nil
		  
		  Return Results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MyMatch(Source as String, Pattern as String, SubString as Integer = 0) As String
		  #pragma DisableBackgroundTasks
		  #If NOT DebugBuild Then
		    #pragma DisableBoundsChecking
		    #pragma NilObjectChecking False
		    #pragma StackOverflowChecking False
		  #EndIf
		  
		  dim rg as New RegEx
		  dim MyMatch as RegExMatch
		  
		  if pattern = "" or Source = "" then
		    Return ""
		  end if
		  
		  rg.Options.TreatTargetAsOneLine = True
		  rg.Options.DotMatchAll = True
		  
		  rg.SearchPattern = Pattern
		  
		  'Try
		  MyMatch = rg.Search( Source )
		  'Catch Error as RegExException
		  '#If DebugBuild Then Log( Error.message )
		  'Return ""
		  'End Try
		  '
		  '#If DebugBuild Then
		  'Dim Debug() as String
		  '
		  'If MyMatch <> Nil Then
		  'For n as Integer = 0 to MyMatch.SubExpressionCount -1
		  'Debug.Append MyMatch.SubExpressionString(n)
		  'log "RegExMatch[" + Str(n) + "] = " + MyMatch.SubExpressionString(n)
		  'Next
		  'else
		  'log "RegExMatch[Nil] = Nothing found for - " + Pattern
		  'End If
		  '
		  '#EndIf
		  
		  if MyMatch <> Nil then
		    Return Trim( MyMatch.SubExpressionString( SubString ) )
		  else
		    Return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveLinks(Extends source as String) As String
		  Return source.ReplaceAllRegEx( "<a.*?>|<\/a>" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveTags(Extends source as String) As String
		  source = source.ReplaceAll( "<br />", EndOfLine )
		  source = source.ReplaceAll( "<br/>", EndOfLine )
		  source = source.ReplaceAll( "<br>", EndOfLine )
		  
		  Return Trim( source.ReplaceAllRegEx( "<.*?>" ) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceAllRegEx(extends Source as String, SearchPattern as String, ReplacementPattern as String = "") As String
		  dim rg as New RegEx
		  dim MyMatch as RegExMatch
		  
		  rg.Options.TreatTargetAsOneLine = True
		  rg.Options.DotMatchAll = True
		  'rg.Options.CaseSensitive = False
		  'rg.Options.Greedy = False
		  
		  rg.SearchPattern = SearchPattern
		  rg.ReplacementPattern = ReplacementPattern
		  
		  // Pop up all matches one by one
		  MyMatch = rg.Search( Source )
		  while MyMatch <> Nil
		    Source = rg.Replace( Source )
		    MyMatch = rg.Search()
		  wend
		  
		  Return Source
		End Function
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

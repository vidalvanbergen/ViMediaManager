#tag Class
Protected Class MacRegEx
	#tag Method, Flags = &h0
		Sub Constructor()
		  zOptions = new MacRegExOptions
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pClearRegEx()
		  zRX = nil
		  zLastMatch = nil
		  zLastTarget = ""
		  zLastTargetLen = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pCreateRegExObject()
		  #if TargetCocoa
		    
		    if zRX = nil then
		      try
		        zRX = new NSRegularExpression( zSearchPattern, me.Options )
		      catch err as RuntimeException
		        pClearRegEx()
		        pRaiseSearchPatternException( err )
		      end try
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseSearchPatternException(error As RuntimeException)
		  dim e as new RegExSearchPatternException
		  e.Message = error.Message
		  e.ErrorNumber = error.ErrorNumber
		  raise e
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceAll(target As String) As String
		  #if TargetCocoa
		    
		    zLastTarget = target
		    zLastTargetLen = target.Len
		    
		    if target = "" or zSearchPattern = "" then return target
		    
		    pCreateRegExObject()
		    
		    return zRX.StringByReplacingMatches( target, zReplacementPattern, me.Options )
		    
		  #else
		    
		    #pragma unused target
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search(startCharPos As Integer = - 1) As MacRegExMatch
		  dim r as MacRegExMatch
		  
		  #if TargetCocoa
		    
		    if zLastTarget = "" or zRX = nil then return r
		    
		    if startCharPos < 0 then // Resume from last match
		      if zLastMatch = nil then
		        startCharPos = 0
		      elseif zLastMatch.Range.Length = 0 then
		        startCharPos = zLastMatch.Range.Location + 1
		      else
		        startCharPos = zLastMatch.Range.Location + zLastMatch.Range.Length
		      end if
		    end if
		    
		    // Now we're done with the last match, so clear it
		    zLastMatch = nil
		    
		    dim rng as Cocoa.NSRange
		    rng.Location = startCharPos
		    rng.Length = zLastTargetLen - startCharPos
		    
		    if rng.Length > 0 then
		      dim match as Cocoa.NSTextCheckingResult = zRX.FirstMatch( zLastTarget, me.Options, rng )
		      if match <> nil and match.NumberOfRanges <> 0 then
		        #if DebugBuild
		          rng = match.Range
		        #endif
		        r = new MacRegExMatch( match, zLastTarget, zLastTargetLen, zReplacementPattern )
		        zLastMatch = match
		      end if
		    end if
		    
		  #else
		    #pragma unused startCharPos
		  #endif
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search(target As String, startCharPos As Integer = 0) As MacRegExMatch
		  #if TargetCocoa
		    
		    zLastMatch = nil // Starting anew
		    zLastTarget = target
		    zLastTargetLen = target.Len // So we don't have to recalculate it on each pass
		    if target = "" then return nil
		    if zSearchPattern = "" then return nil
		    
		    // Create the RegEx object if needed
		    pCreateRegExObject()
		    
		    if startCharPos < 0 then startCharPos = 0
		    return me.Search( startCharPos )
		    
		  #else
		    
		    #pragma unused target
		    #pragma unused startCharPos
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		Simplifies the MacOS RegEx classes through methods similar to the native RegEx classes.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if zOptions = nil then
			    me.Options = new MacRegExOptions
			  end if
			  return zOptions
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value is nil then
			    value = new MacRegExOptions
			  end if
			  zOptions = value
			  pClearRegEx()
			  
			End Set
		#tag EndSetter
		Options As MacRegExOptions
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zReplacementPattern
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  zReplacementPattern = value
			  pClearRegEx()
			End Set
		#tag EndSetter
		ReplacementPattern As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zSearchPattern
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  zSearchPattern = value
			  pClearRegEx()
			End Set
		#tag EndSetter
		SearchPattern As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zLastMatch As Cocoa.NSTextCheckingResult
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zLastTarget As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zLastTargetLen As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zOptions As MacRegExOptions
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zReplacementPattern As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zRX As NSRegularExpression
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSearchPattern As String
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
			Name="ReplacementPattern"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchPattern"
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
	#tag EndViewBehavior
End Class
#tag EndClass

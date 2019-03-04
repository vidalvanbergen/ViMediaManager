#tag Class
Protected Class MacRegExMatch
	#tag Method, Flags = &h0
		Sub Constructor(match As Cocoa.NSTextCheckingResult, target As String, targetLen As Integer, replacementPattern As String)
		  zTextCheckingResult = match
		  zTarget = target
		  zTargetLen = targetLen // Not sure if I will need this, but just in case
		  zReplacementPattern = replacementPattern
		  
		  if match <> nil then
		    dim trueUbound as integer = match.NumberOfRanges - 1
		    
		    // We are going to eliminate the "no match" ranges at the end, if any.
		    // This matches the behavior of PCRE.
		    
		    while trueUbound > 0
		      if match.RangeAtIndex( trueUbound ).Location = Cocoa.NSNotFound then
		        trueUbound = trueUbound - 1
		      else
		        exit
		      end if
		    wend
		    
		    redim zSubExpressionString( trueUbound )
		    zSubExpressionCount = trueUbound + 1
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace() As String
		  // Uses the given replacement pattern at the time the match was created
		  
		  return me.Replace( zReplacementPattern )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace(replacementPattern As String) As String
		  // Replaces this one match with the replacementPattern
		  
		  #if TargetCocoa
		    
		    if zTextCheckingResult = nil then return ""
		    
		    dim rx as NSRegularExpression = zTextCheckingResult.RegularExpression
		    dim source as string = me.SubExpressionString( 0 )
		    return rx.StringByReplacingMatches( source, replacementPattern, rx.Options )
		    
		  #else
		    
		    #pragma unused replacementPattern
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubExpressionStart(index As Integer) As Integer
		  if zTextCheckingResult = nil or index > zSubExpressionString.Ubound then
		    raise new OutOfBoundsException
		  else
		    dim r as integer = zTextCheckingResult.RangeAtIndex( index ).Location
		    if r = Cocoa.NSNotFound then r = -1
		    return r
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubExpressionString(index As Integer) As String
		  if zTextCheckingResult = nil or index > zSubExpressionString.Ubound then
		    raise new OutOfBoundsException
		    
		  elseif zSubExpressionString( index ) <> "" or _
		    zTextCheckingResult.Range.Location = Cocoa.NSNotFound or zTextCheckingResult.Range.Length = 0 then // Either we already found a string, or there is no string to find
		    return zSubExpressionString( index )
		    
		  else // We have to record the string first
		    dim range as Cocoa.NSRange = zTextCheckingResult.RangeAtIndex( index )
		    dim s as string = zTarget.Mid( range.Location + 1, range.Length )
		    zSubExpressionString( index ) = s // Cache it in case it's requested again
		    return s
		    
		  end if
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zSubExpressionCount
			  
			End Get
		#tag EndGetter
		SubExpressionCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zReplacementPattern As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSubExpressionCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSubExpressionString() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zTarget As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zTargetLen As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zTextCheckingResult As Cocoa.NSTextCheckingResult
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
			Name="SubExpressionCount"
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
	#tag EndViewBehavior
End Class
#tag EndClass

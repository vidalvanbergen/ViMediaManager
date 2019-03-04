#tag Class
Class NSRegularExpression
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSRegularExpression")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(pattern As NSString, options As UInt32 = 0)
		  #if TargetCocoa
		    
		    declare function initWithPattern lib CocoaLib selector "initWithPattern:options:error:" ( obj_id As Ptr, pattern As Ptr, options As UInt32, ByRef error As Ptr ) As Ptr
		    
		    dim err as Ptr
		    dim obj_id as Ptr = initWithPattern( Allocate( "NSRegularExpression" ), pattern, options, err )
		    if err <> nil then
		      raise new NSError( err, hasOwnership )
		    else
		      super.Constructor( obj_id, hasOwnership )
		    end if
		    
		  #else
		    
		    #pragma unused pattern
		    #pragma unused options
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function EscapedPattern(forString As NSString) As NSString
		  #if TargetCocoa
		    
		    if forString = nil then
		      return nil
		    end if
		    
		    declare function escapedPatternForString lib CocoaLib selector "escapedPatternForString:" _
		    ( class_id As Ptr, forString As Ptr ) As Ptr
		    
		    dim p as Ptr = escapedPatternForString( ClassRef, forString )
		    if p <> nil then
		      return new NSString( p, not hasOwnership )
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused forString
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function EscapedTemplate(forString As NSString) As NSString
		  #if TargetCocoa
		    
		    if forString = nil then
		      return nil
		    end if
		    
		    declare function escapedTemplateForString lib CocoaLib selector "escapedTemplateForString:" _
		    ( class_id As Ptr, forString As Ptr ) As Ptr
		    
		    dim p as Ptr = escapedTemplateForString( ClassRef, forString )
		    if p <> nil then
		      return new NSString( p, not hasOwnership )
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused forString
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FirstMatch(source As NSString, options As UInt32 = 0, optional range As NSRange) As NSTextCheckingResult
		  #if TargetCocoa
		    
		    declare function firstMatchInString lib CocoaLib selector "firstMatchInString:options:range:" _
		    ( obj_id As Ptr, source As Ptr, options As UInt32, rng As NSRange ) As Ptr
		    
		    dim trueRange as NSRange
		    if range.Length = 0 then
		      trueRange = NSMakeRange( 0, source.Length )
		    else
		      trueRange = range
		    end if
		    
		    dim p as Ptr = firstMatchInString( self, source, options, trueRange )
		    if p <> nil then
		      return new NSTextCheckingResult( p, not hasOwnership )
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused source
		    #pragma unused options
		    #pragma unused range
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Matches(source As NSString, options As UInt32 = 0, Optional range As NSRange) As NSArray
		  #if TargetCocoa
		    
		    declare function matchesInString lib CocoaLib selector "matchesInString:options:range:" _
		    ( obj_id As Ptr, source As Ptr, options As UInt32, rng As NSRange ) As Ptr
		    
		    dim trueRange as NSRange
		    if range.Length = 0 then
		      trueRange = NSMakeRange( 0, source.Length )
		    else
		      trueRange = range
		    end if
		    
		    dim p as Ptr = matchesInString( self, source, options, trueRange )
		    if p <> nil then
		      return new NSArray( p, not hasOwnership )
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused source
		    #pragma unused options
		    #pragma unused range
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfMatches(source As NSString, options As UInt32 = 0, Optional range As NSRange) As UInt32
		  dim r as UInt32
		  
		  #if TargetCocoa
		    
		    declare function numberOfMatchesInString lib CocoaLib selector "numberOfMatchesInString:options:range:" _
		    ( obj_id As Ptr, source As Ptr, options As UInt32, rng As NSRange ) As UInt32
		    
		    dim trueRange as NSRange
		    if range.Length = 0 then
		      trueRange = NSMakeRange( 0, source.Length )
		    else
		      trueRange = range
		    end if
		    
		    r = numberOfMatchesInString( self, source, options, trueRange )
		    
		  #else
		    
		    #pragma unused source
		    #pragma unused options
		    #pragma unused range
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RangeOfFirstMatch(source As NSString, options As UInt32 = 0, Optional range As NSRange) As NSRange
		  dim r as NSRange
		  
		  #if TargetCocoa
		    
		    declare function rangeOfFirstMatchInString lib CocoaLib selector "rangeOfFirstMatchInString:options:range:" _
		    ( obj_id As Ptr, source As Ptr, options As UInt32, rng As NSRange ) As NSRange
		    
		    dim trueRange as NSRange
		    if range.Length = 0 then
		      trueRange = NSMakeRange( 0, source.Length )
		    else
		      trueRange = range
		    end if
		    
		    r = rangeOfFirstMatchInString( self, source, options, trueRange )
		    
		  #else
		    
		    #pragma unused source
		    #pragma unused options
		    #pragma unused range
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceMatches(ByRef source As NSMutableString, template As NSString, options As UInt32 = 0, Optional range As NSRange) As UInt32
		  // The first param is ByRef to ensure that an actual NSMutableString object was given.
		  // Without it, you could call ReplaceMatches( "this" ) and then wonder why nothing happened.
		  
		  dim r as UInt32
		  
		  #if TargetCocoa
		    
		    declare function replaceMatchesInString lib CocoaLib selector "replaceMatchesInString:options:range:withTemplate:" _
		    ( obj_id As Ptr, source As Ptr, options As UInt32, rng As NSRange, template As Ptr ) As UInt32
		    
		    dim trueRange as NSRange
		    if range.Length = 0 then
		      trueRange = NSMakeRange( 0, source.Length )
		    else
		      trueRange = range
		    end if
		    
		    r = replaceMatchesInString( self, source, options, trueRange, template )
		    
		  #else
		    
		    #pragma unused source
		    #pragma unused template
		    #pragma unused options
		    #pragma unused range
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplacementStringForResult(result As NSTextCheckingResult, inString As NSString, template As NSString, offset As Integer = 0) As NSString
		  #if TargetCocoa
		    
		    declare function replacementStringForResult lib CocoaLib selector "replacementStringForResult:inString:offset:template:" _
		    ( obj_id As Ptr, result As Ptr, inString As Ptr, offset As Integer, template As Ptr ) As Ptr
		    
		    dim p as Ptr = replacementStringForResult( self, result, inString, offset, template )
		    if p <> nil then
		      return new NSString( p, hasOwnership )
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused result
		    #pragma unused inString
		    #pragma unused offset
		    #pragma unused template
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringByReplacingMatches(source As NSString, template As NSString, options As UInt32 = 0, Optional range As NSRange) As NSString
		  #if TargetCocoa
		    
		    declare function stringByReplacingMatchesInString lib CocoaLib selector "stringByReplacingMatchesInString:options:range:withTemplate:" _
		    ( obj_id As Ptr, source As Ptr, options As UInt32, rng As NSRange, template As Ptr ) As Ptr
		    
		    dim trueRange as NSRange
		    if range.Length = 0 then
		      trueRange = NSMakeRange( 0, source.Length )
		    else
		      trueRange = range
		    end if
		    
		    dim p as Ptr = stringByReplacingMatchesInString( self, source, options, trueRange, template )
		    if p <> nil then
		      return new NSString( p, not hasOwnership )
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused source
		    #pragma unused template
		    #pragma unused options
		    #pragma unused range
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if RespondsToSelector( "numberOfCaptureGroups" ) then
			      declare function numberOfCaptureGroups lib CocoaLib selector "numberOfCaptureGroups" _
			      ( obj_id As Ptr ) As UInt32
			      
			      return numberOfCaptureGroups( self )
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		NumberOfCaptureGroups As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "options" ) then
			      declare function options lib CocoaLib selector "options" ( obj_id As Ptr ) As UInt32
			      
			      return options( self )
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Options As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "pattern" ) then
			      declare function pattern lib CocoaLib selector "pattern" ( obj_id As Ptr ) As Ptr
			      
			      dim p as Ptr = pattern( self )
			      if p <> nil then
			        return new NSString( p, not hasOwnership )
			      else
			        return nil
			      end if
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Pattern As NSString
	#tag EndComputedProperty


	#tag Constant, Name = NSMatchingAnchored, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingCompleted, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingHitEnd, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingInternalError, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingProgress, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingReportCompletion, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingReportProgress, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingRequiredEnd, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingWithoutAnchoringBounds, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMatchingWithTransparentBounds, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionAllowCommentsAndWhitespace, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionAnchorsMatchLines, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionCaseInsensitive, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionDotMatchesLineSeparators, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionIgnoreMetacharacters, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionUseUnicodeWordBoundaries, Type = Double, Dynamic = False, Default = \"64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionUseUnixLineSeparators, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
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
			Name="NumberOfCaptureGroups"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Options"
			Group="Behavior"
			Type="UInt32"
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

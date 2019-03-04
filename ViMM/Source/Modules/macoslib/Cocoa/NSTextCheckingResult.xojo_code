#tag Class
Class NSTextCheckingResult
Inherits NSObject
	#tag Method, Flags = &h0
		Function RangeAtIndex(index As UInt32) As NSRange
		  dim r as NSRange
		  
		  #if TargetCocoa
		    
		    declare function rangeAtIndex lib CocoaLib selector "rangeAtIndex:" ( obj_id As Ptr, idx As UInt32 ) As NSRange
		    r = rangeAtIndex( self, index )
		    
		  #else
		    
		    r = NSMakeRange( NSNotFound, 0 )
		    #pragma unused index
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "components" )  then
			      declare function components lib CocoaLib selector "components" ( obj_id As Ptr ) As Ptr
			      
			      dim p as Ptr = components( self )
			      if p = nil then
			        return nil
			      else
			        return new NSDictionary( p, not hasOwnership )
			      end if
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		Components As NSDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "numberOfRanges" )  then
			      declare function numberOfRanges lib CocoaLib selector "numberOfRanges" ( obj_id As Ptr ) As UInt32
			      return numberOfRanges( self )
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		NumberOfRanges As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "range" )  then
			      declare function range lib CocoaLib selector "range" ( obj_id As Ptr ) As NSRange
			      return range( self )
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Range As NSRange
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "regularExpression" ) then
			      declare function regularExpression lib CocoaLib selector "regularExpression" ( obj_id As Ptr ) As Ptr
			      
			      dim p as Ptr = regularExpression( self )
			      if p <> nil then
			        return new NSRegularExpression( p, not hasOwnership )
			      else
			        return nil
			      end if
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		RegularExpression As NSRegularExpression
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "replacementString" ) then
			      declare function replacementString lib CocoaLib selector "replacementString" ( obj_id As Ptr ) As Ptr
			      
			      dim p as Ptr = replacementString( self )
			      if p <> nil then
			        return new NSString( p, not hasOwnership )
			      else
			        return nil
			      end if
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ReplacementString As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "resultType" ) then
			      declare function resultType lib CocoaLib selector "resultType" ( obj_id As Ptr ) As UInt64
			      return resultType( self )
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ResultType As UInt64
	#tag EndComputedProperty


	#tag Constant, Name = NSTextCheckingAllCustomTypes, Type = Double, Dynamic = False, Default = \"&hffffffff00000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingAllSystemTypes, Type = Double, Dynamic = False, Default = \"&hffffffff", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingAllTypes, Type = String, Dynamic = False, Default = \"&hffffffffffffffff", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeAddress, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeCorrection, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeDash, Type = Double, Dynamic = False, Default = \"128", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeDate, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeGrammar, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeLink, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeOrthography, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypePhoneNumber, Type = Double, Dynamic = False, Default = \"2048", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeQuote, Type = Double, Dynamic = False, Default = \"64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeRegularExpression, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeReplacement, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeSpelling, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextCheckingTypeTransitInformation, Type = Double, Dynamic = False, Default = \"4096", Scope = Public
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
			Name="NumberOfRanges"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ResultType"
			Group="Behavior"
			Type="UInt64"
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

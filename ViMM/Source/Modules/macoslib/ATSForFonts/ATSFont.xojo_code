#tag Class
Class ATSFont
	#tag Method, Flags = &h0
		Function File() As FolderItem
		  #if targetMacOS
		    
		    // Added a check the availability of ATSFontGetFileSpecification because
		    // Apple's docs say this is all deprecated in 10.6 in favor of Core Text.
		    
		    static functionsNeedCheck as boolean = true
		    static newFunctionIsAvailable as boolean
		    static oldFunctionIsAvailable as boolean
		    if functionsNeedCheck then
		      newFunctionIsAvailable = System.IsFunctionAvailable( "ATSFontGetFileReference", CarbonLib )
		      oldFunctionIsAvailable = System.IsFunctionAvailable( "ATSFontGetFileSpecification", CarbonLib )
		      functionsNeedCheck = false
		    end if
		    
		    if newFunctionIsAvailable then
		      soft declare function ATSFontGetFileReference lib CarbonLib (iFont as UInt32, fsRef as Ptr) as Integer
		      
		      dim ref as new FSRef
		      'dim theSpec as FSSpec
		      dim OSError as Integer = ATSFontGetFileReference(me, ref)
		      if OSError <> noErr then
		        return nil
		      end if
		      return FileManager.GetFolderItemFromFSRef(ref)
		      
		    elseif oldFunctionIsAvailable then
		      //ATSFontGetFileSpecification is deprecated in Mac OS 10.5.
		      soft declare function ATSFontGetFileSpecification lib CarbonLib (iFont as UInt32, ByRef oFile as FSSpec) as Integer
		      
		      dim theSpec as FSSpec
		      dim OSError as Integer = ATSFontGetFileSpecification(me, theSpec)
		      if OSError <> noErr then
		        return nil
		      end if
		      return FileManager.GetFolderItemFromFSSpec(theSpec)
		    end if
		    
		    return nil
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FindFromName(name as String) As ATSFont
		  #if targetMacOS
		    soft declare function ATSFontFindFromName lib CarbonLib (iName as CFStringRef, iOptions as UInt32) as UInt32
		    
		    dim theRef as UInt32 = ATSFontFindFromName(name, kATSOptionFlagsDefault)
		    if theRef <> kInvalidFont then
		      dim theFont as new ATSFont
		      theFont.ATSFontRef = theRef
		      return theFont
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FindFromPostScriptName(name as String) As ATSFont
		  #if targetMacOS
		    soft declare function ATSFontFindFromPostScriptName lib CarbonLib (iName as CFStringRef, iOptions as UInt32) as UInt32
		    
		    dim theRef as UInt32 = ATSFontFindFromPostScriptName(name, kATSOptionFlagsDefault)
		    if theRef <> kInvalidFont then
		      dim theFont as new ATSFont
		      theFont.ATSFontRef = theRef
		      return theFont
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HorizontalMetrics() As ATSFontMetrics
		  #if targetMacOS
		    soft declare function ATSFontGetHorizontalMetrics lib CarbonLib (iFont as UInt32, iOptions as UInt32, ByRef oMetrics as ATSFontMetrics) as Integer
		    
		    dim metrics as ATSFontMetrics
		    dim OSError as Integer = ATSFontGetHorizontalMetrics(me, kATSOptionFlagsDefault, metrics)
		    return metrics
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As UInt32
		  return me.ATSFontRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VerticalMetrics() As ATSFontMetrics
		  #if targetMacOS
		    soft declare function ATSFontGetVerticalMetrics lib CarbonLib (iFont as UInt32, iOptions as UInt32, ByRef oMetrics as ATSFontMetrics) as Integer
		    
		    dim metrics as ATSFontMetrics
		    dim OSError as Integer = ATSFontGetVerticalMetrics(me, kATSOptionFlagsDefault, metrics)
		    return metrics
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ATSFontRef As UInt32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.ATSFontRef = kInvalidFont then
			    return ""
			  end if
			  
			  #if targetMacOS
			    soft declare function ATSFontGetName lib CarbonLib (iFamily as UInt32, iOptions as UInt32, ByRef oName as CFStringRef) as Integer
			    
			    dim theName as CFStringRef
			    dim OSError as Integer = ATSFontGetName(me, kATSOptionFlagsDefault, theName)
			    if OSError = noErr then
			      return theName
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.ATSFontRef = kInvalidFont then
			    return ""
			  end if
			  
			  #if targetMacOS
			    soft declare function ATSFontGetPostScriptName lib CarbonLib (iFamily as UInt32, iOptions as UInt32, ByRef oName as CFStringRef) as Integer
			    
			    dim theName as CFStringRef
			    dim OSError as Integer = ATSFontGetPostScriptName(me, kATSOptionFlagsDefault, theName)
			    if OSError = noErr then
			      return theName
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		PostScriptName As String
	#tag EndComputedProperty


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
			Name="PostScriptName"
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

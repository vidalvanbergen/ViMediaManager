#tag Class
Class CFError
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return CFError.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function CFErrorGetTypeID lib CarbonLib () as UInteger
		    
		    return CFErrorGetTypeID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As MacOSError
		  // Added by Kem Tekinay.
		  // Allows you to call:
		  //   raise new CFError( CFErrorRef, HasOwnership )
		  
		  #if TargetMacOS
		    
		    dim domain as string = self.Domain.Trim
		    dim desc as string = self.Description.Trim
		    dim code as integer = self.Code
		    
		    dim msgList() as string
		    if domain <> "" then msgList.Append domain
		    if desc <> "" then msgList.Append desc
		    dim msg as string = join( msgList, ": " )
		    
		    return new MacOSError( code, msg )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RaiseExceptionAndRelease(CFErrorRef As Ptr)
		  // Added by Kem Tekinay.
		  
		  // This convenience method is really here as a demonstration of the right way to handle the CFErrorRef
		  // that's returned by some system calls. Rather than using this method, you should write your code
		  // like this:
		  
		  raise new CFError( CFErrorRef, CFType.HasOwnership )
		  
		  // The CFErrorRef will be assigned to the new CFError object which will take ownership.
		  // Because of the Operator_Convert defined within, it will return an Exception (type MacOSError)
		  // with the data pulled from reference. This exception will be raised.
		  // One way or another, the new CFError object will go out of scope, so CFErrorRef will be released.
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function CFErrorGetCode lib CarbonLib (err as Ptr) as Integer
			    
			    if (self <> nil) then
			      return CFErrorGetCode(self)
			    else
			      return 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		Code As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function CFErrorCopyDescription lib CarbonLib (err as Ptr) as CFStringRef
			    
			    if (self <> nil) then
			      return CFErrorCopyDescription(self)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function CFErrorGetDomain lib CarbonLib (err as Ptr) as Ptr
			    
			    if (self <> nil) then
			      return RetainedStringValue(CFErrorGetDomain(self))
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Domain As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Code"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Domain"
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

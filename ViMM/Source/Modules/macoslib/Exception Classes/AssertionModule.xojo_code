#tag Module
Protected Module AssertionModule
	#tag Method, Flags = &h0
		Sub Assert(condition as Boolean, exceptionMessage as String)
		  //Raise a macoslibException with the given exceptionMessage if the passed condition is false
		  
		  if NOT condition then
		    raise new macoslibException( exceptionMessage )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertNot(condition as Boolean, exceptionMessage as String)
		  //Raise a macoslibException with the given exceptionMessage if the passed condition is true
		  
		  if condition then
		    raise new macoslibException( exceptionMessage )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertOSVersion(minVersion as integer = 0, maxVersion as integer = 0, customMessage as string = "")
		  //Assert the OS Version. The default exception message can be overridden by specifying a 'customMessage'
		  
		  //System version is MMmmdd (Major, minor, debug)
		  
		  dim OK as Boolean = true
		  
		  if minVersion>0 AND SystemVersionAsInt < minVersion then
		    OK = false
		  end if
		  
		  if maxVersion>0 AND SystemVersionAsInt > maxVersion then
		    OK = false
		  end if
		  
		  if NOT OK then //Assertion failed
		    if customMessage<>"" then
		      raise  new BadSystemException( customMessage )
		    else
		      raise  new BadSystemException( "The application has called a 'macoslib' method which is not compatible with your OS version." )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertPtr(Pointer as Ptr, exceptionMessage as String)
		  //Raise a macoslibException with the given exceptionMessage if the passed Ptr is nil
		  
		  if Pointer=nil then
		    raise new macoslibException( exceptionMessage )
		  end if
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

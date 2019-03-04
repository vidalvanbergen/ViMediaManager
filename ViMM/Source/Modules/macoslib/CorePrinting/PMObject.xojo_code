#tag Class
Class PMObject
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ref as PMTypeRef, hasOwnership as Boolean)
		  
		  'if checkForClass<>"" then
		  'if NOT Cocoa.InheritsFromClass( obj_id, checkForClass ) then
		  'raise new macoslibException( "The passed pointer does not match the wanted class """ + checkForClass + """" )
		  'end if
		  'end if
		  
		  self.mRef.Value = ref.Value
		  
		  if not hasOwnership then
		    if self.Retain is nil then
		      dim err as new OSError
		      err.Message = "Could not retain PMObject."
		      raise err
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  self.Release
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As PMTypeRef
		  return self.mRef
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(obj as PMObject) As Integer
		  if obj <> nil then
		    return Integer(self.Handle.value) - Integer(obj.Handle.value)
		  else
		    return Integer(self.Handle.value)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As PMTypeRef
		  return self.Handle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  #if TargetMacOS
		    
		    declare function PMRelease lib framework (id as PMTypeRef) As Integer
		    
		    dim OSErr as integer = PMRelease( self.Handle )
		    if OSErr <> 0 then
		      dim err as new OSError
		      err.Message = "Could not release PMObject."
		      err.ErrorNumber = OSErr
		      raise err
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Retain() As PMObject
		  #if TargetMacOS
		    declare function PMRetain lib framework (id as PMTypeRef) as Integer
		    
		    if self.Handle.value <> nil then
		      if PMRetain( self.Handle ) = 0 then
		        return self
		      else
		        return nil
		      end if
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  
		  return self
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mRef As PMTypeRef
	#tag EndProperty


	#tag Constant, Name = hasOwnership, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant


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
End Class
#tag EndClass

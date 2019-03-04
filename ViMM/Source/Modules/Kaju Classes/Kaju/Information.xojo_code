#tag Class
Protected Class Information
	#tag Method, Flags = &h21
		Private Function CloneValue(value As Variant) As Variant
		  dim r as variant = nil
		  
		  select case value
		  case isa Kaju.Information
		    dim tiInfo as Introspection.TypeInfo = Introspection.GetType( value )
		    dim contructors() as Introspection.ConstructorInfo = tiInfo.GetConstructors
		    dim useConstructor as Introspection.ConstructorInfo
		    for each c as Introspection.ConstructorInfo in contructors
		      dim params() as Introspection.ParameterInfo = c.GetParameters
		      if c.IsPublic and params.Ubound = 0 and params( 0 ).ParameterType.FullName = "Kaju.Information" then
		        useConstructor = c
		        exit for c
		      end if
		    next
		    
		    if useConstructor is nil then
		      raise new KajuException( "Can't find constructor", CurrentMethodName )
		    end if
		    
		    dim constructorParams() as variant
		    constructorParams.Append value
		    
		    dim newValue as variant = useConstructor.Invoke( constructorParams )
		    r = Kaju.Information( newValue )
		    
		  case isa Picture
		    dim p as Picture = value
		    dim newP as new Picture( p.Width, p.Height )
		    newP.Graphics.DrawPicture p, 0, 0
		    
		    r = newP
		    
		  case isa Dictionary
		    dim d as Dictionary = value
		    dim newDict as new Dictionary
		    
		    dim keys() as variant = d.Keys
		    dim values() as variant = d.Values
		    for i as integer = 0 to keys.Ubound
		      dim key as variant = CloneValue( keys( i ) )
		      dim dictValue as variant = CloneValue( values( i ) )
		      newDict.Value( key ) = dictValue
		    next
		    
		    r = newDict
		    
		  case nil
		    r = nil
		    
		  case else
		    if value.Type = Variant.TypeObject or value.Type = Variant.TypeArray then
		      raise new KajuException( "Can't clone property", CurrentMethodName )
		    end if
		    
		    r = value
		    
		  end select
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // Do not allow direct instantiation
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(copyFrom As Kaju.Information)
		  self.Constructor()
		  
		  dim tiMine as Introspection.TypeInfo = Introspection.GetType( self )
		  dim tiFrom as Introspection.TypeInfo = Introspection.GetType( copyFrom )
		  
		  if tiMine.FullName <> tiFrom.FullName then
		    raise new KajuException( "Must clone from like types", CurrentMethodName )
		  end if
		  
		  dim props() as Introspection.PropertyInfo = tiMine.GetProperties
		  
		  dim doComputed as boolean = false
		  
		  do
		    
		    doComputed = not doComputed // First pass will do computed properties
		    
		    for each prop as Introspection.PropertyInfo in props
		      
		      #if DebugBuild
		        //
		        // Debugging
		        //
		        dim propName as string = prop.Name
		        #pragma unused propName
		        dim propType as string = prop.PropertyType.Name
		        #pragma unused propType
		      #endif
		      
		      if prop.IsComputed <> doComputed then
		        continue for prop
		      end if
		      
		      if not prop.CanRead or not prop.CanWrite or prop.IsShared then
		        continue for prop
		      end if
		      
		      dim value as variant = prop.Value( copyFrom )
		      try
		        value = CloneValue( value )
		      catch err as KajuException
		        err.Message = err.Message + " (" + prop.Name + ")"
		        raise err
		      end try
		      prop.Value( self ) = value
		    next
		    
		  loop until not doComputed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToJSON() As JSONItem
		  dim j as new JSONItem( "{}" )
		  
		  dim ti as Introspection.TypeInfo = Introspection.GetType( self )
		  dim props() as Introspection.PropertyInfo = ti.GetProperties
		  
		  for each prop as Introspection.PropertyInfo in props
		    if prop.IsShared or not prop.CanRead or not prop.CanWrite or not prop.IsPublic then
		      continue for prop
		    end if
		    
		    dim propType as Introspection.TypeInfo = prop.PropertyType
		    dim propTypeName as string = propType.Name
		    
		    dim isGood as boolean
		    select case propTypeName
		    case "String", "Double", "Single", "Text", "Boolean"
		      isGood = true
		      
		    end select
		    
		    if not isGood then
		      //
		      // See if it's an integer of some sort
		      //
		      if propTypeName.Left( 3 ) = "Int" or propTypeName.Left( 4 ) = "UInt" then
		        isGood = true
		      end if
		    end if
		    
		    if isGood then
		      j.Value( prop.Name ) = prop.Value( self )
		    end if
		  next
		  
		  return j
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InvalidReason() As String
		  return mInvalidReason
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event IsInvalid(ByRef reason As String) As Boolean
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim reason as string
			  dim r as boolean = not RaiseEvent IsInvalid( reason )
			  mInvalidReason = reason
			  
			  return r
			End Get
		#tag EndGetter
		IsValid As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mInvalidReason As String
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
			Name="IsValid"
			Group="Behavior"
			Type="Boolean"
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

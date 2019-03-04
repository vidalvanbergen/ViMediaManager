#tag Module
Protected Module PasteboardReadingAndWritingModule
	#tag DelegateDeclaration, Flags = &h0
		Delegate Function CreateFromSerializedDataDelegate(type as string, data as variant) As variant
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Sub Init()
		  
		  if NOT inited then
		    ReadTypesStorage = new Dictionary
		    WriteTypesStorage = new Dictionary
		    InstantiationMethods = new Dictionary
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InterpretConstantValue(theValue as String) As string()
		  
		  dim value as string = ReplaceLineEndings( theValue, EndOfLine )
		  dim values() as string = Split( value, EndOfLine )
		  
		  for i as integer = 0 to values.Ubound
		    values( i ) = values( i ).StringBefore( ":" ) //We don't use the Option field for now
		  next
		  
		  return  values
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterPasteboardTypes(obj as Object, writingTypes as variant, readingTypes as variant, instantiationDelegate as CreateFromSerializedDataDelegate)
		  //# Register the pasteboard types that 'obj' can write to/read from a Pasteboard (Clipboard or DragItem)
		  
		  //@ writingtypes are an array of the UTIs you can provide on demand for Clipboard or DragItem (can be a String, see below)
		  //@ readingTypes are an array the UTIs from which YOU CAN INSTANTIATE A NEW CLASS (can be a String, see below)
		  //@ instantiationDelegate is the Shared Method to be called to create a new instance from a Pasteboard (one of those you gave in readingTypes)
		  
		  //@ String/Constant format: an EndOfLine-separated list of UTIs. Each UTI can have a trailing colon followed by an option, but this is not used yet.
		  
		  Init
		  
		  if NOT ReadTypesStorage.HasKey( obj.ClassName ) then
		    if VarType( readingTypes ) = Variant.TypeString then //Read from object constant
		      ReadTypesStorage.Value( obj.ClassName ) = InterpretConstantValue( readingTypes )
		      
		    elseif readingTypes.IsArray AND readingTypes.ArrayElementType=Variant.TypeString then
		      ReadTypesStorage.Value( obj.ClassName ) = readingTypes
		      
		    else
		      raise new TypeMismatchException
		    end if
		  end if
		  
		  if NOT WriteTypesStorage.HasKey( obj.ClassName ) then
		    if VarType( writingTypes ) = Variant.TypeString then //Read from object constant
		      WriteTypesStorage.Value( obj.ClassName ) = InterpretConstantValue( writingTypes )
		      
		    elseif WritingTypes.IsArray AND WritingTypes.ArrayElementType=Variant.TypeString then
		      WriteTypesStorage.Value( obj.ClassName ) = WritingTypes
		      
		    else
		      raise new TypeMismatchException
		    end if
		  end if
		  
		  if NOT InstantiationMethods.HasKey( obj.ClassName ) then
		    InstantiationMethods.Value( obj.ClassName ) = instantiationDelegate
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		This module makes it easier for you to implement the storage of a class (Serialization) and the reverse operation, i.e. creating a brand new class
		from serialized data.
		
		To register automatic serialization/deserialization, do the following:
		1. When creating your class, adopt the "PasteboardReadingAndWriting" interface for your class
		2. In the "SerializeForType" method, put some code to create PropertyList data for any UTI you can asked for.
		3. Create a Shared Method base on the delegate CreateFromSerializedDataDelegate.
		    The advised implementation is CreateFromPasteboardDataAndType( type as string, data as variant ) as variant.
		4. Create an instance of your class (even a dummy instance which cannot really be useful and/or work properly)
		5. Call RegisterPasteboardTypes (defined in this module). See RegisterPasteboardTypes for the parameters.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Inited As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InstantiationMethods As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ReadTypesStorage As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WriteTypesStorage As Dictionary
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

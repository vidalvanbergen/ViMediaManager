#tag Module
Protected Module AttachedPropertiesModule
	#tag Method, Flags = &h0
		Function AttachedProperty(extends o as Object, key as String) As Variant
		  //Get the stored value
		  
		  dim dict as Dictionary
		  
		  dict = FindDictionaryForObject( o, false )
		  if dict=nil OR NOT dict.HasKey( key ) then
		    dim e as new KeyNotFoundException
		    e.Message = "This AttachedProperty does not exist"
		    raise  e
		  end if
		  
		  return   dict.Value( key )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttachedProperty(extends o as Object, key as string, assigns value as Variant)
		  //Attach a key/value pair to the given object
		  
		  dim dict as Dictionary
		  
		  dict = FindDictionaryForObject( o, true )
		  dict.Value( key ) = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttachedPropertyGetAll(extends o as Object, createIfNecessary as Boolean = false) As Dictionary
		  //Get all the stored value as a Dictionary
		  
		  return   FindDictionaryForObject( o, createIfNecessary )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttachedPropertyLookup(extends o as Object, key as String, defaultValue as variant, storeDefault as Boolean = false) As Variant
		  //Get the stored value or default value (which is stored if storeDefault is true)
		  
		  dim dict as Dictionary
		  
		  dict = FindDictionaryForObject( o, storeDefault )
		  if dict=nil then
		    return   defaultValue
		  end if
		  
		  if NOT dict.HasKey( key ) then
		    if storeDefault then
		      dict.Value( key ) = defaultValue
		    end if
		    return  defaultValue
		    
		  else
		    return   dict.Value( key )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttachedPropertyRemove(extends o as Object, key as String, raiseExceptionOnFailure as boolean = false)
		  //Remove an AttachedProperty
		  
		  dim dict as Dictionary
		  
		  dict = FindDictionaryForObject( o, false )
		  if dict=nil OR NOT dict.HasKey( key ) then
		    if raiseExceptionOnFailure then
		      dim e as new KeyNotFoundException
		      e.Message = "This AttachedProperty does not exist"
		      raise  e
		      
		    else
		      return
		      
		    end if
		  end if
		  
		  dict.Remove( key )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CleanUp()
		  //Remove all keys/values which correspond to a destroyed object
		  
		  if Storage=nil then
		    init
		    return
		  end if
		  
		  for i as integer = Storage.Count - 1 downto 0
		    if WeakRef( Storage.Key( i )).Value = nil then
		      Storage.Remove   Storage.Key( i )
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindDictionaryForNSObject(obj as NSObject, createIfNecessary as boolean = false) As Dictionary
		  //Find an existing key
		  
		  CleanUp  //Create Storage if necessary and remove AttachedProperties for destroyed objects
		  
		  for i as integer = 0 to NSStorage.Count - 1
		    if NSStorage.Key( i )=obj.id then
		      return   NSStorage.Value( NSStorage.Key( i ))
		    end if
		  next
		  
		  if createIfNecessary then
		    dim dict as new Dictionary
		    NSStorage.Value( obj.id ) = dict
		    
		    return  dict
		    
		  else
		    return  nil
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindDictionaryForObject(obj as Object, createIfNecessary as boolean = false) As Dictionary
		  //Find an existing key
		  
		  CleanUp  //Create Storage if necessary and remove AttachedProperties for destroyed objects
		  
		  dim wr as WeakRef
		  
		  for i as integer = 0 to Storage.Count - 1
		    if WeakRef( Storage.Key( i )).Value=obj then
		      return   Storage.Value( Storage.Key( i ))
		      exit
		    end if
		  next
		  
		  if createIfNecessary then
		    dim dict as new Dictionary
		    
		    wr = new WeakRef( obj )
		    Storage.Value( wr ) = dict
		    
		    return  dict
		    
		  else
		    return  nil
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init()
		  
		  NSStorage = new Dictionary
		  Storage = new Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSAttachedProperty(extends o as NSObject, key as String) As Variant
		  //Get the stored value
		  
		  dim dict as Dictionary
		  
		  dict = FindDictionaryForNSObject( o, false )
		  if dict=nil OR NOT dict.HasKey( key ) then
		    dim e as new KeyNotFoundException
		    e.Message = "This AttachedProperty does not exist"
		    raise  e
		  end if
		  
		  return   dict.Value( key )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NSAttachedProperty(extends o as NSObject, key as string, assigns value as Variant)
		  //Attach a key/value pair to the given object
		  
		  dim dict as Dictionary
		  
		  dict = FindDictionaryForNSObject( o, true )
		  dict.Value( key ) = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSAttachedPropertyGetAll(extends o as NSObject, createIfNecessary as Boolean = false) As Dictionary
		  //Get all the stored value as a Dictionary
		  
		  return   FindDictionaryForNSObject( o, createIfNecessary )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSAttachedPropertyLookup(extends o as NSObject, key as String, defaultValue as variant, storeDefault as Boolean = false) As Variant
		  //Get the stored value or default value (which is stored if storeDefault is true)
		  
		  dim dict as Dictionary
		  
		  dict = FindDictionaryForNSObject( o, storeDefault )
		  if dict=nil then
		    return   defaultValue
		  end if
		  
		  if NOT dict.HasKey( key ) then
		    if storeDefault then
		      dict.Value( key ) = defaultValue
		    end if
		    return  defaultValue
		    
		  else
		    return   dict.Value( key )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NSAttachedPropertyRemove(extends o as NSObject, key as String, raiseExceptionOnFailure as boolean = false)
		  //Remove an AttachedProperty
		  
		  dim dict as Dictionary
		  
		  dict = FindDictionaryForNSObject( o, false )
		  if dict=nil OR NOT dict.HasKey( key ) then
		    if raiseExceptionOnFailure then
		      dim e as new KeyNotFoundException
		      e.Message = "This AttachedProperty does not exist"
		      raise  e
		      
		    else
		      return
		      
		    end if
		  end if
		  
		  dict.Remove( key )
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Read Me
		AttachedProperties allow to attach named values to any object and are deleted when the object they are attached to is destroyed.
		Each AttachProperty requires a key (as string) to be got or set.
		
		Example:
		
		dim pict as Picture
		pict.AttachedProperty( "myProperty" ) = myNewValue
		
		NOTE: an AttachedProperty is completely independant of a real Property even if you use the same property name.
	#tag EndNote


	#tag Property, Flags = &h21
		Private NSStorage As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Storage As Dictionary
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

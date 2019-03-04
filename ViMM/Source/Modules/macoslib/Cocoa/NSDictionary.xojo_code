#tag Class
Class NSDictionary
Inherits NSObject
	#tag Method, Flags = &h0
		Function AllKeys() As NSArray
		  #if TargetMacOS
		    declare function allKeys lib CocoaLib selector "allKeys" (id as Ptr) as Ptr
		    
		    return new NSArray(allKeys(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function AllKeys(anObject as NSObject) As NSArray
		  //# Returns a new array containing the keys corresponding to all occurrences of a given object in the dictionary.
		  
		  #if targetMacOS
		    declare function allKeysForObject lib CocoaLib selector "allKeysForObject:" (obj_id as Ptr, anObject as Ptr) as Ptr
		    
		    RequireNonNilArgument(anObject, "anObject")
		    
		    return new NSArray(allKeysForObject(self, anObject))
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllValues() As NSArray
		  #if TargetMacOS
		    declare function allValues lib CocoaLib selector "allValues" (id as Ptr) as Ptr
		    
		    return new NSArray(allValues(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSDictionary")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys as NSArray, values as NSArray)
		  //# Creates and returns a dictionary containing entries constructed from the contents of an array of keys and an array of values.
		  
		  #if TargetMacOS
		    declare function dictionaryWithObjectsforKeys lib CocoaLib selector "dictionaryWithObjects:forKeys:" (cls as Ptr, nsa1 as Ptr, nsa2 as Ptr) as Ptr
		    
		    if keys is nil then
		      dim e as new NilObjectException
		      e.Message = CurrentMethodName + ": keys cannot be nil."
		      raise e
		    end if
		    if keys is nil then
		      dim e as new NilObjectException
		      e.Message = CurrentMethodName + ": keys cannot be nil."
		      raise e
		    end if
		    
		    Super.Constructor(dictionaryWithObjectsforKeys( Cocoa.NSClassFromString("NSDictionary"), values, keys))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary)
		  //#
		  #if targetMacOS
		    declare function initWithDictionary lib CocoaLib selector "initWithDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Ptr
		    
		    RequireNonNilArgument(otherDictionary, "otherDictionary")
		    
		    super.Constructor(initWithDictionary(Allocate("NSDictionary"), otherDictionary), NSDictionary.hasOwnership)
		  #else
		    #pragma unused otherDictionary
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys() as NSObject, objects() as NSObject)
		  //# Initializes a newly allocated dictionary with entries constructed from the contents of the objects and keys arrays.
		  
		  #if targetMacOS
		    declare function initWithObjects lib CocoaLib selector "initWithObjects:forKeys:" (obj_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		    
		    dim keysArray as new NSArray(keys)
		    dim objectsArray as new NSArray(objects)
		    
		    super.Constructor(initWithObjects(Allocate("NSDictionary"), objectsArray, keysArray), NSDictionary.hasOwnership)
		  #else
		    #pragma unused keys
		    #pragma unused objects
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(path as NSString)
		  //# Create a new NSDictionary from a file (like as .plist file)
		  
		  #if targetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" (obj_id as Ptr, path as CFStringRef) as Ptr
		    
		    RequireNonNilArgument(path, "path")
		    
		    super.Constructor(initWithContentsOfFile(Allocate("NSDictionary"), path), NSDictionary.hasOwnership)
		  #else
		    #pragma unused path
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  //# Initializes a newly allocated dictionary using the keys and values found at a given URL.
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    RequireNonNilArgument(aURL, "aURL")
		    
		    super.Constructor(initWithContentsOfURL(Allocate("NSDictionary"), aURL), NSDictionary.hasOwnership)
		  #else
		    #pragma unused aURL
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSDictionary
		  #if TargetMacOS
		    declare function copy lib CocoaLib selector "copy" (id as Ptr) as Ptr
		    
		    return new NSDictionary(copy(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSDictionary
		  //# Creates and returns an empty dictionary.
		  
		  #if TargetMacOS
		    declare function dictionary_ lib CocoaLib selector "dictionary" (class_id as Ptr) as Ptr
		    
		    dim dictRef as Ptr = dictionary_(ClassRef)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromDictionary(dict as Dictionary) As NSDictionary
		  #if TargetMacOS
		    dim md as new NSMutableDictionary
		    
		    if dict=nil then
		      return   nil
		    end if
		    
		    for i as integer = 0 to dict.Count - 1
		      md.Value( Cocoa.NSObjectFromVariant( dict.Key( i ))) = Cocoa.NSObjectFromVariant( dict.value( dict.key( i )))
		    next
		    
		    return   md.Copy
		    
		  #else
		    
		    #pragma unused dict
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromDictionary(otherDictionary as NSDictionary) As NSDictionary
		  //# Creates and returns a dictionary containing the keys and values from another given dictionary.
		  
		  #if TargetMacOS
		    declare function dictionaryWithDictionary lib CocoaLib selector "dictionaryWithDictionary:" _
		    (class_id as Ptr, otherDictionary as Ptr) as Ptr
		    
		    if otherDictionary <> nil then
		      dim dictRef as Ptr = dictionaryWithDictionary(ClassRef, otherDictionary)
		      if dictRef <> nil then
		        return new NSDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromFile(file as FolderItem) As NSDictionary
		  //# Create a new NSDictionary from a file (like as .plist file)
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfFile lib CocoaLib selector "dictionaryWithContentsOfFile:" (cls as Ptr, path as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim p as Ptr = dictionaryWithContentsOfFile( Cocoa.NSClassFromString( "NSDictionary" ), file.POSIXPath )
		      
		      if p<>nil then
		        return   new NSDictionary( p, false )
		      end if
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromObject(key as Ptr, anObject as Ptr) As NSDictionary
		  //# Creates and returns a dictionary containing a given key and value.
		  
		  #if TargetMacOS
		    declare function dictionaryWithObject lib CocoaLib selector "dictionaryWithObject:forKey:" _
		    (class_id as Ptr, anObject as Ptr, key as Ptr) as Ptr
		    
		    dim dictRef as Ptr = dictionaryWithObject(ClassRef, anObject, key)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused key
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromObjects(keys() as NSObject, objects() as NSObject) As NSDictionary
		  //# Creates and returns a dictionary containing entries constructed from the contents of an array of keys and an array of values.
		  
		  #if TargetMacOS
		    declare function dictionaryWithObjects lib CocoaLib selector "dictionaryWithObjects:forKeys:" _
		    (class_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		    
		    dim keysArray as new NSArray(keys)
		    dim objectsArray as new NSArray(objects)
		    
		    dim dictRef as Ptr = dictionaryWithObjects(ClassRef, objectsArray, keysArray)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused keys
		    #pragma unused objects
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateFromURL(aURL as NSURL) As NSDictionary
		  //# Creates and returns a dictionary using the keys and values found in a resource specified by a given URL.
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfURL lib CocoaLib selector "dictionaryWithContentsOfURL:" _
		    (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    if aURL <> nil then
		      dim dictRef as Ptr = dictionaryWithContentsOfURL(ClassRef, aURL)
		      if dictRef <> nil then
		        return new NSDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileCreationDate() As NSDate
		  //# Returns the value for the NSFileCreationDate key.
		  
		  #if targetMacOS
		    declare function fileCreationDate lib CocoaLib selector "fileCreationDate" (obj_id as Ptr) as Ptr
		    
		    dim dateRef as Ptr = fileCreationDate(self)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileExtensionHidden() As Boolean
		  //# Returns the value for the NSFileExtensionHidden key.
		  
		  #if targetMacOS
		    declare function fileExtensionHidden lib CocoaLib selector "fileExtensionHidden" (obj_id as Ptr) as Boolean
		    
		    return fileExtensionHidden(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileGroupOwnerAccountID() As NSNumber
		  //# Returns the value for the NSFileGroupOwnerAccountID key.
		  
		  #if targetMacOS
		    declare function fileGroupOwnerAccountID lib CocoaLib selector "fileGroupOwnerAccountID" (obj_id as Ptr) as Ptr
		    
		    dim numberRef as Ptr = fileGroupOwnerAccountID(self)
		    if numberRef <> nil then
		      return new NSNumber(numberRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileGroupOwnerAccountName() As NSString
		  //# Returns the value for the NSFileGroupOwnerAccountName key.
		  
		  #if targetMacOS
		    declare function fileGroupOwnerAccountName lib CocoaLib selector "fileGroupOwnerAccountName" (obj_id as Ptr) as Ptr
		    
		    return new NSString(fileGroupOwnerAccountName(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileHFSCreatorCode() As OSType
		  //# Returns the value for the NSFileHFSCreatorCode key.
		  
		  #if targetMacOS
		    declare function fileHFSCreatorCode lib CocoaLib selector "fileHFSCreatorCode" (obj_id as Ptr) as OSType
		    
		    return fileHFSCreatorCode(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileHFSTypeCode() As OSType
		  //# Returns the value for the NSFileHFSTypeCode key.
		  
		  #if targetMacOS
		    declare function fileHFSTypeCode lib CocoaLib selector "fileHFSTypeCode" (obj_id as Ptr) as OSType
		    
		    return fileHFSTypeCode(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileIsAppendOnly() As Boolean
		  //# Returns the value for the NSFileAppendOnly key.
		  
		  #if targetMacOS
		    declare function fileIsAppendOnly lib CocoaLib selector "fileIsAppendOnly" (obj_id as Ptr) as Boolean
		    
		    return fileIsAppendOnly(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileIsImmutable() As Boolean
		  //# Returns the value for the NSFileImmutable key.
		  
		  #if targetMacOS
		    declare function fileIsImmutable lib CocoaLib selector "fileIsImmutable" (obj_id as Ptr) as Boolean
		    
		    return fileIsImmutable(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileModificationDate() As NSDate
		  //# Returns the value for the key NSFileModificationDate.
		  
		  #if targetMacOS
		    declare function fileModificationDate lib CocoaLib selector "fileModificationDate" (obj_id as Ptr) as Ptr
		    
		    dim dateRef as Ptr = fileModificationDate(self)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileOwnerAccountID() As NSNumber
		  //# Returns the value for the NSFileOwnerAccountID key.
		  
		  #if targetMacOS
		    declare function fileOwnerAccountID lib CocoaLib selector "fileOwnerAccountID" (obj_id as Ptr) as Ptr
		    
		    dim numberRef as Ptr = fileOwnerAccountID(self)
		    if numberRef <> nil then
		      return new NSNumber(numberRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileOwnerAccountName() As NSString
		  //# Returns the value for the key NSFileOwnerAccountName.
		  
		  #if targetMacOS
		    declare function fileOwnerAccountName lib CocoaLib selector "fileOwnerAccountName" (obj_id as Ptr) as Ptr
		    
		    return new NSString(fileOwnerAccountName(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FilePosixPermissions() As UInt32
		  //# Returns the value for the key NSFilePosixPermissions.
		  
		  #if targetMacOS
		    declare function filePosixPermissions lib CocoaLib selector "filePosixPermissions" (obj_id as Ptr) as UInt32
		    
		    return filePosixPermissions(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSize() As UInt64
		  //# Returns the value for the key NSFileSize.
		  
		  #if targetMacOS
		    declare function fileSize lib CocoaLib selector "fileSize" (obj_id as Ptr) as UInt64
		    
		    return fileSize(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSystemFileNumber() As UInt32
		  //# Returns the value for the key NSFileSystemFileNumber.
		  
		  #if targetMacOS
		    declare function fileSystemFileNumber lib CocoaLib selector "fileSystemFileNumber" (obj_id as Ptr) as UInt32
		    
		    return fileSystemFileNumber(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSystemNumber() As Integer
		  //# Returns the value for the key NSFileSystemNumber.
		  
		  #if targetMacOS
		    declare function fileSystemNumber lib CocoaLib selector "fileSystemNumber" (obj_id as Ptr) as Integer
		    
		    return fileSystemNumber(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileType() As NSString
		  //# Returns the value for the key NSFileType.
		  
		  #if targetMacOS
		    declare function fileType lib CocoaLib selector "fileType" (obj_id as Ptr) as Ptr
		    
		    return new NSString(fileType(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(key as NSObject) As Boolean
		  
		  return   ( me.Value( key ) <> nil )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(otherDictionary as NSDictionary) As Boolean
		  //# Returns a Boolean value that indicates whether the contents of the receiving dictionary are equal to the contents of another given dictionary.
		  
		  #if targetMacOS
		    declare function isEqualToDictionary lib CocoaLib selector "isEqualToDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Boolean
		    
		    dim otherDictRef as Ptr
		    if otherDictionary <> nil then
		      otherDictRef = otherDictionary
		    else
		      otherDictRef = nil
		    end if
		    
		    return isEqualToDictionary(self, otherDictRef)
		  #else
		    #pragma unused otherDictionary
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function KeyEnumerator() As NSEnumerator
		  //# Returns an enumerator object that lets you access each key in the dictionary.
		  
		  #if targetMacOS
		    declare function keyEnumerator lib CocoaLib selector "keyEnumerator" (obj_id as Ptr) as Ptr
		    
		    return new NSEnumerator(keyEnumerator(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSStringValue(key as NSObject) As NSString
		  //# Get an NSString corresponding to a key
		  
		  #if TargetMacOS
		    dim p as Ptr = self.Value(key)
		    if p <> nil then
		      return new NSString(p)
		    else
		      //key not found, I believe.
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSURLValue(key as NSObject) As NSURL
		  //# Get an NSURL corresponding to a key
		  
		  #if TargetMacOS
		    dim p as Ptr = self.Value(key)
		    if p <> nil then
		      return new NSURL(p)
		    else
		      //key not found, I believe.
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As NativeSubclass.DictionaryCaseSensitive
		  // Convert to a NativeSubclass.DictionaryCaseSensitive.
		  // This is a Dictionary subclass that can be assigned to a variable defined
		  // as a Dictionary. Preserves the case-sensitivity of the NSDictionary.
		  
		  #if TargetMacOS
		    dim dict as new NativeSubclass.DictionaryCaseSensitive
		    
		    dim keys as NSArray = me.AllKeys
		    dim values as NSArray = me.AllValues
		    dim oneKey, oneValue as objHasVariantValue
		    
		    dim lastIndex as integer = keys.Count - 1 // Optimization
		    for i as integer = 0 to lastIndex
		      oneKey = Cocoa.NSObjectFromNSPtr( keys.Value( i ))
		      oneValue = Cocoa.NSObjectFromNSPtr( values.Value( i ))
		      
		      dict.Value( oneKey.VariantValue ) = oneValue.VariantValue
		    next
		    
		    return  dict
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub RequireNonNilArgument(value as Variant, name as String)
		  if value is nil then
		    dim e as new NilObjectException
		    e.Message = name + " cannot be nil."
		    raise e
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as Ptr) As Ptr
		  //# Get a value corresponding to a key
		  
		  #if TargetMacOS
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (id as Ptr, key as Ptr) as Ptr
		    
		    RequireNonNilArgument(key, "key")
		    
		    return objectForKey(self, key)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ValueEnumerator() As NSEnumerator
		  //# Returns an enumerator object that lets you access each value in the dictionary.
		  
		  #if targetMacOS
		    declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		    
		    return new NSEnumerator(objectEnumerator(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As Variant
		  // Uses Operator_Convert
		  
		  dim r as NativeSubclass.DictionaryCaseSensitive = me.Operator_Convert
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteToFile(file as FolderItem, atomically as Boolean = true) As Boolean
		  //# Write the NSDictionary to 'file'. Returns true on success
		  
		  #if TargetMacOS
		    declare function writeToFile lib CocoaLib selector "writeToFile:atomically:" (id as Ptr, path as CFStringRef, atomically as Boolean) as Boolean
		    
		    RequireNonNilArgument(file, "file")
		    
		    return writeToFile(self, file.POSIXPath, atomically )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function WriteToURL(aURL as NSURL, atomically as Boolean = true) As Boolean
		  //# Writes a property list representation of the contents of the dictionary to a given URL.
		  
		  #if targetMacOS
		    declare function writeToURL lib CocoaLib selector "writeToURL:atomically:" (obj_id as Ptr, aURL as Ptr, flag as Boolean) as Boolean
		    
		    dim urlRef as Ptr
		    if urlRef <> nil then
		      urlRef = aURL
		    else
		      urlRef = nil
		    end if
		    
		    return writeToURL(self, urlRef, atomically)
		  #else
		    #pragma unused aURL
		    #pragma unused atomically
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function m_count lib CocoaLib selector "count" ( id as Ptr ) as UInt32
			    
			    return   m_count( me.id )
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
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

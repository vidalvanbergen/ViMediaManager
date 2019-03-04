#tag Class
Class NSMutableDictionary
Inherits NSDictionary
	#tag Method, Flags = &h0
		Sub AddEntries(d as NSDictionary)
		  
		  #if TargetMacOS
		    declare sub addEntriesFromDictionary lib Cocoalib selector "addEntriesFromDictionary:" ( id as Ptr, value as Ptr )
		    
		    if d is nil then
		      dim e as new NilObjectException
		      e.Message = CurrentMethodName + ": d cannot be nil."
		      raise e
		    end if
		    
		    addEntriesFromDictionary(self, d)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSMutableDictionary")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  //# Delete all the values stored in the dictionary
		  
		  #if TargetMacOS
		    declare sub removeAllObjects lib CocoaLib selector "removeAllObjects" (id as Ptr)
		    
		    removeAllObjects(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  #if TargetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" ( cls as Ptr, path as CFStringRef ) as Ptr
		    
		    Super.Constructor(initWithContentsOfFile(Allocate("NSMutableDictionary"), file.POSIXPath), NSMutableDictionary.hasOwnership)
		  #else
		    #pragma Unused file
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(capacity as Integer = 20)
		  #if TargetMacOS
		    declare function dictionaryWithCapacity lib CocoaLib selector "dictionaryWithCapacity:" ( cls as Ptr, capacity as UInt32 ) as Ptr
		    
		    Super.Constructor(dictionaryWithCapacity(Cocoa.NSClassFromString( "NSMutableDictionary" ), capacity))
		  #else
		    #pragma Unused capacity
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary)
		  
		  #if targetMacOS
		    declare function initWithDictionary lib CocoaLib selector "initWithDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Ptr
		    
		    super.Constructor(initWithDictionary(Allocate("NSMutableDictionary"), otherDictionary), NSMutableDictionary.hasOwnership)
		  #else
		    #pragma unused otherDictionary
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary, copyItems as Boolean)
		  
		  #if targetMacOS
		    declare function initWithDictionary lib CocoaLib selector "initWithDictionary:copyItems:" (obj_id as Ptr, otherDictionary as Ptr, flag as Boolean) as Ptr
		    
		    super.Constructor(initWithDictionary(Allocate("NSMutableDictionary"), otherDictionary, copyItems), NSMutableDictionary.hasOwnership)
		  #else
		    #pragma unused otherDictionary
		    #pragma unused copyItems
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys() as NSObject, objects() as NSObject)
		  
		  #if targetMacOS
		    declare function initWithObjects lib CocoaLib selector "initWithObjects:forKeys:" (obj_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		    
		    dim keysArray as new NSArray(keys)
		    dim objectsArray as new NSArray(objects)
		    
		    super.Constructor(initWithObjects(Allocate("NSMutableDictionary"), objectsArray, keysArray), NSMutableDictionary.hasOwnership)
		  #else
		    #pragma unused keys
		    #pragma unused objects
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    super.Constructor(initWithContentsOfURL(Allocate("NSMutableDictionary"), aURL), NSMutableDictionary.hasOwnership)
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSMutableDictionary
		  //# Creates and returns an empty dictionary.
		  
		  #if TargetMacOS
		    declare function createDictionary lib CocoaLib selector "dictionary" (class_id as Ptr) as Ptr
		    
		    dim dictRef as Ptr = createDictionary(ClassRef)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithCapacity(numItems as Integer) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithCapacity lib CocoaLib selector "dictionaryWithCapacity:" (class_id as Ptr, numItems as UInt32) as Ptr
		    
		    dim dictRef as Ptr = dictionaryWithCapacity(ClassRef, numItems)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused numItems
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithDictionary(otherDictionary as NSDictionary) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithDictionary lib CocoaLib selector "dictionaryWithDictionary:" _
		    (class_id as Ptr, otherDictionary as Ptr) as Ptr
		    
		    if otherDictionary <> nil then
		      dim dictRef as Ptr = dictionaryWithDictionary(ClassRef, otherDictionary)
		      if dictRef <> nil then
		        return new NSMutableDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithFile(file as FolderItem) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfFile lib CocoaLib selector "dictionaryWithContentsOfFile:" _
		    (class_id as Ptr, path as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim dictRef as Ptr = dictionaryWithContentsOfFile(ClassRef, file.POSIXPath)
		      if dictRef <> nil then
		        return new NSMutableDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObject(key as Ptr, anObject as Ptr) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithObject lib CocoaLib selector "dictionaryWithObject:forKey:" _
		    (class_id as Ptr, anObject as Ptr, key as Ptr) as Ptr
		    
		    dim dictRef as Ptr = dictionaryWithObject(ClassRef, anObject, key)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused key
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObjects(keys() as NSObject, objects() as NSObject) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithObjects lib CocoaLib selector "dictionaryWithObjects:forKeys:" _
		    (class_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		    
		    dim keysArray as new NSArray(keys)
		    dim objectsArray as new NSArray(objects)
		    
		    dim dictRef as Ptr = dictionaryWithObjects(ClassRef, objectsArray, keysArray)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused keys
		    #pragma unused objects
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithURL(aURL as NSURL) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfURL lib CocoaLib selector "dictionaryWithContentsOfURL:" _
		    (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    if aURL <> nil then
		      dim dictRef as Ptr = dictionaryWithContentsOfURL(ClassRef, aURL)
		      if dictRef <> nil then
		        return new NSMutableDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(otherDictionary as NSDictionary) As NSDictionary
		  
		  self.AddEntries otherDictionary
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(keys as NSArray)
		  
		  #if targetMacOS
		    declare sub removeObjectsForKeys lib CocoaLib selector "removeObjectsForKeys:" (obj_id as Ptr, keys as Ptr)
		    
		    if keys <> nil then
		      removeObjectsForKeys self, keys
		    else
		      //no-op?
		    end if
		    
		  #else
		    #pragma unused keys
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(key as Ptr)
		  #if targetMacOS
		    declare sub removeObjectForKey lib CocoaLib selector "removeObjectForKey:" (obj_id as Ptr, key as Ptr)
		    
		    removeObjectForKey self, key
		    
		  #else
		    #pragma unused key
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveAll()
		  
		  #if targetMacOS
		    declare sub removeAllObjects lib CocoaLib selector "removeAllObjects" (obj_id as Ptr)
		    
		    removeAllObjects self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(otherDictionary as NSDictionary)
		  
		  #if targetMacOS
		    declare sub setDictionary lib CocoaLib selector "setDictionary:" (obj_id as Ptr, otherDictionary as Ptr)
		    
		    if otherDictionary <> nil then
		      setDictionary self, otherDictionary
		    else
		      //was this intended to be a no-op?
		    end if
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as Ptr, assigns newValue as Ptr)
		  
		  #if TargetMacOS
		    declare sub setObject lib Cocoalib selector "setObject:forKey:" ( id as Ptr, key as Ptr, value as Ptr )
		    
		    setObject(self, newValue, key)
		  #endif
		End Sub
	#tag EndMethod


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

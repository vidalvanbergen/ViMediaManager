#tag Class
Class NSSet
Inherits NSObject
	#tag Method, Flags = &h1000
		Function AllObjects() As NSArray
		  
		  #if targetMacOS
		    declare function allObjects lib CocoaLib selector "allObjects" (obj_id as Ptr) as Ptr
		    
		    dim arrayRef as Ptr = allObjects(self)
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function AnyObject() As NSObject
		  
		  #if targetMacOS
		    declare function anyObject lib CocoaLib selector "anyObject" (obj_id as Ptr) as Ptr
		    
		    dim objRef as Ptr = anyObject(self)
		    if objRef <> nil then
		      return new NSObject(objRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSSet")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray)
		  
		  #if targetMacOS
		    declare function initWithArray lib CocoaLib selector "initWithArray:" (obj_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    super.Constructor(initWithArray(Allocate("NSSet"), anArrayRef), NSSet.hasOwnership)
		    
		  #else
		    #pragma unused anArray
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(objects() as NSObject)
		  
		  #if targetMacOS
		    declare function initWithObjects lib CocoaLib selector "initWithObjects:count:" (obj_id as Ptr, objects as Ptr, count as UInteger) as Ptr
		    
		    dim uboundObject as Integer = objects.ubound
		    dim objectCount as Integer = uboundObject+1
		    if uboundObject > -1 then
		      
		      dim m as new MemoryBlock(SizeOfPointer*objectCount)
		      for i as integer = 0 to uboundObject
		        m.UInt64Value(i*SizeOfPointer) = UInt64(objects(i).id)
		      next
		      
		      super.Constructor(initWithObjects(Allocate("NSSet"), m, objectCount), NSSet.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aSet as NSSet)
		  
		  #if TargetMacOS
		    declare function initWithSet lib CocoaLib selector "initWithSet:" (obj_id as Ptr, aSet as Ptr) as Ptr
		    
		    dim aSetRef as Ptr
		    if aSet <> nil then
		      aSetRef = aSet
		    end if
		    
		    super.Constructor(initWithSet(Allocate("NSSet"), aSetRef), NSSet.hasOwnership)
		    
		  #else
		    #pragma unused aSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aSet as NSSet, copyItems as Boolean)
		  
		  #if TargetMacOS
		    declare function initWithSet lib CocoaLib selector "initWithSet:copyItems:" (obj_id as Ptr, aSet as Ptr, copyItems as Boolean) as Ptr
		    
		    dim aSetRef as Ptr
		    if aSet <> nil then
		      aSetRef = aSet
		    end if
		    
		    super.Constructor(initWithSet(Allocate("NSSet"), aSetRef, copyItems), NSSet.hasOwnership)
		    
		  #else
		    #pragma unused aSet
		    #pragma unused copyItems
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ContainsObject(anObject as NSObject) As Boolean
		  
		  #if targetMacOS
		    declare function containsObject lib CocoaLib selector "containsObject:" (obj_id as Ptr, anObjects as Ptr) as Boolean
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    return containsObject(self, anObjectRef)
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Count() As UInt32
		  
		  #if targetMacOS
		    declare function count lib CocoaLib selector "count" (obj_id as Ptr) as UInt32
		    
		    return count(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSSet
		  
		  #if TargetMacOS
		    declare function set_ lib CocoaLib selector "set" (class_id as Ptr) as Ptr
		    
		    dim setRef as Ptr = set_(ClassRef)
		    if setRef <> nil then
		      return new NSSet(setRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithArray(anArray as NSArray) As NSSet
		  
		  #if TargetMacOS
		    declare function setWithArray lib CocoaLib selector "setWithArray:" (class_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    dim setRef as Ptr = setWithArray(ClassRef, anArrayRef)
		    if setRef <> nil then
		      return new NSSet(setRef)
		    end if
		    
		  #else
		    #pragma unused anArray
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObject(anObject as NSObject) As NSSet
		  
		  #if TargetMacOS
		    declare function setWithObject lib CocoaLib selector "setWithObject:" (class_id as Ptr, anObject as Ptr) as Ptr
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    dim setRef as Ptr = setWithObject(ClassRef, anObjectRef)
		    if setRef <> nil then
		      return new NSSet(setRef)
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObjects(objects() as NSObject) As NSSet
		  
		  #if TargetMacOS
		    declare function setWithObjects lib CocoaLib selector "setWithObjects:count:" (class_id as Ptr, objects as Ptr, count as UInteger) as Ptr
		    
		    dim uboundObject as Integer = objects.ubound
		    dim objectCount as Integer = uboundObject+1
		    if uboundObject > -1 then
		      
		      dim m as new MemoryBlock(SizeOfPointer*objectCount)
		      for i as integer = 0 to uboundObject
		        m.UInt64Value(i*SizeOfPointer) = UInt64(objects(i).id)
		      next
		      
		      dim setRef as Ptr = setWithObjects(ClassRef, m, objectCount)
		      if setRef <> nil then
		        return new NSSet(setRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithSet(aSet as NSSet) As NSSet
		  
		  #if TargetMacOS
		    declare function setWithSet lib CocoaLib selector "setWithSet:" (class_id as Ptr, aSet as Ptr) as Ptr
		    
		    dim aSetRef as Ptr
		    if aSet <> nil then
		      aSetRef = aSet
		    end if
		    
		    dim setRef as Ptr = setWithSet(ClassRef, aSetRef)
		    if setRef <> nil then
		      return new NSSet(setRef)
		    end if
		    
		  #else
		    #pragma unused aSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Description(locale as NSLocale) As String
		  
		  #if targetMacOS
		    declare function descriptionWithLocale lib CocoaLib selector "descriptionWithLocale:" (obj_id as Ptr, locale as Ptr) as CFStringRef
		    
		    dim localeRef as Ptr
		    if locale <> nil then
		      localeRef = locale
		    end if
		    
		    return descriptionWithLocale(self, localeRef)
		    
		  #else
		    #pragma unused locale
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Enumerator() As NSEnumerator
		  
		  #if targetMacOS
		    declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		    
		    dim enumRef as Ptr = objectEnumerator(self)
		    
		    if enumRef <> nil then
		      return new NSEnumerator(enumRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FilteredSet(predicate as NSPredicate) As NSSet
		  
		  #if targetMacOS
		    declare function filteredSetUsingPredicate lib CocoaLib selector "filteredSetUsingPredicate:" (obj_id as Ptr, predicate as Ptr) as Ptr
		    
		    dim predicateRef as Ptr
		    if predicate <> nil then
		      predicateRef = predicate
		    end if
		    
		    dim setRef as Ptr = filteredSetUsingPredicate(self, predicateRef)
		    if setRef <> nil then
		      return new NSSet(setRef)
		    end if
		    
		  #else
		    #pragma unused predicate
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Intersects(otherSet as NSSet) As Boolean
		  
		  #if targetMacOS
		    declare function intersectsSet lib CocoaLib selector "intersectsSet:" (obj_id as Ptr, otherSet as Ptr) as Boolean
		    
		    dim setRef as Ptr
		    if otherSet <> nil then
		      setRef = otherSet
		    end if
		    
		    return intersectsSet(self, setRef)
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(otherSet as NSSet) As Boolean
		  
		  #if targetMacOS
		    declare function isEqualToSet lib CocoaLib selector "isEqualToSet:" (obj_id as Ptr, otherSet as Ptr) as Boolean
		    
		    dim setRef as Ptr
		    if otherSet <> nil then
		      setRef = otherSet
		    end if
		    
		    return isEqualToSet(self, setRef)
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsSubsetOf(otherSet as NSSet) As Boolean
		  
		  #if targetMacOS
		    declare function isSubsetOfSet lib CocoaLib selector "isSubsetOfSet:" (obj_id as Ptr, otherSet as Ptr) as Boolean
		    
		    dim setRef as Ptr
		    if otherSet <> nil then
		      setRef = otherSet
		    end if
		    
		    return isSubsetOfSet(self, setRef)
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub MakeObjectsPerformSelector(aSelector as String)
		  
		  #if targetMacOS
		    declare sub makeObjectsPerformSelector lib CocoaLib selector "makeObjectsPerformSelector:" (obj_id as Ptr, aSelector as Ptr)
		    
		    makeObjectsPerformSelector self, Cocoa.NSSelectorFromString(aSelector)
		    
		  #else
		    #pragma unused aSelector
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub MakeObjectsPerformSelector(aSelector as String, argument as NSObject)
		  
		  #if targetMacOS
		    declare sub makeObjectsPerformSelector lib CocoaLib selector "makeObjectsPerformSelector:withObject:" (obj_id as Ptr, aSelector as Ptr, argument as Ptr)
		    
		    dim argRef as Ptr
		    if argument <> nil then
		      argRef = argument
		    end if
		    
		    makeObjectsPerformSelector self, Cocoa.NSSelectorFromString(aSelector), argRef
		    
		  #else
		    #pragma unused aSelector
		    #pragma unused argument
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function SetByAddingObject(anObject as NSObject) As NSSet
		  
		  #if targetMacOS
		    declare function setByAddingObject lib CocoaLib selector "setByAddingObject:" (obj_id as Ptr, anObject as Ptr) as Ptr
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    dim setRef as Ptr = setByAddingObject(self, anObjectRef)
		    
		    if setRef <> nil then
		      return new NSSet(setRef)
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function SetByAddingObjectsFromArray(otherArray as NSArray) As NSSet
		  
		  #if targetMacOS
		    declare function setByAddingObjectsFromArray lib CocoaLib selector "setByAddingObjectsFromArray:" (obj_id as Ptr, otherArray as Ptr) as Ptr
		    
		    dim otherArrayRef as Ptr
		    if otherArray <> nil then
		      otherArrayRef = otherArray
		    end if
		    
		    dim newSetRef as Ptr = setByAddingObjectsFromArray(self, otherArrayRef)
		    
		    if newSetRef <> nil then
		      return new NSSet(newSetRef)
		    end if
		    
		  #else
		    #pragma unused otherArray
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function SetByAddingObjectsFromSet(otherSet as NSSet) As NSSet
		  
		  #if targetMacOS
		    declare function setByAddingObjectsFromSet lib CocoaLib selector "setByAddingObjectsFromSet:" (obj_id as Ptr, otherSet as Ptr) as Ptr
		    
		    dim otherSetRef as Ptr
		    if otherSet <> nil then
		      otherSetRef = otherSet
		    end if
		    
		    dim newSetRef as Ptr = setByAddingObjectsFromSet(self, otherSetRef)
		    
		    if newSetRef <> nil then
		      return new NSSet(newSetRef)
		    end if
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function SortedArray(sortDescriptors as NSArray) As NSArray
		  
		  #if targetMacOS
		    declare function sortedArrayUsingDescriptors lib CocoaLib selector "sortedArrayUsingDescriptors:" (obj_id as Ptr, sortDescriptors as Ptr) as Ptr
		    
		    dim sortDescriptorsRef as Ptr
		    if sortDescriptors <> nil then
		      sortDescriptorsRef = sortDescriptors
		    end if
		    
		    dim arrayRef as Ptr = sortedArrayUsingDescriptors(self, sortDescriptorsRef)
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		    
		  #else
		    #pragma unused sortDescriptors
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Value(key as String) As NSObject
		  
		  #if targetMacOS
		    declare function valueForKey lib CocoaLib selector "valueForKey:" (obj_id as Ptr, key as CFStringRef) as Ptr
		    
		    dim objRef as Ptr = valueForKey(self, key)
		    if objRef <> nil then
		      return new NSObject(objRef)
		    end if
		    
		  #else
		    #pragma unused key
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Value(key as String, assigns value as NSObject)
		  
		  #if targetMacOS
		    declare sub setValue lib CocoaLib selector "setValue:forKey:" (obj_id as Ptr, value as Ptr, key as CFStringRef)
		    
		    dim objRef as Ptr
		    if value <> nil then
		      objRef = value
		    end if
		    
		    setValue self, objRef, key
		    
		  #else
		    #pragma unused key
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod


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

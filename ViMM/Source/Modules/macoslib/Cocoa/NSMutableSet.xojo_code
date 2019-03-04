#tag Class
Class NSMutableSet
Inherits NSSet
	#tag Method, Flags = &h1000
		Sub Add(anArray as NSArray)
		  
		  #if targetMacOS
		    declare sub addObjectsFromArray lib CocoaLib selector "addObjectsFromArray:" (obj_id as Ptr, anArray as Ptr)
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    addObjectsFromArray self, anArrayRef
		    
		  #else
		    #pragma unused anArray
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Add(anObject as NSObject)
		  
		  #if targetMacOS
		    declare sub addObject lib CocoaLib selector "addObject:" (obj_id as Ptr, anObject as Ptr)
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    addObject self, anObjectRef
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSMutableSet")
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
		    
		    super.Constructor(initWithArray(Allocate("NSMutableSet"), anArrayRef), NSMutableSet.hasOwnership)
		    
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
		      
		      super.Constructor(initWithObjects(Allocate("NSMutableSet"), m, objectCount), NSMutableSet.hasOwnership)
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
		    
		    super.Constructor(initWithSet(Allocate("NSMutableSet"), aSetRef), NSMutableSet.hasOwnership)
		    
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
		    
		    super.Constructor(initWithSet(Allocate("NSMutableSet"), aSetRef, copyItems), NSMutableSet.hasOwnership)
		    
		  #else
		    #pragma unused aSet
		    #pragma unused copyItems
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(numItems as UInt32)
		  
		  #if TargetMacOS
		    declare function initWithCapacity lib CocoaLib selector "initWithCapacity:" (class_id as Ptr, numItems as UInt32) as Ptr
		    
		    super.Constructor(initWithCapacity(Allocate("NSMutableSet"), numItems), NSMutableSet.hasOwnership)
		    
		  #else
		    #pragma unused numItems
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSMutableSet
		  
		  #if TargetMacOS
		    declare function set_ lib CocoaLib selector "set" (class_id as Ptr) as Ptr
		    
		    dim setRef as Ptr = set_(ClassRef)
		    if setRef <> nil then
		      return new NSMutableSet(setRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithArray(anArray as NSArray) As NSMutableSet
		  
		  #if TargetMacOS
		    declare function setWithArray lib CocoaLib selector "setWithArray:" (class_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    dim setRef as Ptr = setWithArray(ClassRef, anArrayRef)
		    if setRef <> nil then
		      return new NSMutableSet(setRef)
		    end if
		    
		  #else
		    #pragma unused anArray
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithCapacity(numItems as UInt32) As NSMutableSet
		  
		  #if TargetMacOS
		    declare function setWithCapacity lib CocoaLib selector "setWithCapacity:" (class_id as Ptr, numItems as UInt32) as Ptr
		    
		    dim setRef as Ptr = setWithCapacity(ClassRef, numItems)
		    if setRef <> nil then
		      return new NSMutableSet(setRef)
		    end if
		    
		  #else
		    #pragma unused numItems
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObject(anObject as NSObject) As NSMutableSet
		  
		  #if TargetMacOS
		    declare function setWithObject lib CocoaLib selector "setWithObject:" (class_id as Ptr, anObject as Ptr) as Ptr
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    dim setRef as Ptr = setWithObject(ClassRef, anObjectRef)
		    if setRef <> nil then
		      return new NSMutableSet(setRef)
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObjects(objects() as NSObject) As NSMutableSet
		  
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
		        return new NSMutableSet(setRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithSet(aSet as NSSet) As NSMutableSet
		  
		  #if TargetMacOS
		    declare function setWithSet lib CocoaLib selector "setWithSet:" (class_id as Ptr, aSet as Ptr) as Ptr
		    
		    dim aSetRef as Ptr
		    if aSet <> nil then
		      aSetRef = aSet
		    end if
		    
		    dim setRef as Ptr = setWithSet(ClassRef, aSetRef)
		    if setRef <> nil then
		      return new NSMutableSet(setRef)
		    end if
		    
		  #else
		    #pragma unused aSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Filter(predicate as NSPredicate)
		  
		  #if targetMacOS
		    declare sub filterUsingPredicate lib CocoaLib selector "filterUsingPredicate:" (obj_id as Ptr, predicate as Ptr)
		    
		    dim predicateRef as Ptr
		    if predicate <> nil then
		      predicateRef = predicate
		    end if
		    
		    filterUsingPredicate self, predicateRef
		    
		  #else
		    #pragma unused predicate
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Intersect(otherSet as NSSet)
		  
		  #if targetMacOS
		    declare sub intersectSet lib CocoaLib selector "intersectSet:" (obj_id as Ptr, otherSet as Ptr)
		    
		    dim otherSetRef as Ptr
		    if otherSet <> nil then
		      otherSetRef = otherSet
		    end if
		    
		    intersectSet self, otherSet
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(anObject as NSObject)
		  
		  #if targetMacOS
		    declare sub removeObject lib CocoaLib selector "removeObject:" (obj_id as Ptr, anObject as Ptr)
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    removeObject self, anObjectRef
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveAll()
		  
		  #if targetMacOS
		    declare sub removeAllObjects lib CocoaLib selector "removeAllObjects:" (obj_id as Ptr)
		    
		    removeAllObjects self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Set(otherSet as NSSet)
		  
		  #if targetMacOS
		    declare sub setSet lib CocoaLib selector "setSet:" (obj_id as Ptr, otherSet as Ptr)
		    
		    dim otherSetRef as Ptr
		    if otherSet <> nil then
		      otherSetRef = otherSet
		    end if
		    
		    setSet self, otherSet
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Subtract(otherSet as NSSet)
		  
		  #if targetMacOS
		    declare sub minusSet lib CocoaLib selector "minusSet:" (obj_id as Ptr, otherSet as Ptr)
		    
		    dim otherSetRef as Ptr
		    if otherSet <> nil then
		      otherSetRef = otherSet
		    end if
		    
		    minusSet self, otherSet
		    
		  #else
		    #pragma unused otherSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Union(otherSet as NSSet)
		  
		  #if targetMacOS
		    declare sub unionSet lib CocoaLib selector "unionSet:" (obj_id as Ptr, otherSet as Ptr)
		    
		    dim otherSetRef as Ptr
		    if otherSet <> nil then
		      otherSetRef = otherSet
		    end if
		    
		    unionSet self, otherSet
		    
		  #else
		    #pragma unused otherSet
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

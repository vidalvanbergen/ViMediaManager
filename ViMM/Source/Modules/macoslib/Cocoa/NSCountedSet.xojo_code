#tag Class
Class NSCountedSet
Inherits NSMutableSet
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSCountedSet")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray)
		  //# Returns a counted set object initialized with the contents of a given array.
		  
		  #if targetMacOS
		    declare function initWithArray lib CocoaLib selector "initWithArray:" (obj_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    super.Constructor(initWithArray(Allocate("NSCountedSet"), anArrayRef), NSCountedSet.hasOwnership)
		  #else
		    #pragma unused anArray
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(objects() as NSObject)
		  //# Initializes a newly allocated set with a specified number of objects from a given C array of objects.
		  
		  #if targetMacOS
		    declare function initWithObjects lib CocoaLib selector "initWithObjects:count:" (obj_id as Ptr, objects as Ptr, count as UInteger) as Ptr
		    
		    dim uboundObject as Integer = objects.ubound
		    dim objectCount as Integer = uboundObject+1
		    if uboundObject > -1 then
		      
		      dim m as new MemoryBlock(SizeOfPointer*objectCount)
		      for i as integer = 0 to uboundObject
		        m.UInt64Value(i*SizeOfPointer) = UInt64(objects(i).id)
		      next
		      
		      super.Constructor(initWithObjects(Allocate("NSCountedSet"), m, objectCount), NSCountedSet.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aSet as NSSet)
		  //# Returns a counted set object initialized with the contents of a given set.
		  
		  #if TargetMacOS
		    declare function initWithSet lib CocoaLib selector "initWithSet:" (obj_id as Ptr, aSet as Ptr) as Ptr
		    
		    dim aSetRef as Ptr
		    if aSet <> nil then
		      aSetRef = aSet
		    end if
		    
		    super.Constructor(initWithSet(Allocate("NSCountedSet"), aSetRef), NSCountedSet.hasOwnership)
		  #else
		    #pragma unused aSet
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aSet as NSSet, copyItems as Boolean)
		  //# Initializes a new counted set with the contents of a set, optionally copying the objects in the set.
		  
		  #if TargetMacOS
		    declare function initWithSet lib CocoaLib selector "initWithSet:copyItems:" (obj_id as Ptr, aSet as Ptr, copyItems as Boolean) as Ptr
		    
		    dim aSetRef as Ptr
		    if aSet <> nil then
		      aSetRef = aSet
		    end if
		    
		    super.Constructor(initWithSet(Allocate("NSCountedSet"), aSetRef, copyItems), NSCountedSet.hasOwnership)
		    
		  #else
		    #pragma unused aSet
		    #pragma unused copyItems
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(numItems as UInt32)
		  //# Returns a counted set object initialized with enough memory to hold a given number of objects.
		  
		  #if TargetMacOS
		    declare function initWithCapacity lib CocoaLib selector "initWithCapacity:" (class_id as Ptr, numItems as UInt32) as Ptr
		    
		    super.Constructor(initWithCapacity(Allocate("NSCountedSet"), numItems), NSCountedSet.hasOwnership)
		  #else
		    #pragma unused numItems
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Count(anObject as NSObject) As UInt32
		  //# Returns the count associated with a given object in the set.
		  
		  #if TargetMacOS
		    declare function countForObject lib CocoaLib selector "countForObject:" (class_id as Ptr, anObject as Ptr) as UInt32
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    return countForObject(self, anObjectRef)
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSCountedSet
		  //# Creates and returns an empty set.
		  
		  #if TargetMacOS
		    declare function set_ lib CocoaLib selector "set" (class_id as Ptr) as Ptr
		    
		    dim setRef as Ptr = set_(ClassRef)
		    if setRef <> nil then
		      return new NSCountedSet(setRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithArray(anArray as NSArray) As NSCountedSet
		  //# Creates and returns a set containing a uniqued collection of the objects contained in a given array.
		  
		  #if TargetMacOS
		    declare function setWithArray lib CocoaLib selector "setWithArray:" (class_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    dim setRef as Ptr = setWithArray(ClassRef, anArrayRef)
		    if setRef <> nil then
		      return new NSCountedSet(setRef)
		    end if
		    
		  #else
		    #pragma unused anArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithCapacity(numItems as UInt32) As NSCountedSet
		  //# Creates and returns a mutable set with a given initial capacity.
		  
		  #if TargetMacOS
		    declare function setWithCapacity lib CocoaLib selector "setWithCapacity:" (class_id as Ptr, numItems as UInt32) as Ptr
		    
		    dim setRef as Ptr = setWithCapacity(ClassRef, numItems)
		    if setRef <> nil then
		      return new NSCountedSet(setRef)
		    end if
		    
		  #else
		    #pragma unused numItems
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObject(anObject as NSObject) As NSCountedSet
		  //# Creates and returns a set that contains a single given object.
		  
		  #if TargetMacOS
		    declare function setWithObject lib CocoaLib selector "setWithObject:" (class_id as Ptr, anObject as Ptr) as Ptr
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    dim setRef as Ptr = setWithObject(ClassRef, anObjectRef)
		    if setRef <> nil then
		      return new NSCountedSet(setRef)
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObjects(objects() as NSObject) As NSCountedSet
		  //# Creates and returns a set containing the objects in a given argument list.
		  
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
		        return new NSCountedSet(setRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithSet(aSet as NSSet) As NSCountedSet
		  //# Creates and returns a set containing the objects from another set.
		  
		  #if TargetMacOS
		    declare function setWithSet lib CocoaLib selector "setWithSet:" (class_id as Ptr, aSet as Ptr) as Ptr
		    
		    dim aSetRef as Ptr
		    if aSet <> nil then
		      aSetRef = aSet
		    end if
		    
		    dim setRef as Ptr = setWithSet(ClassRef, aSetRef)
		    if setRef <> nil then
		      return new NSCountedSet(setRef)
		    end if
		    
		  #else
		    #pragma unused aSet
		  #endif
		  
		End Function
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

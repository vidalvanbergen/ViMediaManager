#tag Class
Class NSMutableArray
Inherits NSArray
	#tag Method, Flags = &h1000
		Sub Append(otherArray as NSArray)
		  
		  #if targetMacOS
		    declare sub addObjectsFromArray lib CocoaLib selector "addObjectsFromArray:" (obj_id as Ptr, otherArray as Ptr)
		    
		    dim arrayRef as Ptr
		    if otherArray <> nil then
		      arrayRef = otherArray
		    end if
		    addObjectsFromArray self, arrayRef
		    
		  #else
		    #pragma unused otherArray
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Append(anObject as NSObject)
		  
		  #if targetMacOS
		    declare sub addObject lib CocoaLib selector "addObject:" ( id as Ptr, newItem as Ptr )
		    
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
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSMutableArray")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  Constructor   NSObject.Initialize( NSObject.Allocate( "NSMutableArray" )), false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  
		  #if targetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" (obj_id as Ptr, aPath as CFStringRef) as Ptr
		    
		    if file <> nil then
		      super.Constructor(initWithContentsOfFile(Allocate("NSMutableArray"), file.POSIXPath), NSMutableArray.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray)
		  
		  #if targetMacOS
		    declare function initWithArray lib CocoaLib selector "initWithArray:" (obj_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    super.Constructor(initWithArray(Allocate("NSMutableArray"), anArrayRef), NSMutableArray.hasOwnership)
		    
		  #else
		    #pragma unused anArray
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray, copyItems as Boolean)
		  
		  #if targetMacOS
		    declare function initWithArray lib CocoaLib selector "initWithArray:copyItems:" (obj_id as Ptr, anArray as Ptr, flag as Boolean) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    super.Constructor(initWithArray(Allocate("NSMutableArray"), anArrayRef, copyItems), NSMutableArray.hasOwnership)
		    
		  #else
		    #pragma unused anArray
		    #pragma unused copyItems
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
		      
		      dim m as new MemoryBlock(SizeOfPointer*(objectCount))
		      for i as integer = 0 to uboundObject
		        m.UInt64Value(i*SizeOfPointer) = UInt64(objects(i).id)
		      next
		      
		      super.Constructor(initWithObjects(Allocate("NSMutableArray"), m, objectCount), NSMutableArray.hasOwnership)
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    super.Constructor(initWithContentsOfURL(Allocate("NSMutableArray"), urlRef), NSMutableArray.hasOwnership)
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(strings() as String)
		  
		  dim nsstr() as NSObject
		  for each str as String in strings
		    nsstr.Append new NSString(str)
		  next
		  
		  self.Constructor(nsstr)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(capacity as UInt32)
		  
		  #if targetMacOS
		    declare function initWithCapacity lib CocoaLib selector "initWithCapacity:" (obj_id as Ptr, capacity as UInt32) as Ptr
		    
		    super.Constructor(initWithCapacity(Allocate("NSMutableArray"), capacity), NSMutableArray.hasOwnership)
		    
		  #else
		    #pragma unused capacity
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSMutableArray
		  
		  #if TargetMacOS
		    declare function array_ lib CocoaLib selector "array" (class_id as Ptr) as Ptr
		    
		    dim arrayRef as Ptr = array_(ClassRef)
		    if arrayRef <> nil then
		      return new NSMutableArray(arrayRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithArray(anArray as NSArray) As NSMutableArray
		  
		  #if TargetMacOS
		    declare function arrayWithArray lib CocoaLib selector "arrayWithArray:" (class_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    dim arrayRef as Ptr = arrayWithArray(ClassRef, anArrayRef)
		    
		    if arrayRef <> nil then
		      return new NSMutableArray(arrayRef)
		    end if
		    
		  #else
		    #pragma unused anArray
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithCapacity(capacity as UInt32) As NSMutableArray
		  
		  #if TargetMacOS
		    declare function arrayWithCapacity lib CocoaLib selector "arrayWithCapacity:" (class_id as Ptr, capacity as UInt32) as Ptr
		    
		    dim arrayRef as Ptr = arrayWithCapacity(ClassRef, capacity)
		    if arrayRef <> nil then
		      return new NSMutableArray(arrayRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused capacity
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithFile(file as FolderItem) As NSMutableArray
		  
		  #if TargetMacOS
		    declare function arrayWithContentsOfFile lib CocoaLib selector "arrayWithContentsOfFile:" (class_id as Ptr, aPath as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim arrayRef as Ptr = arrayWithContentsOfFile(ClassRef, file.POSIXPath)
		      
		      if arrayRef <> nil then
		        return new NSMutableArray(arrayRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObject(anObject as NSObject) As NSMutableArray
		  
		  #if TargetMacOS
		    declare function arrayWithObject lib CocoaLib selector "arrayWithObject:" (class_id as Ptr, anObject as Ptr) as Ptr
		    
		    if anObject <> nil then
		      dim arrayRef as Ptr = arrayWithObject(ClassRef, anObject)
		      
		      if arrayRef <> nil then
		        return new NSMutableArray(arrayRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObjects(objects() as NSObject) As NSMutableArray
		  
		  #if TargetMacOS
		    declare function arrayWithObjects lib CocoaLib selector "arrayWithObjects:count:" (class_id as Ptr, objects as Ptr, count as UInteger) as Ptr
		    
		    dim uboundObject as Integer = objects.ubound
		    dim objectCount as Integer = uboundObject+1
		    if uboundObject > -1 then
		      
		      dim m as new MemoryBlock(SizeOfPointer*(objectCount))
		      for i as integer = 0 to uboundObject
		        m.UInt64Value(i*SizeOfPointer) = UInt64(objects(i).id)
		      next
		      
		      dim arrayRef as Ptr = arrayWithObjects(ClassRef, m, objectCount)
		      
		      if arrayRef <> nil then
		        return new NSMutableArray(arrayRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithURL(aURL as NSURL) As NSMutableArray
		  
		  #if TargetMacOS
		    declare function arrayWithContentsOfURL lib CocoaLib selector "arrayWithContentsOfURL:" (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    if aURL <> nil then
		      dim arrayRef as Ptr = arrayWithContentsOfURL(ClassRef, aURL)
		      
		      if arrayRef <> nil then
		        return new NSMutableArray(arrayRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Insert(objects as NSArray, indexes as NSIndexSet)
		  
		  #if targetMacOS
		    declare sub insertObjects lib CocoaLib selector "insertObjects:atIndexes:" (obj_id as Ptr, objects as Ptr, indexes as Ptr)
		    
		    dim arrayRef as Ptr
		    if objects <> nil then
		      arrayRef = objects
		    end if
		    
		    dim setRef as Ptr
		    if indexes <> nil then
		      setRef = indexes
		    end if
		    
		    insertObjects self, objects, indexes
		    
		  #else
		    #pragma unused objects
		    #pragma unused indexes
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Insert(anObject as NSObject, index as UInt32)
		  
		  #if targetMacOS
		    declare sub insertObject lib CocoaLib selector "insertObject:atIndex:" (obj_id as Ptr, anObject as Ptr, index as UInt32)
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    insertObject self, anObjectRef, index
		    
		  #else
		    #pragma unused anObject
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(objects() as NSObject)
		  
		  self.Constructor(objects)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare sub removeObjectsInRange lib CocoaLib selector "removeObjectsInRange:" (obj_id as Ptr, range as Cocoa.NSRange)
		    
		    removeObjectsInRange self, range
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(otherArray as NSArray)
		  
		  #if targetMacOS
		    declare sub removeObjectsInArray lib CocoaLib selector "removeObjectsInArray:" (obj_id as Ptr, otherArray as Ptr)
		    
		    dim arrayRef as Ptr
		    if otherArray <> nil then
		      arrayRef = otherArray
		    end if
		    
		    removeObjectsInArray self, arrayRef
		    
		  #else
		    #pragma unused otherArray
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(indexes as NSIndexSet)
		  
		  #if targetMacOS
		    declare sub removeObjectsAtIndexes lib CocoaLib selector "removeObjectsAtIndexes:" (obj_id as Ptr, indexes as Ptr)
		    
		    dim setRef as Ptr
		    if indexes <> nil then
		      setRef = indexes
		    end if
		    
		    removeObjectsAtIndexes self, setRef
		    
		  #else
		    #pragma unused indexes
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
		Sub Remove(anObject as NSObject, range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare sub removeObject lib CocoaLib selector "removeObject:inRange:" (obj_id as Ptr, anObject as Ptr, range as Cocoa.NSRange)
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    removeObject self, anObjectRef, range
		    
		  #else
		    #pragma unused anObject
		    #pragma unused range
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(index as UInt32)
		  
		  #if targetMacOS
		    declare sub removeObjectAtIndex lib CocoaLib selector "removeObjectAtIndex:" (obj_id as Ptr, index as UInt32)
		    
		    removeObjectAtIndex self, index
		    
		  #else
		    #pragma unused index
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
		Sub RemoveIdentical(anObject as NSObject)
		  
		  #if targetMacOS
		    declare sub removeObjectIdenticalTo lib CocoaLib selector "removeObjectIdenticalTo:" (obj_id as Ptr, anObject as Ptr)
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    removeObjectIdenticalTo self, anObjectRef
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveIdentical(anObject as NSObject, range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare sub removeObjectIdenticalTo lib CocoaLib selector "removeObjectIdenticalTo:inRange:" (obj_id as Ptr, anObject as Ptr, range as Cocoa.NSRange)
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    removeObjectIdenticalTo self, anObjectRef, range
		    
		  #else
		    #pragma unused anObject
		    #pragma unused range
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveLast()
		  
		  #if targetMacOS
		    declare sub removeLastObject lib CocoaLib selector "removeLastObject" (obj_id as Ptr)
		    
		    removeLastObject self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(range as Cocoa.NSRange, objects as NSArray)
		  
		  #if targetMacOS
		    declare sub replaceObjectsInRange lib CocoaLib selector "replaceObjectsInRange:withObjectsFromArray:" _
		    (obj_id as Ptr, range as Cocoa.NSRange, objects as Ptr)
		    
		    dim objectsRef as Ptr
		    if objects <> nil then
		      objectsRef = objects
		    end if
		    
		    replaceObjectsInRange self, range, objectsRef
		    
		  #else
		    #pragma unused range
		    #pragma unused objects
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(range as Cocoa.NSRange, objects as NSArray, otherRange as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare sub replaceObjectsInRange lib CocoaLib selector "replaceObjectsInRange:withObjectsFromArray:range:" _
		    (obj_id as Ptr, range as Cocoa.NSRange, objects as Ptr, otherRange as Cocoa.NSRange)
		    
		    dim objectsRef as Ptr
		    if objects <> nil then
		      objectsRef = objects
		    end if
		    
		    replaceObjectsInRange self, range, objectsRef, otherRange
		    
		  #else
		    #pragma unused range
		    #pragma unused objects
		    #pragma unused otherRange
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(otherArray as NSArray)
		  
		  #if targetMacOS
		    declare sub setArray lib CocoaLib selector "setArray:" (obj_id as Ptr, otherArray as Ptr)
		    
		    dim otherArrayRef as Ptr
		    if otherArray <> nil then
		      otherArrayRef = otherArray
		    end if
		    
		    setArray self, otherArrayRef
		    
		  #else
		    #pragma unused otherArray
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(indexes as NSIndexSet, objects as NSArray)
		  
		  #if targetMacOS
		    declare sub replaceObjectsAtIndexes lib CocoaLib selector "replaceObjectsAtIndexes:withObjects:" (obj_id as Ptr, indexes as Ptr, objects as Ptr)
		    
		    dim setRef as Ptr
		    if indexes <> nil then
		      setRef = indexes
		    end if
		    
		    dim objectsRef as Ptr
		    if objects <> nil then
		      objectsRef = objects
		    end if
		    
		    replaceObjectsAtIndexes self, setRef, objectsRef
		    
		  #else
		    #pragma unused indexes
		    #pragma unused objects
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(index as UInt32, anObject as NSObject)
		  
		  #if targetMacOS
		    declare sub replaceObjectAtIndex lib CocoaLib selector "replaceObjectAtIndex:withObject:" (obj_id as Ptr, index as UInt32, anObject as Ptr)
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    replaceObjectAtIndex self, index, anObjectRef
		    
		  #else
		    #pragma unused index
		    #pragma unused anObject
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="UInteger"
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

#tag Class
Class NSArray
Inherits NSObject
	#tag Method, Flags = &h1000
		Function ArrayByAddingObject(anObject as NSObject) As NSArray
		  //# Returns a new array that is a copy of the receiving array with a given object added to the end.
		  
		  #if targetMacOS
		    declare function arrayByAddingObject lib CocoaLib selector "arrayByAddingObject:" (obj_id as Ptr, anObject as Ptr) as Ptr
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    dim arrayRef as Ptr = arrayByAddingObject(self, anObjectRef)
		    
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ArrayByAddingObjectsFromArray(otherArray as NSArray) As NSArray
		  //# Returns a new array that is a copy of the receiving array with the objects contained in another array added to the end.
		  
		  #if targetMacOS
		    declare function arrayByAddingObjectsFromArray lib CocoaLib selector "arrayByAddingObjectsFromArray:" (obj_id as Ptr, otherArray as Ptr) as Ptr
		    
		    dim otherArrayRef as Ptr
		    if otherArray <> nil then
		      otherArrayRef = otherArray
		    end if
		    
		    dim newArrayRef as Ptr = arrayByAddingObjectsFromArray(self, otherArrayRef)
		    
		    if newArrayRef <> nil then
		      return new NSArray(newArrayRef)
		    end if
		    
		  #else
		    #pragma unused otherArray
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSArray")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(cfa as CFArray)
		  // Adopts a CFArray
		  // Note: This shall m_not_ create a copy of the passed CFArray. For that, there's the Copy function.
		  Super.Constructor( cfa, false )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  //# Initializes a newly allocated array with the contents of the file specified by a given path.
		  
		  #if targetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" (obj_id as Ptr, aPath as CFStringRef) as Ptr
		    
		    if file <> nil then
		      super.Constructor(initWithContentsOfFile(Allocate("NSArray"), file.POSIXPath), NSArray.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSArray.Constructor: FolderItem argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray)
		  //# Creates and returns an array containing the objects in another given array.
		  
		  #if targetMacOS
		    declare function initWithArray lib CocoaLib selector "initWithArray:" (obj_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		      super.Constructor(initWithArray(Allocate("NSArray"), anArrayRef), NSArray.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSArray.Constructor: NSArray argument cannot be nil."
		      raise n
		    end if
		    
		    
		  #else
		    #pragma unused anArray
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray, copyItems as Boolean)
		  //# Initializes a newly allocated set with the objects that are contained in a given array, optionally copying the items.
		  
		  #if targetMacOS
		    declare function initWithArray lib CocoaLib selector "initWithArray:copyItems:" (obj_id as Ptr, anArray as Ptr, flag as Boolean) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		      super.Constructor(initWithArray(Allocate("NSArray"), anArrayRef, copyItems), NSArray.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSArray.Constructor: NSArray argument cannot be nil."
		      raise n
		    end if
		    
		    
		  #else
		    #pragma unused anArray
		    #pragma unused copyItems
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(objects() as NSObject)
		  //# Initializes a newly allocated set with a specified number of objects from a given C array of objects.
		  
		  #if targetMacOS
		    declare function initWithObjects lib CocoaLib selector "initWithObjects:count:" (obj_id as Ptr, objects as Ptr, count as UInteger) as Ptr
		    
		    dim uboundObject as UInteger = objects.ubound
		    dim objectCount as UInteger = uboundObject+1
		    if uboundObject > -1 then
		      
		      dim m as new MemoryBlock(SizeOfPointer*(objectCount))
		      for i as integer = 0 to uboundObject
		        m.UInt64Value(i*SizeOfPointer) = UInt64(objects(i).id)
		      next
		      
		      super.Constructor(initWithObjects(Allocate("NSArray"), m, objectCount), NSArray.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSArray.Constructor: NSObject argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  //# Creates and returns an array containing the contents specified by a given URL.
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		      super.Constructor(initWithContentsOfURL(Allocate("NSArray"), urlRef), NSArray.hasOwnership)
		    else
		      dim n as NilObjectException
		      n.Message = "NSArray.Constructor: NSURL argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(strings() as String)
		  //# Convenience method to create an NSArray from strings
		  
		  me.Constructor (new CFArray(Strings))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ContainsObject(anObject as NSObject) As Boolean
		  //# Returns a Boolean value that indicates whether a given object is present in the array.
		  
		  #if targetMacOS
		    declare function containsObject lib CocoaLib selector "containsObject:" (obj_id as Ptr, anObjects as Ptr) as Boolean
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		      return containsObject(self, anObjectRef)
		    else
		      dim n as NilObjectException
		      n.Message = "NSArray.ContainsObject: NSObject argument cannot be nil."
		      raise n
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSArray
		  //# Returns the NSArray.
		  
		  #if TargetMacOS
		    declare function m_copy lib CocoaLib selector "copy" (id as Ptr) as Ptr
		    
		    return   new NSArray( m_copy( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSArray
		  
		  #if TargetMacOS
		    declare function array_ lib CocoaLib selector "array" (class_id as Ptr) as Ptr
		    
		    dim arrayRef as Ptr = array_(ClassRef)
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromArrayOfStrings(Strings() as String) As NSArray
		  #if TargetMacOS
		    dim cfa as new CFArray( Strings )
		    dim nsa as new NSArray( cfa )
		    
		    return  nsa
		  #else
		    #pragma Unused Strings
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromNSArray(theArray as NSArray, indexSet as NSIndexSet) As NSArray
		  //# Returns the objects in the ordered set at the specified indexes.
		  
		  #if TargetMacOS
		    declare function objectsAtIndexes lib CocoaLib selector "objectsAtIndexes:" (id as Ptr, indexes as Ptr) as Ptr
		    
		    dim p as Ptr = objectsAtIndexes( theArray.id, indexSet.id )
		    
		    if p=nil then
		      return  nil
		    else
		      return  new NSArray( p, false )
		    end if
		  #else
		    #pragma Unused TheArray
		    #pragma Unused indexSet
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromObjectsArray(theArray as variant) As NSArray
		  dim nsma as new NSMutableArray
		  
		  select case theArray.ArrayElementType
		  case Variant.TypeBoolean
		    dim arb() as Boolean = theArray
		    for each b as Boolean in arb
		      nsma.Append   new NSNumber( b )
		    next
		    
		  case Variant.TypeInteger
		    dim ari() as Integer = theArray
		    for each i as integer in ari
		      nsma.Append   new NSNumber( i )
		    next
		    
		  case Variant.TypeString
		    dim ars() as string = theArray
		    for each item as String in ars
		      dim s as NSString = item
		      nsma.Append s
		    next
		    
		  case Variant.TypeDouble
		    dim ard() as double = theArray
		    for each d as double in ard
		      nsma.Append   new NSNumber( d )
		    next
		    
		  case Variant.TypeDate
		    dim ardate() as Date = theArray
		    for each dd as date in ardate
		      nsma.Append   new NSDate( dd )
		    next
		    
		  case 9
		    dim arv() as variant = theArray
		    for each v as variant in arv
		      dim obj as NSObject = Cocoa.NSObjectFromVariant( v )
		      nsma.Append obj
		    next
		  end select
		  
		  return  nsma.Copy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithArray(anArray as NSArray) As NSArray
		  //# Creates and returns an array containing the objects in another given array.
		  
		  #if TargetMacOS
		    declare function arrayWithArray lib CocoaLib selector "arrayWithArray:" (class_id as Ptr, anArray as Ptr) as Ptr
		    
		    dim anArrayRef as Ptr
		    if anArray <> nil then
		      anArrayRef = anArray
		    end if
		    
		    dim arrayRef as Ptr = arrayWithArray(ClassRef, anArrayRef)
		    
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		    
		  #else
		    #pragma unused anArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithFile(file as FolderItem) As NSArray
		  //# Creates and returns an array containing the contents of the file specified by a given path.
		  
		  #if TargetMacOS
		    declare function arrayWithContentsOfFile lib CocoaLib selector "arrayWithContentsOfFile:" (class_id as Ptr, aPath as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim arrayRef as Ptr = arrayWithContentsOfFile(ClassRef, file.POSIXPath)
		      
		      if arrayRef <> nil then
		        return new NSArray(arrayRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObject(anObject as NSObject) As NSArray
		  //# Creates and returns an array containing a given object.
		  
		  #if TargetMacOS
		    declare function arrayWithObject lib CocoaLib selector "arrayWithObject:" (class_id as Ptr, anObject as Ptr) as Ptr
		    
		    if anObject <> nil then
		      dim arrayRef as Ptr = arrayWithObject(ClassRef, anObject)
		      
		      if arrayRef <> nil then
		        return new NSArray(arrayRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithObjects(objects() as NSObject) As NSArray
		  //# Creates and returns an array containing the objects in the argument list.
		  
		  #if TargetMacOS
		    declare function arrayWithObjects lib CocoaLib selector "arrayWithObjects:count:" (class_id as Ptr, objects as Ptr, count as UInteger) as Ptr
		    
		    dim uboundObject as Integer = objects.ubound
		    dim objectCount as Integer = uboundObject+1
		    if uboundObject > -1 then
		      
		      dim m as new MemoryBlock(SizeOfPointer*(objectCount))
		      for i as UInteger = 0 to uboundObject
		        m.UInt64Value(i*SizeOfPointer) = UInt64(objects(i).id)
		      next
		      
		      dim arrayRef as Ptr = arrayWithObjects(ClassRef, m, objectCount)
		      
		      if arrayRef <> nil then
		        return new NSArray(arrayRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused objects
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithURL(aURL as NSURL) As NSArray
		  //# Creates and returns an array containing the contents specified by a given URL.
		  
		  #if TargetMacOS
		    declare function arrayWithContentsOfURL lib CocoaLib selector "arrayWithContentsOfURL:" (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    if aURL <> nil then
		      dim arrayRef as Ptr = arrayWithContentsOfURL(ClassRef, aURL)
		      
		      if arrayRef <> nil then
		        return new NSArray(arrayRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Enumerator() As NSEnumerator
		  //# Returns an enumerator object that lets you access each object in the ordered set.
		  
		  #if targetMacOS
		    if IsLion then
		      declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		      
		      dim enumRef as Ptr = objectEnumerator(self)
		      
		      if enumRef <> nil then
		        return new NSEnumerator(enumRef)
		      else
		        dim n as NilObjectException
		        n.Message = "NSArray.Enumerator: enumRef cannot be nil."
		        raise n
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IndexOf(anObject as NSObject) As UInt32
		  //# Returns the index of the specified object.
		  
		  #if targetMacOS
		    declare function indexOfObject lib CocoaLib selector "indexOfObject:" (obj_id as Ptr, anObject as Ptr) as UInt32
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    return indexOfObject(self, anObjectRef)
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IndexOf(anObject as NSObject, range as Cocoa.NSRange) As UInt32
		  //# Returns the lowest index within a specified range whose corresponding array value is equal to a given object .
		  
		  #if targetMacOS
		    declare function indexOfObject lib CocoaLib selector "indexOfObject:inRange:" (obj_id as Ptr, anObject as Ptr, range as Cocoa.NSRange) as UInt32
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    return indexOfObject(self, anObjectRef, range)
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IndexOfObjectIdentical(anObject as NSObject) As UInt32
		  //# Returns the lowest index whose corresponding array value is identical to a given object.
		  
		  #if targetMacOS
		    declare function indexOfObjectIdenticalTo lib CocoaLib selector "indexOfObjectIdenticalTo:" (obj_id as Ptr, anObject as Ptr) as UInt32
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    return indexOfObjectIdenticalTo(self, anObjectRef)
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IndexOfObjectIdentical(anObject as NSObject, range as Cocoa.NSRange) As UInt32
		  //# Returns the lowest index within a specified range whose corresponding array value is equal to a given object .
		  
		  #if targetMacOS
		    declare function indexOfObjectIdenticalTo lib CocoaLib selector "indexOfObjectIdenticalTo:inRange:" (obj_id as Ptr, anObject as Ptr, range as Cocoa.NSRange) as UInt32
		    
		    dim anObjectRef as Ptr
		    if anObject <> nil then
		      anObjectRef = anObject
		    end if
		    
		    return indexOfObjectIdenticalTo(self, anObjectRef, range)
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(otherArray as NSArray) As Boolean
		  //# Compares the receiving array to another array.
		  
		  #if targetMacOS
		    declare function isEqualToArray lib CocoaLib selector "isEqualToArray:" (obj_id as Ptr, otherArray as Ptr) as Boolean
		    
		    dim arrayRef as Ptr
		    if otherArray <> nil then
		      arrayRef = otherArray
		    end if
		    
		    return isEqualToArray(self, arrayRef)
		  #else
		    #pragma unused otherArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Join(separator as String) As String
		  //# Constructs and returns an NSString object that is the result of interposing a given separator between the elements of the array.
		  
		  #if targetMacOS
		    declare function componentsJoinedByString lib CocoaLib selector "componentsJoinedByString:" (obj_id as Ptr, separator as CFStringRef) as CFStringRef
		    
		    return componentsJoinedByString(self, separator)
		  #else
		    #pragma unused separator
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function LastValue() As Ptr
		  //# Returns the object in the array with the highest index value.
		  
		  #if targetMacOS
		    declare function lastObject lib CocoaLib selector "lastObject" (obj_id as Ptr) as Ptr
		    
		    return lastObject(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSValue(index as Integer) As variant
		  //# Same as Value but returns the corresponding NSObject (if declared in Cocoa.NSObjectFromNSPtr)
		  
		  #if TargetMacOS
		    'declare function CFArrayGetCount lib CarbonLib (theArray as Ptr) as Integer
		    
		    // Introduced in MacOS X 10.0.
		    declare function objectAtIndex lib CocoaLib selector "objectAtIndex:" (theArray as Ptr, idx as Integer) as Ptr
		    
		    if self <> nil then
		      if index < 0 or index >= me.Count then
		        raise new OutOfBoundsException
		      end if
		      
		      dim p as Ptr = objectAtIndex(me.id, index)
		      
		      return   Cocoa.NSObjectFromNSPtr( p )
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As NSObject()
		  
		  return self.Values(Cocoa.NSMakeRange(0, self.Count))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String()
		  #If TargetMacOS
		    dim retArray() as String
		    
		    dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, self.Count)
		    dim m as MemoryBlock = self.ValuesArray(arrayRange)
		    dim n as Integer = arrayRange.length-1
		    for i as integer = 0 to n
		      retArray.append New NSString(Ptr(m.UInt64Value(i * SizeOfPointer)))
		    next
		    
		    return retArray
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(objects() as NSObject)
		  
		  self.Constructor(objects)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ReverseEnumerator() As NSEnumerator
		  //# Returns an enumerator object that lets you access each object in the ordered set.
		  
		  #if targetMacOS
		    declare function reverseObjectEnumerator lib CocoaLib selector "reverseObjectEnumerator" (obj_id as Ptr) as Ptr
		    
		    dim enumRef as Ptr = reverseObjectEnumerator(self)
		    
		    if enumRef <> nil then
		      return new NSEnumerator(enumRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValues() As string()
		  #if TargetMacOS
		    dim result() as string
		    for i as integer = 0 to me.Count - 1
		      dim p as Ptr = me.Value( i )
		      if Cocoa.InheritsFromClass(p, "NSString") then
		        dim nss as new NSString(p)
		        result.Append nss.StringValue
		      else
		        raise new TypeMismatchException
		      end if
		    next
		    
		    return result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Subarray(aRange as Cocoa.NSRange) As NSArray
		  //# Returns a new array containing the receiving array’s elements that fall within the limits specified by a given range.
		  
		  #if targetMacOS
		    declare function subarrayWithRange lib CocoaLib selector "subarrayWithRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		    
		    dim newArrayRef as Ptr = subarrayWithRange(self, aRange)
		    
		    if newArrayRef <> nil then
		      return new NSArray(newArrayRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(index as Integer) As Ptr
		  //# Returns the object located at index.
		  
		  #if TargetMacOS
		    declare function objectAtIndex lib CocoaLib selector "objectAtIndex:" (theArray as Ptr, idx as Integer) as Ptr
		    
		    if self <> nil then
		      if index < 0 or index >= me.Count then
		        raise new OutOfBoundsException
		      end if
		      
		      dim p as Ptr = objectAtIndex(me.id, index)
		      
		      return   p
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Values(aRange as Cocoa.NSRange) As NSObject()
		  #If TargetMacOS
		    Dim rb_array() As NSObject
		    
		    Dim m As MemoryBlock = Self.ValuesArray(aRange)
		    
		    Dim n As Integer = aRange.length - 1
		    For i As Integer = 0 To n
		      rb_array.append New NSObject(Ptr(m.UInt64Value(i * SizeOfPointer)))
		    Next
		    
		    Return rb_array
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Values(indexes() as UInt32) As NSArray
		  //# Returns an array containing the objects in the array at the indexes specified by a given index set.
		  
		  #if targetMacOS
		    declare function objectsAtIndexes lib CocoaLib selector "objectsAtIndexes:" (obj_id as Ptr, indexes as Ptr) as Ptr
		    
		    dim indexSet as new NSMutableIndexSet
		    for each index as UInt32 in indexes
		      indexSet.Add(index)
		    next
		    
		    dim arrayRef as Ptr = objectsAtIndexes(self, indexSet)
		    
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		    
		  #else
		    #pragma unused indexes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ValuesArray(aRange as Cocoa.NSRange) As MemoryBlock
		  //# Copies the objects contained in the array that fall within the specified range to aBuffer.
		  
		  #if targetMacOS
		    declare sub getObjects lib CocoaLib selector "getObjects:range:" (obj_id as Ptr, aBuffer as Ptr, aRange as Cocoa.NSRange)
		    
		    dim m as new MemoryBlock(SizeOfPointer*aRange.length)
		    
		    getObjects self, m, aRange
		    
		    return m
		  #else
		    #pragma unused aRange
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  dim up as Integer = me.Count - 1
		  
		  dim result() as Variant
		  dim v as objHasVariantValue
		  
		  for i as Integer = 0 to up
		    v = objHasVariantValue( Cocoa.NSObjectFromNSPtr( value( i )))
		    result.Append   v.VariantValue
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Write(file as FolderItem, atomically as Boolean) As Boolean
		  //# Writes the contents of the array to a file at a given path.
		  
		  #if targetMacOS
		    declare function writeToFile lib CocoaLib selector "writeToFile:atomically:" (obj_id as Ptr, path as CFStringRef, flag as Boolean) as Boolean
		    
		    if file <> nil then
		      return writeToFile(self, file.POSIXPath, atomically)
		    else
		      return false
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused atomically
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Write(aURL as NSURL, atomically as Boolean) As Boolean
		  //# Writes the contents of the array to the location specified by a given URL.
		  
		  #if targetMacOS
		    declare function writeToURL lib CocoaLib selector "writeToURL:atomically:" (obj_id as Ptr, aURL as Ptr, flag as Boolean) as Boolean
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    return writeToURL(self, urlRef, atomically)
		    
		  #else
		    #pragma unused aURL
		    #pragma unused atomically
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _Operator_Convert() As CFArray
		  // Returns confusement when you're also capable of returning strings().
		  
		  return   new CFArray( me.id, false )
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of objects currently in the array.
			  #If TargetMacOS Then
			    declare function m_count lib CocoaLib selector "count" ( obj as Ptr ) as UInteger
			    dim cnt as integer = m_count( me.id )
			    
			    return  cnt
			  #EndIf
			End Get
		#tag EndGetter
		Count As UInteger
	#tag EndComputedProperty


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

#tag Class
Class NSIndexSet
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSIndexSet")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  #if targetMacOS
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    
		    super.Constructor(init(Allocate("NSIndexSet")), NSIndexSet.hasOwnership)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare function initWithIndexesInRange lib CocoaLib selector "initWithIndexesInRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Ptr
		    
		    super.Constructor(initWithIndexesInRange(Allocate("NSIndexSet"), range), NSIndexSet.hasOwnership)
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(indexSet as NSIndexSet)
		  
		  #if targetMacOS
		    declare function initWithIndexSet lib CocoaLib selector "initWithIndexSet:" (obj_id as Ptr, indexSet as Ptr) as Ptr
		    
		    dim indexSetRef as Ptr
		    if indexSet <> nil then
		      indexSetRef = indexSet
		    end if
		    
		    super.Constructor(initWithIndexSet(Allocate("NSIndexSet"), indexSetRef), NSIndexSet.hasOwnership)
		    
		  #else
		    #pragma unused indexSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(index as UInt32)
		  
		  #if targetMacOS
		    declare function initWithIndex lib CocoaLib selector "initWithIndex:" (obj_id as Ptr, index as UInt32) as Ptr
		    
		    super.Constructor(initWithIndex(Allocate("NSIndexSet"), index), NSIndexSet.hasOwnership)
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Contains(range as Cocoa.NSRange) As Boolean
		  
		  #if targetMacOS
		    declare function containsIndexesInRange lib CocoaLib selector "containsIndexesInRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Boolean
		    
		    return containsIndexesInRange(self, range)
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Contains(indexSet as NSIndexSet) As Boolean
		  
		  #if targetMacOS
		    declare function containsIndexes lib CocoaLib selector "containsIndexes:" (obj_id as Ptr, indexSet as Ptr) as Boolean
		    
		    dim indexSetRef as Ptr
		    if indexSet <> nil then
		      indexSetRef = indexSet
		    end if
		    
		    return containsIndexes(self, indexSetRef)
		    
		  #else
		    #pragma unused indexSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Contains(index as UInt32) As Boolean
		  
		  #if targetMacOS
		    declare function containsIndex lib CocoaLib selector "containsIndex:" (obj_id as Ptr, index as UInt32) as Boolean
		    
		    return containsIndex(self, index)
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Count(range as Cocoa.NSRange) As Integer
		  
		  #if targetMacOS
		    declare function countOfIndexesInRange lib CocoaLib selector "countOfIndexesInRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Integer
		    
		    return countOfIndexesInRange(self, range)
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSIndexSet
		  
		  #if targetMacOS
		    declare function indexSet lib CocoaLib selector "indexSet" (class_id as Ptr) as Ptr
		    
		    dim indexSetRef as Ptr = indexSet(ClassRef)
		    if indexSetRef <> nil then
		      return new NSIndexSet(indexSetRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithIndex(index as UInt32) As NSIndexSet
		  
		  #if targetMacOS
		    declare function indexSetWithIndex lib CocoaLib selector "indexSetWithIndex:" (class_id as Ptr, index as UInt32) as Ptr
		    
		    dim indexSetRef as Ptr = indexSetWithIndex(ClassRef, index)
		    if indexSetRef <> nil then
		      return new NSIndexSet(indexSetRef)
		    end if
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithRange(range as Cocoa.NSRange) As NSIndexSet
		  
		  #if targetMacOS
		    declare function indexSetWithIndexesInRange lib CocoaLib selector "indexSetWithIndexesInRange:" (class_id as Ptr, range as Cocoa.NSRange) as Ptr
		    
		    dim indexSetRef as Ptr = indexSetWithIndexesInRange(ClassRef, range)
		    if indexSetRef <> nil then
		      return new NSIndexSet(indexSetRef)
		    end if
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function intersects(range as Cocoa.NSRange) As Boolean
		  
		  #if targetMacOS
		    declare function intersectsIndexesInRange lib CocoaLib selector "intersectsIndexesInRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Boolean
		    
		    return intersectsIndexesInRange(self, range)
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(indexSet as NSIndexSet) As Integer
		  
		  #if targetMacOS
		    declare function isEqualToIndexSet lib CocoaLib selector "isEqualToIndexSet:" (obj_id as Ptr, indexSet as Ptr) as Boolean
		    
		    dim indexSetRef as Ptr
		    if indexSet <> nil then
		      indexSetRef = indexSet
		    end if
		    
		    if isEqualToIndexSet(self, indexSetRef) then
		      Return 0
		    else
		      Return 1
		    end if
		    
		  #else
		    #pragma unused indexSet
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Integer()
		  #if targetMacOS
		    declare function getIndexes lib CocoaLib selector "getIndexes:maxCount:inIndexRange:" (obj_id as Ptr, indexBuffer as Ptr, bufferSize as Integer, indexRangePointer as Ptr) as Integer
		    
		    if self.id <> nil then
		      dim cnt as integer = self.Count
		      dim indexBuffer as new MemoryBlock(sizeOfInteger * cnt)
		      dim L() as Integer
		      dim offset as Integer = 0
		      
		      call getIndexes(self, indexBuffer, cnt, nil)
		      
		      while offset < indexBuffer.Size
		        L.Append  indexBuffer.Long( offset )
		        offset = offset + sizeOfInteger
		      wend
		      
		      return L
		      
		    else
		      dim L(-1) as Integer
		      return L
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As Variant
		  
		  return self.Operator_Convert
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function count lib CocoaLib selector "count" (obj_id as Ptr) as Integer
			    
			    return count(self)
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function firstIndex lib CocoaLib selector "firstIndex" (obj_id as Ptr) as Integer
			    
			    return firstIndex(self)
			  #endif
			End Get
		#tag EndGetter
		FirstIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function lastIndex lib CocoaLib selector "lastIndex" (obj_id as Ptr) as Integer
			    
			    return lastIndex(self)
			  #endif
			End Get
		#tag EndGetter
		LastIndex As Integer
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
			Name="FirstIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastIndex"
			Group="Behavior"
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

#tag Class
Class NSMutableIndexSet
Inherits NSIndexSet
	#tag Method, Flags = &h1000
		Sub Add(range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare sub addIndexesInRange lib CocoaLib selector "addIndexesInRange:" (obj_id as Ptr, range as Cocoa.NSRange)
		    
		    addIndexesInRange self, range
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(newIndex as integer)
		  #if TargetMacOS
		    declare sub addIndex lib CocoaLib selector "addIndex:" (id as Ptr, idx as integer)
		    
		    addIndex(self, newIndex)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Add(indexSet as NSIndexSet)
		  
		  #if targetMacOS
		    declare sub addIndexes lib CocoaLib selector "addIndexes:" (obj_id as Ptr, indexSet as Ptr)
		    
		    dim indexSetRef as Ptr
		    if indexSet <> nil then
		      indexSetRef = indexSet
		    end if
		    
		    addIndexes self, indexSet
		    
		  #else
		    #pragma unused indexSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSMutableIndexSet")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    self.Constructor(NSObject.Initialize(NSObject.Allocate("NSMutableIndexSet")), hasOwnership)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare function initWithIndexesInRange lib CocoaLib selector "initWithIndexesInRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Ptr
		    
		    super.Constructor(initWithIndexesInRange(Allocate("NSMutableIndexSet"), range), NSMutableIndexSet.hasOwnership)
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(index as Integer)
		  
		  #if targetMacOS
		    declare function initWithIndex lib CocoaLib selector "initWithIndex:" (obj_id as Ptr, index as Integer) as Ptr
		    
		    super.Constructor(initWithIndex(Allocate("NSMutableIndexSet"), index), NSMutableIndexSet.hasOwnership)
		    
		  #else
		    #pragma unused index
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
		    
		    super.Constructor(initWithIndexSet(Allocate("NSMutableIndexSet"), indexSetRef), NSMutableIndexSet.hasOwnership)
		    
		  #else
		    #pragma unused indexSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSMutableIndexSet
		  
		  #if targetMacOS
		    declare function indexSet lib CocoaLib selector "indexSet" (class_id as Ptr) as Ptr
		    
		    dim indexSetRef as Ptr = indexSet(ClassRef)
		    if indexSetRef <> nil then
		      return new NSMutableIndexSet(indexSetRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithIndex(index as UInt32) As NSMutableIndexSet
		  
		  #if targetMacOS
		    declare function indexSetWithIndex lib CocoaLib selector "indexSetWithIndex:" (class_id as Ptr, index as UInt32) as Ptr
		    
		    dim indexSetRef as Ptr = indexSetWithIndex(ClassRef, index)
		    if indexSetRef <> nil then
		      return new NSMutableIndexSet(indexSetRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithRange(range as Cocoa.NSRange) As NSMutableIndexSet
		  
		  #if targetMacOS
		    declare function indexSetWithIndexesInRange lib CocoaLib selector "indexSetWithIndexesInRange:" (class_id as Ptr, range as Cocoa.NSRange) as Ptr
		    
		    dim indexSetRef as Ptr = indexSetWithIndexesInRange(ClassRef, range)
		    if indexSetRef <> nil then
		      return new NSMutableIndexSet(indexSetRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare sub removeIndexesInRange lib CocoaLib selector "removeIndexesInRange:" (obj_id as Ptr, range as Cocoa.NSRange)
		    
		    removeIndexesInRange self, range
		    
		  #else
		    #pragma unused range
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(index as Integer)
		  
		  #if targetMacOS
		    declare sub removeIndex lib CocoaLib selector "removeIndex:" (obj_id as Ptr, index as Integer)
		    
		    removeIndex self, index
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(indexSet as NSIndexSet)
		  
		  #if targetMacOS
		    declare sub removeIndexes lib CocoaLib selector "removeIndexes:" (obj_id as Ptr, indexSet as Ptr)
		    
		    dim indexSetRef as Ptr
		    if indexSet <> nil then
		      indexSetRef = indexSet
		    end if
		    
		    removeIndexes self, indexSet
		    
		  #else
		    #pragma unused indexSet
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveAll()
		  
		  #if targetMacOS
		    declare sub removeAllIndexes lib CocoaLib selector "removeAllIndexes" (obj_id as Ptr)
		    
		    removeAllIndexes self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Shift(startIndex as UInt32, delta as Integer)
		  
		  #if targetMacOS
		    declare sub shiftIndexesStartingAtIndex lib CocoaLib selector "shiftIndexesStartingAtIndex:by:" (obj_id as Ptr, startIndex as UInt32, delta as Integer)
		    
		    shiftIndexesStartingAtIndex self, startIndex, delta
		    
		  #else
		    #pragma unused startIndex
		    #pragma unused delta
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

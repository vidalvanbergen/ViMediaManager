#tag Class
Class NSMutableData
Inherits NSData
	#tag Method, Flags = &h1000
		Sub Append(extraBytes as MemoryBlock, length as UInt32 = 0)
		  
		  #if targetMacOS
		    declare sub appendBytes lib CocoaLib selector "appendBytes:length:" (obj_id as Ptr, extraBytes as Ptr, length as UInt32)
		    
		    dim bufferLen as UInt32
		    if length > 0 then
		      bufferLen = extraBytes.Size
		    else
		      bufferLen = length
		    end if
		    
		    appendBytes self, extraBytes, bufferLen
		    
		  #else
		    #pragma unused extraBytes
		    #pragma unused length
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Append(otherData as NSData)
		  
		  #if targetMacOS
		    declare sub appendData lib CocoaLib selector "appendData:" (obj_id as Ptr, otherData as Ptr)
		    
		    dim dataRef as Ptr
		    if otherData <> nil then
		      dataRef = otherData
		    end if
		    
		    appendData self, dataRef
		    
		  #else
		    #pragma unused otherData
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Append(extraBytes as String)
		  
		  self.Append(extraBytes, extraBytes.lenB)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSMutableData")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  
		  #if targetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" (obj_id as Ptr, path as CFStringRef) as Ptr
		    
		    super.Constructor(initWithContentsOfFile(Allocate("NSMutableData"), file.POSIXPath), NSMutableData.hasOwnership)
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(dataBlock as MemoryBlock, length as UInt32 = 0)
		  
		  #if targetMacOS
		    declare function initWithBytes lib CocoaLib selector "initWithBytes:length:" (obj_id as Ptr, bytes as Ptr, length as UInt32) as Ptr
		    
		    dim dataLen as UInt32
		    if length > 0 then
		      dataLen = length
		    else
		      dataLen = dataBlock.Size
		    end if
		    
		    super.Constructor(initWithBytes(Allocate("NSMutableData"), dataBlock, dataLen), NSMutableData.hasOwnership)
		    
		  #else
		    #pragma unused dataBlock
		    #pragma unused length
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aData as NSData)
		  
		  #if targetMacOS
		    declare function initWithData lib CocoaLib selector "initWithData:" (obj_id as Ptr, aData as Ptr) as Ptr
		    
		    super.Constructor(initWithData(Allocate("NSMutableData"), aData), NSMutableData.hasOwnership)
		    
		  #else
		    #pragma unused aData
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    super.Constructor(initWithContentsOfURL(Allocate("NSMutableData"), aURL), NSMutableData.hasOwnership)
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(dataString as String)
		  
		  self.Constructor(dataString, dataString.lenB)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(length as UInt32)
		  
		  #if targetMacOS
		    declare function initWithLength lib CocoaLib selector "initWithLength:" (obj_id as Ptr, length as UInt32) as Ptr
		    
		    super.Constructor(initWithLength(Allocate("NSMutableData"), length), NSMutableData.hasOwnership)
		    
		  #else
		    #pragma unused length
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSMutableData
		  
		  #if TargetMacOS
		    declare function data_ lib CocoaLib selector "data" (class_id as Ptr) as Ptr
		    
		    dim dataRef as Ptr = data_(ClassRef)
		    if dataRef <> nil then
		      return new NSMutableData(dataRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithCapacity(capacity as UInt32) As NSMutableData
		  
		  #if TargetMacOS
		    declare function dataWithCapacity lib CocoaLib selector "dataWithCapacity:" (class_id as Ptr, capacity as UInt32) as Ptr
		    
		    dim dataRef as Ptr = dataWithCapacity(ClassRef, capacity)
		    if dataRef <> nil then
		      return new NSMutableData(dataRef)
		    end if
		    
		  #else
		    #pragma unused capacity
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithData(aData as NSData) As NSMutableData
		  
		  #if TargetMacOS
		    declare function dataWithData lib CocoaLib selector "dataWithData:" (class_id as Ptr, aData as Ptr) as Ptr
		    
		    if aData <> nil then
		      dim dataRef as Ptr = dataWithData(ClassRef, aData)
		      if dataRef <> nil then
		        return new NSMutableData(dataRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aData
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithFile(file as FolderItem) As NSMutableData
		  
		  #if TargetMacOS
		    declare function dataWithContentsOfFile lib CocoaLib selector "dataWithContentsOfFile:" (class_id as Ptr, path as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim dataRef as Ptr = dataWithContentsOfFile(ClassRef, file.POSIXPath)
		      if dataRef <> nil then
		        return new NSMutableData(dataRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithLength(length as UInt32) As NSMutableData
		  
		  #if TargetMacOS
		    declare function dataWithLength lib CocoaLib selector "dataWithLength:" (class_id as Ptr, length as UInt32) as Ptr
		    
		    dim dataRef as Ptr = dataWithLength(ClassRef, length)
		    if dataRef <> nil then
		      return new NSMutableData(dataRef)
		    end if
		    
		  #else
		    #pragma unused length
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithMemoryBlock(dataBlock as MemoryBlock, length as UInt32) As NSMutableData
		  
		  #if TargetMacOS
		    declare function dataWithBytes lib CocoaLib selector "dataWithBytes:length:" (class_id as Ptr, bytes as Ptr, length as UInt32) as Ptr
		    
		    if dataBlock <> nil then
		      
		      dim dataLen as UInt32
		      if length > 0 then
		        dataLen = length
		      else
		        dataLen = dataBlock.Size
		      end if
		      
		      dim dataRef as Ptr = dataWithBytes(ClassRef, dataBlock, dataLen)
		      if dataRef <> nil then
		        return new NSMutableData(dataRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused dataBlock
		    #pragma unused length
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithString(dataString as String) As NSMutableData
		  
		  return NSMutableData.CreateWithMemoryBlock(dataString, dataString.lenB)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Data(assigns otherData as NSData)
		  
		  #if targetMacOS
		    declare sub setData lib CocoaLib selector "setData:" (obj_id as Ptr, otherData as Ptr)
		    
		    dim dataRef as Ptr
		    if otherData <> nil then
		      dataRef = otherData
		    end if
		    
		    setData self, dataRef
		    
		  #else
		    #pragma unused otherData
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub IncreaseLength(extraLength as UInt32)
		  
		  #if targetMacOS
		    declare sub increaseLengthBy lib CocoaLib selector "increaseLengthBy:" (obj_id as Ptr, extraLength as UInt32)
		    
		    increaseLengthBy self, extraLength
		    
		  #else
		    #pragma unused extraLength
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Length(assigns newLength as UInt32)
		  
		  #if targetMacOS
		    declare sub setLength lib CocoaLib selector "setLength:" (obj_id as Ptr, newLength as UInt32)
		    
		    setLength self, newLength
		    
		  #else
		    #pragma unused newLength
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function MutableData() As MemoryBlock
		  
		  #if targetMacOS
		    declare function mutableBytes lib CocoaLib selector "mutableBytes" (obj_id as Ptr) as Ptr
		    
		    return mutableBytes(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(replacement as MemoryBlock, range as Cocoa.NSRange, length as UInt32 = 0)
		  
		  #if targetMacOS
		    declare sub replaceBytesInRange lib CocoaLib selector "replaceBytesInRange:withBytes:" (obj_id as Ptr, range as Cocoa.NSRange, bytes as Ptr)
		    declare sub replaceBytesInRangeLength lib CocoaLib selector "replaceBytesInRange:withBytes:length:" (obj_id as Ptr, range as Cocoa.NSRange, bytes as Ptr, length as UInt32)
		    
		    if replacement <> nil then
		      if length <= 0 then
		        replaceBytesInRange self, range, replacement
		      else
		        replaceBytesInRangeLength self, range, replacement, length
		      end if
		    end if
		    
		  #else
		    #pragma unused replacement
		    #pragma unused range
		    #pragma unused length
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Reset(range as Cocoa.NSRange)
		  
		  #if targetMacOS
		    declare sub resetBytesInRange lib CocoaLib selector "resetBytesInRange:" (obj_id as Ptr, range as Cocoa.NSRange)
		    
		    resetBytesInRange self, range
		    
		  #else
		    #pragma unused range
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
			Name="Length"
			Group="Behavior"
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

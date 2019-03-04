#tag Class
Class NSData
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSData")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  //# Returns a data object initialized by reading into it the data from the file specified by a given path.
		  
		  #if targetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" (obj_id as Ptr, path as CFStringRef) as Ptr
		    
		    super.Constructor(initWithContentsOfFile(Allocate("NSData"), file.POSIXPath), NSData.hasOwnership)
		  #else
		    #pragma unused file
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(dataBlock as MemoryBlock, length as UInt32 = 0)
		  //# Returns a data object initialized by adding to it a given number of bytes of data copied from a given buffer.
		  
		  #if targetMacOS
		    declare function initWithBytes lib CocoaLib selector "initWithBytes:length:" (obj_id as Ptr, bytes as Ptr, length as UInt32) as Ptr
		    
		    dim dataLen as UInt32
		    if length > 0 then
		      dataLen = length
		    else
		      dataLen = dataBlock.Size
		    end if
		    
		    super.Constructor(initWithBytes(Allocate("NSData"), dataBlock, dataLen), NSData.hasOwnership)
		  #else
		    #pragma unused dataBlock
		    #pragma unused length
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aData as NSData)
		  //# Returns a data object initialized with the contents of another data object.
		  
		  #if targetMacOS
		    declare function initWithData lib CocoaLib selector "initWithData:" (obj_id as Ptr, aData as Ptr) as Ptr
		    
		    super.Constructor(initWithData(Allocate("NSData"), aData), NSData.hasOwnership)
		  #else
		    #pragma unused aData
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  //# Initializes a newly allocated data object initialized with the data from the location specified by aURL.
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    super.Constructor(initWithContentsOfURL(Allocate("NSData"), aURL), NSData.hasOwnership)
		  #else
		    #pragma unused aURL
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(dataString as String)
		  // Redundent, but clearer with autocomplete
		  
		  #if targetMacOS
		    self.Constructor( dataString, dataString.LenB )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Create() As NSData
		  //# Creates and returns an empty data object.
		  
		  #if TargetMacOS
		    declare function data_ lib CocoaLib selector "data" (class_id as Ptr) as Ptr
		    
		    dim dataRef as Ptr = data_(ClassRef)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithData(aData as NSData) As NSData
		  //# Creates and returns a data object containing the contents of another data object.
		  
		  #if TargetMacOS
		    declare function dataWithData lib CocoaLib selector "dataWithData:" (class_id as Ptr, aData as Ptr) as Ptr
		    
		    if aData <> nil then
		      dim dataRef as Ptr = dataWithData(ClassRef, aData)
		      if dataRef <> nil then
		        return new NSData(dataRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aData
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithFile(file as FolderItem) As NSData
		  //# Creates and returns a data object by reading every byte from the file specified by a given path.
		  
		  #if TargetMacOS
		    declare function dataWithContentsOfFile lib CocoaLib selector "dataWithContentsOfFile:" (class_id as Ptr, path as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim dataRef as Ptr = dataWithContentsOfFile(ClassRef, file.POSIXPath)
		      if dataRef <> nil then
		        return new NSData(dataRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithMemoryBlock(dataBlock as MemoryBlock, length as UInt32) As NSData
		  //# Creates and returns a data object containing a given number of bytes copied from a given buffer.
		  
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
		        return new NSData(dataRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused dataBlock
		    #pragma unused length
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithString(dataString as String) As NSData
		  
		  return NSData.CreateWithMemoryBlock(dataString, dataString.lenB)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithURL(aURL as NSURL) As NSData
		  //# Initializes a newly allocated data object initialized with the data from the location specified by aURL.
		  
		  #if TargetMacOS
		    declare function dataWithContentsOfURL lib CocoaLib selector "dataWithContentsOfURL:" (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    if aURL <> nil then
		      dim dataRef as Ptr = dataWithContentsOfURL(ClassRef, aURL)
		      if dataRef <> nil then
		        return new NSData(dataRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Data(range as Cocoa.NSRange) As MemoryBlock
		  //# Copies a range of bytes from the NSData’s data into a given buffer.
		  
		  #if targetMacOS
		    declare function getBytes lib CocoaLib selector "getBytes:range:" (obj_id as Ptr, range as Cocoa.NSRange) as Ptr
		    
		    return getBytes(self, range)
		  #else
		    #pragma unused range
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Data(length as UInteger) As MemoryBlock
		  //# Copies a number of bytes from the start of the NSData's data into a given buffer.
		  
		  #if targetMacOS
		    declare function getBytes lib CocoaLib selector "getBytes:length:" (obj_id as Ptr, length as UInteger) as Ptr
		    
		    return getBytes(self, length)
		  #else
		    #pragma unused length
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(otherData as NSData) As Boolean
		  //# Compares the receiving data object to otherData.
		  
		  #if targetMacOS
		    declare function isEqualToData lib CocoaLib selector "isEqualToData:" (obj_id as Ptr, otherData as Ptr) as Boolean
		    
		    dim dataRef as Ptr
		    if otherData <> nil then
		      dataRef = otherData
		    end if
		    
		    return isEqualToData(self, dataRef)
		  #else
		    #pragma unused otherData
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RangeOfData(dataToFind as NSData, options as UInt32, range as Cocoa.NSRange) As Cocoa.NSRange
		  //# Finds and returns the range of the first occurrence of the given data, within the given range, subject to given options.
		  
		  #if targetMacOS
		    declare function rangeOfData lib CocoaLib selector "rangeOfData:options:range:" _
		    (obj_id as Ptr, dataToFind as Ptr, options as UInt32, range as Cocoa.NSRange) as Cocoa.NSRange
		    
		    dim dataRef as Ptr
		    if dataToFind <> nil then
		      dataRef = dataToFind
		    end if
		    
		    return rangeOfData(self, dataRef, options, range)
		  #else
		    #pragma unused dataToFind
		    #pragma unused options
		    #pragma unused range
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As String
		  //# Returns the data as a string
		  
		  return  self.Data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Subdata(range as Cocoa.NSRange) As NSData
		  //# Returns a data object containing the NSData's bytes that fall within the limits specified by a given range.
		  
		  #if targetMacOS
		    declare function subdataWithRange lib CocoaLib selector "subdataWithRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Ptr
		    
		    dim dataRef as Ptr = subdataWithRange(self, range)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused range
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return  me.Data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function WriteToFile(file as FolderItem, atomically as Boolean) As Boolean
		  //# Writes the bytes in the NSData to the file specified by a given path.
		  
		  #if targetMacOS
		    declare function writeToFile lib CocoaLib selector "writeToFile:atomically:" (obj_id as Ptr, path as CFStringRef, flag as Boolean) as Boolean
		    
		    if file <> nil then
		      return writeToFile(self, file.POSIXPath, atomically)
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused atomically
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function WriteToURL(aURL as NSURL, atomically as Boolean) As Boolean
		  //# Writes the bytes in the NSData to the file specified by a given path.
		  
		  #if targetMacOS
		    declare function writeToURL lib CocoaLib selector "writeToURL:atomically:" (obj_id as Ptr, aURL as Ptr, flag as Boolean) as Boolean
		    
		    if aURL <> nil then
		      return writeToURL(self, aURL, atomically)
		    end if
		    
		  #else
		    #pragma unused aURL
		    #pragma unused atomically
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _Constructor(theData as MemoryBlock)
		  // This one also takes Strings. No need for an extra constructor taking Strings therefore
		  
		  #if targetMacOS
		    declare function dataWithBytes lib CocoaLib selector "dataWithBytes:length:" (cls as Ptr, bytes as Ptr, length as Integer) as Ptr
		    
		    if not (theData is nil) then
		      if theData.Size < 0 then
		        // this comes from a Ptr - you need to use the CFType constructor with the additional Boolean parm!
		        raise new TypeMismatchException
		      end if
		      
		      super.Constructor  dataWithBytes( Cocoa.NSClassFromString( "NSData" ), theData, theData.Size), false
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare sub getBytes lib CocoaLib selector "getBytes:length:" ( id as Ptr, buffer as Ptr, length as UInteger )
			    
			    dim dataLength as Integer = me.Length
			    if dataLength > 0 then
			      dim m as new MemoryBlock( dataLength )
			      getBytes   me.id, m, dataLength
			      return m
			    end if
			  #endif
			  
			  return new MemoryBlock(0)
			End Get
		#tag EndGetter
		Data As MemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function m_length lib CocoaLib selector "length" (id as Ptr) as Integer
			    
			    return  m_length( me.id )
			  #endif
			End Get
		#tag EndGetter
		Length As Integer
	#tag EndComputedProperty


	#tag Constant, Name = NSDataSearchAnchored, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSDataSearchBackwards, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


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

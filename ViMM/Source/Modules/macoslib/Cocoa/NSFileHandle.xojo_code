#tag Class
Class NSFileHandle
Inherits NSObject
	#tag Method, Flags = &h0
		Function AvailableData() As NSData
		  //# Returns the data currently available in the NSFileHandle.
		  
		  #if targetMacOS
		    declare function availableData lib CocoaLib selector "availableData" (obj_id as Ptr) as Ptr
		    
		    return new NSData(availableData(self), not NSData.hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  //In general, you should not invoke this method.  The only time you need it is when you've created
		  //an NSFileHandle object from an existing file descriptor.
		  
		  #if targetMacOS
		    declare sub closeFile lib CocoaLib selector "closeFile" (obj_id as Ptr)
		    
		    closeFile(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(fd as Integer, takeOwnership as Boolean)
		  //# Initializes and returns a file handle object associated with the specified file descriptor and deallocation policy.
		  
		  #if targetMacOS
		    declare function initWithFileDescriptor lib CocoaLib selector "initWithFileDescriptor:closeOnDealloc:" (obj_id as Ptr, fileDescriptor as Integer,flag as Boolean) as Ptr
		    
		    super.Constructor(initWithFileDescriptor(Allocate("NSFileHandle"), fd, takeOwnership), hasOwnership)
		  #else
		    #pragma unused fd
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewNSFileHandle(p as Ptr) As NSFileHandle
		  #if targetMacOS
		    if p <> nil then
		      return new NSFileHandle(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewReadHandle(path as String) As NSFileHandle
		  //opens an existing file for reading.
		  #if targetMacOS
		    declare function fileHandleForReadingAtPath lib CocoaLib selector "fileHandleForReadingAtPath:" (class_id as Ptr, path as CFStringRef) as Ptr
		    
		    return NewNSFileHandle(fileHandleForReadingAtPath(Cocoa.NSClassFromString("NSFileHandle"), path))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewReadWriteHandle(path as String) As NSFileHandle
		  //opens an existing file for reading/writing.
		  #if targetMacOS
		    declare function fileHandleForUpdatingAtPath lib CocoaLib selector "fileHandleForUpdatingAtPath:" (class_id as Ptr, path as CFStringRef) as Ptr
		    
		    return NewNSFileHandle(fileHandleForUpdatingAtPath(Cocoa.NSClassFromString("NSFileHandle"), path))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewWriteHandle(path as String) As NSFileHandle
		  //opens an existing file for writing.
		  #if targetMacOS
		    declare function fileHandleForWritingAtPath lib CocoaLib selector "fileHandleForWritingAtPath:" (class_id as Ptr, path as CFStringRef) as Ptr
		    
		    return NewNSFileHandle(fileHandleForWritingAtPath(Cocoa.NSClassFromString("NSFileHandle"), path))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Null() As NSFileHandle
		  //this method returns the NSFileHandle representation of /dev/null.
		  
		  #if targetMacOS
		    declare function fileHandleWithNullDevice lib CocoaLib selector "fileHandleWithNullDevice" (class_id as Ptr) as Ptr
		    
		    return NewNSFileHandle(fileHandleWithNullDevice(Cocoa.NSClassFromString("NSFileHandle")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(byteLength as Integer) As NSData
		  //# Synchronously reads data up to the specified number of bytes.
		  
		  #if targetMacOS
		    declare function readDataOfLength lib CocoaLib selector "readDataOfLength:" (obj_id as Ptr, length as Integer) as Ptr
		    
		    return new NSData(readDataOfLength(self, byteLength))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadAll() As NSData
		  //# Synchronously reads the available data up to the end of file or maximum number of bytes.
		  
		  #if targetMacOS
		    declare function readDataToEndOfFile lib CocoaLib selector "readDataToEndOfFile" (obj_id as Ptr) as Ptr
		    
		    return new NSData(readDataToEndOfFile(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SeekToEndofFile() As UInt64
		  //Puts the file pointer at the end of the file referenced by the NSFileHandle and returns the new file offset.
		  
		  #if targetMacOS
		    declare function seekToEndOfFile lib CocoaLib selector "seekToEndOfFile" (obj_id as Ptr) as UInt64
		    
		    return seekToEndOfFile(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Stderr() As NSFileHandle
		  #if targetMacOS
		    declare function fileHandleWithStandardError lib CocoaLib selector "fileHandleWithStandardError" (class_id as Ptr) as Ptr
		    
		    return NewNSFileHandle(fileHandleWithStandardError(Cocoa.NSClassFromString("NSFileHandle")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Stdin() As NSFileHandle
		  #if targetMacOS
		    declare function fileHandleWithStandardInput lib CocoaLib selector "fileHandleWithStandardInput" (class_id as Ptr) as Ptr
		    
		    return NewNSFileHandle(fileHandleWithStandardInput(Cocoa.NSClassFromString("NSFileHandle")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Stdout() As NSFileHandle
		  #if targetMacOS
		    declare function fileHandleWithStandardOutput lib CocoaLib selector "fileHandleWithStandardOutput" (class_id as Ptr) as Ptr
		    
		    return NewNSFileHandle(fileHandleWithStandardOutput(Cocoa.NSClassFromString("NSFileHandle")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Synchronize()
		  //Causes all in-memory data and attributes of the file represented by the NSFileHandle to be written to permanent storage.
		  
		  #if targetMacOS
		    declare sub synchronizeFile lib CocoaLib selector "synchronizeFile" (obj_id as Ptr)
		    
		    synchronizeFile(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Truncate(offset as UInt64)
		  'Truncates or extends the file represented by the NSFileHandle to a specified offset within the file and puts the file pointer at that position.
		  '
		  '- (void)truncateFileAtOffset:(unsigned long long)offset
		  'Parameters
		  'offset
		  'The offset within the file that will mark the new end of the file.
		  'Discussion
		  'If the file is extended (if offset is beyond the current end of file), the added characters are null bytes.
		  
		  
		  #if targetMacOS
		    declare sub truncateFileAtOffset lib CocoaLib selector "truncateFileAtOffset:" (obj_id as Ptr, offset as UInt64)
		    truncateFileAtOffset(self, offset)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as NSData)
		  //# Synchronously writes the specified data to the NSFileHandle.
		  
		  #if targetMacOS
		    declare sub writeData lib CocoaLib selector "writeData:" (obj_id as Ptr, data as Ptr)
		    
		    if data = nil then
		      return
		    end if
		    
		    writeData(self, data)
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function fileDescriptor lib CocoaLib selector "fileDescriptor" (obj_id as Ptr) as Integer
			    
			    return fileDescriptor(self)
			  #endif
			End Get
		#tag EndGetter
		FileDescriptor As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //Raises an exception if the message is sent to a file handle representing a pipe or socket or if the file descriptor is closed.
			  #if targetMacOS
			    declare function offsetInFile lib CocoaLib selector "offsetInFile" (obj_id as Ptr) as UInt64
			    
			    return offsetInFile(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub seekToFileOffset lib CocoaLib selector "seekToFileOffset:" (obj_id as Ptr, offset as UInt64)
			    
			    seekToFileOffset(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Offset As UInt64
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileDescriptor"
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
			Name="Offset"
			Group="Behavior"
			Type="UInt64"
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

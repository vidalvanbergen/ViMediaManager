#tag Class
Class NSPipe
Inherits NSObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  //default constructor overridden to discourage inappropriate object creation.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewPipe() As NSPipe
		  //pipe may return nil if there is a problem creating the pipe or either NSFileHandle object endpoint.  So
		  //we use a shared method that can return nil instead of a constructor.
		  
		  #if targetMacOS
		    declare function pipe lib CocoaLib selector "pipe" (class_id as Ptr) as Ptr
		    
		    dim p as Ptr = pipe(Cocoa.NSClassFromString("NSPipe"))
		    if p <> nil then
		      return new NSPipe(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadHandle() As NSFileHandle
		  //Don't close the read handle object; this is handled for you.
		  
		  #if targetMacOS
		    declare function fileHandleForReading lib CocoaLib selector "fileHandleForReading" (obj_id as Ptr) as Ptr
		    
		    return new NSFileHandle(fileHandleForReading(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteHandle() As NSFileHandle
		  //You use the returned file handle to write to the pipe using NSFileHandle's writeData: method.
		  //When you are finished writing data to this object, send it a closeFile message to delete the descriptor.
		  //Deleting the descriptor causes the reading process to receive an end-of-data signal (an empty NSData object).
		  
		  #if targetMacOS
		    declare function fileHandleForWriting lib CocoaLib selector "fileHandleForWriting" (obj_id as Ptr) as Ptr
		    
		    return new NSFileHandle(fileHandleForWriting(self))
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

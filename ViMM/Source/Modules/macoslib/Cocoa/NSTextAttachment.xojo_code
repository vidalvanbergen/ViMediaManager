#tag Class
Class NSTextAttachment
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(aWrapper as NSFileWrapper)
		  
		  #if targetMacOS
		    declare function initWithFileWrapper lib CocoaLib selector "initWithFileWrapper:" (obj_id as Ptr, aWrapper as Ptr) as Ptr
		    
		    super.Constructor(initWithFileWrapper(Allocate("NSTextAttachment"), aWrapper), NSTextAttachment.hasOwnership)
		    
		  #else
		    #pragma unused aWrapper
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function attachmentCell lib CocoaLib selector "attachmentCell" (obj_id as Ptr) as Ptr
			    
			    return attachmentCell(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAttachmentCell lib CocoaLib selector "setAttachmentCell:" (obj_id as Ptr, aCell as Ptr)
			    
			    setAttachmentCell self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AttachmentCell As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function fileWrapper lib CocoaLib selector "fileWrapper" (obj_id as Ptr) as Ptr
			    
			    dim wrapperRef as Ptr = fileWrapper(self)
			    if wrapperRef <> nil then
			      return new NSFileWrapper(wrapperRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setFileWrapper lib CocoaLib selector "setFileWrapper:" (obj_id as Ptr, aWrapper as Ptr)
			    
			    dim wrapperRef as Ptr
			    if value <> nil then
			      wrapperRef = value
			    end if
			    
			    setFileWrapper self, wrapperRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		FileWrapper As NSFileWrapper
	#tag EndComputedProperty


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

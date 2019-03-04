#tag Class
Class NSPathComponentCell
	#tag Method, Flags = &h0
		Sub Constructor(object_id as Ptr)
		  me.id = object_id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(obj as NSPathComponentCell) As Integer
		  if obj = nil or obj.id = nil then
		    return 1
		  else
		    return Integer(me.id) - Integer(obj.id)
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private id As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the image used for the NSPathComponentCell.
			  
			  #if TargetMacOS
			    declare function Image_ Lib CocoaLib selector "image" (obj_id as Ptr) as Ptr
			    
			    return new NSImage(Image_(self.id))
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setImage lib CocoaLib selector "setImage:" (obj_id as Ptr, anImage as Ptr)
			    
			    dim imageRef as Ptr
			    if value <> nil then
			      imageRef = value
			    end if
			    
			    setImage(self.id, imageRef)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Image As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    if me.id <> nil then
			      declare function getURL lib CocoaLib selector "URL" (id as Ptr) as Ptr
			      
			      dim p as Ptr = getURL(me.id)
			      if p <> nil then
			        declare function absoluteString lib CocoaLib selector "absoluteString" (id as Ptr) as CFStringRef
			        return absoluteString(p)
			      else
			        return ""
			      end if
			    else
			      return ""
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		URL As String
	#tag EndComputedProperty


	#tag Constant, Name = Cocoa, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
		#tag ViewProperty
			Name="URL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

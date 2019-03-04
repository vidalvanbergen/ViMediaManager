#tag Class
Class FSRef
	#tag Method, Flags = &h0
		Sub Constructor()
		  mData = new MemoryBlock(80)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ref as MemoryBlock)
		  mData = ref
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FolderItem() As FolderItem
		  return FileManager.GetFolderItemFromFSRef (me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValid() As Boolean
		  return mData <> nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As MemoryBlock
		  return mData
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mData As MemoryBlock
	#tag EndProperty


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
	#tag EndViewBehavior
End Class
#tag EndClass

#tag Class
Protected Class FourCharCode
	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  dim m as new MemoryBlock(4)
		  m.LittleEndian = false
		  m.UInt32Value(0) = self.Value
		  return DefineEncoding(m, Encodings.MacRoman)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As UInt32
		  return self.value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(value as String)
		  dim e as TextEncoding = value.Encoding
		  if e <> nil then
		    value = ConvertEncoding(value, Encodings.MacRoman)
		  end if
		  value = value.LeftB(4)
		  
		  dim m as new MemoryBlock(4)
		  m.StringValue(0, 4) = value
		  m.LittleEndian = false
		  self.value = m.UInt32Value(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(value as UInt32)
		  self.value = value
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private value As UInt32
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

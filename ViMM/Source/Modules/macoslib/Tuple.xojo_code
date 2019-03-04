#tag Class
Protected Class Tuple
	#tag Method, Flags = &h0
		Sub Constructor(items() as Variant)
		  for each item as Variant in items
		    self.Elements.Append item
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(t as Tuple) As Integer
		  if t is nil then
		    return 1
		  else
		    if self.Count > t.Count then
		      return 1
		    elseIf self.Count < t.Count then
		      return -1
		    else
		      dim cmp as Integer = 0
		      for i as Integer = 0 to UBound(self.Elements)
		        if self.Elements(i) > t.Elements(i) then
		          cmp = 1
		          exit
		        elseIf self.Elements(i) < t.Elements(i) then
		          cmp = -1
		          exit
		        else
		          //continue
		        end if
		      next
		      return cmp
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(p as Pair)
		  dim items() as Variant
		  
		  if p <> nil then
		    do
		      items.Append p.Left
		      if p.Right isA Pair then
		        p = p.Right
		      else
		        items.Append p.Right
		        exit
		      end if
		    loop
		  end if
		  
		  self.Constructor(items)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subscript(offset as Integer) As Variant
		  return self.Elements(offset)
		End Function
	#tag EndMethod


	#tag Note, Name = Read Me
		Tuple is an extension of the Pair class that holds more than two objects.  A Tuple is not the same as a list object; it is intended to 
		represent a group of objects as a single entity.
		
		
		You can use Pair syntax to create a Tuple. 
		
		dim t as Tuple = 1 : 2 : 3
		
		It supports subscript access to its elements:
		
		print t(1)
		
		Tuple indices start at 0.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return 1 + UBound(self.Elements)
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Elements() As Variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
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

#tag Class
Class CGFunction
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CFloatArray(theList() as Double) As MemoryBlock
		  if UBound(theList) = -1 then
		    return nil
		  end if
		  
		  dim theArray as new MemoryBlock(SizeOfDouble*(1 + UBound(theList)))
		  dim offset as Integer = 0
		  for i as Integer = 0 to UBound(theList)
		    theArray.DoubleValue(offset) = theList(i)
		    offset = offset + SizeOfDouble
		  next
		  
		  return theArray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGFunctionGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(info as MemoryBlock, domain() as Double, range() as Double, ByRef callbacks as CGFunctionCallbacks)
		  
		  
		  #if targetMacOS
		    soft declare function CGFunctionCreate lib CarbonLib (info as Ptr, domainDimension as Integer, domain as Ptr, rangedimension as Integer, range as Ptr, ByRef callbacks as CGFunctionCallbacks) as Ptr
		    
		    me.Data = info
		    me.domainArray = CFloatArray(domain)
		    me.rangeArray = CFloatArray(range)
		    //maybe I should save a callbacks reference as well...
		    
		    if info <> nil then
		      super.Constructor CGFunctionCreate(info, (1 + UBound(domain))\2, me.domainArray, (1 + UBound(range))\2, me.rangeArray, callbacks), true
		    else
		      super.Constructor CGFunctionCreate(nil, (1 + UBound(domain))\2, me.domainArray, (1 + UBound(range))\2, me.rangeArray, callbacks), true
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Data As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private domainArray As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private rangeArray As MemoryBlock
	#tag EndProperty


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

#tag Class
Class CGPDFPage
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BoxRect(box as CGPDFBox) As CGRect
		  if me = nil then
		    return CGRectNull
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFPageGetBoxRect lib CarbonLib (page as Ptr, box as CGPDFBox) as CGRect
		    
		    return CGPDFPageGetBoxRect(me, box)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGPDFPageGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Dictionary() As CGPDFDictionary
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFPageGetDictionary lib CarbonLib (page as Ptr) as Ptr
		    
		    dim d as CGPDFDictionary = CGPDFPageGetDictionary(me)
		    return d
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Document() As CGPDFDocument
		  if me = nil then
		    return nil
		  end if
		  
		  //this could be rewritten so as to return the same object every time.
		  //probably it would require CGPDFDocument keeping track of its objects
		  //and asking it to find the document for a page
		  #if targetMacOS
		    soft declare function CGPDFPageGetDocument lib CarbonLib (page as Ptr) as Ptr
		    
		    return new CGPDFDocument(CGPDFPageGetDocument(me), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawingTransform(box as CGPDFBox, rect as CGRect, rotate as Integer, preserveAspectRatio as Boolean) As CGAffineTransform
		  //rotate is supposed to be a multiple of 90 to specify the amount of clockwise rotation.
		  //Here we interpret rotate to be in units of 90 degrees.
		  
		  if me = nil then
		    return CoreGraphics.CGAffineTransformIdentity
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFPageGetDrawingTransform lib CarbonLib (page as Ptr, box as CGPDFBox, rect as CGRect, rotate as Integer, preserveAspectRatio as Boolean) as CGAffineTransform
		    
		    return CGPDFPageGetDrawingTransform(me, box, rect, 90*rotate, preserveAspectRatio)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGPDFPageGetPageNumber lib CarbonLib (page as Ptr) as Integer
			    
			    return CGPDFPageGetPageNumber(me)
			  #endif
			End Get
		#tag EndGetter
		Number As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGPDFPageGetRotationAngle lib CarbonLib (page as Ptr) as Integer
			    
			    return CGPDFPageGetRotationAngle(me)
			  #endif
			End Get
		#tag EndGetter
		RotationAngleInDegrees As Integer
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
			Name="Number"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RotationAngleInDegrees"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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

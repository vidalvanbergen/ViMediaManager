#tag Class
Class CGPDFDocument
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Catalog() As CGPDFDIctionary
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFDocumentGetCatalog lib CarbonLib (document as Ptr) as Ptr
		    
		    dim d as CGPDFDictionary = CGPDFDocumentGetCatalog(me)
		    return d
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CGPDFDocumentGetTypeID" () as UInteger
		    
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(url as CFURL) As CGPDFDocument
		  if url = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFDocumentCreateWithURL lib CarbonLib (url as Ptr) as Ptr
		    
		    dim p as Ptr = CGPDFDocumentCreateWithURL(url)
		    if p <> nil then
		      return new CGPDFDocument(p, true)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(provider as CGDataProvider) As CGPDFDocument
		  if provider = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFDocumentCreateWithProvider lib CarbonLib (provider as Ptr) as Ptr
		    
		    dim p as Ptr = CGPDFDocumentCreateWithProvider(provider)
		    if p <> nil then
		      return new CGPDFDocument(p, true)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ID() As CGPDFArray
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFDocumentGetID lib CarbonLib (document as Ptr) as Ptr
		    
		    dim theArray as CGPDFArray = CGPDFDocumentGetID(me)
		    return theArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Info() As CGPDFDictionary
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFDocumentGetInfo lib CarbonLib (document as Ptr) as Ptr
		    
		    dim d as CGPDFDictionary = CGPDFDocumentGetInfo(me)
		    return d
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Page(index as Integer) As CGPDFPage
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFDocumentGetPage lib CarbonLib (document as Ptr, pageNumber as Integer) as Ptr
		    
		    dim thePage as new CGPDFPage(CGPDFDocumentGetPage(me, index), false)
		    if thePage <> nil then
		      return thePage
		    else
		      return nil //if, for instance index is out of range
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unlock(password as String)
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPDFDocumentUnlockWithPassword lib CarbonLib (document as Ptr, password as CString) as Boolean
		    
		    dim b as Boolean = CGPDFDocumentUnlockWithPassword(me, password) //can check result with IsUnlocked
		    
		    // Keep the compiler from complaining
		    #pragma unused b
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return false
			  end if
			  
			  #if targetMacOS
			    soft declare function CGPDFDocumentAllowsPrinting lib CarbonLib (document as Ptr) as Boolean
			    
			    return CGPDFDocumentAllowsPrinting(me)
			  #endif
			End Get
		#tag EndGetter
		AllowsCopying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return false
			  end if
			  
			  #if targetMacOS
			    soft declare function CGPDFDocumentAllowsCopying lib CarbonLib (document as Ptr) as Boolean
			    
			    return CGPDFDocumentAllowsCopying(me)
			  #endif
			End Get
		#tag EndGetter
		AllowsPrinting As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return false
			  end if
			  
			  #if targetMacOS
			    soft declare function CGPDFDocumentIsEncrypted lib CarbonLib (document as Ptr) as Boolean
			    
			    return CGPDFDocumentIsEncrypted(me)
			  #endif
			End Get
		#tag EndGetter
		IsEncrypted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return false
			  end if
			  
			  #if targetMacOS
			    soft declare function CGPDFDocumentIsUnlocked lib CarbonLib (document as Ptr) as Boolean
			    
			    return CGPDFDocumentIsUnlocked(me)
			  #endif
			End Get
		#tag EndGetter
		IsUnlocked As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare sub CGPDFDocumentGetVersion lib CarbonLib (document as Ptr, ByRef major as Integer, ByRef minor as Integer)
			    
			    dim majorV as Integer
			    dim minorV as Integer
			    
			    CGPDFDocumentGetVersion me, majorV, minorV
			    return majorV
			  #endif
			End Get
		#tag EndGetter
		MajorVersion As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare sub CGPDFDocumentGetVersion lib CarbonLib (document as Ptr, ByRef major as Integer, ByRef minor as Integer)
			    
			    dim majorV as Integer
			    dim minorV as Integer
			    
			    CGPDFDocumentGetVersion me, majorV, minorV
			    return minorV
			  #endif
			End Get
		#tag EndGetter
		MinorVersion As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me = nil then
			    return 0
			  end if
			  
			  #if targetMacOS
			    soft declare function CGPDFDocumentGetNumberOfPages lib CarbonLib (document as Ptr) as Integer
			    
			    return CGPDFDocumentGetNumberOfPages(me)
			  #endif
			End Get
		#tag EndGetter
		PageCount As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowsCopying"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsPrinting"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="IsEncrypted"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsUnlocked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Group="Behavior"
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
			Name="PageCount"
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

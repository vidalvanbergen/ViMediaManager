#tag Class
Class MDItem
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AllAttributes() As Dictionary
		  #if TargetMacOS
		    declare function MDItemCopyAttributeNames lib CarbonLib (item as Ptr) as Ptr
		    declare function MDItemCopyAttributes lib CarbonLib (item as Ptr, names as Ptr) as Ptr
		    
		    dim cfa as CFArray
		    dim cfdict as CFDictionary
		    cfa = new CFArray( MDItemCopyAttributeNames( me.Reference ), true )
		    cfdict = new CFDictionary( MDItemCopyAttributes ( me.Reference, cfa.Reference ), true )
		    
		    return   cfDict.AsDictionary
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Attribute(key as String) As CFType
		  #if targetMacOS
		    soft declare function MDItemCopyAttribute lib CarbonLib (item as Ptr, name as CFStringRef) as Ptr
		    
		    return CFType.NewObject(MDItemCopyAttribute(me, key), true, kCFPropertyListImmutable)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributeNames() As String()
		  #if targetMacOS
		    soft declare function MDItemCopyAttributeNames lib CarbonLib (item as Ptr) as Ptr
		    
		    dim theArray as new CFArray(MDItemCopyAttributeNames(me), true)
		    if theArray = nil then
		      dim noList() as String
		      return noList
		    end if
		    
		    dim theList() as String
		    dim lastIndex as Integer = theArray.Count - 1
		    for i as Integer = 0 to lastIndex
		      dim item as new CFString(theArray.Value(i), false)
		      theList.Append item
		    next
		    
		    return theList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    
		    soft declare function MDItemGetTypeID lib CarbonLib () as UInteger
		    
		    static id as UInteger = MDItemGetTypeID
		    return id
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromFile(file as FolderItem) As MDItem
		  //# Creates a MDItem for a given file
		  
		  #if TargetMacOS
		    declare function MDItemCreateWithURL lib CarbonLib (alloc as Ptr, url as Ptr) as Ptr
		    
		    dim url as CFURL = new CFURL( file )
		    
		    return  new MDItem( MDItemCreateWithURL( nil, url ), false )
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

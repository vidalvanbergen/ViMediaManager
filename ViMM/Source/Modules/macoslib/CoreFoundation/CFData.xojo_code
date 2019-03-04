#tag Class
Class CFData
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return me.Data
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFDataGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theData as MemoryBlock)
		  // This one also takes Strings. No need for an extra constructor taking Strings therefore
		  
		  #if targetMacOS
		    soft declare function CFDataCreate lib CarbonLib (allocator as Ptr, bytes as Ptr, length as Integer) as Ptr
		    
		    if not (theData is nil) then
		      if theData.Size < 0 then
		        // this comes from a Ptr - you need to use the CFType constructor with the additional Boolean parm!
		        raise new TypeMismatchException
		      end if
		      
		      super.Constructor CFDataCreate(nil, theData, theData.Size), true
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(file as FolderItem) As CFData
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListFile( file, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFData = CFData( plist )
		    return r
		    
		  #else
		    
		    #pragma unused file
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(plistString as String) As CFData
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListString( plistString, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFData = CFData( plist )
		    return r
		    
		  #else
		    
		    #pragma unused plistString
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare sub CFDataGetBytes lib CarbonLib (theData as Ptr, range as CFRange, buffer as Ptr)
			    
			    if not ( self = nil ) then
			      dim dataLength as Integer = me.Length
			      if dataLength > 0 then
			        dim m as new MemoryBlock(dataLength)
			        dim range as CFRange = CFRangeMake(0, dataLength)
			        CFDataGetBytes me.Reference, range, m
			        return m
			      end if
			    end if
			  #endif
			  
			  return new MemoryBlock(0)
			End Get
		#tag EndGetter
		Data As MemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    soft declare function CFDataGetLength lib CarbonLib (theData as Ptr) as Integer
			    
			    return  CFDataGetLength( me.Reference )
			  #endif
			End Get
		#tag EndGetter
		Length As Integer
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
			Name="Length"
			Group="Behavior"
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

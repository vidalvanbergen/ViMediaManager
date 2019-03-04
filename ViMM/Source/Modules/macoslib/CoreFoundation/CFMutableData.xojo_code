#tag Class
Class CFMutableData
Inherits CFData
	#tag Method, Flags = &h0
		Sub Append(p as Ptr, length as Integer)
		  #if targetMacOS
		    soft declare sub CFDataAppendBytes lib CarbonLib (theData as Ptr, bytes as Ptr, length as Integer)
		    
		    if not ( self = nil ) and p <> nil then
		      CFDataAppendBytes me.Reference, p, length
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Append(s as String)
		  #if targetMacOS
		    soft declare sub CFDataAppendBytes lib CarbonLib (theData as Ptr, bytes as CString, length as Integer)
		    
		    dim slen as Integer = LenB(s)
		    if not ( self = nil ) and slen > 0 then
		      CFDataAppendBytes me.Reference, s, slen
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  #if targetMacOS
		    soft declare function CFDataCreateMutable lib CarbonLib (allocator as Ptr, capacity as Integer) as Ptr
		    
		    const capacity = 0 // can use all of available memory
		    super.Constructor CFDataCreateMutable(nil, capacity), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data as CFData)
		  if data is nil then
		    me.Constructor
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CFDataCreateMutableCopy lib CarbonLib (allocator as Ptr, capacity as Integer, theData as Ptr) as Ptr
		    
		    const capacity = 0 //can use all of available memory
		    super.Constructor CFDataCreateMutableCopy(nil, capacity, data.Reference), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(file as FolderItem) As CFMutableData
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListFile( file, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		    dim r as CFMutableData = CFMutableData( plist )
		    return r
		    
		  #else
		    
		    #pragma unused file
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(plistString as String) As CFMutableData
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListString( plistString, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		    dim r as CFMutableData = CFMutableData( plist )
		    return r
		    
		  #else
		    
		    #pragma unused plistString
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete(start as Integer, length as Integer)
		  #if targetMacOS
		    soft declare sub CFDataDeleteBytes lib CarbonLib (theData as Ptr, range as CFRange)
		    
		    if not ( self = nil ) then
		      CFDataDeleteBytes me.Reference, CFRangeMake(start, length)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace(start as Integer, length as Integer, newData as Ptr, newLength as Integer)
		  if not ( self = nil ) then
		    if newData = nil then
		      me.Delete start, length
		    else
		      #if targetMacOS
		        soft declare sub CFDataReplaceBytes lib CarbonLib (theData as Ptr, range as CFRange, newBytes as Ptr, newLength as Integer)
		        
		        CFDataReplaceBytes me.Reference, CFRangeMake(start, length), newData, newLength
		      #endif
		    end if
		  end if
		End Sub
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

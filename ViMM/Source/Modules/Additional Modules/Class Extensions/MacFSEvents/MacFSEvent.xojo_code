#tag Class
Class MacFSEvent
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path as string, flags as UInt32, ID as UInt64)
		  
		  m_Path = path
		  m_Flags = flags
		  m_eventID = ID
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DebugReportRepresentation(formatSpec as string = "") As variant
		  // Part of the DebugReportFormatter interface.
		  
		  #if TargetMacOS
		    dim textFlags() as string = FSEventModule.TextConstantsFromFlags( me.Flags )
		    
		    return   "<MacFSEvent: { path: “" + me.Path + "”" + EndOfLine + "eventID: " + Format( eventID, "#" ) + EndOfLine + "Flags: " + Hex( Flags, 8 ) + _
		    " ( " + Join( textFlags, ", " ) + " ) } >" + EndOfLine
		  #endif
		  
		  #pragma unused formatSpec
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFolderItem(onlyIfFolderItemExists as Boolean = false) As FolderItem
		  //# Return the FolderItem corresponding to Path
		  
		  //@ If you set onlyIfFolderItemExists then this method will return nil if the FolderItem does not exist
		  
		  #if TargetMacOS
		    dim f as FolderItem = GetFolderItemFromPOSIXPath( Path )
		    
		    if f<>nil then
		      if onlyIfFolderItemExists then
		        if f.Exists then
		          return  f
		        end if
		      else
		        return  f
		      end if
		    end if
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  m_eventID
			End Get
		#tag EndGetter
		eventID As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  m_Flags
			End Get
		#tag EndGetter
		Flags As UInt32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private m_eventID As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_Flags As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_Path As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  m_Path
			End Get
		#tag EndGetter
		Path As string
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="eventID"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flags"
			Group="Behavior"
			Type="UInt32"
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
			Name="Path"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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

#tag Class
Class FSAliasRecord
	#tag Method, Flags = &h0
		Sub Constructor(f As FolderItem, relativeTo As FolderItem = nil)
		  #if TargetMacOS
		    
		    if f is nil or not f.Exists then
		      zAliasRecordHandle = nil
		      return
		    end if
		    
		    declare function FSNewAlias lib CarbonLib _
		    ( fromFile as Ptr, fsRef as Ptr, ByRef inAlias as Ptr)  as Short
		    
		    dim fileRef as FSRef = FileManager.GetFSRefFromFolderItem( f )
		    dim relativeToRef as FSRef
		    if relativeTo <> nil then
		      relativeToRef = FileManager.GetFSRefFromFolderItem( relativeTo )
		    end if
		    
		    dim OSError as integer
		    if relativeTo <> nil then
		      OSError = FSNewAlias( relativeToRef, fileRef, zAliasRecordHandle )
		    else
		      OSError = FSNewAlias( nil, fileRef, zAliasRecordHandle )
		    end if
		    
		    if OSError <> 0 then
		      zAliasRecordHandle = nil
		      return
		    end if
		    
		  #else
		    
		    #pragma unused f
		    #pragma unused relativeTo
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if TargetMacOS
		    
		    if zAliasRecordHandle <> nil then
		      declare sub DisposeHandle lib CarbonLib (h as Ptr)
		      DisposeHandle zAliasRecordHandle
		      zAliasRecordHandle = nil
		    end if
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FolderItem(relativeTo As FolderItem = nil, flags As Integer = FileManager.kFSResolveAliasNoUI) As FolderItem
		  dim r as FolderItem
		  
		  #if TargetMacOS
		    
		    if zAliasRecordHandle <> nil then
		      dim mb as MemoryBlock = me.MemoryBlock
		      r = FileManager.GetFolderItemFromAliasData( mb, relativeTo, flags )
		    end if
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MemoryBlock() As MemoryBlock
		  dim r as MemoryBlock
		  
		  #if TargetMacOS
		    
		    declare sub HLockHi lib CarbonLib ( h as Ptr )
		    declare sub HUnlock lib CarbonLib ( h as Ptr )
		    
		    if zAliasRecordHandle <> nil then
		      HLockHi( zAliasRecordHandle )
		      dim mb as MemoryBlock = zAliasRecordHandle.Ptr( 0 )
		      dim sz as integer = me.Size
		      r = mb.StringValue( 0, sz )
		      HUnlock( zAliasRecordHandle )
		    end if
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As MemoryBlock
		  return me.MemoryBlock
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As Integer
		  dim r as integer
		  
		  #if TargetMacOS
		    
		    declare function GetAliasSize lib CarbonLib ( inAlias as Ptr ) as Integer
		    
		    if zAliasRecordHandle <> nil then
		      r = GetAliasSize( zAliasRecordHandle )
		    end if
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
		
		Added by Kem Tekinay with help and code from Thomas Templemann.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zAliasRecordHandle = nil
			  
			End Get
		#tag EndGetter
		IsNil As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zAliasRecordHandle As Ptr
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
			Name="IsNil"
			Group="Behavior"
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

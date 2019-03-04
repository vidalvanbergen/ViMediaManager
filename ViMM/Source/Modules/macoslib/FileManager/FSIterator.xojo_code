#tag Class
Class FSIterator
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Made private so that there is no default constructor available
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem, iterationScope as UInt32)
		  if f is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function FSOpenIterator lib CarbonLib (fsRef as Ptr, iteratorFlags as UInt32, ByRef iterator as Ptr) as Int16
		    
		    dim theRef as FSRef = FileManager.GetFSRefFromFolderItem(f)
		    dim OSErr as Integer = FSOpenIterator(theRef, iterationScope, iterator)
		    if OSErr <> noErr then
		      break
		      me.Iterator = nil
		    end if
		  #endif
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  if me.Iterator = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function FSCloseIterator lib CarbonLib (iterator as Ptr) as Int16
		    
		    dim OSErr as Int16 = FSCloseIterator(me.Iterator)
		    if OSErr <> 0 then
		      break
		    end if
		    me.Iterator = nil
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return me.Iterator
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleCount(f as FolderItem) As UInt32
		  if not f.Exists then
		    return 0
		  end if
		  if not f.Directory then
		    return 0
		  end if
		  
		  
		  #if targetMacOS
		    soft declare function FSCatalogSearch lib CarbonLib (iterator as Ptr, ByRef searchCriteria as FSSearchParams, maximumObjects as UInt32, ByRef actualObjects as UInt32, ByRef containerChanged as Boolean, whichInfo as Uint32, catalogInfos as Ptr, refs as Ptr, specs as Ptr, names as Ptr) as Int16
		    
		    dim iterator as new FSIterator(f, FSIterator.kFSIterateFlat)
		    
		    //build search criteria
		    const fsSBFlFndrInfo = 8 //For files only search by the file’s Finder info.
		    const fsSBDrUsrWds = 8 //For directories only search by the directory’s Finder info.
		    const fsSBFlParID = 8192 //For files only search by the file’s parent ID.
		    dim criteria as FSSearchParams
		    criteria.searchTime = 0
		    criteria.searchBits = fsSBFlFndrInfo + fsSBFlParID
		    criteria.searchNameLength = 0
		    criteria.searchName = nil
		    
		    //add parent dir criterion
		    
		    dim searchInfo1 as new MemoryBlock(FSCatalogInfo.Size)
		    searchInfo1.UInt32Value(4) = f.MacDirID
		    searchInfo1.Long(80) = FileManager.kIsInvisible
		    
		    criteria.searchInfo1 = searchInfo1
		    
		    dim searchInfo2 as new MemoryBlock(FSCatalogInfo.Size)
		    searchInfo2.Long(80) = FileManager.kIsInvisible
		    
		    criteria.searchInfo2 = searchInfo2
		    
		    const maximumObjects = 16
		    dim actualObjects as UInt32
		    dim containerChanged as Boolean
		    
		    dim nameArray as new MemoryBlock(maximumObjects*HFSUniStr255.Size)
		    
		    dim OSErr as Int16 = FSCatalogSearch(iterator, criteria, maximumObjects, actualObjects, containerChanged, 0, nil, nil, nil, nameArray)
		    if OSErr <> noErr then
		      break
		    end if
		    
		    return actualObjects
		  #endif
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Iterator As Ptr
	#tag EndProperty


	#tag Constant, Name = kFSIterateDelete, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSIterateFlat, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSIterateReserved, Type = Double, Dynamic = False, Default = \"&hFFFFFFFC", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSIterateSubtree, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


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

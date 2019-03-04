#tag Class
Class MacResourceFork
	#tag Method, Flags = &h0
		Sub Close()
		  #if TargetMacOS
		    
		    declare sub CloseResFile lib CarbonLib (refnum as Integer)
		    
		    if mFileHandle <> 0 then
		      CloseResFile (mFileHandle)
		      mFileHandle = 0
		      mResHandle = 0
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem, create as Boolean = false)
		  // Opens or creates the Mac Resource of the given file
		  
		  #if TargetMacOS
		    
		    declare function FSOpenResFile lib CarbonLib (fsRef as Ptr, permission as Integer) as Integer
		    declare function FSCreateResourceFile lib CarbonLib (parRef as Ptr, nameLen as Integer, name as Ptr, whichinfo as Integer, catinfo as Ptr, forkNameLen as Integer, forkName as Ptr, ByRef outRef as Ptr, outSpec as Ptr) as Integer
		    
		    mFileHandle = -1 // "not valid"
		    
		    dim saver as new ResourceChainSaver ' saves the current res file and restore it again when leaving this method
		    
		    dim ref as MemoryBlock = f.MacFSRef
		    
		    if create then
		      // create a new rsrc fork
		      if ref = nil then
		        break ' file not accessible
		        return
		      end if
		      
		    else
		      // open an existing rsrc fork
		      if ref = nil then
		        break ' file not accessible
		        return
		      end if
		      const fsCurPerm = 0
		      const fsRdPerm = 1
		      const fsRdWrPerm = 3
		      dim hdl as Integer = FSOpenResFile (ref, fsCurPerm)
		      if hdl = -1 then
		        break ' cannot open it
		        return
		      end if
		      ' successfully opened the rsrc fork
		      mFileHandle = hdl
		      mResHandle = ResourceChainSaver.CurResFile
		    end
		    
		    saver = nil // Keeps the compiler from complaining
		    
		  #else
		    
		    #pragma unused f
		    #pragma unused create
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  self.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNamedResource(type as String, name as String) As String
		  #if TargetMacOS
		    
		    dim item as ResourceItem = ResourceItem.ByName(mResHandle, type, name)
		    if item = nil then return ""
		    
		    declare function GetHandleSize lib CarbonLib (h as Ptr) as Integer
		    dim size as Integer = GetHandleSize (item.Handle)
		    
		    dim mb as MemoryBlock = item.Handle.Ptr(0)
		    return mb.StringValue(0, size)
		    
		  #else
		    
		    #pragma unused type
		    #pragma unused name
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResource(type as String, id as Integer) As String
		  #if TargetMacOS
		    
		    dim item as ResourceItem = ResourceItem.ByID(mResHandle, type, id)
		    if item = nil then return ""
		    
		    dim hdl as Ptr = item.Handle
		    if hdl = nil then return ""
		    
		    declare function GetHandleSize lib CarbonLib (h as Ptr) as Integer
		    dim size as Integer = GetHandleSize (item.Handle)
		    
		    dim mb as MemoryBlock = item.Handle.Ptr(0)
		    return mb.StringValue(0, size)
		    
		  #else
		    
		    #pragma unused type
		    #pragma unused id
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttributes(type as String, id as Integer) As Integer
		  #if TargetMacOS
		    
		    declare function GetResAttrs lib CarbonLib (hdl as Ptr) as Integer
		    dim res as new ResourceAccessor (mResHandle)
		    return GetResAttrs (ResourceItem.ByID(mResHandle, type, id).Handle)
		    
		    res = nil // Keeps the compiler from complaining
		    
		  #else
		    
		    #pragma unused type
		    #pragma unused id
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceCount(type as String) As Integer
		  #if TargetMacOS
		    
		    declare function Count1Resources lib CarbonLib (type as OSType) as Integer
		    
		    dim res as new ResourceAccessor (mResHandle)
		    
		    return Count1Resources (type)
		    
		    res = nil // Keeps the compiler from complaining
		    
		  #else
		    
		    #pragma unused type
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceID(type as String, index_0 as Integer) As Integer
		  #if TargetMacOS
		    
		    declare sub GetResInfo lib CarbonLib (hdl as Ptr, ByRef id as Integer, ByRef t as OSType, name as Ptr)
		    
		    dim id as Integer, t as OSType
		    dim name as new MemoryBlock(256)
		    
		    GetResInfo ResourceItem.ByIndex(mResHandle, type, index_0).Handle, id, t, name
		    
		    return id
		    
		  #else
		    
		    #pragma unused type
		    #pragma unused index_0
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceLocked(type as String, id as Integer) As Boolean
		  return Bitwise.BitAnd (self.ResourceAttributes (type, id), resLocked) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceName(type as String, index_0 as Integer) As String
		  #if TargetMacOS
		    
		    declare sub GetResInfo lib CarbonLib (hdl as Ptr, ByRef id as Integer, ByRef t as OSType, name as Ptr)
		    
		    dim id as Integer, t as OSType
		    dim name as new MemoryBlock(256)
		    
		    GetResInfo ResourceItem.ByIndex(mResHandle, type, index_0).Handle, id, t, name
		    
		    return name.PString(0)
		    
		  #else
		    
		    #pragma unused type
		    #pragma unused index_0
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourcePreload(type as String, id as Integer) As Boolean
		  return Bitwise.BitAnd (self.ResourceAttributes (type, id), resPreload) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceProtected(type as String, id as Integer) As Boolean
		  return Bitwise.BitAnd (self.ResourceAttributes (type, id), resProtected) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourcePurgeable(type as String, id as Integer) As Boolean
		  return Bitwise.BitAnd (self.ResourceAttributes (type, id), resPurgeable) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceSysHeap(type as String, id as Integer) As Boolean
		  return Bitwise.BitAnd (self.ResourceAttributes (type, id), resSysHeap) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceType(index_0 as Integer) As String
		  #if TargetMacOS
		    
		    declare sub Get1IndType lib CarbonLib (ByRef t as OSType, idx as Integer)
		    
		    dim res as new ResourceAccessor (mResHandle)
		    dim t as OSType
		    Get1IndType t, index_0+1
		    return t
		    
		    res = nil // Keeps the compiler from complaining
		    
		  #else
		    
		    #pragma unused index_0
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TypeCount() As Integer
		  #if TargetMacOS
		    
		    declare function Count1Types lib CarbonLib () as Integer
		    dim res as new ResourceAccessor (mResHandle)
		    return Count1Types
		    
		    res = nil // Keeps the compiler from complaining
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Valid() As Boolean
		  return mFileHandle <> -1
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFileHandle As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResHandle As Integer
	#tag EndProperty


	#tag Constant, Name = resLocked, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = resPreload, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = resProtected, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = resPurgeable, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = resSysHeap, Type = Double, Dynamic = False, Default = \"64", Scope = Public
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

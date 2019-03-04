#tag Module
Protected Module BSD
	#tag Method, Flags = &h1
		Protected Function ErrorCode() As Integer
		  #if TargetMacOS
		    declare function libcErrorCode lib libc alias "__error" () as Ptr
		    
		    dim p as Ptr = libcErrorCode()
		    if p = nil then
		      //something bad has happened
		      return 0
		    end if
		    return p.Int32(0)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function lstat(path as String) As stat
		  'The lstat() system call is like stat() except in the case where the named
		  'file is a symbolic link, in which case lstat() returns information about
		  'the link, while stat() returns information about the file the link refer-
		  'ences.
		  
		  #if TargetMacOS
		    declare function lstat lib libc (path as CString, byref buf as stat) as integer
		    
		    
		    dim buf as stat
		    dim result as integer = lstat(path, buf )
		    if result <> -1 then
		      return buf
		    else
		      raise new BSD.Error(ErrorCode)
		    end if
		    
		  #else
		    #pragma unused path
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function stat(path as String) As stat
		  #if TargetMacOS
		    declare function stat lib libc (path as CString, byref buf as stat) as integer
		    
		    dim buf as stat
		    dim result as integer = stat(path, buf )
		    if result <> -1 then
		      return buf
		    else
		      raise new BSD.Error(ErrorCode)
		    end if
		    
		  #else
		    #pragma unused path
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = libc, Type = String, Dynamic = False, Default = \"/usr/lib/libc.dylib", Scope = Private
	#tag EndConstant


	#tag Structure, Name = stat, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		st_dev as UInt32
		  st_ino as UInt32
		  st_mode as UInt16
		  st_nlink as UInt16
		  st_uid as UInt32
		  st_gid as UInt32
		  st_rdev as UInt32
		  st_atimespec as timespec
		  st_mtimespec as timespec
		  st_ctimespec as timespec
		  st_size as Int64
		  st_blocks as Int64
		  st_blksize as UInt32
		  st_flags as UInt32
		  st_gen as UInt32
		  st_lspare_DONOTUSE as Int32
		st_qspare_DONOTUSE(1) as Int64
	#tag EndStructure

	#tag Structure, Name = timespec, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		tv_sec as Int32
		tv_nsec as Int32
	#tag EndStructure


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
End Module
#tag EndModule

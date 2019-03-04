#tag Module
Module FileManager
	#tag Method, Flags = &h1
		Protected Function Equals(fsRef1 as FSRef, fsRef2 as FSRef) As Boolean
		  #if targetMacOS
		    soft declare function FSCompareFSRefs lib CarbonLib (ref1 as Ptr, ref2 as Ptr) as Int16
		    
		    dim OSError as Int16 = FSCompareFSRefs(fsRef1, fsRef2)
		    return (OSError = noErr)
		    
		  #else
		    
		    #pragma unused fsRef1
		    #pragma unused fsRef2
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FSCopyAliasInfo(aliasData As MemoryBlock, ByRef targetName As HFSUniStr255, ByRef volumeName As HFSUniStr255, ByRef pathString As CFStringRef, ByRef aliasInfoBitmap As Integer, ByRef aliasInfo As FSAliasInfo) As Integer
		  dim OSError as integer
		  
		  #if TargetMacOS
		    
		    declare function FSCopyAliasInfo Lib CarbonLib _
		    ( aliasHandle As Integer, ByRef targetName As HFSUniStr255, ByRef volumeName As HFSUniStr255, ByRef pathString As CFStringRef, ByRef whichInfo As integer, ByRef info as FSAliasInfo ) As Integer
		    declare function NewHandle Lib CarbonLib ( size as Integer ) as Integer
		    declare sub DisposeHandle Lib CarbonLib ( hdl as Integer )
		    
		    dim aliasHandle as new MemoryBlock( 4 )
		    aliasHandle.Long( 0 ) = NewHandle( LenB( aliasData ) )
		    aliasHandle.Ptr( 0 ).Ptr( 0 ).StringValue( 0, LenB( aliasData ) ) = aliasData
		    
		    OSError = FSCopyAliasInfo( aliasHandle.Long( 0 ), targetName, volumeName, pathString, aliasInfoBitmap, aliasInfo )
		    DisposeHandle( aliasHandle.Long( 0 ) )
		    
		  #else
		    
		    #pragma unused aliasData
		    #pragma unused targetName
		    #pragma unused volumeName
		    #pragma unused pathString
		    #pragma unused aliasInfoBitmap
		    #pragma unused aliasInfo
		    
		  #endif
		  
		  return OSError
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FSRef(extends f as FolderItem) As FSRef
		  //# This is a renamed function from older MacOSLib versions. It used to be called "MacFSRef",
		  // but this name is now provided by RB's framework since REAL Studio 2010r5.
		  
		  return GetFSRefFromFolderItem (f)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FSRefMakePath(ref as FSRef) As String
		  #if TargetMacOS
		    declare function FSRefMakePath lib CarbonLib (ref as Ptr, path as Ptr, maxSize as Integer) as Integer
		    
		    dim mb as new MemoryBlock(PATH_MAX)
		    dim err as Integer = FSRefMakePath (ref, mb, mb.Size)
		    if err = 0 then
		      return mb.CString(0).DefineEncoding(Encodings.UTF8)
		    end
		    
		  #else
		    
		    #pragma unused ref
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFolderItemFromAliasData(aliasData as MemoryBlock, relativeTo as FolderItem = nil, flags as Integer = FileManager.kFSResolveAliasNoUI) As FolderItem
		  // Adapted from code written by Thomas Tempelmann (www.tempel.org/rb/), from his TTsFiles module.
		  
		  dim r as FolderItem
		  
		  #if TargetMacOS
		    
		    if aliasData is nil then return nil
		    
		    declare function FSResolveAliasWithMountFlags Lib CarbonLib _
		    ( fsrefIn as Ptr, aliasHdl as Integer, fsrefOut as Ptr, ByRef changed as Boolean, flags as UInteger ) as Integer
		    declare function NewHandle Lib CarbonLib ( size as Integer ) as Integer
		    declare sub DisposeHandle Lib CarbonLib ( hdl as Integer )
		    
		    dim mb1 as new MemoryBlock( 4 ) // holds just the handle for the alias data
		    mb1.Long( 0 ) = NewHandle( LenB( aliasData ) )
		    mb1.Ptr( 0 ).Ptr( 0 ).StringValue( 0, LenB( aliasData ) ) = aliasData
		    
		    dim OSError as Integer
		    dim mb2 as MemoryBlock
		    if relativeTo <> nil then
		      mb2 = relativeTo.MacFSRef
		    end
		    dim outRef as new MemoryBlock( 80 )
		    dim changed as Boolean
		    if mb2 <> nil then
		      OSError = FSResolveAliasWithMountFlags( mb2, mb1.Long(0), outRef, changed, flags )
		    else
		      OSError = FSResolveAliasWithMountFlags( nil, mb1.Long(0), outRef, changed, flags )
		    end
		    DisposeHandle ( mb1.Long( 0 ) )
		    if OSError = 0 then
		      r = FolderItem.CreateFromMacFSRef( outRef )
		    else
		      
		      // We'll grab the info from the alias and create a folderitem that way.
		      dim targetNameHFS as HFSUniStr255
		      dim volumeNameHFS as HFSUniStr255
		      dim pathString as CFStringRef
		      dim bitmap as integer
		      dim aliasInfo as FSAliasInfo
		      
		      OSError = FSCopyAliasInfo( aliasData, targetNameHFS, volumeNameHFS, pathString, bitmap, aliasInfo )
		      if OSError = 0 and pathString <> "" then
		        #if DebugBuild
		          dim targetName as string = StringValue( targetNameHFS )
		          dim volumeName as string = StringValue( volumeNameHFS )
		          #pragma unused targetName
		          #pragma unused volumeName
		        #endif
		        r = GetFolderItemFromPOSIXPath( pathString )
		      end if
		    end if
		    
		  #else
		    
		    #pragma unused aliasData
		    #pragma unused relativeTo
		    #pragma unused flags
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFolderItemFromFSRef(theFSRef as FSRef) As FolderItem
		  #if targetMacOS
		    
		    #if RBVersion >= 2010.05
		      
		      return FolderItem.CreateFromMacFSRef (theFSRef)
		      
		    #else
		      
		      // use the "lib hack"
		      
		      declare function FSGetCatalogInfo lib CarbonLib (ref as Ptr, whichInfo as Uint32, _
		      ByRef catalogInfo as FSCatalogInfo, outName as Ptr, fsSpec as Ptr, parentRef as Ptr) as Int16
		      
		      dim err as Integer
		      dim parentRef as new FSRef
		      dim catalogInfo as FSCatalogInfo
		      
		      declare function REALFolderItemFromParentFSRef lib "" (parentRef as Ptr, name as Ptr) as FolderItem
		      
		      dim itemName as new MemoryBlock(512)
		      err = FSGetCatalogInfo (theFSRef, kFSCatInfoNodeID, catalogInfo, itemName, nil, parentRef)
		      if err <> 0 then
		        // item doesn't exist
		        return nil
		      elseif catalogInfo.nodeID = 2 then
		        // this is a root dir - we cannot use REALFolderItemFromParentFSRef there
		        // -> determine the Volume item
		        err = FSGetCatalogInfo(theFSRef, kFSCatInfoVolume, catalogInfo, nil, nil, parentRef)
		        if err <> 0 then
		          return nil
		        end
		        dim theVolume as FolderItem
		        for i as Integer = VolumeCount - 1 downto 0
		          dim v as FolderItem = Volume(i)
		          if v is nil then
		            continue
		          end if
		          if v.MacVRefNum = catalogInfo.volume then
		            theVolume = v
		            exit
		          end if
		        next
		        return theVolume
		      else
		        dim f as FolderItem = REALFolderItemFromParentFSRef (parentRef, itemName)
		        if f = nil then
		          break // this is unexpected
		        end
		        return f
		      end if
		      
		    #endif
		    
		  #else
		    
		    #pragma unused theFSRef
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFolderItemFromFSSpec(theFSSpec as FSSpec) As FolderItem
		  #if targetMacOS
		    if theFSSpec.parID = fsRtParID then // I am the root directory
		      dim f as FolderItem
		      for i as Integer = 0 to VolumeCount - 1
		        if Volume(i).MacVRefNum = theFSSpec.vRefNum then
		          f = Volume(i)
		          exit
		        end if
		      next
		      return f
		    else
		      soft declare function FSMakeFSSpec lib CarbonLib (vRefNum as Int16, dirID as Integer, filename as PString, ByRef spec as FSSpec) as Int16
		      
		      dim parentSpec as FSSpec
		      dim OSError as Int16 = FSMakeFSSpec(theFSSpec.vRefNum, theFSSpec.parID, "", parentSpec)
		      if OSError <> 0 then
		        return nil
		      end if
		      dim f as FolderItem = GetFolderItemFromFSSpec(parentSpec) //recursion occurs here
		      if f <> nil then
		        return f.TrueChild(ConvertEncoding(DefineEncoding(LeftB(theFSSpec.Name.char, theFSSpec.Name.length), Encodings.SystemDefault), Encodings.UTF8))
		      else
		        return nil
		      end if
		    end if
		    
		  #else
		    
		    #pragma unused theFSSpec
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFolderItemFromPOSIXPath(absolutePath as String) As FolderItem
		  // Note: The passed path must be absolute, i.e. start from root with "/"
		  
		  dim f as FolderItem
		  
		  #if TargetMacOS and RBVersion >= 2013.0
		    
		    f = GetFolderItem( absolutePath, FolderItem.PathTypeNative )
		    
		  #elseif TargetMacOS
		    
		    declare function CFURLCreateWithFileSystemPath lib CarbonLib (allocator as ptr, filePath as CFStringRef, pathStyle as Integer, isDirectory as Boolean) as Ptr
		    declare function CFURLGetString lib CarbonLib (anURL as Ptr) as Ptr
		    declare sub CFRelease lib CarbonLib (cf as Ptr)
		    declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
		    
		    const kCFURLPOSIXPathStyle = 0
		    
		    dim url as Ptr = CFURLCreateWithFileSystemPath(nil, absolutePath, kCFURLPOSIXPathStyle, true)
		    dim s as CFStringRef = CFRetain (CFURLGetString (url))
		    CFRelease (url)
		    f = GetFolderItem (s, FolderItem.PathTypeURL)
		    
		  #else
		    
		    #pragma unused absolutePath
		    
		  #endif
		  
		  return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFSRefFromCFURLRef(urlRef as Ptr, ByRef outFSRef as FSRef) As Boolean
		  #if targetMacOS
		    declare function CFURLGetFSRef lib CarbonLib (CFURLRef as Ptr, ref as Ptr) as Boolean
		    
		    return CFURLGetFSRef (urlRef, outFSRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFSRefFromFolderItem(f as FolderItem) As FSRef
		  static nullFSRef as new FSRef
		  
		  if f is nil then
		    f = GetFolderItem("")
		    if f is nil then
		      return nullFSRef
		    end if
		  end if
		  
		  #if TargetMacOS
		    
		    dim theFSRef as FSRef
		    
		    #if RBVersion >= 2010.05
		      
		      theFSRef = new FSRef(f.MacFSRef)
		      
		    #else
		      // use the "lib hack"
		      
		      theFSRef = new FSRef
		      
		      if f.Parent is nil then //f should be the root directory of the volume
		        declare function FSGetVolumeInfo lib CarbonLib (volume as Int16, volumeIndex as Integer, actualVolume as Ptr, whichInfo as UInt32, info as Ptr, volumeName as Ptr, rootDirectory as Ptr) as Int16
		        dim OSErr as Int16 = FSGetVolumeInfo(f.MacVRefNum, 0, Nil, kFSVolInfoNone, Nil, Nil, theFSRef)
		        #if debugBuild
		          if OSErr <> 0 then break
		        #endif
		      else
		        declare function REALFSRefFromFolderItem lib "" (f as Object, refOut as Ptr, nameOut as Ptr) as Boolean
		        if not REALFSRefFromFolderItem (f, theFSRef, nil) then
		          return nullFSRef
		        end
		      end if
		      
		    #endif
		    
		    return theFSRef
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFSRefFromFSSpec(theFSSpec as FSSpec) As FSRef
		  #if targetMacOS
		    soft declare function FSpMakeFSRef lib CarbonLib (ByRef source as FSSpec, newRef as Ptr) as Int16
		    
		    dim theFSRef as new FSRef
		    dim OSError as Int16 = FSpMakeFSRef(theFSSpec, theFSRef)
		    //you can check the return value using IsValid.
		    return theFSRef
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		    
		  #else
		    
		    #pragma unused theFSSpec
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsValid(theFSRef as FSRef) As Boolean
		  #if targetMacOS
		    soft declare function FSGetCatalogInfo lib CarbonLib (ref as Ptr, whichInfo as Integer, catalogInfo as Ptr, outName as Ptr, fsSpec as Ptr, parentRef as Ptr) as Int16
		    
		    dim OSError as Int16 = FSGetCatalogInfo(theFSRef, kFSCatInfoNone, Nil, Nil, Nil, Nil)
		    return (OSError = 0)
		    
		  #else
		    
		    #pragma unused theFSRef
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsVolumeCaseSensitive(extends f as FolderItem) As Boolean
		  //# Indicates if the volume on which f resides is case sensitive
		  
		  #if targetMacOS
		    soft declare function FSGetVolumeParms lib CarbonLib (volume as Int16, ByRef buffer as GetVolParmsInfoBuffer, bufferSize as Integer) as Integer
		    
		    dim buffer as GetVolParmsInfoBuffer
		    dim err as Integer = FSGetVolumeParms(f.MacVRefNum, buffer, buffer.Size)
		    if err = noErr then
		      return (buffer.vMExtendedAttributes and isCaseSensitive) = isCaseSensitive
		    else
		      //since we're not generally raising exceptions, alas
		      return false
		    end if
		    
		  #else
		    
		    #pragma unused f
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NativePath(f as FolderItem) As String
		  //# This gives a path that fits what the OS likes - i.e. a POSIX Path on Mac and Linux
		  
		  #if RBVersion >= 2013.0
		    return f.NativePath
		    
		  #elseif TargetMacOS
		    return f.POSIXPath
		    
		  #else
		    return f.AbsolutePath
		    
		  #endif
		  
		  // Note that FolderItem.NativePath was incorporated into Xojo 2013r1, so this method was changed
		  // from an "extends" to something that requires the module prefix.
		  // You will not have to modify your code in Xojo. For Real Studio, change your code from
		  //
		  //    f.NativePath
		  //
		  // to
		  //
		  //    FileManager.NativePath(f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function POSIXPath(extends f as FolderItem) As String
		  //# Returns a POSIX path (such as "/usr/bin/ls") on OS X and Linux.
		  //@ NOT working on Windows because Windows does not use POSIX paths!
		  //@ Consider calling NativePath instead if you need a low level path that works on all platforms
		  
		  #if RBVersion >= 2013.0 and TargetMacOS
		    return f.NativePath
		    
		  #elseif TargetMacOS
		    dim url as CFURL = CFURL.CreateFromHFSPath(f.AbsolutePath, f.Directory)
		    return url.Path
		    
		  #elseif TargetLinux
		    
		    return f.AbsolutePath
		    
		  #else
		    
		    break // Windows has no POSIX paths, or does it?
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(Extends s As HFSUniStr255) As String
		  // Added by Kem Tekinay.
		  // Overloads the native structure StringValue.
		  
		  return FileManager.StringValue( s )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StringValue(s as HFSUniStr255) As String
		  dim data as string = s.StringValue( TargetLittleEndian )
		  dim r as string = data.MidB( 3, 2 * s.Length ).DefineEncoding( Encodings.UTF16 )
		  
		  return r
		  
		  // Changed on Aug. 7, 2012 by Kem Tekinay to return a UTF16 string rather than a UTF8.
		  
		  // Original code
		  // (Modified to make it more human-readable and easier to debug, if needed)
		  'dim data as String = s.StringValue(TargetLittleEndian)
		  'return ConvertEncoding(DefineEncoding(MidB(data, 3, 2*s.length), Encodings.UTF16), Encodings.UTF8)
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote

	#tag Note, Name = FSSpec Notes
		FSSpec is platform-dependent, i.e. it's different on OS X and Windows
		(when used with Quicktime functions).
		
		On MacOS, the last field is a Str63 -- 64-byte pascal string.
		For Windows, the last field is a Str255 -- a 256 byte pascal string.
		
		This code declares FSSpec for use with MacOS only! If you copy it for use in declaring to
		QuickTime for Windows, you'll need to change the declaration, or define a new structure
		FSSpecWin.
	#tag EndNote


	#tag Constant, Name = bIsCasePreserving, Type = Double, Dynamic = False, Default = \"23", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = bIsCaseSensitive, Type = Double, Dynamic = False, Default = \"22", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = fsRtParID, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = IsCaseSensitive, Type = Double, Dynamic = False, Default = \"&h400000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoAccessDate, Type = Double, Dynamic = False, Default = \"&h00000100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoAllDates, Type = Double, Dynamic = False, Default = \"&h000003E0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoAttrMod, Type = Double, Dynamic = False, Default = \"&h00000080", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoBackupDate, Type = Double, Dynamic = False, Default = \"&h00000200", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoContentMod, Type = Double, Dynamic = False, Default = \"&h00000040", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoCreateDate, Type = Double, Dynamic = False, Default = \"&h00000020", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoDataSizes, Type = Double, Dynamic = False, Default = \"&h00004000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoFinderInfo, Type = Double, Dynamic = False, Default = \"&h00000800", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoFinderXInfo, Type = Double, Dynamic = False, Default = \"&h00001000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoGettableInfo, Type = Double, Dynamic = False, Default = \"&h0003FFFF", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoNodeFlags, Type = Double, Dynamic = False, Default = \"&h00000002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoNodeID, Type = Double, Dynamic = False, Default = \"&h00000010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoNone, Type = Double, Dynamic = False, Default = \"&h00000000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoParentDirID, Type = Double, Dynamic = False, Default = \"&h00000008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoPermissions, Type = Double, Dynamic = False, Default = \"&h00000400", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoReserved, Type = Double, Dynamic = False, Default = \"&hFFFC0000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoRsrcSizes, Type = Double, Dynamic = False, Default = \"&h00008000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoSetOwnership, Type = Double, Dynamic = False, Default = \"&h00100000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoSettableInfo, Type = Double, Dynamic = False, Default = \"&h00001FE3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoSharingFlags, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoTextEncoding, Type = Double, Dynamic = False, Default = \"&h00000001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoUserAccess, Type = Double, Dynamic = False, Default = \"&h00080000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoUserPrivs, Type = Double, Dynamic = False, Default = \"&h00020000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoValence, Type = Double, Dynamic = False, Default = \"&h00002000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoVolume, Type = Double, Dynamic = False, Default = \"&h00000004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSResolveAliasNoUI, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSResolveAliasTryFileIDFirst, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoBackupDate, Type = Double, Dynamic = False, Default = \"&h0004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoBlocks, Type = Double, Dynamic = False, Default = \"&h0080", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoCheckedDate, Type = Double, Dynamic = False, Default = \"&h0008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoCreateDate, Type = Double, Dynamic = False, Default = \"&h0001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoDataClump, Type = Double, Dynamic = False, Default = \"&h0400", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoDirCount, Type = Double, Dynamic = False, Default = \"&h0020", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoDriveInfo, Type = Double, Dynamic = False, Default = \"&h8000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoFileCount, Type = Double, Dynamic = False, Default = \"&h0010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoFinderInfo, Type = Double, Dynamic = False, Default = \"&h1000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoFlags, Type = Double, Dynamic = False, Default = \"&h2000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoFSInfo, Type = Double, Dynamic = False, Default = \"&h4000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoGettableInfo, Type = Double, Dynamic = False, Default = \"&hffff", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoModDate, Type = Double, Dynamic = False, Default = \"&h0002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoNextAlloc, Type = Double, Dynamic = False, Default = \"&h0100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoNextID, Type = Double, Dynamic = False, Default = \"&h0800", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoNone, Type = Double, Dynamic = False, Default = \"&h0000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoRsrcClump, Type = Double, Dynamic = False, Default = \"&h0200", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoSettableInfo, Type = Double, Dynamic = False, Default = \"&h3004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSVolInfoSizes, Type = Double, Dynamic = False, Default = \"&h0040", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIsInvisible, Type = Double, Dynamic = False, Default = \"&h4000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTextEncodingUnknown, Type = Double, Dynamic = False, Default = \"&hffff", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PATH_MAX, Type = Double, Dynamic = False, Default = \"2048", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = FileInfo, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		fileType as OSType
		  fileCreator as OSType
		  finderFlags as UInt16
		  location as MacPoint
		reservedField as UInt16
	#tag EndStructure

	#tag Structure, Name = FSAliasInfo, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		volumeCreateDate As UTCDateTime
		  targetCreateDate As UTCDateTime
		  fileType As OSType
		  fileCreator As OSType
		  parentDirID As UInt32
		  nodeID As UInt32
		  fileSystemID As UInt16
		  signature As UInt16
		  volumeIsBootVolume As Boolean
		  volumeIsAutomounted As Boolean
		  volumeIsEjectable As Boolean
		  volumeHasPersistentFileIDs As Boolean
		isDirectory As Boolean
	#tag EndStructure

	#tag Structure, Name = FSCatalogInfo, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		nodeFlags as UInt16
		  volume as Int16
		  parentDirID as UInt32
		  nodeID as UInt32
		  sharingFlags as UInt8
		  userPrivileges as UInt8
		  reserved1 as UInt8
		  reserved2 as UInt8
		  createDate as UTCDateTime
		  contentModDate as UTCDateTime
		  attributeModDate as UTCDateTime
		  accessDate as UTCDateTime
		  backupDate as UTCDateTime
		  permissions(3) as UInt32
		  finderInfo(15) as UInt8
		  extFinderInfo(15) as UInt8
		  dataLogicalSize as UInt64
		  dataPhysicalSize as UInt64
		  rsrcLogicalSize as UInt64
		  rsrcPhysicalSize as UInt64
		  valence as UInt32
		textEncodingHint as UInt32
	#tag EndStructure

	#tag Structure, Name = FSSearchParams, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		searchTime as Int32
		  searchBits as Uint32
		  searchNameLength as UInt32
		  searchName as Ptr
		  searchInfo1 as Ptr
		searchInfo2 as Ptr
	#tag EndStructure

	#tag Structure, Name = FSSpec, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		vRefNum as Int16
		  parID as Int32
		name as Str63
	#tag EndStructure

	#tag Structure, Name = FSVolumeInfo, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		createDate as UTCDateTime
		  modifyDate as UTCDateTime
		  backupDate as UTCDateTime
		  checkedDate as UTCDateTime
		  fileCount as UInt32
		  folderCount as UInt32
		  totalBytes as UInt64
		  freeBytes as UInt64
		  blockSize as UInt32
		  totalBlocks as UInt32
		  freeBlocks as UInt32
		  nextAllocation as Uint32
		  rsrcClumpSize as UInt32
		  dataClumpSize as UInt32
		  nextCatalogID as UInt32
		  finderInfo(31) as UInt8
		  flags as UInt16
		  filesystemID as UInt16
		  signature as UInt16
		  driveNumber as Uint16
		driverRefNum as Int16
	#tag EndStructure

	#tag Structure, Name = GetVolParmsInfoBuffer, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		vMVersion as Int16
		  vMAttrib as Int32
		  vMlocalHand as Ptr
		  vMServerAddr as Int32
		  vMVolumeGrade as Int32
		  vMForeignPrivID as Int16
		  vMExtendedAttributes as Int32
		  vMDeviceID as Ptr
		vMMaxNameLength as UInt32
	#tag EndStructure

	#tag Structure, Name = HFSUniStr255, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		length as UInt16
		unicode(254) as UInt16
	#tag EndStructure

	#tag Structure, Name = HIOParam, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		qLink as Ptr
		  qType as Int16
		  ioTrap as Int16
		  ioCmdAddr as Ptr
		  ioCompletion as Ptr
		  ioResult as Int16
		  ioNamePtr as Ptr
		  ioVRefNum as Int16
		  ioRefNum as Int16
		  ioVersNum as Int8
		  ioPermssn as Int8
		  ioMisc as Ptr
		  ioBuffer as Ptr
		  ioReqCount as Int32
		  ioActCount as Int32
		  ioPosMode as Int16
		ioPosOffset as Int32
	#tag EndStructure

	#tag Structure, Name = Str63, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		length as UInt8
		char as String*63
	#tag EndStructure

	#tag Structure, Name = UTCDateTime, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		highSeconds as UInt16
		  lowSeconds as UInt32
		fraction as UInt16
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

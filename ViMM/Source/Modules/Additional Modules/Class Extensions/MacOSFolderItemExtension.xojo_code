#tag Module
Protected Module MacOSFolderItemExtension
	#tag Method, Flags = &h21
		Private Function AreNamesEqual(name1 as String, name2 as String, casesensitive as Boolean) As Boolean
		  //this code compares file names following Apple Technical Note TN1150.  It assumes that names are normalized according to
		  //Unicode Normalization Form D.
		  
		  #if targetMacOS
		    dim uname1 as String = ConvertEncoding(name1, Encodings.UTF16)
		    dim uname2 as String = ConvertEncoding(name2, Encodings.UTF16)
		    
		    if casesensitive then
		      return StrComp(uname1, uname2, 0) = 0
		    else
		      declare function UCCompareTextNoLocale lib CarbonLib (options as UInt32, text1Ptr as CString, text1Length as Integer, text2Ptr as CString, text2Length as Integer, ByRef equivalent as Boolean, order as Ptr) as Integer
		      const kUCCollateTypeHFSExtended = &h1000000
		      dim options as UInt32 = kUCCollateTypeHFSExtended
		      dim equivalent as Boolean
		      dim err as Integer = UCCompareTextNoLocale(options, uname1, Len(uname1), uname2, Len(uname2), equivalent, nil)
		      #pragma unused err
		      return equivalent
		    end If
		    
		  #else
		    #pragma unused name1
		    #pragma unused name2
		    #pragma unused casesensitive
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DADiskDescription(extends f as FolderItem) As Dictionary
		  //# Return the disk description dictionary from Disk Arbitration
		  
		  //@ [OS X 10.4 and later]
		  
		  #if TargetMacOS
		    soft declare function DASessionCreate lib "DiskArbitration.framework" (alloc as Ptr) as Ptr
		    soft declare function DADiskCreateFromBSDName lib "DiskArbitration.framework" ( alloc as Ptr, session as Ptr, name as CString ) as Ptr
		    soft declare function DADiskCopyDescription lib "DiskArbitration.framework" (disk as Ptr) as Ptr
		    
		    assertOSVersion  100400 //Tiger and later
		    
		    dim DASessionRef, DADiskRef, p as Ptr
		    dim cfdict as CFDictionary
		    dim dict as Dictionary
		    
		    DASessionRef = DASessionCreate( nil )
		    AssertPtr  DASessionRef, "DADiskDescription failed: unable to create a DiskArbitration session"
		    
		    if f.DeviceName<>"" then
		      DADiskRef = DADiskCreateFromBSDName( nil, DASessionRef, f.DeviceName )
		      AssertPtr  DASessionRef, "DADiskDescription failed: unable to find the volume"
		    else //It's a network volume
		      return  nil
		    end if
		    
		    p = DADiskCopyDescription( DADiskRef )
		    AssertPtr  p, "DADiskDescription failed: unable to get description"
		    
		    cfdict = new CFDictionary( p, false )
		    dict = cfdict
		    
		    //Release CF objects
		    cfdict = nil
		    CoreFoundation.Release  DADiskRef
		    CoreFoundation.Release  DASessionRef
		    
		    return  dict
		    
		  #else
		    #pragma unused f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeviceName(extends f as FolderItem) As String
		  //# DeviceName returns the BSD name of the volume containing f as found in the directory /dev.  Only local volumes have such names.
		  
		  #if TargetMacOS
		    soft declare function PBHGetVolParmsSync lib CarbonLib (ByRef paramBlock as HIOParam) as Short
		    
		    dim paramBlock as HIOParam
		    paramBlock.ioVRefNum = f.MacVRefNum
		    //the following line is a trick to work around the inability to assign a pointer to a structure
		    //to a field of type Ptr.
		    dim infoBuffer as new MemoryBlock(GetVolParmsInfoBuffer.Size)
		    paramBlock.ioBuffer = infoBuffer
		    paramBlock.ioReqCount = infoBuffer.Size
		    
		    dim OSError as Integer = PBHGetVolParmsSync(paramBlock)
		    if OSError <> 0 then
		      return ""
		    end if
		    
		    dim infoBufferPtr as GetVolParmsInfoBuffer = paramBlock.ioBuffer.GetVolParmsInfoBuffer(0)
		    if infoBufferPtr.vMServerAddr = 0 then
		      if infoBufferPtr.vMDeviceID <> nil then
		        dim s as MemoryBlock = infoBufferPtr.vMDeviceID
		        dim BSDName as String = s.CString(0)
		        return DefineEncoding(BSDName, Encodings.SystemDefault)
		      else
		        return ""
		      end if
		    else
		      // vMServerAddr <> 0 means it's a network device, which apparently won't have a BSD name.
		      return ""
		    end if
		    
		  #else
		    #pragma unused f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(extends f as FolderItem, g as FolderItem) As Boolean
		  //f cannot be nil; if it were, the framework would raise a NilObjectException before this method was invoked.
		  #if targetMacOS
		    if g <> nil then
		      if f.Exists then
		        if g.Exists then
		          soft declare function FSCompareFSRefs lib CarbonLib (ref1 as Ptr, ref2 as Ptr) as Int16
		          #if RBVersion >= 2010.05
		            dim fRef as MemoryBlock = f.MacFSRef
		            dim gRef as MemoryBlock = g.MacFSRef
		          #else
		            dim fRef as MemoryBlock = f.FSRef
		            dim gRef as MemoryBlock = g.FSRef
		          #endif
		          return FSCompareFSRefs(fRef, gRef) = noErr
		        else
		          return false
		        end if
		      else
		        if g.Exists then
		          return false
		        else
		          //compare parents + names.
		          dim f_parent as FolderItem = f.Parent
		          dim g_parent as FolderItem = g.Parent
		          if f_parent <> nil and g_parent <> nil then
		            return AreNamesEqual(f.Name, g.Name, f.IsVolumeCaseSensitive ) and f_parent.Equals(g_parent)
		          else
		            //in general, f.Parent = nil only if f is the root FolderItem, in which case f.Exists would be true.  But, thanks to BSD under the hood, one must always expect permissions issues.
		            //So in this case, we give up.
		            return false
		          end if
		        end if
		      end if
		    else
		      return false
		    end if
		    
		  #else
		    #pragma unused f
		    #pragma unused g
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extension(extends f as FolderItem) As string
		  //# Extract the extension of the folderitem name
		  // Modified by Kem Tekinay, 8/10/12, to check for spaces in the potential extension.
		  
		  // Filenames whose only "." is the first character does not have a true extension.
		  // For example, ".DS_Store".
		  // If the string following the last "." contains a space, it is not an extension.
		  // For example, "my.great file" or "10.1.12 Letter".
		  
		  //@ [Cross-platform]
		  
		  dim ext as string
		  dim fName as string = f.Name
		  
		  #if TargetMacOS and FALSE
		    
		    // This code doesn't work as well as the custom code below, but I left it here for reference.
		    // Apple's code will mindlessly return any text after the last dot, even if it has spaces.
		    // This is contrary to even what the Finder considers an extension.
		    
		    dim nsName as new NSString( fName )
		    dim nsExt as NSString = nsName.pathExtension
		    ext = nsExt
		    
		  #else // Windows/Linux
		    
		    dim i as integer = CountFields( fName, "." )
		    
		    if i < 2 then
		      // There is no dot in the name
		      
		    elseif i = 2 and fName.Left( 1 ) = "." then
		      // Filename begins with a dot so this is not a true extension
		      
		    else
		      ext = NthField( fName, ".", i )
		      if ext.InStr( " " ) <> 0 then ext = "" // Not a true extension if it contains a space
		      
		    end if
		    
		  #endif
		  
		  return ext
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FreeSpaceOnVolume(extends theVolume as FolderItem) As UInt64
		  #if targetMacOS
		    if SystemVersionAsInt < 100700 then //Before Lion
		      declare function FSGetVolumeInfo lib CarbonLib (volume as Int16, volumeIndex as Integer, actualVolume as Ptr, whichInfo as UInt32, ByRef info as FSVolumeInfo, volumeName as Ptr, rootDirectory as Ptr) as Int16
		      
		      dim theInfo as FSVolumeInfo
		      dim OSErr as Int16 = FSGetVolumeInfo(theVolume.MacVRefNum, 0, nil, FileManager.kFSVolInfoSizes, theInfo, nil, nil)
		      if OSErr <> noErr then
		        break
		        return 0
		      end if
		      
		      return theInfo.freeBytes
		      
		    else //Lion and later
		      dim url as new NSURL( theVolume )
		      dim result as Ptr = url.ResourceValuePtr( url.NSURLVolumeAvailableCapacityKey )
		      
		      if result <> nil then
		        dim num as new NSNumber(result)
		        return num.Int64Value
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAppThatWillOpenFolderItem(extends f as FolderItem) As FolderItem
		  //# Returns the application (as FolderItem) that will open the passed FolderItem based on default settings.
		  
		  #if TargetMacOS
		    dim url as CFURL
		    
		    url = NSWorkspace.URLForAppToOpenURL( new CFURL( f ))
		    
		    if url=nil then
		      return  nil
		    else
		      return  url.Item
		    end if
		    
		  #else
		    #pragma unused f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Icon(extends f as FolderItem, preferredSize as integer = 32) As Picture
		  //# Returns a Picture corresponding to the icon of the passed FolderItem or Nil on error.
		  
		  //@ The icon is the custom icon (if any), the preview icon computed by the Finder or the generic icon for such file type.
		  //@ For optimal results, you should pass a preferredSize (in pixels) rather than scaling the Picture
		  
		  #if TargetMacOS
		    dim nsi as NSImage
		    
		    nsi = NSWorkspace.IconForFile( f )
		    
		    if nsi<>nil then
		      dim  size as Cocoa.NSSize
		      size.width = preferredSize
		      size.height = preferredSize
		      nsi.Size = size
		      return  nsi.MakePicture  //Convert NSImage to Picture
		    else
		      return  nil
		    end if
		    
		  #else
		    #pragma unused f
		    #pragma unused preferredSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Icon(extends f as FolderItem, assigns customIcon as Picture)
		  //# Add or replace the custom icon for the specified FolderItem
		  
		  #if TargetMacOS
		    dim nsi as NSImage
		    
		    if NOT f.Exists then
		      raise  new MacOSError( -50, "Parameter error. FolderItem does not exist" )
		    end if
		    
		    nsi = NSImage.CreateFromPicture( customIcon )
		    
		    if nsi<>nil then
		      dim OK as Boolean
		      OK = NSWorkspace.IconForFile( f, nsi )
		      
		      if NOT OK then
		        dim e as ObjCException
		        e.Message = "Could not set custom icon"
		        raise  e
		      end if
		      
		    else
		      dim e as ObjCException
		      e.Message = "Could not create icon from the passed picture"
		      raise  e
		    end if
		    
		  #else
		    #pragma unused f
		    #pragma unused customIcon
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function inode(extends f as FolderItem) As UInt32
		  #if targetMacOS
		    if SystemVersionAsInt < 100700 then //Before Lion
		      dim ref as FSRef = FileManager.GetFSRefFromFolderItem(f)
		      
		      soft declare function FSGetCatalogInfo lib CarbonLib (ref as Ptr, whichInfo as Uint32, _
		      ByRef catalogInfo as FSCatalogInfo, outName as Ptr, fsSpec as Ptr,  parentRef as Ptr) as Int16
		      
		      dim cataloginfo as FileManager.FSCatalogInfo
		      dim err as Int16 = FSGetCatalogInfo(ref, FileManager.kFSCatInfoNodeID, cataloginfo, nil, nil, nil)
		      if err = noErr then
		        return cataloginfo.nodeid
		      else
		        raise new MacOSError(err)
		      end if
		      
		    else //Lion+
		      dim deviceURL as new CFURL(f)
		      dim stat as BSD.stat = BSD.lstat(deviceURL.Path)
		      return stat.st_ino
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IOMediaClass(extends f as FolderItem) As String
		  //# This function, using code from the Apple sample project VolumeToBSDNode, looks up the class name of an IOObject using IO Kit.  It will return
		  //# IOCDMedia for a CD, IODVDMedia for a DVD, and IOMedia for anything else.  Thus this function will tell you whether a local volume is a CD or DVD.
		  //@ It returns "' for network volumes or if an error occurs.
		  
		  
		  #if targetMacOS
		    const IOKitFramework = "IOKit.framework"
		    const kIOMasterPortDefault = nil //see IOKitLib.h
		    const IO_OBJECT_NULL = nil
		    const kIOMediaClass = "IOMedia"
		    const kIOServicePlane = "IOService"
		    const kIORegistryIterateRecursively = &h00000001
		    const kIORegistryIterateParents = &h00000002
		    const kIOCDMediaClass = "IOCDMedia"
		    const kIOMediaWholeKey = "Whole"
		    const kCFAllocatorDefault = nil
		    
		    soft declare function IOBSDNameMatching lib IOKitFramework (masterPort as Ptr, options as Integer, bsdName as CString) as Ptr
		    soft declare function IOServiceGetMatchingService lib IOKitFramework (masterPort as Ptr, matching as Ptr) as Ptr
		    // /usr/include/device/device_types.h:typedef    char            io_name_t[128];
		    
		    soft declare function IORegistryEntryCreateIterator lib IOKitFramework (entry as Ptr, plane as CString, options as Integer, ByRef iterator as Ptr) as Integer
		    soft declare function IOObjectConformsTo lib IOKitFramework (obj as Ptr, className as CString) as Boolean
		    soft declare function IORegistryEntryCreateCFProperty lib IOKitFramework (entry as Ptr, key as CFStringRef, allocator as Ptr, options as Integer) as Ptr
		    soft declare function IOObjectGetClass lib IOKitFramework (obj as Ptr, className as Ptr) as Integer
		    soft declare function IOObjectRetain lib IOKitFramework (obj as Ptr) as Integer
		    soft declare function IOObjectRelease lib IOKitFramework (obj as Ptr) as Integer
		    
		    //the documentation for this function suggests that we don't need to free dPtr (it's a CFMutableDictionaryRef) because we pass it to IOServiceGetMatchingService
		    //which consumes a reference.  Some testing with CFGetRetainCount confirms this.
		    dim dPtr as Ptr = IOBSDNameMatching(kIOMasterPortDefault, 0, f.DeviceName)
		    if dPtr = nil then
		      return ""
		    end if
		    
		    dim service as Ptr = IOServiceGetMatchingService(kIOMasterPortDefault, dPtr)
		    if service = IO_OBJECT_NULL then
		      return ""
		    end if
		    dim iterator as Ptr
		    dim iteratorErr as Integer = IORegistryEntryCreateIterator(service, kIOServicePlane, kIORegistryIterateRecursively or kIORegistryIterateParents, iterator)
		    if iteratorErr <> 0 or iterator = nil then
		      return ""
		    end if
		    
		    dim retainErr as Integer = IOObjectRetain(service)
		    dim className as new MemoryBlock(128)
		    do
		      if IOObjectConformsTo(service, kIOMediaClass) then
		        dim p as Ptr = IORegistryEntryCreateCFProperty(service, kIOMediaWholeKey, kCFAllocatorDefault, 0)
		        soft declare function CFBooleanGetValue lib CarbonLib (cf as Ptr) as Boolean
		        dim isWholeMedia as Boolean = p <> nil and CFBooleanGetValue(p)
		        if isWholeMedia then
		          dim getClassError as Integer = IOObjectGetClass(service, className)
		          #pragma unused getClassError
		          exit
		        else
		          //another iteration
		        end if
		      else
		        //another iteration
		      end if
		      
		      
		      soft declare function IOIteratorNext lib IOKitFramework (iterator as Ptr) as Ptr
		      dim releaseError as Integer = IOObjectRelease(service)
		      #pragma unused releaseError
		      service = IOIteratorNext(iterator)
		      if service = nil then
		        exit
		      end if
		    loop
		    
		    iteratorErr = IOObjectRelease(iterator)
		    dim releaseError as Integer = IOObjectRelease(service)
		    
		    return DefineEncoding(className.CString(0), Encodings.SystemDefault)
		    
		    // Keep the compiler from complaining
		    #pragma unused retainErr
		    #pragma unused releaseError
		    
		  #else
		    #pragma unused f
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsNetworkVolume(extends f as FolderItem) As Boolean
		  //# Returns true is the FolderItem corresponds to a network volume, false otherwise
		  
		  #if TargetMacOS
		    if SystemVersionAsInt < 100700 then //Before Lion
		      soft declare function PBHGetVolParmsSync lib CarbonLib (ByRef paramBlock as HIOParam) as Short
		      
		      dim paramBlock as HIOParam
		      paramBlock.ioVRefNum = f.MacVRefNum
		      //the following line is a trick to work around the inability to assign a pointer to a structure
		      //to a field of type Ptr.
		      dim infoBuffer as new MemoryBlock(GetVolParmsInfoBuffer.Size)
		      paramBlock.ioBuffer = infoBuffer
		      paramBlock.ioReqCount = infoBuffer.Size
		      
		      dim OSError as Integer = PBHGetVolParmsSync(paramBlock)
		      if OSError <> 0 then
		        return false
		      end if
		      return (infoBuffer.Long(10) <> 0)
		      
		    else //Lion+
		      dim deviceURL as new CFURL(f)
		      dim stat as BSD.stat = BSD.lstat(deviceURL.Path)
		      return (stat.st_dev = 0)
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPackage(extends f as FolderItem) As Boolean
		  //# Returns true if the passed folder is a Mac OS X package, false otherwise
		  
		  #if TargetMacOS
		    if SystemVersionAsInt < 100600 then //Before Snow Leopard
		      declare function LSCopyItemInfoForRef lib CarbonLib (fsRef as Ptr, inWhichInfo as Integer, ByRef outItemInfo as LSItemInfoRecord) as Integer
		      
		      const kLSRequestBasicFlagsOnly = &h00000004
		      const kLSItemInfoIsPackage = &h00000002
		      
		      dim theRef as FSRef = FileManager.GetFSRefFromFolderItem(f)
		      dim itemInfo as LSItemInfoRecord
		      dim OSError as Integer = LSCopyItemInfoForRef(theRef, kLSRequestBasicFlagsOnly, itemInfo)
		      if OSError <> 0 then
		        break
		      end if
		      return (itemInfo.Flags and kLSItemInfoIsPackage) = kLSItemInfoIsPackage
		      
		    else  //Snow Leopard+
		      dim url as new NSURL( f )
		      dim nsn as new NSNumber( url.ResourceValuePtr( url.NSURLIsPackageKey ))
		      
		      return nsn.BooleanValue
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPackage(extends f as FolderItem, enable as Boolean) As Boolean
		  //# Set the IsPackage bit of a folder. If set, the folder is displayed as a single file.
		  
		  //@ If the folder is a package because of its extension, it has no effect.
		  
		  #if TargetMacOS
		    if SystemVersionAsInt < 100800 then
		      declare function FSGetCatalogInfo lib CarbonLib ( ref as Ptr, whichInfo as integer, catalogInfo as Ptr, outName as Ptr, fsSpec as Ptr, parentRef as Ptr ) as Int16
		      declare function FSSetCatalogInfo lib CarbonLib ( ref as Ptr, whichInfo as integer, catalogInfo as Ptr ) as Int16
		      
		      const kFSCatInfoFinderInfo = &h00000800
		      const PackageMask = &h2000
		      
		      dim theRef as FSRef = f.FSRef
		      dim itemInfo as new MemoryBlock( 144 )
		      
		      dim OSError as Int16 = FSGetCatalogInfo(theRef, kFSCatInfoFinderInfo, itemInfo, nil, nil, nil)
		      if OSError <> 0 then
		        raise new MacOSError( OSError )
		      end if
		      
		      dim finfo as UInt16 = itemInfo.UInt16Value( 80 ) //Finder info flags
		      if enable then
		        finfo = finfo OR PackageMask
		      else
		        finfo = finfo AND (NOT PackageMask)
		      end if
		      
		      itemInfo.UInt16Value( 80 ) = finfo
		      
		      OSError = FSSetCatalogInfo( theRef, kFSCatInfoFinderInfo, iteminfo )
		      
		      if OSError <> 0 then
		        raise new MacOSError( OSError )
		      end if
		      
		      return true
		      
		    else //Mountain Lion+
		      //The function is actually available from 10.6 but NSURLIsPackageKey was read-only until 10.8
		      
		      dim url as new NSURL( f )
		      dim nsn as new NSNumber( enable )
		      return url.ResourceValue( url.NSURLIsPackageKey, nsn )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemAttribute(extends file as FolderItem, attributeConstant as String) As variant
		  //# Set some file attributes.
		  
		  
		  //@ Available from 10.5. Only quarantine attributes can be set.
		  
		  #if TargetMacOS
		    declare function LSCopyItemAttribute lib "Carbon.framework" (inItem as Ptr, inRoles as UInt32, inAttributeName as CFStringRef, byref outValue as integer) as integer
		    
		    const kLSRoleAll = &hFFFFFFFF
		    
		    dim err as integer
		    dim ref as integer
		    dim theFSRef as MemoryBlock = file.FSRef
		    
		    err = LSCopyItemAttribute( theFSRef, kLSRoleAll, attributeConstant, ref )
		    
		    if err<>0 then
		      return  nil
		    end if
		    
		    dim cft as CFType = new CFDictionary( Ptr( ref ), false )
		    
		    return   cft.VariantValue
		    
		  #else
		    #pragma unused file
		    #pragma unused attributeConstant
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ItemAttribute(extends file as FolderItem, attributeConstant as string, assigns value as variant)
		  //# Set some file attributes.
		  
		  
		  //@ Available from 10.5. Only quarantine attributes can be set.
		  
		  #if TargetMacOS
		    declare function LSSetItemAttribute lib CarbonLib (inItem as Ptr, inRoles as integer, inAttributeName as CFStringRef, inValue as Ptr) as integer
		    
		    dim err as integer
		    
		    err = LSSetItemAttribute( file.FSRef, &hFFFFFFFF, CFConstant( attributeConstant ), CFTypeFromVariant( value ).Reference )
		    
		    'if err<>0 then  //Maybe we should do something on error
		    '
		    'end if
		    
		  #else
		    #pragma unused file
		    #pragma unused attributeConstant
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Label(extends f as FolderItem) As integer
		  //# Get the label index of the passed folderItem
		  
		  #if TargetMacOS
		    soft declare function FSGetCatalogInfo lib CarbonLib ( ref as Ptr, whichInfo as integer, catalogInfo as Ptr, outName as Ptr, fsSpec as Ptr, parentRef as Ptr ) as Int16
		    
		    const kFSCatInfoFinderInfo = &h00000800
		    const LabelMask = &h0E
		    
		    dim theRef as FSRef = f.FSRef
		    dim itemInfo as new MemoryBlock( 144 )
		    dim finfo as UInt16
		    
		    dim OSError as Int16 = FSGetCatalogInfo(theRef, kFSCatInfoFinderInfo, itemInfo, nil, nil, nil)
		    if OSError <> 0 then
		      raise   new MacOSError( OSError )
		    end if
		    
		    finfo = itemInfo.UInt16Value( 80 ) //Finder info
		    finfo = (finfo AND LabelMask) \ 2
		    
		    return   finfo
		    
		  #else
		    #pragma unused f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Label(extends f as FolderItem, labelIndex as integer)
		  //# Set the label index of the passed folderItem
		  
		  #if TargetMacOS
		    soft declare function FSGetCatalogInfo lib CarbonLib ( ref as Ptr, whichInfo as integer, catalogInfo as Ptr, outName as Ptr, fsSpec as Ptr, parentRef as Ptr ) as Int16
		    soft declare function FSSetCatalogInfo lib CarbonLib ( ref as Ptr, whichInfo as integer, catalogInfo as Ptr ) as Int16
		    
		    const kFSCatInfoFinderInfo = &h00000800
		    const LabelMask = &h0E
		    
		    dim theRef as FSRef = f.FSRef
		    dim itemInfo as new MemoryBlock( 144 )
		    dim finfo as UInt16
		    
		    if labelIndex<0 OR labelIndex>7 then
		      raise new OutOfBoundsException
		    end if
		    
		    dim OSError as Int16 = FSGetCatalogInfo(theRef, kFSCatInfoFinderInfo, itemInfo, nil, nil, nil)
		    if OSError <> 0 then
		      raise   new MacOSError( OSError )
		    end if
		    
		    finfo = itemInfo.UInt16Value( 80 ) //Finder info
		    finfo = (finfo AND &hFFF0) OR (labelIndex * 2 OR (finfo AND 1))  //Set bits 1, 2, 3 and keep bit 0 and all bits 4+
		    
		    itemInfo.UInt16Value( 80 ) = finfo
		    
		    OSError = FSSetCatalogInfo( theRef, kFSCatInfoFinderInfo, iteminfo )
		    
		    if OSError <> 0 then
		      raise   new MacOSError( OSError )
		    end if
		    
		  #else
		    #pragma unused f
		    #pragma unused labelIndex
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LabelColor(extends f as FolderItem) As Color
		  //# Returns the color of the Finder label for the passed FolderItem
		  
		  #if TargetMacOS
		    dim colors() as Color = SystemFinderLabelColors
		    dim idx as integer = f.Label
		    
		    if idx=0 then
		      return  &c000000
		      
		    else
		      return   colors( idx - 1 )
		      
		    end if
		    
		  #else
		    #pragma unused f
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LabelText(extends f as FolderItem) As string
		  //# Returns the text of the Finder label for the passed FolderItem
		  
		  #if TargetMacOS
		    dim labels() as string = SystemFinderLabels
		    dim idx as integer = f.Label
		    
		    if idx=0 then
		      return  ""
		      
		    else
		      return   labels( idx - 1 )
		      
		    end if
		    
		  #else
		    #pragma unused f
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalVolumeUUID(extends f as FolderItem) As string
		  //# Return the local volume UUID (Universally Unique ID)
		  
		  //@ Note that not all volumes have a UUID, e.g. MS-DOS formatted volumes.
		  //@ Passing a network volume will return "" but without raising an exception.
		  
		  //@ [OS X 10.4 and later]
		  
		  #if TargetMacOS
		    assertOSVersion  100400  //Tiger+
		    
		    dim dict as Dictionary
		    
		    dict = f.DADiskDescription
		    
		    return   dict.Lookup( "DAVolumeUUID", "" )
		    
		  #else
		    #pragma unused f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToTrash(extends f as FolderItem)
		  //# Move the FolderItem to the trash. If such item already exists, the FolderItem is renamed. If there is no Trash on the given volume, the method fails.
		  
		  #if targetMacOS
		    if f = nil or NOT f.Exists then return
		    
		    dim source as FSRef = FileManager.GetFSRefFromFolderItem(f)
		    
		    soft declare function FSMoveObjectToTrashSync lib CarbonLib (fsRef as Ptr, target as Ptr, options as UInt32) as Integer
		    
		    dim OSError as Integer = FSMoveObjectToTrashSync(source, nil, 0)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		    
		  #else
		    #pragma unused f
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveToTrash(extends f as FolderItem) As FolderItem
		  //# Move the FolderItem to the trash. If such item already exists, the FolderItem is renamed. If there is no Trash on the given volume, the method fails.
		  
		  //@ On error, raises a MacOSError exception
		  //@ Returns a FolderItem which corresponds to the item in the Trash after possible renaming
		  
		  #if targetMacOS
		    if f = nil or NOT f.Exists then return Nil
		    
		    dim source as FSRef = FileManager.GetFSRefFromFolderItem(f)
		    dim dest as new MemoryBlock( 80 )
		    
		    soft declare function FSMoveObjectToTrashSync lib CarbonLib (fsRef as Ptr, target as Ptr, options as UInt32) as Integer
		    
		    dim OSError as Integer = FSMoveObjectToTrashSync(source, dest, 0)
		    
		    if OSError<>0 then
		      raise   new MacOSError( OSError )
		    else
		      return  FolderItem.CreateFromMacFSRef( dest )
		    end if
		    
		  #else
		    #pragma unused f
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NameNoExtension(extends f as FolderItem) As string
		  //#Extract the name without extension of the folderitem name
		  
		  //@ [Cross-platform]
		  
		  'dim i, j as integer
		  'dim s as string
		  '
		  'i = CountFields(f.name, ".")
		  '
		  'if i=2 and Left(f.name, 1)="." then
		  '//Filename begins with a dot so this is not a true extension
		  'return f.name
		  'else
		  's = ""
		  'for j=1 to i-1
		  's = s + "." + NthField(f.name, ".", j)
		  'next
		  'return Mid(s, 2)
		  'end if
		  
		  dim ext as string = f.Extension
		  dim fName as string = f.Name
		  if ext.LenB <> 0 then // There is an extension
		    dim extLen as integer = ext.Len + 1 // Count the "."
		    dim nameLen as integer = fName.Len - extLen // The length of the name without the extension
		    fName = fName.Left( nameLen )
		  end if
		  
		  return fName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuarantineData(extends file as FolderItem) As Dictionary
		  //# Retrieve the quarantine attributes of the given file
		  
		  #if TargetMacOS
		    dim cfd as CFDictionary = file.ItemAttribute( "LSItemQuarantineProperties" )
		    
		    return   cfd.VariantValue
		    
		  #else
		    #pragma unused file
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QuarantineData(extends file as FolderItem, assigns data as Dictionary)
		  //# Retrieve the quarantine attributes of the given file
		  
		  #if TargetMacOS
		    dim cfd as CFDictionary = CFDictionary.CreateFromDictionary( data )
		    
		    if cfd<>nil then
		      file.ItemAttribute( "LSItemQuarantineProperties" ) = cfd
		    else
		      raise   new MacOSError( -50, "Parameter error" )
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused data
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadAll(extends f as FolderItem, encoding as TextEncoding = nil) As String
		  //# Read the whole content of a file
		  
		  //@ [Cross-platform]
		  
		  dim bs as BinaryStream
		  bs = BinaryStream.Open( f, false )
		  dim result as string = DefineEncoding( bs.Read( bs.Length ), encoding )
		  bs.Close
		  
		  return   result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RevealInFinder(extends f as FolderItem)
		  //# Reveal the FolderItem in the Finder (or third party replacement)
		  
		  #if TargetMacOS
		    call   NSWorkspace.SelectFile( f )
		    
		  #else
		    #pragma unused f
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sibling(extends f as FolderItem, filename as String) As FolderItem
		  //# Get a FolderItem to a sibling whose name is "filename"
		  
		  //@ [Cross-platform]
		  
		  if f.Parent<>nil then
		    return   f.Parent.Child( filename )
		    
		  else
		    return   nil
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SpotlightMetadata(extends f as FolderItem) As Dictionary
		  //# Returns a Dictionary containing all the Spotlight metadata
		  
		  #if TargetMacOS
		    dim mdi as MDItem = MDItem.CreateFromFile( f )
		    return  mdi.AllAttributes
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UniformTypeIdentifier(extends f as FolderItem) As String
		  //# Get the Uniform Type Identifier of the given FolderItem
		  
		  #if TargetMacOS
		    return   UTI.CreateFromFile( f )
		    
		  #else
		    #pragma unused f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTIConformsTo(extends f as FolderItem, conformsTo as String) As Boolean
		  //# Returns true if the Uniform Type Identifier of the passed FolderItem conforms to the UTI passed as string
		  
		  #if TargetMacOS
		    return  NSWorkspace.UTIConformsTo( f.UniformTypeIdentifier, conformsTo )
		    
		  #else
		    #pragma unused f
		    #pragma unused conformsTo
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


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

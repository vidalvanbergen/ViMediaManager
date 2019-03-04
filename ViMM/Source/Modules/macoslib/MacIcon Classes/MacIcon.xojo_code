#tag Class
Protected Class MacIcon
	#tag Method, Flags = &h0
		Shared Sub Acquire(iconRef as Ptr)
		  if iconRef = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function AcquireIconRef lib CarbonLib (theIconRef as Ptr) as Int16
		    
		    dim OSError as Integer = AcquireIconRef(iconRef)
		    
		    #pragma unused OSError
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Background() As Integer
		  Return me.pBackground
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Background(Assigns value as Integer)
		  if me.pBackground <> value then
		    me.pBackground = value
		    me.icon = nil
		  else
		    //
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  me.pSize = 32
		  me.pTransform = kTransformNone
		  me.pAlignment = kAlignNone
		  me.pBackground = Integer(ThemeBrushConstants.kWhite)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theIconRef as Ptr)
		  me.Constructor()
		  me.IconRef = theIconRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsPoint(X as Integer, Y as Integer) As Boolean
		  Return me.ContainsPoint(0, 0, X, Y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsPoint(iconLeft as Integer, iconTop as Integer, X as Integer, Y as Integer) As Boolean
		  #if TargetMacOS
		    soft declare function PtInIconRef lib CarbonLib (ByRef point as MacPoint, ByRef rect as MacRect, align as Int16, theIconServicesUsageFlags as Int16, theIconRef as Ptr) as Boolean
		    
		    dim testPoint as MacPoint
		    testPoint.v = Y
		    testPoint.h = X
		    
		    dim testRect as MacRect
		    testRect.top = iconTop
		    testRect.left = iconLeft
		    testRect.bottom = iconTop + me.pSize - 1
		    testRect.right =  iconLeft + me.pSize - 1
		    
		    if me.IsValidIconRef(me.iconRef) Then
		      return PtInIconRef(testPoint, testRect, kAlignNone, kIconServicesNormalUsageFlag, me.IconRef)
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Release me.iconRef
		  me.iconRef = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, Left as Integer, Top as Integer)
		  if g is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function QDBeginCGContext lib CarbonLib (port as Integer, ByRef context as Integer) as Integer
		    soft declare sub CGContextSynchronize lib CarbonLib (context as Integer)
		    soft declare function QDEndCGContext lib CarbonLib (port as Integer, ByRef context as Integer) as Integer
		    soft declare function PlotIconRefInContext lib CarbonLib (CGContextRef as Integer, byref theRect as CGRect, _
		    align as Short, transform as Short, ByRef labelColor as RGBColor, _
		    flags as Integer, iconRef as Ptr) as Integer
		    
		    dim error as Integer
		    dim labelColor as RGBColor
		    dim context as Integer = g.Handle(Graphics.HandleTypeCGContextRef)
		    dim grafPort as Integer
		    if context = 0 then
		      grafPort = g.Handle(Graphics.handleTypeCGrafPtr)
		      error = QDBeginCGContext (grafPort, context)
		    end if
		    
		    dim rect as CGRect = CGRectMake(left, g.Height - top - self.size, self.size, self.size)
		    error = PlotIconRefInContext(context, rect, kAlignNone, me.pTransform, labelColor, kIconServicesNormalUsageFlag, me.IconRef)
		    
		    if grafPort <> 0 then
		      CGContextSynchronize context
		      error = QDEndCGContext (grafPort, context)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IconFamilyHandle() As Integer
		  #if TargetMacOS
		    declare function IconRefToIconFamily lib CarbonLib (refIn as Ptr, which as Integer, ByRef hdlOut as Integer) as Integer
		    
		    dim hdl, err as Integer
		    err = IconRefToIconFamily (me.iconRef, &hFFFFFFFF, hdl)
		    
		    return hdl
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsValidIconRef(iconRef as Ptr) As Boolean
		  #if TargetMacOS
		    soft declare function IsValidRef lib CarbonLib Alias "IsValidIconRef" (theIconRef as Ptr) as Boolean
		    
		    Return IsValidRef(iconRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewIconFromExtension(extension as String) As MacIcon
		  #if TargetMacOS
		    soft declare function GetIconRefFromTypeInfo lib CarbonLib (inCreator as OSType, inType as OSType, inExtension as CFStringRef, inMIMEType as Ptr, inUsageFlags as Integer, ByRef outIconRef as Ptr) as Short
		    //requires OS 10.3
		    
		    dim theIconRef as Ptr
		    dim OSError as Integer = GetIconRefFromTypeInfo("", "", extension, nil, MacIcon.kIconServicesNormalUsageFlag, theIconRef)
		    if OSError = 0 then
		      return new MacIcon(theIconRef)
		    else
		      return NewIconFromOSInfo(kUnknownFileType)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewIconFromFolderItem(f as FolderItem, quick as Boolean = false) As MacIcon
		  if not (f is nil) and f.Exists then
		    if quick then
		      if f.Directory then
		        return NewIconFromOSInfo(kGenericFolderIcon)
		      else
		        return NewIconFromOSInfo(kUnknownFileType)
		      end
		    else
		      dim fileRef as FSRef = FileManager.GetFSRefFromFolderItem(f)
		      return NewIconFromFSRef (fileRef)
		    end if
		  end
		  
		  // fallback, faster:
		  return NewIconFromOSInfo(kUnknownFileType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewIconFromFSRef(fileRef as FSRef) As MacIcon
		  #if targetMacOS
		    
		    dim catalogInfo as FSCatalogInfo
		    dim outFileName as HFSUniStr255
		    
		    soft declare function FSGetCatalogInfo lib CarbonLib (ref as Ptr, whichInfo as Integer, ByRef catalogInfo as FSCatalogInfo, ByRef outName as HFSUniStr255, fsSpec as Ptr, parentRef as Ptr) as Short
		    
		    dim OSError as Integer = FSGetCatalogInfo(fileRef, kIconServicesCatalogInfoMask, catalogInfo, outFileName, nil, nil)
		    if OSError = 0 then
		      
		      soft declare function GetIconRefFromFileInfo lib CarbonLib (fsRef as Ptr, inFileNameLength as Integer, inFileName as CString, inWhichInfo as Integer, ByRef inCatalogInfo as FSCatalogInfo, inUsageFlags as Integer, ByRef outIconRef as Ptr, ByRef outLabel as Int16) as Integer
		      
		      dim theIconRef as Ptr
		      dim label as Int16
		      'OSError = GetIconRefFromFileInfo(fileRef, outFileName.length, ConvertEncoding(FileManager.StringValue(outFileName), Encodings.UTF16), kIconServicesCatalogInfoMask, catalogInfo, kIconServicesNormalUsageFlag, theIconRef, label)
		      OSError = GetIconRefFromFileInfo(fileRef, outFileName.length, FileManager.StringValue( outFileName ), kIconServicesCatalogInfoMask, catalogInfo, kIconServicesNormalUsageFlag, theIconRef, label)
		      if OSError = 0 then
		        return new MacIcon(theIconRef)
		      end if
		    end if
		    
		  #else
		    
		    #pragma unused fileRef
		    
		  #endif
		  
		  // fallback:
		  return NewIconFromOSInfo(kUnknownFileType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewIconFromicnsFile(icnsFile as FolderItem) As MacIcon
		  #if targetMacOS
		    if icnsFile is nil or not icnsFile.Exists then
		      return NewIconFromOSInfo(kUnknownFileType)
		    end if
		    
		    dim fileRef as FSRef = FileManager.GetFSRefFromFolderItem(icnsFile)
		    if not FileManager.IsValid(fileRef) then
		      return NewIconFromOSInfo(kUnknownFileType)
		    end if
		    
		    soft declare function ReadIconFromFSRef lib CarbonLib (fsRef as Ptr, ByRef hndl as Ptr) as Integer
		    dim familyHandle as Ptr
		    dim OSError as Integer = ReadIconFromFSRef(fileRef, familyHandle)
		    if OSError <> 0 then
		      return NewIconFromOSInfo(kUnknownFileType)
		    end if
		    
		    //at this point we have a valid handle, so we should release it even if an error occurs; hence the C-style error-handling
		    
		    soft declare sub HLockHi lib CarbonLib (h as Ptr)
		    HLockHi familyHandle
		    
		    soft declare function GetIconRefFromIconFamilyPtr lib CarbonLib (inIconFamilyPtr as Ptr, inSize as Integer, ByRef outIconRef as Ptr) as Integer
		    
		    dim familyPtr as Ptr = familyHandle.Ptr(0)
		    if familyPtr = nil then
		      GOTO releaseHandle
		    end if
		    
		    soft declare function GetHandleSize lib CarbonLib (h as Ptr) as Integer
		    dim handleSize as Integer = GetHandleSize(familyHandle)
		    
		    dim theIconRef as Ptr
		    OSError = GetIconRefFromIconFamilyPtr(familyPtr, handleSize, theIconRef)
		    if OSError <> 0 then
		      GOTO releaseHandle
		    end if
		    Acquire theIconRef
		    
		    
		    releaseHandle:
		    soft declare sub HUnlock lib CarbonLib (h as Ptr)
		    
		    HUnlock familyHandle
		    
		    soft declare sub DisposeHandle lib CarbonLib (h as Ptr)
		    
		    DisposeHandle familyHandle
		    familyHandle = nil
		    
		    return new MacIcon(theIconRef)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewIconFromMIMEType(mimeType as String) As MacIcon
		  #if TargetMacOS
		    soft declare function GetIconRefFromTypeInfo lib CarbonLib (inCreator as OSType, inType as OSType, inExtension as Ptr, inMIMEType as CFStringRef, inUsageFlags as Integer, ByRef outIconRef as Ptr) as Short
		    //requires OS 10.3
		    
		    dim theIconRef as Ptr
		    dim OSError as Integer = GetIconRefFromTypeInfo("", "", nil, MIMEType, MacIcon.kIconServicesNormalUsageFlag, theIconRef)
		    if OSError = 0 then
		      return new MacIcon(theIconRef)
		    else
		      return NewIconFromOSInfo(kUnknownFileType)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewIconFromOSInfo(type as OSType) As MacIcon
		  return NewIconFromOSInfo(MacIcon.kSystemIconsCreator, type)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewIconFromOSInfo(creator as OSType, type as OSType) As MacIcon
		  #if TargetMacOS
		    soft declare function GetIconRef lib CarbonLib (vRefNum as Short, creator as OSType, icnType as OSType, ByRef theIconRef as Ptr) as Short
		    
		    const kOnSystemDisk = -32768
		    dim theIconRef as Ptr
		    dim OSError as Integer = GetIconRef(kOnSystemDisk, creator, type, theIconRef)
		    if OSError = 0 then
		      return new MacIcon(theIconRef)
		    else
		      return NewIconFromOSInfo(kUnknownFileType)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Picture
		  #if targetMacOS
		    declare function IsIconRefMaskEmpty lib CarbonLib (iconRef as Ptr) as Boolean
		    declare function PlotIconRefInContext lib CarbonLib (CGContextRef as ptr, byref theRect as CGRect, _
		    align as Short, transform as Short, labelColor as ptr, flags as Integer, iconRef as Ptr) as Integer
		    
		    const kPlotIconRefNoImage = 2
		    const kPlotIconRefNoMask = 4
		    
		    if me.icon <> nil then
		      return me.icon
		    end
		    
		    #if RBVersion >= 2011.04
		      dim p as new Picture( me.size, me.size )
		    #else
		      dim p as new Picture( me.size, me.size, 32 )
		    #endif
		    dim rect as CGRect = CGRectMake( 0, 0, p.width, p.height )
		    
		    dim context as new CGContextGraphicsPort( p.graphics )
		    call PlotIconRefInContext( context, rect, kAlignNone, me.pTransform, nil, kPlotIconRefNoMask, me.IconRef )
		    
		    #if RBVersion < 2011.04
		      if not IsIconRefMaskEmpty( me.iconRef ) then
		        dim maskContext as new CGContextGraphicsPort( p.mask.graphics )
		        maskContext.setFillColor( &cFFFFFF )
		        maskContext.fillRect( rect )
		        
		        call PlotIconRefInContext( maskContext, rect, kAlignNone, me.pTransform, nil, kPlotIconRefNoImage, me.IconRef )
		      end if
		    #endif
		    
		    me.icon = p
		    return me.icon
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  If me.IsValidIconRef(me.iconRef) then
		    Return me.IconRef
		  Else
		    Return nil
		  End if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Release(theIconRef as Ptr)
		  if theIconRef = nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    soft declare function ReleaseIconRef lib CarbonLib (theIconRef as Ptr) as Int16
		    
		    dim OSError as Int16 = ReleaseIconRef(theIconRef)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As Integer
		  Return me.pSize
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Size(Assigns value as Integer)
		  If me.pSize <> value then
		    me.pSize = Max(value, 1)
		    me.icon = nil
		  Else
		    //
		  End if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transform() As Integer
		  Return me.pTransform
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transform(Assigns value as Integer)
		  If me.pTransform <> value then
		    me.pTransform = value
		    me.icon = nil
		  Else
		    //
		  End if
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Property, Flags = &h21
		Private icon As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iconRef As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pAlignment As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pBackground As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pTransform As Integer
	#tag EndProperty


	#tag Constant, Name = kAFPServerIcon, Type = String, Dynamic = False, Default = \"afps", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAlertCautionBadgeIcon, Type = String, Dynamic = False, Default = \"cbdg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAlertCautionIcon, Type = String, Dynamic = False, Default = \"caut", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAlertNoteIcon, Type = String, Dynamic = False, Default = \"note", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAlertStopIcon, Type = String, Dynamic = False, Default = \"stop", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAliasBadgeIcon, Type = String, Dynamic = False, Default = \"abdg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAlignNone, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppleLogoIcon, Type = String, Dynamic = False, Default = \"capl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppleMenuIcon, Type = String, Dynamic = False, Default = \"sapl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppleScriptBadgeIcon, Type = String, Dynamic = False, Default = \"scrp", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppleTalkIcon, Type = String, Dynamic = False, Default = \"atlk", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppleTalkZoneIcon, Type = String, Dynamic = False, Default = \"atzn", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBackwardArrowIcon, Type = String, Dynamic = False, Default = \"baro", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBurningIcon, Type = String, Dynamic = False, Default = \"burn", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kConnectToIcon, Type = String, Dynamic = False, Default = \"cnct", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDeleteAliasIcon, Type = String, Dynamic = False, Default = \"dali", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDropFolderIcon, Type = String, Dynamic = False, Default = \"dbox", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEjectMediaIcon, Type = String, Dynamic = False, Default = \"ejec", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFavoriteItemsIcon, Type = String, Dynamic = False, Default = \"favr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kForwardArrowIcon, Type = String, Dynamic = False, Default = \"faro", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFTPServerIcon, Type = String, Dynamic = False, Default = \"ftps", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGenericFolderIcon, Type = String, Dynamic = False, Default = \"fldr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGenericNetworkIcon, Type = String, Dynamic = False, Default = \"gnet", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGenericWindowIcon, Type = String, Dynamic = False, Default = \"gwin", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGridIcon, Type = String, Dynamic = False, Default = \"grid", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGroupIcon, Type = String, Dynamic = False, Default = \"grup", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGuestUserIcon, Type = String, Dynamic = False, Default = \"gusr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHelpIcon, Type = String, Dynamic = False, Default = \"help", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHTTPServerIcon, Type = String, Dynamic = False, Default = \"htps", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kIconServicesCatalogInfoMask, Type = Double, Dynamic = False, Default = \"&h0008181E", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kIconServicesNormalUsageFlag, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationAppleShareIcon, Type = String, Dynamic = False, Default = \"ilaf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationAppleTalkZoneIcon, Type = String, Dynamic = False, Default = \"ilat", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationFileIcon, Type = String, Dynamic = False, Default = \"ilfi", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationFTPIcon, Type = String, Dynamic = False, Default = \"ilft", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationGenericIcon, Type = String, Dynamic = False, Default = \"ilge", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationHTTPIcon, Type = String, Dynamic = False, Default = \"ilht", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationMailIcon, Type = String, Dynamic = False, Default = \"ilma", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationNewsIcon, Type = String, Dynamic = False, Default = \"ilnw", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInternetLocationNSLNeighborhoodIcon, Type = String, Dynamic = False, Default = \"ilns", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kIPFileServerIcon, Type = String, Dynamic = False, Default = \"isrv", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kKeepArrangedIcon, Type = String, Dynamic = False, Default = \"arng", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLockedBadgeIcon, Type = String, Dynamic = False, Default = \"lbdg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLockedIcon, Type = String, Dynamic = False, Default = \"lock", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMountedBadgeIcon, Type = String, Dynamic = False, Default = \"mbdg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMountedFolderIcon, Type = String, Dynamic = False, Default = \"mntd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNoFilesIcon, Type = String, Dynamic = False, Default = \"nfil", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNoFolderIcon, Type = String, Dynamic = False, Default = \"nfld", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNoWriteIcon, Type = String, Dynamic = False, Default = \"nwrt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOnSystemDisk, Type = Integer, Dynamic = False, Default = \"-32768", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOpenFolderIcon, Type = String, Dynamic = False, Default = \"ofld", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOwnedFolderIcon, Type = String, Dynamic = False, Default = \"ownd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOwnerIcon, Type = String, Dynamic = False, Default = \"susr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPrivateFolderIcon, Type = String, Dynamic = False, Default = \"prvf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kProtectedApplicationFolderIcon, Type = String, Dynamic = False, Default = \"papp", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kProtectedSystemFolderIcon, Type = String, Dynamic = False, Default = \"psys", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kQuestionMarkIcon, Type = String, Dynamic = False, Default = \"ques", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRecentItemsIcon, Type = String, Dynamic = False, Default = \"rcnt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRightContainerArrowIcon, Type = String, Dynamic = False, Default = \"rcar", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSelectorAllAvailableData, Type = Integer, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharedBadgeIcon, Type = String, Dynamic = False, Default = \"sbdg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharedFolderIcon, Type = String, Dynamic = False, Default = \"shfl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharingPrivsNotApplicableIcon, Type = String, Dynamic = False, Default = \"shna", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharingPrivsReadOnlyIcon, Type = String, Dynamic = False, Default = \"shro", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharingPrivsReadWriteIcon, Type = String, Dynamic = False, Default = \"shrw", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharingPrivsUnknownIcon, Type = String, Dynamic = False, Default = \"shuk", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSharingPrivsWritableIcon, Type = String, Dynamic = False, Default = \"writ", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kShortcutIcon, Type = String, Dynamic = False, Default = \"shrt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSortAscendingIcon, Type = String, Dynamic = False, Default = \"asnd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSortDescendingIcon, Type = String, Dynamic = False, Default = \"dsnd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSystemIconsCreator, Type = String, Dynamic = False, Default = \"macs", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kToolbarCustomizeIcon, Type = String, Dynamic = False, Default = \"tcus", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kToolbarDeleteIcon, Type = String, Dynamic = False, Default = \"tdel", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kToolbarFavoritesIcon, Type = String, Dynamic = False, Default = \"tfav", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kToolbarHomeIcon, Type = String, Dynamic = False, Default = \"thom", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformDisabled, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformLabel1, Type = Integer, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformLabel2, Type = Integer, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformLabel3, Type = Integer, Dynamic = False, Default = \"768", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformLabel4, Type = Integer, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformLabel5, Type = Integer, Dynamic = False, Default = \"1280", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformLabel6, Type = Integer, Dynamic = False, Default = \"1536", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformLabel7, Type = Integer, Dynamic = False, Default = \"1792", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformNone, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformOffline, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformOpen, Type = Integer, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformSelected, Type = Integer, Dynamic = False, Default = \"16384", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformSelectedDisabled, Type = Integer, Dynamic = False, Default = \"16385", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformSelectedOffline, Type = Integer, Dynamic = False, Default = \"16386", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTransformSelectedOpen, Type = Integer, Dynamic = False, Default = \"16387", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUnknownFileType, Type = String, Dynamic = False, Default = \"\?\?\?\?", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUnlockedIcon, Type = String, Dynamic = False, Default = \"ulck", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUserFolderIcon, Type = String, Dynamic = False, Default = \"ufld", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUserIcon, Type = String, Dynamic = False, Default = \"user", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWorkgroupFolderIcon, Type = String, Dynamic = False, Default = \"wfld", Scope = Public
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

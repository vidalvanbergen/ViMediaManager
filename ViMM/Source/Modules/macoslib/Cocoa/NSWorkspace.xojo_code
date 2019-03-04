#tag Class
Class NSWorkspace
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function ApplicationFile(appName as String) As FolderItem
		  
		  #if targetMacOS
		    declare function fullPathForApplication lib CocoaLib selector "fullPathForApplication:" (obj_id as Ptr, appName as CFStringRef) as CFStringRef
		    
		    dim appPath as String = fullPathForApplication(SharedWorkspace, appName)
		    
		    dim appFile as FolderItem
		    if appPath <> "" then
		      appFile = getFolderItem(appPath, FolderItem.PathTypeShell)
		    end if
		    
		    return appFile
		    
		  #else
		    #pragma unused appName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ApplicationURL(bundleID as String) As NSURL
		  
		  #if targetMacOS
		    declare function URLForApplicationWithBundleIdentifier lib CocoaLib selector "URLForApplicationWithBundleIdentifier:" _
		    (obj_id as Ptr, bundleIdentifier as CFStringRef) as Ptr
		    
		    dim urlRef as Ptr = URLForApplicationWithBundleIdentifier(SharedWorkspace, bundleID)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused bundleID
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ApplicationURLForFileURL(fileURL as NSURL) As NSURL
		  
		  #if targetMacOS
		    declare function URLForApplicationToOpenURL lib CocoaLib selector "URLForApplicationToOpenURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    dim fileURLRef as Ptr
		    if fileURL <> nil then
		      fileURLRef = fileURL
		    end if
		    
		    dim urlRef as Ptr = URLForApplicationToOpenURL(SharedWorkspace, fileURLRef)
		    
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused fileURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function BundleFile(bundleID as String) As FolderItem
		  
		  #if targetMacOS
		    declare function absolutePathForAppBundleWithIdentifier lib CocoaLib selector "absolutePathForAppBundleWithIdentifier:" _
		    (obj_id as Ptr, bundleIdentifier as CFStringRef) as CFStringRef
		    
		    dim bundlePath as String = absolutePathForAppBundleWithIdentifier(SharedWorkspace, bundleID)
		    
		    dim bundleFile as FolderItem
		    if bundlePath <> "" then
		      bundleFile = getFolderItem(bundlePath, FolderItem.PathTypeShell)
		    end if
		    
		    return bundleFile
		    
		  #else
		    #pragma unused bundleID
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Use this constructor to receive notifications via its events.
		  // You need to subclass this class for this and call "super.Constructor" from its constructor.
		  me.RegisterNotifications
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DesktopImageURL(aScreen as NSScreen) As NSURL
		  
		  #if targetMacOS
		    declare function desktopImageURLForScreen lib CocoaLib selector "desktopImageURLForScreen:" (obj_id as Ptr, aScreen as Ptr) as Ptr
		    
		    dim screenRef as Ptr
		    if aScreen <> nil then
		      screenRef = aScreen
		    end if
		    
		    dim urlRef as Ptr = desktopImageURLForScreen(SharedWorkspace, screenRef)
		    
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused aScreen
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub DuplicateURLs(URLs() as NSURL)
		  
		  #if targetMacOS
		    declare sub duplicateURLs lib CocoaLib selector "duplicateURLs:completionHandler:" (obj_id as Ptr, URLs as Ptr, handler as Ptr)
		    
		    if URLs.ubound > -1 then
		      dim URLsArray as NSArray = NSArray.CreateWithObjects(URLs)
		      duplicateURLs SharedWorkspace, URLsArray, nil
		    end if
		    
		  #else
		    #pragma unused URLs
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FileInfo(file as FolderItem, byRef appName as String, byRef fileType as String) As Boolean
		  
		  #if targetMacOS
		    declare function getInfoForFile lib CocoaLib selector "getInfoForFile:application:type:" _
		    (obj_id as Ptr, fullPath as CFStringRef, byRef appName as CFStringRef, byRef type as CFStringRef) as Boolean
		    
		    if file <> nil then
		      dim appNameRef, fileTypeRef as CFStringRef
		      dim retValue as Boolean = getInfoForFile(SharedWorkspace, file.POSIXPath, appNameRef, fileTypeRef)
		      appName = appNameRef
		      fileType = fileTypeRef
		      return retValue
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused appName
		    #pragma unused fileType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FileSystemInfo(mountPoint as FolderItem, byRef isRemovable as Boolean, byRef isWritable as Boolean, byRef isUnmountable as Boolean, byRef description as String, byRef type as String) As Boolean
		  
		  #if targetMacOS
		    declare function getFileSystemInfoForPath lib CocoaLib selector "getFileSystemInfoForPath:isRemovable:isWritable:isUnmountable:description:type:" _
		    (obj_id as Ptr, _
		    fullPath as CFStringRef, _
		    byRef removableFlag as Boolean, _
		    byRef writableFlag as Boolean, _
		    byRef unmountableFlag as Boolean, _
		    byRef description as CFStringRef, _
		    byRef type as CFStringRef) as Boolean
		    
		    if mountPoint <> nil then
		      dim descriptionRef, typeRef as CFStringRef
		      dim retValue as Boolean = getFileSystemInfoForPath(SharedWorkspace, mountPoint.POSIXPath, isRemovable, isWritable, isUnmountable, descriptionRef, typeRef)
		      description = descriptionRef
		      type = typeRef
		      return retValue
		    end if
		    
		  #else
		    #pragma unused mountPoint
		    #pragma unused isRemovable
		    #pragma unused isWritable
		    #pragma unused isUnmountable
		    #pragma unused description
		    #pragma unused type
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FileTypeIcon(fileType as String) As NSImage
		  
		  #if targetMacOS
		    declare function iconForFileType lib CocoaLib selector "iconForFileType:" (obj_id as Ptr, fileType as CFStringRef) as Ptr
		    
		    dim imageRef as Ptr = iconForFileType(SharedWorkspace, fileType)
		    if imageRef <> nil then
		      return new NSImage(imageRef)
		    end if
		    
		  #else
		    #pragma unused fileType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FinderLabelColors() As NSArray
		  // Returns the corresponding array of file label colors for the file labels.
		  
		  #if TargetMacOS
		    declare function fileLabelColors lib CocoaLib selector "fileLabelColors" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr
		    p = fileLabelColors( SharedWorkspace )
		    
		    return new NSArray( p, false )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FinderLabels() As NSArray
		  // Returns the array of file labels as strings.
		  
		  #if TargetMacOS
		    declare function fileLabels lib CocoaLib selector "fileLabels" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr
		    p = fileLabels( SharedWorkspace )
		    
		    return new NSArray( p, false )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FrontmostApplication() As NSRunningApplication
		  // Returns the frontmost app, which is the app that receives key events.
		  
		  #if TargetMacOS
		    declare function frontmostApplication lib CocoaLib selector "frontmostApplication" (obj_id as Ptr) as Ptr
		    
		    dim p As Ptr
		    p = frontmostApplication(SharedWorkspace)
		    
		    If p <> Nil Then
		      return New NSRunningApplication(p)
		    End If
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handle_globalNSWorkspaceNotification(observer as NotificationObserver, notification as NSNotification)
		  //Handle notifications, extract interesting value(s) and dispatch them to their respective event
		  
		  #pragma unused observer
		  
		  #if TargetMacOS
		    RaiseEvent globalNSWorkspaceNotification( notification )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handle_NSWorkspaceNotification(observer as NotificationObserver, notification as NSNotification)
		  //Handle notifications, extract interesting value(s) and dispatch them to their respective event
		  
		  #pragma unused observer
		  
		  #if TargetMacOS
		    dim userinfo as NSDictionary
		    dim appl as Cocoa.NSRunningApplication
		    dim locName as string
		    dim url as NSURL
		    
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (id as Ptr, key as Ptr) as Ptr
		    
		    select case notification.Name
		    case "NSWorkspaceWillLaunchApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication(objectForKey(userinfo, NSWorkspaceApplicationKey))
		      end if
		      
		      RaiseEvent NSWorkspaceWillLaunchApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidLaunchApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication(objectForKey(userinfo, NSWorkspaceApplicationKey))
		      end if
		      
		      RaiseEvent NSWorkspaceDidLaunchApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidTerminateApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication(objectForKey(userinfo, NSWorkspaceApplicationKey))
		      end if
		      
		      RaiseEvent NSWorkspaceDidTerminateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceSessionDidBecomeActiveNotification"
		      RaiseEvent NSWorkspaceSessionDidBecomeActiveNotification( notification )
		      
		      
		    case "NSWorkspaceSessionDidResignActiveNotification"
		      RaiseEvent NSWorkspaceSessionDidResignActiveNotification( notification )
		      
		      
		    case "NSWorkspaceDidHideApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication(objectForKey(userinfo, NSWorkspaceApplicationKey))
		      end if
		      
		      RaiseEvent NSWorkspaceDidHideApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidUnhideApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        dim o as Ptr = objectForKey(userinfo, NSWorkspaceApplicationKey)
		        appl = new NSRunningApplication(o)
		      end if
		      
		      RaiseEvent NSWorkspaceDidUnhideApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidActivateApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication(objectForKey(userinfo, NSWorkspaceApplicationKey))
		      end if
		      
		      RaiseEvent NSWorkspaceDidActivateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidDeactivateApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication(objectForKey(userinfo, NSWorkspaceApplicationKey))
		      end if
		      
		      RaiseEvent NSWorkspaceDidDeactivateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidRenameVolumeNotification"
		      userinfo = notification.UserInfo
		      dim oldLocName as string
		      dim oldurl as NSURL
		      
		      if IsSnowLeopard then
		        locName = new NSString(objectForKey(userinfo, NSWorkspaceVolumeLocalizedNameKey))
		        url = new NSURL(objectForKey(userinfo, NSWorkspaceVolumeURLKey))
		        oldLocName = new NSString(objectForKey(userinfo, NSWorkspaceVolumeOldLocalizedNameKey))
		        oldurl = new NSURL(objectForKey(userinfo, NSWorkspaceVolumeOldURLKey))
		      end if
		      
		      RaiseEvent NSWorkspaceDidRenameVolumeNotification( notification, oldurl, oldLocName, url, locName )
		      
		      
		    case "NSWorkspaceDidMountNotification"
		      userinfo = notification.UserInfo
		      
		      if IsSnowLeopard then
		        locName = new NSString(objectForKey(userinfo, NSWorkspaceVolumeLocalizedNameKey))
		        url = new NSURL(objectForKey(userinfo, NSWorkspaceVolumeURLKey))
		      end if
		      
		      RaiseEvent NSWorkspaceDidMountNotification( notification, url, locName )
		      
		      
		    case "NSWorkspaceWillUnmountNotification"
		      userinfo = notification.UserInfo
		      
		      if IsSnowLeopard then
		        locName = new NSString(objectForKey(userinfo, NSWorkspaceVolumeLocalizedNameKey))
		        url = new NSURL(objectForKey(userinfo, NSWorkspaceVolumeURLKey))
		      end if
		      
		      RaiseEvent NSWorkspaceWillUnmountNotification(notification, url, locName)
		      
		      
		    case "NSWorkspaceDidUnmountNotification"
		      userinfo = notification.UserInfo
		      
		      if IsSnowLeopard then
		        locName = new NSString(objectForKey(userinfo, NSWorkspaceVolumeLocalizedNameKey))
		        url = new NSURL(objectForKey(userinfo, NSWorkspaceVolumeURLKey))
		      end if
		      
		      RaiseEvent NSWorkspaceDidUnmountNotification( notification, url, locName )
		      
		      
		    case "NSWorkspaceDidPerformFileOperationNotification"
		      dim opNbr as Cocoa.NSNumber
		      userinfo = notification.UserInfo
		      opNbr = new NSNumber(objectForKey(userinfo, new NSString("NSOperationNumber")))
		      
		      RaiseEvent  NSWorkspaceDidPerformFileOperationNotification( notification, opNbr.Int32Value )
		      
		      
		    case "NSWorkspaceDidChangeFileLabelsNotification"
		      RaiseEvent  NSWorkspaceDidChangeFileLabelsNotification( notification )
		      
		    case "NSWorkspaceActiveSpaceDidChangeNotification"
		      RaiseEvent  NSWorkspaceActiveSpaceDidChangeNotification( notification )
		      
		    case "NSWorkspaceDidWakeNotification"
		      RaiseEvent  NSWorkspaceDidWakeNotification( notification )
		      
		    case "NSWorkspaceWillPowerOffNotification"
		      RaiseEvent  NSWorkspaceWillPowerOffNotification( notification )
		      
		    case "NSWorkspaceWillSleepNotification"
		      RaiseEvent  NSWorkspaceWillSleepNotification( notification )
		      
		    case "NSWorkspaceScreensDidSleepNotification"
		      RaiseEvent  NSWorkspaceScreensDidSleepNotification( notification )
		      
		    case "NSWorkspaceScreensDidWakeNotification"
		      RaiseEvent  NSWorkspaceScreensDidWakeNotification( notification )
		      
		    else
		      RaiseEvent  NSWorkspaceOtherNotification( notification )
		    end select
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub HideOtherApplications()
		  //Hides all applications other than the sender.
		  
		  #if TargetCocoa
		    declare sub hideOtherApplications lib CocoaLib Selector "hideOtherApplications" (id as Ptr)
		    
		    hideOtherApplications( SharedWorkspace )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IconForFile(f as FolderItem) As NSImage
		  #if TargetMacOS
		    declare function iconForFile lib CocoaLib selector "iconForFile:" (obj_id as Ptr, fullPath as CFStringRef) as Ptr
		    
		    dim p as Ptr
		    if f <> nil then
		      p = iconForFile(SharedWorkspace, f.POSIXPath)
		    else
		      p = nil
		    end if
		    return new NSImage(p)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IconForFile(f as FolderItem, theIcon as NSImage, options as integer = 0) As Boolean
		  #if TargetMacOS
		    declare function setIconForFile lib CocoaLib selector "setIcon:forFile:options:" (obj_id as Ptr, img as Ptr, fullPath as CFStringRef, opt as integer) as boolean
		    
		    if f=nil or theIcon=nil then
		      return false
		    end if
		    
		    return   setIconForFile(SharedWorkspace, theIcon, f.POSIXPath, options)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IconForFiles(files() as FolderItem) As NSImage
		  
		  #if targetMacOS
		    declare function iconForFiles lib CocoaLib selector "iconForFiles:" (obj_id as Ptr, fullPaths as Ptr) as Ptr
		    
		    if files.ubound > -1 then
		      dim pathsArray as new NSMutableArray(files.ubound+1)
		      for each file as FolderItem in files
		        pathsArray.Append new NSString(file.POSIXPath)
		      next
		      
		      dim imageRef as Ptr = iconForFiles(SharedWorkspace, pathsArray)
		      
		      if imageRef <> nil then
		        return new NSImage(imageRef)
		      end if
		      
		    end if
		    
		  #else
		    #pragma unused files
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsFilePackage(file as FolderItem) As Boolean
		  
		  #if targetMacOS
		    declare function isFilePackageAtPath lib CocoaLib selector "isFilePackageAtPath:" (obj_id as Ptr, fullPath as CFStringRef) as Boolean
		    
		    if file <> nil then
		      return isFilePackageAtPath(SharedWorkspace, file.POSIXPath)
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsValidExtension(fileExtension as String, UTIname as String) As Boolean
		  
		  #if targetMacOS
		    declare function filenameExtension lib CocoaLib selector "filenameExtension:isValidForType:" _
		    (obj_id as Ptr, filenameExtension as CFStringRef, typeName as CFStringRef) as Boolean
		    
		    return filenameExtension(SharedWorkspace, fileExtension, UTIname)
		    
		  #else
		    #pragma unused fileExtension
		    #pragma unused UTIname
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LaunchApplication(aURL as NSURL, options as UInt32, configuration as NSDictionary, byRef error as NSError) As NSRunningApplication
		  
		  #if targetMacOS
		    declare function launchApplicationAtURL lib CocoaLib selector "launchApplicationAtURL:options:configuration:error:" _
		    (obj_id as Ptr, aURL as Ptr, options as UInt32, configuration as Ptr, byRef error as Ptr) as Ptr
		    
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim confRef as Ptr
		    if configuration <> nil then
		      confRef = configuration
		    end if
		    
		    dim errorRef as Ptr
		    
		    dim runappRef as Ptr =  launchApplicationAtURL(SharedWorkspace, urlRef, options, confRef, errorRef)
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		    if runappRef <> nil then
		      return new NSRunningApplication(runappRef)
		    end if
		    
		  #else
		    #pragma unused aURL
		    #pragma unused options
		    #pragma unused configuration
		    #pragma unused error
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LaunchApplication(appName as String) As Boolean
		  
		  #if targetMacOS
		    declare function launchApplication lib CocoaLib selector "launchApplication:" (obj_id as Ptr, appName as CFStringRef) as Boolean
		    
		    return launchApplication(SharedWorkspace, appName)
		    
		  #else
		    #pragma unused appName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LaunchApplication(appName as String, showIcon as Boolean, autolaunch as Boolean) As Boolean
		  
		  #if targetMacOS
		    declare function launchApplication lib CocoaLib selector "launchApplication:showIcon:autolaunch:" _
		    (obj_id as Ptr, appName as CFStringRef, showIcon as Boolean, autolaunch as Boolean) as Boolean
		    
		    return launchApplication(SharedWorkspace, appName, showIcon, autolaunch)
		    
		  #else
		    #pragma unused appName
		    #pragma unused showIcon
		    #pragma unused autolaunch
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NotificationCenter() As NSNotificationCenter
		  
		  #if TargetMacOS
		    declare function notificationCenter lib CocoaLib selector "notificationCenter" (obj_id as Ptr) as Ptr
		    
		    dim centerRef as Ptr = notificationCenter(SharedWorkspace)
		    if centerRef <> nil then
		      return new NSNotificationCenter(centerRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSApplicationFileType() As String
		  
		  return Cocoa.StringConstant("NSApplicationFileType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDirectoryFileType() As String
		  
		  return Cocoa.StringConstant("NSDirectoryFileType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFilesystemFileType() As String
		  
		  return Cocoa.StringConstant("NSFilesystemFileType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPlainFileType() As String
		  
		  return Cocoa.StringConstant("NSPlainFileType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSShellCommandFileType() As String
		  
		  return Cocoa.StringConstant("NSShellCommandFileType")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NSStringConstant(symbolName as String) As NSString
		  return symbolName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceApplicationKey() As NSString
		  return NSStringConstant("NSWorkspaceApplicationKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceCompressOperation() As NSString
		  return NSStringConstant("NSWorkspaceCompressOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceCopyOperation() As NSString
		  
		  return NSStringConstant("NSWorkspaceCopyOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceDecompressOperation() As String
		  
		  return NSStringConstant("NSWorkspaceDecompressOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceDecryptOperation() As NSString
		  return NSStringConstant("NSWorkspaceDecryptOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceDesktopImageAllowClippingKey() As NSString
		  return NSStringConstant("NSWorkspaceDesktopImageAllowClippingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceDesktopImageFillColorKey() As NSString
		  return NSStringConstant("NSWorkspaceDesktopImageFillColorKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceDesktopImageScalingKey() As NSString
		  return NSStringConstant("NSWorkspaceDesktopImageScalingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceDestroyOperation() As NSString
		  return NSStringConstant("NSWorkspaceDestroyOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceDuplicateOperation() As NSString
		  return NSStringConstant("NSWorkspaceDuplicateOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceEncryptOperation() As NSString
		  return NSStringConstant("NSWorkspaceEncryptOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceLaunchConfigurationAppleEvent() As NSString
		  return NSStringConstant("NSWorkspaceLaunchConfigurationAppleEvent")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceLaunchConfigurationArchitecture() As NSString
		  return NSStringConstant("NSWorkspaceLaunchConfigurationArchitecture")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceLaunchConfigurationArguments() As NSString
		  return NSStringConstant("NSWorkspaceLaunchConfigurationArguments")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceLaunchConfigurationEnvironment() As NSString
		  return NSStringConstant("NSWorkspaceLaunchConfigurationEnvironment")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceLinkOperation() As NSString
		  return NSStringConstant("NSWorkspaceLinkOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceMoveOperation() As NSString
		  return NSStringConstant("NSWorkspaceMoveOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceRecycleOperation() As NSString
		  return NSStringConstant("NSWorkspaceRecycleOperation")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceVolumeLocalizedNameKey() As NSString
		  return NSStringConstant("NSWorkspaceVolumeLocalizedNameKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceVolumeOldLocalizedNameKey() As NSString
		  return NSStringConstant("NSWorkspaceVolumeOldLocalizedNameKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceVolumeOldURLKey() As NSString
		  return NSStringConstant("NSWorkspaceVolumeOldURLKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSWorkspaceVolumeURLKey() As NSString
		  
		  return NSStringConstant("NSWorkspaceVolumeURLKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OpenFile(file as FolderItem) As Boolean
		  
		  #if TargetMacOS
		    declare function openFile_ lib CocoaLib selector "openFile:" (id as Ptr, fullPath as CFStringRef) as Boolean
		    
		    if file <> nil then
		      return openFile_(SharedWorkspace, file.POSIXPath)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OpenFile(file as FolderItem, fromImage as NSImage, point as Cocoa.NSPoint, inView as NSView) As Boolean
		  
		  #if targetMacOS
		    declare function openFile lib CocoaLib selector "openFile:fromImage:at:inView:" _
		    (obj_id as Ptr, fullPath as CFStringRef, anImage as Ptr, point as Cocoa.NSPoint, aView as Ptr) as Boolean
		    
		    if file <> nil then
		      
		      dim imageRef as Ptr
		      if fromImage <> nil then
		        imageRef = fromImage
		      end if
		      
		      dim viewRef as Ptr
		      if inView <> nil then
		        viewRef = inView
		      end if
		      
		      return openFile(SharedWorkspace, file.POSIXPath, imageRef, point, viewRef)
		      
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused fromImage
		    #pragma unused point
		    #pragma unused inView
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OpenFile(file as FolderItem, withApp as String) As Boolean
		  
		  #if targetMacOS
		    declare function openFile lib CocoaLib selector "openFile:withApplication:" (obj_id as Ptr, fullPath as CFStringRef, appName as CFStringRef) as Boolean
		    
		    if file <> nil then
		      return openFile(SharedWorkspace, file.POSIXPath, withApp)
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused withApp
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OpenFile(file as FolderItem, withApp as String, deactivate as Boolean) As Boolean
		  
		  #if targetMacOS
		    declare function openFile lib CocoaLib selector "openFile:withApplication:andDeactivate:" _
		    (obj_id as Ptr, fullPath as CFStringRef, appName as CFStringRef, flag as Boolean) as Boolean
		    
		    if file <> nil then
		      dim appName as CFStringRef
		      if withApp <> "" then
		        appName = withApp
		      else
		        // We need to pass nil as the appName parameter if we want to open the file with its default app
		      end if
		      return openFile(SharedWorkspace, file.POSIXPath, appName, deactivate)
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused withApp
		    #pragma unused deactivate
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OpenURL(aURL as NSURL) As Boolean
		  
		  #if targetMacOS
		    declare function openURL lib CocoaLib selector "openURL:" (obj_id as Ptr, aURL as Ptr) as Boolean
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    return openURL(SharedWorkspace, urlRef)
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PerformCopy(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String) As Boolean
		  if sourceDir = Nil OR destDir = Nil then
		    return false
		  end if
		  
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceCopyOperation")
		  return performOperation (sourceDir, destDir, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PerformDestroy(sourceDir as FolderItem, itemNames() as String) As Boolean
		  if sourceDir = Nil or itemNames = Nil then
		    return false
		  end if
		  
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceDestroyOperation")
		  return performOperation (sourceDir, nil, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PerformFileOperation(operation as String, sourceDir as FolderItem, destDir as FolderItem, fileNames() as String, byRef tag as Integer) As Boolean
		  
		  #if targetMacOS
		    declare function performFileOperation lib CocoaLib selector "performFileOperation:source:destination:files:tag:" _
		    (obj_id as Ptr, operation as CFStringRef, sourceDir as CFstringRef, destDir as CFStringRef, fileNames as Ptr, byRef tag as Integer) as Boolean
		    
		    if sourceDir <> nil then
		      dim arrayRef as Ptr
		      dim arrayNames as NSArray
		      if fileNames.ubound > -1 then
		        arrayNames = new NSArray(fileNames)
		        arrayRef = arrayNames
		      end if
		      
		      dim destinationPath as string
		      if destDir <> nil then
		        destinationPath = destDir.POSIXPath
		      end if
		      
		      return performFileOperation(SharedWorkspace, operation, sourceDir.POSIXPath, destinationPath, arrayRef, tag)
		      
		    end if
		    
		  #else
		    #pragma unused operation
		    #pragma unused sourceDir
		    #pragma unused destDir
		    #pragma unused fileNames
		    #pragma unused tag
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PerformMove(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String) As Boolean
		  if sourceDir = Nil or itemNames = Nil then
		    return false
		  end if
		  
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceMoveOperation")
		  return performOperation (sourceDir, destDir, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PerformMoveToTrash(sourceDir as FolderItem, itemNames() as String) As Boolean
		  if sourceDir = Nil then
		    return false
		  end if
		  
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceRecycleOperation")
		  return performOperation (sourceDir, nil, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function performOperation(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String, op as CFStringRef) As Boolean
		  #if TargetMacOS
		    if sourceDir is nil then
		      return false
		    end if
		    
		    declare function perform_ lib CocoaLib selector "performFileOperation:source:destination:files:tag:" _
		    (ws as Ptr, op as CFStringRef, src as CFStringRef, dst as CFStringRef, files as Ptr, ByRef tagOut as Integer) as Boolean
		    
		    dim id as Ptr = NSWorkspace.SharedWorkspace
		    if id <> nil then
		      dim tag as Integer
		      dim dst as CFStringRef
		      if destDir <> nil then
		        dst = destDir.POSIXPath
		      end
		      dim names as CFArray = new CFArray(itemNames)
		      dim ok as Boolean = perform_ (id, op, sourceDir.POSIXPath, dst, names, tag)
		      return ok
		    else
		      return false
		    end if
		  #endif
		  
		  'NSString *NSWorkspaceMoveOperation;
		  'NSString *NSWorkspaceCopyOperation;
		  'NSString *NSWorkspaceLinkOperation;
		  'NSString *NSWorkspaceCompressOperation;
		  'NSString *NSWorkspaceDecompressOperation;
		  'NSString *NSWorkspaceEncryptOperation;
		  'NSString *NSWorkspaceDecryptOperation;
		  'NSString *NSWorkspaceDestroyOperation;
		  'NSString *NSWorkspaceRecycleOperation;
		  'NSString *NSWorkspaceDuplicateOperation;
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RecycleURLs(URLs() as NSURL)
		  
		  #if targetMacOS
		    declare sub recycleURLs lib CocoaLib selector "recycleURLs:completionHandler:" (obj_id as Ptr, URLs as Ptr, handler as Ptr)
		    
		    if URLs.ubound > -1 then
		      dim URLsArray as NSArray = NSArray.CreateWithObjects(URLs)
		      recycleURLs SharedWorkspace, URLsArray, nil
		    end if
		    
		  #else
		    #pragma unused URLs
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterNotifications(options as integer = 0)
		  //# Register NSWorkspace notifications
		  
		  //@ Options:
		  //@    0: each event is declared separately. The NSNotification is passed to the events along with the extracted interesting data
		  //@    1: all notifications are sent to event globalNSWorkspaceNotification
		  
		  #if TargetMacOS
		    declare function notificationCenter lib CocoaLib selector "notificationCenter" (id as Ptr) as Ptr
		    
		    dim nc as Ptr = notificationCenter(SharedWorkspace.SharedWorkspace)
		    if nc = nil then
		      // something went wrong
		      break
		      return
		    end
		    
		    observer_NSWorkspaceNotification = new NotificationObserver (nc)
		    
		    select case options
		    case 0  //Register an event for each notification
		      AddHandler observer_NSWorkspaceNotification.HandleNotification, WeakAddressOf handle_NSWorkspaceNotification
		    case 1  //All notifications are sent to globalNSWorkspaceNotification
		      AddHandler observer_NSWorkspaceNotification.HandleNotification, WeakAddressOf handle_globalNSWorkspaceNotification
		    end select
		    
		    observer_NSWorkspaceNotification.Register ""  //Register all notifications
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RevealFiles(files() as FolderItem) As Boolean
		  #if TargetMacOS
		    // Available in OS X v10.6 and later.
		    //
		    // Returns false if called on systems before 10.6, otherwise true.
		    //
		    // Hint: If you need this to work on pre-10.6 systems, invoke MacOSFolderItemExtension.RevealInFinder() instead
		    
		    declare sub reveal lib CocoaLib selector "activateFileViewerSelectingURLs:" (id as Ptr, urls as Ptr)
		    declare function respondsToSelector lib "Cocoa" selector "respondsToSelector:" (obj as Ptr, sel as Ptr) as Boolean
		    
		    if files.Ubound >= 0 then
		      dim id as Ptr = SharedWorkspace
		      if respondsToSelector (id, Cocoa.NSSelectorFromString("activateFileViewerSelectingURLs:")) then
		        dim arr as new CFMutableArray
		        for each f as FolderItem in files
		          arr.Append new CFURL(f)
		        next
		        reveal (id, arr)
		        return true
		      end if
		    end if
		    
		  #else
		    #pragma unused files
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RevealFileURLs(fileURLs() as NSURL)
		  #if targetMacOS
		    declare sub activateFileViewerSelectingURLs lib CocoaLib selector "activateFileViewerSelectingURLs:" (obj_id as Ptr, fileURLs as Ptr)
		    declare function respondsToSelector lib "Cocoa" selector "respondsToSelector:" (obj as Ptr, sel as Ptr) as Boolean
		    
		    if fileURLs.ubound >= 0 then
		      dim id as Ptr = SharedWorkspace
		      if respondsToSelector (id, Cocoa.NSSelectorFromString("activateFileViewerSelectingURLs:")) then
		        dim URLsArray as NSArray = NSArray.CreateWithObjects(fileURLs)
		        activateFileViewerSelectingURLs(id, URLsArray)
		      end if
		    end if
		    
		  #else
		    #pragma unused fileURLs
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RunningApplications() As NSRunningApplication()
		  #if TargetMacOS
		    declare function runningApplications lib CocoaLib selector "runningApplications" (obj_id as Ptr) as Ptr
		    
		    dim theList() as NSRunningApplication
		    dim theArray as new CFArray(runningApplications(SharedWorkspace), not CFType.hasOwnership)
		    for i as Integer = 0 to theArray.Count - 1
		      dim p as Ptr = theArray.Value(i)
		      if p <> nil then
		        theList.Append new NSRunningApplication(p)
		      end if
		    next
		    return theList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SelectFile(f as FolderItem) As Boolean
		  #if targetCocoa
		    declare function selectFile lib CocoaLib selector "selectFile:inFileViewerRootedAtPath:" (obj_id as Ptr, fullPath as CFStringRef, rootFullPath as CFStringRef) as Boolean
		    
		    return f <> nil and selectFile(SharedWorkspace, f.POSIXPath, "")
		  #else
		    #pragma unused f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SetDesktopImageURL(aScreen as NSScreen, options as NSDictionary, byRef error as NSError, assigns aURL as NSURL) As Boolean
		  
		  #if targetMacOS
		    declare function setDesktopImageURL lib CocoaLib selector "setDesktopImageURL:forScreen:options:error:" _
		    (obj_id as Ptr, aURL as Ptr, aScreen as Ptr, options as Ptr, byRef error as Ptr) as Boolean
		    
		    dim urlRef as Ptr
		    if aURL <> nil then
		      urlRef = aURL
		    end if
		    
		    dim screenRef as Ptr
		    if aScreen <> nil then
		      screenRef = aScreen
		    end if
		    
		    dim optionsRef as Ptr
		    if options <> nil then
		      optionsRef = options
		    end if
		    
		    dim errorRef as Ptr
		    
		    dim retValue as Boolean = setDesktopImageURL(SharedWorkspace, urlRef, screenRef, optionsRef, errorRef)
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		    return retValue
		    
		  #else
		    #pragma unused aScreen
		    #pragma unused options
		    #pragma unused error
		    #pragma unused aURL
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SharedWorkspace() As NSWorkspace
		  
		  #if targetMacOS
		    declare function sharedWorkspace lib CocoaLib selector "sharedWorkspace" (class_id as Ptr) as Ptr
		    
		    static wspace as new NSWorkspace(sharedWorkspace(Cocoa.NSClassFromString("NSWorkspace")))
		    
		    return wspace
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ShowSearchResults(queryString as String) As Boolean
		  
		  #if targetMacOS
		    declare function showSearchResultsForQueryString lib CocoaLib selector "showSearchResultsForQueryString:" _
		    (obj_id as Ptr, queryString as CFStringRef) as Boolean
		    
		    return showSearchResultsForQueryString(SharedWorkspace, queryString)
		    
		  #else
		    #pragma unused queryString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UnmountAndEjectDevice(device as FolderItem) As Boolean
		  
		  #if TargetMacOS
		    declare function unmountAndEjectDeviceAtPath lib CocoaLib selector "unmountAndEjectDeviceAtPath:" (ws as Ptr, path as CFStringRef) as Boolean
		    
		    if device <> nil then
		      return  unmountAndEjectDeviceAtPath( SharedWorkspace, device.POSIXPath )
		    end if
		    
		  #else
		    #pragma Unused device
		  #endif
		  
		  //We may use unmountAndEjectDeviceAtURL:error: for Snow Leopard and beyond to get the error code
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UnmountAndEjectDevice(deviceURL as NSURL, byRef error as NSError) As Boolean
		  
		  #if TargetMacOS
		    declare function unmountAndEjectDeviceAtURL lib CocoaLib selector "unmountAndEjectDeviceAtURL:error:" _
		    (obj_id as Ptr, url as Ptr, byRef error as Ptr) as Boolean
		    
		    dim deviceURLRef as Ptr
		    if deviceURL <> nil then
		      deviceURLRef = deviceURL
		    end if
		    
		    dim errorRef as Ptr
		    
		    dim retValue as Boolean = unmountAndEjectDeviceAtURL(SharedWorkspace, deviceURLRef, errorRef)
		    
		    if errorRef <> nil then
		      error = new NSError(errorRef)
		    end if
		    
		    return retValue
		    
		  #else
		    #pragma unused deviceURL
		    #pragma unused error
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function URLForApplicationWithBundleIdentifier(bundleIdentifier as String) As NSURL
		  
		  #if TargetMacOS
		    dim url as NSURL
		    
		    declare function URLForApplicationWithBundleIdentifier lib CocoaLib selector "URLForApplicationWithBundleIdentifier:" (ws as Ptr, id as CFStringRef) as Ptr
		    
		    url = new NSURL( URLForApplicationWithBundleIdentifier( SharedWorkspace, bundleIdentifier ), false)
		    
		    return  url
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function URLForAppToOpenURL(url as CFURL) As CFURL
		  #if TargetMacOS
		    declare function getapp lib CocoaLib selector "URLForApplicationToOpenURL:" (id as Ptr, url as Ptr) as Ptr
		    
		    dim id as Ptr = NSWorkspace.SharedWorkspace
		    if id <> nil then
		      dim p as Ptr = getapp (id, url.Reference)
		      if p <> nil then
		        return new CFURL (p, false)
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UTIConformsTo(UTI as string, ConformsTo as String) As Boolean
		  
		  #if TargetMacOS
		    declare function type_conformsToType lib CocoaLib selector "type:conformsToType:" (ws as Ptr, UTI1 as CFStringRef, UTI2 as CFStringRef) as Boolean
		    
		    if UTI <> "" OR ConformsTo <> "" then
		      return   type_conformsToType( SharedWorkspace, UTI, ConformsTo )
		    end if
		    
		  #else
		    #pragma Unused UTI
		    #pragma Unused ConformsTo
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UTILocalizedDescription(UTI as String) As String
		  
		  #if targetMacOS
		    declare function localizedDescriptionForType lib CocoaLib selector "localizedDescriptionForType:" (obj_id as Ptr, typeName as CFStringRef) as CFStringRef
		    
		    return localizedDescriptionForType(SharedWorkspace, UTI)
		    
		  #else
		    #pragma unused UTI
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UTIOfFile(file as FolderItem, byRef error as NSError) As String
		  
		  #if targetMacOS
		    declare function typeOfFile lib CocoaLib selector "typeOfFile:error:" (obj_id as Ptr, absoluteFilePath as CFStringRef, byRef error as Ptr) as CFStringRef
		    
		    if file <> nil then
		      dim errorRef as Ptr
		      dim retValue as String = typeOfFile(SharedWorkspace, file.POSIXPath, errorRef)
		      if errorRef <> nil then
		        error = new NSError(errorRef)
		      end if
		      return retValue
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UTIPreferredFilenameExtension(UTI as String) As String
		  
		  #if targetMacOS
		    declare function preferredFilenameExtensionForType lib CocoaLib selector "preferredFilenameExtensionForType:" (obj_id as Ptr, typeName as CFStringRef) as CFStringRef
		    
		    return preferredFilenameExtensionForType(SharedWorkspace, UTI)
		    
		  #else
		    #pragma unused UTI
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event globalNSWorkspaceNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceActiveSpaceDidChangeNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidActivateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidChangeFileLabelsNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidDeactivateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidHideApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidLaunchApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidMountNotification(notification as NSNotification, url as NSURL, localizedName as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidPerformFileOperationNotification(notification as NSNotification, operationID as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidRenameVolumeNotification(notification as NSNotification, oldURL as NSURL, oldLocalizedName as string, newURL as NSURL, newLocalizedName as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidTerminateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidUnhideApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidUnmountNotification(notification as NSNotification, url as NSURL, localizedName as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidWakeNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceOtherNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceScreensDidSleepNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceScreensDidWakeNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceSessionDidBecomeActiveNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceSessionDidResignActiveNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillLaunchApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillPowerOffNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillSleepNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillUnmountNotification(notification as NSNotification, url as NSURL, localizedName as String)
	#tag EndHook


	#tag Note, Name = Documentation
		NSWorkspace methods are shared methods, so you do not need to create an instance to use them.
		
		If you want to get the Workspace events, however, create a single subclass of NSWorkspace and add the code you need in the different
		declared events you are interested in. Also remember to invoke super.Constructor from the constructor of the subclass.
		See NSWorkspaceEventsExample for an example.
		
		** For the description of all the events, see
		https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSWorkspace_Class/Reference/Reference.html
		
		On systems running Leopard (10.5) or below, some parameters passed to the events may be null, e.g. URLs, application.
	#tag EndNote


	#tag Property, Flags = &h21
		Private observer_NSWorkspaceNotification As NotificationObserver
	#tag EndProperty


	#tag Constant, Name = NSExclude10_4ElementsIconCreationOption, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSExcludeQuickDrawElementsIconCreationOption, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchAllowingClassicStartup, Type = Double, Dynamic = False, Default = \"&h00020000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchAndHide, Type = Double, Dynamic = False, Default = \"&h00100000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchAndHideOthers, Type = Double, Dynamic = False, Default = \"&h00200000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchAndPrint, Type = Double, Dynamic = False, Default = \"&h00000002", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchAsync, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchDefault, Type = Double, Dynamic = False, Default = \"&h00030000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchInhibitingBackgroundOnly, Type = Double, Dynamic = False, Default = \"&h00000080", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchNewInstance, Type = Double, Dynamic = False, Default = \"&h00080000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchPreferringClassic, Type = Double, Dynamic = False, Default = \"&h00040000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchWithoutActivation, Type = Double, Dynamic = False, Default = \"&h00000200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWorkspaceLaunchWithoutAddingToRecents, Type = Double, Dynamic = False, Default = \"&h00000100", Scope = Public
	#tag EndConstant


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

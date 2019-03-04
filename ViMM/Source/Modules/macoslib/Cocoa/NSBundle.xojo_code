#tag Class
Class NSBundle
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function AllBundles() As NSBundle()
		  //# Returns an array of all the application’s non-framework bundles.
		  
		  #if targetMacOS
		    declare function allBundles lib CocoaLib selector "allBundles" (class_id as Ptr) as Ptr
		    
		    dim retArray() as NSBundle
		    
		    dim arrayRef as Ptr = allBundles(ClassRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSBundle(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AllFrameworks() As NSBundle()
		  //# Returns an array of all of the application’s bundles that represent frameworks.
		  
		  #if targetMacOS
		    declare function allFrameworks lib CocoaLib selector "allFrameworks" (class_id as Ptr) as Ptr
		    
		    dim retArray() as NSBundle
		    
		    dim arrayRef as Ptr = allFrameworks(ClassRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSBundle(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AppStoreReceiptDirectory() As FolderItem
		  
		  //this method should be invoked on the application bundle; that is, the object returned by NSBundle.MainBundle.
		  
		  return getDirectory(self.AppStoreReceiptURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AppStoreReceiptURL() As NSURL
		  #if targetMacOS
		    // This method is to be invoked on the application bundle; that is, the object returned by NSBundle.MainBundle.
		    
		    if IsLion then
		      declare function appStoreReceiptURL lib CocoaLib selector "appStoreReceiptURL" (obj_id as Ptr) as Ptr
		      
		      dim urlRef as Ptr = appStoreReceiptURL(self)
		      if urlRef <> nil then
		        return new NSURL(urlRef)
		      else
		        return nil
		      end if
		      
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuiltInPlugInsDirectory() As FolderItem
		  
		  return getDirectory(self.BuiltInPlugInsURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuiltInPlugInsPath() As String
		  //# Returns the full pathname of the NSBundle's subdirectory containing plug-ins.
		  
		  #if targetMacOS
		    declare function builtInPlugInsPath lib CocoaLib selector "builtInPlugInsPath" (obj_id as Ptr) as CFStringRef
		    
		    return builtInPlugInsPath(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuiltInPlugInsURL() As NSURL
		  //# Returns the file URL of the NSBundle's subdirectory containing plug-ins.
		  
		  #if targetMacOS
		    declare function builtInPlugInsURL lib CocoaLib selector "builtInPlugInsURL" (obj_id as Ptr) as Ptr
		    
		    dim urlRef as Ptr = builtInPlugInsURL(self)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BundleDirectory() As FolderItem
		  
		  return getDirectory(self.BundleURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function bundleDirectory(urlRef as Ptr) As FolderItem
		  // May return nil if the url points to a nonexisting path.
		  // But even if it's not nil, the item at the URL may still not exist!
		  
		  #if targetMacOS
		    if urlRef <> nil then
		      dim url as new CFURL(urlRef, not CFType.hasOwnership)
		      #pragma BreakOnExceptions off
		      try
		        return new FolderItem(url.StringValue, FolderItem.PathTypeURL)
		      catch UnsupportedFormatException
		        // path invalid - probably not existing
		        return nil
		      end try
		      #pragma BreakOnExceptions default
		    else
		      return nil
		    end if
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BundleIdentifier() As String
		  //# Returns the NSBundle’s bundle identifier.
		  
		  #if targetMacOS
		    declare function bundleIdentifier lib CocoaLib selector "bundleIdentifier" (obj_id as Ptr) as CFStringRef
		    
		    return bundleIdentifier(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BundlePath() As String
		  //# Returns the full pathname of the NSBundle’s bundle directory.
		  
		  #if targetMacOS
		    declare function bundlePath lib CocoaLib selector "bundlePath" (obj_id as Ptr) as CFStringRef
		    
		    return bundlePath(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BundleURL() As NSURL
		  //# Returns the full URL of the NSBundle’s bundle directory.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function bundleURL lib CocoaLib selector "bundleURL" (obj_id as Ptr) as Ptr
		      
		      dim urlRef as Ptr = bundleURL(self)
		      if urlRef <> nil then
		        return new NSURL(urlRef)
		      else
		        return nil
		      end if
		      
		      
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSBundle")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  
		  if file <> nil then
		    self.Constructor(file.POSIXPath)
		  else
		    // a NIL folderItem... perhaps we need to raise an exception here
		    dim n as NilObjectException
		    n.Message = "NSBundle.Constructor: Folderitem is Nil"
		    raise n
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(url as NSURL)
		  //# Returns an NSBundle object initialized to correspond to the specified file URL.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function initWithURL lib CocoaLib selector "initWithURL:" (obj_id as Ptr, url as Ptr) as Ptr
		      
		      dim urlRef as Ptr
		      if url <> nil then
		        urlRef = url
		      end if
		      
		      super.Constructor(initWithURL(Allocate("NSBundle"), urlRef))
		    end if
		  #else
		    #pragma unused url
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(path as String)
		  //# Returns an NSBundle object initialized to correspond to the specified directory.
		  
		  #if targetMacOS
		    declare function initWithPath lib CocoaLib selector "initWithPath:" (obj_id as Ptr, path as CFstringRef) as Ptr
		    
		    super.Constructor(initWithPath(Allocate("NSBundle"), path))
		  #else
		    #pragma unused path
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContextHelp(key as String) As NSAttributedString
		  //# Returns the context-sensitive help for the specified key from the bundle's help file.
		  
		  #if targetMacOS
		    declare function contextHelpForKey lib CocoaLib selector "contextHelpForKey:" (obj_id as Ptr, key as CFStringRef) as Ptr
		    
		    dim attribStringRef as Ptr = contextHelpForKey(self, key)
		    if attribStringRef <> nil then
		      return new NSAttributedString(attribStringRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DevelopmentLocalization() As String
		  //# Returns the localization used to create the bundle.
		  
		  #if targetMacOS
		    declare function developmentLocalization lib CocoaLib selector "developmentLocalization" (obj_id as Ptr) as CFStringRef
		    
		    return developmentLocalization(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExecutableArchitectures() As NSNumber()
		  //# Returns an array of numbers indicating the architecture types supported by the bundle’s executable.
		  
		  #if targetMacOS
		    declare function executableArchitectures lib CocoaLib selector "executableArchitectures" (obj_id as Ptr) as Ptr
		    
		    dim retArray() as NSNumber
		    
		    dim arrayRef as Ptr = executableArchitectures(self)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSNumber(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExecutableFile() As FolderItem
		  
		  return getDirectory(self.ExecutableURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExecutablePath() As String
		  //# Returns the full pathname of the NSBundle's executable file.
		  
		  #if targetMacOS
		    declare function executablePath lib CocoaLib selector "executablePath" (obj_id as Ptr) as CFStringRef
		    
		    return executablePath(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExecutableURL() As NSURL
		  //# Returns the file URL of the NSBundle's executable file.
		  
		  #if targetMacOS
		    declare function executableURL lib CocoaLib selector "executableURL" (obj_id as Ptr) as Ptr
		    
		    dim urlRef as Ptr = executableURL(self)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileForAuxiliaryExecutable(executableName as String) As FolderItem
		  
		  return getDirectory(URLForAuxiliaryExecutable(executableName))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileForImageResource(name as String) As FolderItem
		  
		  return getDirectory(URLForImageResource(name))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileForResource(name as String, extension as String) As FolderItem
		  
		  return getDirectory(self.URLForResource(name, extension))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileForResource(name as String, extension as String, subpath as String) As FolderItem
		  
		  return getDirectory(URLForResource(name, extension, subpath))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FilesForResources(extension as String, subpath as String) As FolderItem()
		  
		  dim rb_array() as FolderItem
		  dim ns_arrayRef as NSArray = URLsForResources(extension, subpath)
		  if ns_arrayRef <> nil then
		    dim urlArray as new NSArray(ns_arrayRef)
		    dim n as integer = urlArray.Count-1
		    for i as integer = 0 to n
		      rb_array.append getDirectory(new NSURL(urlArray.Value(i)))
		    next
		  end if
		  
		  return rb_array
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FilesForResources(extension as String, subpath as String, localizationName as String) As FolderItem()
		  
		  dim rb_array() as FolderItem
		  dim ns_arrayRef as NSArray = URLsForResources(extension, subpath, localizationName)
		  if ns_arrayRef <> nil then
		    dim urlArray as new NSArray(ns_arrayRef)
		    dim n as integer = urlArray.Count-1
		    for i as integer = 0 to n
		      rb_array.append getDirectory(new NSURL(urlArray.Value(i)))
		    next
		  end if
		  
		  return rb_array
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function getDirectory(url as NSURL) As FolderItem
		  
		  #if targetMacOS
		    if url <> nil then
		      return new FolderItem(url, FolderItem.PathTypeURL)
		      
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused url
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InfoDictionary() As NSDictionary
		  //# Returns a dictionary that contains information about the NSBundle.
		  
		  #if targetMacOS
		    declare function infoDictionary lib CocoaLib selector "infoDictionary" (obj_id as Ptr) as Ptr
		    
		    dim dictRef as Ptr = infoDictionary(self)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef, not NSDictionary.hasOwnership)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load() As Boolean
		  //# Dynamically loads the bundle’s executable code into a running program, if the code has not already been loaded.
		  
		  #if targetCocoa
		    declare function load lib CocoaLib selector "load" (obj_id as Ptr) as Boolean
		    
		    return load(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadAndReturnError(byRef error as CFError) As Boolean
		  //# Loads the bundle’s executable code and returns any errors.
		  
		  #if targetMacOS
		    declare function loadAndReturnError lib CocoaLib selector "loadAndReturnError:" (obj_id as Ptr, byRef error as Ptr) as Boolean
		    
		    dim errorRef as Ptr
		    if error <> nil then
		      errorRef = error
		    end if
		    
		    return loadAndReturnError(self, errorRef)
		  #else
		    #pragma unused error
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadClass(className as String) As Ptr
		  //# Returns the Class object for the specified name.
		  
		  #if targetMacOS
		    declare function classNamed lib CocoaLib selector "classNamed" (obj_id as Ptr, className as CFStringRef) as Ptr
		    
		    return classNamed(self, className)
		  #else
		    #pragma unused className
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadFromClass(className as String) As NSBundle
		  //# Returns the NSBundle object with which the specified class is associated.
		  
		  #if targetMacOS
		    declare function bundleForClass lib CocoaLib selector "bundleForClass:" (class_id as Ptr, class_ as Ptr) as Ptr
		    
		    dim p as Ptr = bundleForClass(ClassRef, Cocoa.NSClassFromString(className))
		    if p <> nil then
		      return new NSBundle(p)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadFromFile(file as FolderItem) As NSBundle
		  //# Convienence method to load a folderitem
		  
		  if file <> nil then
		    return NSBundle.LoadFromPath(file.POSIXPath)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadFromIdentifier(bundleID as String) As NSBundle
		  //# Returns the previously created NSBundle instance that has the specified bundle identifier.
		  
		  #if targetCocoa
		    declare function bundleWithIdentifier lib CocoaLib selector "bundleWithIdentifier:" (class_id as Ptr, identifier as CFStringRef) as Ptr
		    
		    dim p as Ptr = bundleWithIdentifier(Cocoa.NSClassFromString("NSBundle"), bundleID)
		    if p <> nil then
		      return new NSBundle(p)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused bundleID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadFromPath(path as String) As NSBundle
		  //# Returns an NSBundle object that corresponds to the specified directory.
		  
		  #if targetCocoa
		    declare function bundleWithPath lib CocoaLib selector "bundleWithPath:" (class_id as Ptr, fullPath as CFStringRef) as Ptr
		    
		    dim p as Ptr = bundleWithPath(Cocoa.NSClassFromString("NSBundle"), path)
		    if p <> nil then
		      return new NSBundle(p)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused path
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadFromURL(url as NSURL) As NSBundle
		  //# Returns an NSBundle object that corresponds to the specified file URL.
		  
		  #if targetMacOS
		    declare function bundleWithURL lib CocoaLib selector "bundleWithURL:" (class_id as Ptr, url as Ptr) as Ptr
		    
		    dim urlRef as Ptr
		    if url <> nil then
		      urlRef = url
		    end if
		    
		    dim p as Ptr = bundleWithURL(ClassRef, urlRef)
		    if p <> nil then
		      return new NSBundle(p)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused url
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Localizations() As String()
		  //# Returns a list of all the localizations contained within the NSBundle’s bundle.
		  
		  #if targetMacOS
		    declare function localizations lib CocoaLib selector "localizations" (obj_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = localizations(self)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalizedInfoDictionary() As NSDictionary
		  //# Returns a dictionary with the keys from the bundle’s localized property list.
		  
		  #if targetMacOS
		    declare function localizedInfoDictionary lib CocoaLib selector "localizedInfoDictionary" (obj_id as Ptr) as Ptr
		    
		    dim dictRef as Ptr = localizedInfoDictionary(self)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef, not NSDictionary.hasOwnership)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalizedString(key as String, defaultValue as String, tableName as String = "") As String
		  //# Returns a localized version of the string designated by the specified key and residing in the specified table.
		  
		  #if targetMacOS
		    declare function localizedStringForKey lib CocoaLib selector "localizedStringForKey:value:table:" (obj_id as Ptr, key as CFStringRef, value as CFStringRef, tableName as CFStringRef) as CFStringRef
		    
		    dim tableNameRef as CFStringRef
		    if tableName <> "" then
		      tableNameRef = tableName
		    end if
		    
		    dim valueRef as CFStringRef
		    if defaultValue <> "" then
		      valueRef = defaultValue
		    end if
		    
		    return localizedStringForKey(self, key, valueRef, tableNameRef)
		    
		  #else
		    #pragma unused key
		    #pragma unused defaultValue
		    #pragma unused tableName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MainBundle() As NSBundle
		  //# Returns the NSBundle object that corresponds to the directory where the current application executable is located.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function mainBundle lib CocoaLib selector "mainBundle" (class_id as Ptr) as Ptr
		      
		      dim p as Ptr = mainBundle(Cocoa.NSClassFromString("NSBundle"))
		      if p <> nil then
		        return new NSBundle(p)
		      else
		        return nil
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSLoadedClasses() As String
		  
		  return Cocoa.StringConstant("NSLoadedClasses")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForInfoDictionaryKey(key as String) As Ptr
		  //# Returns the value associated with the specified key in the NSBundle's information property list.
		  
		  #if targetMacOS
		    declare function objectForInfoDictionaryKey lib CocoaLib selector "objectForInfoDictionaryKey:" (obj_id as Ptr, key as CFStringRef) as Ptr
		    
		    return objectForInfoDictionaryKey(self, key)
		  #else
		    #pragma unused key
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathForAuxiliaryExecutable(executableName as String) As String
		  //# Returns the full pathname of the executable with the specified name in the NSBundle’s bundle.
		  
		  //@ This method returns the appropriate path for modern application and framework bundles. _
		  //  This method may not return a path for non-standard bundle formats or for some older bundle formats.
		  
		  #if targetMacOS
		    declare function pathForAuxiliaryExecutable lib CocoaLib selector "pathForAuxiliaryExecutable:" (obj_id as Ptr, executableName as CFStringRef) as CFStringRef
		    
		    return pathForAuxiliaryExecutable(self, executableName)
		  #else
		    #pragma unused executableName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathForImageResource(name as String) As String
		  //# Returns the location of the specified image resource file.
		  
		  #if targetMacOS
		    declare function pathForImageResource lib CocoaLib selector "pathForImageResource:" (obj_id as Ptr, name as CFStringRef) as CFStringRef
		    
		    return pathForImageResource(self, name)
		  #else
		    #pragma unused name
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathForResource(name as String, extension as String) As String
		  //# Returns the full pathname for the resource identified by the specified name and file extension.
		  
		  #if targetMacOS
		    declare function pathForResource lib CocoaLib selector "pathForResource:ofType" (obj_id as Ptr, name as CFStringRef, extension as CFStringRef) as CFStringRef
		    
		    return pathForResource(self, name, extension)
		  #else
		    #pragma unused name
		    #pragma unused extension
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PathForResource(name as String, extension as String, bundlePath as String) As String
		  //# Returns the full pathname for the resource file identified by the specified name and extension and residing in a given bundle directory.
		  
		  #if targetMacOS
		    declare function pathForResource lib CocoaLib selector "pathForResource:ofType:inDirectory:" (class_id as Ptr, name as CFStringRef, extension as CFStringRef, bundlePath as CFStringRef) as CFStringRef
		    
		    
		    return pathForResource(ClassRef, name, extension, bundlePath)
		  #else
		    #pragma unused name
		    #pragma unused extension
		    #pragma unused bundlePath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathForResource(name as String, extension as String, subpath as String) As String
		  //# Returns the full pathname for the resource file identified by the specified name and extension and residing in a given bundle directory.
		  
		  #if targetMacOS
		    declare function pathForResource lib CocoaLib selector "pathForResource:ofType:inDirectory:" (class_id as Ptr, name as CFStringRef, extension as CFStringRef, subpath as CFStringRef) as CFStringRef
		    
		    return pathForResource(self, name, extension, subpath)
		  #else
		    #pragma unused name
		    #pragma unused extension
		    #pragma unused subpath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathForResource(name as String, extension as String, subpath as String, localizationName as String) As String
		  //# Returns the full pathname for the resource identified by the specified name and file extension, located in the specified bundle subdirectory, and limited to global resources and those associated with the specified localization.
		  
		  #if targetMacOS
		    declare function pathForResource lib CocoaLib selector "pathForResource:ofType:inDirectory:forLocalization:" (class_id as Ptr, name as CFStringRef, extension as CFStringRef, subpath as CFStringRef, localizationName as CFStringRef) as CFStringRef
		    
		    return pathForResource(self, name, extension, subpath, localizationName)
		  #else
		    #pragma unused name
		    #pragma unused extension
		    #pragma unused subpath
		    #pragma unused localizationName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathForSoundResource(name as String) As String
		  //# Returns the location of the specified sound resource file.
		  
		  #if targetMacOS
		    declare function pathForSoundResource lib CocoaLib selector "pathForSoundResource:" (obj_id as Ptr, name as CFStringRef) as CFStringRef
		    
		    return pathForSoundResource(self, name)
		  #else
		    #pragma unused name
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PathsForResources(extension as String, bundlePath as String) As String()
		  //# Returns an array containing the pathnames for all bundle resources having the specified extension and residing in the bundle directory at the specified path.
		  
		  #if targetMacOS
		    declare function pathsForResources lib CocoaLib selector "pathsForResourcesOfType:inDirectory:" (class_id as Ptr, extension as CFStringRef, bundlePath as CFStringRef) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = pathsForResources(ClassRef, extension, bundlePath)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		  #else
		    #pragma unused extension
		    #pragma unused bundlePath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathsForResources(extension as String, subpath as String) As String()
		  //# Returns an array containing the pathnames for all bundle resources having the specified extension and residing in the bundle directory at the specified path.
		  
		  #if targetMacOS
		    declare function pathsForResources lib CocoaLib selector "pathsForResourcesOfType:inDirectory:" (class_id as Ptr, extension as CFStringRef, subpath as CFStringRef) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = pathsForResources(self, extension, subpath)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		  #else
		    #pragma unused extension
		    #pragma unused subpath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathsForResources(extension as String, subpath as String, localizationName as String) As String()
		  //# Returns an array containing the file for all bundle resources having the specified filename extension, residing in the specified resource subdirectory, and limited to global resources and those associated with the specified localization.
		  
		  #if targetMacOS
		    declare function pathsForResources lib CocoaLib selector "pathsForResourcesOfType:inDirectory:forLocalization:" (class_id as Ptr, extension as CFStringRef, bundlePath as CFStringRef, localizationName as CFStringRef) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = pathsForResources(self, extension, subpath, localizationName)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #else
		    #pragma unused extension
		    #pragma unused subpath
		    #pragma unused localizationName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreferredLocalizations() As String()
		  //# Returns an array of strings indicating the actual localizations contained in the NSBundle's bundle.
		  
		  #if targetMacOS
		    declare function preferredLocalizations lib CocoaLib selector "preferredLocalizations" (obj_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = preferredLocalizations(self)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PreferredLocalizations(localizationsArray() as String) As String()
		  //# Returns one or more localizations from the specified list that a bundle object would use to locate resources for the current user.
		  
		  #if targetMacOS
		    declare function preferredLocalizationsFromArray lib CocoaLib selector "preferredLocalizationsFromArray:" (class_id as Ptr, localizationsArray as Ptr) as Ptr
		    
		    dim locArrayRef as Ptr
		    dim locArray as NSArray
		    
		    if ubound(localizationsArray) > -1 then
		      locArray = new NSArray(localizationsArray)
		      locArrayRef = locArray
		    end if
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = preferredLocalizationsFromArray(ClassRef, locArrayRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		  #else
		    #pragma unused localizationsArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PreferredLocalizations(localizationsArray() as String, preferencesArray() as String) As String()
		  //# Returns the localizations that a bundle object would prefer, given the specified bundle and user preference localizations.
		  
		  #if targetMacOS
		    declare function preferredLocalizationsFromArray lib CocoaLib selector "preferredLocalizationsFromArray:forPreferences:" (class_id as Ptr, localizationsArray as Ptr, preferencesArray as Ptr) as Ptr
		    
		    dim locArrayRef as Ptr
		    dim locArray as NSArray
		    
		    dim prefArrayRef as Ptr
		    dim prefArray as NSArray
		    
		    if ubound(localizationsArray) > -1 then
		      locArray = new NSArray(localizationsArray)
		      locArrayRef = locArray
		    end if
		    
		    if ubound(preferencesArray) > -1 then
		      prefArray = new NSArray(preferencesArray)
		      prefArrayRef = prefArray
		    end if
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = preferredLocalizationsFromArray(ClassRef, locArrayRef, prefArrayRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		  #else
		    #pragma unused localizationsArray
		    #pragma unused preferencesArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreflightAndReturnError(byRef error as CFError) As Boolean
		  //# Returns a Boolean value indicating whether the bundle’s executable code could be loaded successfully.
		  
		  #if targetMacOS
		    declare function preflightAndReturnError lib CocoaLib selector "preflightAndReturnError:" (obj_id as Ptr, byRef error as Ptr) as Boolean
		    
		    dim errorRef as Ptr
		    if error <> nil then
		      errorRef = error
		    end if
		    
		    return preflightAndReturnError(self, errorRef)
		  #else
		    #pragma unused error
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrincipalClass() As Ptr
		  //# Returns the NSBundle's principal class.
		  
		  #if targetCocoa
		    declare function principalClass lib CocoaLib selector "principalClass" (obj_id as Ptr) as Ptr
		    
		    return principalClass(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrivateFrameworksDirectory() As FolderItem
		  
		  return getDirectory(self.PrivateFrameworksURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrivateFrameworksPath() As String
		  //# Returns the full pathname of the NSBundle's subdirectory containing private frameworks.
		  
		  #if targetMacOS
		    declare function privateFrameworksPath lib CocoaLib selector "privateFrameworksPath" (obj_id as Ptr) as CFStringRef
		    
		    return privateFrameworksPath(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrivateFrameworksURL() As NSURL
		  //# Returns the file URL of the NSBundle's subdirectory containing private frameworks.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function privateFrameworksURL lib CocoaLib selector "privateFrameworksURL" (obj_id as Ptr) as Ptr
		      
		      dim urlRef as Ptr = privateFrameworksURL(self)
		      if urlRef <> nil then
		        return new NSURL(urlRef)
		      else
		        return nil
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourcePath() As String
		  //# Returns the full pathname of the receiving bundle’s subdirectory containing resources.
		  
		  #if targetMacOS
		    declare function resourcePath lib CocoaLib selector "resourcePath" (obj_id as Ptr) as CFStringRef
		    
		    return resourcePath(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourcesDirectory() As FolderItem
		  
		  return getDirectory(self.resourceURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceURL() As NSURL
		  //# Returns the file URL of the NSBundle's subdirectory containing resource files.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function resourceURL lib CocoaLib selector "resourceURL" (obj_id as Ptr) as Ptr
		      
		      dim urlRef as Ptr = resourceURL(self)
		      if urlRef <> nil then
		        return new NSURL(urlRef)
		      else
		        return nil
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SharedFrameworksDirectory() As FolderItem
		  
		  return getDirectory(self.SharedFrameworksURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SharedFrameworksPath() As String
		  //# Returns the full pathname of the NSBundle's subdirectory containing shared frameworks.
		  
		  #if targetMacOS
		    declare function sharedFrameworksPath lib CocoaLib selector "sharedFrameworksPath" (obj_id as Ptr) as CFStringRef
		    
		    return sharedFrameworksPath(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SharedFrameworksURL() As NSURL
		  //# Returns the file URL of the NSBundle's subdirectory containing shared support files.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function sharedFrameworksURL lib CocoaLib selector "sharedFrameworksURL" (obj_id as Ptr) as Ptr
		      
		      dim urlRef as Ptr = sharedFrameworksURL(self)
		      if urlRef <> nil then
		        return new NSURL(urlRef)
		      else
		        return nil
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SharedSupportDirectory() As FolderItem
		  
		  return getDirectory(self.SharedSupportURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SharedSupportPath() As String
		  //# Returns the full pathname of the NSBundle's subdirectory containing shared support files.
		  
		  #if targetMacOS
		    declare function sharedSupportPath lib CocoaLib selector "sharedSupportPath" (obj_id as Ptr) as CFStringRef
		    
		    return sharedSupportPath(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SharedSupportURL() As NSURL
		  //# Returns the file URL of the NSBundle's subdirectory containing shared support files.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function sharedSupportURL lib CocoaLib selector "sharedSupportURL" (obj_id as Ptr) as Ptr
		      
		      dim urlRef as Ptr = sharedSupportURL(self)
		      if urlRef <> nil then
		        return new NSURL(urlRef)
		      else
		        return nil
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Unload() As Boolean
		  //# Unloads the code associated with the NSBundle.
		  
		  //@return Boolean = YES if the bundle was successfully unloaded or was not already loaded; otherwise, NO if the bundle could not be unloaded.
		  
		  #if targetMacOS
		    declare function unload lib CocoaLib selector "unload" (obj_id as Ptr) as Boolean
		    
		    return unload(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLForAuxiliaryExecutable(executableName as String) As NSURL
		  //# Returns the file URL of the executable with the specified name in the NSBundle's bundle.
		  
		  #if targetMacOS
		    declare function URLForAuxiliaryExecutable lib CocoaLib selector "URLForAuxiliaryExecutable:" (obj_id as Ptr, executableName as CFStringRef) as Ptr
		    
		    dim urlRef as Ptr = URLForAuxiliaryExecutable(self, executableName)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused executableName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLForImageResource(name as String) As NSURL
		  //# Returns the location of the specified image resource as an NSURL
		  
		  #if targetMacOS
		    declare function URLForImageResource lib CocoaLib selector "URLForImageResource:" (obj_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim urlRef as Ptr = URLForImageResource(self, name)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused name
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLForResource(name as String, extension as String) As NSURL
		  //# Returns the file URL for the resource identified by the specified name and file extension.
		  
		  #if targetMacOS
		    declare function URLForResource lib CocoaLib selector "URLForResource:withExtension:" (obj_id as Ptr, name as CFStringRef, extension as CFStringRef) as Ptr
		    
		    dim urlRef as Ptr = URLForResource(self, name, extension)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused name
		    #pragma unused extension
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLForResource(name as String, extension as String, subpath as String) As NSURL
		  //# Returns the file URL for the resource file identified by the specified name and extension and residing in a given bundle directory.
		  
		  #if targetMacOS
		    declare function URLForResource lib CocoaLib selector "URLForResource:withExtension:subdirectory:" (obj_id as Ptr, name as CFStringRef, extension as CFStringRef, subpath as CFStringRef) as Ptr
		    
		    dim urlRef as Ptr = URLForResource(self, name, extension, subpath)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused name
		    #pragma unused extension
		    #pragma unused subpath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function URLForResource(name as String, extension as String, subpath as String, bundleURL as NSURL) As NSURL
		  //# Creates and returns a file URL for the resource with the specified name and extension in the specified bundle.
		  
		  #if targetMacOS
		    declare function URLForResource lib CocoaLib selector "URLForResource:withExtension:subdirectory:inBundleWithURL:" (class_id as Ptr, name as CFStringRef, ext as CFStringRef, subpath as CFStringRef, bundleURL as Ptr) as Ptr
		    
		    dim bundleURLRef as Ptr
		    if bundleURL <> nil then
		      bundleURLRef = bundleURL
		    end if
		    dim urlRef as Ptr = URLForResource(Cocoa.NSClassFromString("NSBundle"), name, extension, subpath, bundleURLRef)
		    
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused name
		    #pragma unused extension
		    #pragma unused subpath
		    #pragma unused bundleURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLsForResources(extension as String, subpath as String) As NSURL()
		  //# Returns the file URL for the resource identified by the specified name and file extension and located in the specified bundle subdirectory.
		  
		  #if targetMacOS
		    declare function URLsForResourcesWithExtension lib CocoaLib selector "URLsForResourcesWithExtension:subdirectory:" (obj_id as Ptr, extension as CFStringRef, subpath as CFStringRef) as Ptr
		    
		    dim retArray() as NSURL
		    
		    dim arrayRef as Ptr = URLsForResourcesWithExtension(self, extension, subpath)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSURL(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		  #else
		    #pragma unused extension
		    #pragma unused subpath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function URLsForResources(extension as String, subpath as String, bundleURL as NSURL) As NSURL()
		  //# Returns an array containing the file URLs for all bundle resources having the specified filename extension, residing in the specified resource subdirectory, within the specified bundle.
		  
		  #if targetMacOS
		    declare function URLsForResources lib CocoaLib selector "URLsForResourcesWithExtension:subdirectory:inBundleWithURL:" (class_id as Ptr, xt as CFStringRef, subpath as CFStringRef, bundleURL as Ptr) as Ptr
		    
		    dim bundleURLRef as Ptr
		    if bundleURL <> nil then
		      bundleURLRef = bundleURL
		    end if
		    
		    dim retArray() as NSURL
		    
		    dim arrayRef as Ptr = URLsForResources(ClassRef, extension, subpath, bundleURLRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSURL(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		  #else
		    #pragma unused extension
		    #pragma unused subpath
		    #pragma unused bundleURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLsForResources(extension as String, subpath as String, localizationName as String) As NSURL()
		  //# Returns an array containing the file URLs for all bundle resources having the specified filename extension, residing in the specified resource subdirectory, and limited to global resources and those associated with the specified localization.
		  
		  #if targetMacOS
		    declare function URLsForResourcesWithExtension lib CocoaLib selector "URLsForResourcesWithExtension:subdirectory:localization:" (obj_id as Ptr, extension as CFStringRef, subpath as CFStringRef, localizationName as CFStringRef) as Ptr
		    
		    dim retArray() as NSURL
		    
		    dim arrayRef as Ptr = URLsForResourcesWithExtension(self, extension, subpath, localizationName)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSURL(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused extension
		    #pragma unused subpath
		    #pragma unused localizationName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _BundleDirectory() As FolderItem
		  #if targetMacOS
		    declare function bundleURL lib CocoaLib selector "bundleURL" (obj_id as Ptr) as Ptr
		    
		    return bundleDirectory(bundleURL(self))
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _ResourcesDirectory() As FolderItem
		  #if targetMacOS
		    declare function resourceURL lib CocoaLib selector "resourceURL" (obj_id as Ptr) as Ptr
		    
		    return bundleDirectory(resourceURL(self))
		  #endif
		  
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Overview
		An NSBundle object represents a location in the file system that groups code and resources that can be used in a program.
		NSBundle objects locate program resources, dynamically load and unload executable code, and assist in localization.
		You build a bundle in Xcode using one of these project types: Application, Framework, plug-ins.
		
		Although bundle structures vary depending on the target platform and the type of bundle you are building, the NSBundle
		class hides this underlying structure in most (but not all) cases. Many of the methods you use to load resources from a
		bundle automatically locate the appropriate starting directory and look for resources in known places. For information
		about application bundle structures (for OS X and iOS), see Bundle Programming Guide. For information about the structure
		of framework bundles, see Framework Programming Guide. For information about the structure of OS X plug-ins, see Code
		Loading Programming Topics.
		
		For additional information about how to load nib files and images in a Mac app, see NSBundle Additions Reference. For
		information about how to load nib files in an iOS application, see NSBundle UIKit Additions Reference.
		
		Unlike some other Foundation classes with corresponding Core Foundation names (such as NSString and CFString), NSBundle
		objects cannot be cast (“toll-free bridged”) to CFBundle references. If you need functionality provided in CFBundle,
		you can still create a CFBundle and use the CFBundle Reference API. See “Interchangeable Data Types” for more information
		on toll-free bridging.
	#tag EndNote

	#tag Note, Name = Read Me
		NSBundle is not toll-free bridged with CFBundle.  According to the Apple docs, one can use CFBundle for some things Cocoa, but not
		for loading code.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isLoaded lib CocoaLib selector "isLoaded" (obj_id as Ptr) as Boolean
			    
			    return isLoaded(self)
			  #endif
			End Get
		#tag EndGetter
		IsLoaded As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = NSBundleExecutableArchitecture, Flags = &h0
		NSBundleExecutableArchitectureI386 = &h00000007
		  NSBundleExecutableArchitecturePPC = &h00000012
		  NSBundleExecutableArchitectureX86_64 = &h01000007
		NSBundleExecutableArchitecturePPC64 = &h01000012
	#tag EndEnum


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
			Name="IsLoaded"
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

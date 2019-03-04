#tag Module
Protected Module FolderManager
	#tag Method, Flags = &h1
		Protected Function FindFolder(vol as FolderItem, folderType as String, create as Boolean) As FolderItem
		  if vol is nil then
		    return nil
		  end if
		  return FindFolder(vol.MacVRefNum, folderType, create)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindFolder(location as Integer, folderType as OSType, create as Boolean) As FolderItem
		  #if TargetMacOS
		    soft declare function FSFindFolder lib CarbonLib (vRefNum as Int16, folderType as OSType, createFolder as Boolean, outRef as Ptr) as Int16
		    
		    dim theRef as new FSRef
		    dim OSErr as Int16 = FSFindFolder(location, folderType, create, theRef)
		    if OSErr = 0 then
		      return FileManager.GetFolderItemFromFSRef(theRef)
		    else
		      return nil
		    end if
		    
		  #else
		    
		    #pragma unused location
		    #pragma unused folderType
		    #pragma unused create
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserApplicationSupportFolder() As FolderItem
		  Return FindFolder(kUserDomain, kApplicationSupportFolderType, true)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserHelpFolder() As FolderItem
		  Return FindFolder(kUserDomain, kHelpFolderType, true)
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote

	#tag Note, Name = Documentation
		The Folder Manager allows you to find various standard Mac folders.  Here I've wrapped the
		most useful function, FindFolder, as an Rb function.
		
		MacOSFolders.FindFolder(location as Integer, folderType as String, create as Boolean) as FolderItem
		MacOSFolders.FindFolder(volume as FolderItem, folderType as String, create as Boolean) as FolderItem
		
		The location parameter can be either one of the disk/domain constants
		
		MacOSFolders.kOnSystemDisk = -32768
		MacOSFolders.kOnAppropriateDisk = -32767
		MacOSFolders.kSystemDomain = -32766
		MacOSFolders.kLocalDomain = -32765
		MacOSFolders.kNetworkDomain = -32764
		MacOSFolders.kUserDomain = -32763
		MacOSFolders.kClassicDomain = -32762 
		
		(provided as Rb constants) or a volume ID.  The second form of FindFolder allows you to pass a FolderItem
		from which it will extract the MacVolID. In OS X, you should generally use one of the domain constants, unless you
		are interested in a particular volume.
		
		The folderType parameter refers to one of the many folder types provided in the constants list.
		
		The create parameter tells the OS to attempt to create the folder if it doesn't already exist.  It will fail if the 
		expected parent folder does not exist.
		
		The MacFolderManager project compiles to a utility that is useful in figuring out which parameters to use to obtain a 
		particular FolderItem.
		
		The functions UserApplicationSupportFolder and UserHelpFolder are offered as examples of convenience functions
		that I use in my own applications.
		
		The MacFolderManager module is now written for Rb 5.
	#tag EndNote

	#tag Note, Name = error - 5000
		
		Error -5000: Can't save a file
		
		This is usually a file permission problem. There are two possible causes:
		
		1) On MacOS X/Darwin, if a file is owned by the account XYZ, and root doesn't have group or world write access to it, root gets errors accessing the file. (This is different from Linux, where root access ignores all file permissions.) If that's the case, you can "chgrp wheel map; chmod g+w map" where map is the actual filename.
		
		2) Also, the file may be locked. To see the file's locked status, use "ls -lo". You can unlock files with chflags (man chflags).
		
		(From http://www.intermapper.com/immanual/appxe/errorcodes.html)
	#tag EndNote

	#tag Note, Name = Gestalt info
		
		  gestaltFindFolderAttr = 'fold',
		  gestaltFindFolderPresent = 0,
		  gestaltFolderDescSupport = 1,
		  gestaltFolderMgrFollowsAliasesWhenResolving = 2,
		  gestaltFolderMgrSupportsExtendedCalls = 3,
		  gestaltFolderMgrSupportsDomains = 4,
		  gestaltFolderMgrSupportsFSCalls = 5
		};
		
		Constant Descriptions 
		gestaltFindFolderAttr
		The selector you pass to the Gestalt function to determine the FindFolder function attributes.
		
		gestaltFindFolderPresent
		
		gestaltFolderDescSupport
		If this bit is set, the extended Folder Manager functionality supporting folder descriptors and routings is available. This bit is set for versions of the Mac OS starting with Mac OS 8.
		
		gestaltFolderMgrFollowsAliasesWhenResolving
		
		gestaltFolderMgrSupportsExtendedCalls
		
		gestaltFolderMgrSupportsDomains
		
		gestaltFolderMgrSupportsFSCalls
		
		
		
		Discussion 
		
		Before calling any Folder Manager functions, your application should pass the selector gestaltFindFolderAttr to the Gestalt function to determine which Folder Manager functions are available.
	#tag EndNote

	#tag Note, Name = Version Info
		MacFolderManager v. 1.2 11/23/2004
		
		Version 1.2
		
		Updated declarations to support Mach-O builds
		
		Added the following constants, introduced in MacOS 10.3:
		
		kDictionariesFolderType             /* Dictionaries folder */
		kLogsFolderType                     /* Logs folder */
		kDeveloperApplicationsFolderType    /* Contains Developer Applications*/
		kPreferencePanesFolderType          /* PreferencePanes folder, in .../Library/ *
		 
		Renamed the module to MacOSFolders.
		Changed the scope of public functions and constants to protected to reduce namespace pollution.  This means that you'll
		to change your code.
		
		The application (compiled from the project) now also displays shell paths for folders.
		
		Added a contextual menu to the application that allows you to copy constants or paths from the listbox.
		
		Version 1.1 Changes
		
		Added the kKeychainFolderType; somehow I omitted it.  It wasn't worth incrementing the version number for
		this change (1/13/2004).
		
		An encoding problem in FolderItemFromFSSpec was fixed; the function should now return a non-nil FolderItem
		when the file name contains non-ASCII characters (thanks to Leonardo Borsten for catching this).
		
		A few other programming errors that might lead to a NilObjectException have been fixed.
		
		MacFolderManager now uses the Rb5 text encoding functions.
		
		Charles Yeomans
		http://www.quantum-meruit.com/RB/Downloads/FolderManager.sit
		yeomans@desuetude.com
	#tag EndNote


	#tag Constant, Name = kALMLocationsFolderType, Type = String, Dynamic = False, Default = \"fall", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kALMModulesFolderType, Type = String, Dynamic = False, Default = \"walk", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kALMPreferencesFolderType, Type = String, Dynamic = False, Default = \"trip", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppearanceFolderType, Type = String, Dynamic = False, Default = \"appr", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppleExtrasFolderType, Type = String, Dynamic = False, Default = \"aex\xC6\x92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppleMenuFolderType, Type = String, Dynamic = False, Default = \"amnu", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppleShareAuthenticationFolderType, Type = String, Dynamic = False, Default = \"auth", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppleshareAutomountServerAliasesFolderType, Type = String, Dynamic = False, Default = \"srv\xC6\x92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppleShareSupportFolderType, Type = String, Dynamic = False, Default = \"shar", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kApplicationsFolderType, Type = String, Dynamic = False, Default = \"apps", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kApplicationSupportFolderType, Type = String, Dynamic = False, Default = \"asup", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAssistantsFolderType, Type = String, Dynamic = False, Default = \"ast\xC6\x92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAudioAlertSoundsFolderType, Type = String, Dynamic = False, Default = \"alrt", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAudioComponentsFolderType, Type = String, Dynamic = False, Default = \"acmp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAudioPlugInsFolderType, Type = String, Dynamic = False, Default = \"aplg", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAudioSoundBanksFolderType, Type = String, Dynamic = False, Default = \"bank", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAudioSoundsFolderType, Type = String, Dynamic = False, Default = \"asnd", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAudioSupportFolderType, Type = String, Dynamic = False, Default = \"adio", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kBootTimeStartupItemsFolderType, Type = String, Dynamic = False, Default = \"empz", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCachedDataFolderType, Type = String, Dynamic = False, Default = \"cach", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCarbonLibraryFolderType, Type = String, Dynamic = False, Default = \"carb", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kChewableItemsFolderType, Type = String, Dynamic = False, Default = \"flnt", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kClassicDesktopFolderType, Type = String, Dynamic = False, Default = \"sdsk", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kClassicDomain, Type = Integer, Dynamic = False, Default = \"-32762", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kColorSyncCMMFolderType, Type = String, Dynamic = False, Default = \"ccmm", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kColorSyncFolderType, Type = String, Dynamic = False, Default = \"sync", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kColorSyncProfilesFolderType, Type = String, Dynamic = False, Default = \"prof", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kComponentsFolderType, Type = String, Dynamic = False, Default = \"cmpd", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kContextualMenuItemsFolderType, Type = String, Dynamic = False, Default = \"cmnu", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kControlPanelDisabledFolderType, Type = String, Dynamic = False, Default = \"ctrD", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kControlPanelFolderType, Type = String, Dynamic = False, Default = \"ctrl", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kControlStripModulesFolderType, Type = String, Dynamic = False, Default = \"sdev", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCoreServicesFolderType, Type = String, Dynamic = False, Default = \"csrv", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCurrentUserFolderType, Type = String, Dynamic = False, Default = \"cusr", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCurrentUserRemoteFolderLocation, Type = String, Dynamic = False, Default = \"rusf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCurrentUserRemoteFolderType, Type = String, Dynamic = False, Default = \"rusr", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDesktopFolderType, Type = String, Dynamic = False, Default = \"desk", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDesktopPicturesFolderType, Type = String, Dynamic = False, Default = \"dtp\xC6\x92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDeveloperApplicationsFolderType, Type = String, Dynamic = False, Default = \"dapp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDeveloperDocsFolderType, Type = String, Dynamic = False, Default = \"ddoc", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDeveloperFolderType, Type = String, Dynamic = False, Default = \"devf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDeveloperHelpFolderType, Type = String, Dynamic = False, Default = \"devh", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDictionariesFolderType, Type = String, Dynamic = False, Default = \"dict", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDirectoryServicesFolderType, Type = String, Dynamic = False, Default = \"dsrv", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDirectoryServicesPlugInsFolderType, Type = String, Dynamic = False, Default = \"dplg", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDisplayExtensionsFolderType, Type = String, Dynamic = False, Default = \"dspl", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDocumentationFolderType, Type = String, Dynamic = False, Default = \"info", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDocumentsFolderType, Type = String, Dynamic = False, Default = \"docs", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDomainLibraryFolderType, Type = String, Dynamic = False, Default = \"dlib", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDomainTopLevelFolderType, Type = String, Dynamic = False, Default = \"dtop", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kEditorsFolderType, Type = String, Dynamic = False, Default = \"oded", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kExtensionDisabledFolderType, Type = String, Dynamic = False, Default = \"extD", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kExtensionFolderType, Type = String, Dynamic = False, Default = \"extn", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFavoritesFolderType, Type = String, Dynamic = False, Default = \"favs", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFileSystemSupportFolderType, Type = String, Dynamic = False, Default = \"fsys", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFindByContentFolderType, Type = String, Dynamic = False, Default = \"fbcf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFindByContentIndexesFolderType, Type = String, Dynamic = False, Default = \"fbcx", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFindByContentPluginsFolderType, Type = String, Dynamic = False, Default = \"fbcp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFindSupportFolderType, Type = String, Dynamic = False, Default = \"fnds", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFolderActionsFolderType, Type = String, Dynamic = False, Default = \"fasf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFontsFolderType, Type = String, Dynamic = False, Default = \"font", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFrameworksFolderType, Type = String, Dynamic = False, Default = \"fram", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kGenEditorsFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92edi", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kHelpFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92hlp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kIndexFilesFolderType, Type = String, Dynamic = False, Default = \"indx", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kInstallerLogsFolderType, Type = String, Dynamic = False, Default = \"ilgf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kInstallerReceiptsFolderType, Type = String, Dynamic = False, Default = \"rcpt", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kInternetFolderType, Type = String, Dynamic = False, Default = \"int\xC6\x92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kInternetPlugInFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92net", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kInternetSearchSitesFolderType, Type = String, Dynamic = False, Default = \"issf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kInternetSitesFolderType, Type = String, Dynamic = False, Default = \"site", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kISSDownloadsFolderType, Type = String, Dynamic = False, Default = \"issd", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kKernelExtensionsFolderType, Type = String, Dynamic = False, Default = \"kext", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kKeyboardLayoutsFolderType, Type = String, Dynamic = False, Default = \"klay", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kKeychainFolderType, Type = String, Dynamic = False, Default = \"kchn", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLastDomainConstant, Type = Integer, Dynamic = False, Default = \"-32763", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLauncherItemsFolderType, Type = String, Dynamic = False, Default = \"laun", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLocalDomain, Type = Integer, Dynamic = False, Default = \"-32765", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLocalesFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92loc", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLogsFolderType, Type = String, Dynamic = False, Default = \"logs", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMacOSReadMesFolderType, Type = String, Dynamic = False, Default = \"mor\xC6\x92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kManagedItemsFolderType, Type = String, Dynamic = False, Default = \"mang", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMIDIDriversFolderType, Type = String, Dynamic = False, Default = \"midi", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kModemScriptsFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92mod", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMovieDocumentsFolderType, Type = String, Dynamic = False, Default = \"mdoc", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMultiprocessingFolderType, Type = String, Dynamic = False, Default = \"mpxf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMusicDocumentsFolderType, Type = String, Dynamic = False, Default = \"doc", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNetworkDomain, Type = Integer, Dynamic = False, Default = \"-32764", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kOnAppropriateDisk, Type = Integer, Dynamic = False, Default = \"-32767", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kOnSystemDisk, Type = Integer, Dynamic = False, Default = \"-32768", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kOpenDocEditorsFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92odf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kOpenDocFolderType, Type = String, Dynamic = False, Default = \"odod", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kOpenDocLibrariesFolderType, Type = String, Dynamic = False, Default = \"odlb", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kOpenDocShellPlugInsFolderType, Type = String, Dynamic = False, Default = \"odsp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPictureDocumentsFolderType, Type = String, Dynamic = False, Default = \"pdoc", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPreferencePanesFolderType, Type = String, Dynamic = False, Default = \"ppan", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPreferencesFolderType, Type = String, Dynamic = False, Default = \"pref", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPrinterDescriptionFolderType, Type = String, Dynamic = False, Default = \"ppdf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPrinterDriverFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92prd", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPrintersFolderType, Type = String, Dynamic = False, Default = \"impr", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPrintingPlugInsFolderType, Type = String, Dynamic = False, Default = \"pplg", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPrintMonitorDocsFolderType, Type = String, Dynamic = False, Default = \"prnt", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPrivateFrameworksFolderType, Type = String, Dynamic = False, Default = \"pfrm", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPublicFolderType, Type = String, Dynamic = False, Default = \"pubb", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kQuickTimeComponentsFolderType, Type = String, Dynamic = False, Default = \"wcmp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kQuickTimeExtensionsFolderType, Type = String, Dynamic = False, Default = \"qtex", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRecentApplicationsFolderType, Type = String, Dynamic = False, Default = \"rapp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRecentDocumentsFolderType, Type = String, Dynamic = False, Default = \"rdoc", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRecentServersFolderType, Type = String, Dynamic = False, Default = \"rsvr", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kScriptingAdditionsFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92scr", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kScriptsFolderType, Type = String, Dynamic = False, Default = \"scr\xC6\x92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSharedLibrariesFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92lib", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSharedUserDataFolderType, Type = String, Dynamic = False, Default = \"sdat", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kShutdownFolderType, Type = String, Dynamic = False, Default = \"shdf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kShutdownItemsDisabledFolderType, Type = String, Dynamic = False, Default = \"shdD", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSoundSetsFolderType, Type = String, Dynamic = False, Default = \"snds", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSpeakableItemsFolderType, Type = String, Dynamic = False, Default = \"spki", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSpeechFolderType, Type = String, Dynamic = False, Default = \"spch", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kStartupFolderType, Type = String, Dynamic = False, Default = \"strt", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kStartupItemsDisabledFolderType, Type = String, Dynamic = False, Default = \"strD", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kStationeryFolderType, Type = String, Dynamic = False, Default = \"odst", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSystemControlPanelFolderType, Type = String, Dynamic = False, Default = \"sctl", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSystemDesktopFolderType, Type = String, Dynamic = False, Default = \"sdsk", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSystemDomain, Type = Integer, Dynamic = False, Default = \"-32766", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSystemExtensionDisabledFolderType, Type = String, Dynamic = False, Default = \"macD", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSystemFolderType, Type = String, Dynamic = False, Default = \"macs", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSystemPreferencesFolderType, Type = String, Dynamic = False, Default = \"sprf", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSystemSoundsFolderType, Type = String, Dynamic = False, Default = \"ssnd", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSystemTrashFolderType, Type = String, Dynamic = False, Default = \"strs", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTemporaryFolderType, Type = String, Dynamic = False, Default = \"temp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTextEncodingsFolderType, Type = String, Dynamic = False, Default = \"\xC6\x92tex", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kThemesFolderType, Type = String, Dynamic = False, Default = \"thme", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTrashFolderType, Type = String, Dynamic = False, Default = \"trsh", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUserDomain, Type = Integer, Dynamic = False, Default = \"-32763", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUsersFolderType, Type = String, Dynamic = False, Default = \"usrs", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUserSpecificTmpFolderType, Type = String, Dynamic = False, Default = \"utmp", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUtilitiesFolderType, Type = String, Dynamic = False, Default = \"uti\xC6\x92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kVoicesFolderType, Type = String, Dynamic = False, Default = \"fvoc", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kVolumeRootFolderType, Type = String, Dynamic = False, Default = \"root", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kVolumeSettingsFolderType, Type = String, Dynamic = False, Default = \"vsfd", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWhereToEmptyTrashFolderType, Type = String, Dynamic = False, Default = \"empt", Scope = Protected
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
End Module
#tag EndModule

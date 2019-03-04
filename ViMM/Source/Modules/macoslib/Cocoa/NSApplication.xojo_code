#tag Class
Class NSApplication
Inherits NSResponder
	#tag Method, Flags = &h0
		Sub AbortModal()
		  
		  #if TargetMacOS then
		    declare sub abortModal lib CocoaLib selector "abortModal" (obj_id as Ptr)
		    
		    abortModal self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Activate(ignoreOtherApps as Boolean)
		  //# Makes the application the active application.
		  
		  #if TargetMacOS
		    declare sub activateIgnoringOtherApps lib CocoaLib selector "activateIgnoringOtherApps:" (obj_id as Ptr, flag as Boolean)
		    
		    activateIgnoringOtherApps self, ignoreOtherApps
		  #else
		    #pragma unused ignoreOtherApps
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActivateContextHelpMode()
		  //# Places the NSApplication in context-sensitive help mode.
		  
		  #if TargetMacOS
		    declare sub activateContextHelpMode lib CocoaLib selector "activateContextHelpMode:" (obj_id as Ptr, sender as Ptr)
		    
		    activateContextHelpMode self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddWindowsItem(aWindow as NSWindow, title as String, isFilename as Boolean)
		  
		  dim windowRef as Ptr
		  if aWindow <> nil then
		    windowRef = aWindow
		  end if
		  
		  self.AddWindowsItem windowRef, title, isFilename
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddWindowsItem(aWindowRef as Ptr, title as String, isFilename as Boolean)
		  //# Adds an item to the Window menu for a given window.
		  
		  #if TargetMacOS
		    declare sub addWindowsItem lib CocoaLib selector "addWindowsItem:title:filename:" (obj_id as Ptr, aWindow as Ptr, title as CFStringRef, isFilename as Boolean)
		    
		    addWindowsItem self, aWindowRef, title, isFilename
		  #else
		    #pragma unused aWindowRef
		    #pragma unused title
		    #pragma unused isFilename
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function App() As NSApplication
		  #if TargetMacOS
		    
		    declare function sharedApplication_ lib CocoaLib selector "sharedApplication" (class_id as Ptr) as Ptr
		    
		    static c as new NSApplication(sharedApplication_(Cocoa.NSClassFromString(NSClassName)))
		    return c
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ArrangeInFront()
		  //# Arranges windows listed in the Window menu in front of all other windows.
		  
		  #if TargetMacOS
		    declare sub arrangeInFront lib CocoaLib selector "arrangeInFront:" (obj_id as Ptr, sender as Ptr)
		    
		    arrangeInFront self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginSheet(sheet as NSWindow, docWindow as NSWindow, modalDelegate as Ptr = Nil, didEndSelector as Ptr = Nil, contextInfo as Ptr = Nil)
		  
		  #if TargetMacOS then
		    declare sub beginSheetModalForWindowModalDelegateDidEndSelectorContextInfo lib CocoaLib selector "beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:" _
		    (obj_id as Ptr, sheet as Ptr, docWindow as Ptr, modalDelegate as Ptr, didEndSelector as Ptr, contextInfo as Ptr)
		    
		    dim modalDelegateRef as Ptr
		    if modalDelegate <> Nil then
		      modalDelegateRef = modalDelegate
		    end if
		    
		    dim didEndSelectorRef as Ptr
		    if didEndSelector <> Nil then
		      didEndSelectorRef = didEndSelector
		    end if
		    
		    dim contextInfoRef as Ptr
		    if contextInfo <> Nil then
		      contextInfoRef = contextInfo
		    end if
		    
		    beginSheetModalForWindowModalDelegateDidEndSelectorContextInfo self, sheet, docWindow, modalDelegateRef, didEndSelectorRef, contextInfoRef
		  #else
		    #pragma Unused sheet
		    #pragma Unused docWindow
		    #pragma Unused modalDelegate
		    #pragma Unused didEndSelector
		    #pragma Unused contextInfo
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelUserAttentionRequest(request as Integer)
		  //# Cancels a previous user attention request.
		  
		  #if TargetMacOS
		    declare sub cancelUserAttentionRequest lib CocoaLib selector "cancelUserAttentionRequest:" (obj_id as Ptr, request as Integer)
		    
		    cancelUserAttentionRequest(self, request)
		  #else
		    #pragma unused request
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChangeWindowsItem(aWindow as NSWindow, title as String, isFilename as Boolean)
		  //# Changes the item for a given window in the Window menu to a given string.
		  
		  #if TargetMacOS
		    declare sub changeWindowsItem lib CocoaLib selector "changeWindowsItem:title:filename:" (obj_id as Ptr, aWindow as Ptr, title as CFStringRef, isFilename as Boolean)
		    
		    dim windowRef as Ptr
		    if aWindow <> nil then
		      windowRef = aWindow
		    end if
		    
		    changeWindowsItem self, windowRef, title, isFilename
		  #else
		    #pragma unused aWindow
		    #pragma unused title
		    #pragma unused isFilename
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString(NSClassName)
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CompleteStateRestoration()
		  
		  #if TargetMacOS then
		    if IsLion then
		      declare sub completeStateRestoration lib CocoaLib selector "completeStateRestoration" (obj_id as Ptr)
		      
		      completeStateRestoration self
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Context() As NSGraphicsContext
		  
		  #if TargetMacOS
		    declare function context lib CocoaLib selector "context" (obj_id as Ptr) as Ptr
		    
		    dim contextRef as Ptr = context(self)
		    if contextRef <> nil then
		      return new NSGraphicsContext(contextRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentEvent() As NSEvent
		  
		  #if TargetMacOS then
		    declare function getCurrentEvent lib CocoaLib selector "currentEvent" (obj_id as Ptr) as Ptr
		    
		    return New NSEvent( getCurrentEvent( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentSystemPresentationOptions() As UInt32
		  //# Returns the set of application presentation options that are currently in effect for the system.
		  
		  #if TargetMacOS
		    if IsSnowLeopard then
		      declare function currentSystemPresentationOptions lib CocoaLib selector "currentSystemPresentationOptions" (obj_id as Ptr) as UInt32
		      
		      return currentSystemPresentationOptions(self)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Deactivate()
		  //# Deactivates the application.
		  
		  #if TargetMacOS
		    declare sub deactivate lib CocoaLib selector "deactivate" (obj_id as Ptr)
		    
		    deactivate self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisableRelaunchOnLogin()
		  //# Disables relaunching the application on login.
		  
		  #if TargetMacOS
		    if IsLion then
		      declare sub disableRelaunchOnLogin lib CocoaLib selector "disableRelaunchOnLogin" (obj_id as Ptr)
		      
		      disableRelaunchOnLogin self
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DiscardEventsBeforeEvents(mask as Integer, lastEvent as NSEvent)
		  
		  #if TargetMacOS then
		    declare sub discardEventsMatchingMaskBeforeEvent lib CocoaLib selector "discardEventsMatchingMask:beforeEvent:" (obj_id as Ptr, mask as Integer, lastEvent as Ptr)
		    
		    discardEventsMatchingMaskBeforeEvent self, mask, lastEvent
		  #else
		    #pragma Unused mask
		    #pragma Unused lastEvent
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DockTile() As NSDockTile
		  //# Returns the application’s Dock tile.
		  
		  #if TargetMacOS
		    if IsLeopard then
		      declare function dockTile lib CocoaLib selector "dockTile" (obj_id as Ptr) as Ptr
		      
		      dim dockTileRef as Ptr = dockTile(self)
		      if dockTileRef <> nil then
		        return new NSDockTile(dockTileRef)
		      end if
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableRelaunchOnLogin()
		  //# Enables relaunching the application on login.
		  
		  #if TargetMacOS
		    if IsLion then
		      declare sub enableRelaunchOnLogin lib CocoaLib selector "enableRelaunchOnLogin" (obj_id as Ptr)
		      
		      enableRelaunchOnLogin self
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndSheet(sheet as NSWindow)
		  
		  #if TargetMacOS then
		    declare sub endSheet lib CocoaLib selector "endSheet:" (obj_id as Ptr, sheet as Ptr)
		    
		    endSheet self, sheet
		  #else
		    #pragma Unused sheet
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndSheet(sheet as NSWindow, returnCode as Integer)
		  
		  #if TargetMacOS then
		    declare sub endSheetReturnCode lib CocoaLib selector "endSheet:returnCode:" (obj_id as Ptr, sheet as Ptr, returnCode as Integer)
		    
		    endSheetReturnCode self, sheet, returnCode
		  #else
		    #pragma Unused sheet
		    #pragma Unused returnCode
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtendStateRestoration()
		  
		  #if TargetMacOS then
		    if IsLion then
		      declare sub extendStateRestoration lib CocoaLib selector "extendStateRestoration" (obj_id as Ptr)
		      
		      extendStateRestoration self
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Hide()
		  //# Hides all the application's windows, and the next application in line is activated.
		  
		  #if TargetMacOS
		    declare sub hide lib CocoaLib selector "hide:" (obj_id as Ptr, sender as Ptr)
		    
		    hide self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HideOtherApplications()
		  //# Hides all applications other than the sender.
		  
		  #if TargetMacOS
		    declare sub hideOtherApplications lib CocoaLib selector "hideOtherApplications:" (obj_id as Ptr, sender as Ptr)
		    
		    hideOtherApplications self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsActive() As Boolean
		  //# Returns a Boolean value indicating whether this is the active application.
		  
		  #if TargetMacOS
		    declare function isActive lib CocoaLib selector "isActive" (obj_id as Ptr) as Boolean
		    
		    return isActive(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFullKeyboardAccessEnabled() As Boolean
		  //# Returns that status of Full Keyboard Access set in the Keyboard preference pane.
		  
		  #if TargetMacOS
		    declare function isFullKeyboardAccessEnabled lib CocoaLib selector "isFullKeyboardAccessEnabled" (obj_id as Ptr) as Boolean
		    
		    return isFullKeyboardAccessEnabled(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsHidden() As Boolean
		  //# Returns a Boolean value indicating whether the application is hidden.
		  
		  #if TargetMacOS
		    declare function isHidden lib CocoaLib selector "isHidden" (obj_id as Ptr) as Boolean
		    
		    return isHidden(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsRunning() As Boolean
		  //# Indicates whether the application is running.
		  
		  #if TargetMacOS
		    declare function isRunning lib CocoaLib selector "isRunning" (obj_id as Ptr) as Boolean
		    
		    return isRunning(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeyWindow() As NSWindow
		  //# Returns the window that currently receives keyboard events.
		  
		  #if TargetMacOS
		    declare function m_keyWindow lib CocoaLib selector "keyWindow" ( id as Ptr ) as Ptr
		    
		    return   new NSWindow( m_keyWindow( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MainWindow() As NSWindow
		  //# Returns the main window.
		  
		  //@ This method might return nil if the application’s nib file hasn’t finished loading, _
		  //  if the NSApplication is not active, or if the application is hidden.
		  
		  #if TargetMacOS
		    declare function m_mainWindow lib CocoaLib selector "mainWindow" ( id as Ptr ) as Ptr
		    
		    return   new NSWindow( m_mainWindow( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MiniaturizeAll()
		  //# Miniaturizes all the application's windows.
		  
		  #if TargetMacOS
		    declare sub miniaturizeAll lib CocoaLib selector "miniaturizeAll:" (obj_id as Ptr, sender as Ptr)
		    
		    miniaturizeAll self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ModalWindow() As NSWindow
		  
		  #if TargetMacOS then
		    declare function getModalWindow lib CocoaLib selector "modalWindow" (obj_id as Ptr) as Ptr
		    
		    return New NSWindow( getModalWindow( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextEvent(mask as Integer, expiration as NSDate, mode as NSString, dequeue as Boolean) As NSEvent
		  
		  #if TargetMacOS then
		    declare function getNextEvent lib CocoaLib selector "nextEventMatchingMask:untilDate:inMode:dequeue:" (obj_id as Ptr, mask as Integer, expiration as Ptr, mode as CFStringRef, dequeue as Boolean) as Ptr
		    
		    return New NSEvent( getNextEvent( self, mask, expiration, mode, dequeue ) )
		  #else
		    #pragma Unused mask
		    #pragma Unused expiration
		    #pragma Unused mode
		    #pragma Unused dequeue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSEventTrackingRunLoopMode() As String
		  
		  return Cocoa.StringConstant("NSEventTrackingRunLoopMode")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSModalPanelRunLoopMode() As String
		  
		  return Cocoa.StringConstant("NSModalPanelRunLoopMode")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderedDocuments() As NSArray
		  
		  #if TargetMacOS then
		    declare function getOrderedDocuments lib CocoaLib selector "orderedDocuments" (obj_id as Ptr) as Ptr
		    
		    return New NSArray( getOrderedDocuments( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OrderedWindows() As NSArray
		  
		  #if TargetMacOS then
		    declare function getOrderedWindows lib CocoaLib selector "orderedWindows" (obj_id as Ptr) as Ptr
		    
		    return New NSArray( getOrderedWindows( self ) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontCharacterPalette()
		  //# Opens the character palette.
		  
		  #if TargetMacOS
		    declare sub orderFrontCharacterPalette lib CocoaLib selector "orderFrontCharacterPalette:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFrontCharacterPalette self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontColorPanel()
		  //# Brings up the color panel, an instance of NSColorPanel.
		  
		  #if TargetMacOS
		    declare sub orderFrontColorPanel lib CocoaLib selector "orderFrontColorPanel:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFrontColorPanel self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontStandardAboutPanel()
		  //# Displays a standard About window.
		  
		  #if TargetMacOS
		    declare sub orderFrontStandardAboutPanel lib CocoaLib selector "orderFrontStandardAboutPanel:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFrontStandardAboutPanel self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontStandardAboutPanel(optionsDictionary as NSDictionary)
		  //# Displays a standard About window with information from a given options dictionary.
		  
		  //@ The following strings are keys that can occur in optionsDictionary:
		  
		  //@"Credits": An NSAttributedString displayed in the info area of the panel. If not specified, this method then looks for a file named “Credits.html”, “Credits.rtf”, and “Credits.rtfd”, in that order, in the bundle returned by the NSBundle class method mainBundle. The first file found is used. If none is found, the info area is left blank.
		  //@"ApplicationName": An NSString object displayed as the application’s name. If not specified, this method then uses the value of CFBundleName (localizable). If neither is found, this method uses [[NSProcessInfo processInfo] processName].
		  //@"ApplicationIcon": An NSImage object displayed as the application’s icon. If not specified, this method then looks for an image named “NSApplicationIcon”, using [NSImage imageNamed:@"NSApplicationIcon"]. If neither is available, this method uses the generic application icon.
		  //@"Version": An NSString object with the build version number of the application (“58.4”), displayed as “(v58.4)”. If not specified, obtain from the CFBundleVersion key in infoDictionary; if not specified, leave blank (the “(v)” is not displayed).
		  //@"Copyright": An NSString object with a line of copyright information. If not specified, this method then looks for the value of NSHumanReadableCopyright in the localized version infoDictionary. If neither is available, this method leaves the space blank.
		  //@"ApplicationVersion": An NSString object with the application version (“Mac OS X”, “3”, “WebObjects 4.5”, “AppleWorks 6”,...). If not specified, obtain from the CFBundleShortVersionString key in infoDictionary. If neither is available, the build version, if available, is printed alone, as “Version x.x”.
		  
		  #if TargetMacOS
		    declare sub orderFrontStandardAboutPanelWithOptions lib CocoaLib selector "orderFrontStandardAboutPanelWithOptions:" (obj_id as Ptr, optionsDictionary as Ptr)
		    
		    dim optionsDictionaryRef as Ptr
		    if optionsDictionary <> nil then
		      optionsDictionaryRef = optionsDictionary
		    end if
		    
		    orderFrontStandardAboutPanelWithOptions self, optionsDictionaryRef
		  #else
		    #pragma unused optionsDictionary
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostEvent(anEvent as NSEvent, atStart as Boolean)
		  
		  #if TargetMacOS then
		    declare sub postEvent lib CocoaLib selector "postEvent:atStart:" (obj_id as Ptr, anEvent as Ptr, atStart as Boolean)
		    
		    postEvent self, anEvent, atStart
		  #else
		    #pragma Unused anEvent
		    #pragma Unused atStart
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreventWindowOrdering()
		  //# Suppresses the usual window ordering in handling the most recent mouse-down event.
		  
		  #if TargetMacOS
		    declare sub preventWindowOrdering lib CocoaLib selector "preventWindowOrdering" (obj_id as Ptr)
		    
		    preventWindowOrdering self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterForRemoteNotification(types as NSRemoteNotificationType)
		  //# Register to receive notifications of the specified types from a provider via Apple Push Notification service.
		  
		  #if TargetMacOS
		    if IsLion then
		      declare sub registerForRemoteNotificationTypes lib CocoaLib selector "registerForRemoteNotificationTypes:" (obj_id as Ptr, types as NSRemoteNotificationType)
		      
		      if ( types = NSRemoteNotificationType.NSRemoteNotificationTypeSound or types = NSRemoteNotificationType.NSRemoteNotificationTypeAlert ) and NOT IsMountainLion then
		        return
		      else
		        registerForRemoteNotificationTypes self, types
		      end if
		      
		    end if
		  #else
		    #pragma unused types
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterServices()
		  // Unfinished (by TT) - needs values passed
		  // Also, it hasn't been tested yet if this actually does the right thing.
		  
		  'declare sub registerServices_ lib CocoaLib selector "registerServicesMenuSendTypes:returnTypes:" (ref as Ptr, send as Ptr, receive as Ptr)
		  '
		  'dim type as CFType
		  '
		  'const typeName = "NSURLPboardType"
		  'dim p as Ptr = CFBundle.CocoaFramework.DataPointerNotRetained(typeName)
		  'if p <> nil then
		  'type = new CFString (p.Ptr(0), false)
		  'end if
		  '
		  'dim a as new CFArray(Array(type))
		  'registerServices_ me.Reference, a.Reference, a.Reference
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveWindowsItem(aWindow as NSWindow)
		  //# Removes the Window menu item for a given window.
		  
		  #if TargetMacOS
		    declare sub removeWindowsItem lib CocoaLib selector "removeWindowsItem:" (obj_id as Ptr, aWindow as Ptr)
		    
		    dim windowRef as Ptr
		    if aWindow <> nil then
		      windowRef = aWindow
		    end if
		    
		    removeWindowsItem self, WindowRef
		  #else
		    #pragma unused aWindow
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplyToApplicationShouldTerminate(ShouldTerminate as Boolean)
		  
		  #if TargetMacOS then
		    declare sub replyToApplicationShouldTerminate lib CocoaLib selector "replyToApplicationShouldTerminate:" (obj_id as Ptr, ShouldTerminate as Boolean)
		    
		    replyToApplicationShouldTerminate self, ShouldTerminate
		  #else
		    #pragma Unused shouldTerminate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RequestUserAttention(requestType as NSRequestUserAttentionType) As Integer
		  //# Starts a user attention request.
		  
		  //@ Activating the application cancels the user attention request. _
		  //  A spoken notification will occur if spoken notifications are enabled. _
		  //  Sending requestUserAttention: to an application that is already active has no effect.
		  
		  //@ If the inactive application presents a modal panel, this method will be invoked with _
		  //  NSCriticalRequest automatically. The modal panel is not brought to the front for an inactive application.
		  
		  
		  #if TargetMacOS
		    declare function requestUserAttention lib CocoaLib selector "requestUserAttention:" (obj_id as Ptr, requestType as NSRequestUserAttentionType) as Integer
		    
		    return requestUserAttention(self, requestType)
		  #else
		    #pragma unused requestType
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunModalForWindow(aWindow as NSWindow) As Integer
		  
		  #if TargetMacOS then
		    declare function runModalForWindow lib CocoaLib selector "runModalForWindow:" (obj_id as Ptr, aWindow as Ptr) as Integer
		    
		    return runModalForWindow( self, aWindow )
		  #else
		    #pragma Unused aWindow
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunPageLayout()
		  //# Displays the application's page layout panel, an instance of NSPageLayout.
		  
		  //@ If the NSPageLayout instance does not exist, this method creates one. _
		  //  This method is typically invoked when the user chooses Page Setup from the application’s File menu.
		  
		  #if TargetMacOS
		    declare sub runPageLayout lib CocoaLib selector "runPageLayout:" (obj_id as Ptr, sender as Ptr)
		    
		    runPageLayout self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendEvent(anEvent as NSEvent)
		  
		  #if TargetMacOS then
		    declare sub sendEvent lib CocoaLib selector "sendEvent:" (obj_id as Ptr, anEvent as Ptr)
		    
		    sendEvent self, anEvent
		  #else
		    #pragma Unused anEvent
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetWindowsNeedUpdate(flag as Boolean)
		  //# Sets whether the NSApplication’s windows need updating when the application has finished processing the current event.
		  
		  //@ This method is especially useful for making sure menus are updated to reflect changes not initiated by user actions, _
		  //  such as messages received from remote objects.
		  
		  #if TargetMacOS
		    declare sub setWindowsNeedUpdate lib CocoaLib selector "setWindowsNeedUpdate" (obj_id as Ptr, flag as Boolean)
		    
		    setWindowsNeedUpdate self, flag
		  #else
		    #pragma unused flag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowHelp()
		  //# If your project is properly registered, and the necessary keys have been set in the property list, _
		  // this method launches Help Viewer and displays the first page of your application’s help book.
		  
		  //@ For information on how to set up your project to take advantage of having Help Viewer _
		  // display your help book, see “Specifying the Comprehensive Help File”.
		  
		  #if TargetMacOS
		    declare sub showHelp lib CocoaLib selector "showHelp:" (obj_id as Ptr, sender as Ptr)
		    
		    showHelp self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopModal()
		  
		  #if TargetMacOS then
		    declare sub stopModal lib CocoaLib selector "stopModal" (obj_id as Ptr)
		    
		    stopModal self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopModal(returnCode as Integer)
		  
		  #if TargetMacOS then
		    declare sub stopModalWithCode lib CocoaLib selector "stopModalWithCode:" (obj_id as Ptr, returnCode as integer)
		    
		    stopModalWithCode self, returnCode
		  #else
		    #pragma Unused returnCode
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Terminate()
		  //sends a SIGTERM to the process and its subprocesses.
		  
		  #if targetMacOS
		    declare sub terminate lib CocoaLib selector "terminate" (obj_id as Ptr)
		    
		    terminate(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unhide()
		  //# Restores hidden windows to the screen and makes the application active.
		  
		  //@ Invokes unhideWithoutActivation.
		  
		  #if TargetMacOS
		    declare sub unhide lib CocoaLib selector "unhide:" (obj_id as Ptr, sender as Ptr)
		    
		    unhide self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnhideAllApplications()
		  //# Unhides all applications, including this application.
		  
		  //@ This action causes each application to order its windows to the front, _
		  // which could obscure the currently active window in the active application.
		  
		  #if TargetMacOS
		    declare sub unhideAllApplications lib CocoaLib selector "unhideAllApplications:" (obj_id as Ptr, sender as Ptr)
		    
		    unhideAllApplications self, self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnhideWithoutActivation()
		  //# Restores hidden windows without activating their owner (the NSApplication).
		  
		  //@ When this method begins, it posts an NSApplicationWillUnhideNotification _
		  // to the default notification center. If it completes successfully, it posts _
		  // an NSApplicationDidUnhideNotification.
		  
		  #if TargetMacOS
		    declare sub unhideWithoutActivation lib CocoaLib selector "unhideWithoutActivation" (obj_id as Ptr)
		    
		    unhideWithoutActivation self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterForRemoteNotifications()
		  //# Unregister for notifications received from Apple Push Notification service.
		  
		  //@ You should call this method in rare circumstances only, such as when a new version _
		  // of the application drops support for remote notifications. Applications unregistered _
		  // through this method can always re-register.
		  
		  #if TargetMacOS
		    if IsLion then
		      declare sub unregisterForRemoteNotifications lib CocoaLib selector "unregisterForRemoteNotifications" (obj_id as Ptr)
		      
		      unregisterForRemoteNotifications self
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateWindows()
		  //# Sends an update message to each onscreen window.
		  
		  #if TargetMacOS
		    declare sub updateWindows lib CocoaLib selector "updateWindows" (obj_id as Ptr)
		    
		    updateWindows self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateWindowsItem(aWindow as NSWindow)
		  
		  #if TargetMacOS then
		    declare sub updateWindowsItem lib CocoaLib selector "updateWindowsItem:" (obj_id as Ptr, aWindow as Ptr)
		    
		    updateWindowsItem self, aWindow
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserInterfaceLayoutDirection() As NSUserInterfaceLayoutDirection
		  //# Returns the layout direction of the user interface.
		  
		  #if TargetMacOS
		    if IsSnowLeopard then
		      declare function userInterfaceLayoutDirection lib CocoaLib selector "userInterfaceLayoutDirection" (obj_id as Ptr) as NSUserInterfaceLayoutDirection
		      
		      return userInterfaceLayoutDirection(self)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValidRequestorForType(sendType as String, returnType as String) As Ptr
		  //# Indicates whether the application can send and receive the specified pasteboard types.
		  
		  #if TargetMacOS
		    declare function validRequestorForSendType lib CocoaLib selector "validRequestorForSendType:returnType:" (obj_id as Ptr, sendType as CFStringRef, returnType as CFStringRef) as Ptr
		    
		    return validRequestorForSendType(self, sendType, returnType)
		  #else
		    #pragma unused sendType
		    #pragma unused returnType
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Window(windowNum as Integer) As NSWindow
		  //# Returns the window corresponding to the specified window number.
		  
		  #if TargetMacOS
		    declare function windowWithWindowNumber lib CocoaLib selector "windowWithWindowNumber:" (obj_id as Ptr, windowNum as Integer) as Ptr
		    
		    dim windowRef as Ptr = windowWithWindowNumber(self, windowNum)
		    if windowRef <> nil then
		      return new NSWindow(windowRef)
		    end if
		    
		  #else
		    #pragma unused windowNum
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Windows() As CFArray
		  //# Returns an array containing the application's window objects.
		  
		  #if targetCocoa
		    declare function windows lib CocoaLib selector "windows" (obj_id as Ptr) as Ptr
		    
		    return new CFArray(windows(self), not CFArray.hasOwnership)
		    
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the application’s activation policy.
			  
			  #if TargetMacOS
			    declare function activationPolicy lib CocoaLib selector "activationPolicy" (obj_id as Ptr) as NSRunningApplication.NSApplicationActivationPolicy
			    
			    return activationPolicy(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Attempts to modify the application's activation policy.
			  
			  #if TargetMacOS
			    declare sub setActivationPolicy lib CocoaLib selector "setActivationPolicy:" (obj_id as Ptr, policy as NSRunningApplication.NSApplicationActivationPolicy)
			    
			    setActivationPolicy self, value
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ActivationPolicy As NSRunningApplication.NSApplicationActivationPolicy
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the help menu used by the application.
			  
			  #if targetMacOS
			    declare function helpMenu lib CocoaLib selector "helpMenu" (obj_id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = helpMenu(self)
			    if menuRef <> nil then
			      return new NSMenu(menuRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the application’s help menu.
			  
			  #if targetMacOS
			    if IsSnowLeopard then
			      declare sub setHelpMenu lib CocoaLib selector "setHelpMenu:" (class_id as Ptr, aMenu as Ptr)
			      
			      dim menuRef as Ptr
			      if value <> nil then
			        menuRef = value
			      end if
			      
			      setHelpMenu(self, menuRef)
			    end if
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		HelpMenu As NSMenu
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the image used for the NSApplication’s icon.
			  
			  #if targetMacOS
			    declare function applicationIconImage lib CocoaLib selector "applicationIconImage" (obj_id as Ptr) as Ptr
			    
			    dim imageRef as Ptr = applicationIconImage(self)
			    if imageRef <> nil then
			      return new NSImage(imageRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the application’s icon to the specified image.
			  
			  //@ This method sets the icon in the dock application tile. _
			  //  This method scales the image as necessary so that it fits in the dock tile. _
			  //  You can use this method to change your application icon while running. _
			  //  To restore your application’s original icon, you pass nil to this method.
			  
			  #if targetMacOS
			    declare sub setApplicationIconImage lib CocoaLib selector "setApplicationIconImage:" (class_id as Ptr, anImage as Ptr)
			    
			    dim imageRef as Ptr
			    if value <> nil then
			      imageRef = value
			    end if
			    
			    setApplicationIconImage(self, imageRef)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		IconImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the application’s main menu.
			  
			  #if targetMacOS
			    declare function mainMenu lib CocoaLib selector "mainMenu" (obj_id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = mainMenu(self)
			    if menuRef <> nil then
			      return new NSMenu(menuRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Makes the given menu the application’s main menu.
			  
			  #if targetMacOS
			    declare sub setMainMenu lib CocoaLib selector "setMainMenu:" (class_id as Ptr, aMenu as Ptr)
			    
			    dim menuRef as Ptr
			    if value <> nil then
			      menuRef = value
			    end if
			    
			    setMainMenu(self, menuRef)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		MainMenu As NSMenu
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the presentation options that should be in effect for the system when this application is active.
			  
			  #if TargetMacOS
			    declare function presentationOptions lib CocoaLib selector "presentationOptions" (obj_id as Ptr) as UInt32
			    
			    return presentationOptions(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the application presentation options to use when this application is active.
			  
			  #if TargetMacOS
			    declare sub setPresentationOptions lib CocoaLib selector "setPresentationOptions:" (obj_id as Ptr, newOptions as UInt32)
			    
			    setPresentationOptions self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		PresentationOptions As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the Services menu.
			  
			  #if targetMacOS
			    declare function servicesMenu lib CocoaLib selector "servicesMenu" (obj_id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = servicesMenu(self)
			    if menuRef <> nil then
			      return new NSMenu(menuRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Makes a given menu the application’s Services menu.
			  
			  #if targetMacOS
			    declare sub setServicesMenu lib CocoaLib selector "setServicesMenu:" (class_id as Ptr, aMenu as Ptr)
			    
			    dim menuRef as Ptr
			    if value <> nil then
			      menuRef = value
			    end if
			    
			    setServicesMenu(self, menuRef)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ServicesMenu As NSMenu
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the object that provides the services the application advertises in the Services menu of other applications.
			  
			  #if TargetMacOS then
			    declare function servicesProvider lib CocoaLib selector "servicesProvider" (obj_id as Ptr) as Ptr
			    
			    return servicesProvider(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Registers a given object as the service provider.
			  
			  #if TargetMacOS then
			    declare sub setServicesProvider lib CocoaLib selector "setServicesProvider:" (obj_id as Ptr, aProvider as Ptr)
			    
			    setServicesProvider self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ServicesProvider As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the Window menu of the application.
			  
			  #if targetMacOS
			    declare function windowsMenu lib CocoaLib selector "windowsMenu" (obj_id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = windowsMenu(self)
			    if menuRef <> nil then
			      return new NSMenu(menuRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Makes the given menu the application’s Window menu.
			  
			  #if targetMacOS
			    declare sub setWindowsMenu lib CocoaLib selector "setWindowsMenu:" (class_id as Ptr, aMenu as Ptr)
			    
			    dim menuRef as Ptr
			    if value <> nil then
			      menuRef = value
			    end if
			    
			    setWindowsMenu(self, menuRef)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		WindowsMenu As NSMenu
	#tag EndComputedProperty


	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"NSApplication", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSApplicationPresentationOptions, Type = Integer, Flags = &h0
		NSApplicationPresentationDefault = 0
		  NSApplicationPresentationAutoHideDock = 1
		  NSApplicationPresentationHideDock = 2
		  NSApplicationPresentationAutoHideMenuBar = 4
		  NSApplicationPresentationHideMenuBar = 8
		  NSApplicationPresentationDisableAppleMenu = 16
		  NSApplicationPresentationDisableProcessSwitching = 32
		  NSApplicationPresentationDisableForceQuit = 64
		  NSApplicationPresentationDisableSessionTermination = 128
		  NSApplicationPresentationDisableHideApplication = 256
		  NSApplicationPresentationDisableMenuBarTransparency = 512
		  NSApplicationPresentationFullScreen = 1024
		NSApplicationPresentationAutoHideToolbar = 2048
	#tag EndEnum

	#tag Enum, Name = NSRemoteNotificationType, Type = Integer, Flags = &h0
		NSRemoteNotificationTypeNone
		  NSRemoteNotificationTypeBadge
		  NSRemoteNotificationTypeSound
		NSRemoteNotificationTypeAlert
	#tag EndEnum

	#tag Enum, Name = NSRequestUserAttentionType, Flags = &h0
		NSCriticalRequest = 0
		NSInformationalRequest = 10
	#tag EndEnum

	#tag Enum, Name = NSUserInterfaceLayoutDirection, Flags = &h0
		NSUserInterfaceLayoutDirectionLeftToRight
		NSUserInterfaceLayoutDirectionRightToLeft
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
			Name="PresentationOptions"
			Group="Behavior"
			Type="UInt32"
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

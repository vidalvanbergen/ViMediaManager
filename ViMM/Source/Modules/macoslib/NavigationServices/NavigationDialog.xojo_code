#tag Class
Class NavigationDialog
	#tag Method, Flags = &h21
		Private Shared Sub Add(dlg as NavigationDialog)
		  if dlg is nil then
		    return
		  end if
		  
		  Dialogs.Value(Integer(dlg.DialogRef)) = dlg
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBAccept(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBAccept callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBAdjustPreview(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBAdjustPreview callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBAdjustRect(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBAdjustRect callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBCancel(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBCancel callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBCustomize(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBCustomize callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBEvent(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBEvent callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBNewLocation(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBNewLocation callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBOpenSelection(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBOpenSelection callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBPopupMenuSelect(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBPopupMenuSelect callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBSelectEntry(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBSelectEntry callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBShowDesktop(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBShowDesktop callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBStart(ByRef callbackParms as NavCBRec)
		  raiseEvent NavCBStart callbackParms
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBTerminate(ByRef callbackParms as NavCBRec)
		  #if targetMacOS
		    raiseEvent NavCBTerminate callbackParms
		    
		    soft declare sub NavDialogDispose lib CarbonLib (inDialog as Ptr)
		    
		    NavDialogDispose callbackParms.context
		    NavigationDialog.Remove me
		    me.DialogRef = nil
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CBUserAction(ByRef callbackParms as NavCBRec)
		  #if targetMacOS
		    select case callbackParms.userAction
		    case kNavUserActionCancel
		      if me.CancelHandler <> nil then
		        me.CancelHandler.Invoke
		      else
		        raiseEvent UserActionCancel
		      end if
		      
		    case kNavUserActionChoose
		      if me.ChooseHandler <> nil then
		        me.ChooseHandler.Invoke me.GetItems(callbackParms)
		      else
		        raiseEvent UserActionChoose me.GetItems(callbackParms)
		      end if
		      
		    case kNavUserActionDiscardChanges
		      if me.DiscardChangesHandler <> nil then
		        me.DiscardChangesHandler.Invoke
		      else
		        raiseEvent UserActionDiscardChanges
		      end if
		      
		    case kNavUserActionDiscardDocuments
		      if me.DiscardDocumentsHandler <> nil then
		        me.DiscardDocumentsHandler.Invoke
		      else
		        raiseEvent UserActionDiscardDocuments
		      end if
		      
		    case kNavUserActionDontSaveChanges
		      if me.DontSaveChangesHandler <> nil then
		        me.DontSaveChangesHandler.Invoke
		      else
		        raiseEvent UserActionDontSaveChanges
		      end if
		      
		    case kNavUserActionNewFolder
		      if me.NewFolderHandler <> nil then
		        me.NewFolderHandler.Invoke me.GetItem(callbackParms)
		      else
		        raiseEvent UserActionNewFolder me.GetItem(callbackParms)
		      end if
		      
		    case kNavUserActionNone
		      
		    case kNavUserActionOpen
		      if me.OpenHandler <> nil then
		        me.OpenHandler.Invoke me.GetItems(callbackParms)
		      else
		        raiseEvent UserActionOpen me.GetItems(callbackParms)
		      end if
		      
		    case kNavUserActionReviewDocuments
		      if me.ReviewDocumentsHandler <> nil then
		        me.ReviewDocumentsHandler.Invoke
		      else
		        raiseEvent UserActionReviewDocuments
		      end if
		      
		    case kNavUserActionSaveAs
		      if me.SaveAsHandler <> nil then
		        me.SaveAsHandler.Invoke me.GetItem(callbackParms), me.SaveFileName
		      else
		        raiseEvent UserActionSaveAs me.GetItem(callbackParms), me.SaveFileName
		      end if
		      
		      soft declare function NavDialogGetReply lib CarbonLib (inDialog as Ptr, ByRef outReply as NavReplyRecord) as Integer
		      
		      dim navReply as NavReplyRecord
		      dim OSError as Integer = NavDialogGetReply(callbackParms.context, navReply)
		      if OSError = 0 then
		        soft declare function NavCompleteSave lib CarbonLib (ByRef reply as NavReplyRecord, howToTranslate as UInt32) as Int16
		        const kNavTranslateCopy = 1
		        dim NavCompleteSaveError as Int16 = NavCompleteSave(navReply, kNavTranslateCopy)
		        #pragma unused NavCompleteSaveError
		        soft declare function NavDisposeReply lib CarbonLib (ByRef outReply as NavReplyRecord) as Int16
		        dim NavDisposeReplyError as Int16 = NavDisposeReply(navReply)
		        #pragma unused NavDisposeReplyError
		        
		      else
		        //break
		      end if
		      
		      
		      
		    case kNavUserActionSaveChanges
		      if me.SaveChangesHandler <> nil then
		        me.SaveChangesHandler.Invoke
		      else
		        raiseEvent UserActionSaveChanges
		      end if
		      
		    else
		      //this case should not happen...
		    end select
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ConfigOptions() As UInt32
		  dim theOptions as UInt32
		  
		  if me.NoTypePopup then
		    const kNavNoTypePopup = &h00000001
		    theOptions = theOptions or kNavNoTypePopup
		  end if
		  if not me.AutoTranslate then
		    const kNavDontAutoTranslate = &h00000002
		    theOptions = theOptions or kNavDontAutoTranslate
		  end if
		  if not me.AddTranslateItems then
		    const kNavDontAddTranslateItems = &h00000004
		    theOptions = theOptions or kNavDontAddTranslateItems
		  end if
		  if me.AllFilesInPopup then
		    const kNavAllFilesInPopup = &h00000010
		    theOptions = theOptions or kNavAllFilesInPopup
		  end if
		  if me.AllowStationery then
		    const kNavAllowStationery = &h00000020
		    theOptions = theOptions or kNavAllowStationery
		  end if
		  if me.AllowPreviews then
		    const kNavAllowPreviews = &h00000040
		    theOptions = theOptions or kNavAllowPreviews
		  end if
		  if me.AllowMultipleFiles then
		    const kNavAllowMultipleFiles = &h00000080
		    theOptions = theOptions or kNavAllowMultipleFiles
		  end if
		  if me.AllowInvisibleFiles then
		    const kNavAllowInvisibleFiles = &h00000100
		    theOptions = theOptions or kNavAllowInvisibleFiles
		  end if
		  if not me.ResolveAliases then
		    const kNavDontResolveAliases = &h00000200
		    theOptions = theOptions or kNavDontResolveAliases
		  end if
		  if me.SelectDefaultLocation then
		    const kNavSelectDefaultLocation = &h00000400
		    theOptions = theOptions or kNavSelectDefaultLocation
		  end if
		  if me.SelectAllReadableItem then
		    const kNavSelectAllReadableItem = &h00000800
		    theOptions = theOptions or kNavSelectAllReadableItem
		  end if
		  if me.SupportPackages then
		    const kNavSupportPackages = &h00001000
		    theOptions = theOptions or kNavSupportPackages
		  end if
		  if me.AllowOpenPackages then
		    const kNavAllowOpenPackages = &h00002000
		    theOptions = theOptions or kNavAllowOpenPackages
		  end if
		  if not me.AddRecents then
		    const kNavDontAddRecents = &h00004000
		    theOptions = theOptions or kNavDontAddRecents
		  end if
		  if not me.UseCustomFrame then
		    const kNavDontUseCustomFrame = &h00008000
		    theOptions = theOptions or kNavDontUseCustomFrame
		  end if
		  if not me.ConfirmReplacement then
		    const kNavDontConfirmReplacement = &h00010000
		    theOptions = theOptions or kNavDontConfirmReplacement
		  end if
		  if me.PreserveSaveFileExtension then
		    const kNavPreserveSaveFileExtension = &h00020000
		    theOptions = theOptions or kNavPreserveSaveFileExtension
		  end if
		  
		  return theOptions
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetItem(ByRef callbackParms as NavCBRec) As FolderItem
		  dim items() as FolderItem = me.GetItems(callbackParms)
		  if UBound(items) = 0 then
		    return items(0)
		  else
		    System.Log System.LogLevelError, "NavigationServices.GetItem: One item was expected, but " + Str(1 + UBound(items)) + " were returned."
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetItems(ByRef callbackParms as NavCBRec) As FolderItem()
		  #if targetMacOS
		    soft declare function NavDialogGetReply lib CarbonLib (inDialog as Ptr, ByRef outReply as NavReplyRecord) as Integer
		    
		    dim navReply as NavReplyRecord
		    dim OSError as Integer = NavDialogGetReply(callbackParms.context, navReply)
		    if OSError <> 0 then
		      dim noList() as FolderItem
		      return noList
		    end if
		    
		    if not navReply.validRecord then
		      dim noList() as FolderItem
		      return noList
		    end if
		    
		    
		    dim theList() as FolderItem
		    
		    dim theAEDesc as AEDesc = navReply.selection
		    
		    soft declare function AECountItems lib CarbonLib (ByRef theAEDesc as AEDesc, Byref theCount as Integer) as Int16
		    
		    dim itemCount as Integer
		    dim theErr as Int16 = AECountItems(theAEDesc, itemCount)
		    dim OSErr as Int16
		    for index as Integer = 1 to itemCount
		      soft declare function AEGetNthPtr lib CarbonLib (ByRef theAEDesc as AEDesc, index as Integer, desiredType as OSType, ByRef theAEKeyword as OSType, ByRef typeCode as OSType, dataPtr as Ptr, maximumSize as Integer, ByRef actualSize as Integer) as Int16
		      dim keyword as OSType
		      dim typeCode as OSType = typeFSRef
		      dim theFSRef as new FSRef
		      dim actualSize as Integer
		      OSErr = AEGetNthPtr(theAEDesc, index, typeFSRef, keyword, typeCode, theFSRef, theFSRef.Operator_Convert.Size, actualSize)
		      dim f as FolderItem = FileManager.GetFolderItemFromFSRef(theFSRef)
		      if f <> nil then
		        theList.Append f
		      end if
		    next
		    
		    soft declare function NavDisposeReply lib CarbonLib (ByRef outReply as NavReplyRecord) as Int16
		    
		    dim NavDisposeReplyError as Int16 = NavDisposeReply(navReply)
		    if NavDisposeReplyError <> 0 then
		      break
		    end if
		    
		    return theList
		    
		    // Keep the compiler from complaining
		    #pragma unused OSErr
		    #pragma unused theErr
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub HandleEvent(callbackSelector as UInt32, ByRef callbackParms as NavCBRec, callbackUD as Ptr)
		  If not Dialogs.HasKey(Integer(callbackParms.context)) then //this really shouldn't happen
		    return
		  end if
		  
		  dim theDialog as NavigationDialog = Dialogs.Value(Integer(callbackParms.context))
		  
		  
		  const kNavCBEvent = 0
		  const kNavCBCustomize = 1
		  const kNavCBStart = 2
		  const kNavCBTerminate = 3
		  const kNavCBAdjustRect = 4
		  const kNavCBNewLocation = 5
		  const kNavCBShowDesktop = 6
		  const kNavCBselectEntry = 7
		  const kNavCBPopupMenuselect = 8
		  const kNavCBAccept = 9
		  const kNavCBCancel = 10
		  const kNavCBAdjustPreview = 11
		  const kNavCBUserAction = 12
		  const kNavCBOpenSelection = &h80000000
		  
		  select case callbackselector
		  case kNavCBEvent
		    theDialog.CBEvent callbackParms
		    
		  case kNavCBCustomize
		    theDialog.CBCustomize callbackParms
		    
		  case kNavCBStart
		    theDialog.CBStart callbackParms
		    
		  case kNavCBTerminate
		    theDialog.CBTerminate callbackParms
		    
		  case kNavCBAdjustRect
		    theDialog.CBAdjustRect callbackParms
		    
		  case kNavCBNewLocation
		    theDialog.CBNewLocation callbackParms
		    
		  case kNavCBShowDesktop
		    theDialog.CBShowDesktop callbackParms
		    
		  case kNavCBselectEntry
		    theDialog.CBselectEntry callbackParms
		    
		  case kNavCBPopupMenuselect
		    theDialog.CBPopupMenuSelect callbackParms
		    
		  case kNavCBAccept
		    theDialog.CBAccept callbackParms
		    
		  case kNavCBCancel
		    theDialog.CBCancel callbackParms
		    
		  case kNavCBAdjustPreview
		    theDialog.CBAdjustPreview callbackParms
		    
		  case kNavCBUserAction
		    theDialog.CBUserAction callbackParms
		    
		  case kNavCBOpenselection
		    theDialog.CBOpenselection callbackParms
		    
		  else
		    //this case shouldn't occur
		  end select
		  
		  #pragma unused callbackUD
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub Remove(dlg as NavigationDialog)
		  if dlg is nil then
		    return
		  end if
		  
		  if Dialogs.HasKey(Integer(dlg.DialogRef)) then
		    Dialogs.Remove Integer(dlg.DialogRef)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFilters(ParamArray utiList as String)
		  #if targetMacOS
		    for each uti as String in utiList
		      me.SetFilterList.Append uti
		    next
		    
		    if me.DialogRef <> nil then
		      me.SetFilterTypeIdentifiers me.SetFilterList
		      redim me.SetFilterList(-1)
		    end if
		  #endif
		  
		  //SetFilterTypeIdentifiers can't be used until DialogRef exists.  if DialogRef = nil,
		  //I add utiList to a private array and use this list when the dialog is created
		  //It's possible to set filters even after the dialog is shown.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetFilterTypeIdentifiers(utiList() as String)
		  #if targetMacOS
		    if me.DialogRef = nil then
		      return
		    end if
		    
		    if UBound(utiList) < 0 then
		      return
		    end if
		    
		    dim cfList() as CFType
		    for i as Integer = 0 to UBound(utiList)
		      dim s as CFString = utiList(i)
		      cfList.Append s
		    next
		    
		    dim theArray as new CFArray(cfList)
		    
		    soft declare function NavDialogSetFilterTypeIdentifiers lib CarbonLib (inGetFileDialog as Ptr, inTypeIdentifiers as Ptr) as Integer
		    
		    dim OSError as Integer = NavDialogSetFilterTypeIdentifiers(me.DialogRef, theArray)
		    
		    // Keep the compiler from complaining
		    #pragma unused OSError
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show(parentWindow as Window = nil)
		  soft declare function NewNavEventUPP Lib CarbonLib (userRoutine as Ptr) as Ptr
		  
		  #if targetMacOS
		    dim eventHandlerPtr as MemoryBlock = AddressOf HandleEvent
		    if eventHandlerPtr is nil then
		      return
		    end if
		    dim eventHandler as Ptr = NewNavEventUPP(eventHandlerPtr)
		    if eventHandler = nil then
		      return
		    end if
		    
		    dim options as new NavDialogCreationOptions
		    options.ConfigOptions = me.ConfigOptions
		    options.Top = me.Top
		    options.Left = me.Left
		    options.ClientName = me.ClientName
		    options.WindowTitle = me.Title
		    options.ActionButtonLabel = me.ActionButtonLabel
		    options.CancelButtonLabel = me.CancelButtonLabel
		    options.SaveFileName = me.SaveFileName
		    options.Message = me.Message
		    
		    if parentWindow <> nil then
		      const  kWindowModalityAppModal = 2
		      const kWindowModalityWindowModal = 3
		      options.Modality = kWindowModalityWindowModal
		      options.ParentWindow = parentWindow
		    end if
		    
		    me.DialogRef = raiseEvent CreateDialog(options, eventHandler, nil)
		    if me.DialogRef = nil then
		      return
		    end if
		    
		    //set filters now
		    me.SetFilterTypeIdentifiers me.SetFilterList
		    redim me.SetFilterList(-1)
		    
		    NavigationDialog.Add me
		    
		    soft declare function NavDialogRun lib CarbonLib (inDialog as Ptr) as Integer
		    
		    dim OSStatus as Integer = NavDialogRun(me.DialogRef)
		    if OSStatus <> 0 then
		      System.Log System.LogLevelError, "NavigationDialog.Show: NavDialogRun returned error " + Str(OSStatus) + "."
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CreateDialog(CreationOptions as NavDialogCreationOptions, eventHandler as Ptr, UserData as Ptr) As Ptr
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBAccept(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBAdjustPreview(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBAdjustRect(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBCancel(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBCustomize(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBEvent(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBNewLocation(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBOpenSelection(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBPopupMenuSelect(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBSelectEntry(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBShowDesktop(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBStart(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NavCBTerminate(ByRef callbackParms as NavCBRec)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionCancel()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionChoose(items() as FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionDiscardChanges()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionDiscardDocuments()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionDontSaveChanges()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionNewFolder(item as FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionOpen(items() as FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionReviewDocuments()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionSaveAs(saveDirectory as FolderItem, fileName as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserActionSaveChanges()
	#tag EndHook


	#tag Note, Name = Notes
		Apple docs are wrong when it says that 
		
		kNavCBNewLocation
		Tells your application that a new location is being viewed in the dialog. The param field of the NavCBRec structure contains a pointer to an AEDesc structure of type 'typeFSS' describing the new location. This pointer is valid only during the execution of your event-handling function.
		
		it's actually a typeFSRef, at least in Carbon/OS X
	#tag EndNote


	#tag Property, Flags = &h0
		ActionButtonLabel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		AddAutoTranslateItems As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		AddRecents As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		AddTranslateItems As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		AllFilesInPopup As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowInvisibleFiles As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowMultipleFiles As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowOpenPackages As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowPreviews As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowStationery As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		AutoTranslate As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		CancelButtonLabel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CancelHandler As NavServicesCancelHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		ChooseHandler As NavServicesChooseHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		ClientName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ConfirmReplacement As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DialogRef As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  static d as new Dictionary
			  return d
			End Get
		#tag EndGetter
		Private Shared Dialogs As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DiscardChangesHandler As NavServicesDiscardChangesHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		DiscardDocumentsHandler As NavServicesDiscardDocumentsHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		DontSaveChangesHandler As NavServicesDontSaveChangesHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		Left As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Message As String
	#tag EndProperty

	#tag Property, Flags = &h0
		NewFolderHandler As NavServicesNewFolderHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		NoTypePopup As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		OpenHandler As NavServicesOpenHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		PreserveSaveFileExtension As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pSaveFileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ResolveAliases As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		ReviewDocumentsHandler As NavServicesReviewDocumentsHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveAsHandler As NavServicesSaveAsHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveChangesHandler As NavServicesSaveChangesHandler
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    if me.DialogRef = nil then
			      return me.pSaveFileName
			    else
			      soft declare function NavDialogGetSaveFileName lib CarbonLib (inPutFileDialog as Ptr) as Ptr
			      
			      return RetainedStringValue(NavDialogGetSaveFileName(self.DialogRef))
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    me.pSaveFileName = value
			    if me.DialogRef <> nil then
			      soft declare function NavDialogSetSaveFileName lib CarbonLib (inPutFileDialog as Ptr, inFileName as CFStringRef) as Integer
			      
			      dim OSError as Integer = NavDialogSetSaveFileName(me.DialogRef, value)
			      
			      // Keep the compiler from complaining
			      #pragma unused OSError
			    end if
			    
			  #else
			    
			    #pragma unused value
			    
			  #endif
			  
			End Set
		#tag EndSetter
		SaveFileName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SelectAllReadableItem As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectDefaultLocation As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SetFilterList() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SupportPackages As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Top As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		UseCustomFrame As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowTitle As String
	#tag EndProperty


	#tag Constant, Name = CarbonLib, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac Carbon PEF, Language = Default, Definition  = \"CarbonLib"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Carbon.framework"
	#tag EndConstant

	#tag Constant, Name = fsRtParID, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoNone, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoParentDirID, Type = Double, Dynamic = False, Default = \"&h00000008", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFSCatInfoVolume, Type = Double, Dynamic = False, Default = \"&h00000004", Scope = Private
	#tag EndConstant

	#tag Constant, Name = sizeOfHFSUniStr255, Type = Double, Dynamic = False, Default = \"512", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActionButtonLabel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AddAutoTranslateItems"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AddRecents"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AddTranslateItems"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllFilesInPopup"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowInvisibleFiles"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowMultipleFiles"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowOpenPackages"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowPreviews"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowStationery"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoTranslate"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CancelButtonLabel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmReplacement"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NoTypePopup"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreserveSaveFileExtension"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ResolveAliases"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SaveFileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectAllReadableItem"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectDefaultLocation"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SupportPackages"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseCustomFrame"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowTitle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

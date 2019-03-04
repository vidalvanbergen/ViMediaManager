#tag Class
Class ChooseFileDialog
Inherits NavigationDialog
	#tag Event
		Function CreateDialog(CreationOptions as NavDialogCreationOptions, eventHandler as Ptr, UserData as Ptr) As Ptr
		  #if TargetMacOS
		    
		    dim OSStatus as Integer
		    dim navListHandle as MemoryBlock
		    dim NavList as MemoryBlock
		    dim theRef as Ptr
		    
		    Const kNavGenericSignature = "****"
		    Const Null = 0
		    
		    soft declare function NavCreateChooseFileDialog lib CarbonLib (inOptions as Ptr, inTypeList as Ptr, inEventProc as Ptr, inPreviewProc as Ptr, inFilterProc as Ptr, inClientData as Ptr, ByRef outDialog as Ptr) as Integer
		    
		    NavList = new MemoryBlock(12) //actually 8 + type list count
		    NavList.StringValue(0, 4) = kNavGenericSignature
		    NavList.Short(6) = 1
		    NavList.StringValue(8, 4) = "TEXT" //osTypeList
		    NavListHandle = new MemoryBlock(4)
		    NavListHandle.Ptr(0) = NavList
		    
		    OSStatus = NavCreateChooseFileDialog(CreationOptions, navListHandle, eventHandler, nil, nil, UserData, theRef)
		    If OSStatus <> 0 then
		      theRef = nil
		      System.Log System.LogLevelError, "NavigationDialog.Show: NavCreateChooseFileDialog returned error " + Str(OSStatus) + "."
		    End if
		    Return theRef
		    
		  #else
		    
		    #pragma unused CreationOptions
		    #pragma unused eventHandler
		    #pragma unused UserData
		    
		  #endif
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub NavCBEvent(ByRef callbackParms as NavCBRec)
		  'dim eventPtr as MemoryBlock
		  'dim eventKind as Integer
		  'dim where as Integer
		  'dim theControl as Integer
		  'dim OSError as Integer
		  'dim modifiers as Integer
		  'dim theControlKind as ControlKind
		  'dim focusedControl as Integer
		  '
		  'Const  nullEvent = 0
		  'Const mouseDown = 1
		  'Const mouseUp = 2
		  'Const  keyDown = 3
		  'Const  keyUp = 4
		  'Const  autoKey = 5
		  'Const  updateEvt = 6
		  'Const  diskEvt = 7
		  'Const  activateEvt = 8
		  'Const  osEvt = 15
		  'Const  kHighLevelEvent = 23
		  '
		  'Const Null = 0
		  '
		  'Const kControlKindEditUnicodeText   = "eutx"
		  'Const kControlFocusNextPart = -1
		  '
		  'Declare Sub GlobalToLocal Lib "CarbonLib" (ByRef pt as Integer)
		  'Declare Function FindControlUnderMouse Lib "CarbonLib" (inWhere as Integer, inWindow as Integer, outPart as Integer) as Integer
		  'Declare Function HandleControlClick Lib "CarbonLib" (inControl as Integer, inWhere as Integer, inModifiers as Short, inAction as Integer) as Short
		  'Declare Function GetControlKind Lib "CarbonLib" (inControl as Integer, outControlKind as Ptr) as Integer
		  'Declare Function GetKeyboardFocus Lib "CarbonLib" (inWindow as Integer, ByRef outControl as Integer) as Short
		  'Declare Function SetKeyboardFocus Lib "CarbonLib" (inWindow as Integer, inControl as Integer, inPart as Short) as Short
		  '
		  'eventPtr = NavCBRec.Ptr(26)//eventData begins at byte 26
		  'eventKind = eventPtr.UShort(0)
		  '
		  'Select Case eventKind
		  'Case mouseDown
		  'where = eventPtr.Long(10)
		  'GlobalToLocal where
		  'theControl = FindControlUnderMouse(where, NavCBRec.Long(6), Null)
		  'If theControl <> Null then
		  'theControlKind = new ControlKind
		  'OSError = GetControlKind(theControl, theControlKind)
		  'If OSError <> 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.NavEvent: GetControlKind returned error " + Str(OSError) + "."
		  'End if
		  'If theControlKind.Kind = kControlKindEditUnicodeText then
		  'OSError = GetKeyboardFocus(NavCBRec.Long(6), focusedControl)
		  'If OSError <> 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.NavEvent: GetKeyboardFocus returned error " + Str(OSError) + "."
		  'End If
		  'If focusedControl <> theControl then
		  'OSError = SetKeyboardFocus(NavCBRec.Long(6), theControl, kControlFocusNextPart)
		  'If OSError <> 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.NavEvent: SetKeyboardFocus returned error " + Str(OSError) + "."
		  'End if
		  'Else
		  '//
		  'End if
		  'Else
		  '//not a control that can receive focus
		  'End if
		  'Call HandleControlClick(theControl, where, eventPtr.UShort(14), Null)
		  'Else
		  '//
		  'End if
		  'Else
		  '//
		  'End Select
		  '
		  '
		  ''void HandleCustomMouseDown(NavCBRecPtr callBackParms)
		  ''{
		  ''EventRecord *evt = callBackParms->eventData.eventDataParms.event;
		  ''Point where = evt->where;
		  ''GlobalToLocal(&where);
		  ''
		  ''ControlRef whichControl = FindControlUnderMouse(where, callBackParms->window, NULL);
		  ''if (whichControl != NULL)
		  ''{
		  ''ControlKind theKind;
		  ''GetControlKind(whichControl, &theKind);
		  ''
		  ''// Moving the focus if we clicked in an editable text control
		  ''// In this sample, we only have a Clock and an Unicode Edit controls
		  ''if ((theKind.kind == kControlKindEditUnicodeText) || (theKind.kind == kControlKindClock))
		  ''{
		  ''ControlRef currentlyFocusedControl;
		  ''GetKeyboardFocus(callBackParms->window, &currentlyFocusedControl);
		  ''if (currentlyFocusedControl != whichControl)
		  ''SetKeyboardFocus(callBackParms->window, whichControl, kControlFocusNextPart);
		  ''}
		  ''HandleControlClick(whichControl, where, evt->modifiers, NULL);
		  ''}
		  ''}
		  '
		  '
		  '
		  ''struct EventRecord {
		  ''EventKind what;  2
		  ''UInt32 message; 4
		  ''UInt32 when; 4
		  ''Point where;  4
		  ''EventModifiers modifiers;  2
		  ''};
		  '
		  ''enum {
		  ''nullEvent = 0,
		  ''mouseDown = 1,
		  ''mouseUp = 2,
		  ''keyDown = 3,
		  ''keyUp = 4,
		  ''autoKey = 5,
		  ''updateEvt = 6,
		  ''diskEvt = 7,
		  ''activateEvt = 8,
		  ''osEvt = 15,
		  ''kHighLevelEvent = 23
		  ''};
		  ''typedef UInt16 EventKind;
		  '
		  ''struct ControlKind {
		  ''OSType signature;
		  ''OSType kind;
		  ''};
		  
		  #pragma unused callbackParms
		End Sub
	#tag EndEvent

	#tag Event
		Sub NavCBStart(ByRef callbackParms as NavCBRec)
		  'dim f as FolderItem
		  'dim theURL as CFURL
		  'dim theBundle as CFBundle
		  'dim nibName as CFString
		  'dim OSError as Integer
		  'dim nibRef as Integer
		  'dim controlRef as Integer
		  'dim nibWindowName as CFString
		  'dim windowRef as Integer
		  'dim rootRef as Integer
		  '
		  'Const kNavCtlAddControl = 18
		  '
		  '
		  'Declare Function CreateNibReferenceWithCFBundle Lib "CarbonLib" (inBundle as Integer, inNibName as Integer, ByRef outNibRef as Integer) as Integer
		  'Declare Function CreateNibReference Lib "CarbonLib" (inNibName as Integer, ByRef outNibRef as Integer) as Integer
		  'Declare Function CreateWindowFromNib Lib "CarbonLib" (inNibRef as Integer, inName as Integer, ByRef outWindow as Integer) as Integer
		  'Declare Function HIViewGetRoot Lib "CarbonLib" (inWindow as Integer) as Integer
		  'Declare Function HIViewFindByID Lib "CarbonLib" (inStartView as Integer, signature as OSType, id as Integer, ByRef outControl as Integer) as Integer
		  'Declare Function NavCustomControl Lib "CarbonLib" (dialog as Integer, selector as Integer, parms as Integer) as Short
		  'Declare Function NavDialogGetWindow Lib "CarbonLib" (dialog as Integer) as Integer
		  'Declare Sub DisposeNibReference Lib "CarbonLib" (inNibRef as Integer)
		  'Declare Function SetControlVisibility Lib "CarbonLib" (cntl as Integer, isVisible as Boolean, doDraw as Boolean) as Short
		  '
		  'Declare Function CFBundleGetMainBundle Lib "CarbonLib" () as Integer
		  '
		  '//get control
		  '
		  ''theBundle = new CFBundle(CFBundleGetMainBundle)
		  'nibName = new CFString("Test")
		  '
		  'OSError = CreateNibReference(nibName, nibRef)
		  'If OSError <> 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.Start: CreateNibReferenceWithBundleRef returned error " + Str(OSError) + "."
		  'Return
		  'End if
		  'nibWindowName = new CFString("NavWindow")
		  'OSError = CreateWindowFromNib(nibRef, nibWindowName, windowRef)
		  'If OSError <> 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.Start: CreateWindowFromNib returned error " + Str(OSError) + "."
		  'GOTO bail
		  'End if
		  'rootRef = HIViewGetRoot(windowRef)
		  'If rootRef = 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.Start: HIViewGetRoot returned 0."
		  'GOTO bail
		  'End if
		  'OSError = HIViewFindByID(rootRef, "usrp", 100, controlRef)
		  'If OSError <> 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.Start: HIViewFindByID returned error " + Str(OSError) + "."
		  'GOTO bail
		  'End if
		  '
		  'OSError = NavCustomControl(NavCBRec.Long(2), kNavCtlAddControl, controlRef)
		  'If OSError <> 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.Start: NavCustomControl returned error " + Str(OSError) + "."
		  ''GOTO bail
		  'End if
		  'OSError = SetControlVisibility(controlRef, true, true)
		  'If OSError <> 0 then
		  'System.Log System.LogLevelError, "ChooseFileDialog.Start: SetControlVisibility returned error " + Str(OSError) + "."
		  ''GOTO bail
		  'End if
		  '
		  'bail:
		  'Finally
		  'If nibRef <> 0 then
		  'DisposeNibReference nibRef
		  'nibRef = 0
		  'End if
		  
		  #pragma unused callbackParms
		  
		End Sub
	#tag EndEvent


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

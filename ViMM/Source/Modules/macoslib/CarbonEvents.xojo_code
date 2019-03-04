#tag Module
Protected Module CarbonEvents
	#tag Method, Flags = &h0
		Function CArray(extends spec() as EventTypeSpec) As MemoryBlock
		  dim m as new MemoryBlock(EventTypeSpec.Size*(1 + UBound(spec)))
		  dim offset as Integer = 0
		  for i as Integer = 0 to UBound(spec)
		    m.StringValue(offset, EventTypeSpec.Size) = spec(i).StringValue(targetLittleEndian)
		    offset = offset + EventTypeSpec.Size
		  next
		  return m
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote

	#tag Note, Name = types
		Lots of declarations of things like typeUnicodeText can be found in AEDataModel.h and AEDataModel.r.
	#tag EndNote


	#tag Constant, Name = eventNotHandledErr, Type = Double, Dynamic = False, Default = \"-9874", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventAttributeMonitored, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventAttributeNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventAttributeUserEvent, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventClassCommand, Type = String, Dynamic = False, Default = \"cmds", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventClassControl, Type = String, Dynamic = False, Default = \"cntl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventClassMenu, Type = String, Dynamic = False, Default = \"menu", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventClassMouse, Type = String, Dynamic = False, Default = \"mous", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventClassSearchField, Type = String, Dynamic = False, Default = \"srfd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventClassTextField, Type = String, Dynamic = False, Default = \"txfd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventClassTextInput, Type = String, Dynamic = False, Default = \"text", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventClassWindow, Type = String, Dynamic = False, Default = \"wind", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventCommandProcess, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventControlDraw, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventControlGetFocusPart, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventControlGetNextFocusCandidate, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventControlGetSizeConstraints, Type = Double, Dynamic = False, Default = \"105", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventControlSetData, Type = Double, Dynamic = False, Default = \"103", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventControlSetFocusPart, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventMenuEnableItems, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventMouseDown, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventMouseDragged, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventMouseEntered, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventMouseExited, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventMouseMoved, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventMouseUp, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventMouseWheelMoved, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamAttributes, Type = String, Dynamic = False, Default = \"attr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamBounds, Type = String, Dynamic = False, Default = \"boun", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamCGContextRef, Type = String, Dynamic = False, Default = \"cntx", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamClickCount, Type = String, Dynamic = False, Default = \"ccnt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamControlPart, Type = String, Dynamic = False, Default = \"cprt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamControlRef, Type = String, Dynamic = False, Default = \"crtl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamDeviceColor, Type = String, Dynamic = False, Default = \"devc", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamDeviceDepth, Type = String, Dynamic = False, Default = \"devd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamDimensions, Type = String, Dynamic = False, Default = \"dims", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamDirectObject, Type = String, Dynamic = False, Default = \"----", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamEnabled, Type = String, Dynamic = False, Default = \"enab", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamEventRef, Type = String, Dynamic = False, Default = \"evnt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamGDevice, Type = String, Dynamic = False, Default = \"gdev", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamGrafPort, Type = String, Dynamic = False, Default = \"graf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamIndex, Type = String, Dynamic = False, Default = \"indx", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMaximumSize, Type = String, Dynamic = False, Default = \"mxsz", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMenuRef, Type = String, Dynamic = False, Default = \"menu", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMinimumSize, Type = String, Dynamic = False, Default = \"mnsz", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMouseButton, Type = String, Dynamic = False, Default = \"mbtn", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMouseChord, Type = String, Dynamic = False, Default = \"chor", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMouseDelta, Type = String, Dynamic = False, Default = \"mdta", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMouseLocation, Type = String, Dynamic = False, Default = \"mloc", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMouseTrackingRef, Type = String, Dynamic = False, Default = \"mtrf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMouseWheelAxis, Type = String, Dynamic = False, Default = \"mwax", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMouseWheelDelta, Type = String, Dynamic = False, Default = \"mwdl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamMutableArray, Type = String, Dynamic = False, Default = \"marr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamReason, Type = String, Dynamic = False, Default = \"why\?", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamResult, Type = String, Dynamic = False, Default = \"ansr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamRgnHandle, Type = String, Dynamic = False, Default = \"rgnh", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamShape, Type = String, Dynamic = False, Default = \"shap", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamTabletEventType, Type = String, Dynamic = False, Default = \"tblt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamTextInputSendText, Type = String, Dynamic = False, Default = \"tstx", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamTransactionID, Type = String, Dynamic = False, Default = \"trns", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamUserData, Type = String, Dynamic = False, Default = \"usrd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamWindowMouseLocation, Type = String, Dynamic = False, Default = \"wmou", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventParamWindowRef, Type = String, Dynamic = False, Default = \"wind", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventSearchFieldCancelClicked, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventTextAccepted, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventTextDidChange, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventTextInputUnicodeForKeyEvent, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventWindowDrawContent, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventWindowHiding, Type = Double, Dynamic = False, Default = \"23", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventWindowPaint, Type = Double, Dynamic = False, Default = \"1013", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEventWindowUpdate, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHISearchFieldAttributesCancel, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHISearchFieldAttributesSearchIcon, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeBoolean, Type = String, Dynamic = False, Default = \"bool", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFArrayRef, Type = String, Dynamic = False, Default = \"cfar", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFAttributedStringRef, Type = String, Dynamic = False, Default = \"cfas", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFBooleanRef, Type = String, Dynamic = False, Default = \"cftf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFDictionaryRef, Type = String, Dynamic = False, Default = \"cfdc", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFIndex, Type = String, Dynamic = False, Default = \"cfix", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFMutableArrayRef, Type = String, Dynamic = False, Default = \"cfma", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFMutableAttributedStringRef, Type = String, Dynamic = False, Default = \"cfaa", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFMutableDictionaryRef, Type = String, Dynamic = False, Default = \"cfmd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFMutableStringRef, Type = String, Dynamic = False, Default = \"cfms", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFNumberRef, Type = String, Dynamic = False, Default = \"cfnb", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFStringRef, Type = String, Dynamic = False, Default = \"cfst", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCFTypeRef, Type = String, Dynamic = False, Default = \"cfty", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCGContextRef, Type = String, Dynamic = False, Default = \"cntx", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeChar, Type = String, Dynamic = False, Default = \"TEXT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCollection, Type = String, Dynamic = False, Default = \"cltn", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeControlPartCode, Type = String, Dynamic = False, Default = \"cprt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeControlRef, Type = String, Dynamic = False, Default = \"crtl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeCString, Type = String, Dynamic = False, Default = \"cstr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeGDHandle, Type = String, Dynamic = False, Default = \"gdev", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeGrafPtr, Type = String, Dynamic = False, Default = \"graf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeGWorldPtr, Type = String, Dynamic = False, Default = \"gwld", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeHICommand, Type = String, Dynamic = False, Default = \"hcmd", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeHIPoint, Type = String, Dynamic = False, Default = \"hipt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeHIRect, Type = String, Dynamic = False, Default = \"hirc", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeHIShapeRef, Type = String, Dynamic = False, Default = \"shap", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeHISize, Type = String, Dynamic = False, Default = \"hisz", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeMenuRef, Type = String, Dynamic = False, Default = \"menu", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeMouseButton, Type = String, Dynamic = False, Default = \"mbtn", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeMouseTrackingRef, Type = String, Dynamic = False, Default = \"mtrf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeMouseWheelAxis, Type = String, Dynamic = False, Default = \"mwax", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeOSStatus, Type = String, Dynamic = False, Default = \"osst", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typePString, Type = String, Dynamic = False, Default = \"pstr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typePtr, Type = String, Dynamic = False, Default = \"ptr ", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeQDPoint, Type = String, Dynamic = False, Default = \"QDpt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeQDRgnHandle, Type = String, Dynamic = False, Default = \"rgnh", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeUInt32, Type = String, Dynamic = False, Default = \"magn", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeUnicodeText, Type = String, Dynamic = False, Default = \"utxt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeVoidPtr, Type = String, Dynamic = False, Default = \"void", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeWindowRef, Type = String, Dynamic = False, Default = \"wind", Scope = Public
	#tag EndConstant


	#tag Structure, Name = EventTypeSpec, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		eventClass as UInt32
		eventKind as UInt32
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

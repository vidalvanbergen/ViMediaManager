#tag Module
Protected Module HTMLViewerExtension
	#tag Method, Flags = &h0
		Sub AlignCenter(extends v as HTMLViewer)
		  //# An action method that applies center alignment to selected content or all content if there’s no selection.
		  
		  #if TargetCocoa then
		    declare sub alignCenter lib CocoaLib selector "alignCenter:" (obj_id as Integer, sender as Integer)
		    
		    alignCenter(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AlignJustified(extends v as HTMLViewer)
		  //# An action method that applies full justification to selected content or all content if there’s no selection.
		  
		  #if TargetCocoa then
		    declare sub alignJustified lib CocoaLib selector "alignJustified:" (obj_id as Integer, sender as Integer)
		    
		    alignJustified(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AlignLeft(extends v as HTMLViewer)
		  //# An action method that applies left justification to selected content or all content if there’s no selection.
		  
		  #if TargetCocoa then
		    declare sub alignLeft lib CocoaLib selector "alignLeft:" (obj_id as Integer, sender as Integer)
		    
		    alignLeft(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AlignRight(extends v as HTMLViewer)
		  //# An action method that applies right justification to selected content or all content if there is no selection.
		  
		  #if TargetCocoa then
		    declare sub alignRight lib CocoaLib selector "alignRight:" (obj_id as Integer, sender as Integer)
		    
		    alignRight(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ApplicationNameForUserAgent(extends v as HTMLViewer) As String
		  //# Returns the HTMLViewer’s application name that is used in the user-agent string.
		  
		  #if TargetCocoa then
		    declare function applicationNameForUserAgent lib CocoaLib selector "applicationNameForUserAgent" (obj_id as Integer) as CFStringRef
		    
		    return applicationNameForUserAgent(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ApplicationNameForUserAgent(extends v as HTMLViewer, Assigns appName as String)
		  //# Sets the application name used in the user-agent string.
		  
		  #if TargetCocoa then
		    declare sub setApplicationNameForUserAgent lib CocoaLib selector "setApplicationNameForUserAgent:" (obj_id as Integer, appName as CFStringRef)
		    
		    setApplicationNameForUserAgent(v.Handle, appName)
		  #else
		    #pragma Unused v
		    #pragma Unused appName
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanGoBack(extends v as HTMLViewer) As Boolean
		  //# A Boolean value indicating whether the HTMLViewer can move backward. (read-only)
		  
		  #if TargetCocoa then
		    declare function canGoBack lib CocoaLib selector "canGoBack" (obj_id as Integer) as Boolean
		    
		    return canGoBack(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanGoForward(extends v as HTMLViewer) As Boolean
		  //# A Boolean value indicating whether the HTMLViewer can move forward. (read-only)
		  
		  #if TargetCocoa then
		    declare function canGoForward lib CocoaLib selector "canGoForward" (obj_id as Integer) as Boolean
		    
		    return canGoForward(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanMakeTextLarger(extends v as HTMLViewer) As Boolean
		  //# Returns whether the text can be made larger.
		  
		  #if TargetCocoa then
		    declare function canMakeTextLarger lib CocoaLib selector "canMakeTextLarger" (obj_id as Integer) as Boolean
		    
		    return canMakeTextLarger(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanMakeTextSmaller(extends v as HTMLViewer) As Boolean
		  //# Returns whether the text can be made smaller.
		  
		  #if TargetCocoa then
		    declare function canMakeTextSmaller lib CocoaLib selector "canMakeTextSmaller" (obj_id as Integer) as Boolean
		    
		    return canMakeTextSmaller(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanMakeTextStandardSize(extends v as HTMLViewer) As Boolean
		  //# Returns whether the current text size is a multiple of 1.
		  
		  #if TargetCocoa then
		    declare function canMakeTextStandardSize lib CocoaLib selector "canMakeTextStandardSize" (obj_id as Integer) as Boolean
		    
		    return canMakeTextStandardSize(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChangeFont(extends v as HTMLViewer)
		  //# An action method that changes the font of the selection, or all content if there is no selection.
		  
		  #if TargetCocoa then
		    declare sub changeFont lib CocoaLib selector "changeFont:" (obj_id as Integer, sender as Integer)
		    
		    changeFont(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckSpelling(extends v as HTMLViewer)
		  //# An action method that searches for a misspelled word in the HTMLViewer.
		  
		  #if TargetCocoa then
		    declare sub checkSpelling lib CocoaLib selector "checkSpelling:" (obj_id as Integer, sender as Integer)
		    
		    checkSpelling(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContinuousSpellCheckingEnabled(extends v as HTMLViewer) As Boolean
		  //# Returns whether the web view has continuous spell-checking enabled.
		  
		  #if TargetCocoa then
		    declare function isContinuousSpellCheckingEnabled lib CocoaLib selector "isContinuousSpellCheckingEnabled" (obj_id as Integer) as Boolean
		    
		    return isContinuousSpellCheckingEnabled(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContinuousSpellCheckingEnabled(extends v as HTMLViewer, Assigns flag as Boolean)
		  //# Sets whether the web view has continuous spell-checking enabled.
		  
		  #if TargetCocoa then
		    declare sub setContinuousSpellCheckingEnabled lib CocoaLib selector "setContinuousSpellCheckingEnabled:" (obj_id as Integer, flag as Boolean)
		    
		    setContinuousSpellCheckingEnabled(v.Handle, flag)
		  #else
		    #pragma Unused v
		    #pragma Unused flag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy(extends v as HTMLViewer)
		  //# Action method that copies the selected content to the general pasteboard.
		  
		  #if TargetCocoa then
		    declare sub copy lib CocoaLib selector "copy:" (obj_id as Integer, sender as Integer)
		    
		    copy(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFont(extends v as HTMLViewer)
		  //# An action method that copies font information onto the font pasteboard.
		  
		  #if TargetCocoa then
		    declare sub copyFont lib CocoaLib selector "copyFont:" (obj_id as Integer, sender as Integer)
		    
		    copyFont(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CustomTextEncodingName(extends v as HTMLViewer) As String
		  //# Returns the custom text encoding name.
		  
		  #if TargetCocoa then
		    declare function customTextEncodingName lib CocoaLib selector "customTextEncodingName" (obj_id as Integer) as CFStringRef
		    
		    return customTextEncodingName(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CustomTextEncodingName(extends v as HTMLViewer, Assigns encodingName as String)
		  //# Sets the custom text encoding name.
		  
		  #if TargetCocoa then
		    declare sub setCustomTextEncodingName lib CocoaLib selector "setCustomTextEncodingName:" (obj_id as Integer, encodingName as CFStringRef)
		    
		    setCustomTextEncodingName(v.Handle, encodingName)
		  #else
		    #pragma Unused v
		    #pragma Unused encodingName
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CustomUserAgent(extends v as HTMLViewer) As String
		  //# Returns the HTMLViewer’s custom user-agent string.
		  
		  #if TargetCocoa then
		    declare function customUserAgent lib CocoaLib selector "customUserAgent" (obj_id as Integer) as CFStringRef
		    
		    return customUserAgent(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CustomUserAgent(extends v as HTMLViewer, Assigns userAgent as String)
		  //# Sets the HTMLViewer’s custom user-agent string.
		  
		  #if TargetCocoa then
		    declare sub setCustomUserAgent lib CocoaLib selector "setCustomUserAgent:" (obj_id as Integer, userAgent as CFStringRef)
		    
		    setCustomUserAgent(v.Handle, userAgent)
		  #else
		    #pragma Unused v
		    #pragma Unused userAgent
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cut(extends v as HTMLViewer)
		  //# An action method that deletes selected content and puts it on the general pasteboard.
		  
		  #if TargetCocoa then
		    declare sub cut lib CocoaLib selector "cut:" (obj_id as Integer, sender as Integer)
		    
		    cut(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete(extends v as HTMLViewer)
		  //# An action method that deletes the selected content.
		  
		  #if TargetCocoa then
		    declare sub delete lib CocoaLib selector "delete:" (obj_id as Integer, sender as Integer)
		    
		    delete(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteSelection(extends v as HTMLViewer)
		  //# Deletes the HTMLViewer’s current selection unless it’s collapsed.
		  
		  #if TargetCocoa then
		    declare sub deleteSelection lib CocoaLib selector "deleteSelection" (obj_id as Integer)
		    
		    deleteSelection(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawsBackground(extends v as HTMLViewer) As Boolean
		  //# Returns whether the web view draws a background.
		  
		  #if TargetCocoa then
		    declare function drawsBackground lib CocoaLib selector "drawsBackground" (obj_id as Integer) as Boolean
		    
		    return drawsBackground(v.handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawsBackground(extends v as HTMLViewer, Assigns Value as Boolean)
		  //# Sets whether a default background is drawn when the webpage has no background set.
		  
		  #if TargetCocoa then
		    declare sub setDrawsBackground lib CocoaLib selector "setDrawsBackground:" (obj_id as Integer, inFlag as Boolean)
		    
		    setDrawsBackground(v.handle, Value)
		  #else
		    #pragma Unused v
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Editable(extends v as HTMLViewer) As Boolean
		  //# Returns whether the user is allowed to edit the document.
		  
		  #if TargetCocoa then
		    declare function isEditable lib CocoaLib selector "isEditable" (obj_id as Integer) as Boolean
		    
		    return isEditable(v.handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Editable(extends v as HTMLViewer, Assigns Value as Boolean)
		  //# Sets whether the HTMLViewer allows the user to edit its HTML document.
		  
		  #if TargetCocoa then
		    declare sub setEditable lib CocoaLib selector "setEditable:" (obj_id as Integer, flag as Boolean)
		    
		    setEditable(v.handle, Value)
		  #else
		    #pragma Unused v
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstimatedProgress(extends v as HTMLViewer) As Double
		  //# Returns an estimate, as a percentage, of the amount of content that is currently loaded.
		  
		  #if TargetCocoa then
		    declare function estimatedProgress lib CocoaLib selector "estimatedProgress" (obj_id as Integer) as Double
		    
		    return estimatedProgress(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EvaluateJavaScript(extends v as HTMLViewer, script as String) As String
		  //# Returns the result of running a script.
		  
		  #if TargetCocoa then
		    declare function stringByEvaluatingJavaScriptFromString lib CocoaLib selector "stringByEvaluatingJavaScriptFromString:" (obj_id as Integer, script as CFStringRef) as CFStringRef
		    
		    return stringByEvaluatingJavaScriptFromString(v.Handle, script)
		  #else
		    #pragma Unused v
		    #pragma Unused script
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GoBack(extends v as HTMLViewer)
		  //# Loads the previous location in the back-forward list.
		  
		  #if TargetCocoa then
		    declare sub goBack lib CocoaLib selector "goBack:" (obj_id as Integer, sender as Integer)
		    
		    goBack(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GoBack(extends v as HTMLViewer) As Boolean
		  //# Loads the previous location in the back-forward list.
		  
		  #if TargetCocoa then
		    declare function goBack lib CocoaLib selector "goBack" (obj_id as Integer) as Boolean
		    
		    return goBack(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GoForward(extends v as HTMLViewer)
		  //# Loads the next location in the back-forward list.
		  
		  #if TargetCocoa then
		    declare sub goForward lib CocoaLib selector "goForward:" (obj_id as Integer, sender as Integer)
		    
		    goForward(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GoForward(extends v as HTMLViewer) As Boolean
		  //# Loads the next location in the back-forward list.
		  
		  #if TargetCocoa then
		    declare function goForward lib CocoaLib selector "goForward" (obj_id as Integer) as Boolean
		    
		    return goForward(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isLoading(extends v as HTMLViewer) As Boolean
		  //# Returns whether the web view is loading content.
		  
		  #if TargetCocoa then
		    declare function isLoading lib CocoaLib selector "isLoading" (obj_id as Integer) as Boolean
		    
		    return isLoading(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MainFrameIcon(extends v as HTMLViewer) As Picture
		  //# Returns the site’s favicon.
		  
		  #if TargetCocoa then
		    declare function mainFrameIcon lib CocoaLib selector "mainFrameIcon" (obj_id as Integer) as Ptr
		    
		    return new NSImage(mainFrameIcon(v.handle))
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MainFrameTitle(extends v as HTMLViewer) As String
		  //# Returns the HTML title of the loaded page.
		  
		  #if TargetCocoa then
		    declare function mainFrameTitle lib CocoaLib selector "mainFrameTitle" (obj_id as Integer) as CFStringRef
		    
		    return mainFrameTitle(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MainFrameURL(extends v as HTMLViewer) As String
		  //# Returns the URL that the main frame loads.
		  
		  #if TargetCocoa then
		    declare function mainFrameURL lib CocoaLib selector "mainFrameURL" (obj_id as Integer) as CFStringRef
		    
		    return mainFrameURL(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MainFrameURL(extends v as HTMLViewer, Assigns URLString as String)
		  //# Sets the URL that the main frame loads.
		  
		  #if TargetCocoa then
		    declare sub setMainFrameURL lib CocoaLib selector "setMainFrameURL:" (obj_id as Integer, URLString as CFStringRef)
		    
		    setMainFrameURL(v.Handle, URLString)
		  #else
		    #pragma Unused v
		    #pragma Unused URLString
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MaintainsBackForwardList(extends v as HTMLViewer, flag as Boolean)
		  //# Sets whether to use a back-forward list.
		  
		  #if TargetCocoa then
		    declare sub setMaintainsBackForwardList lib CocoaLib selector "setMaintainsBackForwardList:" (obj_id as Integer, inFlag as Boolean)
		    
		    setMaintainsBackForwardList(v.Handle, flag)
		  #else
		    #pragma Unused v
		    #pragma Unused flag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaintainsInactiveSelection(extends v as HTMLViewer) As Boolean
		  //# Returns whether the selection is maintained when focus is lost.
		  
		  #if TargetCocoa then
		    declare function maintainsInactiveSelection lib CocoaLib selector "maintainsInactiveSelection" (obj_id as Integer) as Boolean
		    
		    return maintainsInactiveSelection(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeTextLarger(extends v as HTMLViewer)
		  //# Action method that increases the text size by one unit.
		  
		  #if TargetCocoa then
		    declare sub makeTextLarger lib CocoaLib selector "makeTextLarger:" (obj_id as Integer, sender as Integer)
		    
		    makeTextLarger(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeTextSmaller(extends v as HTMLViewer)
		  //# Action method that reduces the text size by one unit.
		  
		  #if TargetCocoa then
		    declare sub makeTextSmaller lib CocoaLib selector "makeTextSmaller:" (obj_id as Integer, sender as Integer)
		    
		    makeTextSmaller(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeTextStandardSize(extends v as HTMLViewer)
		  //# Resets the text size to a multiple of 1.
		  
		  #if TargetCocoa then
		    declare sub makeTextStandardSize lib CocoaLib selector "makeTextStandardSize:" (obj_id as Integer, sender as Integer)
		    
		    makeTextStandardSize(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MediaStyle(extends v as HTMLViewer) As String
		  //# Returns the HTMLViewer’s CSS media property.
		  
		  #if TargetCocoa then
		    declare function mediaStyle lib CocoaLib selector "mediaStyle" (obj_id as Integer) as CFStringRef
		    
		    return mediaStyle(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MediaStyle(extends v as HTMLViewer, Assigns mediaStyle as String)
		  //# Sets the HTMLViewer’s CSS media property.
		  
		  #if TargetCocoa then
		    declare sub setMediaStyle lib CocoaLib selector "setMediaStyle:" (obj_id as Integer, mediaStyle as CFStringRef)
		    
		    setMediaStyle(v.Handle, mediaStyle)
		  #else
		    #pragma Unused v
		    #pragma Unused mediaStyle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveDragCaretToPoint(extends v as HTMLViewer, x as Double, y as Double)
		  //# Moves the drag caret that indicates the destination of a drag operation to a given point.
		  
		  #if TargetCocoa then
		    dim point as Cocoa.NSPoint
		    point.x = x
		    point.y = y
		    
		    declare sub moveDragCaretToPoint lib CocoaLib selector "moveDragCaretToPoint:" (obj_id as Integer, point as Cocoa.NSPoint)
		    
		    moveDragCaretToPoint(v.handle, point)
		  #else
		    #pragma Unused v
		    #pragma Unused x
		    #pragma Unused y
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToBeginningOfSentence(extends v as HTMLViewer)
		  //# Moves the insertion point to the beginning of the current sentence.
		  
		  #if TargetCocoa then
		    declare sub moveToBeginningOfSentence lib CocoaLib selector "moveToBeginningOfSentence:" (obj_id as Integer, sender as Integer)
		    
		    moveToBeginningOfSentence(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToBeginningOfSentenceAndModifySelection(extends v as HTMLViewer)
		  //# Moves the insertion point and extends the selection to the beginning of the current sentence.
		  
		  #if TargetCocoa then
		    declare sub moveToBeginningOfSentenceAndModifySelection lib CocoaLib selector "moveToBeginningOfSentenceAndModifySelection:" (obj_id as Integer, sender as Integer)
		    
		    moveToBeginningOfSentenceAndModifySelection(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToEndOfSentence(extends v as HTMLViewer)
		  //# Moves the insertion point to the end of the current sentence.
		  
		  #if TargetCocoa then
		    declare sub moveToEndOfSentence lib CocoaLib selector "moveToEndOfSentence:" (obj_id as Integer, sender as Integer)
		    
		    moveToEndOfSentence(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToEndOfSentenceAndModifySelection(extends v as HTMLViewer)
		  //# Moves the insertion point and extends the selection to the end of the current sentence.
		  
		  #if TargetCocoa then
		    declare sub moveToEndOfSentenceAndModifySelection lib CocoaLib selector "moveToEndOfSentenceAndModifySelection:" (obj_id as Integer, sender as Integer)
		    
		    moveToEndOfSentenceAndModifySelection(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste(extends v as HTMLViewer)
		  //# An action method that pastes content from the pasteboard at the insertion point or over the selection.
		  
		  #if TargetCocoa then
		    declare sub paste lib CocoaLib selector "paste:" (obj_id as Integer, sender as Integer)
		    
		    paste(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PasteAsPlainText(extends v as HTMLViewer)
		  //# An action method that pastes pasteboard content as plain text.
		  
		  #if TargetCocoa then
		    declare sub pasteAsPlainText lib CocoaLib selector "pasteAsPlainText:" (obj_id as Integer, sender as Integer)
		    
		    pasteAsPlainText(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PasteAsRichText(extends v as HTMLViewer)
		  //# An action method that pastes pasteboard content into the HTMLViewer as rich text, maintaining its attributes.
		  
		  #if TargetCocoa then
		    declare sub pasteAsRichText lib CocoaLib selector "pasteAsRichText:" (obj_id as Integer, sender as Integer)
		    
		    pasteAsRichText(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PasteFont(extends v as HTMLViewer)
		  //# An action method that pastes font information from the font pasteboard.
		  
		  #if TargetCocoa then
		    declare sub pasteFont lib CocoaLib selector "pasteFont:" (obj_id as Integer, sender as Integer)
		    
		    pasteFont(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformFindPanelAction(extends v as HTMLViewer)
		  //# An action method that opens the Find menu and Find panel.
		  
		  #if TargetCocoa then
		    declare sub performFindPanelAction lib CocoaLib selector "performFindPanelAction:" (obj_id as Integer, sender as Integer)
		    
		    performFindPanelAction(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreferencesIdentifier(extends v as HTMLViewer) As String
		  //# Returns the identifier of the HTMLViewer’s preferences.
		  
		  #if TargetCocoa then
		    declare function preferencesIdentifier lib CocoaLib selector "preferencesIdentifier" (obj_id as Integer) as CFStringRef
		    
		    return preferencesIdentifier(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreferencesIdentifier(extends v as HTMLViewer, Assigns anIdentifier as String)
		  //# Sets the HTMLViewer's preferences identifier, creating a preferences object if needed.
		  
		  #if TargetCocoa then
		    declare sub setPreferencesIdentifier lib CocoaLib selector "setPreferencesIdentifier:" (obj_id as Integer, anIdentifier as CFStringRef)
		    
		    setPreferencesIdentifier(v.Handle, anIdentifier)
		  #else
		    #pragma Unused v
		    #pragma Unused anIdentifier
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload(extends v as HTMLViewer)
		  //# Reloads the current page.
		  
		  #if TargetCocoa then
		    declare sub reload lib CocoaLib selector "reload:" (obj_id as Integer, sender as Integer)
		    
		    reload(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadFromOrigin(extends v as HTMLViewer)
		  //# Action method that performs an end-to-end revalidation using cache-validating conditionals if possible.
		  
		  #if TargetCocoa then
		    declare sub reloadFromOrigin lib CocoaLib selector "reloadFromOrigin:" (obj_id as Integer, sender as Integer)
		    
		    reloadFromOrigin(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveDragCaret(extends v as HTMLViewer)
		  //# Removes the drag caret that indicates the destination of a drag operation.
		  
		  #if TargetCocoa then
		    declare sub removeDragCaret lib CocoaLib selector "removeDragCaret" (obj_id as Integer)
		    
		    removeDragCaret(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceSelectionWithMarkupString(extends v as HTMLViewer, markupString as String)
		  //# Replaces the current selection with mixed text and markup.
		  
		  #if TargetCocoa then
		    declare sub replaceSelectionWithMarkupString lib CocoaLib selector "replaceSelectionWithMarkupString:" (obj_id as Integer, markupString as CFStringRef)
		    
		    replaceSelectionWithMarkupString(v.Handle, markupString)
		  #else
		    #pragma Unused v
		    #pragma Unused markupString
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceSelectionWithText(extends v as HTMLViewer, text as String)
		  //# Replaces the current selection with a string of text.
		  
		  #if TargetCocoa then
		    declare sub replaceSelectionWithText lib CocoaLib selector "replaceSelectionWithText:" (obj_id as Integer, text as CFStringRef)
		    
		    replaceSelectionWithText(v.Handle, text)
		  #else
		    #pragma Unused v
		    #pragma Unused text
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SearchFor(extends v as HTMLViewer, text as String, forward as Boolean, caseSensitive as Boolean, wrap as Boolean) As Boolean
		  //# Searches a document view for a string and highlights it if it is found.
		  
		  #if TargetCocoa then
		    declare function searchFor lib CocoaLib selector "searchFor:direction:caseSensitive:wrap:" (obj_id as Integer, inText as CFStringRef, inForward as Boolean, inCaseSensitive as Boolean, inWrap as Boolean) as Boolean
		    
		    return searchFor(v.Handle, text, forward, caseSensitive, wrap)
		  #else
		    #pragma Unused v
		    #pragma Unused text
		    #pragma Unused forward
		    #pragma Unused caseSensitive
		    #pragma Unused wrap
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectSentence(extends v as HTMLViewer)
		  //# Selects the entire sentence around the insertion point.
		  
		  #if TargetCocoa then
		    declare sub selectSentence lib CocoaLib selector "selectSentence:" (obj_id as Integer, sender as Integer)
		    
		    selectSentence(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShouldCloseWithWindow(extends v as HTMLViewer) As Boolean
		  //# Returns whether the web view should close when its window or host window closes.
		  
		  #if TargetCocoa then
		    declare function shouldCloseWithWindow lib CocoaLib selector "shouldCloseWithWindow" (obj_id as Integer) as Boolean
		    
		    return shouldCloseWithWindow(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShouldCloseWithWindow(extends v as HTMLViewer, Assigns flag as Boolean)
		  //# Sets whether the web view should close when its window or host window closes.
		  
		  #if TargetCocoa then
		    declare sub setShouldCloseWithWindow lib CocoaLib selector "setShouldCloseWithWindow:" (obj_id as Integer, flag as Boolean)
		    
		    setShouldCloseWithWindow(v.Handle, flag)
		  #else
		    #pragma Unused v
		    #pragma Unused flag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShouldUpdateWhileOffscreen(extends v as HTMLViewer) As Boolean
		  //# Returns whether the web view should update even when it is not visible.
		  
		  #if TargetCocoa then
		    if IsSnowLeopard then
		      declare function shouldUpdateWhileOffscreen lib CocoaLib selector "shouldUpdateWhileOffscreen" (obj_id as Integer) as Boolean
		      
		      return shouldUpdateWhileOffscreen(v.Handle)
		    end if
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShouldUpdateWhileOffscreen(extends v as HTMLViewer, Assigns flag as Boolean)
		  //# Sets whether the web view should update even when it is not in a window that is currently visible.
		  
		  #if TargetCocoa then
		    if IsSnowLeopard then
		      declare sub setShouldUpdateWhileOffscreen lib CocoaLib selector "setShouldUpdateWhileOffscreen:" (obj_id as Integer, flag as Boolean)
		      
		      setShouldUpdateWhileOffscreen(v.Handle, flag)
		    end if
		  #else
		    #pragma Unused v
		    #pragma Unused flag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowGuessPanel(extends v as HTMLViewer)
		  //# An action method that shows a spelling correction panel.
		  
		  #if TargetCocoa then
		    declare sub showGuessPanel lib CocoaLib selector "showGuessPanel:" (obj_id as Integer, sender as Integer)
		    
		    showGuessPanel(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SmartInsertDeleteEnabled(extends v as HTMLViewer) As Boolean
		  //# Returns whether smart-space insertion and deletion is enabled.
		  
		  #if TargetCocoa then
		    declare function smartInsertDeleteEnabled lib CocoaLib selector "smartInsertDeleteEnabled" (obj_id as Integer) as Boolean
		    
		    return smartInsertDeleteEnabled(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SmartInsertDeleteEnabled(extends v as HTMLViewer, Assigns flag as Boolean)
		  //# Sets whether the HTMLViewer should insert or delete spaces around selected words to preserve proper spacing and punctuation.
		  
		  #if TargetCocoa then
		    declare sub setSmartInsertDeleteEnabled lib CocoaLib selector "setSmartInsertDeleteEnabled:" (obj_id as Integer, flag as Boolean)
		    
		    setSmartInsertDeleteEnabled(v.Handle, flag)
		  #else
		    #pragma Unused v
		    #pragma Unused flag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SpellCheckerDocumentTag(extends v as HTMLViewer) As Integer
		  //# Returns the spell-checker document tag for this document.
		  
		  #if TargetCocoa then
		    declare function spellCheckerDocumentTag lib CocoaLib selector "spellCheckerDocumentTag" (obj_id as Integer) as Integer
		    
		    return spellCheckerDocumentTag(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartSpeaking(extends v as HTMLViewer)
		  //# An action method that starts speaking the selected text or all text if there’s no selection.
		  
		  #if TargetCocoa then
		    declare sub startSpeaking lib CocoaLib selector "startSpeaking:" (obj_id as Integer, sender as Integer)
		    
		    startSpeaking(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopLoading(extends v as HTMLViewer)
		  //# An action method that stops the loading of any web frame content managed by the HTMLViewer.
		  
		  #if TargetCocoa then
		    declare sub stopLoading lib CocoaLib selector "stopLoading:" (obj_id as Integer, sender as Integer)
		    
		    stopLoading(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSpeaking(extends v as HTMLViewer)
		  //# An action method that stops speaking that is in progress.
		  
		  #if TargetCocoa then
		    declare sub stopSpeaking lib CocoaLib selector "stopSpeaking:" (obj_id as Integer, sender as Integer)
		    
		    stopSpeaking(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsTextEncoding(extends v as HTMLViewer) As Boolean
		  //# Returns a Boolean value that indicates whether the web document supports text encoding.
		  
		  #if TargetCocoa then
		    declare function supportsTextEncoding lib CocoaLib selector "supportsTextEncoding" (obj_id as Integer) as Boolean
		    
		    return supportsTextEncoding(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextSizeMultiplier(extends v as HTMLViewer) As Double
		  //# Returns the font size multiplier for text displayed in web frame view objects managed by the HTMLViewer.
		  
		  #if TargetCocoa then
		    declare function textSizeMultiplier lib CocoaLib selector "textSizeMultiplier" (obj_id as Integer) as Double
		    
		    return textSizeMultiplier(v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextSizeMultiplier(extends v as HTMLViewer, Assigns multiplier as Double)
		  //# Change the font size multiplier for text displayed in web frame view objects managed by the HTMLViewer.
		  
		  #if TargetCocoa then
		    declare sub setTextSizeMultiplier lib CocoaLib selector "setTextSizeMultiplier:" (obj_id as Integer, multiplier as Double)
		    
		    setTextSizeMultiplier(v.Handle, multiplier)
		  #else
		    #pragma Unused v
		    #pragma Unused multiplier
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleContinuousSpellChecking(extends v as HTMLViewer)
		  //# Toggles whether continuous spell checking is available.
		  
		  #if TargetCocoa then
		    declare sub toggleContinuousSpellChecking lib CocoaLib selector "toggleContinuousSpellChecking:" (obj_id as Integer, sender as Integer)
		    
		    toggleContinuousSpellChecking(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleSmartInsertDelete(extends v as HTMLViewer)
		  //# Toggles whether spaces around selected words are inserted or deleted to preserve proper spacing and punctuation.
		  
		  #if TargetCocoa then
		    declare sub toggleSmartInsertDelete lib CocoaLib selector "toggleSmartInsertDelete:" (obj_id as Integer, sender as Integer)
		    
		    toggleSmartInsertDelete(v.Handle, v.Handle)
		  #else
		    #pragma Unused v
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserAgentForURL(extends v as HTMLViewer, URL as String) As String
		  //# Returns the appropriate user-agent string for a given URL.
		  
		  #if TargetCocoa then
		    declare function userAgentForURL lib CocoaLib selector "userAgentForURL:" (obj_id as Integer, URL as Ptr) as CFStringRef
		    declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    declare function alloc lib CocoaLib selector "alloc" (classRef as Ptr) as Ptr
		    declare function initWithString lib CocoaLib selector "initWithString:" (id as Ptr, URLString as CFStringRef) as Ptr
		    
		    dim url_id as Ptr = initWithString(alloc(NSClassFromString("NSURL")), URL)
		    
		    dim ret as String = userAgentForURL(v.Handle, url_id)
		    
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    release url_id
		    
		    return ret
		  #else
		    #pragma Unused v
		    #pragma Unused URL
		  #endif
		End Function
	#tag EndMethod


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

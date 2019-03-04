#tag Module
Protected Module TextAreaExtension
	#tag Method, Flags = &h0
		Sub AlignJustified(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub alignJustified lib CocoaLib selector "alignJustified:" (obj_id as Ptr, sender as Ptr)
		    
		    alignJustified(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutomaticDashSubstitutionEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isAutomaticDashSubstitutionEnabled lib CocoaLib selector "isAutomaticDashSubstitutionEnabled" (obj_id as Ptr) as Boolean
		    
		    return isAutomaticDashSubstitutionEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutomaticDashSubstitutionEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setAutomaticDashSubstitutionEnabled lib CocoaLib selector "setAutomaticDashSubstitutionEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setAutomaticDashSubstitutionEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutomaticDataDetectionEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isAutomaticDataDetectionEnabled lib CocoaLib selector "isAutomaticDataDetectionEnabled" (obj_id as Ptr) as Boolean
		    
		    return isAutomaticDataDetectionEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutomaticDataDetectionEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setAutomaticDataDetectionEnabled lib CocoaLib selector "setAutomaticDataDetectionEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setAutomaticDataDetectionEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutomaticLinkDetectionEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isAutomaticLinkDetectionEnabled lib CocoaLib selector "isAutomaticLinkDetectionEnabled" (obj_id as Ptr) as Boolean
		    
		    return isAutomaticLinkDetectionEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutomaticLinkDetectionEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setAutomaticLinkDetectionEnabled lib CocoaLib selector "setAutomaticLinkDetectionEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setAutomaticLinkDetectionEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutomaticQuoteSubstitutionEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isAutomaticQuoteSubstitutionEnabled lib CocoaLib selector "isAutomaticQuoteSubstitutionEnabled" (obj_id as Ptr) as Boolean
		    
		    return isAutomaticQuoteSubstitutionEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutomaticQuoteSubstitutionEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setAutomaticQuoteSubstitutionEnabled lib CocoaLib selector "setAutomaticQuoteSubstitutionEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setAutomaticQuoteSubstitutionEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutomaticSpellingCorrectionEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isAutomaticSpellingCorrectionEnabled lib CocoaLib selector "isAutomaticSpellingCorrectionEnabled" (obj_id as Ptr) as Boolean
		    
		    return isAutomaticSpellingCorrectionEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutomaticSpellingCorrectionEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setAutomaticSpellingCorrectionEnabled lib CocoaLib selector "setAutomaticSpellingCorrectionEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setAutomaticSpellingCorrectionEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutomaticTextReplacementEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isAutomaticTextReplacementEnabled lib CocoaLib selector "isAutomaticTextReplacementEnabled" (obj_id as Ptr) as Boolean
		    
		    return isAutomaticTextReplacementEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutomaticTextReplacementEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setAutomaticTextReplacementEnabled lib CocoaLib selector "setAutomaticTextReplacementEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setAutomaticTextReplacementEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bold(extends t as TextArea, offset as Integer, length as Integer) As Boolean
		  #if targetMacOS
		    declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    declare function length_ lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    
		    dim attributedText as Ptr = textStorage(t.TextViewRef)
		    dim selectionRange as Cocoa.NSRange
		    selectionRange.location = offset
		    selectionRange.length = Max(Min(length, length_(attributedText) - offset), 0)
		    dim aRange as Cocoa.NSRange
		    #pragma unused aRange
		    if selectionRange.length > 0 then
		      return selectionHasTrait(attributedText, NSBoldFontMask, selectionRange)
		    else
		      return insertionHasTrait(t.TextViewRef, NSBoldFontMask)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bold(extends t as TextArea, offset as Integer, length as Integer, assigns value as Boolean)
		  #if targetMacOS
		    declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    declare function length_ lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    declare sub applyFontTraits lib "Cocoa.framework" selector "applyFontTraits:range:" (obj_id as Ptr, mask as int32, aRange as Cocoa.NSRange)
		    
		    
		    dim text as Ptr = textStorage(t.TextViewRef)
		    dim traitMask as Integer
		    if value then
		      traitMask = NSBoldFontMask
		    else
		      traitMask = NSUnboldFontMask
		    end if
		    
		    dim range as Cocoa.NSRange
		    range.location = offset
		    range.length = Max(Min(length, length_(text) - offset), 0)
		    if range.length > 0 then
		      applyFontTraits(text, traitMask, range)
		    else
		      setInsertionTrait(t.TextViewRef, traitMask)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BreakUndoCoalescing(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub breakUndoCoalescing lib CocoaLib selector "breakUndoCoalescing" (obj_id as Ptr)
		    
		    breakUndoCoalescing(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Complete(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub complete lib CocoaLib selector "complete:" (obj_id as Ptr, sender as Ptr)
		    
		    complete(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContinuousSpellCheckingEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isContinuousSpellCheckingEnabled lib CocoaLib selector "isContinuousSpellCheckingEnabled" (obj_id as Ptr) as Boolean
		    
		    return isContinuousSpellCheckingEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContinuousSpellCheckingEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setContinuousSpellCheckingEnabled lib CocoaLib selector "setContinuousSpellCheckingEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setContinuousSpellCheckingEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFont(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub copyFont lib CocoaLib selector "copyFont:" (obj_id as Ptr, sender as Ptr)
		    
		    copyFont(t.TextViewRef, t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyRuler(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub copyRuler lib CocoaLib selector "copyRuler:" (obj_id as Ptr, sender as Ptr)
		    
		    copyRuler(t.TextViewRef, t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplaysLinkToolTips(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function displaysLinkToolTips lib CocoaLib selector "displaysLinkToolTips" (obj_id as Ptr) as Boolean
		    
		    return displaysLinkToolTips(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplaysLinkToolTips(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setDisplaysLinkToolTips lib CocoaLib selector "setDisplaysLinkToolTips:" (obj_id as Ptr, value as Boolean)
		    
		    setDisplaysLinkToolTips(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawsBackground(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function drawsBackground lib CocoaLib selector "drawsBackground" (obj_id as Ptr) as Boolean
		    
		    return drawsBackground(Ptr(t.handle)) and drawsBackground(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawsBackground(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setDrawsBackground lib CocoaLib selector "setDrawsBackground:" (obj_id as Ptr, value as Boolean)
		    
		    setDrawsBackground(Ptr(t.handle), value)
		    setDrawsBackground(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Editable(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isEditable lib CocoaLib selector "isEditable" (obj_id as Ptr) as Boolean
		    
		    return isEditable(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Editable(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setEditable lib CocoaLib selector "setEditable:" (obj_id as Ptr, value as Boolean)
		    
		    setEditable(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FontBackgroundColor(Extends ta As TextArea, offset As Integer, length As Integer, Assigns value As Color)
		  #if TargetMacOS
		    
		    dim tv as NSTextView = new NSTextView( ta )
		    dim ts as NSTextStorage = tv.TextStorage
		    
		    dim range as Cocoa.NSRange = Cocoa.NSMakeRange( offset, length )
		    call ts.AddAttribute( ts.kNSBackgroundColorAttributeName,value, range )
		    
		  #else
		    
		    #pragma unused ta
		    #pragma unused offset
		    #pragma unused length
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GrammarCheckingEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isGrammarCheckingEnabled lib CocoaLib selector "isGrammarCheckingEnabled" (obj_id as Ptr) as Boolean
		    
		    return isGrammarCheckingEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GrammarCheckingEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setGrammarCheckingEnabled lib CocoaLib selector "setGrammarCheckingEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setGrammarCheckingEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IncrementalSearchingEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isIncrementalSearchingEnabled lib CocoaLib selector "isIncrementalSearchingEnabled" (obj_id as Ptr) as Boolean
		    
		    return isIncrementalSearchingEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncrementalSearchingEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setIncrementalSearchingEnabled lib CocoaLib selector "setIncrementalSearchingEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setIncrementalSearchingEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function insertionHasTrait(textView as Ptr, traitMask as Integer) As Boolean
		  #if targetMacOS
		    declare function typingAttributes lib CocoaLib selector "typingAttributes" (obj_id as Ptr) as Ptr
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (obj_id as Ptr, key as Ptr) as Ptr
		    declare function sharedFontManager lib CocoaLib selector "sharedFontManager" (class_id as Ptr) as Ptr
		    declare function traitsOfFont lib CocoaLib selector "traitsOfFont:" (obj_id as Ptr, font as Ptr) as Integer
		    
		    dim textAttributes as Ptr = typingAttributes(textView)
		    dim font as Ptr = objectForKey(textAttributes, NSFontAttributeName)
		    return (traitsOfFont(sharedFontManager(Cocoa.NSClassFromString("NSFontManager")), font) and traitMask) = traitMask
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertText(extends t as TextArea, aText as String)
		  
		  #if TargetCocoa
		    
		    declare sub insertText lib CocoaLib selector "insertText:" (obj_id as Ptr, aText as CFStringRef)
		    
		    insertText(t.TextViewRef, aText)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused aText
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsCoalescingUndo(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isCoalescingUndo lib CocoaLib selector "isCoalescingUndo" (obj_id as Ptr) as Boolean
		    
		    return isCoalescingUndo(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Italic(extends t as TextArea, offset as Integer, length as Integer) As Boolean
		  #if targetMacOS
		    declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    declare function length_ lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    
		    dim attributedText as Ptr = textStorage(t.TextViewRef)
		    dim selectionRange as Cocoa.NSRange
		    selectionRange.location = offset
		    selectionRange.length = Max(Min(length, length_(attributedText) - offset), 0)
		    dim aRange as Cocoa.NSRange
		    #pragma unused aRange
		    if selectionRange.length > 0 then
		      return selectionHasTrait(attributedText, NSItalicFontMask, selectionRange)
		    else
		      return insertionHasTrait(t.TextViewRef, NSItalicFontMask)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Italic(extends t as TextArea, offset as Integer, length as Integer, assigns value as Boolean)
		  #if targetMacOS
		    declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    declare function length_ lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    declare sub applyFontTraits lib "Cocoa.framework" selector "applyFontTraits:range:" (obj_id as Ptr, mask as int32, aRange as Cocoa.NSRange)
		    
		    
		    dim text as Ptr = textStorage(t.TextViewRef)
		    dim traitMask as Integer
		    if value then
		      traitMask = NSItalicFontMask
		    else
		      traitMask = NSUnitalicFontMask
		    end if
		    
		    dim range as Cocoa.NSRange
		    range.location = offset
		    range.length = Max(Min(length, length_(text) - offset), 0)
		    if range.length > 0 then
		      applyFontTraits(text, traitMask, range)
		    else
		      setInsertionTrait(t.TextViewRef, traitMask)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoosenKerning(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub loosenKerning lib CocoaLib selector "loosenKerning:" (obj_id as Ptr, sender as Ptr)
		    
		    loosenKerning(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LowerBaseline(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub lowerBaseline lib CocoaLib selector "lowerBaseline:" (obj_id as Ptr, sender as Ptr)
		    
		    lowerBaseline(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NSFontAttributeName() As Ptr
		  //NSFontAttributeName returns an NSString id.
		  
		  dim mainBundle as CFBundle = CFBundle.NewCFBundleFromID("com.apple.Cocoa")
		  dim p as Ptr = mainBundle.DataPointerNotRetained("NSFontAttributeName")
		  if p <> nil then
		    return p.Ptr(0)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontLinkPanel(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub orderFrontLinkPanel lib CocoaLib selector "orderFrontLinkPanel:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFrontLinkPanel(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontListPanel(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub orderFrontListPanel lib CocoaLib selector "orderFrontListPanel:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFrontListPanel(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontSpacingPanel(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub orderFrontSpacingPanel lib CocoaLib selector "orderFrontSpacingPanel:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFrontSpacingPanel(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontSubstitutionsPanel(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub orderFrontSubstitutionsPanel lib CocoaLib selector "orderFrontSubstitutionsPanel:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFrontSubstitutionsPanel(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrderFrontTablePanel(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub orderFrontTablePanel lib CocoaLib selector "orderFrontTablePanel:" (obj_id as Ptr, sender as Ptr)
		    
		    orderFrontTablePanel(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PasteAsPlainText(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub pasteAsPlainText lib CocoaLib selector "pasteAsPlainText:" (obj_id as Ptr, sender as Ptr)
		    
		    pasteAsPlainText(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PasteAsRichText(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub pasteAsRichText lib CocoaLib selector "pasteAsRichText:" (obj_id as Ptr, sender as Ptr)
		    
		    pasteAsRichText(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PasteFont(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub pasteFont lib CocoaLib selector "pasteFont:" (obj_id as Ptr, sender as Ptr)
		    
		    pasteFont(t.TextViewRef, t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PasteRuler(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub pasteRuler lib CocoaLib selector "pasteRuler:" (obj_id as Ptr, sender as Ptr)
		    
		    pasteRuler(t.TextViewRef, t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RaiseBaseline(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub raiseBaseline lib CocoaLib selector "raiseBaseline:" (obj_id as Ptr, sender as Ptr)
		    
		    raiseBaseline(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadRTFDFromFile(extends t as TextArea, path as String) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function readRTFDFromFile lib CocoaLib selector "readRTFDFromFile:" (obj_id as Ptr, path as CFStringRef) as Boolean
		    
		    return readRTFDFromFile(t.TextViewRef, path)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused path
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllFontBackgroundColor(Extends ta As TextArea)
		  #if TargetCocoa
		    
		    dim tv as NSTextView = new NSTextView( ta )
		    dim ts as NSTextStorage = tv.TextStorage
		    
		    // Remove any existing color
		    call ts.RemoveAttribute( ts.kNSBackgroundColorAttributeName )
		    
		    // Reset the color when typing in the field
		    dim dict as new NSMutableDictionary( tv.TypingAttributes.MutableCopy, NSObject.hasOwnership )
		    dict.Value(new NSString("NSBackgroundColor")) = NSColor.TextBackgroundColor
		    tv.TypingAttributes = dict
		    
		  #else
		    
		    #pragma unused ta
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RichText(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function isRichText lib CocoaLib selector "isRichText" (obj_id as Ptr) as Boolean
		    
		    return isRichText(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RichText(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setRichText lib CocoaLib selector "setRichText:" (obj_id as Ptr, value as Boolean)
		    
		    setRichText t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RTFValue(extends t as TextArea) As String
		  #if targetCocoa
		    declare function RTFFromRange lib CocoaLib selector "RTFFromRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Ptr
		    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    declare sub getBytes lib CocoaLib selector "getBytes:length:" (obj_id as Ptr, buffer as Ptr, length as Integer)
		    
		    dim range as Cocoa.NSRange
		    range.length = Len(t.Text)
		    dim p as Ptr = RTFFromRange(t.TextViewRef, range)
		    if p <> nil then
		      dim m as new MemoryBlock(length(p))
		      getBytes(p, m, m.Size)
		      return m.StringValue(0, m.Size)
		    else
		      return ""
		    end if
		    
		  #else
		    #pragma unused t
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RTFValue(extends t as TextArea, assigns value as String)
		  #if targetCocoa
		    declare function dataWithBytes lib CocoaLib selector "dataWithBytes:length:" (class_id as Ptr, bytes as CString, length as Integer) as Ptr
		    declare sub replaceCharactersInRange lib CocoaLib selector "replaceCharactersInRange:withRTF:" (obj_id as Ptr, range as Cocoa.NSRange, rtfData as Ptr)
		    
		    //factory methods like dataWithBytes return a autoreleased object, so it should not be released.
		    dim data as Ptr = dataWithBytes(Cocoa.NSClassFromString("NSData"), value, LenB(value))
		    dim range as Cocoa.NSRange
		    range.length = Len(t.Text)
		    replaceCharactersInRange(t.TextViewRef, range, data)
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RulerVisible(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isRulerVisible lib CocoaLib selector "isRulerVisible" (obj_id as Ptr) as Boolean
		    
		    return isRulerVisible(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RulerVisible(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setRulerVisible lib CocoaLib selector "setRulerVisible:" (obj_id as Ptr, value as Boolean)
		    
		    setRulerVisible(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Selectable(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isSelectable lib CocoaLib selector "isSelectable" (obj_id as Ptr) as Boolean
		    
		    return isSelectable(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Selectable(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setSelectable lib CocoaLib selector "setSelectable:" (obj_id as Ptr, value as Boolean)
		    
		    setSelectable(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function selectionHasTrait(attributedText as Ptr, traitMask as Integer, selectionRange as Cocoa.NSRange) As Boolean
		  //note that selectionRange.length is assumed to be > 0.
		  
		  #if targetMacOS
		    declare function attributeAtIndex lib CocoaLib selector "attribute:atIndex:longestEffectiveRange:inRange:" (obj_id as Ptr, attributeName as Ptr, index as Integer, ByRef aRange as Cocoa.NSRange, rangeLimit as Cocoa.NSRange) as Ptr
		    declare function sharedFontManager lib CocoaLib selector "sharedFontManager" (class_id as Ptr) as Ptr
		    declare function traitsOfFont lib CocoaLib selector "traitsOfFont:" (obj_id as Ptr, font as Ptr) as Integer
		    
		    dim aRange as Cocoa.NSRange
		    dim font as Ptr = attributeAtIndex(attributedText, NSFontAttributeName, selectionRange.location, aRange, selectionRange)
		    if font <> nil then
		      dim hasTrait as Boolean = (traitsOfFont(sharedFontManager(Cocoa.NSClassFromString("NSFontManager")), font) and traitMask) = traitMask
		      return hasTrait and (aRange.location = selectionRange.location) and (aRange.length = selectionRange.Length)
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setInsertionTrait(textView as Ptr, traitMask as Integer)
		  #if targetMacOS
		    declare sub setTypingAttributes lib CocoaLib selector "setTypingAttributes:" (obj_id as Ptr, attrs as Ptr)
		    declare function typingAttributes lib CocoaLib selector "typingAttributes" (obj_id as Ptr) as Ptr
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (obj_id as Ptr, key as Ptr) as Ptr
		    declare sub setObjectForKey lib Cocoalib selector "setObject:forKey:" (id as Ptr, value as Ptr, key as Ptr)
		    declare function convertFont lib CocoaLib selector "convertFont:toHaveTrait:" (id as Ptr, fontid as Ptr, mask as Integer) as Ptr
		    declare function sharedFontManager lib CocoaLib selector "sharedFontManager" (class_id as Ptr) as Ptr
		    declare function mutableCopy lib CocoaLib selector "mutableCopy" (obj_id as Ptr) as Ptr
		    
		    
		    dim textAttributes as Ptr  = typingAttributes(textView)
		    dim font as Ptr = objectForKey(textAttributes, NSFontAttributeName)
		    dim newFont as Ptr = convertFont(sharedFontManager(Cocoa.NSClassFromString("NSFontManager")), font, traitMask)
		    dim newTextAttributes as Ptr = mutableCopy(textAttributes)
		    setObjectForKey(newTextAttributes, newFont, NSFontAttributeName)
		    setTypingAttributes(textView, newTextAttributes)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setSelectionTrait(attributedText as Ptr, traitMask as Integer, range as Cocoa.NSRange)
		  #if targetMacOS
		    declare sub applyFontTraits lib CocoaLib selector "applyFontTraits:range:" (obj_id as Ptr, mask as int32, aRange as Cocoa.NSRange)
		    declare sub beginEditing lib CocoaLib selector "beginEditing" (obj_id as Ptr)
		    declare sub endEditing lib CocoaLib selector "endEditing" (obj_id as Ptr)
		    
		    beginEditing(attributedText)
		    applyFontTraits(attributedText, traitMask, range)
		    endEditing(attributedText)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowRuler(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function isRulerVisible lib CocoaLib selector "isRulerVisible" (obj_id as Ptr) as Boolean
		    
		    return isRulerVisible(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowRuler(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setRulerVisible lib CocoaLib selector "setRulerVisible:"  (obj_id as Ptr, value as Boolean)
		    
		    setRulerVisible t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SmartInsertDeleteEnabled(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function smartInsertDeleteEnabled lib CocoaLib selector "smartInsertDeleteEnabled" (obj_id as Ptr) as Boolean
		    
		    return smartInsertDeleteEnabled(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SmartInsertDeleteEnabled(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setSmartInsertDeleteEnabled lib CocoaLib selector "setSmartInsertDeleteEnabled:" (obj_id as Ptr, value as Boolean)
		    
		    setSmartInsertDeleteEnabled(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartSpeaking(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub startSpeaking lib CocoaLib selector "startSpeaking:" (obj_id as Ptr, sender as Ptr)
		    
		    startSpeaking(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSpeaking(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub stopSpeaking lib CocoaLib selector "stopSpeaking:" (obj_id as Ptr, sender as Ptr)
		    
		    stopSpeaking(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextViewRef(extends t as TextArea) As Ptr
		  #if targetCocoa
		    declare function documentView lib CocoaLib selector "documentView" (obj_id as Integer) as Ptr
		    
		    return documentView(t.Handle)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TightenKerning(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub tightenKerning lib CocoaLib selector "tightenKerning:" (obj_id as Ptr, sender as Ptr)
		    
		    tightenKerning(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleAutomaticDashSubstitution(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleAutomaticDashSubstitution lib CocoaLib selector "toggleAutomaticDashSubstitution:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleAutomaticDashSubstitution(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleAutomaticDataDetection(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleAutomaticDataDetection lib CocoaLib selector "toggleAutomaticDataDetection:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleAutomaticDataDetection(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleAutomaticLinkDetection(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleAutomaticLinkDetection lib CocoaLib selector "toggleAutomaticLinkDetection:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleAutomaticLinkDetection(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleAutomaticQuoteSubstitution(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleAutomaticQuoteSubstitution lib CocoaLib selector "toggleAutomaticQuoteSubstitution:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleAutomaticQuoteSubstitution(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleAutomaticSpellingCorrection(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleAutomaticSpellingCorrection lib CocoaLib selector "toggleAutomaticSpellingCorrection:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleAutomaticSpellingCorrection(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleAutomaticTextReplacement(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleAutomaticTextReplacement lib CocoaLib selector "toggleAutomaticTextReplacement:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleAutomaticTextReplacement(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleContinuousSpellChecking(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleContinuousSpellChecking lib CocoaLib selector "toggleContinuousSpellChecking:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleContinuousSpellChecking(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleGrammarChecking(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleGrammarChecking lib CocoaLib selector "toggleGrammarChecking:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleGrammarChecking(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleRuler(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleRuler lib CocoaLib selector "toggleRuler:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleRuler(t.TextViewRef, t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleSmartInsertDelete(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleSmartInsertDelete lib CocoaLib selector "toggleSmartInsertDelete:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleSmartInsertDelete(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleTraditionalCharacterShape(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub toggleTraditionalCharacterShape lib CocoaLib selector "toggleTraditionalCharacterShape:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleTraditionalCharacterShape(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TurnOffKerning(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub turnOffKerning lib CocoaLib selector "turnOffKerning:" (obj_id as Ptr, sender as Ptr)
		    
		    turnOffKerning(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TurnOffLigatures(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub turnOffLigatures lib CocoaLib selector "turnOffLigatures:" (obj_id as Ptr, sender as Ptr)
		    
		    turnOffLigatures(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseAllLigatures(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub useAllLigatures lib CocoaLib selector "useAllLigatures:" (obj_id as Ptr, sender as Ptr)
		    
		    useAllLigatures(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseFindPanel(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesFindPanel lib CocoaLib selector "usesFindPanel" (obj_id as Ptr) as Boolean
		    
		    return usesFindPanel(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseFindPanel(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesFindPanel lib CocoaLib selector "setUsesFindPanel:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFindPanel t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseFontPanel(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesFontPanel lib CocoaLib selector "usesFontPanel" (obj_id as Ptr) as Boolean
		    
		    return usesFontPanel(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseFontPanel(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesFontPanel lib CocoaLib selector "setUsesFontPanel:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFontPanel t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseRuler(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesRuler lib CocoaLib selector "usesRuler" (obj_id as Ptr) as Boolean
		    
		    return usesRuler(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseRuler(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesRuler lib CocoaLib selector "setUsesRuler:"  (obj_id as Ptr, value as Boolean)
		    
		    setUsesRuler t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UsesFindBar(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function usesFindBar lib CocoaLib selector "usesFindBar" (obj_id as Ptr) as Boolean
		    
		    return usesFindBar(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UsesFindBar(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setUsesFindBar lib CocoaLib selector "setUsesFindBar:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFindBar(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UsesFindPanel(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function usesFindPanel lib CocoaLib selector "usesFindPanel" (obj_id as Ptr) as Boolean
		    
		    return usesFindPanel(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UsesFindPanel(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setUsesFindPanel lib CocoaLib selector "setUsesFindPanel:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFindPanel(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UsesFontPanel(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function usesFontPanel lib CocoaLib selector "usesFontPanel" (obj_id as Ptr) as Boolean
		    
		    return usesFontPanel(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UsesFontPanel(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setUsesFontPanel lib CocoaLib selector "setUsesFontPanel:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFontPanel(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UsesInspectorBar(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function usesInspectorBar lib CocoaLib selector "usesInspectorBar" (obj_id as Ptr) as Boolean
		    
		    return usesInspectorBar(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UsesInspectorBar(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setUsesInspectorBar lib CocoaLib selector "setUsesInspectorBar:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesInspectorBar(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UsesRuler(extends t as TextArea) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function usesRuler lib CocoaLib selector "usesRuler" (obj_id as Ptr) as Boolean
		    
		    return usesRuler(t.TextViewRef)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UsesRuler(extends t as TextArea, assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setUsesRuler lib CocoaLib selector "setUsesRuler:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesRuler(t.TextViewRef, value)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseStandardKerning(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub useStandardKerning lib CocoaLib selector "useStandardKerning:" (obj_id as Ptr, sender as Ptr)
		    
		    useStandardKerning(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseStandardLigatures(extends t as TextArea)
		  
		  #if TargetCocoa
		    
		    declare sub useStandardLigatures lib CocoaLib selector "useStandardLigatures:" (obj_id as Ptr, sender as Ptr)
		    
		    useStandardLigatures(t.TextViewRef, nil)
		    
		  #else
		    
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteRTFDToFile(extends t as TextArea, path as String, atomically as Boolean) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function writeRTFDToFile lib CocoaLib selector "writeRTFDToFile:atomically:" (obj_id as Ptr, path as CFStringRef, atomicFlag as Boolean) as Boolean
		    
		    return writeRTFDToFile(t.TextViewRef, path, atomically)
		    
		  #else
		    
		    #pragma unused t
		    #pragma unused path
		    #pragma unused atomically
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = NSBoldFontMask, Type = Double, Dynamic = False, Default = \"&h00000002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSItalicFontMask, Type = Double, Dynamic = False, Default = \"&h00000001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSUnboldFontMask, Type = Double, Dynamic = False, Default = \"&h00000004", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSUnitalicFontMask, Type = Double, Dynamic = False, Default = \"&h01000000", Scope = Private
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

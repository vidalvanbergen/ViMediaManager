#tag Class
Class NSText
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub AlignCenter()
		  
		  #if TargetMacOS
		    declare sub alignCenter lib CocoaLib selector "alignCenter:" (obj_id as Ptr, sender as Ptr)
		    
		    alignCenter self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub AlignLeft()
		  
		  #if TargetMacOS
		    declare sub alignLeft lib CocoaLib selector "alignLeft:" (obj_id as Ptr, sender as Ptr)
		    
		    alignLeft self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub AlignRight()
		  
		  #if TargetMacOS
		    declare sub alignRight lib CocoaLib selector "alignRight:" (obj_id as Ptr, sender as Ptr)
		    
		    alignRight self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ChangeFont()
		  
		  #if TargetMacOS
		    declare sub changeFont lib CocoaLib selector "changeFont:" (obj_id as Ptr, sender as Ptr)
		    
		    changeFont self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub CheckSpelling()
		  
		  #if TargetMacOS
		    declare sub checkSpelling lib CocoaLib selector "checkSpelling:" (obj_id as Ptr, sender as Ptr)
		    
		    checkSpelling self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Copy()
		  
		  #if TargetMacOS
		    declare sub copy lib CocoaLib selector "copy:" (obj_id as Ptr, sender as Ptr)
		    
		    copy self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub CopyFont()
		  
		  #if TargetMacOS
		    declare sub copyFont lib CocoaLib selector "copyFont:" (obj_id as Ptr, sender as Ptr)
		    
		    copyFont self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub CopyRuler()
		  
		  #if TargetMacOS
		    declare sub copyRuler lib CocoaLib selector "copyRuler:" (obj_id as Ptr, sender as Ptr)
		    
		    copyRuler self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Cut()
		  
		  #if TargetMacOS
		    declare sub cut lib CocoaLib selector "cut:" (obj_id as Ptr, sender as Ptr)
		    
		    cut self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Delete()
		  
		  #if TargetMacOS
		    declare sub delete lib CocoaLib selector "delete:" (obj_id as Ptr, sender as Ptr)
		    
		    delete self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Paste()
		  
		  #if TargetMacOS
		    declare sub paste lib CocoaLib selector "paste:" (obj_id as Ptr, sender as Ptr)
		    
		    paste self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub PasteFont()
		  
		  #if TargetMacOS
		    declare sub pasteFont lib CocoaLib selector "pasteFont:" (obj_id as Ptr, sender as Ptr)
		    
		    pasteFont self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub PasteRuler()
		  
		  #if TargetMacOS
		    declare sub pasteRuler lib CocoaLib selector "pasteRuler:" (obj_id as Ptr, sender as Ptr)
		    
		    pasteRuler self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ReadRTFD(file as FolderItem) As Boolean
		  
		  #if TargetMacOS
		    declare function readRTFDFromFile lib CocoaLib selector "readRTFDFromFile:" (obj_id as Ptr, path as CFStringRef) as Boolean
		    
		    if file <> nil then
		      return readRTFDFromFile(self, file.POSIXPath)
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ReplaceWithRTF(aRange as Cocoa.NSRange, rtfData as NSData)
		  
		  #if TargetMacOS
		    declare sub replaceCharactersInRange lib CocoaLib selector "replaceCharactersInRange:withRTF:" (obj_id as Ptr, aRange as Cocoa.NSRange, rtfData as Ptr)
		    
		    dim dataRef as Ptr
		    if rtfData <> nil then
		      dataRef = rtfData
		    end if
		    
		    replaceCharactersInRange self, aRange, dataRef
		    
		  #else
		    #pragma unused aRange
		    #pragma unused rtfData
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ReplaceWithRTFD(aRange as Cocoa.NSRange, rtfdData as NSData)
		  
		  #if TargetMacOS
		    declare sub replaceCharactersInRange lib CocoaLib selector "replaceCharactersInRange:withRTFD:" (obj_id as Ptr, aRange as Cocoa.NSRange, rtfdData as Ptr)
		    
		    dim dataRef as Ptr
		    if rtfdData <> nil then
		      dataRef = rtfdData
		    end if
		    
		    replaceCharactersInRange self, aRange, dataRef
		    
		  #else
		    #pragma unused aRange
		    #pragma unused rtfdData
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ReplaceWithString(aRange as Cocoa.NSRange, aString as String)
		  
		  #if TargetMacOS
		    declare sub replaceCharactersInRange lib CocoaLib selector "replaceCharactersInRange:withString:" (obj_id as Ptr, aRange as Cocoa.NSRange, aString as CFStringRef)
		    
		    replaceCharactersInRange self, aRange, aString
		    
		  #else
		    #pragma unused aRange
		    #pragma unused aString
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RTFData(aRange as Cocoa.NSRange) As NSData
		  
		  #if TargetMacOS
		    declare function RTFFromRange lib CocoaLib selector "RTFFromRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		    
		    dim dataRef as Ptr = RTFFromRange(self, aRange)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RTFDData(aRange as Cocoa.NSRange) As NSData
		  
		  #if TargetMacOS
		    declare function RTFDFromRange lib CocoaLib selector "RTFDFromRange:" (obj_id as Ptr, aRange as Cocoa.NSRange) as Ptr
		    
		    dim dataRef as Ptr = RTFDFromRange(self, aRange)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused aRange
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollRangeToVisible(r as Cocoa.NSRange)
		  
		  #if TargetMacOS
		    declare sub scrollRangeToVisible lib CocoaLib selector "scrollRangeToVisible:" (id as Ptr, range as NSRange)
		    
		    scrollRangeToVisible( self, r )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub SelectAll()
		  
		  #if TargetMacOS
		    declare sub selectAll lib CocoaLib selector "selectAll:" (obj_id as Ptr, sender as Ptr)
		    
		    selectAll self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub SetFont(aFont as NSFont, aRange as Cocoa.NSRange)
		  
		  #if TargetMacOS
		    declare sub setFont lib CocoaLib selector "setFont:range:" (obj_id as Ptr, aFont as Ptr, aRange as Cocoa.NSRange)
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    setFont self, fontRef, aRange
		    
		  #else
		    #pragma unused aFont
		    #pragma unused aRange
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub SetTextColor(aColor as NSColor, aRange as Cocoa.NSRange)
		  
		  #if TargetMacOS
		    declare sub setTextColor lib CocoaLib selector "setTextColor:range:" (obj_id as Ptr, aColor as Ptr, aRange as Cocoa.NSRange)
		    
		    dim colorRef as Ptr
		    if aColor <> nil then
		      colorRef = aColor
		    end if
		    
		    setTextColor self, colorRef, aRange
		    
		  #else
		    #pragma unused aColor
		    #pragma unused aRange
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ShowGuessPanel()
		  
		  #if TargetMacOS
		    declare sub showGuessPanel lib CocoaLib selector "showGuessPanel:" (obj_id as Ptr, sender as Ptr)
		    
		    showGuessPanel self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub SizeToFit()
		  
		  #if TargetMacOS
		    declare sub sizeToFit lib CocoaLib selector "sizeToFit" (obj_id as Ptr)
		    
		    sizeToFit self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Subscript()
		  
		  #if TargetMacOS
		    declare sub subscript lib CocoaLib selector "subscript:" (obj_id as Ptr, sender as Ptr)
		    
		    subscript self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Superscript()
		  
		  #if TargetMacOS
		    declare sub superscript lib CocoaLib selector "superscript:" (obj_id as Ptr, sender as Ptr)
		    
		    superscript self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ToggleRuler()
		  
		  #if TargetMacOS
		    declare sub toggleRuler lib CocoaLib selector "toggleRuler:" (obj_id as Ptr, sender as Ptr)
		    
		    toggleRuler self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Underline()
		  
		  #if TargetMacOS
		    declare sub underline lib CocoaLib selector "underline:" (obj_id as Ptr, sender as Ptr)
		    
		    underline self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Unscript()
		  
		  #if TargetMacOS
		    declare sub unscript lib CocoaLib selector "unscript:" (obj_id as Ptr, sender as Ptr)
		    
		    unscript self, self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function WriteRTFD(file as FolderItem, atomically as Boolean) As Boolean
		  
		  #if TargetMacOS
		    declare function writeRTFDToFile lib CocoaLib selector "writeRTFDToFile:atomically:" (obj_id as Ptr, path as CFStringRef, atomically as Boolean) as Boolean
		    
		    if file <> nil then
		      return writeRTFDToFile(self, file.POSIXPath, atomically)
		    end if
		    
		  #else
		    #pragma unused file
		    #pragma unused atomically
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function alignment lib CocoaLib selector "alignment" (id as Ptr) as NSTextAlignment
			    
			    return alignment(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAlignment lib CocoaLib selector "setAlignment:" (obj_id as Ptr, mode as NSTextAlignment)
			    
			    setAlignment self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Alignment As NSTextAlignment
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function backgroundColor lib CocoaLib selector "backgroundColor" (id as Ptr) as Ptr
			    
			    dim colorRef as Ptr = backgroundColor(self)
			    if colorRef <> nil then
			      return new NSColor(colorRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" (obj_id as Ptr, aColor as Ptr)
			    
			    dim colorRef as Ptr
			    if value <> nil then
			      colorRef = value
			    end if
			    setBackgroundColor self, colorRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		BackgroundColor As NSColor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function baseWritingDirection lib CocoaLib selector "baseWritingDirection" (id as Ptr) as NSWritingDirection
			    
			    return baseWritingDirection(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setBaseWritingDirection lib CocoaLib selector "setBaseWritingDirection:" (obj_id as Ptr, direction as NSWritingDirection)
			    
			    setBaseWritingDirection self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		BaseWritingDirection As NSWritingDirection
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function drawsBackground lib CocoaLib selector "drawsBackground" (id as Ptr) as Boolean
			    
			    return drawsBackground(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setDrawsBackground lib CocoaLib selector "setDrawsBackground:" (obj_id as Ptr, flag as Boolean)
			    
			    setDrawsBackground self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		DrawsBackground As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isEditable lib CocoaLib selector "isEditable" (id as Ptr) as Boolean
			    
			    return isEditable(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setEditable lib CocoaLib selector "setEditable:" (obj_id as Ptr, flag as Boolean)
			    
			    setEditable self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Editable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isFieldEditor lib CocoaLib selector "isFieldEditor" (id as Ptr) as Boolean
			    
			    return isFieldEditor(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setFieldEditor lib CocoaLib selector "setFieldEditor:" (obj_id as Ptr, flag as Boolean)
			    
			    setFieldEditor self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		FieldEditor As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function font lib CocoaLib selector "font" (id as Ptr) as Ptr
			    
			    dim fontRef as Ptr = font(self)
			    if fontRef <> nil then
			      return new NSFont(fontRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setFont lib CocoaLib selector "setFont:" (obj_id as Ptr, aFont as Ptr)
			    
			    dim fontRef as Ptr
			    if value <> nil then
			      fontRef = value
			    end if
			    setFont self, fontRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Font As NSFont
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isHorizontallyResizable lib CocoaLib selector "isHorizontallyResizable" (id as Ptr) as Boolean
			    
			    return isHorizontallyResizable(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setHorizontallyResizable lib CocoaLib selector "setHorizontallyResizable:" (obj_id as Ptr, flag as Boolean)
			    
			    setHorizontallyResizable self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		HorizontallyResizable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function importsGraphics lib CocoaLib selector "importsGraphics" (id as Ptr) as Boolean
			    
			    return importsGraphics(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setImportsGraphics lib CocoaLib selector "setImportsGraphics:" (obj_id as Ptr, flag as Boolean)
			    
			    setImportsGraphics self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ImportsGraphics As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function maxSize lib CocoaLib selector "maxSize" (id as Ptr) as Cocoa.NSSize
			    
			    return maxSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setMaxSize lib CocoaLib selector "setMaxSize:" (obj_id as Ptr, aSize as Cocoa.NSSize)
			    
			    setMaxSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MaxSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function minSize lib CocoaLib selector "minSize" (id as Ptr) as Cocoa.NSSize
			    
			    return minSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setMinSize lib CocoaLib selector "setMinSize:" (obj_id as Ptr, aSize as Cocoa.NSSize)
			    
			    setMinSize self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MinSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isRichText lib CocoaLib selector "isRichText" (id as Ptr) as Boolean
			    
			    return isRichText(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setRichText lib CocoaLib selector "setRichText:" (obj_id as Ptr, flag as Boolean)
			    
			    setRichText self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		RichText As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isRulerVisible lib CocoaLib selector "isRulerVisible" (id as Ptr) as Boolean
			    
			    return isRulerVisible(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		RulerVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isSelectable lib CocoaLib selector "isSelectable" (id as Ptr) as Boolean
			    
			    return isSelectable(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setSelectable lib CocoaLib selector "setSelectable:" (obj_id as Ptr, flag as Boolean)
			    
			    setSelectable self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Selectable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function selectedRange lib CocoaLib selector "selectedRange" (id as Ptr) as Cocoa.NSRange
			    
			    return selectedRange(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setSelectedRange lib CocoaLib selector "setSelectedRange:" (obj_id as Ptr, aRange as Cocoa.NSRange)
			    
			    setSelectedRange self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		SelectedRange As Cocoa.NSRange
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function string_ lib CocoaLib selector "string" (obj_id as Ptr) as CFStringRef
			    'declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
			    
			    'return CFRetain(string_(self))
			    return string_(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setString lib CocoaLib selector "setString:" (obj_id as Ptr, aString as CFStringRef)
			    
			    setString self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		StringValue As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function textColor lib CocoaLib selector "textColor" (id as Ptr) as Ptr
			    
			    dim colorRef as Ptr = textColor(self)
			    if colorRef <> nil then
			      return new NSColor(colorRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setTextColor lib CocoaLib selector "setTextColor:" (obj_id as Ptr, aColor as Ptr)
			    
			    dim colorRef as Ptr
			    if value <> nil then
			      colorRef = value
			    end if
			    setTextColor self, colorRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		TextColor As NSColor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function usesFontPanel lib CocoaLib selector "usesFontPanel" (id as Ptr) as Boolean
			    
			    return usesFontPanel(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setUsesFontPanel lib CocoaLib selector "setUsesFontPanel:" (obj_id as Ptr, flag as Boolean)
			    
			    setUsesFontPanel self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		UsesFontPanel As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isVerticallyResizable lib CocoaLib selector "isVerticallyResizable" (id as Ptr) as Boolean
			    
			    return isVerticallyResizable(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setVerticallyResizable lib CocoaLib selector "setVerticallyResizable:" (obj_id as Ptr, flag as Boolean)
			    
			    setVerticallyResizable self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		VerticallyResizable As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = NSTextAlignment, Flags = &h0
		NSLeftTextAlignment
		  NSRightTextAlignment
		  NSCenterTextAlignment
		  NSJustifiedTextAlignment
		NSNaturalTextAlignment
	#tag EndEnum

	#tag Enum, Name = NSWritingDirection, Flags = &h0
		NSWritingDirectionNatural = -1
		  NSWritingDirectionLeftToRight = 0
		NSWritingDirectionRightToLeft
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alignment"
			Group="Behavior"
			Type="NSTextAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSLeftTextAlignment"
				"1 - NSRightTextAlignment"
				"2 - NSCenterTextAlignment"
				"3 - NSJustifiedTextAlignment"
				"4 - NSNaturalTextAlignment"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BaseWritingDirection"
			Group="Behavior"
			Type="NSWritingDirection"
			EditorType="Enum"
			#tag EnumValues
				"-1 - NSWritingDirectionNatural"
				"0 - NSWritingDirectionLeftToRight"
				"1 - NSWritingDirectionRightToLeft"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DrawsBackground"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Editable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FieldEditor"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontallyResizable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImportsGraphics"
			Group="Behavior"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RichText"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RulerVisible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selectable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="UsesFontPanel"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticallyResizable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

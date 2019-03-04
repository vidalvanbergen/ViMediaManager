#tag Class
Class NSFont
Inherits NSObject
	#tag Method, Flags = &h0
		Function AdvancementForGlyph(aGlyph as UInt32) As Cocoa.NSSize
		  //# Returns the nominal spacing for the given glyph—the distance the current point moves after showing the glyph—accounting for the NSFont’s size.
		  
		  #if TargetMacOS
		    declare function advancementForGlyph lib CocoaLib selector "advancementForGlyph:" (obj_id as Ptr, aGlyph as UInt32) as Cocoa.NSSize
		    
		    return advancementForGlyph(self, aGlyph)
		  #else
		    #pragma unused aGlyph
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ascender() As Double
		  //# Returns the top y-coordinate, offset from the baseline, of the NSFont’s longest ascender.
		  
		  #if TargetMacOS
		    declare function ascender lib CocoaLib selector "ascender" (obj_id as Ptr) as Double
		    
		    return ascender(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function BoldSystemFontOfSize(size as double = 0.0) As NSFont
		  #if TargetMacOS
		    declare function boldSystemFontOfSize lib CocoaLib selector "boldSystemFontOfSize:" (Cls as Ptr, size as Double) as Ptr
		    
		    dim p as Ptr
		    p = boldSystemFontOfSize( Cocoa.NSClassFromString( "NSFont" ), size )
		    
		    if p<>nil then
		      return new NSFont( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BoundingRectForFont() As Cocoa.NSRect
		  
		  #if TargetMacOS
		    declare function boundingRectForFont lib CocoaLib selector "boundingRectForFont" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return boundingRectForFont(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BoundingRectForGlyph(aGlyph as UInt32) As Cocoa.NSRect
		  
		  #if TargetMacOS
		    declare function boundingRectForGlyph lib CocoaLib selector "boundingRectForGlyph:" (obj_id as Ptr, aGlyph as UInt32) as Cocoa.NSRect
		    
		    return boundingRectForGlyph(self, aGlyph)
		    
		  #else
		    #pragma unused aGlyph
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CapHeight() As Double
		  
		  #if TargetMacOS
		    declare function capHeight lib CocoaLib selector "capHeight" (obj_id as Ptr) as Double
		    
		    return capHeight(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSFont")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ControlContentFontOfSize(size as double = 0.0) As NSFont
		  #if TargetMacOS
		    declare function controlContentFontOfSize lib CocoaLib selector "controlContentFontOfSize:" (Cls as Ptr, size as Double) as Ptr
		    
		    dim p as Ptr
		    p = controlContentFontOfSize( Cocoa.NSClassFromString( "NSFont" ), size )
		    
		    if p<>nil then
		      return new NSFont( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CoveredCharacterSet() As NSCharacterSet
		  
		  #if TargetMacOS
		    declare function coveredCharacterSet lib CocoaLib selector "coveredCharacterSet" (obj_id as Ptr) as Ptr
		    
		    dim charSetRef as Ptr = coveredCharacterSet(self)
		    if charSetRef <> nil then
		      return new NSCharacterSet(charSetRef)
		    else
		      return nil
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Descender() As Double
		  
		  #if TargetMacOS
		    declare function descender lib CocoaLib selector "descender" (obj_id as Ptr) as Double
		    
		    return descender(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplayName() As string
		  #if TargetMacOS
		    declare function displayName lib CocoaLib selector "displayName" (Cls as Ptr) as CFStringRef
		    
		    return   displayName( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FamilyName() As string
		  #if TargetMacOS
		    declare function familyName lib CocoaLib selector "familyName" (Cls as Ptr) as CFStringRef
		    
		    return   familyName( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontDescriptor() As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptor lib CocoaLib selector "fontDescriptor" (obj_id as Ptr) as Ptr
		    
		    dim descriptorRef as Ptr = fontDescriptor(self)
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontName() As string
		  #if TargetMacOS
		    declare function fontName lib CocoaLib selector "fontName" (Cls as Ptr) as CFStringRef
		    
		    return   fontName( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontWithDescriptor(descriptor as NSFontDescriptor, size as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function fontWithDescriptor lib CocoaLib selector "fontWithDescriptor:size:" (obj_id as Ptr, fontDescriptor as Ptr, size as Double) as Ptr
		    
		    dim fontRef as Ptr = fontWithDescriptor(ClassRef, descriptor, size)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused descriptor
		    #pragma unused size
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontWithDescriptor(descriptor as NSFontDescriptor, transform as NSAffineTransform) As NSFont
		  
		  #if TargetMacOS
		    declare function fontWithDescriptor lib CocoaLib selector "fontWithDescriptor:textTransform:" (obj_id as Ptr, fontDescriptor as Ptr, transform as Ptr) as Ptr
		    
		    dim fontRef as Ptr = fontWithDescriptor(ClassRef, descriptor, transform)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused descriptor
		    #pragma unused transform
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontWithName(name as String, size as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function fontWithName lib CocoaLib selector "fontWithName:size:" (obj_id as Ptr, fontName as CFStringRef, size as Double) as Ptr
		    
		    dim fontRef as Ptr = fontWithName(ClassRef, name, size)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused name
		    #pragma unused size
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontWithName(name as String, matrix as NSFontMatrix) As NSFont
		  
		  #if TargetMacOS
		    declare function fontWithName lib CocoaLib selector "fontWithName:matrix:" (obj_id as Ptr, fontName as CFStringRef, byRef matrix as NSFontMatrix) as Ptr
		    
		    dim fontRef as Ptr = fontWithName(ClassRef, name, matrix)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused name
		    #pragma unused matrix
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GlyphWithName(glyphName as String) As UInt32
		  
		  #if TargetMacOS
		    declare function glyphWithName lib CocoaLib selector "glyphWithName:" (obj_id as Ptr, glyphName as CFStringRef) as UInt32
		    
		    return glyphWithName(self, glyphName)
		    
		  #else
		    #pragma unused glyphName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFixedPitch() As Boolean
		  
		  #if TargetMacOS
		    declare function isFixedPitch lib CocoaLib selector "isFixedPitch" (obj_id as Ptr) as Boolean
		    
		    return isFixedPitch(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsVertical() As Boolean
		  
		  #if TargetMacOS
		    declare function isVertical lib CocoaLib selector "isVertical" (obj_id as Ptr) as Boolean
		    
		    return isVertical(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItalicAngle() As Double
		  
		  #if TargetMacOS
		    declare function italicAngle lib CocoaLib selector "italicAngle" (obj_id as Ptr) as Double
		    
		    return italicAngle(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LabelFont(fontSize as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function labelFontOfSize lib CocoaLib selector "labelFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = labelFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LabelFontSize() As Double
		  
		  #if TargetMacOS
		    declare function labelFontSize lib CocoaLib selector "labelFontSize" (obj_id as Ptr) as Double
		    
		    return labelFontSize(ClassRef)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Leading() As Double
		  
		  #if TargetMacOS
		    declare function leading lib CocoaLib selector "leading" (obj_id as Ptr) as Double
		    
		    return leading(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Matrix() As NSFontMatrix
		  
		  #if TargetMacOS
		    declare function matrix lib CocoaLib selector "matrix" (obj_id as Ptr) as Ptr
		    
		    dim m as MemoryBlock = matrix(self)
		    dim x as NSFontMatrix
		    x.stringValue(m.littleEndian) = m.stringValue(0, 24)
		    return x
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaximumAdvancement() As Cocoa.NSSize
		  
		  #if TargetMacOS
		    declare function maximumAdvancement lib CocoaLib selector "maximumAdvancement" (obj_id as Ptr) as Cocoa.NSSize
		    
		    return maximumAdvancement(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MenuBarFont(fontSize as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function menuBarFontOfSize lib CocoaLib selector "menuBarFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = menuBarFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MenuFont(fontSize as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function menuFontOfSize lib CocoaLib selector "menuFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = menuFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MessageFont(fontSize as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function messageFontOfSize lib CocoaLib selector "messageFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = messageFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MostCompatibleStringEncoding() As NSStringEncoding
		  
		  #if TargetMacOS
		    declare function mostCompatibleStringEncoding lib CocoaLib selector "mostCompatibleStringEncoding" (obj_id as Ptr) as NSStringEncoding
		    
		    return mostCompatibleStringEncoding(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfGlyphs() As Integer
		  
		  #if TargetMacOS
		    declare function numberOfGlyphs lib CocoaLib selector "numberOfGlyphs" (obj_id as Ptr) as Integer
		    
		    return numberOfGlyphs(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PaletteFont(fontSize as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function paletteFontOfSize lib CocoaLib selector "paletteFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = paletteFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrinterFont() As NSFont
		  
		  #if TargetMacOS
		    declare function printerFont lib CocoaLib selector "printerFont" (obj_id as Ptr) as Ptr
		    
		    dim fontRef as Ptr = printerFont(self)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderingMode() As NSFontRenderingMode
		  
		  #if TargetMacOS
		    declare function renderingMode lib CocoaLib selector "renderingMode" (obj_id as Ptr) as NSFontRenderingMode
		    
		    return renderingMode(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenFont() As NSFont
		  
		  #if TargetMacOS
		    declare function screenFont lib CocoaLib selector "screenFont" (obj_id as Ptr) as Ptr
		    
		    dim fontRef as Ptr = screenFont(self)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenFontWithRenderingMode(mode as NSFontRenderingMode) As NSFont
		  
		  #if TargetMacOS
		    declare function screenFontWithRenderingMode lib CocoaLib selector "screenFontWithRenderingMode:" (obj_id as Ptr, mode as NSFontRenderingMode) as Ptr
		    
		    dim fontRef as Ptr = screenFontWithRenderingMode(self, mode)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused mode
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set()
		  
		  #if TargetMacOS
		    declare sub set lib CocoaLib selector "set" (obj_id as Ptr)
		    
		    set self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(context as NSGraphicsContext)
		  
		  #if TargetMacOS
		    declare sub setInContext lib CocoaLib selector "setInContext:" (obj_id as Ptr, graphicsContext as Ptr)
		    
		    if context <> nil then
		      setInContext self, context
		    end if
		    
		  #else
		    #pragma unused context
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SetUserFixedPitchFont(aFont as NSFont)
		  
		  #if TargetMacOS
		    declare sub setUserFixedPitchFont lib CocoaLib selector "setUserFixedPitchFont:" (obj_id as Ptr, aFont as Ptr)
		    
		    if aFont <> nil then
		      setUserFixedPitchFont ClassRef, aFont
		    else
		      setUserFixedPitchFont ClassRef, nil
		    end if
		    
		  #else
		    #pragma unused aFont
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SetUserFont(aFont as NSFont)
		  
		  #if TargetMacOS
		    declare sub setUserFont lib CocoaLib selector "setUserFont:" (obj_id as Ptr, aFont as Ptr)
		    
		    if aFont <> nil then
		      setUserFont ClassRef, aFont
		    else
		      setUserFont ClassRef, nil
		    end if
		    
		  #else
		    #pragma unused aFont
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SmallSystemFontSize() As double
		  #if TargetMacOS
		    declare function smallSystemFontSize lib CocoaLib selector "smallSystemFontSize" (Cls as Ptr) as Double
		    
		    return   smallSystemFontSize( Cocoa.NSClassFromString( "NSFont" ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SystemFontOfSize(size as double = 0.0) As NSFont
		  #if TargetMacOS
		    declare function systemFontOfSize lib CocoaLib selector "systemFontOfSize:" (Cls as Ptr, size as Double) as Ptr
		    
		    dim p as Ptr
		    p = systemFontOfSize( Cocoa.NSClassFromString( "NSFont" ), size )
		    
		    if p<>nil then
		      return new NSFont( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SystemFontSize() As double
		  #if TargetMacOS
		    declare function systemFontSize lib CocoaLib selector "systemFontSize" (Cls as Ptr) as Double
		    
		    return   systemFontSize( Cocoa.NSClassFromString( "NSFont" ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SystemFontSizeForControlSize(controlSize as NSControlSize) As Double
		  
		  #if TargetMacOS
		    declare function systemFontSizeForControlSize lib CocoaLib selector "systemFontSizeForControlSize:" (obj_id as Ptr, controlSize as NSControlSize) as Double
		    
		    return systemFontSizeForControlSize(ClassRef, controlSize)
		    
		  #else
		    #pragma unused controlSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextTransform() As NSAffineTransform
		  
		  #if TargetMacOS
		    declare function textTransform lib CocoaLib selector "textTransform" (obj_id as Ptr) as Ptr
		    
		    dim transformRef as Ptr = textTransform(self)
		    if transformRef <> nil then
		      return new NSAffineTransform(transformRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TitleBarFont(fontSize as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function titleBarFontOfSize lib CocoaLib selector "titleBarFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = titleBarFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ToolTipsFont(fontSize as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function toolTipsFontOfSize lib CocoaLib selector "toolTipsFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = toolTipsFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnderlinePosition() As Double
		  
		  #if TargetMacOS
		    declare function underlinePosition lib CocoaLib selector "underlinePosition" (obj_id as Ptr) as Double
		    
		    return underlinePosition(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnderlineThickness() As Double
		  
		  #if TargetMacOS
		    declare function underlineThickness lib CocoaLib selector "underlineThickness" (obj_id as Ptr) as Double
		    
		    return underlineThickness(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UserFixedPitchFont(fontSIze as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function userFixedPitchFontOfSize lib CocoaLib selector "userFixedPitchFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = userFixedPitchFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UserFont(fontSIze as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function userFontOfSize lib CocoaLib selector "userFontOfSize:" (obj_id as Ptr, fontSize as Double) as Ptr
		    
		    dim fontRef as Ptr = userFontOfSize(ClassRef, fontSize)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused fontSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VerticalFont() As NSFont
		  
		  #if TargetMacOS
		    declare function verticalFont lib CocoaLib selector "verticalFont" (obj_id as Ptr) as Ptr
		    
		    dim fontRef as Ptr = verticalFont(self)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XHeight() As Double
		  
		  #if TargetMacOS
		    declare function xHeight lib CocoaLib selector "xHeight" (obj_id as Ptr) as Double
		    
		    return xHeight(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = How to load a font by name
		Use NSFontManager.SharedManager.GetFont(...)
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function pointSize lib CocoaLib selector "pointSize" (obj_id as Ptr) as Double
			    
			    return pointSize(self)
			  #endif
			End Get
		#tag EndGetter
		PointSize As Double
	#tag EndComputedProperty


	#tag Constant, Name = kNSBoldFontMask, Type = Double, Dynamic = False, Default = \"&h2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSCompressedFontMask, Type = Double, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSCondensedFontMask, Type = Double, Dynamic = False, Default = \"&h40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSExpandedFontMask, Type = Double, Dynamic = False, Default = \"&h20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSFixedPitchFontMask, Type = Double, Dynamic = False, Default = \"&h400", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSItalicFontMask, Type = Double, Dynamic = False, Default = \"&h1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNarrowFontMask, Type = Double, Dynamic = False, Default = \"&h10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNonStandardCharacterSetFontMask, Type = Double, Dynamic = False, Default = \"&h8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSPosterFontMask, Type = Double, Dynamic = False, Default = \"&h100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSmallCapsFontMask, Type = Double, Dynamic = False, Default = \"&h80", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnboldFontMask, Type = Double, Dynamic = False, Default = \"&h4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnitalicFontMask, Type = Double, Dynamic = False, Default = \"&h1000000", Scope = Public
	#tag EndConstant


	#tag Structure, Name = NSFontMatrix, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		item1 as Double
		  item2 as Double
		  item3 as Double
		  item4 as Double
		  item5 as Double
		item6 as Double
	#tag EndStructure


	#tag Enum, Name = NSControlSize, Flags = &h0
		NSRegularControlSize
		  NSSmallControlSize
		NSMiniControlSize
	#tag EndEnum

	#tag Enum, Name = NSFontRenderingMode, Flags = &h0
		NSFontDefaultRenderingMode
		  NSFontAntialiasedRenderingMode
		  NSFontIntegerAdvancementsRenderingMode
		NSFontAntialiasedIntegerAdvancementsRenderingMode
	#tag EndEnum

	#tag Enum, Name = NSStringEncoding, Flags = &h0
		NSASCIIStringEncoding = 1
		  NSNEXTSTEPStringEncoding = 2
		  NSJapaneseEUCStringEncoding = 3
		  NSUTF8StringEncoding = 4
		  NSISOLatin1StringEncoding = 5
		  NSSymbolStringEncoding = 6
		  NSNonLossyASCIIStringEncoding = 7
		  NSShiftJISStringEncoding = 8
		  NSISOLatin2StringEncoding = 9
		  NSUnicodeStringEncoding = 10
		  NSWindowsCP1251StringEncoding = 11
		  NSWindowsCP1252StringEncoding = 12
		  NSWindowsCP1253StringEncoding = 13
		  NSWindowsCP1254StringEncoding = 14
		  NSWindowsCP1250StringEncoding = 15
		  NSISO2022JPStringEncoding = 21
		  NSMacOSRomanStringEncoding = 30
		  NSUTF16StringEncoding = 10
		  NSUTF16BigEndianStringEncoding = &h90000100
		  NSUTF16LittleEndianStringEncoding = &h94000100
		  NSUTF32StringEncoding = &h8c000100
		  NSUTF32BigEndianStringEncoding = &h98000100
		  NSUTF32LittleEndianStringEncoding = &h9c000100
		NSProprietaryStringEncoding = 65536
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
			Name="PointSize"
			Group="Behavior"
			Type="Double"
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

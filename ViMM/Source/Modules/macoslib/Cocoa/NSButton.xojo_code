#tag Class
Class NSButton
Inherits NSControl
	#tag Event
		Function NSClassName() As String
		  return "NSButton"
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.style = self.InitialButtonStyle
		  me.Type = self.InitialButtonType
		  
		  me.Title = self.initialTitle
		  me.AlternateTitle = self.initialAlternateTitle
		  
		  me.Image = self.InitialImage
		  me.AlternateImage = self.InitialAlternateImage
		  me.ImagePosition = InitialImagePosition
		  
		  me.Bordered = InitialBordered
		  me.Transparent = InitialTransparent
		  me.ShowsBorderOnlyWhileMouseInside = InitialShowsBorderOnlyWhileMouseInside
		  
		  RaiseEvent open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Highlight(value as Boolean)
		  
		  #if TargetCocoa then
		    declare sub highlight lib CocoaLib selector "highlight:" (obj_id as Ptr, value as Boolean)
		    
		    highlight self, value
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextState()
		  
		  #if TargetCocoa then
		    declare sub setNextState lib CocoaLib selector "setNextState" (obj_id as Ptr)
		    
		    setNextState self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Push()
		  
		  #if TargetCocoa then
		    declare sub performClick lib CocoaLib selector "performClick:" (obj_id as Ptr)
		    
		    performClick self
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare function getAllowsMixedState lib CocoaLib selector "allowsMixedState" (obj_id as Ptr) as Boolean
			      
			      return getAllowsMixedState( self )
			    else
			      return InitialAllowsMixedState
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare sub setAllowsMixedState lib CocoaLib selector "setAllowsMixedState:" (obj_id as Ptr, value as Boolean)
			      
			      setAllowsMixedState self, value
			    else
			      InitialAllowsMixedState = value
			    end if
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		AllowsMixedState As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    if self.id <> nil then
			      return Self.NativeAlternateImage
			    else
			      return InitialAlternateImage
			    end if
			  #endif
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    if self.id <> nil and value <> nil then
			      Self.NativeAlternateImage = value
			    else
			      InitialAlternateImage = value
			    end if
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AlternateImage As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    if self.id <> nil then
			      declare function AlternateTitle lib CocoaLib selector "alternateTitle" (obj_id as Ptr) as CFStringRef
			      
			      return AlternateTitle(self)
			    else
			      return initialAlternateTitle
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    if self.id <> nil then
			      declare sub setAlternateTitle lib CocoaLib selector "setAlternateTitle:" (obj_id as Ptr, value as CFStringRef)
			      
			      setAlternateTitle(self, value)
			    else
			      initialAlternateTitle = value
			    end if
			  #endif
			End Set
		#tag EndSetter
		AlternateTitle As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getAttributedAlternateTitle lib CocoaLib selector "attributedAlternateTitle" (obj_id as Ptr) as Ptr
			    
			    return New NSAttributedString( getAttributedAlternateTitle( self ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setAttributedAlternateTitle lib CocoaLib selector "setAttributedAlternateTitle:" (obj_id as Ptr, value as Ptr)
			    
			    setAttributedAlternateTitle self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		AttributedAlternateTitle As NSAttributedString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getAttributedTitle lib CocoaLib selector "attributedTitle" (obj_id as Ptr) as Ptr
			    
			    return New NSAttributedString( getAttributedTitle( self ) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setAttributedTitle lib CocoaLib selector "setAttributedTitle:" (obj_id as Ptr, value as Ptr)
			    
			    setAttributedTitle self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		AttributedTitle As NSAttributedString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the appearance of the receiver’s border.
			  
			  #if TargetMacOS then
			    if self.id <> nil then
			      declare function bezelStyle lib CocoaLib selector "bezelStyle" (obj_id as Ptr) as NSBezelStyle
			      
			      return bezelStyle(self)
			    else
			      Return NSBezelStyle(self.InitialButtonStyle)
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the appearance of the border, if the receiver has one.
			  
			  #if TargetMacOS then
			    if self.id <> nil then
			      declare sub setBezelStyle lib CocoaLib selector "setBezelStyle:" (obj_id as Ptr, value as NSBezelStyle)
			      
			      setBezelStyle(self, value)
			    else
			      InitialButtonStyle = integer(value)
			    end if
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		BezelStyle As NSBezelStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    return self.StringValue = "1"
			  #endif
			End Get
		#tag EndGetter
		BooleanValue As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare function getIsBordered lib CocoaLib selector "isBordered" (obj_id as Ptr) as Boolean
			      
			      return getIsBordered( self )
			    else
			      return InitialBordered
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare sub setBordered lib CocoaLib selector "setBordered:" (obj_id as Ptr, value as Boolean)
			      
			      setBordered self, value
			    else
			      InitialBordered = value
			    end if
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Bordered As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    if self.id <> nil then
			      declare sub setButtonType lib CocoaLib selector "setButtonType:" (obj_id as Ptr, value as NSButtonType)
			      
			      setButtonType(self, value)
			    else
			      InitialButtonType = integer(value)
			    end if
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		ButtonType As NSButtonType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    if self.id <> nil then
			      return Self.NativeImage
			    else
			      return InitialImage
			    end if
			  #endif
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    if self.id <> nil and value <> nil then
			      Self.NativeImage = value
			    else
			      InitialImage = value
			    end if
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Image As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare function getImagePosition lib CocoaLib selector "imagePosition" (obj_id as Ptr) as Integer
			      
			      return getImagePosition( self )
			    else
			      return InitialImagePosition
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare sub setImagePosition lib CocoaLib selector "setImagePosition:" (obj_id as Ptr, value as Integer)
			      
			      setImagePosition self, value
			    else
			      InitialImagePosition = value
			    end if
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		ImagePosition As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private InitialAllowsMixedState As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialAlternateImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialAlternateTitle As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialBordered As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialButtonStyle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialButtonType As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialImagePosition As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialShowsBorderOnlyWhileMouseInside As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialState As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private initialTitle As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialTransparent As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getKeyEquivalent lib CocoaLib selector "keyEquivalent" (obj_id as Ptr) as CFStringRef
			    
			    return getKeyEquivalent(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setKeyEquivalent lib CocoaLib selector "setKeyEquivalent:" (obj_id as Ptr, value as CFStringRef)
			    
			    setKeyEquivalent self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		KeyEquivalent As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getKeyEquivalentModifierMask lib CocoaLib selector "keyEquivalentModifierMask" (obj_id as Ptr) as UInt64
			    
			    return getKeyEquivalentModifierMask(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setKeyEquivalentModifierMask lib CocoaLib selector "setKeyEquivalentModifierMask:" (obj_id as Ptr, value as UInt64)
			    
			    setKeyEquivalentModifierMask self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		KeyEquivalentModifierMask As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function getAlternateImage lib CocoaLib selector "alternateImage" (obj_id as Ptr) as Ptr
			    
			    return New NSImage( getAlternateImage( self ) )
			  #endif
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAlternateImage lib CocoaLib selector "setAlternateImage:" (obj_id as Ptr, value as Ptr)
			    
			    dim imageRef as Ptr
			    if value <> nil then
			      imageRef = value
			    end if
			    
			    setAlternateImage self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		NativeAlternateImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function getImage lib CocoaLib selector "image" (obj_id as Ptr) as Ptr
			    
			    return New NSImage( getImage( self ) )
			  #endif
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setImage lib CocoaLib selector "setImage:" (obj_id as Ptr, value as Ptr)
			    
			    dim imageRef as Ptr
			    if value <> nil then
			      imageRef = value
			    end if
			    
			    setImage self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		NativeImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getImagePosition lib CocoaLib selector "imagePosition" (obj_id as Ptr) as NSImagePosition
			    
			    return getImagePosition( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setImagePosition lib CocoaLib selector "setImagePosition:" (obj_id as Ptr, value as NSImagePosition)
			    
			    setImagePosition self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		NativeImagePosition As NSImagePosition
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare function getShowsBorderOnlyWhileMouseInside lib CocoaLib selector "showsBorderOnlyWhileMouseInside" (obj_id as Ptr) as Boolean
			      
			      return getShowsBorderOnlyWhileMouseInside(self)
			    else
			      return InitialShowsBorderOnlyWhileMouseInside
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare sub setShowsBorderOnlyWhileMouseInside lib CocoaLib selector "setShowsBorderOnlyWhileMouseInside:" (obj_id as Ptr, value as Boolean)
			      
			      setShowsBorderOnlyWhileMouseInside self, value
			    else
			      InitialShowsBorderOnlyWhileMouseInside = value
			    end if
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		ShowsBorderOnlyWhileMouseInside As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare function getState lib CocoaLib selector "state" (obj_id as Ptr) as Integer
			      
			      return getState( self )
			    else
			      return InitialState
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare sub setState lib CocoaLib selector "setState:" (obj_id as Ptr, value as Integer)
			      
			      setState self, value
			    else
			      InitialState = value
			    end if
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		State As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return integer(BezelStyle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  BezelStyle = NSBezelStyle(value)
			End Set
		#tag EndSetter
		Style As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    if self.id <> nil then
			      declare function title lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			      
			      return title(self)
			    else
			      return initialTitle
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    if self.id <> nil then
			      declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, value as CFStringRef)
			      
			      setTitle(self, value)
			    else
			      initialTitle = value
			    end if
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare function getIsTransparent lib CocoaLib selector "isTransparent" (obj_id as Ptr) as Boolean
			      
			      return getIsTransparent( self )
			    else
			      return InitialTransparent
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    if self.id <> nil then
			      declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Ptr, value as Boolean)
			      
			      setTransparent self, value
			    else
			      InitialTransparent = value
			    end if
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Transparent As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  ButtonType = NSButtonType(value)
			End Set
		#tag EndSetter
		Type As Integer
	#tag EndComputedProperty


	#tag Enum, Name = NSBezelStyle, Flags = &h0
		NSRoundedBezelStyle = 1
		  NSRegularSquareBezelStyle
		  NSThickSquareBezelStyle
		  NSThickerSquareBezelStyle
		  NSDisclosureBezelStyle
		  NSShadowlessSquareBezelStyle
		  NSCircularBezelStyle
		  NSTexturedSquareBezelStyle
		  NSHelpButtonBezelStyle
		  NSSmallSquareBezelStyle
		  NSTexturedRoundedBezelStyle
		  NSRoundRectBezelStyle
		  NSRecessedBezelStyle
		  NSRoundedDisclosureBezelStyle
		NSInlineBezelStyle
	#tag EndEnum

	#tag Enum, Name = NSButtonType, Flags = &h0
		NSMomentaryLightButton = 0
		  NSPushOnPushOffButton
		  NSToggleButton
		  NSSwitchButton
		  NSRadioButton
		  NSMomentaryChangeButton
		  NSOnOffButton
		NSMomentaryPushInButton
	#tag EndEnum

	#tag Enum, Name = NSGradientType, Flags = &h0
		NSGradientNone
		  NSGradientConcaveWeak
		  NSGradientConcaveStrong
		  NSGradientConvexWeak
		NSGradientConvexStrong
	#tag EndEnum

	#tag Enum, Name = NSImagePosition, Flags = &h0
		NSNoImage
		  NSImageOnly
		  NSImageLeft
		  NSImageRight
		  NSImageBelow
		  NSImageAbove
		NSImageOverlaps
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Group="Behavior"
			Type="NSTextAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Right"
				"2 - Center"
				"3 - Justified"
				"4 - Natural"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsExpansionToolTips"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsMixedState"
			Visible=true
			Group="NSProperties"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlternateImage"
			Visible=true
			Group="NSProperties"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlternateTitle"
			Visible=true
			Group="NSProperties"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BezelStyle"
			Group="Behavior"
			Type="NSBezelStyle"
			EditorType="Enum"
			#tag EnumValues
				"1 - NSRoundedBezelStyle"
				"2 - NSRegularSquareBezelStyle"
				"3 - NSThickSquareBezelStyle"
				"4 - NSThickerSquareBezelStyle"
				"5 - NSDisclosureBezelStyle"
				"6 - NSShadowlessSquareBezelStyle"
				"7 - NSCircularBezelStyle"
				"8 - NSTexturedSquareBezelStyle"
				"9 - NSHelpButtonBezelStyle"
				"10 - NSSmallSquareBezelStyle"
				"11 - NSTexturedRoundedBezelStyle"
				"12 - NSRoundRectBezelStyle"
				"13 - NSRecessedBezelStyle"
				"14 - NSRoundedDisclosureBezelStyle"
				"15 - NSInlineBezelStyle"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BooleanValue"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bordered"
			Visible=true
			Group="NSProperties"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonType"
			Group="Behavior"
			Type="NSButtonType"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSMomentaryLightButton"
				"1 - NSPushOnPushOffButton"
				"2 - NSToggleButton"
				"3 - NSSwitchButton"
				"4 - NSRadioButton"
				"5 - NSMomentaryChangeButton"
				"6 - NSOnOffButton"
				"7 - NSMomentaryPushInButton"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FloatValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Image"
			Visible=true
			Group="NSProperties"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImagePosition"
			Visible=true
			Group="NSProperties"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - No Image"
				"1 - Image Only"
				"2 - Left"
				"3 - Right"
				"4 - Below"
				"5 - Above"
				"6 - Overlaps"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyEquivalentModifierMask"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NativeImagePosition"
			Group="Behavior"
			Type="NSImagePosition"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSNoImage"
				"1 - NSImageOnly"
				"2 - NSImageLeft"
				"3 - NSImageRight"
				"4 - NSImageBelow"
				"5 - NSImageAbove"
				"6 - NSImageOverlaps"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsBorderOnlyWhileMouseInside"
			Visible=true
			Group="NSProperties"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="State"
			Visible=true
			Group="NSProperties"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				" - Mixed"
				"0 - Off"
				"1 - On"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Style"
			Visible=true
			Group="NSProperties"
			InitialValue="1"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"1 - Rounded"
				"2 - Regular Square"
				"3 - Thick Square"
				"4 - Thicker Square"
				"5 - Disclosure"
				"6 - Shadowless Square"
				"7 - Circular"
				"8 - Textured Square"
				"9 - Help Button"
				"10 - Small Square"
				"11 - Textured Rounded"
				"12 - Round Rect"
				"13 - Recessed"
				"14 - Rounded Disclosure"
				"15 - Inline"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="0.0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=true
			Group="NSProperties"
			InitialValue="Button"
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
			Name="Transparent"
			Visible=true
			Group="NSProperties"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=true
			Group="NSProperties"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Momentary Light Button"
				"1 - Push On/Push Off Button"
				"2 - Toggle Button"
				"3 - Switch Button"
				"4 - Radio Button"
				"5 - Momentary Change Button"
				"6 - On/Off Button"
				"7 - Momentary Push In Button"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underlined"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

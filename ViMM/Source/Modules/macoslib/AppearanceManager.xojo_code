#tag Module
Protected Module AppearanceManager
	#tag Method, Flags = &h1
		Protected Function ThemeColor(ID as integer) As Color
		  #if targetMacOS then
		    Const depth = 32
		    
		    soft declare Function GetThemeBrushAsColor lib CarbonLib (inColor as Integer, inDepth as Short, inColorDev as Boolean, outColor as Ptr) as Integer
		    
		    dim colorPtr as New MemoryBlock(6)
		    dim OSErr    as Integer = GetThemeBrushAsColor(ID, depth, true, colorPtr)
		    
		    If OSErr = 0 then
		      Return RGB(colorPtr.UShort(0)\255, colorPtr.UShort(2)\255, colorPtr.UShort(4)\255)
		    else
		      ' return RED in case of an error
		      return &cFF0000
		    end
		    
		  #else
		    
		    #pragma unused ID
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Enum, Name = ThemeBrushConstants, Type = Integer, Flags = &h0
		kDialogBackgroundActive = 1
		  kDialogBackgroundInactive = 2
		  kAlertBackgroundActive = 3
		  kAlertBackgroundInactive = 4
		  kModelessDialogBackgroundActive = 5
		  kModelessDialogBackgroundInactive = 6
		  kUtilityWindowBackgroundActive = 7
		  kUtilityWindowBackgroundInactive = 8
		  kListViewSortColumnBackground = 9
		  kListViewBackground = 10
		  kIconLabelBackground = 11
		  kListViewSeparator = 12
		  kChasingArrows = 13
		  kDragHilite = 14
		  kDocumentWindowBackground = 15
		  kFinderWindowBackground = 16
		  kScrollBarDelimiterActive = 17
		  kScrollBarDelimiterInactive = 18
		  kFocusHighlight = 19
		  kPopupArrowActive = 20
		  kPopupArrowPressed = 21
		  kPopupArrowInactive = 22
		  kAppleGuideCoachmark = 23
		  kIconLabelBackgroundSelected = 24
		  kStaticAreaFill = 25
		  kActiveAreaFill = 26
		  kButtonFrameActive = 27
		  kButtonFrameInactive = 28
		  kButtonFaceActive = 29
		  kButtonFaceInactive = 30
		  kButtonFacePressed = 31
		  kButtonActiveDarkShadow = 32
		  kButtonActiveDarkHighlight = 33
		  kButtonActiveLightShadow = 34
		  kButtonActiveLightHighlight = 35
		  kButtonInactiveDarkShadow = 36
		  kButtonInactiveDarkHighlight = 37
		  kButtonInactiveLightShadow = 38
		  kButtonInactiveLightHighlight = 39
		  kButtonPressedDarkShadow = 40
		  kButtonPressedDarkHighlight = 41
		  kButtonPressedLightShadow = 42
		  kButtonPressedLightHighlight = 43
		  kBevelActiveLight = 44
		  kBevelActiveDark = 45
		  kBevelInactiveLight = 46
		  kBevelInactiveDark = 47
		  kNotificationWindowBackground = 48
		  kMovableModalBackground = 49
		  kSheetBackgroundOpaque = 50
		  kDrawerBackground = 51
		  kToolbarBackground = 52
		  kSheetBackgroundTransparent = 53
		  kMenuBackground = 54
		  kMenuBackgroundSelected = 55
		  kListViewOddRowBackground = 56
		  kListViewEvenRowBackground = 57
		  kListViewColumnDivider = 58
		  kSheetBackground = 50
		  kBlack = -1
		  kWhite = -2
		  kPrimaryHighlightColor = -3
		  kSecondaryHighlightColor = -4
		kAlternatePrimaryHighlightColor = -5
	#tag EndEnum


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

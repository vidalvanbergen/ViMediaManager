#tag Window
Begin ContainerControl ccSearch
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   33
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   300
   Begin Cocoa.NSSearchField srchField
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowsExpansionToolTips=   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bold            =   False
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      Enabled         =   True
      EraseBackground =   True
      FloatValue      =   0.0
      FocusRing       =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaxRecentSearches=   0
      PlaceholderText =   ""
      Scope           =   0
      SendSearchStringImmediately=   False
      SendWholeSearchString=   False
      ShowMenu        =   False
      StringValue     =   ""
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   5
      Transparent     =   True
      Underlined      =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   279
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  Dim Ratio, EndRatio as Double
		  Dim StartColor, EndColor, BorderTopColor, BorderBottomColor, SearchStartColor, SearchEndColor as Color
		  
		  // Old searchfield colors based on "Automatic".
		  'StartColor        = RGB( 156, 165, 179 )
		  'EndColor          = RGB( 109, 121, 135 )
		  'BorderTopColor    = RGB( 186, 194, 202 )
		  'BorderBottomColor = RGB( 129, 141, 150 )
		  
		  if globals.IsDarkMode then
		    StartColor = rgb(53, 53, 53) 'hsl(20, 4, 26) 'hsl(0, 0, 90) 'RGB( 229, 229, 229 )
		    EndColor   = rgb(18, 18, 18) 'hsl(12, 4, 21) 'hsl(0, 0, 70) 'RGB( 179, 179, 179 )
		    'BorderTopColor = rgb(135, 135, 135) 'RGB( 238, 238, 238 )
		    'BorderBottomColor = rgb(0, 0, 0) 'rgb(195, 195, 195)//RGB( 134, 134, 134 ) //RGB( 184, 184, 184 )
		    
		    'SearchStartColor = RGB( 240, 240, 240 )
		    'SearchEndColor   = RGB( 255, 255, 255 )
		  else
		    StartColor = RGB( 229, 229, 229 )
		    EndColor   = RGB( 179, 179, 179 )
		    'BorderTopColor = RGB( 238, 238, 238 )
		    'BorderBottomColor = rgb(195, 195, 195)//RGB( 134, 134, 134 ) //RGB( 184, 184, 184 )
		    
		    'SearchStartColor = RGB( 240, 240, 240 )
		    'SearchEndColor   = RGB( 255, 255, 255 )
		  end if
		  
		  // Draw Background
		  g.DrawGradient StartColor, EndColor, 0, 0, g.Width, g.Height
		  
		  '// Draw top border
		  'g.ForeColor = BorderTopColor
		  'g.DrawLine 0, 0, g.Width, 0
		  '
		  '// Draw bottom border
		  'g.ForeColor = BorderBottomColor
		  ''g.DrawLine 0, g.Height -1, g.Width, g.Height -1
		  '
		  '// Draw Right Border
		  'g.DrawLine g.Width - 1, 0, g.Width - 1, g.Height - 1
		  '
		  '// Draw Search Field.
		  '// Drop Shadow
		  ''g.ForeColor = RGB( 140, 155, 175 )
		  'g.ForeColor = BorderTopColor
		  'g.DrawRoundRect 9, 8, g.Width - 18, 19, 6, 6
		  '
		  '// Border
		  'g.ForeColor = RGB( 134, 134, 134 )
		  'g.DrawRoundRect 9, 7, g.Width - 18, 19, 6, 6
		  '
		  '// Fill
		  'g.ForeColor = RGB( 255, 255, 255 )
		  'g.FillRoundRect 10, 8, g.Width - 20, 17, 6, 6
		  
		  
		  Paint( g )
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Reset()
		  // Making sure the text is reset to "" and triggers the textchange event.
		  
		  'srchField.StringValue = " "
		  'srchField.StringValue = ""
		  
		  srchField.StringValue = " "
		  srchField.StringValue = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Search()
		  DoSearch(srchField.StringValue)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DoSearch(SearchText as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g as Graphics)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResetSearch()
	#tag EndHook


	#tag Property, Flags = &h0
		CueText As String = "#cCueText"
	#tag EndProperty

	#tag Property, Flags = &h0
		LiveSearch As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldText As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RemoveState As Integer
	#tag EndProperty


	#tag Constant, Name = cCueText, Type = String, Dynamic = True, Default = \"Search Title or enter IMDb ID", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search Title or enter IMDb ID"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek titel of voer in IMDb ID"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S\xC3\xB6k efter titel eller ange IMDb-ID"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Suche nach dem Titel oder der IMDb ID"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher le titre ou entrer l\'IMDB ID"
	#tag EndConstant


#tag EndWindowCode

#tag Events srchField
	#tag Event
		Sub Action()
		  if me.StringValue.len > 0 then
		    DoSearch(me.StringValue)
		  else
		    ResetSearch
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.SendSearchStringImmediately = LiveSearch
		  me.SendWholeSearchString = True 'LiveSearch
		  me.ShowRecentSearches = True
		  me.ShowMenu = True
		  me.PlaceholderText = loc.kSearch
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CueText"
		Group="Behavior"
		InitialValue="#cCueText"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveSearch"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior

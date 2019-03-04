#tag Module
Protected Module ATSForFonts
	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Constant, Name = kATSOptionFlagsComposeFontPostScriptName, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kATSOptionFlagsDefault, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kATSOptionFlagsUseDataFork, Type = Double, Dynamic = False, Default = \"768", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kATSOptionFlagsUseDataForkAsResourceFork, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kATSOptionFlagsUseResourceFork, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInvalidFont, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInvalidFontFamily, Type = Double, Dynamic = False, Default = \"&hffffffff", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInvalidGeneration, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag Structure, Name = ATSFontMetrics, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		version as UInt32
		  ascent as Double
		  descent as Double
		  leading as Double
		  avgAdvanceWidth as Double
		  maxAdvanceWidth as Double
		  minLeftSideBearing as Double
		  minRightSideBearing as Double
		  stemWidth as Double
		  stemHeight as Double
		  capHeight as Double
		  xHeight as Double
		  italicAngle as Double
		  underlinePosition as Double
		underlineThickness as Double
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

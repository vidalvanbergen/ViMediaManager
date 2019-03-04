#tag Class
Class NSByteCountFormatter
Inherits NSFormatter
	#tag Method, Flags = &h0
		Shared Function ByteCount(byteCount as Int64) As NSString
		  #if targetMacOS
		    declare function stringFromByteCount lib CocoaLib selector "stringFromByteCount:countStyle:" (obj_id as Ptr, byteCount as UInt64) as CFStringRef
		    
		    return stringFromByteCount(ClassRef, byteCount)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ByteCountWithStyle(byteCount as Int64, countStyle as CountStyle) As NSString
		  #if targetMacOS
		    declare function stringFromByteCount lib CocoaLib selector "stringFromByteCount:countStyle:" (obj_id as Ptr, byteCount as UInt64, countStyle as CountStyle) as CFStringRef
		    
		    return stringFromByteCount(ClassRef, byteCount, countStyle)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = NSClassFromString("NSByteCountFormatter")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    super.Constructor(Initialize(Allocate(Cocoa.NSClassFromString("NSByteCountFormatter"))))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(byteCount as Int64) As NSString
		  #if targetMacOS
		    declare function stringFromByteCount lib CocoaLib selector "stringFromByteCount:" (obj_id as Ptr, byteCount as Int64) as CFStringRef
		    
		    return stringFromByteCount(self, byteCount)
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Availability
		
		NSByteCountFormatter was added in 10.8.  The code should run in earlier versions, but do nothing.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function allowedUnits lib CocoaLib selector "allowedUnits" (obj_id as Ptr) as Integer
			    
			    return allowedUnits(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setAllowedUnits lib CocoaLib selector "setAllowedUnits:" (obj_id as Ptr, value as Integer)
			    
			    setAllowedUnits(self, value)
			  #endif
			End Set
		#tag EndSetter
		AllowedUnits As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function allowsNonnumericFormatting lib CocoaLib selector "allowsNonnumericFormatting" (obj_id as Ptr) as Boolean
			    
			    return allowsNonnumericFormatting(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setAllowsNonnumericFormatting lib CocoaLib selector "setAllowsNonnumericFormatting:" (obj_id as Ptr, value as Boolean)
			    
			    setAllowsNonnumericFormatting(self, value)
			  #endif
			End Set
		#tag EndSetter
		AllowsNonnumericFormatting As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function countStyle lib CocoaLib selector "countStyle" (obj_id as Ptr) as CountStyle
			    
			    return countStyle(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setCountStyle lib CocoaLib selector "setCountStyle:" (obj_id as Ptr, value as CountStyle)
			    
			    setCountStyle(self, value)
			  #endif
			End Set
		#tag EndSetter
		CountStyle As CountStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function includesActualByteCount lib CocoaLib selector "includesActualByteCount" (obj_id as Ptr) as Boolean
			    
			    return includesActualByteCount(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    
			    declare sub setIncludesActualByteCount lib CocoaLib selector "setIncludesActualByteCount:" (obj_id as Ptr, value as Boolean)
			    
			    setIncludesActualByteCount(self, value)
			  #endif
			End Set
		#tag EndSetter
		includesActualByteCount As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function includesCount lib CocoaLib selector "includesCount" (obj_id as Ptr) as Boolean
			    
			    return includesCount(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setIncludesCount lib CocoaLib selector "setIncludesCount:" (obj_id as Ptr, value as Boolean)
			    
			    setIncludesCount(self, value)
			  #endif
			End Set
		#tag EndSetter
		IncludesCount As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function includesUnit lib CocoaLib selector "includesUnit" (obj_id as Ptr) as Boolean
			    
			    return includesUnit(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setIncludesUnit lib CocoaLib selector "setIncludesUnit:" (obj_id as Ptr, value as Boolean)
			    
			    setIncludesUnit(self, value)
			  #endif
			End Set
		#tag EndSetter
		IncludesUnit As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isAdaptive lib CocoaLib selector "isAdaptive" (obj_id as Ptr) as Boolean
			    
			    return isAdaptive(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setIsAdaptive lib CocoaLib selector "setAdaptive:" (obj_id as Ptr, value as Boolean)
			    
			    setIsAdaptive(self, value)
			  #endif
			End Set
		#tag EndSetter
		IsAdaptive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function zeroPadsFractionDigits lib CocoaLib selector "zeroPadsFractionDigits" (obj_id as Ptr) as Boolean
			    
			    return zeroPadsFractionDigits(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setZeroPadsFractionDigits lib CocoaLib selector "setZeroPadsFractionDigits:" (obj_id as Ptr, value as Boolean)
			    
			    setZeroPadsFractionDigits(self, value)
			  #endif
			End Set
		#tag EndSetter
		ZeroPadsFractionDigits As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = UseAll, Type = Double, Dynamic = False, Default = \"&h0000FFFF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseBytes, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseDefault, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseEB, Type = Double, Dynamic = False, Default = \"64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseGB, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseKB, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseMB, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UsePB, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseTB, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseYBOrHigher, Type = Double, Dynamic = False, Default = \"&h0000FF00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UseZB, Type = Double, Dynamic = False, Default = \"128", Scope = Public
	#tag EndConstant


	#tag Enum, Name = CountStyle, Type = Integer, Flags = &h0
		File = 0
		  Memory = 1
		  Decimal = 2
		Binary = 3
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowedUnits"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsNonnumericFormatting"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CountStyle"
			Group="Behavior"
			Type="CountStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - File"
				"1 - Memory"
				"2 - Decimal"
				"3 - Binary"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="includesActualByteCount"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludesCount"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludesUnit"
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
			Name="IsAdaptive"
			Group="Behavior"
			Type="Boolean"
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
		#tag ViewProperty
			Name="ZeroPadsFractionDigits"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

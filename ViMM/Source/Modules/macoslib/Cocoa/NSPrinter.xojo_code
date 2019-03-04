#tag Class
Class NSPrinter
Inherits NSObject
	#tag Method, Flags = &h0
		Function BooleanValue(key as String, table as String) As Boolean
		  #if targetMacOS
		    declare function booleanForKey lib CocoaLib selector "booleanForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Boolean
		    
		    return booleanForKey(self, key, table)
		  #else
		    #pragma unused key
		    #pragma unused table
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString("NSPrinter")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithName(name as String) As NSPrinter
		  
		  #if targetMacOS
		    declare function printerWithName lib CocoaLib selector "printerWithName:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim p as Ptr = printerWithName(ClassRef, name)
		    if p <> nil then
		      return new NSPrinter(p)
		    end if
		    
		  #else
		    #pragma unused name
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithType(type as String) As NSPrinter
		  
		  #if targetMacOS
		    declare function printerWithType lib CocoaLib selector "printerWithType:" (class_id as Ptr, type as CFStringRef) as Ptr
		    
		    dim p as Ptr = printerWithType(ClassRef, type)
		    if p <> nil then
		      return new NSPrinter(p)
		    end if
		    
		  #else
		    #pragma unused type
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeviceDescription() As CFDictionary
		  #if TargetMacOS then
		    declare function deviceDescription lib CocoaLib selector "deviceDescription" (id as Ptr) as Ptr
		    
		    return   new CFDictionary( deviceDescription( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Get(name as String) As NSPrinter
		  #if targetMacOS
		    declare function printerWithName lib CocoaLib selector "printerWithName:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim p as Ptr = printerWithName(Cocoa.NSClassFromString("NSPrinter"), name)
		    if p <> nil then
		      return new NSPrinter(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(key as String, table as String) As Integer
		  #if targetMacOS
		    declare function intForKey lib CocoaLib selector "intForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Integer
		    
		    return intForKey(self, key, table)
		  #else
		    #pragma Unused key
		    #pragma Unused table
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsKeyInTable(key as String, table as String) As Boolean
		  #if targetMacOS
		    declare function isKeyInTable lib CocoaLib selector "isKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Boolean
		    
		    return isKeyInTable(self, key, table)
		  #else
		    #pragma Unused key
		    #pragma Unused table
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Names() As String()
		  #if targetMacOS
		    declare function printerNames lib CocoaLib selector "printerNames" (class_id as Ptr) as Ptr
		    
		    dim theArray as new CFArray(printerNames(ClassRef),not CFType.hasOwnership)
		    return theArray.StringValues
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSRectValue(key as String, table as String) As Cocoa.NSRect
		  #if targetMacOS
		    declare function rectForKey lib CocoaLib selector "rectForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Cocoa.NSRect
		    
		    return rectForKey(self, key, table)
		  #else
		    #pragma Unused key
		    #pragma Unused table
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSSizeValue(key as String, table as String) As Cocoa.NSSize
		  #if targetMacOS
		    declare function sizeForKey lib CocoaLib selector "sizeForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Cocoa.NSSize
		    
		    return sizeForKey(self, key, table)
		  #else
		    #pragma Unused key
		    #pragma Unused table
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PageSize(paperName as String) As Cocoa.NSSize
		  #if targetMacOS
		    declare function pageSizeForPaper lib CocoaLib selector "pageSizeForPaper:" (obj_id as Ptr, paperName as CFStringRef) as Cocoa.NSSize
		    
		    return pageSizeForPaper(self, paperName)
		  #else
		    #pragma Unused paperName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SingleValue(key as String, table as String) As Double
		  #if targetMacOS
		    declare function floatForKey lib CocoaLib selector "floatForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Double
		    
		    return floatForKey(self, key, table)
		  #else
		    #pragma Unused key
		    #pragma Unused table
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringListValue(key as String, table as String) As String()
		  #if targetMacOS
		    declare function stringListForKey lib CocoaLib selector "stringListForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Ptr
		    
		    dim theArray as new CFArray(stringListForKey(self, key, table), not CFType.hasOwnership)
		    return theArray.StringValues
		  #else
		    #pragma Unused key
		    #pragma Unused table
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(key as String, table as String) As String
		  #if targetMacOS
		    declare function stringforKey lib CocoaLib selector "stringForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Ptr
		    
		    return RetainedStringValue(stringForKey(self, key, table))
		  #else
		    #pragma Unused key
		    #pragma Unused table
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableStatus(tableName as String) As TableStatus
		  #if targetMacOS
		    declare function statusForTable lib CocoaLib selector "statusForTable:" (obj_id as Ptr, tableName as CFStringRef) as TableStatus
		    
		    return statusForTable(self, tableName)
		  #else
		    #pragma Unused tableName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Types() As String()
		  #if targetMacOS
		    declare function printerTypes lib CocoaLib selector "printerTypes" (class_id as Ptr) as Ptr
		    
		    dim theArray as new CFArray(printerTypes(Cocoa.NSClassFromString("NSPrinter")), not CFArray.hasOwnership)
		    return theArray.StringValues
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Getting an setting default printer?
		Use CorePrinting methods for that.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function languageLevel lib CocoaLib selector "languageLevel" (obj_id as Ptr) as Integer
			    
			    return languageLevel(self)
			  #endif
			End Get
		#tag EndGetter
		LanguageLevel As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(name(self))
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function type lib CocoaLib selector "type" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(type(self))
			  #endif
			End Get
		#tag EndGetter
		Type As String
	#tag EndComputedProperty


	#tag Constant, Name = kMainPPDTable, Type = String, Dynamic = False, Default = \"PPD", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPPDArgumentTranslationTable, Type = String, Dynamic = False, Default = \"PPDArgumentTranslation", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPPDOptionTranslationTable, Type = String, Dynamic = False, Default = \"PPDOptionTranslation", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPPDOrderDependencyTable, Type = String, Dynamic = False, Default = \"PPDOrderDependency", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPPDUIConstraintsTable, Type = String, Dynamic = False, Default = \"PPDUIConstraints", Scope = Public
	#tag EndConstant


	#tag Enum, Name = TableStatus, Type = Integer, Flags = &h0
		OK = 0
		  NotFound = 1
		Error = 2
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
			Name="LanguageLevel"
			Group="Behavior"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

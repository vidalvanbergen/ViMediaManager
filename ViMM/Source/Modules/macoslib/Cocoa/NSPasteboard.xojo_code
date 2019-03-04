#tag Class
Class NSPasteboard
Inherits NSObject
	#tag Method, Flags = &h0
		Function AvailableType(types() as String) As String
		  
		  #if targetMacOS
		    declare function availableTypeFromArray lib CocoaLib selector "availableTypeFromArray:" (obj_id as Ptr, types as Ptr) as CFStringRef
		    
		    dim returnString as String
		    
		    if types.ubound > -1 then
		      dim ns_array as new NSArray(types)
		      returnString = availableTypeFromArray(self, ns_array)
		    end if
		    
		    return returnString
		    
		  #else
		    #pragma unused types
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanReadItem(types() as String) As Boolean
		  
		  #if targetMacOS
		    declare function canReadItemWithDataConformingToTypes lib CocoaLib selector "canReadItemWithDataConformingToTypes:" _
		    (obj_id as Ptr, types as Ptr) as Boolean
		    
		    dim returnFlag as Boolean
		    
		    if types.ubound > -1 then
		      dim ns_array as new NSArray(types)
		      returnFlag = canReadItemWithDataConformingToTypes(self, ns_array)
		    end if
		    
		    return returnFlag
		    
		  #else
		    #pragma unused types
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanReadObject(classArray as NSArray, options as NSDictionary) As Boolean
		  
		  #if targetMacOS
		    declare function canReadObjectForClasses lib CocoaLib selector "canReadObjectForClasses:options:" _
		    (obj_id as Ptr, classArray as Ptr, options as Ptr) as Boolean
		    
		    dim classArrayRef as Ptr
		    if classArray <> nil then
		      classArrayRef = classArray
		    end if
		    
		    dim optionsRef as Ptr
		    if options <> nil then
		      optionsRef = options
		    end if
		    
		    return canReadObjectForClasses(self, classArrayRef, optionsRef)
		    
		  #else
		    #pragma unused classArray
		    #pragma unused options
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSPasteboard")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearContents()
		  #if TargetMacOS
		    declare function clearContents lib CocoaLib selector "clearContents" (id as Ptr) as integer
		    
		    call  clearContents( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataForType(type as String) As NSData
		  #if targetMacOS
		    declare function dataForType lib CocoaLib selector "dataForType:" (obj_id as Ptr, type as CFStringRef) as Ptr
		    
		    return new NSData (dataForType (self, type), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DragPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSDragPboard")
		  return WithName (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FindPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSFindPboard")
		  return WithName (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSFontPboard")
		  return WithName (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GeneralPasteboard() As NSPasteboard
		  
		  #if targetMacOS
		    declare function generalPasteboard lib CocoaLib selector "generalPasteboard" (obj_id as Ptr) as Ptr
		    
		    dim pasteboardRef as Ptr = generalPasteboard(ClassRef)
		    if pasteboardRef <> nil then
		      return new NSPasteboard(pasteboardRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GeneralPboard_() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSGeneralPboard")
		  'return WithName (name)
		  #pragma unused name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetPasteboard() As NSPasteboard
		  
		  #if targetMacOS
		    declare function pasteboardWithUniqueName lib CocoaLib selector "pasteboardWithUniqueName" (obj_id as Ptr) as Ptr
		    
		    dim pasteboardRef as Ptr = pasteboardWithUniqueName(ClassRef)
		    if pasteboardRef <> nil then
		      return new NSPasteboard(pasteboardRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetPasteboard(file as FolderItem) As NSPasteboard
		  
		  #if targetMacOS
		    declare function pasteboardByFilteringFile lib CocoaLib selector "pasteboardByFilteringFile:" (obj_id as Ptr, fileName as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim pasteboardRef as Ptr = pasteboardByFilteringFile(ClassRef, file.POSIXPath)
		      
		      if pasteboardRef <> nil then
		        return new NSPasteboard(pasteboardRef)
		      else
		        return nil
		      end if
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetPasteboard(pasteboard as NSPasteboard) As NSPasteboard
		  
		  #if targetMacOS
		    declare function pasteboardByFilteringTypesInPasteboard lib CocoaLib selector "pasteboardByFilteringTypesInPasteboard:" (obj_id as Ptr, pasteboard as Ptr) as Ptr
		    
		    dim inPasteboardRef as Ptr
		    if pasteboard <> nil then
		      inPasteboardRef = pasteboard
		    end if
		    
		    dim pasteboardRef as Ptr = pasteboardByFilteringTypesInPasteboard(ClassRef, inPasteboardRef)
		    
		    if pasteboardRef <> nil then
		      return new NSPasteboard(pasteboardRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetPasteboard(name as String) As NSPasteboard
		  
		  #if targetMacOS
		    declare function pasteboardWithName lib CocoaLib selector "pasteboardWithName:" (obj_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim ref as Ptr = pasteboardWithName (ClassRef, name)
		    if ref <> nil then
		      return new NSPasteboard (ref)
		    else
		      return nil
		    end
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetPasteboard(data as String, type as String) As NSPasteboard
		  
		  #if targetMacOS
		    declare function pasteboardByFilteringData lib CocoaLib selector "pasteboardByFilteringData:ofType:" (obj_id as Ptr, data as Ptr, type as CFStringRef) as Ptr
		    
		    dim d as new NSData(data)
		    
		    dim pasteboardRef as Ptr = pasteboardByFilteringData(ClassRef, d, type)
		    
		    if pasteboardRef <> nil then
		      return new NSPasteboard(pasteboardRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(pasteboardItem as NSPasteboardItem) As UInt32
		  
		  #if targetMacOS
		    declare function indexOfPasteboardItem lib CocoaLib selector "indexOfPasteboardItem:" (obj_id as Ptr, pasteboardItem as Ptr) as UInt32
		    
		    dim pasteboardItemRef as Ptr
		    if pasteboardItem <> nil then
		      pasteboardItemRef = pasteboardItem
		    end if
		    
		    return indexOfPasteboardItem(self, pasteboardItemRef)
		    
		  #else
		    #pragma unused pasteboardItem
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Items() As NSPasteboardItem()
		  
		  #if targetMacOS
		    declare function pasteboardItems lib CocoaLib selector "pasteboardItems" (obj_id as Ptr) as Ptr
		    
		    dim retArray() as NSPasteboardItem
		    
		    dim arrayRef as Ptr = pasteboardItems(self)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSPasteboardItem(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSDragPboard() As NSPasteboard
		  
		  static name as String = Cocoa.StringConstant ("NSDragPboard")
		  return GetPasteboard(name)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFindPboard() As NSPasteboard
		  
		  static name as String = Cocoa.StringConstant ("NSFindPboard")
		  return GetPasteboard(name)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontPboard() As NSPasteboard
		  
		  static name as String = Cocoa.StringConstant ("NSFontPboard")
		  return GetPasteboard(name)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSGeneralPboard() As NSPasteboard
		  
		  static name as String = Cocoa.StringConstant ("NSGeneralPboard")
		  return GetPasteboard(name)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeColor() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeColor")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeFindPanelSearchOptions() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeFindPanelSearchOptions")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeFont() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeFont")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeHTML() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeHTML")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeMultipleTextSelection() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeMultipleTextSelection")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypePDF() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypePDF")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypePNG() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypePNG")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeRTF() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeRTF")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeRTFD() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeRTFD")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeRuler() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeRuler")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeSound() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeSound")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeString() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeString")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeTabularText() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeTabularText")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardTypeTIFF() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardTypeTIFF")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardURLReadingContentsConformToTypesKey() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardURLReadingContentsConformToTypesKey")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPasteboardURLReadingFileURLsOnlyKey() As String
		  
		  static name as String = Cocoa.StringConstant ("NSPasteboardURLReadingFileURLsOnlyKey")
		  return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PropertyList(dataType as String) As Ptr
		  
		  #if targetMacOS
		    declare function propertyListForType lib CocoaLib selector "propertyListForType:" (obj_id as Ptr, dataType as CFStringRef) as Ptr
		    
		    return propertyListForType(self, dataType)
		    
		  #else
		    #pragma unused dataType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadObjects(classArray as NSArray, options as NSDictionary) As NSArray
		  
		  #if targetMacOS
		    declare function readObjectsForClasses lib CocoaLib selector "readObjectsForClasses:options:" (obj_id as Ptr, classArray as Ptr, options as Ptr) as Ptr
		    
		    dim classArrayRef as Ptr
		    if classArray <> nil then
		      classArrayRef = classArray
		    end if
		    
		    dim optionsRef as Ptr
		    if options <> nil then
		      optionsRef = options
		    end if
		    
		    dim nsarrayRef as Ptr = readObjectsForClasses(self, classArrayRef, optionsRef)
		    
		    if nsarrayRef <> nil then
		      return new NSArray(nsarrayRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused classArray
		    #pragma unused options
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReleaseGlobally()
		  
		  #if targetMacOS
		    declare sub releaseGlobally lib CocoaLib selector "releaseGlobally" (obj_id as Ptr)
		    
		    releaseGlobally self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RulerPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSRulerPboard")
		  'return WithName (name)
		  return GetPasteboard(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetData(data as String, type as String) As Boolean
		  
		  #if targetMacOS
		    declare function setData lib CocoaLib selector "setData:forType:" (obj_id as Ptr, data as Ptr, type as CFStringRef) as Boolean
		    
		    dim d as new NSData(data)
		    
		    return setData(self, d, type)
		    
		  #else
		    #pragma unused data
		    #pragma unused type
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPropertyList(aPropertyList as Ptr, dataType as String) As Boolean
		  
		  #if targetMacOS
		    declare function setPropertyList lib CocoaLib selector "setPropertyList:forType:" (obj_id as Ptr, aPropertyList as Ptr, dataType as CFStringRef) as Boolean
		    
		    return setPropertyList(self, aPropertyList, dataType)
		    
		  #else
		    #pragma unused aPropertyList
		    #pragma unused dataType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetStringData(aString as String, dataType as String) As Boolean
		  
		  #if targetMacOS
		    declare function setString lib CocoaLib selector "setString:forType:" (obj_id as Ptr, aString as CFStringRef, dataType as CFStringRef) as Boolean
		    
		    return setString(self, aString, dataType)
		    
		  #else
		    #pragma unused aString
		    #pragma unused dataType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringData(dataType as String) As String
		  
		  #if targetMacOS
		    declare function stringForType lib CocoaLib selector "stringForType:" (obj_id as Ptr, dataType as CFStringRef) as CFStringRef
		    
		    return stringForType(self, dataType)
		    
		  #else
		    #pragma unused dataType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Types() As String()
		  
		  #if targetMacOS
		    declare function types lib CocoaLib selector "types" (obj_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim nsarrayRef as Ptr = types(self)
		    if nsarrayRef <> nil then
		      rb_array = new NSArray(nsarrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TypesFilterable(aType as String) As String()
		  
		  #if targetMacOS
		    declare function typesFilterableTo lib CocoaLib selector "typesFilterableTo:" (obj_id as Ptr, aType as CFStringRef) as Ptr
		    
		    dim rb_array() as String
		    
		    dim nsarrayRef as Ptr = typesFilterableTo(self, aType)
		    if nsarrayRef <> nil then
		      rb_array = new NSArray(nsarrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function WithName(name as String) As NSPasteboard
		  #if targetMacOS
		    declare function pasteboardWithName lib CocoaLib selector "pasteboardWithName:" (obj_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim ref as Ptr = pasteboardWithName (ClassRef, name)
		    if ref <> nil then
		      return new NSPasteboard (ref)
		    end
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteObjects(objects as NSArray) As Boolean
		  
		  #if targetMacOS
		    declare function writeObjects lib CocoaLib selector "writeObjects:" (obj_id as Ptr, objects as Ptr) as Boolean
		    
		    dim nsarrayRef as Ptr
		    if objects <> nil then
		      nsarrayRef = objects
		    end if
		    
		    return writeObjects(self, nsarrayRef)
		    
		  #else
		    #pragma unused objects
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Note
			changeCount
		#tag EndNote
		#tag Getter
			Get
			  #if targetMacOS
			    declare function changeCount lib CocoaLib selector "changeCount" (obj_id as Ptr) as Integer
			    
			    return changeCount(self)
			  #endif
			End Get
		#tag EndGetter
		ChangeCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function pasteboardItems lib CocoaLib selector "pasteboardItems" (id as Ptr) as Ptr
			    
			    dim p as Ptr = pasteboardItems( me.id )
			    
			    if p=nil then   return nil
			    
			    return  new NSArray( p, false )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare function writeObjects lib CocoaLib selector "writeObjects:" (id as Ptr, nsa as Ptr) as Boolean
			    
			    call   writeObjects( me.id, value.id )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Items As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as CFStringRef
			    
			    return name(self)
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function types lib CocoaLib selector "types" (obj_id as Ptr) as Ptr
			    
			    return   new NSArray (types (self), false)
			  #endif
			End Get
		#tag EndGetter
		Types As NSArray
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ChangeCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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

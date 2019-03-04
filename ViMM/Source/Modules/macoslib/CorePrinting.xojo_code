#tag Module
Protected Module CorePrinting
	#tag Method, Flags = &h1
		Protected Function DefaultPrinter() As String
		  // Raises an exception if an unexpected OS error occured.
		  
		  #if TargetMacOS
		    
		    dim printerName as string
		    dim printers() as PMPrinter = PrinterList
		    for each printer as PMPrinter in printers
		      if printer.IsDefault then
		        printerName = printer.Name
		        exit
		      end if
		    next
		    
		    return printerName
		    
		    
		    'declare function PMServerCreatePrinterList lib framework (server as Ptr, byref printerList as Ptr) as Integer
		    'declare function PMPrinterIsDefault lib framework (printer as Ptr) as Integer
		    'declare function PMPrinterGetName lib framework (printer as Ptr) as CFStringRef
		    'declare function CFArrayGetCount lib cfframework (theArray as Ptr) as Integer
		    'declare function CFArrayGetValueAtIndex lib cfframework (theArray as Ptr, idx as Integer) as Ptr
		    '
		    'dim osErr As Integer
		    'dim pListRef As Ptr
		    '
		    'osErr = PMServerCreatePrinterList(nil, pListRef)
		    'If osErr <> 0 then
		    'raise new macoslibException ("PMServerCreatePrinterList failed: " + str(osErr))
		    'return ""
		    'end
		    '
		    'dim pCount as Integer = CFArrayGetCount(pListRef)
		    'for i as Integer = 0 to pCount-1
		    'dim pr As Ptr = CFArrayGetValueAtIndex(pListRef, i)
		    'If PMPrinterIsDefault(pr) <> 0 then
		    'dim defaultPrinterName as String = PMPrinterGetName(pr)
		    'return defaultPrinterName
		    'end
		    'next
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PrinterList() As PMPrinter()
		  dim list() as PMPrinter
		  
		  #if TargetMacOS
		    
		    declare function PMServerCreatePrinterList lib framework ( server As Ptr, ByRef printerList As CFTypeRef ) As Integer
		    
		    dim arrayRef as CFTypeRef
		    dim errNum as integer = PMServerCreatePrinterList( nil, arrayRef )
		    if errNum = 0 then
		      dim cfArr As new CFArray( arrayRef, CFType.hasOwnership )
		      dim lastIndex as integer = cfArr.Count - 1
		      for i as integer = 0 to lastIndex
		        dim printerRef as PMTypeRef
		        printerRef.value = cfArr.Value( i )
		        dim thisPrinter as new PMPrinter( printerRef, not PMObject.hasOwnership )
		        list.Append thisPrinter
		      next i
		    end if
		    
		  #endif
		  
		  return list
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PrintSession() As PMPrintSession
		  // Returns a new value for PMPrintSession
		  // Has to be static to retain a value like current printer.
		  
		  static session as new PMPrintSession
		  return session
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetDefaultPrinter(printerName as String) As Boolean
		  // Returns true if setting default printer worked.
		  // Return false if printer isn't found.
		  // Raises an exception if an unexpected OS error occured.
		  
		  #if TargetMacOS
		    
		    dim r as boolean 
		    dim printers() as PMPrinter = PrinterList
		    for each printer as PMPrinter in printers
		      if printer.Name = printerName then
		        printer.SetDefault
		        r = True
		        exit
		      end if
		    next
		    
		    return r
		    
		    
		    'declare function PMServerCreatePrinterList lib framework (server as Ptr, byref printerList as Ptr) as Integer
		    'declare function PMPrinterGetName lib framework (printer as Ptr) as CFStringRef
		    'declare function PMPrinterSetDefault lib framework (printer as Ptr) as Integer
		    'declare function CFArrayGetCount lib cfframework (theArray as Ptr) as Integer
		    'declare function CFArrayGetValueAtIndex lib cfframework (theArray as Ptr, idx as Integer) as Ptr
		    '
		    'dim osErr As Integer
		    'dim pListRef As Ptr
		    '
		    'osErr = PMServerCreatePrinterList(nil, pListRef)
		    'If osErr <> 0 then
		    'raise new macoslibException ("PMServerCreatePrinterList failed: " + str(osErr))
		    'return false
		    'end
		    '
		    'dim targetPrinter as Ptr = nil
		    'dim pCount as integer = CFArrayGetCount(pListRef)
		    'for i as Integer = 0 to pCount-1
		    'dim pr As Ptr = CFArrayGetValueAtIndex(pListRef, i)
		    'dim pName as string = PMPrinterGetName(pr)
		    'if pName = printerName then
		    'targetPrinter = pr
		    'exit
		    'end
		    'next
		    '
		    'if targetPrinter = nil then
		    '// Can't find printer
		    'return false
		    'end
		    '
		    'osErr = PMPrinterSetDefault(targetPrinter)
		    'If osErr <> 0 then
		    'raise new macoslibException ("PMPrinterSetDefault failed: " + str(osErr))
		    'return false
		    'end
		    '
		    'return true
		    
		  #else
		    
		    #pragma unused printerName
		    
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = See also
		NSPrinter class
	#tag EndNote


	#tag Constant, Name = cfframework, Type = String, Dynamic = False, Default = \"CoreFoundation", Scope = Private
	#tag EndConstant

	#tag Constant, Name = framework, Type = String, Dynamic = False, Default = \"ApplicationServices", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = PMTypeRef, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		value As Ptr
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

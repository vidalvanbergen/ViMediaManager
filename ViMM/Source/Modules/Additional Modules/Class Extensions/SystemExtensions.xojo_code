#tag Module
Protected Module SystemExtensions
	#tag Method, Flags = &h0
		Function SystemDoubleClickInterval() As double
		  //# Returns the system double-click time interval in seconds
		  
		  return NSEvent.DoubleClickInterval
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemFinderLabelColors() As Color()
		  //#Returns the Finder labels as an array of colors
		  
		  #if TargetMacOS
		    dim colors() as Variant
		    dim result() as color
		    dim nsa as NSArray = NSWorkspace.FinderLabelColors
		    colors = nsa.VariantValue
		    
		    for each c as Color in Colors
		      result.Append   c
		    next
		    
		    result.Remove  0  //Remove the first label color which actually corresponds to "no label" (defined as black)
		    return  result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemFinderLabels() As string()
		  //#Returns the Finder labels as an array of strings
		  
		  #if TargetMacOS
		    dim labels() as Variant
		    dim result() as string
		    dim nsa as NSArray = NSWorkspace.FinderLabels
		    labels = nsa.VariantValue
		    
		    for each s as string in labels
		      result.Append   s
		    next
		    
		    result.Remove  0  //Remove the first label which actually corresponds to "no label"
		    return  result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemListPrinterNames() As string()
		  //# Returns the list of the installed printers name
		  
		  return   NSPrinter.Names
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemListPrinterTypes() As string()
		  //# Returns the list of the installed printers type
		  
		  return   NSPrinter.Types
		  
		  
		End Function
	#tag EndMethod


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

#tag Class
Private Class NavDialogCreationOptions
	#tag Method, Flags = &h0
		Sub Constructor()
		  #if TargetMacOS
		    
		    soft declare function NavGetDefaultDialogCreationOptions lib CarbonLib (outOptions as Ptr) as Integer
		    
		    const sizeOfNavDialogCreationOptions = 66
		    me.struct =  new MemoryBlock(sizeOfNavDialogCreationOptions)
		    dim OSStatus as Integer = NavGetDefaultDialogCreationOptions(me.struct)
		    if OSStatus <> 0 then
		      System.Log System.LogLevelError, "NavDialogCreationOptions.Operator_Convert: NavGetDefaultDialogCreationOptions returned error " + Str(OSStatus) + "."
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  #if TargetMacOS
		    
		    if me.struct.Ptr(offsetClientName) <> nil then
		      soft declare sub CFRelease lib CarbonLib (cf as Ptr)
		      CFRelease me.struct.Ptr(offsetClientName)
		    end if
		    if me.struct.Ptr(offsetActionButtonLabel) <> nil then
		      soft declare sub CFRelease lib CarbonLib (cf as Ptr)
		      CFRelease me.struct.Ptr(offsetActionButtonLabel)
		    end if
		    if me.struct.Ptr(offsetCancelButtonLabel) <> nil then
		      soft declare sub CFRelease lib CarbonLib (cf as Ptr)
		      CFRelease me.struct.Ptr(offsetCancelButtonLabel)
		    end if
		    
		    if me.struct.Ptr(offsetMessage) <> nil then
		      soft declare sub CFRelease lib CarbonLib (cf as Ptr)
		      CFRelease me.struct.Ptr(offsetMessage)
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetStringFromCFStringRef(p as Ptr) As String
		  #if TargetMacOS
		    
		    if p = nil then
		      return ""
		    end if
		    
		    soft declare function CFStringGetLength lib CarbonLib (theString as Ptr) as Integer
		    
		    dim stringLength as Integer = CFStringGetLength(p)
		    
		    if stringLength = 0 then
		      return ""
		    end if
		    
		    soft declare function CFStringGetMaximumSizeForEncoding lib CarbonLib (length as Integer, enc as Integer) as Integer
		    
		    const kCFStringEncodingUTF8 = &h08000100
		    
		    dim maxSize as Integer = CFStringGetMaximumSizeForEncoding(stringLength, kCFStringEncodingUTF8)
		    if maxSize < 0 then
		      return ""
		    end if
		    
		    soft declare function CFStringGetCString lib CarbonLib (theString as Ptr, buffer as Ptr, bufferSize as Integer, enc as Integer) as Boolean
		    
		    dim buffer as new MemoryBlock(1 + maxSize)
		    
		    if CFStringGetCString(p, buffer, buffer.Size, kCFStringEncodingUTF8) then
		      return DefineEncoding(buffer.CString(0), Encodings.UTF8)
		    else
		      return ""
		    end if
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewCFStringRef(s as String) As Ptr
		  #if TargetMacOS
		    
		    soft declare function CFStringCreateWithCString lib CarbonLib (alloc as Ptr, cStr as CString, encoding as Integer) as Ptr
		    
		    if Encoding(s) <> nil then
		      return CFStringCreateWithCString(nil, s, Encoding(s).code)
		    else
		      const kCFStringEncodingInvalidId = &hffffffff
		      
		      return CFStringCreateWithCString(nil, s, kCFStringEncodingInvalidId)
		    end if
		    
		  #else
		    
		    #pragma unused s
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As MemoryBlock
		  return me.struct
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetCFStringField(value as String, offset as Integer)
		  #if TargetMacOS
		    
		    //release existing value, I think
		    if me.struct.Ptr(offset) <> nil then
		      soft declare sub CFRelease lib CarbonLib (cf as Ptr)
		      CFRelease me.struct.Ptr(offset)
		    end if
		    
		    if value <> "" then
		      me.struct.Ptr(offset) = NewCFStringRef(value)
		    else
		      me.struct.Ptr(offset) = nil
		    end if
		    
		  #else
		    
		    #pragma unused value
		    #pragma unused offset
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = struct
		66
		struct NavDialogCreationOptions {
		   UInt16 version; 2
		   NavDialogOptionFlags optionFlags; 6
		   Point location; 10
		   CFStringRef clientName; 14
		   CFStringRef windowTitle; 18
		   CFStringRef actionButtonLabel; 22
		   CFStringRef cancelButtonLabel; 26
		   CFStringRef saveFileName; 30
		   CFStringRef message; 34
		   UInt32 preferenceKey; 38
		   CFArrayRef popupExtension; 42
		   WindowModality modality; 46
		   WindowRef parentWindow; 50
		   char reserved[16]; 66
		};
	#tag EndNote

	#tag Note, Name = typedef UInt32 WindowModality;
		enum {
		   kWindowModalityNone = 0,
		   kWindowModalitySystemModal = 1,
		   kWindowModalityAppModal = 2,
		   kWindowModalityWindowModal = 3
		};
		
		
		Constant Descriptions
		kWindowModalityNone
		A window does not prevent interaction with any other window in the system. 
		
		kWindowModalitySystemModal
		The window is system-modal; that is, the user cannot perform any other action until the window is dismissed. 
		
		kWindowModalityAppModal
		The window is application-modal; that is the user cannot perform any other action within the application until the window is dismissed. The user can switch to other applications, however. 
		
		kWindowModalityWindowModal
		The window is document-modal; the user cannot perform any other action within the current document window until the modal window associated with it is dismissed. The user can switch to other windows or applications, however. Sheets are document-modal.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.struct.Ptr(offsetActionButtonLabel) <> nil then
			    return GetStringFromCFStringRef(me.struct.Ptr(offsetActionButtonLabel))
			  else
			    return ""
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetCFStringField value, offsetActionButtonLabel
			End Set
		#tag EndSetter
		ActionButtonLabel As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.struct.Ptr(offsetCancelButtonLabel) <> nil then
			    return GetStringFromCFStringRef(me.struct.Ptr(offsetCancelButtonLabel))
			  else
			    return ""
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetCFStringField value, offsetCancelButtonLabel
			End Set
		#tag EndSetter
		CancelButtonLabel As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.struct.Ptr(offsetClientName) <> nil then
			    return GetStringFromCFStringRef(me.struct.Ptr(offsetClientName))
			  else
			    return ""
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetCFStringField value, offsetClientName
			End Set
		#tag EndSetter
		ClientName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.struct.UInt32Value(offsetOptionFlags)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.struct.UInt32Value(offsetOptionFlags) = value
			End Set
		#tag EndSetter
		ConfigOptions As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.struct.Int16Value(offsetLeft)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.struct.Int16Value(offsetLeft) = value
			End Set
		#tag EndSetter
		Left As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  me.SetCFStringField value, offsetMessage
			End Set
		#tag EndSetter
		Message As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.struct.Long(offsetModality)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.struct.Long(offsetModality) = value
			End Set
		#tag EndSetter
		Modality As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.struct.Long(46) = 0 then
			    return nil
			  else
			    dim theWindow as Window = nil
			    for i as Integer = 0 to WindowCount - 1
			      dim w as Window = Window(i)
			      if w <> nil and w.Handle = me.struct.Long(46) then
			        theWindow = w
			        exit
			      end if
			    next
			    return theWindow
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> nil then
			    me.struct.Long(46) = value.Handle
			  else
			    me.struct.Long(46) = 0
			  end if
			End Set
		#tag EndSetter
		ParentWindow As WIndow
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		PopupExtension() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		PreferenceKey As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pWindow As Window
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.struct.Ptr(offsetSaveFileName) <> nil then
			    return GetStringFromCFStringRef(me.struct.Ptr(offsetSaveFileName))
			  else
			    return ""
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetCFStringField value, offsetSaveFileName
			End Set
		#tag EndSetter
		SaveFileName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private struct As MemoryBlock
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.struct.Int16Value(offsetTop)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.struct.Int16Value(offsetTop) = value
			End Set
		#tag EndSetter
		Top As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.struct.Ptr(offsetWindowTitle) <> nil then
			    return GetStringFromCFStringRef(me.struct.Ptr(offsetWindowTitle))
			  else
			    return ""
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.SetCFStringField value, offsetWindowTitle
			End Set
		#tag EndSetter
		WindowTitle As String
	#tag EndComputedProperty


	#tag Constant, Name = offsetActionButtonLabel, Type = Double, Dynamic = False, Default = \"18", Scope = Private
	#tag EndConstant

	#tag Constant, Name = offsetCancelButtonLabel, Type = Double, Dynamic = False, Default = \"22", Scope = Private
	#tag EndConstant

	#tag Constant, Name = offsetClientName, Type = Double, Dynamic = False, Default = \"10", Scope = Private
	#tag EndConstant

	#tag Constant, Name = offsetLeft, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = offsetMessage, Type = Double, Dynamic = False, Default = \"30", Scope = Public
	#tag EndConstant

	#tag Constant, Name = offsetModality, Type = Double, Dynamic = False, Default = \"42", Scope = Private
	#tag EndConstant

	#tag Constant, Name = offsetOptionFlags, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = offsetSaveFileName, Type = Double, Dynamic = False, Default = \"26", Scope = Private
	#tag EndConstant

	#tag Constant, Name = offsetTop, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = offsetWindowTitle, Type = Double, Dynamic = False, Default = \"14", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActionButtonLabel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CancelButtonLabel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfigOptions"
			Group="Behavior"
			Type="UInt32"
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Modality"
			Group="Behavior"
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
			Name="ParentWindow"
			Group="Behavior"
			InitialValue="0"
			Type="WIndow"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferenceKey"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SaveFileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="WindowTitle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

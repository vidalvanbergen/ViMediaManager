#tag Module
Protected Module M_PList
	#tag Method, Flags = &h0
		Sub LoadFromPlist_MTC(Extends dict As Dictionary, plistFile As FolderItem)
		  // Added by Kem Tekinay.
		  
		  // Loads the contents of a plist file into a dictionary.
		  // Will leave existing, unique keys within the dictionary undisturbed.
		  // Will use MacOSLib on the Mac, or custom code on other platforms.
		  // Will raise an exception on error.
		  
		  const kErrString = "An error occurred while loading from the plist file."
		  
		  #if TargetMacOS
		    
		    dim temp as Dictionary = PlistAsDictionary_MTC( plistFile )
		    if temp is nil then
		      pRaiseError kErrString
		    end if
		    
		    // Clone the temp dictionary to the one provided
		    pCloneDictionary( temp, dict )
		    
		  #else
		    
		    if not dict.LoadXML( plistFile ) then
		      pRaiseError kErrString
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadFromPlist_MTC(Extends dict As Dictionary, plistString As String)
		  // Added by Kem Tekinay.
		  
		  // Loads the contents of a plist string into a dictionary.
		  // Will leave existing, unique keys within the dictionary undisturbed.
		  // Will use MacOSLib on the Mac, or custom code on other platforms.
		  // Will raise an exception on error.
		  
		  const kErrString = "An error occurred while loading from the plist file."
		  
		  #if TargetMacOS
		    
		    dim temp as Dictionary = PlistAsDictionary_MTC( plistString )
		    if temp is nil then
		      pRaiseError kErrString
		    end if
		    
		    // Clone the temp dictionary to the one provided
		    pCloneDictionary( temp, dict )
		    
		  #else
		    
		    if not dict.LoadXML( plistString ) then
		      pRaiseError kErrString
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pCloneDictionary(ByRef sourceDict As Dictionary, ByRef targetDict As Dictionary)
		  dim keys() as variant = sourceDict.Keys
		  for i as integer = 0 to keys.Ubound
		    dim thisKey as variant = keys( i )
		    targetDict.Value( thisKey ) = sourceDict.Value( thisKey )
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlistAsDictionary_MTC(plistFile As FolderItem) As Dictionary
		  // Added by Kem Tekinay.
		  
		  // Loads the contents of a plist file into a dictionary.
		  // Will use MacOSLib on the Mac, or custom code on other platforms.
		  // Will return nil on an error.
		  
		  if plistFile is nil then
		    return nil
		  end if
		  
		  dim dict as Dictionary
		  
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListFile( plistFile, CoreFoundation.kCFPropertyListImmutable )
		    
		    select case true
		    case plist IsA CFDictionary
		      dict = CFDictionary( plist )
		      
		    case plist IsA CFArray
		      dim v() as variant = CFArray( plist )
		      dict = new Dictionary
		      dict.Value( "cfarray" ) = v
		      
		    end select
		    
		  #else
		    
		    dict = new Dictionary
		    if not dict.LoadXML( plistFile ) then
		      dict = nil
		    end if
		    
		  #endif
		  
		  return dict
		  
		  Exception err as RuntimeException
		    return nil
		    // This should never really happen with a proper plist file
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlistAsDictionary_MTC(plistString As String) As Dictionary
		  // Added by Kem Tekinay.
		  
		  // Loads the contents of a plist string into a dictionary.
		  // Will use MacOSLib on the Mac, or custom code on other platforms.
		  // Will return nil on an error.
		  
		  dim dict as Dictionary
		  
		  if plistString.LenB = 0 then
		    return dict
		  end if
		  
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListString( plistString, CoreFoundation.kCFPropertyListImmutable )
		    
		    select case true
		    case plist IsA CFDictionary
		      dict = CFDictionary( plist )
		      
		    case plist IsA CFArray
		      dim v() as variant = CFArray( plist )
		      dict = new Dictionary
		      dict.Value( "cfarray" ) = v
		      
		    end select
		    
		  #else
		    
		    dict = new Dictionary
		    if not dict.LoadXML( plistString ) then
		      dict = nil
		    end if
		    
		  #endif
		  
		  return dict
		  
		  Exception err as RuntimeException
		    return nil
		    // This should never really happen with a proper plist file
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseError(msg As String)
		  dim err as new RuntimeException
		  err.Message = msg
		  raise err
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveToPlistFile_MTC(Extends dict As Dictionary, plistFile As FolderItem)
		  // Added by Kem Tekinay.
		  
		  // Saves the contents of a dictionary to a plist.
		  // Will use MacOSLib on the Mac, or custom code on other platforms.
		  // Will raise an exception on error.
		  
		  const kErrString = "An error occurred while saving to the plist file."
		  
		  if plistFile is nil then
		    dim err as new NilObjectException
		    err.Message = "The plistFile cannot be nil."
		    raise err
		  end if
		  
		  #if TargetMacOS
		    
		    dim plist as CoreFoundation.CFPropertyList
		    if dict.Count = 1 and dict.Key( 0 ) = "cfarray" then
		      dim v as variant = dict.Value( dict.Key( 0 ) )
		      plist = CoreFoundation.CFPropertyList( CoreFoundation.CFTypeFromVariant( v ) )
		    else
		      plist = new CFMutableDictionary( dict )
		    end if
		    
		    if not plist.WriteToFile( plistFile, true ) then
		      pRaiseError kErrString
		    end if
		    
		  #else
		    
		    if not dict.SaveXML( plistFile, true, true ) then
		      pRaiseError kErrString
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Legal
		This module was created by Kem Tekinay, MacTechnologies Consulting (ktekinay@mactechnologies.com).
		It is copyright ©2012, all rights reserved.
		
		You may use this module AS IS at your own risk for any purpose. The author does not warrant its use
		for any particular purpose and disavows any responsibility for bad design, poor execution,
		or any other faults.
		
		The author does not actively support this module, although comments and recommendations
		are welcome.
		
		You may modify code in this module as long as those modifications are clearly indicated
		via comments in the source code.
		
		You may distribute this module, modified or unmodified, as long as any modifications
		are clearly indicated, as noted above, and this copyright notice is not disturbed or removed.
		
		This module is distributed as part of, and is dependent on, the MacOSLib project.
	#tag EndNote

	#tag Note, Name = Usage
		This module provides convenience methods for working with plists. It
		requires both MacOSLib and the XMLDictionary module, also part of the 
		MacOSLib project.
		
		In general, you should use the MacPListBrowser class instead of this module 
		as that class is more robust and will handle cases where the case-sensitivity
		of plist keys is an issue.
	#tag EndNote


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

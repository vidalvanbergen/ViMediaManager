#tag Module
Protected Module FSEventModule
	#tag Method, Flags = &h1
		Protected Function TextConstantsFromFlags(flags as Int32) As string()
		  #if TargetMacOS
		    if flags = 0 then
		      return  Array( "kFSEventStreamEventFlagNone" )
		    end if
		    
		    dim flagText() as string
		    
		    dim bitIndex as Integer = 1
		    dim flagList() as String = Split(kFlagList, ",")
		    for i as Integer = 0 to UBound(flagList)
		      if (flags and bitIndex) <> 0 then
		        flagText.Append flagList(i + 1)
		        bitIndex = bitIndex * 2
		      end if
		    next
		    
		    return flagText
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = kFlagList, Type = String, Dynamic = False, Default = \"kFSEventStreamEventFlagNone\x2CkFSEventStreamEventFlagMustScanSubDirs\x2CkFSEventStreamEventFlagUserDropped\x2CkFSEventStreamEventFlagKernelDropped\x2CkFSEventStreamEventFlagEventIdsWrapped\x2CkFSEventStreamEventFlagHistoryDone\x2CkFSEventStreamEventFlagRootChanged\x2CkFSEventStreamEventFlagMount\x2CkFSEventStreamEventFlagUnmount\x2CkFSEventStreamEventFlagItemCreated\x2CkFSEventStreamEventFlagItemRemoved\x2CkFSEventStreamEventFlagItemInodeMetaMod\x2CkFSEventStreamEventFlagItemRenamed\x2CkFSEventStreamEventFlagItemModified\x2CkFSEventStreamEventFlagItemFinderInfoMod\x2CkFSEventStreamEventFlagItemChangeOwner\x2CkFSEventStreamEventFlagItemXattrMod\x2CkFSEventStreamEventFlagItemIsFile\x2CkFSEventStreamEventFlagItemIsDir\x2CkFSEventStreamEventFlagItemIsSymlink\r", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFSEventModuleVersion, Type = Double, Dynamic = False, Default = \"100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagEventIdsWrapped, Type = Double, Dynamic = False, Default = \"&h8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagHistoryDone, Type = Double, Dynamic = False, Default = \"&h10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemChangeOwner, Type = Double, Dynamic = False, Default = \"&h4000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemCreated, Type = Double, Dynamic = False, Default = \"&h100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemFinderInfoMod, Type = Double, Dynamic = False, Default = \"&h2000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemInodeMetaMod, Type = Double, Dynamic = False, Default = \"&h400", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemIsDir, Type = Double, Dynamic = False, Default = \"&h20000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemIsFile, Type = Double, Dynamic = False, Default = \"&h10000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemIsSymlink, Type = Double, Dynamic = False, Default = \"&h40000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemModified, Type = Double, Dynamic = False, Default = \"&h1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemRemoved, Type = Double, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemRenamed, Type = Double, Dynamic = False, Default = \"&h800", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemXattrMod, Type = Double, Dynamic = False, Default = \"&h8000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagKernelDropped, Type = Double, Dynamic = False, Default = \"&h4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagMount, Type = Double, Dynamic = False, Default = \"&h40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagMustScanSubDirs, Type = Double, Dynamic = False, Default = \"&h1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagRootChanged, Type = Double, Dynamic = False, Default = \"&h20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagUnmount, Type = Double, Dynamic = False, Default = \"&h80", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagUserDropped, Type = Double, Dynamic = False, Default = \"&h2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventIdSinceNow, Type = Double, Dynamic = False, Default = \"&hFFFFFFFFFFFFFFFF", Scope = Public
	#tag EndConstant


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

#tag Module
Protected Module NavigationServices
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesCancelHandler()
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesChooseHandler(items() as FolderItem)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesDiscardChangesHandler()
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesDiscardDocumentsHandler()
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesDontSaveChangesHandler()
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesNewFolderHandler(item as FolderItem)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesOpenHandler(items() as FolderItem)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesReviewDocumentsHandler()
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesSaveAsHandler(saveDirectory as FolderItem, fileName as String)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NavServicesSaveChangesHandler()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Function Version() As UInt32
		  //returns a BCD coded version string
		  
		  #if TargetMacOS
		    
		    soft declare function NavLibraryVersion lib "Carbon.framework" () as UInt32
		    
		    return NavLibraryVersion
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Constant, Name = kNavGenericSignature, Type = String, Dynamic = False, Default = \"****", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavSaveChangesClosingDocument, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavSaveChangesOther, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavSaveChangesQuittingApplication, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionCancel, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionChoose, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionDiscardChanges, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionDiscardDocuments, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionDontSaveChanges, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionNewFolder, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionOpen, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionReviewDocuments, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionSaveAs, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNavUserActionSaveChanges, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant


	#tag Structure, Name = NavCBRec, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		version as UInt16
		  context as Ptr
		  window as Ptr
		  customRect as MacRect
		  previewRect as MacRect
		  eventData as NavEventData
		  userAction as UInt32
		reserved(217) as Int8
	#tag EndStructure

	#tag Structure, Name = NavEventData, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		eventDataParms as NavEventDataInfo
		itemHit as Int16
	#tag EndStructure

	#tag Structure, Name = NavEventDataInfo, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		param as Ptr
	#tag EndStructure

	#tag Structure, Name = NavReplyRecord, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		version as UInt16
		  validRecord as Boolean
		  replacing as Boolean
		  isStationery as Boolean
		  translationNeeded as Boolean
		  selection as AEDesc
		  keyScript as Int16
		  fileTranslation as Ptr
		  reserved1 as UInt32
		  saveFileName as Ptr
		  savefileExtensionHidden as Boolean
		  reserved2 as Uint8
		reserved(224) as Int8
	#tag EndStructure

	#tag Structure, Name = Rect, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		top as Int16
		  left as Int16
		  bottom as Int16
		right as Int16
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

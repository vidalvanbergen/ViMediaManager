#tag Class
Protected Class Error
Inherits RuntimeException
	#tag Method, Flags = &h0
		Sub Constructor(errorCode as Integer)
		  self.ErrorNumber = errorCode
		  
		  #if targetMacOS
		    declare function SecCopyErrorMessageString lib KeychainServices.framework (status as Integer, reserved as Ptr) as Ptr
		    
		    const reserved = nil
		    self.Message = NotRetainedStringValue(SecCopyErrorMessageString(errorCode, reserved))
		  #endif
		End Sub
	#tag EndMethod


	#tag Constant, Name = ACLNotSimple, Type = Double, Dynamic = False, Default = \"-25240", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Allocate, Type = Double, Dynamic = False, Default = \"-108", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AuthFailed, Type = Double, Dynamic = False, Default = \"-25293", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BufferTooSmall, Type = Double, Dynamic = False, Default = \"-25301", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CreateChainFailed, Type = Double, Dynamic = False, Default = \"-25318", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DataNotAvailable, Type = Double, Dynamic = False, Default = \"-25316", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DataNotModifiable, Type = Double, Dynamic = False, Default = \"-25317", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DataTooLarge, Type = Double, Dynamic = False, Default = \"-25302", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Decode, Type = Double, Dynamic = False, Default = \"-26275", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DuplicateCallback, Type = Double, Dynamic = False, Default = \"-25297", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DuplicateItem, Type = Double, Dynamic = False, Default = \"-25299", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DuplicateKeychain, Type = Double, Dynamic = False, Default = \"-25296", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InteractionNotAllowed, Type = Double, Dynamic = False, Default = \"-25308", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InteractionRequired, Type = Double, Dynamic = False, Default = \"-25315", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidCallback, Type = Double, Dynamic = False, Default = \"-25298", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidItemRef, Type = Double, Dynamic = False, Default = \"-25304", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidKeychain, Type = Double, Dynamic = False, Default = \"-25295", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidOwnerEdit, Type = Double, Dynamic = False, Default = \"-25244", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidPasswordRef, Type = Double, Dynamic = False, Default = \"-25261", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidPrefsDomain, Type = Double, Dynamic = False, Default = \"-25319", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidSearchRef, Type = Double, Dynamic = False, Default = \"-25305", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidTrustSetting, Type = Double, Dynamic = False, Default = \"-25242", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InvalidTrustSettings, Type = Double, Dynamic = False, Default = \"-25262", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ItemNotFound, Type = Double, Dynamic = False, Default = \"-25300", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KeyIsSensitive, Type = Double, Dynamic = False, Default = \"-25258", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KeySizeNotAllowed, Type = Double, Dynamic = False, Default = \"-25311", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MultiplePrivKeys, Type = Double, Dynamic = False, Default = \"-25259", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoAccessForItem, Type = Double, Dynamic = False, Default = \"-25243", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoCertificateModule, Type = Double, Dynamic = False, Default = \"-25313", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoDefaultKeychain, Type = Double, Dynamic = False, Default = \"-25307", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoPolicyModule, Type = Double, Dynamic = False, Default = \"-25314", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoStorageModule, Type = Double, Dynamic = False, Default = \"-25312", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoSuchAttr, Type = Double, Dynamic = False, Default = \"-25303", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoSuchClass, Type = Double, Dynamic = False, Default = \"-25306", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoSuchKeychain, Type = Double, Dynamic = False, Default = \"-25294", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NotAvailable, Type = Double, Dynamic = False, Default = \"-25291", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoTrustSettings, Type = Double, Dynamic = False, Default = \"-25263", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Param, Type = Double, Dynamic = False, Default = \"-50", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PassphraseRequired, Type = Double, Dynamic = False, Default = \"-25260", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Pkcs12VerifyFailure, Type = Double, Dynamic = False, Default = \"-25264", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PolicyNotFound, Type = Double, Dynamic = False, Default = \"-25241", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ReadOnly, Type = Double, Dynamic = False, Default = \"-25292", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ReadOnlyAttr, Type = Double, Dynamic = False, Default = \"-25309", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Success, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TrustNotAvailable, Type = Double, Dynamic = False, Default = \"-25245", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Unimplemented, Type = Double, Dynamic = False, Default = \"-4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UnknownFormat, Type = Double, Dynamic = False, Default = \"-25257", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UnsupportedFormat, Type = Double, Dynamic = False, Default = \"-25256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WrongSecVersion, Type = Double, Dynamic = False, Default = \"-25310", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Reason"
			Group="Behavior"
			Type="Text"
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

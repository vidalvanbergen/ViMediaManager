#tag Class
Class NSSharingService
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(Title as NSString, Image as NSImage, AltImage as NSImage, Block as Ptr = Nil)
		  
		  #if TargetCocoa then
		    declare function initWithTitleImageAlternateImageHandler lib CocoaLib selector "initWithTitle:image:alternateImage:handler:" (obj_id as Ptr, Title as Ptr, Image as Ptr, AlternateImage as Ptr, block as Ptr) as Ptr
		    
		    dim titleRef as Ptr
		    if Title <> nil then
		      titleRef = Title
		    end if
		    
		    dim imageRef as Ptr
		    if Image <> nil then
		      imageRef = Image
		    end if
		    
		    dim AltImageRef as Ptr
		    if AltImage <> nil then
		      AltImageRef = AltImage
		    end if
		    
		    super.Constructor( initWithTitleImageAlternateImageHandler( Initialize(Allocate(Cocoa.NSClassFromString("NSSharingService"))), titleRef, imageRef, AltImageRef, Block ), not hasOwnership )
		  #else
		    #pragma Unused Title
		    #pragma Unused Image
		    #pragma Unused AltImage
		    #pragma Unused Block
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getAlternateImage lib CocoaLib selector "alternateImage" (obj_id as Ptr) as Ptr
			    
			    return New NSImage( getAlternateImage( self ) )
			  #endif
			End Get
		#tag EndGetter
		AlternateImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getImage lib CocoaLib selector "image" (obj_id as Ptr) as Ptr
			    
			    return New NSImage( getImage( self ) )
			  #endif
			End Get
		#tag EndGetter
		Image As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getTitle lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			    
			    return getTitle( self )
			  #endif
			End Get
		#tag EndGetter
		Title As String
	#tag EndComputedProperty


	#tag Constant, Name = NSSharingServiceNameAddToAperture, Type = String, Dynamic = False, Default = \"NSSharingServiceNameAddToAperture", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNameAddToIPhoto, Type = String, Dynamic = False, Default = \"NSSharingServiceNameAddToIPhoto", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNameAddToSafariReadingList, Type = String, Dynamic = False, Default = \"NSSharingServiceNameAddToSafariReadingList", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNameComposeEmail, Type = String, Dynamic = False, Default = \"NSSharingServiceNameComposeEmail", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNameComposeMessage, Type = String, Dynamic = False, Default = \"NSSharingServiceNameComposeMessage", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNamePostImageOnFlickr, Type = String, Dynamic = False, Default = \"NSSharingServiceNamePostImageOnFlickr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNamePostOnFacebook, Type = String, Dynamic = False, Default = \"NSSharingServiceNamePostOnFacebook", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNamePostOnSinaWeibo, Type = String, Dynamic = False, Default = \"NSSharingServiceNamePostOnSinaWeibo", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNamePostOnTwitter, Type = String, Dynamic = False, Default = \"NSSharingServiceNamePostOnTwitter", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNamePostVideoOnTudou, Type = String, Dynamic = False, Default = \"NSSharingServiceNamePostVideoOnTudou", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNamePostVideoOnVimeo, Type = String, Dynamic = False, Default = \"NSSharingServiceNamePostVideoOnVimeo", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNamePostVideoOnYouku, Type = String, Dynamic = False, Default = \"NSSharingServiceNamePostVideoOnYouku", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNameSendViaAirDrop, Type = String, Dynamic = False, Default = \"NSSharingServiceNameSendViaAirDrop", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNameUseAsDesktopPicture, Type = String, Dynamic = False, Default = \"NSSharingServiceNameUseAsDesktopPicture", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSharingServiceNameUseAsTwitterProfileImage, Type = String, Dynamic = False, Default = \"NSSharingServiceNameUseAsTwitterProfileImage", Scope = Public
	#tag EndConstant


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
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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

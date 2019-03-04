#tag Class
Class AVAssetTrack
Inherits NSObject
	#tag Method, Flags = &h0
		Function AvailableMetadataFormats() As NSString()
		  dim arr() as NSString
		  
		  #if TargetMacOS
		    
		    declare function availableMetadataFormats lib Framework selector "availableMetadataFormats" ( obj_id As Ptr ) As Ptr
		    // Introduced in MacOS X 10.7.
		    
		    dim p as Ptr = availableMetadataFormats( self.id )
		    if p <> nil then
		      dim nsa as new NSArray( p, not NSObject.hasOwnership )
		      dim cnt as integer = nsa.Count
		      for i as integer = 1 to cnt
		        dim nss as new NSString( nsa.Value( i - 1 ) )
		        arr.Append nss
		      next i
		    end if
		    
		  #endif
		  
		  return arr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableTrackAssociationTypes() As NSString()
		  dim arr() as NSString
		  
		  #if TargetMacOS
		    
		    if me.RespondsToSelector( "availableTrackAssociationTypes" ) then
		      declare function availableTrackAssociationTypes lib Framework selector "availableTrackAssociationTypes" ( obj_id As Ptr ) As Ptr
		      // Introduced in MacOS X 10.9.
		      
		      dim p as Ptr = availableTrackAssociationTypes( self.id )
		      if p <> nil then
		        dim nsa as new NSArray( p, not NSObject.hasOwnership )
		        dim cnt as integer = nsa.Count
		        for i as integer = 1 to cnt
		          dim nss as new NSString( nsa.Value( i - 1 ) )
		          arr.Append nss
		        next i
		      end if
		      
		    end if
		    
		  #endif
		  
		  return arr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CommonMetadata() As AVMetadataItem()
		  dim arr() as AVMetadataItem
		  
		  #if TargetMacOS
		    
		    declare function commonMetadata lib Framework selector "commonMetadata" ( obj_id As Ptr ) As Ptr
		    // Introduced in MacOS X 10.7.
		    
		    dim p as Ptr = commonMetadata( self.id )
		    
		    dim nsarr as NSArray
		    if p <> nil then
		      nsarr = new NSArray( p, not NSObject.HasOwnership )
		      dim cnt as integer = nsarr.Count
		      for i as integer = 1 to cnt
		        dim avitem as new AVMetadataItem( nsarr.Value( i - 1 ) )
		        arr.Append avitem
		      next i
		    end if
		    
		  #endif
		  
		  return arr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetadataForFormat(theFormat As NSString) As AVMetadataItem()
		  dim arr() as AVMetadataItem
		  
		  #if TargetMacOS
		    
		    declare function metadataForFormat lib Framework selector "metadataForFormat:" ( obj_id As Ptr, theFormat As Ptr ) As Ptr
		    // Introduced in MacOS X 10.7.
		    
		    dim p as Ptr
		    if theFormat <> nil then
		      p = metadataForFormat( self.id, theFormat.id )
		    else
		      p = metadataForFormat( self.id, nil )
		    end if
		    
		    dim nsarr as NSArray
		    if p <> nil then
		      nsarr = new NSArray( p, not NSObject.HasOwnership )
		      dim cnt as integer = nsarr.Count
		      for i as integer = 1 to cnt
		        dim avitem as new AVMetadataItem( nsarr.Value( i - 1 ) )
		        arr.Append avitem
		      next i
		    end if
		    
		  #else
		    
		    #pragma unused theFormat
		    
		  #endif
		  
		  return arr
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as AVAsset
			  
			  #if TargetMacOS
			    
			    declare function getAsset lib Framework selector "asset" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = getAsset( self.id )
			    if p <> nil then
			      r = new AVAsset( p, not NSObject.hasOwnership )
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		Asset As AVAsset
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function enabled lib Framework selector "enabled" ( obj_id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.7.
			    
			    return enabled( self.id )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function extendedLanguageTag lib Framework selector "extendedLanguageTag" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = extendedLanguageTag( self.id )
			    dim nss as NSString
			    if p <> nil then
			      nss = new NSString( p, not NSObject.hasOwnership )
			    end if
			    return nss
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ExtendedLanguageTag As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function languageCode lib Framework selector "languageCode" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = languageCode( self.id )
			    dim nss as NSString
			    if p <> nil then
			      nss = new NSString( p, not NSObject.hasOwnership )
			    end if
			    return nss
			    
			  #endif
			  
			End Get
		#tag EndGetter
		LanguageCode As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function mediaType lib Framework selector "mediaType" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = mediaType( self.id )
			    dim nss as NSString
			    if p <> nil then
			      nss = new NSString( p, not NSObject.hasOwnership )
			    end if
			    return nss
			    
			  #endif
			  
			End Get
		#tag EndGetter
		MediaType As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function preferredVolume lib Framework selector "preferredVolume" ( obj_id As Ptr ) as Double
			    // Introduced in MacOS X 10.7.
			    
			    return preferredVolume( self.id )
			    
			  #endif
			End Get
		#tag EndGetter
		PreferredVolume As Double
	#tag EndComputedProperty


	#tag Constant, Name = Framework, Type = String, Dynamic = False, Default = \"AppKit.framework", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
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
			Name="PreferredVolume"
			Group="Behavior"
			Type="Double"
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

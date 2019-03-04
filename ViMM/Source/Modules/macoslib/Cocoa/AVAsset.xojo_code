#tag Class
Class AVAsset
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function AssetWithURL(URL As NSURL) As AVAsset
		  dim r as AVAsset
		  
		  #if TargetCocoa
		    
		    declare function assetWithURL lib Framework selector "assetWithURL:" ( id As Ptr, URL As Ptr ) As Ptr
		    // Introduced in MacOS X 10.7.
		    
		    dim urlPtr as Ptr
		    if URL <> nil then
		      urlPtr = URL.id
		    end if
		    dim p as Ptr = assetWithURL( ClassRef, urlPtr )
		    if p <> nil then
		      r = new AVAsset( p, not NSObject.hasOwnership )
		    end if
		    
		  #else
		    
		    #pragma unused URL
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

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

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("AVAsset")
		  return ref
		  
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

	#tag Method, Flags = &h0
		Function Tracks() As AVAssetTrack()
		  dim arr() as AVAssetTrack
		  
		  #if TargetMacOS
		    
		    declare function tracks lib Framework selector "tracks" ( obj_id As Ptr ) As Ptr
		    // Introduced in MacOS X 10.7.
		    
		    dim p as Ptr = tracks( self.id )
		    
		    dim nsarr as NSArray
		    if p <> nil then
		      nsarr = new NSArray( p, not NSObject.HasOwnership )
		      dim cnt as integer = nsarr.Count
		      for i as integer = 1 to cnt
		        dim t as new AVAssetTrack( nsarr.Value( i - 1 ) )
		        arr.Append t
		      next i
		    end if
		    
		  #endif
		  
		  return arr
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as AVMetadataItem
			  
			  #if TargetMacOS
			    
			    if me.RespondsToSelector( "creationDate" ) then
			      declare function creationDate lib Framework selector "creationDate" ( obj_id As Ptr ) As Ptr
			      // Introduced in MacOS X 10.8.
			      
			      dim p as Ptr = creationDate( self.id )
			      if p <> nil then
			        r = new AVMetadataItem( p, not NSObject.hasOwnership )
			      end if
			    end if
			    
			  #endif
			  
			  return r
			End Get
		#tag EndGetter
		CreationDate As AVMetadataItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function duration lib Framework selector "duration" ( obj_id As Ptr ) As CMTime
			    // Introduced in MacOS X 10.7.
			    
			    dim time as CMTime = duration( me.id )
			    return time
			    
			  #endif
			End Get
		#tag EndGetter
		Duration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Cocoa.CMTimeGetSeconds( Duration )
			End Get
		#tag EndGetter
		DurationInSeconds As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function hasProtectedContent lib Framework selector "hasProtectedContent" ( obj_id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.7.
			    
			    return hasProtectedContent( self.id )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		HasProtectedContent As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function lyrics lib Framework selector "lyrics" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = lyrics( self.id )
			    dim nss as NSString
			    if p <> nil then
			      nss = new NSString( p, not NSObject.hasOwnership )
			    end if
			    
			    return nss
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Lyrics As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function preferredRate lib Framework selector "preferredRate" ( obj_id As Ptr ) as Double
			    // Introduced in MacOS X 10.7.
			    
			    return preferredRate( self.id )
			    
			  #endif
			End Get
		#tag EndGetter
		PreferredRate As Double
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
			Name="DurationInSeconds"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasProtectedContent"
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
			Name="PreferredRate"
			Group="Behavior"
			Type="Double"
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

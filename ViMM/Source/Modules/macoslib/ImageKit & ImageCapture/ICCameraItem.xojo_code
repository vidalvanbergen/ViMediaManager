#tag Class
Protected Class ICCameraItem
Inherits NSObject
	#tag Method, Flags = &h0
		Function AddedAfterContentCatalogCompleted() As Boolean
		  #if TargetMacOS
		    declare function addedAfterContentCatalogCompleted lib ICLib selector "addedAfterContentCatalogCompleted" (id as Ptr) as boolean
		    
		    return  addedAfterContentCatalogCompleted( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreationDate() As NSDate
		  #if TargetMacOS
		    declare function creationDate lib ICLib selector "creationDate" (id as Ptr) as Ptr
		    
		    dim p as Ptr = creationDate( me.id )
		    if p<>nil then
		      return  new NSDate( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Device() As ICCameraDevice
		  #if TargetMacOS
		    declare function device lib ICLib selector "device" (id as Ptr) as Ptr
		    
		    return  new ICCameraDevice( device( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileSystemPath() As String
		  #if TargetMacOS
		    declare function fileSystemPath lib ICLib selector "fileSystemPath" (id as Ptr) as CFStringRef
		    
		    return  fileSystemPath( me.id )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInTemporaryStore() As Boolean
		  #if TargetMacOS
		    declare function isInTemporaryStore lib ICLib selector "isInTemporaryStore" (id as Ptr) as boolean
		    
		    return  isInTemporaryStore( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLocked() As Boolean
		  #if TargetMacOS
		    declare function isLocked lib ICLib selector "isLocked" (id as Ptr) as boolean
		    
		    return  isLocked( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsRaw() As Boolean
		  #if TargetMacOS
		    declare function isRaw lib ICLib selector "isRaw" (id as Ptr) as boolean
		    
		    return  isRaw( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetadataIfAvailable() As NSDictionary
		  #if TargetMacOS
		    declare function metadataIfAvailable lib ICLib selector "metadataIfAvailable" (id as Ptr) as Ptr
		    
		    dim p as Ptr = metadataIfAvailable( me.id )
		    if p<>nil then
		      return  new NSDictionary( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ModificationDate() As NSDate
		  #if TargetMacOS
		    declare function modificationDate lib ICLib selector "modificationDate" (id as Ptr) as Ptr
		    
		    dim p as Ptr = modificationDate( me.id )
		    if p<>nil then
		      return  new NSDate( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  #if TargetMacOS
		    declare function name lib ICLib selector "name" (id as Ptr) as CFStringRef
		    
		    return  name( me.id )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentFolder() As ICCameraFolder
		  #if TargetMacOS
		    declare function parentFolder lib ICLib selector "parentFolder" (id as Ptr) as Ptr
		    
		    dim p as Ptr = parentFolder( me.id )
		    if p<>nil then
		      return  new ICCameraFolder( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ptpObjectHandle() As integer
		  #if TargetMacOS
		    declare function ptpObjectHandle lib ICLib selector "ptpObjectHandle" (id as Ptr) as integer
		    
		    return  ptpObjectHandle( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ThumbnailIfAvailable() As CGImage
		  #if TargetMacOS
		    declare function thumbnailIfAvailable lib ICLib selector "thumbnailIfAvailable" (id as Ptr) as Ptr
		    
		    dim p as Ptr = thumbnailIfAvailable( me.id )
		    if p<>nil then
		      return   new CGImage( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserData() As NSMutableDictionary
		  #if TargetMacOS
		    declare function userData lib ICLib selector "userData" (id as Ptr) as Ptr
		    
		    dim p as Ptr = userData( me.id )
		    if p<>nil then
		      return  new NSMutableDictionary( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTI() As String
		  #if TargetMacOS
		    declare function UTI lib ICLib selector "UTI" (id as Ptr) as CFStringRef
		    
		    return  UTI( me.id )
		    
		  #endif
		End Function
	#tag EndMethod


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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

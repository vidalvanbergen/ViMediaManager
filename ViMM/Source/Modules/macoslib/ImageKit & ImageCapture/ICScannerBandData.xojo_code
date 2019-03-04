#tag Class
Protected Class ICScannerBandData
Inherits NSObject
	#tag Method, Flags = &h0
		Function BigEndian() As Boolean
		  #if TargetMacOS
		    declare function bigEndian lib ICLib selector "bigEndian" (id as Ptr) as Boolean
		    
		    return   bigEndian( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BitsPerComponent() As integer
		  #if TargetMacOS
		    declare function bitsPerComponent lib ICLib selector "bitsPerComponent" (id as Ptr) as integer
		    
		    return   bitsPerComponent( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BitsPerPixel() As integer
		  #if TargetMacOS
		    declare function bitsPerPixel lib ICLib selector "bitsPerPixel" (id as Ptr) as integer
		    
		    return   bitsPerPixel( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BytesPerRow() As integer
		  #if TargetMacOS
		    declare function bytesPerRow lib ICLib selector "bytesPerRow" (id as Ptr) as integer
		    
		    return   bytesPerRow( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorSyncProfilePath() As string
		  #if TargetMacOS
		    declare function colorSyncProfilePath lib ICLib selector "colorSyncProfilePath" (id as Ptr) as CFStringRef
		    
		    return   colorSyncProfilePath( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataBuffer() As NSData
		  #if TargetMacOS
		    declare function dataBuffer lib ICLib selector "dataBuffer" (id as Ptr) as Ptr
		    
		    return   new NSData( dataBuffer( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataNumRows() As integer
		  #if TargetMacOS
		    declare function dataNumRows lib ICLib selector "dataNumRows" (id as Ptr) as integer
		    
		    return   dataNumRows( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSize() As integer
		  #if TargetMacOS
		    declare function dataSize lib ICLib selector "dataSize" (id as Ptr) as integer
		    
		    return   dataSize( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataStartRow() As integer
		  #if TargetMacOS
		    declare function dataStartRow lib ICLib selector "dataStartRow" (id as Ptr) as integer
		    
		    return   dataStartRow( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullImageHeight() As integer
		  #if TargetMacOS
		    declare function fullImageHeight lib ICLib selector "fullImageHeight" (id as Ptr) as integer
		    
		    return   fullImageHeight( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullImageWidth() As integer
		  #if TargetMacOS
		    declare function fullImageWidth lib ICLib selector "fullImageWidth" (id as Ptr) as integer
		    
		    return   fullImageWidth( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumComponents() As integer
		  #if TargetMacOS
		    declare function numComponents lib ICLib selector "numComponents" (id as Ptr) as integer
		    
		    return   numComponents( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PixelDataType() As integer
		  #if TargetMacOS
		    declare function pixelDataType lib ICLib selector "pixelDataType" (id as Ptr) as integer
		    
		    return   pixelDataType( me.id )
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

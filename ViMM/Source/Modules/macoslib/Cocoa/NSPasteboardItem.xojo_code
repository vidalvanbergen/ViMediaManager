#tag Class
Class NSPasteboardItem
Inherits NSObject
	#tag Method, Flags = &h0
		Function AvailableTypeFromArray(types as NSArray) As String
		  #if TargetMacOS
		    declare function availableTypeFromArray lib CocoaLib selector "availableTypeFromArray:" (id as Ptr, nsa as Ptr) as CFStringRef
		    
		    return  availableTypeFromArray( me.id, types.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  self.Constructor(NSObject.Initialize(NSObject.Allocate( "NSPasteboardItem")), hasOwnership)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataForType(type as String) As NSData
		  #if TargetMacOS
		    declare function dataForType lib CocoaLib selector "dataForType:" (id as Ptr, type as CFStringRef) as Ptr
		    
		    return  new NSData( dataForType( me.id, type ), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PropertyList(dataType as String) As Ptr
		  
		  #if targetMacOS
		    declare function propertyListForType lib CocoaLib selector "propertyListForType:" (obj_id as Ptr, dataType as CFStringRef) as Ptr
		    
		    return propertyListForType(self, dataType)
		    
		  #else
		    #pragma unused dataType
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PropertyListForType(type as String) As variant
		  #if TargetMacOS
		    declare function propertyListForType lib CocoaLib selector "propertyListForType:" (id as Ptr, type as CFStringRef) as Ptr
		    
		    dim p as Ptr
		    p = propertyListForType( me.id, type )
		    
		    return   Cocoa.NSObjectFromNSPtr( p )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetDataForType(type as String, data as NSData) As Boolean
		  #if TargetMacOS
		    declare function setData lib CocoaLib selector "setData:forType:" (id as Ptr, data as Ptr, type as CFStringRef) as Boolean
		    
		    return  setData( me.id, data.id, type )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPropertyListForType(type as String, plist as NSObject) As Boolean
		  #if TargetMacOS
		    declare function setPropertyList lib CocoaLib selector "setPropertyList:forType:" (id as Ptr, plist as Ptr, type as CFStringRef) as Boolean
		    
		    return  setPropertyList( me.id, plist.id, type )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetStringForType(type as String, s as string) As Boolean
		  #if TargetMacOS
		    declare function setString lib CocoaLib selector "setString:forType:" (id as Ptr, theStr as CFStringRef, type as CFStringRef) as Boolean
		    
		    return  setString( me.id, s, type )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringForType(type as String) As string
		  #if TargetMacOS
		    declare function stringForType lib CocoaLib selector "stringForType:" (id as Ptr, type as CFStringRef) as CFStringRef
		    
		    return  stringForType( me.id, type )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Types() As NSArray
		  #if TargetMacOS
		    declare function m_types lib CocoaLib selector "types" (id as Ptr) as Ptr
		    
		    return  new NSArray( m_types( me.id ), false )
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

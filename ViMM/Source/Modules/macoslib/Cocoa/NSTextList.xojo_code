#tag Class
Class NSTextList
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(markerFormat as String, options as UInt32)
		  
		  #if targetMacOS
		    declare function initWithMarkerFormat lib CocoaLib selector "initWithMarkerFormat:options:" _
		    (obj_id as Ptr, markerFormat as CFStringRef, options as UInt32) as Ptr
		    
		    super.Constructor(initWithMarkerFormat(Allocate("NSTextList"), markerFormat, options), NSTextList.hasOwnership)
		    
		  #else
		    #pragma unused markerFormat
		    #pragma unused options
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Marker(itemNum as Integer) As String
		  
		  #if targetMacOS
		    declare function markerForItemNumber lib CocoaLib selector "markerForItemNumber:" (obj_id as Ptr, itemNum as Integer) as CFStringRef
		    
		    return markerForItemNumber(self, itemNum)
		    
		  #else
		    #pragma unused itemNum
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function listOptions lib CocoaLib selector "listOptions" (obj_id as Ptr) as UInt32
			    
			    return listOptions(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ListOptions As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function markerFormat lib CocoaLib selector "markerFormat" (obj_id as Ptr) as CFStringRef
			    
			    return markerFormat(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		MarkerFormat As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function startingItemNumber lib CocoaLib selector "startingItemNumber" (obj_id as Ptr) as Integer
			    
			    return startingItemNumber(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setStartingItemNumber lib CocoaLib selector "setStartingItemNumber:" (obj_id as Ptr, itemNum as Integer)
			    
			    setStartingItemNumber self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		StartingItemNumber As Integer
	#tag EndComputedProperty


	#tag Constant, Name = NSTextListPrependEnclosingMarker, Type = Double, Dynamic = False, Default = \"1", Scope = Public
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
			Name="ListOptions"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarkerFormat"
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
			Name="StartingItemNumber"
			Group="Behavior"
			Type="Integer"
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

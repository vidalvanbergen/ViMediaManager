#tag Class
Class NSDockTile
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    super.Constructor(Initialize(Allocate(Cocoa.NSClassFromString("NSDockTile"))))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Display()
		  //# Redraws the dock tile’s content.
		  
		  #if TargetMacOS
		    declare sub display lib CocoaLib selector "display" (obj_id as Ptr)
		    
		    display self
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the tile’s current badge label.
			  
			  #if TargetMacOS
			    declare function badgeLabel lib CocoaLib selector "badgeLabel" (obj_id as Ptr) as CFStringRef
			    
			    return badgeLabel(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the string to be displayed in the tile’s badging area.
			  
			  #if TargetMacOS
			    declare sub setBadgeLabel lib CocoaLib selector "setBadgeLabel:" (obj_id as Ptr, aString as CFStringRef)
			    
			    setBadgeLabel self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		BadgeLabel As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the tile’s current badge value.
			  
			  return Val( BadgeLabel )
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the value to be displayed in the tile’s badging area.
			  
			  BadgeLabel = str( value )
			End Set
		#tag EndSetter
		BadgeValue As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the view used to draw the dock tile contents.
			  
			  #if TargetMacOS
			    declare function contentView lib CocoaLib selector "contentView" (obj_id as Ptr) as Ptr
			    
			    return contentView(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the view to use for drawing the dock tile contents.
			  
			  #if TargetMacOS
			    declare sub setContentView lib CocoaLib selector "setContentView:" (obj_id as Ptr, aView as Ptr)
			    
			    setContentView self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ContentView As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the object represented by the dock tile.
			  
			  #if TargetMacOS
			    declare function owner lib CocoaLib selector "owner" (obj_id as Ptr) as Ptr
			    
			    return owner(self)
			  #endif
			End Get
		#tag EndGetter
		Owner As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Boolean value indicating whether the tile is badged with the application’s icon.
			  
			  #if TargetMacOS
			    declare function showsApplicationBadge lib CocoaLib selector "showsApplicationBadge" (obj_id as Ptr) as Boolean
			    
			    return showsApplicationBadge(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets whether the tile should be badged with the application’s icon.
			  
			  #if TargetMacOS
			    declare sub setShowsApplicationBadge lib CocoaLib selector "setShowsApplicationBadge:" (obj_id as Ptr, flag as Boolean)
			    
			    setShowsApplicationBadge self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ShowsApplicationBadge As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the size of the tile.
			  
			  #if TargetMacOS
			    declare function size lib CocoaLib selector "size" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return size(self)
			  #endif
			End Get
		#tag EndGetter
		Size As Cocoa.NSSize
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BadgeLabel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BadgeValue"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
			Name="ShowsApplicationBadge"
			Group="Behavior"
			Type="Boolean"
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

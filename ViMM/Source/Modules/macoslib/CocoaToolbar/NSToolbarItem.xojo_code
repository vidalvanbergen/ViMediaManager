#tag Class
Class NSToolbarItem
Inherits NSObject
	#tag Method, Flags = &h0
		Function ActionHandler() As CocoaToolbar.ActionDelegate
		  // Part of the NSToolbarItemInterface interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionHandler(assigns action as CocoaToolbar.ActionDelegate)
		  // Part of the NSToolbarItemInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(identifier as String)
		  
		  // instantiate a new NSToolbarItem object with the given identifier (which must be unique)
		  
		  #if targetCocoa
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    declare function initWithItemIdentifier Lib CocoaLib selector "initWithItemIdentifier:" (obj_id as Ptr, itemIdentifier as CFStringRef) as Ptr
		    
		    dim itemRef as Ptr = initWithItemIdentifier(Allocate("NSToolbarItem"), identifier)
		    super.Constructor(itemRef, NSObject.hasOwnership)
		    
		  #else
		    #pragma unused identifier
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Enabled() As Boolean
		  
		  // get the enabled property
		  
		  return mEnabled
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Enabled(assigns value as Boolean)
		  
		  // set the enabled property
		  
		  mEnabled = value
		  self.Validate // force Item validation to immediatly reflect changes
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Image() As NSImage
		  
		  // get the item image as NSImage
		  
		  #if targetCocoa
		    declare function image Lib CocoaLib selector "image" (obj_id as Ptr) as Ptr
		    
		    return new NSImage(image(self))
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Image(assigns n as NSImage)
		  
		  // set the image item as NSImage
		  
		  #if targetCocoa
		    declare sub setImage Lib CocoaLib selector "setImage:" (obj_id as Ptr, image as Ptr)
		    
		    setImage(self, n)
		    
		  #else
		    #pragma unused n
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsVisible() As Boolean
		  
		  // returns if the item is currently visible or in overflow (or not present in toolbar)
		  
		  dim toolbarRef as Ptr = ItemToolbar
		  if toolbarRef <> nil then
		    dim parentToolbar as new NSToolbar(toolbarRef)
		    for each item as NSToolbarItem in parentToolbar.VisibleItems
		      if item.itemIdentifier = self.itemIdentifier then
		        return true
		      end if
		    next
		  end if
		  
		  return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemLabel() As String
		  
		  #if targetCocoa
		    declare function itemLabel Lib CocoaLib selector "label" (obj_id as Ptr) as CFStringRef
		    
		    return itemLabel(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ItemLabel(assigns aString as String)
		  
		  #if targetCocoa
		    declare sub setLabel Lib CocoaLib selector "setLabel:" (obj_id as Ptr, aLabel as CFStringRef)
		    
		    setLabel(self, aString)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemToolbar() As Ptr
		  
		  // return the toolbar to which the item belongs
		  
		  #if targetCocoa
		    declare function itemToolbar Lib CocoaLib selector "toolbar" (obj_id as Ptr) as Ptr
		    
		    return itemToolbar(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Validate()
		  
		  // force item validation
		  
		  #if targetCocoa
		    declare sub validate Lib CocoaLib selector "validate" (obj_id as Ptr)
		    
		    validate(self)
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the Action sent to target
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function action Lib CocoaLib selector "action" (obj_id as Ptr) as Ptr
			    
			    return action(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setAction Lib CocoaLib selector "setAction:" (obj_id as Ptr, actionSEL as Ptr)
			    
			    setAction(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Action As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get if the item is automatically validated (the toolbar calls validate method)
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function autovalidates Lib CocoaLib selector "autovalidates" (obj_id as Ptr) as Boolean
			    
			    return autovalidates(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setAutovalidates Lib CocoaLib selector "setAutovalidates:" (obj_id as Ptr, value as Boolean)
			    
			    setAutovalidates(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Autovalidates As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  // return the item unique identifier
			  
			  #if targetCocoa
			    declare function itemIdentifier Lib CocoaLib selector "itemIdentifier" (obj_id as Ptr) as CFStringRef
			    
			    return itemIdentifier(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ItemIdentifier As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the max size of the item. used with custom view toolbar items
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function maxSize Lib CocoaLib selector "maxSize" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return maxSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setMaxSize Lib CocoaLib selector "setMaxSize:" (obj_id as Ptr, size as Cocoa.NSSize)
			    
			    setMaxSize(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MaxSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			private storage for enabled property
		#tag EndNote
		Private mEnabled As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the menu when the item is in overflow
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function menuFormRepresentation Lib CocoaLib selector "menuFormRepresentation" (obj_id as Ptr) as Ptr
			    
			    return menuFormRepresentation(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setMenuFormRepresentation Lib CocoaLib selector "setMenuFormRepresentation:" (obj_id as Ptr, menuForm as Ptr)
			    
			    setMenuFormRepresentation(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MenuFormRepresentation As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the min size of the item. used with custom view toolbar items
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function minSize Lib CocoaLib selector "minSize" (obj_id as Ptr) as Cocoa.NSSize
			    
			    return minSize(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setMinSize Lib CocoaLib selector "setMinSize:" (obj_id as Ptr, size as Cocoa.NSSize)
			    
			    setMinSize(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		MinSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the label shown in customize toolbar panel
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function paletteLabel Lib CocoaLib selector "paletteLabel" (obj_id as Ptr) as CFStringRef
			    
			    return paletteLabel(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setPaletteLabel Lib CocoaLib selector "setPaletteLabel:" (obj_id as Ptr, aLabel as CFStringRef)
			    
			    setPaletteLabel(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PaletteLabel As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get tag
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function tag Lib CocoaLib selector "tag" (obj_id as Ptr) as Integer
			    
			    return tag(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setTag Lib CocoaLib selector "setTag:" (obj_id as Ptr, itemTag as Integer)
			    
			    setTag(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Tag As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get target for sending action
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function target Lib CocoaLib selector "target" (obj_id as Ptr) as Ptr
			    
			    return target(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setTarget Lib CocoaLib selector "setTarget:" (obj_id as Ptr, targetID as Ptr)
			    
			    setTarget(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Target As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the tooltip for the item
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function toolTip Lib CocoaLib selector "toolTip" (obj_id as Ptr) as CFStringRef
			    
			    return toolTip(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setToolTip Lib CocoaLib selector "setToolTip:" (obj_id as Ptr, toolTip as CFStringRef)
			    
			    setToolTip(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ToolTip As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the view for custom view items
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function view Lib CocoaLib selector "view" (obj_id as Ptr) as Ptr
			    
			    return view(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setView Lib CocoaLib selector "setView:" (obj_id as Ptr, aView as Ptr)
			    
			    setView(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		View As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			set/get the visibility priority when the toolbar needs to overflow
		#tag EndNote
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function visibilityPriority Lib CocoaLib selector "visibilityPriority" (obj_id as Ptr) as NSToolbarItemVisibilityPriority
			    
			    return visibilityPriority(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setVisibilityPriority Lib CocoaLib selector "setVisibilityPriority:" (obj_id as Ptr, priority as NSToolbarItemVisibilityPriority)
			    
			    setVisibilityPriority(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		VisibilityPriority As NSToolbarItemVisibilityPriority
	#tag EndComputedProperty


	#tag Enum, Name = NSToolbarItemVisibilityPriority, Type = Integer, Flags = &h0
		NSToolbarItemVisibilityPriorityStandard = 0
		  NSToolbarItemVisibilityPriorityLow = -1000
		  NSToolbarItemVisibilityPriorityHigh = 1000
		NSToolbarItemVisibilityPriorityUser = 2000
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Autovalidates"
			Group="Behavior"
			Type="Boolean"
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
			Name="ItemIdentifier"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="PaletteLabel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tag"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ToolTip"
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
		#tag ViewProperty
			Name="VisibilityPriority"
			Group="Behavior"
			Type="NSToolbarItemVisibilityPriority"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSToolbarItemVisibilityPriorityStandard"
				"-1000 - NSToolbarItemVisibilityPriorityLow"
				"1000 - NSToolbarItemVisibilityPriorityHigh"
				"2000 - NSToolbarItemVisibilityPriorityUser"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

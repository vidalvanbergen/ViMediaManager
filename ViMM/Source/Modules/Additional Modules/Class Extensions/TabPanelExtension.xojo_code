#tag Module
Protected Module TabPanelExtension
	#tag Method, Flags = &h0
		Function AllowsTruncatedLabels(Extends t as TabPanel) As Boolean
		  //# Returns whether if the receiver allows truncating for labels that don’t fit on a tab.
		  
		  #if TargetCocoa
		    declare function allowsTruncatedLabels lib CocoaLib selector "allowsTruncatedLabels" (obj_id as Integer) as Boolean
		    
		    return allowsTruncatedLabels(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AllowsTruncatedLabels(Extends t as TabPanel, assigns value as Boolean)
		  //# Sets whether the receiver allows truncating for names that don’t fit on a tab.
		  
		  #if TargetCocoa
		    declare sub setAllowsTruncatedLabels lib CocoaLib selector "setAllowsTruncatedLabels:" (obj_id as Integer, value as Boolean)
		    
		    setAllowsTruncatedLabels(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlSize(Extends t as TabPanel) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Integer) as NSControlSize
		    
		    return controlSize(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends t as TabPanel, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Integer, value as NSControlSize)
		    
		    setControlSize(t.handle, value)
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MinimumSize(Extends t as TabPanel) As Cocoa.NSSize
		  //# Returns the minimum size necessary for the receiver to display tabs in a useful way.
		  
		  #if TargetCocoa
		    declare function minimumSize lib CocoaLib selector "minimumSize" (obj_id as Integer) as Cocoa.NSSize
		    
		    return minimumSize(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectFirst(extends t as TabPanel)
		  //# This action method selects the first tab view item.
		  
		  #if TargetMacOS then
		    declare sub selectFirstTabViewItem lib CocoaLib selector "selectFirstTabViewItem:" (obj_id as Integer)
		    
		    selectFirstTabViewItem(t.Handle)
		  #else
		    #pragma Unused t
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectLast(extends t as TabPanel)
		  //# This action method selects the last tab view item.
		  
		  #if TargetMacOS then
		    declare sub selectLastTabViewItem lib CocoaLib selector "selectLastTabViewItem:" (obj_id as Integer)
		    
		    selectLastTabViewItem(t.Handle)
		  #else
		    #pragma Unused t
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectNext(extends t as TabPanel)
		  //# This action method selects the next tab view item in the sequence.
		  
		  #if TargetMacOS then
		    declare sub selectNextTabViewItem lib CocoaLib selector "selectNextTabViewItem:" (obj_id as Integer)
		    
		    selectNextTabViewItem(t.Handle)
		  #else
		    #pragma Unused t
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectPrevious(extends t as TabPanel)
		  //# This action method selects the previous tab view item in the sequence.
		  
		  #if TargetMacOS then
		    declare sub selectPreviousTabViewItem lib CocoaLib selector "selectPreviousTabViewItem:" (obj_id as Integer)
		    
		    selectPreviousTabViewItem(t.Handle)
		  #else
		    #pragma Unused t
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type(Extends t as TabPanel) As NSTabViewType
		  //# Returns the tab type for the tab panel.
		  
		  #if TargetCocoa
		    declare function tabViewType lib CocoaLib selector "tabViewType" (obj_id as Integer) as NSTabViewType
		    
		    return tabViewType(t.handle)
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Type(Extends t as TabPanel, assigns type as NSTabViewType)
		  //# Sets the tab type to NSTabViewType.
		  
		  #if TargetCocoa
		    declare sub setTabViewType lib CocoaLib selector "setTabViewType:" (obj_id as Integer, type as NSTabViewType)
		    
		    setTabViewType(t.handle, type)
		  #else
		    #pragma unused t
		    #pragma unused type
		  #endif
		End Sub
	#tag EndMethod


	#tag Enum, Name = NSTabViewType, Type = Integer, Flags = &h0
		NSTopTabsBezelBorder
		  NSLeftTabsBezelBorder
		  NSBottomTabsBezelBorder
		  NSRightTabsBezelBorder
		  NSNoTabsBezelBorder
		  NSNoTabsLineBorder
		NSNoTabsNoBorder
	#tag EndEnum


	#tag ViewBehavior
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
End Module
#tag EndModule

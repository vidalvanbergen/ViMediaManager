#tag Module
Protected Module PopupMenuExtension
	#tag Method, Flags = &h0
		Sub AddRowWithTagAndPicture(extends p as PopupMenu, Name as String, Tag as Variant, Ico as Picture)
		  //# Convenience extension to quickly add a new popupmenu row with a row tag and row picture.
		  
		  //@ Tag can be nil
		  //@ Ico can be nil
		  
		  p.AddRow Name
		  p.RowTag( p.ListCount - 1 ) = Tag
		  if Ico <> nil then
		    p.Icon(   p.ListCount - 1 ) = NSImage.CreateFromPicture( Ico )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ArrowPosition(Extends p as PopupMenu) As NSPopupArrowPosition
		  //# Returns the position of the arrow displayed on the PopupMenu.
		  
		  #if TargetCocoa
		    declare function arrowPosition lib CocoaLib selector "arrowPosition" (obj_id as Ptr) as NSPopUpArrowPosition
		    
		    return arrowPosition(p.PopUpButtonCell)
		  #else
		    #pragma unused p
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ArrowPosition(extends p as PopupMenu, assigns Value as NSPopupArrowPosition)
		  //# Sets the position of the arrow displayed on the PopupMenu.
		  
		  //@ NSPopUpNoArrow means no arrow is displayed. _
		  //  NSPopUpArrowAtCenter means the arrow is vertically centered, pointing to the right, vertically centered. _
		  //  NSPopUpArrowAtBottom means the arrow is at the bottom, pointing downward.
		  
		  #if TargetCocoa
		    declare sub setArrowPosition lib CocoaLib selector "setArrowPosition:" (obj_id as Ptr, inFlag as NSPopupArrowPosition)
		    
		    setArrowPosition(p.PopUpButtonCell, Value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoenablesItems(Extends p as PopupMenu) As Boolean
		  //# Returns whether the PopupMenu automatically enables and disables its items every time a user event occurs.
		  
		  #if TargetCocoa
		    declare function autoenablesItems lib CocoaLib selector "autoenablesItems" (obj_id as Integer) as Boolean
		    
		    return autoenablesItems(p.handle)
		  #else
		    #pragma unused p
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutoenablesItems(Extends p as PopupMenu, assigns value as Boolean)
		  //# Sets whether the PopupMenu automatically enables and disables its items every time a user event occurs.
		  
		  #if TargetCocoa then
		    declare sub setAutoenablesItems lib CocoaLib selector "setAutoenablesItems:" (obj_id as Integer, value as Boolean)
		    
		    setAutoenablesItems(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BezelStyle(extends p as PopupMenu) As NSBezelStyle
		  //# Returns the appearance of the PopupMenu's border.
		  
		  #if TargetCocoa then
		    declare function bezelStyle lib CocoaLib selector "bezelStyle" (obj_id as Integer) as NSBezelStyle
		    
		    return bezelStyle(p.Handle)
		  #else
		    #pragma Unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BezelStyle(extends p as PopupMenu, assigns Value as NSBezelStyle)
		  //# Sets the appearance of the border, if the PopupMenu has one.
		  
		  #if TargetCocoa then
		    declare sub setBezelStyle lib CocoaLib selector "setBezelStyle:" (obj_id as Integer, inFlag as NSBezelStyle)
		    
		    setBezelStyle(p.Handle, Value)
		  #else
		    #pragma Unused p
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bordered(Extends p as PopupMenu) As Boolean
		  //# Returns a Boolean value indicating whether the combo box has a border.
		  
		  #if TargetCocoa then
		    declare function isBordered lib CocoaLib selector "isBordered" (obj_id as Integer) as Boolean
		    
		    return isBordered(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bordered(Extends p as PopupMenu, Assigns value as Boolean)
		  //# Places or removes a border on the combo box and redraws the combo box.
		  
		  #if TargetCocoa then
		    declare sub setBordered lib CocoaLib selector "setBordered:" (obj_id as Integer, flag as Boolean)
		    
		    setBordered(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlSize(Extends p as PopupMenu) As NSControlSize
		  
		  #if TargetCocoa
		    if IsYosemite then
		      declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Integer) as NSControlSize
		      
		      return controlSize(p.handle)
		    end if
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends p as PopupMenu, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    if IsYosemite then
		      declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Integer, value as NSControlSize)
		      
		      setControlSize(p.handle, value)
		    end if
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Icon(extends p as PopupMenu, index as Integer, setTemplate as Boolean = False, assigns value as NSImage)
		  #if TargetCocoa
		    declare function menu lib CocoaLib selector "menu" (obj_id as Integer) as Ptr
		    declare function itemAtIndex lib CocoaLib selector "itemAtIndex:" (obj_id as Ptr, index as Integer) as Ptr
		    declare sub setImage lib CocoaLib selector "setImage:" (obj_id as Ptr, menuImage as Ptr)
		    declare sub setSize lib CocoaLib selector "setSize:" (obj_id as Ptr, aSize as Cocoa.NSSize)
		    
		    dim m as Ptr = menu(p.Handle)
		    dim item as Ptr = itemAtIndex(m, index)
		    dim icon as NSImage
		    if value <> nil then
		      icon = value.Copy
		    end if
		    
		    const MenuIconSize = 16
		    
		    if icon is nil then
		      setImage( item, nil )
		    else
		      dim size as Cocoa.NSSize
		      size.Width = MenuIconSize
		      size.Height = MenuIconSize
		      setSize(icon, size)
		      icon.Template = setTemplate
		      setImage(item, icon)
		    end if
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused index
		    #pragma unused value
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTitle(extends p as PopupMenu, Title as String) As Integer
		  //# Returns the index of the item with the specified title.
		  
		  #if TargetCocoa then
		    declare function indexOfItemWithTitle lib CocoaLib selector "indexOfItemWithTitle:" (obj_id as Integer, inTitle as CFStringRef) as Integer
		    
		    return indexOfItemWithTitle(p.Handle, Title)
		  #else
		    #pragma Unused p
		    #pragma Unused Title
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isBordered(extends p as PopupMenu) As Boolean
		  //# Returns a Boolean value indicating whether the PopupMenu has a border.
		  
		  #if TargetCocoa then
		    declare function isBordered lib CocoaLib selector "isBordered" (obj_id as Integer) as Boolean
		    
		    return isBordered(p.Handle)
		  #else
		    #pragma Unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub isBordered(extends p as PopupMenu, assigns Value as Boolean)
		  //# Places or removes a border on the PopupMenu and redraws the PopupMenu.
		  
		  #if TargetCocoa then
		    declare sub setBordered lib CocoaLib selector "setBordered:" (obj_id as Integer, inFlag as Boolean)
		    
		    setBordered(p.Handle, Value)
		  #else
		    #pragma Unused p
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isTransparent(extends p as PopupMenu) As Boolean
		  //# Sets whether the PopupMenu is transparent.
		  
		  //@ A transparent button never draws itself, but it receives mouse-down events and tracks the mouse properly.
		  
		  #if TargetCocoa then
		    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Integer) as Boolean
		    
		    return isTransparent(p.Handle)
		  #else
		    #pragma Unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub isTransparent(extends p as PopupMenu, assigns Value as Boolean)
		  //# Sets whether the PopupMenu is transparent.
		  
		  //@ A transparent button never draws itself, but it receives mouse-down events and tracks the mouse properly.
		  
		  #if TargetCocoa then
		    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Integer, inFlag as Boolean)
		    
		    setTransparent(p.Handle, Value)
		  #else
		    #pragma Unused p
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PopUpButtonCell(Extends p as PopupMenu) As Ptr
		  
		  #if TargetCocoa
		    declare function cell lib CocoaLib selector "cell" (obj_id as Integer) as Ptr
		    
		    return cell(p.handle)
		  #else
		    #pragma unused p
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreferredEdge(extends p as PopupMenu) As NSRectEdge
		  //# Returns the edge of the PopupMenu next to which the menu is displayed under restrictive screen conditions.
		  
		  #if TargetCocoa
		    declare function preferredEdge lib CocoaLib selector "preferredEdge" (obj_id as Integer) as NSRectEdge
		    
		    return preferredEdge(p.Handle)
		  #else
		    #pragma unused p
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreferredEdge(extends p as PopupMenu, assigns Value as NSRectEdge)
		  //# Sets the edge of the PopupMenu next to which the menu should appear under restrictive screen conditions.
		  
		  #if TargetCocoa
		    declare sub setPreferredEdge lib CocoaLib selector "setPreferredEdge:" (obj_id as Integer, inFlag as NSRectEdge)
		    
		    setPreferredEdge(p.Handle, Value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PullsDown(extends p as PopupMenu) As Boolean
		  //# Returns a Boolean value indicating the behavior of the PopupMenu's menu.
		  
		  #if TargetCocoa then
		    declare function pullsDown lib CocoaLib selector "pullsDown" (obj_id as Integer) as Boolean
		    
		    return pullsDown(p.Handle)
		  #else
		    #pragma Unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PullsDown(extends p as PopupMenu, assigns Value as Boolean)
		  //# Sets whether the PopupMenu behaves as a pull-down or pop-up menu.
		  
		  #if TargetCocoa then
		    declare sub setPullsDown lib CocoaLib selector "setPullsDown:" (obj_id as Integer, inFlag as Boolean)
		    
		    setPullsDown(p.Handle, Value)
		  #else
		    #pragma Unused p
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRow(extends p as PopupMenu, Title as String)
		  //# Removes the item with the specified title from the menu.
		  
		  #if TargetCocoa then
		    declare sub removeItemWithTitle lib CocoaLib selector "removeItemWithTitle:" (obj_id as Integer, inTitle as CFStringRef)
		    
		    removeItemWithTitle(p.Handle, Title)
		  #else
		    #pragma Unused p
		    #pragma Unused Title
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectItemWithTitle(extends p as PopupMenu, Title as String)
		  //# Selects the item with the specified title.
		  
		  //@ Doesn't activate the 'Action' event.
		  
		  #if TargetCocoa then
		    declare sub selectItemWithTitle lib CocoaLib selector "selectItemWithTitle:" (obj_id as Integer, inTitle as CFStringRef)
		    
		    selectItemWithTitle(p.Handle, Title)
		  #else
		    #pragma Unused p
		    #pragma Unused Title
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTitle(extends p as PopupMenu, Title as String)
		  //# Sets the string displayed in the PopupMenu when the user isn’t pressing the mouse button.
		  
		  //@ Doesn't activate the 'Action' event, use with 'PullDown' popupmenu.
		  
		  #if TargetCocoa then
		    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Integer, inTitle as CFStringRef)
		    
		    setTitle(p.Handle, Title)
		  #else
		    #pragma Unused p
		    #pragma Unused Title
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowsBorderOnlyWhileMouseInside(extends p as PopupMenu) As Boolean
		  //# Returns a Boolean value indicating whether the PopupMenu displays its border only when the cursor is over it.
		  
		  #if TargetCocoa then
		    declare function showsBorderOnlyWhileMouseInside lib CocoaLib selector "showsBorderOnlyWhileMouseInside" (obj_id as Integer) as Boolean
		    
		    return showsBorderOnlyWhileMouseInside(p.Handle)
		  #else
		    #pragma Unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowsBorderOnlyWhileMouseInside(extends p as PopupMenu, assigns Value as Boolean)
		  //# Sets whether the PopupMenu's border is displayed only when the cursor is over the button.
		  
		  #if TargetCocoa then
		    declare sub setShowsBorderOnlyWhileMouseInside lib CocoaLib selector "setShowsBorderOnlyWhileMouseInside:" (obj_id as Integer, inFlag as Boolean)
		    
		    setShowsBorderOnlyWhileMouseInside(p.Handle, Value)
		  #else
		    #pragma Unused p
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SynchronizeTitleAndSelectedItem(Extends p as PopupMenu)
		  //# Synchronizes the the pop-up button’s displayed item with the currently selected menu item.
		  
		  #if TargetCocoa
		    declare sub synchronizeTitleAndSelectedItem lib CocoaLib selector "synchronizeTitleAndSelectedItem" (obj_id as Integer)
		    
		    synchronizeTitleAndSelectedItem(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transparent(extends p as PopupMenu) As Boolean
		  //# Returns a Boolean value indicating whether the button is transparent.
		  
		  #if TargetCocoa then
		    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Integer) as Boolean
		    
		    return isTransparent(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transparent(extends p as PopupMenu, Assigns value as Boolean)
		  //# Sets whether the receiver is transparent and redraws the receiver if necessary.
		  
		  #if TargetCocoa then
		    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Integer, value as Boolean)
		    
		    setTransparent(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


	#tag Enum, Name = NSPopUpArrowPosition, Flags = &h0
		NSPopUpNoArrow
		  NSPopUpArrowAtCenter
		NSPopUpArrowAtBottom
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

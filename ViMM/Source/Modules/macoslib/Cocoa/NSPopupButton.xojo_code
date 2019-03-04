#tag Class
Class NSPopupButton
Inherits NSControl
	#tag Event
		Function NSClassName() As String
		  return "NSPopUpButton"
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.PullsDown = self.initialpullsdown
		  
		  raiseEvent Open
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddItem(title as String)
		  
		  #if TargetCocoa
		    declare sub addItemWithTitle lib CocoaLib selector "addItemWithTitle:" (id as Ptr, title as CFStringRef)
		    
		    addItemWithTitle self.id, title
		  #else
		    #pragma unused title
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItems(itemTitles() as String)
		  
		  #if TargetCocoa
		    
		    declare sub addItemsWithTitles lib CocoaLib selector "addItemsWithTitles:" (id as Ptr, itemTitles as Ptr)
		    
		    addItemsWithTitles self.id, new NSArray(itemTitles)
		    
		  #else
		    #pragma unused itemTitles
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItem(item as NSMenuItem) As Integer
		  
		  #if targetCocoa
		    declare function indexOfItem lib CocoaLib selector "indexOfItem:" (obj_id as Ptr, item as Ptr) as Integer
		    
		    dim itemRef as Ptr
		    if item <> nil then
		      itemRef = item
		    end if
		    return indexOfItem(self, itemRef)
		    
		  #else
		    #pragma unused item
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithRepresentedObject(anObject as Ptr) As Integer
		  
		  #if targetCocoa
		    declare function indexOfItemWithRepresentedObject lib CocoaLib selector "indexOfItemWithRepresentedObject:" (obj_id as Ptr, anObj as Ptr) as Integer
		    
		    return indexOfItemWithRepresentedObject(self, anObject)
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTag(tag as Integer) As Integer
		  
		  #if targetCocoa
		    declare function indexOfItemWithTag lib CocoaLib selector "indexOfItemWithTag:" (obj_id as Ptr, aTag as Integer) as Integer
		    
		    return indexOfItemWithTag(self, tag)
		    
		  #else
		    #pragma unused tag
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTarget(anObject as Ptr, actionSelector as String = "") As Integer
		  
		  #if targetCocoa
		    declare function indexOfItemWithTarget lib CocoaLib selector "indexOfItemWithTarget:andAction:" (obj_id as Ptr, anObj as Ptr, actionSel as Ptr) as Integer
		    
		    return indexOfItemWithTarget(self, anObject, Cocoa.NSSelectorFromString(actionSelector))
		    
		  #else
		    #pragma unused anObject
		    #pragma unused actionSelector
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfItemWithTitle(title as String) As Integer
		  
		  #if targetCocoa
		    declare function indexOfItemWithTitle lib CocoaLib selector "indexOfItemWithTitle:" (obj_id as Ptr, aTitle as CFStringRef) as Integer
		    
		    return indexOfItemWithTitle(self, title)
		    
		  #else
		    #pragma unused title
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfSelectedItem() As Integer
		  
		  #if TargetCocoa
		    declare function indexOfSelectedItem lib CocoaLib selector "titleOfSelectedItem" (id as Ptr) as Integer
		    
		    return indexOfSelectedItem(self.id)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertItem(title as String, index as Integer)
		  
		  #if TargetCocoa
		    
		    declare sub insertItemWithTitle lib CocoaLib selector "insertItemWithTitle:atIndex:" (id as Ptr, title as CFStringRef, index as Integer)
		    
		    insertItemWithTitle self.id, title, index
		    
		  #else
		    #pragma unused title
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemArray() As NSMenuItem()
		  
		  #if TargetCocoa
		    declare function itemArray lib CocoaLib selector "itemArray" (id as Ptr) as Ptr
		    
		    dim rb_array() as NSMenuItem
		    dim ns_arrayRef as Ptr = itemArray(self.id)
		    if ns_arrayRef <> nil then
		      dim ns_array as new NSArray(ns_arrayRef)
		      dim n as Integer = ns_array.count-1
		      for i as integer = 0 to n
		        rb_array.append new NSMenuItem(ns_array.value(i))
		      next
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemAtIndex(index as Integer) As NSMenuItem
		  
		  #if targetCocoa
		    declare function itemAtIndex lib CocoaLib selector "itemAtIndex:" (obj_id as Ptr, index as Integer) as Ptr
		    
		    dim itemRef as Ptr = itemAtIndex(self, index)
		    if itemRef <> nil then
		      return new NSMenuItem(itemRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemTitle(index as Integer) As String
		  
		  #if targetCocoa
		    declare function itemTitleAtIndex lib CocoaLib selector "itemTitleAtIndex:" (obj_id as Ptr, index as Integer) as CFStringRef
		    
		    return itemTitleAtIndex(self.id, index)
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemTitles() As String()
		  
		  #if TargetCocoa
		    declare function itemArray lib CocoaLib selector "itemArray" (id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    dim ns_arrayRef as Ptr = itemArray(self.id)
		    if ns_arrayRef <> nil then
		      dim ns_array as new NSArray(ns_arrayRef)
		      dim n as Integer = ns_array.count-1
		      for i as integer = 0 to n
		        rb_array.append new CFString(ns_array.value(i), false)
		      next
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemWithTitle(title as String) As NSMenuItem
		  
		  #if targetCocoa
		    declare function itemWithTitle lib CocoaLib selector "itemWithTitle:" (obj_id as Ptr, aString as CFStringRef) as Ptr
		    
		    dim itemPtr as Ptr = itemWithTitle(self, title)
		    if itemPtr <> nil then
		      return new NSMenuItem(itemPtr)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused title
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastItem() As NSMenuItem
		  
		  #if targetCocoa
		    declare function lastItem lib CocoaLib selector "lastItem" (obj_id as Ptr) as Ptr
		    
		    dim itemPtr as Ptr = lastItem(self)
		    if itemPtr <> nil then
		      return new NSMenuItem(itemPtr)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NSPopUpButtonCell() As Ptr
		  
		  #if TargetCocoa
		    declare function cell lib CocoaLib selector "cell" (obj_id as Ptr) as Ptr
		    
		    return cell(self.id)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfItems() As Integer
		  
		  #if TargetCocoa
		    declare sub numberOfItems lib CocoaLib selector "numberOfItems" (id as Ptr)
		    
		    numberOfItems self.id
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllItems()
		  
		  #if TargetCocoa
		    
		    declare sub removeAllItems lib CocoaLib selector "removeAllItems" (id as Ptr)
		    
		    removeAllItems self.id
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveItem(index as Integer)
		  
		  #if TargetCocoa
		    
		    declare sub removeItemAtIndex lib CocoaLib selector "removeItemAtIndex:" (id as Ptr, index as Integer)
		    
		    removeItemAtIndex self.id, index
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveItem(title as String)
		  
		  #if TargetCocoa
		    
		    declare sub removeItemWithTitle lib CocoaLib selector "removeItemWithTitle:" (id as Ptr, title as CFStringRef)
		    
		    removeItemWithTitle self.id, title
		    
		  #else
		    #pragma unused title
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedItem() As NSMenuItem
		  
		  #if TargetCocoa
		    declare function selectedItem lib CocoaLib selector "selectedItem" (id as Ptr) as Ptr
		    
		    dim itemRef as Ptr = selectedItem(self.id)
		    if itemRef <> nil then
		      return new NSMenuItem(itemRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectItem(index as Integer)
		  
		  #if TargetCocoa
		    
		    declare sub selectItemAtIndex lib CocoaLib selector "selectItemAtIndex:" (id as Ptr, index as Integer)
		    
		    selectItemAtIndex self.id, index
		    
		  #else
		    #pragma unused index
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectItem(item as NSMenuItem)
		  
		  #if TargetCocoa
		    
		    declare sub selectItem lib CocoaLib selector "selectItem:" (id as Ptr, item as Ptr)
		    
		    dim itemRef as Ptr
		    if item <> nil then
		      itemRef = item
		    end if
		    
		    selectItem self.id, itemRef
		    
		  #else
		    #pragma unused item
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectItem(title as String)
		  
		  #if TargetCocoa
		    
		    declare sub selectItemWithTitle lib CocoaLib selector "selectItemWithTitle:" (id as Ptr, title as CFStringRef)
		    
		    selectItemWithTitle self.id, title
		    
		  #else
		    #pragma unused title
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectItemWithTag(tag as Integer)
		  
		  #if TargetCocoa
		    
		    declare sub selectItemWithTag lib CocoaLib selector "selectItemWithTag:" (id as Ptr, tag as Integer)
		    
		    selectItemWithTag self.id, tag
		    
		  #else
		    #pragma unused tag
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTitle(assigns aTitle as String)
		  
		  #if TargetCocoa
		    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, aTitle as CFStringRef)
		    
		    setTitle(self.id, aTitle)
		    
		  #else
		    #pragma unused aTitle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SynchronizeTitleAndSelectedItem()
		  
		  #if TargetCocoa
		    
		    declare sub synchronizeTitleAndSelectedItem lib CocoaLib selector "synchronizeTitleAndSelectedItem" (id as Ptr)
		    
		    synchronizeTitleAndSelectedItem self.id
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TitleOfSelectedItem() As String
		  
		  #if TargetCocoa
		    declare function titleOfSelectedItem lib CocoaLib selector "titleOfSelectedItem" (id as Ptr) as CFStringRef
		    
		    return titleOfSelectedItem(self.id)
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function arrowPosition lib CocoaLib selector "arrowPosition" (obj_id as Ptr) as NSPopUpArrowPosition
			    
			    return arrowPosition(self.NSPopUpButtonCell)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setArrowPosition lib CocoaLib selector "setArrowPosition:" (obj_id as Ptr, value as NSPopupArrowPosition)
			    
			    setArrowPosition(self.NSPopUpButtonCell, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ArrowPosition As NSPopUpArrowPosition
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    declare function autoenablesItems lib CocoaLib selector "autoenablesItems" (id as Ptr) as Boolean
			    
			    return autoenablesItems(self.id)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    declare sub setAutoenablesItems lib CocoaLib selector "setAutoenablesItems:"  (id as Ptr, value as Boolean)
			    
			    setAutoenablesItems self.id, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		AutoenablesItems As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function bezelStyle lib CocoaLib selector "bezelStyle" (obj_id as Ptr) as NSBezelStyle
			    
			    return bezelStyle(self.id)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setBezelStyle lib CocoaLib selector "setBezelStyle:" (obj_id as Ptr, value as NSBezelStyle)
			    
			    setBezelStyle(self.id, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		BezelStyle As NSBezelStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isBordered lib CocoaLib selector "isBordered" (obj_id as Ptr) as Boolean
			    
			    return isBordered(self.id)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setBordered lib CocoaLib selector "setBordered:" (obj_id as Ptr, value as Boolean)
			    
			    setBordered(self.id, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Bordered As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function imagePosition lib CocoaLib selector "imagePosition" (obj_id as Ptr) as NSCellImagePosition
			    
			    return imagePosition(self.id)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setImagePosition lib CocoaLib selector "setImagePosition:" (obj_id as Ptr, value as NSCellImagePosition)
			    
			    setImagePosition(self.id, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ImagePosition As NSCellImagePosition
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function imageScaling lib CocoaLib selector "imageScaling" (obj_id as Ptr) as NSImageScaling
			    
			    return imageScaling(self.NSPopUpButtonCell)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setImageScaling lib CocoaLib selector "setImageScaling:" (obj_id as Ptr, value as NSImageScaling)
			    
			    setImageScaling(self.NSPopUpButtonCell, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ImageScaling As NSImageScaling
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private initialpullsdown As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function menu lib CocoaLib selector "menu" (id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = menu(self.id)
			    if menuRef <> nil then
			      return new NSMenu(menuRef)
			    else
			      return nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    
			    declare sub setMenu lib CocoaLib selector "setMenu:" (id as Ptr, menu as Ptr)
			    
			    dim menuRef as Ptr
			    if value <> nil then
			      menuRef = value
			    end if
			    
			    setMenu self.id, menuRef
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Menu As NSMenu
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function preferredEdge lib CocoaLib selector "preferredEdge" (obj_id as Ptr) as NSRectEdge
			    
			    return preferredEdge(self.id)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setPreferredEdge lib CocoaLib selector "setPreferredEdge:" (obj_id as Ptr, value as NSRectEdge)
			    
			    setPreferredEdge(self.id, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PreferredEdge As NSRectEdge
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function pullsDown lib CocoaLib selector "pullsDown" (id as Ptr) as Boolean
			      
			      return pullsDown(self.id)
			    else
			      return self.initialpullsdown
			    end if
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setPullsDown lib CocoaLib selector "setPullsDown:"  (id as Ptr, value as Boolean)
			      
			      setPullsDown self.id, value
			    else
			      self.initialpullsdown = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		PullsDown As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa
			    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Ptr) as Boolean
			    
			    return isTransparent(self.id)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa
			    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Ptr, value as Boolean)
			    
			    setTransparent(self.id, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Transparent As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = NSBezelStyle, Flags = &h0
		NSRoundedBezelStyle = 1
		  NSRegularSquareBezelStyle
		  NSThickSquareBezelStyle
		  NSThickerSquareBezelStyle
		  NSDisclosureBezelStyle
		  NSShadowlessSquareBezelStyle
		  NSCircularBezelStyle
		  NSTexturedSquareBezelStyle
		  NSHelpButtonBezelStyle
		  NSSmallSquareBezelStyle
		  NSTexturedRoundedBezelStyle
		  NSRoundRectBezelStyle
		  NSRecessedBezelStyle
		  NSRoundedDisclosureBezelStyle
		  NSInlineBezelStyle
		NSSmallIconButtonBezelStyle = 2
	#tag EndEnum

	#tag Enum, Name = NSCellImagePosition, Type = Integer, Flags = &h0
		NSNoImage
		  NSImageOnly
		  NSImageLeft
		  NSImageRight
		  NSImageBelow
		  NSImageAbove
		NSImageOverlaps
	#tag EndEnum

	#tag Enum, Name = NSImageScaling, Type = Integer, Flags = &h0
		NSImageScaleProportionallyDown
		  NSImageScaleAxesIndependently
		  NSImageScaleNone
		NSImageScaleProportionallyUpOrDown
	#tag EndEnum

	#tag Enum, Name = NSPopUpArrowPosition, Flags = &h0
		NSPopUpNoArrow
		  NSPopUpArrowAtCenter
		NSPopUpArrowAtBottom
	#tag EndEnum

	#tag Enum, Name = NSRectEdge, Flags = &h0
		NSMinXEdge
		  NSMinYEdge
		  NSMaxXEdge
		NSMaxYEdge
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Group="Behavior"
			Type="NSTextAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Right"
				"2 - Center"
				"3 - Justified"
				"4 - Natural"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsExpansionToolTips"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ArrowPosition"
			Group="Behavior"
			Type="NSPopUpArrowPosition"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSPopUpNoArrow"
				"1 - NSPopUpArrowAtCenter"
				"2 - NSPopUpArrowAtBottom"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoenablesItems"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BezelStyle"
			Group="Behavior"
			Type="NSBezelStyle"
			EditorType="Enum"
			#tag EnumValues
				"1 - NSRoundedBezelStyle"
				"2 - NSRegularSquareBezelStyle"
				"3 - NSThickSquareBezelStyle"
				"4 - NSThickerSquareBezelStyle"
				"5 - NSDisclosureBezelStyle"
				"6 - NSShadowlessSquareBezelStyle"
				"7 - NSCircularBezelStyle"
				"8 - NSTexturedSquareBezelStyle"
				"9 - NSHelpButtonBezelStyle"
				"10 - NSSmallSquareBezelStyle"
				"11 - NSTexturedRoundedBezelStyle"
				"12 - NSRoundRectBezelStyle"
				"13 - NSRecessedBezelStyle"
				"14 - NSRoundedDisclosureBezelStyle"
				"15 - NSInlineBezelStyle"
				"2 - NSSmallIconButtonBezelStyle"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bordered"
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
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FloatValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImagePosition"
			Group="Behavior"
			Type="NSCellImagePosition"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSNoImage"
				"1 - NSImageOnly"
				"2 - NSImageLeft"
				"3 - NSImageRight"
				"4 - NSImageBelow"
				"5 - NSImageAbove"
				"6 - NSImageOverlaps"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageScaling"
			Group="Behavior"
			Type="NSImageScaling"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSImageScaleProportionallyDown"
				"1 - NSImageScaleAxesIndependently"
				"2 - NSImageScaleNone"
				"3 - NSImageScaleProportionallyUpOrDown"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferredEdge"
			Group="Behavior"
			Type="NSRectEdge"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSMinXEdge"
				"1 - NSMinYEdge"
				"2 - NSMaxXEdge"
				"3 - NSMaxYEdge"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="PullsDown"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="0.0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Group="Behavior"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underlined"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

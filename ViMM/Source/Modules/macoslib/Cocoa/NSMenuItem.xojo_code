#tag Class
Class NSMenuItem
Inherits NSObject
	#tag Method, Flags = &h1021
		Private Sub Constructor(mi as MenuItem)
		  me.Constructor( mi.Text, 0 )
		  
		  fromRBMenuItem = mi
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(title as String = "", action as String = "", keyEquiv as String = "")
		  
		  #if TargetMacOS
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:action:keyEquivalent:" (obj_id as Ptr, title as CFStringRef, action as Ptr, keyEquiv as CFStringRef) as Ptr
		    
		    dim menuItemRef as Ptr = initWithTitle(Allocate("NSMenuItem"), title, Cocoa.NSSelectorFromString(action), keyEquiv)
		    self.Constructor(menuItemRef, NSObject.hasOwnership)
		    
		  #else
		    #pragma unused title
		    #pragma unused action
		    #pragma unused keyEquiv
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(theTitle as string, aTag as integer)
		  #if TargetMacOS
		    dim p as Ptr
		    
		    p = NSObject.Initialize( NSObject.Allocate( "NSMenuItem" ))
		    
		    Super.Constructor( p, false )
		    
		    Title = theTitle
		    Tag = aTag
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromMenuItem(mi as MenuItem) As NSMenuItem
		  #if TargetMacOS
		    
		    dim nsm as NSMenuItem
		    
		    declare function separatorItem lib CocoaLib selector "separatorItem" ( Cls as Ptr ) as Ptr
		    
		    if mi=nil then
		      return  nil
		    end if
		    
		    if mi.Text = "-" then //A separator
		      nsm = NSMenuItem.CreateSeparatorItem
		      nsm.fromRBMenuItem = mi
		    else
		      nsm = new NSMenuItem( mi )
		    end if
		    
		    return  nsm
		    
		  #else
		    
		    #pragma unused mi
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateSeparatorItem() As NSMenuItem
		  #if TargetMacOS
		    declare function separatorItem lib CocoaLib selector "separatorItem" ( Cls as Ptr ) as Ptr
		    
		    return new NSMenuItem(separatorItem(Cocoa.NSClassFromString("NSMenuItem" )))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsHiddenOrHasHiddenAncestor() As Boolean
		  
		  #if TargetMacOS
		    declare function isHiddenOrHasHiddenAncestor lib CocoaLib selector "isHiddenOrHasHiddenAncestor" (obj_id as Ptr) as Boolean
		    
		    return isHiddenOrHasHiddenAncestor(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentItem() As NSMenuItem
		  
		  #if TargetMacOS
		    declare function parentItem lib CocoaLib selector "parentItem" (obj_id as Ptr) as Ptr
		    
		    dim itemRef as Ptr = parentItem(self)
		    if itemRef <> nil then
		      return new NSMenuItem(itemRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAction(selectorName as string)
		  #if TargetMacOS
		    declare sub m_setAction lib CocoaLib selector "setAction:" (id as Ptr, SEL as ptr)
		    
		    m_setAction   me.id, Cocoa.NSSelectorFromString( selectorName )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTarget(targetObject as Ptr)
		  #if TargetMacOS
		    declare sub m_setTarget lib CocoaLib selector "setTarget:" (id as Ptr, target as Ptr)
		    
		    m_setTarget  me.id, targetObject
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function action Lib CocoaLib selector "action" (obj_id as Ptr) as Ptr
			    
			    return Cocoa.NSStringFromSelector(action(self))
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAction Lib CocoaLib selector "setAction:" (obj_id as Ptr, actionSEL as Ptr)
			    
			    setAction(self, Cocoa.NSSelectorFromString(value))
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Action As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isAlternate lib CocoaLib selector "isAlternate" (obj_id as Ptr) as Boolean
			    
			    return isAlternate(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAlternate lib CocoaLib selector "setAlternate:" (obj_id as Ptr, value as Boolean)
			    
			    setAlternate(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Alternate As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function isEnabled lib CocoaLib selector "isEnabled" (id as Ptr) as Boolean
			    
			    return  isEnabled( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setEnabled lib CocoaLib selector "setEnabled:" (id as Ptr, value as Boolean)
			    
			    setEnabled   me.id, value
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			//The original MenuItem if created from a RS MenuItem
		#tag EndNote
		fromRBMenuItem As MenuItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function hasSubmenu lib CocoaLib selector "hasSubmenu" (obj_id as Ptr) as Boolean
			    
			    return hasSubmenu(self)
			  #endif
			End Get
		#tag EndGetter
		HasSubmenu As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isHidden lib CocoaLib selector "isHidden" (obj_id as Ptr) as Boolean
			    
			    return isHidden(self)
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  // set the image item for mixed state as NSImage
			  
			  #if TargetMacOS
			    declare sub setHidden Lib CocoaLib selector "setHidden:" (obj_id as Ptr, value as Boolean)
			    
			    setHidden(self, value)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Hidden As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isHighlighted lib CocoaLib selector "isHighlighted" (obj_id as Ptr) as Boolean
			    
			    return isHighlighted(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Highlighted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  // get the item image as NSImage
			  
			  #if TargetMacOS
			    declare function image Lib CocoaLib selector "image" (obj_id as Ptr) as Ptr
			    
			    return new NSImage(image(self))
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  // set the image item as NSImage
			  
			  #if TargetMacOS
			    declare sub setImage Lib CocoaLib selector "setImage:" (obj_id as Ptr, image as Ptr)
			    
			    if value <> nil then
			      setImage(self, value)
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Image As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function indentationLevel lib CocoaLib selector "indentationLevel" (obj_id as Ptr) as Integer
			    
			    return indentationLevel(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setIndentationLevel lib CocoaLib selector "setIndentationLevel:" (obj_id as Ptr, value as Integer)
			    
			    setIndentationLevel(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		IndentationLevel As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function keyEquivalent lib CocoaLib selector "keyEquivalent" (obj_id as Ptr) as CFStringRef
			    
			    return keyEquivalent(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setKeyEquivalent lib CocoaLib selector "setKeyEquivalent:" (obj_id as Ptr, value as CFstringRef)
			    
			    setKeyEquivalent(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		KeyEquivalent As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function keyEquivalentModifierMask lib CocoaLib selector "keyEquivalentModifierMask" (obj_id as Ptr) as Integer
			    
			    return keyEquivalentModifierMask(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setKeyEquivalentModifierMask lib CocoaLib selector "setKeyEquivalentModifierMask:" (obj_id as Ptr, value as Integer)
			    
			    setKeyEquivalentModifierMask(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		KeyEquivalentModifierMask As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function menu Lib CocoaLib selector "menu" (obj_id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = menu(self)
			    if menuRef <> nil then
			      return new NSMenu(menuRef)
			    else
			      return nil
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Menu As NSMenu
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  // get the item image for mixed state as NSImage
			  
			  #if TargetMacOS
			    declare function mixedStateImage Lib CocoaLib selector "mixedStateImage" (obj_id as Ptr) as Ptr
			    
			    return new NSImage(mixedStateImage(self))
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  // set the image item for mixed state as NSImage
			  
			  #if TargetMacOS
			    declare sub setMixedStateImage Lib CocoaLib selector "setMixedStateImage:" (obj_id as Ptr, image as Ptr)
			    
			    setMixedStateImage(self, value)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		MixedStateImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  // get the item image for off state as NSImage
			  
			  #if TargetMacOS
			    declare function offStateImage Lib CocoaLib selector "offStateImage" (obj_id as Ptr) as Ptr
			    
			    return new NSImage(offStateImage(self))
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  // set the image item for off state as NSImage
			  
			  #if TargetMacOS
			    declare sub setOffStateImage Lib CocoaLib selector "setOffStateImage:" (obj_id as Ptr, image as Ptr)
			    
			    setOffStateImage(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		OffStateImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  // get the item image for on state as NSImage
			  
			  #if TargetMacOS
			    declare function onStateImage Lib CocoaLib selector "onStateImage" (obj_id as Ptr) as Ptr
			    
			    return new NSImage(onStateImage(self))
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  // set the image item for on state as NSImage
			  
			  #if TargetMacOS
			    declare sub setOnStateImage Lib CocoaLib selector "setOnStateImage:" (obj_id as Ptr, image as Ptr)
			    
			    setOnStateImage(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		OnStateImage As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function representedObject Lib CocoaLib selector "representedObject" (obj_id as Ptr) as Ptr
			    
			    return representedObject(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setRepresentedObject Lib CocoaLib selector "setRepresentedObject:" (obj_id as Ptr, anObject as Ptr)
			    
			    setRepresentedObject(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		RepresentedObject As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isSeparatorItem lib CocoaLib selector "isSeparatorItem" (obj_id as Ptr) as Boolean
			    
			    return isSeparatorItem(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Separator As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function state lib CocoaLib selector "state" (obj_id as Ptr) as NSCellStateValue
			    
			    return state(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setState lib CocoaLib selector "setState:" (obj_id as Ptr, value as NSCellStateValue)
			    
			    setState(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		State As NSCellStateValue
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function submenu Lib CocoaLib selector "submenu" (obj_id as Ptr) as Ptr
			    
			    dim menuRef as Ptr = submenu(self)
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
			  
			  #if TargetMacOS
			    declare sub setSubmenu Lib CocoaLib selector "setSubmenu:" (obj_id as Ptr, aSubmenu as Ptr)
			    
			    setSubmenu(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Submenu As NSMenu
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function tag lib CocoaLib selector "tag" (obj_id as Ptr) as Integer
			    
			    return tag(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setTag lib CocoaLib selector "setTag:" (obj_id as Ptr, value as Integer)
			    
			    setTag(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Tag As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function target Lib CocoaLib selector "target" (obj_id as Ptr) as Ptr
			    
			    return target(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
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
		#tag Getter
			Get
			  #if targetMacOS
			    declare function title lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			    
			    return title(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, value as CFStringRef)
			    
			    setTitle(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function toolTip Lib CocoaLib selector "toolTip" (obj_id as Ptr) as CFStringRef
			    
			    return toolTip(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
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
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function view Lib CocoaLib selector "view" (obj_id as Ptr) as Ptr
			    
			    return view(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setView Lib CocoaLib selector "setView:" (obj_id as Ptr, aView as Ptr)
			    
			    setView(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		View As Ptr
	#tag EndComputedProperty


	#tag Constant, Name = NSAlternateKeyMask, Type = Double, Dynamic = False, Default = \"&h80000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSCommandKeyMask, Type = Double, Dynamic = False, Default = \"&h100000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSControlKeyMask, Type = Double, Dynamic = False, Default = \"&h40000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSShiftKeyMask, Type = Double, Dynamic = False, Default = \"&h20000", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSCellStateValue, Flags = &h0
		NSMixedState = -1
		  NSOffState = 0
		NSOnState = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Action"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alternate"
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
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasSubmenu"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hidden"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Highlighted"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentationLevel"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyEquivalent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyEquivalentModifierMask"
			Group="Behavior"
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
			Name="Separator"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="State"
			Group="Behavior"
			Type="NSCellStateValue"
			EditorType="Enum"
			#tag EnumValues
				"-1 - NSMixedState"
				"0 - NSOffState"
				"1 - NSOnState"
			#tag EndEnumValues
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
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
	#tag EndViewBehavior
End Class
#tag EndClass

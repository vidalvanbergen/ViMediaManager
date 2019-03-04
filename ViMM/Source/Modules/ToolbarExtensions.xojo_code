#tag Module
Protected Module ToolbarExtensions
	#tag Method, Flags = &h0
		Sub AddButton(Extends pToolbar as NSToolbar, Identifier as string, TheImage as NSImage, Name as String, PalleteName as String = "", ItemToolTip as String = "", ImageIsTemplate as Boolean = False)
		  if PalleteName = "" then
		    PalleteName = Name
		  end if
		  
		  dim toolbarItem as new NSToolbarButtonItem(Identifier) // Unique identifier
		  toolbarItem.Image = TheImage // Image
		  toolbarItem.Image.Template = ImageIsTemplate // Use template style
		  toolbarItem.ItemLabel = Name // Label shown in toolbar
		  toolbarItem.PaletteLabel = PalleteName // Label shown in customization palette (usually the same as ItemLabel)
		  if Trim( ItemToolTip ) <> "" then
		    toolbarItem.ToolTip = ItemToolTip // Optional tool tip
		  end if
		  
		  pToolbar.AddItem toolbarItem // add item to the toolbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddControl(Extends pToolbar as NSToolbar, pControl as Control, Name as String, PaletteName as String = "", ItemToolTip as String = "")
		  if PaletteName = "" then
		    PaletteName = Name // Use regular name if no PalleteName is set
		  end if
		  if ItemToolTip = "" then
		    ItemToolTip = PaletteName // Use PaletteName if no Tooltip is set
		  end if
		  
		  dim ControlWidth, ControlHeight as Integer
		  if pControl IsA RectControl then
		    dim rControl as RectControl = RectControl( pControl )
		    ControlWidth = rControl.Width
		    ControlHeight = rControl.Height
		  else
		    ControlWidth = pControl.Bounds.w // Get the control's width
		    ControlHeight = pControl.Bounds.h // Get the control's height
		  end if
		  
		  dim customToolItem as new NSToolbarCustomItem( pControl ) // Make a new toolbar item using the control
		  customToolItem.ItemLabel = Name
		  customToolItem.PaletteLabel = PaletteName
		  customToolItem.ToolTip = ItemToolTip
		  customToolItem.MaxSize = Cocoa.NSMakeSize( ControlWidth, ControlHeight )
		  customToolItem.MinSize = Cocoa.NSMakeSize( ControlWidth, ControlHeight + 8 )
		  
		  pToolbar.AddItem customToolItem // Add item to toolbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDropItem(Extends pToolbar as NSToolbar, Identifier as string, TheImage as NSImage, Name as String, TheMenu as NSMenu, PalleteName as String = "", ItemToolTip as String = "", ImageIsTemplate as Boolean = False)
		  if PalleteName = "" then
		    PalleteName = Name
		  end if
		  
		  dim toolbarItem as new NSToolbarDropMenuItem(Identifier)
		  toolbarItem.Image = TheImage
		  toolbarItem.Image.Template = ImageIsTemplate // Crashes the toolbar?
		  toolbarItem.ItemLabel = Name
		  toolbarItem.PaletteLabel = PalleteName
		  if ItemToolTip <> "" then
		    toolbarItem.ToolTip = ItemToolTip
		  end if
		  toolbarItem.Menu = TheMenu
		  
		  pToolbar.AddItem toolbarItem
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemByIdentifier(Extends t as NSToolbar, identifier as String) As NSToolbarItem
		  Return ItemByIdentifier( t, identifier )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemByIdentifier(t as NSToolbar, identifier as String) As NSToolbarItem
		  dim AllItems() as NStoolbarItem = t.Items
		  for each item as NSToolbarItem in AllItems
		    if item.ItemIdentifier = identifier then
		      Return item
		      Exit
		    end if
		  next
		End Function
	#tag EndMethod


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

#tag Module
Protected Module CocoaToolbar
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionDelegate(identifier as String, hitItem as NSMenuItem)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function NSToolbarCustomizeToolbarItemIdentifier() As String
		  
		  return Cocoa.StringConstant("NSToolbarCustomizeToolbarItemIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSToolbarFlexibleSpaceItemIdentifier() As String
		  
		  return Cocoa.StringConstant("NSToolbarFlexibleSpaceItemIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSToolbarPrintItemIdentifier() As String
		  
		  return Cocoa.StringConstant("NSToolbarPrintItemIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSToolbarSeparatorItemIdentifier() As String
		  
		  return Cocoa.StringConstant("NSToolbarSeparatorItemIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSToolbarShowColorsItemIdentifier() As String
		  
		  return Cocoa.StringConstant("NSToolbarShowColorsItemIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSToolbarShowFontsItemIdentifier() As String
		  
		  return Cocoa.StringConstant("NSToolbarShowFontsItemIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSToolbarSpaceItemIdentifier() As String
		  
		  return Cocoa.StringConstant("NSToolbarSpaceItemIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetToolbar(extends w as Window, t as NSToolbar)
		  
		  #if TargetCocoa
		    declare sub setToolbar lib CocoaLib selector "setToolbar:" (WindowRef as Integer, toolbarRef as Ptr)
		    
		    setToolbar w.handle, t
		    
		  #else
		    #pragma unused w
		    #pragma unused t
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToolbarHeight(extends w as Window) As Double
		  
		  #if TargetCocoa
		    declare function getToolbar lib CocoaLib selector "toolbar" (obj_id as Integer) as Ptr
		    declare function isVisible lib CocoaLib selector "isVisible" (obj_id as Ptr) as Boolean
		    declare function contentRectForFrameRectstyleMask lib CocoaLib selector "contentRectForFrameRect:styleMask:" (obj_id as Integer, windowFrame as Cocoa.NSRect, windowStyle as Integer) as Cocoa.NSRect
		    declare function contentRectForFrameRect lib CocoaLib selector "contentRectForFrameRect:" (obj_id as Integer, windowFrame as Cocoa.NSRect) as Cocoa.NSRect
		    declare function contentView lib CocoaLib selector "contentView" (obj_id as Integer) as Integer
		    declare function frame lib CocoaLib selector "frame" (obj_id as Integer) as Cocoa.NSRect
		    declare function styleMask lib CocoaLib selector "styleMask" (obj_id as Integer) as Integer
		    
		    dim windowToolbar as Ptr = getToolbar(w.handle)
		    dim toolbarHeight as Double = 0.0
		    dim windowFrame as Cocoa.NSRect
		    
		    if windowToolbar <> nil and isVisible(windowToolbar) then
		      windowFrame = contentRectForFrameRectstyleMask(w.handle, contentRectForFrameRect(w.handle, frame(w.handle)), styleMask(w.handle))
		      toolbarHeight = abs(windowFrame.h - frame(contentView(w.handle)).h)
		    end if
		    
		    return toolbarHeight
		    
		  #else
		    #pragma unused w
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		Written 17 Apr 2012 by Massimo Valle
	#tag EndNote


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

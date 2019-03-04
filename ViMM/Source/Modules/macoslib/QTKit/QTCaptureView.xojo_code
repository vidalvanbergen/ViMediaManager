#tag Class
Class QTCaptureView
Inherits Canvas
	#tag Event
		Sub Open()
		  #if targetCocoa
		    declare function initWithFrame lib QTKit.Framework selector "initWithFrame:" (obj_id as Ptr, frame as Cocoa.NSRect) as Ptr
		    soft declare sub addSubview lib QTKit.framework selector "addSubview:" (id as Ptr, aView as Ptr)
		    soft declare sub setAutoresizingMask lib QTKit.framework selector "setAutoresizingMask:" (id as Ptr, mask as Integer)
		    
		    
		    if not QTKit.Load then
		      return
		    end if
		    
		    
		    self.id = initWithFrame(NSObject.Allocate("QTCaptureView"), Cocoa.NSMakeRect(0, 0, self.Width, self.Height))
		    if self.id = nil then
		      return
		    end if
		    
		    const NSViewWidthSizable = 2
		    const NSViewHeightSizable = 16
		    const NSViewMinYMargin = 8
		    
		    addSubview Ptr(self.Handle), self
		    
		    //here we lock the control to the canvas superview so that resizing is handled by the canvas.
		    setAutoresizingMask self, NSViewWidthSizable or NSViewHeightSizable
		    setAutoresizingMask self, NSViewWidthSizable or NSViewHeightSizable
		    
		    raiseEvent Open
		  #endif
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AvailableVideoPreviewConnections() As QTCaptureConnection()
		  #if targetMacOS
		    declare function availableVideoPreviewConnections lib CocoaLib selector "availableVideoPreviewConnections" (obj_id as Ptr) as Ptr
		    
		    dim theArray as new CFArray(availableVideoPreviewConnections(self), not CFType.hasOwnership)
		    dim connectionList() as QTCaptureConnection
		    for i as Integer = 0 to theArray.Count - 1
		      connectionList.Append new QTCaptureConnection(theArray.Value(i))
		    next
		    return connectionList
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CaptureSession() As QTCaptureSession
		  #if targetMacOS
		    declare function captureSession lib CocoaLib selector "captureSession" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = captureSession(self)
		    if p <> nil then
		      return new QTCaptureSession(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CaptureSession(assigns value as QTCaptureSession)
		  #if targetMacOS
		    declare sub setCaptureSession lib QTKit.framework selector "setCaptureSession:" (obj_id as Ptr, value as Ptr)
		    
		    setCaptureSession(self, value)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return self.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreviewBounds() As Cocoa.NSRect
		  #if targetMacOS
		    declare function previewBounds lib CocoaLib selector "previewBounds" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return previewBounds(self)
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h21
		Private id As Ptr
	#tag EndProperty


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
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
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

#tag Class
Class QTMovieView
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
		    
		    
		    self.id = initWithFrame(NSObject.Allocate("QTMovieView"), Cocoa.NSMakeRect(0, 0, self.Width, self.Height))
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
		Sub Add()
		  #if targetMacOS
		    declare sub add lib QTKit.framework selector "add:" (obj_id as Ptr, sender as Ptr)
		    
		    add(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddScaled()
		  #if targetMacOS
		    declare sub addScaled lib QTKit.framework selector "addScaled:" (obj_id as Ptr, sender as Ptr)
		    
		    addScaled(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy()
		  #if targetMacOS
		    declare sub copy lib QTKit.framework selector "copy:" (obj_id as Ptr, sender as Ptr)
		    
		    copy(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cut()
		  #if targetMacOS
		    declare sub cut lib QTKit.framework selector "cut:" (obj_id as Ptr, sender as Ptr)
		    
		    cut(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		  #if targetMacOS
		    declare sub delete lib QTKit.framework selector "delete:" (obj_id as Ptr, sender as Ptr)
		    
		    delete(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillColor() As NSColor
		  #if targetCocoa
		    declare function fillColor lib QTKit.framework selector "fillColor" (obj_id as Ptr) as Ptr
		    
		    return new NSColor(fillColor(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillColor(assigns value as NSColor)
		  #if targetCocoa
		    declare sub setFillColor lib QTKit.framework selector "setFillColor:" (obj_id as Ptr, value as Ptr)
		    
		    if value <> nil then
		      setFillColor(self, value)
		    else
		      setFillColor(self, nil)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoBeginning()
		  #if targetMacOS
		    declare sub gotoBeginning lib QTKit.framework selector "gotoBeginning:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoBeginning(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoEnd()
		  #if targetMacOS
		    declare sub gotoEnd lib QTKit.framework selector "gotoEnd:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoEnd(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoNextSelectionPoint()
		  #if targetMacOS
		    declare sub gotoNextSelectionPoint lib QTKit.framework selector "gotoNextSelectionPoint:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoNextSelectionPoint(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoPosterFrame()
		  #if targetMacOS
		    declare sub gotoPosterFrame lib QTKit.framework selector "gotoPosterFrame:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoPosterFrame(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoPreviousSelectionPoint()
		  #if targetMacOS
		    declare sub gotoPreviousSelectionPoint lib QTKit.framework selector "gotoPreviousSelectionPoint:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoPreviousSelectionPoint(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Movie() As QTMovie
		  #if targetCocoa
		    declare function movie lib QTKit.framework selector "movie" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = movie(self)
		    if p <> nil then
		      return new QTMovie(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Movie(assigns value as QTMovie)
		  #if targetCocoa
		    declare sub setMovie lib QTKit.framework selector "setMovie:" (obj_id as Ptr, value as Ptr)
		    
		    if value <> nil then
		      setMovie(self, value)
		    else
		      setMovie(self, nil)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MovieBounds() As Cocoa.NSRect
		  #if targetCocoa
		    declare function movieBounds lib QTKit.framework selector "movieBounds" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return movieBounds(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MovieControllerBounds() As Cocoa.NSRect
		  #if targetCocoa
		    declare function movieControllerBounds lib QTKit.framework selector "movieControllerBounds" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return movieControllerBounds(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return self.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste()
		  #if targetMacOS
		    declare sub paste lib QTKit.framework selector "paste:" (obj_id as Ptr, sender as Ptr)
		    
		    paste(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  #if targetMacOS
		    declare sub pause lib QTKit.framework selector "pause:" (obj_id as Ptr, sender as Ptr)
		    
		    pause(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  #if targetMacOS
		    declare sub play lib QTKit.framework selector "play:" (obj_id as Ptr, sender as Ptr)
		    
		    play(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace()
		  #if targetMacOS
		    declare sub replace lib QTKit.framework selector "replace:" (obj_id as Ptr, sender as Ptr)
		    
		    replace(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  #if targetMacOS
		    declare sub selectAll lib QTKit.framework selector "selectAll:" (obj_id as Ptr, sender as Ptr)
		    
		    selectAll(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectNone()
		  #if targetMacOS
		    declare sub selectNone lib QTKit.framework selector "selectNone:" (obj_id as Ptr, sender as Ptr)
		    
		    selectNone(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepBackward()
		  #if targetMacOS
		    declare sub stepBackward lib QTKit.framework selector "stepBackward:" (obj_id as Ptr, sender as Ptr)
		    
		    stepBackward(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepForward()
		  #if targetMacOS
		    declare sub stepForward lib QTKit.framework selector "stepForward:" (obj_id as Ptr, sender as Ptr)
		    
		    stepForward(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Trim()
		  #if targetMacOS
		    declare sub trim lib QTKit.framework selector "trim:" (obj_id as Ptr, sender as Ptr)
		    
		    trim(self, nil)
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function controllerBarHeight lib QTKit.framework selector "controllerBarHeight" (obj_id as Ptr) as Double
			    
			    return CType(controllerBarHeight(self), Double)
			  #endif
			End Get
		#tag EndGetter
		ControllerBarHeight As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function isControllerVisible lib QTKit.framework selector "isControllerVisible" (obj_id as Ptr) as Boolean
			    
			    return isControllerVisible(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setControllerVisible lib QTKit.framework selector "setControllerVisible:" (obj_id as Ptr, value as Boolean)
			    
			    setControllerVisible(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ControllerVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function isEditable lib QTKit.framework selector "isEditable" (obj_id as Ptr) as Boolean
			    
			    return isEditable(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setEditable lib QTKit.framework selector "setEditable:" (obj_id as Ptr, value as Boolean)
			    
			    setEditable(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Editable As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private id As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function preservesAspectRatio lib QTKit.framework selector "preservesAspectRatio" (obj_id as Ptr) as Boolean
			    
			    return preservesAspectRatio(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setPreservesAspectRatio lib QTKit.framework selector "setPreservesAspectRatio:" (obj_id as Ptr, value as Boolean)
			    
			    setPreservesAspectRatio(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		PreservesAspectRatio As Boolean
	#tag EndComputedProperty


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
			Name="ControllerBarHeight"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControllerVisible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Editable"
			Group="Behavior"
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
			Name="PreservesAspectRatio"
			Group="Behavior"
			Type="Boolean"
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

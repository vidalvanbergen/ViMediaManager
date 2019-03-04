#tag Class
Class NSTableView
Inherits NSControl
	#tag Event
		Function CreateSubview(frame as Cocoa.NSRect) As Ptr
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (classRef as Ptr) as Ptr
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as NSRect) as Ptr
		    
		    self.scrollview = initWithFrame(alloc(Cocoa.NSClassFromString("NSScrollView")), frame)
		    
		    
		    declare sub setDocumentView lib CocoaLib selector "setDocumentView:" (obj_id as Ptr, aView as Ptr)
		    setDocumentView(self.scrollview, self.id)
		    
		    return self.scrollview
		    
		  #else
		    #pragma unused frame
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Function NSClassName() As String
		  return "NSTableView"
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddColumn(c as NSTableColumn)
		  #if targetCocoa
		    declare sub addTableColumn lib CocoaLib selector "addTableColumn:" (id as Ptr, aColumn as Ptr)
		    
		    if c <> nil then
		      addTableColumn(self.id, c)
		    else
		      
		    end if
		    
		  #else
		    #pragma unused c
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BackgroundColor(assigns value as NSColor)
		  #if targetCocoa
		    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" (obj_id as Ptr, aColor as Ptr)
		    
		    setBackgroundColor self, value
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Column(identifier as String) As NSTableColumn
		  #if targetCocoa
		    declare function tableColumnWithIdentifier lib CocoaLib selector "tableColumnWithIdentifier:" (obj_id as Ptr, identifier as CFStringRef) as Ptr
		    
		    if self.id <> nil then
		      dim p as Ptr = tableColumnWithIdentifier(self, identifier)
		      if p <> nil then
		        return new NSTableColumn(p)
		      else
		        return nil
		      end if
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused identifier
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnIndexOf(identifier as String) As Integer
		  #if targetCocoa
		    declare function columnWithIdentifier lib CocoaLib selector "columnWithIdentifier:" (obj_id as Ptr, identifier as CFStringRef) as Integer
		    
		    if self.id <> nil then
		      return columnWithIdentifier(self, identifier)
		    else
		      return -1
		    end if
		    
		  #else
		    #pragma unused identifier
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Columns() As NSTableColumn()
		  '#if targetCocoa
		  'declare function tableColumns lib CocoaLib selector "tableColumns" (obj_id as Ptr) as Ptr
		  '
		  'if self.id <> nil then
		  'dim p as Ptr = tableColumns(self)
		  'if p <> nil then
		  'dim theList as new CFArray(p, not CFType.hasOwnership)
		  'dim lastOffset as Integer = theList.Count - 1
		  'for offset as Integer = 0 to lastOffset
		  'dim ref as Ptr
		  'must decide how to deal with CFArray in this case.
		  'next
		  '
		  'else
		  'dim c(-1)
		  'return c
		  'end if
		  'else
		  'dim c(-1)
		  'return c
		  'end if
		  '#endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource(assigns value as NSTableViewDataSource)
		  #if targetCocoa
		    declare sub setDataSource lib CocoaLib selector "setDataSource:" (obj_id as Ptr, anObject as Ptr)
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, anObject as Ptr)
		    
		    //what if value is nil?
		    setDataSource self, value
		    setDelegate self, value
		    //an interim hack to ensure object existence.
		    self.pdatasource = value
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FindByID(obj_id as Ptr) As NSTableView
		  dim c as NSControl = NSControl.FindByID(obj_id)
		  if c isA NSTableView then
		    return NSTableView(c)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GridColor() As NSColor
		  #if targetCocoa
		    declare function gridColor lib CocoaLib selector "gridColor" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = gridColor(self)
		    if p <> nil then
		      return new NSColor(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GridStyleMask() As Integer
		  #if targetCocoa
		    declare function gridStyleMask lib CocoaLib selector "gridStyleMask" (obj_id as Ptr) as Integer
		    
		    if self.id <> nil then
		      return  gridStyleMask(self)
		    else
		      return 0
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GridStyleMask(assigns value as Integer)
		  #if targetCocoa
		    declare sub setGridStyleMask lib CocoaLib selector "setGridStyleMask:" (obj_id as Ptr, value as Integer)
		    
		    if self.id <> nil then
		      setGridStyleMask(self, value)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HeaderView(assigns value as NSTableHeaderView)
		  #if targetCocoa
		    declare sub setHeaderView lib CocoaLib selector "setHeaderView:" (obj_id as Ptr, aHeaderView as Ptr)
		    
		    if value <> nil then
		      setHeaderView self, value
		    else
		      setHeaderView self, nil
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub noteNumberOfRowsChanged()
		  #if targetCocoa
		    declare sub noteNumberOfRowsChanged lib CocoaLib selector "noteNumberOfRowsChanged" (obj_id as Ptr)
		    
		    if self.id <> nil then
		      noteNumberOfRowsChanged(self)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Tile()
		  #if targetCocoa
		    declare sub tile lib CocoaLib selector "tile" (obj_id as Ptr)
		    
		    if self.id <> nil then
		      tile(self)
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Read Me
		
		
		Default row height: according to the Apple docs, the default row height is 16.0.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function allowsColumnReordering lib CocoaLib selector "allowsColumnReordering" (obj_id as Ptr) as Boolean
			    
			    if self <> nil then
			      return allowsColumnReordering(self)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setAllowsColumnReordering lib CocoaLib selector "setAllowsColumnReordering:" (obj_id as Ptr, value as Boolean)
			    
			    if self <> nil then
			      setAllowsColumnReordering(self, value)
			    else
			      //
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		AllowColumnReordering As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function usesAlternatingRowBackgroundColors lib CocoaLib selector "usesAlternatingRowBackgroundColors" (obj_id as Ptr) as Boolean
			    
			    if self.id <> nil then
			      return usesAlternatingRowBackgroundColors(self)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setUsesAlternatingRowBackgroundColors lib CocoaLib selector "setUsesAlternatingRowBackgroundColors:" (obj_id as Ptr, value as Boolean)
			    
			    if self.id <> nil then
			      setUsesAlternatingRowBackgroundColors(self, value)
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		AlternatingRowBackground As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function autohidesScrollers lib CocoaLib selector "autohidesScrollers" (obj_id as Ptr) as Boolean
			    
			    return autohidesScrollers(self.scrollview)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setAutohidesScrollers lib CocoaLib selector "setAutohidesScrollers:" (obj_id as Ptr, value as Boolean)
			    
			    setAutohidesScrollers(self.scrollview, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		AutohideScrollbars As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function numberOfColumns lib CocoaLib selector "numberOfColumns" (obj_id as Ptr) as Integer
			    
			    return numberOfColumns(self)
			  #endif
			End Get
		#tag EndGetter
		ColumnCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim c as NSColor = self.GridColor
			  if c <> nil then
			    return c
			  else
			    return  &cff0000
			  end if
			End Get
		#tag EndGetter
		debugGridColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function highlightStyle lib CocoaLib selector "selectionHighlightStyle" (obj_id as Ptr) as SelectionHighlightStyle
			    
			    if self <> nil then
			      return highlightStyle(self)
			    else
			      return SelectionHighlightStyle.Regular
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setSelectionHighlightStyle lib CocoaLib selector "setSelectionHighlightStyle:" (obj_id as Ptr, value as SelectionHighlightStyle)
			    
			    setSelectionHighlightStyle(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		HighlightStyle As SelectionHighlightStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (self.GridStyleMask and NSTableViewSolidHorizontalGridLineMask) = NSTableViewSolidHorizontalGridLineMask
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value then
			    self.GridStyleMask = self.GridStyleMask or NSTableViewSolidHorizontalGridLineMask
			  else
			    self.GridStyleMask = self.GridStyleMask and not NSTableViewSolidHorizontalGridLineMask
			  end if
			  
			  #pragma unused value
			End Set
		#tag EndSetter
		HorizontalGrid As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private initialHighlightStyle As SelectionHighlightStyle
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function intercellSpacing lib CocoaLib selector "intercellSpacing" (obj_id as Ptr) as Cocoa.NSSize
			    
			    if self.id <> nil then
			      return intercellSpacing(self)
			    else
			      dim s as NSSize
			      return s
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setIntercellSpacing lib CocoaLib selector "setIntercellSpacing:" (obj_id as Ptr, aSize as Cocoa.NSSize)
			    
			    if self.id <> nil then
			      setIntercellSpacing(self, value)
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		IntercellSpacing As Cocoa.NSSize
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		pdatasource As NSTableViewDataSource
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function rowHeight lib CocoaLib selector "rowHeight" (obj_id as Ptr) as Double
			    
			    if self.id <> nil then
			      return CType(rowHeight(self), Double)
			    else
			      return 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setRowHeight lib CocoaLib selector "setRowHeight:" (obj_id as Ptr, value as Double)
			    
			    if self <> nil then
			      setRowHeight(self.id, CType(value, Single))
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		RowHeight As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private scrollview As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function allowsTypeSelect lib CocoaLib selector "allowsTypeSelect" (obj_id as Ptr) as Boolean
			    
			    if self.id <> nil then
			      return allowsTypeSelect(self)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setAllowsTypeSelect lib CocoaLib selector "setAllowsTypeSelect:" (obj_id as Ptr, value as Boolean)
			    
			    setAllowsTypeSelect(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TypeSelect As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			self.GridStyleMask = self.GridStyleMask or NSTableViewSolidVerticalGridLineMask)
		#tag EndNote
		#tag Getter
			Get
			  return (self.GridStyleMask and NSTableViewSolidVerticalGridLineMask) = NSTableViewSolidVerticalGridLineMask
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value then
			    self.GridStyleMask = self.GridStyleMask or NSTableViewSolidVerticalGridLineMask
			  else
			    self.GridStyleMask = self.GridStyleMask and not NSTableViewSolidVerticalGridLineMask
			  end if
			  
			End Set
		#tag EndSetter
		VerticalGrid As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function hasVerticalScroller lib CocoaLib selector "hasVerticalScroller" (obj_id as Ptr) as Boolean
			    
			    return hasVerticalScroller(self.scrollview)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setHasVerticalScroller lib CocoaLib selector "setHasVerticalScroller:" (obj_id as Ptr, value as Boolean)
			    
			    setHasVerticalScroller(self.scrollview, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		VerticalScrollbar As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = NSTableViewSolidHorizontalGridLineMask, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSTableViewSolidVerticalGridLineMask, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant


	#tag Enum, Name = SelectionHighlightStyle, Type = Integer, Flags = &h0
		None = -1
		  Regular = 0
		SourceList = 1
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
			Name="AllowColumnReordering"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsExpansionToolTips"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlternatingRowBackground"
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
			Name="AutohideScrollbars"
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
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="debugGridColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
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
			Name="HighlightStyle"
			Group="Behavior"
			Type="SelectionHighlightStyle"
			EditorType="Enum"
			#tag EnumValues
				"-1 - None"
				"0 - Regular"
				"1 - SourceList"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalGrid"
			Group="Behavior"
			Type="Boolean"
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
			Name="RowHeight"
			Group="Behavior"
			Type="Double"
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
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TypeSelect"
			Group="Behavior"
			Type="Boolean"
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
			Name="VerticalGrid"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalScrollbar"
			Group="Behavior"
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

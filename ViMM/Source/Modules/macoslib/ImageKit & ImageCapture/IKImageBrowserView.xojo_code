#tag Class
Protected Class IKImageBrowserView
Inherits Canvas
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  //
		  
		  #pragma unused base
		  #pragma unused x
		  #pragma unused y
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  //
		  
		  #pragma unused hitItem
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  //
		  
		  #pragma unused X
		  #pragma unused Y
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  //
		  
		  #pragma unused X
		  #pragma unused Y
		  #pragma unused deltaX
		  #pragma unused deltaY
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  RequireFramework   IKLib
		  RequireFramework   ICLib
		  
		  #if targetMacOS
		    
		    const  scrollerWidth = 16.0
		    
		    dim frame as Cocoa.NSRect
		    frame.x = 0.0
		    frame.y = 0.0
		    frame.w = self.Width - scrollerWidth
		    frame.h = self.Height
		    
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as Cocoa.NSRect) as Ptr
		    
		    self._id = initWithFrame( NSObject.Allocate( self.NSClassName ), frame )
		    if self.id = nil then
		      raise new macoslibException( "Unable to instantiate class " + NSClassName )
		    end if
		    
		    'dsource = new IKImageBrowserDataSource( NSObject.Initialize( NSObject.Allocate( "IKImageBrowserDataSource" )), false )
		    'SetDataSource   dsource
		    
		    soft declare sub addSubview lib CocoaLib selector "addSubview:" (id as Ptr, aView as Ptr)
		    soft declare sub setAutoresizingMask lib CocoaLib selector "setAutoresizingMask:" (id as Ptr, mask as Integer)
		    soft declare sub setFrame lib CocoaLib selector "setFrame:" (id as Ptr, frameRect as Cocoa.NSRect)
		    
		    const NSViewWidthSizable = 2
		    const NSViewHeightSizable = 16
		    const NSViewMinYMargin = 8
		    const NSViewMinXMargin = 1
		    
		    dim scrollerframe as Cocoa.NSRect
		    scrollerframe.w = scrollerWidth
		    scrollerframe.h = self.Height
		    scrollerframe.x = self.width - scrollerWidth
		    scrollerframe.y = 0.0
		    
		    scroller = initWithFrame( NSObject.Allocate( "NSScroller" ), scrollerframe )
		    
		    if scroller=nil then
		      break
		    end if
		    
		    addSubview   Ptr(self.Handle), self.id
		    addSubview   Ptr(self.Handle), scroller
		    
		    declare sub setScrollerStyle lib CocoaLib selector "setScrollerStyle:" (id as Ptr, style as integer )
		    declare sub setVerticalScroller lib IKLib selector "setVerticalScroller:" ( id as Ptr, sliderID as Ptr )
		    
		    setAutoresizingMask   scroller, NSViewHeightSizable OR NSViewMinXMargin
		    setVerticalScroller   self.id, scroller
		    setScrollerStyle  scroller, 0
		    
		    //here we lock the control to the canvas superview so that resizing is handled by the canvas.
		    'setAutoresizingMask  nssv, NSViewWidthSizable or NSViewHeightSizable
		    declare sub setAutoresizesSubviews lib CocoaLib selector "setAutoresizesSubviews:" (id as Ptr, mode as Boolean)
		    
		    setAutoresizesSubviews  Ptr( self.Handle ), true
		    setAutoresizingMask self.id, NSViewWidthSizable or NSViewHeightSizable
		    
		    declare sub setContentResizingMask lib IKLib selector "setContentResizingMask:" (id as Ptr, mode as integer)
		    declare sub setAnimates lib IKLib selector "setAnimates:" (id as Ptr, flag as Boolean)
		    
		    setContentResizingMask   Ptr( self.id ), NSViewHeightSizable //NSViewWidthSizable OR NSViewHeightSizable
		    setAnimates  Ptr( self.id ), true
		    
		    SetDelegate
		    
		    RaiseEvent   Open
		    
		    NObserver = new NotificationObserver
		    AddHandler  NObserver.HandleNotification, AddressOf HandleNotification
		    
		    NObserver.Register  "NSViewFrameDidChangeNotification", me.id
		    
		    me.Invalidate
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function AddInstanceMethod(class_id as Ptr, name as String, impl as Ptr, types as String) As Boolean
		  #if TargetMacOS
		    
		    soft declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    soft declare function NSSelectorFromString lib CocoaLib (aSelectorName as CFStringRef) as Ptr
		    
		    return class_addMethod(class_id, NSSelectorFromString(name), impl, types)
		    
		  #else
		    
		    #pragma unused class_id
		    #pragma unused name
		    #pragma unused impl
		    #pragma unused types
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CollapseGroupAtIndex(index as integer)
		  #if TargetMacOS
		    declare sub collapseGroupAtIndex_ lib IKLib selector "collapseGroupAtIndex:" (id as ptr, idx as UInt32)
		    
		    if index>=0 then
		      collapseGroupAtIndex_  self.id, index
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    
		    declare function init lib CocoaLib selector "init" (id as Ptr) as Ptr
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    
		    _id = init( alloc( SubClassID ))
		    
		    ObjectList.Append self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ControlMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_BackgroundRightClicked(id as Ptr, sel as Ptr, sender as Ptr, evt as Ptr)
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserView = IKImageBrowserView( w.Value )
		      if obj <> nil then
		        obj.Handle_BackgroundRightClicked   new NSEvent( evt )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_CellDoubleClicked(id as Ptr, sel as Ptr, sender as Ptr, index as integer)
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserView = IKImageBrowserView( w.Value )
		      if obj <> nil then
		        obj.Handle_DoubleClick   index
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_CellRightClicked(id as Ptr, sel as Ptr, sender as Ptr, index as integer, evt as Ptr)
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserView = IKImageBrowserView( w.Value )
		      if obj <> nil then
		        obj.Handle_RightClick   index, new NSEvent( evt )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_ItemAtIndex(id as Ptr, sel as Ptr, sender as Ptr, index as integer) As Ptr
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    #if false //Unimplemented yet
		      'DReport   CurrentMethodName
		      
		      'if CocoaDelegateMap.HasKey( id ) then
		      'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      'dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      'if obj <> nil then
		      'return  obj.Handle_ItemAtIndex( index )
		      '
		      'else
		      '//something might be wrong.
		      'end if
		      'else
		      '//something might be wrong.
		      'end if
		      
		    #else
		      
		      #pragma unused id
		      #pragma unused sender
		      #pragma unused index
		      
		    #endif
		  #endif
		  
		  #pragma unused sel
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_NumberOfItems(id as Ptr, sel as Ptr, sender as Ptr) As integer
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    #if false //Unimplemented yet
		      'DReport   CurrentMethodName
		      
		      'if CocoaDelegateMap.HasKey( id ) then
		      'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      'dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      'if obj <> nil then
		      'return  obj.Handle_NumberOfItems
		      '
		      'else
		      '//something might be wrong.
		      'end if
		      'else
		      '//something might be wrong.
		      'end if
		      
		    #else
		      
		      #pragma unused id
		      #pragma unused sender
		      
		    #endif
		    
		  #else
		    
		    #pragma unused id
		    #pragma unused sender
		    
		  #endif
		  
		  #pragma unused sel
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_SelectionChanged(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserView = IKImageBrowserView( w.Value )
		      if obj <> nil then
		        obj.Handle_SelectionChanged
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  //# Removes the object from the object list
		  
		  ObjectList.Remove  ObjectList.IndexOf( self )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandGroupAtIndex(index as integer)
		  #if TargetMacOS
		    declare sub expandGroupAtIndex_ lib IKLib selector "expandGroupAtIndex:" (id as ptr, idx as UInt32)
		    
		    if index>=0 then
		      expandGroupAtIndex_  self.id, index
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(impl_obj_id as Ptr) As IKImageBrowserView
		  #pragma disableBackgroundTasks
		  
		  dim theSource as IKImageBrowserView
		  for each item as IKImageBrowserView in ObjectList
		    dim p as Ptr = item.id
		    if p = impl_obj_id then
		      theSource = item
		      exit
		    end if
		  next
		  return theSource
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleNotification(observer as NotificationObserver, theNotification as NSNotification)
		  #if TargetMacOS
		    #pragma unused observer
		    
		    select case theNotification.Name
		    case "NSViewFrameDidChangeNotification"
		      RaiseEvent   Resized
		      
		    end select
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_BackgroundRightClicked(evt as NSEvent)
		  
		  #if TargetMacOS
		    dim pt as Cocoa.NSPoint = evt.LocationLocalToNSView( self.id, self )
		    
		    RaiseEvent   BackgroundRightClicked( pt.x, pt.y )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DoubleClick(index as integer)
		  
		  #if TargetMacOS
		    RaiseEvent  DoubleClick( index )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_NewCell(item as IKImageBrowserItem) As IKImageBrowserCell
		  
		  #if TargetMacOS
		    return  RaiseEvent NewCellForItem( item )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_RightClick(index as integer, evt as NSEvent)
		  #pragma unused index
		  
		  #if TargetMacOS
		    
		    dim base as new MenuItem( "" )
		    dim pt as Cocoa.NSPoint = evt.LocationLocalToNSView( self.id, self )
		    dim hitItem as MenuItem
		    
		    if  RaiseEvent  ConstructContextualMenu( base, pt.x, pt.y ) then
		      hitItem = base.PopUp
		      
		      call   RaiseEvent  ContextualMenuAction( hitItem )
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_SelectionChanged()
		  
		  #if TargetMacOS
		    RaiseEvent  SelectionChanged
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invalidate()
		  
		  #if TargetMacOS
		    declare sub setNeedsDisplay lib CocoaLib selector "setNeedsDisplay:" (id as Ptr, flag as boolean)
		    
		    setNeedsDisplay( me.id, true )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemAtIndex(index as integer) As IKImageBrowserItem
		  #if TargetMacOS
		    if dsource<>nil then
		      return  dsource.ItemAtIndex( index )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "imageBrowser:backgroundWasRightClickedWithEvent:" : CType( AddressOf delegate_BackgroundRightClicked, Ptr ) : "v@:@@"
		    methodList.Append  "imageBrowser:cellWasRightClickedAtIndex:withEvent:" : CType( AddressOf delegate_CellRightClicked, Ptr ) : "v@:@I@"
		    methodList.Append  "imageBrowser:cellWasDoubleClickedAtIndex:" : CType( AddressOf delegate_CellDoubleClicked, Ptr ) : "v@:@I"
		    methodList.Append  "imageBrowserSelectionDidChange:" : CType( AddressOf delegate_SelectionChanged, Ptr ) : "v@:@"
		    'methodList.Append  "numberOfItemsInImageBrowser:" : CType( AddressOf delegate_NumberOfItems, Ptr ) : "i@:@"
		    'methodList.Append  "imageBrowser:itemAtIndex:" : CType( AddressOf delegate_ItemAtIndex, Ptr ) : "@@:@i"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList, "IKImageBrowserDelegate")
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeSubclass(className as String = NSClassName, superclassName as String = "IKImageBrowserView") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if targetMacOS
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    declare function objc_getProtocol lib CocoaLib (name as CString) as Ptr
		    declare function class_addProtocol lib CocoaLib (Cls as Ptr, protocol as Ptr) as Boolean
		    declare function class_getInstanceMethod lib CocoaLib ( clsID as Ptr, SEL as Ptr ) as Ptr
		    declare function method_setImplementation lib CocoaLib ( meth as Ptr, imp as Ptr ) as Ptr
		    
		    RequireFramework  ICLib
		    RequireFramework  IKLib
		    
		    dim newClassId as Ptr = objc_allocateClassPair( Cocoa.NSClassFromString( superclassName ), className, 0 )
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    objc_registerClassPair  newClassId
		    
		    dim methodList() as Tuple
		    methodList.Append "newCellForRepresentedItem:" : CType( AddressOf subclass_NewCell, Ptr ) : "@@:@"
		    'methodList.Append "setDropIndex:dropOperation:" : CType( AddressOf subclass_setDropIndex, Ptr ) : "i@:ii"
		    
		    dim methodsAdded as Boolean = true
		    for each item as Tuple in methodList
		      if NOT class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2)) then
		        Raise new ObjCException
		      end if
		    next
		    
		    if methodsAdded then
		      return  newClassId
		    else
		      return  nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload()
		  #if TargetMacOS
		    declare sub reloadData lib IKLib selector "reloadData" (id as Ptr)
		    
		    reloadData( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadAllCellsData()
		  #if TargetMacOS
		    declare sub reloadAllCellsData lib IKLib selector "reloadAllCellsData" (id as Ptr)
		    
		    reloadAllCellsData( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollIndexToVisible(index as integer)
		  
		  #if TargetMacOS
		    declare sub scrollIndexToVisible lib IKLib selector "scrollIndexToVisible:" (id as Ptr, idx as integer )
		    
		    scrollIndexToVisible( self.id, index )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectIndexes(indexes as NSIndexSet, byExtendingCurrentSelection as boolean = false)
		  
		  #if TargetMacOS
		    declare sub setSelectionIndexes lib IKLib selector "setSelectionIndexes:byExtendingSelection:" (id as Ptr, idxs as Ptr, flag as Boolean)
		    
		    dim selIdxs as NSIndexSet
		    if indexes=nil then
		      selIdxs = NSIndexSet.Create
		    else
		      selIdxs = indexes
		    end if
		    
		    setSelectionIndexes   self.id, selIdxs, byExtendingCurrentSelection
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDataSource(ikf as IKImageBrowserDataSource, loadImmediately as Boolean = true)
		  #if TargetMacOS
		    declare sub setDataSource lib IKLib selector "setDataSource:" (id as Ptr, source as Ptr)
		    
		    dsource = ikf
		    
		    setDataSource   self.id, dsource.id
		    
		    if loadImmediately then
		      Reload
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self.id, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SubClassID() As Ptr
		  static p as Ptr = MakeSubclass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function subclass_NewCell(id as Ptr, sel as Ptr, anItem as Ptr) As Ptr
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    dim p as Ptr
		    
		    #if false
		      //!!!!!!!! Does not work as expected. Why ?
		      
		      dim obj as IKImageBrowserView = FindObjectByID( id )
		      dim IKItem as IKImageBrowserItem
		      
		      'if obj<>nil then
		      //To override the method, create a custom IKImageBrowserCell inside the event "NewCellForItem"
		      'IKItem = new IKImageBrowserItem( anItem )
		      'if IKItem<>nil then
		      'p = obj.Handle_NewCell( IKItem )
		      'else
		      'return  new IKImageBrowserCell
		      'end if
		      'end if
		    #else
		      
		      #pragma unused id
		      #pragma unused anItem
		      
		    #endif
		    
		    if p<>nil then
		      return  p
		      
		    else //Returning nil causes an ObjCException
		      return  new IKImageBrowserCell
		      
		    end if
		    
		    exception exc
		      return  new IKImageBrowserCell
		      
		  #else
		    
		    #pragma unused id
		    #pragma unused anItem
		    
		  #endif
		  
		  #pragma unused sel
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateItemList()
		  #if TargetMacOS
		    declare sub updateItemList lib IKLib selector "updateItemList" (id as Ptr)
		    
		    updateItemList( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub viewDidChangeBackingProperties()
		  #if TargetMacOS
		    declare sub viewDidChangeBackingProperties_ lib CocoaLib selector "viewDidChangeBackingProperties" (id as Ptr)
		    
		    viewDidChangeBackingProperties_( self.id )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleItemIndexes() As Cocoa.NSIndexSet
		  
		  #if TargetMacOS
		    declare function visibleItemIndexes lib IKLib selector "visibleItemIndexes" (id as Ptr) as Ptr
		    
		    dim p as Ptr = visibleItemIndexes( self.id )
		    
		    if p<>nil then
		      return  new NSIndexSet( p )
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event BackgroundRightClicked(x as integer, y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base as MenuItem, x as integer, y as integer) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualMenuAction(hitItem as MenuItem) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DoubleClick(itemIndex as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(ErrorMessage as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NewCellForItem(item as IKImageBrowserItem) As IKImageBrowserCell
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resized()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function allowsEmptySelection lib IKLib selector "allowsEmptySelection" (id as Ptr) as boolean
			    
			    return  allowsEmptySelection( self.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setAllowsEmptySelection lib IKLib selector "setAllowsEmptySelection:" (id as Ptr, value as boolean)
			    
			    setAllowsEmptySelection( self.id, value )
			  #endif
			End Set
		#tag EndSetter
		AllowsEmptySelection As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function allowsMultipleSelection lib IKLib selector "allowsMultipleSelection" (id as Ptr) as boolean
			    
			    return  allowsMultipleSelection( self.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setAllowsEmptySelection lib IKLib selector "setAllowsEmptySelection:" (id as Ptr, value as boolean)
			    
			    setAllowsEmptySelection( self.id, value )
			  #endif
			End Set
		#tag EndSetter
		AllowsMultipleSelection As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function allowsReordering lib IKLib selector "allowsReordering" (id as Ptr) as boolean
			    
			    return  allowsReordering( self.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setAllowsReordering lib IKLib selector "setAllowsReordering:" (id as Ptr, value as boolean)
			    
			    setAllowsReordering( self.id, value )
			  #endif
			End Set
		#tag EndSetter
		AllowsReordering As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function animates lib IKLib selector "animates" (id as Ptr) as boolean
			    
			    return  animates( self.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setAnimates lib IKLib selector "setAnimates:" (id as Ptr, value as boolean)
			    
			    setAnimates( self.id, value )
			  #endif
			End Set
		#tag EndSetter
		Animates As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function canControlQuickLookPanel lib IKLib selector "canControlQuickLookPanel" (id as Ptr) as boolean
			    
			    return  canControlQuickLookPanel( self.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setCanControlQuickLookPanel lib IKLib selector "setCanControlQuickLookPanel:" (id as Ptr, value as boolean)
			    
			    setCanControlQuickLookPanel( self.id, value )
			  #endif
			End Set
		#tag EndSetter
		CanControlQuickLookPanel As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function cellSize_ lib IKLib selector "setCellSize:" (id as ptr) as Cocoa.NSSize
			    
			    return  cellSize_( me.id )
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setCellSize lib IKLib selector "setCellSize:" (id as ptr, size as Cocoa.NSSize)
			    
			    setCellSize   me.id, value
			    
			  #endif
			End Set
		#tag EndSetter
		CellSize As Cocoa.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setCellsStyleMask_ lib IKLib selector "setCellsStyleMask:" (id as Ptr, flags as integer)
			    
			    setCellsStyleMask_  self.id, value
			    
			  #endif
			End Set
		#tag EndSetter
		CellsStyleMask As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function constrainsToOriginalSize lib IKLib selector "constrainsToOriginalSize" (id as Ptr) as boolean
			    
			    return  constrainsToOriginalSize( self.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setConstrainsToOriginalSize lib IKLib selector "setConstrainsToOriginalSize:" (id as Ptr, value as boolean)
			    
			    setConstrainsToOriginalSize( self.id, value )
			  #endif
			End Set
		#tag EndSetter
		ConstrainsToOriginalSize As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		dsource As IKImageBrowserDataSource
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  _id
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function intercellSpacing lib IKLib selector "intercellSpacing" (id as ptr) as Cocoa.NSSize
			    
			    return  intercellSpacing( me.id )
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setIntercellSpacing lib IKLib selector "setIntercellSpacing:" (id as ptr, size as Cocoa.NSSize)
			    
			    setIntercellSpacing   me.id, value
			    
			  #endif
			End Set
		#tag EndSetter
		IntercellSpacing As Cocoa.NSSize
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		NObserver As NotificationObserver
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function numberOfColumns lib IKLib selector "numberOfColumns" (id as Ptr) as integer
			    
			    return  numberOfColumns( self.id )
			  #endif
			End Get
		#tag EndGetter
		NumberOfColumns As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function numberOfRows lib IKLib selector "numberOfRows" (id as Ptr) as integer
			    
			    return  numberOfRows( self.id )
			  #endif
			End Get
		#tag EndGetter
		NumberOfRows As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared ObjectList() As IKImageBrowserView
	#tag EndProperty

	#tag Property, Flags = &h21
		Private scroller As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _id As Ptr
	#tag EndProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibIKImageBrowserViewDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IKCellsStyleNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKCellsStyleOutlined, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKCellsStyleShadowed, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKCellsStyleSubtitled, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKCellsStyleTitled, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKGroupBezelStyle, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IKGroupDisclosureStyle, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"macoslibIKImageBrowserView", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsEmptySelection"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsMultipleSelection"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsReordering"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Animates"
			Group="Behavior"
			Type="boolean"
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
			Name="CanControlQuickLookPanel"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CellsStyleMask"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConstrainsToOriginalSize"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
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
			Group="Behavior"
			InitialValue="False"
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
			Group="Initial State"
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
			Name="NumberOfColumns"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumberOfRows"
			Group="Behavior"
			Type="Integer"
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
			Group="Appearance"
			InitialValue="false"
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

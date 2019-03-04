#tag Class
Class NSSearchField
Inherits NSControl
	#tag Event
		Sub GotFocus()
		  self.SetFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function NSClassName() As String
		  return "NSSearchField"
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  SetDelegate
		  #if targetCocoa
		    //this is required to get text to scroll horizontally.  In an XCode app, this property would be
		    //set automatically by IB.
		    declare sub setScrollable lib CocoaLib selector "setScrollable:" (obj_id as Ptr, value as Boolean)
		    
		    setScrollable(self.Cell, true)
		  #endif
		  raiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddMenuItem(title as String)
		  #if targetCocoa
		    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		    declare function nextObject lib CocoaLib selector "nextObject" (obj_id as Ptr) as Ptr
		    declare function copy lib CocoaLib selector "copy" (obj_id as Ptr) as Ptr
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:action:keyEquivalent:" (obj_id as Ptr, title as CFStringRef, action as Ptr, keyEquiv as CFStringRef) as Ptr
		    declare sub setTarget lib CocoaLib selector "setTarget:" (obj_id as Ptr, target_id as Ptr)
		    declare sub release lib CocoaLib selector "release" (obj_id as Ptr)
		    
		    dim items() as Ptr
		    
		    dim enumerator as Ptr = objectEnumerator(itemArray(searchMenuTemplate(self)))
		    do
		      dim ref as Ptr = nextObject(enumerator)
		      if ref <> nil then
		        items.Append copy(ref)
		      else
		        exit
		      end if
		    loop
		    
		    dim newItem as Ptr = initWithTitle(alloc(Cocoa.NSClassFromString("NSMenuItem")), title, Cocoa.NSSelectorFromString("menuAction:"), "")
		    setTarget(newItem, self.GetDelegate)
		    items.Append newItem
		    
		    SetMenu items
		    
		  #else
		    #pragma unused title
		  #endif
		  
		  finally
		    #if targetCocoa
		      release(newItem)
		    #endif
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddMenuSeparator()
		  #if targetCocoa
		    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		    declare function nextObject lib CocoaLib selector "nextObject" (obj_id as Ptr) as Ptr
		    declare function copy lib CocoaLib selector "copy" (obj_id as Ptr) as Ptr
		    declare function separatorItem lib CocoaLib selector "separatorItem" ( Cls as Ptr ) as Ptr
		    
		    dim items() as Ptr
		    dim enumerator as Ptr = objectEnumerator(itemArray(searchMenuTemplate(self)))
		    do
		      dim ref as Ptr = nextObject(enumerator)
		      if ref <> nil then
		        items.Append copy(ref)
		      else
		        exit
		      end if
		    loop
		    
		    items.Append separatorItem(Cocoa.NSClassFromString("NSMenuItem"))
		    SetMenu items
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
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
		Private Shared Function DispatchcontrolDoCommandBySelector(id as Ptr, sel as Ptr, cntl as Ptr, textView as Ptr, command as Ptr) As Boolean
		  #if targetCocoa
		    dim obj as NSSearchField = FindObjectByID(id)
		    if obj <> nil then
		      
		      dim selectorName as String = Cocoa.NSStringFromSelector(command)
		      if selectorName = "insertTab:" then
		        return obj.InsertTab
		      elseif selectorName = "insertBacktab:" then
		        return obj.InsertBackTab
		      else
		        return false
		      end if
		      
		    else
		      //
		    end if
		    
		  #else
		    #pragma unused id
		    #pragma unused command
		  #endif
		  
		  #pragma unused sel
		  #pragma unused cntl
		  #pragma unused textView
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchcontrolTextDidBeginEditing(id as Ptr, sel as Ptr, notification as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      obj.EditStarted new NSNotification(notification)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchcontrolTextDidChange(id as Ptr, sel as Ptr, notification as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      obj.TextChanged new NSNotification(notification)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchcontrolTextDidEndEditing(id as Ptr, sel as Ptr, notification as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      obj.EditEnded new NSNotification(notification)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchcontrolTextShouldBeginEditing(id as Ptr, sel as Ptr, cntl as Ptr, fieldEditor as Ptr) As Boolean
		  #pragma unused sel
		  #pragma unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      return not obj.EditPrevent(new NSText(fieldEditor))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchcontrolTextShouldEndEditing(id as Ptr, sel as Ptr, cntl as Ptr, fieldEditor as Ptr) As Boolean
		  #pragma unused sel
		  #pragma unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      //control:textShouldEndEditing returns false to cancel the edit, but we want to return true to cancel edit.
		      return not obj.EditCancel(new NSText(fieldEditor))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchMenuAction(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  dim obj as NSSearchField = FindObjectByID(id)
		  if obj <> nil then
		    obj.MenuAction new NSMenuItem(sender)
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EditCancel(fieldEditor as NSText) As Boolean
		  return raiseEvent EditCancel(fieldEditor)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EditEnded(notification as NSNotification)
		  raiseEvent EditEnded(notification)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EditPrevent(fieldEditor as NSText) As Boolean
		  return raiseEvent EditPrevent(fieldEditor)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EditStarted(notification as NSNotification)
		  raiseEvent EditStarted(notification)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As NSSearchField
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return NSSearchField(w.Value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InsertBackTab() As Boolean
		  dim L() as RectControl = TabList(RectControls)
		  dim nextControl as RectControl
		  for i as Integer = 0 to UBound(L)
		    dim c as RectControl = L(i)
		    if c.TabIndex = self.TabIndex then
		      if i > 0 then
		        nextControl = L(i - 1)
		      else
		        nextControl = L(UBound(L))
		      end if
		      exit
		    end if
		  next
		  
		  if nextControl <> nil then
		    nextControl.SetFocus
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InsertTab() As Boolean
		  dim L() as RectControl = TabList(RectControls)
		  dim nextControl as RectControl
		  for i as Integer = 0 to UBound(L)
		    dim c as RectControl = L(i)
		    if c.TabIndex = self.TabIndex then
		      if i < UBound(L) then
		        nextControl = L(i + 1)
		      else
		        nextControl = L(0)
		      end if
		      exit
		    end if
		  next
		  
		  if nextControl <> nil then
		    nextControl.SetFocus
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append "menuAction:" : CType(AddressOf DispatchMenuAction, Ptr) : "v@:@"
		    methodList.Append "controlTextDidEndEditing:" : CType(AddressOf DispatchcontrolTextDidEndEditing, Ptr) : "v@:@"
		    methodList.Append "control:textShouldEndEditing:" : CType(AddressOf DispatchcontrolTextShouldEndEditing, Ptr) : "B@:@@"
		    methodList.Append "controlTextDidChange:" : CType(AddressOf DispatchcontrolTextDidChange, Ptr) : "v@:@"
		    methodList.Append "control:textShouldBeginEditing:" : CType(AddressOf DispatchcontrolTextShouldBeginEditing, Ptr) : "B@:@@"
		    methodList.Append "controlTextDidBeginEditing:" : CType(AddressOf DispatchcontrolTextDidBeginEditing, Ptr) : "v@:@"
		    methodList.Append "control:textView:doCommandBySelector:" : CType(AddressOf DispatchcontrolDoCommandBySelector, Ptr) : "v@:@@:"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList)
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MakeRecentSearchesMenuItems() As Ptr()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:action:keyEquivalent:" (obj_id as Ptr, title as CFStringRef, action as Ptr, keyEquiv as CFStringRef) as Ptr
		    declare sub setTag lib CocoaLib selector "setTag:" (obj_id as Ptr, value as Integer)
		    declare function separatorItem lib CocoaLib selector "separatorItem" (class_id as Ptr) as Ptr
		    
		    
		    dim L() as Ptr
		    
		    dim NSMenuItemClassPtr as Ptr = Cocoa.NSClassFromString("NSMenuItem")
		    
		    dim RecentSearchesTitleItem as Ptr = initWithTitle(alloc(NSMenuItemClassPtr), RecentSearchesLocalizedText, nil, "")
		    setTag RecentSearchesTitleItem, NSSearchFieldRecentsTitleMenuItemTag
		    L.Append RecentSearchesTitleItem
		    
		    dim item as Ptr = initWithTitle(alloc(NSMenuItemClassPtr), "Item", nil, "")
		    setTag item, NSSearchFieldRecentsMenuItemTag
		    L.Append item
		    
		    dim NoRecentSearchesTitleItem as Ptr = initWithTitle(alloc(NSMenuItemClassPtr), NoRecentSearchesLocalizedText, nil, "")
		    setTag NoRecentSearchesTitleItem, NSSearchFieldNoRecentsMenuItemTag
		    L.Append NoRecentSearchesTitleItem
		    
		    L.Append separatorItem(NSMenuItemClassPtr)
		    
		    dim clearItem as Ptr = initWithTitle(alloc(NSMenuItemClassPtr), ClearSearchesLocalizedText, nil, "")
		    setTag clearItem, NSSearchFieldClearRecentsMenuItemTag
		    L.Append clearItem
		    
		    dim clearSepItem as Ptr = separatorItem(NSMenuItemClassPtr)
		    setTag clearSepItem, NSSearchFieldClearRecentsMenuItemTag
		    L.Append clearSepItem
		    
		    return L
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MenuAction(item as NSMenuItem)
		  raiseEvent MenuAction item
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecentsAutosaveName() As String
		  #if targetCocoa
		    declare function recentsAutosaveName lib CocoaLib selector "recentsAutosaveName" (obj_id as Ptr) as CFStringRef
		    
		    return recentsAutosaveName(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecentsAutosaveName(assigns value as String)
		  #if targetCocoa
		    declare sub setRecentsAutosaveName lib CocoaLib selector "setRecentsAutosaveName:" (obj_id as Ptr, value as CFStringRef)
		    
		    setRecentsAutosaveName(self, value)
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecentSearches() As String()
		  #if targetCocoa
		    declare function recentSearches lib CocoaLib selector "recentSearches" (obj_id as Ptr) as Ptr
		    
		    dim L() as String
		    
		    dim recentsArrayPtr as Ptr = recentSearches(self)
		    if recentsArrayPtr = nil then
		      return L
		    end if
		    dim recentsArray as new CFArray(recentsArrayPtr, not CFType.hasOwnership)
		    for i as Integer = 0 to recentsArray.Count - 1
		      L.Append recentsArray.CFStringRefValue(i)
		    next
		    
		    return L
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecentSearches(assigns value() as String)
		  return
		  
		  #pragma unused value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RectControls() As RectControl()
		  dim theList() as RectControl
		  
		  dim w as Window = self.Window
		  if w = nil then
		    return theList
		  end if
		  
		  dim lastIndex as Integer = w.ControlCount - 1
		  for i as Integer = 0 to lastIndex
		    dim c as Control = w.Control(i)
		    if c isA RectControl then
		      theList.Append RectControl(c)
		    end if
		  next
		  
		  return theList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Search()
		  #if targetCocoa
		    declare function searchButtonCell lib CocoaLib selector "searchButtonCell" (obj_id as Ptr) as Ptr
		    declare function action lib CocoaLib selector "action" (obj_id as Ptr) as Ptr
		    declare function target lib CocoaLib selector "target" (obj_id as Ptr) as Ptr
		    declare function sendAction lib CocoaLib selector "sendAction:to:from:" (id as Ptr, anAction as Ptr, aTarget as Ptr, sender as Ptr) as Boolean
		    
		    
		    dim button as Ptr = searchButtonCell(self.Cell)
		    dim b as Boolean = (button <> nil) and sendAction(NSApplication.App, action(button),target(button), self.Cell)
		    #pragma unused b
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  #if targetCocoa
		    declare sub selectText lib CocoaLib selector "selectText:" (obj_id as Ptr, sender as Ptr)
		    
		    selectText(self, self)
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
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus()
		  #if targetCocoa
		    declare function makeFirstResponder lib CocoaLib selector "makeFirstResponder:" (obj_id as Integer, responder as Ptr) as Boolean
		    
		    if makeFirstResponder(self.TrueWindow.Handle, self) then
		      raiseEvent GotFocus
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetMenu(items() as Ptr)
		  #if targetCocoa
		    declare sub addItem lib CocoaLib selector "addItem:" (obj_id as Ptr, item as Ptr)
		    declare sub setSearchMenuTemplate lib CocoaLib selector "setSearchMenuTemplate:" (obj_id as Ptr, menu as Ptr)
		    
		    dim searchMenu as new NSMenu()
		    for each item as Ptr in items
		      addItem(searchMenu, item)
		    next
		    
		    setSearchMenuTemplate(self, searchMenu)
		    
		  #else
		    #pragma unused items
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowRecentSearches() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowRecentSearches(assigns value as Boolean)
		  #if targetCocoa
		    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		    declare function nextObject lib CocoaLib selector "nextObject" (obj_id as Ptr) as Ptr
		    declare function tag lib CocoaLib selector "tag" (obj_id as Ptr) as Integer
		    declare function copy lib CocoaLib selector "copy" (obj_id as Ptr) as Ptr
		    
		    dim items() as Ptr
		    
		    if value then
		      for each item as Ptr in MakeRecentSearchesMenuItems
		        items.Append item
		      next
		    end if
		    
		    dim tag_skip_list() as Integer = Array(NSSearchFieldRecentsTitleMenuItemTag, NSSearchFieldRecentsMenuItemTag, NSSearchFieldClearRecentsMenuItemTag, NSSearchFieldNoRecentsMenuItemTag)
		    
		    dim enumerator as Ptr = objectEnumerator(itemArray(searchMenuTemplate(self)))
		    do
		      dim ref as Ptr = nextObject(enumerator)
		      if ref <> nil then
		        if tag_skip_list.IndexOf(tag(ref)) = -1 then
		          items.Append copy(ref)
		        end if
		      else
		        exit
		      end if
		    loop
		    
		    SetMenu items
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TabList(controlList() as RectControl) As RectControl()
		  dim L() as RectControl
		  dim tabIndexes() as Integer
		  
		  for each item as RectControl in controlList
		    if item.TabStop then
		      L.Append item
		      tabIndexes.Append item.TabIndex
		    end if
		  next
		  
		  tabIndexes.SortWith(L)
		  return L
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TextChanged(notification as NSNotification)
		  raiseEvent TextChanged(notification)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event EditCancel(fieldEditor as NSText) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EditEnded(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EditPrevent(fieldEditor as NSText) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EditStarted(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MenuAction(item as NSMenuItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged(notification as NSNotification)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetcocoa then
			    Declare Function FocusRingType lib CocoaLib Selector "setFocusRingType:" (obj_id as ptr) as Integer
			    
			    Return FocusRingType(me) = 0
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetcocoa then
			    Declare sub setFocusRingType lib CocoaLib Selector "setFocusRingType:" (obj_id as ptr, type as Integer)
			    
			    if value then
			      setFocusRingType(me,0)
			    else
			      SetFocusRingType(me,1)
			    end if
			  #endif
			End Set
		#tag EndSetter
		FocusRing As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private InitialFocusRing As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function maximumRecents lib CocoaLib selector "maximumRecents" (obj_id as Ptr) as Integer
			    
			    return maximumRecents(self.Cell)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setMaximumRecents lib CocoaLib selector "setMaximumRecents:" (obj_id as Ptr, value as Integer)
			    
			    setMaximumRecents(self.Cell, value)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		MaxRecentSearches As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function placeholderString lib CocoaLib selector "placeholderString" (obj_id as Ptr) as CFStringRef
			    
			    return placeholderString(self.Cell)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setPlaceholderString lib CocoaLib selector "setPlaceholderString:" (obj_id as Ptr, value as CFStringRef)
			    
			    setPlaceholderString(self.Cell, value)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		PlaceholderText As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function sendsSearchStringImmediately lib CocoaLib selector "sendsSearchStringImmediately" (obj_id as Ptr) as Boolean
			    
			    if self <> nil then
			      return sendsSearchStringImmediately(self.Cell)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setSendsSearchStringImmediately lib CocoaLib selector "setSendsSearchStringImmediately:" (obj_id as Ptr, value as Boolean)
			    
			    if self <> nil then
			      setSendsSearchStringImmediately(self.Cell, value)
			    else
			      //to be implemented if this property is exposed in IDE.
			    end if
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		SendSearchStringImmediately As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function sendsWholeSearchString lib CocoaLib selector "sendsWholeSearchString" (obj_id as Ptr) as Boolean
			    
			    if self <> nil then
			      return sendsWholeSearchString(self.Cell)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setSendsWholeSearchString lib CocoaLib selector "setSendsWholeSearchString:" (obj_id as Ptr, value as Boolean)
			    
			    if self <> nil then
			      setSendsWholeSearchString(self.Cell, value)
			    else
			      //to be implemented if this property is exposed in IDE.
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		SendWholeSearchString As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
			    
			    return searchMenuTemplate(self) <> nil
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if self.id = nil then
			    return
			  end if
			  
			  #if targetCocoa
			    declare sub setSearchMenuTemplate lib CocoaLib selector "setSearchMenuTemplate:" (obj_id as Ptr, menu as Ptr)
			    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
			    
			    if value then
			      if searchMenuTemplate(self) = nil then
			        dim searchMenu as new NSMenu()
			        setSearchMenuTemplate self,  searchMenu
			      else
			        //menu already exists
			      end if
			    else
			      setSearchMenuTemplate self, nil
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ShowMenu As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = ClearSearchesLocalizedText, Type = String, Dynamic = True, Default = \"Clear", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Clear"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Effacer"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cancella"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xAE\xE0\xA7\x81\xE0\xA6\x9B\xE0\xA7\x87 \xE0\xA6\xAB\xE0\xA7\x87\xE0\xA6\xB2\xE0\xA6\xBE"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6schen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wis"
	#tag EndConstant

	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSSearchFieldDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NoRecentSearchesLocalizedText, Type = String, Dynamic = True, Default = \"No Recent Searches", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No Recent Searches"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Pas de recherche r\xC3\xA9cente"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nessuna ricerca recente"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Keine vorherigen Suchen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen recente zoekopdrachten"
	#tag EndConstant

	#tag Constant, Name = NSSearchFieldClearRecentsMenuItemTag, Type = Double, Dynamic = False, Default = \"1002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSSearchFieldNoRecentsMenuItemTag, Type = Double, Dynamic = False, Default = \"1003", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSSearchFieldRecentsMenuItemTag, Type = Double, Dynamic = False, Default = \"1001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSSearchFieldRecentsTitleMenuItemTag, Type = Double, Dynamic = False, Default = \"1000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = RecentSearchesLocalizedText, Type = String, Dynamic = True, Default = \"Recent Searches", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Recent Searches"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Recherches r\xC3\xA9centes"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Ricerche recenti"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vorherige Suchen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Recente zoekopdrachten"
	#tag EndConstant


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
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			Name="FocusRing"
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
			Name="MaxRecentSearches"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PlaceholderText"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendSearchStringImmediately"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendWholeSearchString"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowMenu"
			Group="Behavior"
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
			Visible=true
			Group="Behavior"
			InitialValue="True"
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

#tag Class
Class NSTokenField
Inherits NSControl
	#tag Event
		Sub Action()
		  
		  'report  "Action"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Activate()
		  
		  'report  "Activate"
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma unused base
		  #pragma unused x
		  #pragma unused y
		End Function
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  #pragma unused X
		  #pragma unused Y
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  #pragma unused obj
		  #pragma unused action
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  #pragma unused obj
		  #pragma unused action
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  #pragma unused obj
		  #pragma unused action
		End Function
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  #pragma unused X
		  #pragma unused Y
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  //
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  #pragma unused X
		  #pragma unused Y
		End Sub
	#tag EndEvent

	#tag Event
		Function NSClassName() As String
		  return "NSTokenField"
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

	#tag Event
		Sub Paint(g as Graphics, areas() as REALbasic.Rect = Nil)
		  #pragma unused g
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AppendObject(newObject as variant)
		  //# Append a new object to the TokenField
		  
		  #if TargetMacOS
		    declare function objectValue lib CocoaLib selector "objectValue" ( id as Ptr ) as Ptr
		    declare sub setObjectValue lib CocoaLib selector "setObjectValue:" ( id as Ptr, nsa as Ptr )
		    
		    dim nsa as NSArray = new NSArray( objectValue( me.id ), false )
		    dim nsma as NSMutableArray = new NSMutableArray( nsa.MutableCopy, false )
		    
		    dim nso as NSWrapperForObject
		    
		    if newObject isa NSObject then
		      nsma.Append   NSObject( newObject )
		      
		    elseif VarType( newObject ) = Variant.TypeString then
		      nso = new NSWrapperForObject( newObject )
		      nsma.Append   nso
		      
		    elseif newObject isa Object then
		      nso = new NSWrapperForObject( newObject )
		      StoreNSWrapper   nso
		      nsma.Append   nso
		      
		    end if
		    
		    setObjectValue  me.id, nsma.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  //# Clear the NSTokenField contents
		  
		  #if TargetMacOS
		    declare sub setObjectValue lib CocoaLib selector "setObjectValue:" ( id as Ptr, nsa as Ptr )
		    
		    redim  FieldObjects( -1 )
		    cachedMenu = nil
		    cachedRepresentedObject = nil
		    
		    setObjectValue  me.id, nil
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
		Private Function ConvertVariantForPasteboard(value as Variant, byref outType as integer) As variant
		  //Convert a user-given variant into a type acceptable for the Pasteboard/Property List (NSString, NSData, NSDictionary, NSArray, NSDate, NSNumber (incl bool)
		  
		  const kTypeString = 0
		  const kTypeData = 1
		  const kTypePropertyList = 2
		  
		  if VarType( value ) = Variant.TypeString then
		    outType = kTypeString
		    return  value
		  end if
		  
		  if value.IsArray then
		    outType = kTypePropertyList
		    return   NSArray.CreateFromObjectsArray( value )
		  end if
		  
		  if value isa NSObject then
		    //For now we assume user gave a correct type
		    outType = kTypePropertyList
		    return   value
		    
		  elseif value isa Object then
		    if value isa MemoryBlock then
		      outType = kTypeData
		      return   new NSData( MemoryBlock( value ))
		      
		    elseif value isa Dictionary then
		      outType = kTypePropertyList
		      return   NSDictionary.CreateFromDictionary( Dictionary( value ))
		    end if
		    
		  else
		    outType = kTypePropertyList
		    return   Cocoa.NSObjectFromVariant( value )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_completionsForSubstring(id as Ptr, sel as Ptr, cntl as Ptr, substring as CFStringRef, tokenIndex as integer, byref indexOfSelectedItem as integer) As Ptr
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  dim nsa as NSArray
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      dim idx as integer = indexOfSelectedItem
		      nsa = obj.HandleCompletionForSubstring( substring, tokenIndex, idx )
		      
		      indexOfSelectedItem = idx
		      if nsa=nil then
		        break
		      else
		        return   nsa.Retain
		      end if
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_displayStringForRepresentedObject(id as Ptr, sel as Ptr, cntl as Ptr, representedObject as Ptr) As Ptr
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      dim nss as NSString = obj.HandleDisplayStringForObject(representedObject)
		      return   nss.id
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_editingStringForRepresentedObject(id as Ptr, sel as Ptr, cntl as Ptr, representedObject as Ptr) As Ptr
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      dim nss as NSString = obj.HandleDisplayStringForObject( representedObject)
		      return nss.id
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_hasMenuForRepresentedObject(id as Ptr, sel as Ptr, cntl as Ptr, representedObject as Ptr) As Boolean
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  dim OK as Boolean
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      OK = obj.HandleHasMenuForObject( representedObject )
		      return   OK
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_menuAction(id as Ptr, sel as Ptr, sender as Ptr)
		  #if targetMacOS
		    #pragma unused sel
		    #pragma stackOverflowChecking false
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as NSTokenField = NSTokenField( w.Value )
		      if obj <> nil then
		        obj.HandleMenuActionForObject( sender )
		        
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
		Private Shared Function delegate_menuForRepresentedObject(id as Ptr, sel as Ptr, cntl as Ptr, representedObject as Ptr) As Ptr
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  dim p as Ptr
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      p = obj.HandleMenuForObject( representedObject )
		      return  p
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_readRepresentedObjectsFromPasteboard(id as Ptr, sel as Ptr, cntl as Ptr, pboard as Ptr) As Ptr
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  dim nsa as NSArray
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      
		      nsa = obj.HandleReadFromPasteboard( new NSPasteboard( pboard ))
		      if nsa<>nil then
		        return  nsa.id
		      else
		        return nil
		      end if
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_representedObjectForEditingString(id as Ptr, sel as Ptr, cntl as Ptr, editingString as CFStringRef) As Ptr
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  dim p as Ptr
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      p = obj.HandleObjectForEditingString( editingString )
		      
		      return  p
		      
		      'nsa = obj.HandleCompletionForSubstring( substring, tokenIndex, idx )
		      '
		      '
		      ''indexOfSelectedItem = idx
		      'if nsa=nil then
		      'break
		      'else
		      'return   nsa.Retain
		      'end if
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		  'tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:
		  'Allows the delegate to provide an array of appropriate completions for the contents of the NSTokenField.
		  '
		  '- (NSArray *)tokenField:(NSTokenField *)tokenField completionsForSubstring:(NSString *)substring indexOfToken:(NSInteger)tokenIndex indexOfSelectedItem:(NSInteger *)selectedIndex
		  'Parameters
		  'tokenField
		  'The token field where editing is occurring.
		  'substring
		  'The partial string that is to be completed.
		  'tokenIndex
		  'The index of the token being edited.
		  'selectedIndex
		  'Optionally, you can return by-reference an index into the returned array that specifies which of the completions should be initially selected. If none are to be selected, return by reference -1.
		  'Return Value
		  'An array of strings that are possible completions.
		  '
		  'Discussion
		  'If the delegate does not implement this method, no completions are provided.
		  '
		  'Availability
		  'Available in Mac OS X v10.4 and later.
		  'Available as part of an informal protocol prior to Mac OS X v10.6.
		  'Declared In
		  'NSTokenField.h
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_shouldAddObjects(id as Ptr, sel as Ptr, cntl as Ptr, representedObjects as Ptr, idx as integer) As Ptr
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  dim nsa as NSArray
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      nsa = obj.HandleAddObjects( new NSArray( representedObjects ), idx )
		      return   nsa.id
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_writeRepresentedObjectstoPasteboard(id as Ptr, sel as Ptr, cntl as Ptr, representedObjects as Ptr, pboard as Ptr) As Boolean
		  #pragma unused cntl
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  dim OK as Boolean
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSTokenField = NSTokenField( w.Value )
		    if obj <> nil then
		      
		      'report   "delegate_writeRepresentedObjectstoPasteboard invoked"
		      
		      OK = obj.HandleWriteToPasteboard( new NSArray( representedObjects ), new NSPasteboard( pboard ))
		      return   OK
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FieldContents() As variant()
		  
		  #if TargetMacOS
		    declare function objectValue lib CocoaLib selector "objectValue" ( id as Ptr ) as Ptr
		    
		    dim nsa as NSArray = new NSArray( objectValue( me.id ), false )
		    dim result() as variant
		    dim up as Integer = nsa.Count - 1
		    dim p as Ptr
		    dim nso as NSWrapperForObject
		    dim obj as NSObject
		    
		    for i as Integer = 0 to up
		      p = nsa.Value( i )
		      nso = FindNSWrapper( p )
		      
		      if nso<>nil then  //It's an RB object
		        result.Append   nso.VariantValue
		      else
		        obj = Cocoa.NSObjectFromNSPtr( p )
		        result.Append   obj.VariantValue
		      end if
		    next
		    
		    return result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FieldContents(assigns objs() as variant)
		  
		  #if TargetMacOS
		    declare sub setObjectValue lib CocoaLib selector "setObjectValue:" ( id as Ptr, nsa as Ptr )
		    
		    dim nsa as new NSMutableArray
		    dim v as variant
		    dim nso as NSWrapperForObject
		    
		    for i as integer = 0 to objs.Ubound
		      v = objs( i )
		      
		      if v isa NSObject then
		        nsa.Append   NSObject( v )
		        
		      elseif VarType( v ) = Variant.TypeString then
		        nso = new NSWrapperForObject( v )
		        nsa.Append   nso
		        
		      elseif v isa Object then
		        nso = new NSWrapperForObject( v )
		        StoreNSWrapper   nso
		        nsa.Append   nso
		        
		      end if
		    next
		    
		    setObjectValue  me.id, nsa.id
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindNSWrapper(p as Ptr) As NSWrapperForObject
		  for each o as NSWrapperForObject in FieldObjects
		    if o.id = p then
		      return  o
		    end if
		  next
		  
		  return  nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As NSSearchField
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return NSSearchField(w.Value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributedStringValue() As NSAttributedString
		  
		  #if TargetMacOS
		    declare function m_attributedStringValue lib CocoaLib selector "attributedStringValue" (id as Ptr) as Ptr
		    
		    dim p as Ptr = m_attributedStringValue( me.id )
		    
		    if p<>nil then
		      return   Cocoa.NSObjectFromNSPtr( p )
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSelectionRange() As NSRange
		  #if TargetMacOS
		    
		    declare function selectedRange lib CocoaLib selector "selectedRange" ( id as Ptr ) as NSRange
		    
		    dim p as Ptr = myNSText
		    
		    if p=nil then
		      'reportWarning   "NSText instance not found in window"
		    end if
		    
		    dim nsr as NSRange = selectedRange( p )
		    
		    'report  "selectedRange:", nsr.location, nsr.length
		    
		    return  nsr
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleAddObjects(ObjectArray as NSArray, insertionPoint as integer) As NSArray
		  #if TargetMacOS
		    dim Objs() as Variant
		    dim p as Ptr
		    dim wrapper as NSWrapperForObject
		    dim nsa as NSArray
		    dim Validation() as Boolean
		    
		    for i as integer=0 to ObjectArray.Count - 1
		      p = ObjectArray.Value( i )
		      wrapper = FindNSWrapper( p )
		      if wrapper<>nil then
		        Objs.Append   wrapper.RBObject
		      else
		        Objs.Append   Cocoa.NSObjectFromNSPtr( p )
		      end if
		    next
		    
		    redim  Validation( Objs.Ubound )
		    for i as integer=0 to Validation.Ubound //Addition is validated by default
		      Validation( i ) = true
		    next
		    RaiseEvent  ValidateAddObjects( Objs, Validation, insertionPoint )
		    
		    dim nsis as new NSMutableIndexSet
		    
		    for i as integer=0 to Ubound( Validation )
		      if Validation( i ) then
		        nsis.Add   i
		      end if
		    next
		    
		    nsa = NSArray.CreateFromNSArray( ObjectArray, nsis )
		    
		    return  nsa
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleCompletionForSubstring(substring as string, tokenIndex as integer, byref selectedItemInArray as integer) As NSArray
		  dim suggestions() as string
		  dim i as integer = selectedItemInArray
		  
		  suggestions = RaiseEvent  CompletionForSubstring( substring, tokenIndex, i )
		  
		  selectedItemInArray = i
		  
		  dim nsa as NSArray = NSArray.CreateFromArrayOfStrings( suggestions )
		  
		  return  nsa
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleDisplayStringForObject(obj as Ptr) As string
		  
		  dim v as Variant
		  dim nso as NSWrapperForObject
		  dim displayString as string
		  
		  //obj is either a native NSObject or a RB object wrapped into a NSWrapperForObject
		  
		  v = FindNSWrapper( obj )
		  if v=nil then //No wrapper
		    v = Cocoa.NSObjectFromNSPtr( obj )
		    
		  else //Pass the RBObject attached to the NSWrapperForObject
		    nso = v
		    v = nso.RBObject
		  end if
		  
		  displayString = RaiseEvent   TokenStringForObject( v )
		  
		  return   displayString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleEditingStringForObject(obj as Ptr) As string
		  
		  dim v as Variant
		  dim nso as NSWrapperForObject
		  dim editingString as string
		  
		  //obj is either a native NSObject or a RB object wrapped into a NSWrapperForObject
		  
		  v = FindNSWrapper( obj )
		  if v=nil then //No wrapper
		    v = Cocoa.NSObjectFromNSPtr( obj )
		    
		  else //Pass the RBObject attached to the NSWrapperForObject
		    nso = v
		    v = nso.RBObject
		  end if
		  
		  editingString = RaiseEvent   EditingStringForObject( v )
		  
		  return   editingString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleHasMenuForObject(obj as variant) As Boolean
		  //Periodically called
		  
		  #if TargetMacOS
		    dim nso as NSWrapperForObject
		    
		    nso = FindNSWrapper( obj )
		    if nso<>nil then
		      return   RaiseEvent ObjectHasMenu( nso.RBObject )
		    else
		      return   RaiseEvent ObjectHasMenu( obj )
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleMenuActionForObject(sender as Ptr)
		  #if TargetMacOS
		    //Find menuitem
		    dim nsi as NSMenuItem
		    dim mi as MenuItem
		    
		    nsi = new NSMenuItem( sender, false )
		    
		    for i as integer=0 to cachedMenu.Count - 1
		      if StrComp( cachedMenu.Item( i ).Text, nsi.Title, 0 ) = 0 then
		        mi = cachedMenu.Item( i )
		        exit
		      end if
		    next
		    
		    RaiseEvent   MenuAction( cachedRepresentedObject, mi )
		    cachedRepresentedObject = nil
		    cachedMenu = nil
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleMenuForObject(obj as variant) As Ptr
		  #if TargetMacOS
		    static nsm as NSMenu //We need to keep a reference to the menu to avoid crashing
		    dim base as new MenuItem( "Popup Menu" )
		    dim mi as NSMenuItem
		    dim nso as NSWrapperForObject
		    dim robj as variant
		    
		    nso = FindNSWrapper( obj )
		    if nso<>nil then
		      robj = nso.RBObject
		    else
		      robj = obj
		    end if
		    
		    RaiseEvent   ConstructMenuForObject( robj, base )
		    
		    nsm = new NSMenu( base )
		    
		    for i as integer=0 to nsm.Count - 1
		      mi = nsm.Item( i )
		      mi.SetAction   "menuAction:"
		      mi.SetTarget   me.GetDelegate
		      'mi.NSAttachedProperty( "fromRBMenuItem" ) = mi.fromRBMenuItem
		    next
		    
		    cachedRepresentedObject = robj
		    cachedMenu = base
		    
		    return   nsm.id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleObjectForEditingString(editingString as CFStringRef) As Ptr
		  
		  dim v as Variant
		  dim nso as NSWrapperForObject
		  dim obj as NSObject
		  
		  v = RaiseEvent   ObjectForTokenString( editingString )
		  
		  if v = nil then
		    return  nil
		  end if
		  
		  if v isa NSObject then //It's an NSObject
		    obj = v
		    return   obj.id
		    
		  elseif VarType( v ) = Variant.TypeString then //A string
		    nso = new NSWrapperForObject( v )
		    StoreNSWrapper   nso
		    return  nso.id
		    
		  elseif v isa Object then //It's a RS object
		    nso = new NSWrapperForObject( v )
		    StoreNSWrapper   nso
		    return  nso.id
		    
		  else  //We shouldn't get here
		    break
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleReadFromPasteboard(pboard as NSPasteboard) As NSArray
		  #if targetMacOS
		    //We don't want to expose NS classes to the user so we'll manage the NSPasteboard ourselves
		    
		    const kTypeString = 0
		    const kTypeData = 1
		    const kTypePropertyList = 2
		    
		    dim dict as Dictionary
		    dim obj as objHasVariantValue
		    dim p as Ptr
		    dim nso as NSWrapperForObject
		    dim pitems as NSArray
		    dim pitem as NSPasteboardItem
		    dim types() as string
		    dim v as variant
		    dim result as new NSMutableArray
		    
		    pitems = pboard.Items
		    
		    for i as integer = 0 to pitems.Count - 1 //Query the user for each item
		      p = pitems.Value( i )
		      
		      pitem = new NSPasteboardItem( p, false )
		      
		      'report  pitem
		      
		      //Build a Dictionary for the Event
		      dict = new Dictionary
		      types = pitem.Types.StringValues
		      
		      for j as integer = 0 to UBound( types )
		        obj = pitem.PropertyListForType( types( j ))
		        dict.Value( types( j )) = obj.VariantValue
		      next
		      
		      v = RaiseEvent  ReadObjectFromPasteboard( dict )
		      
		      if NOT v.IsNull then
		        if v isa NSObject then
		          nso = v
		          result.Append  nso
		        else
		          nso = Cocoa.NSObjectFromVariant( v ) //Try to get Cocoa instance
		          if nso=nil then //Couldn't find an appropriate Cocoa class, so wrap the RS object
		            nso = new NSWrapperForObject( v )
		            StoreNSWrapper   nso
		          end if
		          result.Append   nso
		        end if
		      end if
		    next
		    
		    return   result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleWriteToPasteboard(objects as NSArray, pboard as NSPasteboard) As boolean
		  #if targetMacOS
		    //We don't want to expose NS classes to the user so we'll manage the NSPasteboard ourselves
		    
		    const kTypeString = 0
		    const kTypeData = 1
		    const kTypePropertyList = 2
		    
		    dim hasAtLeastOneValue as Boolean
		    dim validData as Boolean
		    dim dict as Dictionary
		    dim pitem as NSPasteboardItem
		    dim OK as Boolean
		    dim usetype as integer
		    dim pobjs as new NSMutableArray
		    dim obj as variant
		    dim p as Ptr
		    dim nso as NSWrapperForObject
		    
		    for i as integer = 0 to objects.Count - 1 //Query the user for each individual object
		      p = objects.Value( i )
		      
		      obj = FindNSWrapper( p )
		      if obj<>nil then
		        nso = obj
		        obj = nso.RBObject
		      else
		        obj = new NSString( p, false )
		      end if
		      
		      dict = new Dictionary
		      validData = RaiseEvent  WriteObjectToPasteboard( obj, dict )
		      dim ptype as string
		      dim pvalue as variant
		      
		      if validData then //User provided data into the Dictionary (key is the Type and value contains the data)
		        pitem = new NSPasteboardItem
		        OK = false
		        for j as integer = 0 to dict.Count - 1
		          ptype = dict.Key( j )
		          pvalue = ConvertVariantForPasteboard( dict.Value( ptype ), usetype )
		          select case usetype
		          case kTypeString
		            OK = OK OR pitem.SetStringForType( ptype, pvalue )
		          case kTypeData
		            OK = OK OR pitem.SetDataForType( ptype, pvalue )
		          case kTypePropertyList
		            OK = OK OR pitem.SetPropertyListForType( ptype, pvalue )
		          end select
		        next
		        
		        if OK then //At least one type has been written
		          pobjs.Append  pitem
		          hasAtLeastOneValue = true
		        end if
		      end if
		    next
		    
		    if hasAtLeastOneValue then
		      pboard.ClearContents
		      pboard.Items = pobjs
		    end if
		    
		    return   hasAtLeastOneValue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "tokenField:displayStringForRepresentedObject:" : CType( AddressOf  delegate_displayStringForRepresentedObject, Ptr ) : "@@:@@"
		    methodList.Append  "tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:" : CType( AddressOf  delegate_completionsForSubstring, Ptr ) : "@@:@@i^i"
		    methodList.Append  "tokenField:representedObjectForEditingString:" : CType( AddressOf  delegate_representedObjectForEditingString, Ptr ) : "@@:@@"
		    methodList.Append  "tokenField:hasMenuForRepresentedObject:" : CType( AddressOf delegate_hasMenuForRepresentedObject, Ptr ) : "B@:@@"
		    methodList.Append  "tokenField:menuForRepresentedObject:" : CType( AddressOf delegate_menuForRepresentedObject, Ptr ) : "@@:@@"
		    methodList.Append  "menuAction:" : CType( AddressOf delegate_menuAction, Ptr ) : "v@:@"
		    methodList.Append  "tokenField:writeRepresentedObjects:toPasteboard:" : CType( AddressOf delegate_writeRepresentedObjectstoPasteboard, Ptr ) : "B@:@@@"
		    methodList.Append  "tokenField:readFromPasteboard:" : CType( AddressOf delegate_readRepresentedObjectsFromPasteboard, Ptr ) : "@@:@@"
		    methodList.Append  "tokenField:shouldAddObjects:atIndex:" : CType( AddressOf delegate_shouldAddObjects, Ptr ) : "@@:@@i"
		    methodList.Append  "tokenField:editingStringForRepresentedObject:" : CType( AddressOf delegate_editingStringForRepresentedObject, Ptr ) : "@@:@@"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList)
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function myNSText() As Ptr
		  #if TargetMacOS
		    
		    declare function currentEditor lib CocoaLib selector "currentEditor" ( id as Ptr ) as Ptr
		    
		    dim p as Ptr = currentEditor( me.id )
		    
		    return   p
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentWindow() As NSWindow
		  #if TargetMacOS
		    declare function m_window lib CocoaLib selector "window" ( id as Ptr ) as Ptr
		    
		    return  new NSWindow( m_window( me.id ), false )
		  #endif
		End Function
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

	#tag Method, Flags = &h21
		Private Sub StoreNSWrapper(nso as NSWrapperForObject)
		  //For RB objects, we need to keep a reference to it while a NSWrapperForObject is stored by the NSControl
		  
		  //If the object hasn't been stored yet, do it now
		  
		  for each o as NSWrapperForObject in FieldObjects
		    if o.id = nso.id then
		      return  //Already stored
		    end if
		  next
		  
		  //If we get here, the object hasn't been stored yet
		  FieldObjects.Append   nso
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CompletionForSubstring(substring as string, tokenIndex as integer, byref selectedItemInArray as integer) As String()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructMenuForObject(obj as Variant, baseMenu as MenuItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EditingStringForObject(obj as Variant) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MenuAction(forObject as variant, SelectedItem as MenuItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ObjectForTokenString(tokenString as String) As variant
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ObjectHasMenu(obj as Variant) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReadObjectFromPasteboard(ValuesInPasteboard as Dictionary) As variant
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TokenStringForObject(obj as Variant) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValidateAddObjects(Objects() as variant, Validation() as boolean, atIndex as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WriteObjectToPasteboard(obj as variant, ValuesForPasteboard as Dictionary) As boolean
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function isBordered lib CocoaLib selector "isBordered" (this as Ptr) as Boolean
			    
			    return isBordered(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setBordered lib CocoaLib selector "setBordered:" (this as Ptr, value as Boolean)
			    
			    setBordered(self, value)
			  #endif
			End Set
		#tag EndSetter
		Bordered As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			//We need to cache MenuItems because they are not retained by NSMenuItem during the selection process in the local menu.
			
			//Cache is cleared after each MenuAction event.
		#tag EndNote
		Private cachedMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			//We need to cache representedObject because it is not retained by NSMenuItem during the selection process in the local menu.
			
			//Cache is cleared after each MenuAction event.
		#tag EndNote
		Private cachedRepresentedObject As variant
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function completionDelay lib CocoaLib selector "completionDelay" (id as Ptr) as double
			    
			    return   completionDelay( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setCompletionDelay lib CocoaLib selector "setCompletionDelay:" (id as Ptr, newValue as double)
			    
			    setCompletionDelay( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		CompletionDelay As double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private FieldObjects() As NSWrapperForObject
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    return   me.TokenizingCharacterSet.AllowedCharacters
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    dim cs as NSCharacterSet
			    
			    cs = NSCharacterSet.CreateFromString( value )
			    
			    me.TokenizingCharacterSet = cs
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TokenizingCharacters As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function tokenizingCharacterSet lib Cocoalib selector "tokenizingCharacterSet" (id as Ptr) as Ptr
			    
			    return  new NSCharacterSet( tokenizingCharacterSet( me.id ), false )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setTokenizingCharacterSet lib Cocoalib selector "setTokenizingCharacterSet:" (id as Ptr, cs as Ptr)
			    
			    setTokenizingCharacterSet( me.id, value )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TokenizingCharacterSet As NSCharacterSet
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function tokenStyle lib CocoaLib selector "tokenStyle" (id as Ptr) as integer
			    
			    return   TokenStyles( tokenStyle( me.id ))
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setTokenStyle lib CocoaLib selector "setTokenStyle::" (id as Ptr, newValue as integer)
			    
			    setTokenStyle( me.id, Integer( value ) )
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TokenStyle As TokenStyles
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSTokenFieldDelegate", Scope = Private
	#tag EndConstant


	#tag Enum, Name = TokenStyles, Type = Integer, Flags = &h0
		NSDefaultTokenStyle = 0
		  NSPlainTextTokenStyle = 1
		NSRoundedTokenStyle = 2
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
			Name="Bordered"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CompletionDelay"
			Group="Behavior"
			Type="double"
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
			Name="TokenizingCharacters"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TokenStyle"
			Group="Behavior"
			Type="TokenStyles"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSDefaultTokenStyle"
				"1 - NSPlainTextTokenStyle"
				"2 - NSRoundedTokenStyle"
			#tag EndEnumValues
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

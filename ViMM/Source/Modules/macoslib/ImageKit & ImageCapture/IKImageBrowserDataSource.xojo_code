#tag Class
Protected Class IKImageBrowserDataSource
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  dim p as Ptr = DelegateClassID
		  
		  Super.Constructor   Initialize( Allocate( p )), hasOwnership
		  
		  CocoaDelegateMap.Value( self.id ) = new WeakRef( self )
		  
		  'SetDelegate
		  
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
		Private Shared Function delegate_GroupAtIndex(id as Ptr, sel as Ptr, sender as Ptr, index as integer) As Ptr
		  #pragma unused sel
		  #pragma unused sender
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_GroupAtIndex( index )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #else
		    #pragma unused id
		    #pragma unused index
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_ItemAtIndex(id as Ptr, sel as Ptr, sender as Ptr, index as UInt32) As Ptr
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_ItemAtIndex( index )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		    
		  #else
		    #pragma unused id
		    #pragma unused index
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_MoveItems(id as Ptr, sel as Ptr, sender as Ptr, indexes as Ptr, toIndex as integer) As Boolean
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_MoveItems( new NSIndexSet( indexes ), toIndex )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		    
		  #else
		    #pragma unused id
		    #pragma unused indexes
		    #pragma unused toIndex
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_NumberOfGroups(id as Ptr, sel as Ptr, sender as Ptr) As integer
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_NumberOfGroups
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #else
		    #pragma unused id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_NumberOfItems(id as Ptr, sel as Ptr, sender as Ptr) As integer
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_NumberOfItems
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_RemoveItems(id as Ptr, sel as Ptr, sender as Ptr, indexSet as Ptr)
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  #pragma unused sender
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        obj.Handle_RemoveItems   new NSIndexSet( indexSet )
		        
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
		Private Shared Function delegate_WriteToPasteboard(id as Ptr, sel as Ptr, sender as Ptr, indexSet as Ptr, pboard as Ptr) As integer
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        'obj.Handle_RemovedItems   indexSet
		        return 0
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		    
		  #else
		    #pragma unused id
		  #endif
		  
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused indexSet
		  #pragma unused pboard
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As IKDeviceBrowserView
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return IKDeviceBrowserView( w.Value )
		  
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

	#tag Method, Flags = &h21
		Private Function Handle_GroupAtIndex(index as integer) As Ptr
		  #if TargetMacOS
		    return  RaiseEvent GroupAtIndex( index )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_ItemAtIndex(index as integer) As IKImageBrowserItem
		  #if TargetMacOS
		    return  RaiseEvent ItemAtIndex( index )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_MoveItems(indexes as NSIndexSet, toIndex as integer) As Boolean
		  #if TargetMacOS
		    return  RaiseEvent MoveItems( indexes, toIndex )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_NumberOfGroups() As integer
		  #if TargetMacOS
		    return  RaiseEvent CountGroups
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_NumberOfItems() As integer
		  #if TargetMacOS
		    return  RaiseEvent CountItems
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_RemoveItems(indexes as NSIndexSet)
		  #if TargetMacOS
		    RaiseEvent  RemoveItems( indexes )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemAtIndex(index as integer) As IKImageBrowserItem
		  #if TargetMacOS
		    return  Handle_ItemAtIndex( index )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if TargetMacOS then
		    dim methodList() as Tuple
		    
		    methodList.Append  "numberOfItemsInImageBrowser:" : CType( AddressOf delegate_NumberOfItems, Ptr ) : "i@:@"
		    methodList.Append  "imageBrowser:itemAtIndex:" : CType( AddressOf delegate_ItemAtIndex, Ptr ) : "@@:@i"
		    methodList.Append  "imageBrowser:removeItemsAtIndexes:" : CType( AddressOf delegate_RemoveItems, Ptr ) : "v@:@@"
		    methodList.Append  "imageBrowser:moveItemsAtIndexes:toIndex:" : CType( AddressOf delegate_MoveItems, Ptr ) : "B@:@@I"
		    'methodList.Append  "imageBrowser:writeItemsAtIndexes:toPasteboard:" : CType( AddressOf delegate_WriteToPasteboard, Ptr ) : "v@:@@@"
		    methodList.Append  "numberOfGroupsInImageBrowser:" : CType( AddressOf delegate_NumberOfGroups, Ptr ) : "I@:@"
		    methodList.Append  "imageBrowser:groupAtIndex:" : CType( AddressOf delegate_GroupAtIndex, Ptr ) : "@@:@I"
		    
		    return Cocoa.MakeDelegateClass (className, superclassName, methodList, "IKImageBrowserDataSource")
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetDelegate()
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


	#tag Hook, Flags = &h0
		Event CountGroups() As integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CountItems() As integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GroupAtIndex(index as integer) As Ptr
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemAtIndex(index as integer) As IKImageBrowserItem
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MoveItems(indexes as NSIndexSet, toIndex as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RemoveItems(indexes as NSIndexSet)
	#tag EndHook


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibIKImageBrowserDataSourceDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"macoslibIKImageBrowserDataSource", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

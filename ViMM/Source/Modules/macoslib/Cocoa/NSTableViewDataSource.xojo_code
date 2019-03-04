#tag Class
Class NSTableViewDataSource
	#tag Method, Flags = &h21
		Private Shared Function AddInstanceMethod(class_id as Ptr, name as String, impl as Ptr, types as String) As Boolean
		  #if targetMacOS
		    soft declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    soft declare function NSSelectorFromString lib CocoaLib (aSelectorName as CFStringRef) as Ptr
		    
		    return class_addMethod(class_id, NSSelectorFromString(name), impl, types)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllowDrag(tableView as NSTableView, rowIndexes as NSIndexSet, pboard as NSPasteboard) As Boolean
		  return raiseEvent AllowDrag(tableView, rowIndexes, pboard)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  dim p as Ptr = NewNSTableViewSourcemacoslib
		  if p <> nil then
		    self.impl_obj = new NSObject(p)
		  end if
		  ObjectList.Append self
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  self.impl_obj.Autorelease
		  
		  #pragma disableBackgroundTasks
		  dim L() as NSTableViewDataSource
		  for each item as NSTableViewDataSource in ObjectList
		    if item <> self then
		      L.Append item
		    end if
		  next
		  ObjectList = L
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DisallowTableEdit(tableView as NSTableView, rowIndex as Integer, column as NSTableColumn) As Boolean
		  return raiseEvent DisallowTableEdit(tableView,rowIndex, column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByImpl_obj(impl_obj_id as Ptr) As NSTableViewDataSource
		  #pragma disableBackgroundTasks
		  
		  dim theSource as NSTableViewDataSource
		  for each item as NSTableViewDataSource in ObjectList
		    dim p as Ptr = item.impl_obj
		    if p = impl_obj_id then
		      theSource = item
		      exit
		    end if
		  next
		  return theSource
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetValue(row as Integer, columnID as String) As String
		  return raiseEvent GetValue(row, columnID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_AllowDrag(id as Ptr, sel as Ptr, aTableView as Ptr, rowIndexes as Ptr, pboard as Ptr) As Boolean
		  #if targetCocoa
		    dim theSource as NSTableViewDataSource = FindObjectByImpl_obj(id)
		    if theSource is nil then
		      return false
		    end if
		    
		    dim tableView as NSTableView = NSTableView.FindByID(aTableView)
		    if tableView = nil then
		      //something's wrong, or perhaps a control was somehow closed.
		      return false
		    end if
		    
		    return theSource.AllowDrag(tableView, new NSIndexSet(rowIndexes), new NSPasteboard(pboard))
		    
		  #else
		    #pragma unused id
		    #pragma unused aTableView
		    #pragma unused rowIndexes
		    #pragma unused pboard
		  #endif
		  
		  // Keep the compiler from complaining
		  #pragma unused sel
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_DisallowTableEdit(id as Ptr, sel as Ptr, aTableView as Ptr, aTableColumn as Ptr, rowIndex as Integer) As Boolean
		  dim theSource as NSTableViewDataSource = FindObjectByImpl_obj(id)
		  if theSource is nil then
		    return true
		  end if
		  
		  dim tableView as NSTableView = NSTableView.FindByID(aTableView)
		  if tableView = nil then
		    //something's wrong, or perhaps a control was somehow closed.
		    return false
		  end if
		  dim tableColumn as new NSTableColumn(aTableColumn)
		  
		  return not theSource.DisallowTableEdit(tableView, rowIndex, tableColumn)
		  
		  // Keep the compiler from complaining
		  #pragma unused sel
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_GetValue(id as Ptr, sel as Ptr, tableView as Ptr, columnView as Ptr, row as Integer) As Ptr
		  #if TargetCocoa
		    
		    dim theSource as NSTableViewDataSource = FindObjectByImpl_obj(id)
		    if theSource is nil then
		      return nil
		    end if
		    
		    //that the declared return value is CFStringRef is an assumption built into my code.
		    declare function identifier lib CocoaLib selector "identifier" (obj_id as Ptr) as CFStringRef
		    dim columnID as String = identifier(columnView)
		    
		    dim value as String = theSource.GetValue(row, columnID)
		    dim v as CFStringRef = value
		    declare function CFRetain lib CarbonLib (cf as CFStringRef) as Ptr
		    return  CFRetain(v)
		    
		  #else
		    
		    #pragma unused id
		    #pragma unused columnView
		    #pragma unused row
		    
		  #endif
		  
		  // Keep the compiler from complaining
		  #pragma unused sel
		  #pragma unused tableView
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_RowCount(id as Ptr, sel as Ptr, tableView as Ptr) As Integer
		  dim theSource as NSTableViewDataSource = FindObjectByImpl_obj(id)
		  if theSource is nil then
		    return 0
		  end if
		  
		  return theSource.RowCount
		  
		  #pragma unused sel
		  #pragma unused tableView
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_SetValue(id as Ptr, sel as Ptr, aTableView as Ptr, value as Ptr, aTableColumn as Ptr, row as Integer)
		  #if TargetCocoa
		    
		    dim theSource as NSTableViewDataSource = FindObjectByImpl_obj(id)
		    if theSource is nil then
		      return
		    end if
		    
		    dim tableView as NSTableView = NSTableView.FindByID(aTableView)
		    if tableView = nil then
		      //something's wrong, or perhaps a control was somehow closed.
		      return
		    end if
		    dim tableColumn as new NSTableColumn(aTableColumn)
		    
		    declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
		    dim stringValue as String = CFRetain(value)
		    
		    theSource.SetValue tableView, row, tableColumn, stringValue
		    
		  #else
		    
		    #pragma unused id
		    #pragma unused aTableView
		    #pragma unused value
		    #pragma unused aTableColumn
		    #pragma unused row
		    
		  #endif
		  
		  #pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeObjCClass(className as String = "NSTableViewSourcemacoslib", superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  
		  #if targetCocoa
		    soft declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    soft declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    
		    dim newClassId as Ptr = objc_allocateClassPair(NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    soft declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    
		    objc_registerClassPair newClassId
		    const MethodTypeEncoding = "v@:@"
		    
		    
		    const impl_RowCount_Name = "numberOfRowsInTableView:"
		    const impl_RowCount_Encoding = "@@:i"
		    const impl_GetValue_Name = "tableView:objectValueForTableColumn:row:"
		    const impl_GetValue_Encoding = "@@:@@i"
		    const impl_SetValue_Name = "tableView:setObjectValue:forTableColumn:row:"
		    const impl_SetValue_Encoding = "@:@@@i"
		    const impl_AllowDrag_Name = "tableView:writeRowsWithIndexes:toPasteboard:"
		    const impl_AllowDrag_Encoding = "B@:@@@"
		    
		    //NSTableViewDelegate methods
		    
		    const impl_DisallowTableEdit_Name = "tableView:shouldEditTableColumn:row:"
		    const impl_DisallowTableEdit_Encoding = "B@:@@i"
		    
		    
		    if AddInstanceMethod(newClassId, impl_RowCount_Name, AddressOf impl_RowCount, impl_RowCount_Encoding) and _
		      AddInstanceMethod(newClassId, impl_GetValue_Name, AddressOf impl_GetValue, impl_GetValue_Encoding) and _
		      AddInstanceMethod(newClassId, impl_DisallowTableEdit_Name, AddressOf impl_DisallowTableEdit, impl_DisallowTableEdit_Encoding) and _
		      AddInstanceMethod(newClassId, impl_SetValue_Name, AddressOf impl_SetValue, impl_SetValue_Encoding) and _
		      AddInstanceMethod(newClassId, impl_AllowDrag_Name, AddressOf impl_AllowDrag, impl_AllowDrag_Encoding) _
		      then
		      return newClassId
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superclassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewNSTableViewSourcemacoslib() As Ptr
		  #if targetCocoa
		    soft declare function alloc lib CocoaLib selector "alloc" (classRef as Ptr) as Ptr
		    soft declare function init lib CocoaLib selector "init" (id as Ptr) as Ptr
		    
		    return init(alloc(ObjCClass))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ObjCClass() As Ptr
		  static p as Ptr = MakeObjCClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return self.impl_obj.Operator_Convert
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  return raiseEvent RowCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetValue(tableView as NSTableView, rowIndex as Integer, column as NSTableColumn, value as String)
		  raiseEvent SetValue tableView, rowIndex, column, value
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AllowDrag(tableView as NSTableView, rowIndexes as NSIndexSet, pboard as NSPasteboard) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DisallowTableEdit(tableView as NSTableView, rowIndex as Integer, column as NSTableColumn) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetValue(row as Integer, columnID as String) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RowCount() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetValue(tableView as NSTableView, rowIndex as Integer, column as NSTableColumn, value as String)
	#tag EndHook


	#tag Note, Name = Read Me
		This class provides both an implementation of NSTableViewDataSource and NSTableViewDelegate.
	#tag EndNote


	#tag Property, Flags = &h21
		Private impl_obj As NSObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared ObjectList() As NSTableViewDataSource
	#tag EndProperty


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
End Class
#tag EndClass

#tag Class
Protected Class IKFolderItemDataSource
Inherits IKImageBrowserDataSource
	#tag Event
		Function CountGroups() As integer
		  
		  #if false  //Don't use groups for the moment
		    'DReport   "CountGroups"
		    '
		    'return  Folders.Ubound + 1
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Function CountItems() As integer
		  return  Items.Ubound + 1
		End Function
	#tag EndEvent

	#tag Event
		Function GroupAtIndex(index as integer) As Ptr
		  #if false  //Don't use groups for the moment
		    
		    'DReport  "GroupAtIndex", index, Bin( index ), Hex( index, 8 )
		    '
		    'if index>=-1 AND index<=Folders.Ubound then
		    '
		    'dim group as new NSMutableDictionary
		    'dim r as Cocoa.NSRange
		    'r.location = 1
		    'r.length = 5
		    '
		    'group.Value( new NSString( Cocoa.StringConstant( "IKImageBrowserGroupStyle" ))) = NSNumber.CreateWithInteger( 0 )
		    'group.Value( new NSString( Cocoa.StringConstant( "IKImageBrowserGroupTitleKey" ))) = new NSString( Folders( index ).Name )
		    'group.Value( new NSString( Cocoa.StringConstant( "IKImageBrowserGroupRangeKey" ))) = NSValue.CreateWithRange( r )
		    '
		    'return  group.id
		    '
		    'end if
		    
		  #else
		    #pragma unused index
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Function ItemAtIndex(index as integer) As IKImageBrowserItem
		  
		  #if TargetMacOS
		    if index>=-1 AND index<=Items.Ubound then
		      dim item as IKImageBrowserItem
		      
		      item = IKItems( index )
		      
		      return  item
		      
		    end if
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Function MoveItems(indexes as NSIndexSet, toIndex as integer) As Boolean
		  
		  #if TargetMacOS
		    dim ItemsToMove() as IKImageBrowserItem
		    dim IndexesToMove() as integer = indexes
		    dim realTargetIndex as integer = toIndex
		    
		    //Temporary store objects to be moved
		    for each idx as integer in IndexesToMove
		      ItemsToMove.Append  IKItems( idx )
		      if idx<=toIndex then //Shift insertion index if necessary
		        realTargetIndex = realTargetIndex - 1
		      end if
		    next
		    
		    //Actually remove items
		    for each IKI as IKImageBrowserItem in ItemsToMove
		      dim idx as integer = IKItems.IndexOf( IKI )
		      IKItems.Remove   idx
		    next
		    
		    //Re-insert items at the right place
		    for i as integer = 0 to ItemsToMove.Ubound
		      IKItems.Insert  realTargetIndex + i, ItemsToMove( i )
		    next
		    
		    return  true
		    
		  #endif
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(forFolder as FolderItem)
		  RequireFramework  ICLib
		  RequireFramework  IKLib
		  
		  root = forFolder
		  
		  dim f as FolderItem
		  
		  for i as integer=1 to root.Count
		    f = root.Item( i )
		    if NOT (f.Name.Left( 1 )=".") then
		      if f.Directory then
		        'Folders.Append   f
		      else
		        Items.Append   f
		        IKItems.Append   new IKImageBrowserItem( f )
		      end if
		    end if
		  next
		  
		  Super.Constructor
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Folders() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		IKItems() As IKImageBrowserItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Items() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		root As FolderItem
	#tag EndProperty


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

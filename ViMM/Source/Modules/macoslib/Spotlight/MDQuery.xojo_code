#tag Class
Class MDQuery
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    
		    soft declare function MDQueryGetTypeID lib CarbonLib () as UInteger
		    
		    static id as UInteger = MDQueryGetTypeID
		    return id
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(query as String)
		  #if targetMacOS
		    soft declare function MDQueryCreate lib CarbonLib (allocator as Ptr, queryString as CFStringRef, valueListAttrs as Ptr, sortingAttrs as Ptr) as Ptr
		    
		    super.Constructor MDQueryCreate(nil, query, nil, nil), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Execute()
		  #if targetMacOS
		    soft declare function MDQueryExecute lib CarbonLib (query as Ptr, optionFlags as Integer) as Boolean
		    
		    if MDQueryExecute(me, kMDQuerySynchronous) then
		      
		    else
		      
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsGatheringComplete() As Boolean
		  #if targetMacOS
		    soft declare function MDQueryIsGatheringComplete lib CarbonLib (query as Ptr) as Boolean
		    
		    return MDQueryIsGatheringComplete(me)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResultList()
		  'CFIndex MDQueryGetResultCount (
		  'MDQueryRef query
		  ');
		  '
		  
		  #if targetMacOS
		    soft declare function MDQueryGetResultCount lib CarbonLib(query as Ptr) as Integer
		    
		    dim lastIndex as Integer = MDQueryGetResultCount(me) - 1
		    dim theList() as String
		    for i as Integer = 0 to lastIndex
		      soft declare function MDQueryGetResultAtIndex lib CarbonLib (query as Ptr, idx as Integer) as Ptr
		      
		      dim theItem as new MDItem(MDQueryGetResultAtIndex(me, i), false)
		      dim thePath as CFType = theItem.Attribute("kMDItemPath")
		      theList.Append CFString(thePath)
		    next
		    
		    break
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScope(scope as String)
		  #if targetMacOS
		    
		    soft declare sub MDQuerySetSearchScope lib CarbonLib (query as Ptr, scopeDirectories as Ptr, scopeOptions as integer)
		    
		    dim cfList() as CFType
		    
		    dim s as CFString = scope
		    cfList.Append s
		    
		    
		    dim theArray as new CFArray(cfList)
		    
		    
		    
		    
		    MDQuerySetSearchScope me, theArray, 0
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  #if targetMacOS
		    soft declare sub MDQueryStop lib CarbonLib (query as Ptr)
		    MDQueryStop me
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function MDQueryCopyQueryString lib CarbonLib (query as Ptr) as CFStringRef
			    
			    return MDQueryCopyQueryString(me)
			  #endif
			End Get
		#tag EndGetter
		Query As String
	#tag EndComputedProperty


	#tag Constant, Name = kMDQuerySynchronous, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMDQueryWantsUpdates, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ScopeComputer, Type = String, Dynamic = False, Default = \"kMDQueryScopeComputer", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ScopeHome, Type = String, Dynamic = False, Default = \"kMDQueryScopeHome", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ScopeNetwork, Type = String, Dynamic = False, Default = \"kMDQueryScopeNetwork", Scope = Public
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
			Name="Query"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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

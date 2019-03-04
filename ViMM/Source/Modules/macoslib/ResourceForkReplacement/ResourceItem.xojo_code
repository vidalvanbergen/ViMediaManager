#tag Class
Protected Class ResourceItem
Inherits ResourceForkReplacement.ResourceAccessor
	#tag Method, Flags = &h0
		Shared Function ByID(resFileRef as Integer, type as String, id as Integer) As ResourceItem
		  if resFileRef = 0 then return nil
		  return new ResourceItem (resFileRef, type, id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ByIndex(resFileRef as Integer, type as String, idx_0 as Integer) As ResourceItem
		  if resFileRef = 0 then return nil
		  return new ResourceItem (resFileRef, type, 0, idx_0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ByName(resFileRef as Integer, type as String, name as String) As ResourceItem
		  if resFileRef = 0 then return nil
		  return new ResourceItem (resFileRef, type, 0, -1, name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(resFileRef as Integer, type as String, id as Integer, idx_0 as Integer = - 1, name as String = "")
		  #if TargetMacOS
		    
		    declare function Get1Resource lib CarbonLib (t as OSType, id as Integer) as Ptr
		    declare function Get1IndResource lib CarbonLib (t as OSType, idx as Integer) as Ptr
		    declare function Get1NamedResource lib CarbonLib (t as OSType, name as PString) as Ptr
		    
		    if resFileRef = 0 then
		      return
		    end
		    
		    super.Constructor (resFileRef) // saves the current res file and activates the given res file
		    
		    if name <> "" then
		      mHdl = Get1NamedResource (type, name)
		    elseif idx_0 >= 0 then
		      mHdl = Get1IndResource (type, idx_0+1)
		    else
		      mHdl = Get1Resource (type, id)
		    end if
		    
		  #else
		    
		    #pragma unused resFileRef
		    #pragma unused type
		    #pragma unused id
		    #pragma unused idx_0
		    #pragma unused name
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  #if TargetMacOS
		    
		    declare sub ReleaseResource lib CarbonLib (hdl as Ptr)
		    
		    if mHdl = nil then
		      return
		    end
		    
		    ReleaseResource mHdl
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  return mHdl
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mHdl As Ptr
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

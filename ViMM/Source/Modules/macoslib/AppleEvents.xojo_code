#tag Module
Protected Module AppleEvents
	#tag Method, Flags = &h0
		Function PrintDesc(extends ae as AppleEvent, getReply as boolean = false) As string
		  #if TargetMacOS
		    
		    Soft declare function AEPrintDescToHandle lib CarbonLib (theEvent as integer, hdl as Ptr) as integer
		    Soft declare sub DisposeHandle lib CarbonLib (hdl as ptr)
		    
		    dim myHandle as MemoryBlock
		    dim err as integer
		    dim mb as MemoryBlock
		    dim result as string
		    
		    //Will hold the pointer to the data
		    myHandle = New MemoryBlock( 4 )
		    
		    if getReply then
		      err = AEPrintDescToHandle( ae.ReplyPtr, myHandle )
		    else
		      err = AEPrintDescToHandle( ae.Ptr, myHandle )
		    end if
		    
		    if err<>0 then  return  ""  //Check for error
		    
		    //Get the data
		    mb = myHandle.Ptr( 0 )
		    mb = mb.Ptr( 0 )
		    result = mb.CString( 0 )
		    
		    DisposeHandle   myHandle.Ptr(0)  //We must free the handle to get memory back
		    
		    return result
		    
		  #else
		    
		    #pragma unused ae
		    #pragma unused getReply
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawData(extends ae as AppleEvent, param as string, byref type as string, inReply as boolean = false) As MemoryBlock
		  //Get a binary data param in the reply AppleEvent
		  
		  #if TargetMacOS
		    
		    declare function AEGetParamPtr lib CarbonLib (AEPtr as integer, AEKeyword as OSType, inType as OSType, byref outType as OSType, data as Ptr, maxSize as integer, byref actSize as integer) as short
		    
		    dim data as MemoryBlock
		    dim err as integer
		    dim oType as OSType
		    dim aSize as integer
		    dim paramSize as integer
		    dim paramType as string
		    dim p as integer
		    
		    ae.SizeAndTypeOfParam( param, true, paramSize, paramType )
		    if paramType="" then  //No parameter with this key
		      return  nil
		    end if
		    
		    data = new MemoryBlock( paramSize )
		    
		    //Get the data
		    if inReply then
		      p = ae.ReplyPtr
		    else
		      p = ae.Ptr
		    end if
		    err = AEGetParamPtr( p, param, type, oType, data, data.Size, aSize )
		    if err<>0 then
		      return  nil
		    else
		      //Update the actual type and return the data
		      type = oType
		      return data.StringValue( 0, aSize )
		    end if
		    
		  #else
		    
		    #pragma unused ae
		    #pragma unused param
		    #pragma unused type
		    #pragma unused inReply
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RawData(extends ae as AppleEvent, param as string, type as string, inReply as boolean = false, assigns data as MemoryBlock)
		  //Add some binary data as a reply AppleEvent parameter
		  
		  #if TargetMacOS
		    
		    declare function AEPutParamPtr lib CarbonLib (AEPtr as integer, AEKey as OSType, dType as OSType, data as Ptr, dsize as integer) as short
		    
		    dim err as integer
		    dim p as integer
		    
		    if inReply then
		      p = ae.ReplyPtr
		    else
		      p = ae.Ptr
		    end if
		    err = AEPutParamPtr( p, param, type, data, data.size )
		    
		  #else
		    
		    #pragma unused ae
		    #pragma unused param
		    #pragma unused type
		    #pragma unused inReply
		    #pragma unused data
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SizeAndTypeOfParam(extends ae as AppleEvent, param as string, inReply as boolean, byref size as integer, byref type as string)
		  //Get the size and type of one parameter. Set inReply to true if you want to access the reply AppleEvent
		  
		  #if TargetMacOS
		    
		    declare function AESizeOfParam lib CarbonLib (evnt as integer, AEKeyword as OSType, byref oDesc as OSType, byref oSize as integer) as short
		    
		    dim err as integer
		    dim oDesc as OSType
		    dim oSize as integer
		    
		    if inReply then
		      err = AESizeOfParam( ae.replyptr, param, oDesc, oSize )
		    else
		      err = AESizeOfParam( ae.ptr, param, oDesc, oSize )
		    end if
		    
		    if err<>0 then //We get a -1701 error if there is no parameter with this keyword
		      type = ""
		      size = 0
		    else
		      type = oDesc
		      size = oSize
		    end if
		    
		  #else
		    
		    #pragma unused ae
		    #pragma unused param
		    #pragma unused inReply
		    #pragma unused size
		    #pragma unused type
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Constant, Name = typeFSRef, Type = String, Dynamic = False, Default = \"fsrf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = typeStyledUnicodeText, Type = String, Dynamic = False, Default = \"sutx", Scope = Public
	#tag EndConstant


	#tag Structure, Name = AEDesc, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		descriptorType as OSType
		dataHandle as Ptr
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
End Module
#tag EndModule

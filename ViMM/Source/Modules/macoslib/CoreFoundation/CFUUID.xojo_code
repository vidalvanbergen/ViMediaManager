#tag Class
Class CFUUID
Inherits CFType
	#tag Event
		Function ClassID() As UInteger
		  return self.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return self.StringValue
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFUUIDGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    declare function CFUUIDCreate lib CoreFoundation.framework (alloc as Ptr) as CFTypeRef
		    
		    self.Constructor(CFUUIDCreate(nil), hasOwnership)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(bytes as CFUUIDBytes)
		  #if TargetMacOS
		    soft declare function CFUUIDCreateFromUUIDBytes lib CoreFoundation.framework (alloc as Ptr, bytes as CFUUIDBytes) as CFTypeRef
		    
		    self.Constructor(CFUUIDCreateFromUUIDBytes(nil, bytes), hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(uuid as String)
		  #if TargetMacOS
		    soft declare function CFUUIDCreateFromString lib CoreFoundation.framework (alloc as Ptr, uuidStr as CFStringRef) as CFTypeRef
		    
		    self.Constructor(CFUUIDCreateFromString(nil, uuid), hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBytes() As CFUUIDBytes
		  #if TargetMacOS
		    soft declare function CFUUIDGetUUIDBytes lib CoreFoundation.framework (ref as CFTypeRef) as CFUUIDBytes
		    
		    if (self = nil) then
		      dim x as CFUUIDBytes
		      return x
		    end if
		    
		    return CFUUIDGetUUIDBytes(self)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  #if TargetMacOS
		    return self.StringValue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(uuid as String)
		  #if TargetMacOS
		    self.Constructor(uuid)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As String
		  #if TargetMacOS
		    soft declare function CFUUIDCreateString lib CoreFoundation.framework (alloc as ptr, uuid as Ptr) as CFStringRef
		    
		    if self <> nil then
		      return CFUUIDCreateString(nil, self)
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Documentation
		CFUUID is the RB object corresponding to CFUUIDRef in CoreFoundation. 
		
		
		dim uuid as new CFUUID() generates a new UUID.
		
		dim uuid as new CFUUID( "07AE3B9B-587E-397C-A731-AD4B1BA1B00E" ) creates a CFUUID object from the string passed. There doesn't
		appear to be much validation of the string by CFUUID.
		
		If you have a uuid in the form of 16 bytes of MemoryBlock, you can create a CFUUID object as follows.
		
		dim p as Ptr = uuidBlock
		dim bytes as CFUUIDBytes = p.CFUUIDBytes(0)
		dim uuid as new CFUUID(bytes)
		
		
		
		
		
		
		It is an endianness-independent group of 16 bytes (128 bits)
		
		You can create it as:
		uuid = new CFUUID( "07AE3B9B-587E-397C-A731-AD4B1BA1B00E" )
		uuid = "07AE3B9B-587E-397C-A731-AD4B1BA1B00E"  //Involves Operator_Convert
		
		uuid = new CFUUID( my128bitsMemoryBlock )
		
		
		You can get the string value using:
		s = uuid.StringValue
		s = uuid.VariantValue   //"VariantValue" is an event used shared by all the CFType objects
		
		s = uuid  //Involves Operator_Convert
	#tag EndNote


	#tag Structure, Name = CFUUIDBytes, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		byte0 as UInt8
		  byte1 as UInt8
		  byte2 as UInt8
		  byte3 as UInt8
		  byte4 as UInt8
		  byte5 as UInt8
		  byte6 as UInt8
		  byte7 as UInt8
		  byte8 as UInt8
		  byte9 as UInt8
		  byte10 as UInt8
		  byte11 as UInt8
		  byte12 as UInt8
		  byte13 as UInt8
		  byte14 as UInt8
		byte15 as UInt8
	#tag EndStructure


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

#tag Class
Class MacFormatPersonality
	#tag Method, Flags = &h0
		Shared Function CreateFromDictionary(dict As Dictionary) As MacDiskUtil.MacFormatPersonality
		  if dict is nil then return nil
		  
		  dim k() as Variant = dict.Keys
		  dim v() as Variant = dict.Values
		  
		  dim d as new Dictionary
		  for i as integer = 0 to k.Ubound
		    d.Value( k( i ) ) = v( i )
		  next
		  
		  dim r as new MacFormatPersonality
		  r.zDict = d
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  return me.Identifier
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Properties() As Dictionary
		  // Return a clone of the Dictionary
		  
		  if zDict is nil then return nil
		  
		  dim k() as Variant = zDict.Keys
		  dim v() as Variant = zDict.Values
		  
		  dim d as new Dictionary
		  for i as integer = 0 to k.Ubound
		    d.Value( k( i ) ) = v( i )
		  next
		  
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pValueFromKey(key As String) As Variant
		  dim r as Variant = ""
		  if zDict <> nil then
		    r = zDict.Lookup( key, "" )
		  end if
		  return r
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "Bootable" )
			  
			End Get
		#tag EndGetter
		Bootable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "Bundle" )
			  
			End Get
		#tag EndGetter
		Bundle As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "BundlePath" )
			  
			End Get
		#tag EndGetter
		BundlePath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "Personality" )
			  
			End Get
		#tag EndGetter
		Identifier As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "MaximumSize" )
			  
			End Get
		#tag EndGetter
		MaximumSize As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "MinimumSize" )
			  
			End Get
		#tag EndGetter
		MinimumSize As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "UserVisibleName" )
			  
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "RequiresBooterToBoot" )
			  
			End Get
		#tag EndGetter
		RequiresBooterToBoot As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "RequiresWholeDiskFormat" )
			  
			End Get
		#tag EndGetter
		RequiresWholeDiskFormat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "SupportsResize" )
			  
			End Get
		#tag EndGetter
		SupportsResize As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected zDict As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Bootable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bundle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BundlePath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
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
			Name="MaximumSize"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumSize"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresBooterToBoot"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresWholeDiskFormat"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SupportsResize"
			Group="Behavior"
			Type="Boolean"
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

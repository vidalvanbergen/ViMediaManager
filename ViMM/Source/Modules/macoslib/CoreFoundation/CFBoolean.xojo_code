#tag Class
Class CFBoolean
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As UInteger
		  return self.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return self.BooleanValue
		End Function
	#tag EndEvent


	#tag ExternalMethod, Flags = &h21
		Private Declare Function CFBooleanGetValue Lib CoreFoundation.framework (cf as CFTypeRef) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFBooleanGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Attributes( deprecated = "CFBoolean.Get" )  Sub Constructor(value As Boolean)
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    //since Constructor is deprecated, I've rewritten the code to call through to Operator_Convert. -- CCY 2013-11-24.
		    self.Operator_Convert(value)
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(file as FolderItem) As CFBoolean
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListFile( file, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFBoolean = CFBoolean( plist )
		    return r
		    
		  #else
		    
		    #pragma unused file
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(plistString as String) As CFBoolean
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListString( plistString, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFBoolean = CFBoolean( plist )
		    return r
		    
		  #else
		    
		    #pragma unused plistString
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Get(value as Boolean) As CFBoolean
		  static ObjectCache as Dictionary = MakeCache
		  return ObjectCache.Value(value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Get(ref as CFTypeRef) As CFBoolean
		  #if targetMacOS
		    return CFBoolean.Get(CFBooleanGetValue(ref))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetFalse() As CFBoolean
		  return Get(false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetTrue() As CFBoolean
		  return Get(true)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeCache() As Dictionary
		  #if targetMacOS
		    dim d as new Dictionary(false : "kCFBooleanFalse", true : "kCFBooleanTrue")
		    
		    for each key as Boolean in d.Keys
		      dim p as Ptr = CoreFoundation.Bundle.DataPointerNotRetained(d.Value(key))
		      if p <> nil then
		        p = p.Ptr(0)
		      else
		        //this case should not happen.
		      end if
		      d.Value(key) = new CFBoolean(CFTypeRefMake(p), not hasOwnership)
		    next
		    
		    return d
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(value As Boolean) As Integer
		  // Added by Kem Tekinay.
		  
		  //we define false < true.
		  
		  if self.BooleanValue = value then
		    return 0
		  else
		    if value then
		      return -1 //self = false < value = true
		    else
		      return 1 //self = true > value = false
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(value As CFBoolean) As Integer
		  // Added by Kem Tekinay.
		  
		  #if targetMacOS
		    if value is nil then
		      return 1 //both true and false > nil
		    else
		      return self.Operator_Compare(value.BooleanValue)
		    end if
		  #else
		    #pragma unused value
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Boolean
		  return self.BooleanValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(value As Boolean)
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    self.Constructor(self.Get(value).Handle, not CFType.HasOwnership)
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    //Here we check the value explicitly because Operator_Compare calls this handler, so using
			    //self <> nil would result in a StackOverflowException.
			    return self.Handle.value <> nil and CFBooleanGetValue(self)
			  #endif
			End Get
		#tag EndGetter
		BooleanValue As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BooleanValue"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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

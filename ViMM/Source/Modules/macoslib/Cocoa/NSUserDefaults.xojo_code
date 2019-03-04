#tag Class
Class NSUserDefaults
Inherits NSObject
	#tag Method, Flags = &h0
		Function ArrayValue(key as String) As NSArray
		  #if TargetMacOS
		    declare function arrayForKey lib CocoaLib selector "arrayForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return new NSArray( arrayForKey(self, key))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ArrayValue(key as String, assigns value as NSArray)
		  #if TargetMacOS
		    ObjectValue( key ) = value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BooleanValue(key as String) As Boolean
		  #if TargetMacOS
		    declare function boolForKey lib CocoaLib selector "boolForKey:" (id as Ptr, key as CFStringRef) as boolean
		    
		    return boolForKey(self, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BooleanValue(key as string, assigns value as Boolean)
		  #if TargetMacOS
		    declare sub setBool lib CocoaLib selector "setBool:forKey:" (id as Ptr, value as Boolean, key as CFStringRef)
		    
		    setBool(self, value, key)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataValue(key as String) As NSData
		  #if TargetMacOS
		    declare function dataForKey lib CocoaLib selector "dataForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return new NSData(dataForKey(self, key ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataValue(key as String, assigns value as NSData)
		  #if TargetMacOS
		    ObjectValue( key ) = value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictionaryValue(key as String) As NSDictionary
		  #if TargetMacOS
		    declare function dictionaryForKey lib CocoaLib selector "dictionaryForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return new NSDictionary(dictionaryForKey(self, key ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DictionaryValue(key as String, assigns value as NSDictionary)
		  #if TargetMacOS
		    ObjectValue( key ) = value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue(key as String) As double
		  #if TargetMacOS
		    declare function doubleForKey lib CocoaLib selector "doubleForKey:" (id as Ptr, key as CFStringRef) as double
		    
		    return doubleForKey( self, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleValue(key as String, assigns value as double)
		  #if TargetMacOS
		    declare sub setDouble lib CocoaLib selector "setDouble:forKey:" (id as Ptr, value as double, key as CFStringRef)
		    
		    setDouble( self, value, key )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FloatValue(key as String) As Double
		  #if TargetMacOS
		    declare function floatForKey lib CocoaLib selector "floatForKey:" (id as Ptr, key as CFStringRef) as Double
		    
		    return floatForKey( self, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FloatValue(key as String, assigns value as Double)
		  #if TargetMacOS
		    declare sub setFloat lib CocoaLib selector "setFloat:forKey:" (id as Ptr, value as Double, key as CFStringRef)
		    
		    setFloat( self, value, key )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(key as String) As integer
		  #if TargetMacOS
		    declare function integerForKey lib CocoaLib selector "integerForKey:" (id as Ptr, key as CFStringRef) as integer
		    
		    return integerForKey( self, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntegerValue(key as String, assigns value as integer)
		  #if TargetMacOS
		    declare sub setInteger lib CocoaLib selector "setInteger:forKey:" (id as Ptr, value as integer, key as CFStringRef)
		    
		    setInteger( self, value, key )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectIsForcedForKey(key as String) As Boolean
		  #if TargetMacOS
		    declare function objectIsForcedForKey lib CocoaLib selector "objectIsForcedForKey:" (id as Ptr, key as CFStringRef) as Boolean
		    
		    return objectIsForcedForKey(self, key)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectValue(key as String) As NSObject
		  #if TargetMacOS
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return Cocoa.NSObjectFromNSPtr( objectForKey( self, key ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ObjectValue(key as String, assigns obj as NSObject)
		  if obj = nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    declare sub setObject lib CocoaLib selector "setObject:forKey:" (id as Ptr, obj as Ptr, key as CFStringRef)
		    
		    setObject(self, obj, key)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterDefaults(dict as NSDictionary)
		  if dict = nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    declare sub registerDefaults lib CocoaLib selector "registerDefaults:" (id as Ptr, dict as Ptr)
		    
		    registerDefaults(self, dict)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key as string)
		  #if TargetMacOS
		    declare sub removeObjectForKey lib CocoaLib selector "removeObjectForKey:" (id as Ptr, key as CFStringRef)
		    
		    removeObjectForKey(self, key)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StandardUserDefaults() As NSUserDefaults
		  #if TargetMacOS
		    declare function standardUserDefaults lib CocoaLib selector "standardUserDefaults" (Cls as Ptr) as Ptr
		    
		    static defaults as NSUserDefaults = new NSUserDefaults (standardUserDefaults(Cocoa.NSClassFromString("NSUserDefaults")), not hasOwnership)
		    
		    return defaults
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(key as String) As string
		  #if TargetMacOS
		    declare function stringForKey lib CocoaLib selector "stringForKey:" (id as Ptr, key as CFStringRef) as CFStringRef
		    
		    return stringForKey( self, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StringValue(key as String, assigns value as String)
		  #if TargetMacOS
		    ObjectValue( key ) = new NSString(value)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Synchronize()
		  #if TargetMacOS
		    declare sub synchronize lib CocoaLib selector "synchronize" (id as Ptr)
		    
		    synchronize(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLValue(key as String) As NSURL
		  #if TargetMacOS
		    declare function URLForKey lib CocoaLib selector "URLForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return Cocoa.NSObjectFromNSPtr(URLForKey(self, key ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub URLValue(key as String, assigns obj as NSURL)
		  if obj = nil then
		    return
		  end if
		  
		  #if TargetMacOS
		    declare sub setURL lib CocoaLib selector "setURL:forKey:" (id as Ptr, obj as Ptr, key as CFStringRef)
		    
		    setURL(self, obj, key)
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function dictionaryRepresentation lib CocoaLib selector "dictionaryRepresentation" (id as Ptr) as Ptr
			    
			    return new NSDictionary(dictionaryRepresentation(self), hasOwnership)
			  #endif
			End Get
		#tag EndGetter
		DictionaryRepresentation As NSDictionary
	#tag EndComputedProperty


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

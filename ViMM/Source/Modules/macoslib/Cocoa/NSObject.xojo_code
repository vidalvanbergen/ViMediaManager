#tag Class
Class NSObject
Implements objHasVariantValue
	#tag Method, Flags = &h0
		Shared Function Allocate(class_id as Ptr) As Ptr
		  
		  #if TargetMacOS
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    
		    return alloc(class_id)
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Allocate(NSClassName as String) As Ptr
		  
		  return NSObject.Allocate( Cocoa.NSClassFromString(NSClassName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Autorelease()
		  #if TargetMacOS
		    declare sub autorelease lib CocoaLib selector "autorelease" (id as Ptr)
		    
		    autorelease(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ClassObjectID() As Ptr
		  //this method returns the id of the class object.  Typically it would be used in subclasses in the implementation
		  //of Cocoa class methods in Rb.
		  
		  
		  #if TargetMacOS
		    declare function klass lib CocoaLib selector "class" (id as Ptr) as Ptr
		    
		    return klass(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(obj_id as Ptr, hasOwnership as Boolean = False)
		  
		  'if checkForClass<>"" then
		  'if NOT Cocoa.InheritsFromClass( obj_id, checkForClass ) then
		  'raise new macoslibException( "The passed pointer does not match the wanted class """ + checkForClass + """" )
		  'end if
		  'end if
		  
		  self.m_id = obj_id
		  
		  if not hasOwnership then
		    call self.Retain
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy_() As Ptr
		  //# Returns an immutable copy of the object
		  
		  #if TargetMacOS
		    declare function Copy lib Cocoalib selector "copy" (id as Ptr) as Ptr
		    
		    return  Copy( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  self.Release
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Initialize(obj_id as Ptr) As Ptr
		  #if TargetMacOS
		    declare function init lib CocoaLib selector "init" (id as Ptr) as Ptr
		    
		    return init(obj_id)
		    
		  #else
		    #pragma unused obj_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MutableCopy() As Ptr
		  #if TargetMacOS
		    declare function mutableCopy lib Cocoalib selector "mutableCopy" (id as Ptr) as Ptr
		    
		    return  mutableCopy( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(obj as NSObject) As Integer
		  if obj <> nil then
		    return Integer(self.id) - Integer(obj.id)
		  else
		    return Integer(self.id)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return self.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformSelectorOnMainThread(selectorName as string, withObject as NSObject, waitUntilDone as Boolean)
		  #if TargetMacOS
		    declare sub performSelectorOnMainThread_ lib CocoaLib selector "performSelectorOnMainThread:withObject:waitUntilDone:" (id as Ptr, aSelector as Ptr, withObj as Ptr, wait as Boolean)
		    
		    dim SEL as Ptr = Cocoa.NSSelectorFromString( selectorName )
		    
		    PerformSelectorOnMainThread_   self, SEL, withObject, waitUntilDone
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  #if TargetMacOS
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    release self
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RespondsToSelector(selectorName As CFStringRef) As Boolean
		  #if TargetMacOS
		    
		    declare function instanceRespondsToSelector lib CocoaLib selector "respondsToSelector:" ( obj_id as Ptr, aSelector as Ptr ) as Boolean
		    
		    dim selectorPtr as Ptr = Cocoa.NSSelectorFromString( selectorName )
		    return instanceRespondsToSelector( m_id, selectorPtr )
		    
		  #else
		    
		    #pragma unused selectorName
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Retain() As NSObject
		  #if TargetMacOS
		    declare function retain lib CocoaLib selector "retain" (id as Ptr) as Ptr
		    
		    if self.id <> nil then
		      dim p as Ptr = retain(self.id)
		      #pragma unused p
		      return self
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Superclass() As Ptr
		  //# Returns the superclass object (not the instance)
		  
		  #if TargetMacOS
		    declare function superclass_ lib CocoaLib selector "superclass" (id as Ptr) as Ptr
		    
		    return superclass_( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  
		  return self
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function description lib CocoaLib selector "description" (id as Ptr) as CFStringRef
			    
			    if self.id <> nil then
			      return description(self.id)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.m_id
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private m_id As Ptr
	#tag EndProperty


	#tag Constant, Name = hasOwnership, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
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

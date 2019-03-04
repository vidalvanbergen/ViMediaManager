#tag Class
Class NSAffineTransform
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Append(t as NSAffineTransform)
		  #if targetMacOS
		    if t = nil then
		      return
		    end if
		    
		    declare sub appendTransform lib CocoaLib selector "appendTransform:" (obj_id as Ptr, aTransform as Ptr)
		    
		    appendTransform(self, t)
		  #else
		    #pragma Unused t
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Concat()
		  #if targetMacOS
		    //from NSAffineTransform Additions
		    declare sub concat lib CocoaLib selector "concat" (obj_id as Ptr)
		    
		    concat(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    declare function transform lib CocoaLib selector "transform" (class_id as Ptr) as Ptr
		    
		    super.Constructor(transform(Cocoa.NSClassFromString("NSAffineTransform")))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create() As NSAffineTransform
		  
		  #if TargetMacOS
		    declare function transform lib CocoaLib selector "transform" (obj_id as Ptr) as Ptr
		    
		    dim transformRef as Ptr = transform(Cocoa.NSClassFromString("NSAffineTransform"))
		    
		    if transformRef <> nil then
		      return new NSAffineTransform(transformRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InitWithTransform(aTransform as NSAffineTransform) As NSAffineTransform
		  
		  #if TargetMacOS
		    declare function initWithTransform lib CocoaLib selector "initWithTransform:" (obj_id as Ptr, aTransform as Ptr) as Ptr
		    
		    dim objectRef as Ptr
		    if aTransform <> nil then
		      objectRef = initWithTransform(self, aTransform)
		    else
		      objectRef = initWithTransform(self, nil)
		    end if
		    
		    if objectRef <> nil then
		      return new NSAffineTransform(objectRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused aTransform
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invert()
		  #if targetMacOS
		    declare sub invert lib CocoaLib selector "invert" (obj_id as Ptr)
		    
		    invert(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Matrix() As TransformMatrix
		  #if targetMacOS
		    declare function transformStruct lib CocoaLib selector "transformStruct" (obj_id as Ptr) as TransformMatrix
		    
		    return transformStruct(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Matrix(assigns value as TransformMatrix)
		  #if targetMacOS
		    declare sub setTransformStruct lib CocoaLib selector "setTransformStruct:" (obj_id as Ptr, aTransformStruct as TransformMatrix)
		    
		    setTransformStruct(self, value)
		  #else
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Prepend(t as NSAffineTransform)
		  #if targetMacOS
		    if t = nil then
		      return
		    end if
		    
		    declare sub prependTransform lib CocoaLib selector "prependTransform:" (obj_id as Ptr, aTransform as Ptr)
		    
		    prependTransform(self, t)
		  #else
		    #pragma Unused t
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateByDegrees(angle as Double)
		  #if targetMacOS
		    declare sub rotateByDegrees lib CocoaLib selector "rotateByDegrees:" (obj_id as Ptr, angle as Double)
		    
		    rotateByDegrees(self, CType(angle, Double))
		  #else
		    #pragma Unused angle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateByRadians(angle as Double)
		  #if targetMacOS
		    declare sub rotateByRadians lib CocoaLib selector "rotateByRadians:" (obj_id as Ptr, angle as Double)
		    
		    rotateByRadians(self, CType(angle, Double))
		  #else
		    #pragma Unused angle
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Scale(scaleFactor as Double)
		  #if targetMacOS
		    declare sub scaleBy lib CocoaLib selector "scaleBy:" (obj_id as Ptr, scale as Double)
		    
		    scaleBy(self, CType(scaleFactor, Double))
		  #else
		    #pragma Unused scaleFactor
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Scale(scaleX as Double, scaleY as Double)
		  #if targetMacOS
		    declare sub scaleXBy lib CocoaLib selector "scaleXBy:yBy:" (obj_id as Ptr, scaleX as Double, scaleY as Double)
		    
		    scaleXBy(self, CType(scaleX, Double), CType(scaleY, Double))
		  #else
		    #pragma Unused scaleX
		    #pragma Unused scaleY
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set()
		  #if targetMacOS
		    //from NSAffineTransform Additions
		    declare sub set lib CocoaLib selector "set" (obj_id as Ptr)
		    
		    set(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transform(point as Cocoa.NSPoint) As Cocoa.NSPoint
		  #if targetMacOS
		    declare function transformPoint lib CocoaLib selector "transformPoint:" (obj_id as Ptr, aPoint as Cocoa.NSPoint) as Cocoa.NSPoint
		    
		    return transformPoint(self, point)
		  #else
		    #pragma Unused point
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transform(size as Cocoa.NSSize) As Cocoa.NSSize
		  #if targetMacOS
		    declare function transformSize lib CocoaLib selector "transformSize:" (obj_id as Ptr, aSize as Cocoa.NSSize) as Cocoa.NSSize
		    
		    return transformSize(self, size)
		  #else
		    #pragma Unused size
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transform(Bezier as NSBezierPath) As NSBezierPath
		  
		  #if TargetMacOS
		    declare function transformBezierPath lib CocoaLib selector "transformBezierPath:" (obj_id as Ptr, Bezier as Ptr) as Ptr
		    
		    dim BezierRef as Ptr
		    if Bezier <> nil then
		      BezierRef = Bezier
		    end if
		    
		    dim returnPathRef as Ptr = transformBezierPath(self, BezierRef)
		    
		    if returnPathRef <> nil then
		      return new NSBezierPath(returnPathRef)
		    end if
		    
		  #else
		    #pragma Unused Bezier
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(deltaX as Double, deltaY as Double)
		  #if targetMacOS
		    declare sub translateXBy lib CocoaLib selector "translateXBy:yBy:" (obj_id as Ptr, deltaX as Double, deltaY as Double)
		    
		    translateXBy(self, deltaX, deltaY)
		  #else
		    #pragma Unused deltaX
		    #pragma Unused deltaY
		  #endif
		End Sub
	#tag EndMethod


	#tag Structure, Name = TransformMatrix, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		m11 as Double
		  m12 as Double
		  m21 as Double
		  m22 as Double
		  tX as Double
		tY as Double
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

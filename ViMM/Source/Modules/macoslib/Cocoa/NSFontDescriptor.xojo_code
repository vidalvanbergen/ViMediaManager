#tag Class
Class NSFontDescriptor
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSFontDescriptor")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(attribs as NSDictionary)
		  
		  #if TargetMacOS
		    declare function initWithFontAttributes lib CocoaLib selector "initWithFontAttributes:" (obj_id as Ptr, attribs as Ptr) as Ptr
		    
		    dim descriptorRef as Ptr
		    if attribs <> nil then
		      descriptorRef = initWithFontAttributes(Allocate("NSFontDescriptor"), attribs)
		    else
		      descriptorRef = initWithFontAttributes(Allocate("NSFontDescriptor"), nil)
		    end if
		    super.Constructor(descriptorRef, NSObject.hasOwnership)
		    
		  #else
		    #pragma unused attribs
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontAttributes() As NSDictionary
		  
		  #if TargetMacOS
		    declare function fontAttributes lib CocoaLib selector "fontAttributes" (obj_id as Ptr) as Ptr
		    
		    dim dictRef as Ptr = fontAttributes(self)
		    
		    if dictRef <> nil then
		      return new NSDictionary(dictRef, false)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontDescriptorByAddingAttributes(attribs as NSDictionary) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorByAddingAttributes lib CocoaLib selector "fontDescriptorByAddingAttributes:" (obj_id as Ptr, attribs as Ptr) as Ptr
		    
		    dim descriptorRef as Ptr
		    if attribs <> nil then
		      descriptorRef = fontDescriptorByAddingAttributes(self, attribs)
		    else
		      descriptorRef = fontDescriptorByAddingAttributes(self, nil)
		    end if
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused attribs
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontDescriptorWithFace(newFace as String) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorWithFace lib CocoaLib selector "fontDescriptorWithFace:" (obj_id as Ptr, newFace as CFStringRef) as Ptr
		    
		    dim descriptorRef as Ptr = fontDescriptorWithFace(self, newFace)
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused newFace
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontDescriptorWithFamily(newFamily as String) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorWithFamily lib CocoaLib selector "fontDescriptorWithFamily:" (obj_id as Ptr, newFamily as CFStringRef) as Ptr
		    
		    dim descriptorRef as Ptr = fontDescriptorWithFamily(self, newFamily)
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused newFamily
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontDescriptorWithFontAttributes(attribs as NSDictionary) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorWithFontAttributes lib CocoaLib selector "fontDescriptorWithFontAttributes:" (obj_id as Ptr, attribs as Ptr) as Ptr
		    
		    dim descriptorRef as Ptr
		    if attribs <> nil then
		      descriptorRef = fontDescriptorWithFontAttributes(ClassRef, attribs)
		    else
		      descriptorRef = fontDescriptorWithFontAttributes(ClassRef, nil)
		    end if
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused attribs
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontDescriptorWithMatrix(matrix as NSAffineTransform) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorWithMatrix lib CocoaLib selector "fontDescriptorWithMatrix:" (obj_id as Ptr, matrix as Ptr) as Ptr
		    
		    dim descriptorRef as Ptr
		    if matrix <> nil then
		      descriptorRef = fontDescriptorWithMatrix(self, matrix)
		    else
		      descriptorRef = fontDescriptorWithMatrix(self, nil)
		    end if
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused matrix
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontDescriptorWithName(name as String, size as Double) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorWithName lib CocoaLib selector "fontDescriptorWithName:size:" (obj_id as Ptr, name as CFStringRef, size as Double) as Ptr
		    
		    dim descriptorRef as Ptr = fontDescriptorWithName(ClassRef, name, size)
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused name
		    #pragma unused size
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FontDescriptorWithName(name as String, matrix as NSAffineTransform) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorWithName lib CocoaLib selector "fontDescriptorWithName:matrix:" (obj_id as Ptr, name as CFStringRef, matrix as Ptr) as Ptr
		    
		    dim descriptorRef as Ptr
		    if matrix <> nil then
		      descriptorRef = fontDescriptorWithName(ClassRef, name, matrix)
		    else
		      descriptorRef = fontDescriptorWithName(ClassRef, name, nil)
		    end if
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused name
		    #pragma unused matrix
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontDescriptorWithSize(newPointSIze as Double) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorWithSize lib CocoaLib selector "fontDescriptorWithSize:" (obj_id as Ptr, newPointSize as Double) as Ptr
		    
		    dim descriptorRef as Ptr = fontDescriptorWithSize(self, newPointSize)
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused newPointSize
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontDescriptorWithSymbolicTraits(symbolicTraits as UInt32) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function fontDescriptorWithSymbolicTraits lib CocoaLib selector "fontDescriptorWithSymbolicTraits:" (obj_id as Ptr, symbolicTraits as UInt32) as Ptr
		    
		    dim descriptorRef as Ptr = fontDescriptorWithSymbolicTraits(self, symbolicTraits)
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused symbolicTraits
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatchingFontDescriptorsWithMandatoryKeys(mandatoryKeys as NSSet) As NSFontDescriptor()
		  
		  #if TargetMacOS
		    declare function matchingFontDescriptorsWithMandatoryKeys lib CocoaLib selector "matchingFontDescriptorsWithMandatoryKeys:" _
		    (obj_id as Ptr, mandatoryKeys as Ptr) as Ptr
		    
		    dim mandatoryKeysRef as Ptr
		    if mandatoryKeys <> nil then
		      mandatoryKeysRef = mandatoryKeys
		    end if
		    
		    dim retArray() as NSFontDescriptor
		    
		    dim arrayRef as Ptr = matchingFontDescriptorsWithMandatoryKeys(self, mandatoryKeysRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as Integer = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSFontDescriptor(Ptr(m.UInt64Value(i*SizeOfPointer)))
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused mandatoryKeys
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatchingFontDescriptorWithMandatoryKeys(mandatoryKeys as NSSet) As NSFontDescriptor
		  
		  #if TargetMacOS
		    declare function matchingFontDescriptorWithMandatoryKeys lib CocoaLib selector "matchingFontDescriptorWithMandatoryKeys:" _
		    (obj_id as Ptr, mandatoryKeys as Ptr) as Ptr
		    
		    dim mandatoryKeysRef as Ptr
		    if mandatoryKeys <> nil then
		      mandatoryKeysRef = mandatoryKeys
		    end if
		    
		    dim descriptorRef as Ptr = matchingFontDescriptorWithMandatoryKeys(self, mandatoryKeysRef)
		    
		    if descriptorRef <> nil then
		      return new NSFontDescriptor(descriptorRef)
		    end if
		    
		  #else
		    #pragma unused mandatoryKeys
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Matrix() As NSAffineTransform
		  
		  #if TargetMacOS
		    declare function matrix lib CocoaLib selector "matrix" (obj_id as Ptr) as Ptr
		    
		    dim matrixRef as Ptr = matrix(self)
		    
		    if matrixRef <> nil then
		      return new NSAffineTransform(matrixRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontCascadeListAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontCascadeListAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontCharacterSetAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontCharacterSetAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontColorAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontColorAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontFaceAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontFaceAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontFamilyAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontFamilyAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontFeatureSettingsAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontFeatureSettingsAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontFixedAdvanceAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontFixedAdvanceAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontMatrixAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontMatrixAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontNameAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontNameAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontSizeAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontSizeAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontTraitsAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontTraitsAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontVariationAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontVariationAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSFontVisibleNameAttribute() As String
		  
		  return Cocoa.StringConstant("NSFontVisibleNameAttribute")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForKey(anAttribute as String) As NSObject
		  
		  #if TargetMacOS
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (obj_id as Ptr, anAttribute as CFStringRef) as Ptr
		    
		    dim objectRef as Ptr = objectForKey(self, anAttribute)
		    
		    if objectRef <> nil then
		      return new NSObject(objectRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused anAttribute
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PointSize() As Double
		  
		  #if TargetMacOS
		    declare function pointSize lib CocoaLib selector "pointSize" (obj_id as Ptr) as Double
		    
		    return pointSize(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PostscriptName() As String
		  
		  #if TargetMacOS
		    declare function postscriptName lib CocoaLib selector "postscriptName" (obj_id as Ptr) as CFStringRef
		    
		    return postscriptName(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SymbolicTraits() As UInt32
		  
		  #if TargetMacOS
		    declare function symbolicTraits lib CocoaLib selector "symbolicTraits" (obj_id as Ptr) as UInt32
		    
		    return symbolicTraits(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod


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

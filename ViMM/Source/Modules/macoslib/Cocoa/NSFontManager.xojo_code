#tag Class
Class NSFontManager
Inherits NSObject
	#tag Method, Flags = &h0
		Function AddCollection(collectionName as String, collectionOptions as Integer = 0) As Boolean
		  
		  #if TargetMacOS
		    declare function addCollection lib CocoaLib selector "addCollection:options:" _
		    (obj_id as Ptr, collectionName as CFStringRef, collectionOptions as Integer) as Boolean
		    
		    return addCollection(self, collectionName, collectionOptions)
		    
		  #else
		    #pragma unused collectionName
		    #pragma unused collectionOptions
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFontDescriptors(descriptors() as NSFontDescriptor, toCollection as String)
		  
		  #if TargetMacOS
		    declare sub addFontDescriptors lib CocoaLib selector "addFontDescriptors:toCollection:" (obj_id as Ptr, descriptors as Ptr, collectionName as CFStringRef)
		    
		    dim ns_array as NSArray = NSArray.CreateWithObjects(descriptors)
		    
		    addFontDescriptors self, ns_array, toCollection
		    
		  #else
		    #pragma unused descriptors
		    #pragma unused toCollection
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableFontFamilies() As String()
		  #if TargetMacOS
		    declare function availableFontFamilies lib CocoaLib selector "availableFontFamilies" (id as Ptr) as Ptr
		    
		    return GetStringValues(new NSArray(availableFontFamilies(self)))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableFonts() As String()
		  #if TargetMacOS
		    declare function availableFonts lib CocoaLib selector "availableFonts" (id as Ptr) as Ptr
		    
		    return GetStringValues(new NSArray( AvailableFonts(self)))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableFonts(descriptor as NSFontDescriptor) As String()
		  
		  #if TargetMacOS
		    declare function availableFontNamesMatchingFontDescriptor lib CocoaLib selector "availableFontNamesMatchingFontDescriptor:" _
		    (obj_id as Ptr, descriptor as Ptr) as Ptr
		    
		    dim descriptorRef as Ptr
		    if descriptor <> nil then
		      descriptorRef = descriptor
		    end if
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = availableFontNamesMatchingFontDescriptor(self, descriptorRef)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #else
		    #pragma unused descriptor
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableFonts(fontTraitMask as UInt32) As String()
		  
		  #if TargetMacOS
		    declare function availableFontNamesWithTraits lib CocoaLib selector "availableFontNamesWithTraits:" (obj_id as Ptr, fontTraitMask as UInt32) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = availableFontNamesWithTraits(self, fontTraitMask)
		    if arrayRef<> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #else
		    #pragma unused fontTraitMask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableMembersOfFontFamily(theFamily as string) As String()
		  #if TargetMacOS
		    declare function availableMembersOfFontFamily lib CocoaLib selector "availableMembersOfFontFamily:" (id as Ptr, name as CFStringRef) as Ptr
		    
		    return GetStringValues(new NSArray(availableMembersOfFontFamily(self, theFamily)))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CollectionNames() As String()
		  #if TargetMacOS
		    declare function collectionNames lib CocoaLib selector "collectionNames" (id as Ptr) as Ptr
		    
		    return GetStringValues(new NSArray(collectionNames(self)))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(obj_id as Ptr, hasOwnership as Boolean = false) -- From NSObject
		  Super.Constructor(SharedManager)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertFontToFace(aFont as NSFont, typeFace as String) As NSFont
		  
		  #if TargetMacOS
		    declare function convertFont lib CocoaLib selector "convertFont:toFace:" (obj_id as Ptr, aFont as Ptr, typeFace as CFStringRef) as Ptr
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    dim retFontRef as Ptr = convertFont(self, fontRef, typeFace)
		    if retFontRef <> nil then
		      return new NSFont(retFontRef)
		    end if
		    
		  #else
		    #pragma unused aFont
		    #pragma unused typeFace
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertFontToFamily(aFont as NSFont, family as String) As NSFont
		  
		  #if TargetMacOS
		    declare function convertFont lib CocoaLib selector "convertFont:toFamily:" (obj_id as Ptr, aFont as Ptr, family as CFStringRef) as Ptr
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    dim retFontRef as Ptr = convertFont(self, fontRef, family)
		    if retFontRef <> nil then
		      return new NSFont(retFontRef)
		    end if
		    
		  #else
		    #pragma unused aFont
		    #pragma unused family
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertFontToHaveTrait(font as NSFont, traitMask as integer) As NSFont
		  if font is nil then
		    return nil
		  end if
		  
		  #if TargetMacOS
		    declare function convertFont lib CocoaLib selector "convertFont:toHaveTrait:" (id as Ptr, fontid as Ptr, mask as Integer) as Ptr
		    
		    return new NSFont(convertFont(self, font, traitMask))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertFontToNotHaveTrait(aFont as NSFont, fontTrait as UInt32) As NSFont
		  
		  #if TargetMacOS
		    declare function convertFont lib CocoaLib selector "convertFont:toNotHaveTrait:" (obj_id as Ptr, aFont as Ptr, fontTrait as UInt32) as Ptr
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    dim retFontRef as Ptr = convertFont(self, fontRef, fontTrait)
		    if retFontRef <> nil then
		      return new NSFont(retFontRef)
		    end if
		    
		  #else
		    #pragma unused aFont
		    #pragma unused fontTrait
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertFontToSize(aFont as NSFont, size as Double) As NSFont
		  
		  #if TargetMacOS
		    declare function convertFont lib CocoaLib selector "convertFont:toSize:" (obj_id as Ptr, aFont as Ptr, size as Double) as Ptr
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    dim retFontRef as Ptr = convertFont(self, fontRef, size)
		    if retFontRef <> nil then
		      return new NSFont(retFontRef)
		    end if
		    
		  #else
		    #pragma unused aFont
		    #pragma unused size
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertWeight(aFont as NSFont, increaseWeight as Boolean) As NSFont
		  
		  #if TargetMacOS
		    declare function convertWeight lib CocoaLib selector "convertWeight:ofFont:" (obj_id as Ptr, increase as Boolean, aFont as Ptr) as Ptr
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    dim retFontRef as Ptr = convertWeight(self, increaseWeight, fontRef)
		    if retFontRef <> nil then
		      return new NSFont(retFontRef)
		    end if
		    
		  #else
		    #pragma unused aFont
		    #pragma unused increaseWeight
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontDescriptorsInCollection(collectionName as String) As NSFontDescriptor()
		  
		  #if TargetMacOS
		    declare function fontDescriptorsInCollection lib CocoaLib selector "fontDescriptorsInCollection:" (obj_id as Ptr, collectionName as CFStringRef) as Ptr
		    
		    dim retArray() as NSFontDescriptor
		    
		    dim arrayRef as Ptr = fontDescriptorsInCollection(self, collectionName)
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
		    #pragma unused collectionName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontHasTraits(typeFace as String, fontTraitMask as UInt32) As Boolean
		  
		  #if TargetMacOS
		    declare function fontNamed lib CocoaLib selector "fontNamed:hasTraits:" (obj_id as Ptr, typeFace as CFStringRef, fontTraitMask as UInt32) as Boolean
		    
		    return fontNamed(self, typeFace, fontTraitMask)
		    
		  #else
		    #pragma unused typeFace
		    #pragma unused fontTraitMask
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFont(familyName as string, size as double = 0.0, bold as Boolean = false, italic as Boolean = false) As NSFont
		  //Find a font
		  
		  #if targetMacOS
		    dim nsf as NSFont
		    dim traits as integer
		    
		    declare function fontWithFamily lib CocoaLib selector "fontWithFamily:traits:weight:size:" ( id as Ptr, family as CFStringRef, traits as integer, weight as Integer, size as Double ) as Ptr
		    
		    if familyName="System" then //Get System font
		      if bold then
		        nsf = NSFont.BoldSystemFontOfSize( size )
		      else
		        nsf = NSFont.SystemFontOfSize( size )
		      end if
		      
		      if italic then
		        nsf = ConvertFontToHaveTrait( nsf, kNSItalicFontMask )
		      end if
		      
		    elseif familyName="SmallSystem" then //Get small system font
		      if bold then
		        nsf = NSFont.BoldSystemFontOfSize( NSFont.SmallSystemFontSize )
		      else
		        nsf = NSFont.SystemFontOfSize( NSFont.SmallSystemFontSize )
		      end if
		      
		      if italic then
		        nsf = ConvertFontToHaveTrait( nsf, kNSItalicFontMask )
		      end if
		      
		    else //Get another font
		      if bold then
		        traits = kNSBoldFontMask
		      end if
		      if italic then
		        traits = traits OR kNSItalicFontMask
		      end if
		      
		      nsf = new NSFont( fontWithFamily( me.id, familyName, traits, NormalWeight, size ), false )
		      
		    end if
		    
		    return  nsf
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFontFromFamily(familyName as string, traits as integer, size as double = 0.0) As NSFont
		  //Find a font
		  
		  #if targetMacOS
		    declare function fontWithFamily lib CocoaLib selector "fontWithFamily:traits:weight:size:" ( id as Ptr, family as CFStringRef, traits as integer, weight as Integer, size as Double ) as Ptr
		    
		    dim p as Ptr = fontWithFamily(self, familyName, traits, NormalWeight, size)
		    
		    if p<>nil then
		      return new NSFont(p)
		    else
		      return nil
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetStringValues(theArray as NSArray) As String()
		  return theArray.StringValues
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMultiple() As Boolean
		  
		  #if TargetMacOS
		    declare function isMultiple lib CocoaLib selector "fisMultiple" (obj_id as Ptr) as Boolean
		    
		    return isMultiple(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalizedName(family as String, face as String = "") As String
		  
		  #if TargetMacOS
		    declare function localizedNameForFamily lib CocoaLib selector "localizedNameForFamily:face:" _
		    (obj_id as Ptr, family as CFStringRef, face as CFStringRef) as CFStringRef
		    
		    if face = "" then
		      return localizedNameForFamily(self, family, nil)
		    else
		      return localizedNameForFamily(self, family, face)
		    end if
		    
		  #else
		    #pragma unused family
		    #pragma unused face
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveCollection(collectionName as String) As Boolean
		  
		  #if TargetMacOS
		    declare function removeCollection lib CocoaLib selector "removeCollection:" (obj_id as Ptr, collectionName as CFStringRef) as Boolean
		    
		    return removeCollection(self, collectionName)
		    
		  #else
		    #pragma unused collectionName
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFontDescriptor(descriptor as NSFontDescriptor, fromCollection as String)
		  
		  #if TargetMacOS
		    declare sub removeFontDescriptor lib CocoaLib selector "removeFontDescriptor:fromCollection:" (obj_id as Ptr, descriptor as Ptr, collectionName as CFStringRef)
		    
		    dim descriptorRef as Ptr
		    if descriptor <> nil then
		      descriptorRef = descriptor
		    end if
		    
		    removeFontDescriptor self, descriptorRef, fromCollection
		    
		  #else
		    #pragma unused descriptor
		    #pragma unused fromCollection
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedFont() As NSFont
		  
		  #if TargetMacOS
		    declare function selectedFont lib CocoaLib selector "selectedFont" (obj_id as Ptr) as Ptr
		    
		    dim fontRef as Ptr = selectedFont(self)
		    if fontRef <> nil then
		      return new NSFont(fontRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSelectedFont(aFont as NSFont, isMultiple as Boolean)
		  
		  #if TargetMacOS
		    declare sub setSelectedFont lib CocoaLib selector "setSelectedFont:" (obj_id as Ptr, aFont as Ptr, isMultiple as Boolean)
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    setSelectedFont self, fontRef, isMultiple
		    
		  #else
		    #pragma unused aFont
		    #pragma unused isMultiple
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SharedManager() As NSFontManager
		  #if targetMacOS
		    declare function m_sharedFontManager lib CocoaLib selector "sharedFontManager" (Cls as Ptr) as Ptr
		    
		    static mgr as NSFontManager = new NSFontManager( m_sharedFontManager( Cocoa.NSClassFromString( "NSFontManager" )), false )
		    
		    return  mgr
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TraitsOfFont(aFont as NSFont) As UInt32
		  
		  #if TargetMacOS
		    declare function traitsOfFont lib CocoaLib selector "traitsOfFont:" (obj_id as Ptr, aFont as Ptr) as UInt32
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    return traitsOfFont(self, fontRef)
		    
		  #else
		    #pragma unused aFont
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WeightOfFont(aFont as NSFont) As Integer
		  
		  #if TargetMacOS
		    declare function weightOfFont lib CocoaLib selector "weightOfFont:" (obj_id as Ptr, aFont as Ptr) as Integer
		    
		    dim fontRef as Ptr
		    if aFont <> nil then
		      fontRef = aFont
		    end if
		    
		    return weightOfFont(self, fontRef)
		    
		  #else
		    #pragma unused aFont
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function isEnabled lib CocoaLib selector "isEnabled" (obj_id as Ptr) as Boolean
			    
			    return isEnabled(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setEnabled lib CocoaLib selector "setEnabled:" (obj_id as Ptr, value as Boolean)
			    
			    setEnabled(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = kNSBoldFontMask, Type = Double, Dynamic = False, Default = \"&h2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSCompressedFontMask, Type = Double, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSCondensedFontMask, Type = Double, Dynamic = False, Default = \"&h40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSExpandedFontMask, Type = Double, Dynamic = False, Default = \"&h20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSFixedPitchFontMask, Type = Double, Dynamic = False, Default = \"&h400", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSItalicFontMask, Type = Double, Dynamic = False, Default = \"&h1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNarrowFontMask, Type = Double, Dynamic = False, Default = \"&h10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNonStandardCharacterSetFontMask, Type = Double, Dynamic = False, Default = \"&h8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSPosterFontMask, Type = Double, Dynamic = False, Default = \"&h100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSmallCapsFontMask, Type = Double, Dynamic = False, Default = \"&h80", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnboldFontMask, Type = Double, Dynamic = False, Default = \"&h4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnitalicFontMask, Type = Double, Dynamic = False, Default = \"&h1000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NormalWeight, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
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

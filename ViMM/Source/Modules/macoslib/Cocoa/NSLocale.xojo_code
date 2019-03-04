#tag Class
Class NSLocale
Inherits NSObject
	#tag Method, Flags = &h1000
		Shared Function AutoupdatingCurrentLocale() As NSLocale
		  
		  #if TargetMacOS
		    declare function autoupdatingCurrentLocale lib CocoaLib selector "autoupdatingCurrentLocale" (class_id as Ptr) as Ptr
		    
		    dim localeRef as Ptr = autoupdatingCurrentLocale(ClassRef)
		    if localeRef <> nil then
		      return new NSLocale(localeRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function AvailableLocaleIdentifiers() As String()
		  
		  #if TargetMacOS
		    declare function availableLocaleIdentifiers lib CocoaLib selector "availableLocaleIdentifiers" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = availableLocaleIdentifiers(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CanonicalLocaleIdentifier(aString as String) As String
		  
		  #if TargetMacOS
		    declare function canonicalLocaleIdentifierFromString lib CocoaLib selector "canonicalLocaleIdentifierFromString:" (class_id as Ptr, aString as CFStringRef) as CFStringRef
		    
		    return canonicalLocaleIdentifierFromString(ClassRef, aString)
		    
		  #else
		    #pragma unused aString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CharacterDirection(isoLangCode as String) As NSLocaleLanguageDirection
		  
		  #if TargetMacOS
		    declare function characterDirectionForLanguage lib CocoaLib selector "characterDirectionForLanguage:" _
		    (class_id as Ptr, isoLangCode as CFStringRef) as NSLocaleLanguageDirection
		    
		    return characterDirectionForLanguage(ClassRef, isoLangCode)
		    
		  #else
		    #pragma unused isoLangCode
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSLocale")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CommonISOCurrencyCodes() As String()
		  
		  #if TargetMacOS
		    declare function commonISOCurrencyCodes lib CocoaLib selector "commonISOCurrencyCodes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = commonISOCurrencyCodes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function Components(localeID as String) As NSDictionary
		  
		  #if TargetMacOS
		    declare function componentsFromLocaleIdentifier lib CocoaLib selector "componentsFromLocaleIdentifier:" (class_id as Ptr, aString as CFStringRef) as Ptr
		    
		    dim dictRef as Ptr = componentsFromLocaleIdentifier(ClassRef, localeID)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused localeID
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(identifier as String)
		  
		  #if targetMacOS
		    declare function initWithLocaleIdentifier lib CocoaLib selector "initWithLocaleIdentifier:" (obj_id as Ptr, identifier as CFStringRef) as Ptr
		    
		    super.Constructor(initWithLocaleIdentifier(Allocate("NSLocale"), identifier), NSObject.hasOwnership)
		    
		  #else
		    #pragma unused identifier
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CurrentLocale() As NSLocale
		  
		  #if TargetMacOS
		    declare function currentLocale lib CocoaLib selector "currentLocale" (class_id as Ptr) as Ptr
		    
		    dim localeRef as Ptr = currentLocale(ClassRef)
		    if localeRef <> nil then
		      return new NSLocale(localeRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function DisplayName(key as String, value as Ptr) As String
		  
		  #if targetMacOS
		    declare function displayNameForKey lib CocoaLib selector "displayNameForKey:value:" (obj_id as Ptr, key as CFStringRef, value as Ptr) as CFStringRef
		    
		    return displayNameForKey(self, key, value)
		    
		  #else
		    #pragma unused key
		    #pragma unused value
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ISOCountryCodes() As String()
		  
		  #if TargetMacOS
		    declare function ISOCountryCodes lib CocoaLib selector "ISOCountryCodes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = ISOCountryCodes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ISOCurrencyCodes() As String()
		  
		  #if TargetMacOS
		    declare function ISOCurrencyCodes lib CocoaLib selector "ISOCurrencyCodes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = ISOCurrencyCodes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function ISOLanguageCodes() As String()
		  
		  #if TargetMacOS
		    declare function ISOLanguageCodes lib CocoaLib selector "ISOLanguageCodes" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = ISOLanguageCodes(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function LineDirection(isoLangCode as String) As NSLocaleLanguageDirection
		  
		  #if TargetMacOS
		    declare function lineDirectionForLanguage lib CocoaLib selector "lineDirectionForLanguage:" _
		    (class_id as Ptr, isoLangCode as CFStringRef) as NSLocaleLanguageDirection
		    
		    return lineDirectionForLanguage(ClassRef, isoLangCode)
		    
		  #else
		    #pragma unused isoLangCode
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function LocaleID(components as NSDictionary) As String
		  
		  #if TargetMacOS
		    declare function localeIdentifierFromComponents lib CocoaLib selector "localeIdentifierFromComponents:" (class_id as Ptr, components as Ptr) as CFStringRef
		    
		    dim dictRef as Ptr
		    if components <> nil then
		      dictRef = components
		    end if
		    
		    return localeIdentifierFromComponents(ClassRef, dictRef)
		    
		  #else
		    #pragma unused components
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function LocaleIdentifier() As String
		  
		  #if targetMacOS
		    declare function localeIdentifier lib CocoaLib selector "localeIdentifier" (obj_id as Ptr) as CFStringRef
		    
		    return localeIdentifier(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function LocaleIDFromWindowsLocaleCode(lcid as UInt32) As String
		  
		  #if TargetMacOS
		    declare function localeIdentifierFromWindowsLocaleCode lib CocoaLib selector "localeIdentifierFromWindowsLocaleCode:" (class_id as Ptr, lcid as UInt32) as CFStringRef
		    
		    return localeIdentifierFromWindowsLocaleCode(ClassRef, lcid)
		    
		  #else
		    #pragma unused lcid
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function LocaleObject(key as String) As Ptr
		  
		  #if targetMacOS
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (obj_id as Ptr, key as CFStringRef) as Ptr
		    
		    return objectForKey(self, key)
		    
		  #else
		    #pragma unused key
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSBuddhistCalendar() As String
		  
		  return Cocoa.StringConstant("NSBuddhistCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSChineseCalendar() As String
		  
		  return Cocoa.StringConstant("NSChineseCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSGregorianCalendar() As String
		  
		  return Cocoa.StringConstant("NSGregorianCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSHebrewCalendar() As String
		  
		  return Cocoa.StringConstant("NSHebrewCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSIndianCalendar() As String
		  
		  return Cocoa.StringConstant("NSIndianCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSIslamicCalendar() As String
		  
		  return Cocoa.StringConstant("NSIslamicCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSIslamicCivilCalendar() As String
		  
		  return Cocoa.StringConstant("NSIslamicCivilCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSISO8601Calendar() As String
		  
		  return Cocoa.StringConstant("NSISO8601Calendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSJapaneseCalendar() As String
		  
		  return Cocoa.StringConstant("NSJapaneseCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleAlternateQuotationBeginDelimiterKey() As String
		  
		  return Cocoa.StringConstant("NSLocaleAlternateQuotationBeginDelimiterKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleAlternateQuotationEndDelimiterKey() As String
		  
		  return Cocoa.StringConstant("NSLocaleAlternateQuotationEndDelimiterKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleCalendar() As String
		  
		  return Cocoa.StringConstant("NSLocaleCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleCollationIdentifier() As String
		  
		  return Cocoa.StringConstant("NSLocaleCollationIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleCollatorIdentifier() As String
		  
		  return Cocoa.StringConstant("NSLocaleCollatorIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleCountryCode() As String
		  
		  return Cocoa.StringConstant("NSLocaleCountryCode")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleCurrencyCode() As String
		  
		  return Cocoa.StringConstant("NSLocaleCurrencyCode")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleCurrencySymbol() As String
		  
		  return Cocoa.StringConstant("NSLocaleCurrencySymbol")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleDecimalSeparator() As String
		  
		  return Cocoa.StringConstant("NSLocaleDecimalSeparator")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleExemplarCharacterSet() As String
		  
		  return Cocoa.StringConstant("NSLocaleExemplarCharacterSet")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleGroupingSeparator() As String
		  
		  return Cocoa.StringConstant("NSLocaleGroupingSeparator")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleIdentifier() As String
		  
		  return Cocoa.StringConstant("NSLocaleIdentifier")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleLanguageCode() As String
		  
		  return Cocoa.StringConstant("NSLocaleLanguageCode")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleMeasurementSystem() As String
		  
		  return Cocoa.StringConstant("NSLocaleMeasurementSystem")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleQuotationBeginDelimiterKey() As String
		  
		  return Cocoa.StringConstant("NSLocaleQuotationBeginDelimiterKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleQuotationEndDelimiterKey() As String
		  
		  return Cocoa.StringConstant("NSLocaleQuotationEndDelimiterKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleScriptCode() As String
		  
		  return Cocoa.StringConstant("NSLocaleScriptCode")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleUsesMetricSystem() As String
		  
		  return Cocoa.StringConstant("NSLocaleUsesMetricSystem")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSLocaleVariantCode() As String
		  
		  return Cocoa.StringConstant("NSLocaleVariantCode")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSPersianCalendar() As String
		  
		  return Cocoa.StringConstant("NSPersianCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NSRepublicOfChinaCalendar() As String
		  
		  return Cocoa.StringConstant("NSRepublicOfChinaCalendar")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function PreferredLanguages() As String()
		  
		  #if TargetMacOS
		    declare function preferredLanguages lib CocoaLib selector "preferredLanguages" (class_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = preferredLanguages(ClassRef)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function SystemLocale() As NSLocale
		  
		  #if TargetMacOS
		    declare function systemLocale lib CocoaLib selector "systemLocale" (class_id as Ptr) as Ptr
		    
		    dim localeRef as Ptr = systemLocale(ClassRef)
		    if localeRef <> nil then
		      return new NSLocale(localeRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function WindowsLocaleCodeFromLocaleID(localeIdentifier as String) As UInt32
		  
		  #if TargetMacOS
		    declare function windowsLocaleCodeFromLocaleIdentifier lib CocoaLib selector "windowsLocaleCodeFromLocaleIdentifier:" _
		    (class_id as Ptr, localeIdentifier as CFStringRef) as UInt32
		    
		    return windowsLocaleCodeFromLocaleIdentifier(ClassRef, localeIdentifier)
		    
		  #else
		    #pragma unused localeIdentifier
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Enum, Name = NSLocaleLanguageDirection, Type = UInt32, Flags = &h0
		NSLocaleLanguageDirectionUnknown
		  NSLocaleLanguageDirectionLeftToRight
		  NSLocaleLanguageDirectionRightToLeft
		  NSLocaleLanguageDirectionTopToBottom
		NSLocaleLanguageDirectionBottomToTop
	#tag EndEnum


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

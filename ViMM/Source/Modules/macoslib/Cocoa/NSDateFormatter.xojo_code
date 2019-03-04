#tag Class
Class NSDateFormatter
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSDateFormatter")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  #if targetCocoa
		    super.Constructor(Initialize(Allocate("NSDateFormatter")))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(dateFormat as String, allowNaturalLanguage as Boolean)
		  //# Initializes and returns an NSDateFormatter instance that uses the OS X v10.0 formatting behavior and the given date format string in its conversions.
		  
		  #if targetMacOS
		    declare function initWithDateFormat lib CocoaLib selector "initWithDateFormat:allowNaturalLanguage:" (obj_id as Ptr, dateFormat as CFStringRef, flag as Boolean) as Ptr
		    
		    super.Constructor(initWithDateFormat(Allocate("NSDateFormatter"), dateFormat, allowNaturalLanguage), NSDateFormatter.hasOwnership)
		  #else
		    #pragma unused dateFormat
		    #pragma unused allowNaturalLanguage
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateFormat() As String
		  //# Returns the date format string used by the NSDateFormatter.
		  
		  #if targetCocoa
		    declare function dateFormat lib CocoaLib selector "dateFormat" (id as Ptr) as CFStringRef
		    
		    return dateFormat(self.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DateFormat(assigns value as String)
		  //# Sets the date format for the NSDateFormatter.
		  
		  #if targetCocoa
		    declare sub setDateFormat lib CocoaLib selector "setDateFormat:" (id as Ptr, s as CFStringRef)
		    
		    setDateFormat self.id, value
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateValue(aString as String) As NSDate
		  //# Returns a date representation of a given string interpreted using the NSDateFormatter’s current settings.
		  
		  #if TargetMacOS
		    declare function dateFromString lib CocoaLib selector "dateFromString:" (obj_id as Ptr, aString as CFStringRef) as Ptr
		    
		    dim dateRef as Ptr = dateFromString(self, aString)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #else
		    #pragma unused aString
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function LocalizedDateFormat(template as String, locale as NSLocale) As String
		  //# Returns a localized date format string representing the given date format components arranged appropriately for the specified locale.
		  
		  #if TargetMacOS
		    declare function dateFormatFromTemplate lib CocoaLib selector "dateFormatFromTemplate:options:locale:" _
		    (class_id as Ptr, template as CFStringRef, options as UInt32, locale as Ptr) as CFStringRef
		    
		    dim localeRef as Ptr
		    if locale <> nil then
		      localeRef = locale
		    end if
		    
		    return dateFormatFromTemplate(ClassRef, template, 0, localeRef)
		    
		  #else
		    #pragma unused template
		    #pragma unused locale
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function LocalizedString(aDate as NSDate, dateStyle as NSDateFormatterStyle, timeStyle as NSDateFormatterStyle) As String
		  //# Returns string representation of a given date formatted for the current locale using the specified date and time styles.
		  
		  #if TargetMacOS
		    if IsSnowLeopard then
		      declare function localizedStringFromDate lib CocoaLib selector "localizedStringFromDate:dateStyle:timeStyle:" _
		      (class_id as Ptr, aDate as Ptr, dateStyle as NSDateFormatterStyle, timeStyle as NSDateFormatterStyle) as CFStringRef
		      
		      dim dateRef as Ptr
		      if aDate <> nil then
		        dateRef = aDate
		      end if
		      
		      return localizedStringFromDate(ClassRef, dateRef, dateStyle, timeStyle)
		    end if
		  #else
		    #pragma unused aDate
		    #pragma unused dateStyle
		    #pragma unused timeStyle
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(d as NSDate) As String
		  if d = nil then
		    return ""
		  end if
		  
		  #if targetCocoa
		    declare function stringFromDate lib CocoaLib selector "stringFromDate:" (id as Ptr, d as Ptr) as CFStringRef
		    
		    return stringFromDate(self.id, d)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Boolean value that indicates whether the NSDateFormatter attempts to process dates entered as a vernacular string.
			  
			  #if TargetMacOS
			    declare function allowsNaturalLanguage lib CocoaLib selector "allowsNaturalLanguage" (obj_id as Ptr) as Boolean
			    
			    return allowsNaturalLanguage(self)
			  #endif
			End Get
		#tag EndGetter
		AllowsNaturalLanguage As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the AM symbol for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function AMSymbol lib CocoaLib selector "AMSymbol" (obj_id as Ptr) as CFStringRef
			    
			    return AMSymbol(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the AM symbol for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setAMSymbol lib CocoaLib selector "setAMSymbol:" (obj_id as Ptr, aString as CFStringRef)
			    
			    setAMSymbol self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		AMSymbol As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the calendar for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function calendar lib CocoaLib selector "calendar" (obj_id as Ptr) as Ptr
			    
			    dim calendarRef as Ptr = calendar(self)
			    if calendarRef <> nil then
			      return new NSCalendar(calendarRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the calendar for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setCalendar lib CocoaLib selector "setCalendar:" (obj_id as Ptr, aCalendar as Ptr)
			    
			    dim calendarRef as Ptr
			    if value <> nil then
			      calendarRef = value
			    end if
			    
			    setCalendar self, calendarRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Calendar As NSCalendar
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the date format string used by the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function dateFormat lib CocoaLib selector "dateFormat" (obj_id as Ptr) as CFStringRef
			    
			    return dateFormat(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the date format for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setDateFormat lib CocoaLib selector "setDateFormat:" (obj_id as Ptr, aString as CFStringRef)
			    
			    setDateFormat self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		DateFormat As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the date style of the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function dateStyle lib CocoaLib selector "dateStyle" (obj_id as Ptr) as NSDateFormatterStyle
			    
			    return dateStyle(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the date style of the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setDateStyle lib CocoaLib selector "setDateStyle:" (obj_id as Ptr, style as NSDateFormatterStyle)
			    
			    setDateStyle self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		DateStyle As NSDateFormatterStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the default date for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function defaultDate lib CocoaLib selector "defaultDate" (obj_id as Ptr) as Ptr
			    
			    dim dateRef as Ptr = defaultDate(self)
			    if dateRef <> nil then
			      return new NSDate(dateRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the default date for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setDefaultDate lib CocoaLib selector "setDefaultDate:" (obj_id as Ptr, aDate as Ptr)
			    
			    dim dateRef as Ptr
			    if value <> nil then
			      dateRef = value
			    end if
			    
			    setDefaultDate self, dateRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		DefaultDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the default formatting behavior for instances of the class.
			  
			  #if TargetMacOS
			    declare function defaultFormatterBehavior lib CocoaLib selector "defaultFormatterBehavior" (class_id as Ptr) as NSDateFormatterBehavior
			    
			    return defaultFormatterBehavior(ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the default formatting behavior for instances of the class.
			  
			  #if TargetMacOS
			    declare sub setDefaultFormatterBehavior lib CocoaLib selector "setDefaultFormatterBehavior:" (class_id as Ptr, behavior as NSDateFormatterBehavior)
			    
			    setDefaultFormatterBehavior ClassRef, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Shared DefaultFormatterBehavior As NSDateFormatterBehavior
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Boolean value that indicates whether the NSDateFormatter uses phrases such as “today” and “tomorrow” for the date component.
			  
			  #if TargetMacOS
			    declare function doesRelativeDateFormatting lib CocoaLib selector "doesRelativeDateFormatting" (obj_id as Ptr) as Boolean
			    
			    return doesRelativeDateFormatting(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Specifies whether the NSDateFormatter uses phrases such as “today” and “tomorrow” for the date component.
			  
			  #if TargetMacOS
			    if IsSnowLeopard then
			      declare sub setDoesRelativeDateFormatting lib CocoaLib selector "setDoesRelativeDateFormatting:" (obj_id as Ptr, flag as Boolean)
			      
			      setDoesRelativeDateFormatting self, value
			    end if
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		DoesRelativeDateFormatting As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the era symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function eraSymbols lib CocoaLib selector "eraSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = eraSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the era symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setEraSymbols lib CocoaLib selector "setEraSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setEraSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		EraSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the formatter behavior for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function formatterBehavior lib CocoaLib selector "formatterBehavior" (obj_id as Ptr) as NSDateFormatterBehavior
			    
			    return formatterBehavior(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the formatter behavior for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setFormatterBehavior lib CocoaLib selector "setFormatterBehavior:" (obj_id as Ptr, behavior as NSDateFormatterBehavior)
			    
			    setFormatterBehavior self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		FormatterBehavior As NSDateFormatterBehavior
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the start date of the Gregorian calendar for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function gregorianStartDate lib CocoaLib selector "gregorianStartDate" (obj_id as Ptr) as Ptr
			    
			    dim dateRef as Ptr = gregorianStartDate(self)
			    if dateRef <> nil then
			      return new NSDate(dateRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the start date of the Gregorian calendar for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setGregorianStartDate lib CocoaLib selector "setGregorianStartDate:" (obj_id as Ptr, aDate as Ptr)
			    
			    dim dateRef as Ptr
			    if value <> nil then
			      dateRef = value
			    end if
			    
			    setGregorianStartDate self, dateRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		GregorianStartDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Boolean value that indicates whether the NSDateFormatter uses heuristics when parsing a string.
			  
			  #if TargetMacOS
			    declare function isLenient lib CocoaLib selector "isLenient" (obj_id as Ptr) as Boolean
			    
			    return isLenient(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets whether the NSDateFormatter uses heuristics when parsing a string.
			  
			  #if TargetMacOS
			    declare sub setLenient lib CocoaLib selector "setLenient:" (obj_id as Ptr, flag as Boolean)
			    
			    setLenient self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Lenient As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the locale for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function locale lib CocoaLib selector "locale" (obj_id as Ptr) as Ptr
			    
			    dim localeRef as Ptr = locale(self)
			    if localeRef <> nil then
			      return new NSLocale(localeRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the locale for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setLocale lib CocoaLib selector "setLocale:" (obj_id as Ptr, aLocale as Ptr)
			    
			    dim localeRef as Ptr
			    if value <> nil then
			      localeRef = value
			    end if
			    
			    setLocale self, localeRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Locale As NSLocale
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the long era symbols for the NSDateFormatter
			  
			  #if TargetMacOS
			    declare function longEraSymbols lib CocoaLib selector "longEraSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = longEraSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the long era symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setLongEraSymbols lib CocoaLib selector "setLongEraSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setLongEraSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		LongEraSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function monthSymbols lib CocoaLib selector "monthSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = monthSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setMonthSymbols lib CocoaLib selector "setMonthSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setMonthSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		MonthSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the PM symbol for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function PMSymbol lib CocoaLib selector "PMSymbol" (obj_id as Ptr) as CFStringRef
			    
			    return PMSymbol(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the PM symbol for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setPMSymbol lib CocoaLib selector "setPMSymbol:" (obj_id as Ptr, aString as CFStringRef)
			    
			    setPMSymbol self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		PMSymbol As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the quarter symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function quarterSymbols lib CocoaLib selector "quarterSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = quarterSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the quarter symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setQuarterSymbols lib CocoaLib selector "setQuarterSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setQuarterSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		QuarterSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the array of short month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function shortMonthSymbols lib CocoaLib selector "shortMonthSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = shortMonthSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the short month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setShortMonthSymbols lib CocoaLib selector "setShortMonthSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setShortMonthSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ShortMonthSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the short quarter symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function shortQuarterSymbols lib CocoaLib selector "shortQuarterSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = shortQuarterSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the short quarter symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setShortQuarterSymbols lib CocoaLib selector "setShortQuarterSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setShortQuarterSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ShortQuarterSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the short standalone month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function shortStandaloneMonthSymbols lib CocoaLib selector "shortStandaloneMonthSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = shortStandaloneMonthSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the short standalone month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setShortStandaloneMonthSymbols lib CocoaLib selector "setShortStandaloneMonthSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setShortStandaloneMonthSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ShortStandaloneMonthSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the short standalone quarter symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function shortStandaloneQuarterSymbols lib CocoaLib selector "shortStandaloneQuarterSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = shortStandaloneQuarterSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the short standalone quarter symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setShortStandaloneQuarterSymbols lib CocoaLib selector "setShortStandaloneQuarterSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setShortStandaloneQuarterSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ShortStandaloneQuarterSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the array of short standalone weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function shortStandaloneWeekdaySymbols lib CocoaLib selector "shortStandaloneWeekdaySymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = shortStandaloneWeekdaySymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the short standalone weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setShortStandaloneWeekdaySymbols lib CocoaLib selector "setShortStandaloneWeekdaySymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setShortStandaloneWeekdaySymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ShortStandaloneWeekdaySymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the array of short weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function shortWeekdaySymbols lib CocoaLib selector "shortWeekdaySymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = shortWeekdaySymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the short weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setShortWeekdaySymbols lib CocoaLib selector "setShortWeekdaySymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setShortWeekdaySymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		ShortWeekdaySymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the standalone month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function standaloneMonthSymbols lib CocoaLib selector "standaloneMonthSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = standaloneMonthSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the standalone month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setStandaloneMonthSymbols lib CocoaLib selector "setStandaloneMonthSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setStandaloneMonthSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		StandaloneMonthSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the standalone quarter symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function standaloneQuarterSymbols lib CocoaLib selector "standaloneQuarterSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = standaloneQuarterSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the standalone quarter symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setStandaloneQuarterSymbols lib CocoaLib selector "setStandaloneQuarterSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setStandaloneQuarterSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		StandaloneQuarterSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the array of standalone weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function standaloneWeekdaySymbols lib CocoaLib selector "standaloneWeekdaySymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = standaloneWeekdaySymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the standalone weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setStandaloneWeekdaySymbols lib CocoaLib selector "setStandaloneWeekdaySymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setStandaloneWeekdaySymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		StandaloneWeekdaySymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the time style of the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function timeStyle lib CocoaLib selector "timeStyle" (obj_id as Ptr) as NSDateFormatterStyle
			    
			    return timeStyle(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the time style of the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setTimeStyle lib CocoaLib selector "setTimeStyle:" (obj_id as Ptr, style as NSDateFormatterStyle)
			    
			    setTimeStyle self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TimeStyle As NSDateFormatterStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the time zone for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function timeZone lib CocoaLib selector "timeZone" (obj_id as Ptr) as Ptr
			    
			    dim tzRef as Ptr = timeZone(self)
			    if tzRef <> nil then
			      return new NSTimeZone(tzRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the time zone for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setTimeZone lib CocoaLib selector "setTimeZone:" (obj_id as Ptr, aTimeZone as Ptr)
			    
			    dim tzRef as Ptr
			    if value <> nil then
			      tzRef = value
			    end if
			    
			    setTimeZone self, tzRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TimeZone As NSTimeZone
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the earliest date that can be denoted by a two-digit year specifier.
			  
			  //@discussion: If the two-digit start date is set to January 6, 1976, _
			  // then “January 1, 76” is interpreted as New Year's Day in 2076, _
			  // whereas “February 14, 76” is interpreted as Valentine's Day in 1976. _
			  // The default date is December 31, 1949.
			  
			  #if TargetMacOS
			    declare function twoDigitStartDate lib CocoaLib selector "twoDigitStartDate" (obj_id as Ptr) as Ptr
			    
			    dim dateRef as Ptr = twoDigitStartDate(self)
			    if dateRef <> nil then
			      return new NSDate(dateRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the two-digit start date for the NSDateFormatter.
			  
			  //@param value: The earliest date that can be denoted by a two-digit year specifier.
			  
			  #if TargetMacOS
			    declare sub setTwoDigitStartDate lib CocoaLib selector "setTwoDigitStartDate:" (obj_id as Ptr, aDate as Ptr)
			    
			    dim dateRef as Ptr
			    if value <> nil then
			      dateRef = value
			    end if
			    
			    setTwoDigitStartDate self, dateRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TwoDigitStartDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the very short month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function veryShortMonthSymbols lib CocoaLib selector "veryShortMonthSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = veryShortMonthSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the very short month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setVeryShortMonthSymbols lib CocoaLib selector "setVeryShortMonthSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setVeryShortMonthSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		VeryShortMonthSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the very short month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function veryShortStandaloneMonthSymbols lib CocoaLib selector "veryShortStandaloneMonthSymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = veryShortStandaloneMonthSymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the very short standalone month symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setVeryShortStandaloneMonthSymbols lib CocoaLib selector "setVeryShortStandaloneMonthSymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setVeryShortStandaloneMonthSymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		VeryShortStandaloneMonthSymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the array of very short standalone weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function veryShortStandaloneWeekdaySymbols lib CocoaLib selector "veryShortStandaloneWeekdaySymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = veryShortStandaloneWeekdaySymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the short standalone weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setVeryShortStandaloneWeekdaySymbols lib CocoaLib selector "setVeryShortStandaloneWeekdaySymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setVeryShortStandaloneWeekdaySymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		VeryShortStandaloneWeekdaySymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the array of very short weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function veryShortWeekdaySymbols lib CocoaLib selector "veryShortWeekdaySymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = veryShortWeekdaySymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the vert short weekday symbols for the NSDateFormatter
			  
			  #if TargetMacOS
			    declare sub setVeryShortWeekdaySymbols lib CocoaLib selector "setVeryShortWeekdaySymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setVeryShortWeekdaySymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		VeryShortWeekdaySymbols As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the array of weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare function weekdaySymbols lib CocoaLib selector "weekdaySymbols" (obj_id as Ptr) as Ptr
			    
			    dim arrayRef as Ptr = weekdaySymbols(self)
			    if arrayRef <> nil then
			      return new NSArray(arrayRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the weekday symbols for the NSDateFormatter.
			  
			  #if TargetMacOS
			    declare sub setWeekdaySymbols lib CocoaLib selector "setWeekdaySymbols:" (obj_id as Ptr, anArray as Ptr)
			    
			    dim arrayRef as Ptr
			    if value <> nil then
			      arrayRef = value
			    end if
			    
			    setWeekdaySymbols self, arrayRef
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		WeekdaySymbols As NSArray
	#tag EndComputedProperty


	#tag Enum, Name = NSDateFormatterBehavior, Flags = &h0
		NSDateFormatterBehaviorDefault = 0
		  NSDateFormatterBehavior10_0 = 1000
		NSDateFormatterBehavior10_4 = 1040
	#tag EndEnum

	#tag Enum, Name = NSDateFormatterStyle, Flags = &h0
		NSDateFormatterNoStyle
		  NSDateFormatterShortStyle
		  NSDateFormatterMediumStyle
		  NSDateFormatterLongStyle
		NSDateFormatterFullStyle
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowsNaturalLanguage"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AMSymbol"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DateFormat"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DateStyle"
			Group="Behavior"
			Type="NSDateFormatterStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSDateFormatterNoStyle"
				"1 - NSDateFormatterShortStyle"
				"2 - NSDateFormatterMediumStyle"
				"3 - NSDateFormatterLongStyle"
				"4 - NSDateFormatterFullStyle"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoesRelativeDateFormatting"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FormatterBehavior"
			Group="Behavior"
			Type="NSDateFormatterBehavior"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSDateFormatterBehaviorDefault"
				"1000 - NSDateFormatterBehavior10_0"
				"1040 - NSDateFormatterBehavior10_4"
			#tag EndEnumValues
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
			Name="Lenient"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PMSymbol"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeStyle"
			Group="Behavior"
			Type="NSDateFormatterStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSDateFormatterNoStyle"
				"1 - NSDateFormatterShortStyle"
				"2 - NSDateFormatterMediumStyle"
				"3 - NSDateFormatterLongStyle"
				"4 - NSDateFormatterFullStyle"
			#tag EndEnumValues
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

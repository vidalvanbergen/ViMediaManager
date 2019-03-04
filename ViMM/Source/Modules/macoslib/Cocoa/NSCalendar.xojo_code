#tag Class
Class NSCalendar
Inherits NSObject
	#tag Method, Flags = &h1000
		Shared Function AutoupdatingCurrentCalendar() As NSCalendar
		  //# Returns the current logical calendar for the current user.
		  
		  #if TargetMacOS
		    declare function autoupdatingCurrentCalendar lib CocoaLib selector "autoupdatingCurrentCalendar" (class_id as Ptr) as Ptr
		    
		    dim calendarRef as Ptr = autoupdatingCurrentCalendar(ClassRef)
		    if calendarRef <> nil then
		      return new NSCalendar(calendarRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSCalendar")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Components(unitFlags as UInt32, aDate as NSDate) As NSDateComponents
		  //# Returns a NSDateComponents object containing a given date decomposed into specified components.
		  
		  #if targetMacOS
		    declare function components lib CocoaLib selector "components:fromDate:" (obj_id as Ptr, unitFlags as UInt32, aDate as Ptr) as Ptr
		    
		    dim dateRef as Ptr
		    if aDate <> nil then
		      dateRef = aDate
		    end if
		    
		    dim componentsRef as Ptr = components(self, unitFlags, dateRef)
		    
		    if componentsRef <> nil then
		      return new NSDateComponents(componentsRef)
		    end if
		    
		  #else
		    #pragma unused unitFlags
		    #pragma unused aDate
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Components(unitFlags as UInt32, fromDate as NSDate, toDate as NSDate) As NSDateComponents
		  //# Returns, as an NSDateComponents object using specified components, the difference between two supplied dates.
		  
		  #if targetMacOS
		    declare function components lib CocoaLib selector "components:fromDate:toDate:options:" (obj_id as Ptr, unitFlags as UInt32, fromDate as Ptr, toDate as Ptr) as Ptr
		    
		    dim fromDateRef as Ptr
		    if fromDate <> nil then
		      fromDateRef = fromDate
		    end if
		    
		    dim toDateRef as Ptr
		    if toDate <> nil then
		      toDateRef = toDate
		    end if
		    
		    dim componentsRef as Ptr = components(self, unitFlags, fromDateRef, toDateRef)
		    
		    if componentsRef <> nil then
		      return new NSDateComponents(componentsRef)
		    end if
		    
		  #else
		    #pragma unused unitFlags
		    #pragma unused fromDate
		    #pragma unused toDate
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aString as String)
		  //# Initializes a newly-allocated NSCalendar object for the calendar specified by a given identifier.
		  
		  //@param aString = The identifier for the new calendar. For valid identifiers, see NSLocale.
		  
		  //@ The initialized calendar, or nil if the identifier is unknown (if, for example, it is either an _
		  //  unrecognized string or the calendar is not supported by the current version of the operating system).
		  
		  #if targetMacOS
		    declare function initWithCalendarIdentifier lib CocoaLib selector "initWithCalendarIdentifier:" (obj_id as Ptr, aString as CFstringRef) as Ptr
		    
		    super.Constructor(initWithCalendarIdentifier(Allocate("NSCalendar"), aString), NSCalendar.hasOwnership)
		  #else
		    #pragma unused aString
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CurrentCalendar() As NSCalendar
		  //# Returns the logical calendar for the current user.
		  
		  //@ The returned calendar is formed from the settings for the current user’s chosen system locale _
		  //  overlaid with any custom settings the user has specified in System Preferences. Settings you _
		  //  get from this calendar do not change as System Preferences are changed, so that your operations _
		  //  are consistent (contrast with autoupdatingCurrentCalendar).
		  
		  #if TargetMacOS
		    declare function currentCalendar lib CocoaLib selector "currentCalendar" (class_id as Ptr) as Ptr
		    
		    dim calendarRef as Ptr = currentCalendar(ClassRef)
		    if calendarRef <> nil then
		      return new NSCalendar(calendarRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function DateByAddingComponents(comps as NSDateComponents, aDate as NSDate, options as UInt32) As NSDate
		  //# Returns a new NSDate object representing the absolute time calculated by adding given components to a given date.
		  
		  #if targetMacOS
		    declare function dateByAddingComponents lib CocoaLib selector "dateByAddingComponents:toDate:options:" (obj_id as Ptr, comps as Ptr, aDate as Ptr, options as UInt32) as Ptr
		    
		    dim compsRef as Ptr
		    if comps <> nil then
		      compsRef = comps
		    end if
		    
		    dim aDateRef as Ptr
		    if aDate <> nil then
		      aDateRef = aDate
		    end if
		    
		    dim dateRef as Ptr = dateByAddingComponents(self, compsRef, aDateRef, options)
		    
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #else
		    #pragma unused comps
		    #pragma unused aDate
		    #pragma unused options
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function DateFromComponents(comps as NSDateComponents) As NSDate
		  //# Returns a new NSDate object representing the absolute time calculated from given components.
		  
		  #if targetMacOS
		    declare function dateFromComponents lib CocoaLib selector "dateFromComponents:" (obj_id as Ptr, comps as Ptr) as Ptr
		    
		    dim compsRef as Ptr
		    if comps <> nil then
		      compsRef = comps
		    end if
		    
		    dim dateRef as Ptr = dateFromComponents(self, compsRef)
		    
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #else
		    #pragma unused comps
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function MaximumRangeOfUnit(unit as UInt32) As Cocoa.NSRange
		  //# The maximum range limits of the values that a given unit can take on in the receive
		  
		  #if targetMacOS
		    declare function maximumRangeOfUnit lib CocoaLib selector "maximumRangeOfUnit:" (obj_id as Ptr, unit as UInt32) as Cocoa.NSRange
		    
		    return maximumRangeOfUnit(self, unit)
		  #else
		    #pragma unused unit
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function MinimumRangeOfUnit(unit as UInt32) As Cocoa.NSRange
		  //# Returns the minimum range limits of the values that a given unit can take on in the NSCalendar.
		  
		  #if targetMacOS
		    declare function minimumRangeOfUnit lib CocoaLib selector "minimumRangeOfUnit:" (obj_id as Ptr, unit as UInt32) as Cocoa.NSRange
		    
		    return minimumRangeOfUnit(self, unit)
		  #else
		    #pragma unused unit
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function OrdinalityOfUnit(smaller as UInt32, larger as UInt32, aDate as NSDate) As UInt32
		  //# Returns, for a given absolute time, the ordinal number of a smaller calendar unit (such as a day) within a specified larger calendar unit (such as a week).
		  
		  #if targetMacOS
		    declare function ordinalityOfUnit lib CocoaLib selector "ordinalityOfUnit:inUnit:forDate:" (obj_id as Ptr, smaller as UInt32, larger as UInt32, aDate as Ptr) as UInt32
		    
		    dim dateRef as Ptr
		    if aDate <> nil then
		      dateRef = aDate
		    end if
		    
		    return ordinalityOfUnit(self, smaller, larger, dateRef)
		  #else
		    #pragma unused smaller
		    #pragma unused larger
		    #pragma unused aDate
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function RangeOfUnit(smaller as UInt32, larger as UInt32, aDate as NSDate) As Cocoa.NSRange
		  //# Returns the range of absolute time values that a smaller calendar unit (such as a day) can take on in a larger calendar unit (such as a month) that includes a specified absolute time.
		  
		  #if targetMacOS
		    declare function rangeOfUnit lib CocoaLib selector "rangeOfUnit:inUnit:forDate:" (obj_id as Ptr, smaller as UInt32, larger as UInt32, aDate as Ptr) as Cocoa.NSRange
		    
		    dim dateRef as Ptr
		    if aDate <> nil then
		      dateRef = aDate
		    end if
		    
		    return rangeOfUnit(self, smaller, larger, dateRef)
		  #else
		    #pragma unused smaller
		    #pragma unused larger
		    #pragma unused aDate
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Overview
		
		Calendars encapsulate information about systems of reckoning time in which the beginning, length,
		and divisions of a year are defined. They provide information about the calendar and support for
		calendrical computations such as determining the range of a given calendrical unit and adding units
		to a given absolute time.
		
		In a calendar, day, week, weekday, month, and year numbers are generally 1-based, but there may be
		calendar-specific exceptions. Ordinal numbers, where they occur, are 1-based. Some calendars
		represented by this API may have to map their basic unit concepts into year/month/week/day/… nomenclature.
		For example, a calendar composed of 4 quarters in a year instead of 12 months uses the month unit
		to represent quarters. The particular values of the unit are defined by each calendar, and are not
		necessarily consistent with values for that unit in another calendar.
		
		To do calendar arithmetic, you use NSDate objects in conjunction with a calendar. For example, to
		convert between a decomposed date in one calendar and another calendar, you must first convert the
		decomposed elements into a date using the first calendar, then decompose it using the second.
		NSDate provides the absolute scale and epoch (reference point) for dates and times, which can then
		be rendered into a particular calendar, for calendrical computations or user display.
		
		Two NSCalendar methods that return a date object, dateFromComponents:, dateByAddingComponents:toDate:options:,
		take as a parameter an NSDateComponents object that describes the calendrical components required for the
		computation. You can provide as many components as you need (or choose to). When there is incomplete
		information to compute an absolute time, default values similar to 0 and 1 are usually chosen by a calendar,
		but this is a calendar-specific choice. If you provide inconsistent information, calendar-specific
		disambiguation is performed (which may involve ignoring one or more of the parameters). Related methods
		(components:fromDate: and components:fromDate:toDate:options:) take a bit mask parameter that specifies which
		components to calculate when returning an NSDateComponents object. The bit mask is composed of NSCalendarUnit
		constants (see “Constants”).
		
		NSCalendar is “toll-free bridged” with its Core Foundation counterpart, CFCalendarRef. See “Toll-Free Bridging”
		for more information on toll-free bridging.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the index of the first weekday of the NSCalendar.
			  
			  #if targetMacOS
			    declare function firstWeekday lib CocoaLib selector "firstWeekday" (obj_id as Ptr) as UInt32
			    
			    return firstWeekday(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the index of the first weekday for the NSCalendar.
			  
			  #if targetMacOS
			    declare sub setFirstWeekday lib CocoaLib selector "setFirstWeekday:" (obj_id as Ptr, weekday as UInt32)
			    
			    setFirstWeekday self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		FirstWeekday As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the identifier for the NSCalendar.
			  
			  #if targetMacOS
			    declare function calendarIdentifier lib CocoaLib selector "calendarIdentifier" (obj_id as Ptr) as CFStringRef
			    
			    return calendarIdentifier(self)
			  #endif
			End Get
		#tag EndGetter
		Identifier As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the locale for the NSCalendar.
			  
			  #if targetMacOS
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
			  //# Sets the locale for the NSCalendar.
			  
			  #if targetMacOS
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
			  //# Returns the minimum number of days in the first week of the NSCalendar.
			  
			  #if targetMacOS
			    declare function minimumDaysInFirstWeek lib CocoaLib selector "minimumDaysInFirstWeek" (obj_id as Ptr) as UInt32
			    
			    return minimumDaysInFirstWeek(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the minimum number of days in the first week of the NSCalendar.
			  
			  #if targetMacOS
			    declare sub setMinimumDaysInFirstWeek lib CocoaLib selector "setMinimumDaysInFirstWeek:" (obj_id as Ptr, mdw as UInt32)
			    
			    setMinimumDaysInFirstWeek self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		MinimumDaysInFirstWeek As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the time zone for the NSCalendar.
			  
			  #if targetMacOS
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
			  //# Sets the time zone for the NSCalendar.
			  
			  #if targetMacOS
			    declare sub setTimeZone lib CocoaLib selector "setTimeZone:" (obj_id as Ptr, tz as Ptr)
			    
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


	#tag Constant, Name = NSCalendarCalendarUnit, Type = Double, Dynamic = False, Default = \"1048576", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSDayCalendarUnit, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSEraCalendarUnit, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSHourCalendarUnit, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMinuteCalendarUnit, Type = Double, Dynamic = False, Default = \"64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSMonthCalendarUnit, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSQuarterCalendarUnit, Type = Double, Dynamic = False, Default = \"2048", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSSecondCalendarUnit, Type = Double, Dynamic = False, Default = \"128", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTimeZoneCalendarUnit, Type = Double, Dynamic = False, Default = \"2097152", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWeekCalendarUnit, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWeekdayCalendarUnit, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWeekdayOrdinalCalendarUnit, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWeekOfMonthCalendarUnit, Type = Double, Dynamic = False, Default = \"4096", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWeekOfYearCalendarUnit, Type = Double, Dynamic = False, Default = \"8192", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWrapCalendarComponents, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSYearCalendarUnit, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSYearForWeekOfYearCalendarUnit, Type = Double, Dynamic = False, Default = \"16384", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FirstWeekday"
			Group="Behavior"
			Type="UInt32"
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
			Name="MinimumDaysInFirstWeek"
			Group="Behavior"
			Type="UInt32"
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

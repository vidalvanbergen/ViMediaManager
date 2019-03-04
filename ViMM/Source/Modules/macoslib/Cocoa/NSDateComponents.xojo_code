#tag Class
Class NSDateComponents
Inherits NSObject
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the calendar of the NSDateComponents.
			  
			  #if targetMacOS
			    if IsLion then
			      declare function calendar lib CocoaLib selector "calendar" (obj_id as Ptr) as Ptr
			      
			      dim calendarRef as Ptr = calendar(self)
			      if calendarRef <> nil then
			        return new NSCalendar(calendarRef)
			      end if
			      
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the NSDateComponents calendar.
			  
			  #if targetMacOS
			    declare sub setCalendar lib CocoaLib selector "setCalendar:" (obj_id as Ptr, cal as Ptr)
			    
			    dim calRef as Ptr
			    if value <> nil then
			      calRef = value
			    end if
			    
			    setCalendar self, calRef
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
			  //# Returns the date of the NSDateCompnents.
			  
			  #if targetMacOS
			    if IsLion then
			      declare function date_ lib CocoaLib selector "date" (obj_id as Ptr) as Ptr
			      
			      dim dateRef as Ptr = date_(self)
			      if dateRef <> nil then
			        return new NSDate(dateRef)
			      end if
			      
			    end if
			  #endif
			End Get
		#tag EndGetter
		DateComponent As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of day units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function day lib CocoaLib selector "day" (obj_id as Ptr) as Integer
			    
			    return day(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of day units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setDay lib CocoaLib selector "setDay:" (obj_id as Ptr, v as Integer)
			    
			    setDay self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Day As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of era units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function era lib CocoaLib selector "era" (obj_id as Ptr) as Integer
			    
			    return era(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of era units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setEra lib CocoaLib selector "setEra:" (obj_id as Ptr, v as Integer)
			    
			    setEra self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Era As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of hour units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function hour lib CocoaLib selector "hour" (obj_id as Ptr) as Integer
			    
			    return hour(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of hour units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setHour lib CocoaLib selector "setHour:" (obj_id as Ptr, v as Integer)
			    
			    setHour self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Hour As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns whether the month is a leap month.
			  
			  #if targetMacOS
			    declare function isLeapMonth lib CocoaLib selector "isLeapMonth" (obj_id as Ptr) as Boolean
			    
			    return isLeapMonth(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the month as a leap month.
			  
			  #if targetMacOS
			    declare sub setLeapMonth lib CocoaLib selector "setLeapMonth:" (obj_id as Ptr, v as Boolean)
			    
			    setLeapMonth self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		isLeapMonth As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of minute units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function minute lib CocoaLib selector "minute" (obj_id as Ptr) as Integer
			    
			    return minute(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of minute units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setMinute lib CocoaLib selector "setMinute:" (obj_id as Ptr, v as Integer)
			    
			    setMinute self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Minute As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of month units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function month lib CocoaLib selector "month" (obj_id as Ptr) as Integer
			    
			    return month(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of month units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setMonth lib CocoaLib selector "setMonth:" (obj_id as Ptr, v as Integer)
			    
			    setMonth self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Month As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of quarters in the calendar.
			  
			  #if targetMacOS
			    if IsSnowLeopard then
			      declare function quarter lib CocoaLib selector "quarter" (obj_id as Ptr) as Integer
			      
			      return quarter(self)
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of quarters in the calendar.
			  
			  #if targetMacOS
			    if IsLion then
			      declare sub setQuarter lib CocoaLib selector "setQuarter:" (obj_id as Ptr, v as Integer)
			      
			      setQuarter self, value
			    end if
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Quarter As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of second units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function second lib CocoaLib selector "second" (obj_id as Ptr) as Integer
			    
			    return second(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of second units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setSecond lib CocoaLib selector "setSecond:" (obj_id as Ptr, v as Integer)
			    
			    setSecond self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Second As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the NSDateComponents’s time zone.
			  
			  #if targetMacOS
			    if IsLion then
			      declare function timeZone lib CocoaLib selector "timeZone" (obj_id as Ptr) as Ptr
			      
			      dim tzRef as Ptr = timeZone(self)
			      if tzRef <> nil then
			        return new NSTimeZone(tzRef)
			      end if
			      
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the NSDateComponents’s time zone.
			  
			  #if targetMacOS
			    if IsLion then
			      declare sub setTimeZone lib CocoaLib selector "setTimeZone:" (obj_id as Ptr, cal as Ptr)
			      
			      dim tzRef as Ptr
			      if value <> nil then
			        tzRef = value
			      end if
			      
			      setTimeZone self, tzRef
			    end if
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
			  //# Returns the number of week units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function week lib CocoaLib selector "week" (obj_id as Ptr) as Integer
			    
			    return week(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of week units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setWeek lib CocoaLib selector "setWeek:" (obj_id as Ptr, v as Integer)
			    
			    setWeek self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Week As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of weekday units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function weekday lib CocoaLib selector "weekday" (obj_id as Ptr) as Integer
			    
			    return weekday(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of weekday units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setWeekday lib CocoaLib selector "setWeekday:" (obj_id as Ptr, v as Integer)
			    
			    setWeekday self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Weekday As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the ordinal number of weekday units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function weekdayOrdinal lib CocoaLib selector "weekdayOrdinal" (obj_id as Ptr) as Integer
			    
			    return weekdayOrdinal(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the ordinal number of weekday units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setWeekdayOrdinal lib CocoaLib selector "setWeekdayOrdinal:" (obj_id as Ptr, v as Integer)
			    
			    setWeekdayOrdinal self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		WeekdayOrdinal As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the week of the month.
			  
			  #if targetMacOS
			    if IsLion then
			      declare function weekOfMonth lib CocoaLib selector "weekOfMonth" (obj_id as Ptr) as Integer
			      
			      return weekOfMonth(self)
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the week of the month.
			  
			  #if targetMacOS
			    if IsLion then
			      declare sub setWeekOfMonth lib CocoaLib selector "setWeekOfMonth:" (obj_id as Ptr, v as Integer)
			      
			      setWeekOfMonth self, value
			    end if
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		WeekOfMonth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the week of the year.
			  
			  #if targetMacOS
			    if IsLion then
			      declare function weekOfYear lib CocoaLib selector "weekOfYear" (obj_id as Ptr) as Integer
			      
			      return weekOfYear(self)
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the week of the year.
			  
			  #if targetMacOS
			    declare sub setWeekOfYear lib CocoaLib selector "setWeekOfYear:" (obj_id as Ptr, v as Integer)
			    
			    setWeekOfYear self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		WeekOfYear As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of year units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare function year lib CocoaLib selector "year" (obj_id as Ptr) as Integer
			    
			    return year(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the number of year units for the NSDateComponents.
			  
			  #if targetMacOS
			    declare sub setYear lib CocoaLib selector "setYear:" (obj_id as Ptr, v as Integer)
			    
			    setYear self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Year As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the year for the week of the year.
			  
			  #if targetMacOS
			    if IsLion then
			      declare function yearForWeekOfYear lib CocoaLib selector "yearForWeekOfYear" (obj_id as Ptr) as Integer
			      
			      return yearForWeekOfYear(self)
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the year for the week of the year.
			  
			  #if targetMacOS
			    if IsLion then
			      declare sub setYearForWeekOfYear lib CocoaLib selector "setYearForWeekOfYear:" (obj_id as Ptr, v as Integer)
			      
			      setYearForWeekOfYear self, value
			    end if
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		YearForWeekOfYear As Integer
	#tag EndComputedProperty


	#tag Constant, Name = NSUndefinedDateComponent, Type = Double, Dynamic = False, Default = \"&h7fffffff", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Day"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Era"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hour"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isLeapMonth"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Minute"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Month"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Quarter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Second"
			Group="Behavior"
			Type="Integer"
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
		#tag ViewProperty
			Name="Week"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Weekday"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WeekdayOrdinal"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WeekOfMonth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WeekOfYear"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Year"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="YearForWeekOfYear"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

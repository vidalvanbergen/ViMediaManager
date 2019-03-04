#tag Class
Class NSDate
Inherits NSObject
	#tag Method, Flags = &h1000
		Function AddTimeInterval(seconds as Double) As NSDate
		  //# Returns a new NSDate object that is set to a given number of seconds relative to the NSDate.
		  
		  //@param seconds: The number of seconds to add to the NSDate. Use a negative value for seconds to have the returned object specify a date before the NSDate.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function dateByAddingTimeInterval lib CocoaLib selector "dateByAddingTimeInterval:" (obj_id as Ptr, seconds as Double) as Ptr
		      
		      dim dateRef as Ptr = dateByAddingTimeInterval(self, seconds)
		      if dateRef <> nil then
		        return new NSDate(dateRef)
		      end if
		      
		    end if
		  #else
		    #pragma unused seconds
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSDate")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(anotherDate as NSDate) As Cocoa.NSComparisonResult
		  //# Returns an NSComparisonResult value that indicates the temporal ordering of the NSDate and another given date.
		  
		  //@return: _
		  // The NSDate and anotherDate are exactly equal to each other, NSOrderedSame. (0) _
		  // The NSDate is later in time than anotherDate, NSOrderedDescending. (1)_
		  // The NSDate is earlier in time than anotherDate, NSOrderedAscending. (-1)
		  
		  #if targetMacOS
		    declare function compare lib CocoaLib selector "compare:" (obj_id as Ptr, anotherDate as Ptr) as Cocoa.NSComparisonResult
		    
		    dim anotherDateRef as Ptr
		    if anotherDate <> nil then
		      anotherDateRef = anotherDate
		    end if
		    
		    return compare(self, anotherDateRef)
		  #else
		    #pragma unused anotherDate
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize(Allocate("NSDate")), NSDate.hasOwnership)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Date)
		  //# Creates and returns an NSDate object set to the given number of seconds from the first instant of 1 January 1970, GMT.
		  
		  #if targetMacOS
		    declare function dateWithTimeIntervalSince1970 lib CocoaLib selector "dateWithTimeIntervalSince1970:" (class_id as Ptr, seconds as Double) as Ptr
		    
		    dim d as new Date
		    d.SQLDateTime = "1970-01-01 00:00:00"
		    dim seconds as Double = value.TotalSeconds - d.TotalSeconds - 3600.0*value.GMTOffset
		    
		    super.Constructor(dateWithTimeIntervalSince1970( Cocoa.NSClassFromString( "NSDate" ), seconds ))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(secondsSinceNow as Double)
		  //# Returns an NSDate object initialized relative to the current date and time by a given number of seconds.
		  
		  //@param secondsSinceNow: The number of seconds from relative to the current date and time to which the NSDate should be initialized. _
		  // A negative value means the returned object will represent a date in the past.
		  
		  #if targetMacOS
		    declare function initWithTimeIntervalSinceNow lib CocoaLib selector "initWithTimeIntervalSinceNow:" (obj_id as Ptr, seconds as Double) as Ptr
		    
		    super.Constructor(initWithTimeIntervalSinceNow(Allocate("NSDate"), secondsSinceNow), NSDate.hasOwnership)
		  #else
		    #pragma unused secondsSinceNow
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(seconds as Double, sinceDate as NSDate)
		  //# Returns an NSDate object initialized relative to another given date by a given number of seconds.
		  
		  #if targetMacOS
		    declare function initWithTimeInterval lib CocoaLib selector "initWithTimeInterval:sinceDate:" (obj_id as Ptr, seconds as Double, refDate as Ptr) as Ptr
		    
		    dim sinceDateRef as Ptr
		    if sinceDate <> nil then
		      sinceDateRef = sinceDate
		    end if
		    
		    super.Constructor(initWithTimeInterval(Allocate("NSDate"), seconds, sinceDateRef), NSDate.hasOwnership)
		  #else
		    #pragma unused seconds
		    #pragma unused sinceDate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DateSince(seconds as Double, sinceDate as NSDate) As NSDate
		  //# Creates and returns an NSDate object set to a given number of seconds from the specified date.
		  
		  #if targetMacOS
		    if IsSnowLeopard then
		      declare function dateWithTimeInterval lib CocoaLib selector "dateWithTimeInterval:sinceDate:" (class_id as Ptr, seconds as Double, sinceDate as Ptr) as Ptr
		      
		      dim sinceRef as Ptr
		      if sinceDate <> nil then
		        sinceRef = sinceDate
		      end if
		      
		      dim dateRef as Ptr = dateWithTimeInterval(ClassRef, seconds, sinceRef)
		      if dateRef <> nil then
		        return new NSDate(dateRef)
		      end if
		      
		    end if
		  #else
		    #pragma unused seconds
		    #pragma unused sinceDate
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DateSince1970(seconds as Double) As NSDate
		  //# Creates and returns an NSDate object set to the given number of seconds from the first instant of 1 January 1970, GMT.
		  
		  #if targetMacOS
		    declare function dateWithTimeIntervalSince1970 lib CocoaLib selector "dateWithTimeIntervalSince1970:" (class_id as Ptr, seconds as Double) as Ptr
		    
		    dim dateRef as Ptr = dateWithTimeIntervalSince1970(ClassRef, seconds)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #else
		    #pragma unused seconds
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DateSinceNow(seconds as Double) As NSDate
		  //# Creates and returns an NSDate object set to a given number of seconds from the current date and time.
		  
		  #if targetMacOS
		    declare function dateWithTimeIntervalSinceNow lib CocoaLib selector "dateWithTimeIntervalSinceNow:" (class_id as Ptr, seconds as Double) as Ptr
		    
		    dim dateRef as Ptr = dateWithTimeIntervalSinceNow(ClassRef, seconds)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #else
		    #pragma unused seconds
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DateSinceReference(seconds as Double) As NSDate
		  //# Creates and returns an NSDate object set to a given number of seconds from the first instant of 1 January 2001, GMT.
		  
		  #if targetMacOS
		    declare function dateWithTimeIntervalSinceReferenceDate lib CocoaLib selector "dateWithTimeIntervalSinceReferenceDate:" (class_id as Ptr, seconds as Double) as Ptr
		    
		    dim dateRef as Ptr = dateWithTimeIntervalSinceReferenceDate(ClassRef, seconds)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #else
		    #pragma unused seconds
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Description(locale as NSLocale) As String
		  //# Returns a string representation of the NSDate using the given locale.
		  
		  #if targetMacOS
		    declare function descriptionWithLocale lib CocoaLib selector "descriptionWithLocale:" (obj_id as Ptr, locale as Ptr) as CFStringRef
		    
		    dim localeRef as Ptr
		    if locale <> nil then
		      localeRef = locale
		    end if
		    
		    return descriptionWithLocale(self, localeRef)
		  #else
		    #pragma unused locale
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Description(formatString as String, aTimeZone as NSTimeZone, localeDictionary as NSDictionary) As String
		  //# Returns a string representation of the NSDate, formatted as specified by given conversion specifiers.
		  
		  #if targetMacOS
		    declare function descriptionWithCalendarFormat lib CocoaLib selector "descriptionWithCalendarFormat:timeZone:locale:" _
		    (obj_id as Ptr, formatString as CFStringRef, aTimeZone as Ptr, localeDictionary as Ptr) as CFStringRef
		    
		    dim tzRef as Ptr
		    if aTimeZone <> nil then
		      tzRef = aTimeZone
		    end if
		    
		    dim localeDictRef as Ptr
		    if localeDictionary <> nil then
		      localeDictRef = localeDictionary
		    end if
		    
		    return descriptionWithCalendarFormat(self, formatString, tzRef, localeDictRef)
		    
		  #else
		    #pragma unused formatString
		    #pragma unused aTimeZone
		    #pragma unused localeDictionary
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DistantFuture() As NSDate
		  //# Creates and returns an NSDate object representing a date in the distant future.
		  
		  #if targetMacOS
		    declare function distantFuture lib CocoaLib selector "distantFuture" (class_id as Ptr) as Ptr
		    
		    dim dateRef as Ptr = distantFuture(ClassRef)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DistantPast() As NSDate
		  //# Creates and returns an NSDate object representing a date in the distant past.
		  
		  #if targetMacOS
		    declare function distantPast lib CocoaLib selector "distantPast" (class_id as Ptr) as Ptr
		    
		    dim dateRef as Ptr = distantPast(ClassRef)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Earlier(anotherDate as NSDate) As NSDate
		  //# Returns the earlier of the NSDate and another given date.
		  
		  #if targetMacOS
		    declare function earlierDate lib CocoaLib selector "earlierDate:" (obj_id as Ptr, anotherDate as Ptr) as Ptr
		    
		    dim anotherDateRef as Ptr
		    if anotherDate <> nil then
		      anotherDateRef = anotherDate
		    end if
		    
		    dim earlierRef as Ptr = earlierDate(self, anotherDateRef)
		    if earlierRef <> nil then
		      if earlierRef = self.id then
		        return self
		      else
		        return anotherDate
		      end if
		    end if
		    
		  #else
		    #pragma unused anotherDate
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(anotherDate as NSDate) As Boolean
		  //# Returns a Boolean value that indicates whether a given object is an NSDate object and exactly equal the NSDate.
		  
		  #if targetMacOS
		    declare function isEqualToDate lib CocoaLib selector "isEqualToDate:" (obj_id as Ptr, anotherDate as Ptr) as Boolean
		    
		    dim anotherDateRef as Ptr
		    if anotherDate <> nil then
		      anotherDateRef = anotherDate
		    end if
		    
		    return isEqualToDate(self, anotherDateRef)
		  #else
		    #pragma unused anotherDate
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function later(anotherDate as NSDate) As NSDate
		  //# Returns the later of the NSDate and another given date.
		  
		  #if targetMacOS
		    declare function laterDate lib CocoaLib selector "laterDate:" (obj_id as Ptr, anotherDate as Ptr) as Ptr
		    
		    dim anotherDateRef as Ptr
		    if anotherDate <> nil then
		      anotherDateRef = anotherDate
		    end if
		    
		    dim laterRef as Ptr = laterDate(self, anotherDateRef)
		    if laterRef <> nil then
		      if laterRef = self.id then
		        return self
		      else
		        return anotherDate
		      end if
		    end if
		    
		  #else
		    #pragma unused anotherDate
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Now() As NSDate
		  //# Creates and returns a new date set to the current date and time.
		  
		  #if targetMacOS
		    soft declare function date lib CocoaLib selector "date" (class_id as Ptr) as Ptr
		    
		    return new NSDate(date(Cocoa.NSClassFromString("NSDate")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Date
		  #if targetMacOS
		    //Returns the interval between the NSDate and the first instant of 1 January 1970, GMT.
		    declare function timeIntervalSince1970 lib CocoaLib selector "timeIntervalSince1970" (id as Ptr) as Double
		    
		    dim d as new Date
		    d.SQLDateTime = "1970-01-01 00:00:00"
		    d.TotalSeconds = d.TotalSeconds + timeIntervalSince1970(self.id) + 3600.0*d.GMTOffset
		    return d
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Operator_Convert(value as Date)
		  
		  self.Constructor(value)
		  
		  '#if targetMacOS
		  'declare function dateWithTimeIntervalSince1970 lib CocoaLib selector "dateWithTimeIntervalSince1970:" (class_id as Ptr, seconds as Double) as Ptr
		  '
		  'dim d as new Date
		  'd.SQLDateTime = "1970-01-01 00:00:00"
		  'dim seconds as Double = value.TotalSeconds - d.TotalSeconds - 3600.0*value.GMTOffset
		  'dim p as Ptr = dateWithTimeIntervalSince1970(Cocoa.NSClassFromString("NSDate"), seconds)
		  'super.Constructor(p)
		  '#endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeInterval() As Double
		  //# Returns the interval between the NSDate and the current date and time.
		  
		  #if targetMacOS
		    declare function timeIntervalSinceNow lib CocoaLib selector "timeIntervalSinceNow" (obj_id as Ptr) as Double
		    
		    return timeIntervalSinceNow(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeInterval(sinceDate as NSDate) As Double
		  //# Returns the interval between the NSDate and another given date.
		  
		  #if targetMacOS
		    declare function timeIntervalSinceDate lib CocoaLib selector "timeIntervalSinceDate:" (obj_id as Ptr, anotherDate as Ptr) as Double
		    
		    dim sinceDateRef as Ptr
		    if sinceDate <> nil then
		      sinceDateRef = sinceDate
		    end if
		    
		    return timeIntervalSinceDate(self, sinceDateRef)
		  #else
		    #pragma unused sinceDate
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeIntervalSince1970() As Double
		  //# Returns the interval between the NSDate and the first instant of 1 January 1970, GMT.
		  
		  #if targetMacOS
		    declare function timeIntervalSince1970 lib CocoaLib selector "timeIntervalSince1970" (obj_id as Ptr) as Double
		    
		    return timeIntervalSince1970(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeIntervalSinceReference() As Double
		  //# Returns the interval between the first instant of 1 January 2001, GMT and the current date and time.
		  
		  #if targetMacOS
		    declare function timeIntervalSinceReferenceDate lib CocoaLib selector "timeIntervalSinceReferenceDate" (obj_id as Ptr) as Double
		    
		    return timeIntervalSinceReferenceDate(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  
		  return self.Operator_Convert //the Operator_Convert
		  
		  'dim d as Date = me //Use the Operator_Convert
		  
		  'return  d
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

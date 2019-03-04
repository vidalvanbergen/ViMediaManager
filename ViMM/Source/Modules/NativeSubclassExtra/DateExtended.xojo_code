#tag Class
Protected Class DateExtended
Inherits Date
	#tag Method, Flags = &h21
		Private Function Chop(s As String, charsToCut As Integer) As String
		  // Return s with the rightmost 'charsToCut' chars removed.
		  
		  Dim charsLeft As Integer = s.Len - charsToCut
		  if charsLeft <= 0 then return ""
		  return s.Left( s.Len - charsToCut )
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Format(Self.Year,"0000")+"-"+Format(Self.Month,"00")+"-"+Format(Self.Day,"00")+"_"+Format(Self.Hour,"00")+"-"+Format(Self.Minute,"00")+"-"+Format(Self.Second,"00")
			End Get
		#tag EndGetter
		FileTimeStamp As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			1986-02-12T01:19:21+02:00
			2004-02-12T15:59:21Z
			2010-02-12T23:19:00-03:30
			
			The formats are as follows. Exactly the components shown here must be present, with exactly this punctuation. Note that the "T" appears literally in the string, to indicate the beginning of the time element, as specified in ISO 8601.
			
			Year:
			YYYY (eg 1997)
			Year and month:
			YYYY-MM (eg 1997-07)
			Complete date:
			YYYY-MM-DD (eg 1997-07-16)
			Complete date plus hours and minutes:
			YYYY-MM-DDThh:mmTZD (eg 1997-07-16T19:20+01:00)
			Complete date plus hours, minutes and seconds:
			YYYY-MM-DDThh:mm:ssTZD (eg 1997-07-16T19:20:30+01:00)
			Complete date plus hours, minutes, seconds and a decimal fraction of a
			second
			YYYY-MM-DDThh:mm:ss.sTZD (eg 1997-07-16T19:20:30.45+01:00)
			where:
			
			YYYY = four-digit year
			MM   = two-digit month (01=January, etc.)
			DD   = two-digit day of month (01 through 31)
			hh   = two digits of hour (00 through 23) (am/pm NOT allowed)
			mm   = two digits of minute (00 through 59)
			ss   = two digits of second (00 through 59)
			s    = one or more digits representing a decimal fraction of a second
			TZD  = time zone designator (Z or +hh:mm or -hh:mm)
		#tag EndNote
		#tag Getter
			Get
			  '1986-02-12T01:19:21+02:00
			  '2004-02-12T15:59:21Z
			  '2010-02-12T23:19:00-03:30
			  dim gmtHour as Integer = Floor(self.GMTOffset)
			  dim gmtMinutes as Integer = (self.GMTOffset-gmtHour)*60
			  
			  Return Replace(Self.SQLDateTime, " ", "T")+Format(gmtHour, "+00\:;+00\:;\Z")+Format(gmtMinutes,"00")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim valuelen As Integer
			  '1986-02-12T01:19:21+02:00
			  '2004-02-12T15:59:21Z
			  '2010-02-12T23:19:00-03:30
			  value = Uppercase(value)
			  value = ReplaceAll(value, "Z", "+00:00")
			  
			  valuelen = Len(value)
			  
			  if valuelen < 22 Then
			    Select Case valuelen
			    Case 4 'YYYY
			      Self.Year = Val(value)
			      
			    Case 7 'YYYY-MM
			      Self.Year = Val(Left(value, 4))
			      Self.Month = Val(Right(value, 2))
			      
			    Case 8 to 10 'YYYY-MM-DD
			      'Self.SQLDate = value
			      Self.Year = Val(value.NthField("-",1))
			      Self.Month = Val(value.NthField("-",2))
			      Self.Day = Val(value.NthField("-",3))
			      
			    Else
			      Raise New UnsupportedFormatException
			      
			    End Select
			  Else
			    ' YYYY-MM-DDThh:mm+00:00
			    value = ReplaceAll(value, "T", " ")
			    value = Chop(value, 3)
			    
			    ' Set Time Zone
			    Self.GMTOffset = val(Right(value, 3))
			    'val(Left(Right(value, 6), 3))
			    
			    ' Remove Time Zone
			    value = Chop(value, 3)
			    
			    value = Left(value, Len(value)-InStr(value, "."))
			    
			    Self.SQLDateTime = value
			    
			  End if
			End Set
		#tag EndSetter
		ISO8601 As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Thu, 21 Dec 2000 16:01:07 +0200
			
			3.3. Date and Time Specification
			
			Date and time occur in several header fields.  This section specifies
			the syntax for a full date and time specification.  Though folding
			white space is permitted throughout the date-time specification, it
			is RECOMMENDED that a single space be used in each place that FWS
			appears (whether it is required or optional); some older
			implementations may not interpret other occurrences of folding white
			space correctly.
			
			date-time   = [ day-of-week "," ] date FWS time [CFWS]
			day-of-week = ([FWS] day-name) / obs-day-of-week
			day-name    = "Mon" / "Tue" / "Wed" / "Thu" / "Fri" / "Sat" / "Sun"
			date        = day month year
			year        = 4*DIGIT / obs-year
			month       = (FWS month-name FWS) / obs-month
			month-name  = "Jan" / "Feb" / "Mar" / "Apr" / "May" / "Jun" / "Jul" / "Aug" / "Sep" / "Oct" / "Nov" / "Dec"
			day         = ([FWS] 1*2DIGIT) / obs-day
			time        = time-of-day FWS zone
			time-of-day = hour ":" minute [ ":" second ]
			hour        = 2DIGIT / obs-hour
			minute      = 2DIGIT / obs-minute
			second      = 2DIGIT / obs-second
			zone        = (( "+" / "-" ) 4DIGIT) / obs-zone
		#tag EndNote
		#tag Getter
			Get
			  Dim Day_Name(7) As String
			  Dim Month_Name(12) As String
			  
			  Day_Name = Array(" ","Sun","Mon","Tue","Wed","Thu","Fri","Sat")
			  Month_Name = Array(" ", "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
			  
			  dim gmtHour as Integer = Floor(self.GMTOffset)
			  dim gmtMinutes as Integer = (self.GMTOffset-gmtHour)*60
			  
			  'Thu, 21 Dec 2000 16:01:07 +0200
			  Return Day_Name(Self.DayOfWeek)+", "+str(Self.Day)+" "+Month_Name(Self.Month)+" "+str(Self.Year)+" "+Self.SQLTime+" "+Format(gmtHour, "+00")+Format(gmtMinutes,"00")
			  
			End Get
		#tag EndGetter
		RFC2822 As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Format(Self.Hour, "00")+":"+Format(Self.Minute, "00")+":"+Format(Self.Second, "00")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim parts() As String
			  
			  parts = Split(value, ":")
			  
			  Self.Hour = val(parts(0))
			  Self.Minute = val(parts(1))
			  Self.Second = val(parts(2))
			End Set
		#tag EndSetter
		SQLTime As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.TotalSeconds - 2082844800
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Self.TotalSeconds = value + 2082844800
			  
			End Set
		#tag EndSetter
		UnixEpoch As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Format(Self.Year,"0000")+Format(Self.Month,"00")+Format(Self.Day,"00")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Self.Year = Val(value.Mid(1,4))
			  Self.Month = Val(value.Mid(5,2))
			  Self.Day = Val(value.Mid(7,2))
			End Set
		#tag EndSetter
		YMD As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Format(Self.Year,"0000")+Format(Self.Month,"00")+Format(Self.Day,"00")+Format(Self.Hour,"00")+Format(Self.Minute,"00")+Format(Self.Second,"00")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Self.Year = Val(value.Mid(1,4))
			  Self.Month = Val(value.Mid(5,2))
			  Self.Day = Val(value.Mid(7,2))
			  Self.Hour = Val(value.Mid(9,2))
			  Self.Minute = Val(value.Mid(11,2))
			  Self.Second = Val(value.Mid(13,2))
			End Set
		#tag EndSetter
		YMDHMS As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AbbreviatedDate"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Day"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DayOfWeek"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DayOfYear"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileTimeStamp"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GMTOffset"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hour"
			Group="Behavior"
			InitialValue="0"
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
			Name="ISO8601"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LongDate"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LongTime"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Minute"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Month"
			Group="Behavior"
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
			Name="RFC2822"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Second"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShortDate"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShortTime"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SQLDate"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SQLDateTime"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SQLTime"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TotalSeconds"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UnixEpoch"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WeekOfYear"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Year"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="YMD"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="YMDHMS"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

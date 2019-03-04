#tag Class
Class CFDate
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As UInteger
		  return me.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return me.Operator_Convert
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AbsoluteTime() As Double
		  #if TargetMacOS
		    declare function CFDateGetAbsoluteTime lib CarbonLib (theDate as Ptr) as Double
		    
		    return CFDateGetAbsoluteTime(me.Reference)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ClassID() As UInteger
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFDateGetTypeID" () as UInteger
		    static id as UInteger = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // current time - including fractional seconds
		  
		  me.Constructor CurrentAbsoluteTime()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(d as Date)
		  if d is nil then
		    // attention: this will not give fractional seconds; use the default constructor for that
		    d = new Date
		  end if
		  
		  // convert d.TotalSeconds to absolute time
		  d = new Date(d)
		  
		  dim ofs as Double = d.GMTOffset
		  d.GMTOffset = 0.0
		  
		  me.Constructor d.TotalSeconds - AbsoluteTimeIntervalSince1904
		  
		  d.GMTOffset = ofs
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(absTime as Double)
		  #if TargetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFDateCreate lib CarbonLib (allocator as Ptr, at as Double) as Ptr
		    
		    super.Constructor CFDateCreate(nil, absTime), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListFile(file as FolderItem) As CFDate
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListFile( file, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFDate = CFDate( plist )
		    return r
		    
		  #else
		    
		    #pragma unused file
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromPListString(plistString as String) As CFDate
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListString( plistString, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFDate = CFDate( plist )
		    return r
		    
		  #else
		    
		    #pragma unused plistString
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CurrentAbsoluteTime() As Double
		  // Current date & time - including fractional seconds (versus the Date class which only
		  //   returns full seconds)
		  //
		  // Note: Do not use this time to measure time differences, but only to get the current time,
		  //   e.g. for showing the time to the use.
		  // This is because this Time may be running a little faster or slower than "real" time, in
		  //   order to adjust itself to fluctuations in network time. Think of this time trying to gradually
		  //   catch up with an outside time.
		  // Also, this time value may abruptly change if the user changes the Date & Time manually.
		  //
		  // To measure actual passed time accurately, use "Microseconds()" instead!
		  
		  #if TargetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    declare function CFAbsoluteTimeGetCurrent lib CarbonLib () as Double
		    
		    return CFAbsoluteTimeGetCurrent()
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(d As CFDate) As Integer
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    
		    if me.Reference = nil or d is nil or d.Reference = nil then
		      return super.Operator_Compare( d )
		      
		    else
		      // Introduced in MacOS X 10.0.
		      Declare Function CFDateCompare Lib CarbonLib ( theDate As Ptr, otherDate As Ptr, context As Ptr ) As Int32
		      
		      return CFDateCompare( me.Reference, d.Reference, nil )
		      
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Date
		  // Modified by Kem Tekinay.
		  
		  if me.Reference = nil then
		    
		    // Suppose the developer used:
		    //   dim d as Date
		    //   dim cfd as CFDate = d
		    // This will leave cfd with nil reference, so this method will return a nil date.
		    return nil
		    
		  else
		    
		    dim d as new Date
		    
		    // save d.GMTOffset
		    dim gmt As Double = d.GMTOffset
		    
		    // d.TotalSeconds depends on d.GMTOffset, convert to absolute time before assignment
		    d.GMTOffset = 0.0
		    d.TotalSeconds = me.AbsoluteTime + AbsoluteTimeIntervalSince1904
		    
		    // restore original d.GMTOffset
		    d.GMTOffset = gmt
		    
		    return d
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(d As Date)
		  // Added by Kem Tekinay.
		  
		  // Special case -- If they assign a date that's nil, want it to be nil.
		  // Otherwise, a comparson like "myCFDate > dateThatsNil" won't work right.
		  if d is nil then
		    me.Constructor nil, CFType.HasOwnership
		  else
		    me.Constructor( d )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(d As CFDate) As Double
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    
		    // Introduced in MacOS X 10.0.
		    Declare Function CFDateGetTimeIntervalSinceDate Lib CarbonLib ( theDate As Ptr, otherDate As Ptr ) As Double
		    
		    return CFDateGetTimeIntervalSinceDate ( me.Reference, d.Reference )
		    
		  #else
		    
		    #pragma unused d
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  #if targetMacOS
			    static value as Double
			    
			    static initialized as Boolean = false
			    if not initialized then
			      initialized = true // if it doesn't work the first time, there's no need to try again, or is there?
			      const kCFAbsoluteTimeIntervalSince1904 = "kCFAbsoluteTimeIntervalSince1904"
			      dim p as Ptr = Carbon.Bundle.DataPointerNotRetained(kCFAbsoluteTimeIntervalSince1904)
			      if p <> nil then
			        value = p.Double(0)
			      end if
			    end if
			    
			    return value
			  #endif
			End Get
		#tag EndGetter
		Private Shared AbsoluteTimeIntervalSince1904 As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Operator_Convert
			  
			End Get
		#tag EndGetter
		DateValue As Date
	#tag EndComputedProperty


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

#tag Module
Protected Module ProgressBarExtension
	#tag Method, Flags = &h0
		Function Bezeled(Extends p as ProgressBar) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isBezeled lib CocoaLib selector "isBezeled" (obj_id as Integer) as Boolean
		    
		    return isBezeled(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bezeled(Extends p as ProgressBar, Assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setBezeled lib CocoaLib selector "setBezeled:" (obj_id as Integer, value as Boolean)
		    
		    setBezeled(p.handle, value)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlSize(Extends p as ProgressBar) As NSControlSize
		  
		  #if TargetCocoa
		    
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Integer) as NSControlSize
		    
		    return controlSize(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends p as ProgressBar, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Integer, value as NSControlSize)
		    
		    setControlSize(p.handle, value)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplayedWhenStopped(Extends p as ProgressBar) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isDisplayedWhenStopped lib CocoaLib selector "isDisplayedWhenStopped" (obj_id as Integer) as Boolean
		    
		    return isDisplayedWhenStopped(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayedWhenStopped(Extends p as ProgressBar, Assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setDisplayedWhenStopped lib CocoaLib selector "setDisplayedWhenStopped:" (obj_id as Integer, value as Boolean)
		    
		    setDisplayedWhenStopped(p.handle, value)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue(Extends p as ProgressBar) As Double
		  
		  #if TargetCocoa
		    
		    declare function doubleValue lib CocoaLib selector "doubleValue" (obj_id as Integer) as Double
		    
		    return doubleValue(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleValue(Extends p as ProgressBar, Assigns value as Double)
		  
		  #if TargetCocoa
		    
		    declare sub setDoubleValue lib CocoaLib selector "setDoubleValue:" (obj_id as Integer, value as Double)
		    
		    setDoubleValue(p.handle, value)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncrementBy(Extends p as ProgressBar, delta as Double)
		  
		  #if TargetCocoa
		    
		    declare sub incrementBy lib CocoaLib selector "incrementBy:" (obj_id as Integer, delta as Double)
		    
		    incrementBy(p.handle, delta)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused delta
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Indeterminate(Extends p as ProgressBar) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isIndeterminate lib CocoaLib selector "isIndeterminate" (obj_id as Integer) as Boolean
		    
		    return isIndeterminate(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Indeterminate(Extends p as ProgressBar, Assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setIndeterminate lib CocoaLib selector "setIndeterminate:" (obj_id as Integer, value as Boolean)
		    
		    setIndeterminate(p.handle, value)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaxValue(Extends p as ProgressBar) As Double
		  
		  #if TargetCocoa
		    
		    declare function maxValue lib CocoaLib selector "maxValue" (obj_id as Integer) as Double
		    
		    return maxValue(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MaxValue(Extends p as ProgressBar, Assigns value as Double)
		  
		  #if TargetCocoa
		    
		    declare sub setMaxValue lib CocoaLib selector "setMaxValue:" (obj_id as Integer, value as Double)
		    
		    setMaxValue(p.handle, value)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MinValue(Extends p as ProgressBar) As Double
		  
		  #if TargetCocoa
		    
		    declare function minValue lib CocoaLib selector "minValue" (obj_id as Integer) as Double
		    
		    return minValue(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MinValue(Extends p as ProgressBar, Assigns value as Double)
		  
		  #if TargetCocoa
		    
		    declare sub setMinValue lib CocoaLib selector "setMinValue:" (obj_id as Integer, value as Double)
		    
		    setMinValue(p.handle, value)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SizeToFit(Extends p as ProgressBar)
		  
		  #if TargetCocoa
		    
		    declare sub sizeToFit lib CocoaLib selector "sizeToFit" (obj_id as Integer)
		    
		    sizeToFit(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartAnimation(Extends p as ProgressBar)
		  
		  #if TargetCocoa
		    
		    declare sub startAnimation lib CocoaLib selector "startAnimation:" (obj_id as Integer, sender as Integer)
		    
		    startAnimation(p.handle, p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopAnimation(Extends p as ProgressBar)
		  
		  #if TargetCocoa
		    
		    declare sub stopAnimation lib CocoaLib selector "stopAnimation:" (obj_id as Integer, sender as Integer)
		    
		    stopAnimation(p.handle, p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule

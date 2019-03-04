#tag Module
Protected Module ProgressWheelExtension
	#tag Method, Flags = &h0
		Function ControlSize(Extends p as ProgressWheel) As NSControlSize
		  
		  #if TargetCocoa
		    
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Integer) as NSControlSize
		    
		    return controlSize(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends p as ProgressWheel, Assigns value as NSControlSize)
		  
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
		Function DisplayedWhenStopped(Extends p as ProgressWheel) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isDisplayedWhenStopped lib CocoaLib selector "isDisplayedWhenStopped" (obj_id as Integer) as Boolean
		    
		    return isDisplayedWhenStopped(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayedWhenStopped(Extends p as ProgressWheel, Assigns value as Boolean)
		  
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
		Sub SizeToFit(Extends p as ProgressWheel)
		  
		  #if TargetCocoa
		    
		    declare sub sizeToFit lib CocoaLib selector "sizeToFit" (obj_id as Integer)
		    
		    sizeToFit(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartAnimation(Extends p as ProgressWheel)
		  
		  #if TargetCocoa
		    
		    declare sub startAnimation lib CocoaLib selector "startAnimation:" (obj_id as Integer, sender as Integer)
		    
		    startAnimation(p.handle, p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopAnimation(Extends p as ProgressWheel)
		  
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

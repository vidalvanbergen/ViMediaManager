#tag Module
Protected Module MixedStateCheckboxExtension
	#tag Method, Flags = &h0
		Function AllowsMixedState(extends c as CheckBox) As Boolean
		  #if targetCocoa
		    
		    declare function allowsMixedState lib CocoaLib selector "allowsMixedState" (obj_id as Ptr)  as Boolean
		    
		    return allowsMixedState(Ptr(c.Handle))
		    
		  #else
		    
		    #pragma unused c
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AllowsMixedState(extends c as CheckBox, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setAllowsMixedState lib CocoaLib selector "setAllowsMixedState:" (obj_id as Ptr, value as Boolean)
		    
		    setAllowsMixedState(Ptr(c.Handle), value)
		    
		  #else
		    
		    #pragma unused c
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNextState(extends c as CheckBox)
		  #if targetCocoa
		    declare sub setNextState lib CocoaLib selector "setNextState" (obj_id as Ptr)
		    
		    setNextState(Ptr(c.Handle))
		    
		  #else
		    
		    #pragma unused c
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function State(extends c as CheckBox) As NSCellStateValue
		  #if targetCocoa
		    declare function state lib CocoaLib selector "state" (obj_id as Ptr) as NSCellStateValue
		    
		    return state(Ptr(c.Handle))
		    
		  #else
		    
		    #pragma unused c
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub State(extends c as CheckBox, assigns value as NSCellStateValue)
		  #if targetCocoa
		    declare sub setState lib CocoaLib selector "setState:" (obj_id as Ptr, value as NSCellStateValue)
		    
		    setState(Ptr(c.Handle), value)
		    
		  #else
		    
		    #pragma unused c
		    #pragma unused value
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Read Me
		This module extends the framework Checkbox class to support mixed state display in Cocoa builds.
	#tag EndNote


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

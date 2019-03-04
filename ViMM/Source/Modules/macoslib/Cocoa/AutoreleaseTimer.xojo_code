#tag Class
Protected Class AutoreleaseTimer
Inherits Timer
	#tag Event
		Sub Action()
		  me.Pool = nil
		  me.Pool = new NSAutoreleasePool
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  me.Pool = new NSAutoreleasePool
		  me.Mode = Timer.ModeMultiple
		  me.Period = 200
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		From: http://www.declaresub.com/ideclare/Cocoa/index.html
		
		This is only needed for RB versions released before July 2009, as
		later versions auto-create an autorelease pool for every Thread.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Pool As NSAutoreleasePool
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

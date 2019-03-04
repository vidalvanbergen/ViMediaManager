#tag Class
Protected Class MyNotificationCenter
Inherits Cocoa.NSUserNotificationCenter
	#tag Event
		Sub DidActivateNotification(notification as NSUserNotification)
		  
		  select case notification.ActivationType
		    
		  case NSUserNotification.NSUserNotificationActivationType.None
		    // Clicked on nothing
		    
		  case NSUserNotification.NSUserNotificationActivationType.ContentsClicked
		    // Clicked on the content
		    if NOT NSApplication.App.IsActive then
		      NSApplication.App.Activate(True)
		    end if
		    
		  case NSUserNotification.NSUserNotificationActivationType.ActionButtonClicked
		    // Clicked on the action button
		    if NOT  NSApplication.App.IsActive then
		      NSApplication.App.Activate(True)
		    end if
		    
		  end select
		  
		  
		  Dim dict as Dictionary = notification.UserInfo
		  
		  if dict <> Nil then
		    // Do something with the user provided information.
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidDeliverNotification(notification as NSUserNotification)
		  #pragma Unused notification
		End Sub
	#tag EndEvent

	#tag Event
		Function ShouldPresentNotificationInForeground(notification as NSUserNotification) As Boolean
		  #pragma Unused notification
		  Return True // Deliver notification even if app is in the foreground.
		End Function
	#tag EndEvent


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

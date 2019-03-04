#tag Module
Protected Module AlertExtensions
	#tag Method, Flags = &h0
		Sub AlertMessageDialog(Message as String)
		  dim splitValue as String = chr(13) + chr(13) // Break up the Title and Message
		  
		  dim nsa as New NSAlert( Message )
		  
		  if Message.Contains( splitValue ) then
		    nsa.MessageText = Message.NthField( splitValue, 1 )
		    nsa.InformativeText = Message.NthField( splitValue, 2 )
		  end if
		  
		  nsa.RunModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AlertOKCancelDialog(Title as String, Message as String, OKButton as String = "OK", CancelButton as String = "Cancel", Warning as Boolean = False, SuppressedPrefName as String = "") As Boolean
		  dim nsa as New NSAlert( Title, Message, OKButton, CancelButton )
		  
		  if Warning then
		    nsa.AlertStyle = NSAlert.Style.Critical // Warning Icon
		  else
		    nsa.AlertStyle = NSAlert.Style.Informational // App Icon
		  end if
		  
		  if SuppressedPrefName = "" then // No Suppression Button.
		    return nsa.RunModal = 1
		    
		  else // Show & Handle Suppression
		    nsa.ShowsSuppressionButton = True
		    
		    dim b as boolean
		    if Preferences.Prefs.Value( SuppressedPrefName, Nil ) = Nil then // First time running, or not set to suppress.
		      b = nsa.RunModal = 1
		      
		      if nsa.SuppressionButton.BooleanValue then // If the user wants to suppress this dialog
		        Preferences.Prefs.Value( SuppressedPrefName ) = b // Store the chosen value as the default value.
		      end if
		      
		    else // If the dialog is suppressed, get the stored 'default' value from preferences.
		      b = Preferences.Prefs.Value( SuppressedPrefName, False )
		    end if
		    
		    return b
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AlertYesNoCancelDialog(Title as String, Message as String, DefaultButton as String = "Yes", OtherButton as String = "No", AlternateButton as String = "Cancel", Warning as Boolean = False, SuppressedPrefName as String = "") As Integer
		  
		  //@return Integer
		  //   -1 = No Button
		  //    0 = Cancel Button
		  //    1 = Yes Button
		  //@return/
		  
		  
		  dim nsa as New NSAlert( Title, Message, DefaultButton, AlternateButton, OtherButton )
		  
		  if Warning then
		    nsa.AlertStyle = NSAlert.Style.Critical // Warning Icon
		  else
		    nsa.AlertStyle = NSAlert.Style.Informational // App Icon
		  end if
		  
		  if SuppressedPrefName = "" then // No Suppression Button.
		    return nsa.RunModal
		    
		  else // Show & Handle Suppression
		    nsa.ShowsSuppressionButton = True
		    
		    dim i as integer
		    if Preferences.Prefs.Value( SuppressedPrefName, Nil ) = Nil then // First time running, or not set to suppress.
		      i = nsa.RunModal
		      
		      if i <> 0 and nsa.SuppressionButton.BooleanValue then // If the user wants to suppress this dialog
		        Preferences.Prefs.Value( SuppressedPrefName ) = i // Store the chosen value as the default value.
		      end if
		      
		    else // If the dialog is suppressed, get the stored 'default' value from preferences.
		      i = Preferences.Prefs.Value( SuppressedPrefName, 1 )
		    end if
		    
		    return i
		  end if
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static gPrefs as TTsSmartPreferences
			  if gPrefs = nil then
			    gPrefs = new TTsSmartPreferences ("") // <- enter your app's name here, it's necessary for Windows and Linux
			  end
			  return gPrefs
			End Get
		#tag EndGetter
		Protected Prefs As TTsSmartPreferences
	#tag EndComputedProperty


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

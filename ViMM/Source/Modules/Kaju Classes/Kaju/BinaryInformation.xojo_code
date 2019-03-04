#tag Class
Protected Class BinaryInformation
Inherits Kaju.Information
	#tag Event
		Function IsInvalid(ByRef reason As String) As Boolean
		  dim r as boolean
		  
		  if not r and Hash.Trim = "" then
		    reason = KajuLocale.kMissingReason + " Hash"
		    r = true
		  end if
		  
		  if not r and URL.Trim = "" then
		    reason = KajuLocale.kMissingReason + " URL"
		    r = true
		  end if
		  
		  if not r and IsExecutableNameRequired and ExecutableName.Trim = "" then
		    reason = KajuLocale.kMissingReason + " Executable Name"
		    r = true
		  end if
		  
		  return r
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Must use one of the other contructors
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(executableNameRequired As Boolean)
		  self.Constructor
		  IsExecutableNameRequired = executableNameRequired
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(executableNameRequired As Boolean, data As JSONItem)
		  self.Constructor( executableNameRequired )
		  Kaju.JSONToProperties( data, self )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToJSON() As JSONItem
		  dim j as new JSONItem
		  
		  j.Value( kKeyHash ) = Hash
		  j.Value( kKeyURL ) = URL
		  if ExecutableName <> "" then
		    j.Value( kKeyExecutableName ) = ExecutableName
		  end if
		  
		  return j
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ExecutableName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if URL = "" then
			    return ""
			  end if
			  
			  dim cnt as integer = URL.CountFields( "/" )
			  dim name as string = URL.NthField( "/", cnt )
			  name = DecodeURLComponent( name )
			  
			  return name
			End Get
		#tag EndGetter
		FileName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Hash As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsExecutableNameRequired As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		URL As String
	#tag EndProperty


	#tag Constant, Name = kKeyExecutableName, Type = String, Dynamic = False, Default = \"ExecutableName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kKeyHash, Type = String, Dynamic = False, Default = \"Hash", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kKeyURL, Type = String, Dynamic = False, Default = \"URL", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ExecutableName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hash"
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
			Name="IsValid"
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
		#tag ViewProperty
			Name="URL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

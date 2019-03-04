#tag Module
Protected Module Growl
	#tag Method, Flags = &h21
		Private Function Notify(Title as String, Message as String, Icon as FolderItem = Nil, Priority as Integer = Priority_Normal) As Boolean
		  If GrowlNotify = Nil OR NOT GrowlNotify.Exists Then Return False
		  
		  Dim ExeStr as String
		  'If Icon = Nil Then Icon = App.ExecutableFile.Parent.Parent.Child("Resources").Child("ViMMLogo.png")
		  
		  If Icon = Nil Then Icon = App.ExecutableFile.Parent.Parent.Child("Resources").Child("ViMediaManager.icns")
		  If Icon = Nil Or NOT Icon.Exists Then Icon = App.ExecutableFile.Parent.Parent.Child("Resources").Child("ViMediaManager.debug.icns")
		  
		  ExeStr = ExeStr + " --name " + App.kAppName
		  If Icon <> Nil And Icon.Exists then
		    ExeStr = ExeStr + " --image " + Icon.ShellPath
		  Else
		    ExeStr = ExeStr + " -a " + "'" + App.kAppName + "'"
		  End If
		  ExeStr = ExeStr + " --title " + "'" + Title + "'"
		  ExeStr = ExeStr + " --message " + "'" + Message + "'"
		  ExeStr = ExeStr + " --priority " + str( Priority )
		  
		  Dim sh as new Shell
		  sh.Execute GrowlNotify.ShellPath + ExeStr
		  
		  Return sh.ReadAll = ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Register()
		  GrowlNotify = app.ExecutableFile.Parent.Parent.Child("Resources").Child("growlnotify")
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private GrowlNotify As FolderItem
	#tag EndProperty


	#tag Constant, Name = Priority_Emergency, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Priority_High, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Priority_Moderate, Type = Double, Dynamic = False, Default = \"-1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Priority_Normal, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Priority_VeryLow, Type = Double, Dynamic = False, Default = \"-2", Scope = Protected
	#tag EndConstant


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

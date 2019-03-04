#tag Module
Protected Module ResourceForkReplacement
	#tag Method, Flags = &h0
		Function OpenMacResourceFork(extends f as FolderItem) As MacResourceFork
		  if f <> nil and f.ResourceForkLength > 0 then
		    return new MacResourceFork (f)
		  end if
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		Original sources are located here:  https://github.com/macoslib/macoslib
		
		This module contains the class "MacResourceFork". It is a replacement for REALbasic's ResourceFork
		class, which is removed from the framework since release 2012r2.
		
		Note, however, that this replacement is not complete. It does not (yet) have functions to create
		or modify resources, and it is missing Get... functions for specific data types (GetPicture, GetSound etc.)
		
		To use this class in projects that rely on RB's "ResourceFork" class, simply rename all references to
		"ResourceFork" with "MacResourceFork".
		
		If you need any of the missing functions, let us know, e.g. via the issues tracker
		(https://github.com/macoslib/macoslib/issues), or see if the MBS plugins have added this
		functionality already (http://www.monkeybreadsoftware.net).
	#tag EndNote


	#tag Constant, Name = CarbonLib, Type = String, Dynamic = False, Default = \"Carbon.framework", Scope = Protected
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

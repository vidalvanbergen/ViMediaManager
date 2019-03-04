#tag Module
Protected Module libc
	#tag ExternalMethod, Flags = &h1
		Protected Declare Function basename Lib libc (path as CString) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function dirname Lib libc (path as CString) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function getpid Lib libc () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function gmtime Lib libc (ByRef t as Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function localtime Lib libc (ByRef t as Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function mktime Lib libc (ByRef timeptr as tm) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function strftime Lib libc (s as Ptr, maxsize as Integer, format as CString, ByRef timeptr as tm) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function strptime Lib libc (buf as CString, format as CString, ByRef tm_value as tm) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function tm(extends p as Ptr) As tm
		  //Because tm is declared with public visibility, one cannot write
		  //p.tm
		  //outside the module.  Nor does
		  //p.libc.tm
		  //work.  This function implements a workaround.
		  
		  return p.tm
		End Function
	#tag EndMethod


	#tag Constant, Name = libc, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"/usr/lib/libc.dylib"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libc.so"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Msvcrt.dll"
	#tag EndConstant


	#tag Structure, Name = tm, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		tm_sec as Integer
		  tm_min as Integer
		  tm_hour as Integer
		  tm_mday as Integer
		  tm_mon as Integer
		  tm_year as Integer
		  tm_wday as Integer
		  tm_yday as Integer
		  tm_isdst as Integer
		  tm_gmtoff as Integer
		tm_zone as Ptr
	#tag EndStructure


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

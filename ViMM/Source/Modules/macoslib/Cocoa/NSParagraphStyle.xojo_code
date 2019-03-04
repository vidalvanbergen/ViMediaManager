#tag Class
Class NSParagraphStyle
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function Default() As NSParagraphStyle
		  //# Returns the default paragraph style
		  
		  #if TargetMacOS
		    declare function defaultParagraphStyle lib CocoaLib selector "defaultParagraphStyle" (Cls as Ptr) as Ptr
		    
		    dim p as Ptr
		    p = defaultParagraphStyle( Cocoa.NSClassFromString( "NSParagraphStyle" ))
		    if p<>nil then
		      return   new NSParagraphStyle( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineBreakMode() As integer
		  
		  #if TargetMacOS
		    declare function lineBreakMode lib CocoaLib selector "lineBreakMode" (id as Ptr) as integer
		    
		    return   lineBreakMode( me.id )
		  #endif
		End Function
	#tag EndMethod


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

#tag Module
Protected Module PrettyXML
	#tag Method, Flags = &h21
		Private Function AppendNewChild(extends parent as xmlnode, key as string) As xmlnode
		  Dim doc  as xmldocument = parent.OwnerDocument
		  Dim node as xmlnode = parent.AppendChild( doc.CreateElement( key ) )
		  Return node
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendSimpleChild(extends parent as xmlnode, key as string, value as variant)
		  Dim node as xmlnode
		  Dim doc  as xmldocument
		  
		  doc  = parent.ownerDocument
		  node = parent.appendChild(doc.createelement(key))
		  
		  Select case value.Type
		  case 2
		    node.AppendChild( doc.CreateTextNode( format( value, "-0" ) ) )
		  case 5
		    node.AppendChild( doc.CreateTextNode( str( value ) ) )
		  case 8
		    node.AppendChild( doc.CreateTextNode( value ) )
		  case 11
		    node.AppendChild( doc.CreateTextNode( str( value.BooleanValue ) ) )
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Indent(extends parent as xmlnode, level as integer)
		  Dim i, c As Integer
		  Dim s, tab As String
		  Dim HasChildren as boolean
		  Dim doc as xmldocument
		  
		  tab = "  " // chr(9)
		  doc = parent.ownerDocument
		  
		  s = chr(10)
		  For i = 0 To level-1
		    s = s + tab
		  Next
		  
		  c = parent.ChildCount
		  
		  For i = c-1 DownTo 0
		    If parent.Child( i ).Type = 1 Then
		      parent.Child( i ).Indent( level + 1 )
		      parent.Insert( doc.CreateTextNode( s + tab ), parent.Child( i ) )
		      HasChildren = True
		    End
		  Next
		  If HasChildren Then parent.AppendChild( doc.CreateTextNode( s ) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IndentRoot(Extends XmlDocAsString as String, RootName as String) As String
		  Dim i as Integer = XmlDocAsString.InStr( "<" + RootName )
		  XmlDocAsString = XmlDocAsString.Mid( 1, i - 1 ) + chr(13) + chr(13) + XmlDocAsString.Mid( i )
		  Return XmlDocAsString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetValue(extends parent as xmlnode, value as variant)
		  Dim doc as XmlDocument
		  Dim node as XmlNode
		  
		  doc = parent.OwnerDocument
		  node = parent
		  
		  Select case value.Type
		  case 2
		    node.AppendChild( doc.CreateTextNode( format( value, "-0" ) ) )
		  case 5 // Integer
		    node.AppendChild( doc.CreateTextNode( str( value, "##.##" ) ) )
		  case 8 // String
		    node.AppendChild( doc.CreateTextNode( value ) )
		  case 11 // Boolean
		    If value.BooleanValue then
		      node.AppendChild( doc.CreateTextNode( "TRUE" ) )
		    Else
		      node.AppendChild( doc.CreateTextNode( "FALSE" ) )
		    End
		  End Select
		End Sub
	#tag EndMethod


	#tag Note, Name = About PrettyXML
		By Matthias Bürcher 2004
		http://www.belle-nuit.com
		
		needs RB 5.5+
		
		Three simple class extensions of xmlnode 
		allow you to write more readable xml creation code
		
		instead of 
		
		  child = parent.appendchild(xdoc.createElement("child"))
		  
		you can write
		
		  child = parent.appendnewchild("child")
		  
		also you can abbreviate terminal nodes.
		
		  child = parent.appendchild(xdoc.createElement("child"))
		  child.AppendChild(xdoc.CreateTextNode(format(myinteger,"0"))
		  
		reduces to 
		 
		  parent.appendsimplechild "child", myinteger
		  
		and this method accepts strings, integer, double and boolean.
		
		finally, you can indent the root node at the end to get a pretty textfile.
		you only have to indent the root node, the other get indent recursively.
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

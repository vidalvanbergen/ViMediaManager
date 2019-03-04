#tag Module
Protected Module XMLExtensions
	#tag Method, Flags = &h0
		Function AppendNewChild(extends parent as XmlNode, Key as String) As XmlNode
		  Dim Doc as XmlDocument = parent.OwnerDocument
		  Dim Node as XmlNode = parent.AppendChild( Doc.CreateElement( Key ) )
		  Return Node
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendSimpleChild(extends Parent as XmlNode, Key as String, Value as Variant)
		  Dim Doc as XmlDocument
		  Dim Node as XmlNode
		  
		  Doc = Parent.OwnerDocument
		  Node = Parent.AppendChild( Doc.CreateElement( Key ) )
		  
		  Select Case Value.Type
		  Case 2, 3, Variant.TypeInt32, variant.TypeInt64
		    Node.AppendChild( Doc.CreateTextNode( Format( Value, "-0" ) ) )
		  Case 5, Variant.TypeDouble // Double
		    Node.AppendChild( Doc.CreateTextNode( Str( Value ) ) )
		  Case 8, 37, variant.TypeString, variant.TypeText // String
		    Node.AppendChild( Doc.CreateTextNode( Value ) )
		  Case 11, variant.TypeBoolean // Boolean
		    Node.AppendChild( Doc.CreateTextNode( Str( Value.BooleanValue ) ) )
		    
		  case 7, Variant.TypeDate
		    dim d as Date = Value
		    node.AppendChild( Doc.CreateTextNode( d.ShortDate ) )
		  else
		    dim v as Variant = value.Type
		    Break
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Indent(extends parent as XmlNode, level as Integer)
		  Dim s, tab As String
		  Dim HasChildren as Boolean
		  Dim Doc as XmlDocument = parent.OwnerDocument
		  
		  tab = "    " // chr(9)
		  s = chr(10)
		  
		  For i as Integer = 0 to level - 1
		    s = s + tab
		  Next
		  
		  For i as Integer = parent.ChildCount -1 DownTo 0
		    If parent.Child( i ).Type = 1 Then
		      parent.Child( i ).Indent( level + 1 )
		      parent.Insert( Doc.CreateTextNode( s + tab ), parent.Child( i ) )
		      HasChildren = True
		    End If
		  Next
		  If HasChildren Then parent.AppendChild( Doc.CreateTextNode( s ) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(extends parent as XmlNode, Value as Variant)
		  Dim Doc as XmlDocument = parent.OwnerDocument
		  Dim Node as XmlNode = parent
		  
		  Select Case Value.Type
		  Case 2
		    Node.AppendChild( Doc.CreateTextNode( Format( Value, "-0" ) ) )
		  Case 5 // Integer
		    Node.AppendChild( Doc.CreateTextNode( Str( Value ) ) )
		  Case 8 // String
		    Node.AppendChild( Doc.CreateTextNode( Value ) )
		  Case 11 // Boolean
		    Node.AppendChild( Doc.CreateTextNode( Str( Value.BooleanValue ) ) )
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToPrettyString(extends Xml as XMLDocument) As String
		  Dim pXML As String = ""
		  
		  pXML = pXML + "<?xml version=""1.0"" encoding=""UTF-8""?>" + EndOfLine
		  pXML = pXML + "<xsl:transform version=""1.0"" xmlns:xsl=""http://www.w3.org/1999/XSL/Transform"">" + EndOfLine
		  pXML = pXML + "<xsl:output method=""xml"" indent=""yes"" />" + EndOfLine
		  pXML = pXML + "<xsl:template match=""/"">" + EndOfLine
		  pXML = pXML + "<xsl:copy-of select=""/"" />" + EndOfLine
		  pXML = pXML + "</xsl:template>" + EndOfLine
		  pXML = pXML + "</xsl:transform>" + EndOfLine
		  
		  return Xml.Transform(pXML) '.ReplaceAll( " xmlns:xml=""http://www.w3.org/XML/1998/namespace""", "" )
		End Function
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

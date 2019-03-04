#tag Class
Protected Class PropertyList
Inherits Dictionary
	#tag Method, Flags = &h0
		Function ArrayAsString(Ar as PLArray, AddCR as boolean) As string
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    
		    dim data as string
		    dim v as variant
		    dim i, j as integer
		    dim o as object
		    dim b as boolean
		    dim d as double
		    dim EOL as string
		    
		    if AddCR then
		      EOL = EndOfLine
		    else
		      EOL = ""
		    end if
		    
		    data = "<array>"+EOL
		    
		    for i=0 to Ar.Count-1
		      v = Ar.Value(i)
		      
		      select case vartype(v)
		      case 2 //Integer
		        j = v
		        data = data + "<integer>"+Str(j)+"</integer>"+EOL
		      case 5 //Double
		        d = v
		        data = data + "<real>"+Str(d)+"</real>"+EOL
		      case 8 //String
		        data = data + "<string>"+v+"</string>"+EOL
		      case 9 //Object
		        o = v
		        if o IsA Dictionary then
		          data = data+DictAsString(Dictionary(o), AddCR)+EOL
		        elseif o IsA PLArray then
		          data = data+ArrayAsString(PLArray(o), AddCR)+EOL
		        end if
		      case 11 //Boolean
		        b = v
		        if b then
		          data = data+"<true/>"+EOL
		        else
		          data = data+"<false/>"+EOL
		        end if
		      end select
		    next
		    
		    data = data + "</array>"
		    
		    return data
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(FromFile as FolderItem)
		  // Calling the overridden superclass constructor.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    Super.Constructor
		    
		    dim i as integer
		    dim dict as Dictionary
		    dim CFPL as CFDictionary
		    
		    CFPL = CFDictionary.CreateFromPListFile( FromFile )
		    
		    dict = CFPL.VariantValue
		    
		    for i=0 to dict.Count-1
		      me.Value(dict.key(i)) = dict.Value(dict.key(i))
		    next
		    
		    file = FromFile
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictAsString(dict as Dictionary, AddCR as boolean) As string
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    
		    dim data as string
		    dim v as variant
		    dim i, j as integer
		    dim key as string
		    dim o as object
		    dim b as boolean
		    dim d as double
		    dim EOL as string
		    
		    if AddCR then
		      EOL = EndOfLine
		    else
		      EOL = ""
		    end if
		    
		    data = "<dict>"+EOL
		    
		    for i=0 to dict.Count-1
		      key = dict.key(i)
		      v = dict.Value(key)
		      
		      data = data + "<key>"+key+"</key>"+EOL
		      
		      select case vartype(v)
		      case 2 //Integer
		        j = v
		        data = data + "<integer>"+Str(j)+"</integer>"+EOL
		      case 5 //Double
		        d = v
		        data = data + "<real>"+Str(d)+"</real>"+EOL
		      case 8 //String
		        data = data + "<string>"+v+"</string>"+EOL
		      case 9 //Object
		        o = v
		        if o IsA Dictionary then
		          data = data+DictAsString(Dictionary(o), AddCR)+EOL
		        elseif o IsA PLArray then
		          data = data+ArrayAsString(PLArray(o), AddCR)+EOL
		        end if
		      case 11 //Boolean
		        b = v
		        if b then
		          data = data+"<true/>"+EOL
		        else
		          data = data+"<false/>"+EOL
		        end if
		      end select
		    next
		    
		    data = data + "</dict>"
		    
		    return data
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTextFromXMLNode(e as XMLNode) As string
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    
		    dim e2 as XMLNode
		    
		    e2 = e.Child(0)
		    if e2=nil then
		      return ""
		    end if
		    
		    if e2.type=XmlNodeType.TEXT_NODE then
		      return e2.Value
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PListGetArray(FromElement as XMLNode) As PLArray
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    //Build a dictionary from a plist 'dict' element
		    
		    dim i as integer
		    dim e as XMLNode
		    dim ar as PLArray
		    
		    if FromElement.LocalName<>"array" then
		      //This is actually not an array. Raise an exception
		      raise new typeMismatchException
		    end if
		    
		    ar = new PLArray
		    
		    //SAME CODE as PListGetDictionary except that :
		    //  - There's no "key" value
		    //  - Values are appended to the PLArray 'Ar'
		    
		    for i=0 to FromElement.ChildCount-1
		      e = FromElement.Child(i)
		      select case e.LocalName
		      case "string"
		        Ar.append   GetTextFromXMLNode(e)
		      case "real"
		        Ar.append    Val(GetTextFromXMLNode(e))
		      case "true"
		        Ar.append    true
		      case "false"
		        Ar.append   false
		      case "integer"
		        Ar.append    Val(GetTextFromXMLNode(e))
		      case "dict"
		        //Recursively add a dictionary
		        Ar.append    PListGetDictionary(e)
		      case "array"
		        //Add the array
		        Ar.append    PListGetArray(e)
		      case "date"
		        //>>>>>>>> Unsupported yet
		      case "data"
		        //>>>>>>>> Unsupported yet
		      end select
		    next
		    
		    return Ar
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PListGetDictionary(FromElement as XMLNode) As Dictionary
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    
		    //Build a dictionary from a plist 'dict' element
		    
		    dim i as integer
		    dim e as XMLNode
		    dim PendingKey as string
		    dim dict as dictionary
		    
		    if FromElement.localName<>"dict" then
		      //This is actually not a dict. Raise an exception
		      raise new typeMismatchException
		    end if
		    
		    dict = new Dictionary
		    
		    for i=0 to FromElement.ChildCount-1
		      e = FromElement.Child(i)
		      
		      select case e.LocalName
		      case "key" //Store the key for use in the next loop
		        PendingKey = GetTextFromXMLNode(e)
		        if PendingKey="" then //Raise exception
		          return  nil
		        end if
		      case "string"
		        dict.Value(PendingKey) = GetTextFromXMLNode(e)
		        PendingKey = ""
		      case "real"
		        dict.Value(PendingKey) = Val(GetTextFromXMLNode(e))
		        PendingKey = ""
		      case "true"
		        dict.Value(PendingKey) = true
		        PendingKey = ""
		      case "false"
		        dict.Value(PendingKey) = false
		        PendingKey = ""
		      case "integer"
		        dict.Value(PendingKey) = Val(GetTextFromXMLNode(e))
		        PendingKey = ""
		      case "dict"
		        //Recursively add a dictionary
		        dict.Value(PendingKey) = PListGetDictionary(e)
		        PendingKey = ""
		      case "array"
		        //Add the array
		        dict.Value(PendingKey) = PListGetArray(e)
		        PendingKey = ""
		      case "date"
		        //>>>>>>>> Unsupported yet
		      case "data"
		        //>>>>>>>> Unsupported yet
		      end select
		    next
		    
		    return dict
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteOnDisk()
		  //Write to the normal file
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    me.WriteToFile   file //We let RB raise an exception if necessary
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteToFile(file as FolderItem)
		  //Write the PropertyList to the specified file
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    dim data as string
		    dim G as string
		    dim tos as TextOutputStream
		    
		    G = Chr(34)
		    
		    if file=nil then
		      return
		    end if
		    
		    data = "<?xml version="+G+"1.0"+G+" encoding="+G+"UTF-8"+G+"?>"+EndOfLine
		    data = data + "<!DOCTYPE plist PUBLIC "+G+"-//Apple Computer//DTD PLIST 1.0//EN"+G+" "+G+"http://www.apple.com/DTDs/PropertyList-1.0.dtd"+G+">"+EndOfLine
		    data = data + "<plist version="+G+"1.0"+G+">"+EndOfLine
		    
		    data = data + DictAsString(me, true) + EndOfLine + "</plist>"
		    
		    tos = TextOutputStream.Create( file )
		    if tos<>nil then
		      tos.Write   data
		      tos.close
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BinCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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

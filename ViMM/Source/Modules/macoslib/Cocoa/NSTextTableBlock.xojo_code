#tag Class
Class NSTextTableBlock
Inherits NSTextBlock
	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize(Allocate("NSTextTableBlock")), NSTextTableBlock.hasOwnership)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(table as NSTextTable, startRow as Integer, rowSpan as Integer, startColumn as Integer, columnSpan as Integer)
		  
		  #if targetMacOS
		    declare function initWithTable lib CocoaLib selector "initWithTable:startingRow:rowSpan:startingColumn:columnSpan:" _
		    (obj_id as Ptr, table as Ptr, startRow as Integer, rowSpan as Integer, startColumn as Integer, columnSpan as Integer) as Ptr
		    
		    dim tableRef as Ptr
		    if table <> nil then
		      tableRef = table
		    end if
		    
		    super.Constructor(initWithTable(Allocate("NSTextTableBlock"), tableRef, startRow, rowSpan, startColumn, columnSpan), NSTextTableBlock.hasOwnership)
		    
		  #else
		    #pragma unused table
		    #pragma unused startRow
		    #pragma unused rowSpan
		    #pragma unused startColumn
		    #pragma unused columnSpan
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function columnSpan lib CocoaLib selector "columnSpan" (obj_id as Ptr) as Integer
			    
			    return columnSpan(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ColumnSpan As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function rowSpan lib CocoaLib selector "rowSpan" (obj_id as Ptr) as Integer
			    
			    return rowSpan(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		RowSpan As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function startingColumn lib CocoaLib selector "startingColumn" (obj_id as Ptr) as Integer
			    
			    return startingColumn(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		StartingColumn As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function startingRow lib CocoaLib selector "startingRow" (obj_id as Ptr) as Integer
			    
			    return startingRow(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		StartingRow As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function table lib CocoaLib selector "table" (obj_id as Ptr) as Ptr
			    
			    dim tableRef as Ptr = table(self)
			    if tableRef <> nil then
			      return new NSTextTable(tableRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Table As NSTextTable
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ColumnSpan"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
			Name="RowSpan"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartingColumn"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartingRow"
			Group="Behavior"
			Type="Integer"
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
			Name="VerticalAlignment"
			Group="Behavior"
			Type="NSTextBlockVerticalAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - NSTextBlockTopAlignment"
				"1 - NSTextBlockMiddleAlignment"
				"2 - NSTextBlockBottomAlignment"
				"3 - NSTextBlockBaselineAlignment"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

#tag Class
Class AVMetadataItem
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString("AVMetadataItem")
		  return ref
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  #if TargetMacOS
			    
			    declare function commonKey lib Framework selector "commonKey" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = commonKey( self.id )
			    if p <> nil then
			      dim nss as new NSString( p )
			      r = nss
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		CommonKey As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function dataValue lib Framework selector "dataValue" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = dataValue( self.id )
			    dim nsd as NSData
			    if p <> nil then
			      nsd = new NSData( p )
			    end if
			    return nsd
			    
			  #endif
			  
			End Get
		#tag EndGetter
		DataValue As NSData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function dateValue lib Framework selector "dateValue" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = dateValue( self.id )
			    dim nsd as NSDate
			    if p <> nil then
			      nsd = new NSDate( p )
			    end if
			    return nsd
			    
			  #endif
			  
			End Get
		#tag EndGetter
		DateValue As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function duration lib Framework selector "duration" ( obj_id As Ptr ) As CMTime
			    // Introduced in MacOS X 10.7.
			    
			    dim time as CMTime = duration( self.id )
			    return time
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Duration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Cocoa.CMTimeGetSeconds( Duration )
			  
			End Get
		#tag EndGetter
		DurationInSeconds As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function extraAttributes lib Framework selector "extraAttributes" ( obj_id As Ptr ) As Ptr
			    //Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = extraAttributes( self.id )
			    dim nsd as NSDictionary
			    if p <> nil then
			      nsd = new NSDictionary( p )
			    end if
			    
			    return nsd
			    
			  #endif
			End Get
		#tag EndGetter
		ExtraAttributes As NSDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function key lib Framework selector "key" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = key( self.id )
			    dim obj as NSObject
			    if p <> nil then
			      obj = Cocoa.NSObjectFromNSPtr( p, not NSObject.hasOwnership )
			    end if
			    return obj
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Key As NSObject
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  #if TargetMacOS
			    
			    declare function keySpace lib Framework selector "keySpace" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = keySpace( self.id )
			    if p <> nil then
			      dim nss as new NSString( p )
			      r = nss
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		KeySpace As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function locale lib Framework selector "locale" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = locale( self.id )
			    dim nsl as NSLocale
			    if p <> nil then
			      nsl = new NSLocale( p, not NSObject.hasOwnership )
			    end if
			    return nsl
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Locale As NSLocale
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function numberValue lib Framework selector "numberValue" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = numberValue( self.id )
			    dim nsn as NSNumber
			    if p <> nil then
			      nsn = new NSNumber( p, not NSObject.hasOwnership )
			    end if
			    return nsn
			    
			  #endif
			  
			End Get
		#tag EndGetter
		NumberValue As NSNumber
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Attempts to extract the data as a Picture. If it can't, will return nil.
			  // If it's there, the picture will be in the DataValue either as image data or
			  // as a plist with a data key. This will attempt both.
			  
			  dim p as Picture
			  
			  #if TargetMacOS
			    
			    try // First sign of error, we abort
			      
			      dim nsd as NSData = self.DataValue
			      if nsd <> nil then
			        
			        dim rawString as string = nsd.StringValue
			        if rawString <> "" then
			          
			          p = Picture.FromData( rawString )
			          if p is nil then // Did that work?
			            // No, so attempt to get it from a plist
			            dim plist as CFDictionary = CFDictionary.CreateFromPListString( rawString )
			            if plist <> nil then
			              dim key as new CFString( "data" )
			              if plist.HasKey( key ) then
			                dim dataValue as string = plist.Value( key ).VariantValue
			                if dataValue <> "" then
			                  p = Picture.FromData( dataValue )
			                end if
			              end if
			            end if
			            
			          end if
			          
			        end if
			        
			      end if
			      
			    catch
			    end try
			    
			  #endif
			  
			  return p
			End Get
		#tag EndGetter
		PictureValue As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  #if TargetMacOS
			    
			    declare function stringValue lib Framework selector "stringValue" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = stringValue( self.id )
			    if p <> nil then
			      dim nss as new NSString( p )
			      r = nss
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function time lib Framework selector "time" ( obj_id As Ptr ) As CMTime
			    // Introduced in MacOS X 10.7.
			    
			    return time( self.id )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Time As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function value lib Framework selector "value" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = value( self.id )
			    dim obj as NSObject
			    if p <> nil then
			      obj = Cocoa.NSObjectFromNSPtr( p, not NSObject.hasOwnership )
			    end if
			    return obj
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Value As NSObject
	#tag EndComputedProperty


	#tag Constant, Name = Framework, Type = String, Dynamic = False, Default = \"AppKit.framework", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CommonKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DurationInSeconds"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeySpace"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="PictureValue"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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

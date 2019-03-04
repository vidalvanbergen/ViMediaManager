#tag Class
Class QTMovie
Inherits NSObject
	#tag Method, Flags = &h0
		Function CurrentTime() As QTTime
		  #if targetMacOS
		    declare function currentTime lib QTKit.framework selector "currentTime" (obj_id as Ptr) as QTTime
		    
		    return currentTime(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CurrentTime(assigns value as QTTime)
		  #if targetCocoa
		    declare sub setCurrentTime lib CocoaLib selector "setCurrentTime:" (obj_id as Ptr, time as QTTime)
		    
		    setCurrentTime(self, value)
		    
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Duration() As QTTime
		  #if targetMacOS
		    declare function duration lib QTKit.framework selector "duration" (obj_id as Ptr) as QTTime
		    
		    return duration(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameImage() As NSImage
		  #if targetCocoa
		    declare function currentFrameImage lib QTKit.framework selector "currentFrameImage" (obj_id as Ptr) as Ptr
		    
		    return new NSImage(currentFrameImage(self), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameImage(time as QTTime) As NSImage
		  #if targetCocoa
		    declare function frameImageAtTime lib QTKit.framework selector "frameImageAtTime:" (obj_id as Ptr, time as QTTime) as Ptr
		    
		    return new NSImage(frameImageAtTime(self, time), not hasOwnership)
		    
		  #else
		    #pragma unused time
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadFromFolderItem(f as FolderItem) As QTMovie
		  if f = nil then
		    return nil
		  end if
		  
		  return LoadFromPath(f.POSIXPath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadFromPath(path as String) As QTMovie
		  #if targetCocoa
		    declare function initWithFile lib QTKit.Framework selector "initWithFile:error:" (obj_id as Ptr, fileName as CFStringRef, ByRef errorPtr as Ptr) as Ptr
		    
		    dim errorPtr as Ptr
		    dim p as Ptr = initWithFile(NSObject.Allocate("QTMovie"), path, errorPtr)
		    if p <> nil then
		      return new QTMovie(p, NSObject.hasOwnership)
		    else
		      raise new NSException(errorPtr)
		    end if
		    
		  #else
		    #pragma unused path
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MakeFileType(uti as String) As FileType
		  'dim f as new FileType
		  'f.MacType = UTI.OSType(uti)
		  'f.Extensions = UTI.
		  'f.Name = uti
		  
		  #pragma unused uti
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QTAttribute(key as String) As Ptr
		  #if targetCocoa
		    declare function attributeForKey lib CocoaLib selector "attributeForKey:" (obj_id as Ptr, key as CFStringRef) as Ptr
		    
		    return attributeForKey(self, key)
		    
		  #else
		    #pragma unused key
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QTAttribute(key as String, assigns value as Ptr)
		  #if targetCocoa
		    declare sub setAttribute lib CocoaLib selector "setAttribute:" (obj_id as Ptr, value as Ptr, key as CFStringRef)
		    
		    setAttribute(self, value, key)
		    
		  #else
		    #pragma unused key
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rate() As Double
		  #if targetCocoa
		    declare function rate lib QTKit.framework selector "rate" (obj_id as Ptr) as Double
		    
		    return CType(rate(self), Double)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectionDuration() As QTTime
		  #if targetCocoa
		    declare function selectionDuration lib QTKit.framework selector "selectionDuration" (obj_id as Ptr) as QTTime
		    
		    return selectionDuration(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectionEnd() As QTTime
		  #if targetCocoa
		    declare function selectionEnd lib QTKit.framework selector "selectionEnd" (obj_id as Ptr) as QTTime
		    
		    return selectionEnd(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectionStart() As QTTime
		  #if targetCocoa
		    declare function selectionStart lib QTKit.framework selector "selectionStart" (obj_id as Ptr) as QTTime
		    
		    return selectionStart(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSelection(range as QTTimeRange)
		  #if targetCocoa
		    declare sub setSelection lib QTKit.framework selector "setSelection:" (obj_id as Ptr, selection as QTTimeRange)
		    
		    setSelection(self, range)
		    
		  #else
		    #pragma unused range
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function UTIs() As UTI()
		  #if targetCocoa
		    declare function movieTypesWithOptions lib QTKit.framework selector "movieTypesWithOptions:" (class_id as Ptr, types as Integer) as Ptr
		    
		    dim theArray as new CFArray(movieTypesWithOptions(Cocoa.NSClassFromString("QTMovie"), QTIncludeCommonTypes), not CFType.hasOwnership)
		    dim utiList() as UTI
		    for each item as String in theArray.StringValues
		      utiList.Append item
		    next
		    return utiList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Volume() As Double
		  #if targetCocoa
		    declare function volume lib QTKit.framework selector "volume" (obj_id as Ptr) as Double
		    
		    return CType(volume(self), Double)
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = QTMovie Attributes
		So far, QTMovie only has a method for retrieving attribute values. Because attributeForKey can return any of an number of Objective-C objects, 
		the Rb QTAttribute method simply returns a Ptr, leaving it to you to choose the right NSObject as specified in the QTMovie documentation.
		
		A few code examples for retrieval of attributes:
		
		  dim X as new NSNumber(qt_movie.QTAttribute("QTMovieDataSizeAttribute"))
		
		  dim displayName as String = RetainedStringValue(qt_movie.QTAttribute("QTMovieDisplayNameAttribute"))
		  
		  
		  dim value as new NSValue(qt_movie.QTAttribute("QTMoviePreviewRangeAttribute"))
		  dim previewRangeBuffer as new MemoryBlock(QTKit.QTTimeRange.Size)
		  value.CopyInto(previewRangeBuffer)
		  dim previewRange as QTKit.QTTimeRange
		  previewRange.StringValue(previewRangeBuffer.LittleEndian) = previewRangeBuffer
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function muted lib QTKit.framework selector "muted" (obj_id as Ptr) as Boolean
			    
			    return muted(self)
			  #endif
			End Get
		#tag EndGetter
		Muted As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = QTIncludeCommonTypes, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


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
			Name="Muted"
			Group="Behavior"
			Type="Boolean"
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

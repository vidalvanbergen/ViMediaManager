#tag Module
Protected Module Cocoa
	#tag Method, Flags = &h1
		Protected Function Bundle() As NSBundle
		  //This function returns an NSBundle because it is most likely that one wants an
		  //NSBundle for Cocoa.    The function Cocoa.StringConstant provides an easy way to resolve string constants.
		  
		  return NSBundle.LoadFromIdentifier(BundleID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ClassNameForObjectPointer(p as ptr) As String
		  
		  #if TargetMacOS
		    declare function object_getClassName lib CocoaLib ( id as Ptr ) as Ptr
		    
		    dim s as string
		    
		    dim mb as MemoryBlock
		    if p<>nil then
		      mb = object_getClassName( p )
		      s = mb.CString( 0 )
		    else
		      break
		    end if
		    declare function object_getClass lib CocoaLib (id as Ptr ) as Ptr
		    declare function class_getName lib CocoaLib (id as Ptr) as Ptr
		    declare function class_getSuperclass lib CocoaLib (id as Ptr) as Ptr
		    dim cls as Ptr
		    
		    cls = object_getClass( p )
		    while cls<>nil
		      mb = class_getName( cls )
		      if mb<>nil then
		      end if
		      
		      cls = class_getSuperclass( cls )
		    wend
		    
		    return  s
		    
		  #else
		    return ""
		    
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ClassNameTreeForClass(aClass as Ptr) As String()
		  dim result() as string
		  
		  #if TargetMacOS
		    
		    declare function class_getName lib CocoaLib (id as Ptr) as Ptr
		    declare function class_getSuperclass lib CocoaLib (id as Ptr) as Ptr
		    
		    dim cls as Ptr
		    dim mb as MemoryBlock
		    
		    cls = aClass
		    while cls<>nil
		      mb = class_getName( cls )
		      if mb<>nil then
		        result.Append   mb.CString( 0 )
		      end if
		      
		      cls = class_getSuperclass( cls )
		    wend
		    
		  #else
		    #pragma unused aClass
		  #endif
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ClassNameTreeForObjectPointer(p as ptr) As String()
		  dim result() as string
		  
		  #if TargetMacOS
		    declare function object_getClass lib CocoaLib (id as Ptr ) as Ptr
		    declare function class_getName lib CocoaLib (id as Ptr) as Ptr
		    declare function class_getSuperclass lib CocoaLib (id as Ptr) as Ptr
		    
		    if p=nil then  RETURN result
		    
		    dim cls as Ptr
		    dim mb as MemoryBlock
		    
		    cls = object_getClass( p )
		    while cls<>nil
		      mb = class_getName( cls )
		      if mb<>nil then
		        result.Append   mb.CString( 0 )
		      end if
		      
		      cls = class_getSuperclass( cls )
		    wend
		    
		  #else
		    #pragma unused p
		  #endif
		  
		  return  result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CMTimeAbsoluteValue(time As CMTime) As CMTime
		  #if TargetMacOS
		    soft declare function getCMTimeAbsoluteValue lib "CoreMedia.framework" alias "CMTimeAbsoluteValue" ( time As CMTime ) As CMTime
		    // Introduced in MacOS X 10.7.
		    
		    return getCMTimeAbsoluteValue( time )
		    
		  #else
		    #pragma unused time
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CMTimeGetSeconds(time As CMTime) As Double
		  #if TargetMacOS
		    soft declare function getCMTimeGetSeconds lib "CoreMedia.framework" alias "CMTimeGetSeconds" ( time As CMTime ) As Double
		    // Introduced in MacOS X 10.7.
		    
		    return getCMTimeGetSeconds( time )
		    
		  #else
		    #pragma unused time
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CMTimeIsValid(time As CMTime) As Boolean
		  return ( time.Flags and kCMTimeFlags_Valid ) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Attributes( deprecated = "FileManager.GetFolderItemFromPOSIXPath" ) Protected Function GetFolderItemFromPOSIXPath(absolutePath as String) As FolderItem
		  // THIS FUNCTION IS DEPRECATED.
		  // Use FileManager.GetFolderItemFromPOSIXPath or just GetFolderItemFromPOSIXPath instead.
		  
		  return FileManager.GetFolderItemFromPOSIXPath( absolutePath )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InheritsFromClass(p as Ptr, classname as string) As Boolean
		  //Check if the Ptr (corresponding to any NS object) has "classname" in its inheritance tree
		  
		  #if TargetMacOS
		    dim tree() as string
		    
		    tree = ClassNameTreeForObjectPointer( p )
		    
		    return  ( tree.IndexOf( classname ) <> -1 )
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused classname
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Initialize()
		  #if TargetCarbon
		    // This function needs to be called once to set up the Cocoa environment.
		    
		    Declare Function NSApplicationLoad Lib CocoaLib () as Boolean
		    
		    static inited as Boolean
		    if not inited then // we should do this only once!
		      inited = true
		      
		      #if RBVersion < 2010
		        autoreleasePool = new AutoreleaseTimer
		      #else
		        // Newer RB versions (actually, since any release after July 2009) create
		        // an autorelease pool for us, so we don't need this any more.
		      #endif
		      
		      if not NSApplicationLoad() then
		        break
		      end
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LoadFramework(frameworkName as String, searchPublicFrameworks as Boolean = true) As CFBundle
		  // Call this to make a framework known to the app, so that its classRef etc. can be looked up
		  
		  #if targetMacOS
		    const FrameworksDirectoryName = "Frameworks"
		    const FrameworkExtension = ".framework"
		    
		    if frameworkName.Right(10) <> FrameworkExtension then
		      frameworkName = frameworkName + FrameworkExtension
		    end if
		    
		    const NSAllDomainsMask = &h0ffff
		    const NSLibraryDirectory = 5
		    const isDirectory = true
		    
		    dim bundleURL as CFURL
		    
		    dim frameworkURLs() as CFURL = Array(CFBundle.Application.FrameworksDirectory.AppendComponent(frameworkName, not isDirectory))
		    
		    if searchPublicFrameworks then
		      const expandTilde = true
		      dim p as Ptr = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSAllDomainsMask, expandTilde)
		      dim libraryPathArray as new CFArray(p, not CFType.hasOwnership)
		      for i as Integer = 0 to libraryPathArray.Count - 1
		        frameworkURLs.Append CFURL.CreateFromPOSIXPath(libraryPathArray.CFStringRefValue(i), isDirectory).AppendComponent(FrameworksDirectoryName, isDirectory).AppendComponent(frameworkName, not isDirectory)
		      next
		    end if
		    
		    for each url as CFURL in frameworkURLs
		      dim bundleItem as FolderItem = url.Item
		      if bundleItem <> nil and bundleItem.Exists then
		        bundleURL = url
		        exit
		      end if
		    next
		    
		    dim b as CFBundle = CFBundle.NewCFBundleFromURL( bundleURL )
		    if b <> nil and b.Load then
		      LoadedFrameworks.Append   b
		      return b
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused frameworkName
		    #pragma unused searchPublicFrameworks
		  #endif
		  
		  return nil // Shouldn't get here
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MakeDelegateClass(className as String, superclassName as String, methodList() as Tuple, ParamArray protocolNames as String) As Ptr
		  // This is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if TargetMacOS then
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    declare function objc_getProtocol lib CocoaLib (name as CString) as Ptr
		    declare function class_addProtocol lib CocoaLib (Cls as Ptr, protocol as Ptr) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException ("Could not create new class " + className)
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    for each protocolName as String in protocolNames
		      if not class_addProtocol (newClassId, objc_getProtocol(protocolName)) then
		        raise new macoslibException ("Could not add protocol " + protocolName + " to class " + className)
		      end if
		    next
		    
		    for each item as Tuple in methodList
		      if not class_addMethod (newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2)) then
		        raise new macoslibException ("Could not add delegate method(s) to new class " + className)
		        return nil
		      end if
		    next
		    
		    return newClassId
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		    #pragma unused methodList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSAppKitVersionNumber() As Double
		  #if TargetMacOS
		    static d as Double
		    if d = 0 then
		      dim mb as MemoryBlock = CFBundle.NewCFBundleFromID("com.apple.Cocoa").DataPointerNotRetained("NSAppKitVersionNumber")
		      d = mb.DoubleValue(0)
		    end if
		    return d
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSClassFromString(aClassName as CFStringRef) As Ptr
		  #if TargetMacOS
		    Declare Function NSClassFromString Lib CocoaLib (aClassName as CFStringRef) As Ptr
		    Return NSClassFromString(aClassName)
		  #endif
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSFullUserName Lib CocoaLib () As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSHomeDirectory Lib CocoaLib () As CFStringRef
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function NSIntegerMax() As Integer
		  #if Target64Bit then
		    return &h7FFFFFFFFFFFFFFF
		  #else
		    return &h7FFFFFFF
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSMakePoint(x as Double, y as Double) As NSPoint
		  dim p as NSPoint
		  p.x = x
		  p.y = y
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSMakeRange(start as integer, length as integer) As NSRange
		  dim r as NSRange
		  r.location = start
		  r.length = length
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSMakeRect(x as Double, y as Double, w as Double, h as Double) As NSRect
		  dim r as NSRect
		  r.x = x
		  r.y = y
		  r.w = w
		  r.h = h
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSMakeSize(width as Double, Height as Double) As NSSize
		  dim s as NSSize
		  s.width = width
		  s.height = Height
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSNotFound() As Integer
		  static r as Integer = NSIntegerMax
		  return r
		  
		  // See notes in NSIntegerMax
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSObjectFromNSPtr(id as Ptr, hasOwnership as Boolean = false, DontReturnNSObject as boolean = false) As variant
		  //Creates an instance of an RB Cocoa object from the passed Cocoa object instance id
		  
		  dim objClassNameTree() as string = ClassNameTreeForObjectPointer( id )
		  
		  for i as integer = 0 to objClassNameTree.Ubound
		    dim objClassName as string = objClassNameTree( i ) // Can't use For Each since order matters
		    select case objClassName
		    case "AVAsset"
		      return new AVAsset( id, hasOwnership )
		      
		    case "AVAssetTrack"
		      return new AVAssetTrack( id, hasOwnership )
		      
		    case "AVMetadataItem"
		      return new AVMetadataItem( id, hasOwnership )
		      
		    case "NSApplication"
		      return  new NSApplication( id, hasOwnership )
		      
		    case "NSArray"
		      return  new NSArray( id, hasOwnership )
		      
		    case "NSAttributedString"
		      return  new NSAttributedString( id, hasOwnership )
		      
		    case "NSBundle"
		      return  new NSBundle( id, hasOwnership )
		      
		    case "NSCell"
		      return  new NSCell( id, hasOwnership )
		      
		    case "NSCharacterSet"
		      return  new NSCharacterSet( id, hasOwnership )
		      
		    case "NSColor"
		      return  new NSColor( id, hasOwnership )
		      
		    case "NSColorSpace"
		      return  new NSColorSpace( id, hasOwnership )
		      
		    case "NSData"
		      return  new NSData( id, hasOwnership )
		      
		    case "NSDate"
		      return  new NSDate( id, hasOwnership )
		      
		    case "NSDateFormatter"
		      return  new NSDateFormatter( id, hasOwnership )
		      
		    case "NSDictionary"
		      return  new NSDictionary( id, hasOwnership )
		      
		    case "NSEvent"
		      return  new NSEvent( id, hasOwnership )
		      
		    case "NSFileHandle"
		      return  new NSFileHandle( id, hasOwnership )
		      
		    case "NSFont"
		      return  new NSFont( id, hasOwnership )
		      
		    case "NSFontManager"
		      return  new NSFontManager( id, hasOwnership )
		      
		    case "NSGraphicsContext"
		      return  new NSGraphicsContext( id, hasOwnership )
		      
		    case "NSHost"
		      return  new NSHost( id, hasOwnership )
		      
		    case "NSImage"
		      return  new NSImage( id, hasOwnership )
		      
		    case "NSIndexSet"
		      return  new NSIndexSet( id, hasOwnership )
		      
		    case "NSMenu"
		      return  new NSMenu( id, hasOwnership )
		      
		    case "NSMenuItem"
		      return  new NSMenuItem( id, hasOwnership )
		      
		    case "NSMutableArray"
		      return  new NSMutableArray( id, hasOwnership )
		      
		    case "NSMutableAttributedString"
		      return  new NSMutableAttributedString( id, hasOwnership )
		      
		    case "NSMutableCharacterSet"
		      return  new NSMutableCharacterSet( id, hasOwnership )
		      
		    case "NSMutableDictionary"
		      return  new NSMutableDictionary( id, hasOwnership )
		      
		    case "NSMutableIndexSet"
		      return  new NSMutableIndexSet( id, hasOwnership )
		      
		    case "NSMutableParagraphStyle"
		      return  new NSMutableParagraphStyle( id, hasOwnership )
		      
		    case "NSMutableString"
		      return  new NSMutableString( id, hasOwnership )
		      
		    case "NSNetService"
		      return  new NSNetService( id, hasOwnership )
		      
		    case "NSNetServiceBrowser"
		      return  new NSNetServiceBrowser( id, hasOwnership )
		      
		    case "NSNotification"
		      return  new NSNotification( id, hasOwnership )
		      
		    case "NSNotificationCenter"
		      return  new NSNotificationCenter( id, hasOwnership )
		      
		    case "NSNull"
		      return  new NSNull( id, hasOwnership )
		      
		    case "NSNumber"
		      return  new NSNumber( id, hasOwnership )
		      
		    case "NSParagraphStyle"
		      return  new NSParagraphStyle( id, hasOwnership )
		      
		    case "NSPasteboard"
		      return  new NSPasteboard( id, hasOwnership )
		      
		    case "NSPasteboardItem"
		      return  new NSPasteboardItem( id, hasOwnership )
		      
		    case "NSObject"
		      if DontReturnNSObject then
		        return  nil
		      else
		        return  new NSObject( id, hasOwnership )
		      end if
		      
		    case "NSPathComponentCell"
		      'return  new NSPathComponentCell( id, hasOwnership )
		      
		    case "NSPipe"
		      return  new NSPipe( id, hasOwnership )
		      
		    case "NSPrinter"
		      return  new NSPrinter( id, hasOwnership )
		      
		    case "NSProcessInfo"
		      return  new NSProcessInfo( id, hasOwnership )
		      
		    case "NSResponder"
		      return  new NSResponder( id, hasOwnership )
		      
		    case "NSRunLoop"
		      return  new NSRunLoop( id, hasOwnership )
		      
		    case "NSRunningApplication"
		      return  new NSRunningApplication( id, hasOwnership )
		      
		    case "NSSpeechSynthesizer"
		      return  new NSSpeechSynthesizer( id, hasOwnership )
		      
		    case "NSString"
		      return  new NSString( id, hasOwnership )
		      
		    case "NSTableColumn"
		      return  new NSTableColumn( id, hasOwnership )
		      
		    case "NSTableHeaderView"
		      return  new NSTableHeaderView( id, hasOwnership )
		      
		    case "NSTableViewDataSource"
		      'return  new NSTableViewDataSource( id, hasOwnership )
		      
		    case "NSText"
		      return  new NSText( id, hasOwnership )
		      
		    case "NSTimeZone"
		      return  new NSTimeZone( id, hasOwnership )
		      
		    case "NSURL"
		      return  new NSURL( id, hasOwnership )
		      
		    case "NSUserDefaults"
		      return  new NSUserDefaults( id, hasOwnership )
		      
		    case "NSValue"
		      return  new NSValue( id, hasOwnership )
		      
		    case "NSView"
		      return  new NSView( id, hasOwnership )
		      
		    case "NSWindow"
		      return  new NSWindow( id, hasOwnership )
		      
		    case "NSWorkspace"
		      return  new NSWorkspace( id, hasOwnership )
		      
		    case "ODNode"
		      return  new ODNode( id, hasOwnership )
		      
		    case "ODSession"
		      return  new ODSession( id, hasOwnership )
		      
		    end select
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSObjectFromVariant(v as variant) As variant
		  if v.IsArray then
		    return   NSArray.CreateFromObjectsArray( v )
		  end if
		  
		  select case v.Type
		  case Variant.TypeBoolean
		    return new NSNumber( v.BooleanValue )
		    
		  case Variant.TypeInteger, Variant.TypeLong
		    return new NSNumber( v.IntegerValue )
		    
		  case Variant.TypeString
		    dim s as NSString = v.StringValue
		    return s
		    
		  case Variant.TypeDouble
		    return new NSNumber( v.DoubleValue )
		    
		  case Variant.TypeObject  //->Dictionary, MemoryBlock
		    if v IsA Dictionary then
		      return   NSDictionary.CreateFromDictionary( Dictionary( v ))
		    elseif v IsA MemoryBlock then
		      return new NSData( MemoryBlock( v ))
		    elseif v isa NSObject then //Already a NSObject
		      return  v
		    end if
		    
		  case Variant.TypeDate
		    return new NSDate( v.DateValue )
		    
		  case Variant.TypeNil
		    return new NSNull
		    
		  case Variant.TypeColor
		    return new NSColor( v.ColorValue )
		  else
		    raise new TypeMismatchException
		  end select
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSOffsetRect Lib CocoaLib (aRect as NSRect, dx as CGFloat, dY as CGFloat) As NSRect
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSSearchPathForDirectoriesInDomains Lib CocoaLib (directory as Integer, domainMask as Integer, expandTilde as Boolean) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSSelectorFromString Lib CocoaLib (aSelectorName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSStringFromClass Lib CocoaLib (aClass as Ptr) As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSStringFromSelector Lib CocoaLib (aSelector as Ptr) As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSUserName Lib CocoaLib () As CFStringRef
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function NSZeroPoint() As NSPoint
		  
		  return NSMakePoint(0, 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSZeroRect() As NSRect
		  
		  return NSMakeRect(0.0, 0.0, 0.0, 0.0)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSZeroSize() As NSSize
		  
		  return NSMakeSize(0.0, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Release(id as Ptr)
		  #if TargetMacOS
		    
		    declare sub release lib CocoaLib selector "release" (id as Ptr)
		    
		    if id <> nil then
		      release id
		    end if
		    
		  #else
		    
		    #pragma unused id
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequireFramework(frameworkName as string)
		  
		  dim fname as string
		  
		  if frameworkName.Instr( ".framework" ) = 0 then
		    fname = frameworkName + ".framework"
		  else
		    fname = frameworkName
		  end if
		  
		  for each cfb as CFBundle in LoadedFrameworks
		    if cfb.FolderItemValue.Name = fname then
		      return
		    end if
		  next
		  
		  //Load the framework
		  dim cfb as CFBundle = LoadFramework( frameworkName )
		  if cfb<>nil then
		    LoadedFrameworks.Append   cfb
		  else
		    raise  new MacOSError( 100002, "Library not found: " + fname ) //POSIX error: kPOSIXErrorENOENT
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Retain(id as Ptr)
		  #if TargetMacOS
		    declare function retain lib CocoaLib selector "retain" (id as Ptr) as Ptr
		    
		    if id <> nil then
		      call  retain( id )
		    end if
		    
		  #else
		    
		    #pragma unused id
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StringConstant(symbolName as String) As String
		  //NSBundle doesn't support loading of data pointers; for this we must use a CFBundle.
		  #if targetMacOS
		    
		    dim s as string
		    dim b as CFBundle = CFBundle.NewCFBundleFromID(BundleID)
		    s = b.StringPointerRetained(symbolName)
		    if s<>"" then
		      return  s
		    end if
		    
		    //Not found. Search in loaded frameworks
		    for i as integer=0 to LoadedFrameworks.Ubound
		      s = LoadedFrameworks( i ).StringPointerRetained( symbolName )
		      if s<>"" then
		        return  s
		      end if
		    next
		    
		  #else
		    
		    #pragma unused symbolName
		    
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = About
		From: http://www.declaresub.com/ideclare/Cocoa/index.html
		
		This module provides what in Cocoa terms is the "Foundation"
	#tag EndNote

	#tag Note, Name = Caution using 'SEL' and 'id' in declares
		This is only important if you add new Cocoa method calls yourself:
		
		If you want to call an external function (usually via "declare"), and if that function's
		return type is a selector (SEL) or generic Cocoa object (id), be cautious not to use
		such types as the return type of the declared function. Instead, have it return a UInt32
		and then assign its value to a variable of type SEL or id using the ToSEL() or To_id()
		function (or assign directly to its ".value" member, although that's a bit unclean).
		
		If you do not obey this rule, your application may not work on PowerPC processors
		because of a bug in REALbasic (as of v2008r5.1): Returning structure types from
		declare'd functions does not work.
		
		An example where you'd want to store the result of a call in a variable such as:
		
		  dim result as id
		
		Bad:
		  declare function objc_msgSend lib CocoaLib (r as id, s as SEL) as id
		  result = objc_msgSend (r, s)
		
		Good:
		  declare function objc_msgSend lib CocoaLib (r as id, s as SEL) as UInt32
		  result = To_id (objc_msgSend (r, s))
	#tag EndNote


	#tag Property, Flags = &h21
		Private autoreleasePool As AutoreleaseTimer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LoadedFrameworks() As CFBundle
	#tag EndProperty


	#tag Constant, Name = BundleID, Type = String, Dynamic = False, Default = \"com.apple.Cocoa", Scope = Protected, Attributes = \""
	#tag EndConstant

	#tag Constant, Name = CocoaLib, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FoundationLib, Type = String, Dynamic = False, Default = \"Foundation.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMTimeFlags_HasBeenRounded, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCMTimeFlags_ImpliedValueFlagsMask, Type = Double, Dynamic = False, Default = \"&b00011100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCMTimeFlags_Indefinite, Type = Double, Dynamic = False, Default = \"16", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCMTimeFlags_NegativeInfinity, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCMTimeFlags_PositiveInfinity, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCMTimeFlags_Valid, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = CMTime, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		value As Int64
		  timescale As Int32
		  flags As UInt32
		epoch As Int64
	#tag EndStructure

	#tag Structure, Name = NSPoint, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		x as Double
		y as Double
	#tag EndStructure

	#tag Structure, Name = NSRange, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		location as Integer
		length as Integer
	#tag EndStructure

	#tag Structure, Name = NSRect, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		x as Double
		  y as Double
		  w as Double
		h as Double
	#tag EndStructure

	#tag Structure, Name = NSSize, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		width as Double
		height as Double
	#tag EndStructure


	#tag Enum, Name = NSCellStateValue, Flags = &h0
		Mixed = -1
		  Off = 0
		On = 1
	#tag EndEnum

	#tag Enum, Name = NSComparisonResult, Flags = &h0
		NSOrderedAscending = -1
		  NSOrderedSame = 0
		NSOrderedDescending = 1
	#tag EndEnum

	#tag Enum, Name = NSRectEdge, Flags = &h0
		NSMinXEdge
		  NSMinYEdge
		  NSMaxXEdge
		NSMaxYEdge
	#tag EndEnum


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

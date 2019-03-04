#tag Class
Class NSTask
Inherits NSObject
	#tag Method, Flags = &h0
		Function Arguments() As String()
		  #if targetMacOS
		    declare function arguments lib CocoaLib selector "arguments" (obj_id as Ptr) as Ptr
		    
		    dim cfargs as new CFArray(arguments(self), not CFArray.hasOwnership)
		    dim args() as String
		    for i as Integer = 0 to cfargs.Count - 1
		      args.Append RetainedStringValue(cfargs.Value(i))
		    next
		    return args
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(path as String, ParamArray arguments() as String)
		  #if targetMacOS
		    self.Constructor(path, arguments)
		  #else
		    #pragma unused path
		    #pragma unused arguments
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(path as String, arguments() as String)
		  #if targetMacOS
		    declare sub setLaunchPath lib CocoaLib selector "setLaunchPath:" (obj_id as Ptr, path as CFStringRef)
		    declare sub setArguments lib CocoaLib selector "setArguments:" (obj_id as Ptr, arguments as Ptr)
		    super.Constructor(Initialize(Allocate("NSTask")))
		    
		    setLaunchPath(self, path)
		    dim cfArgs() as CFString
		    for i as Integer = 0 to UBound(arguments)
		      cfArgs.Append arguments(i)
		    next
		    setArguments(self, new CFArray(cfArgs))
		    
		    self.SetStdin(NSPIpe.NewPipe())
		    self.SetStdout(NSPIpe.NewPipe())
		    self.SetStdErr(NSPipe.NewPipe())
		  #else
		    #pragma unused path
		    #pragma unused arguments
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Environment() As NSDictionary
		  #if targetMacOS
		    declare function environment lib CocoaLib selector "environment" (obj_id as Ptr) as Ptr
		    
		    return new NSDIctionary(environment(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Interrupt()
		  //Sends a SIGINT to the process.
		  
		  #if targetMacOS
		    declare sub interrupt lib CocoaLib selector "interrupt" (obj_id as Ptr)
		    
		    interrupt(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Launch()
		  #if targetMacOS
		    declare sub launch lib CocoaLib selector "launch" (obj_id as Ptr)
		    
		    launch(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeNSFileHandle(p as Ptr) As NSFileHandle
		  #if targetMacOS
		    declare function isKindOfClass lib CocoaLib selector "isKindOfClass:" (obj_id as Ptr, class_id as Ptr) as Boolean
		    
		    if isKindOfClass(p, Cocoa.NSClassFromString("NSFileHandle")) then
		      return new NSFileHandle(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeNSPipe(p as Ptr) As NSPipe
		  #if targetMacOS
		    declare function isKindOfClass lib CocoaLib selector "isKindOfClass:" (obj_id as Ptr, class_id as Ptr) as Boolean
		    
		    if isKindOfClass(p, Cocoa.NSClassFromString("NSPipe")) then
		      return new NSPipe(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resume() As Boolean
		  #if targetMacOS
		    declare function resume lib CocoaLib selector "resume" (obj_id as Ptr) as Boolean
		    
		    return resume(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStandardError(p as Ptr)
		  #if targetMacOS
		    declare sub setStandardError lib CocoaLib selector "setStandardError:" (obj_id as Ptr, file as Ptr)
		    
		    setStandardError(self, p)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStandardInput(p as Ptr)
		  #if targetMacOS
		    declare sub setStandardInput lib CocoaLib selector "setStandardInput:" (obj_id as Ptr, file as Ptr)
		    
		    setStandardInput(self, p)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStandardOutput(p as Ptr)
		  #if targetMacOS
		    declare sub setStandardOutput lib CocoaLib selector "setStandardOutput:" (obj_id as Ptr, file as Ptr)
		    
		    setStandardOutput(self, p)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStderr(handle as NSFileHandle)
		  if handle is nil then
		    return
		  end if
		  SetStandardError(handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStderr(pipe as NSPipe)
		  if pipe is nil then
		    return
		  end if
		  SetStandardOutput(pipe)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStdin(handle as NSFileHandle)
		  if handle is nil then
		    return
		  end if
		  SetStandardInput(handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStdin(pipe as NSPipe)
		  if pipe is nil then
		    return
		  end if
		  SetStandardInput(pipe)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStdout(handle as NSFileHandle)
		  if handle is nil then
		    return
		  end if
		  SetStandardOutput(handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStdout(pipe as NSPipe)
		  if pipe is nil then
		    return
		  end if
		  SetStandardOutput(pipe)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StandardError() As Ptr
		  #if targetMacOS
		    declare function standardError lib CocoaLib selector "standardError" (obj_id as Ptr) as Ptr
		    
		    return standardError(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StandardInput() As Ptr
		  #if targetMacOS
		    declare function standardInput lib CocoaLib selector "standardInput" (obj_id as Ptr) as Ptr
		    
		    return standardInput(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StandardOutput() As Ptr
		  #if targetMacOS
		    declare function standardOutput lib CocoaLib selector "standardOutput" (obj_id as Ptr) as Ptr
		    
		    return standardOutput(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StdErrHandle() As NSFileHandle
		  #if targetMacOS
		    return MakeNSFileHandle(self.standardError)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StdErrPipe() As NSPipe
		  #if targetMacOS
		    return MakeNSPipe(self.StandardError)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StdinHandle() As NSFileHandle
		  #if targetMacOS
		    return MakeNSFileHandle(self.standardInput)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StdinPipe() As NSPipe
		  #if targetMacOS
		    return MakeNSPipe(self.standardInput)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StdoutHandle() As NSFileHandle
		  #if targetMacOS
		    return MakeNSFileHandle(self.standardOutput)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StdoutPipe() As NSPipe
		  #if targetMacOS
		    return MakeNSPipe(self.standardOutput)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Suspend() As Boolean
		  //Suspends execution of the task.  Returns true if the process was suspended.
		  //Multiple suspend calls must be balanced with resume calls.
		  
		  #if targetMacOS
		    declare function suspend lib CocoaLib selector "suspend" (obj_id as Ptr) as Boolean
		    
		    return suspend(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Terminate()
		  //sends a SIGTERM to the process and its subprocesses.
		  
		  #if targetMacOS
		    declare sub terminate lib CocoaLib selector "terminate" (obj_id as Ptr)
		    
		    terminate(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TerminationReason() As Integer
		  //returns one of
		  //  TerminationReasonExit
		  //  TerminationReasonUncaughtSignal
		  
		  #if targetMacOS
		    declare function terminationReason lib CocoaLib selector "terminationReason" (obj_id as Ptr) as Integer
		    
		    return terminationReason(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Wait()
		  #if targetMacOS
		    declare sub waitUntilExit lib CocoaLib selector "waitUntilExit" (obj_id as Ptr)
		    
		    waitUntilExit(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		An NSTask object can be run only once.  
		
		
		DebugArgs as String is provided to be able to view the arguments in the debugger.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function currentDirectoryPath lib CocoaLib selector "currentDirectoryPath" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(currentDirectoryPath(self))
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setCurrentDirectoryPath lib CocoaLib selector "setCurrentDirectoryPath:" (obj_id as Ptr, value as CFStringRef)
			    
			    setCurrentDirectoryPath(self, value)
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		CurrentWorkingDirectory As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return Join(self.Arguments, " ")
			End Get
		#tag EndGetter
		Private DebugArgs As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function terminationStatus lib CocoaLib selector "terminationStatus" (obj_id as Ptr) as Integer
			    
			    //terminationStatus returns an NSInvalidArgumentException if task is still running, so we check before calling terminationStatus.
			    if self.IsRunning then
			      return 0
			    else
			      return terminationStatus(self)
			    end if
			  #endif
			End Get
		#tag EndGetter
		ExitCode As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isRunning lib CocoaLib selector "isRunning" (obj_id as Ptr) as Boolean
			    
			    return isRunning(self)
			  #endif
			End Get
		#tag EndGetter
		isRunning As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function launchPath lib CocoaLib selector "launchPath" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(launchPath(self))
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setLaunchPath lib CocoaLib selector "setLaunchPath:" (obj_id as Ptr, path as CFStringRef)
			    
			    setLaunchPath(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			  
			End Set
		#tag EndSetter
		LaunchPath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function processIdentifier lib CocoaLib selector "processIdentifier" (obj_id as Ptr) as Integer
			    
			    return processIdentifier(self)
			  #endif
			End Get
		#tag EndGetter
		ProcessIdentifier As Integer
	#tag EndComputedProperty


	#tag Constant, Name = TerminationReasonExit, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TerminationReasonUncaughtSignal, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CurrentWorkingDirectory"
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
			Name="ExitCode"
			Group="Behavior"
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
			Name="isRunning"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LaunchPath"
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
			Name="ProcessIdentifier"
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
	#tag EndViewBehavior
End Class
#tag EndClass

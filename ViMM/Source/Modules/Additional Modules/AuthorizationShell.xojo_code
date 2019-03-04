#tag Class
Protected Class AuthorizationShell
	#tag Method, Flags = &h0
		Function AuthorizeAndExecute(pathToTool as String, args() as String) As Boolean
		  #if TargetMacOS
		    
		    declare function AuthorizationCreate lib "Security" (rights as Ptr, environment as Ptr, flags as Integer, ByRef ref as Integer) as Integer
		    declare function AuthorizationExecuteWithPrivileges lib "Security" (ref as Integer, pathToTool as CString, options as Integer, arguments as Ptr, ByRef pipe as Integer) as Integer
		    declare function fclose lib "System" (file as Integer) as Integer
		    declare function fcntl lib "System" (file as integer, cmd as integer, param as integer) as integer
		    declare function fileno lib "System" (file as integer) as integer
		    
		    if zIsLive then
		      errNum = 1 // busy
		      return false
		    end
		    
		    dim err as integer
		    
		    dim i, c as integer
		    if args is nil then
		      c = -1
		    else
		      c = args.Ubound
		    end if
		    dim argsBlock as new MemoryBlock((c+2)*4)
		    dim cstrs(-1) as MemoryBlock
		    
		    // put pointers to CStrings into the arguments block
		    // it's the size of the number of arguments + 1
		    // because the argv style is that it will read memory until
		    // one null pointer
		    
		    // This operation requires that your args are provided as a
		    // string array
		    
		    for i = 0 to c
		      cstrs.Append args(i) + chr(0)
		      argsBlock.Ptr(i*4) = cstrs(i)
		    next
		    
		    if authRef = 0 then
		      // If we already have an authorization ref, we might as well reuse it
		      dim rightsSet, authSet, rightsItem, authItem as MemoryBlock
		      
		      if usernamePassword <> nil then
		        dim userName as String = usernamePassword.Left
		        dim password as String = usernamePassword.Right
		        
		        //
		        // build a AuthorizationRights structure
		        //
		        rightsItem = new MemoryBlock(16)
		        cstrs.Append "system.privilege.admin" + chr(0)
		        rightsItem.Ptr(0) = cstrs(cstrs.Ubound)
		        
		        rightsSet = new MemoryBlock(8)
		        rightsSet.Long(0) = 1
		        rightsSet.Ptr(4) = rightsItem
		        
		        //
		        // build a AuthorizationItemSet
		        //
		        authItem = new MemoryBlock(16*2)
		        cstrs.Append "username" + chr(0)
		        authItem.Ptr(0) = cstrs(cstrs.Ubound)
		        cstrs.Append userName
		        authItem.Long(4) = userName.Len  'the valueLength
		        authItem.Ptr(8) = cstrs(cstrs.Ubound)
		        
		        cstrs.Append "password" + chr(0)
		        authItem.Ptr(16+0) = cstrs(cstrs.Ubound)
		        cstrs.Append password
		        authItem.Long(16+4) = password.Len  'the valueLength
		        authItem.Ptr(16+8) = cstrs(cstrs.Ubound)
		        
		        authSet = new MemoryBlock(8)
		        authSet.Long(0) = 2
		        authSet.Ptr(4) = authItem
		      end
		      
		      if rightsSet <> nil and authSet <> nil then
		        err = AuthorizationCreate( rightsSet, authSet, 3, authRef)
		      else
		        err = AuthorizationCreate( nil, nil, 0, authRef)
		      end
		    end if
		    
		    // Try to authorize and execute the tool
		    if err = 0 then
		      file = 0
		      err = AuthorizationExecuteWithPrivileges( authRef, pathToTool, 0, argsBlock, file )
		    end if
		    
		    // Check for an error.
		    if err <> 0 then
		      // User cancelled if error is -60006
		      if err = -60006 then
		        errNum = 0
		      else
		        errNum = err
		      end if
		      
		      // couldn't authorize, return false
		      return false
		    end if
		    
		    // Get the file descriptor number
		    dim filenum as integer = fileno(file)
		    
		    // Grab the flags to the file
		    err = fcntl(filenum, 3, 0)
		    // BitwiseOr the number with 4 (non-blocking)
		    err = err Or 4
		    // Re-set the flags on the file
		    err =  fcntl(filenum, 4, err)
		    
		    // Reset the flags so that we handle other methods fine
		    zIsLive = true
		    errNum = 0
		    
		    // Start the Poll Timer (added by Kem Tekinay)
		    if zPollTimer is nil then
		      zPollTimer = new Timer
		      zPollTimer.Period = 10
		      AddHandler zPollTimer.Action, AddressOf pHandlePollTimerAction
		    end if
		    zPollTimer.Mode = Timer.ModeMultiple // Start the timer
		    
		    // We were successful
		    return true
		    
		  #else
		    
		    return false
		    
		    #pragma unused pathToTool
		    #pragma unused args
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  me.Destructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Default constructor that will lead to asking the user for his login
		  
		  self.OutputEncoding = Encodings.UTF8 ' default encoding for ReadAll()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(userName as String, password as String)
		  // Custom constructor that uses the given username and password
		  
		  me.Constructor
		  SetUsernameAndPassword userName, password
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  #if TargetMacOS
		    
		    // Destroy the timer
		    if zPollTimer IsA Timer then
		      zPollTimer.Mode = Timer.ModeOff
		      RemoveHandler zPollTimer.Action, AddressOf pHandlePollTimerAction
		      zPollTimer = nil
		    end if
		    
		    declare sub AuthorizationFree lib "Security" ( ref as integer, flags as Integer)
		    
		    // If we have an authRef, free it
		    if authRef <> 0 then
		      AuthorizationFree( authRef, 8 )
		      authRef = 0
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorNumber() As Integer
		  // since the error number shouldn't be writable,
		  // we just have an accessor method for it.
		  return errNum
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLive() As Boolean
		  return zIsLive
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pHandlePollTimerAction(sender As Timer)
		  // Added by Kem Tekinay.
		  // Handles the PollTimer's Action event.
		  // Calls Poll every 10 ms or so.
		  // Checks IsLive first in case the developer called Poll from outside.
		  // Checks after polling too just to save another timer cycle.
		  
		  if self.IsLive then
		    self.Poll // Poll it
		  end if
		  
		  // Afterwards...
		  if not self.IsLive then
		    // We're done, so turn off the timer
		    sender.Mode = Timer.ModeOff
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Poll()
		  #if TargetMacOS
		    
		    declare function fread lib "System" (buffer as Ptr, size as integer, nmemb as integer, stream as Integer) as Integer
		    declare function feof lib "System" (file as Integer) as boolean
		    declare function fclose lib "System" (file as Integer) as Integer
		    declare function ferror lib "System" (file as integer) as Integer
		    
		    // create a local buffer
		    // if this gets called a lot, we should consider
		    // changing this to be a property on the class
		    // and possibly increasing the size
		    // However, 1024 seems like an OK chunk size for now
		    dim localBufferMB as new MemoryBlock(1024)
		    dim localBuffer as string
		    // Using a localBuffer here rather than just adding to the main buffer
		    // ensures that DataAvailable is only called once for new data.
		    // Otherwise, data sitting the in buffer would keep triggering DataAvailable
		    // on every Poll.
		    dim err as Integer
		    
		    // Make sure that we're live
		    if isLive then
		      // Just satisfy the loop condition to begin with
		      err = 1024
		      // Basically the idea is that we'll loop until it gives us
		      // back less than the full buffer. When it retuns less than
		      // our buffer size, either it's EOF, or an error occurred,
		      // or we're just fine (EAGAIN)
		      while err = 1024
		        // read from the file into our buffer
		        err = fread(localBufferMB, 1, 1024, file)
		        // add the local buffer to our real buffer
		        localBuffer = localBuffer + localBufferMB.StringValue(0,err)
		      wend
		      
		      // If we are at the EOF
		      if feof(file) then
		        // then we need to close the file
		        err = fclose(file)
		        // Make it so that we aren't live anymore
		        zIsLive = false
		        
		      elseif err <= -1 then // we may have a problem
		        // Read the error number
		        errNum = ferror(file)
		        
		        // 35 is the number for EAGAIN -- in Non-blocking mode,
		        // it's used to signify that the file isn't ended
		        // and we need to try, try again later
		        if errNum = 35 then
		          // just no data this time
		          errNum = 0
		        else
		          // We have an error
		          zIsLive = false
		          call fclose(file)
		        end if
		      end if
		    end if
		    
		    // Add the local buffer to the main buffer
		    buffer = buffer + localBuffer
		    
		    // If we have any new data available, we should fire the DataAvailable event
		    if localBuffer <> "" then
		      RaiseEvent DataAvailable()
		    end if
		    
		    // Raise Completed event if needed (added by Kem Tekinay)
		    if not zIsLive then
		      RaiseEvent Completed()
		    end if
		    
		    // Timer will be turned off in pHandlePollTimerAction
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadAll() As String
		  // This method simply returns the buffer
		  // and then clears it out
		  dim s as string = buffer.DefineEncoding( self.outputEncoding )
		  buffer = ""
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  // Resets the authorization so you can, for example, use a different username and password
		  
		  me.Destructor
		  me.Constructor // Will preserve existing username and password
		  errNum = 0
		  zIsLive = false
		  buffer = ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Result() As String
		  // This method simply returns the buffer without clearing
		  // the contents
		  
		  dim s as string = buffer.DefineEncoding( outputEncoding )
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUsernameAndPassword(userName as String, password as String)
		  // If used, must be called before the first invocation of AuthorizeAndExecute!
		  
		  if authRef <> 0 then
		    break // If you get here, you're invoking this too late, i.e. AuthorizeAndExecute has already been used
		  else
		    usernamePassword = userName : password
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(s as string)
		  #if TargetMacOS
		    
		    declare function fwrite lib "/usr/lib/libc.dylib" (buffer as CString, size as integer, num as integer, stream as Integer) as integer
		    
		    // We can only write to a live connection
		    if isLive then
		      // Write the string
		      call fwrite(s, 1, lenb(s), file)
		    end if
		    
		  #else
		    
		    #pragma unused s
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteLine(s as string)
		  // We assume that our shell is Mac OS X only for now
		  // and we simply call through to write
		  Write s + EndOfLine.UNIX
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Completed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataAvailable()
	#tag EndHook


	#tag Note, Name = About
		This is the AuthorizationShell, as originally written by
		Jonathan Johnson around 2006.
		
		In 2008 it was revised with changes by Tim Jones, and
		renamed to MacAuthorizationShell.
		
		Revisions by Thomas Tempelmann, Oct 2013,
		with the following changes:
		
		• Fixes a crashing bug in the Destructor ("byref" had to
		   be removed) that occurs on OSX 10.9 but not before.
		• Adds ability to pass username and password so that
		   the user won't be asked any more (see "Using Keychain"
		   Note).
		• Renamed it back to "AuthorizationShell"
		• Cleaned up the demo project and made it work with
		   Cocoa (by setting the output encoding).
		
		Revisions by Kem Tekinay, Nov. 2013:
		
		• Added internal Timer for polling.
		• Ensured Completed event fires when completed.
		• Added Close method.
	#tag EndNote

	#tag Note, Name = Issues
		No error detection (Oct 2013)
		-------------------------
		Commands may report errors via the "stderr" pipe. These are not
		seen by this shell. If you need the stderr output, you'll have to
		wrap your command invocation into a shell that re-routes stderr
		into stdout or into a disk file that you then have to read separately.
		See ths article, for example:
		http://www.cocoabuilder.com/archive/cocoa/38847-stderr-from-authorizationexecutewithprivileges.html#45899
	#tag EndNote

	#tag Note, Name = Update Info (Tim Jones)
		(Original note by Tim Jones.)
		
		This authorization module was originally written by Jon Johnson
		while he worked at REALSoftware. 
		
		There was an issue in the manner in which the AuthorizeAndExecute
		function was designed as it expected a ParamArray (VARARGS) for
		the command arguments to be passed to the function.  However, it 
		was trying to separate the arguments from an array.  I've modified 
		that expectation to use a String Array - which is a lot easier
		for most RB programmers to create and understand.
		
		Additionally, I've duplicated all of the normal Shell events and 
		methods to allow you to basically drop an AuthorizationShell into
		any app by simply changing your Shell controls' super.
		
		IsLive was changed to a method to return a private property so it
		cannot be changed from outside the class.
		
		These are the only changes that I've made to Jon's original coding for 
		this module.
		
		To use it, simply copy this class module into your application and
		create a subclassed control.
		
		The Window1 window has been added and all of the details of the
		call are outlined in the pbAuthenticate button's Action event.
		
		The code there that splits the commandline passed was created to 
		simply demonstrate the numerous ways that a command line's args
		may be constructed - quote pairs, tick pairs, escaped spaces,
		and others.  I'm sure that the example doesn't cover 100% of the 
		possibilities, but it should give you a relatively good starting
		point.
		
		The only things that are necessary is that you pass the full path
		to your command (i.e.: /bin/cp instead of simply cp) and a string 
		array of the arguments - one argument per array member.
		
		Aug 24, 2008 - Tim Jones, tolistim@me.com
	#tag EndNote

	#tag Note, Name = Usage
		(Thomas Tempelmann, October 2013)
		
		The included AuthorizationShellExample shows how to use this
		class to work as an interactive shell.
		
		You may, of course, also simply invoke AuthorizeAndExecute
		with a command that runs with root permissions and quits
		right away again, without any interaction. If you keep an object
		of this class alive, you can then call AuthorizeAndExecute
		multiple times without requiring the user to re-enter his
		admin credentials each time.
		
		For instance, you could do this to execute several commands with root
		permissions in succession:
		
		dim sh as new AuthorizationShell
		if not AuthorizeAndExecute ("cp", Array ("-R", "/source/path", "/dest/path")) then
		  // this cmd failed
		elseif not AuthorizeAndExecute ("cp", Array ("-R", "/source/anotherpath", "/dest/path")) then
		  // this cmd failed
		end
	#tag EndNote

	#tag Note, Name = Using the Keychain
		(Thomas Tempelmann, October 2013)
		
		If you like to retrieve the username and password from the keychain, use the
		following code. Then instruct the user to use "Keychain Access" to add a new
		password item with the name you specify below for "itemName", with name and
		password. Then your app can read them and pass them to the constructor or
		to SetUsernameAndPassword.
		
		The KeychainServices module is part of macoslib (https://github.com/macoslib/macoslib)
		
		  // retrieves Username and password from Keychain
		  const itemName = "..." // give this your app's name, for instance.
		  try
		    #pragma BreakOnExceptions false
		    dim kc as new KeychainServices.Keychain
		    dim ki as KeychainServices.KeychainItem = kc.FindGenericPasswordItem (itemName, "")
		    if ki <> nil then
		      dim username, password as String
		      userName = ki.Attribute(KeychainServices.Attribute_Account)
		      password = ki.Data
		    end
		    #pragma BreakOnExceptions default
		  catch
		  end
		
		You can save your password in your personal keychain just for your app so that you won't be asked for it every time any more. Here's how:
		
		• Launch the program Keychain Access.app
		• From the File menu, choose New Password Item (Cmd+N).
		• In the appearing dialog, enter “<keychainEntryName>" for the Keychain Item Name, then enter your Admin user name
		  (i.e. your Mac login name) and your Admin password into the Account Name and Password fields.
		• Save it (i.e. click the Add button). This will have added a password item of kind application password with the 
		  name <keychainEntryName> to your default keychain.
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private authRef As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private buffer As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private errNum As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private file As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private outputEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private usernamePassword As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zIsLive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zPollTimer As Timer
	#tag EndProperty


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
End Class
#tag EndClass

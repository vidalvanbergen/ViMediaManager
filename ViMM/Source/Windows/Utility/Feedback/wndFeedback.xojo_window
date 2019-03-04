#tag Window
Begin Window wndFeedback
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   573
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   False
   Title           =   "#kWindowTitle"
   Visible         =   True
   Width           =   600
   Begin CanvasLogo cvsLogo
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   128
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   128
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   28
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   160
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kFeedbackForm"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   24.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   420
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   54
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   160
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kDescription"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   60
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   420
   End
   Begin PopupMenu popFeedbackType
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#kTypeFeedback\n#kTypeSupport\n#kTypeBugReport"
      Italic          =   False
      Left            =   160
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   126
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin TextField edtEmail
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "someone@somewhere.com"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   160
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   160
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin TextArea edtDescription
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   100
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   160
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   194
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   420
   End
   Begin CheckBox chkSendSystemProfile
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "#kSendAnonymousSystemProfile"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   160
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      State           =   1
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   306
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   288
   End
   Begin RatingCanvas cvsRating
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   460
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Rating          =   0
      Scope           =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   160
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   120
   End
   Begin PushButton btnSend
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kButtonSendFeedback"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   430
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   338
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin SMTPSecureSocket MailSocket
      CertificateFile =   
      CertificatePassword=   ""
      CertificateRejectionFile=   
      ConnectionType  =   3
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   2
      Secure          =   True
      SMTPConnectionMode=   0
      TabPanelIndex   =   0
   End
   Begin TabPanel tabLog
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   175
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Panels          =   ""
      Scope           =   2
      SmallTabs       =   False
      TabDefinition   =   "#kSystem\r#kError"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   378
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   560
      Begin TextArea edtSystemSettings
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   117
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "tabLog"
         Italic          =   False
         Left            =   40
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   2
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   416
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   520
      End
      Begin TextArea edtErrorLog
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   117
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "tabLog"
         Italic          =   False
         Left            =   40
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   2
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   416
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   520
      End
   End
   Begin PushButton btnCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "#loc.dlgCancel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   338
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   338
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DisclosureTriangle dtMoreInfo
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   0
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   341
      Transparent     =   False
      Value           =   False
      Visible         =   True
      Width           =   18
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   7
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kEmail"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   161
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   128
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#loc.kDescription"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   194
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   128
   End
   Begin LabelFor lblForRating
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   372
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kRateThisApp"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   127
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   208
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  self.Title = AppSettings.kAppName + " " + AppSettings.PrettyVersion + " " + kWindowTitle
		  popFeedbackType.ListIndex = 0
		  self.Height = 378
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AddErrorLog(err as RuntimeException, Location as string = "")
		  popFeedbackType.ListIndex = 2
		  popFeedbackType.Visible = False
		  lblArray(1).Text = kDescriptionError
		  
		  if err <> Nil then
		    
		    dim errInfo, errStack, errMessages as string
		    // some general info
		    errInfo = "<h2>_______ Error Message _______</h2>" + "<br/>"
		    errInfo = errInfo + "<b>Runtime Exception:</b> " + TypeOfException( err ) + "<br/>"
		    errInfo = errInfo + "<b>Error:</b> " + Str( err.ErrorNumber ) + "<br/>"
		    errInfo = errInfo + "<b>Message:</b> " + err.Message + "<br/>"
		    #if RBVersion >= 2014 then
		      errInfo = errInfo + "<b>Reason:</b> " + err.Reason + "<br/>"
		    #endif
		    if Location <> "" then
		      errInfo = errInfo + "<b>Location:</b> " + Location
		    end if
		    
		    
		    // Stack info
		    dim stack() as string' = err.Stack
		    stack = Helpers.CleanStack( err )
		    if stack <> Nil and stack.Ubound > -1 then
		      errStack = errStack + "<br/>"
		      errStack = errStack + "<h2>_______ Stack _______</h2>" + "<br/>"
		      for index as Integer = 0 to stack.Ubound
		        'if NOT stack( index ).Contains( "REALbasic" ) and NOT stack( index ).Contains( "XojoFramework" ) then
		        errStack = errStack + stack( index ) + "<br/>"
		        'end if
		      next
		    end if
		    
		    
		    // Debug log messages
		    if Helpers.LogMessages <> Nil and Helpers.LogMessages.Ubound > -1 then
		      errMessages = errMessages + "<br/>"
		      errMessages = errMessages + "<h2>_______ Log Messages _______</h2>" + "<br/>"
		      for each LogMessage as string in Helpers.LogMessages
		        errMessages = errMessages + LogMessage + "<br/>"
		      next
		    end if
		    
		    
		    // Merge Info
		    pInfoError = errInfo + errStack + errMessages
		    edtErrorLog.Text = ReplaceAll( pInfoError, "<br/>", EndOfLine ).RemoveTags
		  end if
		  
		  'self.ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SendMail()
		  
		  self.Hide
		  
		  dim subject as string = popFeedbackType.Text + " " + AppSettings.kAppName + " " + AppSettings.PrettyVersion + " / " + App.ExecutableFile.CreationDate.SQLDateTime.ReplaceAll( " ", "T" )
		  dim message as string
		  message = "<h1>" + subject + "</h1>" + "<br/>"
		  if chkSendSystemProfile.Value then
		    message = message + pInfoSystem
		  end if
		  message = message + pInfoSettings
		  
		  if popFeedbackType.ListIndex = 0 then
		    message = message + "<h2>_______ User Rating _______</h2>" + "<br/>"
		    message = message + Str( cvsRating.Rating ) + " Stars"
		    message = message + "<br/>"
		  end if
		  
		  if trim( edtEmail.Text ) <> ""  then
		    message = message + "<h2>_______ eMail Address _______</h2>" + "<br/>"
		    message = message + trim( edtEmail.Text )
		    message = message + "<br/>"
		  end if
		  
		  if trim( edtDescription.Text ) <> "" then
		    message = message + "<h2>_______ Description _______</h2>" + "<br/>"
		    message = message + trim( edtDescription.Text.ReplaceAll( EndOfLine, "<br/>" ) ) + "<br/>"
		    message = message + "<br/>"
		  end if
		  message = message + pInfoError
		  
		  // Some CSS
		  dim style as string = "<style>" + EndOfLine
		  style = style + "h1 { font-size: 1.5em; display: block; }" + EndOfLine
		  style = style + "h2 { font-size: 1.2em; display: inline-block; }" + EndOfLine
		  style = style + "b { display: inline-block; min-width: 180px; }" + EndOfLine
		  style = style + "</style>"
		  
		  
		  #if True then
		    
		    // Because I can't seem to get the mailer to work right
		    message = message.RemoveTags
		    ShowURL "mailto:vimediamanager@gmail.com?subject=" + _
		    URLEncode( AppSettings.kAppName.ToText ) + " v" + AppSettings.PrettyVersion + " - " + popFeedbackType.Text + "&body=" + _
		    message.ReplaceAll("<br/>", Chr(10)+chr(13))
		    
		    self.Close
		    
		  #else
		    
		    // Attachments
		    dim attch() as EmailAttachment
		    
		    if FileAttachments <> Nil and FileAttachments.Ubound > -1 then
		      for each file as FolderItem in FileAttachments
		        if file <> Nil and file.Exists and file.IsReadable then
		          dim theAttachment as new EmailAttachment
		          theAttachment.LoadFromFile( file )
		          if theAttachment <> Nil then
		            attch.Append theAttachment
		          end if
		          
		        end if // @END file <> Nil
		      next
		    end if
		    
		    // Set and Send Mail message
		    MailSocket.Address = "smtp.gmail.com"
		    MailSocket.Port = 465
		    MailSocket.ConnectionType = SMTPSecureSocket.TLSv1
		    MailSocket.SMTPConnectionMode = SMTPSecureSocket.ModeSSLTLS
		    
		    MailSocket.Username = 'AppSettings.kgmail
		    MailSocket.Password = 'DecodeHex( AppSettings.kgmailEncPassword )
		    
		    dim mail as new EmailMessage
		    if trim( edtEmail.Text ) <> "" then
		      mail.FromAddress = trim( edtEmail.Text )
		    end if
		    if mail.FromAddress = "" then
		      mail.FromAddress = "unknown@user.com"
		    end if
		    mail.Subject = subject
		    mail.BodyPlainText = message.ReplaceAll( "<br/>", EndOfLine ).RemoveTags
		    mail.BodyHTML = style + Message
		    if attch <> Nil and attch.Ubound > -1 then
		      mail.Attachments = attch
		    end if
		    mail.Headers.AppendHeader( "X-Mailer","Xojo SMTP Test" )
		    mail.AddRecipient "vimediamanager@gmail.com"
		    
		    MailSocket.Messages.Append( mail )
		    MailSocket.SendMail
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Error As RuntimeException
	#tag EndProperty

	#tag Property, Flags = &h0
		FileAttachments() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pInfoError As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pInfoSettings As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pInfoSystem As String
	#tag EndProperty


	#tag Constant, Name = kButtonSendFeedback, Type = String, Dynamic = True, Default = \"Send Feedback", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Send Feedback"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Feedback verzenden"
	#tag EndConstant

	#tag Constant, Name = kButtonSendReport, Type = String, Dynamic = True, Default = \"Send Report", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Send Report"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Rapport verzenden"
	#tag EndConstant

	#tag Constant, Name = kButtonSendRequest, Type = String, Dynamic = True, Default = \"Send Request", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Send Request"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verzoek verzenden"
	#tag EndConstant

	#tag Constant, Name = kDescription, Type = String, Dynamic = True, Default = \"Please provide a detailed description of your problem\x2C suggestion\x2C bug-report or question before sending your feedback.", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Please provide a detailed description of your problem\x2C suggestion\x2C bug-report or question before sending your feedback."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geef een gedetailleerde beschrijving van uw probleem\x2C suggestie\x2C bug-rapport of vraag voor het versturen."
	#tag EndConstant

	#tag Constant, Name = kDescriptionError, Type = String, Dynamic = True, Default = \"This application has experienced an error\x2C please write a detailed description of what you where doing before the error occurred.", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"This application has experienced an error\x2C please write a detailed description of what you where doing before the error occurred."
	#tag EndConstant

	#tag Constant, Name = kEmail, Type = String, Dynamic = True, Default = \"Email:", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Email:"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Email:"
	#tag EndConstant

	#tag Constant, Name = kError, Type = String, Dynamic = True, Default = \"Error", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Error"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Fout melding"
	#tag EndConstant

	#tag Constant, Name = kFeedbackForm, Type = String, Dynamic = True, Default = \"Feedback Form", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Feedback Form"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Terugkoppelings formulier"
	#tag EndConstant

	#tag Constant, Name = kRateThisApp, Type = String, Dynamic = True, Default = \"Rate this application", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Rate this application"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Beoordeel dit programma"
	#tag EndConstant

	#tag Constant, Name = kSendAnonymousSystemProfile, Type = String, Dynamic = True, Default = \"Send anonymous system profile", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Send anonymous system profile"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verstuur anonymous systeem profiel"
	#tag EndConstant

	#tag Constant, Name = kSystem, Type = String, Dynamic = True, Default = \"System", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"System"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Systeem"
	#tag EndConstant

	#tag Constant, Name = kTypeBugReport, Type = String, Dynamic = True, Default = \"Bug-Report", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Bug-Report"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Fout melding"
	#tag EndConstant

	#tag Constant, Name = kTypeFeedback, Type = String, Dynamic = True, Default = \"Feedback", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Feedback"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Terugkoppeling"
	#tag EndConstant

	#tag Constant, Name = kTypeSupport, Type = String, Dynamic = True, Default = \"Support Request", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Support Request"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verzoek om ondersteuning"
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"Feedback", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Feedback"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Terugkoppeling"
	#tag EndConstant


#tag EndWindowCode

#tag Events popFeedbackType
	#tag Event
		Sub Change()
		  
		  Select case me.ListIndex
		    
		  case 0
		    btnSend.Caption = kButtonSendFeedback
		    
		  case 1
		    btnSend.Caption = kButtonSendRequest
		    
		  case 2
		    btnSend.Caption = kButtonSendReport
		    
		  End Select
		  
		  cvsRating.Visible = ( me.ListIndex = 0 )
		  lblForRating.Visible = ( me.ListIndex = 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSend
	#tag Event
		Sub Action()
		  SendMail
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MailSocket
	#tag Event
		Sub ServerError(ErrorID as integer, ErrorMessage as string, Email as EmailMessage)
		  #Pragma Unused ErrorID
		  #Pragma Unused Email
		  
		  log "Error: " + ErrorMessage
		  MsgBox "Error: " + ErrorMessage
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edtSystemSettings
	#tag Event
		Sub Open()
		  
		  
		  dim system as string
		  system = "<h2>_______ Machine Info _______</h2>" + "<br/>"
		  system = system + "<b>Operating System:</b> " + Helpers.OSVersion + "<br/>"
		  #if TargetMacOS then
		    system = system + "<b>CPU Speed:</b> " + Str( MacSystemProfiler.HW_ProcessorSpeed ) + "<br/>"
		    system = system + "<b>CPU Type:</b> " + trim( MacSystemProfiler.HW_CPUType ) + "<br/>"
		    'system = system + "<b>PROCESSOR_COUNT:</b> " + Str( SystemInformationMBS.ProcessorCount ) + "<br/>"
		    system = system + "<b>RAM Size:</b> " + FormatSize( MacSystemProfiler.HW_MemoryAsBytes ) + "<br/>"
		    system = system + "<b>Machine Model:</b> " + MacSystemProfiler.HW_ModelIdentifier + "<br/>"
		    system = system + "<b>OS Version:</b> " + MacSystemProfiler.SystemSoftwareVersion + "<br/>"
		    system = system + "<b>Screen Width:</b> " + str( Screen(0).Width ) + "<br/>"
		    system = system + "<b>Screen Height:</b> " + Str( Screen(0).Height ) + "<br/>"
		    system = system + "<b>Retina:</b> " + Str( self.ScalingFactor >= 2 ) + "<br/>"
		  #elseif TargetWin32 then
		  #elseif TargetLinux then
		  #endif
		  system = system + "<br/>"
		  
		  dim settings as string
		  settings = "<h2>_______ Settings _______</h2>" + "<br/>"
		  settings = settings + "<b>Automatic Updates:</b> " + Str( Preferences.Prefs.Value( "KUCheckForUpdatesAtStartUp", False ) ) + "<br/>"
		  settings = settings + "<br/>"
		  
		  me.Text = ReplaceAll( system + settings, "<br/>", EndOfLine ).RemoveTags
		  
		  pInfoSystem = system
		  pInfoSettings = settings
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancel
	#tag Event
		Sub Action()
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events dtMoreInfo
	#tag Event
		Sub Action()
		  if me.Value then
		    self.Height = 378 + 195
		  else
		    self.Height = 378
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pInfoError"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pInfoSettings"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pInfoSystem"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior

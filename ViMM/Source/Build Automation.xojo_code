#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyToResources
					AppliesTo = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vUmVzb3VyY2VzL21lZGlhaW5mbw==
					FolderItem = Li4vLi4vUmVzb3VyY2VzL0RTQS9kc2FfcHViLnBlbQ==
				End
				Begin IDEScriptBuildStep RunIDEScriptStep , AppliesTo = 3
					Dim AppLocation as String = CurrentBuildAppName + ".app"
					AppLocation = AppLocation.ReplaceAll( " ", "\ " )
					AppLocation = CurrentBuildLocation + "/" + AppLocation
					
					Dim CmdStart as String = "/usr/bin/defaults write " + AppLocation + "/Contents/Info "
					Call DoShellCommand( CmdStart + """LSMinimumSystemVersion"" 10.7.0")
					Call DoShellCommand( CmdStart + """NSHighResolutionCapable"" -boolean YES") // Retina
					Call DoShellCommand( CmdStart + """NSRequiresAquaSystemAppearance"" -boolean NO") // Dark Mode
					Call DoShellCommand( CmdStart + """AppleMagnifiedMode"" -boolean NO")
					Call DoShellCommand( CmdStart + """CFBundleAllowMixedLocalizations"" -boolean YES")
					Call DoShellCommand( CmdStart + """LSApplicationCategoryType"" ""public.app-category.video""")
					Call DoShellCommand( CmdStart + """SUPublicDSAKeyFile"" ""dsa_pub.pem""")
					
					
					
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation

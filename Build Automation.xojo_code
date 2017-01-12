#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyBinariesMac
					AppliesTo = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vcmVzb3VyY2VzL21hY09TL2NtYXJr
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation

#tag Module
Protected Module CommonMark
	#tag Method, Flags = &h21
		Private Function GetBinaryPath() As String
		  /// ------------------------------------------------------------------------------------------------
		  ' Returns the path of the cmark binary. Cached by the Initialise() method to save speed later.
		  
		  ' Returns: String
		  /// ------------------------------------------------------------------------------------------------
		  
		  #if TargetMacOS or TargetLinux
		    return ResourcesFolder.Child("cmark").ShellPath
		  #else
		    return ResourcesFolder.Child("cmark.exe").ShellPath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Initialise()
		  /// ------------------------------------------------------------------------------------------------
		  ' Initialises required properties. Only needs to be called once per project
		  /// ------------------------------------------------------------------------------------------------
		  
		  ' Do we need to initialise?
		  if mInitialised then return
		  
		  myShell = new Shell
		  
		  ' Cache the path to the cmark binary
		  cmarkBinaryPath = GetBinaryPath()
		  
		  ' Flag that we've done the initialisation
		  mInitialised = True
		  
		  ' Do a quick Markdown parse to reduce the subsequent parse times
		  dim md as Text = "Hello"
		  dim html as Text = CommonMark.ToHTML(md)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ResourcesFolder() As FolderItem
		  /// ------------------------------------------------------------------------------------------------
		  ' Returns the resources folder within the app bundle
		  ' Based on the code from the TPSF module (https://github.com/devtimi/TPSF)
		  /// ------------------------------------------------------------------------------------------------
		  
		  #if TargetMacOS then
		    static mResourcesFolder as folderitem
		    
		    if mResourcesFolder = nil or mResourcesFolder.exists = false then
		      declare function NSClassFromString lib "AppKit" ( className as CFStringRef ) as Ptr
		      declare function mainBundle lib "AppKit" selector "mainBundle" ( NSBundleClass as Ptr ) as Ptr
		      declare function resourcePath lib "AppKit" selector "resourcePath" ( NSBundleRef as Ptr ) as CfStringRef
		      mResourcesFolder = getFolderItem( resourcePath( mainBundle( NSClassFromString( "NSBundle" ) ) ), folderItem.pathTypeNative )
		    end if
		    
		    return mResourcesFolder
		    
		  #elseif TargetWin32 then
		    dim rsrcFolder as FolderItem = App.ExecutableFile.Parent.Child("Resources")
		    if rsrcFolder.Exists then
		      return rsrcFolder
		    else
		      dim pathStringVar as String = App.ExecutableFile.NativePath
		      pathStringVar = pathStringVar.Left(pathStringVar.Len - 4) + " Resources"
		      return GetFolderItem(pathStringVar)
		    end
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ToHTML(markdown as Text) As Text
		  /// ------------------------------------------------------------------------------------------------
		  ' Converts the passed Markdown to HTML using the cmark binary.
		  
		  ' parameter markdown: The Markdown source as Text to convert.
		  
		  ' returns: The HTML output from cmark as Text.
		  /// ------------------------------------------------------------------------------------------------
		  
		  dim name as String
		  dim f as FolderItem
		  
		  ' Check the module has been initialised
		  if not mInitialised then Initialise()
		  
		  'Write the markdown to a temporary file
		  name = "cmark" + Str(Microseconds) + ".md"
		  f = SpecialFolder.Temporary.Child(name)
		  WriteToFile(f, markdown)
		  
		  ' Use cmark to transform the contents of our temporary file to HTML
		  myShell.Execute(cmarkBinaryPath + " " + f.ShellPath)
		  
		  ' Delete the temporary file
		  f.Delete()
		  
		  ' Return the result
		  return myShell.Result.ToText
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteToFile(file as FolderItem, contents as String)
		  /// ------------------------------------------------------------------------------------------------
		  ' Writes the passed String to the specified file.
		  
		  ' parameter file: The file to write to (classic FolderItem)
		  ' parameter contents: The String to write
		  /// ------------------------------------------------------------------------------------------------
		  
		  dim out as TextOutputStream
		  
		  try
		    out = TextOutputStream.Create(file)
		    out.Write(contents)
		    out.Close()
		  catch e as IOException
		    MsgBox("WriteToFile: Unable to write to the passed file")
		  end try
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This module is a wrapper for the cmark command line binary that must be bundled into your application.
		The binary should be named `cmark` and be copied into the `Resources` folder within the app bundle.
		
		More info on cmark here: https://github.com/jgm/cmark
		
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			Read only by end-user.
		#tag EndNote
		Private cmarkBinaryPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialised As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myShell As Shell
	#tag EndProperty


	#tag Constant, Name = VERSION, Type = Text, Dynamic = False, Default = \"1.0.0", Scope = Protected
	#tag EndConstant


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

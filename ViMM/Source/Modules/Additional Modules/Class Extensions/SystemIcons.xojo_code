#tag Module
Protected Module SystemIcons
	#tag Method, Flags = &h1
		Protected Function ActionTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameActionTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameActionTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AddTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameAddTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameAddTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Advanced(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameAdvanced. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameAdvanced", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ApplicationIcon(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameApplicationIcon. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameApplicationIcon", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function BluetoothTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameBluetoothTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameBluetoothTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Bonjour(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameBonjour. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameBonjour", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function BookmarksTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameBookmarksTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameBookmarksTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Caution(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameCaution. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameCaution", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorPanel(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameColorPanel. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameColorPanel", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColumnViewTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameColumnViewTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameColumnViewTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Computer(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameComputer. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameComputer", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DotMac(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameDotMac. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameDotMac", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EnterFullScreenTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameEnterFullScreenTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameEnterFullScreenTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Everyone(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameEveryone. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameEveryone", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExitFullScreenTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameExitFullScreenTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameExitFullScreenTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FlowViewTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameFlowViewTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameFlowViewTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Folder(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameFolder. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameFolder", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderBurnable(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameFolderBurnable. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameFolderBurnable", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderSmart(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameFolderSmart. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameFolderSmart", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FollowLinkFreestandingTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameFollowLinkFreestandingTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameFollowLinkFreestandingTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FontPanel(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameFontPanel. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameFontPanel", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPictureFromName(name as string, wantedWidth as double = 0.0, wantedHeight as double = 0.0) As Picture
		  //# Build a Picture given the picture name (see Apple docs) and an optional size (0 for full size)
		  
		  #if TargetMacOS
		    dim nsi as NSImage
		    dim scale as double
		    dim w, h as double
		    dim cgi as CGImage
		    dim size as Cocoa.NSSize
		    
		    nsi = NSImage.LoadByNameWithSymbolResolution( name )
		    
		    if nsi=nil then
		      return  nil
		    end if
		    
		    if wantedWidth=0.0 AND wantedHeight=0.0 then
		      cgi = nsi.MakeCGImage( )
		    else
		      size = nsi.Size
		      scale = size.width / size.height
		      w = wantedWidth
		      h = wantedHeight
		      if wantedWidth=0.0 then
		        w = scale * h
		      elseif wantedHeight=0.0 then
		        h = w / scale
		      else
		        w = wantedWidth
		        h = wantedHeight
		      end if
		      
		      cgi = nsi.MakeCGImage( w, h )
		    end if
		    
		    if cgi=nil then
		      return  nil
		    end if
		    
		    dim pict as Picture = cgi.MakePicture
		    
		    return  pict
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoLeftTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameGoLeftTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameGoLeftTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoRightTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameGoRightTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameGoRightTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HomeTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameHomeTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameHomeTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IChatTheaterTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameIChatTheaterTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameIChatTheaterTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IconTemplateSetColor(extends SystemIconTemplate as Picture, theColor as Color) As Picture
		  //# Use a system icon (one with Template in its name) and apply the given color.
		  
		  dim pict, mask as Picture
		  
		  pict = new Picture( SystemIconTemplate.width, SystemIconTemplate.Height, 32 )
		  mask = new Picture( SystemIconTemplate.width, SystemIconTemplate.Height, 8 )
		  mask.Graphics.DrawPicture   SystemIconTemplate, 0, 0
		  
		  pict.Graphics.ForeColor = theColor
		  pict.Graphics.FillRect   0, 0, pict.Width, pict.Height
		  pict.Mask( true ).Graphics.DrawPicture   mask, 0, 0
		  
		  return  pict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IconViewTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameIconViewTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameIconViewTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Info(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameInfo. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameInfo", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InvalidDataFreestandingTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameInvalidDataFreestandingTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameInvalidDataFreestandingTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LeftFacingTriangleTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameLeftFacingTriangleTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameLeftFacingTriangleTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ListViewTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameListViewTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameListViewTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LockLockedTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameLockLockedTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameLockLockedTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LockUnlockedTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameLockUnlockedTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameLockUnlockedTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MenuMixedStateTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameMenuMixedStateTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameMenuMixedStateTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MenuOnStateTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameMenuOnStateTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameMenuOnStateTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MobileMe(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameMobileMe. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameMobileMe", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MultipleDocuments(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameMultipleDocuments. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameMultipleDocuments", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Network(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameNetwork. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameNetwork", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PathTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNamePathTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNamePathTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PreferencesGeneral(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNamePreferencesGeneral. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNamePreferencesGeneral", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function QuickLookTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameQuickLookTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameQuickLookTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RefreshFreestandingTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameRefreshFreestandingTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameRefreshFreestandingTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RefreshTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameRefreshTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameRefreshTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RemoveTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameRemoveTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameRemoveTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RevealFreestandingTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameRevealFreestandingTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameRevealFreestandingTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RightFacingTriangleTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameRightFacingTriangleTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameRightFacingTriangleTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShareTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameRemoveTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameShareTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SlideshowTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameSlideshowTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameSlideshowTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SmartBadgeTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameSmartBadgeTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameSmartBadgeTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusAvailable(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameStatusAvailable. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameStatusAvailable", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusNone(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameStatusNone. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameStatusNone", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusPartiallyAvailable(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameStatusPartiallyAvailable. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameStatusPartiallyAvailable", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusUnavailable(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameStatusUnavailable. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameStatusUnavailable", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StopProgressFreestandingTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameStopProgressFreestandingTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameStopProgressFreestandingTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StopProgressTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameStopProgressTemplate. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameStopProgressTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TrashEmpty(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameTrashEmpty. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTrashEmpty", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TrashFull(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameTrashFull. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTrashFull", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function User(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameUser. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameUser", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserAccounts(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameUserAccounts. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameUserAccounts", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserGroup(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameUserGroup. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameUserGroup", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserGuest(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name NSImageNameUserGuest. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameUserGuest", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod


	#tag Note, Name = Transparency
		The obtained Picture objects will handle transparency only with Real Studio 2011r4 or higher.
	#tag EndNote


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

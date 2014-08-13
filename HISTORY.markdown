## Version History: ##

#### ViMediaManager 0.7a# ####
___(The Dailies)___

###### v0.7a4 ##/0#/2013
* __[NEW]__ Added local episode files count sorting. (Refresh the list)
* __[NEW]__ Added a new option to update episode files in the File menu, which will go through the list to see which shows have local files and updates those.
* __[NEW]__ Archive (rar/zip/multi-rar) files are recognized as episode files in the tv list.
* __[NEW]__ Added .3DSBS and .3DTAB file types to the supported video file formats.
* __[DIF]__ Episodes manager now shows more clearly which files are locally available.
* __[DIF]__ Hopefully made the progress/wait dialog a bit less crashy when pushing the 'cancel' button.
* __[DIF]__ Better episode sorting when sorted by next aired. (Refresh the list)
* __[DIF]__ Updated 'mediainfo' to v0.7.61.

###### v0.7a3 19/02/2013
* __[NEW]__ Added an option to disable episode file management.
* __[FIX]__ Fixed a serious bug where episodes with dvd order would cause ViMM to crash.

###### v0.7a2 19/02/2013
* __[NEW]__ Added options to choose the default trailer source and quality.
* __[DIF]__ French translation corrections by Yannick Rose.
* __[DIF]__ German translation corrections by Nicolas Dörig.
* __[DIF]__ IMDb changed it's layout slightly, so I updated the IMDb scraper slightly.
* __[DIF]__ Season art is downloaded directly to the television show folder rather then in 'Season ##' subfolders, as per XBMC wiki instructions.
* __[FIX]__ Fixed a bug where it wouldn't show which episodes are locally available on non-retina screens.
* __[FIX]__ Fixed a bug where 'canceled' shows showed up under 'To be announced'.
* __[FIX]__ Fixed an issue where it would not write actor data to episode NFO files.
* __[FIX]__ Fixed a bug in updating tv ratings.
* __[FIX]__ Fixed another bug in updating movie ratings.
* __[FIX]__ Worked around a little refreshing issue in the movies metadata editor.

###### v0.7a1 13/02/2013
* __[NEW]__ HOT! Added the television section! I won't mention all the details here, but a LOT of work has gone into making this section beautiful and functional, so you guys 'n gals better appreciate it. ;)
* __[NEW]__ Added Svenska translation, courtesy of Mikael "Aros" Lehmann, thank you the hard work!
* __[NEW]__ Added German translation, courtesy of Efty Edge, thank you for the hard work!
* __[NEW]__ Added french translations, courtesy of Yannick Rose, thank you for the hard work!
* __[NEW]__ ViMM now comes with a user manual, courtesy of Jim Worrall, thank you for the hard work!
* __[NEW]__ Finally added the ability to automatically download trailers! which will download the first youtube trailer available.
* __[NEW]__ Added recommendations from Rotten Tomatoes.
* __[NEW]__ Added an option to choose weather to 'ask first', 'never' or 'always' remove existing images.
* __[NEW]__ Added a menu option to mark a movie as watched, and with it the "cmd + T" option to do so quickly.
* __[NEW]__ Made the 'Missing Items' results window A LOT better. (The previous version was meant for internal debugging.)
* __[NEW]__ Added an option to download actor thumbs to the item's folders, and set thumb paths accordingly.
* __[NEW]__ Now scrapes the FULL IMDb cast information in preference to TMDB cast information, and gets a full list of certifications for every country available.
* __[NEW]__ Added separate movie file renaming pattern, and some extra tags available to movie names.
* __[NEW]__ You can now sort by extra files's availability.
* __[NEW]__ Added support for tags. ( [http://wiki.xbmc.org/index.php?title=Video_library_tags](http://wiki.xbmc.org/index.php?title=Video_library_tags) )
* __[DIF]__ Translated the PHP code with which I fetched PHP data to native code, hopefully speeding it up, and at the very least making the app no longer lock up for a moment when fetching data. This also makes it even easier for me to add stuff, like full cast scraping, and certifications for every country available on IMDb.
* __[DIF]__ Movie File information is now being looked up while it's writing the NFO file, rather then during the scraping process, it's a lot less error prone, and now home movies also have access to file information being saved upon saving data through the metadata editor.
* __[DIF]__ You can now choose a trailer before you download one when you select the 'download trailer' option from the menu's.
* __[DIF]__ You can now add sets with any name, not just with existing movie names.
* __[DIF]__ Added an optional extra line of information to the movie list, set it through the movie preferences.
* __[DIF]__ Stylised the recommendations list, and added different sections for recommendation sources.
* __[DIF]__ Stylised the sets manager while I was adding styles to the recommendations list.
* __[DIF]__ Added trailer URLs from hd-trailers.net.
* __[DIF]__ Caching poster images on refresh/reload list, so people won't have to manually scroll through the entire list to show poster images.
* __[DIF]__ Rebuild the search window so I can use it for both the movie and television section.
* __[DIF]__ Stopped fetching recommendations for YAMJ users, since it might wrongly think it needs to use the ID for instead.
* __[DIF]__ Clean now has an option to clean 'Other' files, as well as a more thorough image cleaning function.
* __[DIF]__ Tweaked the image picker scrolling settings to be less jumpy and react more predictably.
* __[DIF]__ Added Swedish database language to preferences.
* __[FIX]__ Added the '<playcount>1</playcount>' tag when marking a movie as watched, as otherwise XBMC won't read the <watched> flag, thanks to XBMC Developer 'Memphiz' for pointing this one out!
* __[FIX]__ Fanart.TV decided to change locations.
* __[FIX]__ Fixed a bug where it would crash while trying to get recommendations.
* __[FIX]__ Many other minor, or not so minor bug fixes, changes and stability improvements.
* And anything else that I might have forgotten to add here.



#### ViMediaManager 0.6α# ####
___(The Next Generation)___

###### v0.6α7 11/11/2012
* __[NEW]__ Dropped the unofficial IMDb and the Top250 API's in favour of a scraper that takes it's information from the IMDb itself.
* __[NEW]__ Added an option to show poster images in the list. (Note that this may decrease performance)
* __[NEW]__ Instead of completely refreshing the list, it now updates it. meaning it'll only add new movies if it finds them instead of adding every movie every time, and removes items it can no longer find.
* __[NEW]__ Added recommendations to the metadata editor, but you'll have to update your movies first.
* __[NEW]__ You can now update a single movie by right-clicking it in the list and choosing 'update movie'.
* __[NEW]__ You can now get rid some of the visual clutter by disabling one or more of the mini-icons in the list.
* __[NEW]__ Changed the layout of the main movie information display, showing more information with less clutter.
* __[NEW]__ Updated growlnotify from 1.3 to 2.0.
* __[NEW]__ Preliminary Boxee support option, which places database ID's at the bottom of the NFO, and adding full shell path for the local poster image thumb.
* __[NEW]__ Added new options to sort the list by movie file size and duration, and added checkmarks to display which options are currently selected.
* __[NEW]__ Added 'kijkwijzer' symbols to go with the new MPAA rating information.
* __[DIF]__ Improved search results by adding a direct IMDb search back-up.
* __[DIF]__ Introduced some caching to the search results window, and tweaked the layout a bit.
* __[DIF]__ Made items that are marked as watched a bit more noticeable by marking their background.
* __[DIF]__ The main & metadata editor's windows have gotten new toolbar icons to match the latest Mac OS X Style. (And are retina ready once there's a stable 'cocoa' build)
* __[DIF]__ Made the actors list re-orderable.
* __[DIF]__ Changed the way it searches for valid .nfo files.
* __[DIF]__ Enabled drag-reordering in the sets manager, but be warned, it's not entirely stable.
* __[DIF]__ First studio is set as default studio while the rest is placed aside, fixing this XBMC Skin bug: http://forum.xbmc.org/showthread.php?tid=82987
* __[FIX]__ Fixed a bug where genres where only downloaded in english, now downloads in the correct localisation when available.
* __[FIX]__ Fixed where it would incorrectly read the subtitle data, leaving it with nothing to write back down to the NFO file on a subsequent save.
* __[FIX]__ Fixed a bug where it would incorrectly handle VIDEO_TS files and extra images during automatic renaming.
* __[FIX]__ Re-added missing trailer icon in the metadata editor’s toolbar.
* __[FIX]__ Fixed where special characters wouldn't show correctly in the search window.
* __[FIX]__ Lots of bug fixes and changes.

###### v0.6α6 24/09/2012
* __[NEW]__ Now getting the actual Top250 IMDb rank from 250.s-anand.net.
* __[NEW]__ Added a preference to use Windows OS save names when renaming items.
* __[NEW]__ Added more mini icons to the list, to show which files you already have.
* __[DIF]__ Added an option to batch update movie ratings.
* __[DIF]__ Moved around some common code blocks for easier maintainability.
* __[DIF]__ Better managing of the cleaning process.
* __[DIF]__ Rewrote the ‘put movies into folders’ function, and hoping it’ll stop causing errors.
* __[DIF]__ Less refreshing in the sets manager, but still in experimental stage.
* __[FIX]__ Fixed some Nil object errors when trying to find nonexistent, previously existing images.
* __[FIX]__ The usual minor bug fixes and changes.


###### v0.6α5 11/09/2012
* __[NEW]__ Added some support for BDMV folder structures.
* __[FIX]__ Fixed not downloading the original title metadata.
* __[FIX]__ Sorting by title and sort title shouldn’t crash the app.
* __[FIX]__ And other bug fixes.


###### v0.6α4 10/09/2012
* __[NEW]__ Updating the TMDB API from v2.1 to v3, which works considerately different and gives a lot of new options such as ‘similar movies’ once I get started on that, so a lot of changes have been made regarding fetching metadata.
* __[NEW]__ Support for fetching metadata from Rotten Tomatoes. (Mostly ratings.)
* __[NEW]__ Added support for Fanart.TV’s extra art for movies. ( [HD]ClearArt, [HD]Logo, Thumb, Disc & Banner)
* __[NEW]__ Added support for extrafanart. (Downloads ALL fanart files from TMDB in the preferences specified sizes for fanart files, much like extra thumbs downloads all fanart files in thumb format)
* __[NEW]__ Search window got a complete makeover, and has been rebuild from scratch for the new TMDB API.
* __[NEW]__ The metadata editor also got a complete makeover to support the new information, such as new images support, the rotten tomatoes ratings and better file info display.
* __[NEW]__ The thumbnail previewer also got a slight overhaul and remake from scratch to make it more accurate, and to move the view if the selection changes to a row above/below the currently viewable thumbnails.
* __[NEW]__ Added ‘Keep media folders organized’ option, which will automagically rename your files and/or folders to match the renaming pattern upon fetching new metadata.
* __[NEW]__ Added Twitter & Facebook sharing options to the action/contextual menus and the ‘Tools’ menu.
* __[NEW]__ Rename a single item trough the action/contextual menus or the ’Tools’ menu.
* __[NEW]__ Update just a movie’s IMDB rating trough the action/contextual menus’ ‘Update Rating’ option.
* __[DIF]__ Since I've overhauled the metadata fetching, opting in for IMDb is not really necessary, it’ll download all available information including IMDB’s. In the future I might set a preference for which DB should be preferred, in case someone likes TMDB plots better.
* __[DIF]__ Also since the new metadata fetching provides more MPAA certifications for multi-countries, I've added them all to a certifications tag to better support multi-nationality.
* __[DIF]__ Shows the progress when you’re reloading the movie list instead of getting temporarily ‘stuck’.
* __[DIF]__ Shows the progress when you’re batch renaming your folders and/or files.
* __[DIF]__ ‘Deleting’ items now moves items to the trash when possible instead of vanishing them into thin air.
* __[DIF]__ Put movies into folders should now work better.
* __[FIX]__ Other bug fixes that I found along the way.

###### v0.6α3 02/06/2012
* __[NEW]__ Finaly support for unicode characters when looking up movies! Movies like Amélie will now pass through successfully.
* __[NEW]__ Adding a set now automatically tries to add movies to the set.
* __[NEW]__ Added a entirely new search field to the 'manual search' window. Also Added the same search field to the main window so people can filter their movies list.
* __[NEW]__ Added some support for .nfo files with only an IMDB URL inside, ViMM will search for information using the IMDB ID from the URL.
* __[DIF]__ Improved IMDb Data fetching.
* __[DIF]__ If the TMDB does not have a match for your movie, it now will still pass trough the unofficial IMDB API to search for information if you have an IMDB ID.
* __[DIF]__ Better support for international information fetching.
* __[DIF]__ Support for NL, DE, FR & UK MPAA rating fetching & displaying.
* __[DIF]__ Lots of changes and improvements to 'batch renaming' files & folders.
* __[FIX]__ Fixed a bug where .nfo files would not be updated with the new poster location after batch renaming, leaving XBMC with nothing but a screenshot to fill in for the thumbnail.
* __[FIX]__ Fixed where movie root folders with the same folder name would overwrite each other in the preferences.
* __[FIX]__ Lots of other minor bug fixes and changes.

###### v0.6α2 19/06/2012
* __[NEW]__ Movie Sets Manager added. (Still experimental)
* __[NEW]__ Some speed improvements trough caching.
* __[NEW]__ Rename folders & files.
* __[DIF]__ Some UI Changes.
* __[FIX]__ Lots of bug fixes and improvements.

###### v0.6α1 13/06/2012
* __[NEW]__ Complete rebuild from scratch, since I learned a lot of new stuff while working on ViMM 0.5x, and I wanted to optimize everything.



#### ViMediaManager v0.5.# ####

###### v0.5.4 09/04/2012
* __[NEW]__ You can now use custom URL's to download trailers.
* __[FIX]__ Fixed downloading trailers from youtube.

###### v0.5.3 10/10/2011
* __[NEW]__ Added the option to sort by rating.
* __[DIF]__ Added 2 new video filetypes for support in scanning.

###### v0.5.2 03/10/2011
* __[NEW]__ Set finder label depending on status color.
* __[NEW]__ Update single show status by right-clicking the show in the list and choosing 'update status'.
* __[NEW]__ Red right-click menu's for the general information area, if you right-click on the poster image it will ask you to download a poster image.
* __[DIF]__ Hiatus status is now much more accurate.
* __[FIX]__ Fixed trailer saving without extensions.

###### v0.5.1 29/09/2011
* __[NEW]__ Added '.iso' to detectable movie file types.
* __[NEW]__ Added support for movie.jpg and movie.tbn as poster names.
* __[DIF]__ Clean out trailers.

###### v0.5 - 27/09/2011
* __[NEW]__ Added cleaning tool which cleans images and NFO files.
* __[NEW]__ Now using the genuine Sparkle framework for software updates.
* __[DIF]__ Use lowercase filenames for compatibility purposes.
* __[DIF]__ Changed the way folder paths are stored so that I might save this to a database in the future.
* __[DIF]__ Moved the preferences from XML to the more usual PLIST format using sparkle setdefaults.
* __[FIX]__ Fixed mass renaming, and probably even optimized it's performance.

###### v0.5b13 - 22/09/2011
* __[NEW]__ Check to see if previous art already exists and asks to delete it before proceeding to scrape data.
* __[NEW]__ Added a sort list button on the mini toolbar below the list, which will re-sort the list without reloading it.
* __[NEW]__ Added new toolbar item "Fetch All Metadata", this will fetch metadata for all media in the currently displayed list that doesn't have any metadata yet.
* __[NEW]__ Added 'Open' image button to the metadata editors to allow users to select images from their harddrives for use as poster, fanart, banner and extra images.
* __[FIX]__ Forgot to check weather or not a poster or fanart URL is available when downloading those for movies.

###### v0.5b12 - 21/09/2011
* __[NEW]__ More descriptive messages when mass updating or mass fetching items.
* __[FIX]__ Changed some naming issues for fanart and posters.
* __[FIX]__ Other minor changes and adjustments.

###### v0.5b11 - 20/09/2011
* __[NEW]__ Added several naming options for movie images, NFO files & trailers.
* __[NEW]__ Single List items can now be updated in stead of having to repopulate the entire list, this will speed things up considerably when editing data.
* __[DIF]__ Removed a lot of repopulate list actions in favor of speed, though this will use a little more RAM. (Keeping everything in memory for now.)
*   Instead people will have to use the refresh button to update the list manualy more often.
* __[FIX]__ Animelist was showing the wrong list icons.

###### v0.5b10 - 19/09/2011
* __[NEW]__ Using a more native OS X toolbar which can be edited.
* __[FIX]__ Hopefully fixed the general display area from shifting itself off of the window.
* __[FIX]__ When selecting an item, check to see if it actually exists before reading NFO.
* __[FIX]__ When trying to read set info, it was trying to dig a layer to deep into nonexistence into the XML, this should be fixed now.
* __[DIF]__ Saved "Future Show" status in NFO file instead of calculating it at startup, this allows to see if shows started showing when doing a mass status update.
* __[DIF]__ Some fixes and changes to sorting lists.
* __[DIF]__ Lots of other minor changes.

###### v0.5b9 - 16/09/2011
* __[NEW]__ Select which images you want to auto download.
* __[FIX]__ Accidentally prevented movie image links to be set in the NFO file.

###### v0.5b8 - 16/09/2011
* __[NEW]__ Added debug mode, hold [ALT] while starting up the app to enter debug mode.
* __[NEW]__ Debug mode disables reading NFO files to fill the sidebar lists.
* __[NEW]__ Faux DVD cases replaced with more general image overlays.
* __[NEW]__ Order lists by title or sort title, show title in the list.
* __[NEW]__ Option for auto downloading images on scraping.
* __[FIX]__ Removed the option Rename Articles Last, since it wasn't actually used anyhow.

###### v0.5b7 - 15/09/2011
* __[NEW]__ Added TVRage ID when scraping shows.
* __[NEW]__ Added CharacterArt support in edit metadata windows.
* __[NEW]__ Added support for "Hiatus" status. Any shows that won't be shows in the next 14 days is classified as in hiatus either when fetching metadata or updating status.
* __[FIX]__ Filter links from plots to avoid crashing.
* __[FIX]__ Better name filtering for '(720p)', '(1080p)' and '-rip'.

###### v0.5b6 - 14/09/2011
* __[NEW]__ Removed the option to disable reading NFO when filling the lists, and hopefully made some improvements to adding folders to the sidebars.

###### v0.5b5 - 14/09/2011
* __[NEW]__ Added an option to disable reading NFO files when adding folders to the sidebar.
* __[NEW]__ Include use of movie file name when searching for posters.
* __[FIX]__ Slightly improved adding anime's to the sidebar, and maybe movies too.
* __[FIX]__ NFO files should use either file name or be 'movie.nfo', not folder name.

###### v0.5b4 - 13/09/2011
__[FIX]__ Important fix! put the entities converter back the way it was since it messes up the urls too much.

###### v0.5b3 - 13/09/2011
* __[FIX]__ Added a check for when there's no movies found.
* __[FIX]__ Added some error checking when updating the item lists.
* __[FIX]__ Slightly improved adding tv shows to the sidebar.
* __[FIX]__ Fixed an important bug I introduced in the last beta causing images to not download properly.

###### v0.5b2 - 13/09/2011
* __[NEW]__ Options to use folder.jpg's for file browsing.
* __[NEW]__ Use folder name instead of movie file name.
* __[FIX]__ Added some more entities to be encoded when used in search URLs. (Such as: '/' and '@')
* __[FIX]__ A little better error checking.

###### v0.5b1 - 12/09/2011
* __[NEW]__ Initial release.
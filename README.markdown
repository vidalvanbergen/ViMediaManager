## ViMediaManager ##

<img src="ViMM 0.6/images/ViMMLogo.png" style="float: right; height: 128px; width: 128px;">
ViMediaManager is a media manager for Mac OS X, allowing you to gather, store and manage the information and extra images for your movie, television & anime collections, and can be used on it’s own, or in combination with [XBMC](http://xbmc.org) & [YAMJ](http://code.google.com/p/moviejukebox/) Media Jukebox software.

## Requirements ##

To use ViMediaManager, you will need:

* An Apple Mac OS Intel computer.
* Mac OS X 10.5 or greater.
* An active internet connection.

## Features ##

  * Manage your movies, television & anime collections.
  * Download media metadata from [TheMovieDB.org](http://TheMovieDB.org "The Movie Database"), [TheTVDB.com](http://TheTVDB.com "The Television Database"), [OMDBApi.com](http://OMDBApi.com "The unofficial IMDb Api"), [RottenTomatoes.com](http://RottenTomatoes.com "Movie Reviews") & [AniDB.net](http://anidb.net "Anime Database").
  * Get Trailers, Posters, Fanart, Banners, ClearArt, CharacterArt, Logo's and Thumbnails for your movies and series from the aforementioned sources, [Youtube.com](http://Youtube.com "Youtube") & [Fanart.tv](http://fanart.tv "Fanart.tv, Making the most of your media collection").
  * Automatically search for metadata & images for all your media.
  * Automatically rename your files & folders.
  * ...and more!

## F.A.Q.? ##

#### Can you fix this bug?
If you find a bug, let me know what happened before the bug presented itself, and I’ll do my best to fix it.

#### I've got a great idea for ViMediaManger!
That's Great! Send me an email, or post a message on the XBMC forums, and I'll see about adding it to ViMM.

#### Why doesn't it have this or that basic feature?
Well, i'm still in the early release stages and haven't even reached version 1.0 yet, so I haven't gotten around to adding everything yet.
You can let me know what you’re missing, and I’ll try my best to add it in a future version!

#### Your app is not showing this or that movie in the list, what's up with that?
ViMediaManager actually needs a certain file structure to work with:

- Movies root folder:
- - <Movie Title> folder
- - - Movie file
- - <Movie Title> folder
- - - Movie File

But don't worry, ViMediaManager can help you easily organize your files through the Tools menu.

#### How do I do _this_ or _that_, how does it work?
Unfortunately I don't have a manual yet, so you'll have to try things out yourself for now, but you can always send me a message if you have any questions!

#### Does your app show studio logo's?
Yes it does, but you'll have to download them separately from this thread: (or similar threads)
[http://forum.xbmc.org/showthread.php?t=100652](http://forum.xbmc.org/showthread.php?t=100652 "XBMC Forum - Colored Studio Logo's")
[http://forum.xbmc.org/showthread.php?t=99554](http://forum.xbmc.org/showthread.php?t=99554 "Film/Movie/Game/Network/Radio Studio Flags Repository (Greyscale & Color)")
Once you've downloaded the logo's pack, put the pictures inside a folder named "Studios" in the same location as ViMediaManager or in the following path: '~/Library/Application Support/ViMediaManager/Studios/'.

## Source requirements: ##

  * [REALStudio](http://www.realsoftware.com "REALStudio") 2012
  * [MonkeyBreadSoftware Plugin](http://www.monkeybreadsoftware.net "MBS Plugin") 10.5:
    * MBS REALbasic Main Plugin.rbx
    * MBS REALbasic CocoaBase Plugin.rbx
    * MBS REALbasic Picture Plugin.rbx
    * MBS REALbasic Tidy Plugin.rbx
    * MBS REALbasic Util Plugin.rbx


## Version History: ##

#### ViMediaManager 0.6α# ####
___(The Next Generation)___

###### v0.6α4 00/00/2012
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
* __[IMPROVED]__ Since I've overhauled the metadata fetching, opting in for IMDb is not really necessary, it’ll download all available information including IMDB’s. In the future I might set a preference for which DB should be preferred, in case someone likes TMDB plots better.
* __[IMPROVED]__ Also since the new metadata fetching provides more MPAA certifications for multi-countries, I've added them all to a certifications tag to better support multi-nationality.
* __[IMPROVED]__ Shows the progress when you’re reloading the movie list instead of getting temporarily ‘stuck’.
* __[IMPROVED]__ Shows the progress when you’re batch renaming your folders and/or files.
* __[IMPROVED]__ ‘Deleting’ items now moves items to the trash when possible instead of vanishing them into thin air.
* __[IMPROVED]__ Put movies into folders should now work better.
* __[FIXED]__ Other bug fixes that I found along the way.

###### v0.6α3 02/06/2012
* __[NEW]__ Finaly support for unicode characters when looking up movies! Movies like Amélie will now pass through successfully.
* __[NEW]__ Adding a set now automatically tries to add movies to the set.
* __[NEW]__ Added a entirely new search field to the 'manual search' window. Also Added the same search field to the main window so people can filter their movies list.
* __[NEW]__ Added some support for .nfo files with only an IMDB URL inside, ViMM will search for information using the IMDB ID from the URL.
* __[IMPROVED]__ Improved IMDb Data fetching.
* __[IMPROVED]__ If the TMDB does not have a match for your movie, it now will still pass trough the unofficial IMDB API to search for information if you have an IMDB ID.
* __[IMPROVED]__ Better support for international information fetching.
* __[IMPROVED]__ Support for NL, DE, FR & UK MPAA rating fetching & displaying.
* __[IMPROVED]__ Lots of changes and improvements to 'batch renaming' files & folders.
* __[FIXED]__ Fixed a bug where .nfo files would not be updated with the new poster location after batch renaming, leaving XBMC with nothing but a screenshot to fill in for the thumbnail.
* __[FIXED]__ Fixed where movie root folders with the same folder name would overwrite each other in the preferences.
* __[FIXED]__ Lots of other minor bug fixes and changes.

###### v0.6α2 19/06/2012
* __[NEW]__ Movie Sets Manager added. (Still experimental)
* __[NEW]__ Some speed improvements trough caching.
* __[NEW]__ Rename folders & files.
* __[IMPROVED]__ Some UI Changes.
* __[FIXED]__ Lots of bug fixes and improvements.

###### v0.6α1 13/06/2012
* __[NEW]__ Complete rebuild from scratch, since I learned a lot of new stuff while working on ViMM 0.5x, and I wanted to optimize everything.



#### ViMediaManager v0.5.# ####

###### v0.5.4 09/04/2012
* __[NEW]__ You can now use custom URL's to download trailers.
* __[FIXED]__ Fixed downloading trailers from youtube.

###### v0.5.3 10/10/2011
* __[NEW]__ Added the option to sort by rating.
* __[IMPROVED]__ Added 2 new video filetypes for support in scanning.

###### v0.5.2 03/10/2011
* __[NEW]__ Set finder label depending on status color.
* __[NEW]__ Update single show status by right-clicking the show in the list and choosing 'update status'.
* __[NEW]__ Red right-click menu's for the general information area, if you right-click on the poster image it will ask you to download a poster image.
* __[IMPROVED]__ Hiatus status is now much more accurate.
* __[FIXED]__ Fixed trailer saving without extensions.

###### v0.5.1 29/09/2011
* __[NEW]__ Added '.iso' to detectable movie file types.
* __[NEW]__ Added support for movie.jpg and movie.tbn as poster names.
* __[IMPROVED]__ Clean out trailers.

###### v0.5 - 27/09/2011
* __[NEW]__ Added cleaning tool which cleans images and NFO files.
* __[NEW]__ Now using the genuine Sparkle framework for software updates.
* __[IMPROVED]__ Use lowercase filenames for compatibility purposes.
* __[IMPROVED]__ Changed the way folder paths are stored so that I might save this to a database in the future.
* __[IMPROVED]__ Moved the preferences from XML to the more usual PLIST format using sparkle setdefaults.
* __[FIXED]__ Fixed mass renaming, and probably even optimized it's performance.

###### v0.5b13 - 22/09/2011
* __[NEW]__ Check to see if previous art already exists and asks to delete it before proceeding to scrape data.
* __[NEW]__ Added a sort list button on the mini toolbar below the list, which will re-sort the list without reloading it.
* __[NEW]__ Added new toolbar item "Fetch All Metadata", this will fetch metadata for all media in the currently displayed list that doesn't have any metadata yet.
* __[NEW]__ Added 'Open' image button to the metadata editors to allow users to select images from their harddrives for use as poster, fanart, banner and extra images.
* __[FIXED]__ Forgot to check weather or not a poster or fanart URL is available when downloading those for movies.

###### v0.5b12 - 21/09/2011
* __[NEW]__ More descriptive messages when mass updating or mass fetching items.
* __[FIXED]__ Changed some naming issues for fanart and posters.
* __[FIXED]__ Other minor changes and adjustments.

###### v0.5b11 - 20/09/2011
* __[NEW]__ Added several naming options for movie images, NFO files & trailers.
* __[NEW]__ Single List items can now be updated in stead of having to repopulate the entire list, this will speed things up considerably when editing data.
* __[IMPROVED]__ Removed a lot of repopulate list actions in favor of speed, though this will use a little more RAM. (Keeping everything in memory for now.)
*   Instead people will have to use the refresh button to update the list manualy more often.
* __[FIXED]__ Animelist was showing the wrong list icons.

###### v0.5b10 - 19/09/2011
* __[NEW]__ Using a more native OS X toolbar which can be edited.
* __[FIXED]__ Hopefully fixed the general display area from shifting itself off of the window.
* __[FIXED]__ When selecting an item, check to see if it actually exists before reading NFO.
* __[FIXED]__ When trying to read set info, it was trying to dig a layer to deep into nonexistence into the XML, this should be fixed now.
* __[IMPROVED]__ Saved "Future Show" status in NFO file instead of calculating it at startup, this allows to see if shows started showing when doing a mass status update.
* __[IMPROVED]__ Some fixes and changes to sorting lists.
* __[IMPROVED]__ Lots of other minor changes.

###### v0.5b9 - 16/09/2011
* __[NEW]__ Select which images you want to auto download.
* __[FIXED]__ Accidentally prevented movie image links to be set in the NFO file.

###### v0.5b8 - 16/09/2011
* __[NEW]__ Added debug mode, hold [ALT] while starting up the app to enter debug mode.
* __[NEW]__ Debug mode disables reading NFO files to fill the sidebar lists.
* __[NEW]__ Faux DVD cases replaced with more general image overlays.
* __[NEW]__ Order lists by title or sort title, show title in the list.
* __[NEW]__ Option for auto downloading images on scraping.
* __[FIXED]__ Removed the option Rename Articles Last, since it wasn't actually used anyhow.

###### v0.5b7 - 15/09/2011
* __[NEW]__ Added TVRage ID when scraping shows.
* __[NEW]__ Added CharacterArt support in edit metadata windows.
* __[NEW]__ Added support for "Hiatus" status. Any shows that won't be shows in the next 14 days is classified as in hiatus either when fetching metadata or updating status.
* __[FIXED]__ Filter links from plots to avoid crashing.
* __[FIXED]__ Better name filtering for '(720p)', '(1080p)' and '-rip'.

###### v0.5b6 - 14/09/2011
* __[NEW]__ Removed the option to disable reading NFO when filling the lists, and hopefully made some improvements to adding folders to the sidebars.

###### v0.5b5 - 14/09/2011
* __[NEW]__ Added an option to disable reading NFO files when adding folders to the sidebar.
* __[NEW]__ Include use of movie file name when searching for posters.
* __[FIXED]__ Slightly improved adding anime's to the sidebar, and maybe movies too.
* __[FIXED]__ NFO files should use either file name or be 'movie.nfo', not folder name.

###### v0.5b4 - 13/09/2011
__[FIXED]__ Important fix! put the entities converter back the way it was since it messes up the urls too much.

###### v0.5b3 - 13/09/2011
* __[FIXED]__ Added a check for when there's no movies found.
* __[FIXED]__ Added some error checking when updating the item lists.
* __[FIXED]__ Slightly improved adding tv shows to the sidebar.
* __[FIXED]__ Fixed an important bug I introduced in the last beta causing images to not download properly.

###### v0.5b2 - 13/09/2011
* __[NEW]__ Options to use folder.jpg's for file browsing.
* __[NEW]__ Use folder name instead of movie file name.
* __[FIXED]__ Added some more entities to be encoded when used in search URLs. (Such as: '/' and '@')
* __[FIXED]__ A little better error checking.

###### v0.5b1 - 12/09/2011
* __[NEW]__ Initial release.
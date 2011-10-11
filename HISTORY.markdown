v0.5.3 10/10/2011
-----------------
* [New] Added the option to sort by rating.
* [Dif] Added 2 new video filetypes for support in scanning.

v0.5.2 03/10/2011
-----------------
* [New] Set finder label depending on status color.
* [New] Update single show status by right-clicking the show in the list and choosing 'update status'.
* [New] Red right-click menu's for the general information area, if you right-click on the poster image it will ask you to download a poster image.
* [Dif] Hiatus status is now much more accurate.
* [Fix] Fixed trailer saving without extensions.

v0.5.1 29/09/2011
-----------------
* [New] Added '.iso' to detectable movie file types.
* [New] Added support for movie.jpg and movie.tbn as poster names.
* [Dif] Clean out trailers.

v0.5 - 27/09/2011
-----------------
* [New] Added cleaning tool which cleans images and NFO files.
* [New] Now using the genuine Sparkle framework for software updates.
* [Dif] Use lowercase filenames for compatibility purposes.
* [Dif] Changed the way folder paths are stored so that I might save this to a database in the future.
* [Dif] Moved the preferences from XML to the more usual PLIST format using sparkle setdefaults.
* [Fix] Fixed mass renaming, and probably even optimized it's performance.

v0.5b13 - 22/09/2011
--------------------
* [New] Check to see if previous art already exists and asks to delete it before proceeding to scrape data.
* [New] Added a sort list button on the mini toolbar below the list, which will re-sort the list without reloading it.
* [New] Added new toolbar item "Fetch All Metadata", this will fetch metadata for all media in the currently displayed list that doesn't have any metadata yet.
* [New] Added 'Open' image button to the metadata editors to allow users to select images from their harddrives for use as poster, fanart, banner and extra images.
* [Fix] Forgot to check weather or not a poster or fanart URL is available when downloading those for movies.

v0.5b12 - 21/09/2011
--------------------
* [New] More descriptive messages when mass updating or mass fetching items.
* [Fix] Changed some naming issues for fanart and posters.
* [Fix] Other minor changes and adjustments.

v0.5b11 - 20/09/2011
--------------------
* [New] Added several naming options for movie images, NFO files & trailers.
* [New] Single List items can now be updated in stead of having to repopulate the entire list, this will speed things up considerably when editing data.
* [Dif] Removed a lot of repopulate list actions in favor of speed, though this will use a little more RAM. (Keeping everything in memory for now.)
  Instead people will have to use the refresh button to update the list manualy more often.
* [Fix] Animelist was showing the wrong list icons.

v0.5b10 - 19/09/2011
--------------------
* [New] Using a more native OS X toolbar which can be edited.
* [Fix] Hopefully fixed the general display area from shifting itself off of the window.
* [Fix] When selecting an item, check to see if it actually exists before reading NFO.
* [Fix] When trying to read set info, it was trying to dig a layer to deep into nonexistence into the XML, this should be fixed now.
* [Dif] Saved "Future Show" status in NFO file instead of calculating it at startup, this allows to see if shows started showing when doing a mass status update.
* [Dif] Some fixes and changes to sorting lists.
* [Dif] Lots of other minor changes.

v0.5b9 - 16/09/2011
-------------------
* [New] Select which images you want to auto download.
* [Fix] Accidentally prevented movie image links to be set in the NFO file.

v0.5b8 - 16/09/2011
-------------------
* [New] Added debug mode, hold [ALT] while starting up the app to enter debug mode.
* [New] Debug mode disables reading NFO files to fill the sidebar lists.
* [New] Faux DVD cases replaced with more general image overlays.
* [New] Order lists by title or sort title, show title in the list.
* [New] Option for auto downloading images on scraping.
* [Fix] Removed the option Rename Articles Last, since it wasn't actually used anyhow.

v0.5b7 - 15/09/2011
-------------------
* [New] Added TVRage ID when scraping shows.
* [New] Added CharacterArt support in edit metadata windows.
* [New] Added support for "Hiatus" status. Any shows that won't be shows in the next 14 days is classified as in hiatus either when fetching metadata or updating status.
* [Fix] Filter links from plots to avoid crashing.
* [Fix] Better name filtering for '(720p)', '(1080p)' and '-rip'.


v0.5b6 - 14/09/2011
-------------------
* [New] Removed the option to disable reading NFO when filling the lists, and hopefully made some improvements to adding folders to the sidebars.

v0.5b5 - 14/09/2011
-------------------
* [New] Added an option to disable reading NFO files when adding folders to the sidebar.
* [New] Include use of movie file name when searching for posters.
* [Fix] Slightly improved adding anime's to the sidebar, and maybe movies too.
* [Fix] NFO files should use either file name or be 'movie.nfo', not folder name.


v0.5b4 - 13/09/2011
-------------------
* [Fix] Important fix! put the entities converter back the way it was since it messes up the urls too much.


v0.5b3 - 13/09/2011
-------------------
* [Fix] Added a check for when there's no movies found.
* [Fix] Added some error checking when updating the item lists.
* [Fix] Slightly improved adding tv shows to the sidebar.
* [Fix] Fixed an important bug I introduced in the last beta causing images to not download properly.


v0.5b2 - 13/09/2011
-------------------
* [New] Options to use folder.jpg's for file browsing.
* [New] Use folder name instead of movie file name.
* [Fix] Added some more entities to be encoded when used in search URLs. (Such as: '/' and '@')
* [Fix] A little better error checking.


v0.5b1 - 12/09/2011
-------------------
* [NEW] Initial release.

Download stats:
-------------------
* 0.5b7     -     39
* 0.5b8     -     0
* 0.5b9     -     112
* 0.5b10    -     45
* 0.5b11    -     50
* 0.5b12    -     54
* 0.5b13    -     151
* 0.5       -     73
* 0.5.1     -     161
* 0.5.2     -     245
* 0.5.3     -     
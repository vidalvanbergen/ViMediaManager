

## Milestones ##


### Milestone 0.6α ###
##### The Next Generation #####

Closed Tickets: 0
Active Tickets: 0
Total Tickets:  0

__Mainline__: Build the Movies section.

1. √ [Movie SETS support.](http://forum.xbmc.org/showpost.php?p=888980&postcount=82 "Macsorzist")
	- "Experimental", but working.
* √ [Look into using MediaInfo for movie file information.](http://forum.xbmc.org/showpost.php?p=890200&postcount=115 "BigDave")
	- √ Basic support added.
* √ Starting on international support by translating the app in both english and dutch, and with the help of others, more languages.
	- √ Building EN & NL translations as I go along, more languages to be added around the 0.9β release or after the 1.0ƒ release.
* Filter movie list by root folders trough a pop-up menu.
* Searchfield + Filter to easily search trough your movie collection.
* √ Add MPAA rating to bulk renaming.
* √ Set (max-)size for downloaded images for slower machines.
* √ [Toolbar item to quickly switch between sort options.](http://forum.xbmc.org/showpost.php?p=892114&postcount=150 "i814u2")
	- √ Solved this by creating a common and Mac Like popup menu option on right click, and inside the 'View' menu.
* √ [Option to add filenames to the renaming proces](http://forum.xbmc.org/showpost.php?p=892149&postcount=154 "T800")
* √ [Use alternative fanarts as extrathumbs](http://forum.xbmc.org/showpost.php?p=894152&postcount=229 "Smilenkovski")
* √ [Choose your own YouTube URL for trailers](http://forum.xbmc.org/showpost.php?p=901399&postcount=336 "steve1977")
* √ [Recognize UK ratings, and other international rating systems](http://forum.xbmc.org/showpost.php?p=902311&postcount=341 "Tiny Clanger")
	- √ Currently official support for 'DE', 'NL', 'UK' & 'FR' available besides the default 'EN'.
* √ [Add mass art download, same as mass info download](http://forum.xbmc.org/showpost.php?p=904844&postcount=358 "Linusorg")
	- √ Downloading missing NFO files will download missing art files.
	- √ Updating NFO files should also add missing art files.
* [List of ideas by Linusorg](http://forum.xbmc.org/showpost.php?p=907203&postcount=380 "Linusort")
	- √ Deep directory Scan - works but not without it's faults.
	- Display file path in manual search - Sensible enough idea, but with long file paths...
	- √ Multiple edit of genre, studio? - I think I've got this covered.
	- √ Sort movie list by : Name, year, Rating, Genre, Studio - All except genre have been covered.
	- Flag to protect movie from being rescrapped ( specially you you can rescrap multiple selected movies )
		- √? Movies will only be rescraped in case you choose 'update metadata'.
	- Export to... - Going to be working on it eventually.

----

### Milestone 0.7α ###
##### The Dailies #####

__Mainline__: Build the TV section.

1. √ TV Episode support.
	- √ Show full episode list & compare it to downloaded episodes, scan for missing episodes.
2. Allow for a 'drop' or 'downloads' folder which ViMediaManager will scan and sort out movies and episodes to the appropriate sections & folders.

----

### Milestone 0.8β ###
##### Graphics in Motion #####

__Mainline__: Build the Anime section.

----

### Milestone 0.9β ###
##### Stabelizing the reactor core! #####

__Mainline__: Bug fixes, existing feature enhancements.

----

### Milestone 1.0ƒ ###
##### The Complete Package #####

__Mainline__: Official release! Start building new and exiting features from the requests & ideas lists!

----

### Milestone 2.0ƒ ###
##### Ultima III #####

__Mainline__: Feature requests and other awesomeness!

1. Support for ATV [FireCore](http://support.firecore.com/entries/20557283-metadata-and-cover-art)

----

### Feature Request & Ideas ###

* Add movie genre 'folders' to movie list.
* TV Guide week preview (using [TV Rage](http://services.tvrage.com/tools/quickinfo.php?show=%s "TV Rage")?)
* Movie Wishlist/Watchlist.
* Only get 'selected' NFO fields. (Only title, ID, videosource, or whatever) [Walter]
* Export Movie/Show list to HTML template. (Don't forget: PDF, CVS, XLS and other formats)
* [Print movie list](http://forum.xbmc.org/showpost.php?p=888980&postcount=82 "Macsorzist")
* Download matching subtitles.
* [Download extraposters](http://forum.xbmc.org/showthread.php?tid=109976&pid=1290795#pid1290795 "mfrelink")
* Could it run in the background and scan media locations periodically and auto download information?
  * [When running in the background, have the ability to show a log file.](http://forum.xbmc.org/showpost.php?p=899757&postcount=321 "Pecinko")
* [Use file names to check weather a title is a match, and use that match in preference to the first match](http://forum.xbmc.org/showpost.php?p=894247&postcount=238 "i814u2")
* [Support DVD structures for TV shows](http://forum.xbmc.org/showpost.php?p=903042&postcount=345 "Linusorg")
* [When asking to overwrite prior art, reply with 'Yes', 'No' or 'Always'](http://forum.xbmc.org/showpost.php?p=912765&postcount=416 "Pecinko")
	- I'll first need to make a custom messagedialog box with a checkbox for 'always', and then have it remember the always yes or always no.

Yannick Rose:
* mount the video's folder automatically if they are not mounted. mine are SMB's share on my Popcorn-Hour machine.
* A YAMJ scanner to update the jukebox. All it needs to begin is a log windows to see the terminal status, and vi need's to issue a terminal command to start the scan. Alternatively we could also configure the My_Library.xml path of the share by fill in some kind of form inside Vi that write it to the xml file.
* Bigger posters on the list. Radio button on the preferences to select if we want it small or bigger.

### Not Gonna Happen anytime soon! ###

* iPad/iPhone support.
	- I do not have the necesairy skills, and XBMC for example has a host of web/apps to manage your library.
* Mac AppStore listing.
	- I have yet to look at what all is involved in getting an app into the AppStore, but it's unlikely to happen.

----

### BUGS & CREEPERS! ###

* 
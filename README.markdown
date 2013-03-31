## ViMediaManager ##

ViMediaManager is a media manager for Mac OS X, allowing you to gather, store, and manage information, extra art, trailers and television tunes for your movie, television and anime collections, and can be used on it’s own, or in combination with [XBMC](http://xbmc.org), [YAMJ](http://code.google.com/p/moviejukebox/) or [Boxee](http://www.boxee.tv).

This is my try at building a media manager for Mac OS, since the Mac platform has been seriously lacking any good apps in this department, and I felt like filling that hole, keeping in mind the Mac's passion for ease-of-use while still building a very powerful program with a really clean user interface.


## Requirements ##

To use ViMediaManager, you will need:

* An Apple Macintosh Intel computer
* Mac OS X 10.5 or greater
* An active internet connection


## Source requirements: ##

  * [REALStudio](http://www.realsoftware.com "REALStudio") 2012.2
  * [MonkeyBreadSoftware Plugin](http://www.monkeybreadsoftware.net "MBS Plugin") 12.5:
    * MBS Real Studio CocoaBase Plugin.rbx
    * MBS Real Studio Main Plugin.rbx    * MBS Real Studio Picture Plugin.rbx    * MBS Real Studio Util Plugin.rbx
    * MBS Real Studio MountainLion Plugin.rbx


#### Included: ####

  * [Mediainfo](http://mediainfo.sourceforge.net)
  * [Sparkle Framework](http://sparkle.andymatuschak.org)
  * [Growl Notify](http://growl.info/extras.php)


## Features ##

With ViMediaManager you can:

  * Manage your movies, television & anime collections.
  * Download media metadata from [TheMovieDB.org](http://TheMovieDB.org "The Movie Database"), [IMDb.com](http://imdb.com "The Internet Movie Database"), [TheTVDB.com](http://TheTVDB.com "The Television Database"), [RottenTomatoes.com](http://RottenTomatoes.com "Movie Reviews") and [AniDB.net](http://anidb.net "Anime Database") in your language*.
  * Get trailers, posters, fanart, banners, clearart, character art, disc art, logo’s, thumbnails, extra thumbs, extra fanart, trailers and theme songs for your movies and series from the aforementioned sources, [Youtube.com](http://Youtube.com "Youtube"), [HD-Trailers.net](http://www.hd-trailers.net "HD-Trailers.net, Best place on the web to download HD Trailers"), [televisiontunes.com](http://www.televisiontunes.com "televisiontunes.com, TV Theme Music and Songs") and [Fanart.tv](http://fanart.tv "Fanart.tv, Making the most of your media collection").
  * Create, update, and edit NFO metadata; scans media for file info (codecs, resolution, etc) and is saved with the media.
  *	Extra art chooser for downloading and choosing images to use for posters, backdrops, etc.
  * Extra media chooser for downloading trailers and television tunes.
  * Shows television and anime airing status, and next episode air date information thanks to [TVRage.com](http://www.tvrage.com "TVRage.com, TV Listings").
  * A feature-rich episodes manager that displays all known television and anime episodes, allowing you to keep track of which episodes you've already watched, and to edit and save NFO metadata with the episode files.
  * Set manager for creating and editing movie sets/collections.
  * Automatically rename files and folders according to highly customisable preferences.
  * Keep your collections clean and organised.
  * Find more to watch with recommendations from RottenTomatoes, TheMovieDB and IMDb.
  * ...and more!

\* Local language only available on items for which the respective database provides localised information.

## Support ##

There may be times when you have questions on how to use ViMediaManager, or you might have found a bug, or maybe you just want to tell me that you’d like a certain feature in ViMediaManager. If so, you can get in touch with my be sending me an email at [vimediamanager@gmail.com](mailto:vimediamanager@gmail.com), or by leaving a post on the XBMC forums [http://forum.xbmc.org/showthread.php?tid=109976](http://forum.xbmc.org/showthread.php?tid=109976)

## F.A.Q.? ##

If you have any questions that aren't answered below, found bugs or have feature requests, feel free to make a post in this thread, or send me an email at [vimediamanager@gmail.com](mailto:vimediamanager@gmail.com).


#### How do I do this? or how do I use that?
Thanks to Jim Worrall, we now have a [User Manual](http://mariusth.channelwood.org/vimediamanager/files/manual_latest.php)!  
If you still have questions after reading that, don't be afraid to ask!


#### Some of my movies aren't showing up in the list, what's up with that?
ViMediaManager needs your files to be in a certain structure to be able to work with them:

Movies Root Folder  
- - Movie Title Folder  
- - - - Movie File  
- - Movie Title Folder  
- - - - Movie File  

But don't worry, you won't have to restructure your movies by hand, just select the 'Tools' menu and choose the 'Put Movies Into Folders' option, which will automatically place all movie files it finds in the 'root' folder inside their own folders.


#### Does your app show studio/network logo's?
Yes it does, but you'll have to download them separately from this thread: (or similar threads)  
[http://forum.xbmc.org/showthread.php?tid=100652](http://forum.xbmc.org/showthread.php?tid=100652)  
[http://forum.xbmc.org/showthread.php?tid=99554](http://forum.xbmc.org/showthread.php?tid=99554)  
Once you've downloaded these, navigate to:  
/users/YOURNAME/Library/Application Support/ViMediaManager/  
Create a new folder named "Studios" and put the images directly into this folder.


#### The app doesn't start or shows some very abnormal behavior, how can I reset the application?
You can reset the app by removing the preferences files which are located here:

For ViMediaManager v0.5.x:  
/users/YOURNAME/Library/Preferences/com.vidalvanbergen.vimediamanager.plist

For ViMediaManager v0.6.x and up:  
/users/YOURNAME/Library/Preferences/com.vidalvanbergen.vimediamanager-alpha.plist

And the application support folder can be found here: (or just the XML files directly within this folder)  
/users/YOURNAME/Library/Application Support/ViMediaManager/

Throwing away these items into the trash will reset the app to it's 'factory' settings.
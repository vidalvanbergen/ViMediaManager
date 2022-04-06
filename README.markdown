## ViMediaManager ##

ViMediaManager is a media manager for Mac OS X, allowing you to gather, store, and manage information, extra art, trailers and television tunes for your movie, television and anime collections, and can be used on it's own, or in combination with [Kodi](https://kodi.tv/) and [Plex](https://www.plex.tv/).

This is my try at building a media manager for macOS, since the Mac platform has been seriously lacking any good apps in this department, and I felt like filling that hole, keeping in mind the Mac's passion for ease-of-use while still building a very powerful program with an easy-to-use interface.


## Requirements ##

To use ViMediaManager, you will need:

* An Apple Macintosh Intel or ARM computer
* Mac OS X 10.10 or greater
* An active internet connection


## Source requirements: ##

  * [Xojo](https://xojo.com/ "Xojo IDE") 2021.2.1.3


#### Included: ####

  * [Mediainfo](https://mediaarea.net/en/MediaInfo)
  * [Kaju](https://github.com/ktekinay/Kaju)


## Features ##

With ViMediaManager you can:

  * Manage your movies, television & anime collections.
  * Download media metadata from [TheMovieDB.org](http://TheMovieDB.org "The Movie Database") and [IMDb.com](http://imdb.com "The Internet Movie Database") in your language*.
  * Get trailers, posters, fanart, banners, clearart, character art, disc art, logo's, thumbnails, extra thumbs, extra fanart, trailers and theme songs for your movies and series from the aforementioned sources, [HD-Trailers.net](http://www.hd-trailers.net "HD-Trailers.net, Best place on the web to download HD Trailers"), [televisiontunes.com](http://www.televisiontunes.com "televisiontunes.com, TV Theme Music and Songs") and [Fanart.tv](http://fanart.tv "Fanart.tv, Making the most of your media collection").
  * Create, update, and edit NFO metadata; scans media for file info (codecs, resolution, etc) and is saved with the media.
  * Shows television and anime airing status, and next episode air date information thanks to [TVmaze.com](https://www.tvmaze.com/ "TVmaze.com, TV Listings").
  * A feature-rich episodes manager that displays all known television and anime episodes, allowing you to keep track of which episodes you've already watched, and to edit and save NFO metadata with the episode files.
  * Set manager for creating and editing movie sets/collections.
  * Automatically rename files and folders according to highly customizable preferences.
  * Keep your collections clean and organized.
  * Find more to watch with recommendations from TheMovieDB and IMDb.
  * ...and more!

\* Local language only available on items for which the respective database provides localised information.

## Support ##

There may be times when you have questions on how to use ViMediaManager, or you might have found a bug, or maybe you just want to tell me that you’d like a certain feature in ViMediaManager. If so, you can get in touch with my be sending me an email at [vimediamanager@gmail.com](mailto:vimediamanager@gmail.com), or by leaving a post on the [Kodi forums](https://forum.kodi.tv/showthread.php?tid=109976).

## F.A.Q.? ##

#### Some of my movies aren't showing up in the list, what's up with that?
ViMediaManager needs your files to be in a certain structure to be able to work with them:

Movies Root Folder  
- - Movie Title Folder  
- - - Movie File  
- - Movie Title Folder  
- - - Movie File  

But don't worry, you won't have to restructure your movies by hand, just select the 'Tools' menu and choose the 'Put Movies Into Folders' option, which will automatically place all movie files it finds in the 'root' folder inside their own folders.


#### Does your app show studio/network logo's?
Yes it does, but you'll have to download them separately from this thread: (or similar threads)  
[https://forum.kodi.tv/showthread.php?tid=100652](https://forum.kodi.tv/showthread.php?tid=100652)  
[https://forum.kodi.tv/showthread.php?tid=99554](https://forum.kodi.tv/showthread.php?tid=99554)  
Once you've downloaded these, navigate to:  
/users/YOURNAME/Library/Application Support/ViMediaManager/  
Create a new folder named "Studios" and put the images directly into this folder.
ToDo
----
* Get and set "source" flags (DVD, HDTV, Blu-ray, aspect, ratio, audio formats) using filename and through metadata window.
* Grand/Grid Thumbnail overview when downloading images.

Ideas
-----
* Debug mode for users.
  * Start without reading NFO files to fill up the sidebar lists.
* Show full episode list & compare it to downloaded episodes, scan for missing episodes.
* Could it run in the background and scan media locations periodically and auto download information?
* ---  TV Timeline/Anime? TV Guide - list & info about new pilots/new anime in the coming month
* ---  TV Guide? ( http://services.tvrage.com/tools/quickinfo.php?show=%s )
* TV Timeline (Create XML for next season TV shows based on imdb? followmy.tv list)
* Anime Timeline (Create XML for next season anime based on neregate anime list)
* Movie Wish list?
* Export to TV Guides, Wishlists, existing items to website / website template or text list?
* --- Maybe a way to print a movies list. A small list with only the title and year, one with poster and title. maybe a complete Posterpage with all movies on and a big list with posters, title and info.

PROBLEM FOUND: TVShows folder was not available for some reason. I had to open it up from Synology web interface and it got available in Finder afterwards.
http://forum.xbmc.org/showpost.php?p=890434&postcount=122
Please consider: 
1. starting up app
2. check for folder availability
3. folders scan - hash/MD5 check for foldername changes (BTW app will/may crash if it's open and you change movie folder name in Finder) 
4. processing images
5. parsing xmls

Bugs
----
* There seams to be a problem with non-english movie titles. Example: Harry Potter A Fénixův Řád (2007)
* Slow/network drives might be stumbling over itself to keep up with reading metadata. [Made some improvements that might help, yet to hear any feedback on this for beta 6+]
* Qeue up error messages when scraping. and show them prettier.
  * If XML is not valid, save it's title in a variable and show it after the mass update is done.

Roadmap:
--------

#### v0.5 [initial release]
* Get it running without too many bugs and crashes!

#### v1.0
* Recognize TV/Anime seasons/episodes.
* Movie Sets support.

#### v2.0 - Future?

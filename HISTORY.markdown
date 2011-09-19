v0.5b10 - 17/09/2011
--------------------
* [New] Using a more native OS X toolbar which can be edited.
* [Fix] Hopefully fixed the general display area from shiften itself off of the window.
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
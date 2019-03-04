#tag Menu
Begin Menu mBarMain
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "#Menu.File"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem FileOpenInFinder
         SpecialMenu = 0
         Text = "#Menu.FileShowInFinder"
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+Shift+O"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileCloseWindow
         SpecialMenu = 0
         Text = "#Menu.FileCloseWindow"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileListUpdate
         SpecialMenu = 0
         Text = "#Loc.Refresh"
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileListRefresh
         SpecialMenu = 0
         Text = "#Menu.FileRefreshList"
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+Shift+R"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 9
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileManualSearch
         SpecialMenu = 0
         Text = "#Menu.FileManualSearch"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+Shift+F"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileFetchMetadata
         SpecialMenu = 0
         Text = "#Loc.FetchMetadata"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem FetchMetadataSelection
            SpecialMenu = 0
            Text = "#Loc.kSelection"
            Index = -2147483648
            ShortcutKey = "I"
            Shortcut = "Cmd+Shift+I"
            MenuModifier = True
            AltMenuModifier = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem FetchMetadataMissingMetadata
            SpecialMenu = 0
            Text = "#Loc.kAllMissingMetadata"
            Index = -2147483648
            ShortcutKey = "I"
            Shortcut = "Cmd+Option+I"
            MenuModifier = True
            MacOptionKey = True
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem FileUpdate
         SpecialMenu = 0
         Text = "#Loc.kUpdateMetadata"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem UpdateSelected
            SpecialMenu = 0
            Text = "#Loc.kSelection"
            Index = -2147483648
            ShortcutKey = "U"
            Shortcut = "Cmd+U"
            MenuModifier = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UpdateRating
            SpecialMenu = 0
            Text = "Rating"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UpdateShowStatus
            SpecialMenu = 0
            Text = "Show Status"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UpdateEpisodes
            SpecialMenu = 0
            Text = "Episodes"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 19
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UpdateAll
            SpecialMenu = 0
            Text = "#Loc.kAll"
            Index = -2147483648
            ShortcutKey = "U"
            Shortcut = "Cmd+Shift+U"
            MenuModifier = True
            AltMenuModifier = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UpdateAllRatings
            SpecialMenu = 0
            Text = "#Menu.FileUpdateRatings"
            Index = -2147483648
            ShortcutKey = "U"
            Shortcut = "Cmd+Option+U"
            MenuModifier = True
            MacOptionKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UpdateAllShowStatus
            SpecialMenu = 0
            Text = "#Menu.FileUpdateShowStatus"
            Index = -2147483648
            ShortcutKey = "U"
            Shortcut = "Cmd+Shift+U"
            MenuModifier = True
            AltMenuModifier = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UpdateAllEpisodes
            SpecialMenu = 0
            Text = "#Loc.kUpdateEpisodes"
            Index = -2147483648
            ShortcutKey = "U"
            Shortcut = "Cmd+Control+U"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 26
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UpdateNewEpisodes
            SpecialMenu = 0
            Text = "#Loc.kNewEpisodes"
            Index = -2147483648
            ShortcutKey = "U"
            Shortcut = "Cmd+Option+U"
            MenuModifier = True
            MacOptionKey = True
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 11
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileExport
         SpecialMenu = 0
         Text = "#Menu.FileExport"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem FileExportAsHTML
            SpecialMenu = 0
            Text = "#Menu.FileExportAsHTML"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ExportPrint
            SpecialMenu = 0
            Text = "#Menu.ExportPrint"
            Index = -2147483648
            ShortcutKey = "P"
            Shortcut = "Cmd+P"
            MenuModifier = True
            AutoEnable = True
            Visible = True
         End
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "#Menu.Edit"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "#Menu.EditUndo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 6
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "#Menu.EditCut"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "#Menu.EditCopy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "#Menu.EditPaste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#Menu.EditDelete"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 7
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "#Menu.EditSelectAll"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 8
         AutoEnable = True
         Visible = True
      End
      Begin PrefsMenuItem EditPreferences
         SpecialMenu = 0
         Text = "#Menu.ApplePreferences"
         Index = -2147483648
         ShortcutKey = ","
         Shortcut = "Cmd+,"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ViewMenu
      SpecialMenu = 0
      Text = "#Menu.View"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem ViewEditMetadata
         SpecialMenu = 0
         Text = "#Menu.ViewEditMetadata"
         Index = -2147483648
         ShortcutKey = "I"
         Shortcut = "Cmd+I"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 4
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuViewMovies
         SpecialMenu = 0
         Text = "#Menu.ViewMovies"
         Index = -2147483648
         ShortcutKey = "1"
         Shortcut = "Cmd+1"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuViewTVShows
         SpecialMenu = 0
         Text = "#Menu.ViewTVShows"
         Index = -2147483648
         ShortcutKey = "2"
         Shortcut = "Cmd+2"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuViewAnime
         SpecialMenu = 0
         Text = "#Menu.ViewAnime"
         Index = -2147483648
         ShortcutKey = "3"
         Shortcut = "Cmd+3"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 13
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuViewSortByMovie
         SpecialMenu = 0
         Text = "#Menu.CMMSortList"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem SortListAscending
            SpecialMenu = 0
            Text = "#Menu.SortAscending"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem SortListDescending
            SpecialMenu = 0
            Text = "#Menu.SortDescending"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UntitledSeparator4
            SpecialMenu = 0
            Text = "-"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByMovieTitle
            SpecialMenu = 0
            Text = "#menu.viewsortbymovietitle"
            Index = -2147483648
            ShortcutKey = "1"
            Shortcut = "Cmd+Control+1"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByMovieSortTitle
            SpecialMenu = 0
            Text = "#menu.ViewSortByMovieSortTitel"
            Index = -2147483648
            ShortcutKey = "2"
            Shortcut = "Cmd+Control+2"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 14
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByPath
            SpecialMenu = 0
            Text = "#menu.ViewSortByPath"
            Index = 0
            ShortcutKey = "3"
            Shortcut = "Cmd+Control+3"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByWatchedStatus
            SpecialMenu = 0
            Text = "#menu.ViewSortByWatchedStatus"
            Index = -2147483648
            ShortcutKey = "4"
            Shortcut = "Cmd+Control+4"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByPremiereDate
            SpecialMenu = 0
            Text = "#menu.ViewSortByPremiereDate"
            Index = 0
            ShortcutKey = "5"
            Shortcut = "Cmd+Control+5"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByQuality
            SpecialMenu = 0
            Text = "#menu.ViewSortByQuality"
            Index = -2147483648
            ShortcutKey = "6"
            Shortcut = "Cmd+Control+6"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByRating
            SpecialMenu = 0
            Text = "#menu.ViewSortByRating"
            Index = 0
            ShortcutKey = "7"
            Shortcut = "Cmd+Control+7"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortBySize
            SpecialMenu = 0
            Text = "#Loc.kSize"
            Index = -2147483648
            ShortcutKey = "8"
            Shortcut = "Cmd+Control+8"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByRuntime
            SpecialMenu = 0
            Text = "#Loc.kRuntime"
            Index = 0
            ShortcutKey = "9"
            Shortcut = "Cmd+Control+9"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 18
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtPoster
            SpecialMenu = 0
            Text = "#Loc.kPoster"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtBackdrop
            SpecialMenu = 0
            Text = "#Loc.kFanart"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtBanner
            SpecialMenu = 0
            Text = "#Loc.kBanner"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtLogo
            SpecialMenu = 0
            Text = "#Loc.kLogo"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtClearArt
            SpecialMenu = 0
            Text = "#Loc.kClearArt"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtThumb
            SpecialMenu = 0
            Text = "#Loc.kThumb"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtDisc
            SpecialMenu = 0
            Text = "#Loc.kDiscArt"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtExtraThumbs
            SpecialMenu = 0
            Text = "#Loc.kExtraThumbs"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtExtraBackdrops
            SpecialMenu = 0
            Text = "#Loc.kExtraFanarts"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByTrailer
            SpecialMenu = 0
            Text = "#Loc.kTrailer"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortBySubtitles
            SpecialMenu = 0
            Text = "#Loc.kSubtitles"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem MenuViewSortByTVShow
         SpecialMenu = 0
         Text = "#Menu.CMMSortList"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem SortListAscending
            SpecialMenu = 0
            Text = "Ascending"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem SortListDescending
            SpecialMenu = 0
            Text = "Descending"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 20
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByTVShowTitle
            SpecialMenu = 0
            Text = "#menu.ViewSortByTVShowTitle"
            Index = -2147483648
            ShortcutKey = "1"
            Shortcut = "Cmd+Control+1"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByTVShowSortTitle
            SpecialMenu = 0
            Text = "#menu.ViewSortByTVShowSortTitle"
            Index = -2147483648
            ShortcutKey = "2"
            Shortcut = "Cmd+Control+2"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 21
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByPath
            SpecialMenu = 0
            Text = "#menu.ViewSortByPath"
            Index = 1
            ShortcutKey = "3"
            Shortcut = "Cmd+Control+3"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByPremiereDate
            SpecialMenu = 0
            Text = "#Menu.ViewSortByPremiereDate"
            Index = 1
            ShortcutKey = "4"
            Shortcut = "Cmd+Control+4"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByNextAired
            SpecialMenu = 0
            Text = "#menu.ViewSortByNextAired"
            Index = -2147483648
            ShortcutKey = "5"
            Shortcut = "Cmd+Control+5"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByRating
            SpecialMenu = 0
            Text = "#menu.ViewSortByRating"
            Index = 1
            ShortcutKey = "7"
            Shortcut = "Cmd+Control+7"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByRuntime
            SpecialMenu = 0
            Text = "#Loc.kRuntime"
            Index = 1
            ShortcutKey = "6"
            Shortcut = "Cmd+Control+6"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByTVShowStatus
            SpecialMenu = 0
            Text = "#Menu.ViewSortByTVShowStatus"
            Index = -2147483648
            ShortcutKey = "8"
            Shortcut = "Cmd+Control+8"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByTVShowEpisodeFiles
            SpecialMenu = 0
            Text = "#Loc.kEpisodeFiles"
            Index = -2147483648
            ShortcutKey = "9"
            Shortcut = "Cmd+Control+9"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 22
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtPoster
            SpecialMenu = 0
            Text = "#Loc.kPoster"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtBackdrop
            SpecialMenu = 0
            Text = "#Loc.kFanart"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtBanner
            SpecialMenu = 0
            Text = "#Loc.kBanner"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtLogo
            SpecialMenu = 0
            Text = "#Loc.kLogo"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtClearArt
            SpecialMenu = 0
            Text = "#Loc.kClearArt"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtThumb
            SpecialMenu = 0
            Text = "#Loc.kThumb"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtCharacterArt
            SpecialMenu = 0
            Text = "#Loc.kCharacterArt"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByArtExtraBackdrops
            SpecialMenu = 0
            Text = "#Loc.kExtraFanarts"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ViewSortByThemeSong
            SpecialMenu = 0
            Text = "#Loc.kThemeSong"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 5
         AutoEnable = True
         Visible = True
      End
      Begin CocoaMenuItemShowToolbar MenuViewHideToolbar
         SpecialMenu = 0
         Text = "#Menu.ViewShowToolbar"
         Index = -2147483648
         ShortcutKey = "T"
         Shortcut = "Cmd+Option+T"
         MenuModifier = True
         MacOptionKey = True
         AutoEnable = True
         Visible = True
      End
      Begin CocoaMenuItemCustomizeToolbar MenuViewCustomizeToolbar
         SpecialMenu = 0
         Text = "#Menu.ViewCustomizeToolbar"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ViewFullscreen
         SpecialMenu = 0
         Text = "#Menu.ViewEnterFullScreen"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+Control+F"
         MenuModifier = True
         MacControlKey = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ToolsMenu
      SpecialMenu = 0
      Text = "#Menu.Tools"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem ToolsShare
         SpecialMenu = 0
         Text = "#Loc.kShare"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem ShareFacebook
            SpecialMenu = 0
            Text = "Facebook"
            Index = -2147483648
            Icon = 1942191948
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ShareTwitter
            SpecialMenu = 0
            Text = "Twitter"
            Index = -2147483648
            Icon = 860077456
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem ToolsTraktTV
         SpecialMenu = 0
         Text = "Trakt.tv"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem TrakttvMarkasSeen
            SpecialMenu = 0
            Text = "Mark as Seen"
            Index = -2147483648
            ShortcutKey = "T"
            Shortcut = "Cmd+Shift+T"
            MenuModifier = True
            AltMenuModifier = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem TrakttvMarkasUnseen
            SpecialMenu = 0
            Text = "Mark as Unseen"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem MenuToolsExtraDownloadsMovies
         SpecialMenu = 0
         Text = "#Menu.ToolsExtras"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem ToolsGetMissingArtwork
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetMissing"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsGetAllMissingArtwork
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetMissingAll"
            Index = 0
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UntitledSeparator0
            SpecialMenu = 0
            Text = "-"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtPoster
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetPoster"
            Index = 0
            Icon = 1832596947
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtFanart
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetFanart"
            Index = 0
            Icon = 1091081221
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 16
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtLogo
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetLogo"
            Index = 0
            Icon = 1297753480
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtBanner
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetBanner"
            Index = 0
            Icon = 1570572488
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtClearArt
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetClearArt"
            Index = 0
            Icon = 582835333
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtThumb
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetThumb"
            Index = 0
            Icon = 879390813
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtDiscArt
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetDisc"
            Index = 0
            Icon = 751309654
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UntitledSeparator2
            SpecialMenu = 0
            Text = "-"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtThumbs
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetExtraThumbs"
            Index = 0
            Icon = 643657929
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtExtraFanart
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetExtraFanart"
            Index = 0
            Icon = 476761537
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UntitledSeparator1
            SpecialMenu = 0
            Text = "-"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraTrailer
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraTrailer"
            Index = -2147483648
            Icon = 510597367
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem MenuToolsExtraDownloadsShows
         SpecialMenu = 0
         Text = "#Menu.ToolsExtras"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem ToolsGetMissingArtwork
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetMissing"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsGetAllMissingArtwork
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetMissingAll"
            Index = 1
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 23
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtPoster
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetPoster"
            Index = 1
            Icon = 1832596947
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtFanart
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetFanart"
            Index = 1
            Icon = 1091081221
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtBanner
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetBanner"
            Index = 1
            Icon = 1570572488
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 24
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtLogo
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetLogo"
            Index = 1
            Icon = 1297753480
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtClearArt
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetClearArt"
            Index = 1
            Icon = 582835333
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtThumb
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetThumb"
            Index = 1
            Icon = 879390813
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraArtCharacterArt
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraArtGetCharacterArt"
            Index = -2147483648
            Icon = 142068885
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 25
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsExtraThemeSong
            SpecialMenu = 0
            Text = "#Menu.ToolsExtraThemeSongs"
            Index = -2147483648
            Icon = 1258257879
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem ToolsClean
         SpecialMenu = 0
         Text = "#Menu.ToolsClean"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 15
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsMovies2Folders
         SpecialMenu = 0
         Text = "#Menu.ToolsPutMovies2Folders"
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+Option+Alt+S"
         MenuModifier = True
         MacOptionKey = True
         PCAltKey = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsRename
         SpecialMenu = 0
         Text = "#Loc.dlgRename"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem ToolsBatchRenaming
            SpecialMenu = 0
            Text = "#Loc.kAll"
            Index = -2147483648
            ShortcutKey = "R"
            Shortcut = "Cmd+Option+R"
            MenuModifier = True
            MacOptionKey = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ToolsRenameSelection
            SpecialMenu = 0
            Text = "#Loc.kSelection"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem ToolsMarkasWatched
         SpecialMenu = 0
         Text = "#Menu.cmmMarkAsWatched"
         Index = -2147483648
         ShortcutKey = "T"
         Shortcut = "Cmd+T"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsMarkasLocked
         SpecialMenu = 0
         Text = "#Menu.CMMMarkAsLocked"
         Index = -2147483648
         ShortcutKey = "L"
         Shortcut = "Cmd+L"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItemWindowMenu WindowMenu
      SpecialMenu = 0
      Text = "#Menu.Window"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem WindowMinimize
         SpecialMenu = 0
         Text = "#Menu.WindowMinimize"
         Index = -2147483648
         ShortcutKey = "M"
         Shortcut = "Cmd+M"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowZoom
         SpecialMenu = 0
         Text = "#Menu.WindowZoom"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 17
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowSetsmanager
         SpecialMenu = 0
         Text = "#Loc.MovieSetsManager"
         Index = -2147483648
         ShortcutKey = "E"
         Shortcut = "Cmd+E"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowEpisodeManager
         SpecialMenu = 0
         Text = "#Menu.WindowEpisodesManager"
         Index = -2147483648
         ShortcutKey = "E"
         Shortcut = "Cmd+E"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowTVGuide
         SpecialMenu = 0
         Text = "#Loc.kTVGuide"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 2
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowBringAlltoFront
         SpecialMenu = 0
         Text = "#Menu.WindowBringAllToFront"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 3
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Text = "#Menu.Help"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin AppleMenuItem HelpAbout
         SpecialMenu = 0
         Text = "#Menu.HelpAbout"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin AppleMenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 0
         AutoEnable = True
         Visible = True
      End
      Begin AppleMenuItem HelpDonate
         SpecialMenu = 0
         Text = "#Menu.HelpDonate"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin AppleMenuItem HelpCheckForUpdates
         SpecialMenu = 0
         Text = "#Menu.HelpCheckForUpdates"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin AppleMenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 1
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpVisitWebsite
         SpecialMenu = 0
         Text = "#Menu.HelpVisitWebsite"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpContactAuthor
         SpecialMenu = 0
         Text = "#Menu.HelpContactAuthor"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpSuggestion
         SpecialMenu = 0
         Text = "#Menu.HelpSuggestion"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpRequest
         SpecialMenu = 0
         Text = "#Menu.HelpRequest"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 12
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpVisitKodiForumThread
         SpecialMenu = 0
         Text = "#Menu.HelpVisitKodiForumThread"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpDownloadStudioLogosets
         SpecialMenu = 0
         Text = "#Menu.HelpDownloadStudioLogosets"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu

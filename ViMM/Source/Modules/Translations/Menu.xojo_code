#tag Module
Protected Module Menu
	#tag Constant, Name = ApplePreferences, Type = String, Dynamic = True, Default = \"Preferences", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Preferences"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Voorkeuren"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Inst\xC3\xA4llningar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Einstellungen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Pr\xC3\xA9f\xC3\xA9rences"
	#tag EndConstant

	#tag Constant, Name = CMMCopyLink, Type = String, Dynamic = True, Default = \"Copy Link", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Copy Link"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kopieer link"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kopiera l\xC3\xA4nk"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Link kopieren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Copier le lien"
	#tag EndConstant

	#tag Constant, Name = CMMCopyText, Type = String, Dynamic = True, Default = \"Copy Text", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Copy Text"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kopieer tekst"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kopiera text"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Text kopieren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Copier le texte"
	#tag EndConstant

	#tag Constant, Name = CMMMarkAsIgnored, Type = String, Dynamic = True, Default = \"Mark as Ignored", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Mark as Ignored"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Markeer als genegeerd"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Marquer comme ignor\xC3\xA9"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Als Ignoriert markieren"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Markera som ignorerad"
	#tag EndConstant

	#tag Constant, Name = CMMMarkAsLocked, Type = String, Dynamic = True, Default = \"Lock", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Lock"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Vergrendel"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"L\xC3\xA5s"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Verrouiller"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sperre"
	#tag EndConstant

	#tag Constant, Name = CMMMarkAsUnlocked, Type = String, Dynamic = True, Default = \"Unlock", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Unlock"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ontgrendel"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"D\xC3\xA9verrouiller"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Entsperren"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"L\xC3\xA5sa upp"
	#tag EndConstant

	#tag Constant, Name = CMMMarkAsUnwatched, Type = String, Dynamic = True, Default = \"Mark as Unwatched", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Mark as Unwatched"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Markeer als onbekeken"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Markera som ej visad"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Als ungesehen markieren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Marquer comme Non vu"
	#tag EndConstant

	#tag Constant, Name = CMMMarkAsWatched, Type = String, Dynamic = True, Default = \"Mark as Watched", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Mark as Watched"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Markeer als bekeken"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Markera som visad"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Als gesehen markieren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Marquer comme Vu"
	#tag EndConstant

	#tag Constant, Name = CMMRemove, Type = String, Dynamic = True, Default = \"Remove %S...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Remove %S..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijder %S..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ta bort %s..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"%S entfernen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Enlever le %S..."
	#tag EndConstant

	#tag Constant, Name = CMMRemoveAnime, Type = String, Dynamic = True, Default = \"Remove Anime...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Remove Anime..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijder anime..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ta bort tecknat..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Anime entfernen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Enlever l\'anime..."
	#tag EndConstant

	#tag Constant, Name = CMMRemoveMovie, Type = String, Dynamic = True, Default = \"Remove Movie...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Remove Movie..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijder film..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ta bort film..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Film entfernen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Enlever le film..."
	#tag EndConstant

	#tag Constant, Name = CMMRemoveTVShow, Type = String, Dynamic = True, Default = \"Remove TV Show...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Remove TV Show..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijder TV show..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ta bort TV-serie..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Serie entfernen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Enlever la S\xC3\xA9rie TV"
	#tag EndConstant

	#tag Constant, Name = CMMSearchTheWeb, Type = String, Dynamic = True, Default = \"Search the Web", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search the Web"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek op het internet"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S\xC3\xB6k p\xC3\xA5 webben"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Web-Suche"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher sur le web"
	#tag EndConstant

	#tag Constant, Name = CMMSortList, Type = String, Dynamic = True, Default = \"Sort By", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Sort By"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Sorteer bij"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Sortering"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sortieren nach"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Trier par"
	#tag EndConstant

	#tag Constant, Name = CMMWatchMovie, Type = String, Dynamic = True, Default = \"Watch Movie", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Watch Movie"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bekijk film"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa film"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Film ansehen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Regarder le film"
	#tag EndConstant

	#tag Constant, Name = CMMWatchTrailer, Type = String, Dynamic = True, Default = \"Watch Trailer", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Watch Trailer"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bekijk trailer"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa trailer"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Trailer ansehen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Regarder la bande-annonce"
	#tag EndConstant

	#tag Constant, Name = Edit, Type = String, Dynamic = True, Default = \"Edit", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Edit"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wijzig"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Bearbeiten"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE7\xB7\xA8\xE9\x9B\x86"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Edition"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Composizione"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Redigera"
	#tag EndConstant

	#tag Constant, Name = EditCopy, Type = String, Dynamic = True, Default = \"Copy", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Copy"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kopieren"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xB3\xE3\x83\x94\xE3\x83\xBC"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Copier"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Copia"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kopieer"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kopiera"
	#tag EndConstant

	#tag Constant, Name = EditCut, Type = String, Dynamic = True, Default = \"Cut", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Cut"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ausschneiden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xAB\xE3\x83\x83\xE3\x83\x88"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Couper"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Taglia"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Knip"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Klipp ut"
	#tag EndConstant

	#tag Constant, Name = EditDelete, Type = String, Dynamic = True, Default = \"Delete", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Delete"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6schen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE5\x89\x8A\xE9\x99\xA4"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Supprimer"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Elimina"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijder"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Radera"
	#tag EndConstant

	#tag Constant, Name = EditPaste, Type = String, Dynamic = True, Default = \"Paste", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Paste"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Einsetzen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x9A\xE3\x83\xBC\xE3\x82\xB9\xE3\x83\x88"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Coller"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Incolla"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Plak"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Klistra in"
	#tag EndConstant

	#tag Constant, Name = EditRedo, Type = String, Dynamic = True, Default = \"Redo", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Redo"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wiederholen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\x84\xE3\x82\x8A\xE7\x9B\xB4\xE3\x81\x99"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9tablir"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Ripristina"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Doe opnieuw"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"\xC3\x85terg\xC3\xA5"
	#tag EndConstant

	#tag Constant, Name = EditSelectAll, Type = String, Dynamic = True, Default = \"Select All", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Select All"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alles ausw\xC3\xA4hlen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x81\x99\xE3\x81\xB9\xE3\x81\xA6\xE3\x82\x92\xE9\x81\xB8\xE6\x8A\x9E"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tout s\xC3\xA9lectionner"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Seleziona tutto"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Selecteer alles"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Markera allt"
	#tag EndConstant

	#tag Constant, Name = EditUndo, Type = String, Dynamic = True, Default = \"Undo", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Undo"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Herstel"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Widerrufen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE5\x8F\x96\xE3\x82\x8A\xE6\xB6\x88\xE3\x81\x99"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Annuler"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Annulla"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"\xC3\x85ngra"
	#tag EndConstant

	#tag Constant, Name = ExportPrint, Type = String, Dynamic = True, Default = \"Print", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Print"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Print"
	#tag EndConstant

	#tag Constant, Name = File, Type = String, Dynamic = True, Default = \"File", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"File"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Archief"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ablage"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x95\xE3\x82\xA1\xE3\x82\xA4\xE3\x83\xAB"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fichier"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Archivio"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Arkiv"
	#tag EndConstant

	#tag Constant, Name = FileCloseWindow, Type = String, Dynamic = True, Default = \"Close Window", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Close Window"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Sluit venster"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Schliessen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE9\x96\x89\xE3\x81\x98\xE3\x82\x8B"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fermer"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Chiudi"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"St\xC3\xA4ng f\xC3\xB6nster"
	#tag EndConstant

	#tag Constant, Name = FileExport, Type = String, Dynamic = True, Default = \"Export...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Export..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Exporteer..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Export..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Exporter..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Exportera..."
	#tag EndConstant

	#tag Constant, Name = FileExportAsHTML, Type = String, Dynamic = True, Default = \"HTML", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"HTML"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"HTML"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"HTML"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"HTML"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"HTML"
	#tag EndConstant

	#tag Constant, Name = FileManualSearch, Type = String, Dynamic = True, Default = \"Manual Search...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Manual Search..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Handmatig zoeken..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Manuell s\xC3\xB6kning..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Manuelle Suche..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Recherche manuelle..."
	#tag EndConstant

	#tag Constant, Name = FilePrint, Type = String, Dynamic = True, Default = \"Print...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Print..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Drucken..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Imprimer..."
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x97\xE3\x83\xAA\xE3\x83\xB3\xE3\x83\x88..."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Stampa\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Druk af..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Skriv ut..."
	#tag EndConstant

	#tag Constant, Name = FileRefreshList, Type = String, Dynamic = True, Default = \"Rescan Folders", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Rescan Folders"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Herzoek mappen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"F\xC3\xB6rnya listan"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ordner scannen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rescanner les dossiers"
	#tag EndConstant

	#tag Constant, Name = FileShowInFinder, Type = String, Dynamic = True, Default = \"Show in Finder", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Reveal in Finder"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon in finder"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Im Finder zeigen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa i Finder"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher dans le finder"
	#tag EndConstant

	#tag Constant, Name = FileUpdateRatings, Type = String, Dynamic = True, Default = \"All Ratings", Scope = Protected
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alle Bewertungen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Alle beoordelingen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Alla betyg"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alle Bewertungen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tous les classements"
	#tag EndConstant

	#tag Constant, Name = FileUpdateShowStatus, Type = String, Dynamic = True, Default = \"All Show Status", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"All Show Status"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Alle serie status"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Status aller Serien"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"All status"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tous les statuts de s\xC3\xA9rie"
	#tag EndConstant

	#tag Constant, Name = Help, Type = String, Dynamic = True, Default = \"Help", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Help"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Help"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Hj\xC3\xA4lp"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Hilfe"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aide"
	#tag EndConstant

	#tag Constant, Name = HelpAbout, Type = String, Dynamic = True, Default = \"About", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"About "
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Over "
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Om "
		#Tag Instance, Platform = Any, Language = de, Definition  = \"\xC3\x9Cber"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\xC3\x80 propos de"
	#tag EndConstant

	#tag Constant, Name = HelpCheckForUpdates, Type = String, Dynamic = True, Default = \"Check For Updates", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Check For Updates"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek naar nieuwe versie..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kontrollera uppdateringar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Nach Aktualisierungen suchen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher les mises \xC3\xA0 jour"
	#tag EndConstant

	#tag Constant, Name = HelpContactAuthor, Type = String, Dynamic = True, Default = \"Contact Author", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Contact Author"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Contact auteur"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kontakta upphovsmannen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Programmierer kontaktieren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Contacter l\'auteur"
	#tag EndConstant

	#tag Constant, Name = HelpDonate, Type = String, Dynamic = True, Default = \"Donate...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Donate..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Doneer..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Donera..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Spenden..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Donation..."
	#tag EndConstant

	#tag Constant, Name = HelpDownloadStudioLogosets, Type = String, Dynamic = True, Default = \"Download Studio Logo Sets", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Studio Logo Sets"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download studio logo sets"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned Studio logotypes"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Studio-Logo-Set herunterladen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger les logos de studios"
	#tag EndConstant

	#tag Constant, Name = HelpRequest, Type = String, Dynamic = True, Default = \"Request Help", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Request Help"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Hulp vragen"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Hilfe anfordern"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Demander de l\'aide"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Beg\xC3\xA4r hj\xC3\xA4lp"
	#tag EndConstant

	#tag Constant, Name = HelpSuggestion, Type = String, Dynamic = True, Default = \"Send Suggestion", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Send Suggestion"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Stuur suggestie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vorschlag senden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Envoyer suggestion"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Skicka in f\xC3\xB6rslag"
	#tag EndConstant

	#tag Constant, Name = HelpVisitKodiForumThread, Type = String, Dynamic = True, Default = \"Visit Kodi Forum Thread", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Visit Kodi Forum Thread"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bezoek Kodi forum draad"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"G\xC3\xA5 till Kodi forumtr\xC3\xA5d"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kodi-Forum-Thread besuchen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Visiter le forum Kodi"
	#tag EndConstant

	#tag Constant, Name = HelpVisitWebsite, Type = String, Dynamic = True, Default = \"Visit Website", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Visit Website"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bezoek website"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"G\xC3\xA5 till webbsida"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Webseite besuchen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Visiter le site web"
	#tag EndConstant

	#tag Constant, Name = SortAscending, Type = String, Dynamic = True, Default = \"Ascending", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Ascending"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Oplopend"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Stigande"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Aufsteigend"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Ascendant"
	#tag EndConstant

	#tag Constant, Name = SortDescending, Type = String, Dynamic = True, Default = \"Descending", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Descending"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Aflopend"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Fallande"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Absteigend"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Descendant"
	#tag EndConstant

	#tag Constant, Name = Tools, Type = String, Dynamic = True, Default = \"Tools", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Tools"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Hulpmiddelen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Verktyg"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Tools"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Outils"
	#tag EndConstant

	#tag Constant, Name = ToolsBatchRenaming, Type = String, Dynamic = True, Default = \"Rename All", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Rename All"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Hernoem alles"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alles Umbenennen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tout renommer"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"D\xC3\xB6p om samtliga"
	#tag EndConstant

	#tag Constant, Name = ToolsClean, Type = String, Dynamic = True, Default = \"Clean All...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Clean All..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verschoon alles..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Rensa samtliga..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alles bereinigen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tout nettoyer..."
	#tag EndConstant

	#tag Constant, Name = ToolsDiscoverNewShows, Type = String, Dynamic = True, Default = \"Discover New Shows", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Discover New Shows"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ontdek nieuwe series"
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetBanner, Type = String, Dynamic = True, Default = \"Download Banner...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Banner..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download banner..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned Banner..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Banner herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger la Banni\xC3\xA8re..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetCharacterArt, Type = String, Dynamic = True, Default = \"Download Character Art...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Character Art..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download karakter afbeelding..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned Character Art..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Character Art herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger le Character Art..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetClearArt, Type = String, Dynamic = True, Default = \"Download ClearArt...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download ClearArt..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download clearart..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned ClearArt..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"ClearArt herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger le ClearArt..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetDisc, Type = String, Dynamic = True, Default = \"Download DiscArt...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download DiscArt..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download schijf afbeelding..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned DiscArt..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"DiscArt herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger le DiscArt..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetExtraFanart, Type = String, Dynamic = True, Default = \"Download Extra Backdrops", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Extra Backdrops"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download extra achtergronden"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned extra bakgrundsbilder"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Extra Hintergrund herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger les Extra Backdrops"
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetExtraThumbs, Type = String, Dynamic = True, Default = \"Download Extra Thumbs", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Extra Thumbs"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download extra voorbeelden"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned extra tumnaglar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Extra Thumbs herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger les Extra Thumbs"
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetFanart, Type = String, Dynamic = True, Default = \"Download Backdrop...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Backdrop..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download achtergrond..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned Bakgrundsbild..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Hintergrund herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger le Backdrop..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetLogo, Type = String, Dynamic = True, Default = \"Download Logo...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Logo..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download logo..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned Logo..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Logo herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger le Logo..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetMissing, Type = String, Dynamic = True, Default = \"Download Missing Images for Selection", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Missing Images for Selection"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download ontbrekende afbeeldingen voor de huidige selectie"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned saknade bilder"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Fehlende Extras herunterladen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger les images manquantes pour la s\xC3\xA9lection"
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetMissingAll, Type = String, Dynamic = True, Default = \"Download Missing Images for All", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Missing Images for All"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download ontbrekende afbeeldingen voor alles"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned alla saknade bilder"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alle fehlenden Extras herunterladen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger toutes les images manquantes"
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetPoster, Type = String, Dynamic = True, Default = \"Download Poster...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Poster..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download poster..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned Omslag..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Poster herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger le Poster..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtraArtGetThumb, Type = String, Dynamic = True, Default = \"Download Thumb...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Thumb..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download voorbeeld afbeelding..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned Tumnagel..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Thumb herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger les Vignettes..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtras, Type = String, Dynamic = True, Default = \"Extras", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Extras"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Extras"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Extras"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Extras"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher extras"
	#tag EndConstant

	#tag Constant, Name = ToolsExtraThemeSongs, Type = String, Dynamic = True, Default = \"Download Theme Song...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Theme Song..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download thema lied..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger le g\xC3\xA9n\xC3\xA9rique..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Titelmelodie herunterladen..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Laddar ned Temamusik..."
	#tag EndConstant

	#tag Constant, Name = ToolsExtraTrailer, Type = String, Dynamic = True, Default = \"Download Trailer...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Download Trailer..."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Download trailer..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ladda ned Trailer..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Trailer herunterladen..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9charger la bande-annonce..."
	#tag EndConstant

	#tag Constant, Name = ToolsPutMovies2Folders, Type = String, Dynamic = True, Default = \"Put Movie Files Into Folders", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Put Movie Files Into Folders"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zet film bestanden in folders"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Placera filmfiler i mappar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Filme in Ordner verschieben"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Mettre les fichiers des films dans des dossiers"
	#tag EndConstant

	#tag Constant, Name = ToolsRenameSelection, Type = String, Dynamic = True, Default = \"Rename Selection", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Rename Selection"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Hernoem selectie"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Byt namn p\xC3\xA5 markerade"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Auswahl umbenennen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Renommer la s\xC3\xA9lection"
	#tag EndConstant

	#tag Constant, Name = ToolsShare, Type = String, Dynamic = True, Default = \"Share", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Share"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Deel"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Dela"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sharen auf..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Partager"
	#tag EndConstant

	#tag Constant, Name = View, Type = String, Dynamic = True, Default = \"View", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"View"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Darstellung"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE8\xA1\xA8\xE7\xA4\xBA"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Pr\xC3\xA9sentation"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Vista"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Weergave"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa"
	#tag EndConstant

	#tag Constant, Name = ViewAnime, Type = String, Dynamic = True, Default = \"Anime", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Anime"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Anime"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Tecknat"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Anime"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Anime"
	#tag EndConstant

	#tag Constant, Name = ViewCustomizeToolbar, Type = String, Dynamic = True, Default = \"Customize Toolbar\xE2\x80\xA6", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Customize Toolbar\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Symbolleiste anpassen \xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x84\xE3\x83\xBC\xE3\x83\xAB\xE3\x83\x90\xE3\x83\xBC\xE3\x82\x92\xE3\x82\xAB\xE3\x82\xB9\xE3\x82\xBF\xE3\x83\x9E\xE3\x82\xA4\xE3\x82\xBA..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Personnaliser la barre d\'outils..."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Personalizza la barra strumenti\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Pas knoppenbalk aan..."
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Anpassa verktygsf\xC3\xA4ltet..."
	#tag EndConstant

	#tag Constant, Name = ViewEditMetadata, Type = String, Dynamic = True, Default = \"Edit Metadata", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Edit Metadata"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wijzig metadata"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"\xC3\x84ndra metadata"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Metadata bearbeiten"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\xC3\x89diter Metadatas"
	#tag EndConstant

	#tag Constant, Name = ViewEnterFullscreen, Type = String, Dynamic = True, Default = \"Enter Full Screen", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Enter Full Screen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Schakel schermvullende weergave in"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa Helsk\xC3\xA4rm"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vollbildanzeige"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Mode plein \xC3\xA9cran"
	#tag EndConstant

	#tag Constant, Name = ViewExitFullscreen, Type = String, Dynamic = True, Default = \"Exit Full Screen", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Exit Full Screen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Schakel schermvullende weergave uit"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"G\xC3\xA5 ur Helsk\xC3\xA4rm"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vollbildanzeige verlassen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quitter le mode plein \xC3\xA9cran"
	#tag EndConstant

	#tag Constant, Name = ViewHideToolbar, Type = String, Dynamic = True, Default = \"Hide Toolbar", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Hide Toolbar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Symbolleiste ausblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x84\xE3\x83\xBC\xE3\x83\xAB\xE3\x83\x90\xE3\x83\xBC\xE3\x82\x92\xE9\x9A\xA0\xE3\x81\x99"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Masquer la barre d\'outils"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nascondi la barra strumenti"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verberg knoppenbalk"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"G\xC3\xB6m verktygsf\xC3\xA4ltet"
	#tag EndConstant

	#tag Constant, Name = ViewMovies, Type = String, Dynamic = True, Default = \"Movies", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Movies"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Films"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Filmer"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Filme"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Films"
	#tag EndConstant

	#tag Constant, Name = ViewShowToolbar, Type = String, Dynamic = True, Default = \"Show Toolbar", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Toolbar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Symbolleiste einblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x84\xE3\x83\xBC\xE3\x83\xAB\xE3\x83\x90\xE3\x83\xBC\xE3\x82\x92\xE8\xA1\xA8\xE7\xA4\xBA"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher la barre d\'outils"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Mostra la barra strumenti"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon knoppenbalk"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa verktygsf\xC3\xA4ltet"
	#tag EndConstant

	#tag Constant, Name = ViewSortByMovieSortTitel, Type = String, Dynamic = True, Default = \"Movie Sort Title", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Movie Sort Title"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Film sorteer titel"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Film sorteringstitel"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Filmtitel f\xC3\xBCr die Sortierung"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Titre de tri"
	#tag EndConstant

	#tag Constant, Name = ViewSortByMovieTitle, Type = String, Dynamic = True, Default = \"Movie Title", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Movie Title"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Film titel"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Filmtitel"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Filmtitel"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Titre du film"
	#tag EndConstant

	#tag Constant, Name = ViewSortByNextAired, Type = String, Dynamic = True, Default = \"Next Aired", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Next Aired"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Volgende uitzending"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"N\xC3\xA4sta s\xC3\xA4nds"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"n\xC3\xA4chste Ausstrahlung"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Prochain \xC3\xA9pisode"
	#tag EndConstant

	#tag Constant, Name = ViewSortByPath, Type = String, Dynamic = True, Default = \"Path", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Path"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Pad"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S\xC3\xB6kv\xC3\xA4g"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Pfad"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Chemin"
	#tag EndConstant

	#tag Constant, Name = ViewSortByPremiereDate, Type = String, Dynamic = True, Default = \"Premiere Date", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Premiere Date"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Premi\xC3\xA8re datum"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Premi\xC3\xA4rdatum"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ver\xC3\xB6ffentlichung"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Date de la premi\xC3\xA8re diffusion"
	#tag EndConstant

	#tag Constant, Name = ViewSortByQuality, Type = String, Dynamic = True, Default = \"Quality", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Quality"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kwaliteit"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kvalitet"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Qualit\xC3\xA4t"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Qualit\xC3\xA9"
	#tag EndConstant

	#tag Constant, Name = ViewSortByRating, Type = String, Dynamic = True, Default = \"Rating", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Rating"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Beoordeling"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Betyg"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Bewertung"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Classement"
	#tag EndConstant

	#tag Constant, Name = ViewSortByStudio, Type = String, Dynamic = True, Default = \"Studio", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Studio"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Studio"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Studio"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Studio"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Studio"
	#tag EndConstant

	#tag Constant, Name = ViewSortByTVShowSortTitle, Type = String, Dynamic = True, Default = \"Show Sort Title", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Sort Title"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Serie sorteer titel"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Serie sorteringstitel"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Titel f\xC3\xBCr die Sortierung anzeigen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher le titre de tri"
	#tag EndConstant

	#tag Constant, Name = ViewSortByTVShowStatus, Type = String, Dynamic = True, Default = \"Show Status", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Status"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Serie status"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Status anzeigen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa Status"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher le statut"
	#tag EndConstant

	#tag Constant, Name = ViewSortByTVShowTitle, Type = String, Dynamic = True, Default = \"Show Title", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Title"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Serie titel"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa titel"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Titel anzeigen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher le titre"
	#tag EndConstant

	#tag Constant, Name = ViewSortByUnwatchedEpisodes, Type = String, Dynamic = True, Default = \"Unwatched Episodes", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Unwatched Episodes"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Onbekeken afleveringen"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ej visade avsnitt"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ungesehene Episoden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\xC3\x89pisode non vu"
	#tag EndConstant

	#tag Constant, Name = ViewSortByWatchedStatus, Type = String, Dynamic = True, Default = \"Watched Status", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Watched Status"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bekeken status"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visad-status"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Gesehen-Status"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Statut de lecture"
	#tag EndConstant

	#tag Constant, Name = ViewTVShows, Type = String, Dynamic = True, Default = \"TV Shows", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"TV Shows"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"TV series"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"TV-serier"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Serien"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"S\xC3\xA9rie TV"
	#tag EndConstant

	#tag Constant, Name = Window, Type = String, Dynamic = True, Default = \"Window", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Window"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Venster"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"F\xC3\xB6nster"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Fenster"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fen\xC3\xAAtre"
	#tag EndConstant

	#tag Constant, Name = WindowBringAllToFront, Type = String, Dynamic = True, Default = \"Bring All To Front", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Bring All To Front"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alle nach vorne bringen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tout ramener au premier plan"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Porta tutto in primo piano"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Alles op voorgrond"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Visa alla \xC3\xB6verst"
	#tag EndConstant

	#tag Constant, Name = WindowEpisodesManager, Type = String, Dynamic = True, Default = \"Episodes Manager", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Episodes Manager"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Afleveringen manager"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Gestionnaire d\'\xC3\xA9pisodes"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Episoden Manager"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Avsnittshanterare"
	#tag EndConstant

	#tag Constant, Name = WindowMinimize, Type = String, Dynamic = True, Default = \"Minimize", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Minimize"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Im Dock ablegen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9duire"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Contrai"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Minimaliseer"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Minimera"
	#tag EndConstant

	#tag Constant, Name = WindowZoom, Type = String, Dynamic = True, Default = \"Zoom", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Zoom"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Vergroot/verklein"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Zooma"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Zoom"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Agrandir"
	#tag EndConstant


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

/obj/machinery/computer/piratepad_control
	var/export_markets_override = list(EXPORT_MARKET_STATION, EXPORT_MARKET_PIRACY) // this one is from (last arg): code\modules\antagonists\pirate\pirate_shuttle_equipment.dm, original: export_item_and_contents(item_on_pad, apply_elastic = FALSE, dry_run = dry_run, delete_unsold = FALSE, external_report = report, ignore_typecache = nosell_typecache, export_markets = list(EXPORT_MARKET_STATION, EXPORT_MARKET_PIRACY))

/obj/machinery/computer/piratepad_control/syndiepad // it's interdyne
	export_markets_override = list(EXPORT_MARKET_DS_INTERDYNE)

/obj/machinery/computer/piratepad_control/syndiepad/syndicate // DS-2
	export_markets_override = list(EXPORT_MARKET_DS_INTERDYNE)

/obj/machinery/computer/piratepad_control/syndiepad/tarkon
	export_markets_override = list(EXPORT_MARKET_TARKON)

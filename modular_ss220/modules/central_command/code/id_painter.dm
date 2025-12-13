/obj/machinery/pdapainter/centcom
	name = "\improper CentCom Tablet & ID Painter"

/obj/machinery/pdapainter/centcom/Initialize(mapload)
	. = ..()
	register_context()

	if(!target_dept)
		pda_types = SSid_access.station_pda_templates.Copy()
		card_trims = SSid_access.centcom_job_templates.Copy()
		return

	// Cache the manager list, then check through each manager.
	// If we get a region match, add their trim templates and PDA paths to our lists.
	var/list/manager_cache = SSid_access.sub_department_managers_tgui
	for(var/access_txt in manager_cache)
		var/list/manager_info = manager_cache[access_txt]
		var/list/manager_regions = manager_info["regions"]
		if(target_dept in manager_regions)
			var/list/pda_list = manager_info["pdas"]
			var/list/trim_list = manager_info["templates"]
			pda_types |= pda_list
			card_trims |= trim_list

/obj/machinery/computer/cargo/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("company_import_window")
			var/datum/component/armament/company_imports/company_import_component = GetComponent(/datum/component/armament/company_imports)
			company_import_component.ui_interact(usr)
			. = TRUE
	if(.)
		post_signal(cargo_shuttle)

/obj/machinery/computer/cargo/Initialize(mapload)


	. = ..()
	AddComponent(/datum/component/armament/company_imports, subtypesof(/datum/armament_entry/company_import), 0)

/datum/armament_entry/company_import/akh_frontier
	category = FRONTIER_EQUIPMENT_NAME
	company_bitflag = CARGO_COMPANY_FRONTIER_EQUIPMENT

// Tools that you could use the rapid fabricator for, but you're too lazy to actually do that

/datum/armament_entry/company_import/akh_frontier/basic
	subcategory = "Hand-Held Equipment"
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/akh_frontier/basic/fock
	item_type = /obj/item/multitool/fock
	contraband = TRUE

/datum/armament_entry/company_import/akh_frontier/basic/doorforcer
	item_type = /obj/item/crowbar/large/doorforcer
	cost = PAYCHECK_COMMAND * 6
	contraband = TRUE

/datum/armament_entry/company_import/akh_frontier/basic/omni_drill
	item_type = /obj/item/screwdriver/omni_drill
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/akh_frontier/basic/arc_welder
	item_type = /obj/item/weldingtool/electric/arc_welder
	cost = PAYCHECK_COMMAND * 3

// Flatpacked fabricator and related upgrades

/datum/armament_entry/company_import/akh_frontier/deployables_fab
	subcategory = "Deployable Fabrication Equipment"

/datum/armament_entry/company_import/akh_frontier/deployables_fab/rapid_construction_fabricator
	item_type = /obj/item/flatpacked_machine
	cost = CARGO_CRATE_VALUE * 8

/datum/armament_entry/company_import/akh_frontier/deployables_fab/foodricator
	item_type = /obj/item/flatpacked_machine/organics_ration_printer
	cost = CARGO_CRATE_VALUE * 6

// Various smaller appliances than the deployable machines below

/datum/armament_entry/company_import/akh_frontier/appliances
	subcategory = "Appliances"

/datum/armament_entry/company_import/akh_frontier/appliances/charger
	item_type = /obj/item/wallframe/cell_charger_multi
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/akh_frontier/appliances/wall_heater
	item_type = /obj/item/wallframe/wall_heater
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/akh_frontier/appliances/water_synth
	item_type = /obj/item/flatpacked_machine/water_synth
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/akh_frontier/appliances/hydro_synth
	item_type = /obj/item/flatpacked_machine/hydro_synth
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/akh_frontier/appliances/sustenance_dispenser
	item_type = /obj/item/flatpacked_machine/sustenance_machine
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/akh_frontier/appliances/biogenerator
	item_type = /obj/item/flatpacked_machine/organics_printer
	description = "An advanced machine seen in frontier outposts and colonies capable of turning organic plant matter into \
		reagents and items of use that a fabricator can't typically make."
	cost = CARGO_CRATE_VALUE * 8

// Flatpacked, ready to deploy machines

/datum/armament_entry/company_import/akh_frontier/deployables_misc
	subcategory = "Deployable General Equipment"
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/akh_frontier/deployables_misc/arc_furnace
	item_type = /obj/item/flatpacked_machine/arc_furnace

/datum/armament_entry/company_import/akh_frontier/deployables_misc/co2_cracker
	item_type = /obj/item/flatpacked_machine/co2_cracker

/datum/armament_entry/company_import/akh_frontier/deployables_misc/recycler
	item_type = /obj/item/flatpacked_machine/recycler

// Flatpacked, ready to deploy machines for power related activities

/datum/armament_entry/company_import/akh_frontier/deployables
	subcategory = "Deployable Power Equipment"
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/akh_frontier/deployables/turbine
	item_type = /obj/item/flatpacked_machine/wind_turbine
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/akh_frontier/deployables/solids_generator
	item_type = /obj/item/flatpacked_machine/fuel_generator

/datum/armament_entry/company_import/akh_frontier/deployables/stirling_generator
	item_type = /obj/item/flatpacked_machine/stirling_generator
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/akh_frontier/deployables/rtg
	item_type = /obj/item/flatpacked_machine/rtg
	cost = PAYCHECK_COMMAND * 7
	restricted = TRUE

/datum/armament_entry/company_import/akh_frontier/deployables/solar
	item_type = /obj/item/flatpacked_machine/solar
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/akh_frontier/deployables/solar/titaniumglass
	item_type = /obj/item/flatpacked_machine/solar/titaniumglass
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/akh_frontier/deployables/solar/plasmaglass
	item_type = /obj/item/flatpacked_machine/solar/plasmaglass
	cost = PAYCHECK_COMMAND * 5

/datum/armament_entry/company_import/akh_frontier/deployables/solar/plastitaniumglass
	item_type = /obj/item/flatpacked_machine/solar/plastitaniumglass
	cost = PAYCHECK_COMMAND * 6

/datum/armament_entry/company_import/akh_frontier/deployables/solar_tracker
	item_type = /obj/item/flatpacked_machine/solar_tracker
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/akh_frontier/deployables/solar_control
	name = "Solar Array Console Board"
	item_type = /obj/item/circuitboard/computer/solar_control
	description = "The circuit board for the console that controls the solar panel arrays"
	cost = CARGO_CRATE_VALUE * 2

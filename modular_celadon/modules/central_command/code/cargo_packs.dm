/datum/supply_pack/centcom
	crate_type = /obj/structure/closet/crate/secure/centcom
	console_flag = CARGO_CONSOLE_NT_CENTCOM
	access_view = ACCESS_CENT_GENERAL


/datum/supply_pack/centcom/imports
	group = "Imports"

/datum/supply_pack/centcom/imports/clear_pda
	name = "Mint Condition Nanotrasen Clear PDA"
	desc = "Mint condition, freshly repackaged! A valuable collector's item normally valued at over 2.5 million credits, now available for a steal!"
	cost = 100000
	contains = list(/obj/item/modular_computer/pda/clear)

/datum/supply_pack/centcom/security
	group = "Security"

//security overrides




/datum/supply_pack/centcom/armory
	group = "Armory"
	access = ACCESS_CENT_SECURITY



//weapons

/datum/supply_pack/centcom/armory/pulse_rifle
	name = "Pulse rifle"
	desc = "A heavy-duty, multifaceted energy rifle with three modes. Preferred by front-line combat personnel."
	cost = 50000
	contains = list(/obj/item/gun/energy/pulse)

/datum/supply_pack/centcom/armory/nt_ar
	name = "NT-ARG 'Boarder'"
	desc = "A robust assault rifle used by Nanotrasen fighting forces."
	cost = 30000
	contains = list(/obj/item/gun/ballistic/automatic/ar)

//armours

/datum/supply_pack/centcom/armory/mod_responsory
	name = "Responsory MOD control"
	desc = "A high-speed rescue suit by Nanotrasen, intended for its emergency response teams."
	cost = 30000
	contains = list(/obj/item/mod/control/pre_equipped/responsory)
	access = ACCESS_CENT_SPECOPS

//armory overrides

/datum/supply_pack/centcom/misc
	group = "Miscellaneous Supplies"
	access = ACCESS_CENT_SUPPLY


/datum/supply_pack/centcom/misc/door_remote_service
	name = "Door remote - Service"
	desc = "Door remote for service departments."
	cost = 5000
	contains = list(/obj/item/door_remote/head_of_personnel)

/datum/supply_pack/centcom/misc/door_remote_medbay
	name = "Door remote - Medical"
	desc = "Door remote for medbay department."
	cost = 5000
	contains = list(/obj/item/door_remote/chief_medical_officer)

/datum/supply_pack/centcom/misc/door_remote_cargo
	name = "Door remote - Cargo"
	desc = "Door remote for cargo department."
	cost = 5000
	contains = list(/obj/item/door_remote/quartermaster)

/datum/supply_pack/centcom/misc/door_remote_security
	name = "Door remote - Security"
	desc = "Door remote for security department."
	cost = 5000
	contains = list(/obj/item/door_remote/head_of_security)

/datum/supply_pack/centcom/misc/door_remote_rnd
	name = "Door remote - Research"
	desc = "Door remote for research department."
	cost = 5000
	contains = list(/obj/item/door_remote/research_director)

/datum/supply_pack/centcom/misc/door_remote_engineering
	name = "Door remote - Engineering "
	desc = "Door remote for engineering department."
	cost = 5000
	contains = list(/obj/item/door_remote/chief_engineer)

/datum/supply_pack/centcom/misc/door_remote_captain
	name = "Door remote - Command"
	desc = "Door remote for command department."
	cost = 5000
	contains = list(/obj/item/door_remote/captain)

/datum/supply_pack/centcom/misc/door_remote_nt
	name = "Door remote - NanoTrasen"
	desc = "Door remote for NanoTrasen Officials."
	cost = 10000
	contains = list(/obj/item/door_remote/nanotrasen_consultant)

/datum/supply_pack/centcom/misc/door_remote_omni
	name = "Door remote - Omni"
	desc = "Door remote for entire NanoTrasen station."
	cost = 15000
	contains = list(/obj/item/door_remote/omni)

/datum/supply_pack/centcom/misc/protolathe_engineering
	name = "Protolathe - Engineering"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/engineering)

/datum/supply_pack/centcom/misc/protolathe_medical
	name = "Protolathe - Medical"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/medical)

/datum/supply_pack/centcom/misc/protolathe_service
	name = "Protolathe - Service"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/service)

/datum/supply_pack/centcom/misc/protolathe_cargo
	name = "Protolathe - Cargo"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/cargo)

/datum/supply_pack/centcom/misc/protolathe_science
	name = "Protolathe - Science"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/science)

/datum/supply_pack/centcom/misc/protolathe_security
	name = "Protolathe - Security"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/security)

/datum/supply_pack/centcom/misc/techfab_engineering
	name = "Techfab - Engineering"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/engineering)

/datum/supply_pack/centcom/misc/techfab_medical
	name = "Techfab - Medical"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/medical)

/datum/supply_pack/centcom/misc/techfab_service
	name = "Techfab - Service"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/service)

/datum/supply_pack/centcom/misc/techfab_cargo
	name = "Techfab - Cargo"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/cargo)

/datum/supply_pack/centcom/misc/techfab_science
	name = "Techfab - Science"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/science)

/datum/supply_pack/centcom/misc/techfab_security
	name = "Techfab - Security"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/security)

/datum/supply_pack/centcom/misc/circuit_imprinter
	name = "Circuit Imprinter"
	desc = "Circuit Imprinter circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/circuit_imprinter)

/datum/job/expeditionary_trooper
	title = JOB_VANGUARD_OPERATIVE
	faction = FACTION_STATION
	supervisors = SUPERVISOR_HEADS
	antagonist_restricted = TRUE
	desensitized_base = DESENSITIZED_THRESHOLD
	description = "Explore gateways, watch your friends die, find all the loot."
	config_tag = "VANGUARD_OPERATIVE"

	departments_list = list(
		/datum/job_department/science,
		/datum/job_department/cargo,
	)

	outfit = /datum/outfit/job/expeditionary_trooper
	plasmaman_outfit = /datum/outfit/plasmaman/mining

	paycheck = PAYCHECK_LOWER
	paycheck_department = ACCOUNT_CIV

	display_order = JOB_DISPLAY_ORDER_EXP_CORPS
	bounty_types = CIV_JOB_SCI
	family_heirlooms = list(/obj/item/binoculars)

	exp_requirements = 250
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	total_positions = 0
	spawn_positions = 0
	alt_titles = list("Vanguard Operative", "Expeditionary Field Medic", "Expeditionary Technician", "Expeditionary Trooper", "Vanguard Pointman",  "Vanguard Marksman")
	job_flags = JOB_ANNOUNCE_ARRIVAL|JOB_CREW_MANIFEST|JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_ASSIGN_QUIRKS|JOB_CAN_BE_INTERN

/datum/outfit/job/expeditionary_trooper
	name = "Vanguard Operative"
	jobtype = /datum/job/expeditionary_trooper

	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/expeditionary_corps

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/science
	duffelbag = /obj/item/storage/backpack/duffelbag/science

	backpack_contents = list(/obj/item/storage/box/expeditionary_survival)

	id = /obj/item/card/id/advanced/silver
	id_trim = /datum/id_trim/job/expeditionary_trooper

	belt = /obj/item/modular_computer/pda/expeditionary_corps

	chameleon_extras = list()

/datum/id_trim/job/expeditionary_trooper
	assignment = "Vanguard Operative"
	trim_icon = 'modular_nova/master_files/icons/obj/card.dmi'
	trim_state = "trim_blueshield"
	sechud_icon_state = SECHUD_VANGUARD_OPERATIVE
	extra_access = list()
	minimal_access = list(ACCESS_EVA, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_MAINT_TUNNELS, ACCESS_GATEWAY, ACCESS_TECH_STORAGE,
		ACCESS_RESEARCH, ACCESS_SCIENCE)

/obj/effect/landmark/start/expeditionary_corps
	name = JOB_VANGUARD_OPERATIVE
	icon_state = "Vanguard Operative"
	icon = 'modular_nova/master_files/icons/mob/landmarks.dmi'

/obj/item/modular_computer/pda/expeditionary_corps
	greyscale_colors = "#891417#000099"
	name = "Military PDA"
	long_ranged = TRUE

/obj/item/storage/box/expeditionary_survival
	name = "expedition survival pack"

/obj/structure/closet/crate/secure/exp_corps
	name = "Expedition Crate"
	desc = "A secure crate, for Expeditionary Corps only!"
	icon = 'modular_ss220/modules/return_prs/vanguard/icons/crates.dmi'
	icon_state = "exp_secure"
	base_icon_state = "exp_secure"
	req_access = list(ACCESS_GATEWAY)
	var/loadout_desc = "Whoever picks this is an incredibly boring generalist."

/obj/structure/closet/crate/secure/exp_corps/pointman
	name = "Pointman Crate"
	loadout_desc = "The Pointman's role is to lead the expedition team from the front \
	lines, and has been outfitted with a Shield. Due to the manufacturing costs involved \
	the Pointman kit lacks when it comes to engineering and medical tools."

/obj/structure/closet/crate/secure/exp_corps/field_medic
	name = "Field Medic Crate"
	loadout_desc = "The Field Medic's role is to ensure that the expidition returns at all. \
	Their role as a supportive unit is vital, and they are outfitted with the tools required of \
	their duty. This comes at the cost of any engineering equipment."

/obj/structure/closet/crate/secure/exp_corps/combat_tech
	name = "Combat Tech Crate"
	loadout_desc = "A Combat Tech is always good for an expedition. Having someone with \
	mechanical know-how can mean life or death. A good role to bring along to any expedition. \
	Sadly, this kit is lacking when it comes to medical equipment."

/obj/structure/closet/crate/secure/exp_corps/marksman
	name = "Marksman Crate"
	loadout_desc = "A Combat Tech is always good for an expedition. Having someone with \
	mechanical know-how can mean life or death. A good role to bring along to any expedition. \
	Sadly, this kit is lacking when it comes to medical equipment."

//base, don't use this, but leaving it for admin spawns is probably a good call?
/obj/structure/closet/crate/secure/exp_corps/PopulateContents()
	new /obj/item/storage/medkit/tactical(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)
	new /obj/item/storage/backpack/duffelbag/expeditionary_corps(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)

//marksman (has a gun)
/obj/structure/closet/crate/secure/exp_corps/marksman/PopulateContents()
	new /obj/item/storage/medkit/regular(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/storage/pouch/ammo/marksman(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/marksman(src)
	new /obj/item/storage/backpack/duffelbag/expeditionary_corps(src)
	new /obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case/skild(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)

//shield guy
/obj/structure/closet/crate/secure/exp_corps/pointman/PopulateContents()
	new /obj/item/storage/medkit/regular(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/pointman(src)
	new /obj/item/storage/backpack/duffelbag/expeditionary_corps(src)
	new /obj/item/shield/riot/pointman(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)

//medic
/obj/structure/closet/crate/secure/exp_corps/field_medic/PopulateContents()
	new /obj/item/storage/medkit/expeditionary(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/latex/nitrile/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/field_medic(src)
	new /obj/item/storage/backpack/duffelbag/expeditionary_corps(src)
	new /obj/item/healthanalyzer(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)

//engineer gaming
/obj/structure/closet/crate/secure/exp_corps/combat_tech/PopulateContents()
	new /obj/item/storage/medkit/emergency(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/chief_engineer/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/combat_tech(src)
	new /obj/item/storage/backpack/duffelbag/expeditionary_corps(src)
	new /obj/item/skillchip/job/engineer(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)

/obj/structure/closet/secure_closet/vanguard
	name = "Vanguard locker"
	req_access = list(ACCESS_GATEWAY)
	icon = 'modular_ss220/modules/return_prs/vanguard/icons/closet.dmi'
	icon_state = "exp"

//expeditionary MOD suit

/obj/item/mod/construction/plating/vanguard
	icon = 'modular_ss220/modules/return_prs/vanguard/icons/mod_construction.dmi'
	icon_state = "exp-plating"
	theme = /datum/mod_theme/vanguard

/datum/mod_theme/vanguard
	name = "expeditionary"
	desc = "An Expeditionary Corps armored suit, offering quicker speed at the cost of modules capacity."
	extended_desc = "An Expeditionary Corps classic, this model of MODsuit has been designed for safe moving in \
		dangerous areas."
	default_skin = "exp"
	armor_type = /datum/armor/mod_theme_vanguard
	complexity_max = DEFAULT_MAX_COMPLEXITY
	slowdown_deployed = 0.2
	allowed_suit_storage = list(
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	variants = list(
		"exp" = list(
		MOD_ICON_OVERRIDE = 'modular_ss220/modules/return_prs/vanguard/icons/mod_obj.dmi',
		MOD_WORN_ICON_OVERRIDE = 'modular_ss220/modules/return_prs/vanguard/icons/mod_worn.dmi',
			/obj/item/clothing/head/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE|HEADINTERNALS,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEEARS|HIDEHAIR|HIDESNOUT,
				UNSEALED_COVER = HEADCOVERSMOUTH,
				SEALED_COVER = HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/armor/mod_theme_vanguard
	melee = 20
	bullet = 20
	laser = 20
	energy = 20
	bomb = 25
	bio = 100
	fire = 75
	acid = 75
	wound = 20

/obj/item/mod/control/pre_equipped/vanguard
	theme = /datum/mod_theme/vanguard
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/headprotector,
	)
	default_pins = list(
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/flashlight,
	)

/obj/item/summon_beacon/vanguard
	name = "vanguard operatives supply beacon"
	desc = "Used to request your job supplies, use in hand to do so!"

	allowed_areas = list(
		/area/awaymission,
		/area/station/command/gateway,
	)

	selectable_atoms = list(
		/obj/structure/closet/crate/secure/exp_corps/marksman,
		/obj/structure/closet/crate/secure/exp_corps/pointman,
		/obj/structure/closet/crate/secure/exp_corps/field_medic,
		/obj/structure/closet/crate/secure/exp_corps/combat_tech,
	)

	area_string = "the gateway chamber"

/datum/area_spawn/vanguard_landmark
	target_areas = list(/area/station/command/gateway)
	desired_atom = /obj/effect/landmark/start/expeditionary_corps

/obj/effect/landmark/start/scientist/Initialize(mapload)
	. = ..()
	new /obj/effect/landmark/start/expeditionary_corps(get_turf(src))

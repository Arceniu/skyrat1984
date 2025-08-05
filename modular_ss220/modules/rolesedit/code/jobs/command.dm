/obj/item/encryptionkey/heads/captain
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_PRISON = 1, RADIO_CHANNEL_ENGINEERING = 0, RADIO_CHANNEL_SCIENCE = 0, RADIO_CHANNEL_MEDICAL = 0, RADIO_CHANNEL_SUPPLY = 0, RADIO_CHANNEL_SERVICE = 0)

// bridge assistant return from nova edit

/datum/station_trait/job/bridge_assistant
	weight = 2

/obj/item/modular_computer/pda/bridge_assistant
	name = "bridge assistant PDA"
	greyscale_colors = "#374f7e#a92323"
	starting_programs = list(
		/datum/computer_file/program/status,
	)

/datum/id_trim/job/bridge_assistant
	assignment = JOB_BRIDGE_ASSISTANT
	trim_state = "trim_assistant"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = SECHUD_BRIDGE_ASSISTANT
	minimal_access = list(
		ACCESS_COMMAND,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_MAINT_TUNNELS,
		ACCESS_RC_ANNOUNCE,
		ACCESS_TELEPORTER,
		ACCESS_WEAPONS,
	)

/datum/job/bridge_assistant
	alt_titles = list(
		"Bridge Assistant",
	)

/datum/job/bridge_assistant
	title = JOB_BRIDGE_ASSISTANT
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	description = "Watch over the Bridge, command its consoles, and spend your days brewing coffee for higher-ups."
	supervisors = "the Nanotrasen Officials, Station Captain, Bridge Officer and in non-Bridge related situations the other heads"
	department_head = list(JOB_CAPTAIN, JOB_NT_REP, JOB_BRIDGE_OFFICER)
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 0
	job_flags = STATION_JOB_FLAGS | STATION_TRAIT_JOB_FLAGS
	nova_stars_only = FALSE
	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CIV
	antagonist_restricted = FALSE
	allow_bureaucratic_error = FALSE

	outfit = /datum/outfit/job/bridge_assistant
	plasmaman_outfit = /datum/outfit/job/bridge_assistant/plasmaman

	department_for_prefs = null

	departments_list = list(
		/datum/job_department/command,
		)

	family_heirlooms = list(/obj/item/banner/command/mundane)
	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes = 1,
		/obj/item/pen/fountain = 1,
	)

//outfit datum
/datum/outfit/job/bridge_assistant
	name = "Bridge Assistant"

	jobtype = /datum/job/bridge_assistant
	id_trim = /datum/id_trim/job/bridge_assistant
	id = /obj/item/card/id/advanced
	uniform = /obj/item/clothing/under/trek/command/next
	neck = /obj/item/clothing/neck/large_scarf/blue
	belt = /obj/item/storage/belt/utility/full/inducer
	ears = /obj/item/radio/headset/headset_com
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/gun/energy/e_gun/mini
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(
		/obj/item/modular_computer/pda/bridge_assistant = 1,
	)


/datum/job/bridge_assistant/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	var/mob/living/carbon/bridgie = spawned
	if(istype(bridgie))
		bridgie.gain_trauma(/datum/brain_trauma/special/axedoration)

/datum/outfit/job/bridge_assistant/plasmaman
	name = "Bridge Assistant (Plasmaman)"
	uniform = /obj/item/clothing/under/plasmaman/enviroslacks
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	head = /obj/item/clothing/head/helmet/space/plasmaman/black
	neck = /obj/item/clothing/neck/large_scarf/blue
	ears = /obj/item/radio/headset/headset_com
	belt = /obj/item/storage/belt/utility/full/inducer
	l_pocket = /obj/item/gun/energy/e_gun/mini
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(
		/obj/item/modular_computer/pda/bridge_assistant = 1,
	)

//bridge officer
#define JOB_BRIDGE_OFFICER "Bridge Officer"

/datum/job/bridge_officer
	title = JOB_BRIDGE_OFFICER
	description = "Watch over the Bridge, and spend your days commanding Bridge Assistants to brew coffee for higher-ups."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD | DEADMIN_POSITION_SECURITY
	department_head = list(JOB_CAPTAIN, JOB_NT_REP)
	default_radio_channel = RADIO_CHANNEL_COMMAND
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 0
	supervisors = "Central Command, Nanotrasen Officials and Station Captain"
	job_flags = STATION_JOB_FLAGS | STATION_TRAIT_JOB_FLAGS
	human_authority = JOB_AUTHORITY_NON_HUMANS_ALLOWED
	nova_stars_only = FALSE
	paycheck = PAYCHECK_CREW * 1.5
	paycheck_department = ACCOUNT_CMD
	antagonist_restricted = TRUE
	minimal_player_age = 10
	exp_requirements = 250
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	required_languages = list(/datum/language/common = LANGUAGE_SPOKEN)
	outfit = /datum/outfit/job/bridge_officer
	plasmaman_outfit = /datum/outfit/job/bridge_officer/plasmaman
	department_for_prefs = null
	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)
	mind_traits = TRAIT_FAST_TYING
	voice_of_god_power = 1.2 //Almost Command Member
	config_tag = "BRIDGE_OFFICER"
	alt_titles = list(
		"Bridge Officer",
	)
	allow_bureaucratic_error = FALSE
	departments_list = list(
		/datum/job_department/central_command,
		/datum/job_department/command,
		)


	family_heirlooms = list(/obj/item/banner/command/mundane)
	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes = 1,
		/obj/item/book/manual/wiki/security_space_law = 1,
		/obj/item/pen/fountain = 1,
	)

/datum/id_trim/job/bridge_officer
	assignment = JOB_BRIDGE_OFFICER
	trim_state = "trim_securityofficer"
	department_color = COLOR_SECURITY_RED
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = SECHUD_OLD_SEC
	minimal_access = list(
		ACCESS_COMMAND,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_RC_ANNOUNCE,
		ACCESS_KEYCARD_AUTH,
		ACCESS_TELEPORTER,
		ACCESS_JANITOR,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MAINT_TUNNELS,
		ACCESS_TECH_STORAGE,
		ACCESS_SECURITY,
		ACCESS_WEAPONS,
	)
	extra_access = list(
		ACCESS_TCOMMS,
		ACCESS_VAULT,
		ACCESS_BAR,
		ACCESS_KITCHEN,
		ACCESS_EXTERNAL_AIRLOCKS,
	)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CENT_LIVING,
	)
	job = /datum/job/bridge_officer
	honorifics = list("Upper Underling", "Officer", "Head Mate")
	honorific_positions = HONORIFIC_POSITION_FIRST | HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_FIRST_FULL | HONORIFIC_POSITION_NONE

/obj/item/modular_computer/pda/bridge_officer
	name = "bridge officer PDA"
	greyscale_colors = "#374f7e#a92323"
	starting_programs = list(
		/datum/computer_file/program/status,
		/datum/computer_file/program/records/security
	)

/datum/outfit/job/bridge_officer
	name = "Bridge Officer"
	jobtype = /datum/job/bridge_officer
	id_trim = /datum/id_trim/job/bridge_officer
	id = /obj/item/card/id/advanced/silver
	uniform = /obj/item/clothing/under/rank/bridge_officer
	neck = /obj/item/clothing/neck/bowtie
	suit = /obj/item/clothing/suit/armor/vest/alt
	belt = /obj/item/melee/baton/telescopic/bronze
	ears = /obj/item/radio/headset/bridge_officer
	glasses = /obj/item/clothing/glasses/sunglasses/oval
	gloves = /obj/item/clothing/gloves/tackler/peacekeeper
	head = /obj/item/clothing/head/hats/caphat/parade/fedcap/black
	shoes = /obj/item/clothing/shoes/cowboy/black
	l_pocket = /obj/item/gun/energy/e_gun/mini
	r_pocket = /obj/item/assembly/flash/handheld
	implants = list(/obj/item/implant/mindshield)
	backpack_contents = list(
		/obj/item/modular_computer/pda/bridge_officer = 1,
		/obj/item/choice_beacon/job_locker/bridge_officer = 1,
		/obj/item/choice_beacon/coffee = 1,
	)


/datum/outfit/job/bridge_officer/plasmaman
	name = "Bridge Officer (Plasmaman)"
	uniform = /obj/item/clothing/under/plasmaman/security/nova
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	head = /obj/item/clothing/head/helmet/space/plasmaman
	belt = /obj/item/melee/baton/telescopic/bronze
	backpack_contents = list(
		/obj/item/modular_computer/pda/bridge_officer = 1,
		/obj/item/choice_beacon/job_locker/bridge_officer = 1,
		/obj/item/choice_beacon/coffee = 1,
		/obj/item/clothing/head/hats/caphat/parade/fedcap/black = 1,
	)

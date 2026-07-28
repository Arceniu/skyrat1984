#define SUPERVISOR_NANOTRASEN_ADMIRAL "the NanoTrasen Naval Admiral" //code/__DEFINES/jobs.dm

#define JOB_CENTCOM "CentCom Intern" //code/__DEFINES/jobs.dm

/datum/job/centcom
	title = JOB_CENTCOM
//	description = "Advise HoS, and Captain on matters of Security. Train green Officers. \
//		Lay back in your wheelchair and say \"I told you\" to the HoS when all of the station collapses."
//	auto_deadmin_role_flags =
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_NANOTRASEN_ADMIRAL
	minimal_player_age = 7
	exp_requirements = 0
//	exp_required_type = EXP_TYPE_CREW
//	exp_required_type_department = EXP_TYPE_SECURITY
//	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CENTCOM"

	outfit = /datum/outfit/job/veteran_advisor
	plasmaman_outfit = /datum/outfit/plasmaman/security

	paycheck = PAYCHECK_LOWER
	paycheck_department = ACCOUNT_CCD

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_VETERAN_ADVISOR
	departments_list = list(/datum/job_department/security)

	family_heirlooms = list(/obj/item/plaque)

	mail_goodies = list(
		/obj/item/clothing/accessory/medal/conduct = 1,
		/obj/item/instrument/trumpet = 5,
		/obj/item/storage/fancy/cigarettes/cigars = 10,
	)
	rpg_title = "Royal Advisor"
	allow_bureaucratic_error = FALSE
	job_flags = STATION_JOB_FLAGS | STATION_TRAIT_JOB_FLAGS | JOB_ANTAG_PROTECTED

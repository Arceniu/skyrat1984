#define SECHUD_SECURITY_MEDIC "hudsecuritymedic"

/datum/job/security_medic
	antagonist_restricted = TRUE

/datum/job/security_medic
	alt_titles = list(
		"Security Medic",
		"Field Medic",
		"Security Corpsman",
		"Brig Physician",
		"Combat Medic",
	)

/datum/area_spawn/secmed_locker
	target_areas = list(/area/station/security/medical, /area/station/security/lockers)
	desired_atom = /obj/structure/closet/secure_closet/security_medic

/datum/area_spawn/secmed_landmark
	target_areas = list(/area/station/security/medical, /area/station/security/brig)
	desired_atom = /obj/effect/landmark/start/security_medic

/datum/job/security_medic
	banned_quirks = list(SEC_RESTRICTED_QUIRKS)

/datum/loadout_item/accessory/armband_security
	restricted_roles = list(JOB_HEAD_OF_SECURITY, JOB_SECURITY_OFFICER, JOB_WARDEN, JOB_DETECTIVE, JOB_CORRECTIONS_OFFICER, JOB_SECURITY_MEDIC)

/datum/loadout_item/accessory/armband_security_deputy
	restricted_roles = list(JOB_HEAD_OF_SECURITY, JOB_SECURITY_OFFICER, JOB_WARDEN, JOB_DETECTIVE, JOB_CORRECTIONS_OFFICER, JOB_SECURITY_MEDIC)

//mapping helpers
/obj/effect/mapping_helpers/airlock/access/all/syndicate/ds/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_SYNDICATE_DS
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/syndicate/ds/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SYNDICATE_DS)
	return access_list

//map template
/datum/map_template/ruin/space/nova/des_two1984
	id = "des_two1984"
	suffix = "des_two1984.dmm"
	name = "Space-Ruin DS-2 (ss1984 edit)"
	description = "If DS-1 was so good... and DS-2 from offs..."
	always_place = TRUE

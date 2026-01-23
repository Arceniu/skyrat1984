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
	cost = 1000
	always_place = FALSE
	allow_duplicates = FALSE

#define INIT_ANNOUNCE(X) to_chat(world, span_boldannounce("[X]")); log_world(X)

/datum/controller/subsystem/mapping/loadWorld()
	. = ..()
	if(SSmapping.current_map.space_ruin_levels)
		var/list/FailedZsRat1984_syndicate = list()
		LoadGroup(FailedZsRat1984_syndicate, "The Syndicate Area", "RandomRuins/SpaceRuins/nova", "des_two1984.dmm", default_traits = list(ZTRAIT_LINKAGE = CROSSLINKED))
		if(LAZYLEN(FailedZsRat1984_syndicate))
			var/msg = "RED ALERT! The following map files failed to load: [FailedZsRat1984_syndicate[1]]"
			if(FailedZsRat1984_syndicate.len > 1)
				for(var/I in 2 to FailedZsRat1984_syndicate.len)
					msg += ", [FailedZsRat1984_syndicate[I]]"
			msg += ". Yell at your server host!"
			INIT_ANNOUNCE(msg)

#undef INIT_ANNOUNCE

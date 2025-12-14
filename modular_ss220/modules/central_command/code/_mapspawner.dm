#define INIT_ANNOUNCE(X) to_chat(world, span_boldannounce("[X]")); log_world(X)

/datum/controller/subsystem/mapping/loadWorld()
	. = ..()
	var/list/FailedZsRat1984 = list()
	LoadGroup(FailedZsRat1984, "Fore CentCom Dock", "map_files/generic", "CentCom_1984.dmm", default_traits = ZTRAITS_CENTCOM)
	if(LAZYLEN(FailedZsRat1984))
		var/msg = "RED ALERT! The following map files failed to load: [FailedZsRat1984[1]]"
		if(FailedZsRat1984.len > 1)
			for(var/I in 2 to FailedZsRat1984.len)
				msg += ", [FailedZsRat1984[I]]"
		msg += ". Yell at your server host!"
		INIT_ANNOUNCE(msg)

#undef INIT_ANNOUNCE

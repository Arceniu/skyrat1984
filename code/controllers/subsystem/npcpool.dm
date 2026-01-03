SUBSYSTEM_DEF(npcpool)
	name = "NPC Pool"
	flags = SS_POST_FIRE_TIMING|SS_NO_INIT|SS_BACKGROUND
	priority = FIRE_PRIORITY_NPC
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	var/list/currentrun = list()
	var/list/idlerun = list()	//SS1984 ADD

/datum/controller/subsystem/npcpool/stat_entry(msg)
	var/list/activelist = GLOB.simple_animals[AI_ON]
	msg = "NPCS:[length(activelist)]"
	return ..()

/datum/controller/subsystem/npcpool/fire(resumed = FALSE)

	if (!resumed)
		var/list/activelist = GLOB.simple_animals[AI_ON]
		var/list/idlelist = GLOB.simple_animals[AI_IDLE]	//SS1984 ADD
		src.currentrun = activelist.Copy()
		src.idlerun = idlelist.Copy()	//SS1984 ADD

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun
	var/list/idlerun = src.idlerun	//SS1984 ADD

	while(currentrun.len)
		var/mob/living/simple_animal/SA = currentrun[currentrun.len]
		--currentrun.len

		if (QDELETED(SA)) // Some issue causes nulls to get into this list some times. This keeps it running, but the bug is still there.
			GLOB.simple_animals[AI_ON] -= SA
			stack_trace("Found a null in simple_animals active list [SA.type]!")
			continue

		if(!SA.ckey && !HAS_TRAIT(SA, TRAIT_NO_TRANSFORM))
			if(SA.stat != DEAD)
				SA.handle_automated_movement()
			if(SA.stat != DEAD)
				SA.handle_automated_action()
			if(SA.stat != DEAD)
				SA.handle_automated_speech()
		if (MC_TICK_CHECK)
			return
	//SS1984 ADD START
	while(idlerun.len)
		var/mob/living/simple_animal/ISA = idlerun[idlerun.len]
		--idlerun.len

		if (QDELETED(ISA))
			GLOB.simple_animals[AI_IDLE] -= ISA
			stack_trace("Found a null in simple_animals idle list [ISA.type]!")
			continue

		if(!ISA.ckey && !HAS_TRAIT(ISA, TRAIT_NO_TRANSFORM))
			if(ISA.stat != DEAD)
				ISA.handle_automated_action()
			if(ISA.stat != DEAD)
				ISA.handle_automated_speech()
		if (MC_TICK_CHECK)
			return
	//SS1984 ADD END

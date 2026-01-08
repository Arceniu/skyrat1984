/mob/living/basic/blackmesa
	var/list/alert_sounds
	var/alert_cooldown = 3 SECONDS
	var/alert_cooldown_time

/mob/living/basic/blackmesa/proc/aggro()
	if(alert_sounds)
		if(!(world.time <= alert_cooldown_time))
			playsound(src, pick(alert_sounds), 70)
			alert_cooldown_time = world.time + alert_cooldown

/mob/living/basic/blackmesa/Initialize(mapload)
	. = ..()

	if(isnull(client))
		RegisterSignal(src, COMSIG_ATOM_WAS_ATTACKED, PROC_REF(aggro))

/mob/living/basic/blackmesa/xen
	faction = list(FACTION_XEN)
	habitable_atmos = null
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0
	unsuitable_cold_damage = 0
	maximum_survivable_temperature = 1500
	unsuitable_heat_damage = 1


/datum/ai_controller/basic_controller/blackmesa
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)
	planning_subtrees = list(
		/datum/ai_planning_subtree/escape_captivity,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)



//bull
/mob/living/basic/blackmesa/xen/bullsquid
	name = "bullsquid"
	desc = "Some highly aggressive alien creature. Thrives in toxic environments."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/mobs.dmi'
	icon_state = "bullsquid"
	icon_living = "bullsquid"
	icon_dead = "bullsquid_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	speak_emote = list("growls", "snarls", "grumbles")
	maxHealth = 110
	health = 110
	obj_damage = 50
	melee_damage_lower = 15
	melee_damage_upper = 18
	attack_sound = 'modular_ss220/modules/return_prs/black_mesa/sound/mobs/bullsquid/attack1.ogg'
	gold_core_spawnable = HOSTILE_SPAWN
	alert_sounds = list(
		'modular_ss220/modules/return_prs/black_mesa/sound/mobs/bullsquid/detect1.ogg',
		'modular_ss220/modules/return_prs/black_mesa/sound/mobs/bullsquid/detect2.ogg',
		'modular_ss220/modules/return_prs/black_mesa/sound/mobs/bullsquid/detect3.ogg'
	)
	ai_controller = /datum/ai_controller/basic_controller/blackmesa

	/*
	speak_chance = 1
	turns_per_move = 7
	harm_intent_damage = 15
	ranged = TRUE
	retreat_distance = 4
	minimum_distance = 4
	dodging = TRUE
	projectiletype = /obj/projectile/bullsquid
	projectilesound = 'modular_ss220/modules/return_prs/black_mesa/sound/mobs/bullsquid/goo_attack3.ogg'
	*/


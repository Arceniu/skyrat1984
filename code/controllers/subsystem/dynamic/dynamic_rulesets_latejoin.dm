//////////////////////////////////////////////
//                                          //
//            LATEJOIN RULESETS             //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/trim_candidates()
	..() // SS1984 ADDITION
	for(var/mob/P in candidates)
		if(!P.client || !P.mind || is_unassigned_job(P.mind.assigned_role)) // Are they connected?
			candidates.Remove(P)
		else if (P.client.get_remaining_days(minimum_required_age) > 0)
			candidates.Remove(P)
		else if(P.mind.assigned_role.title in restricted_roles) // Does their job allow for it?
			candidates.Remove(P)
		else if((exclusive_roles.len > 0) && !(P.mind.assigned_role.title in exclusive_roles)) // Is the rule exclusive to their job?
			candidates.Remove(P)
		else if (!((antag_preference || antag_flag) in P.client.prefs.be_special) || is_banned_from(P.ckey, list(antag_flag_override || antag_flag, ROLE_SYNDICATE)))
			candidates.Remove(P)
		// NOVA EDIT ADDITION - PROTECTED JOBS
		else if(P.client?.prefs && !P.client.prefs.read_preference(/datum/preference/toggle/be_antag))
			candidates.Remove(P)
			continue
		else if(is_banned_from(P.client?.ckey, BAN_ANTAGONIST))
			candidates.Remove(P)
			continue
		// NOVA EDIT END

/datum/dynamic_ruleset/latejoin/ready(forced = 0)
	if (forced)
		return ..()

	var/job_check = 0
	if (enemy_roles.len > 0)
		for (var/mob/M in GLOB.alive_player_list)
			if (M.stat == DEAD)
				continue // Dead players cannot count as opponents
			if (M.mind && (M.mind.assigned_role.title in enemy_roles) && (!(M in candidates) || (M.mind.assigned_role.title in restricted_roles)))
				job_check++ // Checking for "enemies" (such as sec officers). To be counters, they must either not be candidates to that rule, or have a job that restricts them from it

	var/threat = round(SSdynamic.threat_level/10)
	var/ruleset_forced = (GLOB.dynamic_forced_rulesets[type] || RULESET_NOT_FORCED) == RULESET_FORCE_ENABLED
	if (!ruleset_forced && job_check < required_enemies[threat])
		log_dynamic("FAIL: [src] is not ready, because there are not enough enemies: [required_enemies[threat]] needed, [job_check] found")
		return FALSE

	return ..()

/datum/dynamic_ruleset/latejoin/execute()
	var/mob/M = pick(candidates)
	assigned += M.mind
	M.mind.special_role = antag_flag
	M.mind.add_antag_datum(antag_datum)
	return TRUE

//////////////////////////////////////////////
//                                          //
//           SYNDICATE TRAITORS             //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/infiltrator
	name = "Syndicate Infiltrator"
	antag_datum = /datum/antagonist/traitor
	antag_flag = ROLE_SYNDICATE_INFILTRATOR
	antag_flag_override = ROLE_TRAITOR
	protected_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	restricted_roles = list(
		JOB_AI,
		JOB_CYBORG,
	)
	required_candidates = 1
	weight = 11
	cost = 5
	requirements = list(5,5,5,5,5,5,5,5,5,5)
	repeatable = TRUE

//////////////////////////////////////////////
//                                          //
//       REVOLUTIONARY PROVOCATEUR          //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/provocateur
	name = "Provocateur"
	persistent = TRUE
	antag_datum = /datum/antagonist/rev/head
	antag_flag = ROLE_PROVOCATEUR
	antag_flag_override = ROLE_REV_HEAD
	restricted_roles = list(
		JOB_AI,
		JOB_CAPTAIN,
		JOB_CHIEF_ENGINEER,
		JOB_CHIEF_MEDICAL_OFFICER,
		JOB_CYBORG,
		JOB_DETECTIVE,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_PRISONER,
		JOB_QUARTERMASTER,
		JOB_RESEARCH_DIRECTOR,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	enemy_roles = list(
		JOB_AI,
		JOB_CYBORG,
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	required_enemies = list(2,2,1,1,1,1,1,0,0,0)
	required_candidates = 1
	weight = 1
	delay = 1 MINUTES // Prevents rule start while head is offstation.
	cost = 10
	requirements = list(101,101,70,40,30,20,20,20,20,20)
	flags = HIGH_IMPACT_RULESET
	blocking_rules = list(/datum/dynamic_ruleset/roundstart/revs)
	var/required_heads_of_staff = 3
	var/finished = FALSE
	var/datum/team/revolution/revolution

/datum/dynamic_ruleset/latejoin/provocateur/ready(forced=FALSE)
	if (forced)
		required_heads_of_staff = 1
	if(!..())
		return FALSE
	var/head_check = 0
	for(var/mob/player in GLOB.alive_player_list)
		if (player.mind.assigned_role.job_flags & JOB_HEAD_OF_STAFF)
			head_check++
	return (head_check >= required_heads_of_staff)

/datum/dynamic_ruleset/latejoin/provocateur/execute()
	var/mob/M = pick(candidates) // This should contain a single player, but in case.
	if(check_eligible(M.mind)) // Didnt die/run off z-level/get implanted since leaving shuttle.
		assigned += M.mind
		M.mind.special_role = antag_flag
		revolution = new()
		var/datum/antagonist/rev/head/new_head = new()
		new_head.give_flash = TRUE
		new_head.give_hud = TRUE
		new_head.remove_clumsy = TRUE
		new_head = M.mind.add_antag_datum(new_head, revolution)
		revolution.update_objectives()
		revolution.update_rev_heads()
		SSshuttle.registerHostileEnvironment(revolution)
		return TRUE
	else
		log_dynamic("[ruletype] [name] discarded [M.name] from head revolutionary due to ineligibility.")
		log_dynamic("[ruletype] [name] failed to get any eligible headrevs. Refunding [cost] threat.")
		return FALSE

/datum/dynamic_ruleset/latejoin/provocateur/rule_process()
	var/winner = revolution.process_victory()
	if (isnull(winner))
		return

	finished = winner

	if(winner == REVOLUTION_VICTORY)
		GLOB.revolutionary_win = TRUE

	return RULESET_STOP_PROCESSING

/// Checks for revhead loss conditions and other antag datums.
/datum/dynamic_ruleset/latejoin/provocateur/proc/check_eligible(datum/mind/M)
	var/turf/T = get_turf(M.current)
	if(!considered_afk(M) && considered_alive(M) && is_station_level(T.z) && !M.antag_datums?.len && !HAS_MIND_TRAIT(M.current, TRAIT_UNCONVERTABLE))
		return TRUE
	return FALSE

/datum/dynamic_ruleset/latejoin/provocateur/round_result()
	revolution.round_result(finished)

//////////////////////////////////////////////
//                                          //
//           HERETIC SMUGGLER               //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/heretic_smuggler
	name = "Heretic Smuggler"
	antag_datum = /datum/antagonist/heretic
	antag_flag = ROLE_HERETIC_SMUGGLER
	antag_flag_override = ROLE_HERETIC
	protected_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_PRISONER,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	restricted_roles = list(
		JOB_AI,
		JOB_CYBORG,
	)
	required_candidates = 1
	weight = 4
	cost = 12
	requirements = list(101,101,50,10,10,10,10,10,10,10)
	repeatable = TRUE

/datum/dynamic_ruleset/latejoin/heretic_smuggler/execute()
	var/mob/picked_mob = pick(candidates)
	assigned += picked_mob.mind
	picked_mob.mind.special_role = antag_flag
	var/datum/antagonist/heretic/new_heretic = picked_mob.mind.add_antag_datum(antag_datum)

	// Heretics passively gain influence over time.
	// As a consequence, latejoin heretics start out at a massive
	// disadvantage if the round's been going on for a while.
	// Let's give them some influence points when they arrive.
	new_heretic.knowledge_points += round((world.time - SSticker.round_start_time) / new_heretic.passive_gain_timer)
	// BUT let's not give smugglers a million points on arrival.
	// Limit it to four missed passive gain cycles (4 points).
	new_heretic.knowledge_points = min(new_heretic.knowledge_points, 5)

	return TRUE

/// Ruleset for latejoin changelings
/datum/dynamic_ruleset/latejoin/stowaway_changeling
	name = "Stowaway Changeling"
	antag_datum = /datum/antagonist/changeling
	antag_flag = ROLE_STOWAWAY_CHANGELING
	antag_flag_override = ROLE_CHANGELING
	protected_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_PRISONER,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	restricted_roles = list(
		JOB_AI,
		JOB_CYBORG,
	)
	required_candidates = 1
	weight = 2
	cost = 12
	requirements = list(101,101,60,50,40,20,20,10,10,10)
	repeatable = TRUE

/datum/dynamic_ruleset/latejoin/stowaway_changeling/execute()
	var/mob/picked_mob = pick(candidates)
	assigned += picked_mob.mind
	picked_mob.mind.special_role = antag_flag
	picked_mob.mind.add_antag_datum(antag_datum)
	return TRUE

/**
 * Follow component
 *
 * A simple component that allows hostile mobs to follow another mob in their faction.
 * Default behaviour is alt click.
 *
 * @author Gandalf2k15
 */

/mob/living/simple_animal/hostile
	///does our mob following someone?
	var/following = FALSE

/datum/component/follow
	/// Sounds we play when the mob starts following.
	var/list/follow_sounds
	/// Sounds we play when the mob stops following via alt click.
	var/list/unfollow_sounds
	/// The speed at which we follow the user.
	var/follow_speed = 2
	/// The distance we keep from the user.
	var/follow_distance = 1
	/// Are we currently following? Used for playing sounds.
	var/following = FALSE
	/// Our parent mob.
	var/mob/living/simple_animal/hostile/parent_mob

/datum/component/follow/Initialize(_follow_sounds, _unfollow_sounds, _follow_distance = 1, _follow_speed = 2)
	if(!ishostile(parent))
		return COMPONENT_INCOMPATIBLE
	if(_follow_sounds)
		follow_sounds = _follow_sounds
	if(_unfollow_sounds)
		unfollow_sounds = _unfollow_sounds
	if(_follow_distance)
		follow_distance = _follow_distance
	if(_follow_speed)
		follow_speed = _follow_speed
	RegisterSignal(parent, COMSIG_HOSTILE_MOB_LOST_TARGET, PROC_REF(lost_target))
	RegisterSignal(parent, COMSIG_CLICK_ALT, PROC_REF(toggle_follow))
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	parent_mob = parent

/datum/component/follow/Destroy(force, silent)
	UnregisterSignal(parent, COMSIG_HOSTILE_MOB_LOST_TARGET)
	UnregisterSignal(parent, COMSIG_CLICK_ALT)
	parent_mob = null
	return ..()

/datum/component/follow/proc/lost_target()
	SIGNAL_HANDLER
	following = FALSE
	parent_mob.following = following

/datum/component/follow/proc/toggle_follow(datum/source, mob/living/living_user)
	SIGNAL_HANDLER
	if(!istype(living_user) || !living_user.can_perform_action(parent_mob) || parent_mob.client)
		return
	if(!parent_mob.faction_check_atom(living_user, FALSE))
		return //no more following enemy
	following = !following
	parent_mob.following = following
	if(following)
		if(follow_sounds)
			playsound(parent_mob, pick(follow_sounds), 100)
		INVOKE_ASYNC(parent_mob, TYPE_PROC_REF(/atom/movable, say), "Following you!")
		parent_mob.Goto(living_user, follow_speed, follow_distance)
	else
		if(unfollow_sounds)
			playsound(parent_mob, pick(unfollow_sounds), 100)
		INVOKE_ASYNC(parent_mob, TYPE_PROC_REF(/atom/movable, say), "No longer following!")
		parent_mob.LoseTarget()

/datum/component/follow/proc/on_examine(datum/source, mob/examiner, list/examine_text)
	examine_text += "Alt-click to make them follow you!"

//mob proc override
/mob/living/simple_animal/hostile/MoveToTarget(list/possible_targets)
	stop_automated_movement = 1
	if((!target || !CanAttack(target)) && !following)
		LoseTarget()
		return 0
	var/atom/target_from = GET_TARGETS_FROM(src)
	if(target in possible_targets)
		var/turf/T = get_turf(src)
		if(target.z != T.z)
			LoseTarget()
			return 0
		var/target_distance = get_dist(target_from,target)
		if(ranged)
			if(!target.Adjacent(target_from) && ranged_cooldown <= world.time)
				OpenFire(target)
		if(!Process_Spacemove(0))
			GLOB.move_manager.stop_looping(src)
			return 1
		if(retreat_distance != null)
			if(target_distance <= retreat_distance)
				GLOB.move_manager.move_away(src, target, retreat_distance, move_to_delay, flags = MOVEMENT_LOOP_IGNORE_GLIDE)
			else
				Goto(target,move_to_delay,minimum_distance)
		else
			Goto(target,move_to_delay,minimum_distance)
		if(target)
			if(isturf(target_from.loc) && target.Adjacent(target_from))
				MeleeAction()
			else
				if(rapid_melee > 1 && target_distance <= melee_queue_distance)
					MeleeAction(FALSE)
				in_melee = FALSE
			return 1
		return 0
	if(environment_smash)
		if(target.loc != null && get_dist(target_from, target.loc) <= vision_range)
			if(ranged_ignores_vision && ranged_cooldown <= world.time)
				OpenFire(target)
			if(environment_smash >= ENVIRONMENT_SMASH_WALLS)
				Goto(target,move_to_delay,minimum_distance)
				FindHidden()
				return 1
			else
				if(FindHidden())
					return 1
	LoseTarget()
	return 0

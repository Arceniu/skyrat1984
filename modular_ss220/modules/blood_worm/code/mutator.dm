/obj/item/blood_worm_mutator
	name = "ominous injector"
	desc = "A strange needle-like injector device with a strange substance inside it.  It's probably very painful to use it."
	icon = 'icons/obj/antags/blood_worm.dmi'
	icon_state = "tester"

	inhand_icon_state = "blood_worm_tester"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'

	special_desc_requirement = EXAMINE_CHECK_SYNDICATE
	special_desc = "An parasite mutator, compresses user's mind into blood worm form, do not use on public to prevent detection."

	w_class = WEIGHT_CLASS_SMALL
	var/spent = FALSE
	VAR_PROTECTED/in_use = FALSE

/obj/item/blood_worm_mutator/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	update_appearance(UPDATE_ICON_STATE | UPDATE_DESC)

/obj/item/blood_worm_mutator/update_icon_state()
	icon_state = spent ? "tester_spent" : "tester"
	inhand_icon_state = spent ? "blood_worm_tester_spent" : "blood_worm_tester"
	return ..()

/obj/item/blood_worm_mutator/update_desc(updates)
	desc = "[initial(desc)] [spent ? "This one is spent." : "It's loaded for a single use."]"
	return ..()

/obj/item/blood_worm_mutator/proc/try_wormification(mob/living/user)
	spent = TRUE
	in_use = FALSE
	update_appearance(UPDATE_ICON_STATE | UPDATE_DESC)
	log_combat(user, user, "wormified", src)
	var/mob/living/basic/blood_worm/hatchling/uplink/new_worm = new(get_turf(user.loc))
	user.mind.transfer_to(new_worm, force_key_move = TRUE)
	user.apply_damage(300, OXY)
	user.death(FALSE)
	user.reagents.add_reagent(/datum/reagent/toxin/formaldehyde, 5)
	return TRUE

/obj/item/blood_worm_mutator/attack_self(mob/living/user)
	if(spent)
		user.balloon_alert(user, "already spent!")
		return
	if(in_use)
		return
	if (!ishuman(user))
		user.balloon_alert(user, "not human!")
		return
	if(HAS_TRAIT(user, TRAIT_BLOOD_WORM_HOST))
		user.balloon_alert(user, "already mutated!")
		return
	if(IS_CHANGELING(user))
		user.balloon_alert(user, "DNA is not suitable!")
		return FALSE
	if (!user.try_inject(user, injection_flags = INJECT_TRY_SHOW_ERROR_MESSAGE))
		return
	in_use = TRUE
	user.painful_scream()
	user.visible_message(span_warning("[user] jabbed himself with [src]."), span_warning("You jabbed yourself with [src] and begin injection."))
	playsound(src, 'sound/items/hypospray.ogg', vol = 50, vary = TRUE)
	if(!do_after(user, 15 SECONDS, src))
		user.balloon_alert(user, "interrupted!")
		playsound(src, 'sound/machines/buzz/buzz-two.ogg', vol = 40, vary = TRUE)
		in_use = FALSE
		return
	user.apply_damage(rand(10, 15), BRUTE, def_zone = check_zone(user.zone_selected), wound_bonus = CANT_WOUND, attack_direction = get_dir(user, user), attacking_item = src)
	return try_wormification(user)

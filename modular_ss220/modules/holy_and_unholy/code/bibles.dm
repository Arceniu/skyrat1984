/obj/item/book/bible
	/// if bible cursed by fundamentally evil(1 curse point) or unholy/cultist(2 curse points) quirk user.
	var/cursed_lvl = 0

/obj/item/book/bible/proc/check_curse(mob/living/user)
	var/unholy_power = 0
	if(HAS_TRAIT(user, TRAIT_EVIL))
		unholy_power += 1
	if(HAS_TRAIT(user, TRAIT_UNHOLY) || IS_CULTIST(user))
		unholy_power += 2
	return unholy_power

/obj/item/book/bible/proc/unholy_bless(mob/living/blessed, mob/living/user)
	var/user_curse = check_curse(user)
	var/blessed_curse = check_curse(blessed)

	if(!ishuman(blessed))
		return BLESSING_FAILED

	if((blessed_curse < 1) || (user_curse < 1))
		return BLESSING_FAILED

	var/mob/living/carbon/human/unholy_blessed = blessed
	for(var/obj/item/bodypart/bodypart as anything in unholy_blessed.bodyparts)

	var/curse_heal_amt = 10
	var/list/curse_hurt_limbs = unholy_blessed.get_damaged_bodyparts(1, 1)
	if(!length(curse_hurt_limbs))
		return BLESSING_IGNORED

	for(var/obj/item/bodypart/affected in curse_hurt_limbs)
		if(affected.heal_damage(curse_heal_amt, curse_heal_amt))
			unholy_blessed.update_damage_overlays()

	unholy_blessed.visible_message(span_notice("[user] heals [unholy_blessed] with the unholy power!"))
	to_chat(unholy_blessed, span_boldnotice("May the unholy power compel you to be healed!"))
	playsound(unholy_blessed, SFX_PUNCH, 25, TRUE, -1)
	unholy_blessed.add_mood_event("blessing", /datum/mood_event/blessing)
	return BLESSING_SUCCESS

/obj/item/book/bible/examine(mob/user)
	. = ..()
	if(user.mind?.holy_role)
		if(cursed_lvl > 0)
			. += span_notice("[src] seems to be cursed with unholy power, use other bible to remove the curse.")

/obj/item/book/bible/attack_self(mob/living/carbon/human/user)
	if(can_set_bible_skin(user) && cursed_lvl >= 1)
		return FALSE
	if(!can_set_bible_skin(user))
		var/unholy_power = check_curse(user)
		if((unholy_power == 0) || (cursed_lvl >= unholy_power))
			return FALSE
		else if(do_after(user, 22 SECONDS, target = src))
			user.take_bodypart_damage(burn = 35)
			user.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15, 60)
			user.balloon_alert(user, "you feel like divine power is trying to disperse your darkness!")
			name = "unholy tome"
			force_string = "unholy"
			var/datum/component = GetComponent(/datum/component/anti_magic)
			if(component)
				qdel(component)
			if(unholy_power >= 3)
				icon_state = "burning"
			else
				icon_state = "tome"
			deity_name = null
			cursed_lvl = unholy_power
		return
	. = ..()

/obj/item/book/bible/attack(mob/living/target_mob, mob/living/carbon/human/user, list/modifiers, list/attack_modifiers, heal_mode = TRUE)
	if(!ISADVANCEDTOOLUSER(user))
		balloon_alert(user, "not dextrous enough!")
		return

	if(HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		to_chat(user, span_danger("[src] slips out of your hand and hits your head."))
		user.take_bodypart_damage(10)
		user.Unconscious(40 SECONDS)
		return

	var/user_curse = check_curse(user) //ss1984 add start
	if((cursed_lvl >= 1))
		if(target_mob.stat != DEAD)
			return
		if(user_curse == 0)
			if(cursed_lvl == 1)
				to_chat(user, span_danger("The book doesn't work in your hands."))
				return
			else
				to_chat(user, span_danger("The book sizzles in your hands."))
				user.take_bodypart_damage(burn = 10)
				return
		if(user == target_mob)
			balloon_alert(user, "can't heal yourself!")
			return
		if(!prob(60))
			var/result = unholy_bless(target_mob, user)
			if(result != BLESSING_FAILED)
				SEND_SIGNAL(target_mob, COMSIG_LIVING_BLESSED, user, src, result)
				return

		if(iscarbon(target_mob))
			var/mob/living/carbon/carbon_target = target_mob
			if(!istype(carbon_target.head, /obj/item/clothing/head/helmet))
				carbon_target.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5, 60)
				carbon_target.balloon_alert(carbon_target, "you feel dumber!")
		target_mob.visible_message(span_danger("[user] beats [target_mob] over the head with [src]!"), \
				span_userdanger("[user] beats [target_mob] over the head with [src]!"))
		playsound(target_mob, SFX_PUNCH, 25, TRUE, -1)
		log_combat(user, target_mob, "attacked", src)
		return //ss1984 add end

	if(!user.mind?.holy_role)
		to_chat(user, span_danger("The book sizzles in your hands."))
		user.take_bodypart_damage(burn = 10)
		return

	if(!heal_mode)
		return ..()

	if(target_mob.stat == DEAD)
		if(GLOB.religious_sect?.sect_dead_bless(target_mob, user) == BLESSING_FAILED)
			target_mob.visible_message(span_danger("[user] smacks [target_mob]'s lifeless corpse with [src]."))
			playsound(target_mob, SFX_PUNCH, 25, TRUE, -1)
		return

	if(user == target_mob)
		balloon_alert(user, "can't heal yourself!")
		return

	var/smack_chance = DEFAULT_SMACK_CHANCE
	if(GLOB.religious_sect)
		smack_chance = GLOB.religious_sect.smack_chance

	if(!prob(smack_chance))
		var/bless_result = bless(target_mob, user)
		if (bless_result != BLESSING_FAILED)
			SEND_SIGNAL(target_mob, COMSIG_LIVING_BLESSED, user, src, bless_result)
			return

	if(iscarbon(target_mob))
		var/mob/living/carbon/carbon_target = target_mob
		if(!istype(carbon_target.head, /obj/item/clothing/head/helmet))
			carbon_target.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5, 60)
			carbon_target.balloon_alert(carbon_target, "you feel dumber!")
	target_mob.visible_message(span_danger("[user] beats [target_mob] over the head with [src]!"), \
			span_userdanger("[user] beats [target_mob] over the head with [src]!"))
	playsound(target_mob, SFX_PUNCH, 25, TRUE, -1)
	log_combat(user, target_mob, "attacked", src)


/obj/item/book/bible/interact_with_atom(atom/bible_smacked, mob/living/user, list/modifiers)
	var/user_curse = check_curse(user) //ss1984 add start
	if((user_curse >= 2) && (cursed_lvl >= 2))
		if(bible_smacked.reagents?.has_reagent(/datum/reagent/water)) // curses all the water in the holder
			bible_smacked.balloon_alert(user, "cursed")
			var/water2hell = bible_smacked.reagents.get_reagent_amount(/datum/reagent/water)
			bible_smacked.reagents.del_reagent(/datum/reagent/water)
			bible_smacked.reagents.add_reagent(/datum/reagent/hellwater,water2hell/2)
			return ITEM_INTERACT_SUCCESS
		if(bible_smacked.reagents?.has_reagent(/datum/reagent/water/holywater))
			bible_smacked.balloon_alert(user, "polluted")
			var/holy2unholy = bible_smacked.reagents.get_reagent_amount(/datum/reagent/water/holywater)
			bible_smacked.reagents.del_reagent(/datum/reagent/water/holywater)
			if(cursed_lvl >=3)
				bible_smacked.reagents.add_reagent(/datum/reagent/fuel/unholywater,holy2unholy/2)
			else
				bible_smacked.reagents.add_reagent(/datum/reagent/fuel/unholywater,holy2unholy/3)
			return ITEM_INTERACT_SUCCESS
	if((cursed_lvl>=1) || (user_curse >= 2))
		return NONE //ss1984 add end
	if(!user.mind?.holy_role)
		return
	if(SEND_SIGNAL(bible_smacked, COMSIG_BIBLE_SMACKED, user) & COMSIG_END_BIBLE_CHAIN)
		return ITEM_INTERACT_SUCCESS
	if(isfloorturf(bible_smacked))
		var/area/current_area = get_area(bible_smacked)
		if(!GLOB.chaplain_altars.len && istype(current_area, /area/station/service/chapel))
			make_new_altar(bible_smacked, user)
			return ITEM_INTERACT_SUCCESS
		for(var/obj/effect/rune/nearby_runes in range(2, user))
			nearby_runes.SetInvisibility(INVISIBILITY_NONE, id=type, priority=INVISIBILITY_PRIORITY_BASIC_ANTI_INVISIBILITY)
		bible_smacked.balloon_alert(user, "floor smacked!")
		return ITEM_INTERACT_SUCCESS

	if(bible_smacked.reagents?.has_reagent(/datum/reagent/water)) // blesses all the water in the holder
		bible_smacked.balloon_alert(user, "blessed")
		var/water2holy = bible_smacked.reagents.get_reagent_amount(/datum/reagent/water)
		bible_smacked.reagents.del_reagent(/datum/reagent/water)
		bible_smacked.reagents.add_reagent(/datum/reagent/water/holywater,water2holy)
		return ITEM_INTERACT_SUCCESS
	if(bible_smacked.reagents?.has_reagent(/datum/reagent/fuel/unholywater)) // yeah yeah, copy pasted code - sue me
		bible_smacked.balloon_alert(user, "purified")
		var/unholy2holy = bible_smacked.reagents.get_reagent_amount(/datum/reagent/fuel/unholywater)
		bible_smacked.reagents.del_reagent(/datum/reagent/fuel/unholywater)
		bible_smacked.reagents.add_reagent(/datum/reagent/water/holywater,unholy2holy)
		return ITEM_INTERACT_SUCCESS
	if(istype(bible_smacked, /obj/item/book/bible) && !istype(bible_smacked, /obj/item/book/bible/syndicate))
		var/obj/item/book/bible/cursed_bible = bible_smacked //ss1984 add start
		if(cursed_bible.cursed_lvl > 0)
			cursed_bible.balloon_alert(user, "purifying...")
			playsound(src,'sound/effects/hallucinations/veryfar_noise.ogg',40,TRUE)
			if(do_after(user, 12 SECONDS, target = cursed_bible))
				if(cursed_bible.cursed_lvl > 1)
					to_chat(user, span_danger("Remnants of the dark force harm you, leaving the book."))
					user.take_bodypart_damage(burn = 10)
				cursed_bible.cursed_lvl = 0
				cursed_bible.name = name
				cursed_bible.icon_state = icon_state
				cursed_bible.inhand_icon_state = inhand_icon_state
				cursed_bible.deity_name = deity_name
				cursed_bible.AddComponent(/datum/component/anti_magic, MAGIC_RESISTANCE_HOLY)
				return ITEM_INTERACT_SUCCESS
			return ITEM_INTERACT_BLOCKING //ss1984 add end
		bible_smacked.balloon_alert(user, "converted")
		var/obj/item/book/bible/other_bible = bible_smacked
		other_bible.name = name
		other_bible.icon_state = icon_state
		other_bible.inhand_icon_state = inhand_icon_state
		other_bible.deity_name = deity_name
		return ITEM_INTERACT_SUCCESS

	if(istype(bible_smacked, /obj/item/melee/cultblade/haunted) && !IS_CULTIST(user))
		var/obj/item/melee/cultblade/haunted/sword_smacked = bible_smacked
		if(!sword_smacked.bound)
			sword_smacked.balloon_alert(user, "must be bound!")
			return ITEM_INTERACT_BLOCKING
		var/obj/item/melee/cultblade/haunted/sword = bible_smacked
		sword.balloon_alert(user, "exorcising...")
		playsound(src,'sound/effects/hallucinations/veryfar_noise.ogg',40,TRUE)
		if(do_after(user, 12 SECONDS, target = sword))
			playsound(src,'sound/effects/pray_chaplain.ogg',60,TRUE)
			new /obj/item/nullrod/nullblade(get_turf(sword))
			user.visible_message(span_notice("[user] exorcises [sword]!"))
			qdel(sword)
			return ITEM_INTERACT_SUCCESS
		return ITEM_INTERACT_BLOCKING
	return NONE



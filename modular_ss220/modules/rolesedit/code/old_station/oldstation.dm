//  old trims overrides and new one's
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldeng/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldsci/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldmed/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

//spawner override

/obj/effect/mob_spawn/ghost_role/human/oldeng
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)

/obj/effect/mob_spawn/ghost_role/human/oldsci
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)

/obj/effect/mob_spawn/ghost_role/human/oldsec
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)




//medic spawner

/obj/effect/mob_spawn/ghost_role/human/oldmed
	name = "old cryogenics pod"
	desc = "A humming cryo pod. You can barely recognise an medical uniform underneath the built up ice. The machine is attempting to wake up its occupant."
	prompt_name = "a medical doctor"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	mob_species = /datum/species/human
	you_are_text = "You are a medical doctor working for Nanotrasen, stationed onboard a state of the art research station."
	flavour_text = "You vaguely recall rushing into a cryogenics pod due to an oncoming radiation storm. The last thing \
	you remember is the station's Artificial Program telling you that you would only be asleep for eight hours. As you open \
	your eyes, everything seems rusted and broken, a dark feeling swells in your gut as you climb out of your pod."
	important_text = "Work as a team with your fellow survivors and do not abandon them."
	outfit = /datum/outfit/oldmed
	spawner_job_path = /datum/job/ancient_crew
	random_appearance = FALSE
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)



/obj/effect/mob_spawn/ghost_role/human/oldmed/Destroy()
	new/obj/structure/showcase/machinery/oldpod/used(drop_location())
	return ..()

// medic closet(for beta station)

/obj/structure/closet/secure_closet/old_med
	name = "medical closet"
	desc = "Filled with medical junk."
	icon_state = "med"
	req_access = list(ACCESS_AWAY_MEDICAL)

/obj/structure/closet/secure_closet/old_med/PopulateContents()
	..()
	new /obj/item/clothing/head/utility/surgerycap(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/reagent_containers/hypospray/medipen/atropine(src)
	new /obj/item/clothing/head/bio_hood/general(src)
	new /obj/item/clothing/suit/bio_suit/general(src)
	new /obj/item/clothing/suit/toggle/labcoat/medical(src)
	new /obj/item/storage/box/masks(src)

/obj/structure/showcase/machinery/oldpod/used
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper-open"

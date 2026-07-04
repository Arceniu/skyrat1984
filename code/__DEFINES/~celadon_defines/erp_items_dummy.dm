
/obj/item/organ/genital
	var/aroused
	var/visibility_preference

/obj/item/organ/genital/proc/update_sprite_suffix()
	return

/obj/item/organ/genital/proc/is_exposed()
	return

/obj/item/organ/genital/proc/get_description_string()
	return

/obj/item/organ/genital/penis
	var/sheath
	var/girth

/obj/item/organ/genital/penis/proc/set_size()
	return

/obj/item/organ/genital/testicles

/obj/item/organ/genital/testicles/proc/balls_description_to_size()
	return

/obj/item/organ/genital/testicles/proc/set_size()
	return

/obj/item/organ/genital/vagina

/obj/item/organ/genital/womb

/obj/item/organ/genital/anus

/obj/item/organ/genital/breasts
	var/lactates

/obj/item/organ/genital/breasts/proc/breasts_cup_to_size()
	return

/obj/item/organ/genital/breasts/proc/set_size()
	return

/mob/living/carbon/human/verb/toggle_genitals()
	return

/mob/living/carbon/human/verb/toggle_arousal()
	return

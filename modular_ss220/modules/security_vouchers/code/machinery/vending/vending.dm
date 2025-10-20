/obj/machinery/vending/security/loadingAttempt(obj/item/inserted_item, mob/user)
	if(istype(inserted_item, /obj/item/security_voucher))
		add_fingerprint(user)
		update_last_used(user)

		if (machine_stat & (BROKEN|NOPOWER))
			to_chat(user, span_notice("[src] does not respond."))
			return

		var/list/available_kits = list(
			"Hybrid Taser Kit" = list(
				/obj/item/gun/energy/e_gun/advtaser = 1,
				/obj/item/clothing/accessory/holster = 1,
				),
			"Sol Pistol with incapacitator ammo Kit" = list(
				/obj/item/gun/ballistic/automatic/pistol/sol/incapacitator_prefilled = 1,
				/obj/item/ammo_box/magazine/c35sol_pistol/incapacitator = 2,
				/obj/item/clothing/accessory/holster = 1,
				),
		)

		var/list/kit_to_box = list(
			"Hybrid Taser Kit" = /obj/item/storage/toolbox/guncase/nova/ntcase/pistol,
			"Sol Pistol with incapacitator ammo Kit" = /obj/item/storage/toolbox/guncase/nova/solfed/pistol,
		)

		var/weapon_kit = input(user, "Select a weaponary kit.") as null|anything in available_kits
		if(!weapon_kit)
			return
		if(!Adjacent(user) || QDELETED(inserted_item) || inserted_item.loc != user)
			return

		playsound(get_turf(src), 'sound/machines/machine_vend.ogg', 50, TRUE)
		qdel(inserted_item)
		sleep(0.5 SECONDS)

		var/box_type = kit_to_box[weapon_kit]
		var/obj/item/storage/box = new box_type(get_turf(src))
		var/list/kit_content = available_kits[weapon_kit]
		for(var/path in kit_content)
			var/amount = kit_content[path]
			if(!isnum(amount)) //Default to 1
				amount = 1
			for(var/i in 1 to amount)
				new path(box)
		if(Adjacent(user))
			user.put_in_hands(box, ignore_animation = FALSE)
		return TRUE // no base calling should be done
	return ..()

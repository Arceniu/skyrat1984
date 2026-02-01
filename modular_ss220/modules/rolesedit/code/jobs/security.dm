//headsets override
/obj/item/encryptionkey/headset_sec
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_PRISON = 1)

/obj/item/encryptionkey/headset_srvsec
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_PRISON = 1)

/obj/item/encryptionkey/heads/hos
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_PRISON = 1)

//outfits and closets override

//correction officer
/datum/outfit/job/corrections_officer
	id = /obj/item/card/id/advanced/station
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses

/datum/outfit/job/corrections_officer/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents += list(
		/obj/item/security_voucher = 1, // Security vouchers
	)

//security officer
/datum/outfit/job/security
	id = /obj/item/card/id/advanced/station

/datum/outfit/job/security/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents += list(
		/obj/item/security_voucher = 1, // Security vouchers
	)

//detective
/datum/outfit/job/detective
	id = /obj/item/card/id/advanced/plainclothes/station

/obj/structure/closet/secure_closet/detective/PopulateContents()
	..()
	new /obj/item/clothing/accessory/holster(src)

//warden
/datum/outfit/job/warden
	id = /obj/item/card/id/advanced/station

/datum/outfit/job/warden/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents += list(
		/obj/item/security_voucher = 1, // Security vouchers
	)

//head of security
/datum/outfit/job/hos
	id = /obj/item/card/id/advanced/silver/station

/datum/outfit/job/hos/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents += list(
		/obj/item/security_voucher = 1, // Security vouchers
	)

/obj/structure/closet/secure_closet/hos/PopulateContents()
	..()
	new /obj/item/detective_scanner(src) // QOL

/datum/storage/security_belt
	max_limited_store = 1 // can have 1 gun and 1 baton/other gun in belt (nova's value = 2)

//veteran
/datum/outfit/job/veteran_advisor
	id = /obj/item/card/id/advanced/station

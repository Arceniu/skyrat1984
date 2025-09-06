/obj/item/encryptionkey/headset_sec
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_PRISON = 1)

/obj/item/encryptionkey/headset_srvsec
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_PRISON = 1)

/obj/item/encryptionkey/heads/hos
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_PRISON = 1)

/datum/outfit/job/prisoner
	ears = /obj/item/radio/headset/prison

/datum/outfit/job/corrections_officer
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses

/datum/outfit/job/corrections_officer/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents += list(
		/obj/item/security_voucher = 1, // SS1984 ADDITION VOUCHERS
		)

/datum/outfit/job/hos/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents += list(
		/obj/item/security_voucher = 1, // SS1984 ADDITION VOUCHERS
		)

/datum/outfit/job/security/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents += list(
		/obj/item/security_voucher = 1, // SS1984 ADDITION VOUCHERS
		)

/datum/outfit/job/warden/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents += list(
		/obj/item/security_voucher = 1, // SS1984 ADDITION VOUCHERS
		)

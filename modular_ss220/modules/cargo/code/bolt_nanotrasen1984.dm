/datum/armament_entry/company_import/nanotrasen_and_bolt
	category = BOLT_NANOTRASEN_DEFENSE_NAME_1984
	company_bitflag = CARGO_COMPANY_BOLT_NANOTRASEN_1984

/datum/armament_entry/company_import/nanotrasen_and_bolt/armor
	subcategory = "Light Body Armor"
	cost = PAYCHECK_CREW * 6
	restricted = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/armor/slim_vest
	name = "type I vest - slim"
	item_type = /obj/item/clothing/suit/armor/vest

/datum/armament_entry/company_import/nanotrasen_and_bolt/armor/normal_vest
	name = "type I vest - normal"
	item_type = /obj/item/clothing/suit/armor/vest/alt

/datum/armament_entry/company_import/nanotrasen_and_bolt/nonlethal
	subcategory = "Non-Lethal Weapons"

/datum/armament_entry/company_import/nanotrasen_and_bolt/nonlethal/pepperball
	item_type = /obj/item/gun/ballistic/automatic/pistol/pepperball
	cost = PAYCHECK_CREW * 5

/datum/armament_entry/company_import/nanotrasen_and_bolt/lethal_sidearm
	subcategory = "Lethal Sidearms"

/datum/armament_entry/company_import/nanotrasen_and_bolt/lethal_sidearm/detective_revolver
	item_type = /obj/item/gun/ballistic/revolver/c38/detective
	cost = PAYCHECK_COMMAND * 10

/datum/armament_entry/company_import/nanotrasen_and_bolt/lethal_sidearm/detective_revolver
	item_type = /obj/item/gun/ballistic/automatic/pistol/firefly
	cost = PAYCHECK_COMMAND * 8

/datum/armament_entry/company_import/nanotrasen_and_bolt/lethal_sidearm/m1911
	item_type = /obj/item/gun/ballistic/automatic/pistol/m1911
	cost = PAYCHECK_COMMAND * 15
	contraband = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/longarm
	subcategory = "Longarms"
	restricted = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/longarm/riot_shotgun
	item_type = /obj/item/gun/ballistic/shotgun/riot
	cost = PAYCHECK_COMMAND * 8

/datum/armament_entry/company_import/nanotrasen_and_bolt/longarm/m23
	item_type = /obj/item/gun/ballistic/shotgun/m23
	cost = PAYCHECK_COMMAND * 16

/datum/armament_entry/company_import/nanotrasen_and_bolt/longarm/wt550
	item_type = /obj/item/gun/ballistic/automatic/wt550
	cost = PAYCHECK_COMMAND * 9

/datum/armament_entry/company_import/nanotrasen_and_bolt/longarm/br38
	item_type = /obj/item/gun/ballistic/automatic/battle_rifle
	cost = PAYCHECK_COMMAND * 100

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines
	subcategory = "Magazines"
	cost = PAYCHECK_CREW * 3
	restricted = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/pepper
	item_type = /obj/item/ammo_box/magazine/pepperball
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/em1911_l
	item_type = /obj/item/ammo_box/magazine/recharge/m1911
	cost = PAYCHECK_CREW * 4

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/em1911_d
	item_type = /obj/item/ammo_box/magazine/recharge/m1911/disabler
	cost = PAYCHECK_CREW * 4

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/m1911
	item_type = /obj/item/ammo_box/magazine/m45
	contraband = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/firefly
	item_type = /obj/item/ammo_box/magazine/multi_sprite/firefly
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/firefly_ihdf
	item_type = /obj/item/ammo_box/magazine/multi_sprite/firefly/ihdf

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/firefly_r
	item_type = /obj/item/ammo_box/magazine/multi_sprite/firefly/rubber

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/firefly_l
	item_type = /obj/item/ammo_box/magazine/multi_sprite/firefly/lethal

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/firefly_hp
	item_type = /obj/item/ammo_box/magazine/multi_sprite/firefly/hp

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/wt550r
	item_type = /obj/item/ammo_box/magazine/wt550m9/rub
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/wt550l
	item_type = /obj/item/ammo_box/magazine/wt550m9

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cb
	contraband = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cb/wt550p
	item_type = /obj/item/ammo_box/magazine/wt550m9/wtap
	cost = PAYCHECK_CREW * 4

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cb/wt550i
	item_type = /obj/item/ammo_box/magazine/wt550m9/wtic
	cost = PAYCHECK_CREW * 6
	high_contraband = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cmg_empty
	item_type = /obj/item/ammo_box/magazine/multi_sprite/cmg/empty
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cmg_ihdf
	item_type = /obj/item/ammo_box/magazine/multi_sprite/cmg/ihdf

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cmg_ihdf
	item_type = /obj/item/ammo_box/magazine/multi_sprite/cmg/rubber

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cmg_cb
	cost = PAYCHECK_CREW * 5
	contraband = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cmg_cb/hp
	item_type = /obj/item/ammo_box/magazine/multi_sprite/cmg/hp

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cmg_cb/ap
	item_type = /obj/item/ammo_box/magazine/multi_sprite/cmg/ap

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/cmg_cb/fire
	item_type = /obj/item/ammo_box/magazine/multi_sprite/cmg/fire
	high_contraband = TRUE

/datum/armament_entry/company_import/nanotrasen_and_bolt/magazines/br38
	item_type = /obj/item/ammo_box/magazine/m38/empty
	cost = PAYCHECK_CREW * 6

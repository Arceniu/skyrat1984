/datum/loadout_category/shoes
	tab_order = /datum/loadout_category/hands::tab_order + 1

/*
*	LOADOUT ITEM DATUMS FOR THE SHOE SLOT
*/
/datum/loadout_item/shoes
	abstract_type = /datum/loadout_item/shoes

/datum/loadout_item/shoes/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(initial(outfit_important_for_life.shoes))
		.. ()
		return TRUE

/datum/loadout_item/shoes/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.shoes)
			LAZYADD(outfit.backpack_contents, outfit.shoes)
		outfit.shoes = item_path
	else
		outfit.shoes = item_path

/*
*	JACKBOOTS
*/

/datum/loadout_item/shoes/jackboots
	name = "Jackboots"
	item_path = /obj/item/clothing/shoes/jackboots

/datum/loadout_item/shoes/jackboots_sec_blue
	name = "Blue Security Jackboots"
	item_path = /obj/item/clothing/shoes/jackboots/sec/blue
	restricted_roles = list(JOB_SECURITY_OFFICER, JOB_WARDEN, JOB_HEAD_OF_SECURITY)

// Thedragmeme's donator reward, they've decided to make them available to everybody.
/datum/loadout_item/shoes/jackboots/heel
	name = "High-Heel Jackboots"
	item_path = /obj/item/clothing/shoes/jackboots/heel

/datum/loadout_item/shoes/kneeboot
	name = "Knee Boots"
	item_path = /obj/item/clothing/shoes/jackboots/knee

/datum/loadout_item/shoes/recolorable_jackboots
	name = "Recolorable Jackboots"
	item_path = /obj/item/clothing/shoes/jackboots/recolorable

/datum/loadout_item/shoes/colonial_boots
	name = "Colonial Half-Boots"
	item_path = /obj/item/clothing/shoes/jackboots/colonial

/datum/loadout_item/shoes/jackboots/frontier
	name = "Heavy Frontier Boots"
	item_path = /obj/item/clothing/shoes/jackboots/frontier_colonist

/*
*	MISC BOOTS
*/

/datum/loadout_item/shoes/timbs
	name = "Hiking Boots"
	item_path = /obj/item/clothing/shoes/jackboots/timbs

/datum/loadout_item/shoes/jungle
	name = "Jungle Boots"
	item_path = /obj/item/clothing/shoes/jungleboots

/datum/loadout_item/shoes/winter_boots
	name = "Winter Boots"
	item_path = /obj/item/clothing/shoes/winterboots

/datum/loadout_item/shoes/work_boots
	name = "Work Boots"
	item_path = /obj/item/clothing/shoes/workboots

/datum/loadout_item/shoes/mining_boots
	name = "Mining Boots"
	item_path = /obj/item/clothing/shoes/workboots/mining

/datum/loadout_item/shoes/russian_boots
	name = "Russian Boots"
	item_path = /obj/item/clothing/shoes/russian

/datum/loadout_item/shoes/duck_boots
	name = "Northeastern Duck Boots"
	item_path = /obj/item/clothing/shoes/jackboots/duckboots

/*
*	COWBOY
*/

/datum/loadout_item/shoes/cowboy_recolorable
	name = "Cowboy Boots (Recolorable)"
	item_path = /obj/item/clothing/shoes/cowboy/laced/recolorable

/*
*	SNEAKERS
*/

/datum/loadout_item/shoes/greyscale_sneakers
	name = "Colorable Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers

/datum/loadout_item/shoes/black_sneakers
	name = "Black Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers/black
	can_be_greyscale = DONT_GREYSCALE

/datum/loadout_item/shoes/blue_sneakers
	name = "Blue Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers/blue
	can_be_greyscale = DONT_GREYSCALE

/datum/loadout_item/shoes/brown_sneakers
	name = "Brown Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers/brown
	can_be_greyscale = DONT_GREYSCALE

/datum/loadout_item/shoes/green_sneakers
	name = "Green Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers/green
	can_be_greyscale = DONT_GREYSCALE

/datum/loadout_item/shoes/purple_sneakers
	name = "Purple Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers/purple
	can_be_greyscale = DONT_GREYSCALE

/datum/loadout_item/shoes/orange_sneakers
	name = "Orange Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers/orange
	can_be_greyscale = DONT_GREYSCALE

/datum/loadout_item/shoes/yellow_sneakers
	name = "Yellow Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers/yellow
	can_be_greyscale = DONT_GREYSCALE

/datum/loadout_item/shoes/white_sneakers
	name = "White Sneakers"
	item_path = /obj/item/clothing/shoes/sneakers/white
	can_be_greyscale = DONT_GREYSCALE

/*
*	LEG WRAPS
*/

/datum/loadout_item/shoes/gildedcuffs
	name = "Gilded Leg Wraps"
	item_path = /obj/item/clothing/shoes/wraps

/datum/loadout_item/shoes/silvercuffs
	name = "Silver Leg Wraps"
	item_path = /obj/item/clothing/shoes/wraps/silver

/datum/loadout_item/shoes/redcuffs
	name = "Red Leg Wraps"
	item_path = /obj/item/clothing/shoes/wraps/red

/datum/loadout_item/shoes/bluecuffs
	name = "Blue Leg Wraps"
	item_path = /obj/item/clothing/shoes/wraps/blue

/datum/loadout_item/shoes/cuffs
	abstract_type = /datum/loadout_item/shoes/cuffs

/datum/loadout_item/shoes/cuffs/colourable
	name = "Colourable Leg Wraps"
	item_path = /obj/item/clothing/shoes/wraps/colourable

/datum/loadout_item/shoes/clothwrap
	name = "Colourable Cloth Wraps"
	item_path = /obj/item/clothing/shoes/wraps/cloth

/*
*	MISC
*/

/datum/loadout_item/shoes/laceup
	name = "Laceup Shoes"
	item_path = /obj/item/clothing/shoes/laceup

/datum/loadout_item/shoes/recolorable_laceups
	name = "Recolorable Laceups"
	item_path = /obj/item/clothing/shoes/colorable_laceups

/datum/loadout_item/shoes/recolorable_sandals
	name = "Recolorble Sandals"
	item_path = /obj/item/clothing/shoes/colorable_sandals

/datum/loadout_item/shoes/high_heels
	name = "High Heels"
	item_path = /obj/item/clothing/shoes/high_heels

/datum/loadout_item/shoes/black_heels
	name = "Fancy Heels"
	item_path = /obj/item/clothing/shoes/fancy_heels

/datum/loadout_item/shoes/disco
	name = "Green Lizardskin Shoes"
	item_path = /obj/item/clothing/shoes/discoshoes

/datum/loadout_item/shoes/kim
	name = "Aerostatic Shoes"
	item_path = /obj/item/clothing/shoes/kim

/datum/loadout_item/shoes/griffin
	name = "Griffon Boots"
	item_path = /obj/item/clothing/shoes/griffin

/datum/loadout_item/shoes/sandals
	name = "Sandals"
	item_path = /obj/item/clothing/shoes/sandal

/datum/loadout_item/shoes/sportshoes
	name = "Sport Shoes"
	item_path = /obj/item/clothing/shoes/sports

/datum/loadout_item/shoes/rollerskates
	name = "Roller Skates"
	item_path = /obj/item/clothing/shoes/wheelys/rollerskates

/datum/loadout_item/shoes/wheelys
	name = "Wheely-Heels"
	item_path = /obj/item/clothing/shoes/wheelys

/datum/loadout_item/shoes/jingleshoes
	name = "Jester Shoes"
	item_path = /obj/item/clothing/shoes/jester_shoes

/datum/loadout_item/shoes/sandals_black
	name = "Black Sandals"
	item_path = /obj/item/clothing/shoes/sandal/alt

/*
*	SEASONAL
*/

/datum/loadout_item/shoes/christmas
	name = "Red Christmas Boots"
	item_path = /obj/item/clothing/shoes/winterboots/christmas

/datum/loadout_item/shoes/christmas/green
	name = "Green Christmas Boots"
	item_path = /obj/item/clothing/shoes/winterboots/christmas/green


/*
*	JOB-RESTRICTED
*/

/datum/loadout_item/shoes/jester
	name = "Clown's Jester Shoes"
	item_path = /obj/item/clothing/shoes/clown_shoes/jester
	restricted_roles = list(JOB_CLOWN)

/datum/loadout_item/shoes/clown_shoes
	abstract_type = /datum/loadout_item/shoes/clown_shoes

/datum/loadout_item/shoes/clown_shoes/pink
	name = "Pink Clown Shoes"
	item_path = /obj/item/clothing/shoes/clown_shoes/pink
	restricted_roles = list(JOB_CLOWN)

/*
*	DONATOR
*/

/datum/loadout_item/shoes/donator
	abstract_type = /datum/loadout_item/shoes/donator
	donator_only = TRUE

/datum/loadout_item/shoes/donator/blackjackboots
	name = "Black Jackboots"
	item_path = /obj/item/clothing/shoes/jackboots/black

/datum/loadout_item/shoes/donator/rainbow
	name = "Rainbow Converse"
	item_path = /obj/item/clothing/shoes/sneakers/rainbow

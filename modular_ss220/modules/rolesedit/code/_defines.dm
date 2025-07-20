/datum/outfit
	var/role_job = /datum/job/ghost_role
	var/paycheck_name = "Nanotrasen: Salary"

/datum/outfit/proc/handlebank(mob/living/carbon/human/owner)
	var/datum/bank_account/offstation_bank_account = new(owner.real_name)
	owner.account_id = offstation_bank_account.account_id
	offstation_bank_account.replaceable = FALSE
	offstation_bank_account.account_job = new role_job
	offstation_bank_account.paycheck_desc = paycheck_name
	owner.add_mob_memory(/datum/memory/key/account, remembered_id = owner.account_id)
	if(owner.wear_id)
		var/obj/item/card/id/id_card = owner.wear_id
		id_card.registered_account = offstation_bank_account
	return

//debug radiokey for machines
/obj/item/encryptionkey/debug
	name = "unknown radio encryption key"
	channels = list(RADIO_CHANNEL_COMMON = 1,
		RADIO_CHANNEL_INTERDYNE = 1,
		RADIO_CHANNEL_CYBERSUN = 1,
		RADIO_CHANNEL_SYNDICATE = 1,
		RADIO_CHANNEL_UPLINK = 1,
		RADIO_CHANNEL_GUILD = 1,
		RADIO_CHANNEL_FACTION = 1,
		RADIO_CHANNEL_SOLFED = 1,
		RADIO_CHANNEL_TARKON = 1,
		RADIO_CHANNEL_CENTCOM = 1,
		RADIO_CHANNEL_COMMAND = 1,
		RADIO_CHANNEL_SECURITY = 1,
		RADIO_CHANNEL_ENGINEERING = 1,
		RADIO_CHANNEL_SCIENCE = 1,
		RADIO_CHANNEL_MEDICAL = 1,
		RADIO_CHANNEL_SUPPLY = 1,
		RADIO_CHANNEL_SERVICE = 1,
		RADIO_CHANNEL_AI_PRIVATE = 1,
		RADIO_CHANNEL_ENTERTAINMENT = 1,)
	special_channels = RADIO_SPECIAL_CENTCOM | RADIO_SPECIAL_SYNDIE | RADIO_SPECIAL_BINARY
	language_data = list(
		/datum/language/machine = 100,
		/datum/language/piratespeak = 100,
		/datum/language/beachbum = 100,
		/datum/language/codespeak = 100,
		/datum/language/monkey = 100,
		/datum/language/vox = 100,
		/datum/language/aphasia = 100,
		/datum/language/narsie = 100,
		/datum/language/uncommon = 100,
		/datum/language/common = 100,
		/datum/language/draconic = 100,
		/datum/language/slime = 100,
		/datum/language/moffic = 100,
		/datum/language/sylvan = 100,
		/datum/language/shadowtongue = 100,
		/datum/language/terrum = 100,
		/datum/language/nekomimetic = 100,
		/datum/language/skrell = 100,
		/datum/language/kobold = 100,
		/datum/language/ratvar = 100,
		/datum/language/xenocommon = 100,
		/datum/language/buzzwords = 100,
		/datum/language/akulan = 100,
		/datum/language/calcic = 100,
		/datum/language/canilunzt = 100,
		/datum/language/gutter = 100,
		/datum/language/mushroom = 100,
		/datum/language/panslavic = 100,
		/datum/language/schechi = 100,
		/datum/language/siiktajr = 100,
		/datum/language/spacer = 100,
		/datum/language/spinwarder = 100,
		/datum/language/voltaic = 100,
		/datum/language/xerxian = 100,
		/datum/language/yangyu = 100,
		/datum/language/primitive_catgirl = 100,
		/datum/language/carptongue = 100,
		/datum/language/drone = 100,
		/datum/language/ashtongue = 100,
		/datum/language/chitinclick = 100,
	)

/obj/item/radio/headset/headset_cent/alt/leader/debug
	name = "\improper Unknown bowman headset"
	desc = "A headset especially for ... personnel. Protects ears from flashbangs."
	keyslot = /obj/item/encryptionkey/debug
	subspace_transmission = FALSE
	subspace_switchable = TRUE
	freerange = TRUE

// custom bank machines

/obj/item/card/id/departmental_budget
	var/budget_name = " Civilian Budget"
	var/radio_channel = RADIO_CHANNEL_COMMON
	var/departament_access = ACCESS_CAPTAIN
	var/away = FALSE

/obj/item/card/id/departmental_budget/car
	budget_name = " Cargo Budget"
	departament_access = ACCESS_VAULT

/obj/item/card/id/departmental_budget/med
	budget_name = " Medical Budget"
	departament_access = ACCESS_CMO

/obj/item/card/id/departmental_budget/eng
	budget_name = " Engineering Budget"
	departament_access = ACCESS_CE

/obj/item/card/id/departmental_budget/sci
	budget_name = " Scientific Budget"
	departament_access = ACCESS_RD

/obj/item/card/id/departmental_budget/srv
	budget_name = " Service Budget"
	departament_access = ACCESS_HOP

/obj/item/card/id/departmental_budget/sec
	budget_name = " Defense Budget"
	departament_access = ACCESS_HOS

/obj/item/circuitboard/computer/custom_bankmachine
	name = "Bank Machine Console"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/computer/custom_bank_machine

/obj/machinery/computer/custom_bank_machine
	name = "advanced bank machine - not authorized"
	desc = "A machine used to deposit and withdraw station funds."
	circuit = /obj/item/circuitboard/computer/custom_bankmachine
	icon_screen = "vault"
	icon_keyboard = "security_key"
	req_access = list()
	var/siphoning = FALSE
	var/syphoning_credits = 0
	var/unauthorized = FALSE
	var/next_warning = 0
	var/minimum_time_between_warnings = 15 SECONDS

	var/obj/item/radio/radio
	var/radio_key = /obj/item/encryptionkey/debug // because ghost role account have not standart freq
	var/radio_channel = RADIO_CHANNEL_COMMON

	var/account_department = null
	var/budget_name = ""
	var/gps = FALSE
	var/away = FALSE

	var/datum/bank_account/synced_bank_account

/obj/machinery/computer/custom_bank_machine/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new radio_key
	radio.subspace_transmission = FALSE
	radio.canhear_range = 0
	radio.set_listening(FALSE)
	radio.recalculateChannels()
	if(account_department)
		synced_bank_account = SSeconomy.get_dep_account(account_department)
	else
		say("Please authorize console to budget bank card")

/obj/machinery/computer/custom_bank_machine/Destroy()
	QDEL_NULL(radio)
	synced_bank_account = null
	return ..()

/obj/machinery/computer/custom_bank_machine/attackby(obj/item/weapon, mob/user, list/modifiers, list/attack_modifiers)
	var/value = 0
	if(istype(weapon, /obj/item/stack/spacecash))
		var/obj/item/stack/spacecash/inserted_cash = weapon
		value = inserted_cash.value * inserted_cash.amount
	else if(istype(weapon, /obj/item/holochip))
		var/obj/item/holochip/inserted_holochip = weapon
		value = inserted_holochip.credits
	else if(istype(weapon, /obj/item/coin))
		var/obj/item/coin/inserted_coin = weapon
		value = inserted_coin.value
	else if(istype(weapon, /obj/item/card/id/departmental_budget))
		var/obj/item/card/id/departmental_budget/card = weapon
		if(siphoning)
			say("Credit withdrawal halted - account changed.")
			end_siphon()
		if(card.department_ID)
			account_department = card.department_ID
			synced_bank_account = SSeconomy.get_dep_account(account_department)
		else
			say("Critical error acquired! No budget id detected!")
			return ..()
		if(card.budget_name)
			budget_name = card.budget_name
			name = "advanced bank machine - " + card.budget_name
		else
			say("Not critical error acquired! No account name detected!")
		if(card.radio_channel)
			radio_channel = card.radio_channel
			radio.recalculateChannels()
		else
			say("Not critical error acquired! Radio channel not set!")
		if(card.departament_access)
			req_access = list(card.departament_access)
		else
			say("Error acquired! Bank account not protected!")
		away=card.away
		if(!card.away && !gps)
			AddComponent(/datum/component/gps, "Cash Signal")
			gps = TRUE
			say("Console bluespace protection enabled! GPS signal dispatched.")

	if(value)
		if(synced_bank_account)
			synced_bank_account.adjust_money(value)
			say("Credits deposited! The [synced_bank_account.account_holder] is now [synced_bank_account.account_balance] cr.")
		qdel(weapon)
		return
	return ..()

/obj/machinery/computer/custom_bank_machine/process(seconds_per_tick)
	. = ..()
	if(!siphoning || !synced_bank_account)
		return
	if (machine_stat & (BROKEN | NOPOWER))
		say("Insufficient power. Halting siphon.")
		end_siphon()
		return
	var/siphon_am = 100 * seconds_per_tick
	if(!synced_bank_account.has_money(siphon_am))
		say("[synced_bank_account.account_holder] depleted. Halting siphon.")
		end_siphon()
		return

	playsound(src, 'sound/items/poster/poster_being_created.ogg', 100, TRUE)
	syphoning_credits += siphon_am
	synced_bank_account.adjust_money(-siphon_am)
	if(next_warning < world.time && prob(15))
		var/area/A = get_area(loc)
		var/message = "[unauthorized ? "Unauthorized c" : "C"]redit withdrawal underway in [initial(A.name)][unauthorized ? "!!" : "..."]"
		radio.talk_into(src, message, radio_channel)
		next_warning = world.time + minimum_time_between_warnings

/obj/machinery/computer/custom_bank_machine/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "BankMachine", name)
		ui.open()

/obj/machinery/computer/custom_bank_machine/ui_data(mob/user)
	var/list/data = list()

	data["current_balance"] = synced_bank_account?.account_balance || 0
	data["siphoning"] = siphoning
	if(away)
		data["station_name"] = budget_name
	else
		data["station_name"] = station_name() + budget_name

	return data

/obj/machinery/computer/custom_bank_machine/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return

	switch(action)
		if("siphon")
			if(is_station_level(src.z) || is_centcom_level(src.z) || away)
				say("Siphon of station credits has begun!")
				start_siphon(ui.user)
			else
				say("Error: Console not in reach of station, withdrawal cannot begin.")
			. = TRUE
		if("halt")
			say("Station credit withdrawal halted.")
			end_siphon()
			. = TRUE

/obj/machinery/computer/custom_bank_machine/on_changed_z_level()
	. = ..()
	if(siphoning)
		say("Error: Console changed location. Connection severed, siphon halted .")
		end_siphon()

/obj/machinery/computer/custom_bank_machine/proc/end_siphon()
	siphoning = FALSE
	unauthorized = FALSE
	if(syphoning_credits > 0)
		new /obj/item/holochip(drop_location(), syphoning_credits)
	syphoning_credits = 0

/obj/machinery/computer/custom_bank_machine/proc/start_siphon(mob/living/carbon/user)
	var/obj/item/card/id/card = user.get_idcard(hand_first = TRUE)
	if(!istype(card) || !check_access(card))
		unauthorized = TRUE
	else
		unauthorized = FALSE
	siphoning = TRUE

#define TECHWEB_NODE_CUSTOM_BANK "custom_bank"

/datum/design/board/bankmachine_custom
	name = "Advanced Bank Machine Board"
	desc = "Allows for the construction of circuit boards used to build a Departamental Bank Machine."
	id = "custom_bank"
	build_path = /obj/item/circuitboard/computer/custom_bankmachine
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_COMMAND
	)

/datum/techweb_node/bankmachine_custom
	id = TECHWEB_NODE_CUSTOM_BANK
	display_name = "Advanced Bank Console"
	description = "Special console that able to connect to departamental bank accounts."
	prereq_ids = list(TECHWEB_NODE_CONSOLES, TECHWEB_NODE_BLUESPACE_TRAVEL)
	design_ids = list(
		"custom_bank",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_COMMAND)

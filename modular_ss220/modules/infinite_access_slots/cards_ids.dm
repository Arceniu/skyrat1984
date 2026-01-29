/obj/item/card/id/advanced/station/Initialize(mapload)	//crew
	..()
	if(CONFIG_GET(flag/infinite_access_slots))
		wildcard_slots = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/rainbow/station/Initialize(mapload)	//clown
	..()
	if(CONFIG_GET(flag/infinite_access_slots))
		wildcard_slots = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/plainclothes/station/Initialize(mapload)	//detective
	..()
	if(CONFIG_GET(flag/infinite_access_slots))
		wildcard_slots = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/silver/station/Initialize(mapload)	//heads
	..()
	if(CONFIG_GET(flag/infinite_access_slots))
		wildcard_slots = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/platinum/station/Initialize(mapload)	//hop
	..()
	if(CONFIG_GET(flag/infinite_access_slots))
		wildcard_slots = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/centcom/station/Initialize(mapload)	//decorative centcom like card, for bridge officer
	..()
	if(CONFIG_GET(flag/infinite_access_slots))
		wildcard_slots = WILDCARD_LIMIT_GOLD

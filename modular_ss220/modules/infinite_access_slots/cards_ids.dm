/obj/item/card/id
	var/wildcard_expanded = null //basically cards doesn't have expanded version due to upstreams and possible issues with new added cards

/obj/item/card/id/Initialize(mapload)
	..()
	if(CONFIG_GET(flag/infinite_access_slots) && wildcard_expanded)
		wildcard_slots = wildcard_expanded
		wildcard_expanded = null	//cleans after

/obj/item/card/id/advanced		//not ideal, because this is basic cars
	wildcard_expanded = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/prisoner
	wildcard_expanded = null

obj/item/card/id/advanced/centcom
	wildcard_expanded = null

/obj/item/card/id/advanced/centcom/station	//decorative centcom like card, for bridge officer
	wildcard_expanded = WILDCARD_LIMIT_GOLD

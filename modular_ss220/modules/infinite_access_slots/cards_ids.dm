/obj/item/card/id
	var/wildcard_expanded = null //basically cards doesn't have expanded version due to upstreams and possible issues with new added cards

/obj/item/card/id/Initialize(mapload)
	..()
	if(CONFIG_GET(flag/infinite_access_slots) && expanded_wildcard)
		wildcard_slots = expanded_wildcard
		wildcard_expanded = null	//cleans after

/obj/item/card/id/advanced/station	//crew
	wildcard_expanded = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/rainbow/station	//clown
	wildcard_expanded = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/plainclothes/station	//detective
	wildcard_expanded = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/silver/station	//heads
	wildcard_expanded = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/platinum/station	//hop
	wildcard_expanded = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/centcom/station	//decorative centcom like card, for bridge officer
	wildcard_expanded = WILDCARD_LIMIT_GOLD

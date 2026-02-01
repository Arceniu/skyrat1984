/obj/item/card/id
	var/expanded_wildcard = null // basically cards doesn't have expanded version due to upstreams and possible issues with new added cards

/obj/item/card/id/Initialize(mapload)
	..()
	if(CONFIG_GET(flag/infinite_access_slots) && expanded_wildcard)
		wildcard_slots = expanded_wildcard

/obj/item/card/id/advanced/station	//crew
	expanded_wildcard = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/rainbow/station	//clown
	expanded_wildcard = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/plainclothes/station	//detective
	expanded_wildcard = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/silver/station	//heads
	expanded_wildcard = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/platinum/station	//hop
	expanded_wildcard = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/centcom/station	//decorative centcom like card, for bridge officer
	expanded_wildcard = WILDCARD_LIMIT_GOLD

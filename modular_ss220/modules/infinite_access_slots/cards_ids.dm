/obj/item/card/id
	var/expanded_wildcard = NULL

/obj/item/card/id/Initialize(mapload)
	..()
	if(CONFIG_GET(flag/infinite_access_slots) && expanded_wildcard)
		wildcard_slots = expanded_wildcard

/obj/item/card/id/advanced/chameleon
	expanded_wildcard = WILDCARD_LIMIT_CHAMELEON_ID_EXPANDED

/obj/item/card/id/advanced/chameleon/elite
	expanded_wildcard = WILDCARD_LIMIT_CHAMELEON_ID_EXPANDED

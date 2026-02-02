/obj/item/card/id/Initialize(mapload)
	..()
	if (CONFIG_GET(flag/infinite_access_slots))
		wildcard_slots = WILDCARD_LIMIT_ADMIN

/* //remove when merge
/obj/item/card/id/advanced/chameleon
	wildcard_expanded = WILDCARD_LIMIT_CHAMELEON_ID_EXPANDED

/obj/item/card/id/advanced/chameleon/elite
	wildcard_expanded = WILDCARD_LIMIT_CHAMELEON_ID_EXPANDED
*/

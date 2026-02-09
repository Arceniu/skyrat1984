//chief medical officer
/datum/outfit/job/cmo
	id = /obj/item/card/id/advanced/silver/station


/obj/structure/closet/secure_closet/chief_medical/PopulateContents()
	..()

	new /obj/item/healthanalyzer/advanced(src) //returning adv health analyzer

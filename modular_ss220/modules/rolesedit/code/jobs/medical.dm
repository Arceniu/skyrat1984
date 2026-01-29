
//paramedic
/datum/outfit/job/paramedic
	id = /obj/item/card/id/advanced/station

//chief medical officer
/datum/outfit/job/cmo
	id = /obj/item/card/id/advanced/silver/station


/obj/structure/closet/secure_closet/chief_medical/PopulateContents()
	..()

	new /obj/item/healthanalyzer/advanced(src) //returnin adv health analyzer

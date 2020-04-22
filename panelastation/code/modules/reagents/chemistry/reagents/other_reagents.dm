/datum/reagent/unstablemutationtoxin	//For some reason the TG Menace seems to have deleted this one :(
	name = "Unstable Mutation Toxin"	//Also putting this in the hippie tree so that we don't get fucked by TG messing with the reagents again
	description = "A corruptive toxin... it seems to bubble and froth unpredictably. Are you sure you want to be around this for long?"
	color = "#a872e6" // rgb: 168, 114, 230
	metabolization_rate = INFINITY
	taste_description = "fizzy slime"

/datum/reagent/unstablemutationtoxin/on_mob_metabolize(mob/living/carbon/human/H)
	..()
	if(!istype(H))
		return
	H.reagents.add_reagent(pick("stablemutationtoxin","lizardmutationtoxin","flymutationtoxin", "mothmutationtoxin", "podmutationtoxin", "jellymutationtoxin", "golemmutationtoxin", "abductormutationtoxin", "androidmutationtoxin", "skeletonmutationtoxin", "zombiemutationtoxin", "ashmutationtoxin", "shadowmutationtoxin"), 1) //No plasmaman 4u xDDD
	return

/datum/reagent/water/on_mob_life(mob/living/M)
	M.reagents.remove_all_type(/datum/reagent/consumable/ethanol, 1*REM, 0, 1)
	M.adjustToxLoss(-0.2*REM, 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.drunkenness = max(H.drunkenness - 2, 0)
	..()
	. = 1

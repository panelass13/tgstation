/datum/chemical_reaction/slime/slimelizard //Hopefully this overrides the mutation toxin that comes out of the green slimes
	results = list(/datum/reagent/unstablemutationtoxin = 1)
	required_reagents = list(/datum/reagent/uranium/radium = 1)
	required_other = 1
	required_container = /obj/item/slime_extract/green

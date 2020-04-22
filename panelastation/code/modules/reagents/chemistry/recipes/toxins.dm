/datum/chemical_reaction/skewium
	results = list(/datum/reagent/toxin/skewium = 5)
	required_reagents = list(/datum/reagent/toxin/rotatium = 2, /datum/reagent/toxin/plasma = 2, /datum/reagent/toxin/acid = 1)
	mix_message = "<span class='danger'>Wow! it turns out if you mix rotatium with some plasma and sulphuric acid, it gets even worse!</span>"

/datum/chemical_reaction/isopropyl
	results = list(/datum/reagent/consumable/ethanol/isopropyl = 5)
	required_catalysts = list(/datum/reagent/aluminium = 1)
	required_reagents = list(/datum/reagent/water = 6, /datum/reagent/carbon = 3)

/datum/chemical_reaction/methphos
	results = list(/datum/reagent/toxin/methphos = 4)
	required_reagents = list(/datum/reagent/hydrogen = 3, /datum/reagent/carbon = 1, /datum/reagent/phosphorus = 1, /datum/reagent/oxygen = 1, /datum/reagent/fluorine = 2)
	required_temp = 26

/datum/chemical_reaction/sarin_a
	results = list(/datum/reagent/toxin/sarin_a = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/isopropyl = 3, /datum/reagent/toxin/methphos = 2)

/datum/chemical_reaction/sarin_b
	results = list(/datum/reagent/toxin/sarin_b = 2)
	required_temp = 700
	required_reagents = list(/datum/reagent/toxin/sarin_a = 2)

/datum/chemical_reaction/over_reactible/sarin
	results = list(/datum/reagent/toxin/sarin = 3)
	required_temp = 900
	required_reagents = list(/datum/reagent/toxin/sarin_b = 6, /datum/reagent/toxin/sarin_a = 6)

/datum/chemical_reaction/tabun_pa
	results = list(/datum/reagent/toxin/tabun_pa = 4, /datum/reagent/oxygen = 2)
	required_reagents = list(/datum/reagent/sodium = 1, /datum/reagent/water = 3, /datum/reagent/carbon = 2, /datum/reagent/nitrogen = 1)
	required_temp = 420

/datum/chemical_reaction/tabun_pb
	results = list(/datum/reagent/toxin/tabun_pb = 1)
	required_reagents = list(/datum/reagent/chlorine = 3, /datum/reagent/phosphorus = 1, /datum/reagent/oxygen = 1)

/datum/chemical_reaction/tabun_pc
	results = list(/datum/reagent/toxin/tabun_pc = 2)
	required_reagents = list(/datum/reagent/toxin/tabun_pb = 2, /datum/reagent/toxin/tabun_pa = 2)

/datum/chemical_reaction/tabun
	results = list(/datum/reagent/toxin/tabun = 1, /datum/reagent/toxin/plasma = 9)
	required_reagents = list(/datum/reagent/toxin/tabun_pc = 3)

/datum/chemical_reaction/stablemutationtoxin
	results = list(/datum/reagent/mutationtoxin = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/blood = 1)

/datum/chemical_reaction/lizardmutationtoxin
	results = list(/datum/reagent/mutationtoxin/lizard = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/uranium/radium = 1)

/datum/chemical_reaction/flymutationtoxin
	results = list(/datum/reagent/mutationtoxin/fly = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/toxin/mutagen = 1)

/datum/chemical_reaction/jellymutationtoxin
	results = list(/datum/reagent/mutationtoxin/jelly = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/toxin/slimejelly = 1)

/datum/chemical_reaction/podmutationtoxin
	results = list(/datum/reagent/mutationtoxin/pod = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/plantnutriment/eznutriment = 1)

/datum/chemical_reaction/golemmutationtoxin
	results = list(/datum/reagent/mutationtoxin/golem = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/silver = 1)

/datum/chemical_reaction/abductormutationtoxin
	results = list(/datum/reagent/mutationtoxin/abductor = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/medicine/morphine = 1)

/datum/chemical_reaction/androidmutationtoxin
	results = list(/datum/reagent/mutationtoxin/android = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/teslium = 1)

/datum/chemical_reaction/skeletonmutationtoxin
	results = list(/datum/reagent/mutationtoxin/skeleton = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/consumable/milk = 1)

/datum/chemical_reaction/zombiemutationtoxin
	results = list(/datum/reagent/mutationtoxin/zombie = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/toxin = 1)

/datum/chemical_reaction/ashmutationtoxin
	results = list(/datum/reagent/mutationtoxin/ash = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/mutationtoxin/lizard = 1, /datum/reagent/ash = 1)

/datum/chemical_reaction/shadowmutationtoxin
	results = list(/datum/reagent/mutationtoxin/shadow = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/liquid_dark_matter = 1, /datum/reagent/water/holywater = 1)

/datum/chemical_reaction/plasmamutationtoxin
	results = list(/datum/reagent/mutationtoxin/plasma = 1)
	required_reagents = list(/datum/reagent/unstablemutationtoxin = 1, /datum/reagent/uranium = 1, /datum/reagent/toxin/plasma = 1)

/datum/chemical_reaction/reagent_explosion/dizinc_explosion
	required_reagents = list(/datum/reagent/dizinc = 1, /datum/reagent/oxygen = 1)
	strengthdiv = 7

/datum/chemical_reaction/over_reactible/dizinc
	results = list(/datum/reagent/dizinc = 2)
	required_reagents = list(/datum/reagent/mercury = 1, /datum/reagent/consumable/ethanol = 2)
	required_temp = 290
	is_cold_recipe = TRUE

/datum/chemical_reaction/arclumin
	results = list(/datum/reagent/arclumin = 2)
	required_reagents = list(/datum/reagent/teslium = 2, /datum/reagent/toxin/rotatium = 2, /datum/reagent/liquid_dark_matter = 2, /datum/reagent/colorful_reagent = 2) //difficult
	required_catalysts = list(/datum/reagent/toxin/plasma = 1)
	required_temp = 400
	mix_message = "<span class='danger'>In a blinding flash of light, a glowing frothing solution forms and begins discharging!</span>"
	mix_sound = 'sound/effects/pray_chaplain.ogg'//truly a miracle

/datum/chemical_reaction/arclumin/on_reaction(datum/reagents/holder)//so bright it flashbangs
	var/location = get_turf(holder.my_atom)
	for(var/mob/living/carbon/C in get_hearers_in_view(3, location))
		if(C.flash_act())
			if(get_dist(C, location) < 2)
				C.Knockdown(50)
			else
				C.Stun(50)

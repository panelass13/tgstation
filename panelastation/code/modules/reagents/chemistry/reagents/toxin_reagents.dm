// hippie toxin chems
/datum/reagent/toxin/skewium
	name = "Skewium"
	description = "A strange, dull coloured liquid that appears to warp back and forth inside its container. Causes any consumer to experience a visual phenomena similar to said warping."
	silent_toxin = TRUE
	reagent_state = LIQUID
	color = "#ADBDCD"
	metabolization_rate = 0.8 * REAGENTS_METABOLISM
	toxpwr = 0.25
	taste_description = "skewing"

/datum/reagent/toxin/skewium/on_mob_life(mob/living/carbon/M)
	if(M.hud_used)
		if(current_cycle >= 5 && current_cycle % 3 == 0)
			var/list/screens = list(M.hud_used.plane_masters["[FLOOR_PLANE]"], M.hud_used.plane_masters["[GAME_PLANE]"], M.hud_used.plane_masters["[LIGHTING_PLANE]"])
			var/matrix/skew = matrix()
			var/intensity = 8
			skew.set_skew(rand(-intensity,intensity), rand(-intensity,intensity))
			var/matrix/newmatrix = skew

			if(prob(33)) // 1/3rd of the time, let's make it stack with the previous matrix! Mwhahahaha!
				var/obj/screen/plane_master/PM = M.hud_used.plane_masters["[GAME_PLANE]"]
				newmatrix = skew * PM.transform

			for(var/whole_screen in screens)
				animate(whole_screen, transform = newmatrix, time = 5, easing = QUAD_EASING, loop = -1)
				animate(transform = -newmatrix, time = 5, easing = QUAD_EASING)
	return ..()

/datum/reagent/toxin/skewium/on_mob_end_metabolize(mob/living/M)
	if(M && M.hud_used)
		var/list/screens = list(M.hud_used.plane_masters["[FLOOR_PLANE]"], M.hud_used.plane_masters["[GAME_PLANE]"], M.hud_used.plane_masters["[LIGHTING_PLANE]"])
		for(var/whole_screen in screens)
			animate(whole_screen, transform = matrix(), time = 5, easing = QUAD_EASING)
	..()


/datum/reagent/consumable/ethanol/isopropyl
	name = "Isopropyl alcohol"
	description = "Can make you sick and drunk at the same time. Amazing!"
	color = "#C8A5DC"

/datum/reagent/consumable/ethanol/isoproyl/on_mob_life(mob/living/M)
	M.adjustToxLoss(1)
	..()


/datum/reagent/toxin/tabun_pa
	name = "Dimethlymine"
	description = "A chemical that is used in the manufacturing of narcotics"
	color = "#CF3600" // rgb: 207, 54, 0

/datum/reagent/toxin/tabun_pb
	name = "Phosphoryll"
	description = "Hmm looks just like water"
	color = "#801E28"

/datum/reagent/toxin/tabun_pc
	name = "Noxious mixture"
	description = "A bubbling mixture"
	color = "#CF3600" // rgb: 207, 54, 0

/datum/reagent/toxin/tabun
	name = "Tabun"
	description = "First generation nerve agent invented by the Nazis, packs impressive toxicity"
	color = "#003333"
	metabolization_rate = 3 * REAGENTS_METABOLISM //goes really quickly but does huge amounts of damage

/datum/reagent/toxin/tabun/on_mob_life(mob/living/M as mob)
	M.adjustToxLoss(3*REM)//This stuff is crazily powerful
	M.losebreath += 2
	M.setOrganLoss(ORGAN_SLOT_BRAIN, 5)
	M.eye_blurry = max(M.eye_blurry, 2)
	..()

/datum/reagent/toxin/methphos
	name = "Methylphosphonyl difluoride"
	description = "Maybe you could make something really really toxic out of this?"
	color = "#C8A5DC"
	toxpwr = 0.5

/datum/reagent/toxin/sarin_a
	name = "Translucent mixture"
	description = "This mixture has a very light white hint to it but is filled with impurities"
	color = "#AAAACB"
	toxpwr = 1

/datum/reagent/toxin/sarin_a/on_mob_life(mob/living/M)
	M.eye_blurry = max(M.eye_blurry, 1)
	..()

/datum/reagent/toxin/sarin_b
	name = "diluted sarin"
	description = "A very impure form of sarin"
	color = "#CCCCCC"

/datum/reagent/toxin/sarin_b/on_mob_life(mob/living/M)
	M.eye_blurry = max(M.eye_blurry, 3)
	if(prob(15))
		if(iscarbon(M))
			var/mob/living/carbon/C = M
			C.vomit(20)

/datum/reagent/toxin/sarin //causes toxin damage, respiratory failure, blurs eyes and drowsiness, extremely lethal unless countered with atropine
	name = "Sarin"
	description = "A family friendly lethal nerve agent, handle with care!"
	color = "#FFFFFF"
	toxpwr = 0
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/toxin/sarin/on_mob_life(mob/living/M)
	M.Jitter(50)
	M.apply_effect(EFFECT_STUTTER, 5)
	if(current_cycle % 10 == 0)
		if(iscarbon(M))
			var/mob/living/carbon/C = M
			pick(C.vomit(20, stun = FALSE), C.vomit(20,1, stun = FALSE))

	switch(current_cycle)
		if(1 to 12)
			M.adjustToxLoss(2.5)
			M.adjustOxyLoss(2.5)
			M.eye_blurry = max(M.eye_blurry, 2)

		if(12 to 15)
			M.eye_blurry = max(M.eye_blurry, 10)
			M.adjustToxLoss(3.5)
			M.adjustOxyLoss(3.5)
			M.setOrganLoss(ORGAN_SLOT_BRAIN, 1)

		if(15 to 25)
			M.adjustStaminaLoss(20)
			M.setStaminaLoss(40)
			M.adjustToxLoss(4.5)
			M.adjustOxyLoss(3.5)
			M.setOrganLoss(ORGAN_SLOT_BRAIN, 5)
			M.losebreath++

		if(25 to INFINITY)
			M.Unconscious(30)
			M.adjustToxLoss(6)
			M.adjustOxyLoss(4)
			M.adjustBruteLoss(2)
			M.setOrganLoss(ORGAN_SLOT_BRAIN, 15)
			M.losebreath++
	..()

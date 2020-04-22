/datum/reagent/dizinc//more dangerous than clf3 when ingested with slower metabolism, less effective on touch and doesn't burn objects
	name = "Diethyl zinc"
	description = "Highly pyrophoric substance that incinerates carbon based life, although it's not so effective on objects"
	color = "#000067"
	metabolization_rate = 2 * REAGENTS_METABOLISM

/datum/reagent/dizinc/on_mob_life(mob/living/M)
	M.adjust_fire_stacks(4)
	M.IgniteMob()
	..()

/datum/reagent/dizinc/reaction_mob(mob/living/M, method=TOUCH)
	if(method != INGEST && method != INJECT)
		M.adjust_fire_stacks(pick(1, 3))
		M.IgniteMob()
		..()

/datum/reagent/arclumin//memechem made in honour of the late arclumin
	name = "Arc-Luminol"
	description = "You have no idea what the fuck this is but it looks absurdly unstable. It is emitting a sickly glow suggesting ingestion is probably not a great idea."
	color = "#ffff66" //RGB: 255, 255, 102
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/arclumin/on_mob_life(mob/living/carbon/M)//windup starts off with constant shocking, confusion, dizziness and oscillating luminosity
	M.electrocute_act(1, 1, 1) //Override because it's caused from INSIDE of you
	M.set_light(rand(1,3))
	M.confused += 2
	M.dizziness += 4
	if(current_cycle >= 20) //the fun begins as you become a demigod of chaos
		var/turf/open/T = get_turf(holder.my_atom)
		switch(rand(1,6))

			if(1)
				playsound(T, 'sound/magic/lightningbolt.ogg', 50, 1)
				tesla_zap(T, 6, 1000)//weak tesla zap
				M.Stun(2)

			if(2)
				playsound(T, 'sound/effects/EMPulse.ogg', 30, 1)
				do_teleport(M, T, 5)

			if(3)
				M.randmuti()
				if(prob(75))
					M.easy_randmut(NEGATIVE+MINOR_NEGATIVE)
				if(prob(1))
					M.easy_randmut(POSITIVE)
				M.updateappearance()
				M.domutcheck()

			if(4)
				empulse(T, 3, 5, 1)

			if(5)
				playsound(T, 'sound/effects/supermatter.ogg', 20, 1)
				radiation_pulse(T, 4, 8, 25, 0)

			if(6)
				T.atmos_spawn_air("water_vapor= 40 ;TEMP= 298")//janitor friendly
	..()

/datum/reagent/arclumin/on_mob_end_metabolize(mob/living/M)// so you don't remain at luminosity 3 forever
	M.set_light(0)

/datum/reagent/arclumin/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)//weak on touch, short teleport and low damage shock, will however give a permanent weak glow
	if(method == TOUCH)
		M.electrocute_act(5, 1, 1)
		M.set_light(1)
		var/turf/T = get_turf(M)
		do_teleport(M, T, 2)

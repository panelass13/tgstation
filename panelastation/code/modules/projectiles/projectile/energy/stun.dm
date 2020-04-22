/obj/projectile/energy/electrode
	stun = 0
	paralyze = 0
	stamina = 60

/obj/projectile/energy/electrode/on_hit(atom/target, blocked = 0)
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		if(prob(50))
			C.dropItemToGround(C.get_active_held_item())
		..()

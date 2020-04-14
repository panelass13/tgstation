/obj/structure/closet/secure_closet
	name = "secure locker"
	desc = "It's a card-locked storage unit."
	locked = TRUE
	icon_state = "secure"
	max_integrity = 250
	armor = list("melee" = 30, "bullet" = 50, "laser" = 50, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 80)
	secure = TRUE
	damage_deflection = 20
	var/hacktime = 80 //60 IS DEFAULT
	var/hacksound = list('sound/effects/sparks1.ogg',
	'sound/effects/sparks2.ogg',
	'sound/effects/sparks3.ogg',
	'sound/effects/sparks4.ogg')

/obj/structure/closet/secure_closet/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/multitool))
		playsound(loc, 'sound/items/change_drill.ogg', 15, TRUE, -3)
		to_chat(user, "<span class='notice'>You start hacking the [src]...</span>")
		add_fingerprint(user)
		if(do_after(user, hacktime, target = src))
			playsound(loc, hacksound, 15, TRUE, -3)
			if(locked == TRUE)
				locked = FALSE
				to_chat(user, "<span class='notice'>You unlocked the [src] with your [W].</span>")
				src.update_icon()
			else
				locked = TRUE
				to_chat(user, "<span class='notice'>You locked the [src] with your [W].</span>")
				src.update_icon()
	else
		return ..()
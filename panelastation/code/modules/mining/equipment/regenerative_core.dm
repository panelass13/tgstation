/obj/item/organ/regenerative_core/applyto(atom/target, mob/user)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(inert)
			to_chat(user, "<span class='notice'>[src] has decayed and can no longer be used to heal.</span>")
			return
		else
			if(H.stat == DEAD)
				to_chat(user, "<span class='notice'>[src] is useless on the dead.</span>")
				return
			if(H != user)
				H.visible_message("<span class='notice'>[user] forces [H] to apply [src]... Black tendrils entangle and reinforce [H.p_them()]!</span>")
				SSblackbox.record_feedback("nested tally", "hivelord_core", 1, list("[type]", "used", "other"))
			else
				to_chat(user, "<span class='notice'>You start to smear [src] on yourself. Disgusting tendrils hold you together and allow you to keep moving, but for how long?</span>")
				SSblackbox.record_feedback("nested tally", "hivelord_core", 1, list("[type]", "used", "self"))
			H.revive(full_heal = 1)
			SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "core", /datum/mood_event/healsbadman)
			qdel(src)

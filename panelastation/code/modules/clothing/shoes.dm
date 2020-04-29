//Digitigrade shoes! any shoe can have digitigrade_allowed changed at any moment, sprites borrowed from citadel

/obj/item/clothing/shoes/digitigrade
	name = "reffited shoes"
	icon = 'icons/obj/clothing/shoes.dmi'
	desc = "Comfortable-looking shoes\nRefitted to fit digitigrade legs."
	digitigrade_allowed = 1
	mob_overlay_icon = null
	icon_state = null

/obj/item/clothing/shoes/digitigrade/process()
	if(ismob(loc))
		var/mob/living/carbon/human/M = loc
		if(M.get_item_by_slot(ITEM_SLOT_ICLOTHING))
			mob_overlay_icon = 'icons/mob/clothing/feet.dmi'
			M.update_inv_shoes()
		else
			mob_overlay_icon = 'panelastation/icons/mob/clothing/feet_digi.dmi'
			M.update_inv_shoes()

/obj/item/clothing/shoes/digitigrade/Initialize()
    . = ..()
    START_PROCESSING(SSobj, src)

/obj/item/clothing/shoes/digitigrade/Destroy()
    . = ..()
    STOP_PROCESSING(SSobj, src)

/obj/item/clothing/shoes/digitigrade/jackboots
	name = "reffited jackboots"
	desc = "Nanotrasen-issue Security combat boots for combat scenarios or combat situations. All combat, all the time\nRefitted to fit digitigrade legs."
	icon_state = "jackboots"
	item_state = "jackboots"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	strip_delay = 30
	equip_delay_other = 50
	resistance_flags = NONE
	permeability_coefficient = 0.05 //Thick soles, and covers the ankle
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	can_be_tied = FALSE

/obj/item/clothing/shoes/sandal
	digitigrade_allowed = 1

/obj/item/clothing/shoes/digitigrade/galoshes
	desc = "A pair of yellow rubber boots, designed to prevent slipping on wet surfaces\nRefitted to fit digitigrade legs."
	name = "reffited galoshes"
	icon_state = "galoshes"
	permeability_coefficient = 0.01
	clothing_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN+1
	strip_delay = 30
	equip_delay_other = 50
	resistance_flags = NONE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 40, "acid" = 75)
	can_be_bloody = FALSE
	custom_price = 600
	can_be_tied = FALSE

/obj/item/clothing/shoes/digitigrade/winterboots
	name = "reffited winter boots"
	desc = "Boots lined with 'synthetic' animal fur\nRefitted to fit digitigrade legs."
	icon_state = "winterboots"
	item_state = "winterboots"
	permeability_coefficient = 0.15
	cold_protection = FEET|LEGS
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET|LEGS
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	lace_time = 8 SECONDS

/obj/item/clothing/shoes/digitigrade/workboots
	name = "reffited work boots"
	desc = "Nanotrasen-issue Engineering lace-up work boots for the especially blue-collar\nRefitted to fit digitigrade legs."
	icon_state = "workboots"
	item_state = "jackboots"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	permeability_coefficient = 0.15
	strip_delay = 20
	equip_delay_other = 40
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	lace_time = 8 SECONDS

/obj/item/clothing/shoes/digitigrade/workboots/mining
	name = "reffited mining boots"
	desc = "Steel-toed mining boots for mining in hazardous environments. Very good at keeping toes uncrushed\nRefitted to fit digitigrade legs."
	icon_state = "explorer"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/shoes/digitigrade/sneakers
	desc = "Refitted to fit digitigrade legs."

/obj/item/clothing/shoes/digitigrade/sneakers/orange
	name = "reffited orange shoes"
	icon_state = "orange"

/obj/item/clothing/shoes/digitigrade/sneakers/orange/attack_self(mob/user)
	if (src.chained)
		src.chained = null
		src.slowdown = SHOES_SLOWDOWN
		new /obj/item/restraints/handcuffs( user.loc )
		src.icon_state = "orange"
	return

/obj/item/clothing/shoes/digitigrade/sneakers/orange/attackby(obj/H, loc, params)
	..()
	// Note: not using istype here because we want to ignore all subtypes
	if (H.type == /obj/item/restraints/handcuffs && !chained)
		qdel(H)
		src.chained = 1
		src.slowdown = 15
		src.icon_state = "orange1"
	return

/obj/item/clothing/shoes/digitigrade/sneakers/orange/allow_attack_hand_drop(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/C = user
		if(C.shoes == src && chained == 1)
			to_chat(user, "<span class='warning'>You need help taking these off!</span>")
			return FALSE
	return ..()

/obj/item/clothing/shoes/digitigrade/sneakers/orange/MouseDrop(atom/over)
	var/mob/m = usr
	if(ishuman(m))
		var/mob/living/carbon/human/c = m
		if(c.shoes == src && chained == 1)
			to_chat(c, "<span class='warning'>You need help taking these off!</span>")
			return
	return ..()

/obj/item/clothing/shoes/digitigrade/sneakers/white
	name = "reffited white shoes"
	icon_state = "white"
	permeability_coefficient = 0.01

/obj/item/clothing/shoes/digitigrade/sneakers/black
	name = "black shoes"
	icon_state = "black"
	desc = "A pair of black shoes."
	custom_price = 50

/obj/item/clothing/shoes/digitigrade/laceup
	name = "laceup shoes"
	desc = "The height of fashion, and they're pre-polished!"
	icon_state = "laceups"
	equip_delay_other = 50

/obj/item/clothing/shoes/digitigrade/sneakers/brown
	name = "brown shoes"
	desc = "A pair of brown shoes."
	icon_state = "brown"

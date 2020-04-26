/datum/outfit/santa //ho ho ho!
	name = "Santa Claus"
	uniform = /obj/item/clothing/under/color/red
	shoes = /obj/item/clothing/shoes/sneakers/red
	suit = /obj/item/clothing/suit/space/santa
	head = /obj/item/clothing/head/santa
	back = /obj/item/storage/backpack/santabag
	r_pocket = /obj/item/flashlight
	gloves = /obj/item/clothing/gloves/color/red

	box = /obj/item/storage/box/survival/engineer
	backpack_contents = list(/obj/item/a_gift/anything = 5)

/datum/outfit/santa/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return
	H.fully_replace_character_name(H.real_name, "Santa Claus")
	H.mind.assigned_role = "Santa"
	H.mind.special_role = "Santa"
	H.hairstyle = "Long Hair 3"
	H.facial_hairstyle = "Beard (Full)"
	H.hair_color = "FFF"
	H.facial_hair_color = "FFF"
	H.update_hair()

/datum/outfit/soulbreaker/slaver
	name = "Soulbreaker Slaver"
	uniform = /obj/item/clothing/under/color/lightpurple
	suit = /obj/item/clothing/suit/armor/soulbreaker
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/syndicate
	belt = /obj/item/gun/energy/e_gun
	back = /obj/item/storage/backpack/satchel
	r_pocket = /obj/item/pda/heads
	l_hand = /obj/item/gun/energy/e_gun/stun
	r_hand = /obj/item/clothing/head/helmet/slaver
	belt = /obj/item/melee/baton/loaded
	l_pocket = /obj/item/restraints/handcuffs/energy
	id = /obj/item/card/id
	implants = list(/obj/item/implant/explosive,/obj/item/implant/freedom)

/datum/outfit/soulbreaker/slaver/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/pda/heads/pda = H.r_store
	pda.owner = H.real_name
	pda.ownjob = "Slaver"
	pda.update_label()

	var/obj/item/card/id/W = H.wear_id
	W.access = get_centcom_access("Slaver")
	W.access += ACCESS_WEAPONS
	W.assignment = "Slaver"
	W.registered_name = H.real_name
	W.update_label()
	..()

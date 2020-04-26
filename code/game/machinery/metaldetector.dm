/obj/machinery/metal_detector
	name = "metal detector"
	desc = "An advanced metal detector used to detect weapons."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "metal_detector"
	anchored = TRUE
	req_one_access = list(ACCESS_SECURITY, ACCESS_HEADS)
	idle_power_usage = 100
	//plane = MOB_PLANE
	layer = ABOVE_MOB_LAYER

	var/declare_radio = TRUE
	var/list/radio_departments = list("Command", "Security")

	var/next_announcement_time

	var/alarm_delay = 2000

/obj/machinery/metal_detector/attackby(obj/item/W, mob/usr)

	if(default_deconstruction_screwdriver(usr, W))
		return

	if(default_deconstruction_crowbar(usr, W))
		return

	..()

/obj/machinery/metal_detector/Crossed(var/mob/living/M)
	..()

	if(!istype(M))
		return
	if(allowed(M))
		return

	var/list/items_to_check = M.GetAllContents()
	for(var/obj/item/gun/O in items_to_check)
		if(O.triggersdetector)
			trigger_alarm(M)
			break

/obj/machinery/metal_detector/proc/trigger_alarm(mob/M)
	use_power(100)
	flick("metal_detector_anim", src)
	visible_message("<span class='danger'>\The [src] sends off an alarm!</span>")
	playsound(src, 'sound/machines/alarm4.ogg', 60, 1)

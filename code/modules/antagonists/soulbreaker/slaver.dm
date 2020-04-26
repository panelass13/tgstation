/datum/antagonist/slaver
	name = "Slaver"
	show_name_in_check_antagonists = TRUE
	show_in_antagpanel = TRUE
	var/datum/objective/mission
	var/datum/team/slaver/slaver_squad
	can_hijack = HIJACK_HIJACKER
	var/list/name_source
	var/landmark_type = /obj/effect/landmark/slaver
	antag_moodlet = /datum/mood_event/focused
	var/datum/outfit/outfit = /datum/outfit/soulbreaker/slaver

/obj/effect/landmark/slaver
	icon_state = "slaver"

/datum/antagonist/slaver/New()
	. = ..()
	name_source = GLOB.soulbreaker_names

/datum/antagonist/slaver/proc/update_name()
	owner.current.fully_replace_character_name(owner.current.real_name,"[pick(name_source)]")

/datum/antagonist/slaver/greet()
	to_chat(owner, "<B><font size=3 color=red>You are a Slaver Soldier from a Ship.</font></B>")
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/slaver.ogg', 100, FALSE, pressure_affected = FALSE)
	to_chat(owner, "The Command is sending you to [station_name()] with the task to get as many slaves as possible, as requested by the Traders.")

/datum/antagonist/slaver/proc/equip_sb()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	H.equipOutfit(outfit)
	var/datum/martial_art/cqc/style = new
	style.teach(H)

	if(CONFIG_GET(flag/enforce_human_authority))
		H.set_species(/datum/species/human)

/*
/datum/antagonist/soulbreaker/create_team(datum/team/new_team)
	if(istype(new_team))
		soulbreaker_squad = new_team
*/

/datum/antagonist/slaver/proc/forge_objectives()
	if (!mission)
		var/datum/objective/missionobj = new
		missionobj.owner = owner
		missionobj.explanation_text = "Raid [station_name()] and kidnap as many slaves as possible."
		missionobj.completed = 1
		mission = missionobj
		objectives |= mission

/datum/antagonist/slaver/proc/finalize_breaker()
	var/mob/living/carbon/human/H = owner.current
	H.forceMove(/obj/effect/landmark/slaver)

/datum/antagonist/slaver/proc/finalize_breaker2()
	var/mob/living/carbon/human/H = owner.current
	H.forceMove(12,30,1)

/datum/antagonist/slaver/on_gain()
	update_name()
	forge_objectives()
	. = ..()
	finalize_breaker()
	equip_sb()
	finalize_breaker2()

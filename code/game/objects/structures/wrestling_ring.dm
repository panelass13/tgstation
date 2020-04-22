/obj/decal/boxingrope
	name = "Boxing Ropes"
	desc = "Do not exit the ring."
	density = 1
	anchored = 1
	icon = 'icons/obj/boxing.dmi'
	icon_state = "ringrope"
	layer = OBJ_LAYER

/obj/decal/boxingrope/CanPass(atom/movable/mover, turf/target, height=0, air_group=0) // stolen from window.dm
	. = ..()
	if (mover && mover.throwing)
		return 1
	if (dir == SOUTHWEST || dir == SOUTHEAST || dir == NORTHWEST || dir == NORTHEAST || dir == SOUTH || dir == NORTH)
		return 0
	if(get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/decal/boxingrope/CheckExit(atom/movable/O as mob|obj, target as turf)
	if (!density)
		return 1
	if (get_dir(O.loc, target) == src.dir)
		return 0
	return 1

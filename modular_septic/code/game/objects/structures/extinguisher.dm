/obj/structure/extinguisher_cabinet
	icon = 'modular_septic/icons/obj/structures/wallmounts.dmi'
	icon_state = "cabinet"
	base_icon_state = "cabinet"

/obj/structure/extinguisher_cabinet/Initialize(mapload, ndir, building)
	. = ..()
	update_appearance()

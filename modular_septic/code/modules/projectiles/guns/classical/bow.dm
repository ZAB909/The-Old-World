//This is a buggy work in progress
/obj/item/gun/ballistic/bow
	name = "longbow"
	desc = "a well made bow for killing things from a distance."
	icon = 'modular_septic/icons/obj/items/guns/bow.dmi'
	base_icon_state = "bow"
	equip_sound = 'modular_septic/sound/weapons/guns/weap_away.ogg'
	drop_sound = 'modular_septic/sound/weapons/guns/drop_mediumgun.wav'
	inhand_icon_state = "bow"
	load_sound = null
	fire_sound = null
	mag_type = /obj/item/ammo_box/magazine/internal/bow
	force = 15
	carry_weight = 3 KILOGRAMS
	tetris_width = 64
	tetris_height = 64
	attack_verb_continuous = list("whipped", "cracked")
	attack_verb_simple = list("whip", "crack")
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	skill_melee = SKILL_IMPACT_WEAPON
	skill_ranged = SKILL_BOW
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	semi_auto = TRUE
	safety_flags = NONE
	var/drawn = FALSE

/obj/item/gun/ballistic/bow/update_icon_state()
	. = ..()
	icon_state = chambered ? "bow_[drawn]" : "bow"

/obj/item/gun/ballistic/bow/proc/drop_arrow()
	drawn = FALSE
	if(chambered)
		chambered.forceMove(drop_location())
		magazine.get_round(keep = FALSE)
		chambered = null
	update_appearance()

/obj/item/gun/ballistic/bow/chamber_round(keep_bullet = FALSE, spin_cylinder, replace_new_round)
	if(chambered || !magazine)
		return
	if(magazine.ammo_count())
		chambered = magazine.get_round(TRUE)
		chambered.forceMove(src)

/obj/item/gun/ballistic/bow/attack_self(mob/user)
	if(chambered)
		to_chat(user, span_notice("You [drawn ? "release the tension on" : "draw the string on"] [src]."))
		drawn = !drawn
	update_appearance()

/obj/item/gun/ballistic/bow/handle_chamber(empty_chamber, from_firing)
	if((!semi_auto && from_firing) || (bolt_type == BOLT_TYPE_NO_BOLT))
		return
	var/obj/item/ammo_casing/caseless/arrow = chambered //Find chambered round
	if(istype(arrow))//there's a chambered round
		if(QDELING(arrow))
			stack_trace("Trying to move a qdeleted casing of type [arrow.type]!")
			chambered = null
			drawn = FALSE
		else
			//Casing gets ejected and immediately deleted (i couldn't make this casing specific behavior)
			arrow.forceMove(drop_location())
			SEND_SIGNAL(arrow, COMSIG_CASING_EJECTED)
			if(!arrow.loaded_projectile)
				qdel(arrow)
			chambered = null
			drawn = FALSE
			 //fires, removing the arrow
	update_appearance()

/obj/item/gun/ballistic/bow/shoot_with_empty_chamber(mob/living/user)
	return //so clicking sounds please

/obj/item/ammo_box/magazine/internal/bow
	name = "bowstring"
	ammo_type = /obj/item/ammo_casing/caseless/arrow
	max_ammo = 1
	start_empty = TRUE
	caliber = CALIBER_ARROW

/obj/item/ammo_casing/caseless/arrow
	name = "broadhead arrow"
	desc = "Stabby Stabman!"
	icon = 'modular_septic/icons/obj/items/ammo/casings.dmi'
	world_icon = 'modular_septic/icons/obj/items/ammo/casings_world.dmi'
	world_icon_state = "arrow"
	icon_state = "arrow"
	base_icon_state = "arrow"
	throwforce = 1
	projectile_type = /obj/projectile/bullet/arrow
	caliber = CALIBER_ARROW
	carry_weight = 1.5 KILOGRAMS

/obj/projectile/bullet/arrow
	name = "arrow"
	desc = "a standard broadhead arrow"
	icon = 'modular_septic/icons/obj/items/guns/projectiles/projectiles.dmi'
	icon_state = "arrow"
	damage = 50
	armour_penetration = 0
	wound_bonus = 10

/obj/item/storage/bag/quiver
	name = "quiver"
	desc = "Holds both arrows and bolts"
	icon = 'modular_septic/icons/obj/clothing/back.dmi'
	icon_state = "quiver"
	//inhand_icon_state = "quiver"
	//worn_icon_state = "harpoon_quiver"
	var/arrow_path = /obj/item/ammo_casing/caseless/arrow

/obj/item/storage/bag/quiver/Initialize(mapload)
	. = ..()
	var/datum/component/storage/storage = GetComponent(/datum/component/storage)
	storage.max_w_class = WEIGHT_CLASS_TINY
	storage.max_items = 20
	storage.max_combined_w_class = 100
	storage.set_holdable(list(
		/obj/item/ammo_casing/caseless/arrow
		))

/obj/item/storage/bag/quiver/PopulateContents()
	. = ..()
	for(var/i in 1 to 10)
		new arrow_path(src)


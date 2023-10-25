/obj/item/clothing/mask/gas/sycophant
	name = "\proper high sycophant's mask"
	desc = "The symbol of a truly educated individual."
	icon = 'modular_septic/icons/obj/clothing/masks.dmi'
	icon_state = "sycophant_mask"
	worn_icon = 'modular_septic/icons/mob/clothing/mask.dmi'
	worn_icon_state = "sycophant_mask"
	lefthand_file = 'modular_septic/icons/mob/inhands/clothing/clothing_lefthand.dmi'
	righthand_file = 'modular_septic/icons/mob/inhands/clothing/clothing_righthand.dmi'
	inhand_icon_state = "ordinator_mask"
	flags_inv = HIDEFACE | HIDEHAIR | HIDEFACIALHAIR | HIDESNOUT
	body_parts_covered = FACE
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS
	visor_flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS
	visor_flags_inv = HIDEFACIALHAIR | HIDEFACE | HIDESNOUT
	flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES | PEPPERPROOF
	visor_flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES | PEPPERPROOF
	lowers_pitch = TRUE
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, FIRE = 50, ACID = 50, WOUND = 0)
	custom_materials = list(/datum/material/gold = 150,/datum/material/silver = 50)
	w_class = WEIGHT_CLASS_SMALL
	carry_weight = 1 KILOGRAMS

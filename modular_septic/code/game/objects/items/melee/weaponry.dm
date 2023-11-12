/obj/item/knife
	skill_melee = SKILL_KNIFE
	carry_weight = 400 GRAMS

/obj/item/knife/combat
	carry_weight = 800 GRAMS

/obj/item/knife/combat/zhunter
	name = "z-hunter brand knife"
	desc = "Illegal in the Separated Kingdom, this surplus knife is barely able to cut through skin. It can, however, hunt many Z's."
	icon = 'modular_septic/icons/obj/items/melee/knife.dmi'
	icon_state = "zhunter"
	min_force = 3
	force = 10
	min_force_strength = 0
	force_strength = 0
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL
	wound_bonus = 0
	bare_wound_bonus = 5

/obj/item/melee/truncheon
	name = "truncheon"
	desc = "A tool to beat the bones out of criminals."
	icon = 'modular_septic/icons/obj/items/melee/baton.dmi'
	icon_state = "truncheon"
	lefthand_file = 'modular_septic/icons/obj/items/melee/inhands/baton_lefthand.dmi'
	righthand_file = 'modular_septic/icons/obj/items/melee/inhands/baton_righthand.dmi'
	inhand_icon_state = "truncheon"
	drop_sound = list('modular_septic/sound/weapons/melee/baton_fall1.wav', 'modular_septic/sound/weapons/melee/baton_fall2.wav')
	miss_sound = list('modular_septic/sound/weapons/melee/baton_swish1.wav', 'modular_septic/sound/weapons/melee/baton_swish2.wav', 'modular_septic/sound/weapons/melee/baton_swish3.wav')
	hitsound = list('modular_septic/sound/weapons/melee/baton1.wav', 'modular_septic/sound/weapons/melee/baton2.wav', 'modular_septic/sound/weapons/melee/baton3.wav')
	min_force = 3
	force = 5
	min_force_strength = 1
	force_strength = 1.5
	wound_bonus = 3
	bare_wound_bonus = 0
	carry_weight = 2.5 KILOGRAMS
	slot_flags = ITEM_SLOT_BELT
	worn_icon_state = "classic_baton"
	skill_melee = SKILL_IMPACT_WEAPON
	tetris_width = 32
	tetris_height = 64

/obj/item/melee/truncheon/black
	name = "black truncheon"
	icon = 'modular_septic/icons/obj/items/melee/baton.dmi'
	icon_state = "truncheon_black"
	lefthand_file = 'modular_septic/icons/obj/items/melee/inhands/baton_lefthand.dmi'
	righthand_file = 'modular_septic/icons/obj/items/melee/inhands/baton_righthand.dmi'
	inhand_icon_state = "truncheon_black"

/obj/item/lead_pipe
	name = "lead pipe"
	desc = "Infantile Behavioral Correction Device."
	icon = 'modular_septic/icons/obj/items/melee/pipe.dmi'
	icon_state = "child_behavior_corrector"
	tetris_width = 32
	tetris_height = 96

/obj/item/lead_pipe/afterattack(atom/target, mob/user, proximity_flag, params)
	. = ..()
	if(ishuman(target) && proximity_flag && (user.zone_selected == BODY_ZONE_HEAD))
		user.client?.give_award(/datum/award/achievement/misc/leadpipe, user)

/obj/item/fireaxe
	min_force = 4
	force = 6
	min_force_strength = 0
	force_strength = 0
	parrying_modifier = 0
	wield_info = /datum/wield_info/fireaxe
	skill_melee = SKILL_IMPACT_WEAPON_TWOHANDED
	readying_flags = READYING_FLAG_SOFT_TWO_HANDED

/obj/item/fireaxe/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 80, 0 , hitsound) //axes are not known for being precision butchering tools

/obj/item/changeable_attacks
	name = "a fucked up retarded weapon"
	desc = "report thgis to a retard dev if you see it"
	var/slash_hitsound = list('modular_septic/sound/weapons/melee/kukri1.wav', 'modular_septic/sound/weapons/melee/kukri2.wav', 'modular_septic/sound/weapons/melee/kukri3.wav')
	var/stab_hitsound = list('modular_septic/sound/weapons/melee/sharp_stab1.ogg', 'modular_septic/sound/weapons/melee/sharp_stab2.ogg')
	var/bash_hitsound = list('modular_septic/sound/weapons/melee/baton1.wav', 'modular_septic/sound/weapons/melee/baton2.wav', 'modular_septic/sound/weapons/melee/baton3.wav')
	var/current_atk_mode = null

/obj/item/changeable_attacks/examine(mob/user)
	. = ..()
	if(current_atk_mode)
		. += span_info("It's currently ready to [current_atk_mode]")

/obj/item/changeable_attacks/attack_self(mob/user, modifiers)
	. = ..()
	swap_intents(user)

/obj/item/changeable_attacks/dropped(mob/user, silent)
	. = ..()
	current_atk_mode = initial(current_atk_mode)

/obj/item/changeable_attacks/proc/swap_intents(mob/user)
	if(isnull(current_atk_mode))
		to_chat(user, span_warning("There's no other ways to attack with this weapon."))
		return
	user.playsound_local(get_turf(src), 'modular_septic/sound/weapons/melee/swap_intent.ogg', 5, FALSE)

#define slash 1
#define stab 2
#define bash 3

/obj/item/changeable_attacks/sword
	name = "Nice Sword"
	desc = "A Nice Sword."
	icon_state = "cockri"
	inhand_icon_state = "cockri"
	worn_icon_state = "cockri"
	icon = 'modular_septic/icons/obj/items/melee/knife.dmi'
	lefthand_file = 'modular_septic/icons/obj/items/melee/inhands/knife_lefthand.dmi'
	righthand_file = 'modular_septic/icons/obj/items/melee/inhands/knife_righthand.dmi'
	worn_icon = 'modular_septic/icons/obj/items/melee/worn/knife_worn.dmi'
	equip_sound = 'modular_septic/sound/weapons/melee/kukri_holster.wav'
	pickup_sound = 'modular_septic/sound/weapons/melee/kukri_deploy.wav'
	miss_sound = list('modular_septic/sound/weapons/melee/kukri_swish1.wav', 'modular_septic/sound/weapons/melee/kukri_swish2.wav', 'modular_septic/sound/weapons/melee/kukri_swish3.wav')
	drop_sound = list('modular_septic/sound/weapons/melee/bladedrop1.wav', 'modular_septic/sound/weapons/melee/bladedrop2.wav')
	current_atk_mode = slash
	min_force = 6
	force = 10
	min_force_strength = 1
	force_strength = 1.8
	min_throwforce = 5
	min_throwforce_strength = 8
	throwforce_strength = 1.2
	wound_bonus = 5
	bare_wound_bonus = 1
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	sharpness = SHARP_EDGED
	parrying_modifier = 1
	skill_melee = SKILL_SHORTSWORD
	tetris_width = 32
	tetris_height = 96

/obj/item/changeable_attacks/sword/Initialize(mapload)
	. = ..()
	if(current_atk_mode == slash)
		hitsound = slash_hitsound
	if(current_atk_mode == stab)
		hitsound = stab_hitsound
	if(current_atk_mode == bash)
		hitsound = bash_hitsound

/obj/item/changeable_attacks/sword/swap_intents(mob/user)
	. = ..()
	switch(current_atk_mode)
		if(slash)
			to_chat(user, span_notice("I'm now stabbing them with the pointy end of the [src]."))
			hitsound = stab_hitsound
			min_force = 6
			force = 10
			min_force_strength = 1
			force_strength = 1.8
			current_atk_mode = stab
			sharpness = SHARP_POINTY
		if(stab)
			to_chat(user, span_notice("I'm now bashing with the hilt of the [src]."))
			hitsound = bash_hitsound
			min_force = 6
			force = 10
			min_force_strength = 0.6
			force_strength = 1.65
			current_atk_mode = bash
			sharpness = NONE
		if(bash)
			to_chat(user, span_notice("I'm now slicing with the [src]."))
			hitsound = slash_hitsound
			min_force = 6
			force = 10
			min_force_strength = 1
			force_strength = 1.8
			current_atk_mode = slash
			sharpness = SHARP_EDGED

/obj/item/changeable_attacks/sword/kukri
	name = "Kukri"
	desc = "A carbon-steel kukri, usually found in the hands of people who really want to make cartel videos."

/obj/item/changeable_attacks/skindeep
	name = "Skin Deep Cleaver"
	desc = "A Skin Deep Cleaver, known for It's tiny size and precision, definitely not being essentially a sharp club."
	icon = 'modular_septic/icons/obj/items/melee/48x32.dmi'
	lefthand_file = 'modular_septic/icons/obj/items/melee/inhands/sword_lefthand.dmi'
	righthand_file = 'modular_septic/icons/obj/items/melee/inhands/sword_righthand.dmi'
	icon_state = "skin_cleaver"
	inhand_icon_state = "skin_cleaver"
	current_atk_mode = slash
	slash_hitsound = list('modular_septic/sound/weapons/melee/heavysharp_slash1.ogg', 'modular_septic/sound/weapons/melee/heavysharp_slash2.ogg', 'modular_septic/sound/weapons/melee/heavysharp_slash3.ogg')
	pickup_sound = 'modular_septic/sound/weapons/melee/heavysharp_deploy.ogg'
	miss_sound = list('modular_septic/sound/weapons/melee/heavysharp_swish1.ogg', 'modular_septic/sound/weapons/melee/heavysharp_swish2.ogg', 'modular_septic/sound/weapons/melee/heavysharp_swish3.ogg')
	drop_sound = list('modular_septic/sound/weapons/melee/bladedrop1.wav', 'modular_septic/sound/weapons/melee/bladedrop2.wav')
	min_force = 13
	force = 25
	min_force_strength = 1.3
	wound_bonus = 5
	bare_wound_bonus = 1
	force_strength = 2.5
	min_throwforce = 5
	min_throwforce_strength = 8
	throwforce_strength = 1
	parrying_modifier = 1
	w_class = WEIGHT_CLASS_BULKY
	sharpness = SHARP_EDGED
	skill_melee = SKILL_SHORTSWORD
	tetris_width = 32
	tetris_height = 96
	slot_flags = null

/obj/item/changeable_attacks/skindeep/swap_intents(mob/user)
	. = ..()
	switch(current_atk_mode)
		if(slash)
			to_chat(user, span_notice("I'm now stabbing them with the slanted pointy end of the [src].")) //It's not that great at stabbing
			hitsound = stab_hitsound
			min_force = 8
			force = 10
			min_force_strength = 1.5
			force_strength = 2
			current_atk_mode = stab
			sharpness = SHARP_POINTY
		if(stab)
			to_chat(user, span_notice("I'm now bashing with the hilt of the [src]."))
			hitsound = bash_hitsound
			min_force = 6
			force = 9
			min_force_strength = 0.65
			force_strength = 1.65
			current_atk_mode = bash
			sharpness = NONE
		if(bash)
			to_chat(user, span_notice("I'm now slicing with the [src]."))
			hitsound = slash_hitsound
			min_force = 13
			force = 25
			min_force_strength = 1.3
			force_strength = 2.5
			current_atk_mode = slash
			sharpness = SHARP_EDGED

#undef slash
#undef stab
#undef bash

/obj/item/kukri
	name = "Kukri"
	desc = "A carbon-steel kukri, usually found in the hands of people who really want to make cartel videos."
	icon_state = "cockri"
	inhand_icon_state = "cockri"
	worn_icon_state = "cockri"
	icon = 'modular_septic/icons/obj/items/melee/knife.dmi'
	lefthand_file = 'modular_septic/icons/obj/items/melee/inhands/knife_lefthand.dmi'
	righthand_file = 'modular_septic/icons/obj/items/melee/inhands/knife_righthand.dmi'
	worn_icon = 'modular_septic/icons/obj/items/melee/worn/knife_worn.dmi'
	hitsound = list('modular_septic/sound/weapons/melee/kukri1.wav', 'modular_septic/sound/weapons/melee/kukri2.wav', 'modular_septic/sound/weapons/melee/kukri3.wav')
	equip_sound = 'modular_septic/sound/weapons/melee/kukri_holster.wav'
	pickup_sound = 'modular_septic/sound/weapons/melee/kukri_deploy.wav'
	miss_sound = list('modular_septic/sound/weapons/melee/kukri_swish1.wav', 'modular_septic/sound/weapons/melee/kukri_swish2.wav', 'modular_septic/sound/weapons/melee/kukri_swish3.wav')
	drop_sound = list('modular_septic/sound/weapons/melee/bladedrop1.wav', 'modular_septic/sound/weapons/melee/bladedrop2.wav')
	min_force = 6
	force = 10
	min_force_strength = 1
	force_strength = 1.8
	wound_bonus = 5
	bare_wound_bonus = 1
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	sharpness = SHARP_EDGED
	parrying_modifier = 1
	skill_melee = SKILL_SHORTSWORD
	tetris_width = 32
	tetris_height = 96

/obj/item/skin_cleaver
	name = "Skin Deep Cleaver"
	desc = "A Skin Deep Cleaver, known for It's tiny size and precision, definitely not being essentially a sharp club."
	icon_state = "skin_cleaver"
	inhand_icon_state = "skin_cleaver"
	slot_flags = null
	hitsound = list('modular_septic/sound/weapons/melee/heavysharp_slash1.ogg', 'modular_septic/sound/weapons/melee/heavysharp_slash2.ogg', 'modular_septic/sound/weapons/melee/heavysharp_slash3.ogg')
	pickup_sound = 'modular_septic/sound/weapons/melee/heavysharp_deploy.ogg'
	miss_sound = list('modular_septic/sound/weapons/melee/heavysharp_swish1.ogg', 'modular_septic/sound/weapons/melee/heavysharp_swish2.ogg', 'modular_septic/sound/weapons/melee/heavysharp_swish3.ogg')
	drop_sound = list('modular_septic/sound/weapons/melee/bladedrop1.wav', 'modular_septic/sound/weapons/melee/bladedrop2.wav')
	icon = 'modular_septic/icons/obj/items/melee/48x32.dmi'
	lefthand_file = 'modular_septic/icons/obj/items/melee/inhands/sword_lefthand.dmi'
	righthand_file = 'modular_septic/icons/obj/items/melee/inhands/sword_righthand.dmi'
	min_force = 13
	force = 25
	min_force_strength = 1.3
	force_strength = 2.5
	wound_bonus = 10
	bare_wound_bonus = 1
	w_class = WEIGHT_CLASS_BULKY
	sharpness = SHARP_EDGED
	parrying_modifier = 1
	skill_melee = SKILL_SHORTSWORD
	tetris_width = 32
	tetris_height = 96

/obj/item/melee/sabre
	parrying_modifier = 1
	skill_melee = SKILL_RAPIER

/obj/item/melee/chainofcommand
	parrying_modifier = -4
	skill_melee = SKILL_FLAIL

/obj/item/melee/curator_whip
	parrying_modifier = -4
	skill_melee = SKILL_FLAIL

/obj/item/claymore
	parrying_modifier = 0
	skill_melee = SKILL_LONGSWORD

/obj/item/claymore/cutlass
	parrying_modifier = 0
	skill_melee = SKILL_SHORTSWORD

/obj/item/katana
	parrying_modifier = 0
	skill_melee = SKILL_LONGSWORD

/obj/item/switchblade
	parrying_modifier = -2
	skill_melee = SKILL_KNIFE

/obj/item/mounted_chainsaw
	parrying_modifier = -1
	skill_melee = SKILL_IMPACT_WEAPON_TWOHANDED

/obj/item/chainsaw
	parrying_modifier = -1
	skill_melee = SKILL_IMPACT_WEAPON_TWOHANDED

/obj/item/melee/baseball_bat
	parrying_modifier = 0
	skill_melee = SKILL_IMPACT_WEAPON_TWOHANDED

/obj/item/gohei
	parrying_modifier = 0
	skill_melee = SKILL_STAFF

/obj/item/vibro_weapon
	parrying_modifier = 1
	skill_melee = SKILL_FORCESWORD

/obj/item/melee/moonlight_greatsword
	parrying_modifier = 1
	skill_melee = SKILL_FORCESWORD

/obj/item/spear
	parrying_modifier = 0
	skill_melee = SKILL_SPEAR

/obj/item/singularityhammer
	parrying_modifier = -2
	skill_melee = SKILL_POLEARM

/obj/item/mjollnir
	parrying_modifier = -1
	skill_melee = SKILL_POLEARM

/obj/item/pitchfork
	parrying_modifier = -1
	skill_melee = SKILL_SPEAR

/obj/item/melee/energy
	parrying_modifier = 1
	skill_melee = SKILL_FORCESWORD

/obj/item/dualsaber
	parrying_modifier = 2
	skill_melee = SKILL_FORCESWORD

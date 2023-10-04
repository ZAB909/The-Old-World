/datum/reagent/drug/carbonylmethamphetamine
	name = "carbonylmethamphetamine"
	description = "finally some good fucking drugs."
	reagent_state = LIQUID
	taste_description = "grape"
	color = "#D3D3D3"
	overdose_threshold = 40
	metabolization_rate = 0.3 * REAGENTS_METABOLISM
	ph = 3

/datum/reagent/drug/carbonylmethamphetamine/on_mob_metabolize(mob/living/crack_addict)
	. = ..()
	crack_addict.crack_addict()
	crack_addict.attributes?.add_attribute_modifier(/datum/attribute_modifier/crack_addict, TRUE)
	crack_addict.playsound_local(crack_addict, 'modular_septic/sound/insanity/bass.wav', 100)
	to_chat(crack_addict, span_achievementrare("My brain swells and my muscles become faster."))
	crack_addict.flash_pain_manic(100)
	var/client/C = crack_addict.client
	var/intensity = 12
	animate(C, pixel_y = (C.pixel_y + intensity), time = intensity/2)
	sleep(intensity/4)
	animate(C, pixel_y = (C.pixel_y - intensity), time = intensity/2)
	sleep(intensity/4)

/datum/reagent/drug/carbonylmethamphetamine/on_mob_end_metabolize(mob/living/crack_addict)
	. = ..()
	crack_addict.attributes?.remove_attribute_modifier(/datum/attribute_modifier/crack_addict, TRUE)

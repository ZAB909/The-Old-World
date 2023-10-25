/datum/dynamic_ruleset/roundstart/gehenna
    name = "Lost Gehenna"
    antag_flag = null
    antag_datum = null
    restricted_roles = list()
    required_candidates = 0
    weight = 0
    cost = 0
    requirements = list(101,101,101,101,101,101,101,101,101,101)
    flags = LONE_RULESET

/datum/dynamic_ruleset/roundstart/gehenna/acceptable(population, threat_level)
	return TRUE

/datum/dynamic_ruleset/roundstart/gehenna/ready(population, forced)
	return TRUE

/datum/dynamic_ruleset/roundstart/gehenna/pre_execute()
	. = ..()
	message_admins("Starting a round of Lost Gehenna")
	log_game("DYNAMIC: Starting a round of Lost Gehenna.")
	mode.spend_roundstart_budget(mode.round_start_budget)
	mode.spend_midround_budget(mode.mid_round_budget)
	mode.threat_log += "[worldtime2text()]: Lost Gehenna ruleset set threat to 0."
	var/soundfile = "modular_septic/sound/voice/valario/valario[rand(1,11)].ogg"
	var/sound/valario = sound(soundfile, FALSE, 0, CHANNEL_ADMIN, 100)
	SEND_SOUND(world, valario)

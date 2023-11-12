//hydration
/datum/mood_event/thirsty
	description = span_warning("I'm getting a bit thirsty.")
	mood_change = -4

/datum/mood_event/dehydrated
	description = span_boldwarning("I am dehydrated!")
	mood_change = -6

//nutrition
/datum/mood_event/hungry
	mood_change = -4

/datum/mood_event/starving
	mood_change = -6

//urination
/datum/mood_event/needpiss
	description = span_warning("I need to pee.")
	mood_change = -3

/datum/mood_event/reallyneedpiss
	description = span_boldwarning("My bladder is going to explode!")
	mood_change = -5

/datum/mood_event/pissed_self
	description = span_necrosis("I have pissed my pants. This day is ruined.")
	mood_change = -8
	timeout = 10 MINUTES

//defecation
/datum/mood_event/needshit
	description = span_warning("I need to poop.")
	mood_change = -3

/datum/mood_event/reallyneedshit
	description = span_boldwarning("My anus is <b>BLEEDING!</b>")
	mood_change = -5

/datum/mood_event/shat_self
	description = span_necrosis("I have shat my pants. This day is ruined.")
	mood_change = -8
	timeout = 10 MINUTES

//hygiene
/datum/mood_event/clean
	description = span_nicegreen("I am so clean!")
	mood_change = 2

/datum/mood_event/needshower
	description = span_warning("I need to shower.")
	mood_change = -2

/datum/mood_event/reallyneedshower
	description = span_infection("I am filthy.")
	mood_change = -4

/datum/mood_event/smashplayer
	description = span_necrosis("My stench is unbearable.")
	mood_change = -6


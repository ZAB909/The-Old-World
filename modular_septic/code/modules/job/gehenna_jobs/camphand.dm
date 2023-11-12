/datum/job/camphand
	title = "Camphand"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Expedition Leader")
	faction = FACTION_STATION
	total_positions = 64
	spawn_positions = 64
	supervisors = "everyone in the camp"
	selection_color = "#57a300"
	req_admin_notify = 1
	exp_granted_type = EXP_TYPE_CREW
	job_flags = JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_EQUIP_RANK | JOB_ASSIGN_QUIRKS

	departments_list = list(
		/datum/job_department/laborers,
	)

	display_order = JOB_DISPLAY_ORDER_CAMPHAND

	outfit = /datum/outfit/camphand
	attribute_sheet = /datum/attribute_holder/sheet/job/camphand
	//no_dresscode = TRUE
    //required_languages = null

/datum/outfit/camphand
    name = "Camphand Uniform"

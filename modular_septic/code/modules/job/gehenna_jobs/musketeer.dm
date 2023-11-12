/datum/job/musketeer
	title = "Musketeer"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Expedition Leader")
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the expedition leader"
	selection_color = "#ff8139"
	req_admin_notify = 1
	exp_granted_type = EXP_TYPE_CREW
	job_flags = JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_EQUIP_RANK | JOB_ASSIGN_QUIRKS

	departments_list = list(
		/datum/job_department/contractors,
	)

	display_order = JOB_DISPLAY_ORDER_MUSKETEER

	outfit = /datum/outfit/musketeer
	attribute_sheet = /datum/attribute_holder/sheet/job/musketeer
	//no_dresscode = TRUE
    //required_languages = null

/datum/outfit/musketeer
    name = "Musketeer Uniform"

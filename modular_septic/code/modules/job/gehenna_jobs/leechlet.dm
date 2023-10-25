/datum/job/leechlet
	title = "Leechlet"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("High Sycophant")
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Institute"
	selection_color = "#580000"
	req_admin_notify = 1
	exp_granted_type = EXP_TYPE_CREW
	job_flags = JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_EQUIP_RANK | JOB_ASSIGN_QUIRKS

	departments_list = list(
		/datum/job_department/institute,
	)

	display_order = JOB_DISPLAY_ORDER_LEECHLET

	outfit = /datum/outfit/leechlet
	attribute_sheet = /datum/attribute_holder/sheet/job/leechlet
	//no_dresscode = TRUE
    //required_languages = null

/datum/outfit/leechlet
    name = "Leechlet Uniform"

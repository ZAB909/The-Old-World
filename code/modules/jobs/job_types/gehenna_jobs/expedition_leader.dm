/datum/job/expedition_leader
	title = "Expedition Leader"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Sultan")
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the contract"
	selection_color = "#ffc187"
	req_admin_notify = 1
	exp_granted_type = EXP_TYPE_CREW
	job_flags = JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_EQUIP_RANK | JOB_ASSIGN_QUIRKS

	departments_list = list(
		/datum/job_department/explorers,
	)

	display_order = JOB_DISPLAY_ORDER_EXPEDITION_LEADER

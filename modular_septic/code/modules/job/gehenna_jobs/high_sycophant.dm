/datum/job/high_sycophant
	title = "High Sycophant"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Expedition Leader")
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Institute"
	selection_color = "#580000"
	req_admin_notify = 1
	exp_granted_type = EXP_TYPE_CREW
	job_flags = JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_EQUIP_RANK | JOB_ASSIGN_QUIRKS

	departments_list = list(
		/datum/job_department/nobility,
		/datum/job_department/institute,
	)

	display_order = JOB_DISPLAY_ORDER_EXPEDITION_LEADER

	outfit = /datum/outfit/high_sycophant
	attribute_sheet = /datum/attribute_holder/sheet/job/leechlet
   //no_dresscode = TRUE
   //required_languages = null

/datum/outfit/high_sycophant
    name = "High Sycophant Uniform"
    uniform = /obj/item/clothing/under/institute/leech
    backpack_contents = list(
	    /obj/item/reagent_containers/hypospray/medipen/retractible/blacktar = 1,
        /obj/item/flashlight/seclite = 1,
    )
    gloves = /obj/item/clothing/gloves/color/black
    shoes = /obj/item/clothing/shoes/luxury

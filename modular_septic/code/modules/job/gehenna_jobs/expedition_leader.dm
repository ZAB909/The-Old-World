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
		/datum/job_department/nobility,
	)

	display_order = JOB_DISPLAY_ORDER_EXPEDITION_LEADER

	outfit = /datum/outfit/leader
	attribute_sheet = /datum/attribute_holder/sheet/job/leader
   //no_dresscode = TRUE
   //required_languages = null

/datum/outfit/leader
    name = "Leader Uniform"

    uniform = /obj/item/clothing/under/itobe
    id = /obj/item/cellphone
    belt = /obj/item/crowbar
    back = /obj/item/storage/backpack/satchel/itobe
    backpack_contents = list(
	    /obj/item/reagent_containers/hypospray/medipen/retractible/blacktar = 1,
        /obj/item/flashlight/seclite = 1,
    )
    gloves = /obj/item/clothing/gloves/color/black
    shoes = /obj/item/clothing/shoes/jackboots

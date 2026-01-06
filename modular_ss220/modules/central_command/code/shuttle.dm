/datum/map_template/shuttle/centcom
	port_id = "centcom"

/datum/map_template/shuttle/centcom/podbay_elevator
	who_can_purchase = null
	suffix = "supplypod"
	name = "CentCom PodBay Elevator"

/area/shuttle/centcom/podbay_elevator
	name = "CentCom PodBay Elevator"

/obj/machinery/computer/shuttle/centcom
	shuttleId = "centcom"

/obj/machinery/computer/shuttle/centcom/podbay_elevator
	name = "Elevator console"
	desc = "A elevator control computer."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	shuttleId = "centcom_supplypod"
	possible_destinations = "centcom_supplypod_warehouse;centcom_supplypod_podbay"

/obj/docking_port/stationary/centcom/podbay_elevator
	dir = 4
	height = 7
	dwidth = 3
	width = 7

/obj/docking_port/stationary/centcom/podbay_elevator/warehouse
	shuttle_id = "centcom_supplypod_warehouse"
	name = "CentCom Warehouse"
	roundstart_template = /datum/map_template/shuttle/centcom/podbay_elevator

/obj/docking_port/stationary/centcom/podbay_elevator/podbay
	shuttle_id = "centcom_supplypod_podbay"
	name = "CentCom PodBay"

//1984 centcom areas
/area/centcom
	name = "CentCom"
	icon = 'icons/area/areas_centcom.dmi'
	icon_state = "centcom"
	static_lighting = TRUE
	requires_power = FALSE
	default_gravity = STANDARD_GRAVITY
	area_flags = UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE

/area/centcom/central_command_areas/control/reserve
	name = "CentCom Station Central Control"
	icon_state = "centcom_control"

/area/centcom/central_command_areas/evacuation/reserve
	name = "CentCom Crew Wing"
	icon_state = "centcom_evacuation"

/area/centcom/central_command_areas/fore/reserve
	name = "CentCom Fore Dock"
	icon_state = "centcom_fore"

/area/centcom/central_command_areas/supply/reserve
	name = "CentCom Supply Area"
	icon_state = "centcom_supply"

/area/centcom/central_command_areas/supply/reserve/pod
	name = "CentCom Pod Area"

/area/centcom/central_command_areas/ferry/reserve
	name = "CentCom Station Shuttle Dock"
	icon_state = "centcom_ferry"

/area/centcom/central_command_areas/meeting
	name = "CentCom Staff Meeting Room"
	icon_state = "centcom_briefing"

/area/centcom/central_command_areas/armory/reserve
	name = "CentCom Station Armory"
	icon_state = "centcom_armory"

/area/centcom/central_command_areas/admin/reserve
	name = "CentCom Station Administrative Office"
	icon_state = "centcom_admin"

/area/centcom/central_command_areas/admin/reserve/storage
	name = "CentCom Station Administrative Office Storage"
	icon_state = "centcom_admin_storage"

/area/centcom/central_command_areas/prison/reserve
	name = "Centcom Temporaly Prison"
	icon_state = "centcom_prison"

/area/centcom/central_command_areas/prison/reserve/cells
	name = "Centcom Temporaly Prison Cells"
	icon_state = "centcom_cells"

/area/centcom/central_command_areas/security
	name = "Centcom Security"
	icon_state = "centcom_holding"

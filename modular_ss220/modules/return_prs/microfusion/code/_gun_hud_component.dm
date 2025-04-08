/datum/component/ammo_hud/proc/update_hud()
	. = ..()
	if(istype(parent, /obj/item/gun/microfusion))
		var/obj/item/gun/microfusion/parent_gun = parent
		if(!parent_gun.phase_emitter)
			hud.icon_state = "microfusion_counter_no_emitter"
			hud.maptext = null
			return
		if(parent_gun.phase_emitter.damaged)
			hud.icon_state = "microfusion_counter_damaged"
			hud.maptext = null
			return
		if(!parent_gun.cell)
			hud.icon_state = "microfusion_counter_no_emitter"
			hud.maptext = null
			return
		if(!parent_gun.cell.charge)
			hud.icon_state = "microfusion_counter_no_emitter"
			hud.maptext = null
			return
		var/phase_emitter_state = parent_gun.phase_emitter.get_heat_icon_state()
		hud.icon_state = "microfusion_counter_[phase_emitter_state]"
		hud.cut_overlays()
		hud.maptext_x = -12
		var/obj/item/ammo_casing/energy/shot = parent_gun.microfusion_lens
		var/battery_percent = FLOOR(clamp(parent_gun.cell.charge / parent_gun.cell.maxcharge, 0, 1) * 100, 1)
		var/shot_cost_percent = FLOOR(clamp(shot.e_cost / parent_gun.cell.maxcharge, 0, 1) * 100, 1)
		if(battery_percent > 99 || shot_cost_percent > 99)
			hud.maptext_x = -12
		else
			hud.maptext_x = -8
		if(!parent_gun.can_shoot())
			hud.icon_state = "microfusion_counter_no_emitter"
			return
		if(battery_percent <= 25)
			hud.maptext = span_maptext("<div align='center' valign='middle' style='position:relative'><font color='[COLOR_YELLOW]'>[battery_percent]%</font><br><font color='[COLOR_CYAN]'>[shot_cost_percent]%</font></div>")
			return
		hud.maptext = span_maptext("<div align='center' valign='middle' style='position:relative'><font color='[COLOR_VIBRANT_LIME]'>[battery_percent]%</font><br><font color='[COLOR_CYAN]'>[shot_cost_percent]%</font></div>")

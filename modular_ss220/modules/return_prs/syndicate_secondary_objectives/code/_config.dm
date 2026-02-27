
/// Determines how many potential objectives a traitor can have.
/datum/config_entry/number/maximum_potential_objectives
	default = 6
	min_val = 1

/datum/controller/subsystem/traitor
	/// File to load configurations from.
	var/configuration_path = "config/traitor_objective.json"
	/// Global configuration data that gets applied to each objective when it is created.
	/// Basic objective format
	/// '/datum/traitor_objective/path/to/objective': {
	///   "global_progression_influence_intensity": 0
	/// }
	var/configuration_data = list()
	/// Used to handle the probability of getting an objective.
	var/datum/traitor_category_handler/category_handler
	/// The current debug handler for objectives. Used for debugging objectives
	var/datum/traitor_objective_debug/traitor_debug_panel
	/// Used by the debug menu, decides whether newly created objectives should generate progression and telecrystals. Do not modify for non-debug purposes.
	var/generate_objectives = TRUE
	/// Objectives that have been completed by type. Used for limiting objectives.
	var/list/taken_objectives_by_type = list()
	/// A list of all existing objectives by type
	var/list/all_objectives_by_type = list()

/datum/controller/subsystem/traitor/proc/on_objective_taken(datum/traitor_objective/objective)
	if(!istype(objective))
		return

	add_objective_to_list(objective, taken_objectives_by_type)

/datum/controller/subsystem/traitor/proc/get_taken_count(datum/traitor_objective/objective_type)
	return length(taken_objectives_by_type[objective_type])


/datum/controller/subsystem/traitor/proc/add_objective_to_list(datum/traitor_objective/objective, list/objective_list)
	var/datum/traitor_objective/current_type = objective.type
	while(current_type != /datum/traitor_objective)
		if(!objective_list[current_type])
			objective_list[current_type] = list(objective)
		else
			objective_list[current_type] += objective
		current_type = type2parent(current_type)

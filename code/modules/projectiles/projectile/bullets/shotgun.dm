/obj/projectile/bullet/shotgun_slug
	name = "12g shotgun slug"
	icon_state = "pellet"
	damage = 25
	armour_penetration = 30
	sharpness = SHARP_POINTY
	wound_bonus = 0
	exposed_wound_bonus = 15

/obj/projectile/bullet/shotgun_slug/milspec
	name = "12g shotgun milspec slug"
	icon_state = "pellet"
	damage = 50

/obj/projectile/bullet/shotgun_slug/executioner
	name = "executioner slug" // admin only, can dismember limbs
	sharpness = SHARP_EDGED
	wound_bonus = 80

/obj/projectile/bullet/shotgun_slug/pulverizer
	name = "pulverizer slug" // admin only, can crush bones
	sharpness = NONE
	wound_bonus = 80

/obj/projectile/bullet/shotgun_beanbag
	name = "beanbag slug"
	icon_state = "pellet"
	damage = 10
	stamina = 55
	wound_bonus = 20
	sharpness = NONE
	embed_type = null

/obj/projectile/bullet/shotgun_beanbag/a40mm
	name = "rubber slug"
	icon_state = "cannonball"
	damage = 20
	stamina = 160 //BONK
	wound_bonus = 30
	weak_against_armour = TRUE

/obj/projectile/bullet/incendiary/shotgun
	name = "incendiary slug"
	icon_state = "pellet"
	damage = 20

/obj/projectile/bullet/incendiary/shotgun/no_trail
	name = "precision incendiary slug"
	damage = 35
	leaves_fire_trail = FALSE

/obj/projectile/bullet/incendiary/shotgun/dragonsbreath
	name = "dragonsbreath pellet"
	damage = 5

/obj/projectile/bullet/shotgun_stunslug
	name = "stunslug"
	damage = 5
	paralyze = 100
	stutter = 10 SECONDS
	jitter = 40 SECONDS
	range = 7
	icon_state = "spark"
	color = COLOR_YELLOW
	embed_type = null

/obj/projectile/bullet/shotgun_frag12
	name ="frag12 slug"
	icon_state = "pellet"
	damage = 15
	paralyze = 10

/obj/projectile/bullet/shotgun_frag12/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	explosion(target, devastation_range = -1, light_impact_range = 1, explosion_cause = src)
	return BULLET_ACT_HIT

/obj/projectile/bullet/pellet
	icon_state = "pellet"
	damage_falloff_tile = -0.25

/obj/projectile/bullet/pellet/shotgun_buckshot
	name = "buckshot pellet"
	damage = 5
	wound_bonus = 5
	exposed_wound_bonus = 5
	speed = 1.1
	wound_falloff_tile = -0.5 //We would very much like this to cause wounds despite the low damage, so the drop off is relatively slow
	sharpness = SHARP_EDGED

/**
 * A slightly weaker version of the buckshot, available from the blackmarket.
 * The casings they're in have a very small chance to misfire and will gradually damage the firearm, making it weaker.
 */
/obj/projectile/bullet/pellet/shotgun_buckshot/old
	damage_falloff_tile = -1
	wound_bonus = -100
	exposed_wound_bonus = -100

/obj/projectile/bullet/pellet/shotgun_buckshot/milspec
	name = "milspec buckshot pellet"
	damage = 7.5

/obj/projectile/bullet/pellet/shotgun_rubbershot
	name = "rubber shot pellet"
	damage = 3
	stamina = 10
	sharpness = NONE
	embed_type = null
	speed = 0.8
	stamina_falloff_tile = -0.25
	ricochets_max = 4
	ricochet_chance = 120
	ricochet_decay_chance = 0.9
	ricochet_decay_damage = 0.8
	ricochet_auto_aim_range = 2
	ricochet_auto_aim_angle = 30
	ricochet_incidence_leeway = 75
	/// Subtracted from the ricochet chance for each tile traveled
	var/tile_dropoff_ricochet = 4

/obj/projectile/bullet/pellet/shotgun_rubbershot/reduce_range()
	if(ricochet_chance > 0)
		ricochet_chance -= tile_dropoff_ricochet
	. = ..()

/obj/projectile/bullet/pellet/shotgun_incapacitate
	name = "incapacitating pellet"
	damage = 1
	stamina = 6
	embed_type = null

/obj/projectile/bullet/pellet/flechette
	name = "flechette"
	icon_state = "flechette"
	damage = 2
	wound_bonus = 5
	exposed_wound_bonus = 5
	armour_penetration = 30
	damage_falloff_tile = -0.2
	wound_falloff_tile = -0.5
	speed = 1.2
	sharpness = SHARP_POINTY
	embed_type = /datum/embedding/bullet/flechette

/datum/embedding/bullet/flechette
	embed_chance = 25
	fall_chance = 10
	jostle_chance = 20
	ignore_throwspeed_threshold = TRUE
	pain_stam_pct = 0.1
	pain_mult = 0.5
	jostle_pain_mult = 1.5
	rip_time = 0.5 SECONDS

/obj/projectile/bullet/pellet/flechette/donk
	name = "\improper Donk Co. 'Donk Spike' flechette"
	desc = "Your internal evisceration! As sponsored by the Donk Corporation!"
	icon_state = "flechette_plastic"
	damage = 1 // good god its awful
	wound_bonus = 20 // but it WILL mulch you if you don't have armor.
	exposed_wound_bonus = 20
	armour_penetration = 0
	damage_falloff_tile = -0.1
	wound_falloff_tile = -2
	embed_type = /datum/embedding/bullet/flechette_donk // the true power of the donk spike.

/datum/embedding/bullet/flechette_donk
	embed_chance = 100
	fall_chance = 0
	jostle_chance = 50
	ignore_throwspeed_threshold = TRUE
	pain_mult = 1
	jostle_pain_mult = 1
	rip_time = 1 SECONDS

// Mech Scattershot

/obj/projectile/bullet/scattershot
	icon_state = "pellet"
	damage = 24

//Breaching Ammo

/obj/projectile/bullet/shotgun_breaching
	name = "12g breaching round"
	desc = "A breaching round designed to destroy airlocks and windows with only a few shots. Ineffective against other targets."
	hitsound = 'sound/items/weapons/sonic_jackhammer.ogg'
	damage = 5 //does shit damage to everything except doors and windows
	demolition_mod = 200 //one shot to break a window or grille, or two shots to breach an airlock door

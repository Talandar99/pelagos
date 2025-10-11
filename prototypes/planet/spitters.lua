-- ======================================================================
-- White Spitter Mod – data.lua
-- ======================================================================

require("__base__.prototypes.entity.biter-ai-settings")
require("__base__.prototypes.entity.spitter-animations")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function coper_spitter_spawner_idle_animation(variation, tint, captured)
	return {
		layers = {
			util.sprite_load("__base__/graphics/entity/spawner/spawner-idle", {
				frame_count = 7,
				scale = 0.5,
				animation_speed = 0.18,
				run_mode = "forward-then-backward",
				y = variation * 376 * 2,
				allow_forced_downscale = true,
				surface = "nauvis",
				usage = "enemy",
			}),
			util.sprite_load("__base__/graphics/entity/spawner/spawner-idle-mask", {
				frame_count = 7,
				scale = 0.5,
				animation_speed = 0.18,
				run_mode = "forward-then-backward",
				tint = tint,
				flags = { "mask" },
				y = variation * 230 * 2,
				allow_forced_downscale = true,
				surface = "nauvis",
				usage = "enemy",
			}),
			util.sprite_load("__base__/graphics/entity/spawner/spawner-idle-shadow", {
				frame_count = 7,
				scale = 0.5,
				animation_speed = 0.18,
				run_mode = "forward-then-backward",
				draw_as_shadow = true,
				y = variation * 358 * 2,
				allow_forced_downscale = true,
				surface = "nauvis",
				usage = "enemy",
			}),
		},
	}
end
local copper_tints = {
	--small = { r = 0.5, g = 0.3, b = 0.0, a = 1 },
	small = { r = 0.7, g = 0.36, b = 0.1, a = 1 },
	medium = { r = 0.7, g = 0.36, b = 0.1, a = 1 },
	big = { r = 0.7, g = 0.36, b = 0.1, a = 1 },
	behemoth = { r = 0.7, g = 0.36, b = 0.1, a = 1 },
	leviathan = { r = 0.7, g = 0.36, b = 0.1, a = 1 },
	--leviathan = { r = 0.9, g = 0.7, b = 0.3, a = 1 },
	spawner = { r = 0.7, g = 0.36, b = 0.1, a = 1 },
}
data:extend({
	{
		type = "unit",
		name = "small-copper-biter",
		icon = "__base__/graphics/icons/small-spitter.png",
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = 60,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.02,
		collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
		selection_box = { { -0.5, -0.7 }, { 0.5, 0.7 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.3, -0.5 }, { 0.3, 0.1 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
		resistances = {
			--{ type = "physical", decrease = 2, percent = 15 },
			--{ type = "explosion", decrease = 5 },
			{ type = "physical", decrease = 0, percent = 10 },
			{ type = "fire", decrease = 0, percent = 10 },
			{ type = "laser", decrease = 10, percent = 99 },
			{ type = "electric", decrease = 10, percent = 99 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-small",
			range = 15,
			min_attack_distance = 6,
			cooldown = 90,
			cooldown_deviation = 0.15,
			damage_modifier = 15,
			scale = 0.7,
			roarvolume = 0.6,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = copper_tints.small,
			tint2 = copper_tints.small,
		}),

		vision_distance = 30,
		movement_speed = 0.18,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { electromagnetic_waves = 1 },

		--corpse = "copper-biter-corpse",
		dying_explosion = "small-spitter-die",
		working_sound = sounds.spitter_calls_med(0.2, 0.53, copper_tints.small, copper_tints.small),
		dying_sound = sounds.spitter_dying_mid(0.65, copper_tints.small, copper_tints.small),
		run_animation = spitterrunanimation(0.7, copper_tints.small, copper_tints.small),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(0.7),
	},
})

-- ======================================================================
-- Medium Copper Spitter
-- ======================================================================
data:extend({
	{
		type = "unit",
		name = "medium-copper-biter",
		icon = "__base__/graphics/icons/medium-spitter.png",
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = 200,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.03,
		collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
		selection_box = { { -0.6, -0.9 }, { 0.6, 0.9 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.3, -0.6 }, { 0.3, 0.2 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
		resistances = {
			{ type = "physical", decrease = 1, percent = 10 },
			{ type = "fire", decrease = 2, percent = 30 },
			{ type = "laser", decrease = 10, percent = 95 },
			{ type = "electric", decrease = 10, percent = 95 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-medium",
			range = 16,
			min_attack_distance = 6,
			cooldown = 90,
			damage_modifier = 25,
			scale = 1.0,
			roarvolume = 0.7,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = copper_tints.medium,
			tint2 = copper_tints.medium,
		}),
		vision_distance = 30,
		movement_speed = 0.16,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { electromagnetic_waves = 6 },
		dying_explosion = "medium-spitter-die",
		working_sound = sounds.spitter_calls_med(0.3, 0.53, copper_tints.medium, copper_tints.medium),
		dying_sound = sounds.spitter_dying_mid(0.65, copper_tints.medium, copper_tints.medium),
		run_animation = spitterrunanimation(1.0, copper_tints.medium, copper_tints.medium),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(1.0),
	},
})

-- ======================================================================
-- Big Copper Spitter
-- ======================================================================
data:extend({
	{
		type = "unit",
		name = "big-copper-biter",
		icon = "__base__/graphics/icons/big-spitter.png",
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = 400,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.04,
		collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		selection_box = { { -0.7, -1.0 }, { 0.7, 1.0 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.4, -0.7 }, { 0.4, 0.2 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
		resistances = {
			{ type = "physical", decrease = 2, percent = 20 },
			{ type = "fire", decrease = 3, percent = 50 },
			{ type = "laser", decrease = 12, percent = 97 },
			{ type = "electric", decrease = 12, percent = 97 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-big",
			range = 18,
			min_attack_distance = 6,
			cooldown = 80,
			damage_modifier = 35,
			scale = 1.3,
			roarvolume = 0.8,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = copper_tints.big,
			tint2 = copper_tints.big,
		}),
		vision_distance = 30,
		movement_speed = 0.15,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { electromagnetic_waves = 15 },
		dying_explosion = "big-spitter-die",
		working_sound = sounds.spitter_calls_med(0.35, 0.53, copper_tints.big, copper_tints.big),
		dying_sound = sounds.spitter_dying_big(0.65, copper_tints.big, copper_tints.big),
		run_animation = spitterrunanimation(1.3, copper_tints.big, copper_tints.big),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(1.3),
	},
})

-- ======================================================================
-- Behemoth Copper Spitter
-- ======================================================================
data:extend({
	{
		type = "unit",
		name = "behemoth-copper-biter",
		icon = "__base__/graphics/icons/behemoth-spitter.png",
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = 2000,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.05,
		collision_box = { { -0.6, -0.6 }, { 0.6, 0.6 } },
		selection_box = { { -1.0, -1.2 }, { 1.0, 1.2 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.5, -0.8 }, { 0.5, 0.2 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
		resistances = {
			{ type = "physical", decrease = 5, percent = 30 },
			{ type = "fire", decrease = 3, percent = 70 },
			{ type = "laser", decrease = 15, percent = 99 },
			{ type = "electric", decrease = 15, percent = 99 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-behemoth",
			range = 18,
			min_attack_distance = 6,
			cooldown = 70,
			damage_modifier = 50,
			scale = 1.6,
			roarvolume = 1.0,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = copper_tints.behemoth,
			tint2 = copper_tints.behemoth,
		}),
		vision_distance = 30,
		movement_speed = 0.14,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { electromagnetic_waves = 50 },
		dying_explosion = "behemoth-spitter-die",
		working_sound = sounds.spitter_calls_med(0.4, 0.53, copper_tints.behemoth, copper_tints.behemoth),
		dying_sound = sounds.spitter_dying_big(0.65, copper_tints.behemoth, copper_tints.behemoth),
		run_animation = spitterrunanimation(1.6, copper_tints.behemoth, copper_tints.behemoth),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(1.6),
	},
})

-- ======================================================================
-- Leviathan Copper Spitter
-- ======================================================================
data:extend({
	{
		type = "unit",
		name = "leviathan-copper-biter",
		icon = "__base__/graphics/icons/behemoth-spitter.png", -- możesz zrobić własną ikonkę
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = 5000,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.08,
		collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
		selection_box = { { -1.2, -1.5 }, { 1.2, 1.5 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.6, -1.0 }, { 0.6, 0.2 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 60,
		resistances = {
			{ type = "physical", decrease = 10, percent = 50 },
			{ type = "explosion", decrease = 10, percent = 80 },
			{ type = "fire", decrease = 3, percent = 90 },
			{ type = "laser", decrease = 20, percent = 99 },
			{ type = "electric", decrease = 20, percent = 99 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-behemoth",
			range = 24,
			min_attack_distance = 6,
			cooldown = 60,
			damage_modifier = 100,
			scale = 2.0,
			roarvolume = 2,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = copper_tints.leviathan,
			tint2 = copper_tints.leviathan,
		}),
		vision_distance = 40,
		movement_speed = 0.10,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { electromagnetic_waves = 100 },
		dying_explosion = "behemoth-spitter-die",
		working_sound = sounds.spitter_calls_med(0.5, 0.53, copper_tints.leviathan, copper_tints.leviathan),
		dying_sound = sounds.spitter_dying_big(0.65, copper_tints.leviathan, copper_tints.leviathan),
		run_animation = spitterrunanimation(2.0, copper_tints.leviathan, copper_tints.leviathan),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(2.0),
	},
})
-- ----------------------------------------------------------------------
-- Corpse
-- ----------------------------------------------------------------------

--add_spitter_die_animation(0.7, { r = 1, g = 1, b = 1 }, { r = 1, g = 1, b = 1 }, {
--	type = "corpse",
--	name = "copper-biter-corpse",
--	icon = "__base__/graphics/icons/medium-spitter-corpse.png",
--	selectable_in_game = false,
--	selection_box = { { -1, -1 }, { 1, 1 } },
--	subgroup = "corpses",
--	order = "c[corpse]-b[spitter]-z[white]",
--	hidden_in_factoriopedia = true,
--	flags = { "placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map" },
--})

-- ----------------------------------------------------------------------
-- Spawner
-- ----------------------------------------------------------------------

data:extend({
	{
		type = "unit-spawner",
		name = "copper-biter-spawner",
		icon = "__base__/graphics/icons/spitter-spawner.png",
		flags = { "placeable-player", "placeable-enemy", "not-repairable" },
		max_health = 400,
		order = "b-d-z",
		subgroup = "enemies",
		resistances = {
			{ type = "physical", decrease = 2, percent = 15 },
			{ type = "explosion", decrease = 5, percent = 20 },
			{ type = "fire", decrease = 3, percent = 60 },
			{ type = "laser", decrease = 10, percent = 99 },
			{ type = "electric", decrease = 10, percent = 99 },
		},

		healing_per_tick = 0.02,

		collision_mask = {
			layers = { ["ground_tile"] = true, ["is_object"] = true, ["trigger_target"] = true },
		},
		--collision_mask = { layers = { water_tile = true } },
		collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } },
		selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
		damaged_trigger_effect = hit_effects.biter(),
		impact_category = "organic",
		corpse = "copper-biter-spawner-corpse",
		dying_explosion = "spitter-spawner-die",
		max_count_of_owned_units = 7,
		max_friends_around_to_spawn = 5,
		absorptions_per_second = { electromagnetic_waves = { absolute = 20, proportional = 0.01 } },
		captured_spawner_entity = "captive-copper-biter-spawner",
		graphics_set = {
			animations = {
				coper_spitter_spawner_idle_animation(0, copper_tints.spawner),
				coper_spitter_spawner_idle_animation(1, copper_tints.spawner),
				coper_spitter_spawner_idle_animation(2, copper_tints.spawner),
				coper_spitter_spawner_idle_animation(3, copper_tints.spawner),
			},
		},

		result_units = {
			{ "small-copper-biter", { { 0.0, 0.3 }, { 0.3, 0.0 } } },
			{ "medium-copper-biter", { { 0.3, 0.0 }, { 0.6, 0.3 }, { 0.7, 0.1 } } },
			{ "big-copper-biter", { { 0.6, 0.0 }, { 0.9, 0.3 } } },
			{ "behemoth-copper-biter", { { 0.9, 0.0 }, { 0.98, 0.3 } } },
			{ "leviathan-copper-biter", { { 0.98, 0.0 }, { 1.0, 0.4 } } },
		},

		spawning_cooldown = { 360, 150 },
		spawning_radius = 10,
		spawning_spacing = 3,
		max_spawn_shift = 0,
		max_richness_for_spawn_shift = 100,
		--autoplace = enemy_autoplace.enemy_spawner_autoplace("enemy_autoplace_base(0, 8)"),

		autoplace = {
			control = "copper-biter-base",
			order = "b[enemy]-a[spawner]",
			force = "enemy",
			probability_expression = "enemy_autoplace_base(0, 1)*0.02",
			richness_expression = 1,
		},
		call_for_help_radius = 50,
	},
})

-- ----------------------------------------------------------------------
-- Corpse
-- ----------------------------------------------------------------------

data:extend({
	{
		type = "corpse",
		name = "copper-biter-spawner-corpse",
		flags = { "placeable-neutral", "placeable-off-grid", "not-on-map" },
		icon = "__base__/graphics/icons/spitter-spawner-corpse.png",
		collision_box = { { -2, -2 }, { 2, 2 } },
		selection_box = { { -2, -2 }, { 2, 2 } },
		selectable_in_game = false,
		dying_speed = 0.015,
		time_before_removed = 15 * 60 * 60,
		subgroup = "corpses",
		order = "c[corpse]-c[copper-biter-spawner]",
		animation = {
			spawner_die_animation(0, spitter_spawner_tint),
			spawner_die_animation(1, spitter_spawner_tint),
			spawner_die_animation(2, spitter_spawner_tint),
			spawner_die_animation(3, spitter_spawner_tint),
		},
	},
})
-- ----------------------------------------------------------------------
-- autoplace-control
-- ----------------------------------------------------------------------

data:extend({
	{
		type = "autoplace-control",
		name = "copper-biter-base",
		localised_name = { "entity-name.copper-biter-spawner" },
		richness = false,
		order = "b[enemy]-z[white]",
		category = "enemy",
	},
})

-- ----------------------------------------------------------------------
-- captive-biter-spawner
-- ----------------------------------------------------------------------
data:extend({
	{
		type = "assembling-machine",
		name = "captive-copper-biter-spawner",
		icon = "__space-age__/graphics/icons/captive-biter-spawner.png",
		subgroup = "agriculture",
		flags = { "placeable-neutral", "placeable-player", "player-creation", "not-repairable", "not-deconstructable" },
		collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } },
		selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
		create_ghost_on_death = false,
		max_health = 350,
		show_recipe_icon = false,
		impact_category = "organic",
		production_health_effect = {
			not_producing = -1 / 60, -- 5 hp per second
			producing = 1 / 60, -- 5 hp per second
		},
		ignore_output_full = true,
		alert_icon_shift = util.by_pixel(0, -12),
		icon_draw_specification = { shift = { 0, -0.3 } },
		created_effect = {
			type = "direct",
			action_delivery = {
				type = "instant",
				source_effects = {
					type = "create-explosion",
					entity_name = "captive-spawner-explosion-1",
				},
			},
		},
		dying_explosion = "captive-spawner-explosion-2",
		dying_trigger_effect = {
			type = "create-entity",
			entity_name = "copper-biter-spawner",
			as_enemy = true,
			ignore_no_enemies_mode = true,
			protected = true,
		},
		resistances = {
			{
				type = "fire",
				percent = 70,
			},
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 1809,
				max = 1809,
			},
		},
		fast_replaceable_group = "captive-biter-spawner",
		graphics_set = {
			animation = {
				layers = {
					util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-anim", {
						frame_count = 32,
						scale = 0.5,
						animation_speed = 0.4,
					}),
					util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-shadow", {
						frame_count = 32,
						scale = 0.5,
						animation_speed = 0.4,
						draw_as_shadow = true,
					}),
				},
			},
			working_visualisations = {
				{
					fadeout = true,
					animation = util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-fluids", {
						frame_count = 32,
						scale = 0.5,
						tint = { 0.25, 0.44, 0, 1 },
						animation_speed = 0.4,
					}),
				},
			},
		},
		open_sound = sounds.mech_small_open,
		close_sound = sounds.mech_small_close,
		working_sound = {
			sound = { category = "enemy", filename = "__base__/sound/creatures/spawner.ogg", volume = 0.6 },
			sound_accents = {
				{
					sound = {
						variations = sound_variations(
							"__space-age__/sound/entity/spawner/spawner-respirator-push",
							3,
							0.3
						),
						audible_distance_modifier = 0.6,
					},
					frame = 1,
				},
				{
					sound = {
						variations = sound_variations(
							"__space-age__/sound/entity/spawner/spawner-respirator-pull",
							3,
							0.3
						),
						audible_distance_modifier = 0.6,
					},
					frame = 17,
				},
			},
		},
		crafting_categories = { "captive-spawner-process" },
		fixed_recipe = "copper-biter-egg",
		crafting_speed = 1,
		energy_source = {
			type = "burner",
			fuel_categories = { "food" },
			effectivity = 1,
			fuel_inventory_size = 1,
			emissions_per_minute = { pollution = -1 },
			burner_usage = "food",
			light_flicker = {
				minimum_intensity = 0,
				maximum_intensity = 0,
				derivation_change_frequency = 0,
				derivation_change_deviation = 0,
				border_fix_speed = 0,
				minimum_light_size = 0,
				light_intensity_to_size_coefficient = 0,
				color = { 0, 0, 0, 1 },
			},
		},
		energy_usage = "100kW",
		module_slots = 0,
		allowed_effects = {},
		collision_mask = { layers = { ["ground_tile"] = true, ["object"] = true } },
		enable_logistic_control_behavior = false,
	},
})

local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__base__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout
local grass_vehicle_speed_modifier = 1.6
-------------------------------------------------------------------------------
-- deepwater initialization (finished in data-final-fix)
local deepwater = table.deepcopy(data.raw.tile["deepwater"])
deepwater.name = "pelagos-deepsea"
deepwater.localised_name = { "tile-name.pelagos-deepsea" }
deepwater.map_color = { r = 0.165, g = 0.278, b = 0.306 }
deepwater.default_cover_tile = "wooden-platform"
--deepwater.effect_color = { 34, 123, 136 }
--deepwater.effect_color = { 24, 123, 136 }
--deepwater.effect_color_secondary = { 74, 163, 176 }
--deepwater.effect_color_secondary = { 64, 163, 176 }
data:extend({ deepwater })
-------------------------------------------------------------------------------
-- sand_transitions
-------------------------------------------------------------------------------
local sand_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,

		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,

		spritesheet = "__base__/graphics/terrain/water-transitions/sand.png",
		layout = tile_spritesheet_layout.transition_16_16_16_4_8_short,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-mask.png",
			--tile_height = 2,
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			u_transition_tile_height = 2,
			o_transition_count = 1,
		},
		background_mask_layout = tile_spritesheet_layout.simple_white_mask,
	},
	ground_to_out_of_map_transition,
}
local sand_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,

		spritesheet = "__base__/graphics/terrain/water-transitions/sand-transition.png",
		layout = tile_spritesheet_layout.transition_3_3_3_1_0_only_u_tall,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-to-land-mask.png",
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			o_transition_count = 0,
		},
		water_patch = patch_for_inner_corner_of_transition_between_transition,
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,

		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,

		spritesheet = "__base__/graphics/terrain/out-of-map-transition/sand-out-of-map-transition.png",
		layout = tile_spritesheet_layout.transition_3_3_3_1_0,
		overlay_enabled = false,
	},
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,

		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,

		spritesheet = "__base__/graphics/terrain/out-of-map-transition/sand-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-to-out-of-map-mask.png",
			o_transition_count = 0,
		},
		background_mask_layout = tile_spritesheet_layout.simple_3_3_3_1_0_three_way_edge_mask,
		draw_simple_outer_corner_over_diagonal = false,
		apply_waving_effect_on_background_mask = true,
		waving_effect_time_scale = 0.15 * 0.09,
		water_patch = patch_for_inner_corner_of_transition_between_transition,
	},
}

-------------------------------------------------------------------------------
-- sand_transitions
-------------------------------------------------------------------------------

data:extend({
	{
		name = "pelagos-sand-1",
		type = "tile",
		order = "b[natural]-c[sand]-a[sand-1]",
		subgroup = "nauvis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
			--probability_expression = "water_base(0,5)",
			probability_expression = "max(expression_in_range_base(-10, -10, 0.25, 0.15),\z
			                                   expression_in_range(5, inf, elevation, aux, -1.5, 0.5, 1.5, 1)) +\z
			                               noise_layer_noise(36)",
		},
		layer = 8,

		variants = tile_variations_template(
			"__base__/graphics/terrain/sand-1.png",
			"__base__/graphics/terrain/masks/transition-4.png",
			{
				max_size = 8,
				[2] = {
					probability = 0.39,
					weights = {
						0.025,
						0.010,
						0.013,
						0.025,
						0.025,
						0.100,
						0.100,
						0.005,
						0.010,
						0.010,
						0.005,
						0.005,
						0.001,
						0.015,
						0.020,
						0.020,
					},
				},
				[4] = {
					probability = 0.20,
					weights = {
						0.090,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.025,
						0.125,
						0.005,
						0.010,
						0.100,
						0.100,
						0.010,
						0.020,
						0.020,
					},
				},
				[8] = {
					probability = 0.10,
					weights = {
						0.090,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.025,
						0.125,
						0.005,
						0.010,
						0.100,
						0.100,
						0.010,
						0.020,
						0.020,
					},
				},
			}
		),

		transitions = sand_transitions,
		transitions_between_transitions = sand_transitions_between_transitions,

		walking_sound = tile_sounds.walking.sand,
		driving_sound = tile_sounds.driving.sand,
		map_color = { 138, 103, 58 },
		scorch_mark_color = { r = 0.588, g = 0.451, b = 0.272, a = 1.000 },
		absorptions_per_second = tile_pollution.sand,
		vehicle_friction_modifier = sand_vehicle_speed_modifier,

		trigger_effect = tile_trigger_effects.sand_trigger_effect(),
	},
	-----------//////////////////////////////////////////////////////////////SAND-2
	{
		name = "pelagos-sand-2",
		type = "tile",
		order = "b[natural]-c[sand]-b[sand-2]",
		subgroup = "nauvis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
			probability_expression = "water_base(5,10)",
			--probability_expression = "max(expression_in_range_base(-10, 0.15, 0.3, 0.2),\z
			--                                   expression_in_range_base(0.25, -10, 0.3, 0.15)) + noise_layer_noise(37)",
			--
		},
		layer = 9,

		variants = tile_variations_template(
			"__base__/graphics/terrain/sand-2.png",
			"__base__/graphics/terrain/masks/transition-4.png",
			{
				max_size = 8,
				[2] = {
					probability = 0.39,
					weights = {
						0.025,
						0.010,
						0.013,
						0.025,
						0.025,
						0.100,
						0.100,
						0.005,
						0.010,
						0.010,
						0.005,
						0.005,
						0.001,
						0.015,
						0.020,
						0.020,
					},
				},
				[4] = {
					probability = 0.20,
					weights = {
						0.090,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.025,
						0.125,
						0.005,
						0.010,
						0.100,
						0.100,
						0.010,
						0.020,
						0.020,
					},
				},
				[8] = {
					probability = 0.10,
					weights = {
						0.090,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.025,
						0.125,
						0.005,
						0.010,
						0.100,
						0.100,
						0.010,
						0.020,
						0.020,
					},
				},
			}
		),
		factoriopedia_alternative = "sand-1",

		transitions = sand_transitions,
		transitions_between_transitions = sand_transitions_between_transitions,

		walking_sound = tile_sounds.walking.sand,
		driving_sound = tile_sounds.driving.sand,
		map_color = { 128, 93, 52 },
		scorch_mark_color = { r = 0.600, g = 0.440, b = 0.252, a = 1.000 },
		absorptions_per_second = tile_pollution.sand,
		vehicle_friction_modifier = sand_vehicle_speed_modifier,

		trigger_effect = tile_trigger_effects.sand_trigger_effect(),
	},
})

-------------------------------------------------------------------------------
-- pelagos-sand-3
-------------------------------------------------------------------------------
---
data:extend({
	{
		name = "pelagos-sand-3",
		type = "tile",
		order = "b[natural]-c[sand]-c[sand-3]",
		subgroup = "nauvis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {

			probability_expression = "max(expression_in_range_base(-10, -10, 0.05, 0.15), expression_in_range_base(0.25, -10, 0.3, 0.15)) + noise_layer_noise(46)",
			--probability_expression = "max(expression_in_range_base(-10, 0.2, 0.4, 0.25), expression_in_range_base(0.3, -10, 0.4, 0.2)) + noise_layer_noise(49)",
		},
		layer = 10,
		variants = tile_variations_template(
			"__base__/graphics/terrain/sand-3.png",
			"__base__/graphics/terrain/masks/transition-4.png",
			{
				max_size = 4,
				[1] = {
					weights = {
						0.085,
						0.085,
						0.085,
						0.085,
						0.087,
						0.085,
						0.065,
						0.085,
						0.045,
						0.045,
						0.045,
						0.045,
						0.005,
						0.025,
						0.045,
						0.045,
					},
				},
				[2] = {
					probability = 0.39,
					weights = {
						0.025,
						0.010,
						0.013,
						0.025,
						0.025,
						0.100,
						0.100,
						0.005,
						0.010,
						0.010,
						0.005,
						0.005,
						0.001,
						0.015,
						0.020,
						0.020,
					},
				},
				[4] = {
					probability = 0.39,
					weights = {
						0.025,
						0.010,
						0.013,
						0.025,
						0.025,
						0.100,
						0.100,
						0.005,
						0.010,
						0.010,
						0.005,
						0.005,
						0.001,
						0.015,
						0.020,
						0.020,
					},
				},
				--[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
			}
		),
		factoriopedia_alternative = "sand-1",

		transitions = sand_transitions,
		transitions_between_transitions = sand_transitions_between_transitions,

		walking_sound = tile_sounds.walking.sand,
		driving_sound = tile_sounds.driving.sand,
		map_color = { 115, 83, 47 },
		scorch_mark_color = { r = 0.620, g = 0.472, b = 0.279, a = 1.000 },
		absorptions_per_second = tile_pollution.sand,
		vehicle_friction_modifier = sand_vehicle_speed_modifier,

		trigger_effect = tile_trigger_effects.sand_trigger_effect(),
	},
})
-------------------------------------------------------------------------------
-- pelagos-red-desert-3 (sand-4)
-------------------------------------------------------------------------------
data:extend({
	{
		name = "pelagos-sand-4",
		type = "tile",
		order = "b[natural]-d[red-desert]-d[red-desert-3]",
		subgroup = "nauvis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
			--probability_expression = "max(expression_in_range_base(-10, -10, 0.05, 0.15),\z
			probability_expression = "max(expression_in_range_base(-10, -10, 0.05, 0.15), expression_in_range_base(0.25, -10, 0.3, 0.15)) + noise_layer_noise(47)", --50
		},
		--autoplace = { probability_expression = "expression_in_range_base(0.8, -10, 11, 0.2) + noise_layer_noise(33)" },
		--
		layer = 16,
		variants = tile_variations_template(
			"__base__/graphics/terrain/red-desert-3.png",
			"__base__/graphics/terrain/masks/transition-1.png",
			{
				max_size = 4,
				[1] = {
					weights = {
						0.085,
						0.085,
						0.085,
						0.085,
						0.087,
						0.085,
						0.065,
						0.085,
						0.045,
						0.045,
						0.045,
						0.045,
						0.005,
						0.025,
						0.045,
						0.045,
					},
				},
				[2] = {
					probability = 1,
					weights = {
						0.070,
						0.070,
						0.025,
						0.070,
						0.070,
						0.070,
						0.007,
						0.025,
						0.070,
						0.050,
						0.015,
						0.026,
						0.030,
						0.005,
						0.070,
						0.027,
					},
				},
				[4] = {
					probability = 1.00,
					weights = {
						0.070,
						0.070,
						0.070,
						0.070,
						0.070,
						0.070,
						0.015,
						0.070,
						0.070,
						0.070,
						0.015,
						0.050,
						0.070,
						0.070,
						0.065,
						0.070,
					},
				},
				[8] = {
					probability = 1.00,
					weights = {
						0.090,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.125,
						0.025,
						0.125,
						0.005,
						0.010,
						0.100,
						0.100,
						0.010,
						0.020,
						0.020,
					},
				},
			}
		),
		factoriopedia_alternative = "pelagos-sand-4",

		transitions = sand_transitions,
		transitions_between_transitions = sand_transitions_between_transitions,

		walking_sound = tile_sounds.walking.sand,
		map_color = { 128, 93, 52 },
		scorch_mark_color = { r = 0.604, g = 0.447, b = 0.263, a = 1.000 },
		absorptions_per_second = tile_pollution.red_desert,
		vehicle_friction_modifier = grass_vehicle_speed_modifier,

		trigger_effect = tile_trigger_effects.red_desert_3_trigger_effect(),
	},
})

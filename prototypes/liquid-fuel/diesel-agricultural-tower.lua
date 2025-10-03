local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
	{
		type = "item",
		name = "diesel-agricultural-tower",
		icon = "__space-age__/graphics/icons/agricultural-tower.png",
		subgroup = "agriculture",
		order = "a[agricultural-tower]",
		inventory_move_sound = item_sounds.mechanical_large_inventory_move,
		pick_sound = item_sounds.mechanical_large_inventory_pickup,
		drop_sound = item_sounds.mechanical_large_inventory_move,
		place_result = "diesel-agricultural-tower",
		stack_size = 20,
		default_import_location = "pelagos",
	},
	{
		type = "agricultural-tower",
		name = "diesel-agricultural-tower",
		icon = "__space-age__/graphics/icons/agricultural-tower.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.2, result = "diesel-agricultural-tower" },
		fast_replaceable_group = "agricultural-tower",
		max_health = 500,
		corpse = "agricultural-tower-remnants",
		dying_explosion = "agricultural-tower-explosion",
		open_sound = sounds.mech_large_open,
		close_sound = sounds.mech_large_close,
		input_inventory_size = 3,
		radius_visualisation_picture = {
			filename = "__core__/graphics/white-square.png",
			priority = "extra-high-no-scale",
			width = 10,
			height = 10,
		},
		radius = 3,
		crane = require("__pelagos__.prototypes.liquid-fuel.diesel-agricultural-tower-crane"),
		planting_procedure_points = {
			{ 0.0, 0.0, 0.75 },
			{ 0.0, 0.0, 0.0 },
			{ 0.0, 0.05, -0.05 },
			{ 0.0353553, 0.0353553, -0.1 },
			{ 0.05, 0.0, -0.15 },
			{ 0.0353553, -0.0353553, -0.2 },
			{ 0.0, -0.05, -0.25 },
			{ -0.0353553, -0.0353553, -0.3 },
			{ -0.05, 0.0, -0.35 },
			{ -0.0353553, 0.0353553, -0.4 },
			{ 0.0, 0.0, -0.45 },
			{ 0.0, 0.0, 0.0 },
		},
		harvesting_procedure_points = {
			{ 0.0, 0.0, 1.0 },
		},
		drawing_box_vertical_extension = 2.5,
		heating_energy = "100kW",
		energy_usage = "100kW",
		crane_energy_usage = "100kW",
		working_sound = {
			sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-hub-loop.ogg",
				volume = 0.7,
				audible_distance_modifier = 0.7,
			},
			max_sounds_per_prototype = 4,
			fade_in_ticks = 4,
			fade_out_ticks = 20,
		},
		central_orienting_sound = {
			sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-loop.ogg",
				volume = 0.3,
			},
			stopped_sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-stop.ogg",
				volume = 0.5,
			},
		},
		central_orienting_sound_source = "hub",
		arm_extending_sound = {
			sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-loop.ogg",
				volume = 0.25,
			},
			stopped_sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-stop.ogg",
				volume = 0.6,
			},
		},
		arm_extending_sound_source = "arm_central_joint",
		grappler_orienting_sound = {
			sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-loop.ogg",
				volume = 0.25,
			},
			stopped_sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-stop.ogg",
				volume = 0.4,
			},
		},
		grappler_orienting_sound_source = "grappler-hub",
		grappler_extending_sound = {
			sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-loop.ogg",
				volume = 0.4,
			},
			stopped_sound = {
				filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-stop.ogg",
				volume = 0.45,
			},
		},
		grappler_extending_sound_source = "grappler-hub",
		planting_sound = sound_variations(
			"__space-age__/sound/entity/agricultural-tower/agricultural-tower-planting",
			5,
			0.7
		),
		harvesting_sound = sound_variations(
			"__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting",
			6,
			0.6
		),
		resistances = {
			{
				type = "fire",
				percent = 100,
			},
		},
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		collision_mask = {
			layers = {
				item = true,
				object = true,
				player = true,
				water_tile = true,
				elevated_rail = true,
				is_object = true,
				is_lower_object = true,
			},
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 1000,
				max = 2000,
			},
		},
		damaged_trigger_effect = hit_effects.entity(),
		energy_source = {
			type = "fluid",
			burns_fluid = true, -- fluid used as power
			scale_fluid_usage = true,
			fluid_box = {
				--pipe_covers = pipecoverspictures(),
				--pipe_picture = dieselassemblingmachinepipes(),
				pipe_covers = pipecoverspictures(),
				always_draw_covers = false,
				volume = 100,
				pipe_connections = {
					{ direction = defines.direction.west, position = { -1, 0 } },
					{ direction = defines.direction.east, position = { 1, 0 } },
					{ direction = defines.direction.north, position = { 0, -1 } },
					{ direction = defines.direction.south, position = { 0, 1 } },
				},
				production_type = "input-output",
			},
			-- need to fix position on rotation
			smoke = {
				{
					name = "smoke",
					frequency = 5,
					position = { 0, 10 },
					starting_vertical_speed = 0.10, --base 0.08
					starting_frame_deviation = 60,
				},
			},
			emissions_per_minute = { pollution = 10 }, --12 is burner drill ,10 is electric drill
		},
		circuit_connector = circuit_connector_definitions["agricultural-tower"],
		circuit_wire_max_distance = 30,
		graphics_set = {
			animation = {
				layers = {
					util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base", {
						priority = "high",
						animation_speed = 0.25,
						frame_count = 64,
						scale = 0.5,
					}),
					util.sprite_load(
						"__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-shadow",
						{
							priority = "high",
							frame_count = 1,
							repeat_count = 64,
							draw_as_shadow = true,
							scale = 0.5,
						}
					),
				},
			},
			recipe_not_set_tint = {
				primary = { r = 0.6, g = 0.6, b = 0.5, a = 1 },
				secondary = { r = 0.6, g = 0.6, b = 0.5, a = 1 },
			},
			working_visualisations = {
				{
					always_draw = true,
					fog_mask = { rect = { { -30, -30 }, { 30, -2.75 } }, falloff = 1 },
					animation = util.sprite_load(
						"__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
						{
							frame_count = 1,
							scale = 0.5,
						}
					),
				},

				{
					--constant_speed = true,
					always_draw = true,
					apply_recipe_tint = "primary",
					animation = util.sprite_load(
						"__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-plant-mask",
						{
							priority = "high",
							frame_count = 64,
							animation_speed = 0.25,
							tint_as_overlay = true,
							scale = 0.5,
						}
					),
				},
				{
					--constant_speed = true,
					apply_recipe_tint = "secondary",
					effect = "flicker",
					fadeout = true,
					animation = util.sprite_load(
						"__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-light",
						{
							priority = "high",
							frame_count = 64,
							animation_speed = 0.25,
							blend_mode = "additive",
							scale = 0.5,
						}
					),
				},
				{
					effect = "flicker",
					fadeout = true,
					light = { intensity = 1.0, size = 6, shift = { -0.45, -0.25 }, color = { r = 1, g = 1, b = 1 } },
				},
				{
					apply_recipe_tint = "secondary",
					effect = "flicker",
					fadeout = true,
					light = { intensity = 1.0, size = 16, shift = { -1.2, -0.5 }, color = { r = 1, g = 1, b = 1 } },
				},
			},
			water_reflection = {
				pictures = {
					filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-reflection.png",
					priority = "extra-high",
					width = 24,
					height = 36,
					shift = util.by_pixel(0, 20),
					variation_count = 1,
					scale = 5,
				},
				rotate = false,
				orientation_to_variation = false,
			},
		},
	},
})

require("__base__.prototypes.entity.pipecovers")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({

	{
		type = "item",
		name = "diesel-pump",
		icon = "__pelagos__/graphics/diesel-pump.png",
		subgroup = "energy-pipe-distribution",
		order = "b[pipe]-c[pump]",
		inventory_move_sound = item_sounds.fluid_inventory_move,
		pick_sound = item_sounds.fluid_inventory_pickup,
		drop_sound = item_sounds.fluid_inventory_move,
		place_result = "diesel-pump",
		stack_size = 50,
		default_import_location = "pelagos",
		weight = 20 * kg,
		random_tint_color = item_tints.iron_rust,
	},
	{
		type = "pump",
		name = "diesel-pump",
		icon = "__pelagos__/graphics/diesel-pump.png",
		flags = { "placeable-neutral", "player-creation" },
		minable = { mining_time = 0.2, result = "diesel-pump" },
		max_health = 180,
		--fast_replaceable_group = "pipe",
		corpse = "pump-remnants",
		dying_explosion = "pump-explosion",
		collision_box = { { -0.29, -0.9 }, { 0.29, 0.9 } },
		selection_box = { { -0.5, -1 }, { 0.5, 1 } },
		icon_draw_specification = { scale = 0.5 },
		working_sound = {
			sound = { filename = "__base__/sound/pump.ogg", volume = 0.3, audible_distance_modifier = 0.5 },
			max_sounds_per_prototype = 2,
		},
		damaged_trigger_effect = hit_effects.entity(),
		resistances = {
			{
				type = "fire",
				percent = 80,
			},
			{
				type = "impact",
				percent = 30,
			},
		},
		fluid_box = {
			volume = 400,
			--pipe_picture = dieseldrillpipepictures(),
			pipe_covers = pipecoverspictures(),
			pipe_connections = {
				{ direction = defines.direction.north, position = { 0, -0.5 }, flow_direction = "output" },
				{ direction = defines.direction.south, position = { 0, 0.5 }, flow_direction = "input" },
			},
		},
		energy_source = {

			type = "fluid",
			burns_fluid = true, -- fluid used as power
			scale_fluid_usage = true,
			fluid_box = {
				pipe_covers = pipecoverspictures(),
				--pipe_picture = assemblerpipepictures(),
				always_draw_covers = true,
				volume = 100,
				pipe_connections = {
					{ direction = defines.direction.west, position = { 0, 0.5 } },
					{ direction = defines.direction.east, position = { 0, 0.5 } },
				},
				production_type = "input-output",
			},

			smoke = {
				{
					-- not enough ?
					name = "smoke",
					frequency = 5,
					position = { 0, 0 },
					starting_vertical_speed = 0.1, --base 0.08
					starting_frame_deviation = 60,
				},
			},
			emissions_per_minute = { pollution = 2 }, --12 is burner drill
		},
		--energy_usage = "29kW",
		--energy_usage = "50kW",
		energy_usage = "20kW",
		pumping_speed = 20,
		impact_category = "metal",
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close,

		animations = {
			north = {
				filename = "__pelagos__/graphics/diesel-pump/pump-north.png",
				width = 103,
				height = 164,
				scale = 0.5,
				line_length = 8,
				frame_count = 32,
				animation_speed = 0.5,
				shift = util.by_pixel(8, -0.85),
			},
			east = {

				filename = "__pelagos__/graphics/diesel-pump/pump-east.png",
				width = 130,
				height = 109,
				scale = 0.5,
				line_length = 8,
				frame_count = 32,
				animation_speed = 0.5,
				shift = util.by_pixel(-0.5, 1.75),
			},

			south = {
				filename = "__pelagos__/graphics/diesel-pump/pump-south.png",
				width = 114,
				height = 160,
				scale = 0.5,
				line_length = 8,
				frame_count = 32,
				animation_speed = 0.5,
				shift = util.by_pixel(12.5, -8),
			},
			west = {
				filename = "__pelagos__/graphics/diesel-pump/pump-west.png",
				width = 131,
				height = 111,
				scale = 0.5,
				line_length = 8,
				frame_count = 32,
				animation_speed = 0.5,
				shift = util.by_pixel(-0.25, 1.25),
			},
		},

		fluid_wagon_connector_frame_count = 35,
		fluid_wagon_connector_alignment_tolerance = 2.0 / 32.0,

		fluid_wagon_connector_graphics = require("diesel-pump-connector"),

		fluid_animation = {
			north = {
				filename = "__base__/graphics/entity/pump/pump-north-liquid.png",
				apply_runtime_tint = true,
				width = 38,
				height = 22,
				scale = 0.5,
				line_length = 8,
				frame_count = 32,
				shift = util.by_pixel(-0.250, -16.750),
			},

			east = {
				filename = "__base__/graphics/entity/pump/pump-east-liquid.png",
				width = 35,
				height = 46,
				scale = 0.5,
				line_length = 8,
				frame_count = 32,
				shift = util.by_pixel(6.25, -8.5),
			},

			south = {
				filename = "__base__/graphics/entity/pump/pump-south-liquid.png",
				width = 38,
				height = 45,
				scale = 0.5,
				line_length = 8,
				frame_count = 32,
				shift = util.by_pixel(0.5, -9.25),
			},
			west = {
				filename = "__base__/graphics/entity/pump/pump-west-liquid.png",
				width = 35,
				height = 47,
				scale = 0.5,
				line_length = 8,
				frame_count = 32,
				shift = util.by_pixel(-6.5, -9.5),
			},
		},

		glass_pictures = {
			north = {
				filename = "__base__/graphics/entity/pump/pump-north-glass.png",
				width = 64,
				height = 128,
				scale = 0.5,
			},
			east = {
				filename = "__base__/graphics/entity/pump/pump-east-glass.png",
				width = 128,
				height = 192,
				scale = 0.5,
			},
			south = {
				filename = "__base__/graphics/entity/pump/pump-south-glass.png",
				width = 64,
				height = 128,
				scale = 0.5,
			},
			west = {
				filename = "__base__/graphics/entity/pump/pump-west-glass.png",
				width = 192,
				height = 192,
				scale = 0.5,
				shift = util.by_pixel(-16, 0),
			},
		},

		circuit_connector = circuit_connector_definitions["pump"],
		circuit_wire_max_distance = default_circuit_wire_max_distance,
	},
})

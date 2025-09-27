local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
data:extend({

	{
		type = "item",
		name = "lighthouse",
		icon = "__base__/graphics/icons/radar.png",
		subgroup = "defensive-structure",
		order = "d[radar]-a[radar]",
		inventory_move_sound = item_sounds.metal_large_inventory_move,
		pick_sound = item_sounds.metal_large_inventory_pickup,
		drop_sound = item_sounds.metal_large_inventory_move,
		place_result = "lighthouse",
		default_import_location = "pelagos",
		weight = 20 * kg,
		stack_size = 50,
		random_tint_color = item_tints.iron_rust,
	},

	{
		type = "radar",
		name = "lighthouse",
		icon = "__base__/graphics/icons/radar.png",
		flags = { "placeable-player", "player-creation" },
		minable = { mining_time = 0.1, result = "lighthouse" },
		fast_replaceable_group = "radar",
		max_health = 250,
		corpse = "radar-remnants",
		dying_explosion = "radar-explosion",
		resistances = {
			{
				type = "fire",
				percent = 70,
			},
			{
				type = "impact",
				percent = 30,
			},
		},
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		damaged_trigger_effect = hit_effects.entity(),
		--energy_per_sector = "10MJ",
		energy_per_sector = "1MJ",
		--max_distance_of_sector_revealed = 14,--vanilla
		--max_distance_of_sector_revealed = 36,--maraxsis sonar
		max_distance_of_sector_revealed = 42,
		--max_distance_of_nearby_sector_revealed = 3,--vanilla
		--max_distance_of_nearby_sector_revealed = 6,--maraxsis sonar
		max_distance_of_nearby_sector_revealed = 1,
		energy_per_nearby_scan = "250kJ",
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
					--{ direction = defines.direction.east, position = { 1, 0 } },
				},
				production_type = "input",
			},
			-- need to fix position on rotation
			smoke = {
				{
					name = "smoke",
					frequency = 10,
					position = { 0, 0 },
					starting_vertical_speed = 0.06, --base 0.08
					starting_frame_deviation = 60,
				},
			},
			emissions_per_minute = { pollution = 10 }, --12 is burner drill ,10 is electric drill
		},
		energy_usage = "300kW",
		integration_patch = {
			filename = "__base__/graphics/entity/radar/radar-integration.png",
			priority = "low",
			width = 238,
			height = 216,
			shift = util.by_pixel(1.5, 4.0),
			scale = 0.5,
		},
		pictures = {
			layers = {
				{
					filename = "__base__/graphics/entity/radar/radar.png",
					priority = "low",
					width = 196,
					height = 254,
					apply_projection = false,
					direction_count = 64,
					line_length = 8,
					shift = util.by_pixel(1.0, -16.0),
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/radar/radar-shadow.png",
					priority = "low",
					width = 336,
					height = 170,
					apply_projection = false,
					direction_count = 64,
					line_length = 8,
					shift = util.by_pixel(39.0, 6.0),
					draw_as_shadow = true,
					scale = 0.5,
				},
			},
		},
		impact_category = "metal",
		working_sound = {
			sound = {
				filename = "__base__/sound/radar.ogg",
				volume = 0.8,
				modifiers = volume_multiplier("main-menu", 2.0),
			},
			max_sounds_per_prototype = 3,
			use_doppler_shift = false,
		},
		radius_minimap_visualisation_color = { 0.059, 0.092, 0.235, 0.275 },
		rotation_speed = 0.01,
		water_reflection = {
			pictures = {
				filename = "__base__/graphics/entity/radar/radar-reflection.png",
				priority = "extra-high",
				width = 28,
				height = 32,
				shift = util.by_pixel(5, 35),
				variation_count = 1,
				scale = 5,
			},
			rotate = false,
			orientation_to_variation = false,
		},
		is_military_target = false,
		circuit_connector = circuit_connector_definitions["radar"],
		circuit_wire_max_distance = default_circuit_wire_max_distance,
	},
})

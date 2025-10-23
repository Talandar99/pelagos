require("__base__.prototypes.entity.pipecovers")
local item_sounds = require("__base__.prototypes.item_sounds")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
data:extend({
	{
		type = "item",
		name = "fast-diesel-inserter",
		icon = "__pelagos__/graphics/fast-diesel-inserter-engine.png",
		subgroup = "inserter",
		color_hint = { text = "L" },
		order = "cd[diesel-inserter]",
		inventory_move_sound = item_sounds.inserter_inventory_move,
		pick_sound = item_sounds.inserter_inventory_pickup,
		drop_sound = item_sounds.inserter_inventory_move,
		place_result = "fast-diesel-inserter",
		default_import_location = "pelagos",
		weight = 20 * kg,
		stack_size = 50,
	},
	{
		type = "inserter",
		name = "fast-diesel-inserter",
		icon = "__pelagos__/graphics/fast-diesel-inserter-engine.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.1, result = "fast-diesel-inserter" },
		max_health = 150,
		corpse = "inserter-remnants",
		dying_explosion = "inserter-explosion",
		resistances = {
			{
				type = "fire",
				percent = 90,
			},
		},
		collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } },
		selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } },
		damaged_trigger_effect = hit_effects.entity(),
		pickup_position = { 0, -1 },
		insert_position = { 0, 1.2 },
		energy_per_movement = "7kJ",
		energy_per_rotation = "7kJ",
		energy_source = {
			type = "fluid",
			burns_fluid = true, -- fluid used as power
			scale_fluid_usage = true,
			fluid_box = {
				--pipe_covers = pipecoverspictures(),
				pipe_picture = dieselassemblingmachinepipes(),
				pipe_covers = pipecoverspictures(),
				always_draw_covers = false,
				volume = 100,
				pipe_connections = {
					{ direction = defines.direction.north, position = { 0, 0 } },
					{ direction = defines.direction.south, position = { 0, 0 } },
					{ direction = defines.direction.west, position = { 0, 0 } },
					{ direction = defines.direction.east, position = { 0, 0 } },
				},
				production_type = "input-output",
			},
			-- need to fix position on rotation
			smoke = {
				{
					name = "smoke",
					frequency = 3,
					position = { 0, 0 },
					starting_vertical_speed = 0.1, --base 0.08
					starting_frame_deviation = 60,
				},
			},
		},
		extension_speed = 0.1,
		rotation_speed = 0.04,
		filter_count = 5,
		icon_draw_specification = { scale = 0.5 },
		fast_replaceable_group = "inserter",
		next_upgrade = "bulk-inserter",
		impact_category = "metal",
		open_sound = sounds.inserter_open,
		close_sound = sounds.inserter_close,
		working_sound = sounds.inserter_fast,
		hand_base_picture = {
			filename = "__pelagos__/graphics/fast-diesel-inserter/fast-inserter-hand-base.png",
			priority = "extra-high",
			width = 32,
			height = 136,
			scale = 0.25,
		},
		hand_closed_picture = {
			filename = "__pelagos__/graphics/fast-diesel-inserter/fast-inserter-hand-closed.png",
			priority = "extra-high",
			width = 72,
			height = 164,
			scale = 0.25,
		},
		hand_open_picture = {
			filename = "__pelagos__/graphics/fast-diesel-inserter/fast-inserter-hand-open.png",
			priority = "extra-high",
			width = 72,
			height = 164,
			scale = 0.25,
		},
		hand_base_shadow = {
			filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
			priority = "extra-high",
			width = 32,
			height = 132,
			scale = 0.25,
		},
		hand_closed_shadow = {
			filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
			priority = "extra-high",
			width = 72,
			height = 164,
			scale = 0.25,
		},
		hand_open_shadow = {
			filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
			priority = "extra-high",
			width = 72,
			height = 164,
			scale = 0.25,
		},
		platform_picture = {
			sheet = {
				filename = "__pelagos__/graphics/fast-diesel-inserter/fast-inserter-platform.png",
				priority = "extra-high",
				width = 105,
				height = 79,
				shift = util.by_pixel(1.5, 7.5 - 1),
				scale = 0.1,
			},
		},
		circuit_connector = circuit_connector_definitions["inserter"],
		circuit_wire_max_distance = inserter_circuit_wire_max_distance,
		default_stack_control_input_signal = inserter_default_stack_control_input_signal,
	},
})

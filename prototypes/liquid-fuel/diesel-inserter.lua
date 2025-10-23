require("__base__.prototypes.entity.pipecovers")
local item_sounds = require("__base__.prototypes.item_sounds")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
data:extend({
	{
		type = "item",
		name = "diesel-inserter",
		icon = "__pelagos__/graphics/diesel-long-handed-inserter/diesel-inserter-engine.png",
		subgroup = "inserter",
		color_hint = { text = "L" },
		order = "cd[diesel-inserter]",
		inventory_move_sound = item_sounds.inserter_inventory_move,
		pick_sound = item_sounds.inserter_inventory_pickup,
		drop_sound = item_sounds.inserter_inventory_move,
		place_result = "diesel-inserter",
		default_import_location = "pelagos",
		weight = 20 * kg,
		stack_size = 50,
	},
	{
		type = "inserter",
		name = "diesel-inserter",
		icon = "__pelagos__/graphics/diesel-long-handed-inserter/diesel-inserter-engine.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.1, result = "diesel-inserter" },
		max_health = 160,
		corpse = "fast-inserter-remnants",
		dying_explosion = "fast-inserter-explosion",
		resistances = {
			{
				type = "fire",
				percent = 90,
			},
		},
		collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } },
		selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } },
		damaged_trigger_effect = hit_effects.entity(),
		starting_distance = 2.7,
		pickup_position = { 0, -3 },
		insert_position = { 0, 3.2 },
		energy_per_movement = "20kJ", --was 5
		energy_per_rotation = "20kJ",
		extension_speed = 0.05,
		rotation_speed = 0.02,
		filter_count = 5,
		icon_draw_specification = { scale = 0.5 },
		hand_size = 2, --was 1.5
		--energy_source = {
		--	type = "electric",
		--	usage_priority = "secondary-input",
		--	drain = "0.4kW",
		--},
		--
		energy_source = {

			type = "fluid",
			burns_fluid = true, -- fluid used as power
			scale_fluid_usage = true,
			fluid_box = {
				--pipe_covers = pipecoverspictures(),
				pipe_picture = dieseldrillpipepictures(),
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
		fast_replaceable_group = "long-handed-inserter",
		impact_category = "metal",
		open_sound = sounds.inserter_open,
		close_sound = sounds.inserter_close,
		working_sound = sounds.inserter_long_handed,
		hand_base_picture = {
			filename = "__pelagos__/graphics/diesel-long-handed-inserter/diesel-long-handed-inserter-hand-base.png",
			priority = "extra-high",
			width = 32,
			height = 208,
			scale = 0.25,
		},
		hand_closed_picture = {
			filename = "__pelagos__/graphics/diesel-long-handed-inserter/diesel-long-handed-inserter-hand-closed.png",
			priority = "extra-high",
			width = 72,
			height = 232,
			scale = 0.25,
		},
		hand_open_picture = {
			filename = "__pelagos__/graphics/diesel-long-handed-inserter/diesel-long-handed-inserter-hand-open.png",
			priority = "extra-high",
			width = 72,
			height = 232,
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
				filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-platform.png",
				priority = "extra-high",
				width = 105,
				height = 79,
				shift = util.by_pixel(1.5, 7.5 - 1),
				scale = 0.01,
			},
		},
		circuit_connector = circuit_connector_definitions["inserter"],
		circuit_wire_max_distance = inserter_circuit_wire_max_distance,
		default_stack_control_input_signal = inserter_default_stack_control_input_signal,
	},
})

require("__base__.prototypes.entity.pipecovers")
local item_sounds = require("__base__.prototypes.item_sounds")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function dieselassemblingmachinepipes()
	return {
		north = {
			filename = "__pelagos__/graphics/diesel-assembling-machine/diesel-assembling-machine-pipe-N.png",
			priority = "extra-high",
			width = 71,
			height = 38,
			shift = util.by_pixel(2.25, 13.5),
			scale = 0.5,
		},
		east = {
			filename = "__pelagos__/graphics/diesel-assembling-machine/diesel-assembling-machine-pipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__pelagos__/graphics/diesel-assembling-machine/diesel-assembling-machine-pipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__pelagos__/graphics/diesel-assembling-machine/diesel-assembling-machine-pipe-W.png",
			priority = "extra-high",
			width = 39,
			height = 73,
			shift = util.by_pixel(25.75, 1.25),
			scale = 0.5,
		},
	}
end

data:extend({

	{
		type = "item",
		name = "diesel-assembling-machine",
		icon = "__pelagos__/graphics/diesel-assembling-machine.png",
		subgroup = "production-machine",
		color_hint = { text = "2" },
		order = "b[diesel-assembling-machine]",
		inventory_move_sound = item_sounds.mechanical_inventory_move,
		pick_sound = item_sounds.mechanical_inventory_pickup,
		drop_sound = item_sounds.mechanical_inventory_move,
		default_import_location = "pelagos",
		weight = 40 * kg,
		place_result = "diesel-assembling-machine",
		stack_size = 50,
	},

	{
		type = "assembling-machine",
		name = "diesel-assembling-machine",
		icon = "__pelagos__/graphics/diesel-assembling-machine.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.2, result = "diesel-assembling-machine" },
		max_health = 350,
		corpse = "assembling-machine-2-remnants",
		dying_explosion = "assembling-machine-2-explosion",
		icon_draw_specification = { shift = { 0, -0.3 } },
		circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
		circuit_connector = circuit_connector_definitions["assembling-machine"],
		alert_icon_shift = util.by_pixel(0, -12),
		resistances = {
			{
				type = "fire",
				percent = 70,
			},
		},
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections = {
					{ flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } },
				},
				secondary_draw_orders = { north = -1 },
			},
			{
				production_type = "output",
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections = {
					{ flow_direction = "output", direction = defines.direction.south, position = { 0, 1 } },
				},
				secondary_draw_orders = { north = -1 },
			},
		},
		fluid_boxes_off_when_no_fluid_recipe = true,
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		damaged_trigger_effect = hit_effects.entity(),
		fast_replaceable_group = "assembling-machine",
		next_upgrade = "assembling-machine-3",
		graphics_set = {
			animation = {
				layers = {
					{
						filename = "__pelagos__/graphics/diesel-assembling-machine/diesel-assembling-machine.png",
						priority = "high",
						width = 214,
						height = 218,
						frame_count = 32,
						line_length = 8,
						shift = util.by_pixel(0, 4),
						scale = 0.5,
					},
					{
						filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
						priority = "high",
						width = 196,
						height = 163,
						frame_count = 32,
						line_length = 8,
						draw_as_shadow = true,
						shift = util.by_pixel(12, 4.75),
						scale = 0.5,
					},
				},
			},
		},
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close,
		impact_category = "metal",
		working_sound = {
			sound = {
				filename = "__base__/sound/assembling-machine-t2-1.ogg",
				volume = 0.45,
				audible_distance_modifier = 0.5,
			},
			fade_in_ticks = 4,
			fade_out_ticks = 20,
		},
		crafting_categories = {
			"basic-crafting",
			"crafting",
			"advanced-crafting",
			"crafting-with-fluid",
			"electronics",
			"crafting-with-fluid-or-metallurgy",
			"organic-or-assembling",
			"advanced-crafting",
			"pressing",
			"barreling",
		},

		crafting_speed = 1.0,
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
					{ direction = defines.direction.west, position = { -1, 0 } },
					{ direction = defines.direction.east, position = { 1, 0 } },
				},
				production_type = "input-output",
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
		module_slots = 3,
		allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
	},
})

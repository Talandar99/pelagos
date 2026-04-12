local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
data:extend({

	{
		type = "item",
		name = "portable-diesel-generator",
		icon = "__pelagos__/graphics/portable-diesel-generator-icon.png",
		place_as_equipment_result = "portable-diesel-generator",
		subgroup = "equipment",
		order = "a[energy-source]-b[portable-diesel-generator]",
		inventory_move_sound = item_sounds.reactor_inventory_move,
		pick_sound = item_sounds.reactor_inventory_pickup,
		drop_sound = item_sounds.reactor_inventory_move,
		default_import_location = "pelagos",
		stack_size = 20,
		weight = 0.25 * tons,
	},
	{
		type = "generator-equipment",
		name = "portable-diesel-generator",
		sprite = {
			filename = "__pelagos__/graphics/portable-diesel-generator.png",
			width = 256,
			height = 256,
			priority = "medium",
			scale = 0.5,
		},
		shape = {
			width = 4,
			height = 4,
			type = "full",
			--[[ Can also be defined as manual (a set of points which fall within the width/height - can't be empty)
      type = "manual",
      points = {{0, 0}, {1, 0}, {2, 0}, {3, 0},
                {0, 1},                 {3, 1},
                {0, 2},                 {3, 2},
                {0, 3}, {1, 3}, {2, 3}, {3, 3},}
      ]]
			--
		},
		burner = {
			type = "burner",
			fuel_categories = { "diesel-fuel" },
			emissions_per_minute = { pollution = 5 },
			fuel_inventory_size = 3,
			burnt_inventory_size = 3,
			smoke = {
				{
					name = "smoke",
					deviation = { 0.1, 0.1 },
					frequency = 6,
					position = { 0, 0 },
					starting_vertical_speed = 0.08,
					starting_frame_deviation = 60,
				},
			},
		},
		energy_source = {
			type = "electric",
			usage_priority = "primary-output",
		},
		power = "800kW",
		categories = { "armor" },
	},
})

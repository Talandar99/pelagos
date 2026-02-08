local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")
local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function barrelingmachinepipes()
	return {
		north = {
			filename = "__pelagos__/graphics/barreling-machine/barreling-machine-pipe-N.png",
			priority = "extra-high",
			width = 71,
			height = 38,
			shift = util.by_pixel(2.25, 13.5),
			scale = 0.5,
		},
		east = {
			filename = "__pelagos__/graphics/barreling-machine/barreling-machine-pipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__pelagos__/graphics/barreling-machine/barreling-machine-pipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__pelagos__/graphics/barreling-machine/barreling-machine-pipe-W.png",
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
		name = "barreling",
		type = "recipe-category",
	},
})
data:extend({
	{
		type = "item",
		name = "barreling-machine",
		icon = "__pelagos__/graphics/barreling-machine-icon.png",
		subgroup = "production-machine",
		group = "production",
		order = "z-a[barreling-machine]",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		place_result = "barreling-machine",
		stack_size = 50,
		weight = 1 * kg,
		default_import_location = "pelagos",
	},
	{
		type = "assembling-machine",
		--type = "furnace",
		name = "barreling-machine",
		icon = "__pelagos__/graphics/barreling-machine-icon.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.1, result = "barreling-machine" },
		--result_inventory_size = 2,
		fast_replaceable_group = "furnace",
		circuit_wire_max_distance = furnace_circuit_wire_max_distance,
		circuit_connector = circuit_connector_definitions["electric-furnace"],
		max_health = 350,
		corpse = "iron-chest-remnants",
		dying_explosion = "iron-chest-explosion",
		resistances = {
			{
				type = "fire",
				percent = 90,
			},
			{
				type = "impact",
				percent = 60,
			},
		},

		selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
		damaged_trigger_effect = hit_effects.entity(),
		--module_slots = 2,
		icon_draw_specification = { shift = { 0, -0.1 }, scale = 0.0 },
		allowed_effects = { "consumption", "speed", "pollution", "quality" },
		crafting_categories = { "barreling" },
		crafting_speed = 2,
		energy_usage = "20kW",
		source_inventory_size = 1,
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = { pollution = 1 },
		},
		impact_category = "metal",
		open_sound = sounds.metallic_chest_open,
		close_sound = sounds.metallic_chest_close,
		animation_sound = sounds.logistics_chest_open,
		match_animation_speed_to_activity = false,
		opened_duration = 7, --logistic_chest_opened_duration ==7
		working_sound = {
			sound = {
				filename = "__base__/sound/electric-furnace.ogg",
				volume = 0.85,
				modifiers = volume_multiplier("main-menu", 4.2),
				advanced_volume_control = { attenuation = "exponential" },
				audible_distance_modifier = 0.7,
			},
			max_sounds_per_prototype = 4,
			fade_in_ticks = 4,
			fade_out_ticks = 20,
		},
		graphics_set = {
			animation = {
				layers = {

					{
						filename = "__pelagos__/graphics/barreling-machine.png",
						priority = "extra-high",
						width = 66,
						height = 74,
						frame_count = 7,
						shift = util.by_pixel(0, -2),
						scale = 0.5,
						frame_sequence = { 1, 2, 3, 4, 5, 6, 7 },
					},
					{
						filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
						priority = "extra-high",
						width = 112,
						height = 46,
						repeat_count = 7,
						shift = util.by_pixel(12, 4.5),
						draw_as_shadow = true,
						scale = 0.5,
					},
				},
			},
		},
		fluid_boxes_off_when_no_fluid_recipe = false,
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = barrelingmachinepipes(),
				pipe_covers = pipecoverspictures(),
				volume = 100,
				pipe_connections = {
					{ flow_direction = "input", direction = defines.direction.north, position = { 0, 0 } },
				},
				secondary_draw_orders = { north = -1 },
				--hide_connection_info = true,
			},
			{
				production_type = "output",
				pipe_picture = barrelingmachinepipes(),
				pipe_covers = pipecoverspictures(),
				volume = 100,
				pipe_connections = {
					{ flow_direction = "output", direction = defines.direction.south, position = { 0, 0 } },
				},
				secondary_draw_orders = { north = -1 },
				--hide_connection_info = true,
			},
		},
	},
})

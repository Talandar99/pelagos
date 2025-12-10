local simulations = require("__base__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
local procession_audio_catalogue_types = require("__base__/prototypes/planet/procession-audio-catalogue-types")
local sounds = require("__base__.prototypes.entity.sounds")

calcinerpipecoverspictures = function()
	return {
		north = {
			layers = {
				{
					filename = "__pelagos__/graphics/pipe_covers/long/pipe-N.png",
					priority = "extra-high",
					width = 71,
					height = 38,
					shift = util.by_pixel(2.25, 13.5),
					scale = 0.5,
				},
				--	{
				--		filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
				--		priority = "extra-high",
				--		width = 128,
				--		height = 128,
				--		scale = 0.5,
				--		draw_as_shadow = true,
				--	},
			},
		},
		east = {
			layers = {
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
					draw_as_shadow = true,
				},
			},
		},
		south = {
			layers = {
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
					draw_as_shadow = true,
				},
			},
		},
		west = {
			layers = {
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
					draw_as_shadow = true,
				},
			},
		},
	}
end
function calcinerpipepictures()
	return {
		north = {
			filename = "__pelagos__/graphics/pipe_covers/calciner/pipe-N.png",
			priority = "low",
			width = 71,
			height = 38,
			shift = util.by_pixel(2.25, 13.5),
			scale = 0.5,
		},
		east = {
			filename = "__pelagos__/graphics/pipe_covers/calciner/pipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__pelagos__/graphics/pipe_covers/calciner/pipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__pelagos__/graphics/pipe_covers/calciner/pipe-W.png",
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
		name = "calciner",
		icon = "__pelagos__/graphics/calciner/calciner-icon.png",
		icon_size = 64,
		subgroup = "smelting-machine",
		order = "cd[calciner]",
		place_result = "calciner",
		stack_size = 20,
		default_import_location = "pelagos",
		weight = 200 * kg,
	},
	{
		type = "assembling-machine",
		name = "calciner",
		icon = "__pelagos__/graphics/calciner/calciner-icon.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.2, result = "calciner" },
		fast_replaceable_group = "furnace",
		--circuit_wire_max_distance = furnace_circuit_wire_max_distance,
		--circuit_connector = circuit_connector_definitions["electric-furnace"],
		max_health = 350,
		corpse = "calciner-remnants",
		dying_explosion = "electric-furnace-explosion",
		resistances = {
			{
				type = "fire",
				percent = 80,
			},
		},
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		--damaged_trigger_effect = hit_effects.entity(),
		module_slots = 4,
		--icon_draw_specification = { shift = { 0, -0.3 } },
		icon_draw_specification = { shift = { 0, -0.3 } },
		--icons_positioning = {
		--	{ inventory_index = defines.inventory.crafter_modules, shift = { 0, 0.46 } },
		--},
		allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
		effect_receiver = { base_effect = { productivity = 0.5 } },
		crafting_categories = { "smelting", "calcining" },
		result_inventory_size = 1,
		source_inventory_size = 1,
		crafting_speed = 4,
		energy_usage = "1MW",
		energy_source = {
			type = "fluid",
			burns_fluid = true, -- fluid used as power
			scale_fluid_usage = true,
			fluid_box = {
				pipe_covers = calcinerpipecoverspictures(),
				pipe_picture = calcinerpipepictures(),
				always_draw_covers = true,
				volume = 100,
				pipe_connections = {
					{ position = { 1, -1 }, direction = 0 }, -- north
					{ position = { -1, -1 }, direction = 0 }, -- north
					{ position = { 1, 1 }, direction = 8 }, -- south
					{ position = { -1, 1 }, direction = 8 }, -- south
				},
				production_type = "input-output",
			},
			-- need to fix position on rotation
			--			smoke = {
			--				{
			--					name = "smoke",
			--					frequency = 10,
			--					position = { -3.1, -1.1 },
			--					starting_vertical_speed = 0.18, --base 0.08
			--					starting_frame_deviation = 60,
			--				},
			--			},
			emissions_per_minute = { pollution = 10 }, --12 is burner drill
		},

		impact_category = "metal",
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close,
		working_sound = {
			sound = {
				filename = "__base__/sound/steel-furnace.ogg",
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

						filename = "__pelagos__/graphics/calciner/calciner.png",
						priority = "high",
						width = 239,
						height = 339,
						shift = util.by_pixel(0, -25),
						scale = 0.5,
					},
					{
						filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
						priority = "high",
						width = 227,
						height = 171,
						draw_as_shadow = true,
						shift = util.by_pixel(11.25, 7.75),
						scale = 0.5,
					},
				},
			},
			working_visualisations = {
				{
					fadeout = true,
					effect = "flicker",
					animation = {
						filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
						priority = "high",
						line_length = 8,
						width = 57,
						height = 81,
						frame_count = 48,
						draw_as_glow = true,
						shift = util.by_pixel(-2.75, 5.2),
						scale = 0.7,
					},
				},

				{
					fadeout = true,
					effect = "flicker",
					animation = {
						filename = "__pelagos__/graphics/calciner/calciner-working.png",
						priority = "high",
						width = 239,
						height = 339,
						shift = util.by_pixel(0, -18),
						scale = 0.5,
						line_length = 1,
						draw_as_glow = true,
						blend_mode = "additive",
					},
				},
				{
					fadeout = true,
					animation = {
						filename = "__base__/graphics/entity/electric-furnace/electric-furnace-ground-light.png",
						blend_mode = "additive",
						width = 166,
						height = 124,
						draw_as_light = true,
						shift = util.by_pixel(3, 69),
						scale = 0.6,
					},
				},
			},
			water_reflection = {
				pictures = {
					filename = "__base__/graphics/entity/electric-furnace/electric-furnace-reflection.png",
					priority = "extra-high",
					width = 24,
					height = 24,
					shift = util.by_pixel(5, 40),
					variation_count = 1,
					scale = 5,
				},
				rotate = false,
				orientation_to_variation = false,
			},
		},
	},
	{
		type = "corpse",
		name = "calciner-remnants",
		icon = "__pelagos__/graphics/calciner/calciner-icon.png",
		flags = { "placeable-neutral", "building-direction-8-way", "not-on-map" },
		hidden_in_factoriopedia = true,
		subgroup = "smelting-machine-remnants",
		order = "a-a-a",
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		tile_width = 3,
		tile_height = 3,
		selectable_in_game = false,
		time_before_removed = 60 * 60 * 15, -- 15 minutes
		expires = false,
		final_render_layer = "remnants",
		remove_on_tile_placement = false,
		animation = {
			filename = "__pelagos__/graphics/calciner/calciner-remnants.png",
			line_length = 1,
			width = 454,
			height = 448,
			direction_count = 1,
			shift = util.by_pixel(-3.25, 7.25),
			scale = 0.5,
		},
	},
})

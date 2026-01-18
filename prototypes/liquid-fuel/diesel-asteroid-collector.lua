local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local sounds = require("__base__.prototypes.entity.sounds")

function cutpipecover()
	return {
		north = {
			filename = "__pelagos__/graphics/pipe_covers/cut/pipe-N-short.png",
			priority = "extra-high",
			width = 71,
			height = 38,
			shift = util.by_pixel(2.25, 13.5),
			scale = 0.5,
		},
		east = {
			filename = "__pelagos__/graphics/pipe_covers/cut/pipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__pelagos__/graphics/pipe_covers/cut/pipe-S-long.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__pelagos__/graphics/pipe_covers/cut/pipe-W.png",
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
		name = "diesel-asteroid-collector",
		icon = "__pelagos__/graphics/diesel-asteroid-collector/asteroid-collector.png",
		subgroup = "space-platform",
		order = "d[asteroid-collector]",
		inventory_move_sound = item_sounds.mechanical_inventory_move,
		pick_sound = item_sounds.mechanical_inventory_pickup,
		drop_sound = item_sounds.mechanical_inventory_move,
		place_result = "diesel-asteroid-collector",
		stack_size = 10,
		weight = 100 * kg,
		random_tint_color = item_tints.iron_rust,
	},
	{
		type = "recipe",
		name = "diesel-asteroid-collector",
		enabled = false,
		ingredients = {
			{ type = "item", name = "titanium-plate", amount = 20 },
			{ type = "item", name = "electric-engine-unit", amount = 8 },
			{ type = "item", name = "processing-unit", amount = 5 },
		},
		energy_required = 10,
		results = { { type = "item", name = "diesel-asteroid-collector", amount = 1 } },
	},
	{
		type = "asteroid-collector",
		name = "diesel-asteroid-collector",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		icon = "__pelagos__/graphics/diesel-asteroid-collector/asteroid-collector.png",
		--factoriopedia_simulation = simulations.factoriopedia_asteroid_collector,
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		collision_mask = { layers = { is_object = true, is_lower_object = true, transport_belt = true } },
		tile_buildability_rules = {
			{
				area = { { -1.4, -0.4 }, { 1.4, 1.4 } },
				required_tiles = { layers = { ground_tile = true } },
				colliding_tiles = { layers = { empty_space = true } },
				remove_on_collision = true,
			},
			{
				area = { { -1.4, -4.4 }, { 1.4, -0.6 } },
				required_tiles = { layers = { empty_space = true } },
				remove_on_collision = true,
			},
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 0,
				max = 0,
			},
		},
		arm_color_gradient = {
			{ 215, 212, 212 },
			{ 229, 227, 229 },
			{ 235, 235, 235 },
			{ 240, 240, 243 },
			{ 229, 245, 245 },
			{ 253, 248, 253 },
			{ 201, 198, 203 },
			{ 204, 201, 202 },
			{ 216, 212, 218 },
			{ 223, 223, 224 },
			{ 227, 212, 235 },
			{ 245, 245, 245 },
			{ 202, 197, 195 },
			{ 245, 245, 245 },
			{ 216, 223, 231 },
			{ 255, 245, 255 },
			{ 224, 219, 221 },
			{ 224, 222, 249 },
			{ 219, 216, 224 },
			{ 231, 226, 238 },
			{ 223, 223, 224 },
			{ 255, 255, 255 },
		},
		tile_height = 3,
		tile_width = 3,
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		fast_replaceable_group = "asteroid-collector",
		corpse = "asteroid-collector-remnants",
		dying_explosion = "asteroid-collector-explosion",
		--collection_radius = 7.5,
		collection_radius = 15,
		--collection_box_offset = 5.0,
		collection_box_offset = 13.5,
		deposit_radius = 1.5,
		minimal_arm_swing_segment_retraction = 6,
		impact_category = "metal",
		open_sound = sounds.mech_small_open,
		close_sound = sounds.mech_small_close,
		munch_sound = {
			variations = sound_variations("__space-age__/sound/entity/asteroid-collector/asteroid-munch", 7, 0.8),
			aggregation = { max_count = 2, remove = true, count_already_playing = true },
			advanced_volume_control = {
				fades = {
					fade_in = {
						curve_type = "cosine",
						from = { control = 0.4, volume_percentage = 0.0 },
						to = { 2, 100.0 },
					},
				},
			},
		},
		arm_extend_sound = {
			variations = sound_variations("__space-age__/sound/entity/asteroid-collector/arm-extend", 5, 0.7),
			aggregation = { max_count = 1, remove = true, count_already_playing = true },
			advanced_volume_control = {
				fades = {
					fade_in = {
						curve_type = "S-curve",
						from = { control = 0.5, volume_percentage = 0.0 },
						to = { 3, 100.0 },
					},
				},
			},
		},
		arm_retract_sound = {
			variations = sound_variations("__space-age__/sound/entity/asteroid-collector/arm-retract", 5, 0.7),
			aggregation = { max_count = 1, remove = true, count_already_playing = true },
			advanced_volume_control = {
				fades = {
					fade_in = {
						curve_type = "S-curve",
						from = { control = 0.5, volume_percentage = 0.0 },
						to = { 3, 100.0 },
					},
				},
			},
		},
		deposit_sound = {
			variations = sound_variations("__space-age__/sound/entity/asteroid-collector/asteroid-deposit", 5, 0.5),
			aggregation = { max_count = 2, remove = true, count_already_playing = true },
			advanced_volume_control = {
				fades = {
					fade_in = {
						curve_type = "S-curve",
						from = { control = 0.5, volume_percentage = 0.0 },
						to = { 3, 100.0 },
					},
				},
			},
		},
		passive_energy_usage = "200J",
		arm_energy_usage = "1kJ",
		arm_slow_energy_usage = "300J",
		energy_usage_quality_scaling = 0.1,
		--head_collection_radius = 0.6,
		head_collection_radius = 0.6,
		arm_count_base = 1,
		arm_count_quality_scaling = 0,
		--arm_speed_base = 0.2,
		arm_speed_base = 0.1,
		arm_speed_quality_scaling = 0.05,
		arm_angular_speed_cap_base = 0.2,
		arm_angular_speed_cap_quality_scaling = 0.05,
		tether_size = 0.35,
		unpowered_arm_speed_scale = 0.3,
		held_items_offset = 0.6,
		energy_source = {
			type = "void",
			--usage_priority = "secondary-input",
			--drain = "0.4kW"
		},
		inventory_size = 39,
		inventory_size_quality_increase = 5,
		arm_inventory_size = 5,
		arm_inventory_size_quality_increase = 0,
		max_health = 300,
		minable = { mining_time = 0.2, result = "diesel-asteroid-collector" },
		resistances = {
			{
				type = "fire",
				percent = 70,
			},
		},
		circuit_connector = circuit_connector_definitions["asteroid-collector"],
		circuit_wire_max_distance = default_circuit_wire_max_distance,
		graphics_set = require("__pelagos__.prototypes.liquid-fuel.diesel-asteroid-collector-pictures"),
		radius_visualisation_picture = {
			filename = "__space-age__/graphics/entity/asteroid-collector/asteroid-collector-radius-visualization.png",
			size = 10,
		},
	},
})
data:extend({
	{
		type = "recipe-category",
		name = "diesel-asteroid-collector-working",
	},
})
-------------------------------------------------------------------------------
-- Dummy infinite working recipe
-------------------------------------------------------------------------------
data:extend({
	{
		type = "recipe",
		name = "diesel-asteroid-collector-working",
		category = "diesel-asteroid-collector-working",
		icon = "__pelagos__/graphics/diesel-asteroid-collector/asteroid-collector.png",
		energy_required = 1,
		enabled = true,
		ingredients = {},
		results = {},
		hidden = true,
		hide_from_player_crafting = true,
		hide_from_signal_gui = true,
		allow_decomposition = false,
		show_amount_in_title = false,
		allow_as_intermediate = false,
		always_show_products = false,
	},
})
data:extend({
	{
		type = "assembling-machine",
		name = "diesel-asteroid-collector-engine",
		icon = "__pelagos__/graphics/diesel-asteroid-collector/asteroid-collector.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		collision_mask = { layers = {} },
		max_health = 350,
		corpse = "assembling-machine-3-remnants",
		dying_explosion = "assembling-machine-3-explosion",
		icon_draw_specification = { shift = { 0, -0.3 } },
		circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
		circuit_connector = circuit_connector_definitions["assembling-machine"],
		alert_icon_shift = util.by_pixel(0, -12),
		selectable_in_game = false,
		hidden = true,
		hidden_in_factoriopedia = true,
		show_recipe_icon = false,
		resistances = {
			{
				type = "fire",
				percent = 70,
			},
		},
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = cutpipecover(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections = {
					{ flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } },
				},
				secondary_draw_orders = { north = -1 },
			},
			{
				production_type = "output",
				pipe_picture = cutpipecover(),
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
		--selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		damaged_trigger_effect = hit_effects.entity(),
		fast_replaceable_group = "",
		next_upgrade = "",
		graphics_set = {},
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close,
		impact_category = "metal",
		working_sound = {
			sound = {
				filename = "__base__/sound/assembling-machine-t2-1.ogg",
				volume = 0.25,
				audible_distance_modifier = 0.5,
			},
			fade_in_ticks = 4,
			fade_out_ticks = 20,
		},
		crafting_categories = {
			"diesel-asteroid-collector-working",
		},
		crafting_speed = 1,
		energy_source = {
			type = "fluid",
			burns_fluid = true, -- fluid used as power
			scale_fluid_usage = true,
			fluid_box = {
				--pipe_covers = pipecoverspictures(),
				--pipe_picture = assembler2pipepictures(),
				--pipe_picture = dieseldrillpipepictures(),
				pipe_picture = cutpipecover(),
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
		module_slots = 0,
		allowed_effects = {},
	},
})

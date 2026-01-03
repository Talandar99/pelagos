local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local rocket_shift = 48

function rocketsilopipes()
	return {
		north = {

			filename = "__pelagos__/graphics/rocketsilopipes/rocketsilopipe-NN.png",
			priority = "extra-high",
			width = 71,
			--height = 38,
			height = 76,
			--shift = util.by_pixel(2.25, 13.5),
			shift = util.by_pixel(2.25, 23),
			scale = 0.5,
		},
		east = {
			filename = "__pelagos__/graphics/rocketsilopipes/rocketsilopipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__pelagos__/graphics/rocketsilopipes/rocketsilopipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__pelagos__/graphics/rocketsilopipes/rocketsilopipe-W.png",
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
		name = "diesel-dragon",
		icon = "__pelagos__/graphics/diesel-dragon/rocket-silo.png",
		subgroup = "space-related",
		order = "a[rocket-silo]",
		inventory_move_sound = item_sounds.mechanical_large_inventory_move,
		pick_sound = item_sounds.mechanical_large_inventory_pickup,
		drop_sound = item_sounds.mechanical_large_inventory_move,
		place_result = "diesel-dragon",
		weight = 10 * tons,
		stack_size = 1,
	},
	{
		type = "rocket-silo",
		name = "diesel-dragon",
		icon = "__pelagos__/graphics/diesel-dragon/rocket-silo.png",
		flags = { "placeable-player", "player-creation" },
		fast_transfer_modules_into_module_slots_only = true,
		crafting_categories = { "diesel-rocket-building" },
		fast_replaceable_group = "rocket-silo",
		rocket_parts_required = 25,
		rocket_quick_relaunch_start_offset = -0.625,
		cargo_station_parameters = {
			is_input_station = false,
			is_output_station = true,
			hatch_definitions = { silo_cargo_hatch({ 0, 0 }) },
		},
		crafting_speed = 1,
		to_be_inserted_to_rocket_inventory_size = 1,
		logistic_trash_inventory_size = 0,
		icon_draw_specification = { shift = { 0, 2 } },
		module_slots = 6,
		icons_positioning = {
			{ inventory_index = defines.inventory.assembling_machine_modules, shift = { 0, 3.3 } },
		},
		--fixed_recipe = "rocket-part",
		show_recipe_icon = false,
		allowed_effects = { "consumption", "speed", "productivity", "pollution" },
		minable = { mining_time = 1, result = "diesel-dragon" },
		max_health = 6000,
		corpse = "rocket-silo-remnants",
		dying_explosion = "rocket-silo-explosion",
		collision_box = { { -4.20, -4.20 }, { 4.20, 4.20 } },
		selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } },
		damaged_trigger_effect = hit_effects.entity(),
		hole_clipping_box = { { -2.75, -1.15 }, { 2.75, 2.25 } },
		resistances = {
			{
				type = "fire",
				percent = 60,
			},
			{
				type = "impact",
				percent = 60,
			},
		},
		impact_category = "metal-large",

		energy_source = {

			type = "fluid",
			burns_fluid = true, -- fluid used as power
			scale_fluid_usage = true,
			fluid_box = {
				--pipe_covers = pipecoverspictures(),
				pipe_picture = rocketsilopipes(),
				pipe_covers = pipecoverspictures(),
				volume = 100,
				pipe_connections = {
					{ flow_direction = "input-output", direction = defines.direction.north, position = { 0, -4 } },
					{ flow_direction = "input-output", direction = defines.direction.south, position = { 0, 4 } },
					{ flow_direction = "input-output", direction = defines.direction.east, position = { 4, 0 } },
					{ flow_direction = "input-output", direction = defines.direction.west, position = { -4, 0 } },
				},
				production_type = "input-output",
			},
			-- need to fix position on rotation
			smoke = {
				--{
				--	name = "smoke",
				--	frequency = 5,
				--	position = { 2.8, -3.2 },
				--	starting_vertical_speed = 0.08, --base 0.08
				--	starting_frame_deviation = 60,
				--},
			},
			--emissions_per_minute = { pollution = 10 }, --12 is burner drill ,10 is electric drill
		},
		--energy_source = {
		--	type = "electric",
		--	usage_priority = "primary-input",
		--},
		--energy_usage = "250kW", --energy usage used when crafting the rocket
		energy_usage = "25MW", --energy usage used when crafting the rocket
		lamp_energy_usage = "0kW",
		active_energy_usage = "3990kW",
		rocket_entity = "diesel-rocket-silo-rocket",
		times_to_blink = 3,
		light_blinking_speed = 1 / (3 * 60),
		door_opening_speed = 1 / (4.25 * 60),

		base_engine_light = {
			intensity = 1,
			size = 25,
			shift = { 0, 1.5 },
		},

		shadow_sprite = {
			filename = "__base__/graphics/entity/rocket-silo/00-rocket-silo-shadow.png",
			priority = "medium",
			width = 612,
			height = 578,
			draw_as_shadow = true,
			dice = 2,
			shift = util.by_pixel(7, 2),
			scale = 0.5,
		},

		hole_sprite = {
			filename = "__base__/graphics/entity/rocket-silo/01-rocket-silo-hole.png",
			width = 400,
			height = 270,
			shift = util.by_pixel(-5, 16),
			scale = 0.5,
		},

		hole_light_sprite = {
			filename = "__base__/graphics/entity/rocket-silo/01-rocket-silo-hole-light.png",
			width = 400,
			height = 270,
			shift = util.by_pixel(-5, 16),
			tint = { 1, 1, 1, 0 },
			scale = 0.5,
		},

		rocket_shadow_overlay_sprite = {
			filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-shadow-over-rocket.png",
			width = 426,
			height = 288,
			shift = util.by_pixel(-2, 21),
			scale = 0.5,
		},
		rocket_glow_overlay_sprite = {
			filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glow.png",
			blend_mode = "additive",
			width = 434,
			height = 446,
			shift = util.by_pixel(-3, 36),
			scale = 0.5,
		},

		door_back_sprite = {
			filename = "__base__/graphics/entity/rocket-silo/04-door-back.png",
			width = 312,
			height = 286,
			shift = util.by_pixel(37, 12),
			scale = 0.5,
		},
		door_back_open_offset = { 1.8, -1.8 * 0.43299225 },
		door_front_sprite = {
			filename = "__base__/graphics/entity/rocket-silo/05-door-front.png",
			width = 332,
			height = 300,
			shift = util.by_pixel(-28, 33),
			scale = 0.5,
		},
		door_front_open_offset = { -1.8, 1.8 * 0.43299225 },

		base_day_sprite = {
			filename = "__pelagos__/graphics/diesel-dragon/06-rocket-silo.png",
			dice_y = 3,
			width = 608,
			height = 596,
			shift = util.by_pixel(3, -1),
			scale = 0.5,
		},

		red_lights_back_sprites = {
			layers = {
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { 1.34375, 0.28125 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { 2.3125, 0.9375 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { 2.65625, 1.90625 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { -2.65625, 1.90625 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { -2.3125, 0.9375 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { -1.34375, 0.28125 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { 0, 0 - 1.375 },
					scale = 0.5,
				},
			},
		},

		red_lights_front_sprites = {
			layers = {
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { 2.3125, 2.8125 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { 1.34375, 3.40625 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { 0, 3.75 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { 0, 3.75 - 1.375 },
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
					width = 32,
					height = 32,
					shift = { -2.3125, 2.8125 - 1.375 },
					scale = 0.5,
				},
			},
		},
		satellite_animation = {
			filename = "__base__/graphics/entity/rocket-silo/15-rocket-silo-turbine.png",
			priority = "medium",
			width = 54,
			height = 88,
			frame_count = 32,
			line_length = 8,
			animation_speed = 0.4,
			shift = util.by_pixel(-100, 111),
			scale = 0.5,
		},

		arm_01_back_animation = {
			filename = "__pelagos__/graphics/diesel-dragon/08-rocket-silo-arms-back.png",
			priority = "medium",
			width = 128,
			height = 150,
			frame_count = 32,
			line_length = 32,
			animation_speed = 0.3,
			shift = util.by_pixel(-53, -84),
			scale = 0.5,
		},

		arm_02_right_animation = {
			filename = "__pelagos__/graphics/diesel-dragon/08-rocket-silo-arms-right.png",
			priority = "medium",
			width = 182,
			height = 188,
			frame_count = 32,
			line_length = 32,
			animation_speed = 0.3,
			shift = util.by_pixel(101, -38),
			scale = 0.5,
		},

		arm_03_front_animation = {
			filename = "__pelagos__/graphics/diesel-dragon/13-rocket-silo-arms-front.png",
			priority = "medium",
			width = 126,
			height = 228,
			frame_count = 32,
			line_length = 32,
			animation_speed = 0.3,
			shift = util.by_pixel(-51, 16),
			scale = 0.5,
		},

		base_front_sprite = {
			filename = "__pelagos__/graphics/diesel-dragon/14-rocket-silo-front.png",
			width = 580,
			height = 262,
			shift = util.by_pixel(-1, 78),
			scale = 0.5,
		},
		silo_fade_out_start_distance = 8,
		silo_fade_out_end_distance = 15,

		alarm_sound = "__base__/sound/silo-alarm.ogg",
		quick_alarm_sound = {
			filename = "__base__/sound/silo-alarm-short.ogg",
			volume = 1.0,
			aggregation = { max_count = 2, remove = true, count_already_playing = true },
		},
		clamps_on_sound = {
			filename = "__base__/sound/silo-clamps-on.ogg",
			volume = 1.0,
			aggregation = { max_count = 1, remove = false, count_already_playing = true },
		},
		clamps_off_sound = {
			filename = "__base__/sound/silo-clamps-off.ogg",
			volume = 0.8,
			aggregation = { max_count = 1, remove = false, count_already_playing = true },
		},
		doors_sound = {
			filename = "__base__/sound/silo-doors.ogg",
			volume = 0.8,
			aggregation = { max_count = 3, remove = true, count_already_playing = true },
		},
		raise_rocket_sound = {
			filename = "__base__/sound/silo-raise-rocket.ogg",
			volume = 1.0,
			aggregation = { max_count = 2, remove = true, count_already_playing = true },
		},
		open_sound = { filename = "__base__/sound/open-close/silo-open.ogg", volume = 0.7 },
		close_sound = { filename = "__base__/sound/open-close/silo-close.ogg", volume = 0.7 },
		working_sound = {
			sound = {
				filename = "__base__/sound/rocket-silo-working-1.ogg",
				volume = 0.8,
				aggregation = { max_count = 3, remove = true, count_already_playing = true },
			},
			fade_in_ticks = 10,
			fade_out_ticks = 15,
		},
	},
	{
		type = "rocket-silo-rocket",
		name = "diesel-rocket-silo-rocket",
		flags = { "not-on-map" },
		hidden = true,
		collision_mask = { layers = {}, not_colliding_with_itself = true },
		collision_box = { { -2, -7 }, { 2, 4 } },
		selection_box = { { 0, 0 }, { 0, 0 } },
		dying_explosion = "massive-explosion",
		shadow_slave_entity = "rocket-silo-rocket-shadow",
		inventory_size = 0,
		rising_speed = 1 / (7 * 60),
		engine_starting_speed = 1 / (5.5 * 60),
		flying_speed = 1 / (2000 * 60),
		flying_acceleration = 0.01,
		icon_draw_specification = { render_layer = "air-entity-info-icon" },
		glow_light = {
			intensity = 1,
			size = 30,
			shift = { 0, 1.5 },
			color = { 1, 1, 1 },
		},
		cargo_pod_entity = "cargo-pod",
		rocket_sprite = {
			layers = {
				util.sprite_load("__pelagos__/graphics/diesel-dragon/rocket-static-pod", {
					dice_y = 4,
					shift = util.by_pixel(0, 17.0 + rocket_shift),
					scale = 0.5,
				}),
				util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-emission", {
					dice_y = 4,
					shift = util.by_pixel(0, 17 + rocket_shift),
					draw_as_glow = true,
					blend_mode = "additive",
					scale = 0.5,
				}),
			},
		},

		rocket_shadow_sprite = util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-static-pod-shadow", {
			priority = "medium",
			shift = util.by_pixel(-80, -210 + rocket_shift),
			draw_as_shadow = true,
			scale = 0.5,
		}),
		rocket_glare_overlay_sprite = util.add_shift_offset(util.by_pixel(0, 112 + 112 + rocket_shift), {
			filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glare.png",
			blend_mode = "additive",
			width = 481,
			height = 481,
			shift = util.by_pixel(-2, -2),
			flags = { "linear-magnification", "linear-minification" },
		}),
		rocket_smoke_top1_animation = util.add_shift_offset(
			util.by_pixel(0 - 66, -112 + 28 + 232 + 32 + rocket_shift),
			{
				filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
				priority = "medium",
				tint = { 0.8, 0.8, 1, 0.8 },
				width = 80,
				height = 286,
				frame_count = 24,
				line_length = 8,
				animation_speed = 0.5,
				scale = 1.5 / 2 * 1.3,
				shift = util.by_pixel(-1, -3),
			}
		),
		rocket_smoke_top2_animation = util.add_shift_offset(
			util.by_pixel(0 + 17, -112 + 28 + 265 + 32 + rocket_shift),
			{
				filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
				priority = "medium",
				tint = { 0.8, 0.8, 1, 0.8 },
				width = 80,
				height = 286,
				frame_count = 24,
				line_length = 8,
				animation_speed = 0.5,
				scale = 1.5 / 2 * 1.3,
				shift = util.by_pixel(-1, -3),
			}
		),
		rocket_smoke_top3_animation = util.add_shift_offset(
			util.by_pixel(0 + 48, -112 + 28 + 252 + 32 + rocket_shift),
			{
				filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
				priority = "medium",
				tint = { 0.8, 0.8, 1, 0.8 },
				width = 80,
				height = 286,
				frame_count = 24,
				line_length = 8,
				animation_speed = 0.5,
				scale = 1.5 / 2 * 1.3,
				shift = util.by_pixel(-1, -3),
			}
		),

		rocket_smoke_bottom1_animation = util.add_shift_offset(
			util.by_pixel(0 - 69, -112 + 28 + 205 + 32 + rocket_shift),
			{
				filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
				priority = "medium",
				tint = { 0.8, 0.8, 1, 0.7 },
				width = 80,
				height = 286,
				frame_count = 24,
				line_length = 8,
				animation_speed = 0.5,
				scale = 1.5 / 2 * 1.3,
				shift = util.by_pixel(-1, -3),
			}
		),
		rocket_smoke_bottom2_animation = util.add_shift_offset(
			util.by_pixel(0 + 62, -112 + 28 + 207 + 32 + rocket_shift),
			{
				filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
				priority = "medium",
				tint = { 0.8, 0.8, 1, 0.7 },
				width = 80,
				height = 286,
				frame_count = 24,
				line_length = 8,
				animation_speed = 0.5,
				scale = 1.5 / 2 * 1.3,
				shift = util.by_pixel(-1, -3),
			}
		),
		rocket_flame_animation = util.sprite_load("__base__/graphics/entity/rocket-silo/rocket-jet", {
			shift = util.by_pixel(0, 17 + rocket_shift),
			draw_as_glow = true,
			blend_mode = "additive",
			scale = 0.5,
			frame_count = 8,
			animation_speed = 0.5,
		}),
		rocket_flame_left_rotation = 0.0611,
		rocket_flame_right_rotation = 0.952,
		rocket_initial_offset = { 0, 3 },
		rocket_rise_offset = { 0, -2.8 },
		rocket_launch_offset = { 0, -256 },
		cargo_attachment_offset = util.by_pixel(0, -63.4),
		rocket_render_layer_switch_distance = 9.5,
		full_render_layer_switch_distance = 11,
		effects_fade_in_start_distance = 4.5,
		effects_fade_in_end_distance = 7.5,
		shadow_fade_out_start_ratio = 0.25,
		shadow_fade_out_end_ratio = 0.75,
		rocket_visible_distance_from_center = 2.75,
		rocket_above_wires_slice_offset_from_center = -3,
		rocket_air_object_slice_offset_from_center = -6,

		flying_sound = {
			filename = "__base__/sound/silo-rocket.ogg",
			volume = 1.0,
			modifiers = volume_multiplier("main-menu", 0.6),
			audible_distance_modifier = 6,
			aggregation = { max_count = 3, remove = true, count_already_playing = true, priority = "oldest" },
		},
	},
	{
		type = "rocket-silo-rocket-shadow",
		name = "rocket-silo-rocket-shadow",
		flags = { "not-on-map" },
		hidden = true,
		collision_mask = { layers = {}, not_colliding_with_itself = true },
		collision_box = { { 0, 0 }, { 10, 3.5 } },
		selection_box = { { 0, 0 }, { 0, 0 } },
	},
	{
		type = "rocket-silo-rocket-shadow",
		name = "cargo-pod-shadow",
		flags = { "not-on-map" },
		hidden = true,
		collision_mask = { layers = {}, not_colliding_with_itself = true },
		collision_box = { { 0, 0 }, { 0, 0 } },
		selection_box = { { 0, 0 }, { 0, 0 } },
	},
})

data.raw.item["diesel-dragon"].subgroup = "space-interactors"
data.raw["rocket-silo"]["diesel-dragon"].circuit_connector = circuit_connector_definitions["rocket-silo"]
data.raw["rocket-silo"]["diesel-dragon"].circuit_wire_max_distance = default_circuit_wire_max_distance
data.raw["rocket-silo"]["diesel-dragon"].surface_conditions = {
	{
		property = "pressure",
		min = 1,
	},
}
data.raw["rocket-silo"]["diesel-dragon"].heating_energy = "300kW"
data.raw.item["diesel-dragon"].flags = data.raw.item["rocket-silo"].flags or {}
table.insert(data.raw.item["diesel-dragon"].flags, "draw-logistic-overlay")
data.raw["rocket-silo"]["diesel-dragon"].launch_to_space_platforms = true
data.raw["rocket-silo"]["diesel-dragon"].to_be_inserted_to_rocket_inventory_size = 20
data.raw["rocket-silo"]["diesel-dragon"].logistic_trash_inventory_size = 20
data.raw["rocket-silo-rocket"]["diesel-rocket-silo-rocket"].inventory_size = 20
data.raw["rocket-silo"]["diesel-dragon"].cargo_station_parameters.prefer_packed_cargo_units = true

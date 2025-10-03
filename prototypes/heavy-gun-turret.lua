local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local rocket_turret_shift = -20

function gun_turret_extension(inputs)
	return {
		filename = "__base__/graphics/entity/gun-turret/gun-turret-raising.png",
		priority = "medium",
		width = 130,
		height = 126,
		direction_count = 4,
		frame_count = inputs.frame_count or 5,
		line_length = inputs.line_length or 0,
		run_mode = inputs.run_mode or "forward",
		shift = util.by_pixel(0, -26.5),
		scale = 0.5,
		--scale = 0.75,
	}
end

function gun_turret_extension_mask(inputs)
	return {
		filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-mask.png",
		flags = { "mask" },
		width = 48,
		height = 62,
		direction_count = 4,
		frame_count = inputs.frame_count or 5,
		line_length = inputs.line_length or 0,
		run_mode = inputs.run_mode or "forward",
		shift = util.by_pixel(0, -28),
		apply_runtime_tint = true,
		scale = 0.5,
		--scale = 0.75,
	}
end

function gun_turret_extension_shadow(inputs)
	return {
		filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-shadow.png",
		width = 250,
		height = 124,
		direction_count = 4,
		frame_count = inputs.frame_count or 5,
		line_length = inputs.line_length or 0,
		run_mode = inputs.run_mode or "forward",
		shift = util.by_pixel(19, 2.5),
		draw_as_shadow = true,
		scale = 0.5,
		--scale = 0.75,
	}
end

function gun_turret_attack(inputs)
	inputs.frame_count = 2
	return {
		layers = {
			{
				width = 132,
				height = 130,
				frame_count = inputs.frame_count or 2,
				--frame_count = 2,
				direction_count = 64,
				shift = util.by_pixel(0, -27.5),
				stripes = {
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-1.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-2.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-3.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-4.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
				},
				scale = 0.5,
				--scale = 0.75,
			},
			{
				flags = { "mask" },
				line_length = inputs.frame_count or 2,
				width = 58,
				height = 54,
				frame_count = inputs.frame_count or 2,
				direction_count = 64,
				shift = util.by_pixel(0, -32.5),
				apply_runtime_tint = true,
				stripes = {
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-1.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-2.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-3.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-4.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
				},
				scale = 0.5,
				--scale = 0.75,
			},
			{
				width = 250,
				height = 124,
				frame_count = inputs.frame_count or 2,
				direction_count = 64,
				shift = util.by_pixel(22, 2.5),
				draw_as_shadow = true,
				stripes = {
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-1.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-2.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-3.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-4.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 16,
					},
				},
				scale = 0.5,
				--scale = 0.75,
			},
		},
	}
end

data:extend({

	{
		type = "item",
		name = "heavy-gun-turret",
		icon = "__pelagos__/graphics/heavy-gun-turret.png",
		subgroup = "turret",
		order = "b[turret]-e[rocket-turret]-a[turret]",
		inventory_move_sound = item_sounds.turret_inventory_move,
		pick_sound = item_sounds.turret_inventory_pickup,
		drop_sound = item_sounds.turret_inventory_move,
		place_result = "heavy-gun-turret",
		stack_size = 10,
		weight = 100 * kg,
	},
	{
		type = "ammo-turret",
		name = "heavy-gun-turret",
		icon = "__pelagos__/graphics/heavy-gun-turret.png",
		flags = { "placeable-player", "player-creation" },
		minable = { mining_time = 0.5, result = "heavy-gun-turret" },
		max_health = 600,
		corpse = "rocket-turret-remnants",
		dying_explosion = "gun-turret-explosion",
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		damaged_trigger_effect = hit_effects.entity(),
		--damaged_trigger_effect = hit_effects.entity(),
		heating_energy = "50kW",
		rotation_speed = 0.015,
		preparing_speed = 0.08,
		folding_speed = 0.08,
		preparing_sound = sounds.gun_turret_activate,
		folding_sound = sounds.gun_turret_deactivate,
		--	preparing_sound = {
		--		variations = sound_variations("__space-age__/sound/entity/rocket-turret/rocket-turret-activate", 2, 0.4),
		--		aggregation = { max_count = 2, remove = true, count_already_playing = true },
		--	},
		--	folding_sound = {
		--		variations = sound_variations("__space-age__/sound/entity/rocket-turret/rocket-turret-deactivate", 2, 0.5),
		--		aggregation = { max_count = 2, remove = true, count_already_playing = true },
		--	},
		rotating_sound = {
			sound = {
				variations = {
					filename = "__space-age__/sound/entity/rocket-turret/rocket-turret-rotation-loop.ogg",
					volume = 0.15,
				},
				aggregation = { max_count = 2, remove = true, count_already_playing = true },
			},
			stopped_sound = {
				variations = {
					filename = "__space-age__/sound/entity/rocket-turret/rocket-turret-rotation-stop.ogg",
					volume = 0.5,
				},
				aggregation = { max_count = 1, remove = true, count_already_playing = true },
			},
			minimal_change_per_tick = 0.001,
			minimal_sound_duration_for_stopped_sound = 10,
		},
		inventory_size = 1,
		automated_ammo_count = 10,
		attacking_speed = 0.5,
		--attacking_speed = 1.5,
		alert_when_attacking = true,
		circuit_connector = circuit_connector_definitions["gun-turret"],
		circuit_wire_max_distance = default_circuit_wire_max_distance,
		open_sound = sounds.turret_open,
		close_sound = sounds.turret_close,
		folded_animation = {
			layers = {
				gun_turret_extension({ frame_count = 1, line_length = 1 }),
				gun_turret_extension_mask({ frame_count = 1, line_length = 1 }),
				gun_turret_extension_shadow({ frame_count = 1, line_length = 1 }),
			},
		},
		preparing_animation = {
			layers = {
				gun_turret_extension({}),
				gun_turret_extension_mask({}),
				gun_turret_extension_shadow({}),
			},
		},
		prepared_animation = gun_turret_attack({ frame_count = 1 }),
		attacking_animation = gun_turret_attack({}),
		folding_animation = {
			layers = {
				gun_turret_extension({ run_mode = "backward" }),
				gun_turret_extension_mask({ run_mode = "backward" }),
				gun_turret_extension_shadow({ run_mode = "backward" }),
			},
		},
		graphics_set = {
			base_visualisation = {
				animation = {
					layers = {
						util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base", {
							priority = "high",
							frame_count = 1,
							scale = 0.5,
							shift = util.by_pixel(0.0, 0.0 + rocket_turret_shift),
						}),
						util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base-mask", {
							flags = { "mask", "low-object" },
							frame_count = 1,
							apply_runtime_tint = true,
							scale = 0.5,
							shift = util.by_pixel(0.0, 0.0 + rocket_turret_shift),
						}),
						util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base-shadow", {
							frame_count = 1,
							scale = 0.5,
							shift = util.by_pixel(0.0, 0.0 + rocket_turret_shift),
							draw_as_shadow = true,
						}),
					},
				},
			},
		},

		attack_parameters = {
			type = "projectile",
			ammo_category = "bullet",
			health_penalty = 1,
			--cooldown = 6,
			cooldown = 2,
			projectile_creation_distance = 1.39375,
			projectile_center = { 0, -0.0875 }, -- same as gun_turret_attack shift
			shell_particle = {
				name = "shell-particle",
				direction_deviation = 0.1,
				speed = 0.1,
				speed_deviation = 0.03,
				center = { -0.0625, 0 },
				creation_distance = -1.925,
				starting_frame_speed = 0.2,
				starting_frame_speed_deviation = 0.1,
			},
			range = 18,
			sound = sounds.gun_turret_gunshot,
		},
		--		attack_parameters = {
		--			type = "projectile",
		--			ammo_category = "rocket",
		--			cooldown = 120,
		--			projectile_creation_distance = 1,
		--			projectile_center = { 0, 0 },
		--			min_range = 15,
		--			range = 36,
		--			sound = {
		--				variations = sound_variations(
		--					"__space-age__/sound/ammo/rocket-turret-launcher",
		--					7,
		--					0.7,
		--					volume_multiplier("main-menu", 1.8)
		--				),
		--				aggregation = { max_count = 4, remove = true, count_already_playing = true },
		--			},
		--			projectile_creation_offsets = {
		--				util.by_pixel(34, 25 - 32),
		--				util.by_pixel(-34, 25 - 32),
		--				util.by_pixel(31, 30 - 32),
		--				util.by_pixel(-31, 30 - 32),
		--				util.by_pixel(27, 35 - 32),
		--				util.by_pixel(-27, 35 - 32),
		--				-- 32 px is the rocket projectile height, so we need to subtract it from the y offset
		--			},
		--		},

		call_for_help_radius = 40,
		water_reflection = {
			pictures = {
				filename = "__base__/graphics/entity/gun-turret/gun-turret-reflection.png",
				priority = "extra-high",
				width = 20,
				height = 32,
				shift = util.by_pixel(0, 40),
				variation_count = 1,
				scale = 5,
			},
			rotate = false,
			orientation_to_variation = false,
		},
	},
	--	{
	--		type = "ammo-turret",
	--		name = "gun-turret",
	--		icon = "__base__/graphics/icons/gun-turret.png",
	--		flags = { "placeable-player", "player-creation" },
	--		minable = { mining_time = 0.5, result = "gun-turret" },
	--		fast_replaceable_group = "ammo-turret",
	--		max_health = 400,
	--		corpse = "gun-turret-remnants",
	--		dying_explosion = "gun-turret-explosion",
	--		collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
	--		selection_box = { { -1, -1 }, { 1, 1 } },
	--		drawing_box_vertical_extension = 0.2,
	--		damaged_trigger_effect = hit_effects.entity(),
	--		rotation_speed = 0.015,
	--		preparing_speed = 0.08,
	--		preparing_sound = sounds.gun_turret_activate,
	--		folding_sound = sounds.gun_turret_deactivate,
	--		folding_speed = 0.08,
	--		inventory_size = 1,
	--		automated_ammo_count = 10,
	--		attacking_speed = 0.5,
	--		alert_when_attacking = true,
	--		circuit_connector = circuit_connector_definitions["gun-turret"],
	--		circuit_wire_max_distance = default_circuit_wire_max_distance,
	--		open_sound = sounds.turret_open,
	--		close_sound = sounds.turret_close,
	--		icon_draw_specification = { scale = 0.7 },
	--		icons_positioning = {
	--			{ inventory_index = defines.inventory.turret_ammo, shift = { 0, -0.25 } },
	--		},
	--		folded_animation = {
	--			layers = {
	--				gun_turret_extension({ frame_count = 1, line_length = 1 }),
	--				gun_turret_extension_mask({ frame_count = 1, line_length = 1 }),
	--				gun_turret_extension_shadow({ frame_count = 1, line_length = 1 }),
	--			},
	--		},
	--		preparing_animation = {
	--			layers = {
	--				gun_turret_extension({}),
	--				gun_turret_extension_mask({}),
	--				gun_turret_extension_shadow({}),
	--			},
	--		},
	--		prepared_animation = gun_turret_attack({ frame_count = 1 }),
	--		attacking_animation = gun_turret_attack({}),
	--		folding_animation = {
	--			layers = {
	--				gun_turret_extension({ run_mode = "backward" }),
	--				gun_turret_extension_mask({ run_mode = "backward" }),
	--				gun_turret_extension_shadow({ run_mode = "backward" }),
	--			},
	--		},
	--		graphics_set = {
	--			base_visualisation = {
	--				animation = {
	--					layers = {
	--						{
	--							filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
	--							priority = "high",
	--							width = 150,
	--							height = 118,
	--							shift = util.by_pixel(0.5, -1),
	--							scale = 0.5,
	--						},
	--						{
	--							filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
	--							flags = { "mask", "low-object" },
	--							line_length = 1,
	--							width = 122,
	--							height = 102,
	--							shift = util.by_pixel(0, -4.5),
	--							apply_runtime_tint = true,
	--							scale = 0.5,
	--						},
	--					},
	--				},
	--			},
	--		},
	--
	--		attack_parameters = {
	--			type = "projectile",
	--			ammo_category = "bullet",
	--			health_penalty = 1,
	--			cooldown = 6,
	--			projectile_creation_distance = 1.39375,
	--			projectile_center = { 0, -0.0875 }, -- same as gun_turret_attack shift
	--			shell_particle = {
	--				name = "shell-particle",
	--				direction_deviation = 0.1,
	--				speed = 0.1,
	--				speed_deviation = 0.03,
	--				center = { -0.0625, 0 },
	--				creation_distance = -1.925,
	--				starting_frame_speed = 0.2,
	--				starting_frame_speed_deviation = 0.1,
	--			},
	--			range = 18,
	--			sound = sounds.gun_turret_gunshot,
	--		},
	--
	--		call_for_help_radius = 40,
	--		water_reflection = {
	--			pictures = {
	--				filename = "__base__/graphics/entity/gun-turret/gun-turret-reflection.png",
	--				priority = "extra-high",
	--				width = 20,
	--				height = 32,
	--				shift = util.by_pixel(0, 40),
	--				variation_count = 1,
	--				scale = 5,
	--			},
	--			rotate = false,
	--			orientation_to_variation = false,
	--		},
	--	},
})

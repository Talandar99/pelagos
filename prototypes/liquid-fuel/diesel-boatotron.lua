local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local collision_mask = {
	layers = {
		["rail"] = true,
	},
	colliding_with_tiles_only = true,
}
local vehicle_leg = table.deepcopy(data.raw["spider-leg"]["spidertron-leg-1"])
vehicle_leg.name = "pelagos-boat-leg"
vehicle_leg.maraxsis_buildability_rules =
	{ water = true, dome = true, coral = true, trench = true, trench_entrance = true, trench_lava = true }
vehicle_leg.graphics_set = {}
vehicle_leg.collision_mask = collision_mask
vehicle_leg.target_position_randomisation_distance = 0
vehicle_leg.working_sound = nil
vehicle_leg.minimal_step_size = 0
vehicle_leg.part_length = 2
vehicle_leg.movement_based_position_selection_distance = 1.5 -- I have no idea what this does.
vehicle_leg.initial_movement_speed = 1
vehicle_leg.movement_acceleration = 0
vehicle_leg.walking_sound_volume_modifier = 0
vehicle_leg.part_length = 0.1
vehicle_leg.selectable_in_game = false
data:extend({ vehicle_leg })
function spidertron_torso_graphics_sett(spidertron_scale)
	return {
		--base_animation =
		--{
		--  layers =
		--  {
		--    {
		--      filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-bottom.png",
		--      width = 126,
		--      height = 106,
		--      line_length = 1,
		--      direction_count = 1,
		--      scale = 0.5 * spidertron_scale,
		--      shift = util.by_pixel(0 * spidertron_scale, 0 * spidertron_scale)
		--    },
		--    {
		--      filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-bottom-mask.png",
		--      width = 124,
		--      height = 90,
		--      line_length = 1,
		--      direction_count = 1,
		--      scale = 0.5 * spidertron_scale,
		--      apply_runtime_tint = true,
		--      shift = util.by_pixel(0 * spidertron_scale, 3.5 * spidertron_scale)
		--    }
		--  }
		--},

		--shadow_base_animation =
		--{
		--  filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-bottom-shadow.png",
		--  width = 144,
		--  height = 96,
		--  line_length = 1,
		--  direction_count = 1,
		--  scale = 0.5 * spidertron_scale,
		--  draw_as_shadow = true,
		--  shift = util.by_pixel(-1 * spidertron_scale, -1 * spidertron_scale)
		--},

		animation = {
			layers = {
				{
					filename = "__base__/graphics/entity/spidertron/torso/spidertron-body.png",
					width = 132,
					height = 138,
					line_length = 8,
					direction_count = 64,
					scale = 0.5 * spidertron_scale,
					shift = util.by_pixel(0 * spidertron_scale, -19 * spidertron_scale),
				},
				{
					filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-mask.png",
					width = 130,
					height = 100,
					line_length = 8,
					direction_count = 64,
					scale = 0.5 * spidertron_scale,
					apply_runtime_tint = true,
					shift = util.by_pixel(0 * spidertron_scale, -14 * spidertron_scale),
				},
			},
		},

		shadow_animation = {
			filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-shadow.png",
			width = 192,
			height = 94,
			line_length = 8,
			direction_count = 64,
			scale = 0.5 * spidertron_scale,
			draw_as_shadow = true,
			shift = util.by_pixel(26 * spidertron_scale, 0.5 * spidertron_scale),
		},

		water_reflection = {
			pictures = {
				filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-water-reflection.png",
				width = 448,
				height = 448,
				variation_count = 1,
				scale = 0.5 * spidertron_scale,
				shift = util.by_pixel(0 * spidertron_scale, 0 * spidertron_scale),
			},
		},

		light = {
			{
				minimum_darkness = 0.3,
				intensity = 0.4,
				size = 25 * spidertron_scale,
				color = { r = 1.0, g = 1.0, b = 1.0 },
			},
			create_spidertron_light_cone(0, 1, 1, -1, spidertron_scale),
			create_spidertron_light_cone(-0.05, 0.7, 0.7, 2.5, spidertron_scale),
			create_spidertron_light_cone(0.04, 0.5, 0.45, 5.5, spidertron_scale),
			create_spidertron_light_cone(0.06, 0.6, 0.35, 6.5, spidertron_scale),
		},

		light_positions = scale_light_positions(
			require("__base__/prototypes/entity/spidertron-light-positions"),
			spidertron_scale
		),

		eye_light = { intensity = 1, size = 1 * spidertron_scale, color = { r = 1.0, g = 1.0, b = 1.0 } }, -- {r=1.0, g=0.0, b=0.0}},

		render_layer = "under-elevated",
		base_render_layer = "higher-object-above",

		autopilot_destination_on_map_visualisation = {
			filename = "__core__/graphics/spidertron-target-map-visualization.png",
			priority = "extra-high-no-scale",
			scale = 0.5,
			flags = { "icon" },
			width = 64,
			height = 64,
			line_length = 8,
			frame_count = 24,
			animation_speed = 0.5,
			run_mode = "backward",
			apply_runtime_tint = true,
		},
		autopilot_destination_queue_on_map_visualisation = {
			filename = "__core__/graphics/spidertron-target-map-visualization.png",
			priority = "extra-high-no-scale",
			scale = 0.5,
			flags = { "icon" },
			width = 64,
			height = 64,
			line_length = 8,
			frame_count = 24,
			animation_speed = 0.5,
			run_mode = "backward",
			apply_runtime_tint = true,
		},

		autopilot_path_visualisation_on_map_line_width = 2, -- in pixels
		autopilot_path_visualisation_line_width = 1 / 8, -- in tiles

		autopilot_destination_visualisation_render_layer = "object",
		autopilot_destination_visualisation = {
			filename = "__core__/graphics/spidertron-target-map-visualization.png",
			priority = "extra-high-no-scale",
			scale = 0.5,
			flags = { "icon" },
			width = 64,
			height = 64,
			line_length = 8,
			frame_count = 24,
			animation_speed = 0.5,
			run_mode = "backward",
			apply_runtime_tint = true,
		},
		autopilot_destination_queue_visualisation = {
			filename = "__core__/graphics/spidertron-target-map-visualization.png",
			priority = "extra-high-no-scale",
			scale = 0.5,
			flags = { "icon" },
			width = 64,
			height = 64,
			line_length = 8,
			frame_count = 24,
			animation_speed = 0.5,
			run_mode = "backward",
			apply_runtime_tint = true,
		},
	}
end

function create_spidertron(arguments)
	local scale = arguments.scale
	local leg_scale = scale * arguments.leg_scale
	local body_height = 1.5 * scale * leg_scale
	local spidertron_resistances = {
		{
			type = "fire",
			decrease = 15,
			percent = 60,
		},
		{
			type = "physical",
			decrease = 15,
			percent = 60,
		},
		{
			type = "impact",
			decrease = 50,
			percent = 80,
		},
		{
			type = "explosion",
			decrease = 20,
			percent = 75,
		},
		{
			type = "acid",
			decrease = 0,
			percent = 70,
		},
		{
			type = "laser",
			decrease = 0,
			percent = 70,
		},
		{
			type = "electric",
			decrease = 0,
			percent = 70,
		},
	}
	local spidertron_leg_resistances = util.table.deepcopy(spidertron_resistances)
	spidertron_leg_resistances[4] = { type = "explosion", percent = 100 }

	data:extend({
		{
			type = "item-with-entity-data",
			name = "pelagos-boatotron",
			icon = "__base__/graphics/icons/spidertron.png",
			icon_tintable = "__base__/graphics/icons/spidertron-tintable.png",
			icon_tintable_mask = "__base__/graphics/icons/spidertron-tintable-mask.png",
			subgroup = "transport",
			order = "b[personal-transport]-c[spidertron]-a[spider]",
			inventory_move_sound = item_sounds.spidertron_inventory_move,
			pick_sound = item_sounds.spidertron_inventory_pickup,
			drop_sound = item_sounds.spidertron_inventory_move,
			place_result = "pelagos-boatotron",
			weight = 1 * tons,
			stack_size = 1,
		},
		{
			type = "spider-vehicle",
			name = "pelagos-boatotron",
			collision_box = { { -1 * scale, -1 * scale }, { 1 * scale, 1 * scale } },
			sticker_box = { { -1.5 * scale, -1.5 * scale }, { 1.5 * scale, 1.5 * scale } },
			selection_box = { { -1 * scale, -1 * scale }, { 1 * scale, 1 * scale } },
			drawing_box_vertical_extension = 3 * scale,
			height = 0,
			icon = "__base__/graphics/icons/spidertron.png",
			factoriopedia_simulation = arguments.factoriopedia_simulation,
			mined_sound = sounds.deconstruct_large(0.8),
			open_sound = { filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume = 0.45 },
			close_sound = { filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4 },
			working_sound = {
				sound = { filename = "__base__/sound/spidertron/spidertron-vox.ogg", volume = 0.35 },
				activate_sound = { filename = "__base__/sound/spidertron/spidertron-activate.ogg", volume = 0.5 },
				deactivate_sound = { filename = "__base__/sound/spidertron/spidertron-deactivate.ogg", volume = 0.5 },
				match_speed_to_activity = true,
				activity_to_speed_modifiers = {
					multiplier = 6.0,
					minimum = 1.0,
					offset = 0.93333333333,
				},
			},
			weight = 1,
			braking_force = 1,
			friction_force = 1,
			flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
			minable = { mining_time = 1, result = arguments.name },
			max_health = 3000,
			resistances = util.table.deepcopy(spidertron_resistances),
			minimap_representation = {
				filename = "__base__/graphics/entity/spidertron/spidertron-map.png",
				flags = { "icon" },
				size = { 128, 128 },
				scale = 0.5,
			},
			selected_minimap_representation = {
				filename = "__base__/graphics/entity/spidertron/spidertron-map-selected.png",
				flags = { "icon" },
				size = { 128, 128 },
				scale = 0.5,
			},
			corpse = "spidertron-remnants",
			dying_explosion = "spidertron-explosion",
			energy_per_hit_point = 1,
			guns = {
				"spidertron-rocket-launcher-1",
				"spidertron-rocket-launcher-2",
				"spidertron-rocket-launcher-3",
				"spidertron-rocket-launcher-4",
			},
			inventory_size = 80,
			equipment_grid = "spidertron-equipment-grid",
			trash_inventory_size = 20,
			--height = body_height,
			alert_icon_shift = { 0, -body_height },
			torso_rotation_speed = 0.005,
			chunk_exploration_radius = 3,
			selection_priority = 60,
			graphics_set = spidertron_torso_graphics_set(scale),
			energy_source = {
				type = "void",
			},
			movement_energy_consumption = "250kW",
			automatic_weapon_cycling = true,
			chain_shooting_cooldown_modifier = 0.5,
			spider_engine = {
				legs = {
					leg = "pelagos-boat-leg",
					mount_position = { 0, 0.5 },
					ground_position = { 0, 0 },
					blocking_legs = {},
					walking_group = 1,
				},
			},

			--    spider_engine =
			--    {
			--      legs =
			--      {
			--        { -- 1
			--          leg = arguments.name .. "-leg-1",
			--          mount_position = util.by_pixel(15  * scale, -22 * scale),
			--          ground_position = {2.25  * leg_scale, -2.5  * leg_scale},
			--          walking_group = 1,
			--          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			--        },
			--        { -- 2
			--          leg = arguments.name .. "-leg-2",
			--          mount_position = util.by_pixel(23  * scale, -10  * scale),
			--          ground_position = {3  * leg_scale, -1  * leg_scale},
			--          walking_group = 2,
			--          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			--        },
			--        { -- 3
			--          leg = arguments.name .. "-leg-3",
			--          mount_position = util.by_pixel(25  * scale, 4  * scale),
			--          ground_position = {3  * leg_scale, 1  * leg_scale},
			--          walking_group = 1,
			--          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			--        },
			--        { -- 4
			--          leg = arguments.name .. "-leg-4",
			--          mount_position = util.by_pixel(15  * scale, 17  * scale),
			--          ground_position = {2.25  * leg_scale, 2.5  * leg_scale},
			--          walking_group = 2,
			--          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			--        },
			--        { -- 5
			--          leg = arguments.name .. "-leg-5",
			--          mount_position = util.by_pixel(-15 * scale, -22 * scale),
			--          ground_position = {-2.25 * leg_scale, -2.5 * leg_scale},
			--          walking_group = 2,
			--          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			--        },
			--        { -- 6
			--          leg = arguments.name .. "-leg-6",
			--          mount_position = util.by_pixel(-23 * scale, -10 * scale),
			--          ground_position = {-3 * leg_scale, -1 * leg_scale},
			--          walking_group = 1,
			--          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			--        },
			--        { -- 7
			--          leg = arguments.name .. "-leg-7",
			--          mount_position = util.by_pixel(-25 * scale, 4 * scale),
			--          ground_position = {-3 * leg_scale, 1 * leg_scale},
			--          walking_group = 2,
			--          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			--        },
			--        { -- 8
			--          leg = arguments.name .. "-leg-8",
			--          mount_position = util.by_pixel(-15 * scale, 17 * scale),
			--          ground_position = {-2.25 * leg_scale, 2.5 * leg_scale},
			--          walking_group = 1,
			--          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			--        }
			--      },
			--    },
			is_military_target = true,
			allow_remote_driving = true,
		},
		--make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 1, spidertron_leg_resistances),
		--make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 2, spidertron_leg_resistances),
		--make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 3, spidertron_leg_resistances),
		--make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 4, spidertron_leg_resistances),
		--make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 5, spidertron_leg_resistances),
		--make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 6, spidertron_leg_resistances),
		--make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 7, spidertron_leg_resistances),
		--make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 8, spidertron_leg_resistances),
	})
end
create_spidertron({
	name = "spidertron",
	scale = 1,
	leg_scale = 1, -- relative to scale
	leg_thickness = 1, -- relative to leg_scale
	leg_movement_speed = 1,
	--factoriopedia_simulation = simulations.factoriopedia_spidertron,
})

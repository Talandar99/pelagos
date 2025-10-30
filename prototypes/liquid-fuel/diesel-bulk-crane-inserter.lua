local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local function cutpipecovers()
	return {
		north = {
			filename = "__pelagos__/graphics/pipe_covers/cut/pipe-N.png",
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
			filename = "__pelagos__/graphics/pipe_covers/cut/pipe-S.png",
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
		name = "crane-bulk-diesel-inserter",
		icon = "__pelagos__/graphics/diesel-titanium-crane-bulk-inserter/bulk-inserter.png",
		subgroup = "inserter",
		color_hint = { text = "S" },
		order = "h[crane-bulk-diesel-inserter]",
		inventory_move_sound = item_sounds.wire_inventory_move,
		pick_sound = item_sounds.wire_inventory_pickup,
		drop_sound = item_sounds.wire_inventory_move,
		place_result = "crane-bulk-diesel-inserter",
		stack_size = 50,
		default_import_location = "pelagos",
		weight = 20 * kg,
	},
	{
		type = "inserter",
		name = "crane-bulk-diesel-inserter",
		icon = "__pelagos__/graphics/diesel-titanium-crane-bulk-inserter/bulk-inserter.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		bulk = true,
		stack_size_bonus = 500 - 1,
		minable = { mining_time = 0.1, result = "crane-bulk-diesel-inserter" },
		max_health = 160,
		corpse = "fast-inserter-remnants",
		dying_explosion = "fast-inserter-explosion",
		resistances = {
			{
				type = "fire",
				percent = 90,
			},
		},
		--collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } },
		--selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } },
		collision_box = { { -1.3, -0.15 }, { 1.3, 0.15 } },
		selection_box = { { -1.5, -0.5 }, { 1.5, 0.5 } },
		damaged_trigger_effect = hit_effects.entity(),
		starting_distance = 0.85,
		pickup_position = { 0, -1 },
		insert_position = { 0, 1.2 },
		energy_per_movement = "40kJ",
		energy_per_rotation = "40kJ",
		--energy_source = {
		--	type = "electric",
		--	usage_priority = "secondary-input",
		--	drain = "1kW",
		--},
		energy_source = {

			type = "fluid",
			burns_fluid = true, -- fluid used as power
			scale_fluid_usage = true,
			fluid_box = {
				--pipe_covers = pipecoverspictures(),
				pipe_picture = cutpipecovers(),
				pipe_covers = pipecoverspictures(),
				always_draw_covers = false,
				volume = 100,
				pipe_connections = {
					--{ direction = defines.direction.north, position = { 0, 0 } },
					--{ direction = defines.direction.south, position = { 0, 0 } },
					{ direction = defines.direction.west, position = { -1, 0 } },
					{ direction = defines.direction.east, position = { 1, 0 } },
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
		icon_draw_specification = {
			--shift = {0, -0.3},
			scale = 0.8,
			render_layer = "entity-info-icon-above",
		},
		fast_replaceable_group = "inserter",
		open_sound = sounds.inserter_open,
		close_sound = sounds.inserter_close,
		working_sound = sounds.inserter_fast,
		hand_base_picture = {
			filename = "__pelagos__/graphics/diesel-titanium-crane-bulk-inserter/bulk-inserter-hand-base.png",
			priority = "extra-high",
			width = 32,
			height = 136,
			scale = 0.25,
		},
		hand_closed_picture = {
			filename = "__pelagos__/graphics/diesel-titanium-crane-bulk-inserter/bulk-inserter-hand-closed.png",
			priority = "extra-high",
			width = 100,
			height = 164,
			scale = 0.25,
		},
		hand_open_picture = {
			filename = "__pelagos__/graphics/diesel-titanium-crane-bulk-inserter/bulk-inserter-hand-open.png",
			priority = "extra-high",
			width = 130,
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
			filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-closed-shadow.png",
			priority = "extra-high",
			width = 100,
			height = 164,
			scale = 0.25,
		},
		hand_open_shadow = {
			filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-open-shadow.png",
			priority = "extra-high",
			width = 130,
			height = 164,
			scale = 0.25,
		},

		-- Overlay Platform Layer
		integration_patch_render_layer = "object",
		integration_patch = make_4way_animation_from_spritesheet({
			layers = {
				{
					filename = "__pelagos__/graphics/diesel-titanium-crane-bulk-inserter/platform-overlay.png",
					priority = "extra-high",
					width = 384,
					height = 192,
					scale = 0.5,
				},
			},
		}),
		platform_picture = make_4way_animation_from_spritesheet({
			layers = {
				{
					filename = "__pelagos__/graphics/diesel-titanium-crane-bulk-inserter/platform.png",
					priority = "extra-high",
					width = 384,
					height = 192,
					scale = 0.5,
				},
				--				{
				--          		filename = "__inserter-cranes-fork__/graphics/entity/crane-platform-3x1-sh.png",
				--          		priority = "extra-high",
				--		  			width = 384,
				--          		height = 192,
				--	      		draw_as_shadow = true,
				--          		scale = 0.5
				--        		}
			},
		}),
		circuit_connector = circuit_connector_definitions["inserter"],
		circuit_wire_max_distance = inserter_circuit_wire_max_distance,
		default_stack_control_input_signal = inserter_default_stack_control_input_signal,
	},
})

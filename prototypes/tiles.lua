local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")

data:extend({
	{
		type = "tile",
		name = "wooden-platform",
		order = "a[artificial]-f",
		subgroup = "artificial-tiles",
		needs_correction = false,
		minable = { mining_time = 0.5, result = "wooden-platform" },
		mined_sound = base_sounds.deconstruct_bricks(0.8),
		is_foundation = false,
		collision_mask = tile_collision_masks.ground(), --for everything
		--		collision_mask = {
		--			layers = {
		--				--object = true,
		--				--player = true,
		--				--transport_belt = true, --block belts
		--				--item = true,
		--				--resource = true,
		--				--water_tile = true,
		--			},
		--		},
		layer = 6,
		layer_group = "ground-artificial",
		--transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
		decorative_removal_probability = 0.25,
		variants = {
			transition = {
				overlay_layout = {
					inner_corner = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-inner-corner.png",
						count = 1,
						scale = 0.5,
					},
					outer_corner = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-outer-corner.png",
						count = 1,
						scale = 0.5,
					},
					side = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-side.png",
						--spritesheet = "__base__/graphics/terrain/concrete/concrete-side.png",
						count = 1,
						scale = 0.5,
					},
					u_transition = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-u.png",
						count = 1,
						scale = 0.5,
					},
					o_transition = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-o.png",
						count = 1,
						scale = 0.5,
					},
				},
				mask_layout = {
					inner_corner = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-inner-corner-mask.png",
						count = 1,
						scale = 0.5,
					},
					outer_corner = {
						spritesheet = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
						count = 8,
						scale = 0.5,
					},
					side = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-side-mask.png",
						count = 16,
						scale = 0.5,
					},
					u_transition = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-u-mask.png",
						count = 1,
						scale = 0.5,
					},
					o_transition = {
						spritesheet = "__pelagos__/graphics/wooden-platform/concrete-o-mask.png",
						count = 1,
						scale = 0.5,
					},
				},
			},

			material_background = {
				picture = "__pelagos__/graphics/wooden-platform/concrete.png",
				count = 8,
				scale = 0.5,
			},
		},

		--transitions = foundation_transitions,
		--transitions_between_transitions = foundation_transitions_between_transitions,

		walking_sound = base_tile_sounds.walking.dirt,
		build_sound = base_tile_sounds.building.concrete,
		--map_color = { 57, 39, 26 },
		map_color = { 200, 200, 50 },
		--scorch_mark_color = { r = 0.329, g = 0.242, b = 0.177, a = 1.000 },
		vehicle_friction_modifier = 1.0,
		-- 207 , 149, 67
		--tint = { r = 0.81, g = 0.58, b = 0.26, a = 1.000 },
		--tint = { r = 1.00, g = 0.78, b = 0.46, a = 1.000 },
		--tint = { r = 1.00, g = 0.78, b = 0.56, a = 1.000 },
		--tint = { r = 0.50, g = 0.50, b = 0.50, a = 0.500 },

		trigger_effect = tile_trigger_effects.concrete_trigger_effect(),
	},
})

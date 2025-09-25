local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_pelagos = require("procession-catalogue-pelagos")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local decorative_trigger_effects = require("__base__/prototypes/decorative/decorative-trigger-effects")
local base_decorative_sprite_priority = "extra-high"
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local base_sounds = require("__base__/prototypes/entity/sounds")
--

data:extend({
	{
		type = "autoplace-control",
		name = "pelagos_rocks",
		localised_name = { "entity-name.pelagos-big-rock" },
		richness = false,
		order = "a[doodad]-a[rock]-b",
		category = "resource",
	},
})
-- map generation
data:extend({
	{
		type = "simple-entity",
		name = "pelagos-big-rock",
		icon = "__base__/graphics/icons/big-rock.png",
		icon_size = 64,
		flags = { "placeable-neutral" },
		map_color = { 129, 105, 78 },
		count_as_rock_for_filtered_deconstruction = true,
		mined_sound = sounds.deconstruct_bricks(1.0),
		impact_category = "stone",
		surface_conditions = {
			{
				property = "pressure",
				min = 1500,
				max = 1500,
			},
		},
		minable = {
			mining_time = 1,
			results = {
				{ type = "item", name = "stone", amount = 20 },
				{ type = "item", name = "fermentation-bacteria", amount = 5 },
			},
		},
		autoplace = {
			control = "pelagos_rocks",
			order = "a[doodad]-a[rock]-b[big]",
			probability_expression = "multiplier * control",
			local_expressions = {
				multiplier = 0.001,
				control = "control:pelagos_rocks:size",
			},
		},
		max_health = 500,
		collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
		selection_box = { { -1.0, -1.0 }, { 1.0, 0.75 } },
		damaged_trigger_effect = hit_effects.rock(),
		render_layer = "object",
		pictures = {
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-01.png",
				width = 209,
				height = 138,
				shift = { 0.304688, -0.4 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-02.png",
				width = 165,
				height = 129,
				shift = { 0.0, 0.0390625 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-03.png",
				width = 151,
				height = 139,
				shift = { 0.151562, 0.0 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-04.png",
				width = 216,
				height = 110,
				shift = { 0.390625, 0.0 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-05.png",
				width = 154,
				height = 147,
				shift = { 0.328125, 0.0703125 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-06.png",
				width = 154,
				height = 132,
				shift = { 0.16875, -0.1 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-07.png",
				width = 193,
				height = 130,
				shift = { 0.3, -0.2 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-08.png",
				width = 136,
				height = 117,
				shift = { 0.0, 0.0 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-09.png",
				width = 157,
				height = 115,
				shift = { 0.1, 0.0 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-10.png",
				width = 198,
				height = 153,
				shift = { 0.325, -0.1 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-11.png",
				width = 190,
				height = 115,
				shift = { 0.453125, 0.0 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-12.png",
				width = 229,
				height = 126,
				shift = { 0.539062, -0.015625 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-13.png",
				width = 151,
				height = 125,
				shift = { 0.0703125, 0.179688 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-14.png",
				width = 137,
				height = 117,
				shift = { 0.160938, 0.0 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-15.png",
				width = 201,
				height = 141,
				shift = { 0.242188, -0.195312 },
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-16.png",
				width = 209,
				height = 154,
				shift = { 0.351562, -0.1 },
				scale = 0.5,
			},
		},
	},
})

data:extend({
	{
		name = "pelagos-sand-dune-decal",
		type = "optimized-decorative",
		order = "b[decorative]-b[red-desert-decal]",
		collision_box = { { -1.78125, -1.34375 }, { 1.78125, 1.34375 } },
		collision_mask = { layers = { doodad = true, water_tile = true }, not_colliding_with_itself = true },
		render_layer = "decals",
		tile_layer = 255,
		surface_conditions = {
			{
				property = "pressure",
				min = 1500,
				max = 1500,
			},
		},
		autoplace = {
			probability_expression = "0.3 * noise_layer_noise('pelagos-dune-decal')",
		},
		pictures = {
			--dune
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-00.png",
				width = 212,
				height = 168,
				shift = util.by_pixel(-8, 0),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-01.png",
				width = 211,
				height = 148,
				shift = util.by_pixel(5.75, -3.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-02.png",
				width = 260,
				height = 184,
				shift = util.by_pixel(3, 1),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-03.png",
				width = 129,
				height = 181,
				shift = util.by_pixel(0.75, 1.75),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-04.png",
				width = 196,
				height = 184,
				shift = util.by_pixel(-3.5, -1.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-05.png",
				width = 215,
				height = 184,
				shift = util.by_pixel(-1.25, -1),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-06.png",
				width = 218,
				height = 179,
				shift = util.by_pixel(6.5, 4.25),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-07.png",
				width = 250,
				height = 183,
				shift = util.by_pixel(17.5, 3.25),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-08.png",
				width = 260,
				height = 176,
				shift = util.by_pixel(5, 0.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-09.png",
				width = 260,
				height = 184,
				shift = util.by_pixel(-5.5, -1),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-10.png",
				width = 233,
				height = 183,
				shift = util.by_pixel(-13.75, 1.25),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-11.png",
				width = 172,
				height = 184,
				shift = util.by_pixel(-9.5, 2),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-12.png",
				width = 260,
				height = 166,
				shift = util.by_pixel(2.5, -6.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-13.png",
				width = 259,
				height = 172,
				shift = util.by_pixel(4.75, -1),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-14.png",
				width = 199,
				height = 184,
				shift = util.by_pixel(-2.25, -2),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-15.png",
				width = 214,
				height = 184,
				shift = util.by_pixel(8.5, -3),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-16.png",
				width = 162,
				height = 182,
				shift = util.by_pixel(-8, -4.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-17.png",
				width = 222,
				height = 153,
				shift = util.by_pixel(-3, -0.25),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-18.png",
				width = 247,
				height = 184,
				shift = util.by_pixel(4.25, -2.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-19.png",
				width = 211,
				height = 184,
				shift = util.by_pixel(-5.75, -3),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-20.png",
				width = 248,
				height = 183,
				shift = util.by_pixel(-1.5, 2.25),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-21.png",
				width = 176,
				height = 184,
				shift = util.by_pixel(6.5, 1.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-22.png",
				width = 208,
				height = 185,
				shift = util.by_pixel(9, -1.75),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-23.png",
				width = 227,
				height = 184,
				shift = util.by_pixel(-3.75, -1.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-24.png",
				width = 158,
				height = 186,
				shift = util.by_pixel(4.5, -1),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-25.png",
				width = 260,
				height = 184,
				shift = util.by_pixel(1.5, -1.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-26.png",
				width = 134,
				height = 184,
				shift = util.by_pixel(-0.5, -1),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-27.png",
				width = 127,
				height = 165,
				shift = util.by_pixel(26.25, 1.25),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-28.png",
				width = 258,
				height = 158,
				shift = util.by_pixel(-2.5, -4.5),
				scale = 0.5,
			},
			{
				filename = "__base__/graphics/decorative/sand-dune-decal/sand-dune-decal-29.png",
				width = 180,
				height = 184,
				shift = util.by_pixel(-3.5, -2),
				scale = 0.5,
			},
		},
	},
})

data:extend({
	{
		name = "pelagos-copper-stromatolite",
		type = "simple-entity",
		flags = { "placeable-neutral", "placeable-off-grid" },
		icon = "__space-age__/graphics/icons/copper-stromatolite.png",
		subgroup = "grass",
		order = "b[decorative]-l[rock]-c[gleba]-a[copper-stromatolite]",
		collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		selection_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
		collision_mask = {
			layers = { player = true, train = true, is_object = true, is_lower_object = true },
		},
		damaged_trigger_effect = hit_effects.rock(),
		render_layer = "object",
		max_health = 500,
		surface_conditions = {
			{
				property = "pressure",
				min = 1500,
				max = 1500,
			},
		},
		autoplace = {
			probability_expression = "0.007 * noise_layer_noise('pelagos-copper-stromatolite')",
		},
		dying_trigger_effect = decorative_trigger_effects.big_rock(),
		minable = {
			mining_particle = "copper-ore-particle",
			mining_time = 1,
			results = {
				{ type = "item", name = "stone", amount_min = 5, amount_max = 10 },
				{ type = "item", name = "copper-ore", amount_min = 25, amount_max = 30 },
			},
		},
		resistances = {
			{
				type = "fire",
				percent = 100,
			},
		},
		map_color = { 129, 105, 78 },
		count_as_rock_for_filtered_deconstruction = true,
		mined_sound = base_sounds.deconstruct_bricks(1.0),
		impact_category = "stone",
		pictures = {
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-01.png",
				width = 209,
				height = 138,
				shift = { 0.304688, -0.4 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-02.png",
				width = 165,
				height = 129,
				shift = { 0.0, 0.0390625 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-03.png",
				width = 151,
				height = 139,
				shift = { 0.151562, 0.0 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-04.png",
				width = 216,
				height = 110,
				shift = { 0.390625, 0.0 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-05.png",
				width = 154,
				height = 147,
				shift = { 0.328125, 0.0703125 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-06.png",
				width = 154,
				height = 132,
				shift = { 0.16875, -0.1 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-07.png",
				width = 193,
				height = 130,
				shift = { 0.3, -0.2 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-08.png",
				width = 136,
				height = 117,
				shift = { 0.0, 0.0 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-09.png",
				width = 157,
				height = 115,
				shift = { 0.1, 0.0 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-10.png",
				width = 198,
				height = 153,
				shift = { 0.325, -0.1 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-11.png",
				width = 190,
				height = 115,
				shift = { 0.453125, 0.0 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-12.png",
				width = 229,
				height = 126,
				shift = { 0.539062, -0.015625 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-13.png",
				width = 151,
				height = 125,
				shift = { 0.0703125, 0.179688 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-14.png",
				width = 137,
				height = 117,
				shift = { 0.160938, 0.0 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-15.png",
				width = 201,
				height = 141,
				shift = { 0.242188, -0.195312 },
				scale = 0.4,
			},
			{
				filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-16.png",
				width = 209,
				height = 154,
				shift = { 0.351562, -0.1 },
				scale = 0.4,
			},
		},
		water_reflection = {
			pictures = {
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-01-effect-map.png",
					width = 96,
					height = 92,
					shift = { 0.304688, -0.3 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-02-effect-map.png",
					width = 78,
					height = 92,
					shift = { 0.0, 0.3 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-03-effect-map.png",
					width = 70,
					height = 91,
					shift = { 0.151562, 0.1 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-04-effect-map.png",
					width = 88,
					height = 94,
					shift = { 0.30625, 0.3 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-05-effect-map.png",
					width = 77,
					height = 92,
					shift = { 0.328125, 0.0703125 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-06-effect-map.png",
					width = 77,
					height = 92,
					shift = { 0.16875, 0.1 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-07-effect-map.png",
					width = 94,
					height = 93,
					shift = { 0.3, 0.0 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-08-effect-map.png",
					width = 63,
					height = 93,
					shift = { 0.0, 0.2 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-09-effect-map.png",
					width = 79,
					height = 93,
					shift = { 0.1, 0.2 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-10-effect-map.png",
					width = 93,
					height = 93,
					shift = { 0.325, -0.1 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-11-effect-map.png",
					width = 95,
					height = 93,
					shift = { 0.453125, 0.2 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-12-effect-map.png",
					width = 92,
					height = 92,
					shift = { 0.3, 0.1 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-13-effect-map.png",
					width = 76,
					height = 93,
					shift = { 0.0703125, 0.3 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-14-effect-map.png",
					width = 63,
					height = 93,
					shift = { 0.160938, 0.2 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-15-effect-map.png",
					width = 101,
					height = 92,
					shift = { 0.242188, -0.1 },
					scale = 0.8,
				},
				{
					filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-16-effect-map.png",
					width = 88,
					height = 92,
					shift = { 0.1, -0.1 },
					scale = 0.8,
				},
			},
		},
	},
})
-- deepwater initialization (finished in data-final-fix)
local deepwater = table.deepcopy(data.raw.tile["deepwater"])
deepwater.name = "pelagos-deepsea"
deepwater.localised_name = { "tile-name.pelagos-deepsea" }
deepwater.map_color = { r = 0.165, g = 0.278, b = 0.306 }

data:extend({ deepwater })

local function MapGen_Pelagos()
	local map = {
		aux_climate_control = false,
		moisture_climate_control = false,
		property_expression_names = {
			elevation = "pelagos_elevation",
			aux = "nauvis_aux",
			["entity:pelagos-iron-ore:probability"] = "pelagos_iron_ore_probability",
			["entity:pelagos-iron-ore:richness"] = "pelagos_iron_ore_richness",
		},
		cliff_settings = nil,
		default_enable_all_autoplace_controls = false,
		autoplace_controls = {
			--	["copper-ore"] = {
			--		frequency = 3,
			--		size = 1,
			--		richness = 2,
			--		starting_area = false,
			--	},
			["iron-ore"] = {
				frequency = 4,
				size = 1,
				richness = 2,
				starting_area = false,
			},
			["methane"] = {},
			["titanium-sludge"] = {},
		},
		autoplace_settings = {
			["tile"] = {
				settings = {
					["pelagos-deepsea"] = {
						probability_expression = "pelagos_elevation < -100",
					},
					["water"] = {},
					["sand-1"] = {},
					["sand-2"] = {},
				},
			},
			["decorative"] = {
				settings = {
					["pelagos-sand-dune-decal"] = {},
					--["pelagos-green-hairy-grass"] = {},
					--["pelagos-green-carpet-grass"] = {},
				},
			},
			["entity"] = {
				settings = {
					["fish"] = {},
					["coconut-palm"] = {},
					["iron-ore"] = {},
					--["copper-ore"] = {},
					["pelagos-big-rock"] = {},
					["pelagos-copper-stromatolite"] = {},
					--["dead-tree-desert"] = {},
					["methane"] = {},
					["titanium-sludge"] = {},
					["copper-biter-spawner"] = {},
				},
			},
		},
		terrain_segmentation = "very-high",
		default_tile = "sand-1",
	}
	return map
end

--planet pleagos definition
PlanetsLib:extend({
	{
		type = "planet",
		name = "pelagos",
		label_orientation = 0.15,
		orbit = {
			parent = { type = "space-location", name = "star" },
			distance = 20,
			orientation = 0.11,
		},
		subgroup = "planets",
		icon = "__pelagos__/graphics/pelagos.png",
		icon_size = 64,
		starmap_icon = "__pelagos__/graphics/starmap-planet-pelagos.png",
		starmap_icon_size = 512,
		map_gen_settings = MapGen_Pelagos(),
		draw_orbit = true,
		magnitude = 1.1,
		gravity_pull = 10,
		pollutant_type = "electromagnetic_waves",
		--pollutant_type = nil
		order = "a[pelagos]",
		surface_properties = {
			-- There is no stat for robot energy usage, it's (gravity/pressure) * 100x
			["day-night-cycle"] = 10 * minute,
			["magnetic-field"] = 50,
			["solar-power"] = 50,
			pressure = 1500,
			gravity = 15,
		},

		surface_render_parameters = {
			clouds = effects.default_clouds_effect_properties(),

			persistent_ambient_sounds = {
				base_ambience = { filename = "__base__/sound/world/world_base_wind.ogg", volume = 0.3 },
				wind = { filename = "__base__/sound/wind/wind.ogg", volume = 0.8 },
				crossfade = {
					order = { "wind", "base_ambience" },
					curve_type = "cosine",
					from = { control = 0.35, volume_percentage = 0.0 },
					to = { control = 2, volume_percentage = 100.0 },
				},
			},
			-- Should be based on the default day/night times, ie
			-- sun starts to set at 0.25
			-- sun fully set at 0.45
			-- sun starts to rise at 0.55
			-- sun fully risen at 0.75
			day_night_cycle_color_lookup = {
				{ 0.00, "__space-age__/graphics/lut/gleba-1-noon.png" },
				{ 0.15, "__space-age__/graphics/lut/gleba-2-afternoon.png" },
				{ 0.25, "__space-age__/graphics/lut/gleba-3-late-afternoon.png" },
				{ 0.35, "__space-age__/graphics/lut/gleba-4-sunset.png" },
				{ 0.45, "__space-age__/graphics/lut/gleba-5-after-sunset.png" },
				{ 0.55, "__space-age__/graphics/lut/gleba-6-before-dawn.png" },
				{ 0.65, "__space-age__/graphics/lut/gleba-7-dawn.png" },
				{ 0.75, "__space-age__/graphics/lut/gleba-8-morning.png" },
			},
		},
		solar_power_in_space = 200,
		platform_procession_set = {
			arrival = { "planet-to-platform-b" },
			departure = { "platform-to-planet-a" },
		},
		planet_procession_set = {
			arrival = { "platform-to-planet-b" },
			departure = { "planet-to-platform-a" },
		},
		procession_graphic_catalogue = planet_catalogue_pelagos,
		asteroid_spawn_influence = 1,
		asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba, 0.9),
	},
	is_planet = true,
})
data:extend({
	{
		type = "space-connection",
		name = "star-pelagos",
		subgroup = "planet-connections",
		from = "gleba",
		to = "pelagos",
		order = "d",
		length = 15000,
		asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora),
	},
})

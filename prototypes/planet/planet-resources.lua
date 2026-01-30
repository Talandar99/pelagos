local resource_autoplace = require("resource-autoplace")
--titanium-sludge
local crude_oil_collision_box = table.deepcopy(data.raw.resource["crude-oil"].collision_box)
data:extend({
	{
		type = "autoplace-control",
		name = "methane",
		localised_name = { "entity-name.methane" },
		richness = true,
		can_be_disabled = true,
		order = "a-e-b",
		category = "resource",
		icon = "__pelagos__/graphics/methane.png",

		hidden = true,
	},
	{
		type = "resource",
		name = "methane",
		collision_mask = { layers = { water_resource = true } },
		icon = "__pelagos__/graphics/methane.png",
		flags = { "placeable-neutral" },
		category = "offshore-fluid",
		subgroup = "mineable-fluids",
		order = "a-b-b",
		infinite = true,
		highlight = true,
		--minimum = 60000,
		minimum = 100000,
		normal = 250000,
		infinite_depletion_amount = 1,
		resource_patch_search_radius = 50,
		minable = {
			mining_time = 1,
			results = {
				{
					type = "fluid",
					name = "methane",
					amount_min = 6, --base is 10
					amount_max = 6, --base is 10
					probability = 1,
				},
			},
		},
		map_generator_bounding_box = { { -6, -6 }, { 6, 6 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		collision_box = crude_oil_collision_box,
		autoplace = resource_autoplace.resource_autoplace_settings({
			name = "methane",
			order = "methane",
			--base_density = 10,
			base_density = 1,
			base_spots_per_km2 = 1.8,
			--random_probability = 1 / 400,
			random_probability = 1 / 100,
			random_spot_size_minimum = 2, --base 2
			random_spot_size_maximum = 4, --base 4
			additional_richness = 250000,
			has_starting_area_placement = false,
			regular_rq_factor_multiplier = 1,
			planet = "pelagos",
		}),
		stage_counts = { 0 },
		stages = {
			sheet = {
				filename = "__pelagos__/graphics/methane-stain.png",
				priority = "extra-high",
				width = 260,
				height = 220,
				frame_count = 1,
				variation_count = 1,
				shift = util.by_pixel(0, -2),
				scale = 0.5,
			},
		},
		map_color = { 0.0, 1.0, 0.0 },
		map_grid = false,
	},
})
data:extend({
	{
		type = "autoplace-control",
		name = "titanium-sludge",
		richness = true,
		can_be_disabled = true,
		order = "a-e-b",
		category = "resource",
		icon = "__pelagos__/graphics/titanium/titanium-sludge.png",

		hidden = true,
	},
	{
		type = "resource",
		name = "titanium-sludge",
		collision_mask = { layers = { water_resource = true } },
		icon = "__pelagos__/graphics/titanium/titanium-sludge.png",
		flags = { "placeable-neutral" },
		category = "offshore-fluid",
		subgroup = "mineable-fluids",
		order = "a-b-b",
		infinite = true,
		highlight = true,
		--minimum = 60000,
		minimum = 100000,
		normal = 250000,
		surface_conditions = {
			{
				property = "pressure",
				min = 1809,
				max = 1809,
			},
		},
		infinite_depletion_amount = 1,
		resource_patch_search_radius = 50,
		minable = {
			mining_time = 1,
			results = {
				{
					type = "fluid",
					name = "titanium-sludge",
					amount_min = 6, --base is 10
					amount_max = 6, --base is 10
					probability = 1,
				},
			},
		},
		map_generator_bounding_box = { { -6, -6 }, { 6, 6 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		collision_box = crude_oil_collision_box,
		autoplace = resource_autoplace.resource_autoplace_settings({
			name = "titanium-sludge",
			order = "titanium-sludge",
			--base_density = 10,
			base_density = 1,
			base_spots_per_km2 = 1.8,
			--random_probability = 1 / 400,
			random_probability = 1 / 100,
			random_spot_size_minimum = 2, --base 2
			random_spot_size_maximum = 4, --base 4
			additional_richness = 250000,
			has_starting_area_placement = false,
			regular_rq_factor_multiplier = 1,
			planet = "pelagos",
		}),
		stage_counts = { 0 },
		stages = {
			sheet = {
				filename = "__pelagos__/graphics/titanium/titanium-sludge-stain.png",
				priority = "extra-high",
				width = 260,
				height = 220,
				frame_count = 1,
				variation_count = 1,
				shift = util.by_pixel(0, -2),
				scale = 0.5,
			},
		},
		map_color = { r = 1.0, g = 0.7, b = 0.0 },
		map_grid = false,
	},
})
--methane
-- methane resource, based on cargo ships offshore-oil

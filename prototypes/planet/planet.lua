local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_pelagos = require("procession-catalogue-pelagos")
local effects = require("__core__.lualib.surface-render-parameter-effects")

-- methane resource, based on cargo ships offshore-oil
local resource_autoplace = require("resource-autoplace")

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
	},
	{
		type = "resource-category",
		name = "offshore-fluid",
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
		minimum = 60000,
		normal = 250000,
		surface_conditions = {
			{
				property = "pressure",
				min = 1500,
				max = 1500,
			},
		},
		infinite_depletion_amount = 20,
		resource_patch_search_radius = 50,
		minable = {
			mining_time = 1,
			results = {
				{
					type = "fluid",
					name = "methane",
					amount_min = 10,
					amount_max = 10,
					probability = 1,
				},
			},
		},
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		autoplace = resource_autoplace.resource_autoplace_settings({
			name = "methane",
			order = "b",
			base_density = 10,
			base_spots_per_km2 = 1.8,
			random_probability = 1 / 400,
			random_spot_size_minimum = 2,
			random_spot_size_maximum = 4,
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
				scale = 0.6,
			},
		},
		map_color = { 0.5, 0.9, 0.5 },
		map_grid = false,
	},
})
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
		surface_conditions = {
			{
				property = "pressure",
				min = 1500,
				max = 1500,
			},
		},
		minable = {
			mining_time = 2,
			results = {
				{ type = "item", name = "stone", amount = 30 },
				{ type = "item", name = "fermentation-bacteria", amount = 5 },
			},
		},
		max_health = 500,
		collision_box = { { -2.1, -1.0 }, { 0.7, 1.0 } },
		selection_box = { { -2.3, -1.3 }, { 0.9, 1.2 } },
		render_layer = "object",
		pictures = {
			{
				filename = "__pelagos__/graphics/pelagos-big-rock.png",
				width = 176,
				height = 114,
			},
		},
		autoplace = {
			control = "pelagos_rocks",
			order = "a[doodad]-a[rock]-b[big]",
			probability_expression = "multiplier * control",
			local_expressions = {
				multiplier = 0.001, -- dostosuj ilość spawnów
				control = "control:pelagos_rocks:size",
			},
		},
	},
})
local function MapGen_Pelagos()
	local map = {
		aux_climate_control = false,
		moisture_climate_control = false,
		property_expression_names = {
			elevation = "nauvis_elevation",
			temperature = "nauvis_temperature",
			moisture = "moisture_basic",
			aux = "nauvis_aux",
		},
		cliff_settings = nil,
		default_enable_all_autoplace_controls = false,
		autoplace_controls = {
			["water"] = { frequency = 8, size = 12 },
			["iron-ore"] = { frequency = 3, size = 1, richness = 3 },
			["copper-ore"] = { frequency = 3, size = 1, richness = 3 },
			["methane"] = { frequency = 3, size = 1, richness = 1 },
		},
		autoplace_settings = {
			["tile"] = {
				settings = {
					["sand-1"] = {},
					["water"] = {},
				},
			},
			["decorative"] = { settings = {} },
			["entity"] = {
				settings = {
					["fish"] = {},
					["coconut-palm"] = {},
					["iron-ore"] = {},
					["copper-ore"] = {},
					["pelagos-big-rock"] = {},
					["methane"] = {},
				},
			},
		},
		water = 0.8, --was 0.8
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
		icon = "__pelagos__/graphics/starmap-planet-pelagos.png",
		icon_size = 512,
		starmap_icon = "__pelagos__/graphics/starmap-planet-pelagos.png",
		starmap_icon_size = 512,
		map_gen_settings = MapGen_Pelagos(),
		draw_orbit = true,
		magnitude = 1.1,
		gravity_pull = 10,
		pollutant_type = nil,
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

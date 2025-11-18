local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

-- fix overlaping corrundum path
if mods["corrundum"] then
	data:extend({
		{
			type = "space-connection",
			name = "pelagos-corrundum",
			subgroup = "planet-connections",
			from = "pelagos",
			to = "corrundum",
			length = 15000,
			order = "d",
			asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora),
		},
	})
	data.raw["space-connection"]["gleba-corrundum"] = nil
end

-------------------------------------------------------------------------------
--pelagos fish breeding
local fish_breeding = data.raw.recipe["fish-breeding"]

fish_breeding.surface_conditions = {
	{ property = "pressure", min = 0, max = 2000 }, -- Nauvis: 1000, Pelagos: 1500
}
fish_breeding.enabled = false
-------------------------------------------------------------------------------
-- temporary fix until miguel moves his ass
-------------------------------------------------------------------------------
if mods["quality-seeds"] then
	table.insert(quality_seeds.ignore_plants, "coconut-palm")
end
-------------------------------------------------------------------------------
if settings.startup["allow-galleon-before-pelagos"].value then
	if mods["pirateship"] and data.raw.technology["steel-axe"] and data.raw.recipe["pirateship"] then
		table.insert(data.raw.technology["steel-axe"].effects, { type = "unlock-recipe", recipe = "pirateship" })
	end
end
-----------------------------------
if settings.startup["pelagos-methane-on-vesta"].value then
	if mods["skewer_planet_vesta"] then
		if data.raw.planet.vesta and data.raw.planet.vesta.map_gen_settings then
			local resource_autoplace = require("resource-autoplace")
			resource_autoplace.initialize_patch_set("methane", false, "vesta")

			data.raw.resource["methane"].autoplace = resource_autoplace.resource_autoplace_settings({
				name = "methane",
				order = "b",
				base_density = 1,
				base_spots_per_km2 = 3,
				random_probability = 1 / 100,
				random_spot_size_minimum = 1,
				random_spot_size_maximum = 2,
				additional_richness = 250000,
				has_starting_area_placement = true,
				regular_rq_factor_multiplier = 1,
				planet = "vesta",
			})

			data.raw.planet.vesta.map_gen_settings.autoplace_controls["methane"] = {}
			data.raw.planet.vesta.map_gen_settings.autoplace_settings.entity.settings["methane"] = {}

			data.raw["planet"]["vesta"].map_gen_settings.autoplace_controls["tritium"] = nil
			data.raw["planet"]["vesta"].map_gen_settings.autoplace_settings["tile"].settings["ammoniacal-ocean-vesta-tritium"] =
				nil
			table.insert(data.raw.technology["planet-discovery-vesta"].prerequisites, "deep_sea_oil_extraction")
		end
	end
end

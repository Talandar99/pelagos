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
		table.insert(data.raw.technology["steel-axe"].effects, { type = "unlock-recipe", recipe = "port" })
	end
end
-------------------------------------------------------------------------------
-- pelagos science pack addtion settings
-------------------------------------------------------------------------------
if settings.startup["pelagos-contribute-to-aquilo-discovery"].value then
	table.insert(data.raw.technology["planet-discovery-aquilo"].prerequisites, "pelagos-science-pack")
	table.insert(data.raw.technology["planet-discovery-aquilo"].unit.ingredients, { "pelagos-science-pack", 1 })
end
if settings.startup["pelagos-contribute-to-promethium-science"].value then
	table.insert(data.raw.technology["promethium-science-pack"].prerequisites, "pelagos-science-pack")
	table.insert(data.raw.technology["promethium-science-pack"].unit.ingredients, { "pelagos-science-pack", 1 })
	table.insert(data.raw.technology["research-productivity"].unit.ingredients, { "pelagos-science-pack", 1 })
end
-------------------------------------------------------------------------------
if settings.startup["pelagos-methane-on-vesta"].value then
	if mods["skewer_planet_vesta"] then
		if data.raw.planet.vesta and data.raw.planet.vesta.map_gen_settings then
			local resource_autoplace = require("resource-autoplace")
			resource_autoplace.initialize_patch_set("methane", false, "vesta")

			data.raw.planet.vesta.map_gen_settings.autoplace_controls["methane"] = {}
			data.raw.planet.vesta.map_gen_settings.autoplace_settings.entity.settings["methane"] = {}

			data.raw["planet"]["vesta"].map_gen_settings.autoplace_controls["tritium"] = nil
			data.raw["planet"]["vesta"].map_gen_settings.autoplace_settings["tile"].settings["ammoniacal-ocean-vesta-tritium"] =
				nil
			table.insert(data.raw.technology["planet-discovery-vesta"].prerequisites, "deep_sea_oil_extraction")
		end
	end
end

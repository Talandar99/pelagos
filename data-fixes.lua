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
-- temporary fix until miguel
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

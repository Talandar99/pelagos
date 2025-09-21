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
-- temporary fix until miguel fixes his mod
-------------------------------------------------------------------------------
if mods["quality-seeds"] then
	table.insert(quality_seeds.ignore_plants, "coconut-palm")
end
-------------------------------------------------------------------------------

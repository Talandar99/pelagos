require("prototypes.fluids")
require("prototypes.items")
require("prototypes.tiles")
require("prototypes.plants")
require("prototypes.planet.noise-expressions")
require("prototypes.planet.planet-resources")
require("prototypes.planet.planet")
require("prototypes.recipes.alternative-vanila")
require("prototypes.recipes.calciner")
require("prototypes.recipes.new")
require("prototypes.recipes.compatibility")
require("prototypes.technologies")
require("prototypes.liquid-fuel.calciner")
require("prototypes.liquid-fuel.diesel-drill")
require("prototypes.liquid-fuel.diesel-inserter")
require("prototypes.liquid-fuel.diesel-pump")
require("prototypes.liquid-fuel.diesel-assembling-machine")
require("prototypes.liquid-fuel.barreling-machine")
require("prototypes.rockets")
require("prototypes.canal-excavator")
require("prototypes.cargo-ships")
require("prototypes.tips-and-tricks")
require("data-fixes")

--if mods["any-planet-start"] then
--	APS.add_planet({
--		name = "pelagos",
--		filename = "__pelagos__/aps.lua",
--		technology = "planet-discovery-pelagos",
--	})
--end
-- dummy prototype
if data.raw["rocket-silo"]["rocket-silo"] then
	local pelagos_silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])
	pelagos_silo.name = "pelagos-rocket-silo"
	pelagos_silo.hidden = true -- nie pojawi się w budowaniu
	pelagos_silo.selectable_in_game = false

	data:extend({ pelagos_silo })
end

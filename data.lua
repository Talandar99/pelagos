require("prototypes.fluids")
require("prototypes.items")
require("prototypes.tiles")
require("prototypes.corrosive")
require("prototypes.plants")
require("prototypes.planet.electromagnetic-waves")
require("prototypes.planet.noise-expressions")
require("prototypes.planet.planet-resources")
require("prototypes.planet.tiles")
require("prototypes.planet.planet")
require("prototypes.planet.spitters")
require("prototypes.planet.explosions")
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
require("prototypes.liquid-fuel.diesel-agricultural-tower")
require("prototypes.liquid-fuel.fast-diesel-inserter")
require("prototypes.liquid-fuel.barreling-machine")
require("prototypes.liquid-fuel.diesel-bulk-crane-inserter")
require("prototypes.liquid-fuel.ethanol-thruster")
require("prototypes.liquid-fuel.lighthouse")
require("prototypes.rockets")
require("prototypes.heavy-gun-turret")
require("prototypes.canal-excavator")
require("prototypes.cargo-ships")
require("prototypes.tips-and-tricks")
require("data-fixes")

if mods["any-planet-start"] then
	APS.add_planet({
		name = "pelagos",
		filename = "__pelagos__/aps.lua",
		technology = "planet-discovery-pelagos",
	})
end
-- dummy prototype
if data.raw["rocket-silo"]["rocket-silo"] then
	local pelagos_silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])
	pelagos_silo.name = "pelagos-rocket-silo"
	pelagos_silo.hidden = true
	pelagos_silo.selectable_in_game = false

	data:extend({ pelagos_silo })
end

require("prototypes.fluids")
require("prototypes.items")
require("prototypes.corrosive-definition")
require("prototypes.plants")
require("prototypes.planet.electromagnetic-waves")
require("prototypes.planet.noise-expressions")
require("prototypes.planet.planet-resources")
require("prototypes.planet.tiles")
require("prototypes.planet.planet")
require("prototypes.planet.spitters")
require("prototypes.planet.spitters_reskin")
require("prototypes.planet.explosions")
require("prototypes.recipes.alternative-vanila")
require("prototypes.recipes.new")
require("prototypes.liquid-fuel.diesel-agricultural-tower")
require("prototypes.liquid-fuel.diesel-stack-crane-inserter")
require("prototypes.liquid-fuel.ethanol-thruster")
require("prototypes.liquid-fuel.diesel-dragon.diesel-dragon-silo")
require("prototypes.liquid-fuel.diesel-dragon.surface-condition")
require("prototypes.liquid-fuel.diesel-dragon.recipes")
require("prototypes.liquid-fuel.diesel-dragon.technology")
require("prototypes.canal-excavator")
require("prototypes.tips-and-tricks")
require("prototypes.achivements")
require("prototypes.music")
require("compatibility.data-recipes-additions")
require("compatibility.productivity")
require("compatibility.new-recipes")
require("prototypes.technologies")
require("prototypes.technologies-data-changes")

if mods["multi_surface_promethium_plate_recipe"] then
	require("compatibility.msppr")
end
require("data-fixes")

if mods["any-planet-start"] then
	APS.add_planet({
		name = "pelagos",
		filename = "__pelagos__/aps.lua",
		technology = "planet-discovery-pelagos",
	})
end

data.raw["tips-and-tricks-item"]["cargo-ships"].category = "space-age"
data.raw["tips-and-tricks-item"]["cargo-ships"].order = "pelagos-g"
data.raw["tips-and-tricks-item"]["cargo-ships"].indent = 1

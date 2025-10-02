-- reenables fishing settings disabled by cargo ships
if settings.startup["pelagos-allow-fishing"].value then
	for _, inserter in pairs(data.raw.inserter) do
		inserter.use_easter_egg = true
	end
else
	for _, inserter in pairs(data.raw.inserter) do
		inserter.use_easter_egg = false
	end
end

-- force small electric generator
if settings.startup["pelagos-force-small-electric-generator"].value then
	if data.raw["generator"]["or_power_electric"] then
		local gen = data.raw["generator"]["or_power_electric"]
		gen.max_power_output = "350kW" --was 850
		gen.energy_source.output_flow_limit = "250kW" --was 850
		gen.fluid_box.volume = 500
		gen.effectivity = 5000
	end
end

-- make sure plants can grow on sand-1
require("prototypes.plants-autoplace-settings")
require("prototypes.liquid-fuel.fuel-value")
require("prototypes.liquid-fuel.barrel-fuel")
require("prototypes.pirate-ship")
require("prototypes.liquid-fuel.rocket-silo")
require("prototypes.planet.electromagnetic-waves-pollution-emision")
require("prototypes.corrosive-dmg-resistances")

-- allow foundation on pelagos-deepsea
local landfill = data.raw.item["foundation"]
if landfill and landfill.place_as_tile and landfill.place_as_tile.tile_condition then
	table.insert(landfill.place_as_tile.tile_condition, "pelagos-deepsea")
end
-- make pelagos-deepsea water_tile_type
table.insert(water_tile_type_names, "pelagos-deepsea")

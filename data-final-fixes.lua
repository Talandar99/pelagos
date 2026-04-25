require("prototypes.data-final-fixes-cargo-ships")
require("prototypes.plants-autoplace-settings")
require("prototypes.liquid-fuel.rocket-silo")
-- allow foundation on pelagos-deepsea
local landfill = data.raw.item["foundation"]
if landfill and landfill.place_as_tile and landfill.place_as_tile.tile_condition then
	table.insert(landfill.place_as_tile.tile_condition, "pelagos-deepsea")
end
-- make pelagos-deepsea water_tile_type
table.insert(water_tile_type_names, "pelagos-deepsea")

-- sandfill
local sandfill = table.deepcopy(data.raw.tile["sand-1"])
sandfill.name = "pelagos-sandfill"
sandfill.minable = { mining_time = 0.2, result = "pelagos-sandfill" }
sandfill.localised_name = { "tile-name.pelagos-sandfill" }
sandfill.absorptions_per_second = nil
sandfill.tile_order = "a[artificial]-d[utility]-a[sandfill]"
data:extend({ sandfill })
data.raw["item"]["pelagos-sandfill"].place_as_tile.tile_condition =
	table.deepcopy(data.raw["item"]["landfill"].place_as_tile.tile_condition)
-- sandfill

require("prototypes.planet.electromagnetic-waves-pollution-emision")
require("prototypes.corrosive-dmg-resistances")
-- Disable Arig's high-support electric poles on Pelagos deep sea tiles

-- Assign that layer to the coral so foundations collide with it
local coral = data.raw["simple-entity"]["pelagos-titanium-coral"]
if coral then
	coral.collision_mask = coral.collision_mask or { layers = {} }
	if not coral.collision_mask.layers then
		coral.collision_mask = { layers = coral.collision_mask }
	end
	coral.collision_mask.layers["water_resource"] = true
end

-- diesel assembling-machine recipes
local base_categories = data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories
local diesel_categories = table.deepcopy(base_categories)
table.insert(diesel_categories, "barreling")
table.insert(diesel_categories, "cargo-crates")
data.raw["assembling-machine"]["diesel-assembling-machine"].crafting_categories = diesel_categories

if data.raw["mining-drill"]["canex-excavator"] then
	local excavator = data.raw["mining-drill"]["canex-excavator"]
end

if mods["lignumis"] then
	--add advanced-crafting to steam assembler if lignumis is installed
	local steam_assembler = data.raw["assembling-machine"]["steam-assembling-machine"]
	if steam_assembler and steam_assembler.crafting_categories then
		local has_advanced = false

		for _, category in pairs(steam_assembler.crafting_categories) do
			if category == "advanced-crafting" then
				has_advanced = true
				break
			end
		end

		if not has_advanced then
			table.insert(steam_assembler.crafting_categories, "advanced-crafting")
		end
	end
end

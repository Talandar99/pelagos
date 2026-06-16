require("prototypes.plants-autoplace-settings")
require("prototypes.liquid-fuel.rocket-silo")
-- allow foundation on pelagos-deepsea
local landfill = data.raw.item["foundation"]
if landfill and landfill.place_as_tile and landfill.place_as_tile.tile_condition then
	table.insert(landfill.place_as_tile.tile_condition, "pelagos-deepsea")
end
-- make pelagos-deepsea water_tile_type
table.insert(water_tile_type_names, "pelagos-deepsea")

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

local function hide_technology_and_rewire(old_tech, new_tech)
	local old = data.raw.technology[old_tech]
	local new = data.raw.technology[new_tech]

	if not old or not new then
		return
	end

	for _, tech in pairs(data.raw.technology) do
		if tech.prerequisites then
			for i = #tech.prerequisites, 1, -1 do
				if tech.prerequisites[i] == old_tech then
					table.remove(tech.prerequisites, i)

					local exists = false
					for _, p in pairs(tech.prerequisites) do
						if p == new_tech then
							exists = true
							break
						end
					end

					if not exists then
						table.insert(tech.prerequisites, new_tech)
					end
				end
			end
		end
	end

	if old.effects then
		new.effects = new.effects or {}
		for _, effect in pairs(old.effects) do
			table.insert(new.effects, effect)
		end
	end

	old.hidden = true
	old.enabled = false
end
-- remove unused researches
data.raw["technology"]["cargo_ships"].effects = {}
data.raw["technology"]["water_transport"].effects = {}
hide_technology_and_rewire("water_transport", "automated_water_transport")
hide_technology_and_rewire("cargo_ships", "automated_water_transport")

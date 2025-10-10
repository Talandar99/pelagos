-- force small electric generator
if settings.startup["pelagos-force-small-electric-generator"].value then
	if data.raw["generator"]["or_power_electric"] then
		local gen = data.raw["generator"]["or_power_electric"]
		gen.max_power_output = "350kW" --was 850
		gen.energy_source.output_flow_limit = "350kW" --was 850
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

-- Disable Arig's high-support electric poles on Pelagos deep sea tiles

-- Register a new collision layer if it doesn't exist yet
if not data.raw["collision-layer"]["pelagos-deepsea"] then
	data:extend({
		{
			type = "collision-layer",
			name = "pelagos-deepsea",
		},
	})
end

-- Add this collision layer to the "pelagos-deepsea" tile
local deepsea = data.raw.tile["pelagos-deepsea"]
if deepsea then
	-- Ensure the tile has a proper collision_mask structure
	if not deepsea.collision_mask then
		deepsea.collision_mask = { layers = {} }
	elseif not deepsea.collision_mask.layers then
		deepsea.collision_mask = { layers = deepsea.collision_mask }
	end

	deepsea.collision_mask.layers["pelagos-deepsea"] = true
end

-- If Planetaris Unbounded is installed, restrict pole placement on deep sea
if mods["planetaris-unbounded"] then
	local pole = data.raw["electric-pole"] and data.raw["electric-pole"]["planetaris-high-support-electric-pole"]
	if pole then
		-- Ensure the pole collides with our deep sea layer
		pole.collision_mask = pole.collision_mask or { layers = {} }
		if not pole.collision_mask.layers then
			pole.collision_mask = { layers = pole.collision_mask }
		end
		pole.collision_mask.layers["pelagos-deepsea"] = true

		-- Add a buildability rule for clarity (optional but harmless)
		pole.tile_buildability_rules = pole.tile_buildability_rules or {}
		table.insert(pole.tile_buildability_rules, {
			area = { { -1, -1 }, { 1, 1 } },
			colliding_tiles = { layers = { ["pelagos-deepsea"] = true } },
			remove_on_collision = true,
		})
	end
end

-- 1️⃣ Create a custom collision layer for coral blocking if it doesn't exist
if not data.raw["collision-layer"]["pelagos-coral-block"] then
	data:extend({
		{
			type = "collision-layer",
			name = "pelagos-coral-block",
		},
	})
end

-- 2️⃣ Assign that layer to the coral so foundations collide with it
local coral = data.raw["simple-entity"]["pelagos-titanium-coral"]
if coral then
	coral.collision_mask = coral.collision_mask or { layers = {} }
	if not coral.collision_mask.layers then
		coral.collision_mask = { layers = coral.collision_mask }
	end
	coral.collision_mask.layers["pelagos-coral-block"] = true
end

-- 3️⃣ Make foundations respect that layer and refuse to place on it
for _, tile in pairs(data.raw.tile) do
	if tile.name == "foundation" or tile.name == "landfill" or tile.name == "wooden-platform" then
		tile.collision_mask = tile.collision_mask or { layers = {} }
		if not tile.collision_mask.layers then
			tile.collision_mask = { layers = tile.collision_mask }
		end
		tile.collision_mask.layers["pelagos-coral-block"] = true
	end
end

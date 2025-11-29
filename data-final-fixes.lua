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
if not data.raw["collision-layer"]["deepsea_mechanic"] then
	data:extend({
		{
			type = "collision-layer",
			name = "deepsea_mechanic",
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

	deepsea.collision_mask.layers["deepsea_mechanic"] = true
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
		pole.collision_mask.layers["deepsea_mechanic"] = true

		-- Add a buildability rule for clarity (optional but harmless)
		pole.tile_buildability_rules = pole.tile_buildability_rules or {}
		table.insert(pole.tile_buildability_rules, {
			area = { { -1, -1 }, { 1, 1 } },
			colliding_tiles = { layers = { ["deepsea_mechanic"] = true } },
			remove_on_collision = true,
		})
	end
end

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
data.raw["assembling-machine"]["diesel-assembling-machine"].crafting_categories = diesel_categories

-- remove buggy input from pirate ship mod
data:extend({
	{
		type = "custom-input",
		name = "enter-pirate-ship",
		key_sequence = "",
		consuming = "none",
	},
})

-- disable elevated rails on pleagos deep sea
if mods["elevated-rails"] then
	data.raw["utility-constants"].default.default_collision_masks["rail-support"].layers["deepsea_mechanic"] = true
end

-- add placeholder layer for wooden-platform rework
if not data.raw["collision-layer"]["wooden-platform"] then
	data:extend({
		{
			type = "collision-layer",
			name = "wooden-platform",
		},
	})
end

--allow oil rig to use any fluid as fuel (it needs fuel value in order to not die randomly from lack of energy)
local generator = data.raw["generator"]["or_power_electric"]
if generator and generator.fluid_box then
	generator.fluid_box.filter = nil
end

-- add settings to change cargo ships capacity
local boat_inventory = settings.startup["pelagos-boat-inventory"].value
local cargo_inventory = settings.startup["pelagos-cargoship-inventory"].value
local tanker_capacity = settings.startup["pelagos-tanker-capacity"].value
local boat_friction = settings.startup["pelagos-boat-friction"].value

if data.raw["cargo-wagon"]["cargo_ship"] then
	data.raw["cargo-wagon"]["cargo_ship"].inventory_size = cargo_inventory
end

if data.raw["fluid-wagon"]["oil_tanker"] then
	data.raw["fluid-wagon"]["oil_tanker"].capacity = tanker_capacity
end

if data.raw["car"]["indep-boat"] then
	data.raw["car"]["indep-boat"].inventory_size = boat_inventory
	data.raw["car"]["indep-boat"].allow_remote_driving = true
	data.raw["car"]["indep-boat"].equipment_grid = "medium-equipment-grid"
	data.raw["car"]["indep-boat"].trash_inventory_size = 10
	data.raw["car"]["indep-boat"].chunk_exploration_radius = 3
	data.raw["car"]["indep-boat"].friction = boat_friction
	data.raw["car"]["indep-boat"].braking_power = "0.75MW"
	--indep_boat.friction = 0.002/speed_modifier -- default speed_modifier is 1
end
-- oil rig
if data.raw["electric-pole"]["or_pole"] then
	data.raw["electric-pole"]["or_pole"].supply_area_distance = 7.5 --old was 4.5
end

if data.raw["storage-tank"]["or_tank"] then
	data.raw["storage-tank"]["or_tank"].fluid_box.volume = 150000 --overrides default settings
end

if data.raw["mining-drill"]["oil_rig"] then
	data.raw["mining-drill"]["oil_rig"].energy_usage = "120kW" -- was 750
end

-- hide bridge and all related things

-- items
if data.raw["item"]["bridge_base"] then
	data.raw["item"]["bridge_base"].hidden = true
	data.raw["item"]["bridge_base"].hidden_in_factoriopedia = true
end

if data.raw["item"]["bridge_gate"] then
	data.raw["item"]["bridge_gate"].hidden = true
	data.raw["item"]["bridge_gate"].hidden_in_factoriopedia = true
end

-- hide train-stop entity
if data.raw["train-stop"]["bridge_base"] then
	local e = data.raw["train-stop"]["bridge_base"]
	e.selectable_in_game = false
	e.flags = {
		"placeable-neutral",
		"not-blueprintable",
		"not-deconstructable",
		"not-upgradable",
	}
	e.hidden_in_factoriopedia = true
end

-- hide gate entity
if data.raw["gate"]["bridge_gate"] then
	local g = data.raw["gate"]["bridge_gate"]
	g.selectable_in_game = false
	g.flags = {
		"placeable-neutral",
		"not-blueprintable",
		"not-deconstructable",
	}
	g.hidden_in_factoriopedia = true
end

-- hide recipes
if data.raw["recipe"]["bridge_base"] then
	data.raw["recipe"]["bridge_base"].enabled = false
	data.raw["recipe"]["bridge_base"].hidden = true
	data.raw["recipe"]["bridge_base"].hidden_in_factoriopedia = true
end

if data.raw["recipe"]["bridge_gate"] then
	data.raw["recipe"]["bridge_gate"].enabled = false
	data.raw["recipe"]["bridge_gate"].hidden = true
	data.raw["recipe"]["bridge_gate"].hidden_in_factoriopedia = true
end
data.raw["tips-and-tricks-item"]["cargo-ships"].category = "space-age"
data.raw["tips-and-tricks-item"]["cargo-ships"].order = "pelagos-g"
data.raw["tips-and-tricks-item"]["cargo-ships"].indent = 1

local function add_technology_prerequisite(tech_name, prerequisite_name)
	if data.raw["technology"][tech_name] == nil then
		return
	end

	local tech = data.raw["technology"][tech_name]
	tech.prerequisites = tech.prerequisites or {}
	for _, prereq in ipairs(tech.prerequisites) do
		if prereq == prerequisite_name then
			return
		end
	end

	table.insert(tech.prerequisites, prerequisite_name)
end
local function add_technology_science_pack(tech_name, pack_name, amount)
	if data.raw["technology"][tech_name] == nil then
		return
	end
	local tech = data.raw["technology"][tech_name]
	if tech.unit == nil then
		return
	end
	tech.unit.ingredients = tech.unit.ingredients or {}
	for _, ingredient in ipairs(tech.unit.ingredients) do
		local current_name = ingredient.name or ingredient[1]
		if current_name == pack_name then
			return
		end
	end
	table.insert(tech.unit.ingredients, {
		type = "item",
		name = pack_name,
		amount = amount or 1,
	})
end
local function add_technology_effect_recipe(tech_name, recipe_name)
	if data.raw["technology"][tech_name] == nil then
		return
	end
	local tech = data.raw["technology"][tech_name]
	tech.effects = tech.effects or {}
	for _, effect in ipairs(tech.effects) do
		if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
			return
		end
	end
	table.insert(tech.effects, {
		type = "unlock-recipe",
		recipe = recipe_name,
	})
end

local function remove_technology_effect_recipe(tech_name, recipe_name)
	if data.raw["technology"][tech_name] == nil then
		return
	end
	local tech = data.raw["technology"][tech_name]
	if tech.effects == nil then
		return
	end
	for i, effect in ipairs(tech.effects) do
		if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
			table.remove(tech.effects, i)
			return
		end
	end
end

-- pre science pack
add_technology_prerequisite("coconut-processing-technology", "planet-discovery-pelagos")
add_technology_prerequisite("calciner", "planet-discovery-pelagos")
remove_technology_effect_recipe("calciner", "calciner-coconut-husk-carbonization")
data.raw["technology"]["calciner"].unit = nil
data.raw["technology"]["calciner"].research_trigger = {
	type = "build-entity",
	entity = "diesel-assembling-machine",
}

add_technology_prerequisite("diesel-automation", "planet-discovery-pelagos")
add_technology_prerequisite("diesel-automation", "coconut-processing-technology")
remove_technology_effect_recipe("diesel-automation", "crane-bulk-diesel-inserter")
data.raw["technology"]["diesel-automation"].unit = nil
data.raw["technology"]["diesel-automation"].research_trigger = {
	type = "craft-item",
	item = "coconut-sealant",
}

--decomposer
add_technology_prerequisite("decomposer", "planet-discovery-pelagos")
add_technology_prerequisite("decomposer", "coconut-processing-technology")
add_technology_effect_recipe("decomposer", "nutrients-from-spoilage-methane")
add_technology_effect_recipe("decomposer", "pelagos-biolubricant")
add_technology_effect_recipe("decomposer", "corrosive-firearm-magazine")
data.raw["technology"]["decomposer"].unit = nil
data.raw["technology"]["decomposer"].research_trigger = {
	type = "mine-entity",
	entity = "pelagos-big-rock",
}

add_technology_prerequisite("automated_water_transport", "coconut-processing-technology")
add_technology_prerequisite("automated_water_transport", "planet-discovery-pelagos")

add_technology_prerequisite("diesel-agriculture", "landfill")
add_technology_prerequisite("diesel-agriculture", "coconut-processing-technology")
add_technology_prerequisite("diesel-agriculture", "engine")

add_technology_prerequisite("copper-biter-captivity", "gun-turret")
add_technology_prerequisite("copper-biter-captivity", "planet-discovery-pelagos")
add_technology_prerequisite("copper-biter-captivity", "titanium")

add_technology_prerequisite("titanium", "planet-discovery-pelagos")
add_technology_prerequisite("titanium", "automated_water_transport")

add_technology_prerequisite("canex-excavator", "planet-discovery-pelagos")
add_technology_prerequisite("canex-excavator", "diesel-automation")
add_technology_prerequisite("canex-excavator", "decomposer")
data.raw["technology"]["canex-excavator"].unit = nil
data.raw["technology"]["canex-excavator"].research_trigger = {
	type = "build-entity",
	entity = "diesel-mining-drill",
}

add_technology_prerequisite("ethanol", "decomposer")
add_technology_prerequisite("ethanol", "calciner")

--science pack requirement
add_technology_prerequisite("pelagos-science-pack", "automated_water_transport")
add_technology_prerequisite("pelagos-science-pack", "decomposer")
add_technology_prerequisite("pelagos-science-pack", "diesel-automation")
add_technology_prerequisite("pelagos-science-pack", "calciner")
add_technology_prerequisite("pelagos-science-pack", "titanium")
add_technology_prerequisite("pelagos-science-pack", "ethanol")

-- post science pack
add_technology_prerequisite("cargo-crates", "planet-discovery-pelagos")
add_technology_prerequisite("cargo-crates", "pelagos-science-pack")
add_technology_prerequisite("lubrication-tower", "planet-discovery-pelagos")
add_technology_prerequisite("lubrication-tower", "pelagos-science-pack")
add_technology_prerequisite("portable-diesel-generator", "planet-discovery-pelagos")
add_technology_prerequisite("portable-diesel-generator", "pelagos-science-pack")
add_technology_prerequisite("diesel-asteroid-collector", "planet-discovery-pelagos")
add_technology_prerequisite("diesel-asteroid-collector", "pelagos-science-pack")
add_technology_prerequisite("tank_ship", "pelagos-science-pack")
add_technology_prerequisite("lithic-decomposition", "pelagos-science-pack")

add_technology_prerequisite("organic-decomposition", "pelagos-science-pack")

add_technology_prerequisite("asteroid-bioprocessing", "pelagos-science-pack")

add_technology_prerequisite("long-range-delivery-drone", "pelagos-science-pack")
add_technology_prerequisite("long-range-delivery-drone", "titanium")
add_technology_prerequisite("long-range-delivery-drone", "advanced-circuit")
add_technology_prerequisite("long-range-delivery-drone", "cargo-crates")

add_technology_prerequisite("improvised-concrete", "pelagos-science-pack")
add_technology_prerequisite("improvised-concrete", "improvised-landfill")
add_technology_prerequisite("improvised-concrete", "chemical-science-pack")
add_technology_prerequisite("improvised-concrete", "concrete")

add_technology_prerequisite("titanium-barrels", "pelagos-science-pack")
add_technology_prerequisite("titanium-barrels", "utility-science-pack")
add_technology_prerequisite("titanium-barrels", "tank_ship")
add_technology_prerequisite("titanium-barrels", "space-science-pack")

add_technology_prerequisite("project-diesel-dragon", "pelagos-science-pack")
add_technology_prerequisite("project-diesel-dragon", "cargo-crates")
add_technology_prerequisite("project-diesel-dragon", "titanium-barrels")
add_technology_prerequisite("project-diesel-dragon", "ethanol-thruster")

add_technology_prerequisite("ethanol-thruster", "pelagos-science-pack")
add_technology_prerequisite("ethanol-thruster", "long-range-delivery-drone")
add_technology_prerequisite("ethanol-thruster", "space-diesel")

add_technology_prerequisite("landfill-productivity", "pelagos-science-pack")
add_technology_prerequisite("landfill-productivity", "improvised-landfill")
add_technology_prerequisite("landfill-productivity", "production-science-pack")

add_technology_prerequisite("pelagos-biodiesel", "pelagos-science-pack")
add_technology_prerequisite("pelagos-biodiesel", "organic-sludge-processing")
add_technology_prerequisite("pelagos-biodiesel", "advanced-oil-processing")

add_technology_prerequisite("space-diesel", "planet-discovery-pelagos")
add_technology_prerequisite("space-diesel", "pelagos-science-pack")
add_technology_prerequisite("space-diesel", "pelagos-biodiesel")

add_technology_prerequisite("degradation-module", "pelagos-science-pack")
add_technology_prerequisite("degradation-module", "quality-module")

add_technology_prerequisite("degradation-module-2", "degradation-module")
add_technology_prerequisite("degradation-module-2", "epic-quality")
add_technology_prerequisite("degradation-module-2", "quality-module-2")

add_technology_prerequisite("Pirate_Ship", "pelagos-science-pack")
add_technology_prerequisite("Pirate_Ship", "military-science-pack")
add_technology_prerequisite("Pirate_Ship", "chemical-science-pack")

-- fulgora
add_technology_prerequisite("oversea-energy-distribution", "pelagos-science-pack")
add_technology_prerequisite("oversea-energy-distribution", "electromagnetic-science-pack")

-- gleba
add_technology_prerequisite("crane-stack-diesel-inserter", "pelagos-science-pack")
add_technology_prerequisite("crane-stack-diesel-inserter", "stack-inserter")
add_technology_prerequisite("crane-stack-diesel-inserter", "utility-science-pack")
add_technology_prerequisite("crane-stack-diesel-inserter", "agricultural-science-pack")

add_technology_prerequisite("cultivation-productivity", "agricultural-science-pack")
add_technology_prerequisite("cultivation-productivity", "copper-biter-captivity")
add_technology_prerequisite("cultivation-productivity", "pelagos-science-pack")

-- vulcanus
add_technology_prerequisite("heavy-gun-turret", "planet-discovery-pelagos")
add_technology_prerequisite("heavy-gun-turret", "pelagos-science-pack")
add_technology_prerequisite("heavy-gun-turret", "lithic-decomposition")

-- aquilo
add_technology_prerequisite("captive-copper-biter-spawner", "pelagos-science-pack")
add_technology_prerequisite("captive-copper-biter-spawner", "cryogenic-science-pack")
add_technology_prerequisite("captive-copper-biter-spawner", "copper-biter-captivity")
add_technology_prerequisite("degradation-module-3", "degradation-module-2")
add_technology_prerequisite("degradation-module-3", "legendary-quality")

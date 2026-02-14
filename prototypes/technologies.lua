-- pre science pack progression
data:extend({
	{
		type = "technology",
		name = "planet-discovery-pelagos",
		icon_size = 512,
		icons = PlanetsLib.technology_icon_constant_planet("__pelagos__/graphics/starmap-planet-pelagos-2k.png", 2048),
		essential = true,
		effects = {
			{
				type = "unlock-space-location",
				space_location = "pelagos",
				use_icon_overlay_constant = true,
			},
			{ type = "unlock-recipe", recipe = "pelagos-biochamber" },
			{ type = "unlock-recipe", recipe = "pelagos-rocket-part" },
			{ type = "unlock-recipe", recipe = "pirateship" },
			{ type = "unlock-recipe", recipe = "port" },
		},
		prerequisites = { "agricultural-science-pack", "fish-breeding", "captivity" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
		order = "ea[pelagos]",
	},
})
data:extend({
	{
		type = "technology",
		name = "project-diesel-dragon",
		icon_size = 752,
		icon = "__pelagos__/graphics/diesel-dragon/diesel-dragon-technology.png",
		effects = {
			{ type = "unlock-recipe", recipe = "advanced-titanium-plate-from-dust" },
			{ type = "unlock-recipe", recipe = "diesel-dragon" },
			{ type = "unlock-recipe", recipe = "pelagos-diesel-rocket-part" },
			{ type = "unlock-recipe", recipe = "gleba-diesel-rocket-part" },
			{ type = "unlock-recipe", recipe = "aquilo-diesel-rocket-part" },
			{ type = "unlock-recipe", recipe = "nauvis-diesel-rocket-part" },
			{ type = "unlock-recipe", recipe = "vulcanus-diesel-rocket-part" },
			{ type = "unlock-recipe", recipe = "fulgora-diesel-rocket-part" },
		},
		prerequisites = { "pelagos-science-pack", "long-range-delivery-drone", "titanium-barrels", "pelagos-biodiesel" },
		unit = {
			count = 10000,
			ingredients = {
				{ "pelagos-science-pack", 1 },
			},
			time = 30,
		},
		order = "ea[pelagos]",
	},
})

data:extend({
	{
		type = "technology",
		name = "coconut-processing-technology",
		icon = "__pelagos__/graphics/coconut-processing-technology.png",
		icon_size = 512,
		effects = {
			{ type = "unlock-recipe", recipe = "nutrients-from-coconut-meat" },
			{ type = "unlock-recipe", recipe = "coconut-processing" },
			{ type = "unlock-recipe", recipe = "coconut-oil" },
			{ type = "unlock-recipe", recipe = "coconut-sealant" },
			{ type = "unlock-recipe", recipe = "wooden-platform" },
		},
		prerequisites = { "planet-discovery-pelagos" },
		research_trigger = {
			type = "mine-entity",
			entity = "coconut-palm",
		},
		order = "ea[pelagos]",
	},
})

data:extend({
	{
		type = "technology",
		name = "diesel-agriculture",
		icon = "__pelagos__/graphics/diesel-agricultural-tower/agriculture.png",
		icon_size = 256,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "diesel-agricultural-tower",
			},
		},
		prerequisites = { "coconut-processing-technology", "engine", "landfill" },
		research_trigger = {
			type = "craft-item",
			item = "coconut-seed",
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "lighthouse",
		icon = "__lighthouse_radar__/graphics/lighthouse-technology.png",
		icon_size = 256,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "lighthouse",
			},
		},
		prerequisites = { "automated_water_transport", "concrete", "radar" },

		research_trigger = {
			type = "build-entity",
			entity = "indep-boat",
		},
	},
})
if mods["cargo-ships"] then
	local t = data.raw["technology"]["automated_water_transport"]
	t.prerequisites = {
		"coconut-processing-technology",
		--"logistics-2", -- important for any planet start
		--"engine", -- important for any planet start
	}
	t.effects = {
		{ type = "unlock-recipe", recipe = "boat" },
		{ type = "unlock-recipe", recipe = "buoy" },
		{ type = "unlock-recipe", recipe = "chain_buoy" },
		{ type = "unlock-recipe", recipe = "cargo_ship" },
	}
	t.unit = nil
	t.research_trigger = {
		type = "craft-item",
		item = "coconut-sealant",
	}
end
if mods["cargo-ships"] then
	local t = data.raw["technology"]["deep_sea_oil_extraction"]
	t.prerequisites = {
		"automated_water_transport",
		--"fluid-handling", -- important for any planet start
	}
	t.effects = {
		{ type = "unlock-recipe", recipe = "oil_rig" },
		{ type = "unlock-recipe", recipe = "barreling-machine" },
	}
	t.unit = nil
	t.research_trigger = {
		type = "build-entity",
		entity = "cargo_ship",
	}
end
data:extend({
	{
		type = "technology",
		name = "fermentation-bacteria-cultivation-technology",
		icon = "__pelagos__/graphics/fermentation-bacteria.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "fermentation-bacteria" },
			{ type = "unlock-recipe", recipe = "fermentation-bacteria-cultivation" },
			{ type = "unlock-recipe", recipe = "fermentation-bacteria-cultivation-fermented-fish" },
			{ type = "unlock-recipe", recipe = "fermented-fish" },
			{ type = "unlock-recipe", recipe = "corrosive-firearm-magazine" },
			{ type = "unlock-recipe", recipe = "pelagos-biolubricant" },
			{ type = "unlock-recipe", recipe = "ethanol" },
		},
		prerequisites = { "deep_sea_oil_extraction" },
		research_trigger = {
			type = "build-entity",
			entity = "oil_rig",
		},
		order = "ea[pelagos]",
	},
})

if mods["canal-excavator"] then
	local t = data.raw["technology"]["canex-excavator"]
	t.prerequisites = {
		"planet-discovery-pelagos",
		"coconut-processing-technology",
		--"engine", -- important for any planet start
	}
	t.effects = {
		{ type = "unlock-recipe", recipe = "canex-excavator" },
		{ type = "unlock-recipe", recipe = "canex-digable" },
		{ type = "unlock-recipe", recipe = "stone-erosion" },
		{ type = "unlock-recipe", recipe = "pelagos-sandfill" },
	}

	t.research_trigger = {
		type = "mine-entity",
		entity = "pelagos-big-rock",
	}
	t.order = "ea[pelagos]"
	t.unit = nil
end

--data:extend({
--	{
--		type = "technology",
--		name = "diesel-mining-drill",
--		icon = "__pelagos__/graphics/diesel-mining-drill/diesel-mining-drill-technology.png",
--		icon_size = 512,
--		effects = {
--			{ type = "unlock-recipe", recipe = "diesel-mining-drill" },
--		},
--		prerequisites = {
--			"coconut-processing-technology",
--			"canex-excavator",
--			"electric-mining-drill", -- important for any planet start
--		},
--		research_trigger = {
--			type = "build-entity",
--			entity = "canex-excavator",
--		},
--		order = "ea[pelagos]",
--	},
--})
data:extend({
	{
		type = "technology",
		name = "calciner",
		icon = "__pelagos__/graphics/calciner/calciner-technology.png",
		icon_size = 320,
		effects = {
			{ type = "unlock-recipe", recipe = "calciner" },
			{ type = "unlock-recipe", recipe = "calciner-calcite-brick" },
			{ type = "unlock-recipe", recipe = "calciner-fish-calcining" },
			{ type = "unlock-recipe", recipe = "calciner-coal-purification" },
			{ type = "unlock-recipe", recipe = "calciner-wood-carbonization" },
			{ type = "unlock-recipe", recipe = "calciner-coconut-husk-carbonization" },
			{ type = "unlock-recipe", recipe = "calciner-advanced-steel-smelting" },
			{ type = "unlock-recipe", recipe = "activated-carbon" },
			{ type = "unlock-recipe", recipe = "diesel-mining-drill" },
		},
		prerequisites = {
			--"diesel-mining-drill",
			--"advanced-material-processing", -- important for any planet start
			"concrete",
			"canex-excavator",
		},
		research_trigger = {
			type = "build-entity",
			entity = "canex-excavator",
		},
		order = "ea[pelagos]",
	},
})
-- add mineral glass if glass exist
local tech = data.raw.technology["calciner"]
if tech and data.raw.recipe["calciner-mineral-glass"] then
	table.insert(tech.effects, {
		type = "unlock-recipe",
		recipe = "calciner-mineral-glass",
	})
end

data:extend({
	{
		type = "technology",
		name = "titanium",
		icon = "__pelagos__/graphics/titanium-technology.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "titanium-dust" },
			{ type = "unlock-recipe", recipe = "titanium-plate-from-dust" },
			{ type = "unlock-recipe", recipe = "crane-bulk-diesel-inserter" },
		},
		prerequisites = { "fermentation-bacteria-cultivation-technology" },
		research_trigger = {
			type = "mine-entity",
			entity = "titanium-sludge",
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "ethanol",
		icon = "__pelagos__/graphics/ethanol.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "pelagos-bioplastic" },
			{ type = "unlock-recipe", recipe = "pelagos-processing-unit" },
			{ type = "unlock-recipe", recipe = "pelagos-battery" },
		},
		prerequisites = { "fermentation-bacteria-cultivation-technology", "calciner" },
		research_trigger = {
			type = "craft-fluid",
			fluid = "ethanol",
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "copper-biter-captivity",
		icon = "__space-age__/graphics/technology/captivity.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "pelagos-capture-robot-rocket" },
			{ type = "unlock-recipe", recipe = "copper-biter-egg" },
			{ type = "unlock-recipe", recipe = "copper-plate-from-copper-biter-egg" },
			{ type = "unlock-recipe", recipe = "copper-ore-bitter-egg" },
		},
		prerequisites = { "titanium", "ethanol", "gun-turret" },
		research_trigger = {
			type = "craft-item",
			item = "fermented-fish",
		},
	},
	{
		type = "technology",
		name = "captive-copper-biter-spawner",
		icon = "__pelagos__/graphics/spitter/spitter-pelagos-nest-captured.png",
		icon_size = 376,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "captive-copper-biter-spawner",
			},
		},
		prerequisites = { "cryogenic-science-pack", "pelagos-science-pack" },
		unit = {
			count = 3000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
				{ "cryogenic-science-pack", 1 },
			},
			time = 60,
		},
	},
})
--science pack
data:extend({
	{
		type = "technology",
		name = "pelagos-science-pack",
		icon = "__pelagos__/graphics/pelagos-science-pack-technology.png",
		icon_size = 256,
		essential = true,
		effects = {
			{ type = "unlock-recipe", recipe = "pelagos-science-pack" },
			{ type = "unlock-recipe", recipe = "pelagos-explosives" },
		},
		prerequisites = { "fermentation-bacteria-cultivation-technology", "titanium", "calciner" },
		research_trigger = {
			type = "craft-item",
			item = "fermentation-bacteria",
		},
		order = "ea[pelagos]",
	},
})
--post science pack
data:extend({
	{
		type = "technology",
		name = "improvised-landfill",
		icon = "__pelagos__/graphics/improvised-landfill.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "improvised-landfill" },
		},
		order = "cb[pelagos]",
		prerequisites = { "pelagos-science-pack" },
		unit = {
			count_formula = "1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "improvised-concrete",
		icon = "__pelagos__/graphics/concrete-technology.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "cococoncrete" },
			{ type = "unlock-recipe", recipe = "pelagos-spoilage-concrete" },
		},
		prerequisites = {
			"pelagos-science-pack",
			"improvised-landfill",
			"wood-spoiling-technology",
			"chemical-science-pack",
			"concrete",
		},
		unit = {
			count_formula = "1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "crane-stack-diesel-inserter",
		icon = "__pelagos__/graphics/diesel-titanium-crane-stack-inserter/stack-inserter.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "crane-stack-diesel-inserter" },
		},
		prerequisites = { "pelagos-science-pack", "stack-inserter", "utility-science-pack" },
		unit = {
			count_formula = "1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "diesel-automation",
		icon = "__diesel_machines__/graphics/diesel-assembling-machine/diesel-automation.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "fast-diesel-inserter" },
			{ type = "unlock-recipe", recipe = "long-handed-diesel-inserter" },
			{ type = "unlock-recipe", recipe = "diesel-inserter" },
			{ type = "unlock-recipe", recipe = "diesel-assembling-machine" },
			{ type = "unlock-recipe", recipe = "diesel-pump" },
		},
		prerequisites = {
			"calciner",
			--	"automation-2", -- important for any planet start
		},
		research_trigger = {
			type = "build-entity",
			entity = "diesel-mining-drill",
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "portable-diesel-generator",
		icons = util.technology_icon_constant_equipment("__pelagos__/graphics/portable-diesel-generator.png"),
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "portable-diesel-generator" },
		},
		prerequisites = {
			"pelagos-science-pack",
			--	"automation-2", -- important for any planet start
			"power-armor",
			"utility-science-pack",
		},
		unit = {
			count_formula = "1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
	},
})
local productivity_effects = {
	{
		type = "change-recipe-productivity",
		recipe = "wooden-platform",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "pelagos-sandfill",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "landfill",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "improvised-landfill",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "artificial-yumako-soil",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "overgrowth-yumako-soil",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "artificial-jellynut-soil",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "overgrowth-jellynut-soil",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "ice-platform",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "foundation",
		change = 0.1,
	},
}

if mods["planetaris-arig"] then
	table.insert(productivity_effects, {
		type = "change-recipe-productivity",
		recipe = "planetaris-sandstone-foundation",
		change = 0.1,
	})
end
if mods["gleba_cultured_soil"] then
	table.insert(productivity_effects, {
		type = "change-recipe-productivity",
		recipe = "cultured-yumako-soil",
		change = 0.1,
	})
	table.insert(productivity_effects, {
		type = "change-recipe-productivity",
		recipe = "cultured-jellynut-soil",
		change = 0.1,
	})
end
if mods["skewer_planet_vesta"] then
	table.insert(productivity_effects, {
		type = "change-recipe-productivity",
		recipe = "vesta-foundation",
		change = 0.1,
	})
end

if mods["apia"] then
	table.insert(productivity_effects, {
		type = "change-recipe-productivity",
		recipe = "wax-platform",
		change = 0.1,
	})
end
data:extend({
	{
		type = "technology",
		name = "landfill-productivity",
		icons = util.technology_icon_constant_recipe_productivity("__pelagos__/graphics/landfill-productivity.png"),
		icon_size = 256,
		effects = productivity_effects,

		prerequisites = { "improvised-landfill", "production-science-pack" },
		unit = {
			count_formula = "1.5^L*1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
		max_level = "infinite",
		upgrade = true,
	},
})
local cultivation_productivity_effects = {
	{
		type = "change-recipe-productivity",
		recipe = "fermentation-bacteria-cultivation",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "fermentation-bacteria-cultivation-fermented-fish",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "iron-bacteria-cultivation",
		change = 0.1,
	},
	{
		type = "change-recipe-productivity",
		recipe = "copper-bacteria-cultivation",
		change = 0.1,
	},
	--{
	--	type = "change-recipe-productivity",
	--	recipe = "fish-breeding",
	--	change = 0.05,
	--},
	{
		type = "change-recipe-productivity",
		recipe = "pentapod-egg",
		change = 0.1,
	},
}
if mods["apia"] then
	table.insert(cultivation_productivity_effects, {
		type = "change-recipe-productivity",
		recipe = "larvae-cultivation",
		change = 0.1,
	})
end
data:extend({
	{
		type = "technology",
		name = "cultivation-productivity",
		icons = util.technology_icon_constant_recipe_productivity("__pelagos__/graphics/cultivation-productivity.png"),
		icon_size = 256,
		effects = cultivation_productivity_effects,

		prerequisites = { "pelagos-science-pack", "copper-biter-captivity", "agricultural-science-pack" },
		unit = {
			--count_formula = "1.5^L*1000",
			count_formula = "1.5^L*1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
		max_level = "infinite",
		upgrade = true,
	},
})
data:extend({
	{
		type = "technology",
		name = "degradation-module-technology",
		icon = "__pelagos__/graphics/degradation-module-technology.png",
		icon_size = 120,
		effects = {
			{ type = "unlock-recipe", recipe = "degradation-module" },
			{ type = "unlock-recipe", recipe = "degradation-module-2" },
			{ type = "unlock-recipe", recipe = "degradation-module-3" },
		},
		prerequisites = { "pelagos-science-pack", "production-science-pack" },
		unit = {
			count = 2000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "wood-spoiling-technology",
		icon = "__pelagos__/graphics/celulose-decomposition.png",
		icon_size = 90,
		effects = {
			{ type = "unlock-recipe", recipe = "wood-spoiling" },
			{ type = "unlock-recipe", recipe = "coconut-husk-spoiling" },
			{ type = "unlock-recipe", recipe = "nutrients-spoiling" },
			{ type = "unlock-recipe", recipe = "nutrients-from-spoilage-methane" },
		},
		prerequisites = { "pelagos-science-pack" },
		unit = {
			count_formula = "500",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
		order = "cc[pelagos]",
	},
})
data:extend({
	{
		type = "technology",
		name = "pelagos-biodiesel",
		icon = "__pelagos__/graphics/biodiesel.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "pelagos-biodiesel-tree" },
			{ type = "unlock-recipe", recipe = "pelagos-biodiesel-spoilage" },
			{ type = "unlock-recipe", recipe = "pelagos-biodiesel-solid-fuel" },
		},
		prerequisites = { "pelagos-science-pack", "wood-spoiling-technology", "space-science-pack" },
		unit = {
			count_formula = "500",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "pelagos-casting-engine-unit",
		icon = "__pelagos__/graphics/casting-engine-unit.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "pelagos-casting-engine-unit" },
		},
		prerequisites = {
			"diesel-automation",
			"metallurgic-science-pack",
			"production-science-pack",
			"pelagos-science-pack",
		},
		unit = {
			count_formula = "750",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
				{ "metallurgic-science-pack", 1 },
			},
			time = 60,
		},
		order = "z[pelagos]",
	},
})

data:extend({
	{
		type = "technology",
		name = "capsule-rockets",
		icon = "__pelagos__/graphics/capsule-rocket-technology.png",
		icon_size = 80,
		effects = {
			{ type = "unlock-recipe", recipe = "poison-rocket" },
			{ type = "unlock-recipe", recipe = "slowdown-rocket" },
		},
		prerequisites = { "pelagos-science-pack", "military-3", "agricultural-science-pack" },
		unit = {
			count_formula = "1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "heavy-gun-turret",
		icon = "__heavy_gun_turret__/graphics/heavy-gun-turret-technology.png",
		icon_size = 305,
		effects = {
			{ type = "unlock-recipe", recipe = "heavy-gun-turret" },
		},
		prerequisites = { "pelagos-science-pack", "military-3" },
		unit = {
			count_formula = "1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "titanium-barrels",
		icon = "__pelagos__/graphics/titanium-barreling/titanium-barrels.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "titanium-barrel" },
		},
		prerequisites = { "pelagos-science-pack", "utility-science-pack", "tank_ship", "space-science-pack" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})

--if mods["Long_Range_Delivery_Drones"] then
local t = data.raw["technology"]["long-range-delivery-drone"]
t.prerequisites = { "pelagos-science-pack", "utility-science-pack", "diesel-automation", "ethanol-thruster" }
t.unit = {
	count = 2000,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "space-science-pack", 1 },
		{ "utility-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
	},
	time = 30,
}
t.order = "z[pelagos]"
--end

if mods["cargo-ships"] then
	local t = data.raw["technology"] and data.raw["technology"]["oversea-energy-distribution"]

	-- Only modify if the tech actually exists (e.g. not disabled in settings)
	if t then
		t.prerequisites = { "pelagos-science-pack", "space-science-pack" }
		t.effects = {
			{ type = "unlock-recipe", recipe = "floating-electric-pole" },
		}
		t.unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 30,
		}
	end
end

if mods["cargo-ships"] then
	local t = data.raw["technology"]["tank_ship"]
	t.prerequisites = { "pelagos-science-pack" }
	t.unit = {
		count = 1500,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "pelagos-science-pack", 1 },
		},
		time = 30,
	}
end

if mods["pirateship"] then
	local t = data.raw["technology"]["Pirate_Ship"]

	t.icon = "__talandar_cargo_ships_tweaks__/graphics/pirateship/pirateship_tech_icon.png"
	t.icon_size = 256
	t.prerequisites = { "pelagos-science-pack", "chemical-science-pack", "military-science-pack" }
	t.effects = {
		{ type = "unlock-recipe", recipe = "pirateship-cannonball" },
	}
	t.unit = {
		count = 1000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "pelagos-science-pack", 1 },
			{ "military-science-pack", 1 },
		},
		time = 30,
	}
end

data:extend({
	{
		type = "technology",
		name = "pelagos-asteroid-bioprocessing",
		icon = "__pelagos__/graphics/asteroids-bioprocessing.png",
		icon_size = 120,
		effects = {
			{ type = "unlock-recipe", recipe = "oxide-asteroid-melting" },
			{ type = "unlock-recipe", recipe = "metallic-asteroid-methane-crushing" },
			{ type = "unlock-recipe", recipe = "carbonic-asteroid-gasification" },
		},
		prerequisites = { "pelagos-science-pack" },
		unit = {
			count_formula = "500",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})

data:extend({
	{
		type = "technology",
		name = "diesel-asteroid-collector",
		icon = "__pelagos__/graphics/diesel-asteroid-collector/asteroid-collector.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "diesel-asteroid-collector" },
		},
		prerequisites = { "pelagos-asteroid-bioprocessing" },
		unit = {
			count_formula = "1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})

data:extend({
	{
		type = "technology",
		name = "ethanol-thruster",
		icon = "__pelagos__/graphics/thruster/ethanol_thruster_tech.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "ethanol-thruster" },
		},
		prerequisites = { "pelagos-science-pack", "ethanol" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
	},
})

-- remove unused researches
if mods["cargo-ships"] then
	data.raw["technology"]["cargo_ships"] = nil
end
if mods["cargo-ships"] then
	data.raw["technology"]["water_transport"] = nil
end
if mods["cargo-ships"] then
	data.raw["technology"]["automated_bridges"] = nil
end

if mods["cargo_crates"] then
	data.raw["technology"]["cargo-crates"].prerequisites = { "pelagos-science-pack" }
	data.raw["technology"]["cargo-crates"].unit = {
		count = 1000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "pelagos-science-pack", 1 },
		},
		time = 60,
	}
end

if mods["lubrication_tower"] then
	table.insert(data.raw["technology"]["lubrication-tower"].prerequisites, "pelagos-science-pack")
	data.raw["technology"]["lubrication-tower"].unit = {
		count = 1000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "pelagos-science-pack", 1 },
			{ "production-science-pack", 1 },
		},
		time = 60,
	}
end

if mods["Cerys-Moon-of-Fulgora"] or mods["planetaris-arig"] then
	data:extend({
		{
			type = "technology",
			name = "coconut-drop-technology",
			icon = "__pelagos__/graphics/coconut-drop-technology.png",
			icon_size = 256,
			prerequisites = { "coconut-processing-technology" },
			research_trigger = {
				type = "mine-entity",
				entity = "coconut-palm",
			},
		},
	})
end
if mods["planetaris-arig"] then
	table.insert(
		data.raw["technology"]["pelagos-biodiesel"].effects,
		{ type = "unlock-recipe", recipe = "pelagos-biodiesel-arig-cactus" }
	)
end
if mods["castra"] then
	table.insert(data.raw["technology"]["engine-productivity"].effects, {
		type = "change-recipe-productivity",
		recipe = "pelagos-casting-engine-unit",
		change = 0.1,
	})
end
if mods["apia"] then
	table.insert(data.raw["technology"]["agriculture-productivity"].effects, {
		type = "change-recipe-productivity",
		recipe = "coconut-processing",
		change = 0.1,
	})
	table.insert(data.raw["technology"]["biter-egg-productivity"].effects, {
		type = "change-recipe-productivity",
		recipe = "copper-biter-egg",
		change = 0.05,
	})
	table.insert(data.raw["technology"]["lubricant-productivity"].effects, {
		type = "change-recipe-productivity",
		recipe = "pelagos-biolubricant",
		change = 0.1,
	})
end

PlanetsLib.add_item_name_to_global_cargo_drops_whitelist("coconut")

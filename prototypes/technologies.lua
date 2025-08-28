--pelagos fish breeding
local fish_breeding = data.raw.recipe["fish-breeding"]

fish_breeding.surface_conditions = {
	{ property = "pressure", min = 1000, max = 1500 }, -- Nauvis: 1000, Pelagos: 1500
}
fish_breeding.enabled = false

data:extend({
	{
		type = "technology",
		name = "planet-discovery-pelagos",

		--icon = "__pelagos__/graphics/starmap-planet-pelagos.png",
		icon_size = 512,
		icons = PlanetsLib.technology_icon_constant_planet("__pelagos__/graphics/starmap-planet-pelagos.png", 512),
		--icons = PlanetsLib.technology_icons_moon("__base__/graphics/icons/uranium-ore.png"),
		--icon_size = 256,
		essential = true,
		effects = {
			{
				type = "unlock-space-location",
				space_location = "pelagos",
				use_icon_overlay_constant = true,
			},

			{ type = "unlock-recipe", recipe = "pelagos-biochamber" },
		},
		prerequisites = { "agricultural-science-pack", "fish-breeding" },
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
		name = "coconut-processing-technology",
		icon = "__pelagos__/graphics/coconut-processing-technology.png",
		icon_size = 512,
		essential = true,
		effects = {
			{ type = "unlock-recipe", recipe = "nutrients-from-coconut-meat" },
			{ type = "unlock-recipe", recipe = "coconut-processing" },
			{ type = "unlock-recipe", recipe = "coconut-oil" },
			{ type = "unlock-recipe", recipe = "coconut-sealant" },
			{ type = "unlock-recipe", recipe = "pelagos-electric-engine-unit" },
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
		name = "fermentation-bacteria-cultivation-technology",
		icon = "__pelagos__/graphics/fermentation-bacteria.png",
		icon_size = 64,
		essential = true,
		effects = {
			{ type = "unlock-recipe", recipe = "fermentation-bacteria" },
			{ type = "unlock-recipe", recipe = "fermentation-bacteria-cultivation" },
		},
		prerequisites = { "deep_sea_oil_extraction", "canex-excavator" },
		research_trigger = {
			type = "build-entity",
			entity = "oil_rig",
		},
		order = "ea[pelagos]",
	},
})
if mods["cargo-ships"] then
	local t = data.raw["technology"]["automated_water_transport"]
	t.prerequisites = { "coconut-processing-technology" }
	t.effects = {
		{ type = "unlock-recipe", recipe = "boat" },
		{ type = "unlock-recipe", recipe = "port" },
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

data:extend({
	{
		type = "technology",
		name = "calciner",
		icon = "__pelagos__/graphics/calciner/calciner-technology.png",
		icon_size = 320,
		essential = true,
		effects = {
			{ type = "unlock-recipe", recipe = "calciner" },
			{ type = "unlock-recipe", recipe = "calcite-concrete" },
			{ type = "unlock-recipe", recipe = "calciner-fish-calcining" },
			{ type = "unlock-recipe", recipe = "calciner-coal-purification" },
			{ type = "unlock-recipe", recipe = "calciner-wood-carbonization" },
			{ type = "unlock-recipe", recipe = "calciner-coconut-husk-carbonization" },
		},
		prerequisites = { "coconut-processing-technology" },
		research_trigger = {
			type = "craft-item",
			item = "coconut-sealant",
		},
		order = "ea[pelagos]",
	},
})
data:extend({
	{
		type = "technology",
		name = "pelagos-science-pack",
		icon = "__pelagos__/graphics/pelagos-science-pack.png",
		icon_size = 64,
		essential = true,
		effects = {
			{ type = "unlock-recipe", recipe = "pelagos-science-pack" },
			{ type = "unlock-recipe", recipe = "ethanol" },
			{ type = "unlock-recipe", recipe = "pelagos-bioplastic" },
			{ type = "unlock-recipe", recipe = "pelagos-processing-unit" },
			{ type = "unlock-recipe", recipe = "pelagos-rocket-fuel" },
		},
		prerequisites = { "fermentation-bacteria-cultivation-technology", "calciner" },
		research_trigger = {
			type = "craft-item",
			item = "fermentation-bacteria",
		},
		order = "ea[pelagos]",
	},
})

data:extend({
	{
		type = "technology",
		name = "improvised-landfill",
		icon = "__pelagos__/graphics/improvised-landfill.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "improvised-landfill" },
		},
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
local recipe_productivity_effects = {
	allow_recipes_without_productivity = true,
	effects = {
		{
			type = "item",
			name = "landfill",
			change = 0.1,
		},
		{
			type = "item",
			name = "artificial-yumako-soil",
			change = 0.1,
		},
		{
			type = "item",
			name = "overgrowth-yumako-soil",
			change = 0.1,
		},
		{
			type = "item",
			name = "artificial-jellynut-soil",
			change = 0.1,
		},
		{
			type = "item",
			name = "overgrowth-jellynut-soil",
			change = 0.1,
		},
		{
			type = "item",
			name = "ice-platform",
			change = 0.1,
		},
		{
			type = "item",
			name = "foundation",
			change = 0.1,
		},
	}
}

if mods["planetaris-unbounded"] then
	table.insert(productivity_effects, {
		type = "change-recipe-productivity",
		recipe = "planetaris-sandstone-foundation",
		change = 0.1,
	})
end
-- add back in future
--if mods["skewer_planet_vesta"] then
--	table.insert(productivity_effects, {
--		type = "change-recipe-productivity",
--		recipe = "ske_vesta_foundation",
--		change = 0.1,
--	})
--end
data:extend({
	{
		type = "technology",
		name = "landfill-productivity",
		icons = util.technology_icon_constant_recipe_productivity("__pelagos__/graphics/landfill-productivity.png"),
		icon_size = 256,
		PlanetsLib_recipe_productivity_effects = recipe_productivity_effects,

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
			count_formula = "2000",
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
		name = "capsule-rockets",
		icon = "__pelagos__/graphics/capsule-rocket-technology.png",
		icon_size = 80,
		effects = {
			{ type = "unlock-recipe", recipe = "poison-rocket" },
			{ type = "unlock-recipe", recipe = "slowdown-rocket" },
		},
		prerequisites = { "pelagos-science-pack", "utility-science-pack", "military-3" },
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
-- add pelagos to "logistics-3"
local tech = data.raw.technology["logistics-3"]

if tech and tech.effects then
	table.insert(tech.effects, { type = "unlock-recipe", recipe = "pelagos-express-transport-belt" })
	table.insert(tech.effects, { type = "unlock-recipe", recipe = "pelagos-express-underground-belt" })
	table.insert(tech.effects, { type = "unlock-recipe", recipe = "pelagos-express-splitter" })
end

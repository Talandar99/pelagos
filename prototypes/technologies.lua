data:extend({
	{
		type = "technology",
		name = "planet-discovery-pelagos",
		icon_size = 512,
		icons = util.technology_icon_constant_planet("__pelagos__/graphics/planet/pelagos256.png"),
		essential = true,
		effects = {
			{
				type = "unlock-space-location",
				space_location = "pelagos",
				use_icon_overlay_constant = true,
			},
			{ type = "unlock-recipe", recipe = "pelagos-biochamber" },
			{ type = "unlock-recipe", recipe = "pelagos-rocket-part" },
		},
		prerequisites = { "agricultural-science-pack", "fish-breeding", "captivity", "deep_sea_oil_extraction" },
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
		order = "[pelagos]",
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
		},
		research_trigger = {
			type = "mine-entity",
			entity = "coconut-palm",
		},
		order = "[pelagos]",
	},
})
if mods["cargo-ships"] then
	local t = data.raw["technology"]["automated_water_transport"]
	t.prerequisites = {
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
	t.order = "[pelagos]"
end
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
		research_trigger = {
			type = "craft-fluid",
			fluid = "ethanol",
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
			{ type = "unlock-recipe", recipe = "diesel-agricultural-tower" },
		},
		research_trigger = {
			type = "craft-item",
			item = "coconut-seed",
		},
	},
})

data:extend({
	{
		type = "technology",
		name = "titanium",
		icon = "__pelagos__/graphics/titanium/titanium-technology.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "titanium-dust" },
			{ type = "unlock-recipe", recipe = "titanium-plate-from-dust" },
			{ type = "unlock-recipe", recipe = "crane-bulk-diesel-inserter" },
		},
		research_trigger = {
			type = "mine-entity",
			entity = "titanium-sludge",
		},
	},
})
data:extend({
	{
		type = "technology",
		name = "titanium-barrels",
		icon = "__pelagos__/graphics/titanium-barreling/titanium-barrels.png",
		icon_size = 512,
		effects = {
			{ type = "unlock-recipe", recipe = "titanium-barrel" },
		},
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
data:extend({
	{
		type = "technology",
		name = "ethanol-thruster",
		icon = "__pelagos__/graphics/thruster/ethanol_thruster_tech.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "ethanol-thruster" },
		},
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
data:extend({
	{
		type = "technology",
		name = "crane-stack-diesel-inserter",
		icon = "__pelagos__/graphics/diesel-titanium-crane-stack-inserter/stack-inserter.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "crane-stack-diesel-inserter" },
		},
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
		name = "copper-biter-captivity",
		icon = "__space-age__/graphics/technology/captivity.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "pelagos-capture-robot-rocket" },
			{ type = "unlock-recipe", recipe = "copper-biter-egg" },
			{ type = "unlock-recipe", recipe = "copper-plate-from-copper-biter-egg" },
			{ type = "unlock-recipe", recipe = "copper-ore-bitter-egg" },
		},
		research_trigger = {
			type = "craft-item",
			item = "fermented-fish",
		},
	},
})
data:extend({
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
		name = "ethanol",
		icon = "__pelagos__/graphics/ethanol.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "ethanol" },
			{ type = "unlock-recipe", recipe = "pelagos-bioplastic" },
			{ type = "unlock-recipe", recipe = "pelagos-processing-unit" },
			{ type = "unlock-recipe", recipe = "pelagos-battery" },
		},
		research_trigger = {
			type = "build-entity",
			entity = "decomposer",
		},
	},
})

data:extend({
	{
		type = "technology",
		name = "landfill-productivity",
		icons = util.technology_icon_constant_recipe_productivity("__pelagos__/graphics/landfill-productivity.png"),
		icon_size = 256,
		effects = {
			{
				type = "change-recipe-productivity",
				recipe = "wooden-platform",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "decomposer-sandfill",
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
		},

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
		name = "cultivation-productivity",
		icons = util.technology_icon_constant_recipe_productivity("__pelagos__/graphics/cultivation-productivity.png"),
		icon_size = 256,
		effects = {
			{
				type = "change-recipe-productivity",
				recipe = "decomposition-bacteria-cultivation",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "decomposition-bacteria-cultivation-fermented-fish",
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
		},

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
		name = "pelagos-biodiesel",
		icon = "__pelagos__/graphics/biodiesel.png",
		icon_size = 64,
		effects = {
			{ type = "unlock-recipe", recipe = "pelagos-biodiesel-spoilage" },
			{ type = "unlock-recipe", recipe = "pelagos-biodiesel-solid-fuel" },
		},
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
		name = "degradation-module",
		icon = "__pelagos__/graphics/degradation-module-technology.png",
		icon_size = 120,
		effects = {
			{ type = "unlock-recipe", recipe = "degradation-module" },
		},
		unit = {
			count = 2000,
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
	{
		type = "technology",
		name = "degradation-module-2",
		icon = "__pelagos__/graphics/degradation-module-technology.png",
		icon_size = 120,
		effects = {
			{ type = "unlock-recipe", recipe = "degradation-module-2" },
		},
		unit = {
			count = 2000,
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
	{
		type = "technology",
		name = "degradation-module-3",
		icon = "__pelagos__/graphics/degradation-module-technology.png",
		icon_size = 120,
		effects = {
			{ type = "unlock-recipe", recipe = "degradation-module-3" },
		},
		unit = {
			count = 2000,
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
if mods["pirateship"] then
	local t = data.raw["technology"]["Pirate_Ship"]

	t.icon = "__talandar_cargo_ships_tweaks__/graphics/pirateship/pirateship_tech_icon.png"
	t.icon_size = 256
	t.prerequisites = {}
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

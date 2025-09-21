local utils = require("__any-planet-start__.utils")

-- agricultural tower by się przydał
-- spoilage into nutrients

utils.set_packs("engine", { "automation-science-pack" }, 50, 30)
utils.set_prerequisites("engine", { "steel-processing" })
utils.set_prerequisites("fluid-handling", { "engine" })
utils.set_packs("fluid-handling", { "automation-science-pack" }, 25, 30)
utils.set_prerequisites("logistic-science-pack", { "automation-science-pack", "engine" })
utils.set_prerequisites("jellynut", { "planet-discovery-gleba" })
utils.set_prerequisites("agriculture", { "steel-processing", "landfill" })
utils.set_packs("agriculture", { "automation-science-pack" }, 20, 30)
utils.remove_recipes("agriculture", { "nutrients-from-spoilage" })
utils.add_recipes("coconut-processing-technology", { "nutrients-from-spoilage" })
utils.set_prerequisites("fish-breeding", { "automation-science-pack" })
utils.set_packs("fish-breeding", { "automation-science-pack" }, 25, 30)
data.raw["technology"]["fish-breeding"].unit = {
	count = 20,
	ingredients = {
		{ "automation-science-pack", 1 },
	},
	time = 30,
}
utils.set_prerequisites("jellynut", { "planet-discovery-gleba" })
utils.set_prerequisites("yumako", { "planet-discovery-gleba" })
utils.set_prerequisites("landfill", { "automation-science-pack" })
utils.add_prerequisites("automation-science-pack", { "coconut-processing-technology" })
utils.set_prerequisites("oil-processing", { "deep_sea_oil_extraction" })
utils.set_trigger("oil-processing", { type = "mine-entity", entity = "methane" })
utils.set_packs("landfill", { "automation-science-pack" }, 10, 30)
utils.add_prerequisites("chemical-science-pack", { "pelagos-science-pack" })
utils.add_prerequisites("pelagos-science-pack", { "plastics" })
--utils.add_prerequisites("automated_water_transport", { "logistics-2", "engine" })
utils.add_prerequisites("automated_water_transport", { "engine", "fluid-handling" })
utils.add_prerequisites("logistics-2", { "automated_water_transport" })
utils.add_prerequisites("deep_sea_oil_extraction", { "fluid-handling" })
utils.add_prerequisites("canex-excavator", { "engine", "fluid-handling" })
utils.add_prerequisites("calciner", { "advanced-material-processing" })
-- diesel-automation
utils.add_prerequisites("diesel-automation", { "automation-2" })
utils.add_prerequisites("oil-gathering", { "logistic-science-pack" })

utils.remove_recipes("pelagos-science-pack", { "pelagos-biolubricant", "pelagos-processing-unit", "pelagos-battery" })
utils.remove_recipes("deep_sea_oil_extraction", { "barreling-machine" })
utils.add_recipes("fluid-handling", { "barreling-machine" })
utils.add_recipes("lubricant", { "pelagos-biolubricant" })
utils.add_recipes("processing-unit", { "pelagos-processing-unit" })
utils.add_recipes("battery", { "pelagos-battery" })

data:extend({
	{
		type = "recipe",
		name = "aps-pelagos-automation-science-pack",
		enabled = false,
		energy_required = 5,
		ingredients = {
			{ type = "item", name = "coconut-husk", amount = 1 },
			{ type = "item", name = "iron-gear-wheel", amount = 1 },
		},
		results = { { type = "item", name = "automation-science-pack", amount = 1 } },
		crafting_machine_tint = {
			primary = { r = 1.000, g = 0.0, b = 0.0, a = 1.000 },
			secondary = { r = 1.000, g = 0.0, b = 0.0, a = 1.000 },
		},
		allow_productivity = true,
	},
})
utils.add_recipes("automation-science-pack", { "aps-pelagos-automation-science-pack" })
data:extend({
	{
		type = "recipe",
		name = "aps-pelagos-logistic-science-pack",
		enabled = false,
		energy_required = 6,
		ingredients = {
			{ type = "item", name = "engine-unit", amount = 1 },
			{ type = "item", name = "transport-belt", amount = 1 },
		},
		results = { { type = "item", name = "logistic-science-pack", amount = 1 } },
		crafting_machine_tint = {
			primary = { r = 0.0, g = 1.0, b = 0.0, a = 1.000 },
			secondary = { r = 0.0, g = 1.0, b = 0.0, a = 1.000 },
		},
		allow_productivity = true,
	},
})
utils.add_recipes("logistic-science-pack", { "aps-pelagos-logistic-science-pack" })
data:extend({
	{
		type = "recipe",
		name = "aps-pelagos-chemical-science-pack",
		enabled = false,
		energy_required = 24,
		category = "organic",
		ingredients = {
			{ type = "item", name = "engine-unit", amount = 2 },
			{ type = "item", name = "advanced-circuit", amount = 3 },
			{ type = "fluid", name = "ethanol", amount = 30 },
		},
		results = { { type = "item", name = "chemical-science-pack", amount = 2 } },
		crafting_machine_tint = {
			primary = { r = 0.0, g = 0.8, b = 1.0, a = 1.000 },
			secondary = { r = 0.0, g = 0.8, b = 1.0, a = 1.000 },
		},
		allow_productivity = true,
	},
})
utils.add_recipes("chemical-science-pack", { "aps-pelagos-chemical-science-pack" })
--utils.set
utils.add_prerequisites("diesel-automation", { "automation-2" })

utils.add_prerequisites("planet-discovery-nauvis", { "agricultural-science-pack" })
utils.add_prerequisites("planet-discovery-fulgora", { "agricultural-science-pack" })
utils.add_prerequisites("planet-discovery-vulcanus", { "agricultural-science-pack" })

data.raw["technology"]["long-range-delivery-drone"].unit = {
	count = 2000,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "utility-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
	},
	time = 30,
}
data.raw["technology"]["improvised-landfill"].unit = {
	count = 1000,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
	},
	time = 30,
}

data.raw["technology"]["wood-spoiling-technology"].unit = {
	count = 500,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
	},
	time = 30,
}
utils.add_prerequisites("wood-spoiling-technology", { "chemical-science-pack" })

data.raw["technology"]["tank_ship"].unit = {
	count = 1500,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
	},
	time = 30,
}
utils.add_prerequisites("tank_ship", { "chemical-science-pack" })

data.raw["technology"]["heating-tower"].prerequisites = {
	"logistic-science-pack",
	"advanced-material-processing",
}

data.raw["technology"]["heating-tower"].unit = {
	count = 200,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
	},
	time = 30,
}

data.raw["technology"]["heating-tower"].research_trigger = nil

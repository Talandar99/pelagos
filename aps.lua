local utils = require("__any-planet-start__.utils")

-- agricultural tower by się przydał
-- spoilage into nutrients

-- red science
utils.set_packs("engine", { "automation-science-pack" }, 30, 10)
utils.set_prerequisites("engine", { "steel-processing" })
utils.set_prerequisites("fluid-handling", { "engine" })
utils.set_packs("fluid-handling", { "automation-science-pack" }, 25, 30)
--utils.set_prerequisites("agriculture", { "steel-processing", "landfill" })
--utils.set_packs("agriculture", { "automation-science-pack" }, 20, 30)
utils.remove_recipes("agriculture", { "nutrients-from-spoilage" })
utils.set_prerequisites("fish-breeding", { "automation-science-pack" })
utils.set_packs("fish-breeding", { "automation-science-pack" }, 25, 15)
data.raw["technology"]["fish-breeding"].unit = {
	count = 10,
	ingredients = {
		{ "automation-science-pack", 1 },
	},
	time = 10,
}
utils.set_prerequisites("landfill", { "coconut-processing-technology" })
data.raw.technology["landfill"].research_trigger = {
	type = "mine-entity",
	entity = "pelagos-big-rock",
}
utils.add_prerequisites("automation-science-pack", { "coconut-processing-technology" })
utils.add_prerequisites("automated_water_transport", { "engine", "fluid-handling" })
utils.add_prerequisites("canex-excavator", { "engine", "fluid-handling" })
utils.add_recipes("fluid-handling", { "barreling-machine" })
-- green science
utils.set_prerequisites("logistic-science-pack", { "automation-science-pack", "engine" })
utils.add_recipes("coconut-processing-technology", { "nutrients-from-spoilage" })
utils.set_prerequisites("oil-processing", { "deep_sea_oil_extraction" })
utils.set_trigger("oil-processing", { type = "mine-entity", entity = "methane" })
utils.add_prerequisites("pelagos-science-pack", { "plastics" })
utils.add_recipes("plastics", { "pelagos-bioplastic" })
utils.add_recipes("explosives", { "pelagos-explosives" })
utils.add_prerequisites("plastics", { "ethanol" })
utils.remove_recipes("ethanol", { "pelagos-bioplastic", "pelagos-processing-unit", "pelagos-battery" })
utils.remove_recipes("fermentation-bacteria-cultivation-technology", { "pelagos-biolubricant" })
utils.add_prerequisites("copper-biter-captivity", { "plastics" })
utils.add_prerequisites("chemical-science-pack", { "pelagos-science-pack" })
utils.add_prerequisites("calciner", { "advanced-material-processing" })
utils.add_prerequisites("deep_sea_oil_extraction", { "fluid-handling" })
utils.add_prerequisites("logistics-2", { "automated_water_transport" })
utils.add_prerequisites("diesel-automation", { "automation-2", "diesel-mining-drill" })
utils.remove_recipes("diesel-automation", { "fast-diesel-inserter" })
utils.add_recipes("fast-inserter", { "fast-diesel-inserter" })
utils.add_prerequisites("oil-gathering", { "logistic-science-pack" })

--blue science
utils.remove_recipes(
	"pelagos-science-pack",
	{ "pelagos-biolubricant", "pelagos-processing-unit", "pelagos-battery", "pelagos-explosives" }
)
utils.remove_recipes("deep_sea_oil_extraction", { "barreling-machine" })
utils.add_recipes("lubricant", { "pelagos-biolubricant" })
utils.add_recipes("processing-unit", { "pelagos-processing-unit" })
utils.add_recipes("battery", { "pelagos-battery" })

data:extend({
	{
		type = "recipe",
		name = "aps-pelagos-automation-science-pack",
		icons = {
			{ icon = "__base__/graphics/icons/automation-science-pack.png", icon_size = 64 },
			{ icon = "__pelagos__/graphics/pelagos.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
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
		auto_recycle = false,
	},
})
utils.add_recipes("automation-science-pack", { "aps-pelagos-automation-science-pack" })
data:extend({
	{
		type = "recipe",
		name = "aps-pelagos-logistic-science-pack",
		icons = {
			{ icon = "__base__/graphics/icons/logistic-science-pack.png", icon_size = 64 },
			{ icon = "__pelagos__/graphics/pelagos.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		enabled = false,
		energy_required = 6,
		ingredients = {
			{ type = "item", name = "coconut-sealant", amount = 1 },
			{ type = "item", name = "transport-belt", amount = 1 },
		},
		results = { { type = "item", name = "logistic-science-pack", amount = 1 } },
		crafting_machine_tint = {
			primary = { r = 0.0, g = 1.0, b = 0.0, a = 1.000 },
			secondary = { r = 0.0, g = 1.0, b = 0.0, a = 1.000 },
		},
		allow_productivity = true,
		auto_recycle = false,
	},
})
utils.add_recipes("logistic-science-pack", { "aps-pelagos-logistic-science-pack" })
data:extend({
	{
		type = "recipe",
		name = "aps-pelagos-chemical-science-pack",
		icons = {
			{ icon = "__base__/graphics/icons/chemical-science-pack.png", icon_size = 64 },
			{ icon = "__pelagos__/graphics/pelagos.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		enabled = false,
		energy_required = 24,
		category = "organic",
		ingredients = {
			{ type = "item", name = "engine-unit", amount = 2 },
			{ type = "item", name = "advanced-circuit", amount = 3 },
			{ type = "fluid", name = "ethanol", amount = 30 },
		},
		results = { { type = "item", name = "chemical-science-pack", amount = 3 } },
		crafting_machine_tint = {
			primary = { r = 0.0, g = 0.8, b = 1.0, a = 1.000 },
			secondary = { r = 0.0, g = 0.8, b = 1.0, a = 1.000 },
		},
		allow_productivity = true,
		auto_recycle = false,
	},
})
utils.add_recipes("chemical-science-pack", { "aps-pelagos-chemical-science-pack" })
data:extend({
	{
		type = "recipe",
		name = "aps-pelagos-military-science-pack",
		icons = {
			{ icon = "__base__/graphics/icons/military-science-pack.png", icon_size = 64 },
			{ icon = "__pelagos__/graphics/pelagos.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		enabled = false,
		energy_required = 10,
		ingredients = {
			{ type = "item", name = "corrosive-firearm-magazine", amount = 1 },
			{ type = "item", name = "grenade", amount = 1 },
			{ type = "item", name = "wooden-platform", amount = 2 },
		},
		results = { { type = "item", name = "military-science-pack", amount = 2 } },
		crafting_machine_tint = {
			primary = { r = 0.3, g = 0.3, b = 0.3, a = 1.000 },
			secondary = { r = 0.3, g = 0.3, b = 0.3, a = 1.000 },
		},
		allow_productivity = true,
		auto_recycle = false,
	},
})
utils.add_recipes("military-science-pack", { "aps-pelagos-military-science-pack" })
--utils.set

utils.add_prerequisites("planet-discovery-nauvis", { "agricultural-science-pack" })
utils.add_prerequisites("planet-discovery-fulgora", { "agricultural-science-pack" })
utils.add_prerequisites("planet-discovery-vulcanus", { "agricultural-science-pack" })
data:extend({
	{
		type = "technology",
		name = "diesel-mining-drill",
		icon = "__pelagos__/graphics/diesel-mining-drill/diesel-mining-drill-technology.png",
		icon_size = 512,
		essential = true,
		effects = {
			{ type = "unlock-recipe", recipe = "diesel-mining-drill" },
		},
		prerequisites = {
			"coconut-processing-technology",
			"engine",
			--"electric-mining-drill", -- important for any planet start
		},
		unit = {
			count = 50,
			ingredients = {
				{ "automation-science-pack", 1 },
			},
			time = 15,
		},
		order = "ea[pelagos]",
	},
})

utils.set_prerequisites("electric-mining-drill", { "diesel-mining-drill" })
data.raw["technology"]["long-range-delivery-drone"].unit = {
	count = 250,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "utility-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
	},
	time = 30,
}
utils.set_prerequisites("long-range-delivery-drone", { "pelagos-science-pack", "utility-science-pack" })
data.raw["technology"]["improvised-landfill"].unit = {
	count = 100,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
	},
	time = 30,
}

data.raw["technology"]["portable-diesel-generator"].unit = {
	count = 200,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "utility-science-pack", 1 },
	},
	time = 30,
}

data.raw["technology"]["wood-spoiling-technology"].unit = nil
data.raw["technology"]["wood-spoiling-technology"].research_trigger = {
	type = "build-entity",
	entity = "biochamber",
}
data.raw["technology"]["wood-spoiling-technology"].prerequisites = { "coconut-processing-technology" }

data.raw["technology"]["tank_ship"].unit = {
	count = 300,
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
data.raw["technology"]["heavy-gun-turret"].unit = {
	count = 500,
	ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "pelagos-science-pack", 1 },
		{ "military-science-pack", 1 },
	},
	time = 30,
}
--utils.add_recipes(
--	"space-platform",
--	{ "metallic-asteroid-methane-crushing", "carbonic-asteroid-gasification", "oxide-asteroid-melting" }
--)
--
data.raw["technology"]["degradation-module-technology"].unit.count = 500
data.raw["technology"]["titanium-barrels"].unit.count = 200
----------------------------------------------------------------------------------------------------------
-- space changes
----------------------------------------------------------------------------------------------------------
data.raw.technology["pelagos-asteroid-bioprocessing"].hidden = true
data.raw.technology["ethanol-thruster"].hidden = true
data.raw.technology["diesel-asteroid-collector"].hidden = true
data.raw.technology["space-science-pack"].research_trigger.entity = "diesel-asteroid-collector"
----------------------------------------------------------------------------------------------------------
utils.add_recipes("space-platform", {
	"oxide-asteroid-melting",
	"metallic-asteroid-methane-crushing",
	"carbonic-asteroid-gasification",
	"diesel-asteroid-collector",
})
utils.remove_recipes("space-platform", {
	"crusher",
	"metallic-asteroid-crushing",
	"carbonic-asteroid-crushing",
	"oxide-asteroid-crushing",
	"asteroid-collector",
})
utils.add_recipes("advanced-asteroid-processing", {
	"crusher",
	"metallic-asteroid-crushing",
	"carbonic-asteroid-crushing",
	"oxide-asteroid-crushing",
	"asteroid-collector",
})

utils.add_recipes("space-platform-thruster", { "ethanol-thruster" })
utils.remove_recipes("space-platform-thruster", { "thruster", "ice-melting", "thruster-fuel", "thruster-oxidizer" })
utils.add_recipes("advanced-asteroid-processing", { "thruster", "ice-melting", "thruster-fuel", "thruster-oxidizer" })
utils.add_recipes("planet-discovery-fulgora", { "ice-melting" })
data:extend({
	{
		type = "recipe",
		name = "aps-pelagos-space-science-pack",
		icons = {
			{ icon = "__base__/graphics/icons/space-science-pack.png", icon_size = 64 },
			{ icon = "__pelagos__/graphics/pelagos.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		enabled = false,
		energy_required = 15,
		category = "organic",
		ingredients = {
			{ type = "item", name = "iron-plate", amount = 2 },
			{ type = "fluid", name = "water", amount = 20 },
			{ type = "fluid", name = "methane", amount = 10 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 0,
				max = 0,
			},
		},
		results = { { type = "item", name = "space-science-pack", amount = 5 } },
		crafting_machine_tint = {
			primary = { r = 1.0, g = 1.0, b = 1.0, a = 1.000 },
			secondary = { r = 1.0, g = 1.0, b = 1.0, a = 1.000 },
		},
		allow_productivity = true,
		auto_recycle = false,
	},
})
utils.add_recipes("space-science-pack", { "aps-pelagos-space-science-pack" })
----------------------------------------------------------------------------------------------------------
-- safe asteroids
local planet = data.raw.planet.pelagos

for i = #planet.asteroid_spawn_definitions, 1, -1 do
	local def = planet.asteroid_spawn_definitions[i]
	if def.asteroid:sub(-6) ~= "-chunk" then
		table.remove(planet.asteroid_spawn_definitions, i)
	end
end
----------------------------------------------------------------------------------------------------------
if mods["lignumis"] then
	data.raw.technology["copper-processing"].research_trigger = {
		type = "mine-entity",
		entity = "pelagos-copper-stromatolite",
	}
	require("prototypes.steam-inserter")
	data:extend({
		{
			type = "recipe",
			name = "steam-inserter",
			enabled = false,
			ingredients = {
				{ type = "item", name = "burner-inserter", amount = 1 },
				{ type = "item", name = "gold-pipe", amount = 4 },
			},
			results = { { type = "item", name = "steam-inserter", amount = 1 } },
			allow_productivity = false,
		},
		{
			type = "recipe",
			name = "steam-inserter-iron-pipe",
			icons = {
				{ icon = "__base__/graphics/icons/inserter.png", icon_size = 64 },
				{ icon = "__base__/graphics/icons/fluid/steam.png", icon_size = 64, scale = 0.25, shift = { 8, -8 } },
				{ icon = "__base__/graphics/icons/pipe.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
			},
			enabled = false,
			ingredients = {
				{ type = "item", name = "burner-inserter", amount = 1 },
				{ type = "item", name = "pipe", amount = 4 },
			},
			results = { { type = "item", name = "steam-inserter", amount = 1 } },
			allow_productivity = false,
		},
		{
			type = "recipe",
			name = "steam-assembling-machine-iron-pipe",
			icons = {
				{ icon = "__lignumis-assets__/graphics/icons/steam-assembling-machine.png", icon_size = 64 },
				{ icon = "__base__/graphics/icons/iron-plate.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
			},
			enabled = false,
			ingredients = {
				{ type = "item", name = "burner-assembling-machine", amount = 1 },
				{ type = "item", name = "pipe", amount = 5 },
			},
			results = { { type = "item", name = "steam-assembling-machine", amount = 1 } },
			allow_productivity = false,
		},
	})

	utils.add_recipes("steam-automation", { "steam-inserter" })
	utils.add_recipes("steam-power", { "steam-inserter-iron-pipe" })
	utils.add_recipes("steam-power", { "steam-assembling-machine-iron-pipe" })
end

-- ironclad compatibility
if mods["aai-vehicles-ironclad"] and not mods["ironclad-gunboat-and-mortar-turret-fork"] then
	local clad = data.raw["technology"]["ironclad"]
	clad.prerequisites = { "pelagos-science-pack" }
	clad.unit = {
		count = 2000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "military-science-pack", 1 },
			{ "pelagos-science-pack", 1 },
		},
		time = 60,
	}
end

-- ironclad fork compatibility
if mods["ironclad-gunboat-and-mortar-turret-fork"] then
	local gun_clad = data.raw["technology"]["ironclad-gunboat"]
	gun_clad.prerequisites = { "pelagos-science-pack" }
	gun_clad.unit = {
		count = 2000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "military-science-pack", 1 },
			{ "pelagos-science-pack", 1 },
		},
		time = 60,
	}
	local clad = data.raw["technology"]["ironclad"]
	clad.unit = {
		count = 1000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "military-science-pack", 1 },
			{ "pelagos-science-pack", 1 },
		},
		time = 60,
	}
end

require("prototypes.recipes.barreling")
require("aps-lignumis-updates")

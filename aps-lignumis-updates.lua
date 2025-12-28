if mods["lignumis"] and mods["any-planet-start"] then
	if settings.startup["aps-planet"].value == "pelagos" then
		data.raw["technology"]["production-science-pack"].prerequisites = { "ethanol-thruster" }
		data.raw["technology"]["utility-science-pack"].prerequisites = { "ethanol-thruster" }
		data.raw["technology"]["planet-discovery-nauvis"].unit.ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "wood-science-pack", 1 },
			{ "steam-science-pack", 1 },
		}
	end
end

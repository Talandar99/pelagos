if mods["lignumis"] and mods["any-planet-start"] then
	if settings.startup["aps-planet"].value == "pelagos" then
		data.raw["technology"]["production-science-pack"].prerequisites = { "ethanol-thruster" }
		data.raw["technology"]["utility-science-pack"].prerequisites = { "ethanol-thruster" }
	end
end

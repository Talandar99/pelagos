for _, planet in pairs(game.planets) do
	if planet.name == "pelagos" and planet.surface then
		local surface = planet.surface
		local map_gen_settings = surface.map_gen_settings

		map_gen_settings.autoplace_controls["titanium-sludge"] = {}
		map_gen_settings.autoplace_settings.entity.settings["titanium-sludge"] = {}

		surface.map_gen_settings = map_gen_settings

		surface.regenerate_entity("titanium-sludge")

		log("Set sails! A new resource, Titanium sludge, be spotted on Pelagos!")
		game.print("⚓ Set sails! A new resource, Titanium sludge, be spotted on Pelagos! ⚓")
	end
end

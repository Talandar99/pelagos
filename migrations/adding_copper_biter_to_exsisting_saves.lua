for _, planet in pairs(game.planets) do
	if planet.name == "pelagos" and planet.surface then
		local surface = planet.surface
		local map_gen_settings = surface.map_gen_settings

		map_gen_settings.autoplace_settings.entity.settings["copper-biter-spawner"] = {}
		surface.map_gen_settings = map_gen_settings

		surface.regenerate_entity("copper-biter-spawner")

		log(
			"⚓ Those bastards are eating all our copper! A new enemy, the Copper Biter, has been spotted on Pelagos! ⚓"
		)
		game.print(
			"⚓ Those bastards are eating all our copper! A new enemy, the Copper Biter, has been spotted on Pelagos! ⚓"
		)
	end
end

local surface = game.surfaces["pelagos"]
if surface and surface.valid then
	for chunk in surface.get_chunks() do
		local tiles_to_fix = {}
		for x = chunk.x * 32, (chunk.x + 1) * 32 - 1 do
			for y = chunk.y * 32, (chunk.y + 1) * 32 - 1 do
				local tile = surface.get_tile(x, y)
				if tile.name == "pelagos-sand-3" then
					table.insert(tiles_to_fix, { name = "sand-1", position = { x, y } })
				elseif tile.name == "pelagos-sand-4" then
					table.insert(tiles_to_fix, { name = "sand-2", position = { x, y } })
				end
			end
		end
		if #tiles_to_fix > 0 then
			surface.set_tiles(tiles_to_fix, true)
		end
	end
end

for _, planet in pairs(game.planets or {}) do
	if planet.name == "pelagos" and planet.surface and planet.surface.valid then
		local surface = planet.surface
		local mgs = surface.map_gen_settings
		mgs.autoplace_settings = mgs.autoplace_settings or {}
		mgs.autoplace_settings.tile = mgs.autoplace_settings.tile or {}
		mgs.autoplace_settings.tile.settings = mgs.autoplace_settings.tile.settings or {}

		local tile_settings = mgs.autoplace_settings.tile.settings
		tile_settings["pelagos-sand-3"] = nil
		tile_settings["pelagos-sand-4"] = nil
		tile_settings["sand-1"] = tile_settings["sand-1"] or {}
		tile_settings["sand-2"] = tile_settings["sand-2"] or {}
		surface.map_gen_settings = mgs

		log(
			"Updated Pelagos map generator tile settings: removed pelagos-sand-3/4, ensured sand-1/2 and pelagos-deepsea exist."
		)
	end
end

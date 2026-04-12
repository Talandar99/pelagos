for _, surface in pairs(game.surfaces) do
	for _, silo in pairs(surface.find_entities_filtered({ name = "pelagos-rocket-silo" })) do
		if silo.valid then
			local pos = silo.position
			local force = silo.force
			local direction = silo.direction
			local last_user = silo.last_user

			silo.destroy({ raise_destroy = true })

			local new = surface.create_entity({
				name = "rocket-silo",
				position = pos,
				force = force,
				direction = direction,
				raise_built = true,
			})

			if new and new.valid then
				new.last_user = last_user

				if new.prototype.crafting_categories["rocket-building"] then
					new.set_recipe("pelagos-rocket-part")
					new.recipe_locked = true
				end
			end
		end
	end
end

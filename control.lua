local function replace_silo_on_pelagos(entity)
	if not entity or not entity.valid then
		return
	end
	if entity.name ~= "rocket-silo" then
		return
	end
	if entity.surface.name ~= "pelagos" then
		return
	end

	local pos = entity.position
	local surface = entity.surface
	local force = entity.force
	entity.destroy()

	surface.create_entity({
		name = "pelagos-rocket-silo",
		position = pos,
		force = force,
		raise_built = true,
	})
end

script.on_event(defines.events.on_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then
		return
	end
	replace_silo_on_pelagos(e)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then
		return
	end
	replace_silo_on_pelagos(e)
end)

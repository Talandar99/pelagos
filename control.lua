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

-- Define the initial machine groups and allowed tiles for each group.

--tiles = { "wooden-platform" },
--
local function build_allowed_entities()
	local allowed = {}

	-- vanilla subgrupy
	local filters = {
		{ filter = "subgroup", subgroup = "inserter" },
		{ filter = "subgroup", subgroup = "circuit-network" },
	}

	-- add 1 and 2 tiers from aai containers
	if script.active_mods["aai-containers"] then
		table.insert(filters, { filter = "subgroup", subgroup = "container-1" })
	end

	-- get items from filters
	local items = {}
	if filters[1] then
		items = prototypes.get_item_filtered(filters)
	end

	for _, item in pairs(items) do
		if item.place_result then
			allowed[item.place_result.name] = true
		end
	end

	-- storage group but only chest
	local storage_filters = { { filter = "subgroup", subgroup = "storage" } }
	local storage_items = prototypes.get_item_filtered(storage_filters)
	for _, item in pairs(storage_items) do
		if item.place_result and string.find(item.name, "chest") then
			allowed[item.place_result.name] = true
		end
	end

	-- logistic group but only chest
	local logistic_filters = { { filter = "subgroup", subgroup = "logistic-network" } }
	local logistic_items = prototypes.get_item_filtered(logistic_filters)
	for _, item in pairs(logistic_items) do
		if item.place_result and string.find(item.name, "chest") then
			allowed[item.place_result.name] = true
		end
	end

	-- logistic group but only chest
	local belt_filters = { { filter = "subgroup", subgroup = "belt" } }
	local belt_items = prototypes.get_item_filtered(belt_filters)
	for _, item in pairs(belt_items) do
		if item.place_result and string.find(item.name, "transport") then
			allowed[item.place_result.name] = true
		end
	end

	-- additional stuff
	allowed["pipe"] = true
	allowed["steel-chest"] = true
	allowed["barreling-machine"] = true
	allowed["radar"] = true
	allowed["canex-excavator"] = true
	allowed["entity-ghost"] = true

	return allowed
end

local function on_init(event)
	storage.allowed_entities = build_allowed_entities()
end
script.on_init(on_init)
local function on_configuration_changed(event)
	storage.allowed_entities = build_allowed_entities()
end
script.on_configuration_changed(on_configuration_changed)

local function on_entity_built(event)
	local entity = event.entity
	if not (entity and entity.valid) then
		return
	end

	local surface = entity.surface
	local bounds = entity.bounding_box
	local left = math.floor(bounds.left_top.x + 0.001)
	local top = math.floor(bounds.left_top.y + 0.001)
	local right = math.floor(bounds.right_bottom.x - 0.001)
	local bottom = math.floor(bounds.right_bottom.y - 0.001)

	-- Check every tile beneath the entity for allowed terrain.
	for tx = left, right do
		for ty = top, bottom do
			local tile = surface.get_tile(tx, ty)
			local tile_name = tile.name
			-- check if ground is wooden-platform
			if tile_name == "wooden-platform" then
				-- check if it's allowed to place
				if not storage.allowed_entities[entity.name] then
					if event.player_index then
						local player = game.get_player(event.player_index)
						if player then
							local consumed_inv = event.consumed_items
							if consumed_inv and consumed_inv.valid then
								for _, stack in ipairs(consumed_inv.get_contents()) do
									local item_name = stack.name or stack[1]
									local item_count = stack.count or stack[2]
									local item_quality = stack.quality or stack[3]
									local insert_stack = { name = item_name, count = item_count }
									if item_quality then
										insert_stack.quality = (type(item_quality) == "table" and item_quality.name)
											or item_quality
									end
									local inserted = player.insert(insert_stack)
									if inserted < item_count then
										surface.spill_item_stack({
											position = entity.position,
											stack = {
												name = item_name,
												count = item_count - inserted,
												quality = insert_stack.quality,
											},
											enable_looted = true,
										})
									end
								end
							end
						end
					else
						if event.stack and event.stack.valid_for_read then
							local item_name = event.stack.name
							local item_count = event.stack.count
							local quality_proto = event.stack.quality
							local spill_stack = { name = item_name, count = item_count }
							if quality_proto then
								spill_stack.quality = quality_proto.name or quality_proto
							end
							surface.spill_item_stack({
								position = entity.position,
								stack = spill_stack,
								enable_looted = true,
							})
						end
					end

					if entity.valid then
						entity.destroy({ raise_destroy = false })
					end
					return
				end
				return
			end
		end
	end
end

script.on_event(defines.events.on_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then
		return
	end
	on_entity_built(event)
	replace_silo_on_pelagos(e)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then
		return
	end
	on_entity_built(event)
	replace_silo_on_pelagos(e)
end)

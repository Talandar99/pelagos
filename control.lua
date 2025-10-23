---------------------------------------------------------------------------------
---- lighthouse
---------------------------------------------------------------------------------
--local function on_built_lighthouse(event)
--	local entity = event.entity or event.created_entity
--	if not (entity and entity.valid and entity.name == "lighthouse") then
--		return
--	end
--
--	local surface = entity.surface
--	local pos = entity.position
--
--	local lamp_position = { x = pos.x - 0.1, y = pos.y }
--
--	local lamp = surface.create_entity({
--		name = "lighthouse-light",
--		position = lamp_position,
--		force = entity.force,
--		create_build_effect_smoke = false,
--	})
--
--	if lamp then
--		lamp.destructible = false
--		lamp.operable = false
--		storage.lighthouse_lamps = storage.lighthouse_lamps or {}
--		table.insert(storage.lighthouse_lamps, {
--			lamp_unit_number = lamp.unit_number,
--			parent_unit_number = entity.unit_number,
--			surface_index = surface.index,
--		})
--	end
--end
--
local function on_removed_lighthouse(event)
	local entity = event.entity
	if not (entity and entity.valid and entity.name == "lighthouse") then
		return
	end

	local surface = entity.surface
	for _, lamp in
		pairs(surface.find_entities_filtered({
			name = "lighthouse-light",
			area = {
				{ entity.position.x - 1, entity.position.y - 1 },
				{ entity.position.x + 1, entity.position.y + 1 },
			},
		}))
	do
		lamp.destroy()
	end

	if storage.lighthouse_lamps then
		for i = #storage.lighthouse_lamps, 1, -1 do
			local entry = storage.lighthouse_lamps[i]
			if entry.parent_unit_number == entity.unit_number then
				table.remove(storage.lighthouse_lamps, i)
			end
		end
	end
end

-------------------------------------------------------------------------------
-- lighthouse: spawn/remove lamp based on fuel state
-------------------------------------------------------------------------------
script.on_nth_tick(120, function()
	storage.lighthouse_lamps = storage.lighthouse_lamps or {}

	for _, surface in pairs(game.surfaces) do
		for _, lighthouse in pairs(surface.find_entities_filtered({ name = "lighthouse" })) do
			if lighthouse.valid then
				local fluid = lighthouse.fluidbox and lighthouse.fluidbox[1]
				local has_fuel = (fluid and fluid.amount or 0) > 0

				local lamp = surface.find_entities_filtered({
					name = "lighthouse-light",
					area = {
						{ lighthouse.position.x - 1, lighthouse.position.y - 1 },
						{ lighthouse.position.x + 1, lighthouse.position.y + 1 },
					},
				})[1]

				if has_fuel and not lamp then
					local lamp_position = { x = lighthouse.position.x - 0.1, y = lighthouse.position.y }
					local new_lamp = surface.create_entity({
						name = "lighthouse-light",
						position = lamp_position,
						force = lighthouse.force,
						create_build_effect_smoke = false,
					})

					if new_lamp then
						new_lamp.destructible = false
						new_lamp.operable = false
						storage.lighthouse_lamps[lighthouse.unit_number] = new_lamp.unit_number
					end
				elseif (not has_fuel) and lamp then
					lamp.destroy()
					storage.lighthouse_lamps[lighthouse.unit_number] = nil
				end
			end
		end
	end
end)
-------------------------------------------------------------------------------
-- Define the initial machine groups and allowed tiles for each group.
local function build_allowed_entities()
	local allowed = {}

	local filters = {
		{ filter = "subgroup", subgroup = "inserter" },
		{ filter = "subgroup", subgroup = "circuit-network" },
	}

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
	allowed["gun-turret"] = true
	allowed["flamethrower-turret"] = true
	allowed["rocket-turret"] = true
	allowed["pipe"] = true
	allowed["steel-chest"] = true
	allowed["barreling-machine"] = true
	allowed["radar"] = true
	allowed["canex-excavator"] = true
	allowed["entity-ghost"] = true
	allowed["pump"] = true
	allowed["long-range-delivery-drone-request-depot"] = true
	allowed["cargo_ship"] = true
	allowed["cargo_ship_engine"] = true
	allowed["oil_tanker"] = true
	allowed["indep-boat"] = true
	allowed["boat_engine"] = true
	allowed["oil_rig"] = true
	allowed["or_power_electric"] = true
	allowed["or_pole"] = true
	allowed["or_radar"] = true
	allowed["or_tank"] = true

	return allowed
end

local function on_init(event)
	storage.allowed_entities = build_allowed_entities()
	--storage.lighthouse_lamps = storage.lighthouse_lamps or {}
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

local function on_built_rocket_silo(event)
	local entity = event.entity or event.created_entity
	if not (entity and entity.valid) then
		return
	end

	local proto = (entity.name == "entity-ghost") and entity.ghost_prototype or entity.prototype
	if not proto or proto.type ~= "rocket-silo" then
		return
	end
	if not proto.crafting_categories or not proto.crafting_categories["rocket-building"] then
		return
	end

	-- set_recipe based on surface
	local recipe
	if entity.surface.name == "pelagos" then
		recipe = "pelagos-rocket-part"
		entity.set_recipe(recipe)
		entity.recipe_locked = true
	end
end

script.on_event(defines.events.on_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then
		return
	end

	on_entity_built(event)
	on_built_rocket_silo(event)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then
		return
	end

	on_entity_built(event)
	on_built_rocket_silo(event)
end)

script.on_event({
	defines.events.on_entity_died,
	defines.events.on_player_mined_entity,
	defines.events.on_robot_mined_entity,
}, on_removed_lighthouse)
-------------------------------------------------------------------------------
--- starting patch
-------------------------------------------------------------------------------
script.on_event(defines.events.on_player_created, function(event)
	storage.init = storage.init or {}
	if storage.init[event.player_index] then
		return
	end
	storage.init[event.player_index] = true

	if not script.active_mods["any-planet-start"] then
		return
	end

	local setting = settings.startup["aps-planet"]
	if not setting or setting.value ~= "pelagos" then
		return
	end

	if
		not script.active_mods["Burner-Leech-Fork"]
		and not script.active_mods["Burner-Leech"]
		and not script.active_mods["InserterFuelLeech"]
	then
		game.print(
			"Pelagos: You are starting Any Planet Start game without a burner leech mod. "
				.. "The intended experience is to use one. You can disable such a mod after the burner phase of the game. "
				.. "See the mod page for more details."
		)
	end
end)

local generated_iron_patch = false

script.on_event(defines.events.on_surface_created, function(event)
	local surface = game.surfaces[event.surface_index]
	if surface.name == "pelagos" and not generated_iron_patch then
		generated_iron_patch = true

		local center = { x = 10, y = 10 }
		local radius = 12
		local max_amount = 3000

		for x = -radius, radius do
			for y = -radius, radius do
				local distance = math.sqrt(x * x + y * y)
				if distance <= radius then
					local noise = math.random()

					local density = 1 - (distance / radius) + (noise - 0.5) * 0.3

					if density > 0.2 then
						local amount = math.floor(max_amount * density)
						surface.create_entity({
							name = "iron-ore",
							amount = amount,
							position = { center.x + x, center.y + y },
						})
					end
				end
			end
		end
	end
end)
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- lighthouse: spawn/remove lamp based on fuel state
-------------------------------------------------------------------------------
local function on_built_lighthouse(event)
	local lighthouse = event.entity or event.created_entity
	if not (lighthouse and lighthouse.valid and lighthouse.name == "lighthouse") then
		return
	end

	storage.pelagos_lighthouse_lamps[lighthouse.unit_number] = { radar = lighthouse, lamp = nil }
end
local function on_removed_lighthouse(event)
	local e = event.entity
	if not (e and e.valid and e.name == "lighthouse") then
		return
	end

	local data = storage.pelagos_lighthouse_lamps[e.unit_number]
	if data and data.lamp and data.lamp.valid then
		data.lamp.destroy()
	end
	storage.pelagos_lighthouse_lamps[e.unit_number] = nil
end

-------------------------------------------------------------------------------
-- check every 2 seconds
-------------------------------------------------------------------------------
script.on_nth_tick(120, function()
	if not storage.pelagos_lighthouse_lamps then
		return
	end

	for id, data in pairs(storage.pelagos_lighthouse_lamps) do
		local lighthouse = data.radar
		if not (lighthouse and lighthouse.valid) then
			if data.lamp and data.lamp.valid then
				data.lamp.destroy()
			end
			storage.pelagos_lighthouse_lamps[id] = nil
		else
			local fluid = lighthouse.fluidbox and lighthouse.fluidbox[1]
			local has_fuel = (fluid and fluid.amount or 0) > 0

			if has_fuel then
				if not (data.lamp and data.lamp.valid) then
					local lamp = lighthouse.surface.create_entity({
						name = "lighthouse-light",
						position = { lighthouse.position.x - 0.1, lighthouse.position.y },
						force = lighthouse.force,
						create_build_effect_smoke = false,
					})
					if lamp then
						lamp.destructible = false
						lamp.operable = false
						data.lamp = lamp
					end
				end
			else
				if data.lamp and data.lamp.valid then
					data.lamp.destroy()
					data.lamp = nil
				end
			end
		end
	end
end)
-------------------------------------------------------------------------------
-- diesel asteroid collector: manage paired engine
-------------------------------------------------------------------------------

local function on_built_collector(event)
	local collector = event.entity or event.created_entity
	if not (collector and collector.valid and collector.name == "diesel-asteroid-collector") then
		return
	end
	storage.pelagos_diesel_collectors = storage.pelagos_diesel_collectors or {}
	storage.pelagos_diesel_collectors[collector.unit_number] = { collector = collector, engine = nil }
end

local function on_removed_collector(event)
	local e = event.entity
	if not (e and e.valid and e.name == "diesel-asteroid-collector") then
		return
	end

	local data = storage.pelagos_diesel_collectors and storage.pelagos_diesel_collectors[e.unit_number]
	if data and data.engine and data.engine.valid then
		data.engine.destroy()
	end
	if storage.pelagos_diesel_collectors then
		storage.pelagos_diesel_collectors[e.unit_number] = nil
	end
end

-------------------------------------------------------------------------------
-- every 1 second: ensure engine exists + sync active state
-------------------------------------------------------------------------------
script.on_nth_tick(60, function()
	if not storage.pelagos_diesel_collectors then
		return
	end

	for id, data in pairs(storage.pelagos_diesel_collectors) do
		local collector = data.collector
		if not (collector and collector.valid) then
			if data.engine and data.engine.valid then
				data.engine.destroy()
			end
			storage.pelagos_diesel_collectors[id] = nil
		else
			local engine = data.engine

			if not (engine and engine.valid) then
				local new_engine = collector.surface.create_entity({
					name = "diesel-asteroid-collector-engine",
					position = collector.position,
					direction = collector.direction,
					force = collector.force,
					create_build_effect_smoke = false,
					move_stuck_players = true,
				})
				if new_engine then
					new_engine.destructible = false
					new_engine.operable = false
					local recipe = "diesel-asteroid-collector-working"
					if new_engine.set_recipe and new_engine.force.recipes[recipe] then
						new_engine.set_recipe(recipe)
						new_engine.recipe_locked = true
						new_engine.active = true
					end

					data.engine = new_engine
				end
			end

			if data.engine and data.engine.valid then
				local engine = data.engine
				local collector = data.collector
				local fluid = engine.fluidbox and engine.fluidbox[1]
				local has_fuel = (fluid and fluid.amount or 0) > 0
				local working = (engine.is_crafting() or engine.energy > 0) and has_fuel
				if collector.active ~= working then
					collector.active = working
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
	if script.active_mods["kry-inserters"] then
		table.insert(filters, { filter = "subgroup", subgroup = "shinyinserter1" })
		table.insert(filters, { filter = "subgroup", subgroup = "shinyinserter2" })
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
	allowed["heavy-gun-turret"] = true
	allowed["flamethrower-turret"] = true
	allowed["rocket-turret"] = true
	allowed["pipe"] = true
	allowed["diesel-pump"] = true
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
-------------------------------------------------------------------------------
--- init
-------------------------------------------------------------------------------
local function register_with_cargo_ships()
	-- add pirateship to cargo_ship ships so it can be entered the same way as other ships
	if remote.interfaces["cargo-ships"] and remote.interfaces["cargo-ships"].add_boat then
		if prototypes.entity["pirateship"] then
			remote.call("cargo-ships", "add_boat", {
				name = "pirateship",
				rail_version = nil,
			})
			log("Pelagos: Registered Pirate Ship as a boat for Cargo Ships system.")
		else
			log("Pelagos: Pirate Ship entity not found.")
		end
	else
		log("Pelagos: Cargo Ships API not available (add_boat missing).")
	end
end

local function ensure_storage_integrity()
	if not storage then
		return
	end

	if not storage.allowed_entities then
		storage.allowed_entities = build_allowed_entities()
	end

	storage.pelagos_lighthouse_lamps = storage.pelagos_lighthouse_lamps or {}
	storage.pelagos_diesel_collectors = storage.pelagos_diesel_collectors or {}
end
-------------------------------------------------------------------------------
-- on_entity_built logic
-------------------------------------------------------------------------------
local function on_entity_built(event)
	ensure_storage_integrity()
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
-------------------------------------------------------------------------------
local function on_init(event)
	storage.allowed_entities = build_allowed_entities()
	storage.pelagos_lighthouse_lamps = storage.pelagos_lighthouse_lamps or {}
	storage.pelagos_diesel_collectors = storage.pelagos_diesel_collectors or {}
	register_with_cargo_ships()
end
script.on_init(on_init)

local function on_configuration_changed(event)
	storage.allowed_entities = build_allowed_entities()
	storage.pelagos_lighthouse_lamps = storage.pelagos_lighthouse_lamps or {}
	storage.pelagos_diesel_collectors = storage.pelagos_diesel_collectors or {}
	register_with_cargo_ships()
end
script.on_configuration_changed(on_configuration_changed)
-------------------------------------------------------------------------------
script.on_event(defines.events.on_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then
		return
	end

	on_entity_built(event)
	on_built_rocket_silo(event)
	on_built_lighthouse(event)
	on_built_collector(event)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then
		return
	end
	on_entity_built(event)
	on_built_rocket_silo(event)
	on_built_lighthouse(event)
	on_built_collector(event)
end)
script.on_event(defines.events.on_space_platform_built_entity, function(event)
	local e = event.entity
	if not (e and e.valid) then
		return
	end

	on_built_rocket_silo(event)
	on_built_lighthouse(event)
	on_built_collector(event)
end)

script.on_event(
	{ defines.events.on_entity_died, defines.events.on_player_mined_entity, defines.events.on_robot_mined_entity },
	function(event)
		local e = event.entity
		if not e then
			return
		end

		on_removed_lighthouse(event)
		on_removed_collector(event)
	end
)
-------------------------------------------------------------------------------
--- starting ore patch
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

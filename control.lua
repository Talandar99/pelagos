local function recipe_has_sealant(recipe_name)
	local rp = prototypes.recipe[recipe_name]
	if not rp then
		return false
	end

	for _, ing in pairs(rp.ingredients) do
		if ing and ing.name == "coconut-sealant" then
			return true
		end
	end

	return false
end

local function sanity_checks()
	assert(
		recipe_has_sealant("cargo_ship"),
		"\n\n[img=utility/warning_icon] Coconut Sealant missing from cargo_ship recipe!"
			.. "\n\nA mod has removed coconut-sealant from the cargo ship recipe."
			.. "\nThis breaks pelagos design by making planet pointless"
			.. "\n\nPlease EITHER:"
			.. "\n   Option 1) Disable the mod that alters the cargo_ship recipe"
			.. "\n   Option 2) Restore coconut-sealant as a required ingredient\n\n"
	)

	assert(
		recipe_has_sealant("oil_tanker"),
		"\n\n[img=utility/warning_icon] Coconut Sealant missing from oil_tanker recipe!"
			.. "\n\nA mod has removed coconut-sealant from the tanker recipe."
			.. "\nThis breaks pelagos design by making planet pointless"
			.. "\n\nPlease EITHER:"
			.. "\n   Option 1) Disable the mod that alters the oil_tanker recipe"
			.. "\n   Option 2) Restore coconut-sealant as a required ingredient\n\n"
	)

	assert(
		recipe_has_sealant("boat"),
		"\n\n[img=utility/warning_icon] Coconut Sealant missing from boat recipe!"
			.. "\n\nA mod has removed coconut-sealant from the boat recipe."
			.. "\nThis breaks pelagos design by making planet pointless"
			.. "\n\nPlease EITHER:"
			.. "\n   Option 1) Disable the mod that alters the boat recipe"
			.. "\n   Option 2) Restore coconut-sealant as a required ingredient\n\n"
	)
end
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
-------------------------------------------------------------------------------
--- init
-------------------------------------------------------------------------------

local function ensure_storage_integrity()
	if not storage then
		return
	end

	storage.pelagos_lighthouse_lamps = storage.pelagos_lighthouse_lamps or {}
	storage.pelagos_diesel_collectors = storage.pelagos_diesel_collectors or {}
end
-------------------------------------------------------------------------------
-- on_entity_built logic
-------------------------------------------------------------------------------
local function on_entity_built(event)
	ensure_storage_integrity()
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
	storage.pelagos_lighthouse_lamps = storage.pelagos_lighthouse_lamps or {}
	storage.pelagos_diesel_collectors = storage.pelagos_diesel_collectors or {}
	sanity_checks()
end
script.on_init(on_init)

local function on_configuration_changed(event)
	storage.pelagos_lighthouse_lamps = storage.pelagos_lighthouse_lamps or {}
	storage.pelagos_diesel_collectors = storage.pelagos_diesel_collectors or {}
	sanity_checks()
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
		if script.active_mods["depths_of_nauvis"] then
			if settings.startup["generate-oil-only-on-water"].value then
				game.print(
					"Creator of Pelagos and Depths of Nauvis:\nHi. Looks like this combination of mods and settings will lock your progreesion:\n"
						.. "Pelagos is a place where you unlock oil rig and ships but you probably spawned on Nauvis.\n"
						.. "Depths of nauvis by default remove oil from ground, and leave just offshore oil. And looks like this setting is turned on\n"
						.. "Without oil you can't leave Nauvis.\n"
						.. "You can enable oil patches on ground in settings and generate new world, or temporarly remove pelagos form list of mods, until you setup oil rig on nauvis"
				)
			end
		end
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
---
-------------------------------------------------------------------------------
---

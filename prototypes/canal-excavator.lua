if mods["canal-excavator"] then
	-- add pelagos excavatable ground
	data:extend({
		{
			type = "mod-data",
			name = "canex-pelagos-config",
			data_type = "canex-planet-config",
			data = {
				mineResult = "stone",
				oreStartingAmount = 20,
				tint = { r = 205, g = 133, b = 63 },
				isDefault = false,
			},
		},
	})

	if mods["skewer_planet_vesta"] then
		data:extend({
			{
				type = "mod-data",
				name = "canex-vesta-config",
				data_type = "canex-planet-config",
				data = {
					mineResult = "stone",
					oreStartingAmount = 20,
					tint = { r = 245, g = 173, b = 103 },
					isDefault = false,
				},
			},
		})
	end

	-- allow productivity
	if data.raw["mining-drill"]["canex-excavator"] then
		local excavator = data.raw["mining-drill"]["canex-excavator"]
		excavator.allowed_effects = { "consumption", "speed", "pollution", "productivity" }
		excavator.mining_speed = 1.5 --base was 0.5
		excavator.energy_source = excavator.energy_source or {}
		excavator.energy_source.type = "burner"
		excavator.energy_source.fuel_categories = { "diesel-fuel" }
		excavator.energy_source.effectivity = 1
		excavator.energy_source.fuel_inventory_size = 2
		excavator.energy_source.burnt_inventory_size = 2
		excavator.uses_force_mining_productivity_bonus = false
		excavator.module_slots = 6
		excavator.energy_usage = "540kW" --base was 180kW

		data.raw["tips-and-tricks-item"]["canex-excavator-tnt"].category = "space-age"
		data.raw["tips-and-tricks-item"]["canex-excavator-tnt"].order = "pelagos-da"

		data.raw["tips-and-tricks-item"]["canex-canals-tnt"].category = "space-age"
		data.raw["tips-and-tricks-item"]["canex-canals-tnt"].order = "pelagos-db"
	end
end

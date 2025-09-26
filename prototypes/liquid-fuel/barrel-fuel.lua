data:extend({
	{
		type = "fuel-category",
		name = "diesel-fuel",
	},
})

local BARREL_CAPACITY = 50

for _, fluid in pairs(data.raw.fluid) do
	local fuel_value = fluid.fuel_value
	if type(fuel_value) == "string" then
		local number_part = util.parse_energy(fuel_value) / 1000000
		local unit = "MJ"

		if number_part then
			for _, spec in ipairs({
				{ suffix = "-barrel", burnt = "barrel" },
				{ suffix = "-titanium-barrel", burnt = "titanium-barrel" },
			}) do
				local barrel = data.raw.item[fluid.name .. spec.suffix]
				if barrel then
					barrel.fuel_value = tostring(number_part * BARREL_CAPACITY) .. unit
					barrel.fuel_category = "diesel-fuel"
					barrel.burnt_result = spec.burnt

					local rocket = data.raw.item["rocket-fuel"]
					if rocket then
						barrel.fuel_acceleration_multiplier = 1 + (number_part / 2)
						barrel.fuel_emissions_multiplier = rocket.fuel_emissions_multiplier
						barrel.fuel_glow_color = rocket.fuel_glow_color
						barrel.fuel_top_speed_multiplier = rocket.fuel_top_speed_multiplier
					end
				end
			end
		end
	end
end

-- cargo ships big ships
if data.raw["locomotive"]["cargo_ship_engine"] then
	local ship = data.raw["locomotive"]["cargo_ship_engine"]
	ship.energy_source = ship.energy_source or {}
	ship.energy_source.type = "burner"
	ship.energy_source.fuel_categories = { "diesel-fuel" }
	--ship.energy_source.effectivity = 1
	ship.energy_source.effectivity = 1.5
	ship.energy_source.fuel_inventory_size = 10
	ship.energy_source.burnt_inventory_size = 10
	ship.max_power = "1.2MW"
end
-- cargo ships boat
if data.raw["car"]["indep-boat"] then
	local boat = data.raw["car"]["indep-boat"]
	boat.energy_source = boat.energy_source or {}
	boat.energy_source.type = "burner"
	boat.energy_source.fuel_categories = { "diesel-fuel" }
	boat.energy_source.effectivity = 1
	boat.energy_source.fuel_inventory_size = 3
	boat.energy_source.burnt_inventory_size = 3
	boat.max_power = "0.3MW"
end

-- adding diesel-fuel into maraxsis-diesel-submarine
if data.raw["spider-vehicle"]["maraxsis-diesel-submarine"] then
	local sub = data.raw["spider-vehicle"]["maraxsis-diesel-submarine"]

	sub.energy_source = sub.energy_source or {}
	sub.energy_source.fuel_categories = sub.energy_source.fuel_categories or {}
	sub.movement_energy_consumption = "6.5MW"
	table.insert(sub.energy_source.fuel_categories, "diesel-fuel")
end

if data.raw["mining-drill"]["canex-excavator"] then
	local excavator = data.raw["mining-drill"]["canex-excavator"]
end

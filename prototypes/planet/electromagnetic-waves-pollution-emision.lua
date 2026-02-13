local function has_nuclear_fuel(es)
	if not es then
		return false
	end
	if es.fuel_category == "nuclear" then
		return true
	end
	if es.fuel_categories then
		for _, cat in pairs(es.fuel_categories) do
			if cat == "nuclear" then
				return true
			end
		end
	end
	return false
end

local function has_fusion_fuel(es)
	if not es then
		return false
	end
	if es.fuel_category == "fusion" then
		return true
	end
	if es.fuel_categories then
		for _, cat in pairs(es.fuel_categories) do
			if cat == "fusion" then
				return true
			end
		end
	end
	return false
end

local function add_em_to_electric(proto)
	if proto.energy_source and proto.energy_usage then
		local es = proto.energy_source
		local generates_pollution = false

		if es.type == "electric" then
			generates_pollution = true
		elseif es.type == "burner" and has_nuclear_fuel(es) then
			generates_pollution = true
		elseif es.type == "burner" and has_fusion_fuel(es) then
			generates_pollution = true
		end

		if generates_pollution then
			local value = util.parse_energy(proto.energy_usage) / 1000 -- kW
			if value > 0 then
				es.emissions_per_minute = es.emissions_per_minute or {}
				es.emissions_per_minute.electromagnetic_waves = value
			end
		end
	end
end

local function add_em_to_generator(proto)
	if proto.type == "generator" and proto.fluid_box then
		local fluid = data.raw.fluid[proto.fluid_box.filter]
		if fluid and fluid.heat_capacity then
			local heat = util.parse_energy(fluid.heat_capacity) -- J/°C
			local energy_per_unit = (proto.maximum_temperature - (proto.min_temperature or 15)) * heat
			local power = proto.fluid_usage_per_tick * 60 * energy_per_unit * (proto.effectivity or 1)
			local value = power / 1e6 -- MW
			if value > 0 then
				proto.energy_source.emissions_per_minute = proto.energy_source.emissions_per_minute or {}
				proto.energy_source.emissions_per_minute["electromagnetic_waves"] = value
			end
		end
	elseif proto.type == "burner-generator" and proto.burner and proto.max_power_output then
		local power_mw = util.parse_energy(proto.max_power_output) / 100000
		local multiplier = 5
		if has_nuclear_fuel(proto.burner) then
			multiplier = 100
		end
		local value = power_mw * multiplier
		if value > 0 then
			proto.burner.emissions_per_minute = proto.burner.emissions_per_minute or {}
			proto.burner.emissions_per_minute.electromagnetic_waves = value
		end
	elseif proto.type == "fusion-generator" then
		local waves = 50
		proto.emissions_per_second = proto.emissions_per_second or {}
		proto.emissions_per_second.electromagnetic_waves = waves / 60
		local em_line = { "", "", { "airborne-pollutant-name-with-amount.electromagnetic_waves", waves .. "/m" } }
		if proto.localised_description then
			proto.localised_description = { "", proto.localised_description, em_line }
		else
			proto.localised_description = em_line
		end
	elseif proto.type == "accumulator" and proto.energy_source and proto.energy_source.buffer_capacity then
		local value = util.parse_energy(proto.energy_source.buffer_capacity) / 1000 / 5000 -- kW and correction because it's cappacity
		if value > 0 then
			proto.energy_source.emissions_per_minute = proto.energy_source.emissions_per_minute or {}
			proto.energy_source.emissions_per_minute["electromagnetic_waves"] = value
			proto.emissions_per_second = proto.emissions_per_second or {}
			proto.emissions_per_second.electromagnetic_waves = value / 60
		end
	elseif proto.type == "solar-panel" and proto.production then
		local value = util.parse_energy(proto.production) / 1000 -- kW
		proto.emissions_per_second = proto.emissions_per_second or {}
		proto.emissions_per_second.electromagnetic_waves = value / 60
		local em_line = { "", "", { "airborne-pollutant-name-with-amount.electromagnetic_waves", value .. "/m" } }
		if proto.localised_description then
			proto.localised_description = { "", proto.localised_description, em_line }
		else
			proto.localised_description = em_line
		end
	elseif proto.type == "reactor" and proto.consumption then
		local value = util.parse_energy(proto.consumption) / 1000 -- kW
		if value > 0 then
			proto.energy_source.emissions_per_minute = proto.energy_source.emissions_per_minute or {}
			proto.energy_source.emissions_per_minute["electromagnetic_waves"] = value
		end
	elseif proto.type == "fusion-reactor" and proto.power_input then
		local value = util.parse_energy(proto.power_input) / 100 -- w kW
		if value > 0 then
			proto.energy_source.emissions_per_minute = proto.energy_source.emissions_per_minute or {}
			proto.energy_source.emissions_per_minute["electromagnetic_waves"] = value
		end
	end
end

local tiles = { "sand-1", "sand-2", "pelagos-sand-1", "pelagos-sand-2", "pelagos-sand-3", "pelagos-sand-4" }

for _, tile in pairs(tiles) do
	if data.raw.tile[tile] then
		data.raw.tile[tile].absorptions_per_second = data.raw.tile[tile].absorptions_per_second or {}
		--data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.00001
		data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.0000124
		--data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.0000125
		--data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.00003 -- a bit too high
	end
end

local tiles = { "pelagos-deepsea", "water" }
for _, tile in pairs(tiles) do
	if data.raw.tile[tile] then
		data.raw.tile[tile].absorptions_per_second = data.raw.tile[tile].absorptions_per_second or {}
		--data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.000001 -- too low
		--data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.0000015
		data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.0000015
		--data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.0000016
		--data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.00000175
		--data.raw.tile[tile].absorptions_per_second.electromagnetic_waves = 0.000003 -- a bit to high
	end
end

for _, protos in pairs(data.raw) do
	for _, proto in pairs(protos) do
		if not (proto.type == "lamp" or proto.subgroup == "energy-lamp") then
			add_em_to_electric(proto)
			add_em_to_generator(proto)
		end
	end
end

local entity = data.raw["reactor"]["heating-tower"]
entity.energy_source = entity.energy_source or {}
entity.energy_source.emissions_per_minute = entity.energy_source.emissions_per_minute or {}
entity.energy_source.emissions_per_minute.electromagnetic_waves = 0

local lab = data.raw["lab"]["lab"]
lab.energy_source = lab.energy_source or {}
lab.energy_source.emissions_per_minute = lab.energy_source.emissions_per_minute or {}
lab.energy_source.emissions_per_minute.electromagnetic_waves = 0.5

local lab = data.raw["mining-drill"]["oil_rig"]
lab.energy_source = lab.energy_source or {}
lab.energy_source.emissions_per_minute = lab.energy_source.emissions_per_minute or {}
lab.energy_source.emissions_per_minute.electromagnetic_waves = 1.0

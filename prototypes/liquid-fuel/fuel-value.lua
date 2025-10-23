-- force override fuel_value for base fluids
local overrides = {
	---- vanilla
	--["light-oil"] = "3MJ",
	--["heavy-oil"] = "2.5MJ",
	--["petroleum-gas"] = "2MJ",
	--["coconut-oil"] = "1.5MJ",
	---- pelagos
	--["ethanol"] = "4.5MJ",
	--["methane"] = "2MJ",
	--["crude-oil"] = "1.5MJ",
	----bumpuff agriculture
	--["puff-gas"] = "2MJ",
	--- maraxsis
	--["hydrogen"] = "2.25MJ"
	--	balanced arround solid fuel
	-- vanilla
	["light-oil"] = "1.2MJ",
	["heavy-oil"] = "0.6MJ",
	["petroleum-gas"] = "0.6MJ",
	["crude-oil"] = "0.3MJ",
	-- pelagos
	["ethanol"] = "2MJ",
	["methane"] = "0.6MJ",
	["coconut-oil"] = "0.3MJ",
	["titanium-sludge"] = "0.15MJ",
	--bumpuff agriculture
	["puff-gas"] = "0.6MJ",
	--maraxis
	["hydrogen"] = "0.4MJ",
}

for name, value in pairs(overrides) do
	local fluid = data.raw.fluid[name]
	if fluid then
		fluid.fuel_value = value
	end
end

if settings.startup["pelagos-fluid-value-based-flamethrower"].value then
	local flameturret = data.raw["fluid-turret"]["flamethrower-turret"]

	for fluid_name, fuel_value in pairs(overrides) do
		local fluid = data.raw.fluid[fluid_name]
		if fluid then
			local number_part = util.parse_energy(fuel_value) / 1000000 -- MJ

			if number_part and number_part > 0 then
				local found = false
				for _, f in pairs(flameturret.attack_parameters.fluids) do
					if f.type == fluid_name then
						f.damage_modifier = number_part
						found = true
						break
					end
				end

				if not found then
					table.insert(flameturret.attack_parameters.fluids, {
						type = fluid_name,
						damage_modifier = number_part,
					})
				end
			end
		else
		end
	end
end

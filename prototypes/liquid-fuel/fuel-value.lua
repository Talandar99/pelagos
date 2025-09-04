-- force override fuel_value for base fluids
local overrides = {
	-- vanilla
	--	["light-oil"] = "3MJ",
	--	["heavy-oil"] = "2.5MJ",
	--	["petroleum-gas"] = "2MJ",
	--	["coconut-oil"] = "1MJ",
	--	-- pelagos
	--	["ethanol"] = "4MJ",
	--	["methane"] = "2MJ",
	--	["crude-oil"] = "1.5MJ",
	--	--bumpuff agriculture
	--	["puff-gas"] = "2MJ",
	-- vanilla
	["light-oil"] = "1.2MJ",
	["heavy-oil"] = "0.6MJ",
	["petroleum-gas"] = "0.6MJ",
	["coconut-oil"] = "0.3MJ",
	-- pelagos
	["ethanol"] = "2MJ",
	["methane"] = "0.6MJ",
	["crude-oil"] = "0.3MJ",
	--bumpuff agriculture
	["puff-gas"] = "0.6MJ",
}

for name, value in pairs(overrides) do
	local fluid = data.raw.fluid[name]
	if fluid then
		fluid.fuel_value = value
	end
end

function add_sealant_and_pelagos_import_location(name, sealant_count)
	if data.raw["item"][name] ~= nil then
		data.raw["item"][name].default_import_location = "pelagos"
	end
	if data.raw["recipe"][name] ~= nil then
		local has_sealant = false

		for _, ingredient in ipairs(data.raw["recipe"][name].ingredients) do
			if ingredient.name == "coconut-sealant" then
				has_sealant = true
				break
			end
		end

		if not has_sealant then
			table.insert(
				data.raw["recipe"][name].ingredients,
				{ type = "item", name = "coconut-sealant", amount = sealant_count }
			)
		end
	end
end

if mods["diesel_machines"] then
	add_sealant_and_pelagos_import_location("crane-bulk-diesel-inserter", 6)
	add_sealant_and_pelagos_import_location("long-handed-diesel-inserter", 4)
	add_sealant_and_pelagos_import_location("fast-diesel-inserter", 4)
	add_sealant_and_pelagos_import_location("diesel-inserter", 4)
	add_sealant_and_pelagos_import_location("diesel-mining-drill", 6)
	add_sealant_and_pelagos_import_location("portable-diesel-generator", 50)
	add_sealant_and_pelagos_import_location("diesel-assembling-machine", 10)
	add_sealant_and_pelagos_import_location("diesel-pump", 10)
	if mods["barreling_machines"] then
		add_sealant_and_pelagos_import_location("diesel-barreling-machine", 1)
	end
end

if mods["lubrication_tower"] then
	add_sealant_and_pelagos_import_location("lubrication-tower", 20)
	data.raw.item["lubrication-tower"].surface_conditions = {
		{
			property = "pressure",
			min = 1809,
			max = 1809,
		},
	}
end

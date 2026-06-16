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

local function replace_recipe_ingredient(recipe_name, old_ingredient, new_ingredient, new_amount)
	if data.raw["recipe"][recipe_name] == nil then
		return
	end

	local recipe = data.raw["recipe"][recipe_name]

	if recipe.ingredients == nil then
		return
	end

	for _, ingredient in ipairs(recipe.ingredients) do
		if ingredient.name == old_ingredient then
			ingredient.name = new_ingredient
			ingredient.amount = new_amount
			return
		end
	end
end

local function add_recipe_ingredient(recipe_name, ingredient_name, ingredient_amount)
	local recipe = data.raw.recipe[recipe_name]

	if not recipe or not recipe.ingredients then
		return
	end

	table.insert(recipe.ingredients, {
		type = "item",
		name = ingredient_name,
		amount = ingredient_amount,
	})
end
local function remove_recipe_ingredient(recipe_name, ingredient_name)
	if data.raw["recipe"][recipe_name] == nil then
		return
	end

	local recipe = data.raw["recipe"][recipe_name]

	if recipe.ingredients == nil then
		return
	end

	for i, ingredient in ipairs(recipe.ingredients) do
		local current_name = ingredient.name or ingredient[1]

		if current_name == ingredient_name then
			table.remove(recipe.ingredients, i)
			return
		end
	end
end

if mods["diesel_machines"] then
	-- inserters
	add_sealant_and_pelagos_import_location("crane-bulk-diesel-inserter", 6)
	replace_recipe_ingredient("crane-bulk-diesel-inserter", "steel-plate", "titanium-plate", 5)
	add_sealant_and_pelagos_import_location("long-handed-diesel-inserter", 4)
	add_sealant_and_pelagos_import_location("fast-diesel-inserter", 4)
	add_sealant_and_pelagos_import_location("diesel-inserter", 4)
	-- buildings
	add_sealant_and_pelagos_import_location("diesel-assembling-machine", 10)
	add_sealant_and_pelagos_import_location("diesel-pump", 10)
	add_sealant_and_pelagos_import_location("diesel-mining-drill", 6)
	-- equipment
	add_sealant_and_pelagos_import_location("portable-diesel-generator", 50)
	add_recipe_ingredient("portable-diesel-generator", "titanium-plate", 20)
	if mods["barreling_machines"] then
		add_sealant_and_pelagos_import_location("diesel-barreling-machine", 1)
	end
end

if mods["lubrication_tower"] then
	add_sealant_and_pelagos_import_location("lubrication-tower", 20)
	replace_recipe_ingredient("lubrication-tower", "iron-plate", "titanium-plate", 15)
	data.raw.item["lubrication-tower"].surface_conditions = {
		{
			property = "pressure",
			min = 1809,
			max = 1809,
		},
	}
end

if mods["cargo-ships"] then
	add_sealant_and_pelagos_import_location("floating-electric-pole", 4)
	-- boat
	add_recipe_ingredient("boat", "coconut-sealant", 30)
	remove_recipe_ingredient("boat", "electronic-circuit")
	-- cargo ship
	add_recipe_ingredient("cargo_ship", "coconut-sealant", 80)
	remove_recipe_ingredient("cargo_ship", "electronic-circuit")
	-- tanker
	add_recipe_ingredient("oil_tanker", "coconut-sealant", 80)
	add_recipe_ingredient("oil_tanker", "titanium-plate", 20)
	remove_recipe_ingredient("oil_tanker", "electronic-circuit")
	-- buoys
	add_recipe_ingredient("buoy", "coconut-sealant", 2)
	add_recipe_ingredient("chain_buoy", "coconut-sealant", 2)
end

-- optional compat with ironclad and it's fork
if mods["ironclad-gunboat-and-mortar-turret-fork"] then
	add_recipe_ingredient("ironclad-gunboat", "coconut-sealant", 40)
end
if mods["aai-vehicles-ironclad"] then
	add_recipe_ingredient("ironclad", "coconut-sealant", 40)
end
if mods["decomposer"] then
	data.raw["recipe"]["decomposition-bacteria"].ingredients = {
		{ type = "item", name = "raw-fish", amount = 2 },
		{ type = "fluid", name = "coconut-oil", amount = 30 },
		{ type = "fluid", name = "methane", amount = 100 },
	}
end

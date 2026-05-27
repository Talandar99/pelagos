local function add_diesel_dragon_recipe(planet, material, recipe_type)
	if data.raw.planet[planet] and data.raw.item[material] then
		local groups = { bio = 1, hot = 2, cold = 3 }
		local group = groups[recipe_type]
		data.raw.planet[planet].surface_properties["diesel-dragon"] = group

		local recipe = data.raw.recipe["diesel-dragon-rocket-part-" .. recipe_type]
		local found = false

		for _, ingredient in pairs(recipe.ingredients) do
			if ingredient.name == material then
				ingredient.amount = ingredient.amount + 1
				found = true
				break
			end
		end

		if not found then
			table.insert(recipe.ingredients, { type = "item", name = material, amount = 1 })
		end

		recipe.results[1].amount = recipe.results[1].amount + 1
		recipe.localised_name = {
			"recipe-name.diesel-dragon-rocket-part-" .. recipe_type,
			tostring(recipe.results[1].amount),
		}
	end
end

add_diesel_dragon_recipe("nauvis", "wood", "bio")
add_diesel_dragon_recipe("gleba", "carbon-fiber", "bio")
add_diesel_dragon_recipe("fulgora", "holmium-plate", "cold")
add_diesel_dragon_recipe("aquilo", "lithium-plate", "cold")
add_diesel_dragon_recipe("vulcanus", "tungsten-carbide", "hot")

add_diesel_dragon_recipe("pelagos", "titanium-plate", "bio")
add_diesel_dragon_recipe("lignumis", "lumber", "bio")
add_diesel_dragon_recipe("foliax", "foliax-arcane-cube", "bio")

add_diesel_dragon_recipe("cerys", "holmium-plate", "cold")
add_diesel_dragon_recipe("frozeta", "gold-plate", "cold")
add_diesel_dragon_recipe("arig", "planetaris-silica", "hot")
--add_diesel_dragon_recipe("arig", "gold-plate", "hot")
--add_diesel_dragon_recipe("moshine", "neodymium", "hot")
--add_diesel_dragon_recipe("moshine", "neodymium", "hot")

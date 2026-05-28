data:extend({
	{
		type = "item-subgroup",
		name = "decomposition-products",
		group = "intermediate-products",
		order = "mb",
	},
})
data:extend({
	{
		type = "recipe",
		name = "fermented-fish",
		additional_categories = { "organic" },
		category = "decomposition",
		subgroup = "decomposition-products",
		order = "a[seeds]-c[wood-spoiling]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients = {
			{ type = "item", name = "coconut-meat", amount = 5 },
			{ type = "item", name = "raw-fish", amount = 10 },
			{ type = "item", name = "fermentation-bacteria", amount = 5 },
		},
		results = {
			--{ type = "item", name = "fermented-fish", amount = 5 },
			{ type = "item", name = "fermented-fish", amount = 10 },
		},
		crafting_machine_tint = {
			primary = { r = 0.6, g = 0.77, b = 0.82, a = 1.000 },
			secondary = { r = 0.78, g = 0.82, b = 0.35, a = 1.000 },
			tertiary = { r = 0.6, g = 0.77, b = 0.82, a = 1.000 },
			quaternary = { r = 0.78, g = 0.82, b = 0.35, a = 1.000 },
		},
	},
	{
		type = "recipe",
		name = "nutrients-from-spoilage-methane",
		icons = {
			{ icon = "__pelagos__/graphics/methane.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/nutrients-from-spoilage.png", icon_size = 64 },
		},
		category = "decomposition",
		subgroup = "decomposition-products",
		order = "c[nutrients]-c[nutrients-from-spoilage-methane]",
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients = {
			{ type = "item", name = "spoilage", amount = 10 },
			{ type = "fluid", name = "methane", amount = 5 },
		},
		results = { { type = "item", name = "nutrients", amount = 2, percent_spoiled = 0.6 } },
		crafting_machine_tint = {
			primary = { r = 0.8, g = 0.9, b = 1, a = 1.000 },
			secondary = { r = 0.5, g = 0.5, b = 0.8, a = 1.000 },
		},
	},
	{
		type = "recipe",
		name = "nutrients-spoiling",
		icons = {
			{ icon = "__pelagos__/graphics/nutrients-spoiling.png", icon_size = 64 },
		},
		category = "decomposition",
		subgroup = "decomposition-products",
		order = "c[nutrients]-a[zspoilage]",
		enabled = false,
		allow_productivity = false,
		energy_required = 0.1,
		ingredients = {
			{ type = "item", name = "nutrients", amount = 10 },
		},
		results = { { type = "item", name = "spoilage", amount = 20 } },
		crafting_machine_tint = {
			primary = { r = 0.0, g = 0.1, b = 0, a = 1.000 },
			secondary = { r = 0.0, g = 0.1, b = 0.0, a = 1.000 },
		},
	},
	{
		type = "recipe",
		name = "pelagos-science-pack",
		category = "decomposition",
		subgroup = "science-pack",
		surface_conditions = {
			{
				property = "pressure",
				min = 1809,
				max = 1809,
			},
		},
		enabled = false,
		ingredients = {
			{ type = "item", name = "coconut-sealant", amount = 2 },
			{ type = "item", name = "engine-unit", amount = 1 },
			{ type = "item", name = "fermentation-bacteria", amount = 3 },
			{ type = "item", name = "activated-carbon", amount = 1 },
			{ type = "item", name = "titanium-dust", amount = 1 },
		},
		energy_required = 8,
		results = { { type = "item", name = "pelagos-science-pack", amount = 2 } },
		allow_productivity = true,
		crafting_machine_tint = {
			primary = { r = 0.39, g = 0.48, b = 0.26, a = 1.000 },
			secondary = { r = 0.49, g = 0.58, b = 0.36, a = 1.000 },
			tertiary = { r = 0.39, g = 0.48, b = 0.26, a = 1.000 },
			quaternary = { r = 0.49, g = 0.58, b = 0.36, a = 1.000 },
		},
	},
	{
		type = "recipe",
		name = "stone-erosion",
		category = "decomposition",
		icons = {
			{ icon = "__base__/graphics/icons/stone.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/fluid/water.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		enabled = false,
		auto_recycle = false,
		energy_required = 5.0,
		ingredients = {
			{ type = "fluid", name = "water", amount = 10 },
			{ type = "item", name = "stone", amount = 5 },
		},
		main_product = "sand",
		results = {
			{ type = "item", name = "sand", amount = 10 },
			{ type = "fluid", name = "water", amount = 2, ignored_by_stats = 2, ignored_by_productivity = 2 },
		},
		allow_productivity = true,
	},
})

local function make_decomposition_recipe(technology_name, item_name, spoilage_amount)
	local dark_green_tint = { r = 0.55, g = 0.7, b = 0.55, a = 1.0 }

	local source_item = data.raw.item[item_name] or data.raw.capsule[item_name]

	if not source_item or not source_item.icon then
		log("Error: Item/Capsule " .. item_name .. " not found or lacks a single icon property.")
		return
	end

	local recipe_name = item_name .. "-spoiling"

	data:extend({
		{
			type = "recipe",
			name = recipe_name,
			icons = {
				{
					icon = source_item.icon,
					icon_size = source_item.icon_size or 64,
					icon_mipmaps = source_item.icon_mipmaps,
					tint = dark_green_tint,
				},
			},
			category = "decomposition",
			subgroup = "decomposition-products",
			order = "a[seeds]-c[" .. recipe_name .. "]",
			auto_recycle = false,
			enabled = false,
			allow_productivity = true,
			energy_required = 6,
			ingredients = {
				-- Zmienione na sztywno na "item", bo gra tego wymaga w tym miejscu
				{ type = "item", name = item_name, amount = 5 },
			},
			results = {
				{ type = "item", name = "spoilage", amount = spoilage_amount },
			},
			crafting_machine_tint = {
				primary = { r = 0.27, g = 0.27, b = 0.08, a = 1.000 },
				secondary = { r = 0.37, g = 0.37, b = 0.18, a = 1.000 },
				tertiary = { r = 0.27, g = 0.27, b = 0.08, a = 1.000 },
				quaternary = { r = 0.37, g = 0.37, b = 0.18, a = 1.000 },
			},
		},
	})

	if technology_name then
		local target_tech = data.raw.technology[technology_name]
		if target_tech then
			target_tech.effects = target_tech.effects or {}
			table.insert(target_tech.effects, {
				type = "unlock-recipe",
				recipe = recipe_name,
			})
		end
	end
end

make_decomposition_recipe("decomposer", "wood", 40)
make_decomposition_recipe("decomposer", "coconut-husk", 20)
make_decomposition_recipe("decomposer", "coconut-seed", 50)
make_decomposition_recipe("wood-spoiling-technology", "yumako-seed", 50)
make_decomposition_recipe("wood-spoiling-technology", "tree-seed", 50)
make_decomposition_recipe("wood-spoiling-technology", "coconut", 80)
make_decomposition_recipe("wood-spoiling-technology", "jellynut", 100)
make_decomposition_recipe("wood-spoiling-technology", "yumako", 40)
make_decomposition_recipe("wood-spoiling-technology", "bioflux", 120)
make_decomposition_recipe("wood-spoiling-technology", "fermented-fish", 60)

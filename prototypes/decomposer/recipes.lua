data:extend({
	{
		type = "recipe",
		name = "fermented-fish",
		category = "decomposition",
		additional_categories = { "organic" },
		subgroup = "agriculture-products",
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
})

local function make_decomposition_recipe(technology_name, item_name, spoilage_amount)
	--local dark_green_tint = { r = 0.15, g = 0.4, b = 0.15, a = 1.0 }
	local dark_green_tint = { r = 0.35, g = 0.6, b = 0.35, a = 1.0 }
	local source_item = data.raw.item[item_name]

	if not source_item or not source_item.icon then
		log("Error: Item " .. item_name .. " not found or lacks a single icon property.")
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
			subgroup = "agriculture-products",
			order = "a[seeds]-c[" .. recipe_name .. "]",
			auto_recycle = false,
			enabled = false,
			allow_productivity = true,
			energy_required = 6,
			ingredients = {
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

make_decomposition_recipe("wood-spoiling-technology", "wood", 40)
make_decomposition_recipe("wood-spoiling-technology", "coconut-husk", 20)
make_decomposition_recipe("wood-spoiling-technology", "coconut-seed", 10)
make_decomposition_recipe("wood-spoiling-technology", "yumako-seed", 10)
make_decomposition_recipe("wood-spoiling-technology", "tree-seed", 10)
make_decomposition_recipe("wood-spoiling-technology", "coconut", 80)
make_decomposition_recipe("wood-spoiling-technology", "jellynut", 100)
make_decomposition_recipe("wood-spoiling-technology", "yumako", 40)

--calcining
data:extend({
	{
		type = "recipe-category",
		name = "calcining",
	},
})
data:extend({
	{
		type = "recipe",
		category = "calcining",
		name = "calciner-coal-purification",
		icon = "__pelagos__/graphics/coal-purification.png",
		enabled = false,
		allow_productivity = true,
		energy_required = 5,
		ingredients = {
			{ type = "item", name = "coal", amount = 2 },
		},
		results = { { type = "item", name = "carbon", amount = 1 } },
		auto_recycle = false,
	},
	{
		type = "recipe",
		category = "calcining",
		name = "calciner-wood-carbonization",
		icon = "__pelagos__/graphics/wood-carbonization.png",
		enabled = false,
		energy_required = 6,
		allow_productivity = true,
		ingredients = {
			{ type = "item", name = "wood", amount = 2 },
		},
		results = { { type = "item", name = "coal", amount = 1 } },
		auto_recycle = false,
	},
	{
		type = "recipe",
		category = "calcining",
		name = "calciner-coconut-husk-carbonization",
		icon = "__pelagos__/graphics/coconut-husk-carbonization.png",
		enabled = false,
		energy_required = 6,
		allow_productivity = true,
		ingredients = {
			{ type = "item", name = "coconut-husk", amount = 4 },
		},
		results = { { type = "item", name = "coal", amount = 1 } },
		auto_recycle = false,
	},
	{
		type = "recipe",
		category = "calcining",
		name = "calciner-fish-calcining",
		icon = "__pelagos__/graphics/fish-calcining.png",
		enabled = false,
		allow_productivity = true,
		energy_required = 4,
		ingredients = {
			{ type = "item", name = "raw-fish", amount = 1 },
		},
		results = { { type = "item", name = "calcite", amount = 3 } },
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "activated-carbon",
		category = "calcining",
		enabled = false,
		energy_required = 8,
		allow_productivity = true,
		ingredients = {
			{ type = "item", name = "carbon", amount = 2 },
		},
		results = { { type = "item", name = "activated-carbon", amount = 1 } },
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "calciner-advanced-steel-smelting",
		icon = "__pelagos__/graphics/calciner-advanced-steel-smelting.png",
		category = "calcining",
		enabled = false,
		energy_required = 16,
		ingredients = {
			{ type = "item", name = "iron-plate", amount = 5 },
			{ type = "item", name = "activated-carbon", amount = 1 },
		},
		results = { { type = "item", name = "steel-plate", amount = 2 } },
		allow_productivity = true,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "calciner-calcite-brick",
		icons = {
			{ icon = "__base__/graphics/icons/stone-brick.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/calcite.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		category = "calcining",
		enabled = false,
		energy_required = 4,
		ingredients = {
			{ type = "item", name = "calcite", amount = 1 },
			{ type = "item", name = "activated-carbon", amount = 1 },
		},
		results = { { type = "item", name = "stone-brick", amount = 2 } },
		allow_productivity = true,
		auto_recycle = false,
	},

	--	{
	--		type = "recipe",
	--		name = "scrap-burning",
	--		icon = "__pelagos__/graphics/calciner-advanced-steel-smelting.png",
	--		category = "calcining",
	--		enabled = false,
	--		energy_required = 6,
	--		ingredients = {
	--			{ type = "item", name = "scrap", amount = 1 },
	--		},
	--		results = {
	--			{ type = "item", name = "iron-gear-wheel", probability = 0.20 },
	--			{ type = "item", name = "concrete", probability = 0.06 },
	--			{ type = "item", name = "steel-plate", probability = 0.04 },
	--			{ type = "item", name = "stone", probability = 0.04 },
	--			{ type = "item", name = "copper-cable", probability = 0.03 },
	--			{ type = "item", name = "holmium-org", probability = 0.01 },
	--		},
	--		allow_productivity = true,
	--	},
})

-- special glass recipes for compatibility with mods that add glass

if data.raw.item and data.raw.item["glass"] then
	local glass = data.raw.item["glass"]
	data:extend({
		{
			type = "recipe",
			name = "calciner-mineral-glass",
			category = "calcining",
			ingredients = {
				{ type = "item", name = "calcite", amount = 4 },
			},
			results = {
				{ type = "item", name = "glass", amount = 1 },
			},
			icons = {
				{ icon = glass.icon, icon_size = 64 },
				{ icon = "__space-age__/graphics/icons/calcite.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
			},
			icon_size = glass.icon_size,
			allow_productivity = true,
			auto_recycle = false,
		},
	})
end

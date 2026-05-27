---------------------------------------------------------------------------------
---- diesel dragon recipes
---------------------------------------------------------------------------------
data:extend({
	{
		type = "recipe-category",
		name = "diesel-rocket-building",
	},
})
data:extend({
	{
		type = "recipe-category",
		name = "diesel-rocket-parts",
	},
})
data:extend({
	{
		type = "item",
		name = "diesel-dragon-rocket-part",
		icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png",
		icon_size = 64,
		subgroup = "space-related",
		order = "a[rocket-part]-a",
		stack_size = 10,
		weight = 10000 * kg,
	},
})
data:extend({
	{
		type = "recipe",
		name = "diesel-dragon-loading",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
		},
		energy_required = 3,
		enabled = true,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "diesel-rocket-building",
		order = "b[rocket-part]a",
		ingredients = {
			{ type = "item", name = "diesel-dragon-rocket-part", amount = 1 },
		},
		results = { { type = "item", name = "rocket-part", amount = 1 } },
		main_product = "rocket-part",
		allow_productivity = true,
	},

	{
		type = "recipe",
		name = "diesel-dragon-rocket-part-pelagos",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{ icon = "__pelagos__/graphics/planet/pelagos64.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		energy_required = 3,
		enabled = false,
		category = "diesel-rocket-parts",
		order = "b[rocket-part]a",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		results = { { type = "item", name = "diesel-dragon-rocket-part", amount = 1 } },
		surface_conditions = {
			{
				property = "pressure",
				min = 1809,
				max = 1809,
			},
		},
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "diesel-dragon-rocket-part-default",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{
				icon = "__base__/graphics/icons/low-density-structure.png",
				icon_size = 64,
				scale = 0.25,
				shift = { 8, 8 },
			},
		},
		energy_required = 3,
		enabled = false,
		category = "diesel-rocket-parts",
		order = "b[rocket-part]a",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "low-density-structure", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		results = { { type = "item", name = "diesel-dragon-rocket-part", amount = 2 } },
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "diesel-dragon-rocket-part-bio",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{
				icon = "__base__/graphics/icons/signal/signal-science-pack.png",
				icon_size = 64,
				scale = 0.25,
				shift = { 8, 8 },
			},
		},
		energy_required = 3,
		enabled = false,
		category = "diesel-rocket-parts",
		order = "b[rocket-part]b",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		results = { { type = "item", name = "diesel-dragon-rocket-part", amount = 1 } },
		surface_conditions = {
			{
				property = "diesel-dragon",
				min = 1,
				max = 1,
			},
		},
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "diesel-dragon-rocket-part-hot",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{
				icon = "__base__/graphics/icons/signal/signal-fire.png",
				icon_size = 64,
				scale = 0.25,
				shift = { 8, 8 },
			},
		},
		energy_required = 3,
		enabled = false,
		category = "diesel-rocket-parts",
		order = "b[rocket-part]c",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		results = { { type = "item", name = "diesel-dragon-rocket-part", amount = 1 } },
		surface_conditions = {
			{
				property = "diesel-dragon",
				min = 2,
				max = 2,
			},
		},
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "diesel-dragon-rocket-part-cold",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{
				icon = "__base__/graphics/icons/signal/signal-snowflake.png",
				icon_size = 64,
				scale = 0.25,
				shift = { 8, 8 },
			},
		},
		energy_required = 3,
		enabled = false,
		category = "diesel-rocket-parts",
		order = "b[rocket-part]d",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		results = { { type = "item", name = "diesel-dragon-rocket-part", amount = 1 } },
		surface_conditions = {
			{
				property = "diesel-dragon",
				min = 3,
				max = 3,
			},
		},
		allow_productivity = true,
	},
})

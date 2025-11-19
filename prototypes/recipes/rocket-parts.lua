--pelagos-rocket-part
data:extend({
	{
		type = "recipe",
		name = "pelagos-rocket-part",
		icons = {
			{ icon = "__base__/graphics/icons/rocket-part.png", icon_size = 64 },
			{ icon = "__pelagos__/graphics/pelagos.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		energy_required = 3,
		enabled = false,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "rocket-building",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
			{ type = "fluid", name = "ethanol", amount = 100 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 1809,
				max = 1809,
			},
		},
		results = { { type = "item", name = "rocket-part", amount = 1 } },
		allow_productivity = true,
	},
})
-------------------------------------------------------------------------------
-- diesel dragon recipes
-------------------------------------------------------------------------------
--data:extend({
--	{
--		type = "recipe-category",
--		name = "diesel-rocket-building",
--	},
--})
--data:extend({
--	{
--		type = "recipe",
--		name = "diesel-pelagos-rocket-part",
--		icons = {
--			{ icon = "__base__/graphics/icons/rocket-part.png", icon_size = 64 },
--			{ icon = "__pelagos__/graphics/pelagos.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
--		},
--		energy_required = 3,
--		enabled = false,
--		hide_from_player_crafting = true,
--		auto_recycle = false,
--		category = "diesel-rocket-building",
--		ingredients = {
--			{ type = "item", name = "processing-unit", amount = 1 },
--			{ type = "item", name = "titanium-plate", amount = 1 },
--		},
--		surface_conditions = {
--			{
--				property = "pressure",
--				min = 1809,
--				max = 1809,
--			},
--		},
--		results = { { type = "item", name = "rocket-part", amount = 1 } },
--		allow_productivity = true,
--	},
--})

-------------------------------------------------------------------------------
-- diesel dragon recipes
-------------------------------------------------------------------------------
data:extend({
	{
		type = "recipe-category",
		name = "diesel-rocket-building",
	},
})
data:extend({
	{
		type = "recipe",
		name = "pelagos-diesel-rocket-part",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{ icon = "__pelagos__/graphics/pelagos.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		energy_required = 3,
		enabled = true,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "diesel-rocket-building",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
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
	{
		type = "recipe",
		name = "gleba-diesel-rocket-part",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/gleba.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		energy_required = 3,
		enabled = true,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "diesel-rocket-building",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 2000,
				max = 2000,
			},
		},
		results = { { type = "item", name = "rocket-part", amount = 1 } },
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "vulcanus-diesel-rocket-part",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/vulcanus.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		energy_required = 3,
		enabled = true,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "diesel-rocket-building",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 4000,
				max = 4000,
			},
		},
		results = { { type = "item", name = "rocket-part", amount = 1 } },
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "fulgora-diesel-rocket-part",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/fulgora.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		energy_required = 3,
		enabled = true,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "diesel-rocket-building",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 800,
				max = 800,
			},
			{
				property = "magnetic-field",
				min = 99,
				max = 99,
			},
		},
		results = { { type = "item", name = "rocket-part", amount = 1 } },
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "aquilo-diesel-rocket-part",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/aquilo.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		energy_required = 3,
		enabled = true,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "diesel-rocket-building",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 300,
				max = 300,
			},
		},
		results = { { type = "item", name = "rocket-part", amount = 1 } },
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "nauvis-diesel-rocket-part",
		icons = {
			{ icon = "__pelagos__/graphics/diesel-dragon/rocket-part.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/nauvis.png", icon_size = 64, scale = 0.25, shift = { 8, 8 } },
		},
		energy_required = 3,
		enabled = true,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "diesel-rocket-building",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 1 },
			{ type = "item", name = "titanium-plate", amount = 1 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 1000,
				max = 1000,
			},
		},
		results = { { type = "item", name = "rocket-part", amount = 1 } },
		allow_productivity = true,
	},
})

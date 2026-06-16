local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
	{
		type = "item",
		name = "msppr-pelagos",
		icon = "__pelagos__/graphics/msppr-pelagos.png",
		subgroup = "msppr",
		order = "d[promethium]-r[gleba-pelagos]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "recipe",
		name = "msppr-pelagos",
		subgroup = "science-pack",
		category = "organic",
		surface_conditions = {
			{
				property = "pressure",
				min = 1809,
				max = 1809,
			},
		},
		enabled = false,
		ingredients = {
			{ type = "item", name = "spoilage", amount = 20 },
			{ type = "item", name = "activated-carbon", amount = 10 },
			{ type = "item", name = "coconut-sealant", amount = 2 },
			{ type = "item", name = "titanium-dust", amount = 1 },
			{ type = "item", name = "fermented-fish", amount = 2 },
			{ type = "fluid", name = "ethanol", amount = 10 },
		},
		msppr = {
			result = { type = "item", name = "msppr-pelagos", amount = 1 },
			recipe_chain_order = "gleba-pelagos",
		},
		energy_required = 10,
		results = { { type = "item", name = "msppr-pelagos", amount = 1 } },
		allow_productivity = false,
		auto_recycle = false,
	},
})

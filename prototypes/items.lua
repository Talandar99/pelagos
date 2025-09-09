local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")
local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
-- item coconut
data:extend({
	{
		type = "item",
		name = "coconut",
		icon = "__pelagos__/graphics/coconut.png",
		icon_size = 64,
		subgroup = "agriculture-processes",
		order = "b[agriculture]-a[coconut]",
		stack_size = 50,
		fuel_value = "4MJ",
		spoil_result = "spoilage",
		weight = 1 * kg,
		spoil_ticks = 3 * 60 * minute,
		default_import_location = "pelagos",
		fuel_category = "chemical",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
	},
})
-- item coconut husk
data:extend({
	{
		type = "item",
		name = "coconut-husk",
		icon = "__pelagos__/graphics/coconut-husk.png",
		icon_size = 64,
		subgroup = "agriculture-products",
		order = "a[organic-processing]-b[husk]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		default_import_location = "pelagos",
		fuel_category = "chemical",
		fuel_value = "1MJ",
		stack_size = 40,
		weight = 1 * kg,
	},
})
-- item coconut meat
data:extend({
	{
		type = "capsule",
		name = "coconut-meat",
		icon = "__pelagos__/graphics/coconut-meat.png",
		subgroup = "agriculture-products",
		order = "a[organic-processing]-c[coconut-meat]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		fuel_category = "chemical",
		fuel_value = "1MJ",
		stack_size = 50,
		default_import_location = "pelagos",
		spoil_ticks = 10 * minute,
		spoil_result = "spoilage",
		weight = 0.5 * kg,
		capsule_action = item_effects.yumako_regen,
	},
})
-- item coconut-seed
data:extend({
	{
		type = "item",
		name = "coconut-seed",
		localised_name = { "item-name.coconut-seed" },
		localised_description = { "item-description.coconut-seed" },
		icon = "__pelagos__/graphics/coconut-seed.png",
		subgroup = "agriculture-processes",
		order = "b[agriculture]-a[coconut-seed]",
		plant_result = "coconut-palm",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 10,
		default_import_location = "pelagos",
		weight = 10 * kg,
		fuel_category = "chemical",
		fuel_value = "4MJ",
	},
})
-- item coconut-sealant
data:extend({
	{
		type = "item",
		name = "coconut-sealant",
		icon = "__pelagos__/graphics/sealant.png",
		fuel_category = "chemical",
		fuel_value = "12MJ",
		default_import_location = "pelagos",
		subgroup = "raw-material",
		order = "b[chemistry]-a[solid-fuel]",
		inventory_move_sound = item_sounds.solid_fuel_inventory_move,
		pick_sound = item_sounds.solid_fuel_inventory_pickup,
		drop_sound = item_sounds.solid_fuel_inventory_move,
		stack_size = 50,
		weight = 1 * kg,
		random_tint_color = item_tints.yellowing_coal,
	},
})
--science-pack
data:extend({
	{
		type = "tool",
		name = "pelagos-science-pack",
		icon = "__pelagos__/graphics/pelagos-science-pack.png",
		icon_size = 64,
		subgroup = "science-pack",
		color_hint = { text = "W" },
		order = "i",
		inventory_move_sound = item_sounds.science_inventory_move,
		pick_sound = item_sounds.science_inventory_pickup,
		drop_sound = item_sounds.science_inventory_move,
		stack_size = 200,
		default_import_location = "pelagos",
		weight = 1 * kg,
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount-key",
		factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
		durability_description_value = "description.science-pack-remaining-amount-value",
		spoil_ticks = 1.5 * hour,
		spoil_result = "spoilage",
		random_tint_color = item_tints.bluish_science,
	},
})
table.insert(data.raw["lab"]["lab"].inputs, "pelagos-science-pack")

data:extend({
	{
		type = "item",
		name = "fermentation-bacteria",
		icon = "__pelagos__/graphics/fermentation-bacteria.png",
		subgroup = "agriculture-processes",
		order = "b[agriculture]-d[bacteria]-a[fermentation-bacteria]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 50,
		default_import_location = "pelagos",
		weight = 1 * kg,
		spoil_ticks = 5 * minute,
		spoil_result = "spoilage",
	},
})

data:extend({
	{
		type = "module",
		name = "degradation-module",
		localised_description = { "item-description.degradation-module" },
		icon = "__pelagos__/graphics/degradation-module-1.png",
		subgroup = "module",
		color_hint = { text = "Q" },
		category = "quality",
		tier = 1,
		default_import_location = "pelagos",
		order = "d[degradation]-a[degradation-module]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
		effect = { quality = -0.8, speed = 0.05 },
	},
	{
		type = "module",
		name = "degradation-module-2",
		localised_description = { "item-description.degradation-module" },
		icon = "__pelagos__/graphics/degradation-module-2.png",
		subgroup = "module",
		color_hint = { text = "Q" },
		category = "quality",
		tier = 2,
		default_import_location = "pelagos",
		order = "d[degradation]-b[degradation-module-2]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
		effect = { quality = -1.6, speed = 0.08 },
	},
	{
		type = "module",
		name = "degradation-module-3",
		localised_description = { "item-description.degradation-module" },
		icon = "__pelagos__/graphics/degradation-module-3.png",
		subgroup = "module",
		color_hint = { text = "Q" },
		category = "quality",
		tier = 3,
		default_import_location = "pelagos",
		order = "d[degradation]-c[degradation-module-3]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
		effect = { quality = -2.5, speed = 0.15 },
	},
})

data:extend({
	{
		type = "item",
		name = "activated-carbon",
		icon = "__pelagos__/graphics/activated-carbon.png",
		fuel_value = "1MJ",
		fuel_category = "chemical",
		subgroup = "raw-material",
		order = "b[chemistry]-f[carbon-activated]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 50,
		weight = 1 * kg,
		default_import_location = "pelagos",
	},
})
-- wooden platform
data:extend({
	{
		type = "item",
		name = "wooden-platform",
		icon = "__pelagos__/graphics/wooden-platform-icon.png",
		subgroup = "terrain",
		order = "c[landfill]-a[wooden-platform]",
		inventory_move_sound = item_sounds.landfill_inventory_move,
		pick_sound = item_sounds.landfill_inventory_pickup,
		drop_sound = item_sounds.landfill_inventory_move,
		stack_size = 100,
		default_import_location = "pelagos",
		weight = 10 * kg,
		place_as_tile = {
			result = "wooden-platform",
			condition_size = 1,
			condition = { layers = { ground_tile = true } },
			tile_condition = {
				--"pelagos-deep-sea", -- pelagos
				"water",
				"deepwater",
				"water-green",
				"deepwater-green", -- all water
				"water-mud",
				"water-shallow", -- all shallows
				"oil-ocean-shallow",
				"oil-ocean-deep", -- all oil ocean
				"ammoniacal-ocean",
				"ammoniacal-ocean-2",
				"brash-ice", -- aquilo
				"wetland-light-green-slime",
				"wetland-green-slime",
				"wetland-light-dead-skin",
				"wetland-dead-skin",
				"wetland-pink-tentacle",
				"wetland-red-tentacle",
				"wetland-yumako",
				"wetland-jellynut",
				"wetland-blue-slime",
				"gleba-deep-lake", -- all gleba stuff
			},
		},
		random_tint_color = item_tints.organic_green,
	},
})

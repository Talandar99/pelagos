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
		--stack_size = 50,
		stack_size = 100,
		fuel_value = "4MJ",
		spoil_result = "spoilage",
		weight = 1 * kg,
		spoil_ticks = 3 * hour,
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
		stack_size = 50,
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
		place_result = "coconut-palm",
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

data:extend({
	{
		type = "item",
		name = "titanium-plate",
		icon = "__pelagos__/graphics/titanium/titanium-plate.png",
		--subgroup = "pelagos-processes",
		subgroup = "raw-material",
		order = "b[titanium]-c[titanium-plate]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		default_import_location = "fulgora",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "titanium-dust",
		icon = "__pelagos__/graphics/titanium/titanium-dust.png",
		--subgroup = "pelagos-processes",
		subgroup = "raw-material",
		order = "b[titanium]-c[titanium-dust]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 50,
		default_import_location = "pelagos",
		weight = 5 * kg,
	},
	{
		type = "item",
		name = "titanium-barrel",
		icon = "__pelagos__/graphics/titanium-barreling/empty-barrel.png",
		subgroup = "intermediate-product",
		order = "a[basic-intermediates]-d[empty-titanium-barrel]",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		stack_size = 20,
		default_import_location = "pelagos",
		weight = 1 / 400 * tons,
		random_tint_color = item_tints.iron_rust,
	},
})

data:extend({
	{
		type = "item",
		name = "copper-biter-egg",
		icon = "__pelagos__/graphics/copper-biter-egg.png",
		fuel_category = "chemical",
		fuel_value = "6MJ",
		subgroup = "agriculture-products",
		order = "c[eggs]-a[copper-biter-egg]",
		default_import_location = "pelagos",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 100,
		weight = 2 * kg,
		spoil_ticks = 1.0 * hour,
		spoil_to_trigger_result = {
			items_per_trigger = 25,
			trigger = {
				type = "direct",
				action_delivery = {
					type = "instant",
					source_effects = {
						{
							type = "create-entity",
							entity_name = "big-copper-biter",
							affects_target = true,
							show_in_tooltip = true,
							as_enemy = true,
							find_non_colliding_position = true,
							abort_if_over_space = true,
							offset_deviation = { { -1, -1 }, { 1, 1 } },
							non_colliding_fail_result = {
								type = "direct",
								action_delivery = {
									type = "instant",
									source_effects = {
										{
											type = "create-entity",
											entity_name = "big-copper-biter",
											affects_target = true,
											show_in_tooltip = false,
											as_enemy = true,
											offset_deviation = { { -1, -1 }, { 1, 1 } },
										},
									},
								},
							},
						},
					},
				},
			},
		},
	},
})

data:extend({
	{
		type = "item",
		name = "fermented-fish",
		icon = "__pelagos__/graphics/fermented-fish.png",
		subgroup = "agriculture-products",
		order = "a[organic-processing]-b[bioflux]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		fuel_category = "food",
		fuel_value = "3MJ",
		stack_size = 20,
		default_import_location = "pelagos",
		spoil_ticks = 2 * hour,
		spoil_result = "spoilage",
		weight = 5 * kg,
		--capsule_action = item_effects.bioflux_speed_and_regen,
	},
})

data:extend({
	{
		type = "ammo",
		name = "corrosive-firearm-magazine",
		icon = "__pelagos__/graphics/poisonus-firearm-magazine.png",
		ammo_category = "bullet",
		ammo_type = {
			action = {
				{
					type = "direct",
					action_delivery = {
						{
							type = "instant",
							source_effects = {
								{
									type = "create-explosion",
									entity_name = "explosion-gunshot",
									only_when_visible = true,
								},
							},
							target_effects = {
								{
									type = "create-entity",
									entity_name = "explosion-hit",
									offsets = { { 0, 1 } },
									offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
									only_when_visible = true,
								},
								{
									type = "damage",
									damage = { amount = 8, type = "corrosive" },
								},
								{
									type = "activate-impact",
									deliver_category = "bullet",
								},
							},
						},
					},
				},
			},
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "a[basic-clips]-b[decomposition-firearm-magazine]",
		inventory_move_sound = item_sounds.ammo_small_inventory_move,
		pick_sound = item_sounds.ammo_small_inventory_pickup,
		drop_sound = item_sounds.ammo_small_inventory_move,
		stack_size = 100,
		weight = 20 * kg,
		default_import_location = "pelagos",
	},
	{
		type = "ammo",
		name = "pelagos-capture-robot-rocket",
		icon = "__pelagos__/graphics/capture-bot.png",
		ammo_category = "bullet",
		ammo_type = {
			action = {
				type = "direct",
				action_delivery = {
					type = "projectile",
					projectile = "capture-robot-rocket",
					starting_speed = 0.1,
				},
			},
			target_filter = { "copper-biter-spawner" },
		},
		subgroup = "ammo",
		order = "d[rocket-launcher]-d[capture-pelagos]",
		inventory_move_sound = item_sounds.robotic_inventory_move,
		pick_sound = item_sounds.robotic_inventory_pickup,
		drop_sound = item_sounds.robotic_inventory_move,
		stack_size = 10,
		weight = 100 * kg,
		shoot_protected = true,
		default_import_location = "pelagos",
	},
})

data:extend({
	{
		type = "item",
		name = "captive-copper-biter-spawner",
		icon = "__pelagos__/graphics/captive-biter-spawner.png",
		subgroup = "agriculture",
		order = "z[biter-nest]",
		inventory_move_sound = item_sounds.mechanical_inventory_move,
		pick_sound = item_sounds.mechanical_inventory_pickup,
		drop_sound = item_sounds.mechanical_inventory_move,
		place_result = "captive-copper-biter-spawner",
		stack_size = 1,
		--spoil_ticks = 30 * minute,
		spoil_ticks = 30 * minute,
		spoil_to_trigger_result = {
			items_per_trigger = 1,
			trigger = {
				type = "direct",
				action_delivery = {
					type = "instant",
					source_effects = {
						{
							type = "create-entity",
							entity_name = "leviathan-copper-biter",
							affects_target = true,
							show_in_tooltip = true,
							as_enemy = true,
							find_non_colliding_position = true,
							offset_deviation = { { -1, -1 }, { 1, 1 } },
							non_colliding_fail_result = {
								type = "direct",
								action_delivery = {
									type = "instant",
									source_effects = {
										{
											type = "create-entity",
											entity_name = "leviathan-copper-biter",
											affects_target = true,
											show_in_tooltip = false,
											as_enemy = true,
											offset_deviation = { { -1, -1 }, { 1, 1 } },
										},
									},
								},
							},
						},
					},
				},
			},
		},
	},
})

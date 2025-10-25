local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
	{
		type = "ammo",
		name = "slowdown-rocket",
		icon = "__pelagos__/graphics/slowdown-rocket.png",
		pictures = {
			layers = {
				{
					size = 64,
					filename = "__pelagos__/graphics/slowdown-rocket.png",
					scale = 0.5,
					mipmap_count = 4,
				},
			},
		},
		ammo_category = "rocket",
		ammo_type = {
			range_modifier = 1.5,
			cooldown_modifier = 10,
			target_type = "position",
			action = {
				type = "direct",
				action_delivery = {
					type = "projectile",
					projectile = "slowdown-capsule",
					acceleration = 0.01,
					starting_speed = 0.3,
					source_effects = {
						type = "create-entity",
						entity_name = "explosion-hit",
					},
				},
			},
		},
		subgroup = "ammo",
		order = "d[rocket-launcher]-d[slowdown-rocket]",
		inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
		pick_sound = item_sounds.atomic_bomb_inventory_pickup,
		drop_sound = item_sounds.atomic_bomb_inventory_move,
		stack_size = 100,
		weight = 10 * kg,
	},
})

data:extend({
	{
		type = "ammo",
		name = "poison-rocket",
		icon = "__pelagos__/graphics/poison-rocket.png",
		pictures = {
			layers = {
				{
					size = 64,
					filename = "__pelagos__/graphics/poison-rocket.png",
					scale = 0.5,
					mipmap_count = 4,
				},
			},
		},
		ammo_category = "rocket",
		ammo_type = {
			range_modifier = 1.5,
			cooldown_modifier = 5,
			target_type = "position",
			action = {
				type = "direct",
				action_delivery = {
					type = "projectile",
					projectile = "poison-capsule",
					acceleration = 0.01,
					starting_speed = 0.3,
					source_effects = {
						type = "create-entity",
						entity_name = "explosion-hit",
					},
				},
			},
		},
		subgroup = "ammo",
		order = "d[rocket-launcher]-d[poison-rocket]",
		inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
		pick_sound = item_sounds.atomic_bomb_inventory_pickup,
		drop_sound = item_sounds.atomic_bomb_inventory_move,
		stack_size = 100,
		weight = 10 * kg,
	},
})

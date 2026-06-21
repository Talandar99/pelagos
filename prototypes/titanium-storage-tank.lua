data:extend({
	{
		type = "item",
		name = "titanium-storage-tank",
		icon = "__pelagos__/graphics/titanium-storage-tank/icon.png",
		icon_size = 64,
		subgroup = "storage",
		order = "a[titanium-storage-tank]",
		place_result = "titanium-storage-tank", -- To łączy przedmiot z Twoim entity
		stack_size = 50,
	},
	{
		type = "storage-tank",
		name = "titanium-storage-tank",
		icon = "__pelagos__/graphics/titanium-storage-tank/icon.png",
		icon_size = 64,
		flags = { "placeable-player", "player-creation" },
		minable = { mining_time = 0.5, result = "titanium-storage-tank" },
		max_health = 1000,
		corpse = "storage-tank-remnants",
		dying_explosion = "storage-tank-explosion",
		impact_category = "metal-large",

		-- BAZOWA ORIENTACJA: PIONOWA (NORTH)
		-- Wymiary 3x4: szerokość 3 (od -1.5 do 1.5), wysokość 4 (od -2.0 do 2.0)
		collision_box = { { -1.3, -1.8 }, { 1.3, 1.8 } },
		selection_box = { { -1.5, -2.0 }, { 1.5, 2.0 } },

		window_bounding_box = { { -0.01, -0.01 }, { 0.01, 0.01 } },
		flow_length_in_ticks = 360,

		fluid_box = {
			volume = 100000,
			pipe_covers = pipecoverspictures(),
			-- Rury zaktualizowane dla wysokości 4 kratek
			pipe_connections = {
				{ direction = defines.direction.north, position = { 0, -1.5 } },
				{ direction = defines.direction.south, position = { 0, 1.5 } },
			},
			hide_connection_info = true,
		},

		two_direction_only = false,

		open_sound = sounds.metal_large_open,
		close_sound = sounds.metal_large_close,
		working_sound = {
			sound = { filename = "__base__/sound/storage-tank.ogg", volume = 0.6 },
			match_volume_to_activity = true,
		},

		pictures = {
			picture = {
				north = {
					filename = "__pelagos__/graphics/titanium-storage-tank/tank_512_v.png",
					width = 512,
					height = 512,
					shift = util.by_pixel(0, 0),
					-- Skala pozostała z poprzedniej wersji.
					-- Jeśli zbiornik jest teraz wizualnie "za długi" na 4 kratki, zmniejsz np. na 0.35 lub 0.4
					scale = 0.45,
				},
				east = {
					filename = "__pelagos__/graphics/titanium-storage-tank/tank_512_h.png",
					width = 512,
					height = 512,
					shift = util.by_pixel(0, 0),
					scale = 0.45,
				},
				south = {
					filename = "__pelagos__/graphics/titanium-storage-tank/tank_512_v.png",
					width = 512,
					height = 512,
					shift = util.by_pixel(0, 0),
					scale = 0.45,
				},
				west = {
					filename = "__pelagos__/graphics/titanium-storage-tank/tank_512_h.png",
					width = 512,
					height = 512,
					shift = util.by_pixel(0, 0),
					scale = 0.45,
				},
			},
		},
	},
})

-- wide one has 400

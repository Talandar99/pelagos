local pirate_ship = data.raw["car"]["pirateship"]
pirate_ship.inventory_size = 50
--pirate_ship.friction = 0.002
--pirate_ship.friction = 0.03
pirate_ship.friction = 0.01
pirate_ship.terrain_friction_modifier = 0.2

pirate_ship.animation = {
	layers = {
		{
			priority = "low",
			direction_count = 128,
			width = 1002,
			height = 1002,
			stripes = {
				{
					filename = "__pelagos__/graphics/pirateship/newRend_0.png",
					width_in_frames = 8,
					height_in_frames = 8,
				},
				{
					filename = "__pelagos__/graphics/pirateship/newRend_1.png",
					width_in_frames = 8,
					height_in_frames = 8,
				},
			},

			shift = util.by_pixel(0, 0),
			scale = 1,
			max_advance = 0.2,
		},
	},
}
--pirate_ship.water_reflection = {
--	pictures = {
--		{
--			priority = "low",
--			direction_count = 128,
--			width = 1002,
--			height = 1002,
--			stripes = {
--				{
--					filename = "__pelagos__/graphics/pirateship/newRend_0_waterreflection.png",
--					width_in_frames = 8,
--					height_in_frames = 8,
--				},
--				{
--					filename = "__pelagos__/graphics/pirateship/newRend_1_waterreflection.png",
--					width_in_frames = 8,
--					height_in_frames = 8,
--				},
--			},
--
--			shift = util.by_pixel(0, 0),
--			scale = 1,
--			max_advance = 0.2,
--		},
--	},
--}

--pirate_ship.water_reflection = {
--	{
--		pictures = {
--			filename = "__pelagos__/graphics/pirateship/newRend_1_waterreflection.png",
--			width = 1002,
--			height = 1002,
--			shift = util.by_pixel(0, 0),
--			scale = 1,
--			max_advance = 0.2,
--			priority = "extra-high",
--			width_in_frames = 8,
--			height_in_frames = 8,
--		},
--	},
--}

-- Pelagos terrain parameters
-- noise scale (the smaller, the bigger the islands)
local pelagos_elevation_scale = 0.004
-- how many noise layers
local pelagos_elevation_octaves = 2
-- how detailed the shores
local pelagos_elevation_persistence = 0.8
-- overall offset (negative = more water)
-- -----------------------
-- -- tweak this later
-- -----------------------
local pelagos_elevation_bias = -14
--local pelagos_elevation_bias = 15
-- amplitude (higher = deeper oceans / higher lands)
local pelagos_elevation_amplitude = 7.0 --
-- -----------------------
-- map seed (change to get different layouts)
local pelagos_seed = 12345
-- radius of the starting island (in tiles)
local pelagos_starting_radius = 80

-- additional micro-noise for fine jagged edges
local pelagos_micro_wrinkle_scale = 1.0 --0.35 -- scale (the larger, the finer the jaggedness)
local pelagos_micro_wrinkle_octaves = 8 -- number of layers
local pelagos_micro_wrinkle_persistence = 0.55 -- sharpness of distortions
local pelagos_micro_wrinkle_amplitude = 5 --1.5 -- how strongly it affects the shape
local pelagos_micro_wrinkle_seed = pelagos_seed + 1337

data:extend({

	{
		type = "noise-expression",
		name = "pelagos_central_elevation_boost",
		expression = "clamp((40 - distance) / 40, 0, 1) * 100",
	},
})
data:extend({
	{
		type = "noise-expression",
		name = "pelagos_starting_island",
		expression = string.format(
			[[
        max(0, (1 - distance / %d))
        * (
            multioctave_noise{
              x = x, y = y,
              seed0 = map_seed, seed1 = 9999,
              octaves = 5, persistence = 0.6,
              input_scale = 0.02, output_scale = 1
            }

            + %f * abs(multioctave_noise{
                x = x, y = y,
                seed0 = map_seed, seed1 = %d,
                octaves = %d, persistence = %f,
                input_scale = %f, output_scale = 1
            })
        )
      ]],
			pelagos_starting_radius,
			pelagos_micro_wrinkle_amplitude,
			pelagos_micro_wrinkle_seed,
			pelagos_micro_wrinkle_octaves,
			pelagos_micro_wrinkle_persistence,
			pelagos_micro_wrinkle_scale
		),
	},
})

data:extend({
	{
		type = "noise-expression",
		name = "pelagos_elevation",
		expression = string.format(
			[[
      %f
      + %f * multioctave_noise{
          x = x, y = y,
          seed0 = map_seed, seed1 = %d,
          octaves = %d, persistence = %f,
          input_scale = %f, output_scale = 1
        }
      + pelagos_starting_island * (%f*2)
      + pelagos_central_elevation_boost
      + %f * abs(multioctave_noise{
          x = x, y = y,
          seed0 = map_seed, seed1 = %d,
          octaves = %d, persistence = %f,
          input_scale = %f, output_scale = 1
        })
      ]],
			pelagos_elevation_bias,
			pelagos_elevation_amplitude,
			pelagos_seed,
			pelagos_elevation_octaves,
			pelagos_elevation_persistence,
			pelagos_elevation_scale,
			pelagos_elevation_amplitude,
			pelagos_micro_wrinkle_amplitude,
			pelagos_micro_wrinkle_seed,
			pelagos_micro_wrinkle_octaves,
			pelagos_micro_wrinkle_persistence,
			pelagos_micro_wrinkle_scale
		),
	},
})

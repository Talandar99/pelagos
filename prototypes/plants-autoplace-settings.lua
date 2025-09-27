local palm = data.raw.plant["coconut-palm"]
if palm then
	palm.autoplace = {
		probability_expression = 0.003,
		richness_expression = 1,
		peaks = {
			{ influence = 0.2, tile_restriction = { "sand-1", "sand-2" } },
		},
		tile_restriction = { "sand-1", "sand-2" },
		surface_conditions = {
			{ property = "pressure", min = 1500, max = 1500 },
		},
	}
end

local palm = data.raw.plant["coconut-palm-mature"]
if palm then
	palm.autoplace = {
		probability_expression = 0.001,
		richness_expression = 1,
		peaks = {
			{
				influence = 0.2,
				tile_restriction = { "sand-1", "sand-2", "red-desert-1", "red-desert-2" },
			},
		},
		tile_restriction = { "sand-1", "sand-2", "red-desert-1", "red-desert-2" },
		surface_conditions = {
			{ property = "pressure", min = 1500, max = 1500 },
		},
	}
end

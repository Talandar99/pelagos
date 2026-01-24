local palm = data.raw.plant["coconut-palm"]
if palm then
	palm.autoplace = {
		--probability_expression = 0.003,
		probability_expression = 0.005,
		richness_expression = 1,
		peaks = {
			{
				influence = 0.2,
				tile_restriction = { "sand-1", "sand-2", "pelagos-sand-1", "pelagos-sand-2", "pelagos-sandfill" },
			},
		},
		tile_restriction = { "sand-1", "sand-2", "pelagos-sand-1", "pelagos-sand-2", "pelagos-sandfill" },
		surface_conditions = {
			{ property = "pressure", min = 1809, max = 1809 },
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
			{ property = "pressure", min = 1809, max = 1809 },
		},
	}
end

function rocketsilopipes()
	return {
		north = {

			filename = "__pelagos__/graphics/rocketsilopipes/rocketsilopipe-NN.png",
			priority = "extra-high",
			width = 71,
			--height = 38,
			height = 76,
			--shift = util.by_pixel(2.25, 13.5),
			shift = util.by_pixel(2.25, 23),
			scale = 0.5,
		},
		east = {
			filename = "__pelagos__/graphics/rocketsilopipes/rocketsilopipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__pelagos__/graphics/rocketsilopipes/rocketsilopipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__pelagos__/graphics/rocketsilopipes/rocketsilopipe-W.png",
			priority = "extra-high",
			width = 39,
			height = 73,
			shift = util.by_pixel(25.75, 1.25),
			scale = 0.5,
		},
	}
end
data:extend({
	{
		type = "recipe",
		name = "pelagos-rocket-part",
		energy_required = 3,
		enabled = false,
		hide_from_player_crafting = true,
		auto_recycle = false,
		category = "rocket-building",
		ingredients = {
			{ type = "item", name = "processing-unit", amount = 10 },
			{ type = "item", name = "low-density-structure", amount = 10 },
			{ type = "fluid", name = "ethanol", amount = 100 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 1500,
				max = 1500,
			},
		},
		results = { { type = "item", name = "rocket-part", amount = 1 } },
		allow_productivity = true,
	},
})

local pelagos_silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])
pelagos_silo.name = "pelagos-rocket-silo"
pelagos_silo.minable.result = "rocket-silo"
pelagos_silo.fluid_boxes = {
	{
		production_type = "input",
		pipe_picture = rocketsilopipes(),
		pipe_covers = pipecoverspictures(),
		volume = 100,
		pipe_connections = {
			{ flow_direction = "input-output", direction = defines.direction.north, position = { 0, -4 } },
			{ flow_direction = "input-output", direction = defines.direction.south, position = { 0, 4 } },
			{ flow_direction = "input-output", direction = defines.direction.east, position = { 4, 0 } },
			{ flow_direction = "input-output", direction = defines.direction.west, position = { -4, 0 } },
		},
	},
}
pelagos_silo.fixed_recipe = "pelagos-rocket-part"

data:extend({ pelagos_silo })

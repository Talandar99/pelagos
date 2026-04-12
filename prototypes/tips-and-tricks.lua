-- work in progress
data:extend({
	{
		type = "tips-and-tricks-item-category",
		name = "space-age",
		order = "k-[space-age]",
	},
	{
		type = "tips-and-tricks-item",
		name = "pelagos-briefing-main",
		tag = "[planet=pelagos]",
		category = "space-age",
		order = "pelagos-a",
		indent = 0,
		trigger = {
			type = "research",
			technology = "planet-discovery-pelagos",
		},
		skip_trigger = {
			type = "change-surface",
			surface = "pelagos",
		},
		simulation = {
			init_update_count = 10,
			generate_map = false,
			checkboard = false,
			mute_wind_sounds = true,
			init = [[
                local surface = game.surfaces[1]

                game.simulation.camera_position = {0,0}
                game.simulation.camera_zoom = 1.0

                for x=-100,100 do
                    for y=-100,100 do
                        surface.set_tiles({{position={x,y}, name="water"}})
                    end
                end
                local centerX = -20
                local centerY = 0
                local radius = 24
                
                for x = centerX - radius - 3, centerX + radius + 3 do
                    for y = centerY - radius - 3, centerY + radius + 3 do
                        local dx = x - centerX
                        local dy = y - centerY
                        local dist = math.sqrt(dx*dx + dy*dy)
                        local noise = math.sin(x * 0.4) * math.cos(y * 0.3) * 3
                        if dist < radius + noise then
                            surface.set_tiles({{position={x,y}, name="sand-1"}})
                        end
                    end
                end

                surface.create_entity{name="pelagos-big-rock", position={-2,0}, force="neutral"}
                surface.create_entity{name="pelagos-big-rock", position={-18,6}, force="neutral"}
                surface.create_entity{name="pelagos-big-rock", position={-14,-5}, force="neutral"}
                surface.create_entity{name="coconut-palm-mature", position={-12,4}, force="neutral"}
                surface.create_entity{name="coconut-palm-mature", position={-2,-8}, force="neutral"}
                surface.create_entity{name="fish", position={13,-6}, force="neutral"}
                surface.create_entity{name="fish", position={10,0}, force="neutral"}
                surface.create_entity{name="fish", position={13,7}, force="neutral"}
            ]],
			update = [[
            ]],
		},
	},
	{
		type = "tips-and-tricks-item",
		name = "electromagnetic_waves",
		--tag = "[pollutant=electromagnetic_waves]",
		category = "space-age",
		order = "pelagos-b",
		indent = 1,
		trigger = {
			type = "research",
			technology = "coconut-processing-technology",
		},
	},
	{
		type = "tips-and-tricks-item",
		name = "pelagos-coconuts-and-oil",
		tag = "[item=coconut-sealant]",
		category = "space-age",
		order = "pelagos-c",
		indent = 1,
		trigger = {
			type = "research",
			technology = "coconut-processing-technology",
		},
	},
	{
		type = "tips-and-tricks-item",
		name = "pelagos-calciners",
		tag = "[item=calciner]",
		category = "space-age",
		order = "pelagos-e",
		indent = 1,
		trigger = {
			type = "research",
			technology = "calciner",
		},
	},
	{
		type = "tips-and-tricks-item",
		name = "wooden-platform",
		tag = "[item=wooden-platform]",
		category = "space-age",
		order = "pelagos-f",
		indent = 1,
		trigger = {
			type = "research",
			technology = "coconut-processing-technology",
		},
	},
})

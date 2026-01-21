-- What colour each type of spitter is.
local copper_tints = {
	small = { r = 0.7, g = 0.36, b = 0.2, a = 1 },
	medium = { r = 1.0, g = 0.5, b = 0.3, a = 1 },
	big = { r = 0.25, g = 0.4, b = 0.8, a = 1 },
	behemoth = { r = 0.4, g = 0.8, b = 0.2, a = 1 },
	leviathan = { r = 1.0, g = 1.0, b = 0.7, a = 1 },
	spawner = { r = 0.7, g = 0.36, b = 0.1, a = 1 },
}

-- Set up the initial run animation. Let's do this for the big spitter for no particular reason, then copy it to the other spitters.
data.raw["unit"]["big-copper-biter"].run_animation = {
	layers = {
		{
			direction_count = 16,
			filenames = {
				"__pelagos__/graphics/spitter/spitter-pelagos-run-1.png",
				"__pelagos__/graphics/spitter/spitter-pelagos-run-2.png",
				"__pelagos__/graphics/spitter/spitter-pelagos-run-3.png",
				"__pelagos__/graphics/spitter/spitter-pelagos-run-4.png",
			},
			frame_count = 21,
			height = 248,
			line_length = 6,
			lines_per_file = 15,
			scale = 1.0,
			animation_speed = 0.37,
			shift = {
				0,
				-0.240625,
			},
			slice = 6,
			surface = "nauvis",
			usage = "enemy",
			width = 312,
		},
	},
}

data.raw["unit"]["big-copper-biter"].attack_parameters.animation = {
	layers = {
		{
			direction_count = 16,
			filenames = {
				"__pelagos__/graphics/spitter/spitter-pelagos-attack-1.png",
				"__pelagos__/graphics/spitter/spitter-pelagos-attack-2.png",
				"__pelagos__/graphics/spitter/spitter-pelagos-attack-3.png",
			},
			frame_count = 14,
			height = 248,
			line_length = 6,
			lines_per_file = 15,
			scale = 0.9,
			animation_speed = 0.4,
			shift = {
				0,
				-0.240625,
			},
			slice = 6,
			surface = "nauvis",
			usage = "enemy",
			width = 312,
		},
	},
}

-- Copy the animation to the other enemies.
local other_spitter_units =
	{ "small-copper-biter", "medium-copper-biter", "behemoth-copper-biter", "leviathan-copper-biter" }

for _, unit_name in ipairs(other_spitter_units) do
	data.raw["unit"][unit_name].run_animation = table.deepcopy(data.raw["unit"]["big-copper-biter"].run_animation)
	data.raw["unit"][unit_name].attack_parameters.animation =
		table.deepcopy(data.raw["unit"]["big-copper-biter"].attack_parameters.animation)
end

data.raw["unit"]["small-copper-biter"].run_animation.layers[1].scale = 0.4
data.raw["unit"]["medium-copper-biter"].run_animation.layers[1].scale = 0.7
data.raw["unit"]["behemoth-copper-biter"].run_animation.layers[1].scale = 1.25
data.raw["unit"]["leviathan-copper-biter"].run_animation.layers[1].scale = 1.8

data.raw["unit"]["small-copper-biter"].run_animation.layers[1].animation_speed = 0.6
data.raw["unit"]["medium-copper-biter"].run_animation.layers[1].animation_speed = 0.48
data.raw["unit"]["behemoth-copper-biter"].run_animation.layers[1].animation_speed = 0.3
data.raw["unit"]["leviathan-copper-biter"].run_animation.layers[1].animation_speed = 0.23

-- Replicate scale data to attack animation
for _, unit_name in ipairs(other_spitter_units) do
	data.raw["unit"][unit_name].attack_parameters.animation.layers[1].scale =
		data.raw["unit"][unit_name].run_animation.layers[1].scale
end

-- Now that we've set up the data for each type of biter, time to add the mask for each enemy (the recoloured bit).
other_spitter_units[5] = "big-copper-biter" -- Mustn't forget to add the mask for our big spitter friend too!

for _, unit_name in ipairs(other_spitter_units) do
	data.raw["unit"][unit_name].run_animation.layers[2] =
		table.deepcopy(data.raw["unit"][unit_name].run_animation.layers[1])
	data.raw["unit"][unit_name].run_animation.layers[2].filenames = {
		"__pelagos__/graphics/spitter/spitter-pelagos-run-mask-1.png",
		"__pelagos__/graphics/spitter/spitter-pelagos-run-mask-2.png",
		"__pelagos__/graphics/spitter/spitter-pelagos-run-mask-3.png",
		"__pelagos__/graphics/spitter/spitter-pelagos-run-mask-4.png",
	}

	data.raw["unit"][unit_name].attack_parameters.animation.layers[2] =
		table.deepcopy(data.raw["unit"][unit_name].attack_parameters.animation.layers[1])
	data.raw["unit"][unit_name].attack_parameters.animation.layers[2].filenames = {
		"__pelagos__/graphics/spitter/spitter-pelagos-attack-mask-1.png",
		"__pelagos__/graphics/spitter/spitter-pelagos-attack-mask-2.png",
		"__pelagos__/graphics/spitter/spitter-pelagos-attack-mask-3.png",
	}
end

-- Let's do the colouring!
data.raw["unit"]["small-copper-biter"].run_animation.layers[2].tint = copper_tints.small
data.raw["unit"]["medium-copper-biter"].run_animation.layers[2].tint = copper_tints.medium
data.raw["unit"]["big-copper-biter"].run_animation.layers[2].tint = copper_tints.big
data.raw["unit"]["behemoth-copper-biter"].run_animation.layers[2].tint = copper_tints.behemoth
data.raw["unit"]["leviathan-copper-biter"].run_animation.layers[2].tint = copper_tints.leviathan

-- Replicate colour data to attack animation
for _, unit_name in ipairs(other_spitter_units) do
	data.raw["unit"][unit_name].attack_parameters.animation.layers[2].tint =
		data.raw["unit"][unit_name].run_animation.layers[2].tint
end

------------- Spawners -------------

data.raw["unit-spawner"]["copper-biter-spawner"].graphics_set = {
	animations = {
		{
			layers = {
				{
					filenames = { "__pelagos__/graphics/spitter/spitter-pelagos-nest-idle.png" },
					frame_count = 4,
					scale = 0.5,
					animation_speed = 0.12,
					run_mode = "forward-then-backward",
					surface = "nauvis",
					usage = "enemy",
					width = 1040,
					height = 752,
					line_length = 4,
					lines_per_file = 4,
					x = 0,
					y = 0,
				},
			},
		},
	},
}

data.raw["assembling-machine"]["captive-copper-biter-spawner"].graphics_set = {
	animation = {
		layers = {
			{
				filename = "__pelagos__/graphics/spitter/spitter-pelagos-nest-captured.png",
				frame_count = 1,
				--scale = 0.456,
				scale = 0.6,
				animation_speed = 0.12,
				run_mode = "forward-then-backward",
				surface = "nauvis",
				usage = "enemy",
				width = 376,
				height = 376,
				line_length = 1,
				lines_per_file = 1,
				x = 0,
				y = 0,
			},
		},
	},
}

-- Icons

data.raw["unit"]["small-copper-biter"].icon = "__pelagos__/graphics/spitter/icons/spitter-pelagos-small.png"
data.raw["unit"]["medium-copper-biter"].icon = "__pelagos__/graphics/spitter/icons/spitter-pelagos-medium.png"
data.raw["unit"]["big-copper-biter"].icon = "__pelagos__/graphics/spitter/icons/spitter-pelagos-big.png"
data.raw["unit"]["behemoth-copper-biter"].icon = "__pelagos__/graphics/spitter/icons/spitter-pelagos-behemoth.png"
data.raw["unit"]["leviathan-copper-biter"].icon = "__pelagos__/graphics/spitter/icons/spitter-pelagos-leviathan.png"

data.raw["unit-spawner"]["copper-biter-spawner"].icon = "__pelagos__/graphics/spitter/icons/spitter-pelagos-nest.png"
data.raw["assembling-machine"]["captive-copper-biter-spawner"].icon =
	"__pelagos__/graphics/spitter/icons/spitter-pelagos-nest-captured.png"
data.raw["item"]["captive-copper-biter-spawner"].icon =
	data.raw["assembling-machine"]["captive-copper-biter-spawner"].icon
data.raw["item"]["copper-biter-egg"].icon = "__pelagos__/graphics/spitter/icons/spitter-pelagos-egg.png"

------------- Spawner corpse -------------

-- This isn't working in my tests. No corpse appears when destroyed. The same issue happens when trying to set a spitter corpse to some random value.
-- I'm assuming this might be to do with water, but I can't be sure. There is likely still a way to get the death animations to play via new entity shenanigans,
-- but I'm not sure if that's too "hacky" an approach in this context.

-- Keeping the code in here in case it's of use.

local new_corpse = table.deepcopy(data.raw["corpse"]["spitter-spawner-corpse"])

new_corpse.animation = {
	{
		layers = {
			{
				filename = "__pelagos__/graphics/spitter/spitter-pelagos-nest-die.png",
				direction_count = 1,
				frame_count = 20,
				scale = 1.0,
				animation_speed = 0.18,
				surface = "nauvis",
				flags = { "corpse-decay" },
				usage = "enemy",
				width = 520,
				height = 376,
				line_length = 4,
				lines_per_file = 5,
			},
		},
	},
}

new_corpse.decay_animation = {
	{
		layers = {
			{
				filename = "__pelagos__/graphics/spitter/spitter-pelagos-nest-decay.png",
				direction_count = 1,
				frame_count = 9,
				scale = 1.0,
				animation_speed = 0.18,
				surface = "nauvis",
				flags = { "corpse-decay" },
				usage = "corpse-decay",
				width = 520,
				height = 376,
				line_length = 3,
				lines_per_file = 3,
			},
		},
	},
}

new_corpse.name = "copper-biter-spawner-corpse"
data.raw["corpse"]["copper-biter-spawner-corpse"] = new_corpse

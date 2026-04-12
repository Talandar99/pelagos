local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local planet_catalogue_gleba = require("__space-age__.prototypes.planet.procession-catalogue-gleba")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local seconds = 60
local minutes = 60 * seconds

local function create_palm_variation(trunk_image, leaves_image, shadow_image, scale)
	scale = scale or 0.3
	return {
		trunk = {
			filename = trunk_image,
			width = 1024,
			height = 1024,
			frame_count = 1,
			shift = { 0, -2 },
			scale = scale,
		},
		leaves = {
			filename = leaves_image,
			width = 1024,
			height = 1024,
			frame_count = 1,
			shift = { 0, 0 },
			scale = scale,
		},
		shadow = {
			filename = shadow_image,
			width = 1024,
			height = 1024,
			frame_count = 2,
			shift = { 3.6, -2.5 },
			scale = scale,
			draw_as_shadow = false,
		},
	}
end
local palm_variations = {
	create_palm_variation(
		"__pelagos__/graphics/palm/palm-tree-1.png",
		"__pelagos__/graphics/palm/leaves-placeholder.png",
		"__pelagos__/graphics/palm/coconut-palm-shadow.png"
	),
	create_palm_variation(
		"__pelagos__/graphics/palm/palm-tree-2.png",
		"__pelagos__/graphics/palm/leaves-placeholder.png",
		"__pelagos__/graphics/palm/coconut-palm-shadow.png"
	),
	create_palm_variation(
		"__pelagos__/graphics/palm/palm-tree-3.png",
		"__pelagos__/graphics/palm/leaves-placeholder.png",
		"__pelagos__/graphics/palm/coconut-palm-shadow.png"
	),
	create_palm_variation(
		"__pelagos__/graphics/palm/palm-tree-4.png",
		"__pelagos__/graphics/palm/leaves-placeholder.png",
		"__pelagos__/graphics/palm/coconut-palm-shadow.png"
	),
	create_palm_variation(
		"__pelagos__/graphics/palm/palm-tree-5.png",
		"__pelagos__/graphics/palm/leaves-placeholder.png",
		"__pelagos__/graphics/palm/coconut-palm-shadow.png"
	),
	create_palm_variation(
		"__pelagos__/graphics/palm/palm-tree-6.png",
		"__pelagos__/graphics/palm/leaves-placeholder.png",
		"__pelagos__/graphics/palm/coconut-palm-shadow.png"
	),
}
data:extend({
	{
		type = "plant",
		subgroup = "trees",
		name = "coconut-palm",
		icon = "__pelagos__/graphics/coconut-seed.png",
		icon_size = 64,
		flags = { "placeable-neutral", "placeable-player", "breaths-air", "placeable-off-grid" },
		growth_ticks = 5 * minutes,
		mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
		mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
		minable = {
			mining_particle = "yumako-mining-particle",
			mining_time = 0.5,
			results = {
				{ type = "item", name = "coconut", amount = 10 },
				{ type = "item", name = "wood", amount = 5 },
			},
		},
		agricultural_tower_tint = {
			primary = { r = 0.2, g = 0.30, b = 0.2, a = 1 },
			secondary = { r = 0.3, g = 0.5, b = 0.3, a = 1 },
		},
		surface_conditions = {
			{
				property = "pressure",
				min = 1809,
				max = 1809,
			},
		},
		max_health = 200,
		map_color = { 255, 255, 255 }, -- color on minimap
		collision_box = { { -0.3, -1 }, { 0.3, 1 } },
		selection_box = { { -0.5, -1 }, { 0.5, 1 } },
		collision_mask = {
			layers = {
				object = true,
				player = true,
				transport_belt = true,
				resource = true,
				water_tile = true,
			},
		},

		--collision_mask = {
		--	layers = { player = true, train = true, is_object = true, is_lower_object = true },
		--},
		drawing_box_vertical_extension = 0.8,
		colors = { { r = 1, g = 1, b = 1 } },
		variations = palm_variations,
		autoplace = {
			-- autoplace settings are added in palm-autoplace-settings to make sure it overrides changes made by other mods
		},
	},
})

local mature_palm = table.deepcopy(data.raw.plant["coconut-palm"])
mature_palm.name = "coconut-palm-mature"
mature_palm.growth_ticks = 1
mature_palm.hidden_in_factoriopedia = true
data:extend({ mature_palm })

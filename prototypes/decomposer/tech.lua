data:extend({
	{
		type = "technology",
		name = "decomposer",
		icon = "__pelagos__/graphics/decomposer/decomposer256.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "nutrients-spoiling" },
			{ type = "unlock-recipe", recipe = "nutrients-from-spoilage-methane" },
		},
		prerequisites = { "coconut-processing-technology" },

		unit = nil,
		research_trigger = {
			type = "mine-entity",
			entity = "pelagos-big-rock",
		},

		order = "cc[pelagos]",
	},
})
--data:extend({
--	{
--		type = "technology",
--		name = "organic-decomposition",
--		icon = "__pelagos__/graphics/celulose-decomposition.png",
--		icon_size = 90,
--		effects = {},
--		prerequisites = { "pelagos-science-pack" },
--		unit = {
--			count_formula = "500",
--			ingredients = {
--				{ "automation-science-pack", 1 },
--				{ "logistic-science-pack", 1 },
--				{ "chemical-science-pack", 1 },
--				{ "space-science-pack", 1 },
--				{ "pelagos-science-pack", 1 },
--			},
--			time = 60,
--		},
--		order = "cc[pelagos]",
--	},
--})

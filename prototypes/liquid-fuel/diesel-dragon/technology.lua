data:extend({
	{
		type = "technology",
		name = "project-diesel-dragon",
		icon_size = 752,
		icon = "__pelagos__/graphics/diesel-dragon/diesel-dragon-technology.png",
		effects = {
			{ type = "unlock-recipe", recipe = "advanced-titanium-plate-from-dust" },
			{ type = "unlock-recipe", recipe = "diesel-dragon" },
			{ type = "unlock-recipe", recipe = "diesel-dragon-rocket-part-default" },
			{ type = "unlock-recipe", recipe = "diesel-dragon-rocket-part-pelagos" },
			{ type = "unlock-recipe", recipe = "diesel-dragon-rocket-part-bio" },
			{ type = "unlock-recipe", recipe = "diesel-dragon-rocket-part-hot" },
			{ type = "unlock-recipe", recipe = "diesel-dragon-rocket-part-cold" },
		},
		prerequisites = {},
		unit = {
			count = 10000,
			ingredients = {
				{ "pelagos-science-pack", 1 },
			},
			time = 30,
		},
		order = "ea[pelagos]",
	},
})

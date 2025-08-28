--calcining
data:extend({
	{
		type = "recipe-category",
		name = "calcining",
	},
})
data:extend({
	{
		type = "recipe",
		category = "calcining",
		name = "calciner-coal-purification",
		icon = "__pelagos__/graphics/coal-purification.png",
		enabled = false,
		allow_productivity = true,
		energy_required = 5,
		ingredients = {
			{ type = "item", name = "coal", amount = 2 },
		},
		results = { { type = "item", name = "carbon", amount = 1 } },
		auto_recycle = false,
	},
	{
		type = "recipe",
		category = "calcining",
		name = "calciner-wood-carbonization",
		icon = "__pelagos__/graphics/wood-carbonization.png",
		enabled = false,
		energy_required = 4,
		allow_productivity = true,
		ingredients = {
			{ type = "item", name = "wood", amount = 2 },
		},
		results = { { type = "item", name = "coal", amount = 1 } },
		auto_recycle = false,
	},
	{
		type = "recipe",
		category = "calcining",
		name = "calciner-coconut-husk-carbonization",
		icon = "__pelagos__/graphics/coconut-husk-carbonization.png",
		enabled = false,
		energy_required = 4,
		allow_productivity = true,
		ingredients = {
			{ type = "item", name = "coconut-husk", amount = 4 },
		},
		results = { { type = "item", name = "coal", amount = 1 } },
		auto_recycle = false,
	},
	{
		type = "recipe",
		category = "calcining",
		name = "calciner-fish-calcining",
		icon = "__pelagos__/graphics/fish-calcining.png",
		enabled = false,
		allow_productivity = true,
		energy_required = 4,
		ingredients = {
			{ type = "item", name = "raw-fish", amount = 1 },
		},
		results = { { type = "item", name = "calcite", amount = 1 } },
		auto_recycle = false,
	},
    {
      type = "recipe",
      name = "activated-carbon",
      category = "calcining",
      enabled = false,
      energy_required = 8,
	  allow_productivity = true,
	  ingredients = {
	    { type = "item", name = "carbon", amount = 2 },
	  },
      results = { { type = "item", name = "activated-carbon", amount = 1 } },
      auto_recycle = false,
    },

  {
    type = "recipe",
    name = "calciner-advanced-steel-smelting",
    icon = "__pelagos__/graphics/calciner-advanced-steel-smelting.png",
    category = "calcining",
    enabled = false,
    energy_required = 16,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "activated-carbon", amount = 1}
    },
    results = {{type="item", name="steel-plate", amount=2}},
    allow_productivity = true
  },
})

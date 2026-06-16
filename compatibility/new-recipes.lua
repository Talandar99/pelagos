--canal-excavator
if mods["canal-excavator"] then
	if data.raw["recipe"]["canex-excavator"] then
		data.raw["recipe"]["canex-excavator"].ingredients = {
			{ type = "item", name = "steel-plate", amount = 10 },
			{ type = "item", name = "iron-plate", amount = 15 },
			{ type = "item", name = "iron-gear-wheel", amount = 20 },
			{ type = "item", name = "engine-unit", amount = 5 },
			{ type = "item", name = "coconut-sealant", amount = 10 },
		}
		data.raw["recipe"]["canex-excavator"].energy_required = 10
	end

	if data.raw["recipe"]["canex-digable"] then
		data.raw["recipe"]["canex-digable"].ingredients = {

			{ type = "item", name = "spoilage", amount = 20 },
			--{ type = "fluid", name = "water", amount = 25 },
		}
		data.raw["recipe"]["canex-digable"].crafting_machine_tint = {
			primary = { r = 0.37, g = 0.37, b = 0.18, a = 1.000 },
			secondary = { r = 0.47, g = 0.47, b = 0.28, a = 1.000 },
			tertiary = { r = 0.37, g = 0.37, b = 0.18, a = 1.000 },
			quaternary = { r = 0.47, g = 0.47, b = 0.28, a = 1.000 },
		}

		data.raw["recipe"]["canex-digable"].category = "organic-or-assembling"
	end
end
--pirateship
if mods["pirateship"] then
	data.raw["recipe"]["pirateship-cannonball"].ingredients = {
		{ type = "item", name = "iron-plate", amount = 25 },
		{ type = "item", name = "activated-carbon", amount = 5 },
	}
end
--delivery drones
data.raw["item"]["long-range-delivery-drone"].weight = 50 * kg
data.raw["recipe"]["long-range-delivery-drone"].category = "crafting-with-fluid"
data.raw["recipe"]["long-range-delivery-drone"].ingredients = {
	{ type = "item", name = "titanium-plate", amount = 3 },
	{ type = "item", name = "advanced-circuit", amount = 1 },
	{ type = "item", name = "engine-unit", amount = 1 },
	{ type = "fluid", name = "ethanol", amount = 25 },
}
data.raw["recipe"]["long-range-delivery-drone-depot"].ingredients = {
	{ type = "item", name = "advanced-circuit", amount = 10 },
	{ type = "item", name = "iron-gear-wheel", amount = 15 },
	{ type = "item", name = "titanium-plate", amount = 15 },
	{ type = "item", name = "steel-plate", amount = 20 },
}
data.raw["recipe"]["long-range-delivery-drone-request-depot"].ingredients = {
	{ type = "item", name = "electronic-circuit", amount = 10 },
	{ type = "item", name = "steel-chest", amount = 1 },
}
--end

--maraxsis
if mods["maraxsis"] then
	data:extend({
		{
			type = "recipe",
			category = "calcining",
			name = "pelagos-maraxsis-super-sealant-substance",
			icon = "__pelagos__/graphics/sealant-super-sealant.png",
			enabled = false,
			allow_productivity = true,
			energy_required = 5,
			ingredients = {
				{ type = "item", name = "coconut-sealant", amount = 2 },
			},
			results = {
				{ type = "item", name = "maraxsis-super-sealant-substance", amount = 1 },
			},
			auto_recycle = false,
		},
	})
	local tech = data.raw.technology["maraxsis-project-seadragon"]
	if tech and tech.effects then
		table.insert(tech.effects, { type = "unlock-recipe", recipe = "pelagos-maraxsis-super-sealant-substance" })
	end
	local recipe = data.raw.recipe["maraxsis-glass-panes"]
	if recipe then
		recipe.additional_categories = recipe.additional_categories or {}
		table.insert(recipe.additional_categories, "calcining")
	end
end

if mods["planetaris-arig"] then
	data:extend({
		{
			type = "recipe",
			name = "pelagos-biodiesel-arig-cactus",
			category = "compressing",
			subgroup = "fluid-recipes",
			icons = {
				{ icon = "__pelagos__/graphics/biodiesel.png", icon_size = 64 },
				{
					icon = "__planetaris-arig__/graphics/icons/cactus.png",
					icon_size = 64,
					scale = 0.25,
					shift = { 8, 8 },
				},
			},
			surface_conditions = {},
			enabled = false,
			allow_productivity = true,
			energy_required = 10,
			ingredients = {
				{ type = "item", name = "planetaris-cactus", amount = 10 },
				{ type = "fluid", name = "steam", amount = 50 },
			},
			results = {
				{ type = "fluid", name = "biodiesel", amount = 100 },
			},
			crafting_machine_tint = {
				primary = { r = 0.54, g = 0.45, b = 0.05 },
				secondary = { r = 0.64, g = 0.55, b = 0.15 },
				tertiary = { r = 0.54, g = 0.45, b = 0.05 },
				quaternary = { r = 0.64, g = 0.55, b = 0.15 },
			},
			show_amount_in_title = false,
		},
	})
end

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
--cargo-ships
if mods["cargo-ships"] then
	if data.raw["recipe"]["floating-electric-pole"] then
		data.raw["recipe"]["floating-electric-pole"].ingredients = {
			{ type = "item", name = "iron-plate", amount = 5 },
			{ type = "item", name = "big-electric-pole", amount = 2 },
			{ type = "item", name = "barrel", amount = 4 },
			{ type = "item", name = "coconut-sealant", amount = 4 },
		}
	end

	if data.raw["recipe"]["boat"] then
		data.raw["recipe"]["boat"].ingredients = {
			{ type = "item", name = "steel-plate", amount = 40 },
			{ type = "item", name = "engine-unit", amount = 15 },
			{ type = "item", name = "iron-gear-wheel", amount = 6 },
			{ type = "item", name = "coconut-sealant", amount = 30 },
		}
	end

	if data.raw["recipe"]["cargo_ship"] then
		data.raw["recipe"]["cargo_ship"].ingredients = {
			{ type = "item", name = "steel-plate", amount = 220 },
			{ type = "item", name = "engine-unit", amount = 50 },
			{ type = "item", name = "iron-gear-wheel", amount = 20 },
			{ type = "item", name = "coconut-sealant", amount = 80 },
		}
	end

	if data.raw["recipe"]["oil_tanker"] then
		data.raw["recipe"]["oil_tanker"].ingredients = {
			{ type = "item", name = "steel-plate", amount = 180 },
			{ type = "item", name = "engine-unit", amount = 50 },
			{ type = "item", name = "titanium-plate", amount = 20 },
			{ type = "item", name = "coconut-sealant", amount = 80 },
			{ type = "item", name = "storage-tank", amount = 6 },
		}
	end

	if data.raw["recipe"]["buoy"] then
		data.raw["recipe"]["buoy"].ingredients = {
			{ type = "item", name = "iron-plate", amount = 5 },
			{ type = "item", name = "barrel", amount = 2 },
			{ type = "item", name = "coconut-sealant", amount = 2 },
			{ type = "item", name = "electronic-circuit", amount = 2 },
		}
	end
	if data.raw["recipe"]["chain_buoy"] then
		data.raw["recipe"]["chain_buoy"].ingredients = {
			{ type = "item", name = "iron-plate", amount = 5 },
			{ type = "item", name = "barrel", amount = 2 },
			{ type = "item", name = "coconut-sealant", amount = 2 },
			{ type = "item", name = "electronic-circuit", amount = 2 },
		}
	end

	if data.raw["recipe"]["oil_rig"] then
		data.raw["recipe"]["oil_rig"].ingredients = {
			{ type = "item", name = "steel-plate", amount = 200 },
			{ type = "item", name = "iron-gear-wheel", amount = 50 },
			{ type = "item", name = "pipe", amount = 100 },
			{ type = "item", name = "steam-engine", amount = 3 },
			{ type = "item", name = "storage-tank", amount = 6 },
			{ type = "item", name = "coconut-sealant", amount = 300 },
		}
	end
end
--pirateship
if mods["pirateship"] then
	data.raw["recipe"]["pirateship-cannonball"].ingredients = {
		{ type = "item", name = "iron-plate", amount = 25 },
		{ type = "item", name = "activated-carbon", amount = 5 },
	}
	data.raw["recipe"]["pirateship"].ingredients = {
		{ type = "item", name = "wood", amount = 50 },
	}
end
--delivery drones
if mods["Long_Range_Delivery_Drones"] then
	data.raw["item"]["long-range-delivery-drone"].weight = 5 * kg

	data.raw["recipe"]["long-range-delivery-drone"].category = "crafting-with-fluid"
	data.raw["recipe"]["long-range-delivery-drone"].ingredients = {
		{ type = "item", name = "titanium-plate", amount = 5 },
		{ type = "item", name = "advanced-circuit", amount = 1 },
		{ type = "item", name = "engine-unit", amount = 1 },
		{ type = "fluid", name = "ethanol", amount = 50 },
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
end

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
end

-- optional compat with ironclad and it's fork
if mods["ironclad-gunboat-and-mortar-turret-fork"] then
	data.raw["recipe"]["ironclad-gunboat"].ingredients = {
		{ type = "item", name = "steel-plate", amount = 100 },
		{ type = "item", name = "engine-unit", amount = 40 },
		{ type = "item", name = "electronic-circuit", amount = 20 },
		{ type = "item", name = "coconut-sealant", amount = 40 },
	}
end
if mods["aai-vehicles-ironclad"] then
	data.raw["recipe"]["ironclad"].ingredients = {
		{ type = "item", name = "steel-plate", amount = 100 },
		{ type = "item", name = "engine-unit", amount = 40 },
		{ type = "item", name = "electronic-circuit", amount = 20 },
		{ type = "item", name = "coconut-sealant", amount = 40 },
	}
end

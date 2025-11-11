-- fluid mineral brine
data:extend({
	{
		type = "fluid",
		subgroup = "fluid",
		name = "coconut-oil",
		default_temperature = 25,
		base_color = { r = 1.0, g = 0.9, b = 0.6 },
		flow_color = { r = 1.0, g = 0.95, b = 0.7 },
		icon = "__pelagos__/graphics/coconut-oil.png",
		icon_size = 64,
		order = "a[fluid]-b[coconut-oil]",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		auto_barrel = true,
	},
	{
		type = "fluid",
		subgroup = "fluid",
		name = "titanium-sludge",
		default_temperature = 25,
		base_color = { r = 0.28, g = 0.29, b = 0.16 },
		flow_color = { r = 0.38, g = 0.39, b = 0.26 },
		icon = "__pelagos__/graphics/titanium/titanium-sludge-new.png",
		icon_size = 64,
		order = "a[fluid]-b[titanium-sludge]",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		auto_barrel = true,
	},
	{
		type = "fluid",
		subgroup = "fluid",
		name = "ethanol",
		default_temperature = 25,
		base_color = { r = 0.5, g = 0.75, b = 0.85 },
		flow_color = { r = 0.6, g = 0.76, b = 0.86 },
		icon = "__pelagos__/graphics/ethanol.png",
		icon_size = 64,
		order = "a[fluid]-c[ethanol]",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		auto_barrel = true,
	},
})

if mods["skewer_planet_vesta"] then
	if settings.startup["pelagos-override-vesta-methane-fluid-icon"].value then
		data:extend({
			{
				type = "fluid",
				subgroup = "fluid",
				name = "methane",
				default_temperature = 25,
				base_color = { r = 0.5, g = 0.8, b = 0.1 },
				flow_color = { r = 0.7, g = 1.0, b = 0.3 },
				icon = "__pelagos__/graphics/methane.png",
				icon_size = 64,
				order = "a[fluid]-b[methane]",
				pressure_to_speed_ratio = 0.4,
				flow_to_energy_ratio = 0.59,
				auto_barrel = true,
			},
		})
	end
else
	data:extend({
		{
			type = "fluid",
			subgroup = "fluid",
			name = "methane",
			default_temperature = 25,
			base_color = { r = 0.5, g = 0.8, b = 0.1 },
			flow_color = { r = 0.7, g = 1.0, b = 0.3 },
			icon = "__pelagos__/graphics/methane.png",
			icon_size = 64,
			order = "a[fluid]-b[methane]",
			pressure_to_speed_ratio = 0.4,
			flow_to_energy_ratio = 0.59,
			auto_barrel = true,
		},
	})
end
